using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Xml;
using System.Linq;

/*
Новые конструкции
17.09.2020  
Если в t_rpDeclare заполнено поле DispParamName , то по IdDeclare = DispParamName
создается новый Finder и присваивается полю Setting . По полям первой строки таблицы
Setting.MainTab заполняются параметры @ в запросе исходного Finder. Для возможности
изменить параметры Setting.EditProc!='', Setting.SaveFieldList!='' . 
Для Setting  можно заполнять таблицу t_sysFieldMap

25.09.2020
В Finder's редактора передаются TextParams основного Finder

22.07.2022
Добавлена возможность получения и редактирования данных из внешних источников
ExternalAdapter
*/

namespace WpfBu.Models
{

    public class JoinRow
    {
        public string IdDeclare { get; set; }
        public string classname { get; set; }
        public Dictionary<string, string> fields { get; set; }
        public string keyField { get; set; }
        public string valField { get; set; }
        public Finder FindConrol { get; set; }
    }
    public class FinderField //: INotifyPropertyChanged
    {
        private string _Sort = "";

        private string _FindString = "";
        public Finder Parent { get; set; }
        public string FieldName { get; set; }
        public string FieldCaption { get; set; }
        public int Width { get; set; }
        public bool Visible { get; set; }
        public string DisplayFormat { get; set; }
        public string FindString
        {
            get => _FindString;
            set
            {
                _FindString = value;
            }
        }
        public string Sort
        {
            get
            {
                return _Sort;
            }
            set
            {
                _Sort = value;
                if (Parent == null)
                    return;
                if (_Sort != "Нет")
                {
                    Parent.MaxSortOrder++;
                    SortOrder = Parent.MaxSortOrder;
                }
                else
                    SortOrder = null;
                //PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nameof(Sort)));
                //PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nameof(SortOrder)));
            }
        }
        public int? SortOrder
        {
            get; set;
        }
    }

    public class EditField
    {
        public string FieldName { get; set; }
        public string FieldCaption { get; set; }
        //public Control FieldEditor { get; set; }

        public string DisplayFormat { get; set; }

        public JoinRow joinRow { get; set; }
    }

    public class Finder : RootForm
    {

        private string tag = "__all__";
        private bool external = false;
        #region prop

        public string IdDeclare { get; set; }

        public string Mode { get; set; }
        public List<Dictionary<string, object>> MainTab { get; set; }
        public List<Dictionary<string, object>> TotalTab { get; set; }
        public List<string> ColumnTab { get; set; }
        public string SQLText { get; set; }
        public string DecName { get; set; }
        public string Descr { get; set; }

        public string EditProc { get; set; }
        public string DelProc { get; set; }

        public string TableName { get; set; }



        public string SaveFieldList { get; set; }

        public string KeyF { get; set; }
        public string DispField { get; set; }
        public string KeyValue { get; set; }
        public string SumFields { get; set; }
        public int FROZENCOLS { get; set; }

        public string OrdField { get; set; }
        public string addFilter { get; set; }

        public int MaxSortOrder { get; set; }

        public bool AutoCreateColumns = true;
        public List<FinderField> Fcols { get; set; }
        public Dictionary<string, string> TextParams { get; set; }

        public Dictionary<string, object> SQLParams { get; set; }

        public Dictionary<string, object> DefaultValues { get; set; }

        public bool pagination { get; set; }

        public int nrows { get; set; }

        public string not_page { get; set; }

        private int _page = 1;
        public int page
        {
            get => _page;
            set
            {
                _page = value;
            }
        }
        public string TotalString { get; set; }

        public Int64 MaxPage { get; set; }

        public bool OKFun { get; set; }

        public Editor ReferEdit { get; set; }
        #endregion
        public string Account { get; set; }

