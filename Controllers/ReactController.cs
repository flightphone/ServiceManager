using Microsoft.AspNetCore.Mvc;
using WpfBu.Models;
using System;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Text.RegularExpressions;
using Microsoft.AspNetCore.Authorization;
using Npgsql;
using System.Data.SqlClient;
using System.Linq;

namespace ServiceManager.Controllers
{
    [Authorize]
    public class ReactController : Controller
    {
        public JsonResult TestApi(string id)
        {
            try
            {
                ExternalAdapter ea = new ExternalAdapter();
                ea.TestApi();
                return Json(new { Error = "OK" });
            }
            catch (Exception e)
            {
                return Json(new { Error = $"Ошибка: {e.Message}" });
            }
        }
        public JsonResult ClearColumn(string id)
        {
            try
            {
                ColumnsAdapter C = new ColumnsAdapter();
                C.Clear(id);
                return Json(new { Error = "Колонки таблицы удалены" });
            }
            catch (Exception e)
            {
                return Json(new { Error = $"Ошибка: {e.Message}" });
            }
        }

        public JsonResult SaveColumn(string id)
        {
            try
            {
                ColumnsAdapter C = new ColumnsAdapter();
                C.Save(id);
                return Json(new { Error = "Колонки таблицы сохранены." });
            }
            catch (Exception e)
            {
                return Json(new { Error = $"Ошибка: {e.Message}" });
            }
        }

        public JsonResult SaveColumnA(string id, string columns)
        {
            try
            {
                List<Dictionary<string, object>> data = JsonConvert.DeserializeObject<List<Dictionary<string, object>>>(columns);
                ColumnsAdapter C = new ColumnsAdapter();
                C.Save(id, data);
                return Json(new { Error = "Колонки таблицы сохранены." });
            }
            catch (Exception e)
            {
                return Json(new { Error = $"Ошибка: {e.Message}" });
            }
        }

        public JsonResult UpdateColumn(string id)
        {

            try
            {
                ColumnsAdapter C = new ColumnsAdapter();
                C.Update(id, User.Identity.Name);
                return Json(new { Error = "Колонки таблиц загружены." });
            }
            catch (Exception e)
            {
                return Json(new { Error = $"Ошибка: {e.Message}" });
            }

        }

        public JsonResult GetColumn(string id)
        {

            try
            {
                ColumnsAdapter C = new ColumnsAdapter();
                C.CreateColumn(id, User.Identity.Name);
                int ord = 1;
                var res = C.Fcols.Where(f => f.FieldName != "IDTMPNUM").Select(c => new Dictionary<string, object>(){
                    {"fieldname", c.FieldName},
                    {"fieldcaption",  c.FieldCaption},
                    {"width",100},
                    {"displayformat", c.DisplayFormat},
                    {"visible",c.Visible},
                    {"ord", ord++}
                }).ToList();
                return Json(res);
            }
            catch (Exception e)
            {
                return Json(new { Error = $"Ошибка: {e.Message}" });
            }

        }
        public JsonResult exec(string EditProc, string SQLParams, string KeyF, string IdDeclare, string mode)
        {
            Dictionary<string, object> WorkRow = JsonConvert.DeserializeObject<Dictionary<string, object>>(SQLParams);
            string message = "OK";
            ExternalAdapter ea = new ExternalAdapter();
            if (ea.procedures.Contains(EditProc))
            {
                //перехватываем внешние процедуры
                try
                {

                    Dictionary<string, object> MainTab = ea.exec(EditProc, WorkRow, IdDeclare, mode);
                    List<string> ColumnTab = new List<string>();
                    ColumnTab.AddRange(MainTab.Keys);
                    return Json(new
                    {
                        message = message,
                        MainTab = new List<Dictionary<string, object>>() { MainTab },
                        ColumnTab = ColumnTab
                    });
                }
                catch (Exception ex)
                {
                    message = ex.Message;
                    return Json(new
                    {
                        message = message
                    });
                }

            }


            //26.07.2022  проверяем строку коннекта
            string Driver = MainObj.Driver;
            string ConnectionString = MainObj.ConnectionString;
            if (!string.IsNullOrEmpty(IdDeclare))
            {
                string dsql = "select * from v_t_rpdeclare where iddeclare = @IdDeclare";
                var t_rp = MainObj.Dbutil.Runsql(dsql, new Dictionary<string, object>() { { "@IdDeclare", int.Parse(IdDeclare) } });
                string dcs = t_rp.Rows[0]["descript"].ToString();
                if (!string.IsNullOrEmpty(dcs))
                {
                    var d = dcs.Split('@');
                    Driver = d[0];
                    ConnectionString = d[1];
                }
            }



            try
            {

                DataTable data = MainObj.Dbutil.CommandBuild(WorkRow, EditProc, Driver, ConnectionString);
                List<Dictionary<string, object>> MainTab = MainObj.Dbutil.DataToJson(data);
                List<string> ColumnTab = MainObj.Dbutil.DataColumn(data);

                return Json(new
                {
                    message = message,
                    MainTab = MainTab,
                    ColumnTab = ColumnTab
                });
            }
            catch (Exception ex)
            {
                message = ex.Message;
                return Json(new
                {
                    message = message
                });
            }

        }

