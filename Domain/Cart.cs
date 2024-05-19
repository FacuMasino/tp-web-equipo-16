using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;

namespace Domain
{
    public class Cart
    {
        // PROPERTIES

        public List<ArticleSet> ArticleSets { get; set; }

        public decimal Total
        {
            get
            {
                return ArticleSets.Sum<ArticleSet>(set => set.Subtotal);
            }
        }

        // CONSTRUCT

        public Cart()
        {
            ArticleSets = new List<ArticleSet>();
        }
    }
}
