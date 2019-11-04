function getUA() {
	var ua = navigator.userAgent.toLowerCase();
	if (ua.indexOf('opera')!=-1) { /* Opera (check first in case of spoof) */
		return 'opera';
	} else if (ua.indexOf('msie 7')!=-1) { /* IE7 */
		return 'ie7';
	} else if (ua.indexOf('msie') !=-1) { /* IE */
		return 'ie';
	} else if (ua.indexOf('safari')!=-1) {  
		return 'safari';
	} else if (ua.indexOf('gecko') != -1) { /* Gecko */
		return 'gecko';
	} else {
		return false;
	}
}

/**
 * Describe:cache BackgroundImage with IE6 bug Author:huangwenping
 */
(function(){
    if (getUA() == 'ie') {
        try {
            document.execCommand("BackgroundImageCache", false, true);
        } 
        catch (e) {
        }
    }
})();

/**
 * The CUI global namespace object. If CUI is already defined, the existing CUI
 * object will not be overwritten so that defined namespaces are preserved.
 * 
 * @class CUI
 * @static
 */
if (typeof CUI == "undefined" || !CUI) {
    var CUI = {};
}
/**
 * We cache elements bound by id because when the unload event fires, we can no
 * longer use document.getElementById
 * 
 * @method getEl
 * @static
 * @private
 * @deprecated Elements are not cached any longer
 */
CUI.getEl = function(id) {
	return (typeof id === "string") ? document.getElementById(id) : id;
}

/**
 * Returns an HTMLElement that pass the test applied by element id. For
 * performance, include a tag and/or root node when possible.
 * 
 * @method getElementById
 * @param {String}
 *            elID - a string to use as an ID for find the element.
 * @param {String}
 *            tag (optional) The tag name of the elements being collected
 * @param {String |
 *            HTMLElement} root (optional) The HTMLElement or an ID to use as
 *            the starting point
 * @param {Function}
 *            apply (optional) A function to apply to each element when found
 * @return { HTMLElement} A DOM reference to an HTML element or an array of
 *         HTMLElements
 */
CUI.getElementById = function(elID, tag, root, apply) {
    tag = tag || '*';
    root = (root) ?  CUI.getEl(root) : null || document; 

    if (!root) {
        return null;
    }

	var node = null;
	elements = root.getElementsByTagName(tag);
    
    for (var i = 0, len = elements.length; i < len; ++i) {
        if ( elements[i].id == elID ) {
            node = elements[i];
            if (apply) {
                apply(elements[i]);
            }
			break;
        }
    }
    return node;
}

/**
 * Adds a DOM event directly without the caching, cleanup, scope adj, etc
 * 
 * @method _simpleAdd
 * @param {HTMLElement}
 *            el the element to bind the handler to
 * @param {string}
 *            sType the type of event handler
 * @param {function}
 *            fn the callback to invoke
 * @param {object}
 *            An arbitrary object that will be passed as a parameter to the
 *            handler if true passed el as default
 * @static
 */ 
CUI.addEvent = function (el, sType, fn, obj) {
	
	el = (typeof el === "string") ? document.getElementById(el) : el;
	
	if ( getUA() == 'ie' && el.setInterval != undefined )
		el = window;
	
	var wrappedFn = function(e) {
		if(obj){
			if (obj === true) {
				return fn.call(this, el);
			}
			else {
				return fn.call(this, obj);
			}
		}
	    else{
			return fn();
		}
	};
	
	if (window.addEventListener) {
		el.addEventListener(sType, wrappedFn, false);
    } else if (window.attachEvent) {
		el.attachEvent("on" + sType, wrappedFn);
    } else {
       return false;
    }
}

/**
 * catch Event compatible with Firefox and IE
 */
CUI.getEvent = function () 
{
	if (document.all) {
		return window.event;
	}
    func = CUI.getEvent.caller;
    while (func != null) {
        var arg0 = func.arguments[0];
        if (arg0) {
            if ((arg0.constructor == Event || arg0.constructor == MouseEvent) || (typeof(arg0) == "object" && arg0.preventDefault && arg0.stopPropagation)) {
                return arg0;
            }
        }
        func = func.caller;
    }
    return null;
}


/**
 * cerate an element node ,append parent node and specify className
 * 
 * @param {String}
 *            tag node tagName
 * @param {String|HTMLElement}
 *            parentNode node's parent node which to append
 * @param {String}
 *            classname node className
 */
CUI.createElement = function(tag, parentNode,classname){
	var parentNode = YAHOO.util.Dom.get(parentNode);
	if(!parentNode){return false;}
	var node = document.createElement(tag);
	parentNode.appendChild(node);
	if(classname){
		node.className = classname;
	}
	return node;	
}

/**
 * initial button style
 */
CUI.button = function(container){
	if(container.tagName && container.tagName.toLowerCase() == "button"){
		var buttons = [];
		buttons.push(container);
	} else {
		var buttons = container.getElementsByTagName("button");
	}
	for(var i=0;i<buttons.length;i++){
		if (buttons[i].className == "cui-simplebtn") {
			CUI.addEvent(buttons[i], "mouseover", function(el){
				el.style.backgroundPosition = '0 -21px';
			}, true)
			CUI.addEvent(buttons[i], "mouseout", function(el){
				el.style.backgroundPosition = '0 0';
			}, true)
			CUI.addEvent(buttons[i], "mousedown", function(el){
				el.style.backgroundPosition = '0 -42px';
			}, true)
			CUI.addEvent(buttons[i], "mouseup", function(el){
				el.style.backgroundPosition = '0 0';
			}, true)
		}
	}
}

/**
 * 模仿ext.namespace，用于注册命名空间 举例如下： CUI.ns("workbench"); CUI.ns("sale.contract");
 * CUI.ns("foundation.staff","foundation.customer.baseinfo");
 * 
 * 注册完毕之后，应用例子如下： sale.contract.getContractInfo = function(){XXXXX}
 * sale.contract.contractNO = "supcon_20100101001";
 */
