using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Demo_Web_Mvc.Models;
namespace Demo_Web_Mvc.Controllers
{
    public class DonHangController : Controller
    {
        //
        // GET: /DonHang/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ThongTinDonHang(int id)
        {
                using (DAMobileEntities ql = new DAMobileEntities())
                {
                    var list = ql.DONHANGs
                               .Where(p => p.MAKH == id && p.ThanhToan == 1)
                               .Select(p => new
                               {
                                   p.MaDH,
                                   p.MAKH,
                                   p.NgayNhap,
                                   p.TongTien
                               })
                               .OrderBy(p => p.MaDH).ToArray()
                               .Select(p => new { p.MaDH, p.MAKH, ngaynhap = string.Format("{0:d/M/yyyy HH:mm:ss}", p.NgayNhap), tongtien = string.Format("{0:N0},000 đ", p.TongTien) }).ToList();
                    return Json(list, JsonRequestBehavior.AllowGet);
                }
                
        }

        public ActionResult ThongTinDonHangChiTiet(int id)
        {
            using(DAMobileEntities ql = new DAMobileEntities())
            {
                var list = ql.DONHANGCHITIETs.Include("SANPHAM")
                    .Where(p => p.MaDH == id)
                    .Select(p => new
                    {
                        p.MaDH,
                        p.MaSP,
                        p.SoLuong,
                        p.TongTien,
                        p.SANPHAM.TENSP,
                        p.SANPHAM.Link,
                    })
                    .OrderBy(p => p.TongTien).ToArray()
                    .Select(p => new { p.MaDH, p.MaSP,p.SoLuong, tongtien = string.Format("{0:N0},000 đ", p.TongTien),p.TENSP ,p.Link}).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
        }

    }
}
