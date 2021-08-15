namespace PracticalTest.Domain.Entity.General
{
    public class PagingParams
    {
        public PagingParams()
        {
            CurrentPage = 0;
            PageSize = 0;
        }
        public int CurrentPage { get; set; }
        public int PageSize { get; set; }
    }
}