CUI.namespace = function(){
	for ( i = 0; i < arguments.length; i++) {   
		 //拆分名字空间域字符串
		var domains = arguments[i].split(".");
		var cur_domain = window;
		//循环遍历每一级子域
		for (var n = 0; n < domains.length; n++) {
			var domain = domains[n];
			//如果该域的空间未被创建
			if(typeof(cur_domain[domain]) == "undefined"){
				//创建域
				cur_domain[domain] = {};
			}
			//设置当前域为此次循环的域
			cur_domain = cur_domain[domain];
		}
	}
}
CUI.ns = CUI.namespace;	

CUI.closeWindow = function(){
	window.opener = null;
	window.open("","_self");
	window.close();
}
CUI.showErrorInfos=function(msg,obj){
	var errorMsgs = "";
	if(msg.items!=null){
		CUI.each(msg.items,function(index,item){
			for(var i = 0 ; i < item.length ; i++){
				errorMsgs += item[i] + '<br/>';
			}
		});
	}
	if(msg.actionErrors!=null){
		CUI.each(msg.actionErrors,function(index,item){
			errorMsgs += item + '<br/>';
		});
	}
	
	if(msg.exceptionMsg!=null&&msg.exceptionMsg!=""){
		errorMsgs += msg.exceptionMsg + '<br/>';
	}
	if(obj){
		obj.showMessage(errorMsgs,"f");
	}else{
		try{
			workbenchErrorBarWidget.showMessage(errorMsgs,"f");
		}catch(e){
			alert(errorMsgs.replace("<br/>", ""));
		}
	}
}
/**
 * 初始化form
 * 
 * @method CUI.initForm
 * @param {Object
 *            or string} object 当前需要填充的对象
 * @param {string}
 *            prefix 根据value和需要填充的值来决定
 * @param {Object}
 *            values json值
 * @param {Object}
 *            errorbar 错误消息栏
 * @param {array}
 *            readOnlys
 * @param {array}
 *            hides
 */
CUI.initForm = function(object,prefix,values,errorbar,readOnlys,hides) {
	if(errorbar && errorbar.hide) {
		errorbar.hide();
	}
	// 设置只读控件
	if(readOnlys!=null) {
		CUI.each(readOnlys,function(i,item){
			if(typeof item == 'string') {
				CUI('#'+item).prop("readonly", true);
				if($('#'+item).parent('.fix-input-readonly').length > 0 || $('#'+item).parent('.fix-input').length > 0) {
					CUI('#'+item).parent('.fix-input').removeClass('fix-input').addClass('fix-input-readonly');
				}
				//CUI('#'+item).addClass('cui-readonly-field');
			} else {
				if(item.readonly) {
					CUI('#'+item.id).prop("readonly", true);
					if($('#'+item.id).parent('.fix-input').length > 0) {
						CUI('#'+item.id).parent('.fix-input').removeClass('fix-input').addClass('fix-input-readonly');
					}
					//CUI('#'+item.id).addClass('cui-readonly-field');
				} else {
					CUI('#'+item.id).prop("readonly", false);
					if($('#'+item.id).parent('.fix-input-readonly').length > 0) {
						CUI('#'+item.id).parent('.fix-input-readonly').removeClass('fix-input-readonly').addClass('fix-input');
					}
					//CUI('#'+item.id).removeClass('cui-readonly-field');
				}
			}
		});
	}
	// 设置隐藏控件
	if(hides!=null) {
		CUI.each(hides,function(i,item){
			if(typeof item == 'string') {
				CUI('#'+item).hide();
				CUI('#'+item).prop("disabled", true);
				CUI("input,textarea,select", CUI('#'+item)).each(function(o) {
					CUI(this).prop("disabled", true);
				});
			} else {
				if(item.hide) {
					CUI('#'+item.id).hide();
					CUI('#'+item.id).prop("disabled", true);
					CUI("input,textarea,select", CUI('#'+item.id)).each(function(o) {
						CUI(this).prop("disabled", true);
					});
				} else {
					CUI('#'+item.id).show();
					CUI('#'+item.id).prop("disabled", false);
					CUI("input,textarea,select", CUI('#'+item.id)).each(function(o) {
						CUI(this).prop("disabled", false);
					});
				}
			}
		});
	}
	CUI.commonFills(object,prefix,values);
}

/**
 * @method CUI.fillValues
 * @param object
 *            当前需要填充的对象
 * @param prefix
 *            根据value和需要填充的值来决定
 * @param values
 *            json值
 * @description 填充值
 */
CUI.fillValues = function(object,prefix,values) {
	if( typeof object =='string') {
		object = CUI('#'+object);
	} else {
		object = CUI(object);
	}
	CUI("input,textarea", object).each(function(o) {
	// CUI("input,textarea,select", object).each(function(o) {
		// 去掉错误字段样式
		removeErrorField(this);
		var obj = CUI(this);
		var name = $(obj).attr('name');
		if(name==null || name.length==0 || name=='') {
			name = $(obj).attr('id');
		}
		if(name==null) {
			name = '';
		}
		var value = '';
		if(prefix!=null && prefix!=undefined && name!=null && name.indexOf(prefix)!=-1) {
			name = name.substr(prefix.length);
			if(name.substr(0,1)=='.') {
				name = name.substr(1);
			}
			// 处理常规的json，如{def:{cc:'xxx'}}
			try{value = eval('values.'+name);}catch(e){}
			if(value==null || value==undefined || value=='null') {
				// 处理非常规的json，json里的key包含'.',如{'def.cc':'yyy'}
				try{value = eval('values['+name+']');}catch(e){value='';}
			}
		}
		if(value!=null && value!=undefined && value!='null') {
			obj.val(value);
			if(value != "" && obj.attr('mneType') == 'mnemonic') {
				var name = obj.attr('name');
				$('#' + name.replace(/\./g,'_') + '_mneTipLabel').hide();
				obj.attr('valuebak',value);
			}
		} else {
			obj.val('');
		}
	});
}

/**
 * @method CUI.commonFills 公选页面，数据回填
 * @param object
 *            当前需要填充的对象
 * @param prefix
 *            根据value和需要填充的值来决定
 * @param values
 *            json值
 * @description 填充值
 */
