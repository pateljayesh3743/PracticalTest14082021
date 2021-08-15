using PracticalTest.Domain.Entity.Category;
using PracticalTest.Domain.Interface.Repositories.Category;
using PracticalTest.Domain.Interface.Services.Category;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace PracticalTest.Service.Category
{
    public class CategoryService : ICategoryService
    {
        #region -- private properties --
        private readonly ICategoryRepository _categoryRepository;
        #endregion

        #region -- constructor --
        public CategoryService(ICategoryRepository categoryRepository)
        {
            this._categoryRepository = categoryRepository ?? throw new ArgumentNullException(nameof(categoryRepository));
        }
        #endregion
        #region -- public methods --
        public async Task<List<CategoryModel>> GetCategoriesAsync()
        {
            List<CategoryModel> result = null;
            try
            {
                result = await _categoryRepository.GetCategoriesAsync();
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
