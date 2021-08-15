using PracticalTest.Domain.Entity.General;
using PracticalTest.Domain.Entity.Product;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace PracticalTest.Domain.Interface.Repositories.Product
{
    public interface IProductRepository
    {
        Task<ResultViewModel<ProductModel>> GetProductsAsync(PagingParams pagingParams);
        Task<ResultViewModel> SaveProductAsync(ProductModel productModel);
        Task<ProductModel> GetProductByIDAsync(int productId);
        Task<ResultViewModel> UpdateProductAsync(ProductModel productModel);
        Task<List<ProductAttributeModel>> GetProductAttributeAsync(int categoryId);
    }
}
