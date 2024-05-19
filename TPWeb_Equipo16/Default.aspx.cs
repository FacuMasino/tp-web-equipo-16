using System;
using System.Collections.Generic;
using BusinessLogicLayer;
using Domain;

namespace TPWeb_Equipo16
{
    public partial class Default : System.Web.UI.Page
    {
        // ATTRIBUTES

        private ArticlesManager _articlesManager;
        private CategoriesManager _categoriesManager;
        private BrandsManager _brandsManager;

        // PROPERTIES

        public List<Article> Articles { get; set; }
        public List<Category> Categories { get; }
        public List<Brand> Brands { get; }

        // CONSTRUCT

        public Default()
        {
            _articlesManager = new ArticlesManager();
            _categoriesManager = new CategoriesManager();
            _brandsManager = new BrandsManager();
            Articles = _articlesManager.List();
            Categories = _categoriesManager.List();
            Brands = _brandsManager.List();
        }

        // EVENTS

        protected void Page_Load(object sender, EventArgs e) { }
    }
}
