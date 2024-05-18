namespace Domain
{
    public class ArticleSet : Article
    {
        public int Amount { get; set; }

        public decimal Subtotal
        {
            get { return Amount * Price; }
        }
    }
}
