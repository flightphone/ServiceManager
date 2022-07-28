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
                return AddConnector(WorkRow);

            if (EditProc == "p_connectors_del")
                return DeleteConnector(WorkRow);

            if (EditProc == "p_querys_edit")
                return AddQuery(WorkRow);

            if (EditProc == "p_querys_del")
                return DeleteQuery(WorkRow);

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

            if (IdDeclare == "150")
            {
                return GetUserQueryInfo(Account);
            }

            return GetDataNci(DecName);
            //List<Dictionary<string, object>> res = new List<Dictionary<string, object>>() { new Dictionary<string, object>() { { "error", "Не определен источник данных" } } };
            //return res;
        }

        public List<Dictionary<string, object>> GetAllConnectorsInfo()
        {
            string apiuri = MainObj.api + "GetAllConnectorsInfo";
            string nci = GetApi(apiuri);
            Dictionary<string, Dictionary<string, object>> ncidata = JsonConvert.DeserializeObject<Dictionary<string, Dictionary<string, object>>>(nci);
            List<Dictionary<string, object>> data = ncidata.Values.Select(d => FromNCIConn(d, ConnectorMap)).OrderBy(d => d["name"]).ToList();
            return data;

        }
        public List<Dictionary<string, object>> GetAllQueryInfo()
        {
            string apiuri = MainObj.api + "GetAllQueryInfo";
            string nci = GetApi(apiuri);
            Dictionary<string, Dictionary<string, object>> ncidata = JsonConvert.DeserializeObject<Dictionary<string, Dictionary<string, object>>>(nci);
            List<Dictionary<string, object>> data = ncidata.Values.Select(d => FromNCI(d, QueryMap)).ToList();
            string sql = "select * from mft_import_query(@list)";
            string lst = string.Join(",", data.Select(d => d["name"]));
            var t_rpDeclare = MainObj.Dbutil.DataToJson(MainObj.Dbutil.Runsql(sql, new Dictionary<string, object>() {{"@list", lst}}));
            var res = from d in data
                      join r in t_rpDeclare on d["name"]  equals r["decname"]
                      select (new List<Dictionary<string, object>>(){d, r}).SelectMany(dict => dict)
                         .ToDictionary(pair => pair.Key, pair => pair.Value);
            
            return res.OrderBy(d => d["name"]).ToList();
        }

        public List<Dictionary<string, object>> GetUserQueryInfo(string Account)
        {

            string apiuri = MainObj.api + "GetAllQueryInfo";
            string nci = GetApi(apiuri);
            Dictionary<string, Dictionary<string, object>> ncidata = JsonConvert.DeserializeObject<Dictionary<string, Dictionary<string, object>>>(nci);
            List<Dictionary<string, object>> data = ncidata.Values.Select(d => FromNCI(d, QueryMap)).ToList();
            //Фильтровка
            //data = data.Where(d => (d["userid"] ?? "").ToString() == Account).ToList();
            return data;
        }

        public List<Dictionary<string, object>> GetDataNci(string name)
        {
            string apiuri = $"{MainObj.api}GetData/{name}";
            string nci = GetApi(apiuri);
            NciData ncid = JsonConvert.DeserializeObject<NciData>(nci);
            List<Dictionary<string, object>> data = ncid.QueryData;
            if (data == null)
                data = new List<Dictionary<string, object>> {
                    new Dictionary<string, object>() {{"Сообщение", "В результате запроса нет данных."}}
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

        public Dictionary<string, object> AddConnector(Dictionary<string, object> WorkRow)
        {

            Dictionary<string, object> ncirow = ToNCI(WorkRow, ConnectorMap);
            string jobj  = JsonConvert.SerializeObject(ncirow);
            string apiuri = $"{MainObj.api}AddConnector?Conn={jobj}";
            
            DeleteConnector(WorkRow);
            string nci = GetApi(apiuri);
            return WorkRow;
        }

        public Dictionary<string, object> AddQuery(Dictionary<string, object> WorkRow)
        {
            Dictionary<string, object> ncirow = ToNCI(WorkRow, QueryMap);
            string jobj  = JsonConvert.SerializeObject(ncirow);
            string apiuri = $"{MainObj.api}AddQuery?Query={jobj}";
            
            DeleteQuery(WorkRow);
            string nci = GetApi(apiuri);
            return WorkRow;
        }

        public Dictionary<string, object> DeleteConnector(Dictionary<string, object> WorkRow)
        {
            string apiuri = $"{MainObj.api}DeleteConnector/{WorkRow["name"].ToString()}";
            string nci = GetApi(apiuri);
            return WorkRow;
        }

        public Dictionary<string, object> DeleteQuery(Dictionary<string, object> WorkRow)
        {
            string apiuri = $"{MainObj.api}DeleteQuery/{WorkRow["name"].ToString()}";
            string nci = GetApi(apiuri);
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