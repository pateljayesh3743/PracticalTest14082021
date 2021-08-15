using System.Collections.Generic;

namespace PracticalTest.Domain.Entity.General
{
    public class ResultViewModel
    {
        public ResultViewModel()
        {
            ID = default;
            Message = string.Empty;
            IsSuccess = false;
            StatusCode = string.Empty;
        }
        public long ID { get; set; }
        public string Message { get; set; }
        public bool IsSuccess { get; set; }
        public string StatusCode { get; set; }
    }
    public class ResultViewModel<T> : ResultViewModel
    {
        public ResultViewModel() : base() { }
        public List<T> DataSet { get; set; }
        public T Data { get; set; }
        public long TotalCount { get; set; }
    }
}
