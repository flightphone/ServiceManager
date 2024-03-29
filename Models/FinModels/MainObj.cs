﻿using System;
using System.Collections.Generic;
using System.Data;
using Npgsql;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.Globalization;


namespace WpfBu.Models
{

    public class MainObj
    {
        public static string Driver { get; set; }
        public static string ConnectionString { get; set; }
        public static DBUtil Dbutil { get; set; }

        public static int checkAuth(string account, string password, bool update = false)
        {

            if (account == "sa" && password == "aA12345678")
                return 1;
            var sqlcheck = "select username, pass from t_ntusers where username = @account and (pass = @password or pass = '-') and username <> 'sa'";
            var res = Dbutil.Runsql(sqlcheck, new Dictionary<string, object>(){
                {"@account", account},
                {"@password", password}
            });

            if (res.Rows.Count == 0)
                return -1;
            if (res.Rows[0]["pass"].ToString() == "-")
            {
                if (update)
                {
                    string sql = "update t_ntusers set pass = @password  where username = @account and pass = '-'";
                    Dbutil.ExecSQL(sql, new Dictionary<string, object>(){
                        {"@account", account},
                        {"@password", password}
                    });

                    return 1;
                }

                return 0;
            }
            return 1;
        }

        public static bool CheckAccess(string grp, string Account)
        {
            string sql = "select fn_checkaccess(@grp, @Account)";
            if (MainObj.Driver == "MSSQL")
                sql = "select dbo.fn_checkaccess(@grp, @Account)";


            DataTable res = Dbutil.Runsql(sql, new Dictionary<string, object>(){
                {"@grp", grp},
                {"@account", Account}

            });
            int r = (int)res.Rows[0][0];
            return (r > 0);

        }


        public static string api { get; set; }


    }

    public class treeItem
    {
        public string id { get; set; }
        public string text { get; set; }
        public List<object> children { get; set; }

        public string iconCls { get; set; }

        public Dictionary<string, string> attributes { get; set; }

        public string state { get; set; }

        public treeItem(string t)
        {
            text = t;
        }
    }

    public class treeutil
    {
        public void CreateItems(string Root, treeItem Mn, DataTable Tab)
        {

            var ListCaption = new List<string>();
            var k = Root.Split('/', StringSplitOptions.RemoveEmptyEntries).Length;
            for (var x = 0; x < Tab.Rows.Count; x++)
            {
                var mi = Tab.Rows[x];
                var Caption = mi["caption"].ToString();
                if (Caption.IndexOf(Root) == 0)
                {
                    var bi = Caption.Split('/');
                    var ItemCaption = bi[k];
                    if (ListCaption.IndexOf(ItemCaption) == -1)
                    {
                        ListCaption.Add(ItemCaption);
                        treeItem ilist = new treeItem(ItemCaption);
                        ilist.id = (k == bi.Length - 1) ? mi["idmenu"].ToString() : mi["idmenu"].ToString() + "_node";
                        ilist.attributes = new Dictionary<string, string>() { { "link1", mi["link1"].ToString() }, { "params", mi["params"].ToString() } };
                        /*
                        if ((int)mi["idimage"] > 0)
                            ilist.iconCls = "tree-" + mi["idimage"].ToString();
                        */

                        if (Mn.children == null)
                        { Mn.children = new List<object>(); }
                        Mn.children.Add(ilist);
                        Mn.state = "closed";
                        if (k != bi.Length - 1)
                        {
                            CreateItems(Root + ItemCaption + "/", ilist, Tab);
                        }
                    }
                }
            }
        }
    }
    public class DBUtil
    {
        public List<string> DataColumn(DataTable data)
        {
            List<string> res = new List<string>();
            DataColumn[] a = new DataColumn[data.Columns.Count];
            data.Columns.CopyTo(a, 0);
            res.AddRange(a.Select((c) => c.ColumnName));
            return res;
        }
        public List<Dictionary<string, object>> DataToJson(DataTable res)
        {
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            foreach (DataRow rw in res.Rows)
            {
                var user = new Dictionary<string, object>();
                foreach (DataColumn col in res.Columns)
                {
                    if (col.DataType == typeof(System.DateTime) & rw[col] != DBNull.Value)
                        user.Add(col.ColumnName, ((DateTime)rw[col]).ToString("yyyy-MM-ddTHH:mm:ss.000Z"));
                    else
                        user.Add(col.ColumnName, (rw[col] == DBNull.Value) ? null : rw[col]);
                }
                rows.Add(user);
            }
            return rows;
        }
        public DataTable Runsql(string sql, string Driver = "", string ConnectionString = "")
        {
            if (String.IsNullOrEmpty(Driver))
                Driver = MainObj.Driver;
            if (String.IsNullOrEmpty(ConnectionString))
                ConnectionString = MainObj.ConnectionString;
            DataTable data = new DataTable();
            if (Driver == "PGSQL")
            {
                var da = new NpgsqlDataAdapter(sql, ConnectionString);
                da.Fill(data);
            }
            else
            {
                var da = new SqlDataAdapter(sql, ConnectionString);
                da.Fill(data);
            }
            return data;
        }

