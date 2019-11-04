<!-- MESBasic_1/tankModel/modelView -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.radion1415151251351')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-VIEW-MESBasic_1_tankModel_modelView,head,MESBasic_1_tankModel_TankModel,MESBasic_1) -->
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
	CUI.ns('MESBasic.tankModel.tankModel.modelView');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "MESBasic_tankModel_tankModel">
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
<#assign viewType = "readonly">
<#assign callbackName ="MESBasic.tankModel.tankModel.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="MESBasic_tankModel_tankModel_modelView_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="MESBasic_tankModel_tankModel_modelView_form" cssStyle="height:100%;" hiddenField="" onsubmitMethod="MESBasic.tankModel.tankModel.modelView.beforeSubmitMethod()" ecAction="/MESBasic/tankModel/tankModel/modelView/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="modelView">
	<input type="hidden" name="viewCode" value="MESBasic_1_tankModel_modelView">
	<input type="hidden" name="datagridKey" value="MESBasic_tankModel_tankModel_modelView_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="tankModel.version" value="${(tankModel.version)!0}" />
	<input type="hidden" name="tankModel.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
	<div id="MESBasic_modelView_edit_div" style="height:100%">
		<div id="MESBasic_tankModel_tankModel_modelView_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "MESBasic_tankModel_tankModel_modelView_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=MESBasic_1_tankModel', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>			<div class="edit-panes" style="margin-top:0px;padding:0px;">
				<div>
				<div class="edit-panes-w">

<input type="hidden" name="tankModel.parentId" value='${(tankModel.parentId)!-1}' />
<div class="edit-panes-s" style="width:98%;margin-left:10px;">
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:30%'></td><td style='height:0px;border:none;width:37%'></td><td style='height:0px;border:none;width:30%'></td></tr>
		<tr class="dialog_tr">
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415150470967')}" >${getText('MESBasic.propertydisplayName.radion1415150470967')}</label>
				</td>
				
						<#assign tankModel_code_defaultValue  = ''>
							 							<#assign tankModel_code_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   colspan="2" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="tankModel.code" id="tankModel_code"  style=";" originalvalue="<#if !newObj || (tankModel.code)?has_content>${(tankModel.code?html)!}<#else>${tankModel_code_defaultValue!}</#if>" value="<#if !newObj || (tankModel.code)?has_content>${(tankModel.code?html)!}<#else>${tankModel_code_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415150519135')}" >${getText('MESBasic.propertydisplayName.radion1415150519135')}</label>
				</td>
				
						<#assign tankModel_name_defaultValue  = ''>
							 							<#assign tankModel_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   colspan="2" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="tankModel.name" id="tankModel_name"  style=";" originalvalue="<#if !newObj || (tankModel.name)?has_content>${(tankModel.name?html)!}<#else>${tankModel_name_defaultValue!}</#if>" value="<#if !newObj || (tankModel.name)?has_content>${(tankModel.name?html)!}<#else>${tankModel_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415150919382')}" >${getText('MESBasic.propertydisplayName.radion1415150919382')}</label>
				</td>
				
						<#assign tankModel_shape_defaultValue  = 'TANK_SHAPE/0'>
							 							<#assign tankModel_shape_defaultValue  = 'TANK_SHAPE/0'>
					<td  nullable=true class="edit-table-content"   colspan="2" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${tankModel_shape_defaultValue!}" formId="MESBasic_tankModel_tankModel_modelView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="tankModel.shape.id" code="TANK_SHAPE" value="${(tankModel.shape.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_tankModel_tankModel_modelView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="tankModel.shape.id" code="TANK_SHAPE" value="${(tankModel.shape.id)!}"  />
									
								</#if>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415150645388')}" >${getText('MESBasic.propertydisplayName.radion1415150645388')}</label>
				</td>
				
						<#assign tankModel_volume_defaultValue  = ''>
							 							<#assign tankModel_volume_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly fix-ie7-textarea"><textarea property_type="TEXT" id="tankModel_volume" originalvalue="<#if !newObj || (tankModel.volume)?has_content>${(tankModel.volume?html)!}<#else>${tankModel_volume_defaultValue?html}</#if>"  name="tankModel.volume" class="cui-noborder-textarea cui-textarea-auto" readonly="readonly" style=";" ><#if !newObj || (tankModel.volume)?has_content>${(tankModel.volume)!}<#else>${tankModel_volume_defaultValue}</#if></textarea></div>
							
				</td>
				</tr><tr class="dialog_tr">
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td nullable=true class="edit-table-symbol"  colspan="2" align="right" style="text-align: right;;" >
							<label style="width:100%;text-align:left;;" value="${getText('MESBasic.propertydisplayName.radion1415602107351')}" >${getText('MESBasic.propertydisplayName.radion1415602107351')}</label>
				</td>
		</tr>
	</table>
