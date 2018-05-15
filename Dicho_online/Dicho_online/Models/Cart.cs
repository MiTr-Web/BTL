using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Dicho_online.Models
{
    public class Cart
    {
        FoodMarketEntities db = new FoodMarketEntities();

        List<Products> listSP = new List<Products>();

        public string idHang { get; set; }
        public string tenHang { get; set; }
        public int Soluong { get; set; }
        public double Gia { get; set; }
        public double ThanhTien { get
            {
                return Soluong * Gia;
            }
        }

        //Hàm tạo
        public Cart()
        {
            idHang = "";
            tenHang = "";
            Soluong = 0;
            Gia = 0;
        }

        //Thêm vào giỏ hàng
        public void AddCart(Products sp)
        {
            bool exists = false;
            foreach (Products item in listSP)
            {
                if (item.ProductID == sp.ProductID)
                {
                    Soluong += 1;
                    exists = true; break;
                }
            }
            if (!exists)
            {
                listSP.Add(sp);
            }
            
        }
        //Cập nhật 
        public void UpdateCart(Products sp)
        {
            foreach(Products i in listSP)
                if (i.ProductID == sp.ProductID)
                {

                }
        }

        //Loại khỏi giỏ hàng
        public void RemoveCart(string _productID)
        {
            foreach (Products item in listSP)
            {
                if (item.ProductID == _productID)
                {
                    listSP.Remove(item);
                }
            }
        }

        public int getSL()
        {
            int sl = 0;
            foreach (Products i in listSP)
            {
                sl += 1;
            }
            return sl;
        }
    }
}