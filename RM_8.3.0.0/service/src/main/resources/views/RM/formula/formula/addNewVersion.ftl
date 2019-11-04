<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1487640821022')}</title>
<@maincss/>
<@mainjs/>
</head>

<body id="dialog_page">
<@loadpanel></@loadpanel>
<@errorbar id="workbenchErrorBar" offsetY=0></@errorbar>
</#if>


<style type="text/css">
.ewc-dialog-el{height:100%;} 
.ewc-dialog-el .edit-table{width:98%;margin:0 auto;}
</style>
<script type="text/javascript">
	CUI.ns('RM.formula.formula.addNewVersion');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign fileuploadType = "Table">
	<#assign fileuploadLinkId = tableInfoId!>
<#assign viewType = "create">
<#assign newObj = editNew!true >
<#if newObj>
<#assign viewType = "create">
<#else>
<#assign viewType = "edit">
</#if>
<#if refId?? && (refId>0)>
	<#assign newObj = false >
</#if>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<#assign callbackName ="RM.formula.formula.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="RM_formula_formula_addNewVersion_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="RM_formula_formula_addNewVersion_form" cssStyle="height:100%;" hiddenField="" onsubmitMethod="RM.formula.formula.addNewVersion.beforeSubmitMethod()" ecAction="/RM/formula/formula/addNewVersion/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="addNewVersion">
	<input type="hidden" name="viewCode" value="RM_7.5.0.0_formula_addNewVersion">
	<input type="hidden" name="datagridKey" value="RM_formula_formula_addNewVersion_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="formula.version" value="${(formula.version)!0}" />
	<input type="hidden" name="formula.extraCol" value='' />
	<div id="RM_addNewVersion_edit_div" style="height:100%">
		<div id="RM_formula_formula_addNewVersion_main_div" class="edit-content-dialog">
