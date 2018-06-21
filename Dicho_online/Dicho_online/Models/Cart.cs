using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Dicho_online.Models
{
    public class Cart
    {
        private List<Product> cart = new List<Product>();

        public void Add(Product item, int quantity)
        {
            bool exist = false;
            foreach(Product p in cart)
            {
                // can phai sua lai khi them mot luc nhieu item
                if(p.ProductID == item.ProductID)
                {
                    p.QuantityPerUnit = item.QuantityPerUnit;
                    p.quantity = quantity;
                    p.totalPrice = quantity * item.UnitPrice;
                    exist = true;
                    break;
                }
            }
            if (exist != true)
            {
                item.quantity = quantity;
                item.totalPrice = quantity * item.UnitPrice;
                cart.Add(item);
            }           
        }
        public bool checkExist(string id)
        {
            Product item = cart.Find(x => x.ProductID == id);
            if (item == null)
            {
                return false;
            }
            else return true;
        }
        public void Remove(string id)
        {
            Product item = cart.Find(x => x.ProductID==id);
            cart.Remove(item);
        }
        public List<Product> getCart()
        {
            return cart;
        }
        public int numberOfItems()
        {
            return cart.Count();
        }
        public int quantityOfProducts(string id)
        {
            int quantity = 0;
            Product item = cart.Find(x => x.ProductID == id);
            if (item == null)
            {
                return 1;
            }
            quantity = item.quantity;
            return quantity;
        }
        public decimal totalCash()
        {
            decimal total = 0;
            foreach(Product p in cart)
            {
                total += (decimal)p.UnitPrice*p.quantity;
            }
            return total;
        }
    }
}