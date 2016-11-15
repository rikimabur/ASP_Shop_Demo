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
    public class TheLoaiADController : Controller
    {
        //
        // GET: /Admin/TheLoaiAD/

        public ActionResult Index()
        {
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                List<THELOAI> tl = ql.THELOAIs.ToList();
                return View(tl);
            }
            
        }
        [HttpPost]
        //
        // post: /Admin/TheLoaiAD/ThemTheLoaiAD
        public ActionResult ThemTheLoaiAD(string ten)
        {
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                THELOAI TheLoai = new THELOAI()
                {
                    TENTHELOAI = ten,
                };
                ql.THELOAIs.Add(TheLoai);
                ql.SaveChanges();
                return Json(new { status = true });
            }
        }
        [HttpPost]
        //
        // post: /Admin/TheLoaiAD/ XoaTheLoaiAD
        public ActionResult XoaTheLoaiAD(int maTheLoai)
        {
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                THELOAI tl= ql.THELOAIs.Where(p => p.MATL == maTheLoai).FirstOrDefault();
                ql.THELOAIs.Remove(tl);
                ql.SaveChanges();
                return Json(new { status = true });
            }
        }
        [HttpPost]
        //
        // post: /Admin/TheLoaiAD/UpDateTheLoaiAD
        public ActionResult UpDateTheLoaiAD(int ma, string ten)
        {
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                THELOAI tl = ql.THELOAIs.Where(p => p.MATL == ma).FirstOrDefault();
                tl.TENTHELOAI = ten;
                ql.SaveChanges();
                return Json(new { status = true });
            }
        }
    }
}
