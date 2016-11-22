(function( window, document, $ ){
	
	var agentInfo = {}, 
	ag = navigator.userAgent.toLowerCase();
	
	if( ag.indexOf( 'firefox' ) > -1 ){
		agentInfo.isFF = true;
	}else if( ag.indexOf( 'chrome' ) > -1 ){
		agentInfo.isCR = true;
	}else if( ag.indexOf( 'msie' ) > -1 ){
		agentInfo.isIE = true;
	}else if( ag.indexOf( 'safari' ) > -1 ){
		agentInfo.isSF = true;
	}else if( ag.indexOf( 'opera' ) > -1 ){
		agentInfo.isOP = true;
	}else if( ag.indexOf( 'netscape' ) > -1 ){
		agentInfo.isNS = true;
	};
	
	window.agentInfo = agentInfo;
	
})( window, document, jQuery );

(function( window, document, $ ){
	if( $ === undefined ){
		return;
	}

	/**
	 * @description jQuery 플러그인 생성. jQuery.data 속성을 확인한 후 객체를 생성하거나, 객체의 함수를 호출한다.
	 * @param {Object} ns 생성할 이름.
	 * @param {Object} Cls 생성할 클래스명.
	 *  */
	$.addPlugin = function( ns, Cls ){
		// jQuery 함수를 호출한다.
		$.fn[ns] = function(options) {
			var args = arguments, that = this, $this, instance;
			if(this.length==0){
				return;
			}
			//셀렉터로 검색된 것이 여러개일경우 반환 함수에서 넘겨줄값은 0번째 jQuery객체의 값으로 반환.
			if( typeof options === "string" && (/get_/gi).test( String(options) ) ){ // 문자열이고 "get_"를 포함하고 있으면 리턴가능한 함수 호출.
				//var i=0, len=that.length;
				//for( ;i<len;i+=1 ){
				$this = $(that[0]);
				instance = $this.data( ns );
				//
				if( instance ){
					if( instance[options] ){
						return instance[options].apply( instance, Array.prototype.slice.call(args, 1));
					}
				}
				//}
			}else{ // 플러그인 생성 또는 일반 함수 호출일 경우
				return this.each( function(){
					$this = $(this);
					instance = $this.data( ns );
					//
					if (instance) {
						if( typeof options === 'object' ){
							if( typeof instance.update === 'function'  ){
								instance.update.apply(instance, args);
							}
						}else{
							if( instance[options] ){
								instance[options].apply( instance, Array.prototype.slice.call(args, 1));
							}
						}
					}else {
						new Cls().init($this, options);
					}
				} );
			}
		};
	};
	
	
	/**
	 * @description jQuery.ajax() 호출, id 넘길시 자동 삭제.
	 * @param 첫번째 파라미터가 id일 경우에는 두번째 파라미터가 url, 세번째 파라미터가 object 여도 상관없음.
	 * 첫번째 파리미터가 url 일때 두번째 파라미터가 object이면 첫번째 파라미터 id로 인식
	 * abort 미사용시에 object에 모든 정보를 넘겨서 사용해야함. 
	 * @example
	 * $.cAjax( 'id', url, options );
	 * $.cAjax( 'id', options );
	 * $.cAjax( options );
	 * */
	$.cAjax = function( options ){
		var args = arguments;
		
		if( window['___custom_ajax_xhr_list___'] === undefined ){
			window['___custom_ajax_xhr_list___']  = {};
		}
		
		if( typeof options === 'object' ){
			return $.ajax.apply( $, args );
		}
		
		if( typeof options === 'string' ){
			if( options === '' ){
				return $.ajax.apply( $, Array.prototype.slice.call(args, 1) );
			}else{
				var reqList = window['___custom_ajax_xhr_list___'];
				request = $.ajax.apply( $, Array.prototype.slice.call(args, 1) );
				if( reqList[options] !== undefined ){
					$.cAbort( options );
				}
				return reqList[options] = request;
			}
		}
	}
	
	/**
	 * @description ajax abort 이미 지정되거나 저장된 xhr 객체 abort
	 * @param {String} 아이디.
	 * @param {Boolean} 객체 삭제여부.
	 * @example 
	 * $.cAbort( 'id' ); // 지정객체 abort, 삭제
	 * $.cAbort( '___all___' ); // 모든 객체 abort, 삭제
	 * */
	$.cAbort = function( id, isremoved ){
		var reqList = window['___custom_ajax_xhr_list___'];
		if( typeof id === 'string' ){
			if( id === '___all___' ){
				for( var key in reqList ){
					reqList[key].abort();
					if( isremoved === true ){
						reqList[key] = null;
						delete reqList[key];
					}
				}
			}else{
				if( reqList !== undefined ){
					if( reqList[ id ] !== undefined ){
						reqList[ id ].abort();
						if( isremoved === true ){
							reqList[key] = null;
							delete reqList[key];
						}
					}
				}
			}
		}
	};
	
	/**
	 * @description 이벤트 전파 완전 차단.
	 * @param {Object} jquery, javascript 이벤트 객체.
	 * */
	$.stopEvent = function( e ){
		e = e || window.event;
		e = e.originalEvent || e || window.event;
		if( typeof e.preventDefault === 'function' ){ // other ...
			e.preventDefault();
			e.stopPropagation();
		} else { // IE
			e.returnValue = false;
			e.cancelBubble = true;
		};
	};

})( window, document, jQuery );