</div>				</div>	
				<div class="edit-datatable">	

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-VIEW-MESBasic_1_tankModel_modelView,html,MESBasic_1_tankModel_TankModel,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	MESBasic.tankModel.tankModel.modelView.beforeSaveProcess = function(){}
	MESBasic.tankModel.tankModel.modelView.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(MESBasic.tankModel.tankModel.modelView.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#MESBasic_tankModel_tankModel_modelView_form').trigger('beforeSubmit');
		//tankModel.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="tankModel.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#MESBasic_tankModel_tankModel_modelView_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#MESBasic_tankModel_tankModel_modelView_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	MESBasic.tankModel.tankModel.modelView.validate = function(){
		return true;
	}
	
	
	//打印
	MESBasic.tankModel.tankModel.modelView.print = function(url){
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
		
		MESBasic.tankModel.tankModel.modelView.saveSetting = function(){
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
		MESBasic.tankModel.tankModel.modelView.printSetting = function(){
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
			MESBasic.tankModel.tankModel.modelView.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(MESBasic.tankModel.tankModel.modelView.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				MESBasic.tankModel.tankModel.modelView.settingDialog.show();
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
			MESBasic.tankModel.tankModel.modelView._customCallBack = customCallBack;
		}
		MESBasic.tankModel.tankModel.modelView._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#MESBasic_tankModel_tankModel_modelView_fileupload').length == 0) {
				$('body').append('<div id="MESBasic_tankModel_tankModel_modelView_fileupload"></div>');
			}
			MESBasic.tankModel.tankModel.modelView.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "MESBasic_tankModel_tankModel_modelView_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#MESBasic_tankModel_tankModel_modelView_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			MESBasic.tankModel.tankModel.modelView.infoDialog.show();
			if($('#MESBasic_tankModel_tankModel_modelView_fileupload').html() == '') {
				$('#MESBasic_tankModel_tankModel_modelView_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=MESBasic_tankModel_tankModel&entityCode=MESBasic_1_tankModel&dialogId="+dialogId);
			}
		}
	//参照复制函数
	MESBasic.tankModel.tankModel.modelView.referenceCopy = function(objName,url, dialog){
		var callbackName ="MESBasic.tankModel.tankModel.modelView.referenceCopyBackInfo";
		MESBasic.tankModel.tankModel.modelView.dialog = dialog;
		MESBasic.tankModel.tankModel.modelView._dialog = foundation.common.select({
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
	
	MESBasic.tankModel.tankModel.modelView.referenceCopyBackInfo = function(obj){
		if(MESBasic.tankModel.tankModel.modelView._dialog){
			MESBasic.tankModel.tankModel.modelView._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,MESBasic.tankModel.tankModel.modelView.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('MESBasic_tankModel_tankModel_modelView_form','MESBasic_tankModel_tankModel_modelView_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(MESBasic.tankModel.tankModel.modelView.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(MESBasic.tankModel.tankModel.modelView.dialog._el).load('/MESBasic/tankModel/tankModel/modelView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( MESBasic.tankModel.tankModel.modelView.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + MESBasic.tankModel.tankModel.modelView.dialog._config.iframe, MESBasic.tankModel.tankModel.modelView.dialog._dialog ).prop( 'src', '/MESBasic/tankModel/tankModel/modelView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(MESBasic.tankModel.tankModel.modelView.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(MESBasic.tankModel.tankModel.modelView.dialog._el).load('/MESBasic/tankModel/tankModel/modelView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	MESBasic.tankModel.tankModel.modelView.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		MESBasic.tankModel.tankModel.modelView.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		MESBasic.tankModel.tankModel.modelView._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			MESBasic.tankModel.tankModel.modelView._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	MESBasic.tankModel.tankModel.modelView._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'MESBasic_tankModel_tankModel_modelView' + '_' + extraFrameParam;
		var callbackName="";
		MESBasic.tankModel.tankModel.modelView._prefix = '';
		MESBasic.tankModel.tankModel.modelView._oGrid = oGrid;
		MESBasic.tankModel.tankModel.modelView._sUrl = url;
		if(customCallBack){
			MESBasic.tankModel.tankModel.modelView._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			MESBasic.tankModel.tankModel.modelView.gridEventObj = gridEventObj;
			callbackName = "MESBasic.tankModel.tankModel.modelView.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				MESBasic.tankModel.tankModel.modelView._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "MESBasic.tankModel.tankModel.modelView.getMultiselectCallBackInfo_DG" : "MESBasic.tankModel.tankModel.modelView.getcallBackInfo_DG";
			MESBasic.tankModel.tankModel.modelView._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				MESBasic.tankModel.tankModel.modelView._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="MESBasic.tankModel.tankModel.modelView.getcallBackInfo";
		}
		if(MESBasic.tankModel.tankModel.modelView._prefix!=''){
			MESBasic.tankModel.tankModel.modelView._prefix = MESBasic.tankModel.tankModel.modelView._prefix.substring(1);
		}
		if(MESBasic.tankModel.tankModel.modelView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.tankModel.tankModel.modelView._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof MESBasic.tankModel.tankModel.modelView._querycustomFuncN == "function") {
				refparam += MESBasic.tankModel.tankModel.modelView._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		MESBasic.tankModel.tankModel.modelView._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.tankModel.tankModel.modelView._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.tankModel.tankModel.modelView.query_"+obj+")!='undefined'") ? eval('MESBasic.tankModel.tankModel.modelView.query_'+obj+'()') : null;
		return str;
	
	};
	
	MESBasic.tankModel.tankModel.modelView.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('MESBasic_tankModel_tankModel_modelView_form',obj[0], MESBasic.tankModel.tankModel.modelView._prefix, MESBasic.tankModel.tankModel.modelView._sUrl);
		CUI.commonFills('MESBasic_tankModel_tankModel_modelView_form',MESBasic.tankModel.tankModel.modelView._prefix,obj[0]);

		try{
			if(MESBasic.tankModel.tankModel.modelView._customCallBack) {
				eval(MESBasic.tankModel.tankModel.modelView._customCallBack);
				MESBasic.tankModel.tankModel.modelView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.tankModel.tankModel.modelView._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	MESBasic.tankModel.tankModel.modelView.getcallBackInfo_DG_IE = function(obj){
		if(MESBasic.tankModel.tankModel.modelView._customBeforeCallBack) {
			var flag = eval(MESBasic.tankModel.tankModel.modelView._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = MESBasic.tankModel.tankModel.modelView.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,MESBasic.tankModel.tankModel.modelView._sUrl);
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
			if(MESBasic.tankModel.tankModel.modelView._customCallBack) {
				eval(MESBasic.tankModel.tankModel.modelView._customCallBack);
				MESBasic.tankModel.tankModel.modelView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.tankModel.tankModel.modelView._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	MESBasic.tankModel.tankModel.modelView.getcallBackInfo_DG = function(obj){
		if(MESBasic.tankModel.tankModel.modelView._customBeforeCallBack) {
			var flag = eval(MESBasic.tankModel.tankModel.modelView._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(MESBasic.tankModel.tankModel.modelView._currRow).next().length==0){
					MESBasic.tankModel.tankModel.modelView._oGrid.addNewRow();
				}	
				MESBasic.tankModel.tankModel.modelView._currRow = $(MESBasic.tankModel.tankModel.modelView._currRow).next();
				$(MESBasic.tankModel.tankModel.modelView._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(MESBasic.tankModel.tankModel.modelView._currRow,obj[i],MESBasic.tankModel.tankModel.modelView._prefix,MESBasic.tankModel.tankModel.modelView._sUrl);
			eval("CUI.commonFills_DG(MESBasic.tankModel.tankModel.modelView._currRow,MESBasic.tankModel.tankModel.modelView._prefix,obj[i],MESBasic.tankModel.tankModel.modelView._oGrid)");
		}
		try{
			if(MESBasic.tankModel.tankModel.modelView._customCallBack) {
				eval(MESBasic.tankModel.tankModel.modelView._customCallBack);
				MESBasic.tankModel.tankModel.modelView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.tankModel.tankModel.modelView._dialog.close();
		} catch(e){}
	};
	
	MESBasic.tankModel.tankModel.modelView.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(MESBasic.tankModel.tankModel.modelView._oGrid, MESBasic.tankModel.tankModel.modelView._currRow, MESBasic.tankModel.tankModel.modelView._key, MESBasic.tankModel.tankModel.modelView._displayFieldName, obj[i])
		}
		try{
			if(MESBasic.tankModel.tankModel.modelView._customCallBack) {
				eval(MESBasic.tankModel.tankModel.modelView._customCallBack);
				MESBasic.tankModel.tankModel.modelView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.tankModel.tankModel.modelView._dialog.close();
		} catch(e){}
	};
	
	MESBasic.tankModel.tankModel.modelView.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			MESBasic.tankModel.tankModel.modelView.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#MESBasic_tankModel_tankModel_modelView_form'));
        			}
        	   	}
        	}
      	});
	};
	MESBasic.tankModel.tankModel.modelView.beforeSubmitMethodSettingInPage = function(){
		var  factor = $('#tankModel_volume').val();
var flag = true;
if(null == factor || factor.length==0){
	// do nothing
}else{
    function fn(string, obj){
		// 剔除空白符
		string = string.replace(/\s/g, '');
		// 错误情况，空字符串
		if("" === string){
			return false;
		}
		// 错误情况，运算符连续
		if( /[\+\-\*\/]{2,}/.test(string) ){
			return false;
		}
		// 空括号
		if(/\(\)/.test(string)){
			return false;
		}
		// 错误情况，括号不配对
		var stack = [];
		for(var i = 0, item; i < string.length; i++){
			item = string.charAt(i);
			if('(' === item){
				stack.push('(');
			}else if(')' === item){
				if(stack.length > 0){
					stack.pop();
				}else{
					return false;
				}
			}
		}
		if(0 !== stack.length){
			return false;
		}
		// 错误情况，(后面是运算符 
		if(/\([\+\-\*\/]/.test(string)){
			return false;
		}
		// 错误情况，)前面是运算符
		if(/[\+\-\*\/]\)/.test(string)){
			return false;
		}
		// 错误情况，(前面不是运算符
		if(/[^\+\-\*\/]\(/.test(string)){
			return false;
		}
		// 错误情况，)后面不是运算符
		if(/\)[^\+\-\*\/]/.test(string)){
			return false;
		}
		
		//是否包含除0错误
		if(/\/0/.test(string)){
			return false;
		}
		
		//是否包含[、]、{、}错误
		if(/\[|\]|{|}/.test(string)){
			return false;
		}
		// 错误情况，变量没有来自“待选公式变量”
		var tmpStr = string.replace(/[\(\)\+\-\*\/]{1,}/g, '`');
		var array = tmpStr.split('`');
		for(var i = 0, item; i < array.length; i++){
			item = array[i];
			if( /[A-Z]/i.test(item) && 'undefined' === typeof(obj[item]) ){
				return false;
			}
		}

		return true;
	}
	// 测试
	 var fields = {
		'n': 1,
	 };
    // 提交到服务器端的字符串不应该包含空白符，或者应该禁止用户输入空白符
	flag = fn(factor, fields);
		if(!flag){
		workbenchErrorBarWidget.showMessage("体积计算公式错误！");
	}
	
	
}
return flag;
return beforSubmit_Fun();
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	MESBasic.tankModel.tankModel.modelView.initCount = 0;
	MESBasic.tankModel.tankModel.modelView.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#MESBasic_modelView_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('MESBasic_tankModel_tankModel_modelView_datagrids');	
		var	conHeight = h-$("#MESBasic_tankModel_tankModel_modelView_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#MESBasic_tankModel_tankModel_modelView_main_div .edit-panes-s").each(function(index){
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
							
							dgwidget.setHeight(perHeight - 68 + 20);
							
						} else {
							if(MESBasic.tankModel.tankModel.modelView.initCount <= 2) {
								setTimeout(function(){MESBasic.tankModel.tankModel.modelView.initSize();}, 200);
								MESBasic.tankModel.tankModel.modelView.initCount++;
							}/* else {
								MESBasic.tankModel.tankModel.modelView.initCount = 0;
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
		MESBasic.tankModel.tankModel.modelView.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    MESBasic.tankModel.tankModel.modelView.initSize(index);
		});
		$(window).bind("dialog.resize",function(){MESBasic.tankModel.tankModel.modelView.initSize();});
	});
</script>
<script type="text/javascript">
	

	/* CUSTOM CODE START(view-VIEW-MESBasic_1_tankModel_modelView,js,MESBasic_1_tankModel_TankModel,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>