        public string IdDeclareSet { get; set; }
        public Finder Setting { get; set; }
        public override void start(object o)
        {

            IdDeclare = o.ToString();
            string sql;

            sql = "select iddeclare, decname, descr, dectype, decsql, keyfield, dispfield, keyvalue, dispvalue, keyparamname, dispparamname, isbasename, descript, addkeys, tablename, editproc, delproc, image_bmp, savefieldlist, p.paramvalue from t_rpdeclare d left join t_sysparams p on 'GridFind' || d.decname = p.paramname where iddeclare = ";

            sql = sql + o.ToString();
            //MainObj.Dbutil = new DBUtil();
            DataTable t_rp = MainObj.Dbutil.Runsql(sql);
            DataRow rd = t_rp.Rows[0];
            string paramvalue = rd["paramvalue"].ToString();
            if (string.IsNullOrEmpty(SQLText))
                SQLText = rd["decsql"].ToString();

            external = (SQLText.IndexOf("__external__") > -1);    
            DecName = rd["decname"].ToString();
            Descr = rd["descr"].ToString();
            text = Descr;

            EditProc = rd["editproc"].ToString();
            DelProc = rd["delproc"].ToString();
            TableName = rd["tablename"].ToString();

            if (string.IsNullOrEmpty(TableName) && !string.IsNullOrEmpty(EditProc))
            {
                TableName = EditProc.ToLower().Replace("p_", "").Replace("_edit", "");
            }

            KeyF = rd["keyfield"].ToString();
            DispField = rd["dispfield"].ToString();
            //19.07.2022
            if (string.IsNullOrEmpty(DispField))
                DispField = tag;

            KeyValue = rd["keyvalue"].ToString();
            SaveFieldList = rd["savefieldlist"].ToString();


            //параметры 17.09.2020
            IdDeclareSet = rd["dispparamname"].ToString();
            //04.06.2021
            if ((int)rd["dectype"] > 30)
                nrows = (int)rd["dectype"];

            if (nrows == 0)
                nrows = 30;
            pagination = (nrows >= 30);

            if (!string.IsNullOrEmpty(not_page))
            {
                pagination = false;
            }

            if (DefaultValues == null)
                DefaultValues = new Dictionary<string, object>();

            DefaultValues.Add("audtuser", Account);
            DefaultValues.Add("last_change_user", Account);

            if (Mode == "new" && !string.IsNullOrEmpty(IdDeclareSet) && SQLParams == null)
            {
                //Создаем параметры 17.09.2020
                Setting = new Finder();
                Setting.Mode = "new";
                Setting.nrows = 7;
                Setting.Account = Account;
                Setting.start(IdDeclareSet);
                SQLParams = new Dictionary<string, object>();
                foreach (string f in Setting.ReferEdit.SaveFieldList)
                {
                    SQLParams.Add("@" + f, Setting.MainTab[0][f]);
                }
            }

            if (Fcols == null)
                CreateColumns(paramvalue);
            if (Mode != "csv")
                UpdateTab();
            if (Mode == "new")
                CreateEditor();
        }

        #region startinit
        public virtual void CreateEditor()
        {
            if (!string.IsNullOrEmpty(EditProc) && !OKFun)
            {
                ReferEdit = new Editor();
                ReferEdit.start(this);
            }

        }

        public void CreateColumns(string s)
        {
            //19.07.2022
            if (string.IsNullOrEmpty(s))
                return;
            MaxSortOrder = 0;
            Fcols = new List<FinderField>();
            if (string.IsNullOrEmpty(s))
                return;
            XmlDocument xm = new XmlDocument();
            XmlElement xRoot, xCol;
            xm.LoadXml(s);
            xRoot = xm.DocumentElement;

            SumFields = xRoot.GetAttribute("SumFields");
            int frcols = 0;
            int.TryParse(xRoot.GetAttribute("FROZENCOLS"), out frcols);
            FROZENCOLS = frcols;
            int n = xRoot.ChildNodes.Count;

            for (int i = 0; i < n; i++)
            {

                xCol = (XmlElement)xRoot.ChildNodes.Item(i);
                if (xCol.Name == "COLUMN")
                {
                    string FName = xCol.Attributes["FieldName"].Value;
                    if (!external)
                        FName = FName.ToLower();
                    string Title = xCol.Attributes["FieldCaption"].Value;
                    int Width = 0;
                    int.TryParse(xCol.Attributes["Width"].Value, out Width);
                    bool Vis = (xCol.Attributes["Visible"].Value == "1");
                    string DispFormat = xCol.Attributes["DisplayFormat"].Value;
                    if (Vis || !AutoCreateColumns)
                    {
                        Fcols.Add(new FinderField()
                        {
                            FieldName = FName,
                            FieldCaption = Title,
                            Width = Width,
                            DisplayFormat = DispFormat,
                            Visible = Vis,
                            //Parent = this,
                            Sort = "Нет"

                        });
                    }
                }
            }
        }
        public void CreateColumns(Dictionary<string, object> row)
        {
            if (!AutoCreateColumns)
                return;
            //создаем колонки из первой строки, если не заданы в настройках 19.07.2022
            Fcols = new List<FinderField>();
            foreach (string c in row.Keys)
            {
                Fcols.Add(new FinderField()
                {
                    FieldName = c,
                    FieldCaption = c,
                    Width = 100,
                    DisplayFormat = "",
                    Visible = true,
                    Sort = "Нет"
                });
            }


            //доп. колонка для поиска по всем колонкам

            Fcols.Add(new FinderField()
            {
                FieldName = tag,
                FieldCaption = "*",
                Width = 100,
                DisplayFormat = "",
                Visible = false,
                Sort = "Нет"
            });


        }

