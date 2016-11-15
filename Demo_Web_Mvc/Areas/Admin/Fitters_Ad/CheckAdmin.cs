using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Demo_Web_Mvc.Helpers;
using Demo_Web_Mvc.Fitters;
using System.Web.Mvc;
namespace Demo_Web_Mvc.Areas.Admin.Fitters_Ad
{
    public class CheckAdminAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (CurrentContext.IsLogged() == false || CurrentContext.CurUser().MaTK != 15 && CurrentContext.IsLogged() == true)
            {
                filterContext.Result = new HttpUnauthorizedResult();// chuyen qua trang khong tim thay
                return;
            }
            base.OnActionExecuting(filterContext);
        }
        
    }
}