CUI.commonFills = function(object,prefix,values,isDefalut) {
	if( typeof object =='string') {
		object = $('#'+object);
	} else {
		object = $(object);
	}
	// 选择器优化,排除pt中的input
	CUI("input[datatableinput!='true'],textarea", object).each(function(o) {
	//CUI("input,textarea,select", object).each(function(o) {
		var obj = CUI(this);
		var objParent = obj.parent();
		while(objParent.prop('tagName').toUpperCase() != 'TD' && objParent.prop('tagName').toUpperCase() != 'BODY' && objParent.prop('tagName').toUpperCase() != 'FORM') {
			objParent = objParent.parent();
		}
		var celltype = objParent.attr('celltype');
		if(celltype==null || celltype.length==0 || celltype=='') {
			celltype = CUI(this).attr('celltype');
		}
		var name = $(obj).attr('name');
		if(name==null || name.length==0 || name=='') {
			name = $(obj).attr('id');
		}
		if(name==null) {
			name = '';
		}
		if(prefix!=null && prefix!=undefined && name!=null && name.indexOf(prefix + ".")!=-1) {
			name = name.substr(prefix.length);
			if(name.substr(0,1)=='.') {
				name = name.substr(1);
			}
			if(obj.attr('type') == 'radio') {
				value = String(CUI.getValue(name,values));
				if(value == obj.val()) {
					CUI(this).prop('checked', true);
				} else {
					CUI(this).prop('checked', false);
				}
			} else if(obj.attr('type') == 'checkbox'){
				if(name.indexOf('_check') > 0) {
					if(CUI('input[name="'+obj.attr('name')+'"]').length == 1) {
						value = String(CUI.getValue(name,values));
						if(value ==obj.val()) {
							CUI(this).prop('checked', true);
						} else {
							CUI(this).prop('checked', false);
						}
						return true;
					} else if(CUI('input[name="'+obj.attr('name')+'"]').length > 1){
						value = String(CUI.getValue(name+'EnumName',values));
						if(value.indexOf(','+obj.val()+',') != -1) {
							obj.prop('checked', true);
						} else {
							obj.prop('checked', false);
						}
						return true;
					}
				}
			} else {
				value = CUI.getValue(name,values);
				if(value!=null && value!=undefined && value!='null' && value!= '') {
					if(celltype == 'DATE' || celltype == 'DATETIME' || celltype == 'datetimeyear' || celltype == 'datetimemonth') {
						if (typeof value == 'string' && value.indexOf("-") > -1) {
							value = value.replace(/-/g, "/");
						}
						value = new Date(value);
						if(celltype == 'DATETIME') {
							value = value.format('yyyy-MM-dd hh:mm:ss');
						} else if (celltype == 'datetimeyear') {
							value = value.format('yyyy');
						} else if (celltype == 'datetimemonth') {
							value = value.format('yyyy-MM');
						} else {
							value = value.format('yyyy-MM-dd');
						}
					}
					obj.val(value);
					if(obj.attr('mneType') == 'mnemonic') {
						var name = obj.attr('name');
						$('#' + name.replace(/\./g,'_') + '_mneTipLabel',object).hide();
					}
					obj.attr('valuebak',value);
					obj.attr('value',value);
					if(isDefalut!=undefined && isDefalut!=null && isDefalut){
						obj.attr('originalvalue',value);
					}
				} else {
					obj.val('');
				}
			}
			
		}
	});
}

/**
 * @method CUI.commonFills 公选页面，数据回填
 * @param object
 *            当前需要填充的对象
 * @param prefix
 *            根据value和需要填充的值来决定
 * @param values
 *            json值
 * @description 填充值
 */
CUI.commonFills_DG = function(object,prefix,values,oGrid) {
	if( typeof object =='string') {
		object = CUI('#'+object);
	} else {
		object = CUI(object);
	}
	var nRow = object.index();
	CUI("input,td", object).each(function(o) {
		var obj = CUI(this);
		var name = $(obj).attr('name');
		if(name==null || name.length==0 || name=='') {
			name = $(obj).attr('id');
		}
		var value = '';
		if(prefix!=null && prefix!=undefined && name!=null && name.indexOf(prefix)!=-1) {
			name = name.substr(prefix.length);
			if(name.substr(0,1)=='.') {
				name = name.substr(1);
			}
			else if(prefix == ''){}
			else{ return;}   
			value = CUI.getValue(name,values);
			if(obj.prop('tagName')=='TD' || obj.prop('tagName')=='INPUT'){
				if(value!=null && value!=undefined && value!='null') {
					if(obj.prop('tagName')=='INPUT') {
						obj.val(value);
						object.attr(prefix+"."+name, value);
					} else {
						if(oGrid && (nRow != undefined)){
							// 延迟处理，避免助记码 点击选中操作时触发的blur事件报错
							setTimeout(function(){
								var key = obj.attr('key');
								oGrid.setCellValue(nRow,key,value);
								object.attr(prefix+"."+name, value);
								// 设置字段文本对齐方式
								for(var i=0; i<oGrid._oColumnSet.keys.length; i++){
									var oColumn = oGrid._oColumnSet.keys[i];
									if(key == oColumn.key){
										if(oColumn.textalign){
											$("div",obj).css('text-align',oColumn.textalign);
										}
									}
								}
								oGrid.setCountValue();
							},100);
						}else{
							$("div",obj).html(value);
							object.attr(prefix+"."+name, value);
						}
					}
				} else {
					if(obj.prop('tagName')=='INPUT') {
						obj.val(value);
						object.attr(prefix+"."+name, value);
					} else {
						$("div",obj).html('');
						object.attr(prefix+"."+name, '');
					}
				}
			}else{
				if(value!=null && value!=undefined && value!='null') {
					obj.val(value);
					object.attr(prefix+"."+name, value);
				} else {
					obj.val('');
					object.attr(prefix+"."+name, '');
				}
			}
		}
	});
	if(oGrid){
		oGrid.setCountValue();
	}	
}

