using Dicho_online.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using PagedList;

namespace Dicho_online.Controllers
{
    public class HomeController : Controller
    {
        private FoodMarketEntities db = new FoodMarketEntities();
        // GET: Home
        public ActionResult Index(int? page)
        {
            HomeViewModel model = new HomeViewModel();
            model.productList = db.Products.ToList().ToPagedList(page ?? 1, 2);
            model.priceSort = getPriceSortList();
            return View(model);
        }

        public List<string> getPriceSortList()
        {
            List<string> list = new List<string>();
            list.Add("Sort...");
            list.Add("Price ascending");
            list.Add("Price descending");
            return list;
        }

        [HttpPost]
        public ActionResult Sort()
        {
            string sort = Request.Form["ddlPrice"].ToString();
            /*ViewBag.PriceSortAscParm = String.IsNullOrEmpty(sort) ? "priceSort=Price ascending" : "";
            ViewBag.PriceSortDescParm = String.IsNullOrEmpty(sort) ? "Price descending" : "";*/
            var products = from p in db.Products
                           orderby p.UnitPrice
                           select p;
            if (sort == "Price descending")
            {
                products = products.OrderByDescending(p => p.UnitPrice);
                return View("Index");
            }
            return View("Index", products);
        }
        
        public ActionResult LoggedIn()
        {
            return View(db.Categories.ToList());
        }
        
    }
}