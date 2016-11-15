using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Demo_Web_Mvc.Models;
using Demo_Web_Mvc.Areas.Admin.Fitters_Ad;
namespace Demo_Web_Mvc.Areas.Admin.Controllers
{
     [CheckAdmin]
    public class NhaSanXuatADController : Controller
    {
        //
        // GET: /Admin/NhaSanXuatAD/

        public ActionResult Index()
        {
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                List<NHASANXUAT> list = ql.NHASANXUATs.ToList();
                return View(list);
            }
            
        }
        [HttpPost]
        //
        // post: /Admin/NhaSanXuatAD/ThemNhaSanXuatAD
        public ActionResult ThemNhaSanXuatAD(string ten)
        {
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                NHASANXUAT nhasanxuat = new NHASANXUAT()
                {
                    TENNSX = ten,
                };
                ql.NHASANXUATs.Add(nhasanxuat);
                ql.SaveChanges();
                return Json(new { status = true });
            }
        }
        [HttpPost]
        //
        // post: /Admin/NhaSanXuatAD/ XoaNhaSanXuatAD
        public ActionResult XoaNhaSanXuatAD(int manhasanxuat)
        {
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                NHASANXUAT nsx = ql.NHASANXUATs.Where(p => p.MANSX == manhasanxuat).FirstOrDefault();
                ql.NHASANXUATs.Remove(nsx);
                ql.SaveChanges();
                return Json(new { status = true });
            }
        }
        [HttpPost]
        //
        // post: /Admin/NhaSanXuatAD/UpDateNhaSanXuatAD
        public ActionResult UpDateNhaSanXuatAD(int ma, string ten)
        {
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                NHASANXUAT nsx = ql.NHASANXUATs.Where(p => p.MANSX == ma).FirstOrDefault();
                nsx.TENNSX = ten;
                ql.SaveChanges();
                return Json(new { status = true });
            }
        }
        [HttpPost]
        public ActionResult LoadNhaSanXuat(int ma)
        {
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                var nhasanxuat = ql.NHASANXUATs.Where(c => c.MANSX == ma).Select(c => new { c.MANSX , c.TENNSX}).FirstOrDefault();
                return Json(nhasanxuat, JsonRequestBehavior.AllowGet);
            }
        }
    }
}