/**
 * @method CUI.commonFills_CP 自定义字段表头回填
 * @param object
 *            当前需要填充的对象
 * @param prefix
 *            根据value和需要填充的值来决定
 * @param values
 *            json值
 * @description 填充值
 */
CUI.commonFills_CP = function(id,url) {
	if ( $('#cp_info').length > 0 ) {
		var dg_cp_info = $('#cp_info').val();
		var relationMap;
		if (dg_cp_info && id && url) {
			$.ajax({
				async   : false,
				type    : 'POST',
				url     : '/foundation/customProp/relation.action',
				data    : 'code=' + url + '&id=' + id,
				success : function(res){
					if (res.dealSuccessFlag && res.relationMap) {
						relationMap = res.relationMap;
					}
				}
			});
			if (relationMap) {
				var objs = new Object();
				var infoArr = dg_cp_info.split(',');
				for (var n in infoArr) {
					var info = infoArr[n].split('||');
					var key = info[0];
					var name = info[1];
					var val = relationMap[key];
					if (val!=undefined) {
						CUI('input[name="'+ name +'"]').val(val);
					}
				}
			}
		}
	}
}
/**
 * @method CUI.commonFills_DG_CP_OBJ 公选页面，对象类型自定义字段数据回填
 * @param object
 *            当前需要填充的对象
 * @param prefix
 *            根据value和需要填充的值来决定
 * @param values
 *            json值
 * @param objCustomPropNames 对象类型自定义字段名称：显示值名称,真实值名称
 * 			  
 * @description 填充值
 */
CUI.commonFills_DG_CP_OBJ = function(object, prefix, values, oGrid, objCustomPropNames){
	if( typeof object == 'string') {
		object = CUI('#'+object);
	} else {
		object = CUI(object);
	}
	var nRow = object.index();
	CUI("input,td", object).each(function() {
		var obj = CUI(this);
		var name = $(obj).attr('name');
		if (name==null || name.length==0 || name=='') {
			name = $(obj).attr('id');
		}
		var showValue = '';
		var trueValue = '';
		if (prefix && name && name.indexOf(prefix) == 0 && objCustomPropNames) {
			var showName = objCustomPropNames.split(',')[0];
			var trueName = objCustomPropNames.split(',')[1];
			showValue = CUI.getValue(showName,values);
			trueValue = CUI.getValue(trueName,values);
			if (obj.prop('tagName')=='TD' || obj.prop('tagName')=='INPUT') {
				if (trueValue && trueValue != 'null') {
					if (obj.prop('tagName')=='INPUT') {
						obj.val(trueValue);
						object.attr(name, trueValue);
					} else {
						if (!showValue) {
							showValue = trueValue;
						}
						if (oGrid && (nRow != undefined)) {
							// 延迟处理，避免助记码 点击选中操作时触发的blur事件报错
							setTimeout(function(){
								var key = obj.attr('key');
								oGrid.setCellValue(nRow, key, showValue);
								object.attr(name, showValue);
								// 设置字段文本对齐方式
								for(var i=0; i<oGrid._oColumnSet.keys.length; i++){
									var oColumn = oGrid._oColumnSet.keys[i];
									if(key == oColumn.key){
										if(oColumn.textalign){
											$("div",obj).css('text-align',oColumn.textalign);
										}
									}
								}
								oGrid.setCountValue();
							},100);
						} else {
							$("div",obj).html(showValue);
							object.attr(name, showValue);
						}
					}
				} else {
					if(obj.prop('tagName')=='INPUT') {
						obj.val('');
						object.attr(name, '');
					} else {
						$("div",obj).html('');
						object.attr(name, '');
					}
				}
			}
		}
	});
	if(oGrid){
		oGrid.setCountValue();
	}	
}

/**
 * @method CUI.commonFills 公选页面，自定义字段数据回填
 * @param object
 *            当前需要填充的对象
 * @param values
 *            json值
 * @description 填充值
 */
CUI.commonFills_DG_CP = function(object,values,oGrid) {
	if (typeof object =='string') {
		object = CUI('#'+object);
	} else {
		object = CUI(object);
	}
	var nRow = object.index();
	CUI("input,td", object).each(function() {
		var obj = CUI(this);
		var name = $(obj).attr('name');
		if (name==null || name.length==0 || name=='') {
			name = $(obj).attr('id');
		}
		var value = CUI.getValue(name,values);
		if (value && value != 'null') {
			if (obj.prop('tagName') == 'TD' || obj.prop('tagName') == 'INPUT') {
				if (obj.prop('tagName')=='INPUT') {
					obj.val(value);
					object.attr(name, value);
				} else {
					if(oGrid && (nRow != undefined)){
						// 延迟处理，避免助记码 点击选中操作时触发的blur事件报错
						setTimeout(function(){
							var key = obj.attr('key');
							oGrid.setCellValue(nRow,key,value);
							object.attr(name, value);
							// 设置字段文本对齐方式
							for(var i=0; i < oGrid._oColumnSet.keys.length; i++){
								var oColumn = oGrid._oColumnSet.keys[i];
								if(key == oColumn.key){
									if(oColumn.textalign){
										$("div", obj).css('text-align', oColumn.textalign);
									}
								}
							}
							oGrid.setCountValue();
						},100);
					} else {
						$("div",obj).html(value);
						object.attr(name, value);
					}
				}
			} else {
				if (value && value != 'null') {
					obj.val(value);
					object.attr(name, value);
				} else {
					obj.val('');
					object.attr(name, '');
				}
			}
		}
	});
	if (oGrid) {
		oGrid.setCountValue();
	}	
}