(function( window, document, $ ){
	//'use strict'; // 개발후 주석처리 필요.

	
	var SimpleBlock = function(){
		if( !(this instanceof SimpleBlock) ){
			return new SimpleBlock();
		}
	};

	SimpleBlock.prototype = {
		_$layer:null,
		_$contents:null,
		_$blockLayer:null,
		_options:{
			id: '',
			closeSelector: '',
			layerHtml: '',
			backgroundCssText: '',
			backgroundClassName: '',
			zIndex: 555,
			opened: false,
			onOpen: null,
			onClose: null
		},
		init: function( options ){
			var opts = {};
			opts.id = options.id || '';
			opts.closeSelector = options.closeSelector || '';
			opts.layerHtml = options.layerHtml || '';
			opts.opened = options.opened === undefined? false : options.opened;
			opts.onOpen = typeof options.onOpen !== 'function'? null : options.onOpen;
			opts.onClose = typeof options.onClose !== 'function'? null : options.onClose;
			opts.backgroundCssText = options.backgroundCssText || '';
			opts.backgroundClassName = options.backgroundClassName || '';
			opts.zIndex = options.zIndex || 555;
			opts.keep = options.keep===undefined? false : options.keep;


			var $layer = this._$blockLayer;
			if( $layer===null || $layer.length == 0 ) {
				var html = opts.layerHtml;
				if( $.trim(html).length==0 ){
					html += '<div id="mot_ui_simple_block_wrap" ';
					html += 'class="' + opts.backgroundClassName + '" '
					html += 'style="';
					html += 'display:none;';
					if( opts.backgroundCssText.length > 0 ){
						html += 'background:' + opts.backgroundCssText +';';
					}
					html += 'height:'+100+'%;';
					html += 'width:100%;';
					html += 'left:0;';
					html += 'top:0;';
					html += 'position:fixed;';
					html += 'z-index:'+ opts.zIndex +';';
					html += '"></div>';
				}
				$('body').append( html );
				
				$layer = this._$blockLayer = $('#mot_ui_simple_block_wrap');
			}
			
			this._options = opts;

			if( opts.opened && opts.id.length > 0  ){
				this.show();
			}
		},
		//id, cId, onOpen, onClose, keep
		show: function( options ){
			var that = this,
			id = options.id,
			cId = options.closeSelector,
			onOpen = options.onOpen,
			onClose = options.onClose,
			keep = options.keep,
			contentsId =  id,
			$layer = '',
			$contents = '',
			closeId = cId || this._options.closeSelector,
			$bgLayer = this._$blockLayer;
			

			this._options.keep = this._options.keep === undefined? false : options.keep;
			
			if( this._options.id != id ){
				this._options.onOpen = typeof onOpen !== 'function'? null : onOpen;
				this._options.onClose = typeof onClose !== 'function'? null : onClose;
			}else{
				this._options.onOpen = typeof onOpen !== 'function'? this._options.onOpen : onOpen;
				this._options.onClose = typeof onClose !== 'function'? this._options.onClose : onClose;
			}
			/*
			if( this._options.keep ){
				if( this._options.id != id ){
					contentsId =  id;
					//$layer.html( $( '#' + contentsId ).html() );
				}else{
					contentsId =  this._options.id
					//if( $layer.children().length == 0 ){
						//$layer.html( $( '#' + contentsId ).html() ); 
					//}
				}
			}else{
				contentsId =  id || this._options.id;
				//$layer.html( $( '#' + contentsId ).html() );
			}
			*/
			
			this._options.id = contentsId;
			this._options.closeSelector = closeId;
			

			$layer = $('#'+contentsId);
			$contents = $( $layer.children()[0] );
			
			// ie7 대응.
			if( ( window.navigator.userAgent.toLowerCase() ).indexOf( 'msie 7.0' ) > -1 ){
				$layer.appendTo('body');
			}

			$bgLayer.show();

			$layer.css({
				position: 'fixed',
				width: '100%',
				top:0,
				left:0,
				zIndex: this._options.zIndex+1
			});
			

			$contents.css({
				position: 'absolute',
				zIndex: this._options.zIndex+2
			});
			
			this._$layer = $layer;
			this._$contents = $contents; 
			this._$bgLayer = $bgLayer;
			
			
			$(window).off( 'resize', this.resizeHandle ).on( 'resize', this, this.resizeHandle);
			$layer.show();
			this.setSize();
			
			//
			if( closeId.length > 0  ){
				$layer.find( closeId ).off('click').on( 'click', function(){
					that.closeHandle();
				} );
			}

			if( typeof this._options.onOpen === 'function' ){
				this._options.onOpen.apply( null );
			}
			
			// open시 최상위 스크롤 숨김처리
			$("body").css({"overflow-y" :"hidden"});
		},
		hide: function( bool ){
			var $bgLayer = this._$blockLayer,
			$layer = $('#'+this._options.id),
			stat = bool === undefined?  true : bool;
			$bgLayer.find( this._options.closeSelector ).off( 'click' );
			if( !this._options.keep ){
				//$bgLayer.html('');
			}
			
			$(window).off( 'resize', this.resizeHandle );
			
			$layer.hide();
			
			if( stat ){
				$bgLayer.hide();
			}
			if( typeof this._options.onClose === 'function' ){
				this._options.onClose.apply( null );
			}
			
			// open시 최상위 스크롤 복구
			$("body").css({"overflow-y" :"visible"});
		},
		setSize: function(){
			var $layer = this._$layer,
			$contents = this._$contents, 
			$bgLayer = this._$bgLayer,
			body = document.body,
			cw = body.clientWidth,
			ch = body.clientHeight,
			w = $contents.width(),
			h = $contents.height(),
			top = (ch - h)*0.5,
			left = (cw - w)*0.5;
			
			$bgLayer.css({
				width: '100%',
				height: body.clientHeight
			});
			
			$layer.css({
				width: '100%',
				height: body.clientHeight
			});
			
			$contents.css({
				top: top,
				left: left
			});
			
		},
		resizeHandle: function( e ){
			e.data.setSize();
		},
		closeHandle: function(){
			this.hide();
		}
	};


	/**
	 *
	 * @description 심플 블럭. 배경의 클래스 명이나 cssText를 넣는다.
	 * @param {Object} 옵션값
	 * @example
	 * $.simpleBlock({
			id: 'car-use-tmpl',
			closeSelector: 'car-use-close',
			backgroundCssText: 'url(../../images/popup/bg_fix.png) 0 0 repeat',
			backgroundClassName: '',
			zIndex: 555, // 선택
			opened: true,
			keep: false,
			onOpen: function(){
				console.log( 'return onOpen' );
			},
			onClose: function(){
				console.log( 'return onClose' );
			}
		});

		$.simpleBlock( 'show', '컨텐츠 아이디', '닫기 아이디', 팝업열기 콜백함수, 팝업닫기 콜백함수 );
		$.simpleBlock( 'hide' );
	 *  */
	$.simpleBlock = function( options ){
		var args = arguments;

		if( window['___motuiSimpleBlock___'] === undefined ){
			window['___motuiSimpleBlock___'] = new SimpleBlock();
		}

		var _simpleBlock = window['___motuiSimpleBlock___'];
		
		if( typeof options === 'object' ){
			_simpleBlock.init( options );
		}else if( typeof options === 'string' ){
			_simpleBlock[options].apply( _simpleBlock, Array.prototype.slice.call(args, 1) );
		}
		
	}

	
	

})( window, document, jQuery );

