using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Demo_Web_Mvc.Models;
using Demo_Web_Mvc.Fitters;
using Demo_Web_Mvc.Areas.Admin.Fitters_Ad;
namespace Demo_Web_Mvc.Areas.Admin.Controllers
{
    [CheckAdmin]
    public class DonHangADController : Controller
    {
        //
        // GET: /Admin/DonHang/
        public ActionResult Index(int? id, int curPage = 1)
        {
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                var query = ql.DONHANGs
                    .Include("TAIKHOAN")
                    .Where(p=>p.ThanhToan == 0 );
                int n = query.Count();
                ViewBag.SoSp = n;
                int nPages = n / 20;

                if (n % 30 > 0)
                {
                    nPages++;
                    ViewBag.NextCuoi = n / 20 + 1;
                }
                ViewBag.Pages = nPages;
                ViewBag.curPage = curPage;
                // neu trang = 1 thi k cho 
                if (curPage == 1)
                {
                    ViewBag.PrevPage = 1;
                }
                else
                {
                    ViewBag.PrevPage = curPage - 1;
                }
                ViewBag.NextPage = curPage + 1;
                int nSkip = (curPage - 1) * 20;
                var list = query
                    .OrderBy(p => p.MaDH)
                    .Skip(nSkip).Take(20)
                    .ToList();
                return View(list);
            }
            
        }
        //
        // GET: /Admin/DonHang/DHChuaXacNhan
        public ActionResult DHChuaXacNhan(int? id, int curPage = 1)
        {
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                var query = ql.DONHANGs
                    .Include("TAIKHOAN")
                    .Where(p => p.ThanhToan == 1);
                int n = query.Count();
                ViewBag.SoSp = n;
                int nPages = n / 20;

                if (n % 30 > 0)
                {
                    nPages++;
                    ViewBag.NextCuoi = n / 20 + 1;
                }
                ViewBag.Pages = nPages;
                ViewBag.curPage = curPage;
                // neu trang = 1 thi k cho 
                if (curPage == 1)
                {
                    ViewBag.PrevPage = 1;
                }
                else
                {
                    ViewBag.PrevPage = curPage - 1;
                }
                ViewBag.NextPage = curPage + 1;
                int nSkip = (curPage - 1) * 20;
                var list = query
                    .OrderBy(p => p.MaDH)
                    .Skip(nSkip).Take(20)
                    .ToList();
                return View(list);
            }

        }
        //
        // GET: /Admin/DonHang/ChiTietDonHangAD
        public ActionResult ChiTietDonHangAD(int dhid)
        {
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                var query = ql.DONHANGCHITIETs
                    .Include("SANPHAM")
                    .Where(p=>p.MaDH ==dhid).ToList();
                return View(query );
            }

        }
        //
        // GET: /Admin/DonHang/ThanhToanAD
        public ActionResult ThanhToanAD(int dhid)
        {
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                var query = ql.DONHANGs.Where(p => p.MaDH == dhid).FirstOrDefault();
                query.ThanhToan = 0;
                ql.SaveChanges();
            }
            return RedirectToAction("DHChuaXacNhan", "DonHangAD", new { Area = "Admin" });

        }
        //
        // post://Admin/DonHang/Delete
        [HttpPost]
        public ActionResult DeleteDH(int dhid)
        {
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                ql.DONHANGCHITIETs.Where(p => p.MaDH == dhid).ToList().ForEach(p=>ql.DONHANGCHITIETs.Remove(p));
                DONHANG dh = ql.DONHANGs.Where(p => p.MaDH == dhid).FirstOrDefault();
                ql.DONHANGs.Remove(dh);
                if (dh != null)
                {
                    ql.SaveChanges();
                }
            }
            return Json(new
            {
                status = true
            });
            
        }
    }
}