CUI.commonFillsMultiselect_DG = function(oGrid, tr, key, displaykey,valueObj) {
	var id = valueObj.id;	
	// 当前所有id
	var allmnemultiselectids = $(tr).attr( key + 'allmnemultiselectids') || '';
	// 判断是否已经存在
	if(allmnemultiselectids.indexOf(',' + id + ',') != -1 || allmnemultiselectids.indexOf(id + ',') == 0){
		return;
	}
	var td = $('td[name="' + key + '"]', tr);
	var addInupt = $('input[name="' + key + 'AddIds"]', tr);
	var addIDs = addInupt.val();
	var delInupt = $('input[name="' + key + 'DeleteIds"]', tr);	
	var delIDs = delInupt.val();
	// 原有数据被删除
	if(delIDs.indexOf(',' + id + ',') != -1 || delIDs.indexOf(id + ',') == 0){
		var re = new RegExp('(.*,|^^)('+ id +',)(.*)'); 
		delIDs = delIDs.replace(re,'$1$3');
		delInupt.val(delIDs);
		// 设置隐藏字段值
		tr.setAttribute(key + 'DeleteIds', delIDs);
	}else{
		// 增加
		addIDs += (id + ',');
		addInupt.val(addIDs);
		// 设置隐藏字段值
		tr.setAttribute(key + 'AddIds', addIDs);
	}
	// 更新当前所有id
	allmnemultiselectids += (id + ',');
	$(tr).attr( key + 'allmnemultiselectids', allmnemultiselectids );
	// 标记为已点击
	tr.setAttribute('isClicked','true');
	var delSpan = $("<span class='dg-multiselect-del-span'>" + valueObj[displaykey] + "<img src='/bap/struts/ec/delete.gif' class='dg-multiselect-del-img' onMouseOver='deleteBtnChange(this)' onMouseOut='deleteBtnChange(this)' /></span>");
	$('span.dg-multiselect-name',td).append(delSpan);
	$('img.dg-multiselect-del-img',delSpan).click(function(e){
		CUI.commonDelMultiselect_DG(oGrid, tr, key, id, this);
		// 阻止事件冒泡
		stopBubble(e);
	});	
	// 强制失去焦点, PT多选交互需要
	$('input.dg-multiselect-input',td).blur();
}

CUI.commonDelMultiselect_DG = function(oGrid, tr, key, id, img) {
	var addInupt = $('input[name="' + key + 'AddIds"]', tr);
	var addIDs = addInupt.val();
	var delInupt = $('input[name="' + key + 'DeleteIds"]', tr);
	var delIDs = delInupt.val();
	// 当前所有id
	var allmnemultiselectids = $(tr).attr( key + 'allmnemultiselectids') || '';
	var re = new RegExp('(.*,|^^)('+ id +',)(.*)'); 
	// 判断是否为新增数据
	if(addIDs.indexOf(',' + id + ',') != -1 || addIDs.indexOf(id + ',') == 0){
		addIDs = addIDs.replace(re,'$1$3');
		addInupt.val(addIDs);
		// 设置隐藏字段值
		tr.setAttribute(key + 'AddIds', addIDs);
	}else{
		// 增加
		delIDs += (id + ',');
		delInupt.val(delIDs);
		// 设置隐藏字段值
		tr.setAttribute(key + 'DeleteIds', delIDs);	
	}
	$(img).parent().remove();
	// 更新当前所有id
	allmnemultiselectids = allmnemultiselectids.replace(re,'$1$3');
	$(tr).attr( key + 'allmnemultiselectids', allmnemultiselectids);
	// 标记为已点击
	tr.setAttribute('isClicked','true');
}


CUI.getValue = function(name,values) {
	try{var value = eval('values.'+name);}catch(e){}
	if(value==null || value==undefined || value=='null') {
		// 处理非常规的json，json里的key包含'.',如{'def.cc':'yyy'}
		try{value = eval('values['+name+']');}catch(e){value='';}
	}
	return value;
}

/**
 * @method CUI.pageOpen 打开页面方式
 * @param type
 *            打开方式
 * @description 填充值
 */
CUI.browserPageOpen = function(open_url) {
	var broswerAgent = window.navigator.userAgent;
	
	if(broswerAgent.indexOf("Firefox/4") > -1 /* firefox 4 */ 
			|| broswerAgent.indexOf("Firefox/5") > -1 /* firefox 5 */ 
			|| broswerAgent.indexOf("AppleWebKit") > -1 /* chrome, chromium */
			|| broswerAgent.indexOf("MSIE 9") > -1 /* IE9 */ ) { // 当用户用的是
																// Firefox
																// 4、chrome、chromium、IE9时，采用重定向的方式
		window.location.href = open_url;
	} else {
		var handle = null;
		try{
			var window_height = window.screen.availHeight;
			var window_width  = window.screen.availWidth;
			if(broswerAgent.indexOf('MSIE 8.0') > -1){
				window_height = window_height - 60;
				window_width = window_width - 10;
			}
			if(broswerAgent.indexOf('MSIE 7.0') > -1){
				window_height = window_height - 50;
				window_width = window_width - 12;
			}
			if(broswerAgent.indexOf('MSIE 6.0') > -1){
			      window_height = window_height-50;
			      window_width = window_width-12;
			    }
			ShowStyle = "width = " + window_width + ",height=" + window_height + ",scrollbars=yes,resizable =yes,top=0,left=0,toolbar=no,menubar=no,location=no,status=yes";
			handle = window.open(open_url,"",ShowStyle);
			
		}catch(e){}
		
		if(handle != null){
			window.opener = null;
			window.open("","_self");
			window.close();
		}else{
			window.location.href = "/loginredirect.html";// 若弹出窗口被阻止了，则跳转到提醒页面
		}
		handle = null;
	}
};

deleteBtnChange = function(obj) {
	if($(obj).attr('src').indexOf('/bap/struts/ec/delete.gif') > -1) {
		$(obj).attr('src','/bap/struts/ec/deleteon.gif');
	} else {
		$(obj).attr('src','/bap/struts/ec/delete.gif');
	}
};

CUI.focusMneInput = function(id) {
	CUI('#' + id + 'MneInput').focus();
	var mneInputWidth = parseInt(CUI('#' + id + 'MneInput').css('width'),10);
	var trueWidth = parseInt(CUI("#" + id + "MultiIDsContainerDiv").css('width'),10) - 20;
	var spanWidth = 0;
	$('span',CUI("#" + id + "MultiIDsContainer")).each(function(index){
		spanWidth += parseInt($(this).css('width'),10);
	});
	if(parseInt(spanWidth,10) + mneInputWidth - trueWidth > 0) {
		$('#' + id + 'ellipsisBtn').show();
	} else {
		$('#' + id + 'ellipsisBtn').hide();
	}
};

