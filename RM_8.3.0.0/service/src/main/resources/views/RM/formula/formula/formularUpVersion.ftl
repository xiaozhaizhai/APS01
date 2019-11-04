<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.propertydisplayName.randon1487140953580')}</title>
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
	CUI.ns('RM.processType.processType.processTypeEdit');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "RM_processType_processType">
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
<#assign callbackName ="RM.processType.processType.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="RM_processType_processType_processTypeEdit_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="RM_processType_processType_processTypeEdit_form" cssStyle="height:100%;" hiddenField="" onsubmitMethod="RM.processType.processType.processTypeEdit.beforeSubmitMethod()" ecAction="/RM/processType/processType/processTypeEdit/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="processTypeEdit">
	<input type="hidden" name="viewCode" value="RM_7.5.0.0_processType_processTypeEdit">
	<input type="hidden" name="datagridKey" value="RM_processType_processType_processTypeEdit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="processType.version" value="${(processType.version)!0}" />
	<input type="hidden" name="processType.extraCol" value='' />
	<div id="RM_processTypeEdit_edit_div" style="height:100%">
		<div id="RM_processType_processType_processTypeEdit_main_div" class="edit-content-dialog">
<script type="text/javascript">
var attcountid = "RM_processType_processType_processTypeEdit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=RM_7.5.0.0_processType', null, function(){
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
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:30%'></td><td style='height:0px;border:none;width:37%'></td><td style='height:0px;border:none;width:30%'></td></tr>
		<tr class="dialog_tr">
				
							 					<#if !RM_7_5_0_0_processType_ProcessType_code_permit??>
					<#assign RM_7_5_0_0_processType_ProcessType_code_permit = checkFieldPermission('processType.code','RM_7.5.0.0_processType_ProcessType','RM_7.5.0.0_processType_ProcessType_code')>
					</#if>
					<td <#if RM_7_5_0_0_processType_ProcessType_code_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_processType_ProcessType_code_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487074372323')}" >${getText('RM.propertydisplayName.randon1487074372323')}</label>
				</td>
				
						<#assign processType_code_defaultValue  = ''>
							 							<#assign processType_code_defaultValue  = ''>
					<#if !RM_7_5_0_0_processType_ProcessType_code_permit??>
					<#assign RM_7_5_0_0_processType_ProcessType_code_permit = checkFieldPermission('processType.code','RM_7.5.0.0_processType_ProcessType','RM_7.5.0.0_processType_ProcessType_code')>
					</#if>
					<td <#if RM_7_5_0_0_processType_ProcessType_code_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_processType_ProcessType_code_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if RM_7_5_0_0_processType_ProcessType_code_permit == 1>-readonly</#if>">
								<input property_type="TEXT" name="processType.code" id="processType_code"  style=";" originalvalue="<#if !newObj || (processType.code)?has_content>${(processType.code?html)!}<#else>${processType_code_defaultValue!}</#if>" value="<#if !newObj || (processType.code)?has_content>${(processType.code?html)!}<#else>${processType_code_defaultValue!}</#if>" type="text" class="cui-noborder-input "<#if RM_7_5_0_0_processType_ProcessType_code_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
							 					<#if !RM_7_5_0_0_processType_ProcessType_name_permit??>
					<#assign RM_7_5_0_0_processType_ProcessType_name_permit = checkFieldPermission('processType.name','RM_7.5.0.0_processType_ProcessType','RM_7.5.0.0_processType_ProcessType_name')>
					</#if>
					<td <#if RM_7_5_0_0_processType_ProcessType_name_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_processType_ProcessType_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487075823790')}" >${getText('RM.propertydisplayName.randon1487075823790')}</label>
				</td>
				
						<#assign processType_name_defaultValue  = ''>
							 							<#assign processType_name_defaultValue  = ''>
					<#if !RM_7_5_0_0_processType_ProcessType_name_permit??>
					<#assign RM_7_5_0_0_processType_ProcessType_name_permit = checkFieldPermission('processType.name','RM_7.5.0.0_processType_ProcessType','RM_7.5.0.0_processType_ProcessType_name')>
					</#if>
					<td <#if RM_7_5_0_0_processType_ProcessType_name_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_processType_ProcessType_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if RM_7_5_0_0_processType_ProcessType_name_permit == 1>-readonly</#if>">
								<input property_type="TEXT" name="processType.name" id="processType_name"  style=";" originalvalue="<#if !newObj || (processType.name)?has_content>${(processType.name?html)!}<#else>${processType_name_defaultValue!}</#if>" value="<#if !newObj || (processType.name)?has_content>${(processType.name?html)!}<#else>${processType_name_defaultValue!}</#if>" type="text" class="cui-noborder-input "<#if RM_7_5_0_0_processType_ProcessType_name_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
							 					<#if !RM_7_5_0_0_processType_ProcessType_meno_permit??>
					<#assign RM_7_5_0_0_processType_ProcessType_meno_permit = checkFieldPermission('processType.meno','RM_7.5.0.0_processType_ProcessType','RM_7.5.0.0_processType_ProcessType_meno')>
					</#if>
					<td <#if RM_7_5_0_0_processType_ProcessType_meno_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_processType_ProcessType_meno_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('ec.common.version')}" >${getText('ec.common.version')}</label>
				</td>
				
						<#assign processType_meno_defaultValue  = ''>
							 							<#assign processType_meno_defaultValue  = ''>
					<#if !RM_7_5_0_0_processType_ProcessType_meno_permit??>
					<#assign RM_7_5_0_0_processType_ProcessType_meno_permit = checkFieldPermission('processType.meno','RM_7.5.0.0_processType_ProcessType','RM_7.5.0.0_processType_ProcessType_meno')>
					</#if>
					<td <#if RM_7_5_0_0_processType_ProcessType_meno_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_processType_ProcessType_meno_permit == 0>
							<div class="fix-input-readonly fix-ie7-textarea"><textarea property_type="TEXT" id="processType_meno" class="cui-noborder-textarea nopermit cui-textarea-auto" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"></textarea></div>
							<#else>
							<div class="fix-input<#if RM_7_5_0_0_processType_ProcessType_meno_permit == 1>-readonly</#if> fix-ie7-textarea"><textarea property_type="TEXT" id="processType_meno" originalvalue="<#if !newObj || (processType.meno)?has_content>${(processType.meno?html)!}<#else>${processType_meno_defaultValue?html}</#if>"  name="processType.meno" class="cui-noborder-textarea cui-textarea-auto"<#if RM_7_5_0_0_processType_ProcessType_meno_permit == 1> readonly=readonly</#if> style=";" ><#if !newObj || (processType.meno)?has_content>${(processType.meno)!}<#else>${processType_meno_defaultValue}</#if></textarea></div>
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
<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_processType_processTypeEdit,html,RM_7.5.0.0_processType_ProcessType,RM_7.5.0.0) -->
<!-- 自定义代码 -->
<!-- CUSTOM CODE END -->
<script type="text/javascript">
	RM.processType.processType.processTypeEdit.beforeSaveProcess = function(){}
	RM.processType.processType.processTypeEdit.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(RM.processType.processType.processTypeEdit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#RM_processType_processType_processTypeEdit_form').trigger('beforeSubmit');
		//processType.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="processType.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#RM_processType_processType_processTypeEdit_form ul.edit-tabs").tabs("div.edit-panes > div");
		});
	})(jQuery);
	RM.processType.processType.processTypeEdit.validate = function(){
		return true;
	}
	
	
	//打印
	RM.processType.processType.processTypeEdit.print = function(url){
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
		
		RM.processType.processType.processTypeEdit.saveSetting = function(){
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
		RM.processType.processType.processTypeEdit.printSetting = function(){
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
			RM.processType.processType.processTypeEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(RM.processType.processType.processTypeEdit.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				RM.processType.processType.processTypeEdit.settingDialog.show();
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
			RM.processType.processType.processTypeEdit._customCallBack = customCallBack;
		}
		RM.processType.processType.processTypeEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#RM_processType_processType_processTypeEdit_fileupload').length == 0) {
				$('body').append('<div id="RM_processType_processType_processTypeEdit_fileupload"></div>');
			}
			RM.processType.processType.processTypeEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "RM_processType_processType_processTypeEdit_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#RM_processType_processType_processTypeEdit_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			RM.processType.processType.processTypeEdit.infoDialog.show();
			if($('#RM_processType_processType_processTypeEdit_fileupload').html() == '') {
				$('#RM_processType_processType_processTypeEdit_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=RM_processType_processType&entityCode=RM_7.5.0.0_processType&dialogId="+dialogId);
			}
		}
	//参照复制函数
	RM.processType.processType.processTypeEdit.referenceCopy = function(objName,url, dialog){
		var callbackName ="RM.processType.processType.processTypeEdit.referenceCopyBackInfo";
		RM.processType.processType.processTypeEdit.dialog = dialog;
		RM.processType.processType.processTypeEdit._dialog = foundation.common.select({
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
	
	RM.processType.processType.processTypeEdit.referenceCopyBackInfo = function(obj){
		if(RM.processType.processType.processTypeEdit._dialog){
			RM.processType.processType.processTypeEdit._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,RM.processType.processType.processTypeEdit.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('RM_processType_processType_processTypeEdit_form','RM_processType_processType_processTypeEdit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(RM.processType.processType.processTypeEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(RM.processType.processType.processTypeEdit.dialog._el).load('/RM/processType/processType/processTypeEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( RM.processType.processType.processTypeEdit.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + RM.processType.processType.processTypeEdit.dialog._config.iframe, RM.processType.processType.processTypeEdit.dialog._dialog ).prop( 'src', '/RM/processType/processType/processTypeEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(RM.processType.processType.processTypeEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(RM.processType.processType.processTypeEdit.dialog._el).load('/RM/processType/processType/processTypeEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	RM.processType.processType.processTypeEdit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		RM.processType.processType.processTypeEdit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		RM.processType.processType.processTypeEdit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			RM.processType.processType.processTypeEdit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	RM.processType.processType.processTypeEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var frameName = 'RM_processType_processType_processTypeEdit';
		var callbackName="";
		RM.processType.processType.processTypeEdit._prefix = '';
		RM.processType.processType.processTypeEdit._oGrid = oGrid;
		RM.processType.processType.processTypeEdit._sUrl = url;
		if(customCallBack){
			RM.processType.processType.processTypeEdit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			RM.processType.processType.processTypeEdit.gridEventObj = gridEventObj;
			callbackName = "RM.processType.processType.processTypeEdit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				RM.processType.processType.processTypeEdit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "RM.processType.processType.processTypeEdit.getMultiselectCallBackInfo_DG" : "RM.processType.processType.processTypeEdit.getcallBackInfo_DG";
			RM.processType.processType.processTypeEdit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				RM.processType.processType.processTypeEdit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="RM.processType.processType.processTypeEdit.getcallBackInfo";
		}
		if(RM.processType.processType.processTypeEdit._prefix!=''){
			RM.processType.processType.processTypeEdit._prefix = RM.processType.processType.processTypeEdit._prefix.substring(1);
		}
		if(RM.processType.processType.processTypeEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.processType.processType.processTypeEdit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof RM.processType.processType.processTypeEdit._querycustomFuncN == "function") {
				refparam += RM.processType.processType.processTypeEdit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		RM.processType.processType.processTypeEdit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.processType.processType.processTypeEdit._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.processType.processType.processTypeEdit.query_"+obj+")!='undefined'") ? eval('RM.processType.processType.processTypeEdit.query_'+obj+'()') : null;
		return str;
	
	};
	
	RM.processType.processType.processTypeEdit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('RM_processType_processType_processTypeEdit_form',obj[0], RM.processType.processType.processTypeEdit._prefix, RM.processType.processType.processTypeEdit._sUrl);
		CUI.commonFills('RM_processType_processType_processTypeEdit_form',RM.processType.processType.processTypeEdit._prefix,obj[0]);

		try{
			if(RM.processType.processType.processTypeEdit._customCallBack) {
				eval(RM.processType.processType.processTypeEdit._customCallBack);
				RM.processType.processType.processTypeEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.processType.processType.processTypeEdit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	RM.processType.processType.processTypeEdit.getcallBackInfo_DG_IE = function(obj){
		if(RM.processType.processType.processTypeEdit._customBeforeCallBack) {
			var flag = eval(RM.processType.processType.processTypeEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = RM.processType.processType.processTypeEdit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,RM.processType.processType.processTypeEdit._sUrl);
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
			if(RM.processType.processType.processTypeEdit._customCallBack) {
				eval(RM.processType.processType.processTypeEdit._customCallBack);
				RM.processType.processType.processTypeEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.processType.processType.processTypeEdit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	RM.processType.processType.processTypeEdit.getcallBackInfo_DG = function(obj){
		if(RM.processType.processType.processTypeEdit._customBeforeCallBack) {
			var flag = eval(RM.processType.processType.processTypeEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(RM.processType.processType.processTypeEdit._currRow).next().length==0){
					RM.processType.processType.processTypeEdit._oGrid.addNewRow();
				}	
				RM.processType.processType.processTypeEdit._currRow = $(RM.processType.processType.processTypeEdit._currRow).next();
				$(RM.processType.processType.processTypeEdit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(RM.processType.processType.processTypeEdit._currRow,obj[i],RM.processType.processType.processTypeEdit._prefix,RM.processType.processType.processTypeEdit._sUrl);
			eval("CUI.commonFills_DG(RM.processType.processType.processTypeEdit._currRow,RM.processType.processType.processTypeEdit._prefix,obj[i],RM.processType.processType.processTypeEdit._oGrid)");
		}
		try{
			if(RM.processType.processType.processTypeEdit._customCallBack) {
				eval(RM.processType.processType.processTypeEdit._customCallBack);
				RM.processType.processType.processTypeEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.processType.processType.processTypeEdit._dialog.close();
		} catch(e){}
	};
	
	RM.processType.processType.processTypeEdit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(RM.processType.processType.processTypeEdit._oGrid, RM.processType.processType.processTypeEdit._currRow, RM.processType.processType.processTypeEdit._key, RM.processType.processType.processTypeEdit._displayFieldName, obj[i])
		}
		try{
			if(RM.processType.processType.processTypeEdit._customCallBack) {
				eval(RM.processType.processType.processTypeEdit._customCallBack);
				RM.processType.processType.processTypeEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.processType.processType.processTypeEdit._dialog.close();
		} catch(e){}
	};
	
	RM.processType.processType.processTypeEdit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			RM.processType.processType.processTypeEdit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#RM_processType_processType_processTypeEdit_form'));
        			}
        	   	}
        	}
      	});
	};
	RM.processType.processType.processTypeEdit.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	RM.processType.processType.processTypeEdit.initCount = 0;
	RM.processType.processType.processTypeEdit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#RM_processTypeEdit_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('RM_processType_processType_processTypeEdit_datagrids');	
		var	conHeight = h-$("#RM_processType_processType_processTypeEdit_main_div .edit-tabs").height() - 6;
		panesHeight = conHeight*0.4;
		$("#RM_processType_processType_processTypeEdit_main_div .edit-panes-s").each(function(index){
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
							if(RM.processType.processType.processTypeEdit.initCount <= 2) {
								setTimeout(function(){RM.processType.processType.processTypeEdit.initSize();}, 200);
								RM.processType.processType.processTypeEdit.initCount++;
							}/* else {
								RM.processType.processType.processTypeEdit.initCount = 0;
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
		RM.processType.processType.processTypeEdit.initSize();
		$(window).bind("dialog.resize",function(){RM.processType.processType.processTypeEdit.initSize();});
	});
</script>
<script type="text/javascript">
	


	/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_processType_processTypeEdit,js,RM_7.5.0.0_processType_ProcessType,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>