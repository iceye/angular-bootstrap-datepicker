var changeBooking, dp;

dp = angular.module('ng-bootstrap-datepicker', []);

dp.directive('ngDatepicker', function($timeout) {
  return {
    restrict: 'A',
    replace: true,
    scope: {
      dateOptions: '=',
      ngModel: '='
    },
    template: "<input type=\"text\">",
    link: function(scope, element) {
		scope.inputHasFocus = false;

		changeBooking = function(e) {
		  var defaultFormat, defaultLanguage, format, language;
		  defaultFormat = $.fn.datepicker.defaults.format;
		  format = scope.dateOptions.format || defaultFormat;
		  defaultLanguage = $.fn.datepicker.defaults.language;
		  language = scope.dateOptions.language || defaultLanguage;
		  return scope.$apply(function() {
		    scope.ngModel = e !== void 0 ? e.target.value : '';
		  });
		};

		element.datepicker(scope.dateOptions).on('changeDate', changeBooking);

		scope.$watch('ngModel', function(newValue) {
		  if (!scope.inputHasFocus) {
		    element.datepicker('update', newValue);
		  }
		});

		scope.$watch('dateOptions', function(newValue) {
		  var dateTmp;
		  $timeout(function() {
			  element.datepicker('destroy');
    		  element.datepicker(newValue).on('changeDate', changeBooking);
		  },0,false);

		}, true);

		element.find('input').on('focus', function() {
		  scope.inputHasFocus = true;
		}).on('blur', function() {
		  scope.inputHasFocus = false;
		});

	}
  };
});
