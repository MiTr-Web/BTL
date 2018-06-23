﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Script.Serialization;
using System.Web.Mvc;
using Dicho_online.Models;
using Newtonsoft.Json;

namespace Dicho_online.Controllers
{
    public class ProductsController : Controller
    {
        private FoodMarketEntities db = new FoodMarketEntities();

        // GET: Products
        public ActionResult Index()
        {
            var products = db.Products.Include(p => p.Category).Include(p => p.Container1).Include(p => p.Measurement).Include(p => p.Supplier);
            return View(products.ToList());
        }

        [HttpPost]
        public JsonResult Search(string search)
        {
            var settings = new JsonSerializerSettings()
            {
                ReferenceLoopHandling = ReferenceLoopHandling.Ignore,
                Error = (sender, args) =>
                {
                    args.ErrorContext.Handled = true;
                },
            };
            var r = db.Products.Where(x => x.ProductName.Contains(search))
                .Select(a => new
                {
                    id = a.ProductID,
                    name = a.ProductName,
                    price = a.UnitPrice,
                    image = a.Thumbnail,
                    measure = a.Measurement.name,
                    container = a.Container1.name,
                    unitNetWeight = a.QuantityPerUnit
                });
            string json = JsonConvert.SerializeObject(r, settings);

            if (json == "[]")
            {
                return Json(null,JsonRequestBehavior.AllowGet);
            }
            
            return Json(json,JsonRequestBehavior.AllowGet);
        }

        // GET: Products/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: Products/Create
        public ActionResult Create()
        {
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName");
            ViewBag.Container = new SelectList(db.Containers, "ID", "name");
            ViewBag.UnitMeasurement = new SelectList(db.Measurements, "ID", "name");
            ViewBag.SupplierID = new SelectList(db.Suppliers, "SupplierID", "CompanyName");
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ProductID,ProductName,SupplierID,CategoryID,UnitPrice,QuantityPerUnit,SellingUnit,UnitMeasurement,Container,InStock,OnOrder,Discontinue,Thumbnail")] Product product)
        {
            if (ModelState.IsValid)
            {
                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName", product.CategoryID);
            ViewBag.Container = new SelectList(db.Containers, "ID", "name", product.Container);
            ViewBag.UnitMeasurement = new SelectList(db.Measurements, "ID", "name", product.UnitMeasurement);
            ViewBag.SupplierID = new SelectList(db.Suppliers, "SupplierID", "CompanyName", product.SupplierID);
            return View(product);
        }

        // GET: Products/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName", product.CategoryID);
            ViewBag.Container = new SelectList(db.Containers, "ID", "name", product.Container);
            ViewBag.UnitMeasurement = new SelectList(db.Measurements, "ID", "name", product.UnitMeasurement);
            ViewBag.SupplierID = new SelectList(db.Suppliers, "SupplierID", "CompanyName", product.SupplierID);
            return View(product);
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ProductID,ProductName,SupplierID,CategoryID,UnitPrice,QuantityPerUnit,SellingUnit,UnitMeasurement,Container,InStock,OnOrder,Discontinue,Thumbnail")] Product product)
        {
            if (ModelState.IsValid)
            {
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName", product.CategoryID);
            ViewBag.Container = new SelectList(db.Containers, "ID", "name", product.Container);
            ViewBag.UnitMeasurement = new SelectList(db.Measurements, "ID", "name", product.UnitMeasurement);
            ViewBag.SupplierID = new SelectList(db.Suppliers, "SupplierID", "CompanyName", product.SupplierID);
            return View(product);
        }

        // GET: Products/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Product product = db.Products.Find(id);
            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
