using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Dicho_online.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Categories()
        {
            return RedirectToAction("Index","AdminCategories");
        }
        public ActionResult Products()
        {
            return RedirectToAction("Index", "AdminProducts");
        }
        public ActionResult Suppliers()
        {
            return RedirectToAction("Index", "AdminSuppliers");
        }
    }
}