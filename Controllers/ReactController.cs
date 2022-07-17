using Microsoft.AspNetCore.Mvc;
using WpfBu.Models;
using System;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Text.RegularExpressions;
using Npgsql;

namespace ServiceManager.Controllers
{
    //[Authorize]
    public class ReactController : Controller
    {

        public JsonResult exec(string EditProc, string SQLParams, string KeyF)
        {
            Dictionary<string, object> WorkRow = JsonConvert.DeserializeObject<Dictionary<string, object>>(SQLParams);
            var vals = new List<string>();
            var Param = new Dictionary<string, object>();
            Regex re = new Regex(@"[-+]?[0-9]*[\.,][0-9]*");
            foreach (string fname in WorkRow.Keys)
            {
                string pname;
                string pval = WorkRow[fname].ToString();
                

                if (string.IsNullOrEmpty(pval))
                    pname = "null";
                else
                {
                    pname = $"'{pval.Replace("'", "''")}'";
                }

                string val = "";

                val = $"_{fname} => {pname}";

                vals.Add(val);
            }
            string sqlpar = string.Join(",", vals);
            string sql = "";

            sql = $"select * from {EditProc}({sqlpar})";

            DataTable data;
            string message = "OK";
            try
            {
                data = MainObj.Dbutil.Runsql(sql, Param);
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


        [Route("ustore/gettree")]
        public JsonResult gettree()
        {
            try
            {
                string account = User.Identity.Name;
                if (string.IsNullOrEmpty(account))
                    account = "sa";
                var tu = new treeutil();

                var data = new DataTable();
                var cnstr = MainObj.ConnectionString;
                var sql = "select a.* , fn_getmenuimageid(a.caption) idimage from fn_mainmenu('ALL', @Account) a order by a.ordmenu, idmenu";

                var da = new NpgsqlDataAdapter(sql, cnstr);
                da.SelectCommand.Parameters.AddWithValue("@Account", account);
                da.Fill(data);

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

        }
    }

}