using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Demo_Web_Mvc.Models;
namespace Demo_Web_Mvc.Controllers
{
    public class NhaSanXuatController : Controller
    {
        //
        // GET: /NhaSanXuat/

        public ActionResult PartialNhaSanXuat()
        {
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                var list = ql.NHASANXUATs.ToList();
                return PartialView(list);
            }
           
        }

    }
}