        public DataTable UpdateCSVExternal()
        {
            //внешний источник данных 20.07.2022

            ExternalAdapter ea = new ExternalAdapter();
            List<Dictionary<string, object>> data = ea.GetData(IdDeclare, TextParams, this.Account, this.DecName);

            if (data.Count > 0 && Fcols == null)
            {
                CreateColumns(data[0]);
            }


            IEnumerable<Dictionary<string, object>> idata = (IEnumerable<Dictionary<string, object>>)data;
            idata = FilterExternal(idata);
            data = idata.ToList();
            DataTable res = new DataTable();
            var cols = Fcols.Where(f => f.FieldName != tag).Select(f => new DataColumn(f.FieldName, typeof(System.String))).ToArray();
            res.Columns.AddRange(cols);
            foreach (var d in data)
            {
                DataRow rw = res.NewRow();
                for (int i = 0; i < res.Columns.Count; i++)
                    rw[res.Columns[i].ColumnName] = d[res.Columns[i].ColumnName];
                res.Rows.Add(rw);
            }
            return res;
        }
        public DataTable UpdateCSV()
        {
            //внешний источник данных 20.07.2022
            if (external)
            {
                return UpdateCSVExternal();
            }
            string PrepareSQL = SQLText;
            PrepareSQL = PrepareSQL.Replace("[Account]", Account);
            if (TextParams != null)
                foreach (string k in TextParams.Keys)
                {
                    PrepareSQL = PrepareSQL.Replace("[" + k + "]", TextParams[k]);
                }

            string sql = PrepareSQL;
            CompilerFilterOrder();
            string decSQL = sql;
            var localOrdField = "";
            var n = sql.ToLowerInvariant().IndexOf("order by");
            if (n != -1)
            {
                decSQL = sql.Substring(0, n);
                localOrdField = sql.Substring(n + 8);
            }
            if (string.IsNullOrEmpty(OrdField))
                OrdField = localOrdField;
            if (!string.IsNullOrEmpty(addFilter))
            {
                if (decSQL.ToLowerInvariant().IndexOf(" where ") == -1 && decSQL.ToLowerInvariant().IndexOf(" where\n") == -1 && decSQL.ToLowerInvariant().IndexOf("\nwhere\n") == -1 && decSQL.ToLowerInvariant().IndexOf("\nwhere ") == -1)
                    decSQL += " where ";
                else
                    decSQL += " and ";

                decSQL += addFilter;
            }
            if (!string.IsNullOrEmpty(OrdField))
                decSQL = decSQL + " order by " + OrdField;
            sql = decSQL;
            var data = MainObj.Dbutil.Runsql(sql, SQLParams);

            return data;
        }