<script type="text/javascript">
var attcountid = "RM_formula_formula_addNewVersion_form"+"_attcount";
function fileCountSpan(fileuploadLinkId,fileuploadType){
	if(!fileuploadLinkId) {
		fileuploadLinkId = '${fileuploadLinkId!}'
	}
	if(!fileuploadType) {
		fileuploadType = '${fileuploadType!}'
	}
	CUI.ajax({
		type : "POST",
		url : '/foundation/workbench/upload-count.action?linkId=' + fileuploadLinkId + '&type=' + fileuploadType,
		success : function(msg){
			try{
				if(msg!=null) {
					var fileCount = parseInt(msg);
					$('.total').show();
					//去掉两边的括号字符
					CUI('#'+attcountid).html(fileCount);
				}
			} catch(e){}
		}
	});
};
$(function(){
	var fileuploadLinkId= '${fileuploadLinkId!}';
	if(fileuploadLinkId != '') {
		fileCountSpan(fileuploadLinkId, '${fileuploadType}');
	}
	<#if hasAttachment?? && hasAttachment && false>
	$('#attachmentLi').one('click', function(){
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=RM_7.5.0.0_formula', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>			<div class="edit-panes" style="margin-top:0px;padding:0px;">
				<div>
				<div class="edit-panes-w">

<div class="edit-panes-s" style="width:98%;margin-left:10px;">
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:47%'></td><td style='height:0px;border:none;width:54%'></td></tr>
		<tr class="dialog_tr">
				
							 					<#if !RM_7_5_0_0_formula_Formula_name_permit??>
					<#assign RM_7_5_0_0_formula_Formula_name_permit = checkFieldPermission('formula.name','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_name')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_name_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_Formula_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487075823790')}" >${getText('RM.propertydisplayName.randon1487075823790')}</label>
				</td>
				
						<#assign formula_name_defaultValue  = ''>
							 							<#assign formula_name_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_Formula_name_permit??>
					<#assign RM_7_5_0_0_formula_Formula_name_permit = checkFieldPermission('formula.name','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_name')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_name_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_Formula_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="formula.name" id="formula_name"  style=";" originalvalue="<#if !newObj || (formula.name)?has_content>${(formula.name?html)!}<#else>${formula_name_defaultValue!}</#if>" value="<#if !newObj || (formula.name)?has_content>${(formula.name?html)!}<#else>${formula_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
							 					<#if !RM_7_5_0_0_formula_Formula_edition_permit??>
					<#assign RM_7_5_0_0_formula_Formula_edition_permit = checkFieldPermission('formula.edition','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_edition')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_edition_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_Formula_edition_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487139592239')}" >${getText('RM.propertydisplayName.randon1487139592239')}</label>
				</td>
				
						<#assign formula_edition_defaultValue  = ''>
							 							<#assign formula_edition_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_Formula_edition_permit??>
					<#assign RM_7_5_0_0_formula_Formula_edition_permit = checkFieldPermission('formula.edition','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_edition')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_edition_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_Formula_edition_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if RM_7_5_0_0_formula_Formula_edition_permit == 1>-readonly</#if>">
									<input name="formula.edition" id="formula_edition"  style=";" originalvalue="<#if newObj&& !(formula.edition)?has_content>${formula_edition_defaultValue!}<#elseif (formula.edition)?has_content>#{(formula.edition)!; m1M1}</#if>" value="<#if newObj&& !(formula.edition)?has_content>${formula_edition_defaultValue!}<#elseif (formula.edition)?has_content>#{(formula.edition)!; m1M1}</#if>" type="text" class="cui-noborder-input numberField"<#if RM_7_5_0_0_formula_Formula_edition_permit == 1> readonly=readonly</#if> onchange='changeVersion()'/>
							</div>
							<script type="text/javascript">
								$(function(){
									$('#formula_edition').unbind('blur').bind('blur',function(){
										var percision = 1;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("RM.propertydisplayName.randon1487139592239")}')}");
											return;
										}
										if(parseInt(percision) > -1 && $(this).val()!=undefined && $(this).val()!='' && isDecimal($(this).val())){
											$(this).val(($(this).val() * 1).toFixed(percision));
										}
									});
								});
							</script>
							</#if>
				</td>
		</tr>
	</table>
</div>				</div>	
				<div class="edit-datatable">	
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_addNewVersion,html,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) -->
<!-- 自定义代码 -->
<!-- CUSTOM CODE END -->
<script type="text/javascript">
	RM.formula.formula.addNewVersion.beforeSaveProcess = function(){}
	RM.formula.formula.addNewVersion.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(RM.formula.formula.addNewVersion.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#RM_formula_formula_addNewVersion_form').trigger('beforeSubmit');
		//formula.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="formula.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#RM_formula_formula_addNewVersion_form ul.edit-tabs").tabs("div.edit-panes > div");
		});
	})(jQuery);
	RM.formula.formula.addNewVersion.validate = function(){
		return true;
	}
	
	
	//打印
	RM.formula.formula.addNewVersion.print = function(url){
			var viewCode = $('input[name="viewCode"]').val();
			var value = "";
			if(viewCode!=undefined && viewCode!=null && viewCode!=''){
				$.ajax({
					url : "/ec/print/getAjaxSetting.action",
					type : 'post',
					async : false,
					data:{"printCookie.type":viewCode},
					success : function(msg) {
						if(msg!=null){
							value = msg.value;
						}
					}
				});
				var values = {};
				if(value!=undefined && value!=null && value != ""){
					values = value.split(/\|/g);
				}
				var data="";
				if(values != null && values.length > 0){
					for(var i=0;i < values.length;i++){
						var item = values[i];
						if(data!=""){
							data = data + "&" + item;
						}else{
							data = item;
						}
					}
				}else{
					data = "mainContent=true&attachmentInfo=true&dealInfo=true";
				}
				
				//var url = document.location.href;
				if(url!=undefined && url != null && url !=''){
					var index = url.indexOf(".action");
					var index0 = url.indexOf(".action?");
					if(index0 != -1){
						data = "&" + data;
					}else{
						data = "?" + data;
					}
					if(index != -1){
						var newUrl = url.substring(0,index) + "Print" + url.substring(index) + data;
						window.open(newUrl);
					}
				}
			}
		}
		
		RM.formula.formula.addNewVersion.saveSetting = function(){
			var url = "/ec/print/saveSetting.action";
			var value = "mainContent="+$('#mainContent').prop('checked')+ "|attachmentInfo="+$('#attachmentInfo').prop('checked') +  "|dealInfo="+$('#dealInfo').prop('checked');
			var flag = false;
			$.ajax({
				url : url,
				type : 'post',
				async : false,
				data:{"printCookie.value": value, "printCookie.type":$('input[name="viewCode"]').val(),"printCookie.id":$('#printCookie_id').val(),"printCookie.version":$('#printCookie_version').val()},
				success : function(json) {flag = true;}
			});
			return flag;
		}
		
		var isPrintSettingDialogShow = false;//判断打印设置窗口是否打开，防止重复打开
		RM.formula.formula.addNewVersion.printSetting = function(){
			if(typeof isPrintSettingDialogShow != 'undefined' && isPrintSettingDialogShow === true){
				return;
			}
			var url = "/ec/print/getSetting.action?printCookie.type=" + $('input[name="viewCode"]').val();
			<#if isWorkflow?? && isWorkflow>
			url = url + "&isWorkflow=true";
			<#else>
			url = url + "&isWorkflow=false";
			</#if>
			<#if isAttachment?? && isAttachment>
			url = url + "&isAttachment=true";
			<#else>
			url = url + "&isAttachment=false";
			</#if>
			RM.formula.formula.addNewVersion.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(RM.formula.formula.addNewVersion.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				RM.formula.formula.addNewVersion.settingDialog.show();
				isPrintSettingDialogShow = true;
		}
	
	//控件版PT选人查看按钮单击事件处理函数
	function dataGridBtnImgClick(sUrl,objNameCustomCondition,sTitle,sPTGridID,nRow,sFieldName,oGrid,customCallBack,crossCompany){
		//保存当前单击事件的对象信息
		var obj = {
			"oGrid" : oGrid,
			"nRow" : nRow - 1,
			"sKey":	sFieldName
		}
		if(customCallBack){
			RM.formula.formula.addNewVersion._customCallBack = customCallBack;
		}
		RM.formula.formula.addNewVersion._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#RM_formula_formula_addNewVersion_fileupload').length == 0) {
				$('body').append('<div id="RM_formula_formula_addNewVersion_fileupload"></div>');
			}
			RM.formula.formula.addNewVersion.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "RM_formula_formula_addNewVersion_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#RM_formula_formula_addNewVersion_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			RM.formula.formula.addNewVersion.infoDialog.show();
			if($('#RM_formula_formula_addNewVersion_fileupload').html() == '') {
				$('#RM_formula_formula_addNewVersion_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=RM_formula_formula&entityCode=RM_7.5.0.0_formula&dialogId="+dialogId);
			}
		}
	//参照复制函数
	RM.formula.formula.addNewVersion.referenceCopy = function(objName,url, dialog){
		var callbackName ="RM.formula.formula.addNewVersion.referenceCopyBackInfo";
		RM.formula.formula.addNewVersion.dialog = dialog;
		RM.formula.formula.addNewVersion._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
			iframe:'reference_copy_edit',
			</#if>
			
			url : url,
			title : "${getText('ec.view.property.refview')}",
			params : null
		});
	}
	
	RM.formula.formula.addNewVersion.referenceCopyBackInfo = function(obj){
		if(RM.formula.formula.addNewVersion._dialog){
			RM.formula.formula.addNewVersion._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,RM.formula.formula.addNewVersion.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('RM_formula_formula_addNewVersion_form','RM_formula_formula_addNewVersion_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(RM.formula.formula.addNewVersion.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(RM.formula.formula.addNewVersion.dialog._el).load('/RM/formula/formula/addNewVersion.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
						closeLoadPanel();
						try{
							StrutsUtilsOnLoad();
						}catch(e){}
						try{
							if(me._config.onload != undefined) eval(me._config.onload + "(me)");
						}catch(e){}
				});
			});
		}else{
		</#if>
			
			<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
			parent.$( RM.formula.formula.addNewVersion.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + RM.formula.formula.addNewVersion.dialog._config.iframe, RM.formula.formula.addNewVersion.dialog._dialog ).prop( 'src', '/RM/formula/formula/addNewVersion.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(RM.formula.formula.addNewVersion.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(RM.formula.formula.addNewVersion.dialog._el).load('/RM/formula/formula/addNewVersion.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
					closeLoadPanel();
					try{
						StrutsUtilsOnLoad();
					}catch(e){}
					try{
						if(me._config.onload != undefined) eval(me._config.onload + "(me)");
					}catch(e){}
			});
			</#if>
				
			
		<#if viewType != "readonly">
		}
		</#if>
	};
	
	RM.formula.formula.addNewVersion.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		RM.formula.formula.addNewVersion.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		RM.formula.formula.addNewVersion._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			RM.formula.formula.addNewVersion._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	RM.formula.formula.addNewVersion._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var frameName = 'RM_formula_formula_addNewVersion';
		var callbackName="";
		RM.formula.formula.addNewVersion._prefix = '';
		RM.formula.formula.addNewVersion._oGrid = oGrid;
		RM.formula.formula.addNewVersion._sUrl = url;
		if(customCallBack){
			RM.formula.formula.addNewVersion._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			RM.formula.formula.addNewVersion.gridEventObj = gridEventObj;
			callbackName = "RM.formula.formula.addNewVersion.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				RM.formula.formula.addNewVersion._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "RM.formula.formula.addNewVersion.getMultiselectCallBackInfo_DG" : "RM.formula.formula.addNewVersion.getcallBackInfo_DG";
			RM.formula.formula.addNewVersion._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				RM.formula.formula.addNewVersion._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="RM.formula.formula.addNewVersion.getcallBackInfo";
		}
		if(RM.formula.formula.addNewVersion._prefix!=''){
			RM.formula.formula.addNewVersion._prefix = RM.formula.formula.addNewVersion._prefix.substring(1);
		}
		if(RM.formula.formula.addNewVersion._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.formula.formula.addNewVersion._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof RM.formula.formula.addNewVersion._querycustomFuncN == "function") {
				refparam += RM.formula.formula.addNewVersion._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		RM.formula.formula.addNewVersion._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.formula.formula.addNewVersion._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.formula.formula.addNewVersion.query_"+obj+")!='undefined'") ? eval('RM.formula.formula.addNewVersion.query_'+obj+'()') : null;
		return str;
	
	};
	
	RM.formula.formula.addNewVersion.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('RM_formula_formula_addNewVersion_form',obj[0], RM.formula.formula.addNewVersion._prefix, RM.formula.formula.addNewVersion._sUrl);
		CUI.commonFills('RM_formula_formula_addNewVersion_form',RM.formula.formula.addNewVersion._prefix,obj[0]);

		try{
			if(RM.formula.formula.addNewVersion._customCallBack) {
				eval(RM.formula.formula.addNewVersion._customCallBack);
				RM.formula.formula.addNewVersion._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formula.addNewVersion._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	RM.formula.formula.addNewVersion.getcallBackInfo_DG_IE = function(obj){
		if(RM.formula.formula.addNewVersion._customBeforeCallBack) {
			var flag = eval(RM.formula.formula.addNewVersion._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = RM.formula.formula.addNewVersion.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,RM.formula.formula.addNewVersion._sUrl);
		var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
		for( var i = 0; i < xmlHead.children().length; i++ ){
			var tagName = xmlHead.children()[i].tagName;
			if( tagName.indexOf(rootKey) == 0 ){
				try{
					var value = eval('jsonObj.' + tagName.substring(rootKey.length+1));
				}catch(e){
					var value = eval('jsonObj["' + tagName.substring(rootKey.length+1)+'"]');
				}
				//判断符合条件的key是否存在
				if(value != undefined){
					gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,value);
				}	
			}
		}
		try{
			if(RM.formula.formula.addNewVersion._customCallBack) {
				eval(RM.formula.formula.addNewVersion._customCallBack);
				RM.formula.formula.addNewVersion._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formula.addNewVersion._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	RM.formula.formula.addNewVersion.getcallBackInfo_DG = function(obj){
		if(RM.formula.formula.addNewVersion._customBeforeCallBack) {
			var flag = eval(RM.formula.formula.addNewVersion._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(RM.formula.formula.addNewVersion._currRow).next().length==0){
					RM.formula.formula.addNewVersion._oGrid.addNewRow();
				}	
				RM.formula.formula.addNewVersion._currRow = $(RM.formula.formula.addNewVersion._currRow).next();
				$(RM.formula.formula.addNewVersion._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(RM.formula.formula.addNewVersion._currRow,obj[i],RM.formula.formula.addNewVersion._prefix,RM.formula.formula.addNewVersion._sUrl);
			eval("CUI.commonFills_DG(RM.formula.formula.addNewVersion._currRow,RM.formula.formula.addNewVersion._prefix,obj[i],RM.formula.formula.addNewVersion._oGrid)");
		}
		try{
			if(RM.formula.formula.addNewVersion._customCallBack) {
				eval(RM.formula.formula.addNewVersion._customCallBack);
				RM.formula.formula.addNewVersion._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formula.addNewVersion._dialog.close();
		} catch(e){}
	};
	
	RM.formula.formula.addNewVersion.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(RM.formula.formula.addNewVersion._oGrid, RM.formula.formula.addNewVersion._currRow, RM.formula.formula.addNewVersion._key, RM.formula.formula.addNewVersion._displayFieldName, obj[i])
		}
		try{
			if(RM.formula.formula.addNewVersion._customCallBack) {
				eval(RM.formula.formula.addNewVersion._customCallBack);
				RM.formula.formula.addNewVersion._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formula.addNewVersion._dialog.close();
		} catch(e){}
	};
	
	RM.formula.formula.addNewVersion.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			RM.formula.formula.addNewVersion.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#RM_formula_formula_addNewVersion_form'));
        			}
        	   	}
        	}
      	});
	};
	(function($){
		$(function(){
			var selectedRow=ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow();
var code=selectedRow[0].code;//编码
var name=selectedRow[0].name;//标识
$("#formula_code").val(code);
$("#formula_name").val(name);
		});
	})(jQuery);
	RM.formula.formula.addNewVersion.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	RM.formula.formula.addNewVersion.initCount = 0;
	RM.formula.formula.addNewVersion.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#RM_addNewVersion_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('RM_formula_formula_addNewVersion_datagrids');	
		var	conHeight = h-$("#RM_formula_formula_addNewVersion_main_div .edit-tabs").height() - 6;
		panesHeight = conHeight*0.4;
		$("#RM_formula_formula_addNewVersion_main_div .edit-panes-s").each(function(index){
			//多页签切换时只计算本页签下的PT高度
			if(nTabIndex != undefined && typeof(nTabIndex) == 'number' && index != nTabIndex){
				return;
			}
			thisHeight = $(this).height();
			var datatableHeight = conHeight - panesHeight;
			if(datagrids&&datagrids.length>index&&datagrids[index].length>0) {
				if(thisHeight > panesHeight) {
					$(this).parent().height(panesHeight);
					$(this).parent().css("overflow-y","auto");
				} else {
					if(thisHeight && thisHeight > 0) {
						$(this).parent().height(thisHeight);
					}
					datatableHeight = conHeight - thisHeight;
				}
			} else {
				if(thisHeight > conHeight) {
					$(this).parent().height(conHeight);
					$(this).parent().css("overflow-y","auto");
				} else if(thisHeight && thisHeight > 0) {
					$(this).parent().height(thisHeight);
				}
			}
			if(datagrids && datagrids.length > 0) {
				if(datagrids[index].length > 0) {
					datatableHeight = datatableHeight - 15;
					var perHeight = datatableHeight/datagrids[index].length;
					for(var dg=0;dg<datagrids[index].length;dg++) {
						
						var dgwidget = eval(datagrids[index][dg]+'Widget');
						
						if(dgwidget) {
							
							dgwidget.setHeight(perHeight - 68);
							
						} else {
							if(RM.formula.formula.addNewVersion.initCount <= 2) {
								setTimeout(function(){RM.formula.formula.addNewVersion.initSize();}, 200);
								RM.formula.formula.addNewVersion.initCount++;
							}/* else {
								RM.formula.formula.addNewVersion.initCount = 0;
							}*/
						}
					}
				}
			} else {
				//$(this).parent().height(conHeight-30);
				$(this).parent().height(conHeight-7); //为什么减去7呢，因为要跟底部框保持一定的距离 by xudihui
				$(this).parent().css("overflow-y","auto");
			}
		});
	}

	$(function(){
		RM.formula.formula.addNewVersion.initSize();
		$(window).bind("dialog.resize",function(){RM.formula.formula.addNewVersion.initSize();});
	});
</script>
<script type="text/javascript">
	
function changeVersion(){
	var version=$("#formula_edition").val();//版本号
    var name=$("#formula_name").val();//标识
    var newCode=name+"-"+version;//新编码：标识+版本号
    $("#formula_code").val(newCode);
}


	/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_addNewVersion,js,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>