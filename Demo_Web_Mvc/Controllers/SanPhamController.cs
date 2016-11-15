using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Demo_Web_Mvc.Models;
using System.Data.Entity;
using Demo_Web_Mvc.Helpers;
namespace Demo_Web_Mvc.Controllers
{
    public class SanPhamController : Controller
    {
        //
        // GET: /SanPham/
        [HttpGet]

        public ActionResult ShowAll(int? id, int curPage = 1, int id_nsx = 0)
        {
            if (curPage < 1)
            {
                curPage = 1;
            }
            using (DAMobileEntities ql = new DAMobileEntities())
            {

                if (id == null)
                {
                    ViewBag.catId = 0;
                }
                else
                {
                    ViewBag.catId = id;// the loaik
                }
                ViewBag.nsxId = id_nsx;
                var query = ql.SANPHAMs.
                    Join(ql.SANPHAMCHITIETs,
                    sp => sp.MASP,
                    ct => ct.MASP,
                    (sp, ct) => new SP_CTModel
                    {
                        TLid = (int)sp.MATHELOAI,
                        spid = sp.MASP,
                        bixoa = (int)sp.bixoa,
                        nsx_id = (int)sp.MANHASANXUAT,
                        tensp = sp.TENSP,
                        linkanh = sp.Link,
                        gia = (double)ct.Gia,
                        manhinh = ct.ManHinh,
                        hdh = ct.HeDieuHanh,
                        cpu = ct.CPU,
                        camsau = ct.CamSau,
                        sim = ct.TheSim,
                        soluong = (int)ct.Soluong,
                        pin = ct.DungLuongPin,
                    }).Where(sp => sp.TLid == id | sp.nsx_id == id_nsx && sp.bixoa == 0);

                int n = query.Count();
                ViewBag.MaNhaSanXuat = id_nsx;
                int nPages = n / 12;

                if (n % 12 > 0)
                {
                    nPages++;
                    ViewBag.NextCuoi = n / 12 + 1;
                }
                ViewBag.Pages = nPages;
                ViewBag.curPage = curPage;
                // neu trang = 1 thi k cho 
                if (curPage < 1)
                {
                    ViewBag.PrevPage = 1;
                }
                else
                {
                    ViewBag.PrevPage = curPage - 1;
                }
                ViewBag.NextPage = curPage + 1;
                int nSkip = (curPage - 1) * 12;
                var list = query
                    .OrderBy(p => p.spid)
                    .Skip(nSkip).Take(12)
                    .ToList();
                return View(list);
                if (list.Count < 1)
                {
                    return RedirectToAction("Index", "Home");
                }
            }

        }
        //
        // GET: /SanPham/sanphamchitiet
        [HttpGet]
        public ActionResult SanPhamChiTiet(int? spid_x)
        {
            if (spid_x.HasValue == false)
            {
                return RedirectToAction("Index", "Home");
            }
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                SANPHAM sp_updata = ql.SANPHAMs.First(p => p.MASP == spid_x);
                sp_updata.SoLuotXem = sp_updata.SoLuotXem + 1;
                ql.SaveChanges();
                var model = ql.SANPHAMs.
                    Join(ql.SANPHAMCHITIETs,
                    sp => sp.MASP,
                    ct => ct.MASP,
                    (sp, ct) => new SP_CTModel
                    {
                        TLid = (int)sp.MATHELOAI,
                        spid = sp.MASP,
                        nsx_id = (int)sp.MANHASANXUAT,
                        tensp = sp.TENSP,
                        linkanh = sp.Link,
                        SLXem = (int)sp.SoLuotXem,
                        ngay = (DateTime)sp.Ngay,
                        gia = (double)ct.Gia,
                        manhinh = ct.ManHinh,
                        hdh = ct.HeDieuHanh,
                        cpu = ct.CPU,
                        camsau = ct.CamSau,
                        sim = ct.TheSim,
                        pin = ct.DungLuongPin,
                        camtruoc = ct.CamTruoc,
                        bonhotrong = ct.BoNhoTrong,
                        chucnangkhac = ct.ChucNangKhac,
                        ram = ct.Ram,
                        soluong = (int)ct.Soluong,
                        hotrothenho = ct.HoTroTheNho
                    }).Where(a => a.spid == spid_x ).FirstOrDefault();
                return View(model);
            }
        }
        //
        // get /sanpham/sanphamcungloai
        public ActionResult PartialSanPhamCungLoai(int masp,int giasp, int theloaiId)
        {
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                var model = ql.SANPHAMs.
                   Join(ql.SANPHAMCHITIETs,
                   sp => sp.MASP,
                   ct => ct.MASP,
                   (sp, ct) => new SP_CTModel
                   {
                       TLid = (int)sp.MATHELOAI,
                       spid = sp.MASP,
                       nsx_id = (int)sp.MANHASANXUAT,
                       tensp = sp.TENSP,
                       linkanh = sp.Link,
                       SLXem = (int)sp.SoLuotXem,
                       ngay = (DateTime)sp.Ngay,
                       gia = (double)ct.Gia,
                       bixoa = (int)sp.bixoa,
                       manhinh = ct.ManHinh,
                       hdh = ct.HeDieuHanh,
                       cpu = ct.CPU,
                       camsau = ct.CamSau,
                       sim = ct.TheSim,
                       pin = ct.DungLuongPin,
                       camtruoc = ct.CamTruoc,
                       bonhotrong = ct.BoNhoTrong,
                       chucnangkhac = ct.ChucNangKhac,
                       ram = ct.Ram,
                       hotrothenho = ct.HoTroTheNho
                   }).Where(p => p.TLid == theloaiId && p.gia <= giasp && p.spid != masp && p.bixoa == 0 )
                   .OrderByDescending(i => i.gia).Take(4).ToList();
                return PartialView(model);
            }
        }
        //
        // get /sanpham/sanphamcungnhasanxuat
        public ActionResult PartialSanPhamCungNhaSanXuat(int masp, int nsx_sp)
        {
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                var model = ql.SANPHAMs.
                   Join(ql.SANPHAMCHITIETs,
                   sp => sp.MASP,
                   ct => ct.MASP,
                   (sp, ct) => new SP_CTModel
                   {
                       TLid = (int)sp.MATHELOAI,
                       spid = sp.MASP,
                       nsx_id = (int)sp.MANHASANXUAT,
                       tensp = sp.TENSP,
                       linkanh = sp.Link,
                       SLXem = (int)sp.SoLuotXem,
                       ngay = (DateTime)sp.Ngay,
                       gia = (double)ct.Gia,
                       bixoa = (int)sp.bixoa,
                       manhinh = ct.ManHinh,
                       hdh = ct.HeDieuHanh,
                       cpu = ct.CPU,
                       camsau = ct.CamSau,
                       sim = ct.TheSim,
                       pin = ct.DungLuongPin,
                       camtruoc = ct.CamTruoc,
                       bonhotrong = ct.BoNhoTrong,
                       chucnangkhac = ct.ChucNangKhac,
                       ram = ct.Ram,
                       hotrothenho = ct.HoTroTheNho
                   }).Where(p => p.nsx_id == nsx_sp && p.spid != masp && p.bixoa == 0).Take(4).ToList();
                return PartialView(model);
            }
        }
        //
        //get/sanpham/PartialChaySanPham
        public ActionResult PartialChaySanPham()
        {
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                var list = ql.SANPHAMs.Where(p=>p.bixoa==0).OrderByDescending(sp => sp.MASP).Take(3).ToList();
                ViewBag.Max = list.Max(p => p.MASP);
                int a = list.Max(i=>i.MASP);
                return PartialView(list);
            }
        }
       /// 
        // 
        //Get//SanPham/SanPhamMoi partial
        public ActionResult PartialSanPhamMoi() // theo ngay
        {
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                var model = ql.SANPHAMs.
                  Join(ql.SANPHAMCHITIETs,
                  sp => sp.MASP,
                  ct => ct.MASP,
                  (sp, ct) => new SP_CTModel
                  {
                      TLid = (int)sp.MATHELOAI,
                      spid = sp.MASP,
                      nsx_id = (int)sp.MANHASANXUAT,
                      tensp = sp.TENSP,
                      SLXem = (int)sp.SoLuotXem,
                      ngay = (DateTime)sp.Ngay,
                      gia = (float)ct.Gia,
                      linkanh = sp.Link,
                      manhinh = ct.ManHinh,
                      hdh = ct.HeDieuHanh,
                      cpu = ct.CPU,
                      camsau = ct.CamSau,
                      sim = ct.TheSim,
                      pin = ct.DungLuongPin,
                      camtruoc = ct.CamTruoc,
                      bonhotrong = ct.BoNhoTrong,
                      chucnangkhac = ct.ChucNangKhac,
                      ram = ct.Ram,
                      hotrothenho = ct.HoTroTheNho,
                      soluong = (int)ct.Soluong,
                      bixoa = (int)sp.bixoa
                   }).Where(i=>i.bixoa==0).OrderByDescending(p => p.ngay).Take(8).ToList();
                return PartialView(model);
            }
        }
        //
          // get/ san pham//PartialSanPhamTheoSoLuotXem
          public ActionResult PartialSanPhamTheoSoLuotXem() // theo ngay
          {
              using (DAMobileEntities ql = new DAMobileEntities())
              {
                  var model = ql.SANPHAMs.
                     Join(ql.SANPHAMCHITIETs,
                     sp => sp.MASP,
                     ct => ct.MASP,
                     (sp, ct) => new SP_CTModel
                     {
                         TLid = (int)sp.MATHELOAI,
                         spid = sp.MASP,
                         nsx_id = (int)sp.MANHASANXUAT,
                         tensp = sp.TENSP,
                         SLXem = (int)sp.SoLuotXem,
                         ngay = (DateTime)sp.Ngay,
                         gia = (double)ct.Gia,
                         linkanh = sp.Link,
                         manhinh = ct.ManHinh,
                         hdh = ct.HeDieuHanh,
                         cpu = ct.CPU,
                         camsau = ct.CamSau,
                         sim = ct.TheSim,
                         pin = ct.DungLuongPin,
                         camtruoc = ct.CamTruoc,
                         bonhotrong = ct.BoNhoTrong,
                         chucnangkhac = ct.ChucNangKhac,
                         ram = ct.Ram,
                         hotrothenho = ct.HoTroTheNho,
                         soluong = (int)ct.Soluong,
                         bixoa =(int)sp.bixoa
                     }).Where(i=>i.bixoa == 0).OrderByDescending(p => p.SLXem).Take(8).ToList();
                  return PartialView(model);
              }
          }
        // get/sanpham/sanphambanchay
          public ActionResult PartialSanPhamBanChay()
          {
              using (DAMobileEntities ql = new DAMobileEntities())
              {
                  var model = ql.SANPHAMs.
                     Join(ql.SANPHAMCHITIETs,
                     sp => sp.MASP,
                     ct => ct.MASP,
                     (sp, ct) => new SP_CTModel
                     {
                         TLid = (int)sp.MATHELOAI,
                         spid = sp.MASP,
                         nsx_id = (int)sp.MANHASANXUAT,
                         tensp = sp.TENSP,
                         SLXem = (int)sp.SoLuotXem,
                         ngay = (DateTime)sp.Ngay,
                         gia = (double)ct.Gia,
                         manhinh = ct.ManHinh,
                         hdh = ct.HeDieuHanh,
                         cpu = ct.CPU,
                         camsau = ct.CamSau,
                         sim = ct.TheSim,
                         pin = ct.DungLuongPin,
                         camtruoc = ct.CamTruoc,
                         bonhotrong = ct.BoNhoTrong,
                         chucnangkhac = ct.ChucNangKhac,
                         ram = ct.Ram,
                         hotrothenho = ct.HoTroTheNho,
                         bixoa = (int)sp.bixoa,
                         soluong = (int )ct.Soluong,
                         soluongban = (int)ct.SoLuongBan,

                         linkanh =sp.Link,
                     }).Where(i=>i.bixoa==0).OrderByDescending(p => p.soluongban).Take(8).ToList();
                  return PartialView(model);
              }
          }

            // autocomplete Search 
          public JsonResult AutoCompleteSearch(string q)
          {
                  using (DAMobileEntities ql = new DAMobileEntities())
                  {
                      //var data = ql.SANPHAMs.
                      //    .Include(i=>i.SANPHAMCHITIETs)
                      //    .Where(x => x.TENSP.Contains(q))
                      //    .Select(x => new { x.TENSP, x.Link,x.SANPHAMCHITIETs.Select(a=>a.Gia).FirstOrDefault()})
                      //    .ToList();
                      var data = ql.SANPHAMs.Where(x => x.TENSP.Contains(q) && x.bixoa == 0).Select(x => new { x.TENSP,x.Link,x.MASP}).ToList();
                      return Json(new
                      {
                          data = data,
                          status = true,
                      }, JsonRequestBehavior.AllowGet);
                  }                         
          }
          //
          //get/SanPham/Search
          public ActionResult Search(string txtkeyword, int curPage = 1)
          {
              ViewBag.search = txtkeyword;
              using (DAMobileEntities ql = new DAMobileEntities())
              {
                  var query = ql.SANPHAMs.
                      Join(ql.SANPHAMCHITIETs,
                      sp => sp.MASP,
                      ct => ct.MASP,
                      (sp, ct) => new SP_CTModel
                      {
                          TLid = (int)sp.MATHELOAI,
                          spid = sp.MASP,
                          bixoa = (int)sp.bixoa,
                          nsx_id = (int)sp.MANHASANXUAT,
                          tensp = sp.TENSP,
                          linkanh = sp.Link,
                          gia = (double)ct.Gia,
                          manhinh = ct.ManHinh,
                          hdh = ct.HeDieuHanh,
                          cpu = ct.CPU,
                          camsau = ct.CamSau,
                          sim = ct.TheSim,
                          pin = ct.DungLuongPin,
                      }).Where(sp => sp.tensp == txtkeyword);
                  int n = query.Count();
                  if (n == 0)
                  {
                      query = ql.SANPHAMs.
                      Join(ql.SANPHAMCHITIETs,
                      sp => sp.MASP,
                      ct => ct.MASP,
                      (sp, ct) => new SP_CTModel
                      {
                          TLid = (int)sp.MATHELOAI,
                          spid = sp.MASP,
                          bixoa = (int)sp.bixoa,
                          nsx_id = (int)sp.MANHASANXUAT,
                          tensp = sp.TENSP,
                          linkanh = sp.Link,
                          gia = (double)ct.Gia,
                          manhinh = ct.ManHinh,
                          hdh = ct.HeDieuHanh,
                          cpu = ct.CPU,
                          camsau = ct.CamSau,
                          sim = ct.TheSim,
                          pin = ct.DungLuongPin,
                          nsx = sp.NHASANXUAT
                      }).Where(sp => sp.nsx.TENNSX == txtkeyword);
                      n = query.Count();
                  }
                  int nPages = n / 12;

                  if (n % 12 > 0)
                  {
                      nPages++;
                      ViewBag.NextCuoi = n / 12 + 1;
                  }
                  ViewBag.Pages = nPages;
                  ViewBag.curPage = curPage;
                  // neu trang = 1 thi k cho 
                  if (curPage < 1)
                  {
                      ViewBag.PrevPage = 1;
                  }
                  else
                  {
                      ViewBag.PrevPage = curPage - 1;
                  }
                  ViewBag.NextPage = curPage + 1;
                  int nSkip = (curPage - 1) * 12;
                  var list = query
                      .OrderBy(p => p.spid)
                      .Skip(nSkip).Take(12)
                      .ToList();
                  return View(list);
                  if (list.Count < 1)
                  {
                      return RedirectToAction("Index", "Home");
                  }
              }

          }
          // get
         //sanpham/search_gia
          public ActionResult Search_Gia(int p, int curPage = 1)
          {
              if (p == 0)
              {
                  return RedirectToAction("Index", "Home");
              }
              ViewBag.search_gia = p;
              if (p == 1)
              {
                  using (DAMobileEntities ql = new DAMobileEntities())
                  {
                      var model = ql.SANPHAMs.
                         Join(ql.SANPHAMCHITIETs,
                         sp => sp.MASP,
                         ct => ct.MASP,
                         (sp, ct) => new SP_CTModel
                         {
                             TLid = (int)sp.MATHELOAI,
                             spid = sp.MASP,
                             nsx_id = (int)sp.MANHASANXUAT,
                             tensp = sp.TENSP,
                             SLXem = (int)sp.SoLuotXem,
                             ngay = (DateTime)sp.Ngay,
                             gia = (double)ct.Gia,
                             manhinh = ct.ManHinh,
                             hdh = ct.HeDieuHanh,
                             cpu = ct.CPU,
                             camsau = ct.CamSau,
                             sim = ct.TheSim,
                             pin = ct.DungLuongPin,
                             camtruoc = ct.CamTruoc,
                             bonhotrong = ct.BoNhoTrong,
                             chucnangkhac = ct.ChucNangKhac,
                             ram = ct.Ram,
                             hotrothenho = ct.HoTroTheNho,
                             bixoa = (int)sp.bixoa,
                             soluong = (int)ct.Soluong,
                             soluongban = (int)ct.SoLuongBan,
                             linkanh = sp.Link,
                         }).Where(i => i.bixoa == 0 && i.gia <= 1000).OrderBy(q => q.spid).ToList();
                      return View(model);
                  }
              }
              if (p == 3)
              {
                  using (DAMobileEntities ql = new DAMobileEntities())
                  {
                      var model = ql.SANPHAMs.
                         Join(ql.SANPHAMCHITIETs,
                         sp => sp.MASP,
                         ct => ct.MASP,
                         (sp, ct) => new SP_CTModel
                         {
                             TLid = (int)sp.MATHELOAI,
                             spid = sp.MASP,
                             nsx_id = (int)sp.MANHASANXUAT,
                             tensp = sp.TENSP,
                             SLXem = (int)sp.SoLuotXem,
                             ngay = (DateTime)sp.Ngay,
                             gia = (double)ct.Gia,
                             manhinh = ct.ManHinh,
                             hdh = ct.HeDieuHanh,
                             cpu = ct.CPU,
                             camsau = ct.CamSau,
                             sim = ct.TheSim,
                             pin = ct.DungLuongPin,
                             camtruoc = ct.CamTruoc,
                             bonhotrong = ct.BoNhoTrong,
                             chucnangkhac = ct.ChucNangKhac,
                             ram = ct.Ram,
                             hotrothenho = ct.HoTroTheNho,
                             bixoa = (int)sp.bixoa,
                             soluong = (int)ct.Soluong,
                             soluongban = (int)ct.SoLuongBan,
                             linkanh = sp.Link,
                         }).Where(i => i.bixoa == 0 && i.gia <= 3000 && i.gia > 1000).OrderBy(q => q.spid).ToList();
                      return View(model);
                  }
              }
              if (p == 5)
              {
                  using (DAMobileEntities ql = new DAMobileEntities())
                  {
                      var model = ql.SANPHAMs.
                         Join(ql.SANPHAMCHITIETs,
                         sp => sp.MASP,
                         ct => ct.MASP,
                         (sp, ct) => new SP_CTModel
                         {
                             TLid = (int)sp.MATHELOAI,
                             spid = sp.MASP,
                             nsx_id = (int)sp.MANHASANXUAT,
                             tensp = sp.TENSP,
                             SLXem = (int)sp.SoLuotXem,
                             ngay = (DateTime)sp.Ngay,
                             gia = (double)ct.Gia,
                             manhinh = ct.ManHinh,
                             hdh = ct.HeDieuHanh,
                             cpu = ct.CPU,
                             camsau = ct.CamSau,
                             sim = ct.TheSim,
                             pin = ct.DungLuongPin,
                             camtruoc = ct.CamTruoc,
                             bonhotrong = ct.BoNhoTrong,
                             chucnangkhac = ct.ChucNangKhac,
                             ram = ct.Ram,
                             hotrothenho = ct.HoTroTheNho,
                             bixoa = (int)sp.bixoa,
                             soluong = (int)ct.Soluong,
                             soluongban = (int)ct.SoLuongBan,
                             linkanh = sp.Link,
                         }).Where(i => i.bixoa == 0 && i.gia <= 5000 && i.gia > 3000).OrderBy(q => q.spid).ToList();
                      return View(model);
                  }
              }
              if (p == 7)
              {
                  using (DAMobileEntities ql = new DAMobileEntities())
                  {
                      var model = ql.SANPHAMs.
                         Join(ql.SANPHAMCHITIETs,
                         sp => sp.MASP,
                         ct => ct.MASP,
                         (sp, ct) => new SP_CTModel
                         {
                             TLid = (int)sp.MATHELOAI,
                             spid = sp.MASP,
                             nsx_id = (int)sp.MANHASANXUAT,
                             tensp = sp.TENSP,
                             SLXem = (int)sp.SoLuotXem,
                             ngay = (DateTime)sp.Ngay,
                             gia = (double)ct.Gia,
                             manhinh = ct.ManHinh,
                             hdh = ct.HeDieuHanh,
                             cpu = ct.CPU,
                             camsau = ct.CamSau,
                             sim = ct.TheSim,
                             pin = ct.DungLuongPin,
                             camtruoc = ct.CamTruoc,
                             bonhotrong = ct.BoNhoTrong,
                             chucnangkhac = ct.ChucNangKhac,
                             ram = ct.Ram,
                             hotrothenho = ct.HoTroTheNho,
                             bixoa = (int)sp.bixoa,
                             soluong = (int)ct.Soluong,
                             soluongban = (int)ct.SoLuongBan,
                             linkanh = sp.Link,
                         }).Where(i => i.bixoa == 0 && i.gia <= 7000 && i.gia > 5000).OrderBy(q => q.spid).ToList();
                      return View(model);
                  }
              }
              if (p == 10)
              {
                  using (DAMobileEntities ql = new DAMobileEntities())
                  {
                      var model = ql.SANPHAMs.
                         Join(ql.SANPHAMCHITIETs,
                         sp => sp.MASP,
                         ct => ct.MASP,
                         (sp, ct) => new SP_CTModel
                         {
                             TLid = (int)sp.MATHELOAI,
                             spid = sp.MASP,
                             nsx_id = (int)sp.MANHASANXUAT,
                             tensp = sp.TENSP,
                             SLXem = (int)sp.SoLuotXem,
                             ngay = (DateTime)sp.Ngay,
                             gia = (double)ct.Gia,
                             manhinh = ct.ManHinh,
                             hdh = ct.HeDieuHanh,
                             cpu = ct.CPU,
                             camsau = ct.CamSau,
                             sim = ct.TheSim,
                             pin = ct.DungLuongPin,
                             camtruoc = ct.CamTruoc,
                             bonhotrong = ct.BoNhoTrong,
                             chucnangkhac = ct.ChucNangKhac,
                             ram = ct.Ram,
                             hotrothenho = ct.HoTroTheNho,
                             bixoa = (int)sp.bixoa,
                             soluong = (int)ct.Soluong,
                             soluongban = (int)ct.SoLuongBan,
                             linkanh = sp.Link,
                         }).Where(i => i.bixoa == 0 && i.gia <= 10000 && i.gia > 7000).OrderBy(q => q.spid).ToList();
                      return View(model);
                  }
              }
              if (p == 11)
              {
                  using (DAMobileEntities ql = new DAMobileEntities())
                  {
                      var model = ql.SANPHAMs.
                         Join(ql.SANPHAMCHITIETs,
                         sp => sp.MASP,
                         ct => ct.MASP,
                         (sp, ct) => new SP_CTModel
                         {
                             TLid = (int)sp.MATHELOAI,
                             spid = sp.MASP,
                             nsx_id = (int)sp.MANHASANXUAT,
                             tensp = sp.TENSP,
                             SLXem = (int)sp.SoLuotXem,
                             ngay = (DateTime)sp.Ngay,
                             gia = (double)ct.Gia,
                             manhinh = ct.ManHinh,
                             hdh = ct.HeDieuHanh,
                             cpu = ct.CPU,
                             camsau = ct.CamSau,
                             sim = ct.TheSim,
                             pin = ct.DungLuongPin,
                             camtruoc = ct.CamTruoc,
                             bonhotrong = ct.BoNhoTrong,
                             chucnangkhac = ct.ChucNangKhac,
                             ram = ct.Ram,
                             hotrothenho = ct.HoTroTheNho,
                             bixoa = (int)sp.bixoa,
                             soluong = (int)ct.Soluong,
                             soluongban = (int)ct.SoLuongBan,
                             linkanh = sp.Link,
                         }).Where(i => i.bixoa == 0 && i.gia > 10000).OrderBy(q => q.spid).ToList();
                      return View(model);
                  }
              }
              return RedirectToAction("index","Home");
          }

    }
}
