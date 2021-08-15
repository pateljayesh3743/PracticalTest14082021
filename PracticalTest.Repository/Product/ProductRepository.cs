using Dapper;
using PracticalTest.Domain.Entity.General;
using PracticalTest.Domain.Entity.Product;
using PracticalTest.Domain.Interface.Repositories.Product;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PracticalTest.Repository.Product
{
    public class ProductRepository : IProductRepository
    {
        #region -- private properties --
        private readonly IDbConnection _connection;
        #endregion
        #region -- constructor --
        public ProductRepository(IDbConnection dbConnection)
        {
            this._connection = dbConnection;
        }
        #endregion
        #region -- public method --
        public Task<ProductModel> GetProductByIDAsync(int productId)
        {
            throw new NotImplementedException();
        }

        public async Task<ResultViewModel<ProductModel>> GetProductsAsync(PagingParams pagingParams)
        {
            ResultViewModel<ProductModel> result = new ResultViewModel<ProductModel>();
            var param = new DynamicParameters();
            param.Add("@Offset", (pagingParams.CurrentPage-1)* pagingParams.PageSize);
            param.Add("@PageSize", pagingParams.PageSize);

            var queryResult = await _connection.QueryMultipleAsync("GetProduct", param, null, 0, commandType: CommandType.StoredProcedure);
            result.TotalCount = await queryResult.ReadFirstOrDefaultAsync<int>();
            if (result.TotalCount > 0)
            {
                result.DataSet = queryResult.Read<ProductModel>().ToList();
                var productAttributes = queryResult.Read<ProductAttributeModel>().ToList();
                if (productAttributes != null)
                {
                    for (int i = 0; i < result.DataSet.Count; i++)
                    {
                        result.DataSet[i].ProductAttributes = productAttributes.Where(x => x.ProductId == result.DataSet[i].ProductId).ToList();
                    }
                }
            }
            return result;
        }

        public async Task<ResultViewModel> SaveProductAsync(ProductModel productModel)
        {
            ResultViewModel result = new ResultViewModel();

            var queryResult = await _connection.QueryAsync<ResultViewModel>("SaveProduct", new
            {
                ProductId = productModel.ProductId,
                ProdCatId = productModel.ProdCatId,
                ProdName = productModel.ProdName,
                ProdDescription = productModel.ProdDescription,
                ProductAttributes = CreateDataTable(productModel.ProductAttributes)
            }, null, 0, commandType: CommandType.StoredProcedure);
            result = queryResult.FirstOrDefault();
            return result;
        }

        public Task<ResultViewModel> UpdateProductAsync(ProductModel productBase)
        {
            throw new NotImplementedException();
        }
        public async Task<List<ProductAttributeModel>> GetProductAttributeAsync(int categoryId)
        {
            List<ProductAttributeModel> result = new List<ProductAttributeModel>();
            var param = new DynamicParameters();
            param.Add("@ProdCatId", categoryId);
            var queryResult = await _connection.QueryAsync<ProductAttributeModel>("GetProductAttributeLookup", param, null, 0, commandType: CommandType.StoredProcedure);
            result = queryResult.AsList();
            return result;
        }

        private static DataTable CreateDataTable(List<ProductAttributeModel> productAttributeModels)
        {
            DataTable table = new DataTable();
            table.Columns.Add("AttributeId", typeof(int));
            table.Columns.Add("AttributeValue", typeof(string));
            foreach (var productAttribute in productAttributeModels)
            {
                table.Rows.Add(productAttribute.AttributeId, productAttribute.AttributeValue);
            }
            return table;
        }
        #endregion
    }
}
