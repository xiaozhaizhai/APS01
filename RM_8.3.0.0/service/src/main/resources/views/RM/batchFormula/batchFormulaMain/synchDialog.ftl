<!-- RM_7.5.0.0/batchFormula/synchDialog -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1546051870912')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_batchFormula_synchDialog,head,RM_7.5.0.0_batchFormula_BatchFormulaMain,RM_7.5.0.0) -->
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
	CUI.ns('RM.batchFormula.batchFormulaMain.synchDialog');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "RM_batchFormula_batchFormulaMain">
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
<#assign callbackName ="RM.batchFormula.batchFormulaMain.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="RM_batchFormula_batchFormulaMain_synchDialog_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="RM_batchFormula_batchFormulaMain_synchDialog_form" cssStyle="height:100%;" hiddenField="" onsubmitMethod="RM.batchFormula.batchFormulaMain.synchDialog.beforeSubmitMethod()" ecAction="/RM/batchFormula/batchFormulaMain/synchDialog/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="synchDialog">
	<input type="hidden" name="viewCode" value="RM_7.5.0.0_batchFormula_synchDialog">
	<input type="hidden" name="datagridKey" value="RM_batchFormula_batchFormulaMain_synchDialog_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="batchFormulaMain.version" value="${(batchFormulaMain.version)!0}" />
	<input type="hidden" name="batchFormulaMain.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
	<div id="RM_synchDialog_edit_div" style="height:100%">
		<div id="RM_batchFormula_batchFormulaMain_synchDialog_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "RM_batchFormula_batchFormulaMain_synchDialog_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=RM_7.5.0.0_batchFormula', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>			<div class="edit-panes" style="margin-top:0px;padding:0px;">
				<div>
				<div class="edit-panes-w">

