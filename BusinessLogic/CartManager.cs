using System.Collections.Generic;
using Domain;

namespace BusinessLogicLayer
{
    public class CartManager
    {
        // ATTRIBUTES

        private Cart _cart;
        private ArticleSet _articleSet;

        // PROPERTIES

        public List<ArticleSet> CurrentArticleSets
        {
            set { _cart.ArticleSets = value; }
        }

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

        private bool ArticleExists(int id)
        {
            if (_cart.ArticleSets.Find(x => x.Id == id) == null)
            {
                return false;
            }

            return true;
        }

        private ArticleSet ReadArticleSet(int id) // Me tomé el atrevimiento de cambiar el nombre de tu método Facu <3
        {
            return _cart.ArticleSets.Find(x => x.Id == id);
        }

        public void Add(Article article, int amount = 1)
        {
            if (ArticleExists(article.Id))
            {
                Add(article.Id);
            }
            else
            {
                _articleSet = new ArticleSet
                {
                    Id = article.Id,
                    Code = article.Code,
                    Name = article.Name,
                    Price = article.Price,
                    Description = article.Description,
                    Brand = article.Brand,
                    Category = article.Category,
                    Images = article.Images,
                    Amount = amount
                };

                _cart.ArticleSets.Add(_articleSet);
            }
        }

        public void Add(int articleId, int amount = 1)
        {
            _articleSet = ReadArticleSet(articleId);
            _articleSet.Amount += amount;
        }

        public void Remove(int articleId, int amount = 1)
        {
            _articleSet = ReadArticleSet(articleId);

            if (_articleSet.Amount != amount)
            {
                _articleSet.Amount -= amount;
                return;
            }

            Delete(articleId);
        }

        public void Delete(int articleId)
        {
            _articleSet = ReadArticleSet(articleId);
            _cart.ArticleSets.Remove(_articleSet);
        }

        public void Clear()
        {
            _cart.ArticleSets.Clear();
        }

        public int Count()
        {
            return _cart.ArticleSets.Count;
        }

        public decimal GetTotal()
        {
            return _cart.Total;
        }
    }
}
