using Demo_Web_Mvc.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Demo_Web_Mvc.Models
{
    public class CartItemModels
    {
        public CartItem Item { get; set; }
        public SANPHAM sp { get; set; }
        public SANPHAMCHITIET spct { get; set; }
    }
}