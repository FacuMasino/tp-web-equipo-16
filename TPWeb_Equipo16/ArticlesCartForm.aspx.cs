using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;
using Domain;

namespace TPWeb_Equipo16
{
    public partial class ArticlesCartForm : System.Web.UI.Page
    {
        // ATTRIBUTES

        private Article _article;
        private ArticlesManager _articlesManager;
        private ArticlesCart _articlesCart;

        // PROPERTIES

        public ArticlesCart ArticlesCart
        {
            get { return _articlesCart; }
            set { _articlesCart = value; }
        }

        // CONSTRUCT

        public ArticlesCartForm()
        {
            _articlesManager = new ArticlesManager();
            _articlesCart = new ArticlesCart();
        }

        // EVENTS

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                _article = _articlesManager.Read(id);
                _articlesCart.Add(_article);
            }
        }
    }
}