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
    public class FileLoadController : Controller
    {
        public ActionResult dnload(int fh_pk)
        {
            try
            {
                string sql = "select * from fileh where fh_pk = @fh_pk";
                DataTable res = MainObj.Dbutil.Runsql(sql, new Dictionary<string, object>() { { "@fh_pk", fh_pk } });
                string fh_name = res.Rows[0]["fh_name"].ToString();
                string fh_sysname = res.Rows[0]["fh_sysname"].ToString();
                string path = $"./dnloads/{fh_sysname}";
                FileInfo fi = new FileInfo(path);
                path = fi.FullName;
                string ctype = "application/octet-stream";
                return PhysicalFile(path, ctype, fh_name);
            }
            catch (Exception e)
            {
                return Json(new { Error = e.Message });
            }
        }

        public JsonResult upload(List<IFormFile> files)
        {
            try
            {
                if (files == null)
                    return Json(new { Error = $"Не указаны файлы" });
                IFormFile file = files[0];
                string fh_name = file.FileName;
                string fh_sysname = Guid.NewGuid().ToString();
                DataTable res = MainObj.Dbutil.CommandBuild(new Dictionary<string, object>() {
                {"fh_pk", ""},
                {"fh_name", fh_name},
                {"fh_sysname", fh_sysname}
                }, "p_fileh_edit", MainObj.Driver, MainObj.ConnectionString);

                if (!Directory.Exists("./dnloads"))
                {
                    Directory.CreateDirectory("./dnloads");
                }

                int n = (int)file.Length;
                byte[] buf = new byte[n];
                Stream ms = file.OpenReadStream();
                ms.Read(buf, 0, n);
                string path = $"./dnloads/{fh_sysname}";
                System.IO.File.WriteAllBytes(path, buf);
                return Json(new { fh_pk = res.Rows[0]["fh_pk"] });
            }
            catch (Exception e)
            {
                return Json(new { Error = e.Message });
            }

        }
    }
}