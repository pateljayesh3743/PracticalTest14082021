using PracticalTest.Domain.Entity.General;
using PracticalTest.Domain.Entity.Product;
using PracticalTest.Domain.Interface.Repositories.Product;
using PracticalTest.Domain.Interface.Services.Product;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace PracticalTest.Service.Product
{
    public class ProductService : IProductService
    {
        #region -- private properties --
        private readonly IProductRepository _productRepository;
        #endregion

        #region -- constructor --
        public ProductService(IProductRepository productRepository)
        {
            this._productRepository = productRepository ?? throw new ArgumentNullException(nameof(productRepository));
        }
        #endregion
        #region -- public methods --
        public Task<ProductModel> GetProductByIDAsync(int productId)
        {
            throw new NotImplementedException();
        }

        public async Task<ResultViewModel<ProductModel>> GetProductsAsync(PagingParams pagingParams)
        {
            ResultViewModel<ProductModel> result = new ResultViewModel<ProductModel>();
            try
            {
                result = await _productRepository.GetProductsAsync(pagingParams);
            }
            catch (Exception e)
            {
                //Handle exception code
            }
            return result;
        }

        public async Task<ResultViewModel> SaveProductAsync(ProductModel productModel)
        {
            ResultViewModel result = null;
            try
            {
                result = await _productRepository.SaveProductAsync(productModel);
            }
            catch (Exception e)
            {
                //Handle exception code
            }
            return result;
        }

        public Task<ResultViewModel> UpdateProductAsync(ProductModel productModel)
        {
            throw new NotImplementedException();
        }
        public async Task<List<ProductAttributeModel>> GetProductAttributeAsync(int categoryId)
        {
            List<ProductAttributeModel> result = null;
            try
            {
                result = await _productRepository.GetProductAttributeAsync(categoryId);
            }
            catch (Exception e)
            {
                //Handle exception code
            }
            return result;
        }
        #endregion
    }
}