<div class="edit-panes-s" style="width:98%;margin-left:10px;">
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:30%'></td><td style='height:0px;border:none;width:37%'></td><td style='height:0px;border:none;width:30%'></td></tr>
		<tr class="dialog_tr">
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1546051350391')}" >${getText('RM.propertydisplayName.randon1546051350391')}</label>
				</td>
				
						<#assign batchFormulaMain_origin_defaultValue  = ''>
							 							<#assign batchFormulaMain_origin_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="2" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${batchFormulaMain_origin_defaultValue!}" formId="RM_batchFormula_batchFormulaMain_synchDialog_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="batchFormulaMain.origin.id" code="serviceUrl" value="${(batchFormulaMain.origin.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_batchFormula_batchFormulaMain_synchDialog_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="batchFormulaMain.origin.id" code="serviceUrl" value="${(batchFormulaMain.origin.id)!}"  />
									
								</#if>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1546051384996')}" >${getText('RM.propertydisplayName.randon1546051384996')}</label>
				</td>
				
						<#assign batchFormulaMain_batchFormulaId_defaultValue  = ''>
							 							<#assign batchFormulaMain_batchFormulaId_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="batchFormulaMain.batchFormulaId" id="batchFormulaMain_batchFormulaId"  style=";" originalvalue="<#if !newObj || (batchFormulaMain.batchFormulaId)?has_content>${(batchFormulaMain.batchFormulaId?html)!}<#else>${batchFormulaMain_batchFormulaId_defaultValue!}</#if>" value="<#if !newObj || (batchFormulaMain.batchFormulaId)?has_content>${(batchFormulaMain.batchFormulaId?html)!}<#else>${batchFormulaMain_batchFormulaId_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1546051436101rmbatch')}" >${getText('RM.propertydisplayName.randon1546051436101rmbatch')}</label>
				</td>
				
						<#assign batchFormulaMain_formulaCode_defaultValue  = ''>
							 							<#assign batchFormulaMain_formulaCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="batchFormulaMain.formulaCode" id="batchFormulaMain_formulaCode"  style=";" originalvalue="<#if !newObj || (batchFormulaMain.formulaCode)?has_content>${(batchFormulaMain.formulaCode?html)!}<#else>${batchFormulaMain_formulaCode_defaultValue!}</#if>" value="<#if !newObj || (batchFormulaMain.formulaCode)?has_content>${(batchFormulaMain.formulaCode?html)!}<#else>${batchFormulaMain_formulaCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1546051278782rmbatch')}" >${getText('RM.propertydisplayName.randon1546051278782rmbatch')}</label>
				</td>
				
						<#assign batchFormulaMain_edition_defaultValue  = ''>
							 							<#assign batchFormulaMain_edition_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="INTEGER" name="batchFormulaMain.edition" id="batchFormulaMain_edition"  style=";" originalvalue="<#if !newObj || (batchFormulaMain.edition)?has_content>${(batchFormulaMain.edition?html)!}<#else>${batchFormulaMain_edition_defaultValue!}</#if>" value="<#if !newObj || (batchFormulaMain.edition)?has_content>${(batchFormulaMain.edition?html)!}<#else>${batchFormulaMain_edition_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1546051474183')}" >${getText('RM.propertydisplayName.randon1546051474183')}</label>
				</td>
				
						<#assign batchFormulaMain_remark_defaultValue  = ''>
							 							<#assign batchFormulaMain_remark_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="batchFormulaMain.remark" id="batchFormulaMain_remark"  style=";" originalvalue="<#if !newObj || (batchFormulaMain.remark)?has_content>${(batchFormulaMain.remark?html)!}<#else>${batchFormulaMain_remark_defaultValue!}</#if>" value="<#if !newObj || (batchFormulaMain.remark)?has_content>${(batchFormulaMain.remark?html)!}<#else>${batchFormulaMain_remark_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
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
<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_batchFormula_synchDialog,html,RM_7.5.0.0_batchFormula_BatchFormulaMain,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	RM.batchFormula.batchFormulaMain.synchDialog.beforeSaveProcess = function(){}
	RM.batchFormula.batchFormulaMain.synchDialog.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(RM.batchFormula.batchFormulaMain.synchDialog.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#RM_batchFormula_batchFormulaMain_synchDialog_form').trigger('beforeSubmit');
		//batchFormulaMain.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="batchFormulaMain.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#RM_batchFormula_batchFormulaMain_synchDialog_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#RM_batchFormula_batchFormulaMain_synchDialog_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	RM.batchFormula.batchFormulaMain.synchDialog.validate = function(){
		return true;
	}
	
	
	//打印
	RM.batchFormula.batchFormulaMain.synchDialog.print = function(url){
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
		
		RM.batchFormula.batchFormulaMain.synchDialog.saveSetting = function(){
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
		RM.batchFormula.batchFormulaMain.synchDialog.printSetting = function(){
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
			RM.batchFormula.batchFormulaMain.synchDialog.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(RM.batchFormula.batchFormulaMain.synchDialog.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				RM.batchFormula.batchFormulaMain.synchDialog.settingDialog.show();
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
			RM.batchFormula.batchFormulaMain.synchDialog._customCallBack = customCallBack;
		}
		RM.batchFormula.batchFormulaMain.synchDialog._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#RM_batchFormula_batchFormulaMain_synchDialog_fileupload').length == 0) {
				$('body').append('<div id="RM_batchFormula_batchFormulaMain_synchDialog_fileupload"></div>');
			}
			RM.batchFormula.batchFormulaMain.synchDialog.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "RM_batchFormula_batchFormulaMain_synchDialog_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#RM_batchFormula_batchFormulaMain_synchDialog_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			RM.batchFormula.batchFormulaMain.synchDialog.infoDialog.show();
			if($('#RM_batchFormula_batchFormulaMain_synchDialog_fileupload').html() == '') {
				$('#RM_batchFormula_batchFormulaMain_synchDialog_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=RM_batchFormula_batchFormulaMain&entityCode=RM_7.5.0.0_batchFormula&dialogId="+dialogId);
			}
		}
	//参照复制函数
	RM.batchFormula.batchFormulaMain.synchDialog.referenceCopy = function(objName,url, dialog){
		var callbackName ="RM.batchFormula.batchFormulaMain.synchDialog.referenceCopyBackInfo";
		RM.batchFormula.batchFormulaMain.synchDialog.dialog = dialog;
		RM.batchFormula.batchFormulaMain.synchDialog._dialog = foundation.common.select({
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
	
	RM.batchFormula.batchFormulaMain.synchDialog.referenceCopyBackInfo = function(obj){
		if(RM.batchFormula.batchFormulaMain.synchDialog._dialog){
			RM.batchFormula.batchFormulaMain.synchDialog._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,RM.batchFormula.batchFormulaMain.synchDialog.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('RM_batchFormula_batchFormulaMain_synchDialog_form','RM_batchFormula_batchFormulaMain_synchDialog_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(RM.batchFormula.batchFormulaMain.synchDialog.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(RM.batchFormula.batchFormulaMain.synchDialog.dialog._el).load('/RM/batchFormula/batchFormulaMain/synchDialog.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( RM.batchFormula.batchFormulaMain.synchDialog.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + RM.batchFormula.batchFormulaMain.synchDialog.dialog._config.iframe, RM.batchFormula.batchFormulaMain.synchDialog.dialog._dialog ).prop( 'src', '/RM/batchFormula/batchFormulaMain/synchDialog.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(RM.batchFormula.batchFormulaMain.synchDialog.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(RM.batchFormula.batchFormulaMain.synchDialog.dialog._el).load('/RM/batchFormula/batchFormulaMain/synchDialog.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	RM.batchFormula.batchFormulaMain.synchDialog.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		RM.batchFormula.batchFormulaMain.synchDialog.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		RM.batchFormula.batchFormulaMain.synchDialog._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			RM.batchFormula.batchFormulaMain.synchDialog._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	RM.batchFormula.batchFormulaMain.synchDialog._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'RM_batchFormula_batchFormulaMain_synchDialog' + '_' + extraFrameParam;
		var callbackName="";
		RM.batchFormula.batchFormulaMain.synchDialog._prefix = '';
		RM.batchFormula.batchFormulaMain.synchDialog._oGrid = oGrid;
		RM.batchFormula.batchFormulaMain.synchDialog._sUrl = url;
		if(customCallBack){
			RM.batchFormula.batchFormulaMain.synchDialog._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			RM.batchFormula.batchFormulaMain.synchDialog.gridEventObj = gridEventObj;
			callbackName = "RM.batchFormula.batchFormulaMain.synchDialog.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				RM.batchFormula.batchFormulaMain.synchDialog._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "RM.batchFormula.batchFormulaMain.synchDialog.getMultiselectCallBackInfo_DG" : "RM.batchFormula.batchFormulaMain.synchDialog.getcallBackInfo_DG";
			RM.batchFormula.batchFormulaMain.synchDialog._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				RM.batchFormula.batchFormulaMain.synchDialog._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="RM.batchFormula.batchFormulaMain.synchDialog.getcallBackInfo";
		}
		if(RM.batchFormula.batchFormulaMain.synchDialog._prefix!=''){
			RM.batchFormula.batchFormulaMain.synchDialog._prefix = RM.batchFormula.batchFormulaMain.synchDialog._prefix.substring(1);
		}
		if(RM.batchFormula.batchFormulaMain.synchDialog._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.batchFormula.batchFormulaMain.synchDialog._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof RM.batchFormula.batchFormulaMain.synchDialog._querycustomFuncN == "function") {
				refparam += RM.batchFormula.batchFormulaMain.synchDialog._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		RM.batchFormula.batchFormulaMain.synchDialog._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.batchFormula.batchFormulaMain.synchDialog._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.batchFormula.batchFormulaMain.synchDialog.query_"+obj+")!='undefined'") ? eval('RM.batchFormula.batchFormulaMain.synchDialog.query_'+obj+'()') : null;
		return str;
	
	};
	
	RM.batchFormula.batchFormulaMain.synchDialog.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('RM_batchFormula_batchFormulaMain_synchDialog_form',obj[0], RM.batchFormula.batchFormulaMain.synchDialog._prefix, RM.batchFormula.batchFormulaMain.synchDialog._sUrl);
		CUI.commonFills('RM_batchFormula_batchFormulaMain_synchDialog_form',RM.batchFormula.batchFormulaMain.synchDialog._prefix,obj[0]);

		try{
			if(RM.batchFormula.batchFormulaMain.synchDialog._customCallBack) {
				eval(RM.batchFormula.batchFormulaMain.synchDialog._customCallBack);
				RM.batchFormula.batchFormulaMain.synchDialog._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.batchFormula.batchFormulaMain.synchDialog._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	RM.batchFormula.batchFormulaMain.synchDialog.getcallBackInfo_DG_IE = function(obj){
		if(RM.batchFormula.batchFormulaMain.synchDialog._customBeforeCallBack) {
			var flag = eval(RM.batchFormula.batchFormulaMain.synchDialog._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = RM.batchFormula.batchFormulaMain.synchDialog.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,RM.batchFormula.batchFormulaMain.synchDialog._sUrl);
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
			if(RM.batchFormula.batchFormulaMain.synchDialog._customCallBack) {
				eval(RM.batchFormula.batchFormulaMain.synchDialog._customCallBack);
				RM.batchFormula.batchFormulaMain.synchDialog._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.batchFormula.batchFormulaMain.synchDialog._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	RM.batchFormula.batchFormulaMain.synchDialog.getcallBackInfo_DG = function(obj){
		if(RM.batchFormula.batchFormulaMain.synchDialog._customBeforeCallBack) {
			var flag = eval(RM.batchFormula.batchFormulaMain.synchDialog._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(RM.batchFormula.batchFormulaMain.synchDialog._currRow).next().length==0){
					RM.batchFormula.batchFormulaMain.synchDialog._oGrid.addNewRow();
				}	
				RM.batchFormula.batchFormulaMain.synchDialog._currRow = $(RM.batchFormula.batchFormulaMain.synchDialog._currRow).next();
				$(RM.batchFormula.batchFormulaMain.synchDialog._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(RM.batchFormula.batchFormulaMain.synchDialog._currRow,obj[i],RM.batchFormula.batchFormulaMain.synchDialog._prefix,RM.batchFormula.batchFormulaMain.synchDialog._sUrl);
			eval("CUI.commonFills_DG(RM.batchFormula.batchFormulaMain.synchDialog._currRow,RM.batchFormula.batchFormulaMain.synchDialog._prefix,obj[i],RM.batchFormula.batchFormulaMain.synchDialog._oGrid)");
		}
		try{
			if(RM.batchFormula.batchFormulaMain.synchDialog._customCallBack) {
				eval(RM.batchFormula.batchFormulaMain.synchDialog._customCallBack);
				RM.batchFormula.batchFormulaMain.synchDialog._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.batchFormula.batchFormulaMain.synchDialog._dialog.close();
		} catch(e){}
	};
	
	RM.batchFormula.batchFormulaMain.synchDialog.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(RM.batchFormula.batchFormulaMain.synchDialog._oGrid, RM.batchFormula.batchFormulaMain.synchDialog._currRow, RM.batchFormula.batchFormulaMain.synchDialog._key, RM.batchFormula.batchFormulaMain.synchDialog._displayFieldName, obj[i])
		}
		try{
			if(RM.batchFormula.batchFormulaMain.synchDialog._customCallBack) {
				eval(RM.batchFormula.batchFormulaMain.synchDialog._customCallBack);
				RM.batchFormula.batchFormulaMain.synchDialog._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.batchFormula.batchFormulaMain.synchDialog._dialog.close();
		} catch(e){}
	};
	
	RM.batchFormula.batchFormulaMain.synchDialog.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			RM.batchFormula.batchFormulaMain.synchDialog.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#RM_batchFormula_batchFormulaMain_synchDialog_form'));
        			}
        	   	}
        	}
      	});
	};
	(function($){
		$(function(){
			setTimeout(function(){
	var ptObjs = top.frames['RM_7_5_0_0_batchFormula_batchFormulaList'].ec_RM_batchFormula_batchFormulaMain_batchFormulaList_queryWidget.getSelectedRow();
	if(ptObjs.length != 0){
		interfaceUrl = ptObjs[0].origin.id;
		if(interfaceUrl !=null && interfaceUrl.length > 0 ){
			$("#batchFormulaMainoriginid").disabledSelect(); 
		}
	}
},50);

// 版本号居左显示
$('[name="batchFormulaMain.edition"]').css("text-align","left");

var batchFormulaId = $('[name="batchFormulaMain.batchFormulaId"]').val();
if(batchFormulaId=='' || batchFormulaId==null){ // 如果批控主配方ID为空,则取消红色字段
	//$('#RM_batchFormula_batchFormulaMain_synchDialog_main_div tr:eq(2) td:eq(0)')[0].style.color = 'rgb(0,0,0)';
	//$('#batchFormulaMain_batchFormulaId').parent().parent().prev().css("color","");
	// 如果批控配方id为空则隐藏后4行
	$('[id="batchFormulaMain_batchFormulaId"]').parent().parent().parent().hide();
	$('[id="batchFormulaMain_formulaCode"]').parent().parent().parent().hide();
	$('[id="batchFormulaMain_edition"]').parent().parent().parent().hide();
	$('[id="batchFormulaMain_remark"]').parent().parent().parent().hide();
}
		});
	})(jQuery);
	RM.batchFormula.batchFormulaMain.synchDialog.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	RM.batchFormula.batchFormulaMain.synchDialog.initCount = 0;
	RM.batchFormula.batchFormulaMain.synchDialog.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#RM_synchDialog_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('RM_batchFormula_batchFormulaMain_synchDialog_datagrids');	
		var	conHeight = h-$("#RM_batchFormula_batchFormulaMain_synchDialog_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#RM_batchFormula_batchFormulaMain_synchDialog_main_div .edit-panes-s").each(function(index){
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
							if(RM.batchFormula.batchFormulaMain.synchDialog.initCount <= 2) {
								setTimeout(function(){RM.batchFormula.batchFormulaMain.synchDialog.initSize();}, 200);
								RM.batchFormula.batchFormulaMain.synchDialog.initCount++;
							}/* else {
								RM.batchFormula.batchFormulaMain.synchDialog.initCount = 0;
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
		RM.batchFormula.batchFormulaMain.synchDialog.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    RM.batchFormula.batchFormulaMain.synchDialog.initSize(index);
		});
		$(window).bind("dialog.resize",function(){RM.batchFormula.batchFormulaMain.synchDialog.initSize();});
	});
</script>
<script type="text/javascript">
	

	/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_batchFormula_synchDialog,js,RM_7.5.0.0_batchFormula_BatchFormulaMain,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>