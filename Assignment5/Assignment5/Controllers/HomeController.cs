using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Assignment5.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }


        

        public ActionResult Home()
        {
        
            return View();
        }

        public ActionResult NewUser()
        {
            Session["edit"] = 1;
            var dto = Session["user"];

            return View(dto);
        }

    }
}