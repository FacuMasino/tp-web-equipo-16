using System.Collections.Generic;

namespace Domain
{
    public class Cart
    {
        // PROPERTIES

        public List<ArticleSet> ArticleSets { get; set; }

        // CONSTRUCT

        public Cart()
        {
            ArticleSets = new List<ArticleSet>();
        }
    }
}
