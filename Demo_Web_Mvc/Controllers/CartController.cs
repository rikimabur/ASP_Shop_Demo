using Demo_Web_Mvc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Demo_Web_Mvc.Helpers;
using System.Web.Script.Serialization;
using Demo_Web_Mvc.Fitters;
namespace Demo_Web_Mvc.Controllers
{
    [CheckLogin]
    public class CartController : Controller
    {
        //
        // GET: /Cart/

        public ActionResult Index()
        {
            double total = 0 ;
            var cart = CurrentContext.Cart();
            var list = new List<CartItemModels>();
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                
                foreach (CartItem ci in cart.Items)
                {
                    var sanpham = ql.SANPHAMs
                        .Where(p => p.MASP == ci.MASP)
                        .FirstOrDefault();
                    var sanphamct = ql.SANPHAMCHITIETs
                        .Where(k => k.MASP == ci.MASP)
                        .FirstOrDefault();
                    var cim = new CartItemModels
                    {
                        Item = ci,
                        sp = sanpham,
                        spct = sanphamct
                    };
                    total += (double)sanphamct.Gia * ci.Quantity;
                    list.Add(cim);  
                }

            }
            ViewBag.Total = total;
            return View(list);
        }
        // 
        //Post: // cart/add
        [HttpPost]
        public ActionResult Add(CartItem item)
        {
           CurrentContext.Cart().Add(item);
           return RedirectToAction("SanPhamChiTiet", "SanPham", new { spid_x = item.MASP });
        }
        //
        //post/cart/AddSearch
        [HttpPost]
        public ActionResult AddSearch(CartItem item, int page,string namesearch)
        {
            CurrentContext.Cart().Add(item);
            return RedirectToAction("Search", "SanPham", new {
                txtkeyword = namesearch,
                curPage = page
            });
        }
        //
        //post/cart/AddSearch_gia
        [HttpPost]
        public ActionResult AddSearch_gia(CartItem item, string namesearch_gia)
        {
            CurrentContext.Cart().Add(item);
            return RedirectToAction("Search_Gia", "SanPham", new
            {
                p = namesearch_gia
            });
        }
        // 
        //Post: // cart/AddShowAllView
        [HttpPost] // ,
        public ActionResult AddShowAllView(CartItem item, int catId, int nsxId, int page)
        {

            if (nsxId == 0)
            {
                CurrentContext.Cart().Add(item);
                return RedirectToAction("ShowAll", "SanPham", new
                {
                    id = catId,
                    curPage = page
                });
            }
            else
            {
                CurrentContext.Cart().Add(item);
                return RedirectToAction("ShowAll", "SanPham", new
                {
                    id_nsx = nsxId,
                    curPage = page
                });
            }
            
        }
        //
        // post//cart/addcarthome
        [HttpPost] // ,
        public ActionResult AddCartHome(CartItem item)
        {
                CurrentContext.Cart().Add(item);
                return RedirectToAction("Index", "Home");
        }
        //
        //Post: // cart/UpdateItem
        [HttpPost]
        public ActionResult UpdateItem(int masp,int quantity)
        {
            
            CurrentContext.Cart().UpdateItem(masp,quantity);
            return RedirectToAction("Index", "Cart");
        }
        
