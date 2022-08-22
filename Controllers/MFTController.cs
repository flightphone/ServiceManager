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
        public ActionResult dnload(int id)
        {
            string filename = "BlackList.dat";
            string ctype = "application/octet-stream";
            string res = "Кодировка 1251";
            //byte[] buf = Encoding.UTF8.GetBytes(res);
            byte[] buf = Encoding.GetEncoding("windows-1251").GetBytes(res);
            return File(buf, ctype, filename);
            
                
        }
    }
}