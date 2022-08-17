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
            if (EditProc == "p_auto_edit")
                return p_auto_edit(EditProc, WorkRow, IdDeclare, Action);
            if (EditProc == "p_auto_del")
                return p_auto_del(EditProc, WorkRow, IdDeclare, Action);    

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
            string apiuri = MainObj.api + "GetAllConnectorsInfo";
            string nci = GetApi(apiuri);
            Dictionary<string, Dictionary<string, object>> ncidata = JsonConvert.DeserializeObject<Dictionary<string, Dictionary<string, object>>>(nci);
            List<Dictionary<string, object>> data = ncidata.Values.Select(d => FromNCI(d, ConnectorMap)).OrderBy(d => d["name"]).ToList();
            string sql = "TRUNCATE table connectors; " +
            string.Join("\n",
                 data.Select(d =>
                 {
                     string r = $"insert into connectors ({string.Join(",", ConnectorMap.Keys)}) values (" +
                       string.Join(",", ConnectorMap.Keys.Select(k => $"'{(d[k] ?? "").ToString()}'")) + ");";
                     return r;
                 })
            );
            apiuri = MainObj.api + "GetAllQueryInfo/Select";
            nci = GetApi(apiuri);
            ncidata = JsonConvert.DeserializeObject<Dictionary<string, Dictionary<string, object>>>(nci);
            data = ncidata.Values.Select(d => FromNCI(d, QueryMap)).ToList();

            sql = sql + "TRUNCATE table querys; " +
            string.Join("\n",
                 data.Select(d =>
                 {
                     string r = $"insert into querys ({string.Join(",", QueryMap.Keys)}) values (" +
                       string.Join(",", QueryMap.Keys.Select(k => $"'{(d[k] ?? "").ToString()}'")) + ");";
                     return r;
                 })
            );
            sql = sql + "select mft_import();";

            MainObj.Dbutil.ExecSQL(sql, null);
        }

        public List<Dictionary<string, object>> GetAllConnectorsInfo()
        {
            /*
            string apiuri = MainObj.api + "GetAllConnectorsInfo";
            string nci = GetApi(apiuri);
            Dictionary<string, Dictionary<string, object>> ncidata = JsonConvert.DeserializeObject<Dictionary<string, Dictionary<string, object>>>(nci);
            List<Dictionary<string, object>> data = ncidata.Values.Select(d => FromNCIConn(d, ConnectorMap)).OrderBy(d => d["name"]).ToList();
            return data;
            */
            //Опять Локально 30.07.2022
            string sql = "select * from v_connectors order by name";
            DataTable dt = MainObj.Dbutil.Runsql(sql);
            List<Dictionary<string, object>> res = MainObj.Dbutil.DataToJson(dt);
            return res;
        }



        public List<Dictionary<string, object>> GetAllQueryInfo()
        {
            /*
            string apiuri = MainObj.api + "GetAllQueryInfo";
            string nci = GetApi(apiuri);
            Dictionary<string, Dictionary<string, object>> ncidata = JsonConvert.DeserializeObject<Dictionary<string, Dictionary<string, object>>>(nci);
            List<Dictionary<string, object>> data = ncidata.Values.Select(d => FromNCI(d, QueryMap)).ToList();
            string sql = "select * from mft_import_query(@list)";
            string lst = string.Join(",", data.Select(d => d["name"]));
            var t_rpDeclare = MainObj.Dbutil.DataToJson(MainObj.Dbutil.Runsql(sql, new Dictionary<string, object>() { { "@list", lst } }));
            var res = from d in data
                      join r in t_rpDeclare on d["name"] equals r["decname"]
                      select (new List<Dictionary<string, object>>() { d, r }).SelectMany(dict => dict)
                         .ToDictionary(pair => pair.Key, pair => pair.Value);

            return res.OrderBy(d => d["name"]).ToList();
            */
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

            Dictionary<string, object> ncirow = ToNCI(WorkRow, ConnectorMap);
            string jobj = JsonConvert.SerializeObject(ncirow);
            string apiuri = $"{MainObj.api}AddConnector?Conn={jobj}";

            DeleteConnector(WorkRow, EditProc);
            string nci = GetApi(apiuri);


            return WorkRow;
        }

        public Dictionary<string, object> p_auto_del(string EditProc, Dictionary<string, object> WorkRow, string IdDeclare, string Action)
        {
            string dsql = "select * from v_t_rpdeclare where iddeclare = @IdDeclare";
            DataTable t_rp = MainObj.Dbutil.Runsql(dsql, new Dictionary<string, object>() { { "@IdDeclare", int.Parse(IdDeclare) } });
            DataRow rd = t_rp.Rows[0];
            string KeyF = rd["keyfield"].ToString();
            string DecName = rd["decname"].ToString();
            string tablename = rd["tablename"].ToString();
            var CnVal = new { Value = WorkRow[KeyF], Condition = "=" };

            Dictionary<string, object> Condition = new Dictionary<string, object>(){
                    {KeyF, CnVal}
                };
            string where = JsonConvert.SerializeObject(Condition);
            string apiuri = $"{MainObj.api}ExtQuery/{tablename}/delete?Condition={where}";
            string nci = GetApi(apiuri);
            NciData Err = JsonConvert.DeserializeObject<NciData>(nci);
            if (Err.ErrorCode != 0)
                throw new Exception($"Ошибка: {Err.ErrorCode}");

            return WorkRow;
        }


        public Dictionary<string, object> p_auto_edit(string EditProc, Dictionary<string, object> WorkRow, string IdDeclare, string Action)
        {
            string dsql = "select * from v_t_rpdeclare where iddeclare = @IdDeclare";
            DataTable t_rp = MainObj.Dbutil.Runsql(dsql, new Dictionary<string, object>() { { "@IdDeclare", int.Parse(IdDeclare) } });
            DataRow rd = t_rp.Rows[0];
            string KeyF = rd["keyfield"].ToString();
            string DecName = rd["decname"].ToString();
            string tablename = rd["tablename"].ToString();
            Dictionary<string, object> send = new Dictionary<string, object>();
            foreach (string key in WorkRow.Keys)
            {
                if (Action == "edit" && key == KeyF)
                    continue;
                string val = (WorkRow[key] ?? "").ToString();
                if (string.IsNullOrEmpty(val))
                {
                    if (key == KeyF)
                        continue;
                    send.Add(key, null);
                    continue;
                }
                DateTime dval;
                if (DateTime.TryParse(val, out dval))
                    send.Add(key, dval.ToString("yyyy-MM-dd"));
                else
                    send.Add(key, WorkRow[key]);
            }
            string vals = JsonConvert.SerializeObject(send);
            string nci = "";
            if (Action == "edit")
            {
                var CnVal = new { Value = WorkRow[KeyF], Condition = "=" };
                Dictionary<string, object> Condition = new Dictionary<string, object>(){
                    {KeyF, CnVal}
                };
                string where = JsonConvert.SerializeObject(Condition);
                string apiuri = $"{MainObj.api}ExtQuery/{tablename}/update?Condition={where}&UpdateValue={vals}";
                nci = GetApi(apiuri);
            }
            else
            {
                string apiuri = $"{MainObj.api}ExtQuery/{tablename}/insert?InsertValue={vals}";
                nci = GetApi(apiuri);
            }
            NciData Err = JsonConvert.DeserializeObject<NciData>(nci);
            if (Err.ErrorCode != 0)
                throw new Exception($"Ошибка: {Err.ErrorCode}");


            return WorkRow;
        }

        public Dictionary<string, object> AddQuery(Dictionary<string, object> WorkRow, string EditProc)
        {

            DataTable data = MainObj.Dbutil.CommandBuild(WorkRow, EditProc, MainObj.Driver, MainObj.ConnectionString);
            List<Dictionary<string, object>> MainTab = MainObj.Dbutil.DataToJson(data);

            Dictionary<string, object> ncirow = ToNCI(WorkRow, QueryMap);
            //Заглушка для теста:
            ncirow["UserID"] = "123";
            string jobj = JsonConvert.SerializeObject(ncirow);
            //string apiuri = $"{MainObj.api}AddQuery?Query={jobj}";
            string apiuri = $"{MainObj.api}AddQuery/Select?Query={jobj}";

            DeleteQuery(WorkRow, EditProc);
            string nci = GetApi(apiuri);

            return MainTab[0];
        }

        public Dictionary<string, object> DeleteConnector(Dictionary<string, object> WorkRow, string EditProc)
        {

            MainObj.Dbutil.CommandBuild(WorkRow, EditProc, MainObj.Driver, MainObj.ConnectionString);
            string apiuri = $"{MainObj.api}DeleteConnector/{WorkRow["name"].ToString()}";
            string nci = GetApi(apiuri);
            return WorkRow;
        }

        public Dictionary<string, object> DeleteQuery(Dictionary<string, object> WorkRow, string EditProc)
        {

            MainObj.Dbutil.CommandBuild(WorkRow, EditProc, MainObj.Driver, MainObj.ConnectionString);
            string apiuri = $"{MainObj.api}DeleteQuery/Select/{WorkRow["name"].ToString()}";
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