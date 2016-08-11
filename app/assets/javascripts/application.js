// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).on('turbolinks:load', function() {


  var pushy = $('.pushy'), //menu css class
		body = $('body'),
		container = $('#container'), //container css class
		push = $('.push'), //css class to add pushy capability
		pushyLeft = 'pushy-left', //css class for left menu position
		pushyOpenLeft = 'pushy-open-left', //css class when menu is open (left position)
		pushyOpenRight = 'pushy-open-right', //css class when menu is open (right position)
		siteOverlay = $('.site-overlay'), //site overlay
		menuBtn = $('.menu-btn, .pushy-link'), //css classes to toggle the menu
		menuSpeed = 200, //jQuery fallback menu speed
		menuWidth = pushy.width() + 'px', //jQuery fallback menu width
		submenuClass = '.pushy-submenu',
		submenuOpenClass = 'pushy-submenu-open',
		submenuClosedClass = 'pushy-submenu-closed',
		submenu = $(submenuClass);

	function togglePushy(){
		//add class to body based on menu position
		if( pushy.hasClass(pushyLeft) ){
			body.toggleClass(pushyOpenLeft);
		}else{
			body.toggleClass(pushyOpenRight);
		}
	}

	function openPushyFallback(){

		//animate menu position based on CSS class
		if( pushy.hasClass(pushyLeft) ){
			body.addClass(pushyOpenLeft);
			pushy.animate({left: "0px"}, menuSpeed);
			container.animate({left: menuWidth}, menuSpeed);
			//css class to add pushy capability
			push.animate({left: menuWidth}, menuSpeed);
		}else{
			body.addClass(pushyOpenRight);
			pushy.animate({right: '0px'}, menuSpeed);
			container.animate({right: menuWidth}, menuSpeed);
			push.animate({right: menuWidth}, menuSpeed);
		}

	}

	function closePushyFallback(){

		//animate menu position based on CSS class
		if( pushy.hasClass(pushyLeft) ){
			body.removeClass(pushyOpenLeft);
			pushy.animate({left: "-" + menuWidth}, menuSpeed);
			container.animate({left: "0px"}, menuSpeed);
			//css class to add pushy capability
			push.animate({left: "0px"}, menuSpeed);
		}else{
			body.removeClass(pushyOpenRight);
			pushy.animate({right: "-" + menuWidth}, menuSpeed);
			container.animate({right: "0px"}, menuSpeed);
			push.animate({right: "0px"}, menuSpeed);
		}

	}

	function toggleSubmenu(){
		//hide submenu by default
		$(submenuClass).addClass(submenuClosedClass);

		$(submenuClass).on('click', function(){
	        var selected = $(this);

	        if( selected.hasClass(submenuClosedClass) ) {
	            //hide opened submenus
	            $(submenuClass).addClass(submenuClosedClass).removeClass(submenuOpenClass);
	            //show submenu
	            selected.removeClass(submenuClosedClass).addClass(submenuOpenClass);
	        }else{
	            //hide submenu
	            selected.addClass(submenuClosedClass).removeClass(submenuOpenClass);
	        }
	    });
	}

    function toggleSubmenuFallback(){
    	//hide submenu by default
    	$(submenuClass).addClass(submenuClosedClass);

    	submenu.children('a').on('click', function(event){
    		event.preventDefault();
    		$(this).toggleClass(submenuOpenClass)
    			   .next('.pushy-submenu ul').slideToggle(200)
    			   .end().parent(submenuClass)
    			   .siblings(submenuClass).children('a')
    			   .removeClass(submenuOpenClass)
    			   .next('.pushy-submenu ul').slideUp(200);
    	});
    }

	//checks if 3d transforms are supported removing the modernizr dependency
	var cssTransforms3d = (function csstransforms3d(){
		var el = document.createElement('p'),
		supported = false,
		transforms = {
		    'webkitTransform':'-webkit-transform',
		    'OTransform':'-o-transform',
		    'msTransform':'-ms-transform',
		    'MozTransform':'-moz-transform',
		    'transform':'transform'
		};

		// Add it to the body to get the computed style
		document.body.insertBefore(el, null);

		for(var t in transforms){
		    if( el.style[t] !== undefined ){
		        el.style[t] = 'translate3d(1px,1px,1px)';
		        supported = window.getComputedStyle(el).getPropertyValue(transforms[t]);
		    }
		}

		document.body.removeChild(el);

		return (supported !== undefined && supported.length > 0 && supported !== "none");
	})();

	if(cssTransforms3d){
		//make menu visible
		pushy.css({'visibility': 'visible'});

		//toggle submenu
		toggleSubmenu();

		//toggle menu
		menuBtn.on('click', function(){
			togglePushy();
		});
		//close menu when clicking site overlay
		siteOverlay.on('click', function(){
			togglePushy();
		});
	}else{
		//add css class to body
		body.addClass('no-csstransforms3d');

		//hide menu by default
		if( pushy.hasClass(pushyLeft) ){
			pushy.css({left: "-" + menuWidth});
		}else{
			pushy.css({right: "-" + menuWidth});
		}

		//make menu visible
		pushy.css({'visibility': 'visible'});
		//fixes IE scrollbar issue
		container.css({"overflow-x": "hidden"});

		//keep track of menu state (open/close)
		var opened = false;

		//toggle submenu
		toggleSubmenuFallback();

		//toggle menu
		menuBtn.on('click', function(){
			if (opened) {
				closePushyFallback();
				opened = false;
			} else {
				openPushyFallback();
				opened = true;
			}
		});

		//close menu when clicking site overlay
		siteOverlay.on('click', function(){
			if (opened) {
				closePushyFallback();
				opened = false;
			} else {
				openPushyFallback();
				opened = true;
			}
		});
	}



  //
  //
  //
  //

  // Masonry Wall homepage
  //
  //
  //
  //
  $.fn.mpmansory = function ( options ) {

    var settings = $.extend({
      childrenClass: '',
      breakpoints: {
          lg: 4,
          md: 4,
          sm: 6,
          xs: 12
      },
      distributeBy: {
        attr: 'data-order',
        attrOrder: 'asc',
        order: false,
        height: false
      },
      onload: function ( items ) {
        return true;
      }

    }, options);

    Array.min = function( array ){
        return Math.min.apply( Math, array );
    };

    $.emptyArray = function ( array ) {
      for (var i = 0; i<array.length; i++) {
        array[i].remove();
      }

      return new Array();
    }

    $.fn.initialize = function ( columns, classStr ) {
      /*
       * @params [string] {classStr} - the bootstrap column string
       * @return [Array] - list of columns to create
       * @description - creates the grid columns in wich the items will be distributed
       */

      var cols = [];

      for (var i = 0; i<columns; i++) {

        var wrap = $('<div></div>');
        wrap.addClass(classStr);
        $(this).append(wrap);
        cols.push(wrap);

      }

      return cols;

    }

    $.fn.distributeItemsByHeight = function ( wrappers, items ) {
      /*
       * @params [Array] {wrappers} - the array containing the columns elements
       * @params [Array] {items} - the array containing items
       * @description - distribute the items through the columns - to the columns with lowest height
       */
      var counter = 0;

      for (var k = 0; k<items.length; k++) {

        var $heights = new Array();

        for (var i = 0; i<wrappers.length; i++ ) {

          //get the wrappers height

          $heights.push(wrappers[i].height());

        }

        //get the wrapper with the lowest height
        var min = Array.min($heights) == Number.POSITIVE_INFINITY || Array.min($heights) == Number.NEGATIVE_INFINITY ? 0 : Array.min($heights);
        wrappers[$heights.indexOf(min)].append(items[k]);

      }

    }

    $.fn.getCurrentColumnSize = function () {

      if ($(window).width() > 1200) {
        return 'lg';
      } else if ($(window).width() > 992) {
        return 'md';
      } else if ($(window).width() > 720) {
        return 'sm';
      } else if ($(window).width() > 480) {
        return 'xs';
      } else if ($(window).width() > 320) {
        return 'xs';
      } else {
        return 'xs';
      }

    }

    $.fn.distributeItemsByOrder = function ( wrappers, items ) {
      /*
       * @params [Array] {wrappers} - the array containing the columns elements
       * @params [Array] {items} - the array containing items
       * @description - distribute the items through the columns - to the columns with lowest height
       */
      var counter = 0;

      for (var k = 0; k<items.length; k++) {
        if (counter == wrappers.length) counter = 0;
        wrappers[counter].append(items[k]);
        counter++;
      }

    }

    $.fn.orderItemsByAttr = function (items, order) {

      var attrs = new Array();
      for ( var k = 0; k<items.length; k++ ) {
        attrs.push($(items[k]).attr(order.attr));
      }

      if  (order.attrOrder == 'asc') {
        attrs.sort(function (a, b) { return a-b });
      } else {
        attrs.sort(function (a, b) { return b-a });
      }

      var ordered_items = new Array();

      for ( var i = 0; i<attrs.length; i++) {
        var item = $.grep(items, function (e) {return $(e).attr(order.attr) == attrs[i]});
        ordered_items.push(item);
      }
      return ordered_items;
    }

    $.fn.distributeItemsByAttr = function ( wrappers, items, order) {

      var counter = 0;
      var counter2 = 0;

      for (var i = 0; i<items.length; i++) {

        if (counter == wrappers.length) counter = 0;
        if ( items[i].length > 1) {
          if (counter2 == items[i].length) counter2 = 0;
          wrappers[counter].append($(items[i][counter2]));
          counter2++;
        } else {
          wrappers[counter].append($(items[i]));
        }
        counter++;
      }
    }

    $.fn.apply = function ( settings, nrOfColumns, wrappers, items ) {

      var _this = $(this);

      var currentSize = _this.getCurrentColumnSize();

      var columns = nrOfColumns; //find number of columns

      //build the bootstrap class string
      var classStr = "col-lg-" + settings.breakpoints.lg + " col-md-"+settings.breakpoints.md + " col-sm-" + settings.breakpoints.sm + " col-xs-" + settings.breakpoints.xs + " " + settings.columnClasses;

      wrappers = $(this).initialize( columns, classStr ); //create columns'white

      if ( settings.distributeBy.order ) {
        _this.distributeItemsByOrder( wrappers, items); //apply mansory
      } else if ( settings.distributeBy.height ) {
        _this.distributeItemsByHeight( wrappers, items); //apply mansory
      } else if ( settings.distributeBy.attr ) {
        _this.distributeItemsByAttr( wrappers, _this.orderItemsByAttr(items, settings.distributeBy), settings.distributeBy);
      }
      return { wrappers: wrappers, items: items };
    }



    return this.each(function () {

      var _this = $(this);

      var currentSize = _this.getCurrentColumnSize();

      var numberOfColumns = 12 / settings.breakpoints[currentSize];

      var items = _this.children( (settings.childrenClass != '' ? '.'+settings.childrenClass : 'div') );

      var wrappers = new Array();

      var returns = _this.apply( settings, numberOfColumns, wrappers, items );

      wrappers = returns.wrappers;

      $(window).on('resize', function ( e ) {

        if (_this.getCurrentColumnSize() != currentSize ) {
          numberOfColumns = 12 / settings.breakpoints[_this.getCurrentColumnSize()];
          wrappers = $.emptyArray(wrappers);
          returns = _this.apply( settings , numberOfColumns, wrappers, items);
          wrappers = returns.wrappers;
          currentSize = _this.getCurrentColumnSize();

        }

      });

      if (settings.hasOwnProperty('onload')) {

        //execute on load
        settings.onload( items );

      }

    });
  }

  $("#my-gallery-container").mpmansory(
    {
      childrenClass: 'item', // default is a div
      columnClasses: 'padding', //add classes to items
      breakpoints:{
        lg: 3,
        md: 4,
        sm: 6,
        xs: 12
      },
      distributeBy: { order: false, height: false, attr: 'data-order', attrOrder: 'asc' }, //default distribute by order, options => order: true/false, height: true/false, attr => 'data-order', attrOrder=> 'asc'/'desc'
      onload: function (items) {
        //make somthing with items
      }
    }
  );


});