        public IEnumerable<Dictionary<string, object>> FilterExternal(IEnumerable<Dictionary<string, object>> idata)
        {
            //фильтровка сортировка на клиенте 20.07.2022
            if (Fcols == null)
                return idata;

            var fls = Fcols.Where(f => !string.IsNullOrEmpty(f.FindString));
            foreach (var f in fls)
            {
                if (f.FieldName == tag)
                    idata = idata.Where(d => (string.Join("#", d.Values).ToLowerInvariant().IndexOf(f.FindString.ToLowerInvariant()) > -1));
                else
                    idata = idata.Where(d => ((d[f.FieldName] ?? "").ToString().ToLowerInvariant().IndexOf(f.FindString.ToLowerInvariant()) > -1));
            }

            var ords = Fcols.Where(f => f.FieldName != tag).Where(f => f.SortOrder > 0 && f.Sort != "Нет").OrderBy(f => f.SortOrder);
            bool fisort = true;

            foreach (var f in ords)
            {
                if (f.Sort == "ASC")
                {
                    if (fisort)
                    {
                        idata = idata.OrderBy(d => (d[f.FieldName]));
                        fisort = false;
                    }
                    else
                        idata = ((IOrderedEnumerable<Dictionary<string, object>>)idata).ThenBy(d => (d[f.FieldName]));
                }


                if (f.Sort == "DESC")
                {
                    if (fisort)
                    {
                        idata = idata.OrderByDescending(d => (d[f.FieldName]));
                        fisort = false;
                    }
                    else
                        idata = ((IOrderedEnumerable<Dictionary<string, object>>)idata).ThenByDescending(d => (d[f.FieldName]));
                }

            }
            return idata;
        }
        public virtual void UpdateTabExternal()
        {
            //внешний источник данных 20.07.2022
            ExternalAdapter ea = new ExternalAdapter();
            List<Dictionary<string, object>> data = ea.GetData(IdDeclare, TextParams, Account, DecName);
            if (data.Count > 0)
            {
                ColumnTab = new List<string>();
                ColumnTab.AddRange(data[0].Keys);
                if (Fcols == null)
                    CreateColumns(data[0]);
            }

            if (data.Count == 0 && Fcols!= null)
            {
                ColumnTab = new List<string>();
                ColumnTab.AddRange(Fcols.Select(f => f.FieldName));
            }

            IEnumerable<Dictionary<string, object>> idata = (IEnumerable<Dictionary<string, object>>)data;
            idata = FilterExternal(idata);
            if (pagination)
            {

                int total = idata.Count();

                MaxPage = total / nrows;

                if ((total % nrows) != 0)
                    MaxPage += 1;
                if (page > MaxPage)
                    _page = (int)MaxPage;

                if (_page == 0)
                    _page = 1;

                TotalTab = new List<Dictionary<string, object>> { new Dictionary<string, object> { { "n_total", total } } };
                idata = idata.Skip((page - 1) * nrows).Take(nrows);
            }
            else
            {
                MaxPage = 1;
                _page = 1;
            }
            MainTab = idata.ToList();
        }