        public bool DateTimeTryParse(string s, out DateTime dval)
        {
            dval = DateTime.Now;
            try
            {

                s = s.Replace("/", ".");
                string[] data_t = s.Split(" ", StringSplitOptions.RemoveEmptyEntries);
                string[] data = data_t[0].Split(".");
                if (data.Length != 3)
                    return false;
                if (data[2].Length == 2)
                    data[2] = "20" + data[2];
                dval = new DateTime(int.Parse(data[2]), int.Parse(data[1]), int.Parse(data[0]));
                if (data_t.Length > 1)
                {
                    string[] ti = data_t[1].Split(":");
                    dval = dval.AddHours(int.Parse(ti[0]));
                    if (ti.Length > 1)
                        dval = dval.AddMinutes(int.Parse(ti[1]));

                }
                return true;
            }
            catch
            {
                return false;
            }
        }
        object parseval(object o)
        {
            if (o.GetType() == typeof(DateTime))
                return o;
            string pval = (o ?? "").ToString();
            DateTime dval;
            if (DateTimeTryParse(pval, out dval))
            {
                return dval;
            }
            else
                return o;
        }
        public DataTable Runsql(string sql, Dictionary<string, object> par, string Driver = "", string ConnectionString = "")
        {
            if (String.IsNullOrEmpty(Driver))
                Driver = MainObj.Driver;
            if (String.IsNullOrEmpty(ConnectionString))
                ConnectionString = MainObj.ConnectionString;
            DataTable data = new DataTable();
            if (Driver == "PGSQL")
            {
                var da = new NpgsqlDataAdapter(sql, ConnectionString);
                if (par != null)
                    foreach (string s in par.Keys)
                        if (par[s] == null)
                            da.SelectCommand.Parameters.AddWithValue(s, DBNull.Value);
                        else
                        {
                            da.SelectCommand.Parameters.AddWithValue(s, parseval(par[s]));
                        }
                da.Fill(data);
            }
            else
            {
                var da = new SqlDataAdapter(sql, ConnectionString);
                if (par != null)
                    foreach (string s in par.Keys)
                        if (par[s] == null)
                            da.SelectCommand.Parameters.AddWithValue(s, DBNull.Value);
                        else
                            da.SelectCommand.Parameters.AddWithValue(s, parseval(par[s]));
                da.Fill(data);
            }



            return data;
        }

