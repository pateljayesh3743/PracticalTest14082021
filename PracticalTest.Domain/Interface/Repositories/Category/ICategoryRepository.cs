using PracticalTest.Domain.Entity.Category;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace PracticalTest.Domain.Interface.Repositories.Category
{
    public interface ICategoryRepository
    {
        Task<List<CategoryModel>> GetCategoriesAsync();
    }
}
