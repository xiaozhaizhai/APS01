

<script type="text/javascript">
!function(){var e=function(){var t=[].slice.call(arguments);return t.push(e.options),t[0].match(/^\s*#([\w:\-\.]+)\s*$/gim)&&t[0].replace(/^\s*#([\w:\-\.]+)\s*$/gim,function(e,n){var i=document,o=i&&i.getElementById(n);t[0]=o?o.value||o.innerHTML:e}),1==arguments.length?e.compile.apply(e,t):arguments.length>=2?e.to_html.apply(e,t):void 0},t={escapehash:{"<":"&lt;",">":"&gt;","&":"&amp;",'"':"&quot;","'":"&#x27;","/":"&#x2f;"},escapereplace:function(e){return t.escapehash[e]},escaping:function(e){return"string"!=typeof e?e:e.replace(/[&<>"]/gim,this.escapereplace)},detection:function(e){return"undefined"==typeof e||null===e?"":e}},n=function(e){if("undefined"!=typeof console){if(console.warn)return console.warn(e),void 0;if(console.log)return console.log(e),void 0}throw e},i=function(e,t){if(e=e!==Object(e)?{}:e,e.__proto__)return e.__proto__=t,e;var n=function(){},i=Object.create?Object.create(t):new(n.prototype=t,n);for(var o in e)e.hasOwnProperty(o)&&(i[o]=e[o]);return i};e.__cache={},e.version="0.6.5-stable",e.settings={},e.tags={operationOpen:"{@",operationClose:"}",interpolateOpen:"\\%supcon{",interpolateClose:"}",noneencodeOpen:"\\%\\%supcon{",noneencodeClose:"}",commentOpen:"\\{#",commentClose:"\\}"},e.options={cache:!0,strip:!0,errorhandling:!0,detection:!0,_method:i({__escapehtml:t,__throw:n,__juicer:e},{})},e.tagInit=function(){var t=e.tags.operationOpen+"each\\s*([^}]*?)\\s*as\\s*(\\w*?)\\s*(,\\s*\\w*?)?"+e.tags.operationClose,n=e.tags.operationOpen+"\\/each"+e.tags.operationClose,i=e.tags.operationOpen+"if\\s*([^}]*?)"+e.tags.operationClose,o=e.tags.operationOpen+"\\/if"+e.tags.operationClose,r=e.tags.operationOpen+"else"+e.tags.operationClose,s=e.tags.operationOpen+"else if\\s*([^}]*?)"+e.tags.operationClose,a=e.tags.interpolateOpen+"([\\s\\S]+?)"+e.tags.interpolateClose,c=e.tags.noneencodeOpen+"([\\s\\S]+?)"+e.tags.noneencodeClose,p=e.tags.commentOpen+"[^}]*?"+e.tags.commentClose,l=e.tags.operationOpen+"each\\s*(\\w*?)\\s*in\\s*range\\(([^}]+?)\\s*,\\s*([^}]+?)\\)"+e.tags.operationClose,u=e.tags.operationOpen+"include\\s*([^}]*?)\\s*,\\s*([^}]*?)"+e.tags.operationClose;e.settings.forstart=new RegExp(t,"igm"),e.settings.forend=new RegExp(n,"igm"),e.settings.ifstart=new RegExp(i,"igm"),e.settings.ifend=new RegExp(o,"igm"),e.settings.elsestart=new RegExp(r,"igm"),e.settings.elseifstart=new RegExp(s,"igm"),e.settings.interpolate=new RegExp(a,"igm"),e.settings.noneencode=new RegExp(c,"igm"),e.settings.inlinecomment=new RegExp(p,"igm"),e.settings.rangestart=new RegExp(l,"igm"),e.settings.include=new RegExp(u,"igm")},e.tagInit(),e.set=function(e,t){var n=this,i=function(e){return e.replace(/[\$\(\)\[\]\+\^\{\}\?\*\|\.]/gim,function(e){return"\\"+e})},o=function(e,t){var o=e.match(/^tag::(.*)$/i);return o?(n.tags[o[1]]=i(t),n.tagInit(),void 0):(n.options[e]=t,void 0)};if(2===arguments.length)return o(e,t),void 0;if(e===Object(e))for(var r in e)e.hasOwnProperty(r)&&o(r,e[r])},e.register=function(e,t){var n=this.options._method;return n.hasOwnProperty(e)?!1:n[e]=t},e.unregister=function(e){var t=this.options._method;return t.hasOwnProperty(e)?delete t[e]:void 0},e.template=function(t){var n=this;this.options=t,this.__interpolate=function(e,t,n){var i,o=e.split("|"),r=o[0]||"";return o.length>1&&(e=o.shift(),i=o.shift().split(","),r="_method."+i.shift()+".call({}, "+[e].concat(i)+")"),"<%= "+(t?"_method.__escapehtml.escaping":"")+"("+(n&&n.detection===!1?"":"_method.__escapehtml.detection")+"("+r+")"+")"+" %>"},this.__removeShell=function(t,i){var o=0;return t=t.replace(e.settings.forstart,function(e,t,n,i){var n=n||"value",i=i&&i.substr(1),r="i"+o++;return"<% ~function() {for(var "+r+" in "+t+") {"+"if("+t+".hasOwnProperty("+r+")) {"+"var "+n+"="+t+"["+r+"];"+(i?"var "+i+"="+r+";":"")+" %>"}).replace(e.settings.forend,"<% }}}(); %>").replace(e.settings.ifstart,function(e,t){return"<% if("+t+") { %>"}).replace(e.settings.ifend,"<% } %>").replace(e.settings.elsestart,function(){return"<% } else { %>"}).replace(e.settings.elseifstart,function(e,t){return"<% } else if("+t+") { %>"}).replace(e.settings.noneencode,function(e,t){return n.__interpolate(t,!1,i)}).replace(e.settings.interpolate,function(e,t){return n.__interpolate(t,!0,i)}).replace(e.settings.inlinecomment,"").replace(e.settings.rangestart,function(e,t,n,i){var r="j"+o++;return"<% ~function() {for(var "+r+"="+n+";"+r+"<"+i+";"+r+"++) {{"+"var "+t+"="+r+";"+" %>"}).replace(e.settings.include,function(e,t,n){return"<%= _method.__juicer("+t+", "+n+"); %>"}),i&&i.errorhandling===!1||(t="<% try { %>"+t,t+='<% } catch(e) {_method.__throw("Juicer Render Exception: "+e.message);} %>'),t},this.__toNative=function(e,t){return this.__convert(e,!t||t.strip)},this.__lexicalAnalyze=function(t){var n=[],i=[],o="",r=["if","each","_","_method","console","break","case","catch","continue","debugger","default","delete","do","finally","for","function","in","instanceof","new","return","switch","this","throw","try","typeof","var","void","while","with","null","typeof","class","enum","export","extends","import","super","implements","interface","let","package","private","protected","public","static","yield","const","arguments","true","false","undefined","NaN"],s=function(e,t){if(Array.prototype.indexOf&&e.indexOf===Array.prototype.indexOf)return e.indexOf(t);for(var n=0;n<e.length;n++)if(e[n]===t)return n;return-1},a=function(t,o){if(o=o.match(/\w+/gim)[0],-1===s(n,o)&&-1===s(r,o)&&-1===s(i,o)){if("undefined"!=typeof window&&"function"==typeof window[o]&&window[o].toString().match(/^\s*?function \w+\(\) \{\s*?\[native code\]\s*?\}\s*?$/i))return t;if("undefined"!=typeof global&&"function"==typeof global[o]&&global[o].toString().match(/^\s*?function \w+\(\) \{\s*?\[native code\]\s*?\}\s*?$/i))return t;if("function"==typeof e.options._method[o]||e.options._method.hasOwnProperty(o))return i.push(o),t;n.push(o)}return t};t.replace(e.settings.forstart,a).replace(e.settings.interpolate,a).replace(e.settings.ifstart,a).replace(e.settings.elseifstart,a).replace(e.settings.include,a).replace(/[\+\-\*\/%!\?\|\^&~<>=,\(\)\[\]]\s*([A-Za-z_]+)/gim,a);for(var c=0;c<n.length;c++)o+="var "+n[c]+"=_."+n[c]+";";for(var c=0;c<i.length;c++)o+="var "+i[c]+"=_method."+i[c]+";";return"<% "+o+" %>"},this.__convert=function(e,t){var n=[].join("");return n+="'use strict';",n+="var _=_||{};",n+="var _out='';_out+='",n+=t!==!1?e.replace(/\\/g,"\\\\").replace(/[\r\t\n]/g," ").replace(/'(?=[^%]*%>)/g,"	").split("'").join("\\'").split("	").join("'").replace(/<%=(.+?)%>/g,"';_out+=$1;_out+='").split("<%").join("';").split("%>").join("_out+='")+"';return _out;":e.replace(/\\/g,"\\\\").replace(/[\r]/g,"\\r").replace(/[\t]/g,"\\t").replace(/[\n]/g,"\\n").replace(/'(?=[^%]*%>)/g,"	").split("'").join("\\'").split("	").join("'").replace(/<%=(.+?)%>/g,"';_out+=$1;_out+='").split("<%").join("';").split("%>").join("_out+='")+"';return _out.replace(/[\\r\\n]\\s+[\\r\\n]/g, '\\r\\n');"},this.parse=function(e,t){var o=this;return t&&t.loose===!1||(e=this.__lexicalAnalyze(e)+e),e=this.__removeShell(e,t),e=this.__toNative(e,t),this._render=new Function("_, _method",e),this.render=function(e,t){return t&&t===n.options._method||(t=i(t,n.options._method)),o._render.call(this,e,t)},this}},e.compile=function(e,t){t&&t===this.options||(t=i(t,this.options));try{var o=this.__cache[e]?this.__cache[e]:new this.template(this.options).parse(e,t);return t&&t.cache===!1||(this.__cache[e]=o),o}catch(r){return n("Juicer Compile Exception: "+r.message),{render:function(){}}}},e.to_html=function(e,t,n){return n&&n===this.options||(n=i(n,this.options)),this.compile(e,n).render(t,n._method)},"undefined"!=typeof module&&module.exports?module.exports=e:this.juicer=e}();
</script>
 
<script type="text/javascript" language="javascript">



//全选方法-fiddler111
   function CA(form)
	{
	for (var i=0;i<form.elements.length;i++)
	{
		var e = form.elements[i];
		if ((e.name != 'SELECTALL') && (e.type=='checkbox'))
		{
			e.checked = form.SELECTALL.checked;
			/*if(e.checked)
				hL(e);
			else 
				dL(e);*/
			//alert(e.parentElement.parentElement.className);
		}
	}
	}



/* select ui*/

(function($, undefined) {

    $.uedWidget = function(name, base, prototype) {
        var namespace = name.split( "." )[0], fullName;
        name = name.split( "." )[1];
        fullName = namespace + "-" + name;
        // 例如参数name='ued.tabs'，变成namespace='ued',name='tabs',fullName='ued-tabs'
        // base默认为Widget类，组件默认会继承base类的所有方法
        if (!prototype) {
            prototype = base;
            base = $.UEDWidget;
        }
        // create selector for plugin
        $.expr[ ":" ][fullName] = function(elem) {
            return !!$.data(elem, name);
        };
        // 创建命名空间$.ued.tabs
        $[namespace] = $[namespace] || {};
        // 组件的构造函数
        $[ namespace ][name] = function(options, element) {
            // allow instantiation without initializing for simple inheritance
            if (arguments.length) {
                this._createWidget(options, element);
            }
        };
        // 初始化父类，一般调用了$.Widget
        var basePrototype = new base();
        // we need to make the options hash a property directly on the new instance
        // otherwise we'll modify the options hash on the prototype that we're
        // inheriting from
        //		$.each( basePrototype, function( key, val ) {
        //			if ( $.isPlainObject(val) ) {
        //				basePrototype[ key ] = $.extend( {}, val );
        //			}
        //		});
        basePrototype.options = $.extend(true, {}, basePrototype.options);
        // 给om.tabs继承父类的所有原型方法和参数
        $[ namespace ][name].prototype = $.extend(true, basePrototype, {
            namespace : namespace,
            widgetName : name,
            // 组件的事件名前缀，调用_trigger的时候会默认给trigger的事件加上前缀
            // 例如_trigger('create')实际会触发'tabscreate'事件
            widgetEventPrefix : $[ namespace ][name].prototype.widgetEventPrefix || name,
            widgetBaseClass : fullName
        }, prototype);
        // 把tabs方法挂到jquery对象上，也就是$('#tab1').tabs();
        var temp = $.uedWidget.bridge(name, $[ namespace ][name]);
    };

    $.uedWidget.bridge = function(name, object) {
        $.fn[name] = function(options) {
            // 如果tabs方法第一个参数是string类型，则认为是调用组件的方法，否则调用options方法
            var isMethodCall = typeof options === "string", args = Array.prototype.slice.call(arguments, 1), returnValue = this;
            // allow multiple hashes to be passed on init
            options = !isMethodCall && args.length ? $.extend.apply(null, [true, options].concat(args)) : options;
            // '_'开头的方法被认为是内部方法，不会被执行，如$('#tab1').tabs('_init')
            if (isMethodCall && options.charAt(0) === "_") {
                return returnValue;
            }
            if (isMethodCall) {
                this.each(function() {
                    // 执行组件方法
                    var instance = $.data(this, name);
                    if (options == 'options') {
                        returnValue = instance && instance.options;
                        return false;
                    } else {
                        var methodValue = instance && $.isFunction(instance[options]) ? instance[options].apply(instance, args) : instance;
                        if (methodValue !== instance && methodValue !== undefined) {
                            returnValue = methodValue;
                            return false;
                        }
                    }
                });
            } else {
                // 调用组件的options方法
                this.each(function() {
                    var instance = $.data(this, name);
                    if (instance) {
                        // 设置options后再次调用_init方法，第一次调用是在_createWidget方法里面。这个方法需要开发者去实现。
                        // 主要是当改变组件中某些参数后可能需要对组件进行重画
                        instance._setOptions(options || {});
                        $.extend(instance.options, options);
                        $(instance.beforeInitListeners).each(function() {
                            this.call(instance);
                        });
                        instance._init();
                        $(instance.initListeners).each(function() {
                            this.call(instance);
                        });
                    } else {
                        // 没有实例的话，在这里调用组件类的构造函数，并把构造后的示例保存在dom的data里面。注意这里的this是dom，object是模块类
                        $.data(this, name, new object(options, this));
                    }
                });
            }
            return returnValue;
        };
    };
    $.uedWidget.addCreateListener = function(name, fn) {
        var temp = name.split(".");
        $[ temp[0] ][temp[1]].prototype.createListeners.push(fn);
    };
    $.uedWidget.addInitListener = function(name, fn) {
        var temp = name.split(".");
        $[ temp[0] ][temp[1]].prototype.initListeners.push(fn);
    };
    $.uedWidget.addBeforeInitListener = function(name, fn) {
        var temp = name.split(".");
        $[ temp[0] ][temp[1]].prototype.beforeInitListeners.push(fn);
    };
    $.UEDWidget = function(options, element) {
        this.createListeners = [];
        this.initListeners = [];
        this.beforeInitListeners = [];
        // allow instantiation without initializing for simple inheritance
        if (arguments.length) {
            this._createWidget(options, element);
        }
    };
   
    $.UEDWidget.prototype = {
        widgetName : "widget",
        widgetEventPrefix : "",
        options : {
            disabled : false
        },
        _createWidget : function(options, element) {
            // $.widget.bridge stores the plugin instance, but we do it anyway
            // so that it's stored even before the _create function runs
            $.data(element, this.widgetName, this);
            this.element = $(element);
            this.options = $.extend(true, {}, this.options, this._getCreateOptions(), options);
            var self = this;
            //注意，不要少了前边的 "ued-"，不然会与jquery-ui冲突
            this.element.bind("ued-remove._" + this.widgetName, function() {
                self.destroy();
            });
            // 开发者实现
            this._create();
            $(this.createListeners).each(function() {
                this.call(self);
            });
            // 如果绑定了初始化的回调函数，会在这里触发。注意绑定的事件名是需要加上前缀的，如$('#tab1').bind('tabscreate',function(){});
            this._trigger("create");
            // 开发者实现
            $(this.beforeInitListeners).each(function() {
                this.call(self);
            });
            this._init();
            $(this.initListeners).each(function() {
                this.call(self);
            });
        },
        _getCreateOptions : function() {
            return $.metadata && $.metadata.get( this.element[0] )[this.widgetName];
        },
        _create : function() {
        },
        _init : function() {
        },
        destroy : function() {
            this.element.unbind("." + this.widgetName).removeData(this.widgetName);
            this.widget().unbind("." + this.widgetName);
        },
        widget : function() {
            return this.element;
        },

        option : function(key, value) {
            var options = key;
            if (arguments.length === 0) {
                // don't return a reference to the internal hash
                return $.extend({}, this.options);
            }
            if ( typeof key === "string") {
                if (value === undefined) {
                    return this.options[key];
                    // 获取值
                }
                options = {};
                options[key] = value;
            }
            this._setOptions(options);
            // 设置值
            return this;
        },
        _setOptions : function(options) {
            var self = this;
            $.each(options, function(key, value) {
                self._setOption(key, value);
            });
            return this;
        },
        _setOption : function(key, value) {
            this.options[key] = value;
            return this;
        },

        // $.widget中优化过的trigger方法。type是回调事件的名称，如"onRowClick"，event是触发回调的事件（通常没有这个事件的时候传null）
        // 这个方法只声明了两个参数，如有其他参数可以直接写在event参数后面
        _trigger : function(type, event) {
            // 获取初始化配置config中的回调方法
            var callback = this.options[type];
            // 封装js标准event对象为jquery的Event对象
            event = $.Event(event);
            event.type = type;
            // copy original event properties over to the new event
            // this would happen if we could call $.event.fix instead of $.Event
            // but we don't have a way to force an event to be fixed multiple times
            if (event.originalEvent) {
                for (var i = $.event.props.length, prop; i; ) {
                    prop = $.event.props[--i];
                    event[prop] = event.originalEvent[prop];
                }
            }
            // 构造传给回调函数的参数，event放置在最后
            var newArgs = [], argLength = arguments.length;
            for (var i = 2; i < argLength; i++) {
                newArgs[i - 2] = arguments[i];
            }
            if (argLength > 1) {
                newArgs[argLength - 2] = arguments[1];
            }
            return !($.isFunction(callback) && callback.apply(this.element, newArgs) === false || event.isDefaultPrevented() );
        }
    };
})(jQuery);




(function($) {
    /**
     * @name uedSelect
     * @class 下拉列表框
     */
    $.uedWidget('ued.uedSelect', {
        options : {
			//··默认宽度
			width:300
		},
        _create : function() {
            var $el = this.element, options = this.options, self = this;
            this._createSelect($el);
        },
		
        _init : function() {
            var self = this, options = this.options, $el = this.element;
        },
		
        _createSelect : function($el) {
			var $el = this.element, options = this.options, self = this;
			//··设置文本主体
			var $container = $('<div class="uew-select"></div>')
			var $stateDefault = $('<div class="uew-select-value ue-state-default"></div>')
			var $text = $('<em class="uew-select-text"></em>')
			$stateDefault.append($text).append('<em class="uew-icon uew-icon-triangle-1-s"></em>')
			$el.wrap($container)
			$el.before($stateDefault)
			
			//··设置组件宽度
			var width = parseInt($el.attr("width")) ? parseInt($el.attr("width")) : options.width;
			$el.width(width);
			
		   //··设置组件的样式和大小（在有单位和无单位情况）
		   if($el.attr("unit")){
				var $unit =$('<span class="uew-unit">'+$el.attr("unit")+'</span>')
				$stateDefault.addClass("select-hasUnit").append($unit)
				$stateDefault.width(width - 47);
		   }
		   else{
				$stateDefault.width(width -27);
			}
			
			//判断边框样式
			if($el.hasClass('uew-no-border')){
				$el.parent().find('.uew-select-value').addClass('uew-no-border');
				// 边框的hover状态
				$el.hover(function(){
					$el.parent().find(".uew-select-value").addClass("uew-border-flag");
				},function(){
					$el.parent().find(".uew-select-value").removeClass("uew-border-flag");
				});
			}
		
			//··默认文本
			$text.text($el.find(":selected").text())
			
			//··添加焦点操作
			$el.focus(function(){
				$el.parent().addClass("ue-state-focus");
			});
			$el.blur(function(){
				$el.parent().removeClass("ue-state-focus");
			});
			$el.parent().hover(function(){
				$el.parent().addClass("ue-state-hover");
			},function(){
				$el.parent().removeClass("ue-state-hover");
			});
			
			
			
			
			$el.change(function(){
				$el.parent().find(".uew-select-text").text($(this).find(":selected").text())
			});
        },
		// 重置option选项
		setOption : function()
		{
			var self = this, options = this.options, $el = this.element;
			$el.parent().find(".uew-select-text").text($el.find(":selected").text());
		},
        destroy : function() {
            var $uedSelect = this.element;
            $uedSelect.remove();
        }
    });
})(jQuery);






</script>  
<style type="text/css">
#userDefinedGroupSelect{opacity:1;  filter: alpha(opacity=100)}
#prev_page{
float:left;margin-right:3px;height:31px;width:31px;padding:0 8px;cursor:pointer;border:none;
background: url(/struts/meetingCalendar/images/prevpg.png) 0 0 no-repeat;
}
#next_page{
float:left;margin-right:3px;padding:0 8px;cursor:pointer;border:none;height:31px;width:31px;
background: url(/struts/meetingCalendar/images/nextpg.png) 0 0 no-repeat;
}
input.C,input.A{
display: inline-block;
height: 31px;
cursor: pointer;
background: url(/struts/meetingCalendar/images/btn_tj.png) 0 0 no-repeat;
border: none;
width: 31px;
}
input.A{background: url(/struts/meetingCalendar/images/btn_yc.png) 0 0 no-repeat;}
#book{padding-left:8px;width:600px;}
#book a{width:19px;height:19px; line-height:19px; text-align:center;display:block;float:left;padding:0 0;background:url("/struts/css/edit_20120605.gif") no-repeat -161px -932px;color:#000;margin: 2px 2px 0 0; }
#book a:hover {color:#FFF;font-weight:bolder;border:0;margin: 2px 2px 0 0;background-position:-242px -932px;}
#book #book-all{width:36px; height:19px;background-position:-333px -932px;}
#book a#book-all:hover{background-position:-439px -932px;}

.ewc-dialog-el{height:100%;}
.addressBook-tb{width:95%;padding-top:10px}
.addressBook-tb td{padding-right:3px;}
#queryStaffForm td {
    padding-bottom: 0px;
    text-align:left;
}
.opinions-on{
	text-decoration:none!important;
	margin-left:20px;
}
.opinions-off{
	text-decoration:none!important;
	margin-left:20px;
}

