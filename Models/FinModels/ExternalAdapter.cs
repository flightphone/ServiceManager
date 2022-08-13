using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Xml;
using System.Linq;
using Npgsql;
using Newtonsoft.Json;
using System.Net;
using System.IO;



namespace WpfBu.Models
{

    public class NciData
    {
        public int ErrorCode { get; set; }
        public List<Dictionary<string, object>> QueryData { get; set; }
    }

    public interface IExternalAdapter
    {
        public List<Dictionary<string, object>> GetData(string IdDeclare, Dictionary<string, string> TextParams, string Account, string DecName);
        public List<string> procedures { get; set; }

        public Dictionary<string, object> exec(string EditProc, Dictionary<string, object> WorkRow, string IdDeclare, string Action);
    }

    // /*__external__*/
    public class ExternalAdapter : IExternalAdapter
    {
        public List<string> procedures { get; set; }

        public ExternalAdapter()
        {

            procedures = new List<string>(){
                "p_connectors_edit",
                "p_connectors_del",
                "p_querys_edit",
                "p_querys_del",
                "p_auto_edit",
                "p_auto_del"
                };
        }
        public Dictionary<string, object> exec(string EditProc, Dictionary<string, object> WorkRow, string IdDeclare, string Action)
        {
            //внешние процедуры insert/update/delete 21/07/2022
            if (EditProc == "p_connectors_edit")
                return AddConnector(WorkRow, EditProc);

            if (EditProc == "p_connectors_del")
                return DeleteConnector(WorkRow, EditProc);

            if (EditProc == "p_querys_edit")
                return AddQuery(WorkRow, EditProc);

            if (EditProc == "p_querys_del")
                return DeleteQuery(WorkRow, EditProc);

            throw new Exception("Не реализовано");
        }


        public List<Dictionary<string, object>> GetData(string IdDeclare, Dictionary<string, string> TextParams, string Account, string DecName)
        {
            if (IdDeclare == "151")
                return Test(IdDeclare, TextParams);

            if (IdDeclare == "152")
                //return QueryExec(IdDeclare, TextParams);
                return GetDataNci(TextParams["name"]);

            if (IdDeclare == "146" || IdDeclare == "147")
            {
                return GetAllConnectorsInfo();
            }

            if (IdDeclare == "149")
            {
                return GetAllQueryInfo();
            }

            if (IdDeclare == "168")
            {
                return GetUserQueryInfo(Account);
            }

            return GetDataNci(DecName);
            //List<Dictionary<string, object>> res = new List<Dictionary<string, object>>() { new Dictionary<string, object>() { { "error", "Не определен источник данных" } } };
            //return res;
        }

        public void UpdateNciData()
        {
            return;
        }

        public List<Dictionary<string, object>> GetAllConnectorsInfo()
        {

            //Опять Локально 30.07.2022
            string sql = "select * from v_connectors order by name";
            DataTable dt = MainObj.Dbutil.Runsql(sql);
            List<Dictionary<string, object>> res = MainObj.Dbutil.DataToJson(dt);
            return res;
        }



        public List<Dictionary<string, object>> GetAllQueryInfo()
        {

            //Опять Локально 30.07.2022
            string sql = "select * from v_querys order by name";
            DataTable dt = MainObj.Dbutil.Runsql(sql);
            List<Dictionary<string, object>> res = MainObj.Dbutil.DataToJson(dt);
            return res;
        }

        public List<Dictionary<string, object>> GetUserQueryInfo(string Account)
        {

            //Опять Локально 30.07.2022
            List<Dictionary<string, object>> res = GetAllQueryInfo();

            //Фильтровка
            List<Dictionary<string, object>> resdata;
            if (MainObj.CheckAccess("Administrators", Account))
                resdata = res.OrderBy(d => d["name"]).ToList();
            else
            {
                string sql = "select description from t_ntusers where username = @username";
                DataTable dt = MainObj.Dbutil.Runsql(sql, new Dictionary<string, object>() { { "@username", Account } });
                List<string> listNCI = dt.Rows[0][0].ToString().Split(",", StringSplitOptions.RemoveEmptyEntries).ToList();
                resdata = res.Where(d => listNCI.Contains(d["dbconnectorname"])).OrderBy(d => d["name"]).ToList();
            }

            return resdata;
        }

        public List<Dictionary<string, object>> GetDataNci(string name)
        {

            List<Dictionary<string, object>> data = new List<Dictionary<string, object>> {
                    new Dictionary<string, object>() {{"Error", "Empty"}}
                };
            return data;
        }

