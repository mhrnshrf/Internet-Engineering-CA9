(function() {
  var app = angular.module('myStore', ['ngAnimate' , 'ui.bootstrap', 'ngMessages']);
  // Custom validator based on expressions.
// see: https://docs.angularjs.org/guide/forms
app.directive('wjValidationError', function () {
  return {
    require: 'ngModel',
    link: function (scope, elm, attrs, ctl) {
      scope.$watch(attrs['wjValidationError'], function (errorMsg) {
        elm[0].setCustomValidity(errorMsg);
        ctl.$setValidity('wjValidationError', errorMsg ? false : true);
      });
    }
  };
});

  app.controller('StoreController', function($scope) {
    this.customers = custs;
    this.symbols = syms;


  });

  app.controller("TabController", function() {
    this.tab = 1;

    this.isSet = function(checkTab) {
      return this.tab === checkTab;
    };

    this.setTab = function(setTab) {
      this.tab = setTab;
    };
  });

  app.controller('GalleryController', function(){
    this.current = 0;

    this.setCurrent = function(imageNumber){
      this.current = imageNumber || 0;
    };
  });

  app.controller("ReviewController", function(){

    this.review = {};

    this.addReview = function(customer){
      customer.reviews.push(this.review);
      this.review = {};
    };



  });


  app.controller("DepositController", function(){

    this.amount = 0;

    this.incBudget = function(customer){
      customer.budget += this.amount;
      this.amount = 0;
    };
  });

  app.controller("LoginController", function(){


  });

app.controller('ModalDemoCtrl', function ($scope, $uibModal, $log) {

  $scope.items = ['item1', 'item2', 'item3'];

  $scope.animationsEnabled = true;


  $scope.open = function (size, sym) {

    var modalInstance = $uibModal.open({
      animation: $scope.animationsEnabled,
      templateUrl: 'myModalContent.html',
      controller: 'ModalInstanceCtrl',
      size: size,
      resolve: {
        items: function () {
          return $scope.items;
        },
        symbol: function () {
          return sym;
        },
      }
    });



    modalInstance.result.then(function (selectedItem) {
      $scope.selected = selectedItem;

    }, function () {
      $log.info('Modal dismissed at: ' + new Date());
    });
  };

  $scope.toggleAnimation = function () {
    $scope.animationsEnabled = !$scope.animationsEnabled;
  };

});

// Please note that $uibModalInstance represents a modal window (instance) dependency.
// It is not the same as the $uibModal service used above.

app.controller('ModalInstanceCtrl', function ($scope, $uibModalInstance, items, symbol) {

  $scope.items = items;
  $scope.symbol = symbol;
  $scope.selected = {
    // item: $scope.items[0],
    symbol:$scope.symbol,
    quantity:0,
    price:0,
    bs:"buy",
    type:"GTC",
    status:"waiting",
  };

  $scope.ok = function (reqForm) {
    if (reqForm.$valid) {
    $uibModalInstance.close($scope.selected);
    };

  };

  $scope.cancel = function () {
    $uibModalInstance.dismiss('cancel');
  };


});

app.controller('ButtonsCtrl', function ($scope) {

  $scope.type = 'GTC';

  $scope.checkModel = {
    GTC: false,
    MPO: true,
    IOC: false
  };

  $scope.checkResults = [];

  $scope.$watchCollection('checkModel', function () {
    $scope.checkResults = [];
    angular.forEach($scope.checkModel, function (value, key) {
      if (value) {
        $scope.checkResults.push(key);
      }
    });
  });

   $scope.bs = 'buy';

  $scope.checkModelBS = {
    buy: false,
    sell: true,
  };

  $scope.checkResultsBS = [];

  $scope.$watchCollection('checkModelBS', function () {
    $scope.checkResultsBS = [];
    angular.forEach($scope.checkModelBS, function (value, key) {
      if (value) {
        $scope.checkResultsBS.push(key);
      }
    });
  });
});


  var custs = [{
      name: 'فرشاد فلاح',
      budget: 300,
      id: 1,
      stocks: [{
        name: "سایپا",
        quantity: 10
      }, {
        name: "ایران خودرو",
        quantity: 30
      }],
      requests: [{
        symbol: "سایپا",
        quantity: 10,
        price: 100,
        bs: "خرید",
        type: "MPO",
        status: "done"
      }, {
        symbol: "ایران خودرو",
        quantity: 40,
        price: 300,
        bs: "فروش",
        type: "GTC",
        status: "queued"
      }]
    }];


  var syms = [{
      name: "سایپا"
    },
    {
      name: "ایران خودرو"
    }
    ];
})();
