using System;
using System.Data;
using System.Text;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Hosting;
using Newtonsoft.Json;
using System.IO;
using System.Net;
using Microsoft.AspNetCore.Authorization;
using WpfBu.Models;



namespace ServiceManager.Controllers
{
    [Authorize]
    public class MFTController : Controller
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

        public ActionResult dnload(int id, string blacktype)
        {
            string filename = $"BlackList.dat";
            string ctype = "application/octet-stream";
            string sql = "select comment from t_sysstatus where statustype = 'Connect' and statusname = 'MFT'";
            DataTable dt = MainObj.Dbutil.Runsql(sql);
            string Driver = "PGSQL";
            string ConnectionString = dt.Rows[0][0].ToString().Split("@")[1];

            sql = "select dnload_history_insert(@id)";
            dt = MainObj.Dbutil.Runsql(sql, new Dictionary<string, object>(){{"@id", id}});
            string version = dt.Rows[0][0].ToString();
            sql = $"select card_number from blacklist order by card_number limit {id}";
            if (blacktype == "delta")
                sql = $"select card_number from blacklistdelta order by card_number limit {id}";
            dt = MainObj.Dbutil.Runsql(sql, Driver, ConnectionString);

            List<string> res = new List<string>() { "[HEADER]" };
            res.Add($"Дата={DateTime.Now.ToString("dd.MM.yyyy HH:mm:ss")}");
            res.Add(@"Поставщик=ГКУ ""Организатор перевозок""");
            res.Add($"Версия={version}");
            res.Add("");
            res.Add("[BLACKLISTBSK]");
            res.Add($"Data={id}");
            for (int i = 0; i < dt.Rows.Count; i++)
                res.Add($"{dt.Rows[i][0]}");

            string strres = string.Join("\r\n", res);    

            byte[] buf = Encoding.GetEncoding("windows-1251").GetBytes(strres);
            return File(buf, ctype, filename);
        }
    }
}