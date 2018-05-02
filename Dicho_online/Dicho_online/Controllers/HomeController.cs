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
            return View(db.Products.ToList().ToPagedList(page ?? 1, 2));
        }
        public ActionResult LoggedIn()
        {
            return View(db.Categories.ToList());
        }
        
    }
}