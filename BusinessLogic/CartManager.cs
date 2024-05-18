using System.Collections.Generic;
using Domain;

namespace BusinessLogicLayer
{
    public class CartManager
    {
        // ATTRIBUTES

        private Cart _cart;

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
                return false;
            return true;
        }

        private ArticleSet GetArticleSetById(int id)
        {
            return _cart.ArticleSets.Find(x => x.Id == id);
        }

        public void Add(Article article, int amount = 1)
        {
            if (ArticleExists(article.Id))
            {
                GetArticleSetById(article.Id).Amount += amount;
            }
            else
            {
                ArticleSet aux = new ArticleSet
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
                _cart.ArticleSets.Add(aux);
            }
        }

        public void Remove(int articleId, int amount = 1)
        {
            ArticleSet auxArticleSet = GetArticleSetById(articleId);
            if (auxArticleSet.Amount != amount)
            { // si la cantidad es distinta, se disminuye
                auxArticleSet.Amount -= amount;
                return;
            }
            Delete(articleId); // si la cantidad es igual, se elimina del carrito
        }

        public void Delete(int articleId)
        {
            // Obtiene el set de articulos con el id del articulo y lo elimina
            _cart.ArticleSets.Remove(GetArticleSetById(articleId));
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
