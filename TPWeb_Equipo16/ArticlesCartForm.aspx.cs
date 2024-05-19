using System;
using System.Collections.Generic;
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
        private CartManager _cartManager;

        // PROPERTIES

        public CartManager ArticlesCart
        {
            get { return _cartManager; }
            set { _cartManager = value; }
        }

        // CONSTRUCT

        public ArticlesCartForm()
        {
            _articlesManager = new ArticlesManager();
            _cartManager = new CartManager();
        }

        // METHODS

        private void RequestAddedArticle()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                _article = _articlesManager.Read(id);
                _cartManager.Add(_article);
                Session["CurrentArticleSets"] = _cartManager.List();
            }
        }

        private void BindGridView()
        {
            //CartGridView.DataSource = _cartManager.List();
            //CartGridView.DataBind();
        }

        private void BindRepeater()
        {
            CartRepeater.DataSource = _cartManager.List();
            CartRepeater.DataBind();
        }

        private void BindControls()
        {
            //BindGridView();
            BindRepeater();
        }

        private void CheckSession()
        {
            if (Session["CurrentArticleSets"] != null)
            {
                _cartManager.CurrentArticleSets = (List<ArticleSet>)Session["CurrentArticleSets"];
            }
        }

        // EVENTS

        protected void Page_Load(object sender, EventArgs e)
        {
            CheckSession();

            if (!IsPostBack) // si es postback no bindear lista ni agregar article
            {
                RequestAddedArticle();
                BindControls();
            }
        }

        protected void removeLnkButton_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            _cartManager.Remove(id);
            BindControls();
        }

        protected void addLnkButton_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            _cartManager.Add(id);
            BindControls();
        }

        protected void deleteLnkButton_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            _cartManager.Delete(id);
            BindControls();
        }
    }
}
