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
                    p.QuantityPerUnit += item.QuantityPerUnit;
                    p.quantity += quantity;
                    exist = true;
                    break;
                }
            }
            if (exist != true)
            {
                item.quantity = quantity;
                cart.Add(item);
            }           
        }
        public void Remove(Product item)
        {
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
        public decimal totalCash()
        {
            decimal total = 0;
            foreach(Product i in cart)
            {
                total += (decimal)i.UnitPrice;
            }
            return total;
        }
    }
}