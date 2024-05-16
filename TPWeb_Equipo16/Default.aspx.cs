using BusinessLogicLayer;
using Domain;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace TPWeb_Equipo16
{
    public partial class Default : System.Web.UI.Page
    {
        // ATTRIBUTES

        private ArticlesManager _articlesManager;

        // PROPERTIES

        public List<Article> Articles { get; set; }

        // CONSTRUCT

        public Default()
        { 
            _articlesManager = new ArticlesManager();
            Articles = _articlesManager.List();
        }

        // EVENTS

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}
