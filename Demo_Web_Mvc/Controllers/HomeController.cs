using Demo_Web_Mvc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Demo_Web_Mvc.Controllers
{
    public class HomeController : Controller
    {
        
        // GET: /Home/
        public ActionResult Index(int?id)
        {
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                var model = ql.SANPHAMs.OrderByDescending(p=>p.Ngay).Take(10).ToList();
                ViewBag.MaxNgay = model.Max(p=>p.MASP);
                return View(model);
            }
            
        }
    }
}
