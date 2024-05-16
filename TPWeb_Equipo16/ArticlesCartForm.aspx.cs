using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;

namespace TPWeb_Equipo16
{
    public partial class ArticlesCartForm : System.Web.UI.Page
    {
        // PROPERTIES

        public ArticlesCart ArticlesCart { get; set; }

        // EVENTS

        protected void Page_Load(object sender, EventArgs e)
        {
            ArticlesCart = new ArticlesCart();
        }
    }
}