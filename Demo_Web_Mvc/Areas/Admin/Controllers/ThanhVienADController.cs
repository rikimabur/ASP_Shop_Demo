using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Demo_Web_Mvc.Models;
using Demo_Web_Mvc.Helpers;
using Demo_Web_Mvc.Areas.Admin.Fitters_Ad;
namespace Demo_Web_Mvc.Areas.Admin.Controllers
{
     [CheckAdmin]
    public class ThanhVienADController : Controller
    {
        //
        // GET: /Admin/ThanhVienAD/

        public ActionResult Index()
        {
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                var list = ql.TAIKHOANs.Where(p=>p.MaTK != 15).ToList();
                return View(list);
            }
            
        }
        //
        //post/thanhvienad/deletethanhvien
        [HttpPost]
        public ActionResult DeleteThanhVien(int idmatk)
        {
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                TAIKHOAN tk = ql.TAIKHOANs.Where(p => p.MaTK == idmatk).FirstOrDefault();
                ql.TAIKHOANs.Remove(tk);
                ql.SaveChanges();
                return Json(new
                {
                  status = true
                });
            }
          
        }
        //
        //post/thanhvienad/ThayDoiPassAD
        [HttpPost]
        public ActionResult ThayDoiPassAD(Profile pr)
        {
            string message = "";
            using (DAMobileEntities ql = new DAMobileEntities())
            {
                string encPW = StringUtils.Md5(pr.Oldpass);
                TAIKHOAN tk = ql.TAIKHOANs.Where(p => p.MaTK == pr.MaTK).FirstOrDefault();
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
                return RedirectToAction("Index", "Home");
            }
        }

    }
}
