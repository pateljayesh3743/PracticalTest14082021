using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace PracticalTest.Domain.Entity.Product
{
    public class ProductModel
    {
        public ProductModel()
        {
            ProductId = 0;
            ProdCatId = 0;
            ProdName = string.Empty;
            ProdDescription = string.Empty;
            CategoryName = string.Empty;
            ProductAttributes = new List<ProductAttributeModel>();
        }
        public int ProductId { get; set; }
        [Required]
        public int ProdCatId { get; set; }
        [Required]
        public string ProdName { get; set; }
        public string ProdDescription { get; set; }
        public string CategoryName { get; set; }
        public List<ProductAttributeModel> ProductAttributes { get; set; }
    }
}
