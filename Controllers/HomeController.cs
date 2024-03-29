﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using ServiceManager.Models;

using System.Security.Claims;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using WpfBu.Models;
using System.Text;


namespace ServiceManager.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;


        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        [Authorize]
        public IActionResult Index(string id)
        {
            return View();
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        public ActionResult Login()
        {
            UserLogin ul = new UserLogin();
            return View(ul);
        }

        public ActionResult Confirm(string UserName)
        {
            UserLoginConfirm ul = new UserLoginConfirm();
            ul.UserName = UserName;
            return View("Confirm", ul);
        }


        [HttpPost]
        public async Task<ActionResult> Confirm(UserLoginConfirm model)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    int auth = MainObj.checkAuth(model.UserName, model.Password, true);
                    if (auth != 1)
                    {
                        ModelState.AddModelError("", "Ошибка доступа");
                        model.Error = "Ошибка доступа";
                        
                        return View("Confirm", model);
                    }
                    else
                    {
                        await Authenticate(model.UserName); // аутентификация
                        return Redirect(Url.Action("Index", "Home"));
                    }

                }
                else
                {
                    model.Error = string.Join(", ", ModelState.Values.SelectMany(v => v.Errors).Select(a => a.ErrorMessage));
                    return View("Confirm", model);
                }
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex.Message);
                model.Error = ex.Message;
                return View("Confirm", model);
            }


        }

        [HttpPost]
        public async Task<ActionResult> Login(UserLogin model, string returnUrl)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    int auth = MainObj.checkAuth(model.UserName, model.Password);
                    if (auth == 1)
                    {
                        await Authenticate(model.UserName); // аутентификация
                        return Redirect(returnUrl ?? Url.Action("Index", "Home"));
                    }
                    else
                    if (auth == -1)
                    {
                        ModelState.AddModelError("", "Неправильный логин или пароль");
                        model.Error = "Неправильный логин или пароль";
                        return View("Login", model);
                    }
                    else
                    {
                        return Redirect("Confirm?UserName=" + model.UserName);
                    }
                }
                else
                {
                    model.Error = string.Join(", ", ModelState.Values.SelectMany(v => v.Errors).Select(a => a.ErrorMessage));
                    return View("Login", model);
                }
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex.Message);
                model.Error = ex.Message;
                return View();
            }

        }

        public async Task<ActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return Redirect("~/Home/Login");
        }

        private async Task Authenticate(string userName)
        {

            // создаем один claim
            var claims = new List<Claim> {
                new Claim (ClaimsIdentity.DefaultNameClaimType, userName)
            };
            // создаем объект ClaimsIdentity
            ClaimsIdentity id = new ClaimsIdentity(claims, "ApplicationCookie",
            ClaimsIdentity.DefaultNameClaimType, ClaimsIdentity.DefaultRoleClaimType);
            // установка аутентификационных куки

            await HttpContext.SignInAsync("Cookies",
            new ClaimsPrincipal(id),
            new AuthenticationProperties  //запоминает пользователя
            {
                IsPersistent = true
            });

        }
    
        public ActionResult Dump()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Dump(string sqlstr)
        {
            DumpServ ds = new DumpServ();
            string res = ds.CreateDumpSQL(sqlstr);
            byte[] buf = Encoding.UTF8.GetBytes(res);
            return File(buf, "application/octet-stream", "dump.sql");
        }
    }
}
