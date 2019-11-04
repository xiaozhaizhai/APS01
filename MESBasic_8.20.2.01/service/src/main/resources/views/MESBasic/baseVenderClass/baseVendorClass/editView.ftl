<!-- MESBasic_1/baseVenderClass/editView -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1449473651219')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-EDIT-MESBasic_1_baseVenderClass_editView,head,MESBasic_1_baseVenderClass_BaseVendorClass,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->

</head>

<body id="dialog_page">
<@loadpanel></@loadpanel>
<@errorbar id="workbenchErrorBar" offsetY=0></@errorbar>
</#if>


<style type="text/css">
.ewc-dialog-el{height:100%;} 
.ewc-dialog-el .edit-table{width:98%;margin:0 auto;}
.edit-content-dialog-fullwidth .edit-tabs {width: 100%;margin-left: 0;}
</style>
<script type="text/javascript">
	CUI.ns('MESBasic.baseVenderClass.baseVendorClass.editView');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "MESBasic_baseVenderClass_baseVendorClass">
	<#assign fileuploadLinkId = id!>
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
<#assign callbackName ="MESBasic.baseVenderClass.baseVendorClass.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="MESBasic_baseVenderClass_baseVendorClass_editView_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="MESBasic_baseVenderClass_baseVendorClass_editView_form" cssStyle="height:100%;" hiddenField="" onsubmitMethod="MESBasic.baseVenderClass.baseVendorClass.editView.beforeSubmitMethod()" ecAction="/MESBasic/baseVenderClass/baseVendorClass/editView/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="editView">
	<input type="hidden" name="viewCode" value="MESBasic_1_baseVenderClass_editView">
	<input type="hidden" name="datagridKey" value="MESBasic_baseVenderClass_baseVendorClass_editView_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="baseVendorClass.version" value="${(baseVendorClass.version)!0}" />
	<input type="hidden" name="baseVendorClass.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
	<div id="MESBasic_editView_edit_div" style="height:100%">
		<div id="MESBasic_baseVenderClass_baseVendorClass_editView_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "MESBasic_baseVenderClass_baseVendorClass_editView_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=MESBasic_1_baseVenderClass', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>			<div class="edit-panes" style="margin-top:0px;padding:0px;">
				<div>
				<div class="edit-panes-w">

<input type="hidden" name="baseVendorClass.parentId" value='${(baseVendorClass.parentId)!-1}' />
<div class="edit-panes-s" style="width:98%;margin-left:10px;">
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:30%'></td><td style='height:0px;border:none;width:37%'></td><td style='height:0px;border:none;width:30%'></td></tr>
		<tr class="dialog_tr">
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449472741485')}" >${getText('MESBasic.propertydisplayName.randon1449472741485')}</label>
				</td>
				
						<#assign baseVendorClass_code_defaultValue  = ''>
							 							<#assign baseVendorClass_code_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="baseVendorClass.code" id="baseVendorClass_code"  style=";" originalvalue="<#if !newObj || (baseVendorClass.code)?has_content>${(baseVendorClass.code?html)!}<#else>${baseVendorClass_code_defaultValue!}</#if>" value="<#if !newObj || (baseVendorClass.code)?has_content>${(baseVendorClass.code?html)!}<#else>${baseVendorClass_code_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449472903805')}" >${getText('MESBasic.propertydisplayName.randon1449472903805')}</label>
				</td>
				
						<#assign baseVendorClass_name_defaultValue  = ''>
							 							<#assign baseVendorClass_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="baseVendorClass.name" id="baseVendorClass_name"  style=";" originalvalue="<#if !newObj || (baseVendorClass.name)?has_content>${(baseVendorClass.name?html)!}<#else>${baseVendorClass_name_defaultValue!}</#if>" value="<#if !newObj || (baseVendorClass.name)?has_content>${(baseVendorClass.name?html)!}<#else>${baseVendorClass_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449472974516')}" >${getText('MESBasic.propertydisplayName.randon1449472974516')}</label>
				</td>
				
						<#assign baseVendorClass_vcMemo_defaultValue  = ''>
							 							<#assign baseVendorClass_vcMemo_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input fix-ie7-textarea"><textarea property_type="TEXT" id="baseVendorClass_vcMemo" originalvalue="<#if !newObj || (baseVendorClass.vcMemo)?has_content>${(baseVendorClass.vcMemo?html)!}<#else>${baseVendorClass_vcMemo_defaultValue?html}</#if>"  name="baseVendorClass.vcMemo" class="cui-noborder-textarea cui-textarea-auto" style=";" ><#if !newObj || (baseVendorClass.vcMemo)?has_content>${(baseVendorClass.vcMemo)!}<#else>${baseVendorClass_vcMemo_defaultValue}</#if></textarea></div>
							
				</td>
		</tr>
	</table>