CUI.getFileName = function ( filePath ) {
	var fileName = filePath.substring( filePath.lastIndexOf( '\\' ) + 1, filePath.length );
	if( fileName == filePath ) {
		fileName = filePath.substring( filePath.lastIndexOf( '/' ) + 1, filePath.length );
	}
	return fileName;
}

removeMneInputContent = function(id,content) {
	if(CUI('#' + id + 'MneInput').val() == content || CUI('#' + id + 'MneInput').val() == '') {
		CUI('#' + id + 'MneInput').val(content);
		CUI('#' + id + 'MneInput').addClass("search-ft-color");
	}
};

changeBtnClass = function(obj,formId) {
	if(1 == obj) {
		if($(".cui-buttona",'#'+formId).hasClass("cui-buttona-hover")) {
			$(".cui-buttona",'#'+formId).removeClass("cui-buttona-hover");
		} else {
			$(".cui-buttona",'#'+formId).addClass("cui-buttona-hover");
		}  
	}else if(2 == obj) {
		if($(".cui-buttonb",'#'+formId).hasClass("cui-buttonb-hover")) {
			$(".cui-buttonb",'#'+formId).removeClass("cui-buttonb-hover");
		} else {
			$(".cui-buttonb",'#'+formId).addClass("cui-buttonb-hover");
		}
	} else {
		if($(obj).hasClass("cui-simplebtn-hover")) {
			$(obj).removeClass("cui-simplebtn-hover");
		} else {
			$(obj).addClass("cui-simplebtn-hover");
		}
	}
	
};

setBtnDown = function(obj,formId) {
	if(1 == obj) {
		$(".cui-buttona",'#'+formId).addClass("cui-buttona-click");
	}else if(2 == obj) {
		$(".cui-buttonb",'#'+formId).addClass("cui-buttonb-click");
	}else if(3 == obj) {
		$("#onlyPendingBtn",'#'+formId).addClass("cui-simplebtn-click");
	} else {
		$(obj).addClass("cui-simplebtn-click");
	}
	
};

setBtnChecked = function(obj,formId) {
	if($("#onlyPendingBtn",'#'+formId) && $("#onlyPendingBtn",'#'+formId).size() > 0) {
		if(1 == obj) {
			$(".edit-btn-query",'#'+formId).addClass("edit-btn-click");
			$(".edit-btn-adv",'#'+formId).removeClass("edit-btn-click");
			if($("#onlyPendingBtn",'#'+formId)) {
				$("#onlyPendingBtn",'#'+formId).removeClass("edit-btn-click");
			}
			$(".edit-btn",'#'+formId).removeClass("edit-btn-click");
		}else if(2 == obj) {
			$(".edit-btn-adv",'#'+formId).addClass("edit-btn-click");
			$(".edit-btn-query",'#'+formId).removeClass("edit-btn-click");
			if($("#onlyPendingBtn",'#'+formId)) {
				$("#onlyPendingBtn",'#'+formId).removeClass("edit-btn-click");
			}	
			$(".edit-btn",'#'+formId).removeClass("edit-btn-click");
		}else if(3 == obj) {
			$(".edit-btn",'#'+formId).removeClass("edit-btn-click");
			$("#onlyPendingBtn",'#'+formId).addClass("edit-btn-click");
			$(".edit-btn-adv",'#'+formId).removeClass("edit-btn-click");
			$(".edit-btn-query",'#'+formId).removeClass("edit-btn-click");
		} else {
			$(obj).removeClass("edit-btn-click");
			if($("#onlyPendingBtn",'#'+formId)) {
				$("#onlyPendingBtn").removeClass("edit-btn-click");
			}	
			$(".edit-btn-query").removeClass("edit-btn-click");
			$(".edit-btn-adv").removeClass("edit-btn-click");
		}
	} else {
		$(".edit-btn-query",'#'+formId).removeClass("edit-btn-click");
		$(".edit-btn-adv",'#'+formId).removeClass("edit-btn-click");
		$(".edit-btn",'#'+formId).removeClass("edit-btn-click");
	}
};

openExportFrame = function(url) {
	var handle = null;
	var open_url= url;
	var window_height = window.screen.availHeight/3;
	var window_width  = window.screen.availWidth/3;
	ShowStyle = "width = " + window_width + ",height=" + window_height + ",scrollbars=no,resizable =no,top=0,left=0,toolbar=no,menubar=no,location=no,status=no";
	handle = window.open(open_url,"",ShowStyle);
	handle = null;
}
/*按钮样式*/
changeBtnStyle = function(){
	$(function(){
		  $(".btn-act").hover(
				  function () {
					$(this).addClass("edit-btn-hover");
				  },function () {
					$(this).removeClass("edit-btn-hover");
			  });
			  $(".btn-act").mousedown(
				  function () {
					$(this).addClass("edit-btn-click");
			  });
			  $(".btn-act").mouseup(
				  function () {
					$(this).removeClass("edit-btn-click");
			  });
	})
}

resetInputWithBakValue = function(formId){
	var inputs = formId ? $( '#' + formId + ' input[resetbakvalue]') : $( 'input[resetbakvalue]');
	inputs.each(function(idx,item){
		item.value =  item.getAttribute('resetbakvalue');
	})
}

//自定义重置表单方法,不会重置属性reset=false的input  
CUI.resetForm = function(formId){
	if(!formId){
		return false;
	}
	$('#' + formId + '_dcSpan','#' + formId).attr('title','').removeClass('dc-text').text($('#' + formId + '_dcSpan','#' + formId).attr('bakSpanText'));
	$('input[reset!="false"],select[reset!="false"],textarea[reset!="false"]','#' + formId).val('');
	//清除助记码的valuebak
	$('input[reset!="false"]','#' + formId).each(function(){
		var bakValue=CUI(this).attr('valuebak');
		if(bakValue&&bakValue!=''){
			CUI(this).attr('valuebak','');
		}
	});
	//重置自定义下拉框
	$( '#' + formId + ' .dropselectbox h4[reset!="false"]').html('');
	$('input[mneType="mnemonic"]').each(function(){
		var name =CUI(this).attr('name');
		CUI.restoreMneTips(this, name.replace(/\./ig,'_') + '_mneTipLabel', formId);
	});
}