        public virtual void UpdateTab()
        {
            //внешний источник данных 20.07.2022
            if (external)
            {
                UpdateTabExternal();
                return;
            }

            DataTable TTable = null;
            DataTable data = null;

            string PrepareSQL = SQLText;
            PrepareSQL = PrepareSQL.Replace("[Account]", Account);
            if (TextParams != null)
                foreach (string k in TextParams.Keys)
                {
                    PrepareSQL = PrepareSQL.Replace("[" + k + "]", TextParams[k]);
                }


            var sqltotal = PrepareSQL;
            string sql = PrepareSQL;
            CompilerFilterOrder();
            string decSQL = sql;
            var localOrdField = "";
            var n = sql.ToLowerInvariant().IndexOf("order by");
            if (n != -1)
            {
                decSQL = sql.Substring(0, n);
                localOrdField = sql.Substring(n + 8);
            }
            if (string.IsNullOrEmpty(OrdField))
                OrdField = localOrdField;
            if (!string.IsNullOrEmpty(addFilter))
            {
                if (decSQL.ToLowerInvariant().IndexOf(" where ") == -1 && decSQL.ToLowerInvariant().IndexOf(" where\n") == -1 && decSQL.ToLowerInvariant().IndexOf("\nwhere\n") == -1 && decSQL.ToLowerInvariant().IndexOf("\nwhere ") == -1)
                    decSQL += " where ";
                else
                    decSQL += " and ";

                decSQL += addFilter;
            }

            sqltotal = decSQL;
            var sqlpag = decSQL;
            if (!string.IsNullOrEmpty(OrdField))
                decSQL = decSQL + " order by " + OrdField;
            sql = decSQL;

            /*
                Итоги
            */

            string[] sums = new string[0];
            if (!string.IsNullOrEmpty(SumFields))
            {
                var sql1 = sqltotal;
                sums = SumFields.ToLowerInvariant().Split(",");
                sqltotal = "select count(*) n_total";
                for (var i = 0; i < sums.Length; i++)
                    sqltotal = sqltotal + ", sum(" + sums[i] + ") " + sums[i];
                sqltotal = sqltotal + "  from (" + sql1 + ") a";
            }
            else
            {
                sqltotal = "select count(*) n_total from (" + sqltotal + ") a";
            }

            if (pagination)
            {
                TTable = MainObj.Dbutil.Runsql(sqltotal, SQLParams);
                Int64 total = 0;

                total = (Int64)TTable.Rows[0]["n_total"];

                MaxPage = total / nrows;

                if ((total % nrows) != 0)
                    MaxPage += 1;
                if (page > MaxPage)
                    _page = (int)MaxPage;

                if (_page == 0)
                    _page = 1;

                TotalTab = MainObj.Dbutil.DataToJson(TTable);

            }
            else
            {
                MaxPage = 1;
                _page = 1;
            }


            sql = sql + " limit " + nrows.ToString() + " offset " + ((page - 1) * nrows).ToString();

            //DataTable data;
            if (pagination)
                data = MainObj.Dbutil.Runsql(sql, SQLParams);
            else
                data = MainObj.Dbutil.Runsql(PrepareSQL, SQLParams);


            MainTab = MainObj.Dbutil.DataToJson(data);
            ColumnTab = MainObj.Dbutil.DataColumn(data);
            //если колонки не указаны, создаем автоматически
            if (Fcols == null && MainTab.Count > 0)
                CreateColumns(MainTab[0]);
        }
        #endregion
        public void CompilerFilterOrder()
        {
            //19.07.2022
            if (Fcols == null)
                return;

            var fls = Fcols.Where(f => f.FieldName != tag).Where(f => !string.IsNullOrEmpty(f.FindString)).Select(f =>
            {
                string s = "";
                if (f.FindString[0] == '!')
                    s = " (not " + f.FieldName + " like '%" + f.FindString.Substring(1).Replace("'", "''") + "%') ";
                else
                    s = " (" + f.FieldName + " like '%" + f.FindString.Replace("'", "''") + "%') ";
                return s;
            });

            var ords = Fcols.Where(f => f.FieldName != tag).Where(f => f.SortOrder > 0 && f.Sort != "Нет").OrderBy(f => f.SortOrder).Select(f =>
            {
                string s = "";
                if (f.Sort == "ASC")
                    s = " " + f.FieldName;
                if (f.Sort == "DESC")
                    s = " " + f.FieldName + " desc";
                return s;
            });



            addFilter = string.Join(" and ", fls);
            OrdField = string.Join(",", ords);
        }

        public void SetFilterOrder()
        {
            if (!pagination)
            {
                CompilerFilterOrder();

            }
            else
            {
                UpdateTab();
            }

        }


        private string rwCSV(DataRow rw, char r)
        {
            return string.Join(r, Fcols.Where(f => f.FieldName != tag).Select(f =>
            {
                return @"""" + rw[f.FieldName].ToString().Replace(@"""", @"""""") + @"""";
            }));
        }

        public string ExportCSV(char r)
        {

            StringBuilder Res = new StringBuilder();
            var cols = Fcols.Where(f => f.FieldName != tag).Select(f =>
            {
                return @"""" + f.FieldCaption.ToString().Replace(@"""", @"""""") + @"""";
            });


            string s = string.Join(r, cols);
            Res.AppendLine(s);

            DataTable data = UpdateCSV();
            for (int i = 0; i < data.Rows.Count; i++)
            {
                DataRow rw = data.Rows[i];
                s = rwCSV(rw, r);
                Res.AppendLine(s);
            }
            return Res.ToString();

        }

    }
}