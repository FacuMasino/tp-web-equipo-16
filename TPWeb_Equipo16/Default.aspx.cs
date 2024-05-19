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

        // METHODS

        private void FilterArticlesByCategory(int id)
        {
            if (id == -1) // Articulos sin categoría
            {
                Articles = Articles.FindAll(a => a.Category.Description == "");
                return;
            }
            Articles = Articles.FindAll(a => a.Category.Id == id);
        }

        private void FilterArticlesByBrand(int id)
        {
            if (id == -1) // Articulos sin marca
            {
                Articles = Articles.FindAll(a => a.Brand.Description == "");
                return;
            }
            Articles = Articles.FindAll(a => a.Brand.Id == id);
        }

        private void CheckRequest()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["catId"]))
            {
                int categoryId = Convert.ToInt32(Request.QueryString["catId"].ToString());
                FilterArticlesByCategory(categoryId);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["brandId"]))
            {
                int brandId = Convert.ToInt32(Request.QueryString["brandId"].ToString());
                FilterArticlesByBrand(brandId);
            }
        }

        // EVENTS

        protected void Page_Load(object sender, EventArgs e)
        {
            CheckRequest(); // Verificar si se pasaron parámetros
        }
    }
}
