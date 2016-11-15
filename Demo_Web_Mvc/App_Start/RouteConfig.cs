using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Demo_Web_Mvc
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            // BotDetect requests must not be routed
            routes.IgnoreRoute("{*botdetect}", new { botdetect = @"(.*)BotDetectCaptcha\.ashx" });
            //routes.MapRoute(
            //    name: "Default",
            //    url: "{controller}/{action}/{id}",
            //    defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            //);
            routes.MapRoute(
            "Default",
            "{controller}/{action}/{id}",
            new { controller = "Home", action = "Index", id = UrlParameter.Optional },
            new[] { "Demo_Web_Mvc.Areas.Admin.Controllers" }
        );
          routes.MapRoute(
          name: "duoi-1-trieu",
          url: "Search_Gia/SanPham/{p}",
          defaults: new { controller = "SanPham", action = "Search_Gia", id = UrlParameter.Optional },
          namespaces: new[] { "Demo_Web_Mvc.Areas.Admin.Controllers" }
          );
        }
    }
}