        //post// cart//UpdateAll
        public JsonResult UpdateAll(string cartModel)
        {
            var car = new JavaScriptSerializer().Deserialize<List<CartItem>>(cartModel);// chuyển chuổi trong script thành list
            foreach (var item in car)
            {
                CurrentContext.Cart().UpdateItemAll(item);
            }
            return Json(new
            {
                status = true
            });
        }
        //
        //Post: /Cart/Checkout
        [HttpPost]
        public ActionResult Checkout()
        {
            DONHANG dh = new DONHANG
            {
                NgayNhap = DateTime.Now,
                MAKH = CurrentContext.CurUser().MaTK,
                ThanhToan = 1,
                TongTien = 0,
            };
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                decimal a = 0;
                foreach(CartItem item in CurrentContext.Cart().Items)
                {
                    SANPHAMCHITIET sp = ql.SANPHAMCHITIETs.Where(p=>p.MASP== item.MASP).FirstOrDefault();
                    if(sp!=null)
                    {
                        DONHANGCHITIET dhct = new DONHANGCHITIET
                        {
                            MaSP = item.MASP,
                            SoLuong=item.Quantity,
                            Gia = (decimal)sp.Gia ,
                            TongTien = item.Quantity * (decimal)sp.Gia,
                        };

                        a += dhct.TongTien ;
                        dh.DONHANGCHITIETs.Add(dhct);
                    }
                    sp.Soluong = sp.Soluong - item.Quantity;
                    sp.SoLuongBan = sp.SoLuongBan + item.Quantity;
                }
                dh.TongTien = a;
               
                ql.DONHANGs.Add(dh);
                
                ql.SaveChanges();
            }
            CurrentContext.Cart().Items.Clear();
            return RedirectToAction("Index", "Cart"); 
        }
        public ActionResult Add_ID(int id)
        {
            CurrentContext.Cart().Add(CurrentContext.Cart().Add_cart(id, 1));
            return Json(new
            {
                status = true
            });
        }
        //ajax cap nhat so luong
        //Post: // cart/RemoveItem
        [HttpPost]
        public ActionResult UpdateQuanity(int masp, int quantity)
        {
            int curent_sl = 0;
            double total = 0;
            string message ;
            string TongTien;
            double TongTien_ThanhToan = 0;
           
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                var cart = CurrentContext.Cart(); 
                var query = ql.SANPHAMCHITIETs.Where(sp => sp.MASP == masp).FirstOrDefault();
                if (query.Soluong < quantity)
                {
                    message = query.Soluong.ToString();
                    total = (double)query.Gia * (double)query.Soluong;
                    TongTien = string.Format("{0:N0},000 đ", total);
                    CurrentContext.Cart().UpdateItem(masp, (int)query.Soluong);
                    foreach (CartItem ci in cart.Items)
                    {
                        var sanpham = ql.SANPHAMs
                            .Where(p => p.MASP == ci.MASP)
                            .FirstOrDefault();
                        var sanphamct = ql.SANPHAMCHITIETs
                            .Where(k => k.MASP == ci.MASP)
                            .FirstOrDefault();
                        var cim = new CartItemModels
                        {
                            Item = ci,
                            sp = sanpham,
                            spct = sanphamct

                        };
                        TongTien_ThanhToan += (double)sanphamct.Gia * ci.Quantity;
                        curent_sl += ci.Quantity;
                    }
                    string TT_thanhtoan = string.Format("{0:N0},000 đ", TongTien_ThanhToan);
                    return Json(new { Status = 1, message, TongTien, curent_sl,TT_thanhtoan });
                }
                if (query != null)
                {
                    total = (double)query.Gia * quantity;
                    CurrentContext.Cart().UpdateItem(masp, quantity);
                    TongTien = string.Format("{0:N0},000 đ", total);
                    foreach (CartItem ci in cart.Items)
                    {
                        var sanpham = ql.SANPHAMs
                            .Where(p => p.MASP == ci.MASP)
                            .FirstOrDefault();
                        var sanphamct = ql.SANPHAMCHITIETs
                            .Where(k => k.MASP == ci.MASP)
                            .FirstOrDefault();
                        var cim = new CartItemModels
                        {
                            Item = ci,
                            sp = sanpham,
                            spct = sanphamct

                        };
                        TongTien_ThanhToan += (double)sanphamct.Gia * ci.Quantity;
                        curent_sl += ci.Quantity;
                    }
                    string TT_thanhtoan = string.Format("{0:N0},000 đ", TongTien_ThanhToan);
                    return Json(new { Status = 0, TongTien, curent_sl, TT_thanhtoan });
                }
                else
                {
                    return RedirectToAction("Index","Cart");
                }
                
            }
        }
        //ajax san pham vao don hang
        //Post: // cart/RemoveItem
        [HttpPost]
        public ActionResult RemoveItem(int id)
        {
            int curent_sl = 0;
            double TongTien_ThanhToan = 0;
            CurrentContext.Cart().RemoveItem(id);
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                var cart = CurrentContext.Cart();
                foreach (CartItem ci in cart.Items)
                {
                    var sanpham = ql.SANPHAMs
                        .Where(p => p.MASP == ci.MASP)
                        .FirstOrDefault();
                    var sanphamct = ql.SANPHAMCHITIETs
                        .Where(k => k.MASP == ci.MASP)
                        .FirstOrDefault();
                    var cim = new CartItemModels
                    {
                        Item = ci,
                        sp = sanpham,
                        spct = sanphamct

                    };
                    TongTien_ThanhToan += (double)sanphamct.Gia * ci.Quantity;
                    curent_sl += ci.Quantity;
                }
            }

            string TT_thanhtoan = string.Format("{0:N0},000 đ", TongTien_ThanhToan);
            return Json(new { status = true ,curent_sl,TT_thanhtoan});
            //return RedirectToAction("Index", "Cart");
        }
    }
}
