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
        private DB_Context db = new DB_Context();
        // GET: Home
        public ActionResult Index(int? page)
        {
            ViewModel vm = new ViewModel();
            vm.Categories = db.Categories.ToList();
            vm.Products = db.Products.ToList().ToPagedList(page ?? 1, 2);
            vm.Suppliers = db.Suppliers.ToList();
            return View(vm);
        }
        public ActionResult LoggedIn()
        {
            return View(db.Categories.ToList());
        }
        
    }
}