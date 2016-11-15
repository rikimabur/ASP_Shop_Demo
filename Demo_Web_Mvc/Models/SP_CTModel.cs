using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Demo_Web_Mvc.Helpers;
namespace Demo_Web_Mvc.Models
{
    public class SP_CTModel
    {
        public int TLid { get; set; }
        public int spid {get;set;}
        public int nsx_id   {get;set;}
        public string tensp {get;set;}
        public Double gia   {get;set;}
        public DateTime ngay { get; set; }
        public string manhinh   {get;set;}
        public string hdh   {get;set;}
        public string cpu   {get;set;}
        public string camtruoc   {get;set;}
        public string camsau { get; set; } 
        public string sim   {get;set;}
        public string pin   {get;set;}
        public int SLXem {get; set;}
        public string bonhotrong { get; set; }
        public string ram { get; set; }
        public string hotrothenho { get; set; }
        public int soluong { get; set; }
        public int soluongban { get; set; }
        public int bixoa { get; set; }
        public string linkanh { get; set; }
        public string chucnangkhac { get; set; }
        public NHASANXUAT nsx { get; set; }
        public THELOAI tl { get; set; }
    }
}