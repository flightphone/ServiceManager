using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Xml;
using System.Linq;
using Npgsql;



namespace WpfBu.Models
{
    // /*__external__*/
    public class ExternalAdapter
    {
        public List<Dictionary<string, object>> GetData (string IdDeclare, Dictionary<string, string> TextParams)
        {
            if (IdDeclare == "151")
                return Test(IdDeclare, TextParams);
            
            
            List<Dictionary<string, object>> res = new List<Dictionary<string, object>>(){ new Dictionary<string, object>(){{"error", "Не определен источник данных"}}};
            return res;
        }

        public List<Dictionary<string, object>> Test(string IdDeclare, Dictionary<string, string> TextParams)
        {
            string sql = "select * from airlines order by al_utg";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sql, MainObj.ConnectionString);
            DataTable res = new DataTable();
            da.Fill(res);
            List<Dictionary<string, object>> data = MainObj.Dbutil.DataToJson(res);
            return data;

        }
    }
}