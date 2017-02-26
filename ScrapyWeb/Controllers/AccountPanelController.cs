using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ScrapyWeb.Business;
using ScrapyWeb.Models;
namespace ScrapyWeb.Controllers
{
    public class AccountPanelController : Controller
    {
        //
        // GET: /AccountPanel/

        public ActionResult Index()
        {
            List<TwitterApplication> _appList = new List<TwitterApplication>() ;
            //clBusiness.getTwitterApplications( ref _appList);
            return View(_appList); 
        }
        public ActionResult AddApplication()
        {

            return View();

        }

        //
        // GET: /AccountPanel/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /AccountPanel/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /AccountPanel/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /AccountPanel/Edit/5

        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /AccountPanel/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /AccountPanel/Delete/5

        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /AccountPanel/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