        public JsonResult FinderStart(string id, string mode, string page, string Fc, string TextParams, string SQLParams)
        {
            var F = new Finder();
            F.Account = User.Identity.Name;
            if (string.IsNullOrEmpty(F.Account))
                F.Account = "sa";

            F.nrows = 30;
            if (!string.IsNullOrEmpty(mode))
                F.Mode = mode;
            else
                F.Mode = "new";

            if (!string.IsNullOrEmpty(page))
                F.page = int.Parse(page);

            if (!string.IsNullOrEmpty(Fc))
            {
                F.Fcols = JsonConvert.DeserializeObject<List<FinderField>>(Fc);
            }

            if (!string.IsNullOrEmpty(TextParams))
            {
                F.TextParams = JsonConvert.DeserializeObject<Dictionary<string, string>>(TextParams);
            }

            if (!string.IsNullOrEmpty(SQLParams))
            {
                F.SQLParams = JsonConvert.DeserializeObject<Dictionary<string, object>>(SQLParams);
                Dictionary<string, object> parseParam = new Dictionary<string, object>();
                foreach (string k in F.SQLParams.Keys)
                {
                    DateTime dval;
                    string val = F.SQLParams[k].ToString();
                    if (DateTime.TryParse(val, out dval))
                    {
                        parseParam.Add(k, dval);
                    }
                    else
                    {
                        parseParam.Add(k, F.SQLParams[k]);
                    }
                }
                F.SQLParams = parseParam;
            }


            try
            {
                F.start(id);
                return Json(F);
            }
            catch (Exception e)
            {
                return Json(new { Error = e.Message });
            }
        }

        public IActionResult CSV(string id, string Fc, string TextParams, string SQLParams, string format, string dateformat, string pref)
        {
            if (string.IsNullOrEmpty(format))
                format = "csv";

            var F = new Finder();
            F.Account = User.Identity.Name;
            if (string.IsNullOrEmpty(F.Account))
                F.Account = "sa";

            F.Mode = "csv";
            if (!string.IsNullOrEmpty(Fc))
            {
                List<FinderField> Fcols = JsonConvert.DeserializeObject<List<FinderField>>(Fc);
                F.Fcols = Fcols;
            }

            if (!string.IsNullOrEmpty(TextParams))
            {
                F.TextParams = JsonConvert.DeserializeObject<Dictionary<string, string>>(TextParams);
            }

            if (!string.IsNullOrEmpty(SQLParams))
            {
                F.SQLParams = JsonConvert.DeserializeObject<Dictionary<string, object>>(SQLParams);
                Dictionary<string, object> parseParam = new Dictionary<string, object>();
                foreach (string k in F.SQLParams.Keys)
                {
                    DateTime dval;
                    string val = F.SQLParams[k].ToString();
                    if (DateTime.TryParse(val, out dval))
                    {
                        parseParam.Add(k, dval);
                    }
                    else
                    {
                        parseParam.Add(k, F.SQLParams[k]);
                    }
                }
                F.SQLParams = parseParam;
            }


            F.start(id);
            char r = ';';
            if (format != "csv")
                r = '\t';
            string s = F.ExportCSV(r);
            string ctype = "application/octet-stream";
            byte[] buf = Encoding.UTF8.GetBytes(s);
            string filename = $"data_{id}.{format}";
            if (!string.IsNullOrEmpty(dateformat))
                filename = pref + DateTime.Now.ToString(dateformat) + "." + format;

            return File(buf, ctype, filename);

        }

