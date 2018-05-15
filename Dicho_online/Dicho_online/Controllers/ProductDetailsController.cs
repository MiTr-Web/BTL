using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Dicho_online.Models;

namespace Dicho_online.Controllers
{
    public class ProductDetailsController : Controller
    {
        private FoodMarketEntities db = new FoodMarketEntities();
        // GET: ProductDetails
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Details(string _productID)
        {
            if (_productID == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(_productID);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        [HttpGet]
        public ActionResult AddCart(string _productID)
        {
            Cart cart = (Cart)Session["cart"];
            if (cart == null) cart = new Cart();
            //Truy xuất database để lấy product theo id
            Products sp = db.Products.Find(_productID);

            cart.AddCart(sp);

            return View();
        }

        public int getSoLuong()
        {
            Cart cart = (Cart)Session["cart"];
            if (cart == null) return 0;
            else return cart.getSL();
        }
    }
}