// 清除name前缀相同元素的值
CUI.clearInput = function(name){
	var arr = name.split('.');
	if(arr.length == 1) {
		$('[name="' + name + '"]').val('');
	} else {
		arr.pop();
		$('[name^="' + arr.join('.') + '."]').each(function(index, input){
			input.setAttribute('valuebak','');
			switch(input.tagName.toUpperCase()){
				case 'INPUT':
					switch(input.type){
						case 'hidden':
						case 'text':
							input.value = '';
							break;
						case 'checkbox':
							input.checked = false
							break
					}
					break;
				case 'TEXTAREA':
					input.value = '';
					break;
				case 'SELECT':
					$(input).setValue('');
					break;
			}
		})
	}
};

//自定义表单提交方法
CUI.submitForm=function(formId){
	if(!formId){
		return false;
	}
	CUI("#"+formId).submit();
}

// 格式验证
CUI.fn.validate = function(){
	var rule = $(this).attr('validateRule');
	if(rule){
		var value = CUI.trim($(this).val());
		return (/^(?:(?:1[6-9]|[2-9]\d)?\d{2}[\/\-\.](?:0?[1,3-9]|1[0-2])[\/\-\.](?:29|30))(?: (?:0?\d|1\d|2[0-3]))?(?:\:(?:0?\d|[1-5]\d))?(?:\:(?:0?\d|[1-5]\d))?$|^(?:(?:1[6-9]|[2-9]\d)?\d{2}[\/\-\.](?:0?[1,3,5,7,8]|1[02])[\/\-\.]31)(?: (?:0?\d|1\d|2[0-3]))?(?:\:(?:0?\d|[1-5]\d))?(?:\:(?:0?\d|[1-5]\d))?$|^(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])[\/\-\.]0?2[\/\-\.]29)(?: (?:0?\d|1\d|2[0-3]))?(?:\:(?:0?\d|[1-5]\d))?(?:\:(?:0?\d|[1-5]\d))?$|^(?:(?:16|[2468][048]|[3579][26])00[\/\-\.]0?2[\/\-\.]29)(?: (?:0?\d|1\d|2[0-3]))?(?:\:(?:0?\d|[1-5]\d))?(?:\:(?:0?\d|[1-5]\d))?$|^(?:(?:1[6-9]|[2-9]\d)?\d{2}[\/\-\.](?:0?[1-9]|1[0-2])[\/\-\.](?:0?[1-9]|1\d|2[0-8]))(?: (?:0?\d|1\d|2[0-3]))?(?:\:(?:0?\d|[1-5]\d))?(?:\:(?:0?\d|[1-5]\d))?$/).test(value);
	}else{
		return true;
	}
}

CUI.restoreMneTips = function(obj,name,formId) {
	var mneObj = (formId != null && formId != '') ? $("#" + name, "#" + formId) : $("#" + name);
	if(mneObj && mneObj.length > 0) {
		if($(obj).val() == '' && ($(obj).attr('valuebak') == null || $(obj).attr('valuebak') == '') ) {
			if(mneObj.css('display') != 'block') {
				mneObj.show();
			}	
		} else {
			if(mneObj.css('display') != 'none') {
				mneObj.hide();
			}	
		}
	}
}

CUI.clearMneTips = function(name,formId) {
	var mneObj = (formId != null && formId != '') ? $("#" + name, "#" + formId) : $("#" + name);
	if(mneObj && mneObj.length > 0 && mneObj.css('display') != 'none') {
		var obj = (formId != null && formId != '') ? $("#" + name.substr(0, name.lastIndexOf('_')), "#" + formId) : $("#" + name.substr(0, name.lastIndexOf('_')));
		mneObj.hide();
		if(window.navigator.userAgent.indexOf('MSIE') == -1){
			obj.focus();
		}
	}
}
CUI.iePreciseClear = function(name,formId) {
	var idObj = (formId != null && formId != '') ? $('input[name="'+ name + '.id"]', '#' + formId) : $('input[name="'+ name + '.id"]');
	idObj.val('');
}

CUI.setCookie = function(name, value, expiry) {
    var strsec;
    if(expiry==undefined){
    	strsec=0;
    }
    else{
    	strsec = getsec(expiry);
    }
    var exp = new Date();
    exp.setTime(exp.getTime() + strsec * 1);
    document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
}
function getsec(str) {
    var str1 = str.substring(1, str.length) * 1;
    var str2 = str.substring(0, 1);
    if (str2 == "s") {
        return str1 * 1000;
    } else if (str2 == "h") {
        return str1 * 60 * 60 * 1000;
    } else if (str2 == "d") {
        return str1 * 24 * 60 * 60 * 1000;
    }
}
CUI.getCookie = function(name){
    var value = document.cookie.match("(?:^|;)\\s*" + name + "=([^;]*)");
    return value ? unescape(value[1]) : ""
}
CUI.removeCookie = function(expiry) {
    this.setCookie(expiry, "", -1)
}
/*
CUI.setCookie = function(name, value, expiry, domain, path) {
	value = escape(value);
	value += (domain) ? "; domain=" + domain: "";
	value += (path) ? "; path=" + path: "";
	if (expiry) {
		var date = new Date();
		date.setTime(date.getTime() + (expiry * 86400000));
		value += "; expires=" + date.toGMTString()
	}
	document.cookie = name + "=" + value;
}
*/
CUI.setTimeValue = function(inputId, yearId, monthId){
	if(yearId && monthId){
		var year = YUD.get(yearId).value; 
		var month = YUD.get(monthId).value; 
		if(year &&　month){
			YUD.get(inputId).value = year + '-' + month;
		}else{
			YUD.get(inputId).value = '';
		}
	}else if(yearId){
		YUD.get(inputId).value = YUD.get(yearId).value;
	}else if(monthId){
		YUD.get(inputId).value = YUD.get(monthId).value;
	}
}

