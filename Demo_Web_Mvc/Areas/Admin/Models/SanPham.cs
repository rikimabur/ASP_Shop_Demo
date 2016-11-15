using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Demo_Web_Mvc.Areas.Admin.Models
{
    public class SanPham
    {
        public int masp { get; set; }
        public string TENSP { get; set; }
        public string Link { get; set; }
        public int MATHELOAI { get; set; }
        public int MANHASANXUAT { get; set; }
        public string ManHinh { get; set; }
        public string HeDieuHanh { get; set; }
        public string CamTruoc { get; set; }
        public string CamSau { get; set; }
        public string CPU { get; set; }
        public string Ram { get; set; }
        public string BoNhoTrong { get; set; }
        public string TheSim { get; set; }
        public string HoTroTheNho { get; set; }
        public string DungLuongPin { get; set; }
        public string ChucNangKhac { get; set; }
        public int Soluong { get; set; }
        public decimal Gia { get; set; }
    }
}