using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Demo_Web_Mvc.Areas.Admin.Fitters_Ad;
namespace Demo_Web_Mvc.Areas.Admin.Controllers
{
    [CheckAdmin]
    public class HomeADController : Controller
    {
        //
        // GET: /Admin/Home/
        public ActionResult Index()
        {
            return View();
        }

    }
}