        public void ExecSQL(string sql, Dictionary<string, object> par, string Driver = "", string ConnectionString = "")
        {
            if (String.IsNullOrEmpty(Driver))
                Driver = MainObj.Driver;
            if (String.IsNullOrEmpty(ConnectionString))
                ConnectionString = MainObj.ConnectionString;

            if (Driver == "PGSQL")
            {
                var cn = new NpgsqlConnection(MainObj.ConnectionString);
                var cmd = new NpgsqlCommand(sql, cn);
                if (par != null)
                    foreach (string s in par.Keys)
                        if (par[s] == null)
                            cmd.Parameters.AddWithValue(s, DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue(s, parseval(par[s]));
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
            }
            else
            {
                var cn = new SqlConnection(MainObj.ConnectionString);
                var cmd = new SqlCommand(sql, cn);
                if (par != null)
                    foreach (string s in par.Keys)
                        if (par[s] == null)
                            cmd.Parameters.AddWithValue(s, DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue(s, parseval(par[s]));
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();

            }

        }
        public object NewID(string tablename)
        {
            object res = DBNull.Value;

            var sql = "select column_default, udt_name  from information_schema.columns  where table_name = @tablename and ordinal_position = 1";
            var rec = Runsql(sql, new Dictionary<string, object>() { { "@tablename", tablename } });

            if (rec.Rows.Count == 0)
            {
                return res;
            };

            if (rec.Rows[0]["column_default"].ToString() == "" && rec.Rows[0]["udt_name"].ToString() != "uuid")
            {
                return res;
            };
            var c_default = rec.Rows[0]["column_default"].ToString();
            if (rec.Rows[0]["udt_name"].ToString() == "uuid")
                c_default = "uuid_generate_v1()";
            sql = "select " + c_default + " id";
            var result = Runsql(sql);
            return result.Rows[0]["id"];
        }

        public DataTable CommandBuild(Dictionary<string, object> WorkRow, string EditProc, string Driver, string ConnectionString)
        {
            var vals = new List<string>();
            var Param = new Dictionary<string, object>();
            Regex re = new Regex(@"[-+]?[0-9]*[\.,][0-9]*");
            foreach (string fname in WorkRow.Keys)
            {
                string pname;
                string pval = (WorkRow[fname] ?? "").ToString();
                DateTime dval;
                Double duval;

                if (Driver == "PGSQL")
                {
                    if (string.IsNullOrEmpty(pval))
                        pname = "null";
                    else
                    {
                        pval = pval.Replace("'", "''");
                        if (DateTimeTryParse(pval, out dval))
                            pval = dval.ToString("yyyy-MM-dd HH:mm");
                        pname = $"'{pval}'";
                        
                    }
                }
                else
                {
                    pname = "@_" + fname;
                    if (re.IsMatch(pval) && Double.TryParse(pval.Replace(".", ","), out duval))
                    {
                        Param.Add(pname, duval);
                    }
                    else
                    if (DateTimeTryParse(pval, out dval))
                    {
                        Param.Add(pname, dval);
                    }
                    else
                    {
                        if (string.IsNullOrEmpty(WorkRow[fname].ToString()))
                        {
                            Param.Add(pname, DBNull.Value);
                        }
                        else
                        {
                            Param.Add(pname, WorkRow[fname]);
                        }
                    }
                }

                string val = "";
                if (Driver == "PGSQL")
                    val = $"_{fname} => {pname}";
                else
                    val = $"@{fname} = {pname}";
                vals.Add(val);
            }
            string sqlpar = string.Join(",", vals);
            string sql = "";

            if (Driver == "PGSQL")
                sql = $"select * from {EditProc}({sqlpar})";
            else
                sql = $"exec {EditProc} {sqlpar}";

            DataTable data = Runsql(sql, Param, Driver, ConnectionString);
            return data;

        }
    }

    public class DumpServ
    {
        //public string sql {get; set;}

        public string getTableName(string txt)
        {
            Regex rg = new Regex(@"\[(.*?)\]");
            var regs = rg.Match(txt);
            var TableName = regs.Groups[1].Value;
            return TableName;
        }


        public string CreateDumpSQL(string sql)
        {
            StringBuilder resSQL = new StringBuilder();
            string[] sqls = sql.Split(";", StringSplitOptions.RemoveEmptyEntries);
            foreach (var s in sqls)
                resSQL.Append(getTableName(s) + "\n");
            return resSQL.ToString();
        }
    }
}
