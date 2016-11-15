using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Demo_Web_Mvc.Models;

namespace Demo_Web_Mvc.Controllers
{
    public class TheLoaiController : Controller
    {
        //
        // GET: /TheLoai/

        public ActionResult PartialTheLoai()
        {
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                var list = ql.THELOAIs.ToList();
                return PartialView(list);
            }
            
        }

    }
}