        public JsonResult Banner()
        {
            //try
            //{

            string account = User.Identity.Name;
            if (string.IsNullOrEmpty(account))
                account = "sa";

            List<Dictionary<string, string>> res = new List<Dictionary<string, string>>();

            int n = 0;
            try
            {
                //mtf banner
                ExternalAdapter ea = new ExternalAdapter();
                string message = "OK";
                bool adm = false;
                try
                {
                    ea.TestApi();
                    ea.UpdateNciData(); //Во время отладки не обновляем
                    adm = MainObj.CheckAccess("Administrators", account);
                }
                catch (Exception e)
                {
                    message = e.Message;
                }
                var data = ea.GetUserQueryInfo(account);

                n = Math.Min(8, data.Count());
                for (int i = 0; i < n; i++)
                {
                    var Rows = data[i];
                    Dictionary<string, string> r = new Dictionary<string, string>() {
                            {"id", $"{Rows["iddeclare"].ToString()}_query"},
                            {"iddeclare", Rows["iddeclare"].ToString()},
                            {"text", Rows["name"].ToString()}
                        };
                    res.Add(r);
                }
                /*
                }
                catch
                {
                    //common banner
                    var sql = "select a.* from fn_mainmenu('ALL', @Account) a where link1 = 'Bureau.Finder' and params not in ('75', '129') order by a.ordmenu, idmenu";
                    DataTable data = MainObj.Dbutil.Runsql(sql, new Dictionary<string, object>() { { "@Account", account } });
                    n = Math.Min(8, data.Rows.Count);
                    for (int i = 0; i < n; i++)
                    {
                        Dictionary<string, string> r = new Dictionary<string, string>() {
                            {"id", data.Rows[i]["idmenu"].ToString()},
                            {"iddeclare", data.Rows[i]["params"].ToString()},
                            {"text", data.Rows[i]["caption"].ToString().Split("/").Last()}
                        };
                        res.Add(r);
                    }
                }
                */
                if (n > 0)
                    for (int i = n; i < 8; i++)
                    {
                        Dictionary<string, string> r = new Dictionary<string, string>(res[i - n]);
                        res.Add(r);
                    }
                return Json(new { items = res.Take(4).ToList(), items2 = res.Skip(4).ToList(), Error = message, Admin = adm });
            }
            catch (Exception e)
            {
                return Json(new object[] { new { text = e.Message } });
            }

        }

        [Route("ustore/gettree")]
        public JsonResult gettree()
        {
            try
            {
                string account = User.Identity.Name;
                if (string.IsNullOrEmpty(account))
                    account = "sa";
                var tu = new treeutil();

                string sql = "select a.* from fn_mainmenu('ALL', @Account) a order by a.ordmenu, idmenu";


                DataTable data = MainObj.Dbutil.Runsql(sql, new Dictionary<string, object>() { { "@Account", account } });
                var rootItem = new treeItem("root");
                rootItem.children = new List<object>();

                tu.CreateItems("Root/", rootItem, data);
                return Json(rootItem.children);
            }
            catch (Exception e)
            {
                return Json(new object[] { new { text = e.Message } });
            }
        }


        [Route("/pg/getid/{table_name}")]
        public JsonResult getid(string table_name)
        {
            return Json(new { id = "" });
            /*
            var sql = "select column_default, udt_name  from information_schema.columns  where table_name = @table_name and ordinal_position = 1";
            var cnstr = MainObj.ConnectionString;
            var da = new NpgsqlDataAdapter(sql, cnstr);
            da.SelectCommand.Parameters.AddWithValue("@table_name", table_name);
            var rec = new DataTable();
            da.Fill(rec);

            if (rec.Rows.Count == 0)
            {
                return Json(new { id = "" });
            };
            if (rec.Rows[0]["column_default"].ToString() == "" && rec.Rows[0]["udt_name"].ToString() != "uuid")
            {
                return Json(new { id = "" });
            };
            var c_default = rec.Rows[0]["column_default"].ToString();
            if (rec.Rows[0]["udt_name"].ToString() == "uuid")
                c_default = "uuid_generate_v1()";
            sql = "select " + c_default + " id";
            da = new NpgsqlDataAdapter(sql, cnstr);
            var result = new DataTable();
            da.Fill(result);
            return Json(new { id = result.Rows[0]["id"] });
            */

        }

        public ActionResult CommandBuilder(string table)
        {
            try
            {
                if (MainObj.Driver == "PGSQL")
                {
                    string sql = $"select * from {table}";
                    NpgsqlDataAdapter da = new NpgsqlDataAdapter(sql, MainObj.ConnectionString);
                    NpgsqlCommandBuilder cm = new NpgsqlCommandBuilder(da);
                    return Content(cm.GetUpdateCommand().CommandText + "\n ====== \n"
                    + cm.GetInsertCommand().CommandText + "\n ====== \n"
                    + cm.GetDeleteCommand().CommandText);
                }
                else
                {
                    string sql = $"select * from {table}";
                    SqlDataAdapter da = new SqlDataAdapter(sql, MainObj.ConnectionString);
                    SqlCommandBuilder cm = new SqlCommandBuilder(da);
                    return Content(cm.GetUpdateCommand().CommandText + "\n ====== \n"
                    + cm.GetInsertCommand().CommandText + "\n ====== \n"
                    + cm.GetDeleteCommand().CommandText);
                }
            }
            catch (Exception ex)
            {
                return Content(ex.Message);
            }

        }

    }

}