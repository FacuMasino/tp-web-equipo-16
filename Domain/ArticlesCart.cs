using System.Collections.Generic;

namespace Domain
{
    public class ArticlesCart
    {
        // ATTRIBUTES

        private Dictionary<Article, int> _cart;

        // CONSTRUCT

        public ArticlesCart()
        {
            _cart = new Dictionary<Article, int>();
        }

        // METHODS

        public Dictionary<Article, int> List()
        {
            return _cart;
        }

        public void Add(Article article, int amount = 1)
        {
            if (_cart.ContainsKey(article))
            {
                _cart[article] += amount;
            }
            else
            {
                _cart.Add(article, amount);
            }
        }

        public int Remove(Article article, int amount = 1)
        {
            if (_cart.ContainsKey(article))
            {
                if (amount <= _cart[article])
                {
                    _cart[article] -= amount;
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
            if (_cart.ContainsKey(article))
            {
                int amount = _cart[article];
                _cart.Remove(article);
                return amount;
            }
            else
            {
                return -1;
            }
        }

        public void Clear()
        {
            _cart.Clear();
        }

        public int Count()
        {
            return _cart.Count;
        }
    }
}