        public List<Dictionary<string, object>> QueryExec(string IdDeclare, Dictionary<string, string> TextParams)
        {
            string sql = "select * from querys where name = @name";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sql, MainObj.ConnectionString);
            DataTable res = new DataTable();
            da.SelectCommand.Parameters.AddWithValue("@name", TextParams["name"]);
            da.Fill(res);
            sql = res.Rows[0]["command"].ToString();
            da = new NpgsqlDataAdapter(sql, MainObj.ConnectionString);
            res = new DataTable();
            da.Fill(res);
            List<Dictionary<string, object>> data = MainObj.Dbutil.DataToJson(res);
            return data;

        }

        public List<Dictionary<string, object>> Test(string IdDeclare, Dictionary<string, string> TextParams)
        {
            string sql = "select * from utgservice";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sql, MainObj.ConnectionString);
            DataTable res = new DataTable();
            da.Fill(res);
            List<Dictionary<string, object>> data = MainObj.Dbutil.DataToJson(res);
            return data;

        }

        Dictionary<string, object> FromNCI(Dictionary<string, object> nci, Dictionary<string, string> map)
        {
            Dictionary<string, object> res = new Dictionary<string, object>();
            foreach (var p in map)
                res.Add(p.Key, nci[p.Value]);
            return res;
        }

        Dictionary<string, object> FromNCIConn(Dictionary<string, object> nci, Dictionary<string, string> map)
        {
            Dictionary<string, object> res = FromNCI(nci, map);
            try
            {
                res.Add("cn_typedb", TypeConMap[res["typedb"].ToString()]);
            }
            catch
            {
                ;
            }
            return res;
        }

        Dictionary<string, object> ToNCI(Dictionary<string, object> bu, Dictionary<string, string> map)
        {
            Dictionary<string, object> res = new Dictionary<string, object>();
            foreach (var p in map)
                res.Add(p.Value, bu[p.Key]);
            return res;
        }
        public string TestApi()
        {
            return GetApi($"{MainObj.api}Test");
        }
        public string GetApi(string apiuri)
        {
            string res = "";
            HttpWebRequest request = HttpWebRequest.CreateHttp(apiuri);
            request.ServerCertificateValidationCallback += (sender, certificate, chain, sslPolicyErrors) => true;
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            using (var r = new StreamReader(response.GetResponseStream()))
            {
                res = r.ReadToEnd();
            }
            response.Close();
            return res;
        }

        public Dictionary<string, object> AddConnector(Dictionary<string, object> WorkRow, string EditProc)
        {
            MainObj.Dbutil.CommandBuild(WorkRow, EditProc, MainObj.Driver, MainObj.ConnectionString);
            return WorkRow;
        }

        public Dictionary<string, object> AddQuery(Dictionary<string, object> WorkRow, string EditProc)
        {

            DataTable data = MainObj.Dbutil.CommandBuild(WorkRow, EditProc, MainObj.Driver, MainObj.ConnectionString);
            List<Dictionary<string, object>> MainTab = MainObj.Dbutil.DataToJson(data);
            return MainTab[0];
        }

        public Dictionary<string, object> DeleteConnector(Dictionary<string, object> WorkRow, string EditProc)
        {

            MainObj.Dbutil.CommandBuild(WorkRow, EditProc, MainObj.Driver, MainObj.ConnectionString);
            return WorkRow;
        }

        public Dictionary<string, object> DeleteQuery(Dictionary<string, object> WorkRow, string EditProc)
        {
            MainObj.Dbutil.CommandBuild(WorkRow, EditProc, MainObj.Driver, MainObj.ConnectionString);
            return WorkRow;
        }

        private Dictionary<string, string> ConnectorMap = new Dictionary<string, string>() {
         {"name", "Name"}
        ,{"username", "UserName" }
        ,{"password", "Password" }
        ,{"address", "Address" }
        ,{"dbname", "DBName" }
        ,{"typedb", "TypeDB" }};


        private Dictionary<string, string> QueryMap = new Dictionary<string, string>() {
         {"name", "Name"}
        ,{"userid", "UserID" }
        ,{"command", "Command" }
        ,{"dbconnectorname", "DBConnectorName" }
        };

        private Dictionary<string, string> TypeConMap = new Dictionary<string, string>(){
             {"0", "MSSQL"}
            ,{"1", "FireBird"}
            ,{"2", "ClickHouse"}
            ,{"3", "PostgreSQL"}
        };



    }
}