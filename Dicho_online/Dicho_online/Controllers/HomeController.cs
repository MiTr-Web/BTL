using Dicho_online.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;

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

        public ActionResult Sort(string sort)
        {
            if(sort == "Price ascending")
            {

            }
            else if (sort == "Price descending")
            {

            }
            return View("Index");
        }
        
        public ActionResult LoggedIn()
        {
            return View(db.Categories.ToList());
        }
        
    }
}