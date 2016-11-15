using Demo_Web_Mvc.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Demo_Web_Mvc.Areas.Admin.Controllers
{
    public class AccoutADController : Controller
    {
        //
        // GET: /Admin/AccoutAD/

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LogOutAD()
        {
            CurrentContext.Destroy();
            return RedirectToAction("Login", "Account");
        }
    }
}
