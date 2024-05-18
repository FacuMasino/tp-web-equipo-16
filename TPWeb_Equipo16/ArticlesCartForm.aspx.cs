﻿using System;
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
            List<ArticleSet> articleSets = new List<ArticleSet>();
            ArticleSet a1 = new ArticleSet();
            ArticleSet a2 = new ArticleSet();
            a1.Amount = 4;
            a2.Amount = 5;
            a1.Name = "uno";
            a2.Name = "dos";
            articleSets.Add(a1);
            articleSets.Add(a2);

            CartGridView.DataSource = _cartManager.List();
            CartGridView.DataBind();

            // Max, esto es solo para probar
            CartRepeater.DataSource = _cartManager.List();
            CartRepeater.DataBind();
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
            RequestAddedArticle();
            if (!IsPostBack) // si es postback no bindear lista
                BindGridView();
        }

        protected void deteleButton_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(((Button)sender).CommandArgument);
            _cartManager.Delete(id);
            BindGridView(); // bindear y actualizar lista
        }
    }
}
