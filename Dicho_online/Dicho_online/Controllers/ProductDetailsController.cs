using Dicho_online.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Dicho_online.Controllers
{
    public class ProductDetailsController : Controller
    {
        FoodMarketEntities db = new FoodMarketEntities();
        // GET: ProductDetails
        public ActionResult Details(string id)
        {
            string productID = id;
            HomeViewModel model = new HomeViewModel();
            model.product_detail = from p in db.Products
                                   where p.ProductID == productID
                                   select p;
            Cart cart = (Cart)Session["cart"];                        
            return View(model);
        }
    }
}