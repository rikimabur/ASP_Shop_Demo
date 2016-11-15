using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Demo_Web_Mvc.Models;
using System.IO;
using Demo_Web_Mvc.Areas.Admin.Models;
using Demo_Web_Mvc.Areas.Admin.Fitters_Ad;
namespace Demo_Web_Mvc.Areas.Admin.Controllers
{
     [CheckAdmin]
    public class SanPhamADController : Controller
    {
        //
        // GET: /Admin/SanPham/SanPhamALL
        public ActionResult SanPhamALLAD(int? id,int curPage = 1)
        {
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
                        nsx = sp.NHASANXUAT,
                        tensp = sp.TENSP,
                        linkanh = sp.Link,
                        gia = (double)ct.Gia,
                        manhinh = ct.ManHinh,
                        hdh = ct.HeDieuHanh,
                        cpu = ct.CPU,
                        camsau = ct.CamSau,
                        sim = ct.TheSim,
                        pin = ct.DungLuongPin,
                        soluong = (int)ct.Soluong,
                    });

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
                    .OrderBy(p => p.spid)
                    .Skip(nSkip).Take(20)
                    .ToList();
                return View(list);
            }

        }
        // GET: /Admin/SanPham/SanPhamDangDung
        //public ActionResult SanPhamDangDung(int? id, int curPage = 1)
        //{
        //    using (DAMobileEntities ql = new DAMobileEntities())
        //    {
        //        var query = ql.SANPHAMs.
        //            Join(ql.SANPHAMCHITIETs,
        //            sp => sp.MASP,
        //            ct => ct.MASP,
        //            (sp, ct) => new SP_CTModel
        //            {
        //                TLid = (int)sp.MATHELOAI,
        //                spid = sp.MASP,
        //                bixoa = (int)sp.bixoa,
        //                nsx_id = (int)sp.MANHASANXUAT,
        //                nsx = sp.NHASANXUAT,
        //                tensp = sp.TENSP,
        //                linkanh = sp.Link,
        //                gia = (double)ct.Gia,
        //                manhinh = ct.ManHinh,
        //                hdh = ct.HeDieuHanh,
        //                cpu = ct.CPU,
        //                camsau = ct.CamSau,
        //                sim = ct.TheSim,
        //                pin = ct.DungLuongPin,
        //                tl = sp.THELOAI,
        //                soluong =(int)ct.Soluong,
        //            }).Where(p=>p.bixoa == 0);

        //        int n = query.Count();
        //        ViewBag.SoSp = n;
        //        int nPages = n / 20;

        //        if (n % 30 > 0)
        //        {
        //            nPages++;
        //            ViewBag.NextCuoi = n / 20 + 1;
        //        }
        //        ViewBag.Pages = nPages;
        //        ViewBag.curPage = curPage;
        //        // neu trang = 1 thi k cho 
        //        if (curPage == 1)
        //        {
        //            ViewBag.PrevPage = 1;
        //        }
        //        else
        //        {
        //            ViewBag.PrevPage = curPage - 1;
        //        }
        //        ViewBag.NextPage = curPage + 1;
        //        int nSkip = (curPage - 1) * 20;
        //        var list = query
        //            .OrderBy(p => p.spid)
        //            .Skip(nSkip).Take(20)
        //            .ToList();
        //        return View(list);
        //    }
        //}
        public ActionResult SanPhamDangDung(int? id, int curPage = 1)
        {
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
                        nsx = sp.NHASANXUAT,
                        tensp = sp.TENSP,
                        linkanh = sp.Link,
                        gia = (double)ct.Gia,
                        manhinh = ct.ManHinh,
                        hdh = ct.HeDieuHanh,
                        cpu = ct.CPU,
                        camsau = ct.CamSau,
                        sim = ct.TheSim,
                        pin = ct.DungLuongPin,
                        soluong = (int)ct.Soluong,
                    }).Where(p => p.bixoa == 0);

                int n = query.Count();
                ViewBag.SoSp = n;
                return View(query.ToList());
            }
        }
        // GET: /Admin/SanPham/SanPhamBiXoa
        //public ActionResult SanPhamBiXoa(int? id, int curPage = 1)
        //{
        //    using (DAMobileEntities ql = new DAMobileEntities())
        //    {
        //        var query = ql.SANPHAMs.
        //            Join(ql.SANPHAMCHITIETs,
        //            sp => sp.MASP,
        //            ct => ct.MASP,
        //            (sp, ct) => new SP_CTModel
        //            {
        //                TLid = (int)sp.MATHELOAI,
        //                spid = sp.MASP,
        //                bixoa = (int)sp.bixoa,
        //                nsx_id = (int)sp.MANHASANXUAT,
        //                nsx = sp.NHASANXUAT,
        //                tensp = sp.TENSP,
        //                linkanh = sp.Link,
        //                gia = (double)ct.Gia,
        //                manhinh = ct.ManHinh,
        //                hdh = ct.HeDieuHanh,
        //                cpu = ct.CPU,
        //                camsau = ct.CamSau,
        //                sim = ct.TheSim,
        //                pin = ct.DungLuongPin,
        //                tl = sp.THELOAI
        //            }).Where(p => p.bixoa == 1);

        //        int n = query.Count();
        //        ViewBag.SoSp = n;
        //        int nPages = n / 20;

        //        if (n % 30 > 0)
        //        {
        //            nPages++;
        //            ViewBag.NextCuoi = n / 20 + 1;
        //        }
        //        ViewBag.Pages = nPages;
        //        ViewBag.curPage = curPage;
        //        // neu trang = 1 thi k cho 
        //        if (curPage == 1)
        //        {
        //            ViewBag.PrevPage = 1;
        //        }
        //        else
        //        {
        //            ViewBag.PrevPage = curPage - 1;
        //        }
        //        ViewBag.NextPage = curPage + 1;
        //        int nSkip = (curPage - 1) * 20;
        //        var list = query
        //            .OrderBy(p => p.spid)
        //            .Skip(nSkip).Take(20)
        //            .ToList();
        //        return View(list);
        //    }
        //}
        //
        public ActionResult SanPhamBiXoa(int? id)
        {
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
                        nsx = sp.NHASANXUAT,
                        tensp = sp.TENSP,
                        linkanh = sp.Link,
                        gia = (double)ct.Gia,
                        manhinh = ct.ManHinh,
                        hdh = ct.HeDieuHanh,
                        cpu = ct.CPU,
                        camsau = ct.CamSau,
                        sim = ct.TheSim,
                        pin = ct.DungLuongPin,
                   
                    }).Where(p => p.bixoa == 1);

                int n = query.Count();
                ViewBag.SoSp = n;
                return View(query.ToList());
            }
        }
        // get/sanphamad/ChiTietSanPhamAD
        //[HttpGet]
        //public ActionResult ChiTietSanPhamAD()
        //{

        //}
        //
        //get/sanphamad/Updata_BiXoa
        [HttpGet]
        public ActionResult Updata_BiXoa(int masp)
        {
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                SANPHAM sp = ql.SANPHAMs.First(p => p.MASP == masp);
                sp.bixoa = 0;
                ql.SaveChanges();
                return RedirectToAction("SanPhamBiXoa", "SanPhamAD", new { Area = "Admin" });
            }
        }
        //
        //get/sanphamad/Delete_SP
        [HttpGet]
        //public ActionResult Delete_SP(int masp, int tranghientai)
        //{
        //    using (DAMobileEntities ql = new DAMobileEntities())
        //    {
        //        SANPHAM sp = ql.SANPHAMs.First(p => p.MASP == masp);
        //        sp.bixoa = 1;
        //        ql.SaveChanges();
        //        return RedirectToAction("SanPhamDangDung", "SanPhamAD", new { curPage = tranghientai, Area = "Admin" });
        //    }
        //}
        public ActionResult Delete_SP(int masp)
        {
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                SANPHAM sp = ql.SANPHAMs.First(p => p.MASP == masp);
                sp.bixoa = 1;
                ql.SaveChanges();
                return RedirectToAction("SanPhamDangDung", "SanPhamAD", new { Area = "Admin" });
            }
        }
        //
        //get/sanphamad/chitiet
        [HttpGet]
        public ActionResult ChitietSanPham(int masp, int bx)
        {
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
                        nsx = sp.NHASANXUAT,
                        tensp = sp.TENSP,
                        linkanh = sp.Link,
                        gia = (double)ct.Gia,
                        manhinh = ct.ManHinh,
                        hdh = ct.HeDieuHanh,
                        cpu = ct.CPU,
                        ram = ct.Ram,
                        bonhotrong= ct.BoNhoTrong,
                        camtruoc = ct.CamTruoc,
                        hotrothenho =ct.HoTroTheNho,
                        chucnangkhac = ct.ChucNangKhac,
                        camsau = ct.CamSau,
                        sim = ct.TheSim,
                        pin = ct.DungLuongPin,
                  
                    }).Where(p => p.bixoa == bx && p.spid == masp).FirstOrDefault();
                return View(query);
            }
        }
        // 
        // get/sanphamad/themmoi
        public ActionResult CreateSanPham()
        {
            using (var ql = new DAMobileEntities())
            {
                var list_nsx = ql.NHASANXUATs.ToList();
                var list_tl = ql.THELOAIs.ToList();
                ViewBag.Categories = list_tl;
                ViewBag.nhasanxuat_sp = list_nsx;
                return View() ;
            }
        }
        //

        //Post//sanphamad/CreateSanPham
        [HttpPost]
        public ActionResult CreateSanPham(SANPHAM sp, SANPHAMCHITIET spct, HttpPostedFileBase Link)
        {
            using (var ql = new DAMobileEntities())
            {
                sp.bixoa = 0;
                sp.SoLuotXem = 0;
                sp.Ngay = DateTime.Now;
                spct.SoLuongBan = 0;
                var list_nsx = ql.NHASANXUATs.ToList();
                var list_tl = ql.THELOAIs.ToList();
                ViewBag.Categories = list_tl;
                ViewBag.nhasanxuat_sp = list_nsx;
                ql.SANPHAMCHITIETs.Add(spct);
                ql.SANPHAMs.Add(sp);
                
                ql.SaveChanges();
                if (Link != null && Link.ContentLength > 0)
                {
                    // tao folder chua hinh [~/hinhanh/]
                    string spDirPath = Server.MapPath("~/hinhanh/sanpham");//tìm kiếm file hình ảnh trong thu mục gốc
                    string targetDirPath = Path.Combine(spDirPath, sp.MASP.ToString());
                    Directory.CreateDirectory(targetDirPath);
                    //copy hinh len
                    string mainFileName = Path.Combine(targetDirPath,"main.png" );
                    Link.SaveAs(mainFileName);
                }
                if (Link != null)
                {
                    sp.Link = "sanpham/" + sp.MASP.ToString() + "/main.png";
                }
                else
                {
                    sp.Link = "daidien.png";
                }
                ql.SaveChanges();
                return View();
              
            }
        }
        //
        //
        //get//sanphamad/EditSanPhamAD
        public ActionResult EditSanPhamAD(int masp)
        {
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
                        nsx = sp.NHASANXUAT,
                        tensp = sp.TENSP,
                        linkanh = sp.Link,
                        gia = (double)ct.Gia,
                        manhinh = ct.ManHinh,
                        hdh = ct.HeDieuHanh,
                        cpu = ct.CPU,
                        ram = ct.Ram,
                        bonhotrong = ct.BoNhoTrong,
                        camtruoc = ct.CamTruoc,
                        hotrothenho = ct.HoTroTheNho,
                        chucnangkhac = ct.ChucNangKhac,
                        camsau = ct.CamSau,
                        sim = ct.TheSim,
                        pin = ct.DungLuongPin,
                        soluong =(int)ct.Soluong,
                    }).Where(p => p.spid == masp).FirstOrDefault();
                var list_nsx = ql.NHASANXUATs.ToList();
                var list_tl = ql.THELOAIs.ToList();
                ViewBag.Categories = list_tl;
                ViewBag.nhasanxuat_sp = list_nsx;
                return View(query);
            }
        }
        //

        //Post//sanphamad/EditSanPhamAD
        [HttpPost]
        public ActionResult EditSanPhamAD(SanPham sp, HttpPostedFileBase LinkAnh)
        {
            using (var ql = new DAMobileEntities())
            {
                SANPHAMCHITIET spct = ql.SANPHAMCHITIETs.Where(p => p.MASP == sp.masp).FirstOrDefault();
                if(spct != null)
                {
                    spct.Gia = sp.Gia;
                    spct.Soluong = sp.Soluong;

                    spct.ManHinh = sp.ManHinh;
                    spct.HeDieuHanh = sp.HeDieuHanh;
                    spct.CamTruoc = sp.CamTruoc;
                    spct.CamSau = sp.CamSau;
                    spct.CPU = sp.CPU;
                    spct.Ram = sp.Ram;
                    spct.HoTroTheNho = sp.HoTroTheNho;
                    spct.TheSim = sp.TheSim;
                    spct.BoNhoTrong = sp.BoNhoTrong;
                    spct.DungLuongPin = sp.DungLuongPin;                       
                    spct.ChucNangKhac = sp.ChucNangKhac;
                }
                SANPHAM spad = ql.SANPHAMs.Where(p => p.MASP == sp.masp).FirstOrDefault();
                if(spad !=null)
                {
                    if (LinkAnh != null)
                    {
                        spad.Link = "sanpham/" + sp.masp.ToString() + "/main.png";
                    }
                    else
                    {
                        spad.Link = sp.Link;
                    }
                    if (LinkAnh != null && LinkAnh.ContentLength > 0)
                    {
                        // tao folder chua hinh [~/hinhanh/]
                        string spDirPath = Server.MapPath("~/hinhanh/sanpham");//tìm kiếm file hình ảnh trong thu mục gốc
                        string targetDirPath = Path.Combine(spDirPath, sp.masp.ToString());
                        Directory.CreateDirectory(targetDirPath);
                        //copy hinh len
                        string mainFileName = Path.Combine(targetDirPath, "main.png");
                        LinkAnh.SaveAs(mainFileName);
                    }
                    spad.TENSP = sp.TENSP;
                    spad.MATHELOAI = sp.MATHELOAI;
                    spad.MANHASANXUAT = sp.MANHASANXUAT;
                }
                ql.SaveChanges();
                return RedirectToAction("SanPhamDangDung", "SanPhamAD", new { Area = "Admin" });

            }
        }
    }
}