/* select ui*/


.uew-select .uew-select-value{height:30px;padding:0 5px; top:0px;margin-top:0px; margin-bottom:12px;line-height:30px;color:#000;resize:none;border-width:1px;border-style:solid;border-color:#dfdfdf;}
.uew-border-flag,.uew-border-flag,textarea.uew-border-flag,.uew-select .uew-select-value.uew-border-flag{border-width:1px;border-style:solid;border-color:#dfdfdf;}

.uew-select{position:relative;}
.uew-select .uew-select-value{z-index:1;text-align:left;position:relative;padding-right:20px;background:#fff;font-size:12px; text-indent:5px;background:url(/struts/meetingCalendar/images/inputbg.gif) repeat-x;_background:none;_border:none;}
.uew-select-value em{font-style:normal;}
.uew-select .uew-icon{position:absolute;right:5px;top:7px;}
.uew-select select{z-index:2;position:absolute;top:3px;_top:6px;cursor:pointer; height:30px;left:0px;}

a:focus,input:focus,button:focus,select{outline:none;}
select{opacity:0;filter:alpha(opacity=0);}
option{overflow:auto;}
select.nameList{opacity:1;filter:alpha(opacity=100);border:1px solid #dfdfdf}

.uew-icon,.ue-state-default .uew-icon{display:inline-block;width:16px;height:16px;background-image:url(/struts/meetingCalendar/images/uew_icon.png);}
.ue-state-hover .uew-icon{background-image:url(/struts/meetingCalendar/images/uew_icon_hover.png);}
.uew-icon-triangle-1-s{background-position:-80px 0;}

.usercity{display:inline-block}

.vocation02{margin-left:-57px}
.cityleft{float:left; padding-right:10px;}
.cityright{float:left;}
.vocation{display:inline-block;margin-left:10px;#float:right;#margin-right:-3px;#margin-left:auto;}
.panel_l{float:left;width:50px;}
.panel_r{float:left;width:177px;height:156px;}
.panel_r select{float:left;width:100%;height:100%;overflow:auto;opacity: 1;filter: alpha(opacity=100);border:1px solid #cacaca }
.navsbr{padding-left:12px;padding-right:10px;}
.block_btn{float:left;margin-right:3px;border:1px solid #dfdfdf;line-height:28px;padding:0 14px;background:#f9f9f9;cursor:pointer;}
.block_btn_blue{display:inline-block;height:30px;border:0;line-height:30px;padding:0 10px;background:#0f78bc;cursor:pointer;color:#fff}
.block_btn_blue:hover{background:#0e6faf;}
.block_text{display:inline-block;border:1px solid #dfdfdf;height:30px;line-height:28px;padding:0 2px;background:#fff;}
.block_btn_beyond{margin-right:-5px;}
.block_btn_beyond2{z-index:2;left:7px;padding-right:13px;position:relative;border:0;background:url(/struts/meetingCalendar/images/inputbg.gif) repeat-x;height:28px;padding-left:10px}
.block_btn:hover{background:#f1f1f1;}
.block_btn_beyond2:hover{background:url(/struts/meetingCalendar/images/inputbg.gif) repeat-x;}
.TD_Hover TD{background:#fff4c1}

#queryStaffForm {padding-bottom:5px;height:50px;}
.fix-input {
overflow: hidden;
height:30px;line-height:30px;
border: 1px solid #dfdfdf;
}
.block_btn{height:32px;#padding:0 5px}
.block_text{border:none;height:30px;line-height:30px;}
.block_text:focus{outline:none}
.table_content{float:left;width:515px;overflow:auto;height:386px;margin-left:0px;}
.grid{width:1430px;border-top:1px solid #cacaca;}
.grid tr td{height:38px;line-height:38px;border-bottom:1px solid #cacaca;padding-left:10px;text-align:left}
.grid tr.head td{background:#f3f3f3;height:30px;line-height:30px;}
.grid tr.head td.bor{border-left:1px solid #cacaca;padding-left:10px;}
.grid tr td.grid_checkbox{text-align:center;padding:0}
.grid span{color:#ccc}
.icon{padding-right:7px;}
.euc-layout-resize{display:none}
           #left_in {border:1px solid #e3e3e3;background:#fff;height:411px!important;}
.select_title{text-align:left;padding-bottom:5px;font-size:12px;font-weight:normal}
#vocation_page{position:absolute}
#staffManageMain_mail{margin-left:13px;border:1px solid #e3e3e3;}
.elm-layout-unit-west{background:#fff}
h3.title_right {height:27px;font-size:12px;font-weight:normal;line-height:25px;float:left;width:90%;padding-left:50px;text-align:left}
#layout-est{
z-index:33;
position: absolute;
right: 15px;
top: -26px;
width: 230px;
height: 440px;}
.elm-layout-doc{overflow:visible}
.person_abook{float:left;text-decoration:none;border: 1px #fff solid;padding: 0;padding-left:17px;height: 18px;background:url(/struts/meetingCalendar/images/txlicon_01.png) left 1px no-repeat}
.person_abook_active{
background-color: #FFE6B0;
color: black;
border: 1px #FFB951 solid;
opacity: .8;
}
.person_abook:hover{

background-color: #FFE6B0;
color: black;

border: 1px #FFB951 solid;
opacity: .8;
}
#person_Abook{position:absolute;left:210px;width:530px;top:30px;z-index:34;height:88%;}
#addressBookDepartmentTree_1_ico {background:url(/struts/meetingCalendar/images/txlicon_01.png) center 1px no-repeat}
#left_in .ztree{margin-top:-10px}
#userDefinedGroupFrameset #userDefinedGroup_left{background:#f8f8f8}
.euc-layout-resize {display: block!important;}

#left_bottom a{text-decoration:none;float:right;height:30px;line-height:30px;margin-left:20px;padding-right:10px;}
#left_bottom a img{position:Relative;top:3px;right:2px;}
#userDefinedGroup_center .fix-input {
overflow: hidden;
height:20px;line-height:20px;
border: 1px solid #dfdfdf;
}
#foundation_addToGroup_textarea {padding-top:5px}
#staffManage .euc-layout-resize {display: none!important;}
#userDefinedGroupFrameset .datagrid{height:393px!important}
#userDefinedGroupFrameset .datagrid-bd{height:370px!important}
select.PageLink-PageSelect{opacity: 1;
filter: alpha(opacity=100);}
.fix-input {
overflow: hidden;
height: 20px;
line-height: 20px;
border: 1px solid #dfdfdf;
}
.addressBook-tb .fix-input {
height: 30px;
line-height: 30px;
}          
.fix-input-readonly {
overflow: hidden;
border: 1px solid #DCDCDC;
height: 30px;
margin-bottom: 3px;
line-height: 30px;
background: #f8f8f8;
}

 </style>
<div id="addressStaffListErrorBar"></div>



<script id="tpl" type="text/template">
<form>
<table class='grid' cellpadding='0' cellspacing='0'>
	<col style="width: 30px;">
	<col style="width: 200px;">
	<col style="width: 280px;">
	<col style="width: 280px;">
	<col style="width: 150px;">
	<col style="width: 150px;">
	<col style="width: 150px;">
	<col style="width: 150px;">
	<col style="width: 150px;">
	<col style="width: 150px;">
	<col style="width: 150px;">
	<col style="width: 60px;">
	<tbody>
	<tr class='head'>
		<td class='grid_checkbox'><input id='SELECTALL' name="SELECTALL"  type='checkbox' onclick="CA(this.form)" /></td>
		<td class='bor'>员工姓名</td>
		<td class='bor'>电子邮件</td>
		<td class='bor'>部门名称</td>
		<td class='bor'>外部号码</td>
		<td class='bor'>内部号码</td>
		<td class='bor'>手机号码</td>
		<td class='bor'>传真</td>
		<td class='bor'>岗位名称</td>
		<td class='bor'>房间号</td>
		<td class='bor'>通讯录备注</td>		
		<td class='bor'>照片</td>			
	</tr>
        {@each result as it}
            <tr  id=%supcon{it.STAFFID}    class='default'>
			   <td class='grid_checkbox'><input class='checkBox01' type='checkbox' /></td> 
			   <td>%%supcon{it.NAME}</td> 
			   <td>%supcon{it.EMAIL}</td> 
			   <td>%supcon{it.DEPARTMENTNAME}</td> 
			   <td>%supcon{it.FJHM}</td> 
			   <td>%supcon{it.ZXHM}</td> 
			   <td>%supcon{it.MOBILE}</td> 
			   <td>
			    {@if it.ZWMC==null}
                     <span>暂无</span>	 
			    {@else}
                    %supcon{it.ZWMC}
                {@/if}
			   </td> 			   
			   <td>%supcon{it.PNAME}</td> 
			   <td>%supcon{it.ZXHM}</td> 		
			   <td>%supcon{it.TXLBZ}</td> 
			   <td>
			    {@if it.PICTURE==null}
                     <span>暂无</span>	 
			    {@else}
                    %supcon{it.PICTURE}
                {@/if}
			   </td> 			   
			</tr>
        {@/each}
		</tbody>
</table>
</form>
</script>


     <script id="tpl_group" type="text/template">
<form>
<table class='grid' cellpadding='0' cellspacing='0'>
	<col style="width: 5px;">
	<col style="width: 30px;">
	<col style="width: 50px;">
	<col style="width: 50px;">
	<col style="width: 330px;">
	
	<tbody>
	<tr class='head'>
		<td class='grid_checkbox'><input id='SELECTALL' name="SELECTALL"  type='checkbox' onclick="CA(this.form)" /></td>
		<td class='bor'>员工姓名</td>
		<td class='bor'>电子邮件</td>
		<td class='bor'>组名称</td>
		<td class='bor'>组编码</td>	
		
	</tr>
        {@each result as it}
            <tr class='default'>
			   <td class='grid_checkbox'><input class='checkBox01' type='checkbox' /></td> 
			   <td>%%supcon{it.member.name}</td> 
			   <td>%supcon{it.member.code}@mail.cp-xyxcc.com</td> 
			   <td>%supcon{it.group.nameCn}</td> 
			   <td>%supcon{it.group.code}</td> 			  
              			   
			</tr>
        {@/each}
		</tbody>
</table>
</form>
</script>

<script id="tpl_static" type="text/template">
<form>
<table class='grid' cellpadding='0' cellspacing='0'>
	<col style="width: 200px;">
	<col style="width: 280px;">
	<col style="width: 280px;">
	<col style="width: 150px;">
	<col style="width: 150px;">
	<col style="width: 150px;">
	<col style="width: 150px;">
	<col style="width: 150px;">
	<col style="width: 150px;">
	<col style="width: 150px;">
	<col style="width: 60px;">
	<tbody>
	<tr class='head'>
		<td class='bor'>员工姓名</td>
		<td class='bor'>电子邮件</td>
		<td class='bor'>部门名称</td>
		<td class='bor'>外部号码</td>
		<td class='bor'>内部号码</td>
		<td class='bor'>手机号码</td>
		<td class='bor'>传真</td>
		<td class='bor'>岗位名称</td>
		<td class='bor'>房间号</td>
		<td class='bor'>通讯录备注</td>		
		<td class='bor'>照片</td>			
	</tr>
        {@each result as it}
            <tr  id=%supcon{it.STAFFID}  class='default'>
			   <td>%%supcon{it.NAME}</td> 
			   <td>%supcon{it.EMAIL}</td> 
			   <td>%supcon{it.DEPARTMENTNAME}</td> 
			   <td>%supcon{it.FJHM}</td> 
			   <td>%supcon{it.ZXHM}</td> 
			   <td>%supcon{it.MOBILE}</td> 
			   <td>
			    {@if it.ZWMC==null}
                     <span>暂无</span>	 
			    {@else}
                    %supcon{it.ZWMC}
                {@/if}
			   </td> 			   
			   <td>%supcon{it.PNAME}</td> 
			   <td>%supcon{it.ZXHM}</td> 		
			   <td>%supcon{it.TXLBZ}</td> 
			   <td>
			    {@if it.PICTURE==null}
                     <span>暂无</span>	 
			    {@else}
                    %supcon{it.PICTURE}
                {@/if}
			   </td> 			   
			</tr>
        {@/each}
		</tbody>
</table>
</form>
</script>


<script type="text/javascript">
	var addressStaffListErrorBarWidget = null;
	YAHOO.util.Event.onDOMReady(function() {
		addressStaffListErrorBarWidget = new CUI.ErrorBar('addressStaffListErrorBar',{
		
			
			
			
		});
	});
	
	   
</script>
	<script type="text/javascript">
	//localFlag：用于指定loadpanel的类型，默认为true
	var localLoadPanelWidget = null;
	function createLoadPanel(localFlag,containerEl,_config){
		try{
			if(localFlag == undefined) localFlag = true;
			if(localFlag == false){
				//containerEl = (containerEl == undefined) ? window : containerEl;
				if(!_config) {
					_config = {container:containerEl/*,opacity:50,bgColor:"#666666"*/};
				} else {
					_config.container = containerEl;
				}
				if(!window.containerLoadPanelWidget){
					window.containerLoadPanelWidget = new CUI.loading(_config);
			    }
			}else{
				if(localLoadPanelWidget == null) localLoadPanelWidget = new CUI.loading({local:localFlag,prevEl:'localLoadPanel',paddingLeft:70});
			}
		}catch(e){}
	}
	//关闭的时候，由于无法判断目前出现的loadpanel类型，因此local和container两者都去关闭一下，并将错误捕获
	function closeLoadPanel(){
		try{
			localLoadPanelWidget.close();
			localLoadPanelWidget = null;
		}catch(e){localLoadPanelWidget = null;}
		try{
			window.containerLoadPanelWidget.close();
			window.containerLoadPanelWidget = null;
		}catch(e){window.containerLoadPanelWidget = null;}
	}
	</script>


	
<input type="hidden" name="callBackFuncName" value="selectStaffs_callback" id="callBackFuncName"/>
<div id="staffManage">
	<div id="left_in" region="west"  width="200" resize="true" style="overflow:auto;">

	<div style='height:30px;vertical-align:middle;display:table-cell;padding-left:24px;'><a class='person_abook' href='#'>个人通讯录</a></div>

	<ul id="addressBookDepartmentTree" class="ztree"></ul>
	
	<script type="text/javascript">
		var addressBookDepartmentTree;
		var callback = {onClick:function(event,treeId,node){CUI.resetForm('queryStaffForm');foundation.staff.showDepartmentStaffList(node);CUI.setCookie('nodeCookie_' + treeId,node.layRec,'d1');}};
		var addressBookDepartmentTree_expandFlagOnce = true;
		callback.onAsyncSuccess=zTreeOnAsyncSuccess;
		callback.beforeDrop=zTreeBeforeDrop;
		//callback.onCheck=zTreeOnCheck;
		//如果父节点是选中状态，异步加载成功后,将子节点设为选中状态
		function zTreeOnAsyncSuccess(event, treeId, treeNode, msg) {
			var zTree = $.fn.zTree.getZTreeObj(treeId);
			if(treeNode.isParent && treeNode.checked){
				for(var i=0,c=treeNode.children.length; i<c; i++){
					treeNode.children[i].checked=true;
					if(treeNode.children[i].isParent){
						treeNode.children[i].check_Child_State = 2;
					}else{
						treeNode.children[i].check_Child_State = -1;
					}
					treeNode.check_Child_State = 2;
					zTree.updateNode(treeNode.children[i]);
				}
			}
			
			if(addressBookDepartmentTree_expandFlagOnce){
				var expandFlag = true;
				if(expandFlag == true || expandFlag == 'true'){
					var curNodeLayRec = CUI.getCookie('nodeCookie_' + treeId);
					curNodeLayRec = '1000-'+curNodeLayRec;
					if(curNodeLayRec != undefined && curNodeLayRec !=null && curNodeLayRec != ""){
						if(curNodeLayRec.indexOf("-")>0){
							var nodeIds = curNodeLayRec.split("-");
							var l = nodeIds.length - 1;
							var lastNode = zTree.getNodeByParam("id", nodeIds[l], null)
							for(var j=0;j<l;j++){
								var node = zTree.getNodeByParam("id", nodeIds[j], null);
								zTree.expandNode(node,true);
							}
							
							if(lastNode != null){
								zTree.selectNode(lastNode);
								setTimeout(function(){$("#"+lastNode.tId+"_a").trigger('click');},800);
								addressBookDepartmentTree_expandFlagOnce = false;
							}
						}else{
							var root = zTree.getNodeByParam("id", curNodeLayRec, null);
							if(root != null){
								zTree.selectNode(root);
								setTimeout(function(){$("#"+root.tId+"_a").trigger('click');},800);
								addressBookDepartmentTree_expandFlagOnce = false;
							}
						}
					}else{
						addressBookDepartmentTree_expandFlagOnce = false;
					}
				}
			}
		}
		function zTreeBeforeDrop(treeId, treeNodes, targetNode, moveType) {
		    return !(targetNode == null || (moveType != "inner" && !targetNode.parentTId));
		};
		 function zTreeOnCheck(event, treeId, treeNode) {
		 	 var zTree = $.fn.zTree.getZTreeObj(treeId);
		 	 var nodes = zTree.getCheckedNodes(true);
		 	 for (var i = 0; i < nodes.length; i++) {
	             if(nodes[i].isParent && nodes[i].getCheckStatus().half){
	             	nodes[i].check_Child_State = 1;
	             	nodes[i].getCheckStatus().half = false;
	             	nodes[i].checked = false;
	             	zTree.updateNode(nodes[i]);
	            }
             }
			 /*
			 var parentNode = treeNode.getParentNode();
			 var checkChildState =parentNode.check_Child_State;
			 if(parentNode != null){
			 	if(checkChildState == 1){
			 		parentNode.getCheckStatus().half = false;
			 		parentNode.checked = false;
			 		zTree.updateNode(parentNode);
			 	}
			 }*/
		}
		(function($){
			var initHeight = function(){
		        $('.ztree').each(function(){
		        	if($(this).prev().hasClass("tree-companylist")){
		        		$(this).height($(this).parent().height() - 23 - 11);
		        	}else{
			            $(this).height($(this).parent().height() - 11);
		        	}
		        });
		      
		    };
		    var setting = {
		    	view:{
		    		expandSpeed: "",
		    		selectedMulti: false,
		    		showLine: false
		    	},
	            data:{
	            	key:{
	            		name: "name",
	            		children: "children"
	            	}
	            },
	            async:{
	            	enable: true,
	            	url: "/foundation/addressBook/group/listChildren.action",
	            	autoParam: ["id=id","code","name","companyFlag"]
	            },
	            movUrl:"",
	            callback:callback,
	            check:{
	            	chkboxType:{"Y":"ps","N":"ps"},
	            	chkStyle:"checkbox",
	            	enable: false
	            },
	            edit: {
					enable: true,
					showRemoveBtn:false,
					showRenameBtn:false,
					drag: {
						autoExpandTrigger: false,
						isCopy: false,
						isMove: false,
						prev: true,
						next: true,
						inner: true,
						minMoveSize: 5,
						borderMax: 10,
						borderMin: -5,
						maxShowNodeNum: 5,
						autoOpenTime: 500
					}
				}
	        };
		    var zTreeNodes = [{
	            id: -1,
	            name: "公司通讯录",
	            code:"-1",companyFlag:"-1",
	            isParent: true
	        }];
			var zTreeNodes2 = [{
	            id: -1,
	            name: "个人通讯录",
	            code:"-1",companyFlag:"-1",
	            isParent: true
	        }];
			$(function(){
				var tree = addressBookDepartmentTree = $.fn.zTree.init($('#addressBookDepartmentTree'),setting,zTreeNodes);
		        $(window).resize(function(){
		        	initHeight();
		        });
		        var rootNode = tree.getNodeByParam("id", -1);
		        tree.reAsyncChildNodes(rootNode, "refresh");
				
				var tree2 = addressBookDepartmentTree2 = $.fn.zTree.init($('#addressBookDepartmentTree2'),setting,zTreeNodes2);
		        $(window).resize(function(){
		        	initHeight();
		        });
		     //   var rootNode = tree2.getNodeByParam("id", -1);
		        tree2.reAsyncChildNodes(rootNode, "refresh");
			});
		
		

	
	
	
		})(jQuery);
	</script>
	  <ul id="userDefinedGroupTreeBottom" class="ztree"></ul> 
	  <script type="text/javascript">
		var userDefinedGroupTreeBottom;
		var callback = {onClick:function(event,treeId,node){CUI.resetForm('userDefinedGroup_queryForm');foundation.userDefinedGroupStaff.showGroupInfoBottom(node);CUI.setCookie('nodeCookie_' + treeId,node.layRec,'d1');}};
		var userDefinedGroupTree_expandFlagOnce = true;
		callback.onAsyncSuccess=zTreeOnAsyncSuccess;
		callback.beforeDrop=zTreeBeforeDrop;
		//callback.onCheck=zTreeOnCheck;
		//如果父节点是选中状态，异步加载成功后,将子节点设为选中状态
		function zTreeOnAsyncSuccess(event, treeId, treeNode, msg) {
			var zTree = $.fn.zTree.getZTreeObj(treeId);
			if(treeNode.isParent && treeNode.checked){
				for(var i=0,c=treeNode.children.length; i<c; i++){
					treeNode.children[i].checked=true;
					if(treeNode.children[i].isParent){
						treeNode.children[i].check_Child_State = 2;
					}else{
						treeNode.children[i].check_Child_State = -1;
					}
					treeNode.check_Child_State = 2;
					zTree.updateNode(treeNode.children[i]);
				}
			}
			
			if(userDefinedGroupTree_expandFlagOnce){
				var expandFlag = true;
				if(expandFlag == true || expandFlag == 'true'){
					var curNodeLayRec = CUI.getCookie('nodeCookie_' + treeId);
					if(curNodeLayRec != undefined && curNodeLayRec !=null && curNodeLayRec != ""){
						var tempNode = zTree.getNodeByParam("id", -1, null);
						if(curNodeLayRec.indexOf("-")>0){
							var nodeIds = curNodeLayRec.split("-");
							var l = nodeIds.length - 1;
							for(var j=0;j<l;j++){
								var node = zTree.getNodeByParam("id", nodeIds[j], tempNode);
								zTree.expandNode(node,true);
								tempNode = node;
							}
							var lastNode = zTree.getNodeByParam("id", nodeIds[l], tempNode);
							
							if(lastNode != null){
								zTree.selectNode(lastNode);
								setTimeout(function(){$("#"+lastNode.tId+"_a").trigger('click');},800);
								userDefinedGroupTree_expandFlagOnce = false;
							}
						}else{
							var root = zTree.getNodeByParam("id", curNodeLayRec, tempNode);
							if(root != null){
								zTree.selectNode(root);
								setTimeout(function(){$("#"+root.tId+"_a").trigger('click');},800);
								userDefinedGroupTree_expandFlagOnce = false;
							}
						}
					}else{
						userDefinedGroupTree_expandFlagOnce = false;
					}
				}
			}
			if(zTree.setting.callback.customOnAsyncSuccessMethod) {
				zTree.setting.callback.customOnAsyncSuccessMethod(event, treeId, treeNode, msg);
			}
		}
		function zTreeBeforeDrop(treeId, treeNodes, targetNode, moveType) {
		    return !(targetNode == null || (moveType != "inner" && !targetNode.parentTId));
		};
		 function zTreeOnCheck(event, treeId, treeNode) {
		 	 var zTree = $.fn.zTree.getZTreeObj(treeId);
		 	 var nodes = zTree.getCheckedNodes(true);
		 	 for (var i = 0; i < nodes.length; i++) {
	             if(nodes[i].isParent && nodes[i].getCheckStatus().half){
	             	nodes[i].check_Child_State = 1;
	             	nodes[i].getCheckStatus().half = false;
	             	nodes[i].checked = false;
	             	zTree.updateNode(nodes[i]);
	            }
             }
			 /*
			 var parentNode = treeNode.getParentNode();
			 var checkChildState =parentNode.check_Child_State;
			 if(parentNode != null){
			 	if(checkChildState == 1){
			 		parentNode.getCheckStatus().half = false;
			 		parentNode.checked = false;
			 		zTree.updateNode(parentNode);
			 	}
			 }*/
		}
		(function($){
			var initHeight = function(){
		        $('.ztree').each(function(){
		        	if($(this).prev().hasClass("tree-companylist")){
		        		$(this).height($(this).parent().height() - 23 - 11);
		        	}else{
			            $(this).height($(this).parent().height() - 11);
		        	}
		        });
		      
		    };
		    var setting = {
		    	view:{
		    		expandSpeed: "",
		    		selectedMulti: false,
		    		showLine: false
		    	},
	            data:{
	            	key:{
	            		name: "nameCn",
	            		children: "children"
	            	}
	            },
	            async:{
	            	enable: true,
	            	url: "/foundation/customGroup/listGroups.action?a=-1&crossCompanyFlag=false",
	            	autoParam: ["id=id"]
	            },
	            movUrl:"",
	            callback:callback,
	            check:{
	            	chkboxType:{"Y":"ps","N":"ps"},
	            	chkStyle:"checkbox",
	            	enable: false
	            },
	            edit: {
					enable: true,
					showRemoveBtn:false,
					showRenameBtn:false,
					drag: {
						autoExpandTrigger: false,
						isCopy: false,
						isMove: false,
						prev: true,
						next: true,
						inner: true,
						minMoveSize: 5,
						borderMax: 10,
						borderMin: -5,
						maxShowNodeNum: 5,
						autoOpenTime: 500
					}
				}
	        };
		    var zTreeNodes = [{
	            id: -1,
	            nameCn: "自定义组",
	            
	            isParent: true
	        }];
			$(function(){
				var tree = userDefinedGroupTreeBottom = $.fn.zTree.init($('#userDefinedGroupTreeBottom'),setting,zTreeNodes);
		        $(window).resize(function(){
		        	initHeight();
		        });
		        var rootNode = tree.getNodeByParam("id", -1);
		        tree.reAsyncChildNodes(rootNode, "refresh");
			});
		})(jQuery);
		     
			 function  refreshZiDingYiTree(){
		       var tree = userDefinedGroupTreeBottom;
		  
		        var rootNode = tree.getNodeByParam("id", -1);
		        tree.reAsyncChildNodes(rootNode, "refresh");
		         
			 }
	
	function initPage(){
	
	setTimeout(function(){foundation.userDefinedGroupStaff.sendBackGroupStaffList=function(){ };}, 2000);
	
	}
		
   function newAddGroup(){
	var _dialog;
	var title;
  
	_dialog = new CUI.Dialog({
		title: '自定义组管理',
		url: '/foundation/staff/common/userDefinedGroupStaffList.action?&closePage=true&callBackFuncName=_callback_queryStaffForm_base_staff_name_name&companyId=1000&crossCompanyFlag=false&openType=dialog&multiSelect=false&systemAdminFlag=false',
		width:780,
		height:520,	
		onload:initPage(),
		modal:true,
		buttons:[
				{	name:"关闭",   //name:"${getText('js.cui.js.close')}"
					handler:function(){this.close();
					  refreshZiDingYiTree();
					}
				}],

	});
	//ul#userDefinedGroupTree{padding-top:70px};
	_dialog.show();
	return _dialog;
	
	}	 
	   function change(){alert("world");}
	</script>
	
	  <input type="hidden" name="" id="oid"/>
	</div>
	<div id="left_bottom"  style="width:200px;height:30px;border:1px solid #e3e3e3;position: absolute;z-index: 99;bottom:1px;background:#f9f9f9">
	<a href="javascript:void(0)" onclick='newAddGroup()'><img src='/struts/meetingCalendar/images/icon_glz.png'/>管理组</a>
	<a href="javascript:void(0)"  onclick='foundation.staff.addToUserDefinedGroup_dept()'><img src='/struts/meetingCalendar/images/icon_tjdz.png'/>添加到组</a>
	<script type='text/javascript'>
	CUI.ns("foundation.staff");
	CUI.ns("foundation.userDefinedGroupStaff");
    
 



	foundation.staff.addToUserDefinedGroup_dept = function(){
	       var  selectedStaffIds ='';
		   var selectName='';
		   var n ='';
		   var m ='';
		$('.checkBox01').each(function()
		 {if($(this).prop('checked')==true)  {
		   
		   selectedStaffIds += (selectedStaffIds  == '' ? $(this).parents('tr.default').attr('id') : "," + $(this).parents('tr.default').attr('id'));
		  
		  n = $(this).parents('tr.default').find('td').eq(1).html();
		 
          m = n.lastIndexOf('"');
		 
		  if(n.slice(m+2,n.length)!=undefined)
		  {  
		  selectName += (selectName == '' ? n.slice(m+2,n.length) : ','+n.slice(m+2,n.length))}
		 
		 } });
	
		var url = "/foundation/user/userDefinedGroup/listGroups.action?groupType=CUSTOM&groupMemberIds=" + selectedStaffIds + '&addToGroupNs=staff';
		var params = {};
		params['selectedStaffNames'] = selectName;
		  var value = $('tr.head').find('td').eq(3).html();
		   if($('#staffManage #layout-center').css('display')=='none'){
		     CUI.Dialog.alert("请选择公司通讯录中的人员");
			 return;
		   }
		  if(selectName == "" && value == "部门名称" && $('#staffManage #layout-center').css('display')=='block'){
		     CUI.Dialog.alert("请先选择要添加到组的人员");
			 return;
		  }
     
		  if(value == "组名称"){
		    CUI.Dialog.alert("请选择非自定义组中的人员");
			  return;
		  
		  }
		  
		foundation.staff.addToGroupDialog = new CUI.Dialog({
			title    :  "添加到自定义组",
			formId   :  'foundation_addToGroup_form',
			url      :  url,
			modal    :  true,
			type   	 :  4,
			dragable :  true,
			argument :  params,
			buttons  :  [{
							name:"保存",
						  	handler:function(){CUI("#foundation_addToGroup_form").submit();}
						 },
						 {
						 	name:"取消",
						  	handler:function(){this.close();}
						 }]
		});
		foundation.staff.addToGroupDialog.show();
	}
	foundation.staff.callBackUserDefinedGroup = function(res){
		if(res.dealSuccessFlag == true){	
			foundation_addToGroup_formDialogErrorBarWidget.show("保存成功！","s");
			setTimeout(function(){
				foundation.staff.addToGroupDialog.close();
			},1000);
		}else{
			CUI.showErrorInfos(res, foundation_addToGroup_formDialogErrorBarWidget);
		}
	}	
	foundation.staff.showGroupMemberList = function(select){
		var sid = select.options[select.selectedIndex].value;
		if(sid > -1){
			datatable_userDefinedGroupMembers.setRequestDataUrl("/foundation/customGroup/listGroupMember.action?group.groupType=CUSTOM&id=" + sid + "&crossCompanyFlag=${(crossCompanyFlag!false)?string('true', 'false')}");
		}
	}
	
	
	
	foundation.userDefinedGroupStaff.showGroupInfoBottom = function(oNode,currentPage){
	    
		CUI("#base_groupManage_add").css("display","");
		var id = '';
		if(oNode != null && typeof(oNode) != "undefined"){
			id = oNode.id;
		CUI('#oid').val(id);
		}
		 if(oNode == null){
		   id = CUI('#oid').val();
		 }
		 
	
		
	
		  
	
		if(id != null && id != ''){
		   
			var url = '';
			if(id > -1){
				url = "/foundation/customGroup/listGroupMember.action?a=-1&crossCompanyFlag=false&id=" + encodeURIComponent(id);
			}else{
				url = "/foundation/customGroup/queryList.action?a=-1&crossCompanyFlag=false";
			}
			var dataPost = '';
		
			if($('#filterNoUserStaff_group') && $('#filterNoUserStaff_group').prop('checked')){
				dataPost += '&filterNoUserStaff=true';
			}
		     
		
		
		dataPost += '&groupMemberPage.pageSize=20';
		
	    if(currentPage){
		  
	       dataPost += '&groupMemberPage.pageNo='+ currentPage;
	     }
		  
	
		   
			 url = url + dataPost;
		
			 CUI.ajax({ 
			 url:url, 
			 type: 'post', 
			 async: false, 
			 success: function(data) { 
		
			     
			 
            var selectOption = '';
			for(var i = 1;i<=data.totalPages;i++){
			 selectOption +='<option value="'+ i +'" >'+ i +'/' +data.totalPages+'</option>'
			}
			jQuery("#pageChange").html(selectOption);
			//jQuery("#pageChange").attr('searchstyle',obj);
			jQuery("#pageChange").attr('totalPages',data.totalPages);
			jQuery("#pageChange").val(currentPage)
		if(jQuery("#pageChange").val()==null){
            jQuery("#vocation_page").find('em.uew-select-text').html('1/'+data.totalPages)
			if(data.totalPages==0){
         jQuery("#vocation_page").css('display','none')
          }
            else{jQuery("#vocation_page").fadeIn();} 
			}
			else{
			jQuery("#vocation_page").css('display','inline-block');
			jQuery("#vocation_page").find('em.uew-select-text').html(jQuery("#pageChange").val()+'/'+data.totalPages)	
			}
            var tpl = document.getElementById('tpl_group').innerHTML;
            var html = juicer(tpl, data);
		    
			jQuery('#table_grid').html(html);	
		   (function($){
var emptyAddress ='请不要添加空邮件 ！',sameAddress = '该邮件地址已经存在右边！'
$('tr.default,tr.MLTR').css('cursor','pointer');
$('tr.default').dblclick(function(){
        if($('#staffManage #layout-center').css('display')=='block'){
        var destList =  $('select.rightlayout_select').get(0);
	   	var srcList = $(this).find('td').get(2).innerHTML;
		var nameValue ='';
		var currentLength = destList.length;
		var theStr = srcList.toLowerCase();
		var TheStr='';
		var state=true;         //状态码
		var count=0;
		if(currentLength==0){   /** 如果右侧为空那么直接不添加空字符串 **/
		if (theStr=='')
		{
		CUI.Dialog.alert(emptyAddress)	
		state=false;
		}
        else{
		nameValue = $(this).find('td').eq(1).html();
		var indexNum = nameValue.indexOf('gif');
		if(indexNum>0){
		nameValue = nameValue.slice(indexNum+5);
		}	
        TheStr = '"'+ nameValue+'"'+' <'+ theStr+'>';
		}		
		}
		else{
		/** 如果右侧不为空，开始循环判断是否重复添加以及空字符串 **/
		for ( count=0; count<=currentLength && destList.options[count] != null; count++)
		{
		state=true;
		var localStr = destList.options[count].text.toLowerCase();
		nameValue = $(this).find('td').eq(1).html();
		var indexNum = nameValue.indexOf('gif');
		if(indexNum>0){
		nameValue = nameValue.slice(indexNum+5);
		}
		
		TheStr = '"'+ nameValue+'"'+' <'+ theStr+'>';				
		if ( localStr.indexOf(theStr)>=0 &&theStr!='')
		{
		//destList.options[currentLength] = new Option(theStr);break;
		CUI.Dialog.alert(sameAddress)
		state=false;break;
		}
		else if(theStr==''){
		CUI.Dialog.alert(emptyAddress)
		state=false;break;		
		}
		}		
		}
		if(state){
		destList.options[currentLength] = new Option(TheStr);
		destList.options[currentLength].setAttribute('value',TheStr)
		}
		return true;		  
      $('input.checkBox01,input#SELECTALL').prop('checked',false)
	  }
      });
	    ifr_window = window.frames['ifr_bap2'];
		ifr_window.$('tr.MLTR').dblclick(function(){
		var destList =  $('select.rightlayout_select').get(0);
		var srcList = $(this).find('td').get(2).innerHTML;
		 
		var nameValue ='';
		var currentLength = destList.length;
		var theStr = srcList.toLowerCase();
		TheStr = ''
		var state=true;         //状态码
		var count=0;
		if(currentLength==0){   /** 如果右侧为空那么直接不添加空字符串 **/
		if (theStr=='')
		{
		CUI.Dialog.alert(emptyAddress)
		state=false;
		}
        else{
		nameValue = $(this).find('td').eq(1).html();
        TheStr = '"'+ nameValue+'"'+' <'+ theStr+'>';		
		}		
		}
		else{    /** 如果右侧不为空，开始循环判断是否重复添加以及空字符串 **/
		for ( count=0; count<=currentLength && destList.options[count] != null; count++)
		{
		state=true;
		var localStr = destList.options[count].innerHTML.toLowerCase();
		nameValue = $(this).find('td').eq(1).html();
		TheStr = '"'+ nameValue+'"'+' <'+ theStr+'>';
		if ( localStr.indexOf(theStr)>=0 &&theStr!='')
		{
		CUI.Dialog.alert(sameAddress)
		state=false;break;
		}
		else if(theStr==''){
		CUI.Dialog.alert(emptyAddress)
		state=false;break;		
		}
		}		
		}  
		if(state){
		destList.options[currentLength] = new Option(TheStr);
		destList.options[currentLength].setAttribute('value',TheStr)
		}
		return true;		  
       ifr_window.$('input.checkBox02,input#SELECTALL').prop('checked',false)	  
		 });	  
	    
})(jQuery)
			jQuery('input.checkBox01').click(function(){
			if($(this).attr('checked')==undefined){
			$('#SELECTALL').prop('checked',false)
			}
			else{
			var selectAll=true;
			$(this).parents('tbody').eq(0).find('input.checkBox01').each(function(){

			if($(this).attr('checked')==undefined){
			selectAll=false;
			return false;
			}

			});
			if(selectAll){
			  $('#SELECTALL').prop('checked',true)
			}
			}
			});

			 
			
		}});}
	};
	</script>
	</div>

	<div id="staffManageMain_mail" region="center" offsetH="4">
		<form id="queryStaffForm" onsubmit="return false;">


	
<input type="hidden" name="" id="departmentId"/>

	
<input type="hidden" name="" id="cid"/>

	
<input type="hidden" name="sheetName" value="基本信息" id="sheetName"/>

	
<input type="hidden" name="fileName" value="人员信息.xls" id="fileName"/>

	
<input type="hidden" name="actionMode" value="" id="actionMode"/>

	
<input type="hidden" name="letterCondition" value="" id="letterCondition"/>

	
<input type="hidden" name="addressBookContent" value="" id="addressBookContent"/>

	
<input type="hidden" name="pictureShowName" value="照片" id="pictureShowName"/>			<table class="addressBook-tb" cellpadding="0" cellspacing="0" border="0" style="width:100%">
			
				<tr style="height:25px;">

						<td style='vertical-align:top;padding-left:10px;width:231px'  >

	<div class="fix-input">
	<div class="fix-search-click" id="addressBookSearchdiv" onmouseenter="select_addressBookSearch_clear();" onmouseleave="select_addressBookSearch_deleteImage();">
	<input type="text" mneType="mnemonic" multiable="false" class="block_text "	 name="addressBookSearch"	 property_type=""	 
	 	 tabindex=""	 id="addressBookSearch"	 fieldCodeMne="addressBookSearch"	 value="" originalValue=""	 style=""	 title=""	 onfocus="CUI.clearMneTips('addressBookSearch_mneTipLabel','')"	 onclick="CUI.clearMneTips('addressBookSearch_mneTipLabel','');"	 searchClick="foundation.staff.fastQueryFormList()"	 exp=""	 onblur="var that=this;setTimeout(function(){if(!window.mnePageBtnFlag){;cleanMneDiv(that,0,'');CUI.restoreMneTips(that,'addressBookSearch_mneTipLabel','');}},200);"	isCrossCompany="false"	onkeyup="selectKeyEvent(event,this,'/foundation/addressBook/mneClient.action','name','other','false','237','','','')"	 autocomplete=off />
	<input type="hidden" reset="false" id="addressBookSearchFieldCode"  value=""/>
	<input type="hidden" reset="false" id="addressBookSearchDeploymentId"  value=""/>
	<input type="hidden" reset="false" id="addressBookSearchOutcome"  value=""/>
	<input type="hidden" reset="false" id="addressBookSearchSelectPeople"  value=""/>
	<input type="hidden" reset="false" id="addressBookSearchSourceStaff"  value=""/>
	<label id="addressBookSearch_mneTipLabel"  onclick="CUI.clearMneTips('addressBookSearch_mneTipLabel','');" class="mne-tip search-ft-color">请输入姓名、号码、邮件、部门或公司</label>
	<input id="addressBookSearch_click_button" style="display:none;" type="button" deValue=""  class="cui-search-click" value="&nbsp;" onclick="addressBookSearch_selectEvent('addressBookSearch','other','/foundation/addressBook/mneClient.action','参照','','')"></input>
	</div></div>
	<script type="text/javascript">

		$(function(){
			$("#addressBookSearchdiv").bind('mouseenter',function(){
			  select_addressBookSearch_clear();
			});
			$("#addressBookSearchdiv").bind('mouseleave',function(){
			  select_addressBookSearch_deleteImage();
			});
		});

	
	var addressBookSearch_dialog;
	var addressBookSearch_prefix='',addressBookSearch_suffix='';
	function addressBookSearch_selectEvent(objName,type,url,title,refparam,onBeforeClick) {
		try {
			var beforeResult = true;
			if(onBeforeClick && onBeforeClick.length > 0) {
				eval("beforeResult=" + onBeforeClick);
			}
			if(beforeResult == false) {
				return false;
			}
		} catch (e) {
		}
		var arr = objName.split('.');
		addressBookSearch_prefix = '',
		addressBookSearch_suffix = '';
		addressBookSearch_sUrl = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				addressBookSearch_prefix += '.';
			}
			addressBookSearch_prefix += arr[i];
		}
		addressBookSearch_suffix = arr[arr.length -1];
		if(type=="userRange"){
		
			var outCome = $('input[name="workFlowVar.outcome"]:checked').val();
			
			$('#addressBookSearchOutcome').val(outCome);
			refparam += "&outcome=" + outCome;
			refparam += "&deploymentId="
			refparam += "&selectPeople="
		}
		addressBookSearch_dialog = foundation.common.select({
			pageType : type,
			closePage : true,
			callBackFuncName : '_callback_addressBookSearch',
			url : url,
			title : title,
			params : refparam
		});
	}
	
	function _callback_addressBookSearch(obj) {
		CUI('# input[name="'+addressBookSearch_prefix + '.' + addressBookSearch_suffix +'"]').val(obj[0][addressBookSearch_suffix]);
		CUI('# input[name^="'+addressBookSearch_prefix + '."]').unbind("change");
		CUI('# input[name="'+addressBookSearch_prefix + '.' + addressBookSearch_suffix +'"]').bind("change",function(){
			CUI('# input[name="'+addressBookSearch_prefix + '.id"]').val('');
		});
		 
		CUI('# input[name="'+addressBookSearch_prefix + '.id"]').val(obj[0].id);
		 
		if(addressBookSearch_dialog) {
			addressBookSearch_dialog.close();
		}
		CUI.clearMneTips('addressBookSearch_mneTipLabel','');
		
	}
	function addressBookSearch_delete(){
	}
	
	select_addressBookSearch_clear = function(){
	};
	select_addressBookSearch_deleteImage = function(){
	};
	</script>
	
						</td>
						<td   align="left"   style="" >
					
							<!--button type="submit" class="cui-simplebtn" onMouseOver="changeBtnClass(this);" onMouseOut="changeBtnClass(this);" onMouseOver="changeBtnClass(this);" onMouseOut="changeBtnClass(this);" onclick="foundation.staff.queryFormList(1)">查 询</button-->
							<!--<div onclick="foundation.staff.fastQueryFormList()" onmouseup="setBtnChecked(1,'queryStaffForm')" class="edit-btn-query btn-act">
								<a class="cui-btn-l">&nbsp;</a>
								<a class="cui-btn-c"><span i18n='foundation.common.query'></span></a>
								<a class="cui-btn-r-adv">&nbsp;</a>
							</div>
							-->
							<button onclick="foundation.staff.fastQueryFormList()" onmouseup="setBtnChecked(1,'queryStaffForm')" class='block_btn'  >查询</button>
							<!--<div onclick="foundation.staff.queryFormAdv(this)" onmouseup="setBtnChecked(2,'queryStaffForm')" class="edit-btn-adv btn-act">
								<a title="高级查询" class="cui-btn-adv">&nbsp;</a>
							</div>
							-->
							<button onclick="foundation.staff.clearForm()" onmouseup="setBtnChecked(this,'queryStaffForm')" class='block_btn'  >清空</button>
							
							<!--<div style="margin-left:7px" onclick="foundation.staff.clearForm()" class="edit-btn btn-act" onmouseup="setBtnChecked(this,'queryStaffForm')">
								<a class="cui-btn-l">&nbsp;</a>
								<a class="cui-btn-c"><span i18n='common.button.clear'>清空</span></a>
								<a class="cui-btn-r">&nbsp;</a>
							</div>
							-->
					 <button  title='上一页'  id='prev_page'></button>
					 <button  title='下一页'  id='next_page'></button>					 

					 <div class="vocation" id='vocation_page'>
						<select class='select1' searchstyle='' id='pageChange' name=pageindex ></select>	
				    </div>	
						</td>
					</tr>
			</table>
		</form>
<div id="staffList" style="margin:6px 10px 2px;clear:both;margin-left:8px;margin-right:5px;margin-bottom:20px; display:none"></div>
<div class="table_content" id='table_grid'></div>
<script type="text/javascript">
	foundation.common.labelNo="序号";
	var datatable_staffList, staffListWidget;
	(function($){
		function addToButtons(arr1,arr2){
			if(arr2.length > 0) {
				for(var i=0;i<arr2.length;i++) {
					arr1[arr1.length] = arr2[i];
				}
			}
			return arr1;
		}
		var validatorBusinessPool = {};
			
		var aRowMergeKeys = [];
		var columnDefs = [];
		var buttonsAll = [];
		var buttons = [];
		var hidekeys = [];
			hidekeys = ['PICTURE','STAFFID'];
	var node = {};
	node.key = "checkbox";
	node.label = "";
	node.selfType = "checkbox";
	
        	node.type = "checkbox";
        
	
	node.edit = false;
	node.width= 25;
				
				
				node.order=true;
				node.checkall='true';
				
				node.textalign='center';
				
				
				
				
				
				
				node.sortable=true;
				
				
				
				node.displayFieldName = 'name';
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				node.treeNode=false;
				node.multable=false;
				columnDefs[columnDefs.length]=node;
	var node = {};
	node.key = "NAME";
	node.label = "<span i18n='foundation.addressBook.staffName'>员工姓名</span>";
	node.selfType = "";
	
	
	node.edit = false;
	node.width= 120;
				
				
				node.order=true;
				
				
				node.textalign='left';
				
				
				
				
				
				
				node.sortable=true;
				
				
				
				node.displayFieldName = 'name';
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				node.treeNode=false;
				node.multable=false;
				columnDefs[columnDefs.length]=node;
	var node = {};
	node.key = "EMAIL";
	node.label = "<span i18n='foundation.staff.email'>电子邮件</span>";
	node.selfType = "";
	
	
	node.edit = false;
	node.width= 180;
				node.colclick=function(ocell){foundation.staff.sendMail(ocell);};
				
				node.order=true;
				
				
				node.textalign='left';
				
				
				
				
				
				
				node.sortable=true;
				
				
				
				node.displayFieldName = 'name';
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				node.treeNode=false;
				node.multable=false;
				columnDefs[columnDefs.length]=node;
	var node = {};
	node.key = "DEPARTMENTNAME";
	node.label = "<span i18n='foundation.addressBook.departmentName'>部门名称</span>";
	node.selfType = "";
	
	
	node.edit = false;
	node.width= 180;
				
				
				node.order=true;
				
				
				node.textalign='left';
				
				
				
				
				
				
				node.sortable=true;
				
				
				
				node.displayFieldName = 'name';
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				node.treeNode=false;
				node.multable=false;
				columnDefs[columnDefs.length]=node;
	var node = {};
	node.key = "FJHM";
	node.label = "<span i18n='foundation.workinfo.fjhm'>外部号码</span>";
	node.selfType = "";
	
	
	node.edit = false;
	node.width= 140;
				
				
				node.order=true;
				
				
				node.textalign='left';
				
				
				
				
				
				
				node.sortable=true;
				
				
				
				node.displayFieldName = 'name';
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				node.treeNode=false;
				node.multable=false;
				columnDefs[columnDefs.length]=node;
	var node = {};
	node.key = "ZXHM";
	node.label = "<span i18n='foundation.workinfo.zxhm'>内部号码</span>";
	node.selfType = "";
	
	
	node.edit = false;
	node.width= 140;
				
				
				node.order=true;
				
				
				node.textalign='left';
				
				
				
				
				
				
				node.sortable=true;
				
				
				
				node.displayFieldName = 'name';
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				node.treeNode=false;
				node.multable=false;
				columnDefs[columnDefs.length]=node;
	var node = {};
	node.key = "MOBILE";
	node.label = "<span i18n='foundation.staff.mobile'>手机号码</span>";
	node.selfType = "";
	
	
	node.edit = false;
	node.width= 110;
				
				
				node.order=true;
				
				
				node.textalign='left';
				
				
				
				
				
				
				node.sortable=true;
				
				
				
				node.displayFieldName = 'name';
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				node.treeNode=false;
				node.multable=false;
				columnDefs[columnDefs.length]=node;
	var node = {};
	node.key = "ZKXNH";
	node.label = "<span i18n='foundation.staff.virtualMobile'>传真</span>";
	node.selfType = "";
	
	
	node.edit = false;
	node.width= 80;
				
				
				node.order=true;
				
				
				node.textalign='left';
				
				
				
				
				
				
				node.sortable=true;
				
				
				
				node.displayFieldName = 'name';
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				node.treeNode=false;
				node.multable=false;
				columnDefs[columnDefs.length]=node;
	var node = {};
	node.key = "PNAME";
	node.label = "<span i18n='foundation.addressBook.positionName'>岗位名称</span>";
	node.selfType = "";
	
	
	node.edit = false;
	node.width= 120;
				
				
				node.order=true;
				
				
				node.textalign='left';
				
				
				
				
				
				
				node.sortable=true;
				
				
				
				node.displayFieldName = 'name';
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				node.treeNode=false;
				node.multable=false;
				columnDefs[columnDefs.length]=node;
	var node = {};
	node.key = "FJH";
	node.label = "<span i18n='foundation.staff.FJH'>房间号</span>";
	node.selfType = "";
	
	
	node.edit = false;
	node.width= 80;
				
				
				node.order=true;
				
				
				node.textalign='left';
				
				
				
				
				
				
				node.sortable=true;
				
				
				
				node.displayFieldName = 'name';
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				node.treeNode=false;
				node.multable=false;
				columnDefs[columnDefs.length]=node;
	var node = {};
	node.key = "TXLBZ";
	node.label = "<span i18n='foundation.staff.TXLBZ'>通讯录备注</span>";
	node.selfType = "";
	
	
	node.edit = false;
	node.width= 80;
				
				
				node.order=true;
				
				
				node.textalign='left';
				
				
				
				
				
				
				node.sortable=true;
				
				
				
				node.displayFieldName = 'name';
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				node.treeNode=false;
				node.multable=false;
				columnDefs[columnDefs.length]=node;
	var node = {};
	node.key = "PICTURE";
	node.label = "<span i18n='foundation.addressBook.picture'>照片</span>";
	node.selfType = "";
	
	node.defaultTitle = '查看';
	node.edit = false;
	node.width= 100;
				node.colclick=function(){};
				
				node.order=true;
				
				
				node.textalign='left';
				
				
				
				
				
				
				node.sortable=true;
				
				
				
				node.displayFieldName = 'name';
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				node.treeNode=false;
				node.multable=false;
				columnDefs[columnDefs.length]=node;
		if(buttons.length > 0) {
			
		}
		var buildDataTable = function(data){
			return new CUI.DataTable("staffList",
					columnDefs, 
					[data], 
			  		{	
						rowMergeKeys: aRowMergeKeys,
						moreButtonResizeFlag : false,
						
			  			
			  			renderOverEvent: "_showPicture",
			  			
			  			
			            
			            
			            
			            
						
						defaultNodeExpanded:true,
						
						
			            
			            hideKey:hidekeys,
			            dblclick:"foundation.staff.sendAddressStaffInfo",
			            
			            
			            
			            			            
			            paginator:true,
			            
			            
			            
			            
			            
			            pageOrder:"DESC",
			            orderMode:"frontstage",
					    
					    
					    dtPage:"records",
					    
					    formId:"queryStaffForm",
					    dataUrl:"/foundation/addressBook/list-data.action?",
					    
			            
			            
			            
			            
						
						treeView:false,
			            buttons:buttonsAll,
			            method:"post"
			        });
		};
		YAHOO.util.Event.onDOMReady(function() {
				setTimeout(function(){staffListWidget = datatable_staffList = buildDataTable({result:[],pageNo:1,pageSize:20,totalCount:0,totalPages:0});foundation.staff.initFastToolBar();},0);
		});	
	})(jQuery);
	</script>
	</div>
	
	
	
     


	
<div id='layout-est' >
<div id="rightlayout">

   <h3 class='title_right'>收件人</h3>
   <div class='panel_l'><input type="button" class="C" name="Add" title="" ></br></br><input type="button" class="A" name="Dele" title="" ></div>
   <div class='panel_r'><select class='rightlayout_select' emailType='to' multiple=""></select></div>

   <h3 class='title_right'>抄送</h3>
   <div class='panel_l'><input type="button" class="C" name="Add" title="" ></br></br><input type="button" class="A" name="Dele" title="" ></div>
   <div class='panel_r'><select class='rightlayout_select' emailType='cc' multiple=""></select></div>

   <h3 class='title_right'>暗送</h3>
   <div class='panel_l'><input type="button" class="C" name="Add" title="" ></br></br><input type="button" class="A" name="Dele" title="" ></div>
   <div class='panel_r' style='height:77px'><select class='rightlayout_select' emailType='bcc' multiple=""></select></div>   
</div>
</div>	
	
</div>
<script type="text/javascript">
	var staffManageWidget = null;
	YAHOO.util.Event.onDOMReady(function() {
		staffManageWidget = new CUI.Layout('staffManage',{
			gutter:0
			
		});
	});
</script>
<script type="text/javascript">
changeBtnStyle();//按钮交互效果
//照片点击显示函数
 function _showPicture(){
	var as = $("td[key='PICTURE'] a");
	$.each(as,function(index) {
		if($(this).parent().parent().attr('truevalue') != '' && $(this).parent().parent().attr('truevalue') !=undefined){
			var url="/foundation/workbench/download.action?type=com.supcon.orchid.foundation.entities.Staff.image&linkId="+ $('input[name="STAFFID"]',$(this).parent().parent().parent()).val();
			//console.log($(this).parent().parent().parent().children('td:first').children('div:first').attr('title'));
			var _clickshow1 = new CUI.Clickshow({
				dTargetElement: $(this).parent(),	//必选项，目标元素ID 或者DOM节点引用
				layBodyContent: '<img src="'+url+'" style="width:100px;height:125px;" >',	//必选项，弹出层主体部分内容 string类型的html内容或者DOM节点引用		
				width:100,	//必选项，弹出层宽度
				height:151,	//必选项，弹出层高度
				zIndex:400,	//必选项，弹出层z坐标
				titleText:$(this).parent().parent().parent().children('td:first').children('div:first').attr('title')					
			});
			_clickshow1.beforeShow.subscribe(function(){YUD.setStyle(YUD.getElementsByClassName("clickshow-layer"),"display","none")});
		}
	});
}

(function(){
//注册命名空间
CUI.ns("foundation.staff");

$(function(){
	$("#queryStaffForm input[type='text']").bind("keydown",function(evt){
		if(evt.keyCode == 13){
			//按下回车
			setTimeout(function(){foundation.staff.queryFormList(1);}, 200);
			
		}
	});
});
//$(document).ready(function(){$(document).click(function(){foundation.staff.hidePicture()}));
//当前选中编辑员工，用于编辑时的上下翻页
foundation.staff.currentEditStaffId = "";
//获取指定员工StaffId,如果返回null，则表示已经到达第一条或者最后一条
var flag=false;

foundation.staff.fastQueryFormList=function(){
	foundation.staff.cancelSelectedNode();
	foundation.staff.queryFormList(1);
}

foundation.staff.cancelSelectedNode=function(){
		CUI("#cid").val("");
		CUI("#departmentId").val("");
}

foundation.staff.getSpecifiedStaffId = function(action){
	var returnValue = "";
	var rows = staffListWidget.getAllRows();
	
	for(var i=0; i<rows.length; i++){
		switch(action){
			case "first":
					returnValue = rows[0].STAFFID;
					break;
			case "previous":
					if(rows[i].STAFFID == foundation.staff.currentEditStaffId){
						if(rows[i-1] != undefined){
							returnValue = rows[i-1].STAFFID;
						}else{
							returnValue = -1;
						}
					}
					break;
			case "next":
					if(rows[i].STAFFID == foundation.staff.currentEditStaffId){
						if(rows[i+1] != undefined){
							returnValue = rows[i+1].STAFFID;
						}else{
							returnValue = -2;
						}
					}
					break;
			case "last":
					returnValue = rows[rows.length-1].STAFFID;
					break;
		}
		
		if(returnValue!= "") break;
	}
	
	if(returnValue > 0){ 
		foundation.staff.currentEditStaffId = returnValue;
	}

	return returnValue;
}
$('body').click(function(){
	var overlayDiv = $('body>div[id="overlay-container"]');
	if(overlayDiv.length > 0){
		overlayDiv.hide();
		$('body>iframe[id="overlay-containeroverlayFrame"]').hide();
	}	
});
foundation.staff.showMode = function(mode) {
	foundation.staff.cancelSelectedNode();
	CUI("a[id!='+mode+']","#book").attr("class","opinions-off");
	CUI("#book-" + mode).attr("class","opinions-on");
	$("input[name='letterCondition']").val($("a[class='opinions-on']",'#book').attr('value'));
	foundation.staff.queryFormList(2);
}

function getEvent() {  
    if(document.all)  return window.event;    
    func=getEvent.caller;        
    while(func!=null){  
        var arg0=func.arguments[0]; 
        if(arg0) 
        { 
          if((arg0.constructor==Event || arg0.constructor ==MouseEvent) || (typeof(arg0)=="object" && arg0.preventDefault && arg0.stopPropagation)) 
          {  
          return arg0; 
          } 
        } 
        func=func.caller; 
    } 
    return null; 
}


function settingCallBack(){
	var str="";
	CUI(':checkbox[checked="true"]').each(function(index){
		var table=CUI(this).attr("tableName");
		var col=CUI(this).attr("colName");
		if(table!=undefined&&col!=undefined){
			str+=','+table+"_"+col;
		}
		
	});
	str=str.substr(1);

	str1="fieldSave="+str;
	
	CUI.ajax({
		url:'/foundation/staff/exportOut/exportField_save.action',
		type: 'post',
		async: false,
		data: str1,
		success: function(response) {
		}
	});
	
	   
	var exportForm=CUI('#exportForm');
	CUI('<input type="hidden" name="selectField" value="'+str+'">').appendTo(exportForm);
	exportSettingDialog.close();
}


//人员查询
foundation.staff.queryFormList = function(obj,currentPage){
	
	var url = "/foundation/addressBook/list-data.action?";
	var dataPost = "";
	if($("input[name='addressBookSearch']").val() != "请输入姓名、号码、邮件、部门或公司") {
		$("input[name='addressBookContent']").val(encodeURIComponent(CUI.trim(CUI("input[name='addressBookSearch']",CUI("#queryStaffForm")).val())));
		dataPost = "&addressBookContent=" +encodeURIComponent(CUI.trim(CUI("input[name='addressBookSearch']",CUI("#queryStaffForm")).val()));
		dataPost+="&cid="+CUI("#cid").val();
		dataPost+="&departmentId="+CUI("#departmentId").val();
	}
	if(obj == 1) {
		$("input[name='letterCondition']").val('');
	}
	if(obj == 2) {
		var letterCondition = $("a[class='opinions-on']",'#book').attr('value');
		dataPost += (dataPost==""?"":"&") + "letterCondition=" +encodeURIComponent(CUI.trim(letterCondition));
	}
	if(obj == 3){
		$("input[name='letterCondition']").val('');
		dataPost = $('#foundation_staff_adv_form').serialize();
		//解决高级查询分页的问题----将高级查询的控件动态添加到分页的Form中
		var advForm=CUI("#foundation_staff_adv_form");
		var staffName=(CUI("input[name='staff.name']",advForm)!=null)?CUI("input[name='staff.name']",advForm).val():"";
		var staffEmail=(CUI("input[name='staff.email']",advForm)!=null)?CUI("input[name='staff.email']",advForm).val():"";
		var staffMobile=(CUI("input[name='staff.mobile']",advForm)!=null)?CUI("input[name='staff.mobile']",advForm).val():"";
		
		var staffVirtualMobile=(CUI("input[name='staff.virtualMobile']",advForm)!=null)?CUI("input[name='staff.virtualMobile']",advForm).val():"";
		var staffSex=(CUI("input[name='staffSex']",advForm)!=null)?CUI("select[name='staffSex']",advForm).val():"";
		var companyName=(CUI("input[name='companyName']",advForm)!=null)?CUI("input[name='companyName']",advForm).val():"";
		var departmentName=(CUI("input[name='departmentName']",advForm)!=null)?CUI("input[name='departmentName']",advForm).val():"";
		var positionName=(CUI("input[name='positionName']",advForm)!=null)?CUI("input[name='positionName']",advForm).val():"";
		var workinfoFjhm=(CUI("input[name='workinfoFjhm']",advForm)!=null)?CUI("input[name='workinfoFjhm']",advForm).val():"";
		var staffZWMC=(CUI("input[name='staffZWMC']",advForm)!=null)?CUI("input[name='staffZWMC']",advForm).val():"";
		var staffFJH=(CUI("input[name='staffFJH']",advForm)!=null)?CUI("input[name='staffFJH']",advForm).val():"";
		if(CUI("#advQuery_staffName",CUI("#queryStaffForm"))!=undefined&&CUI("#advQuery_staffName",CUI("#queryStaffForm")).length>0){
			CUI("#advQuery_staffName",CUI("#queryStaffForm")).val(staffName);
		}
		else{
			CUI("#queryStaffForm").append("<input type='hidden' name='staff.name' value='"+staffName+"' id='advQuery_staffName'/>");
		}
		if(CUI("#advQuery_staffEmail",CUI("#queryStaffForm"))!=undefined&&CUI("#advQuery_staffEmail",CUI("#queryStaffForm")).length>0){
			CUI("#advQuery_staffEmail",CUI("#queryStaffForm")).val(staffEmail);
		}
		else{
			CUI("#queryStaffForm").append("<input type='hidden' name='staff.email' value='"+staffEmail+"' id='advQuery_staffEmail'/>");
		}
		if(CUI("#advQuery_staffMobile",CUI("#queryStaffForm"))!=undefined&&CUI("#advQuery_staffMobile",CUI("#queryStaffForm")).length>0){
			CUI("#advQuery_staffMobile",CUI("#queryStaffForm")).val(staffMobile);
		}
		else{
			CUI("#queryStaffForm").append("<input type='hidden' name='staff.mobile' value='"+staffMobile+"' id='advQuery_staffMobile'/>");
		}
		if(CUI("#advQuery_staffVirtualMobile",CUI("#queryStaffForm"))!=undefined&&CUI("#advQuery_staffVirtualMobile",CUI("#queryStaffForm")).length>0){
			CUI("#advQuery_staffVirtualMobile",CUI("#queryStaffForm")).val(staffVirtualMobile);
		}
		else{
			CUI("#queryStaffForm").append("<input type='hidden' name='staff.virtualMobile' value='"+staffVirtualMobile+"' id='advQuery_staffVirtualMobile'/>");
		}
		if(CUI("#advQuery_staffSex",CUI("#queryStaffForm"))!=undefined&&CUI("#advQuery_staffSex",CUI("#queryStaffForm")).length>0){
			CUI("#advQuery_staffSex",CUI("#queryStaffForm")).val(staffSex);
		}
		else{
			CUI("#queryStaffForm").append("<input type='hidden' name='staffSex' value='"+staffSex+"' id='advQuery_staffSex'/>");
		}
		if(CUI("#advQuery_companyName",CUI("#queryStaffForm"))!=undefined&&CUI("#advQuery_companyName",CUI("#queryStaffForm")).length>0){
			CUI("#advQuery_companyName",CUI("#queryStaffForm")).val(companyName);
		}
		else{
			CUI("#queryStaffForm").append("<input type='hidden' name='companyName' value='"+companyName+"' id='advQuery_companyName'/>");
		}
		if(CUI("#advQuery_departmentName",CUI("#queryStaffForm"))!=undefined&&CUI("#advQuery_departmentName",CUI("#queryStaffForm")).length>0){
			CUI("#advQuery_departmentName",CUI("#queryStaffForm")).val(departmentName);
		}
		else{
			CUI("#queryStaffForm").append("<input type='hidden' name='departmentName' value='"+departmentName+"' id='advQuery_departmentName'/>");
		}
		if(CUI("#advQuery_positionName",CUI("#queryStaffForm"))!=undefined&&CUI("#advQuery_positionName",CUI("#queryStaffForm")).length>0){
			CUI("#advQuery_positionName",CUI("#queryStaffForm")).val(positionName);
		} else {
			CUI("#queryStaffForm").append("<input type='hidden' name='positionName' value='"+positionName+"' id='advQuery_positionName'/>");
		}
		if(CUI("#advQuery_workinfoFjhm",CUI("#queryStaffForm"))!=undefined&&CUI("#advQuery_workinfoFjhm",CUI("#queryStaffForm")).length>0){
			CUI("#advQuery_workinfoFjhm",CUI("#queryStaffForm")).val(workinfoFjhm);
		}
		else{
			CUI("#queryStaffForm").append("<input type='hidden' name='workinfoFjhm' value='"+workinfoFjhm+"' id='advQuery_workinfoFjhm'/>");
		}
		if(CUI("#advQuery_staffZWMC",CUI("#queryStaffForm"))!=undefined&&CUI("#advQuery_staffZWMC",CUI("#queryStaffForm")).length>0){
			CUI("#advQuery_staffZWMC",CUI("#queryStaffForm")).val(staffZWMC);
		}
		else{
			CUI("#queryStaffForm").append("<input type='hidden' name='staffZWMC' value='"+staffZWMC+"' id='advQuery_staffZWMC'/>");
		}
		if(CUI("#advQuery_staffFJH",CUI("#queryStaffForm"))!=undefined&&CUI("#advQuery_staffFJH",CUI("#queryStaffForm")).length>0){
			CUI("#advQuery_staffFJH",CUI("#queryStaffForm")).val(staffFJH);
		}
		else{
			CUI("#queryStaffForm").append("<input type='hidden' name='staffFJH' value='"+staffFJH+"' id='advQuery_staffFJH'/>");
		}
		$('body').data('addressbook_query_condition', {'staff.name':$("input[name='staff.name']").val(),'staff.email':$("input[name='staff.email']").val()
		,'staff.mobile':$("input[name='staff.mobile']").val(),'staff.virtualMobile':$("input[name='staff.virtualMobile']").val()
		,'staffSex':$("select[name='staffSex']").val(),'companyName':$("input[name='companyName']").val(),'departmentName':$("input[name='departmentName']").val(),'positionName':$("input[name='positionName']").val()
		,'workinfoFjhm':$("input[name='workinfoFjhm']").val(),'staffZWMC':$("input[name='staffZWMC']").val(),'staffFJH':$("input[name='staffFJH']").val()
		});
	}
	
	if(obj != 3){
		if($('body').data('addressbook_query_condition')){	 
			$('body').data('addressbook_query_condition',null);
		}
		$("input[id^='advQuery_']").val("");
	}
	
	
	
	
    dataPost += '&records.pageSize=20&records.maxPageSize=500';
	if(currentPage){
	dataPost += '&pageNo='+ currentPage +'&records.pageNo='+ currentPage;
	}
	
	
	$.ajax({
		type : 'POST',
		url : url,	
		data : dataPost,
		dataType: 'json',
		success : function( data ){
		

		  
            var selectOption = '';
			for(var i = 1;i<=data.totalPages;i++){
			 selectOption +='<option value="'+ i +'" >'+ i +'/' +data.totalPages+'</option>'
			}
			jQuery("#pageChange").html(selectOption);
			jQuery("#pageChange").attr('searchstyle',obj);
			jQuery("#pageChange").attr('totalPages',data.totalPages);
			jQuery("#pageChange").val(currentPage)
		if(jQuery("#pageChange").val()==null){
            jQuery("#vocation_page").find('em.uew-select-text').html('1/'+data.totalPages)
			if(data.totalPages==0){
             jQuery("#vocation_page").css('display','none')
             }
               else{jQuery("#vocation_page").fadeIn();} 
			}
			else{
			jQuery("#vocation_page").css('display','inline-block');
			jQuery("#vocation_page").find('em.uew-select-text').html(jQuery("#pageChange").val()+'/'+data.totalPages)	
			}

			var ifr_window_center = window.frames['_center_iframe_'];  
            if(ifr_window_center._input_name=='abook'){		
			var tpl = document.getElementById('tpl_static').innerHTML;
			}	
			else{
			var tpl = document.getElementById('tpl').innerHTML;
			}
			
            var html = juicer(tpl, data);
			jQuery('#table_grid').html(html);
			(function($){
var emptyAddress ='请不要添加空邮件 ！',sameAddress = '该邮件地址已经存在右边！'
$('tr.default,tr.MLTR').css('cursor','pointer');
$('tr.default').dblclick(function(){
        if($('#staffManage #layout-center').css('display')=='block'){
        var destList =  $('select.rightlayout_select').get(0);
	   	var srcList = $(this).find('td').get(2).innerHTML;
		var nameValue ='';
		var currentLength = destList.length;
		var theStr = srcList.toLowerCase();
		var TheStr='';
		var state=true;         //状态码
		var count=0;
		if(currentLength==0){   /** 如果右侧为空那么直接不添加空字符串 **/
		if (theStr=='')
		{
		CUI.Dialog.alert(emptyAddress)	
		state=false;
		}
        else{
		nameValue = $(this).find('td').eq(1).html();
		var indexNum = nameValue.indexOf('gif');
		if(indexNum>0){
		nameValue = nameValue.slice(indexNum+5);
		}	
        TheStr = '"'+ nameValue+'"'+' <'+ theStr+'>';
		}		
		}
		else{
		/** 如果右侧不为空，开始循环判断是否重复添加以及空字符串 **/
		for ( count=0; count<=currentLength && destList.options[count] != null; count++)
		{
		state=true;
		var localStr = destList.options[count].text.toLowerCase();
		nameValue = $(this).find('td').eq(1).html();
		var indexNum = nameValue.indexOf('gif');
		if(indexNum>0){
		nameValue = nameValue.slice(indexNum+5);
		}
		
		TheStr = '"'+ nameValue+'"'+' <'+ theStr+'>';				
		if ( localStr.indexOf(theStr)>=0 &&theStr!='')
		{
		//destList.options[currentLength] = new Option(theStr);break;
		CUI.Dialog.alert(sameAddress)
		state=false;break;
		}
		else if(theStr==''){
		CUI.Dialog.alert(emptyAddress)
		state=false;break;		
		}
		}		
		}
		if(state){
		destList.options[currentLength] = new Option(TheStr);
		destList.options[currentLength].setAttribute('value',TheStr)
		}
		return true;		  
      $('input.checkBox01,input#SELECTALL').prop('checked',false)
	  }
      });
	    ifr_window = window.frames['ifr_bap2'];
		ifr_window.$('tr.MLTR').dblclick(function(){
		var destList =  $('select.rightlayout_select').get(0);
		var srcList = $(this).find('td').get(2).innerHTML;
		 
		var nameValue ='';
		var currentLength = destList.length;
		var theStr = srcList.toLowerCase();
		TheStr = ''
		var state=true;         //状态码
		var count=0;
		if(currentLength==0){   /** 如果右侧为空那么直接不添加空字符串 **/
		if (theStr=='')
		{
		CUI.Dialog.alert(emptyAddress)
		state=false;
		}
        else{
		nameValue = $(this).find('td').eq(1).html();
        TheStr = '"'+ nameValue+'"'+' <'+ theStr+'>';		
		}		
		}
		else{    /** 如果右侧不为空，开始循环判断是否重复添加以及空字符串 **/
		for ( count=0; count<=currentLength && destList.options[count] != null; count++)
		{
		state=true;
		var localStr = destList.options[count].innerHTML.toLowerCase();
		nameValue = $(this).find('td').eq(1).html();
		TheStr = '"'+ nameValue+'"'+' <'+ theStr+'>';
		if ( localStr.indexOf(theStr)>=0 &&theStr!='')
		{
		CUI.Dialog.alert(sameAddress)
		state=false;break;
		}
		else if(theStr==''){
		CUI.Dialog.alert(emptyAddress)
		state=false;break;		
		}
		}		
		}  
		if(state){
		destList.options[currentLength] = new Option(TheStr);
		destList.options[currentLength].setAttribute('value',TheStr)
		}
		return true;		  
       ifr_window.$('input.checkBox02,input#SELECTALL').prop('checked',false)	  
		 });	  
	    
})(jQuery)	   
			jQuery('input.checkBox01').click(function(){
			if($(this).attr('checked')==undefined){
			$('#SELECTALL').prop('checked',false)
			}
			else{

			var selectAll=true;
			$(this).parents('tbody').eq(0).find('input.checkBox01').each(function(){

			if($(this).attr('checked')==undefined){
			selectAll=false;
			return false;
			}

			});
			if(selectAll){
			  $('#SELECTALL').prop('checked',true)
			}
			}
			});

			
   
			
		}
	});
	
	
	//datatable_staffList.setRequestDataUrl(url,dataPost);	
	
	if(obj == 3){
		foundation.staff.dialog.close();
	}
}
//人员高级查询
foundation.staff.queryFormAdv = function(obj){	
	foundation.staff.cancelSelectedNode();
	var url = "/foundation/addressBook/list-adv.action";
	if($('body').data('addressbook_query_condition')){
		url = url + "?staff.name=" + encodeURIComponent($('body').data('addressbook_query_condition')['staff.name']);
		url = url + "&staff.email=" + encodeURIComponent($('body').data('addressbook_query_condition')['staff.email']); 
		url = url + "&staff.mobile=" + encodeURIComponent($('body').data('addressbook_query_condition')['staff.mobile']); 
		url = url + "&staff.virtualMobile=" + encodeURIComponent($('body').data('addressbook_query_condition')['staff.virtualMobile']); 
		url = url + "&staffSex=" + encodeURIComponent($('body').data('addressbook_query_condition')['staffSex']); 
		url = url + "&companyName=" + encodeURIComponent($('body').data('addressbook_query_condition')['companyName']); 
		url = url + "&departmentName=" + encodeURIComponent($('body').data('addressbook_query_condition')['departmentName']);
		url = url + "&positionName=" + encodeURIComponent($('body').data('addressbook_query_condition')['positionName']); 
		url = url + "&workinfoFjhm=" + encodeURIComponent($('body').data('addressbook_query_condition')['workinfoFjhm']); 
		url = url + "&staffZWMC=" + encodeURIComponent($('body').data('addressbook_query_condition')['staffZWMC']); 
		url = url + "&staffFJH=" + encodeURIComponent($('body').data('addressbook_query_condition')['staffFJH']); 	
	}else{
		url = url + "?staff.name=";
		url = url + "&staff.email="; 
		url = url + "&staff.mobile="; 
		url = url + "&staff.virtualMobile="; 
	}
	showAdvDialog(url);
};

/**
 * 显示高级查询对话框
 * @method showAdvDialog
 * @param {String} url
 * @private
 */
var showAdvDialog = function(url) {
	foundation.staff.dialog = new CUI.Dialog({
		title: "高级查询",
		formId: "foundation_staff_adv_form",
		url:url,
		modal:true,
		type:3,
		dragable:true,
		buttons:[{	name:"查 询",
					handler:function(){foundation.staff.queryFormList(3);}
				},
				{	name:"取 消",
					handler:function(){this.close()}
				}]
	});
	foundation.staff.dialog.show();
};


//选择部门
foundation.staff.selectPDepartment = function(){
		foundation.staff.dialog = new CUI.Dialog({
					title: "部门管理",
					url: "/foundation/department/common/departmentListFrame.action?callBackFuncName=foundation.staff.getDepartmentInfo&crossCompanyFlag=true&openType=dialog",
					modal:true,
					type:4,
					buttons:[{	name:"选 择",
								handler:function(){foundation.department.sendBackDepartmentInfo();}
							},
							{	name:"关 闭",
								handler:function(){this.close()}
							}]
				});
				foundation.staff.dialog.show();
	};
	
	//获取所属部门信息
	foundation.staff.getDepartmentInfo = function(oDepartments){
		CUI("#departmentName").val(oDepartments[0].name);
		foundation.staff.dialog.close();
	};
	
	foundation.staff.clearTips = function(obj) {
		if($(obj).val() == "请输入姓名、号码、邮件、部门或公司") {
			$(obj).val('');
			$("input[name='addressBookContent']").val('');
			//$(obj).removeClass('search-ft-color');
		}
	}
	
	foundation.staff.restoreTips = function(obj) {
		if($(obj).val() == '') {
			$(obj).val("请输入姓名、号码、邮件、部门或公司");
			//$(obj).addClass('search-ft-color');
			$("input[name='addressBookContent']").val('');
		} else {
			$("input[name='addressBookContent']").val(encodeURIComponent(CUI.trim(CUI("input[name='addressBookSearch']",CUI("#queryStaffForm")).val())));
		}
	}
	
	foundation.staff.clearForm = function() {
		$("input[name='addressBookSearch']").val('');
		$("input[name='addressBookContent']").val('');
		$("input[name='letterCondition']").val('');
		CUI.restoreMneTips($("input[name='addressBookSearch']"), 'addressBookSearch_mneTipLabel', 'queryStaffForm');
	}
	
	foundation.staff.initFastToolBar = function() {
		var fastToolDiv = $("<div id='book'></div>");
		var character = new Array("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z");
		var strAll = $("<a id=\"book-all\" class=\"opinions-on\"  hidefocus=\"true\" value=\"all\" href='javascript:foundation.staff.showMode(\"all\")'>全部</a>");
		fastToolDiv.append(strAll);
		for(var i = 0; i < character.length; i++){
			var str = $("<a id=\"book-" + character[i] + "\" class=\"opinions-off\" hidefocus=\"true\" value=\"" + character[i] + "\" href='javascript:foundation.staff.showMode(\"" + character[i] + "\")'>" + character[i].toUpperCase() + "</a>");
			fastToolDiv.append(str);
		}
		fastToolDiv.appendTo($('.paginatorbar-operatebar','#staffList'));
		$('.paginatorbar','#staffList').css('text-align','left');
		$('.datagrid-loading','#staffList').css('left','614px');
	}
	var displayFlag;
	foundation.staff.hidePicture = function(){
		var objDiv = CUI('div[id^="personalPicture"]');
		if(displayFlag==false){
			for(var i=0;i<objDiv.length;i++){	
				objDiv[i].style.display="none";			
			}
		}
	}
	
	foundation.staff.showPicture = function(obj){
		var evt = getEvent();
		var path=obj.PICTURE;
		var url="/foundation/staff/image.action?path="+path;
		//隐藏已经存在的picture的div
		var objDiv = CUI('div[id^="personalPicture"]');
		for(var i=0;i<objDiv.length;i++){
			if(objDiv[i].id!="personalPicture"+path){	
				objDiv[i].style.display="none";		
			}	
		}
		if(document.getElementById("personalPicture"+path)==null){
		
			var objDiv = CUI('<div style="border:1px solid black;width:120px;height:130px;"></div>');
			var image=CUI('<img src="'+url+'" style="width:120px;height:130px;" >');
			objDiv.css('position','absolute');
			objDiv.css('top',evt.clientY);
			objDiv.css('left',evt.clientX);
			objDiv.css('z-index', 99999999);
			objDiv.attr('id',"personalPicture"+path);
			CUI(document.body).append(objDiv);
			objDiv.append(image);
			
			displayFlag=true;
			document.getElementById("personalPicture"+path).style.display = "block";
		}else{
				if(document.getElementById("personalPicture"+path).style.display=="none"){
					document.getElementById("personalPicture"+path).style.display="block";
					document.getElementById("personalPicture"+path).style.top = evt.clientY;
					document.getElementById("personalPicture"+path).style.left= evt.clientX;
					displayFlag=true;
				}else{
					document.getElementById("personalPicture"+path).style.display="none";
					displayFlag=false;
				}
		}
	}
	foundation.staff.showDepartmentStaffList=function(node){
		if(node.companyFlag){
			CUI("#cid").val(node.id);
			CUI("#departmentId").val("");
		}else{
			CUI("#cid").val("");
			CUI("#departmentId").val(node.id);
		}
		foundation.staff.queryFormList(1);
	}
	foundation.staff.sendAddressStaffInfo=function(event,oRow){
		var arrObj = new Array();
	
		var oRows = new Array();
		if(event == undefined){
			oRows = staffListWidget.selectedRows;
		}else{
			oRows.push(oRow);
		}
	
		if(oRows.length == 0){
			//addressStaffListErrorBarWidget.showMessage("请先选择人员！","f");
			return false;
		}
	
		for(var i=0; i<oRows.length; i++){
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#callBackFuncName").val() != ""){
					var ifr_window = window.frames["_center_iframe_"];
					eval("ifr_window." + CUI("#callBackFuncName").val() + "(arrObj)");
			}else{
				getAddressBook(arrObj);
			}
			//addressStaffListErrorBarWidget.showMessage("添加成功","s");
		}catch(e){
			//addressStaffListErrorBarWidget.showMessage("添加失败","f");
			//alert("注意：父窗口回调出错！");
		}
	}
	foundation.staff.returnAddressStaffInfo=function(event,oRow){
	
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = staffListWidget.selectedRows;
		}else{
			oRows.push(oRow);
		}
	
		if(oRows.length == 0){
			//addressStaffListErrorBarWidget.showMessage("请先选择人员！","f");
			return false;
		} else {
			//addressStaffListErrorBarWidget.showMessage("添加成功","s");
		}
	
		for(var i=0; i<oRows.length; i++){
			arrObj.push(oRows[i]);
		}
		return arrObj;
	}
	foundation.staff.sendMail = function(ocell){
		var email = ocell.EMAIL;
		var menuCode='inner_mail_menu';
		var parentCode='mail_menus';
		var url='/extmail/cgi/compose.cgi?atag=1&to=' + email;
		var item = {};
	    item.url = url;
	    item.target = 'IFRAME';
	    top.loadPage(item);
	}
})();
function getAllSelectedRows(){
	return foundation.staff.returnAddressStaffInfo();
}


jQuery(document).ready(function(){

  // jQuery("#pageChange").html('<option>dddd</option><option>dddd</option>')
  
    
  (function($){
  
        var ifr_window_center = window.frames['_center_iframe_'];
        //alert(ifr_window22.jQuery('#to').val())
		if(ifr_window_center.jQuery('#to').val() !=undefined){
 var sendTo = ifr_window_center.jQuery('#to').val().replace(/;|；|，/g, ",").split(','); 
        var sendCc = ifr_window_center.jQuery('#cc').val().replace(/;|；|，/g, ",").split(','); 
        var sendBcc = ifr_window_center.jQuery('#bcc').val().replace(/;|；|，/g, ",").split(','); 
		var sendArray = [sendTo,sendCc,sendBcc];
        jQuery('.rightlayout_select').each(function(){
		 if(jQuery(this).attr('emailType')=='to'){

		   var str = ''
		   for(var v=0;v<sendArray[0].length;v++){
		       if(sendArray[0][v]!=''){
			       str += '<option>'+sendArray[0][v]+'</option>'
			    //  jQuery(this).append('<option>'+sendArray[0][v]+'</option>')
			   }

		   }
		   jQuery(this).html(str)
		 }

		 else if(jQuery(this).attr('emailType')=='cc'){

		   var str = ''
		   for(var v=0;v<sendArray[1].length;v++){
		       if(sendArray[1][v]!=''){
			       str += '<option>'+sendArray[1][v]+'</option>'
			    //  jQuery(this).append('<option>'+sendArray[0][v]+'</option>')
			   }

		   }
		   jQuery(this).html(str)
		 }		 
		 
		 else {

		   var str = ''
		   for(var v=0;v<sendArray[2].length;v++){
		       if(sendArray[2][v]!=''){
			       str += '<option>'+sendArray[2][v]+'</option>'
			    //  jQuery(this).append('<option>'+sendArray[0][v]+'</option>')
			   }

		   }
		   jQuery(this).html(str)
		 }		 
		 });		
		
		}
       

  if(ifr_window_center._input_name=='abook'){
   $("#layout-est").css('display','none')
  }
  
//页码触发请求  
   $("#pageChange").change(function(){
           var value = $('tr.head').find('td').eq(3).html();
      var obj =  $("#pageChange").attr('searchstyle');
	  var currentPage =  $("#pageChange").val();
      if(value == "组名称"){
		 
		  foundation.userDefinedGroupStaff.showGroupInfoBottom(null,currentPage);
		   
		  } 
	  else
	     {   foundation.staff.queryFormList(obj,currentPage)
		 }
   });

   $('#staffManage #layout-center').width('455px');//重定义宽度

   
//添加邮箱地址到右侧功能
    $('.panel_l input.C').click(function(){
   

   
        if($('#staffManage #layout-center').css('display')=='block'){

       var destList =  $(this).parent().next().children('select').get(0);
	  //console.log(destList)   MLTR
      $('tr.default').each(function(){ 
	    if($(this).find("td").find("input").attr('checked')=='checked'){
		//  取得邮件地址
		var srcList = $(this).find("td").find("input").parents('tr.default').find('td').get(2).innerHTML;
		    
		var nameValue ='';
		var currentLength = destList.length;
		var theStr = srcList.toLowerCase();  
		     
		var TheStr='';
		var state=true;         //状态码
		var count=0;
		if(currentLength==0){   /** 如果右侧为空那么直接不添加空字符串 **/

		if (theStr=='')      
		{                             //  判断是否存在邮件地址，此为邮件地址为空的情况
		state=false;
		}
        else{
		nameValue = $(this).find("td").find("input").parents('tr.default').find('td').eq(1).html();
		
		var indexNum = nameValue.indexOf('gif');
		  
		  if(indexNum>0){
		nameValue = nameValue.slice(indexNum+5);
          }		
		
        TheStr = '"'+ nameValue+'"'+' <'+ theStr+'>';
		}		
		}
		else{

		/** 如果右侧不为空，开始循环判断是否重复添加以及空字符串 **/
		for ( count=0; count<=currentLength && destList.options[count] != null; count++)
		{
		state=true;

		var localStr = destList.options[count].text.toLowerCase();
		nameValue = $(this).find("td").find("input").parents('tr.default').find('td').eq(1).html();
		var indexNum = nameValue.indexOf('gif');
		  if(indexNum>0){
		nameValue = nameValue.slice(indexNum+5);
          }	
		TheStr = '"'+ nameValue+'"'+' <'+ theStr+'>';

							
		if ( localStr.indexOf(theStr)>=0 || theStr=='')
		{
		//destList.options[currentLength] = new Option(theStr);break;
		state=false;break;
		}
		}		
		}

		if(state){
		destList.options[currentLength] = new Option(TheStr);
		destList.options[currentLength].setAttribute('value',TheStr)
		}
		return true;		  
		}
	  });
      $('input.checkBox01,input#SELECTALL').prop('checked',false)
      }
	  else{


       var destList =  $(this).parent().next().children('select').get(0);
	  
	  
	    ifr_window = window.frames['ifr_bap2'];

		 
        ifr_window.$('tr.MLTR').each(function(){ 
		
		
	    if($(this).find("td").find("input").attr('checked')=='checked'){
		var srcList = $(this).find("td").find("input").parents('tr.MLTR').find('td').get(2).innerHTML;
		var nameValue ='';
		var currentLength = destList.length;
		var theStr = srcList.toLowerCase();
		TheStr = ''
		var state=true;         //状态码
		var count=0;
		if(currentLength==0){   /** 如果右侧为空那么直接不添加空字符串 **/

		if (theStr=='')
		{
		state=false;
		}
        else{
		nameValue = $(this).find("td").find("input").parents('tr.MLTR').find('td').eq(1).html();
        TheStr = '"'+ nameValue+'"'+' <'+ theStr+'>';		
		}		
		}
		else{    /** 如果右侧不为空，开始循环判断是否重复添加以及空字符串 **/
		for ( count=0; count<=currentLength && destList.options[count] != null; count++)
		{
		state=true;
		var localStr = destList.options[count].innerHTML.toLowerCase();
		nameValue = $(this).find("td").find("input").parents('tr.MLTR').find('td').eq(1).html();
		
		TheStr = '"'+ nameValue+'"'+' <'+ theStr+'>';
		if ( localStr.indexOf(theStr)>=0 || theStr=='')
		{
		//destList.options[currentLength] = new Option(theStr);break;
		state=false;break;
		}	
		}		
		}
         
		if(state){
		destList.options[currentLength] = new Option(TheStr);
		destList.options[currentLength].setAttribute('value',TheStr)
		}
		return true;		  
		}
	  });
       ifr_window.$('input.checkBox02,input#SELECTALL').prop('checked',false)	  
	  
	  }
	  
	  
	  
   });
   
//删除邮箱地址功能
   $('.panel_l input.A').click(function(){
     var m =  $(this).parent().next().children('select').get(0);

	 while (m.selectedIndex>=0)
    {
     m.options[m.selectedIndex] = null;
    }
   });			   
   $('#rightlayout').on( 'dblclick', 'select.rightlayout_select option', function () { $(this).remove()} )
   
//上一页  
   $('#prev_page').click(function(){
       var value = $('tr.head').find('td').eq(3).html();
      var obj =  $("#pageChange").attr('searchstyle');
	  if( parseInt($("#pageChange").val())>1){
	  var currentPage =  parseInt($("#pageChange").val()) - 1;
	  
	   if(value == "组名称"){
		 
		  foundation.userDefinedGroupStaff.showGroupInfoBottom(null,currentPage);
		   
		  } 
	  else
	     {   foundation.staff.queryFormList(obj,currentPage)
		 }
	  }
	  else{   
	    CUI.Dialog.alert('已经是第一页')
	  }
   });
   
//下一页
   $('#next_page').click(function(){
      var value = $('tr.head').find('td').eq(3).html();
	  
	    
      var obj =  $("#pageChange").attr('searchstyle');
	  var totalPages =  $("#pageChange").attr('totalPages');
	  var currentPage =  parseInt($("#pageChange").val()) + 1;	
	  
	  if(currentPage-1<totalPages){
	      if(value == "组名称"){
		 
		  foundation.userDefinedGroupStaff.showGroupInfoBottom(null,currentPage);
		   
		  } 
	  else
	     {   foundation.staff.queryFormList(obj,currentPage)
		 }
	   
	  }
	  else{ 
	     CUI.Dialog.alert('已经是最后一页')
	  }
	  
     
   
   });


//点击个人通讯录的时候，控制不同div显示隐藏   
   $('.person_abook').click(function(){
   $('#staffManage #layout-center').css('display','none');
   $('#person_Abook').css('display','block');
   $(this).addClass('person_abook_active')
    $('.ztree').find('a').removeClass('curSelectedNode')
	
   
   
   })
   
   
//点击公司通讯录的时候，控制不同div显示隐藏    
   $('.ztree').click(function(){
    $('#person_Abook').css('display','none');
   $('#staffManage #layout-center').css('display','block')
   $('.person_abook').removeClass('person_abook_active')
   });

   
  $(".select1").uedSelect({
		width : 65			  
	});

   $(".edit-content").css('padding','10px');
   //$('#staffManage #layout-center').css('margin-left','210px')
   
   $('#staffManageMain_mail').css('width','515px')
  // $('#left_in').css('height','437px')
   
	
  $('table.grid tr.default').hover(function(){
  
  $(this).addClass('TD_Hover');
  },function(){$(this).removeClass('TD_Hover');});	 
  
  jQuery("#vocation_page").css('display','none');
  
  
  
  
  
  
  
  }(jQuery))

 
	
	});
	

</script>

	