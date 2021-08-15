namespace PracticalTest.Domain.Entity.Product
{
    public class ProductAttributeModel
    {
        public ProductAttributeModel()
        {
            ProductId = 0;
            AttributeId = 0;
            AttributeName = string.Empty;
            AttributeValue = string.Empty;
        }
        public int ProductId { get; set; }
        public int AttributeId { get; set; }
        public string AttributeName { get; set; }
        public string AttributeValue { get; set; }
    }
}
