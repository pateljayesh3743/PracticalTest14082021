using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using PracticalTest.Domain.Entity.General;
using PracticalTest.Domain.Entity.Product;
using PracticalTest.Domain.Interface.Services.Category;
using PracticalTest.Domain.Interface.Services.Product;

namespace PracticalTest.Web.Controllers
{
    public class ProductController : Controller
    {
        #region -- private properties --
        private readonly IProductService _productService = null;
        private readonly ICategoryService _categoryService = null;
        #endregion

        #region -- constructor --
        public ProductController(IProductService productService, ICategoryService categoryService)
        {
            _productService = productService ?? throw new ArgumentNullException(nameof(productService));
            _categoryService = categoryService ?? throw new ArgumentNullException(nameof(categoryService));
        }
        #endregion
        #region -- public actions --
        public IActionResult Product()
        {
            return View();
        }
        [HttpPost]
        public async Task<JsonResult> GetProducts(PagingParams pagingParams)
        {
            return Json(await _productService.GetProductsAsync(pagingParams));
        }
        [HttpPost]
        public async Task<JsonResult> SaveProduct(ProductModel productModel)
        {
            if (ModelState.IsValid)
            {
                return Json(await _productService.SaveProductAsync(productModel));
            }
            else {
                return Json(new ResultViewModel(){ IsSuccess = false, Message = "Data is Invalid!" });
            }
        }
        public async Task<JsonResult> GetCategories()
        {
            return Json(await _categoryService.GetCategoriesAsync());
        }
        [HttpPost]
        public async Task<JsonResult> GetProductAttribute(int categoryId)
        {
            return Json(await _productService.GetProductAttributeAsync(categoryId));
        }
        #endregion
    }
}
