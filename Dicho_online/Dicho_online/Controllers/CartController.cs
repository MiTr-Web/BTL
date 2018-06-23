using Dicho_online.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Dicho_online.Controllers
{
    public class CartController : Controller
    {
        FoodMarketEntities db = new FoodMarketEntities();
        // GET: Cart
        public ActionResult AddToCart(string id)
        {
            Cart cart = (Cart)Session["cart"];
            if (cart == null)
            {
                cart = new Cart();
            }

            Product item = (from p in db.Products
                         where p.ProductID == id
                         select p).First();
            cart.Add(item);
            Session["cart"] = cart;
            ViewBag.numberOfItems = cart.numberOfItems();
            return Redirect(Request.UrlReferrer.ToString());
        }
        public ActionResult ShowCart()
        {
            HomeViewModel model = new HomeViewModel();            
            Cart cart = (Cart)Session["cart"];
            if (cart == null)
            {
                ViewBag.Msg = "Cart is currently empty";
                model.product_detail = null;
                return View(model);
            }
            else
            {
                model.product_detail = cart.getCart();
                ViewBag.totalCash = cart.totalCash();
            }
            return View(model);
        }
    }
}