using System.Collections.Generic;
using Domain;

namespace BusinessLogicLayer
{
    public class CartManager
    {
        // ATTRIBUTES

        private Cart _cart;
        private Dictionary<Article, int> _amounts; // A prueba, posiblemente reemplazable por _cart.ArticleSets

        // CONSTRUCT

        public CartManager()
        {
            _cart = new Cart();
            _amounts = new Dictionary<Article, int>();
        }

        // METHODS

        public List<ArticleSet> List()
        {
            return _cart.ArticleSets;
        }

        public void Add(Article article, int amount = 1)
        {
            if (_amounts.ContainsKey(article))
            {
                _amounts[article] += amount;
            }
            else
            {
                _amounts.Add(article, amount);
            }
        }

        public int Remove(Article article, int amount = 1)
        {
            if (_amounts.ContainsKey(article))
            {
                if (amount <= _amounts[article])
                {
                    _amounts[article] -= amount;
                    return amount;
                }
                else
                {
                    return -2;
                }
            }
            else
            {
                return -1;
            }
        }

        public int Delete(Article article)
        {
            if (_amounts.ContainsKey(article))
            {
                int amount = _amounts[article];
                _amounts.Remove(article);
                return amount;
            }
            else
            {
                return -1;
            }
        }

        public void Clear()
        {
            _amounts.Clear();
        }

        public int Count()
        {
            return _amounts.Count;
        }
    }
}
