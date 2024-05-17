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
        private CartManager _cart;

        // PROPERTIES

        public CartManager ArticlesCart
        {
            get { return _cart; }
            set { _cart = value; }
        }

        // CONSTRUCT

        public ArticlesCartForm()
        {
            _articlesManager = new ArticlesManager();
            _cart = new CartManager();
        }

        // METHODS

        private void RequestAddedArticle()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                _article = _articlesManager.Read(id);
                _cart.Add(_article);
            }
        }

        private void BindGridView()
        {
            CartGridView.DataSource = _cart.List();
            CartGridView.DataBind();
        }

        // EVENTS

        protected void Page_Load(object sender, EventArgs e)
        {
            RequestAddedArticle();
            BindGridView();
        }
    }
}