(function(window, document, $){
	
	/*
	    Copyright 2011 Andrey Zholos
	
	    Permission is hereby granted, free of charge, to any person obtaining
	    a copy of this software and associated documentation files (the
	    "Software"), to deal in the Software without restriction, including
	    without limitation the rights to use, copy, modify, merge, publish,
	    distribute, sublicense, and/or sell copies of the Software, and to
	    permit persons to whom the Software is furnished to do so, subject to
	    the following conditions:
	
	    The above copyright notice and this permission notice shall be included
	    in all copies or substantial portions of the Software.
	
	    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
	    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
	    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
	    CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
	    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
	    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	*/
	
	function Bitmap(width, height) {
	    this.width = width;
	    this.height = height;
	    this.pixel = new Array(width);
	    for (var x = 0; x < width; x++) {
	        this.pixel[x] = new Array(height);
	        for (var y = 0; y < height; y++)
	            this.pixel[x][y] = [0, 0, 0, 0];
	    }
	}
	
	Bitmap.prototype.subsample = function(n) {
	    var width = ~~(this.width / n);
	    var height = ~~(this.height / n);
	    var pixel = new Array(width);
	    for (var x = 0; x < width; x++) {
	        pixel[x] = new Array(height);
	        for (var y = 0; y < height; y++) {
	            var q = [0, 0, 0, 0];
	            for (var i = 0; i < n; i++)
	                for (var j = 0; j < n; j++) {
	                    var r = this.pixel[x*n+i][y*n+j];
	                    q[0] += r[3] * r[0];
	                    q[1] += r[3] * r[1];
	                    q[2] += r[3] * r[2];
	                    q[3] += r[3];
	                }
	            if (q[3]) {
	                q[0] /= q[3];
	                q[1] /= q[3];
	                q[2] /= q[3];
	                q[3] /= n * n;
	            }
	            pixel[x][y] = q;
	        }
	    }
	    this.width = width;
	    this.height = height;
	    this.pixel = pixel;
	}
	
	Bitmap.prototype.dataURL = function() {
	    function sample(v) {
	        return ~~(Math.max(0, Math.min(1, v)) * 255);
	    }
	
	    function gamma(v) {
	        return sample(Math.pow(v, .45455));
	    }
	
	    function row(pixel, width, y) {
	        var data = "\0";
	        for (var x = 0; x < width; x++) {
	            var r = pixel[x][y];
	            data += String.fromCharCode(gamma(r[0]), gamma(r[1]),
	                                        gamma(r[2]), sample(r[3]));
	        }
	        return data;
	    }
	
	    function rows(pixel, width, height) {
	        var data = "";
	        for (var y = 0; y < height; y++)
	            data += row(pixel, width, y);
	        return data;
	    }
	
	    function adler(data) {
	        var s1 = 1, s2 = 0;
	        for (var i = 0; i < data.length; i++) {
	            s1 = (s1 + data.charCodeAt(i)) % 65521;
	            s2 = (s2 + s1) % 65521;
	        }
	        return s2 << 16 | s1;
	    }
	
	    function hton(i) {
	        return String.fromCharCode(i>>>24, i>>>16 & 255, i>>>8 & 255, i & 255);
	    }
	
	    function deflate(data) {
	        var len = data.length;
	        return "\170\1\1" +
	            String.fromCharCode(len & 255, len>>>8,
	                                ~len & 255, (~len>>>8) & 255) +
	            data + hton(adler(data));
	    }
	
	    function crc32(data) {
	        var c = ~0;
	        for (var i = 0; i < data.length; i++)
	            for (var b = data.charCodeAt(i) | 0x100; b != 1; b >>>= 1)
	                c = (c >>> 1) ^ ((c ^ b) & 1 ? 0xedb88320 : 0);
	        return ~c;
	    }
	
	    function chunk(type, data) {
	        return hton(data.length) + type + data + hton(crc32(type + data));
	    }
	
	    function base64(data) {
	        enc = "";
	        for (var i = 5, n = data.length * 8 + 5; i < n; i += 6)
	            enc +=
	            "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"[
	                (data.charCodeAt(~~(i/8)-1) << 8 | data.charCodeAt(~~(i/8))) >>
	                7 - i%8 & 63];
	        for (; enc.length % 4; enc += "=");
	        return enc;
	    }
	
	    var png = "\211PNG\r\n\32\n" +
	        chunk("IHDR", hton(this.width) + hton(this.height) + "\10\6\0\0\0") +
	        chunk("IDAT", deflate(rows(this.pixel, this.width, this.height))) +
	        chunk("IEND", "");
	
	    return "data:image/png;base64," + base64(png);
	}
	
	
	function hexToRgb( hstr ){
		var h = hstr.replace( /\#/gi, '' );
		r = parseInt( h.substring(0,2),16 ),
		g = parseInt( h.substring(2,4),16 ),
		b = parseInt( h.substring(4,6),16 );
		
		return [ r, g, b ];
	}
	
	var __namespace = 'preloading';
	var Loader = function(){
		if( !( this instanceof Loader ) ){
			return new Loader();
		}
	};
	
	Loader.prototype = {
			_$dom : null,
			_$loader : null,
			_options : {},
			_defaults : {
				background : '#FFFFFF',
				backgroundOpacity: 0.5,
				loaderPath : __globalContextPath + '/images/common/loding1.gif'
			},
			init : function( $dom, options ){
				this._$dom = $dom;
				if( typeof options === 'object' ){
					this._options.background = options.background || this._defaults.background;
					this._options.backgroundOpacity = options.backgroundOpacity || this._defaults.backgroundOpacity;
					this._options.loaderPath = options.loaderPath || this._defaults.loaderPath;
				}else{
					this._options = this._defaults;
				};
				
				if( typeof options === 'string' ){
					if( options == 'show' ){
						this[options].call( this );
						return $dom.data( __namespace, this );
					}else{
						return $dom.data( __namespace, this );
					}
				}
				
				this.make();
				//
				return $dom.data( __namespace, this );
			},
			update : function(){
				this.destroy();
				init();
			},
			destroy : function(){
				this._$dom.find( '.preloading-plugin-dom' ).remove();
				init();
			},
			make : function(){
				if( this._$loader === null ){
					var that = this;
					var opts = this._options, 
					html = '',
					rgbs = hexToRgb( opts.background );
					rgbs.push( opts.backgroundOpacity );
					
					var bmp = new Bitmap( 1, 1 );
					bmp.pixel[0][0] = rgbs;
					
					
					html += '<div class="preloading-plugin-dom" style="display:none;position:absolute;z-index:9903;width:'+this._$dom.width()+'px;height:'+this._$dom.height()+'px;left:0;top:0;" >';
					html += '<div style="position:fixed;width:'+this._$dom.css('width')+';height:'+this._$dom.css('height')+';background-image:url( '+ bmp.dataURL() +' );background-repeat: repeat;" >';
					html += '<div class="preloading-plugin-loader-container" style="left:50%;top:50%;position:absolute;" >';
					//html += '<img src="'+ opts.loaderPath +'" alt="로딩중" />'
					html += '</div></div></div>';
					this._$dom.append( html );
					this._$loader = this._$dom.find( '.preloading-plugin-dom' );
					
					var img = document.createElement('img');
					img.setAttribute( 'src', opts.loaderPath );
					img.setAttribute( 'alt', '로딩중' );
					
					img.onload = function(e){
						that._$loader.find( '.preloading-plugin-loader-container' ).append( img );
						$(img).css({
							marginLeft : img.width * -0.5,
							marginTop : img.height * -0.5
						});
					}
					
				}
			},
			show : function(){
				if( this._$loader === null ){
					this.make();
				}
				this._$loader.show();
			},
			hide : function(){
				this._$loader.hide();
			}
	};
	
	
	$.addPlugin( 'preloading', Loader );
	
})(window, document, jQuery);



(function( window, document, $ ){
	'use strict'; // 개발후 주석처리

	/**
	 * 애니메이션 프레임 실행 함수 반환.
	 * */
	window.requestAnimationFrame = (function() {
		return window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame|| window.msRequestAnimationFrame || function(callback) { return setTimeout(callback, 16); };
	})();


	/**
	 * 애니메이션 프레임 취소 함수 반환.
	 * */
	window.cancelAnimationFrame = (function () {
		return window.cancelAnimationFrame || window.webkitCancelAnimationFrame|| window.mozCancelAnimationFrame|| window.msCancelAnimationFrame || clearTimeout;
	})();

	// undefined {String}
	var strundefined = typeof undefined,
	
	
	// motUi 
	mui = window['motUi'];
	
	// module core check
	if( typeof window['motUi'] === 'undefined' ){
		window['motUi'] = mui = {};
	}
	
	
	function getEventName(){
		var evtNm = {
			start : 'mousedown',
			end : 'mouseup',
			move : 'mousemove',
			cancel : 'mouseup'
		};
		
		if('ontouchstart' in window){ //  other mobile browser
            evtNm.start = 'touchstart';
            evtNm.move  = 'touchmove';
            evtNm.end = 'touchend';
            evtNm.cancel = 'touchcancel';
       } else if(window.navigator.msPointerEnabled && window.navigator.msMaxTouchPoints > 0) { // ie mobile browser
            evtNm.start = 'MSPointerDown';
            evtNm.move  = 'MSPointerMove';
            evtNm.end = 'MSPointerUp';
            evtNm.cancel = 'MSPointerCancel';
        }
        
        return evtNm;
	};
	
	mui.m = {
		// browser prefix
		_prefix : null,
		_transition : null,
		_transitionEnd : null,
		_isTransition : false,
		_touchEventName : getEventName(),
		/**
		 * css prefix.
		 * */
		getCssPrefix : function() {
			if( this._prefix !== null ){
				return this._prefix;
			}
			//
            this._prefix = "";
            //
            if(typeof document.body.style.MozTransition !== "undefined") {
                this._prefix = "Moz";
            } else if(typeof document.body.style.OTransition !== "undefined") {
                this._prefix = "O";
            } else if(typeof document.body.style.msTransition !== 'undefined'){
                this._prefix = "ms";
            } else {
                this._prefix = "webkit";
            }
            return this._prefix;
        },
        getTransitionProperty : function(){
        	
        	if( this._transition!==null ){
        		return this._transition;
        	}
        	
        	var that = this,
        	elm = document.body || document.documentElement, 
        	property = 'transition',
			prefix = that.getCssPrefix(),
			style = elm.style;
        	
        	if ( prefix.length==0 ) {
				return property;
			}
			
			// Prefixed
			property = property.charAt(0).toUpperCase() + property.substr(1);
			
			this._transition = prefix + property;
			if ( this._transition in style ) {
				return this._transition;
			}
			
			// Not supported
			return false;
        },
        getTransitionState : function(){
        	var elm = document.body || document.documentElement;
        	return elm.style[this.getTransitionProperty()]===undefined? false : true;
        },
        getTransitionEnd : function(){
        	if( this._transitionEnd!==null ){
        		return this._transitionEnd;
        	}
        	
        	var map = {
				'transition':       'transitionend',
				'MozTransition':    'transitionend',
				'msTransition':     'msTransitionEnd',
				'OTransition':      'oTransitionEnd otransitionend',
				'webkitTransition': 'webkitTransitionEnd'
			};
			
			if( this._transition === null ){
				this._transition = this.getTransitionProperty();
			};
			
			this._transitionEnd = map[this._transition];
			return this._transitionEnd;
        },
        getTouchEventName : function(){
        	return this._touchEventName;
        }
	};
	
	mui.event = {
		/**
		 * event binding
		 * context, binding function, parameter 
		 *  */
		bind: function( obj, func, params ){
		return function( e ){
				if( e!==undefined ){
					var evt = e.originalEvent || e || window.event;
					return func.call( obj, evt, params );
				}else{
					return func.call( obj, params );
				}
				
			};
		},
		/**
		 * stop event
		 *  */
		fire : function(e){
			if( typeof e.preventDefault === 'function' ){ // other ...
				e.preventDefault();
				e.stopPropagation();
			} else { // IE
				e.returnValue = false;
				e.cancelBubble = true;
			}
		}
	};
	
	
	mui.util = {
		/**
		 * 
		 * @return {Number} 
		 *  */
		toFloatFromPx : function (str){
			return parseFloat(str.replace(/px/ig, ''), 10);
		},
		/**
		 * 
		 * @return {Number} 
		 *  */
		toIntFromPx : function ( str ){
			return parseInt(str.replace(/px/ig, ''));
		},
		/**
		 * transform에서 translate,translate3d의 left와 top 값을 추출
		 * @return {Object} top,left
		 *  */
		getCssOffsetFromStyle : function( elm ){
			var top = 0,
	        left = 0,
	        arr = null,
	        s = element.style[ mui.m.getCssPrefix() + "Transform"];
	        if(!!s && s.length >0){
	        	arr = s.match(/translate.{0,2}\((.*)\)/);
	            if(!!arr && arr.length >1){
	                var a = arr[1].split(',');
	                if(!!a && a.length >1){
	                    top = parseInt(a[1],10);
	                    left = parseInt(a[0],10);
	                }
	            }
	        }
	        return {
	            top : top,
	            left : left
	        };
		},
		/**
		 * WebKitCSSMatrix를 이용하여 left, top 값을 추출
		 * @return {Object} top, left
		 *  */
		getCssOffsetFromCSSMatrix : function( elm ){
			var curTransform  = new WebKitCSSMatrix(window.getComputedStyle(elm).webkitTransform);
        	return {
	            top : curTransform.m42,
	            left : curTransform.m41
	        };
		}
	};

	// set module object
	mui.module = {};
	
})( window, document, jQuery );


(function( window, document, $ ){
	'use strict'; // 개발후 주석처리
	var mui = motUi,
		fNamespace = 'muiFlicking',
		rfNamespace = 'muiRazyFlicking';

	// 이벤트 객체 반환
	function _getEventObj(e){
		e = e.originalEvent || e || window.event;
		return e;
	};
	
	// 터치 객체 반환
	function _getEventTouchObj(e){
		var touch;
		if(  e.type.indexOf('touch') > -1 ){
			touch = e.touches[0] ? e.touches[0] : e.changedTouches[0];
		}else{
			touch = e || window.event;
			if( touch.pageX == undefined ){
				touch.pageX = touch.clientX;
			};
			if( touch.pageY == undefined ){
				touch.pageY = touch.clientY;
			};
		};
		return touch;
	};


	var CDragEvent = function(){
		if( !( this instanceof CDragEvent ) ){
			return new CDragEvent();
		}
	};

	CDragEvent.prototype = (function(){
		var oEvtNm = mui.m._touchEventName;
		return {
			constructor : CFlicking,
			version : '0.1.0',
			_callbackContext : null, // callback event context
			_context : null, // jquery element
			_startCallback : null, // function
			_endCallback : null, // function
			_moveCallback : null, // function
			_cancleCallback : null, // function
			_default : {
				originalEvent : null,
				startTime : 0,
				endTime : 0,
				gabTime : 0,
				startX : 0,
				startY : 0,
				endX : 0,
				endY : 0,
				gabX : 0,
				gabY : 0,
				elX : 0,
				elY : 0
			},
			_data : { // function
				originalEvent : null,
				startTime : 0,
				endTime : 0,
				gabTime : 0,
				startX : 0,
				startY : 0,
				endX : 0,
				endY : 0,
				gabX : 0,
				gabY : 0,
				elX : 0,
				elY : 0
			},
			init : function( callbackContext, context, start, end, move, cancel ){
				this._callbackContext = callbackContext;
				this._context = context;
				this._startCallback = start;
				this._endCallback = end;
				this._moveCallback = move;
				this._cancleCallback = cancel;
				this._data = this._default;
				//
				$(this._context).on( oEvtNm.start, mui.event.bind( this, this.start  ) );
				return this;
			},
			fire : function( nm ){
				var chkstr = 'start,end,move,cancel';
				if( nm === undefined || chkstr.indexOf(nm) < 0 ){
					$(this._context).off( oEvtNm.start );
					$(this._context).off( oEvtNm.end );
					$(this._context).off( oEvtNm.move );
					$(this._context).off( oEvtNm.cancel );
				}else{
					$(this._context).off( oEvtNm[nm] );
				};
			},
			start : function(e){
				if( typeof this._startCallback !== 'function' ){
					return;
				};
				//
				var evt = _getEventObj(e),
					touch = _getEventTouchObj(evt);
				// TODO : 
				//mui.event.fire( evt );
				//
				this._data.originalEvent = evt;
				this._data.startTime = new Date * 1;
				this._data.startX = touch.pageX;
				this._data.startY = touch.pageY;
				this._data.elX = parseFloat( this._context.css( 'left' ).replace( /[^0-9]/g, '' ), 10 );
				this._data.elY = parseFloat( this._context.css( 'top' ).replace( /[^0-9]/g, '' ), 10 );
				//
				this._startCallback.call( this._callbackContext, this._data );
				//
				$(this._context).on( oEvtNm.move, mui.event.bind( this, this.move  ) );
				$(this._context).on( oEvtNm.end, mui.event.bind( this, this.end  ) );
			},
			end : function(e){
				if( typeof this._endCallback !== 'function' ){
					return;
				};
				//
				var evt = _getEventObj(e),
					touch = _getEventTouchObj(evt);
				//
				this._data.originalEvent = evt;
				this._data.endTime = new Date * 1;
				this._data.gabTime = this._data.endTime - this._data.startTime;
				this._data.endX = touch.pageX;
				this._data.endY = touch.pageY;
				this._data.gabX = touch.pageX - this._data.startX;
				this._data.gabY = touch.pageY - this._data.startY;
				//
				this.fire( 'end' );
				this.fire( 'move' );
				//
				this._endCallback.call( this._callbackContext, this._data );
			},
			move : function(e){
				if( typeof this._moveCallback !== 'function' ){
					return;
				};
				//
				var evt = _getEventObj(e),
					touch = _getEventTouchObj(evt);
				//
				this._data.originalEvent = evt;
				this._data.endTime = new Date * 1;
				this._data.gabTime = this._data.endTime - this._data.startTime;
				this._data.endX = touch.pageX;
				this._data.endY = touch.pageY;
				this._data.gabX = touch.pageX - this._data.startX;
				this._data.gabY = touch.pageY - this._data.startY;
				//
				this._moveCallback.call( this._callbackContext, this._data );
			},
			cancel : function(e){
				if( typeof this._cancelCallback !== 'function' ){
					return;
				};
				// not used
				//this.fire( 'end' );
				//this.fire( 'move' );
			}
		};
	}());

	var CFlicking = function(){
		if( !( this instanceof CFlicking ) ){
			return new CFlicking();
		}
	};
	
	CFlicking.prototype = (function(){
		// 기울기 계산 또는 1.5
		var __hSlope = ( (window.innerHeight/2) / window.innerWidth ).toFixed(2) * 1; // 기울기체크 기준값 

		function __getMoveType ( x, y, data ){
			// 0: H., 1: V.
			var type = -1,
			_math = Math,
			tx = _math.abs( data.startX-x ),
			ty = _math.abs( data.startY-y ),
			dst = tx + ty;
			
			if( dst < 10 ) { return type };	// min move px
			
			if( tx==0 ){
				type = 1;
			}else if( ty==0 ){
				type = 0;
			}else{
				var slope = parseFloat( (ty/tx).toFixed(2), 10 );
				//
				if( slope > __hSlope ){
					type = 1;
				}else{
					type = 0;
				}
			}
			
			return type;
		};	

		return {
			// info
			constructor : CFlicking,
			version : '0.1.0',
			// vars;
			_doms : { // dom
				element : null,
				viewport : null,
				lst : null,
				items : null
			},
			_isPreventDefaulted : false,
			_isMoved : false,
			_total: 0,
			_isDragging : false,
			_cDragEvent : null,
			_nDirType : -1,
			_nChkDirPos : 0,
			_flickDir : 0,
			_currentIdx : -1, // selected Index
			_moveItems : [],
			_moveItemsPos : [],
			_oWidth : 0, // original width
			_oHeight : 0, // original height
			_sWidth : 0, // viewport width
			_sHeight : 0, // viewport height
			_sRate : 1, // original width : viewport width
			_timer : 0, // auto loop timer
			_eTimer : 0, // resize event timer
			_options : { // options
				loop : false,
				autoTime : 2500, // ms
				speed : 400, // ms
				hasNav : false, // navi
				isNavEvent : false,
				navContainer : null,
				navListType : 'li',
				navSelectClassNm : 'on',
				navDefaultItemHtml : '<a href="javascript:void(0)">[#cnt]</a>',
				navSelectItemHtml : '<a href="javascript:void(0)">[#cnt]</a>',
				onChange : null,
			},
			init : function( $dom, options ){
				this._options = $.extend( {}, this._options, options );
				this._oWidth = this._sWidth = $dom.width();
				this._oHeight = this._sHeight = $dom.height();
				//
				var wrap = '',
					$lst = $dom.find( '.flicking-lst' );
				//
				$( '<div class="'+fNamespace+'-viewport"></div>' ).css({
					'overflow' : 'hidden',
					'position' : 'relative',
					'height' : this._sHeight,
				}).appendTo( $dom ).append( $lst );
				//
				this._doms = {
					element : $dom,
					viewport : $dom.find( '.' + fNamespace+'-viewport' ),
					lst : $dom.find( '.flicking-lst' ),
					items : $dom.find( '.flicking-lst' ).children()
				};
				this._currentIdx = 0;
				this.domInit();
				if( options.hasNav ){
					this.setNav();
				};
				this.setLayout();
				this.addEvent();
				this.setMoveLayout( this._currentIdx );
				if( this._options.loop ){
					this.setTimer();
				};
				
				//
				return $dom.data( fNamespace, this );
			},
			setNav : function(){
				var $items = this._doms.items,
					i=0, len = $items.length,
					html='',
					listTagNm = this._options.navListType;
				//
				for( ;i<len;i+=1 ){
					if( i === this._currentIdx ){
						html +='<'+listTagNm+' class="on">' + this._options.navSelectItemHtml.replace('[#cnt]', (i+1)) + '</'+listTagNm+'>'
					}else{
						html +='<'+listTagNm+'>' + this._options.navDefaultItemHtml.replace('[#cnt]', (i+1)) + '</'+listTagNm+'>'
					};
				}
				this._options.navContainer.html( html );
			},
			changeNav : function( cidx ){
				//
				var that = this,
					listTagNm = this._options.navListType;
				this._options.navContainer.find( listTagNm ).each(function( i, item ){
					if( i==cidx ){
						$(item).addClass('on');
						$(item).html( that._options.navSelectItemHtml.replace('[#cnt]', (i+1)) );
					}else{
						$(item).removeClass('on');
						$(item).html( that._options.navDefaultItemHtml.replace('[#cnt]', (i+1)) );
					}
				});
			},
			domInit : function(){
				var $items = this._doms.items,
					$item = null,
					i=0, len = $items.length,
					left = 0;
				//
				this._total = len;
				//
				for( ;i<len;i+=1 ){
					$item = $( $items[i] );
					//
					if( i==0 ){
						this._currentIdx = 0;
						left = 0;
					}else{
						left = 100;
					}
					$item.css( {
						'position' : 'absolute',
						'display' : 'block',
						'top' : 0,
						'left' : left + '%'
					} );
				};
			},
			addEvent : function(){
				var that = this,
					evtNm = 'onorientationchange' in window ? 'orientationchange' : 'resize',
					nTime = evtNm=='orientationchange'? 16: 0;
				// drag event
				if( this._cDragEvent === null ){
					this._cDragEvent = new CDragEvent().init( this, this._doms.viewport, this.onDragStart, this.onDragEnd, this.onDragMove, this.onDragCancel );
				}else{
					this._cDragEvent.fire();
					this._cDragEvent.init( this, this._doms.viewport, this.onDragStart, this.onDragEnd, this.onDragMove, this.onDragCancel );
				};
				// nav event
				if( this._options.hasNav && this._options.isNavEvent ){
					var oEvtNm = mui.m._touchEventName;
					this._options.navContainer.find( this._options.navListType ).each(function( i, item ){
						$(item).data('idx', i).on( oEvtNm.start, function(){
							that.go( $(this).data('idx') );
						} );
					});
				};
				//
				if( evtNm=='orientationchange' ){
					evtNm += ' resize';
				};

				function onTmpResize(){
					// stop auto loop
					that.clearTimer();
					// set layer
					that.setLayout();
					// set item position
					that.setMoveLayout( that._currentIdx  );
					// start auto play
					if( that._options.loop ){
						that.setTimer();
					};
				};
				
				$(window).on( evtNm, function(){
					if( evtNm=='orientationchange' ){
						clearTimeout( that._eTimer );
						that._eTimer = setTimeout( function(){
							onTmpResize();
						}, nTime );
					}else{
						onTmpResize();
					};
				});
			},
			setLayout : function(){
				//
				this._sRate = this._doms.viewport.width() / this._oWidth;
				this._sWidth = this._oWidth * this._sRate;
				this._sHeight = this._oHeight * this._sRate;
				//
				
				this._doms.items.css({
					'height' : this._sHeight + 'px',
					'width' : this._sWidth + 'px'
				});

				this._doms.lst.css({
					'height' : this._sHeight + 'px'
				});

				this._doms.viewport.css({
					'height' : Math.floor(this._sHeight-1) + 'px' // 1px gab
				});
			},
			setMoveLayout : function( cidx ){
				this._moveItems = [];
				this._moveItemsPos = [];
				//
				var $items = this._doms.items,
					prevIdx = -1,
					nextIdx = -1,
					i = 0, len = $items.length, $item,
					aidx = -1,
					added = false,
					left, displaystr;
				//
				if( this.hasPrevItem( cidx ) ){
					prevIdx = this.getPrevIndex( cidx )
				}

				if( this.hasNextItem( cidx ) ){
					nextIdx = this.getNextIndex( cidx )
				}
				//
				for( ;i<len;i+=1 ){
					$item = $( $items[i] );
					displaystr = 'block';
					if( i == prevIdx ){
						aidx++;
						added = true;
						left = this._sWidth * -1;
					}else if( i == cidx ){
						aidx++;
						added = true;
						left = 0;
					}else if( i == nextIdx ){
						aidx++;
						added = true;
						left = this._sWidth;
					}else{
						added = false;
						left = -10000;
						displaystr = 'none';
					}
					//
					$item.css( {
						'left' : left,
						'display' : displaystr
					} );
					if( added ){
						this._moveItems[aidx] = $item;
						this._moveItemsPos[aidx] = left;
					};
				};
			},
			update : function(){
			},
			onDragStart : function( o ){
				this.clearTimer();
				this._nChkDirPos = o.startX;
				this._isPreventDefaulted = false;
				// setMoveLayout 에 중복코드
				var i=0, len=this._moveItems.length, $item;
				for(;i<len;i+=1){
					$item = this._moveItems[i];
					this._moveItemsPos[i] = parseFloat( $item.css( 'left' ).replace( /px/ig, '' ), 10 );
				};
			},
			onDragEnd : function( o ){
				if( this._nDirType != 0 ){
					if( this._options.loop ){
						this.setTimer();
					};
				}else{
					this.toMove( o );
				}
				this._nDirType = -1;
				this._isDragging = false;
				this._cDragEvent.fire( 'end' );
				this._cDragEvent.fire( 'move' );
			},
			onDragMove : function( o ){
				var tmpType = -1, tmpGab;
				if( this._nDirType < 0 ){
					tmpType = __getMoveType( o.endX, o.endY, o );
					if( tmpType<0 ){
						return false;
					}
					this._nDirType = tmpType;
				};

				if( this._nDirType == 0 ){ // 가로방향일때
					this._isDragging = true;
					this.toDrag( o );
					// 방향체크. 움직임이 1px 이상 차이나면 방향을 변환함.
					tmpGab = o.endX - this._nChkDirPos;
					if( Math.abs(tmpGab)>1 ){
						if( tmpGab>0 ){
							this._flickDir = 1; // prev, right
						}else{
							this._flickDir = -1; // next, left
						}
						this._nChkDirPos = o.endX;
					}
					if( !this._isPreventDefaulted ){
						mui.event.fire( o.originalEvent );
						this._isPreventDefaulted = true;		
					}
					return false;
				}else{
					this._nDirType = -1;
					this._isDragging = false;
					this._cDragEvent.fire( 'end' );
					this._cDragEvent.fire( 'move' );
					if( this._options.loop ){
						this.setTimer();
					};
				}
			},
			onDragCancel : function( o ){
			},
			toDrag : function( o ){
				var i=0, len=this._moveItems.length,
					$item, left;
				//
				for(;i<len;i+=1){
					$item = this._moveItems[i];
					left = this._moveItemsPos[i] + o.gabX;
					// move
					$item.stop().css( 'left', left );
				};
			},
			toMove : function( o ){
				var that = this,
					i=0, len=this._moveItems.length,
					$item, left,
					val = this._flickDir;// o.gabX>0? 1 : -1;
				//
				this._isMoved = true;
				if( val > 0 ){
					this._currentIdx = this.getPrevIndex(this._currentIdx);
				}else{
					this._currentIdx = this.getNextIndex(this._currentIdx);
				}
				//
				for(;i<len;i+=1){
					$item = this._moveItems[i];
					left = this._moveItemsPos[i] + ( this._sWidth * val );
					// move
					$item.stop().animate( {'left': left}, this._options.speed, function(){
						that.toComplete();
						that._isMoved = false;
					} );
				};
			},
			go : function( idx ){
				// 선택보다 작으면 왼쪽,
				// 선택보다 크면 오른쪽,
				// 기본은 하나만왼쪽
				this.clearTimer();
				this._currentIdx = idx;
				this.setMoveLayout( idx );
				this.toComplete();
			},
			goNext : function(){
				if( !this.hasNextItem( this._currentIdx ) || this._isMoved ){
					return;
				}
				//
				this.clearTimer();
				this._flickDir = -1;
				this.toMove();
			},
			goPrev : function(){
				if( !this.hasPrevItem( this._currentIdx ) || this._isMoved ){
					return;
				}
				//
				this.clearTimer();
				this._flickDir = 1;
				this.toMove();
			},
			toComplete : function(){
				this.setMoveLayout( this._currentIdx );
				this.changeNav( this._currentIdx );
				if( this._options.loop ){
					this.setTimer();
				};
				if( typeof this._options.onChange === 'function' ) {
					this._options.onChange( this._currentIdx );
				};
			},
			setTimer : function(){
				var that = this;
				if( that._total === 1 ) {
					return;
				};
				this.clearTimer();
				this._timer = setTimeout(function(){
					// next process
					if( that.hasNextItem( that._currentIdx ) ){
						that.goNext();
					}else{
						that.goPrev();
					}
					
				}, this._options.autoTime );
			},
			clearTimer : function(){
				clearTimeout( this._timer );
			},
			hasPrevItem : function( cidx ){
				if( this._total < 3 ){
					if( cidx > 0 && cidx <= this._total-1 ){
						return true;
					}
				}else{
					return true;
				}
				return false;
			},
			hasNextItem : function( cidx ){
				if( this._total < 3 ){
					if( cidx <= 0 && cidx < this._total-1 ){
						return true;
					}
				}else{
					return true;
				}
				return false;
			},
			getPrevIndex : function( cidx ){
				var idx = cidx - 1;
				if( idx<0 ){
					idx = this._total-1;
				}
				return idx;
			},
			getNextIndex : function( cidx ){
				var idx = cidx + 1;
				if( idx >= this._total ){
					idx = 0;
				}
				return idx;
			},
			getSelectIdx : function(){
				return this._currentIdx;
			}
		};
	}());
	
	// regist plugin;
	$.addPlugin( fNamespace, CFlicking);


})( window, document, jQuery );