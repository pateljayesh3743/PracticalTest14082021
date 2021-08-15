var app = angular.module("app", []).filter('removeSpaces', [function () {
    return function (string) {
        if (!angular.isString(string)) {
            return string;
        }
        return string.replace(/[\s]/g, '');
    };
}]);
app.controller("ProductController", ["$http", "$scope", function ($http, $scope) {

    $scope.gridRequest = {
        currentPage: 1,
        pageSize: 5
    };
    $scope.totalPages = 0;

    $scope.totalPages = 0;
    $scope.dataList = [];
    $scope.totalCount = 0;
    $scope.commandName = "Add";

    $scope.productModel = {
        productId: 0,
        prodCatId: "0",
        prodName: "",
        prodDescription: "",
        productAttributes:[]
    };

    $scope.categoryList = [];
    $scope.get_category = function () {
        $http({
            url: product_config.url.get_category,
            method: "GET",
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
        }).then(function (response) {
            $scope.categoryList = response.data;
            console.log($scope.categoryList);
        }).catch(function (response) {
            alert(response.data.message);
        });
    };

    $scope.get_product_attribute = function () {
        $http({
            url: product_config.url.get_product_attribute,
            method: "POST",
            data: $.param({ categoryId: $scope.productModel.prodCatId}),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
        }).then(function (response) {
            $scope.productModel.productAttributes = response.data;
        }).catch(function (response) {
            alert(response.data.message);
        });
    };

    $scope.get_products = function () {
        $http({
            url: product_config.url.get_product,
            method: "POST",
            data: $.param($scope.gridRequest),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
        }).then(function (response) {
            $scope.dataList = response.data.dataSet;
            $scope.totalCount = response.data.totalCount;
            $scope.calculate_total_pages($scope.totalCount);
        }).catch(function (response) {
            alert(response.data.message);
        });
    };

    $scope.save_product = function () {
        $http({
            url: product_config.url.save_product,
            method: "POST",
            data: $.param($scope.productModel),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
        }).then(function (response) {
            if (response.data.isSuccess) {
                $("#productFormModal").modal('hide');
                $scope.reset();
                alert(response.data.message);
                $scope.get_products();
            } else {
                alert(response.data.message);
            }
        }).catch(function (response) {
            console.log(response);
        });
    };

    $scope.load_previos = function () {
        $scope.gridRequest.currentPage -= 1;
        $scope.get_products();
    };
    $scope.load_next = function () {
        $scope.gridRequest.currentPage += 1;
        $scope.get_products();
    };
    $scope.load_grid_check = function () {
        if ($scope.gridRequest.currentPage > $scope.totalPages) {
            $scope.gridRequest.currentPage = $scope.totalPages;
        }
        else if ($scope.gridRequest.currentPage < 1 && $scope.gridRequest.currentPage != null) {
            $scope.gridRequest.currentPage = 1;
        }
        else { }
    }
    $scope.calculate_total_pages = function (arg) {
        if ($scope.totalCount <= 0) {
            $scope.totalPages = 0;
        } else {
            $scope.totalPages = Math.ceil($scope.totalCount / $scope.gridRequest.pageSize);
        }
    };

    
    $scope.add_edit_product = function (productItem, commandName) {
        $scope.commandName = commandName;
        $('#productFormModal').modal({ backdrop: 'static', keyboard: false });
        $("#productFormModal").modal('show');
        if ($scope.commandName == "Edit") {
            $scope.productModel.productId = productItem.productId;
            $scope.productModel.prodCatId = productItem.prodCatId;
            $scope.productModel.prodName = productItem.prodName;
            $scope.productModel.prodDescription = productItem.prodDescription;
            $scope.productModel.productAttributes = productItem.productAttributes;
        } else {
            $scope.reset();
        }
    }

    $scope.close = function () {
        $("#productFormModal").modal('hide');
        $scope.reset();
    }
    $scope.reset = function () {
        $scope.productModel = {
            productId: 0,
            prodCatId: "",
            prodName: "",
            prodDescription: "",
            productAttributes: []
        };
    }

    $scope.get_category();
    $scope.get_products();
}]);