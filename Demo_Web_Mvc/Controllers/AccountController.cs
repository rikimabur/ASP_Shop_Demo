using System;
using System.Linq;
using System.Web.Mvc;
using Demo_Web_Mvc.Models;
using Demo_Web_Mvc.Helpers;
using BotDetect.Web.Mvc;
using System.Collections.Generic;
using Demo_Web_Mvc.Fitters;

namespace Demo_Web_Mvc.Controllers
{
    public class AccountController : Controller
    {
        //
        // GET: /Account/Login
        public ActionResult Login()
        {
            return View();
        }
        //
        // Post/Accout/Login
        [HttpPost]
        public ActionResult Login(LoginModel model)
        {
            using (DAMobileEntities ql = new DAMobileEntities())
            {
              string encPW = StringUtils.Md5(model.Mk);
              TAIKHOAN tk =  ql.TAIKHOANs.
                  Where(u => u.TenDangNhap == model.TenDN && u.MatKhau == encPW)
                  .FirstOrDefault();
                if(tk == null)
                {
                    ViewBag.Err = "Xin vui lòng kiểm tra lại thông tin đăng nhập!";
                    return View(model);
                }
                else
                {
                    Session["IsLogin"] = 1;
                    Session["CurUser"] = tk;
                    if(model.Remember)// khi đã đăng nhập
                    {

                        Response.Cookies["UserName"].Value = tk.TenDangNhap;
                        Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(1);
                    }
                    if(tk.TenDangNhap == "admin")
                    {
                        return RedirectToAction("Index", "HomeAD", new { Area = "Admin" }); 
                    }
                    else
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }
            }
            
        }
        //
        // GET: /Account/Register
        public ActionResult Register()
        {
            return View();
        }
        //
        // Post: /Account/Register
        [HttpPost]
        [CaptchaValidation("CaptchaCode", "ExampleCaptcha")]
        public ActionResult Register(RegisterModel model)
        {
            if (ModelState.IsValid == false)
            {
                ViewBag.Error ="Error Captcha";
                return View(model);
            }
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                int n = ql.TAIKHOANs
                    .Where(us => us.TenDangNhap == model.Ten)
                    .Count();
                if (n == 1)
                {
                    ViewBag.Error = model.Ten + " đã có trong hệ thống";
                    return View(model);
                }
            }
            ViewBag.TenDangNhap = model.Ten;
            TAIKHOAN tk = new TAIKHOAN
            {
                TenDangNhap = model.Ten,
                MatKhau = StringUtils.Md5(model.MK),
                Email = model.Email,
                HoTen = model.FullName,
                NgaySinh = DateTime.ParseExact(model.DOB, "d/M/yyyy", null)            
            };
            using (DAMobileEntities ctx = new DAMobileEntities())
            {
                
                ctx.TAIKHOANs.Add(tk);
                ctx.SaveChanges();
                ModelState.Clear();
            }

            return RedirectToAction("Login", "Account");
        }
        //
        // Post: /Account/LogOut
        [HttpPost]
        public ActionResult LogOut()
        {
            CurrentContext.Destroy();
            return RedirectToAction("Index", "Home");
        }
        //
        //Get: /Account/profile
        [CheckLogin]
        public ActionResult Profile()
        {
            using (DAMobileEntities ql = new DAMobileEntities())
                {
                    TAIKHOAN tk = CurrentContext.CurUser();
                    string ten =  tk.TenDangNhap;
                    var model = ql.TAIKHOANs.Where(p => p.TenDangNhap == ten).FirstOrDefault();
                    return View(model);
                }            
        }
        //
        //Get: /Account/profilepass
        [CheckLogin]
        [HttpPost]
        public ActionResult profilepass(Profile pr)
        {
            string message = "";
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                  string encPW = StringUtils.Md5(pr.Oldpass);
                  TAIKHOAN tk = ql.TAIKHOANs.Where(p=>p.MaTK == pr.MaTK).FirstOrDefault();
                  if (tk.MatKhau == encPW)
                  {
                      tk.MatKhau = StringUtils.Md5(pr.NewPass).ToString();
                      ql.SaveChanges();
                      message = "Đổi mật khẩu thành công!";
                  }
                  else
                  {
                      message = "Xin kiểm tra lại mật khẩu cũ!";
                  }   
            }
            if (Request.IsAjaxRequest())
            {
                return new JsonResult { Data = message, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
            }
            else
            {
                return RedirectToAction("Index","Home");
            }
        }
    }
}
