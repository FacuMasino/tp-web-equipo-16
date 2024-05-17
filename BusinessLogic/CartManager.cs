using System.Collections.Generic;
using Domain;

namespace BusinessLogicLayer
{
    public class CartManager
    {
        // ATTRIBUTES

        private Cart _cart;

        // CONSTRUCT

        public CartManager()
        {
            _cart = new Cart();
        }

        // METHODS

        public List<ArticleSet> List()
        {
            return _cart.ArticleSets;
        }

        public void Add(Article article, int amount = 1)
        {
            while (_cart.ArticleSets.Count <= article.Id)
            {
                ArticleSet aux = new ArticleSet();
                _cart.ArticleSets.Add(aux);
            }

            ArticleSet articleSet = new ArticleSet();
            _cart.ArticleSets.Insert(article.Id, articleSet);

            _cart.ArticleSets[article.Id].Id = article.Id;
            _cart.ArticleSets[article.Id].Code = article.Code;
            _cart.ArticleSets[article.Id].Name = article.Name;
            _cart.ArticleSets[article.Id].Price = article.Price;
            _cart.ArticleSets[article.Id].Description = article.Description;
            _cart.ArticleSets[article.Id].Brand = article.Brand;
            _cart.ArticleSets[article.Id].Category = article.Category;
            _cart.ArticleSets[article.Id].Images = article.Images;
            _cart.ArticleSets[article.Id].Amount += amount;
        }

        public void Remove(Article article, int amount = 1)
        {
            
        }

        public void Delete(Article article)
        {
            
        }

        public void Clear()
        {
            _cart.ArticleSets.Clear();
        }

        public int Count()
        {
            return _cart.ArticleSets.Count;
        }
    }
}
