using Dapper;
using PracticalTest.Domain.Entity.Category;
using PracticalTest.Domain.Interface.Repositories.Category;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading.Tasks;

namespace PracticalTest.Repository.Category
{
    public class CategoryRepository : ICategoryRepository
    {
        #region -- private properties --
        private readonly IDbConnection _connection;
        #endregion
        #region -- constructor --
        public CategoryRepository(IDbConnection dbConnection)
        {
            this._connection = dbConnection;
        }
        #endregion
        #region -- public method --
        public async Task<List<CategoryModel>> GetCategoriesAsync()
        {
            List<CategoryModel> result = new List<CategoryModel>();
            var queryResult = await _connection.QueryAsync<CategoryModel>("GetCategory", null, null, 0, commandType: CommandType.StoredProcedure);
            result = queryResult.AsList();
            return result;
        }
        #endregion
    }
}
