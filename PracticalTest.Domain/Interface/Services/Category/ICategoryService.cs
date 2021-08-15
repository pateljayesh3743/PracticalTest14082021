using PracticalTest.Domain.Entity.Category;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace PracticalTest.Domain.Interface.Services.Category
{
    public interface ICategoryService
    {
        Task<List<CategoryModel>> GetCategoriesAsync();
    }
}