CUI.polling = function(fn, time, n){
	var time = time || 200;
	if(!fn._pollingCount){
		fn._pollingCount = 0;
	}
	fn._pollingCount ++;
	if( ( !n || fn._pollingCount <= n ) && !fn() ){
		setTimeout(function(){
			CUI.polling(fn, time, n)
		}, time);
	}
}

CUI.ptExportExcel = function(formId, datatableId, postData) {
	//try{
		$('input[name="page.exportFields"]','#' + formId).remove();
		$('input[name="pageSize"]','#' + formId).remove();
		var exportFields = ",";
		var ptObj = eval(datatableId + "Widget");
		var headNodes = ptObj._DT.opts.oXMLData.childNodes[0].childNodes[0].childNodes; 
		for ( var i = 0, l = headNodes.length; i<l; i++ ) {
			var IsHiddenField = headNodes[i].getAttribute('IsHiddenField');
			if ( IsHiddenField == 'true' || IsHiddenField == true ) {
				continue;
			} else {
				exportFields += headNodes[i].tagName + ",";
			}
		}
		// postdata组织到导出form中去
		if(postData && postData.length > 0) {
			var postDataArr = postData.split('&');
			if(postDataArr && postDataArr.length > 0) {
				for(var i=0;i < postDataArr.length;i++) {
					if(postDataArr[i] && postDataArr[i].length > 0) {
						var arr = [];
						if(postDataArr[i].indexOf('=') > 0) {
							arr[0] = postDataArr[i].substring(0, postDataArr[i].indexOf('='));
							arr[1] = postDataArr[i].substring(postDataArr[i].indexOf('=') + 1);
						}
						if(arr && arr.length == 2) {
							if($('input[name="' + arr[0] + '"]','#' + formId) && $('input[name="' + arr[0] + '"]','#' + formId).length ==0) {
								$('#'+ formId).data(arr[0], arr[1]);
							}
						}
					}
				}
			}
		}
		$('#'+ formId).data('page.exportFields', exportFields);
		$('#'+ formId).data('pageSize', ptObj._DT.opts.oXMLData.childNodes[0].getAttribute("pageSize"));
		//try{
			eval(datatableId + "_showExportDialog")(formId);
		//}catch(e){}
	//}catch(e){}
}


CUI.savaGridDeleteRows = function( grid, rowsObj ){
	var grid = grid._DT || grid;
	var gridId = grid.dataTableId || grid.id;
	var ptName = gridId.split('_');
	ptName = ptName[ ptName.length - 1 ];
	$.each(rowsObj, function(index, deleteRow){
		var tepID = deleteRow.id;
		if( tepID == null || tepID == undefined || tepID == '') {
			return true;
		}
		CUI('<input type="hidden" name="' + ptName + 'DeletedIds['+CUI('input[name^="' + ptName + 'DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo( $( '#' + gridId ).parents('form')[0] );
	});
}

CUI.disableMnemonic = function ( id ) {
	var men_input = $( '#' + id );
	men_input.prop('readonly', true);
	men_input.siblings( 'input[formne="' + id + '"]' ).hide();
}

CUI.activeMnemonic = function ( id ) {
	var men_input = $( '#' + id );
	men_input.prop('readonly', false);
	men_input.siblings( 'input[formne="' + id + '"]' ).show();
}

CUI.showLoading = function(){
	$( '#v3_load_mask' ).css( { width: $( '#centerFrame' ).width(), height: $( '#centerFrame' ).height() } ).show();
	$( '#v3_load_iframe' ).css( { width: $( '#centerFrame' ).width(), height: $( '#centerFrame' ).height() } ).show();
	$( '#v3_load_wrap' ).css( { top:  ( $( '#centerFrame' ).height() - $( '#v3_load_wrap' ).height() ) / 2 - $( '#v3_head' ).height() - $( '#v3_tabs' ).height(), left: 181 + ( $( '#centerFrame' ).width() - $( '#v3_load_wrap' ).width() ) / 2 } ).show();
}

CUI.hideLoading = function(){
	$( '#v3_load_mask' ).hide();
	$( '#v3_load_iframe' ).hide();
	$( '#v3_load_wrap' ).hide();
}

/** 填写意见快捷操作 **/
$( function(){
	if ( $( '#workflow_comments' ).length == 0 ) {
		return;
	}
	var box = $( '#workflow_comments' ).parent();
	var tip = $( '<div class="quick-comment-tip">常用意见<span class="circle-arrow circle-arrow-up"></span></div>' );
	var span = $( 'span', tip );
	var list = $( '<ul class="quick-comment-list" style="z-index:100;"><li>同意</li><li>不同意</li><li>请您审批</li><li>已阅</li><li>暂缓执行</li></ul>');
	var iframe = $( '<iframe style="width:205px;height:126px;position:absolute;top:-81px;right:15px;display:none;z-index:99;" frameBorder="0" ></iframe>' )
	box.append( tip ).append( list ).append( iframe );
	
	tip.click( function ( e ) {
		if ( span.hasClass( 'circle-arrow-up' ) ) {
			list.show();
			iframe.show();
			span.addClass( 'circle-arrow-down' ).removeClass( 'circle-arrow-up' );
		} else {
			list.hide();
			iframe.hide();
			span.addClass( 'circle-arrow-up' ).removeClass( 'circle-arrow-down' );
		}
		e.stopPropagation();
	} )
	
	$( 'li', list ).hover( function(){
		$( this ).addClass( 'hover' );
	}, function(){
		$( this ).removeClass( 'hover' );
	} ).click( function(){
		$( '#workflow_comments' ).val( $( this ).text() );
		list.hide();
		iframe.hide();
		span.addClass( 'circle-arrow-up' ).removeClass( 'circle-arrow-down' );
	})
	
	$( 'body' ).click( function(){
		list.hide();
		iframe.hide();
		span.addClass( 'circle-arrow-up' ).removeClass( 'circle-arrow-down' );
	})
});