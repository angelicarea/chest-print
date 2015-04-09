(function($) {
	$.fn.printAll = function(options) {
		var defaultOptions = $.defaultOptions;
		options = $.extend(defaultOptions,options);
		$printAll = $('#printAll');
		$printAll.flash(
			{
				swf: options.context + '/chest-print/print.swf',
				width: 1,
				height: 1,
				allowScriptAccess : 'always'
			}
		);
		return this;
	};
	
	$.fn.printAll.print = function(printInfo) {
		$printAll.flash(
			function() {
				this.printAll(printInfo);
			}
		);
	}; 
	
	$.defaultOptions = {
		context:'.'
    };
}(jQuery));
