using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace _112502.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Login()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Register()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Bookkeeping1()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Bookkeeping2()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Bookkeeping3()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Bookkeeping4()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}