</div>				</div>	
				<div class="edit-datatable">	

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-EDIT-MESBasic_1_baseVenderClass_editView,html,MESBasic_1_baseVenderClass_BaseVendorClass,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	MESBasic.baseVenderClass.baseVendorClass.editView.beforeSaveProcess = function(){}
	MESBasic.baseVenderClass.baseVendorClass.editView.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(MESBasic.baseVenderClass.baseVendorClass.editView.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#MESBasic_baseVenderClass_baseVendorClass_editView_form').trigger('beforeSubmit');
		//baseVendorClass.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="baseVendorClass.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#MESBasic_baseVenderClass_baseVendorClass_editView_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#MESBasic_baseVenderClass_baseVendorClass_editView_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	MESBasic.baseVenderClass.baseVendorClass.editView.validate = function(){
		return true;
	}
	
	
	//打印
	MESBasic.baseVenderClass.baseVendorClass.editView.print = function(url){
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
		
		MESBasic.baseVenderClass.baseVendorClass.editView.saveSetting = function(){
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
		MESBasic.baseVenderClass.baseVendorClass.editView.printSetting = function(){
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
			MESBasic.baseVenderClass.baseVendorClass.editView.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(MESBasic.baseVenderClass.baseVendorClass.editView.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				MESBasic.baseVenderClass.baseVendorClass.editView.settingDialog.show();
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
			MESBasic.baseVenderClass.baseVendorClass.editView._customCallBack = customCallBack;
		}
		MESBasic.baseVenderClass.baseVendorClass.editView._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#MESBasic_baseVenderClass_baseVendorClass_editView_fileupload').length == 0) {
				$('body').append('<div id="MESBasic_baseVenderClass_baseVendorClass_editView_fileupload"></div>');
			}
			MESBasic.baseVenderClass.baseVendorClass.editView.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "MESBasic_baseVenderClass_baseVendorClass_editView_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#MESBasic_baseVenderClass_baseVendorClass_editView_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			MESBasic.baseVenderClass.baseVendorClass.editView.infoDialog.show();
			if($('#MESBasic_baseVenderClass_baseVendorClass_editView_fileupload').html() == '') {
				$('#MESBasic_baseVenderClass_baseVendorClass_editView_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=MESBasic_baseVenderClass_baseVendorClass&entityCode=MESBasic_1_baseVenderClass&dialogId="+dialogId);
			}
		}
	//参照复制函数
	MESBasic.baseVenderClass.baseVendorClass.editView.referenceCopy = function(objName,url, dialog){
		var callbackName ="MESBasic.baseVenderClass.baseVendorClass.editView.referenceCopyBackInfo";
		MESBasic.baseVenderClass.baseVendorClass.editView.dialog = dialog;
		MESBasic.baseVenderClass.baseVendorClass.editView._dialog = foundation.common.select({
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
	
	MESBasic.baseVenderClass.baseVendorClass.editView.referenceCopyBackInfo = function(obj){
		if(MESBasic.baseVenderClass.baseVendorClass.editView._dialog){
			MESBasic.baseVenderClass.baseVendorClass.editView._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,MESBasic.baseVenderClass.baseVendorClass.editView.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('MESBasic_baseVenderClass_baseVendorClass_editView_form','MESBasic_baseVenderClass_baseVendorClass_editView_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(MESBasic.baseVenderClass.baseVendorClass.editView.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(MESBasic.baseVenderClass.baseVendorClass.editView.dialog._el).load('/MESBasic/baseVenderClass/baseVendorClass/editView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( MESBasic.baseVenderClass.baseVendorClass.editView.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + MESBasic.baseVenderClass.baseVendorClass.editView.dialog._config.iframe, MESBasic.baseVenderClass.baseVendorClass.editView.dialog._dialog ).prop( 'src', '/MESBasic/baseVenderClass/baseVendorClass/editView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(MESBasic.baseVenderClass.baseVendorClass.editView.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(MESBasic.baseVenderClass.baseVendorClass.editView.dialog._el).load('/MESBasic/baseVenderClass/baseVendorClass/editView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	MESBasic.baseVenderClass.baseVendorClass.editView.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		MESBasic.baseVenderClass.baseVendorClass.editView.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		MESBasic.baseVenderClass.baseVendorClass.editView._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			MESBasic.baseVenderClass.baseVendorClass.editView._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	MESBasic.baseVenderClass.baseVendorClass.editView._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'MESBasic_baseVenderClass_baseVendorClass_editView' + '_' + extraFrameParam;
		var callbackName="";
		MESBasic.baseVenderClass.baseVendorClass.editView._prefix = '';
		MESBasic.baseVenderClass.baseVendorClass.editView._oGrid = oGrid;
		MESBasic.baseVenderClass.baseVendorClass.editView._sUrl = url;
		if(customCallBack){
			MESBasic.baseVenderClass.baseVendorClass.editView._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			MESBasic.baseVenderClass.baseVendorClass.editView.gridEventObj = gridEventObj;
			callbackName = "MESBasic.baseVenderClass.baseVendorClass.editView.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				MESBasic.baseVenderClass.baseVendorClass.editView._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "MESBasic.baseVenderClass.baseVendorClass.editView.getMultiselectCallBackInfo_DG" : "MESBasic.baseVenderClass.baseVendorClass.editView.getcallBackInfo_DG";
			MESBasic.baseVenderClass.baseVendorClass.editView._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				MESBasic.baseVenderClass.baseVendorClass.editView._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="MESBasic.baseVenderClass.baseVendorClass.editView.getcallBackInfo";
		}
		if(MESBasic.baseVenderClass.baseVendorClass.editView._prefix!=''){
			MESBasic.baseVenderClass.baseVendorClass.editView._prefix = MESBasic.baseVenderClass.baseVendorClass.editView._prefix.substring(1);
		}
		if(MESBasic.baseVenderClass.baseVendorClass.editView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.baseVenderClass.baseVendorClass.editView._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof MESBasic.baseVenderClass.baseVendorClass.editView._querycustomFuncN == "function") {
				refparam += MESBasic.baseVenderClass.baseVendorClass.editView._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		MESBasic.baseVenderClass.baseVendorClass.editView._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.baseVenderClass.baseVendorClass.editView._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.baseVenderClass.baseVendorClass.editView.query_"+obj+")!='undefined'") ? eval('MESBasic.baseVenderClass.baseVendorClass.editView.query_'+obj+'()') : null;
		return str;
	
	};
	
	MESBasic.baseVenderClass.baseVendorClass.editView.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('MESBasic_baseVenderClass_baseVendorClass_editView_form',obj[0], MESBasic.baseVenderClass.baseVendorClass.editView._prefix, MESBasic.baseVenderClass.baseVendorClass.editView._sUrl);
		CUI.commonFills('MESBasic_baseVenderClass_baseVendorClass_editView_form',MESBasic.baseVenderClass.baseVendorClass.editView._prefix,obj[0]);

		try{
			if(MESBasic.baseVenderClass.baseVendorClass.editView._customCallBack) {
				eval(MESBasic.baseVenderClass.baseVendorClass.editView._customCallBack);
				MESBasic.baseVenderClass.baseVendorClass.editView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.baseVenderClass.baseVendorClass.editView._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	MESBasic.baseVenderClass.baseVendorClass.editView.getcallBackInfo_DG_IE = function(obj){
		if(MESBasic.baseVenderClass.baseVendorClass.editView._customBeforeCallBack) {
			var flag = eval(MESBasic.baseVenderClass.baseVendorClass.editView._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = MESBasic.baseVenderClass.baseVendorClass.editView.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,MESBasic.baseVenderClass.baseVendorClass.editView._sUrl);
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
			if(MESBasic.baseVenderClass.baseVendorClass.editView._customCallBack) {
				eval(MESBasic.baseVenderClass.baseVendorClass.editView._customCallBack);
				MESBasic.baseVenderClass.baseVendorClass.editView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.baseVenderClass.baseVendorClass.editView._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	MESBasic.baseVenderClass.baseVendorClass.editView.getcallBackInfo_DG = function(obj){
		if(MESBasic.baseVenderClass.baseVendorClass.editView._customBeforeCallBack) {
			var flag = eval(MESBasic.baseVenderClass.baseVendorClass.editView._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(MESBasic.baseVenderClass.baseVendorClass.editView._currRow).next().length==0){
					MESBasic.baseVenderClass.baseVendorClass.editView._oGrid.addNewRow();
				}	
				MESBasic.baseVenderClass.baseVendorClass.editView._currRow = $(MESBasic.baseVenderClass.baseVendorClass.editView._currRow).next();
				$(MESBasic.baseVenderClass.baseVendorClass.editView._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(MESBasic.baseVenderClass.baseVendorClass.editView._currRow,obj[i],MESBasic.baseVenderClass.baseVendorClass.editView._prefix,MESBasic.baseVenderClass.baseVendorClass.editView._sUrl);
			eval("CUI.commonFills_DG(MESBasic.baseVenderClass.baseVendorClass.editView._currRow,MESBasic.baseVenderClass.baseVendorClass.editView._prefix,obj[i],MESBasic.baseVenderClass.baseVendorClass.editView._oGrid)");
		}
		try{
			if(MESBasic.baseVenderClass.baseVendorClass.editView._customCallBack) {
				eval(MESBasic.baseVenderClass.baseVendorClass.editView._customCallBack);
				MESBasic.baseVenderClass.baseVendorClass.editView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.baseVenderClass.baseVendorClass.editView._dialog.close();
		} catch(e){}
	};
	
	MESBasic.baseVenderClass.baseVendorClass.editView.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(MESBasic.baseVenderClass.baseVendorClass.editView._oGrid, MESBasic.baseVenderClass.baseVendorClass.editView._currRow, MESBasic.baseVenderClass.baseVendorClass.editView._key, MESBasic.baseVenderClass.baseVendorClass.editView._displayFieldName, obj[i])
		}
		try{
			if(MESBasic.baseVenderClass.baseVendorClass.editView._customCallBack) {
				eval(MESBasic.baseVenderClass.baseVendorClass.editView._customCallBack);
				MESBasic.baseVenderClass.baseVendorClass.editView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.baseVenderClass.baseVendorClass.editView._dialog.close();
		} catch(e){}
	};
	
	MESBasic.baseVenderClass.baseVendorClass.editView.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			MESBasic.baseVenderClass.baseVendorClass.editView.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#MESBasic_baseVenderClass_baseVendorClass_editView_form'));
        			}
        	   	}
        	}
      	});
	};
	MESBasic.baseVenderClass.baseVendorClass.editView.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	MESBasic.baseVenderClass.baseVendorClass.editView.initCount = 0;
	MESBasic.baseVenderClass.baseVendorClass.editView.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#MESBasic_editView_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('MESBasic_baseVenderClass_baseVendorClass_editView_datagrids');	
		var	conHeight = h-$("#MESBasic_baseVenderClass_baseVendorClass_editView_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#MESBasic_baseVenderClass_baseVendorClass_editView_main_div .edit-panes-s").each(function(index){
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
							if(MESBasic.baseVenderClass.baseVendorClass.editView.initCount <= 2) {
								setTimeout(function(){MESBasic.baseVenderClass.baseVendorClass.editView.initSize();}, 200);
								MESBasic.baseVenderClass.baseVendorClass.editView.initCount++;
							}/* else {
								MESBasic.baseVenderClass.baseVendorClass.editView.initCount = 0;
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
		MESBasic.baseVenderClass.baseVendorClass.editView.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    MESBasic.baseVenderClass.baseVendorClass.editView.initSize(index);
		});
		$(window).bind("dialog.resize",function(){MESBasic.baseVenderClass.baseVendorClass.editView.initSize();});
	});
</script>
<script type="text/javascript">
	

	/* CUSTOM CODE START(view-EDIT-MESBasic_1_baseVenderClass_editView,js,MESBasic_1_baseVenderClass_BaseVendorClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>