﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webdev_Assignment2
{
    public partial class index : System.Web.UI.Page
    {
        DataBaseServerDataContext db;

        protected void Page_Load(object sender, EventArgs e)
        {
            db = new DataBaseServerDataContext();

        }
    }
}