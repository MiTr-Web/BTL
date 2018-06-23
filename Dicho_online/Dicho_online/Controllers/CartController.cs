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
        public JsonResult AddToCart(string id, int quantity)
        {
            Cart cart = (Cart)Session["cart"];
            if (cart == null)
            {
                cart = new Cart();
            }
            Product item = (from p in db.Products
                         where p.ProductID == id
                         select p).First();
            cart.Add(item,quantity);
            Session["cart"] = cart;
            return Json(cart.numberOfItems(),JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult RemoveFromCart(string id)
        {
            Cart cart = (Cart)Session["cart"];
            cart.Remove(id);
            return Json(cart.numberOfItems(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult numberOfItemsInCart()
        {
            Cart cart = (Cart)Session["cart"];
            if (cart == null)
            {
                return Json(0, JsonRequestBehavior.AllowGet);
            }
            return Json(cart.numberOfItems(), JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult quantityOfAnItem(string id)
        {
            Cart cart = (Cart)Session["cart"];
            if (cart == null)
            {
                return Json(1, JsonRequestBehavior.AllowGet);
            }
            return Json(cart.quantityOfProducts(id),JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult checkExist(string id)
        {
            Cart cart = (Cart)Session["cart"];
            if (cart == null)
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }
            return Json(cart.checkExist(id),JsonRequestBehavior.AllowGet);
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