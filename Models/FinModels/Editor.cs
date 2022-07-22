using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace WpfBu.Models
{
    public class ColumnsAdapter
    {
        private string parseTrue (string v)
        {
            return (v == "True"? "1": "0");
        }
        public List<FinderField> Fcols { get; set; }

        public void Save(string IdDeclare)
        {
            string sql = $"select * from t_columns where iddeclare = {IdDeclare} order by ordc";
            DataTable dt = MainObj.Dbutil.Runsql(sql);
            List<Dictionary<string, object>> data = MainObj.Dbutil.DataToJson(dt);

            sql = $"select 'GridFind' || decname paramname from t_rpdeclare where iddeclare = {IdDeclare}";
            dt = MainObj.Dbutil.Runsql(sql);
            string paramname = dt.Rows[0][0].ToString();
            string grid = @"<GRID FROZENCOLS=""0"" SumFields = """" LabelField = """" LabelText = """">" + '\n';
            grid = grid + string.Join('\n', data.Select( d => 
            $"<COLUMN FieldName=\"{(d["fieldname"]??"").ToString()}\"" +
            $" FieldCaption=\"{(d["fieldcaption"]??"").ToString()}\"" +
            $" DisplayFormat=\"{(d["displayformat"]??"").ToString()}\"" +
            $" Width=\"{(d["width"]??"").ToString()}\"" +
            $" Visible=\"{parseTrue((d["visible"]??"").ToString())}\"" +
            " group = \"\" Sum = \"0\"  ColSort=\"1\" />"
            )) + "<SAFEDEF SAFEDEF=\"1\"/></GRID>";
            
            //throw new Exception(grid);

            sql = "select p_lbrsetparam(@paramname, @paramvalue, @paramdescription)";
            Dictionary<string, object> param = new Dictionary<string, object>();
            param.Add("@paramname", paramname);
            param.Add("@paramvalue", grid);
            param.Add("@paramdescription", paramname);
            MainObj.Dbutil.ExecSQL(sql, param);

        }
        public void Update(string IdDeclare, string User)
        {
            var F = new Finder();
            F.Account = User;
            if (string.IsNullOrEmpty(F.Account))
                F.Account = "sa";
            F.nrows = 30;
            F.Mode = "data";
            F.AutoCreateColumns = false;
            F.start(IdDeclare);
            Fcols = F.Fcols;
            if (Fcols == null)
                Fcols = new List<FinderField>();

            List<string> ColumnTab = F.ColumnTab;
            var addField = ColumnTab.Except(Fcols.Select(f => f.FieldName))
            .Select(c => new FinderField()
            {
                FieldName = c,
                FieldCaption = c,
                Width = 100,
                DisplayFormat = "",
                Visible = true,
                Sort = "Нет"
            });
            string sql = $"delete from t_columns where iddeclare = {IdDeclare}; ";
            Fcols.AddRange(addField);
            int ordc = 0;
            sql = sql + string.Join("; ", Fcols.Select(f =>
            {
                ordc++;
                return $"insert into t_columns (iddeclare,ordc,visible,fieldname,fieldcaption,displayformat,width) " +
                  $"values ({IdDeclare},{ordc},{f.Visible},'{f.FieldName}','{f.FieldCaption}','{f.DisplayFormat}',{f.Width})";
            }));
            MainObj.Dbutil.ExecSQL(sql, null);

        }
    }
    public class Editor : RootForm
    {
        private Finder ReferFinder { get; set; }

        public List<EditField> Editors { get; set; }

        public string[] SaveFieldList { get; set; }

        public override void start(object o)
        {
            ReferFinder = (Finder)o;
            string slist = ReferFinder.SaveFieldList;
            SaveFieldList = slist.Split(',');

            Editors = new List<EditField>();

            string sql = $"select * from t_sysFieldMap where decname = '{ReferFinder.DecName}'";
            DataTable sysFieldMap = MainObj.Dbutil.Runsql(sql);

            for (int i = 0; i < ReferFinder.Fcols.Count; i++)
            {
                JoinRow jr = null;
                Finder fc = null;
                string GroupDec = "";
                DataRow[] a = sysFieldMap.Select($"dstfield = '{ReferFinder.Fcols[i].FieldName}' and isnull(classname, '') <> ''");

                if (a.Length > 0)
                {
                    jr = new JoinRow();
                    string ClassName = a[0]["classname"].ToString();
                    if (ClassName == "Bureau.Finder" || ClassName == "Bureau.GridCombo")
                    {
                        jr.classname = ClassName;
                        jr.IdDeclare = a[0]["iddeclare"].ToString();
                        GroupDec = a[0]["groupdec"].ToString();
                        DataRow[] b = sysFieldMap.Select($"groupdec = '{GroupDec}'");
                        jr.fields = new Dictionary<string, string>();
                        foreach (var rw in b)
                        {
                            jr.fields.Add(rw["srcfield"].ToString(), rw["dstfield"].ToString());
                        }

                        fc = new Finder();
                        fc.OKFun = true;
                        if (ClassName == "Bureau.Finder")
                            fc.nrows = 30;
                        else
                            fc.nrows = 7;
                        fc.Account = ReferFinder.Account;
                        //Передаем текстовые параметры основного Finder    
                        fc.TextParams = ReferFinder.TextParams;
                        fc.start(jr.IdDeclare);
                        jr.FindConrol = fc;

                    }

                    if (ClassName == "Bureau.Finder")
                    {

                    }

                    if (ClassName == "Bureau.GridCombo")
                    {
                        DataRow[] c = sysFieldMap.Select($"groupdec = '{GroupDec}' and keyfield = 1");
                        jr.keyField = c[0]["srcfield"].ToString();
                        jr.valField = c[0]["dstfield"].ToString();

                    }
                }
                Editors.Add(
                    new EditField()
                    {
                        FieldCaption = ReferFinder.Fcols[i].FieldCaption,
                        FieldName = ReferFinder.Fcols[i].FieldName,
                        DisplayFormat = ReferFinder.Fcols[i].DisplayFormat,
                        //FieldEditor = fe,
                        joinRow = jr
                    }
                    );

            }

        }
    }
}
