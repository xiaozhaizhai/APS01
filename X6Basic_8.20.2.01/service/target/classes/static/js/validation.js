	function isInteger(thevalue){   
           
        reg=/^[-+]?\d+$/;    
        if(!reg.test(thevalue)){   
             return false;     
        }else{
        	if(thevalue >= -Math.pow(2,31) && thevalue < Math.pow(2,31)){
        		return true;
        	}else{
        		return false;
        	}
        }   
    }
	
	function isLong(thevalue){   
        reg=/^[-+]?\d+$/;    
        if(!reg.test(thevalue)){   
             return false;     
        }else{
        	if(thevalue >= -Math.pow(2,63) && thevalue < Math.pow(2,63)){
        		return true;
        	}else{
        		return false;
        	}
        }   
    }
    function isDecimal(thevalue){   
           
        reg= /^\d+\.*\d*$/;    
       
        if(!reg.test(thevalue)){   
             return false;     
        }else{   
            return true;
        }   
    }   
     function isDate(thevalue){   
        reg=/^(\d{4})(-|\/)(\d{2})\2(\d{2})$/;    
        if(!reg.test(thevalue)){   
             return false;     
        }else{   
            return true;
        }   
       return true;
    }   
    function checklong(thevalue,checklen){
    	  var iLen = 0;
          var tmpValue = thevalue.replace(/^\s+|\s+$/g,"");
          for(var j=0; j<tmpValue.length; j++){
              iLen += (tmpValue.charCodeAt(j) > 127) ? 3 : 1;
          }
          if(iLen > parseInt(checklen)){
        	  return false;
          }else{   
              return true;
          } 
          return true;
          
    }
    
    function clearErrorMessages(form) {
    	
    }

    function clearErrorLabels(form) {
    	$('.cui-error-fieldortext').css('border-color', '');
    	$('.cui-error-fieldortext').css('background-color', '');
    	$('[style]', '.cui-error-fieldortext').css('background-color', '');
    	$('.cui-error-fieldortext').removeClass('cui-error-fieldortext');
    }

    function addError(form,oErrorWidget,errorFields,errorMessages) {
    	try {
        	// 显示错误信息
        	var errors = "";
        	for(var i=0; i<errorMessages.length; i++){
        		// errors += errorMessages[i] + "<br/>";
        		errors += "<p>" + errorMessages[i] + "</p>";
        	}
        	//if($(oErrorWidget.errorInfoBar).parents('.ewc-dialog-blove').length > 0) {
        	//	oErrorWidget.show(errors);
        	//} else {
        	//	oErrorWidget.showMessage(errors);
        	//}
        	oErrorWidget.showMessage(errors);
        	try {
	        	// 定位到第一个出错框
	        	errorFields[0].focus();
        	} catch (e) {
        	}
        	// 激活按钮
        	// 点击按钮之后会执行body的click事件，写法太难懂了
        	/*
        	CUI("body").one("click", function(event){
        		if(CUI.Dialog) CUI.Dialog.toggleAllButton(CUI(event.target).parent().parent()[0], true);
        	});
        	*/
        } catch (e) {
    	}
    }
 
    function showErrorField(field){
    	// 兼容页面上两个name相同的控件，目前主要针对国际化控件
    	if(field && field.length > 1) {
    		field = $(field).filter('[type="hidden"]');
    		if(field && field.length > 0) {
    			field = field[0];
    		}
    	}
    	if($(field).prop('type') && $(field).prop('type').toUpperCase() == 'HIDDEN' && $(field).next() && $(field).next().length > 0) {
    		field = $(field).next()[0];
    	}
    	CUI(field).css('background-color', '#FCD6D6');	
    	//当input为只读状态时，验证的时候会给input加上红色边框，而不是input外面的fix-input，所以出现灰色跟红色的线条重叠，使用模糊前缀匹配带有class名称为fix-input的第一个父容器。BugID=17934
    	var pares = $(field).parents('div[class^="fix-input"]:first');//var pares = $(field).parents('div.fix-input:first');
    	if(pares && pares.length > 0) {
    		field = pares[0];
    	}
    	CUI(field).addClass('cui-error-fieldortext');
    	//CUI(field).css('border', '#db0000 1px solid');
    	//CUI(field).css('width', '98.5%');
    }
    function removeErrorField(field){
    	if($(field).prop('type') && $(field).prop('type').toUpperCase() == 'HIDDEN' && $(field).next() && $(field).next().length > 0) {
    		field = $(field).next()[0];
    	}
    	CUI(field).css('background-color', '');
    	var pares = $(field).parents('div.fix-input:first');
    	if(pares && pares.length > 0) {
    		field = pares[0];
    	}
    	//$('.cui-error-fieldortext').css('border', '');
    	//$('.cui-error-fieldortext').css('width', '');
    	CUI(field).removeClass('cui-error-fieldortext');
    }