<!-- WOM_7.5.0.0/procFeedback/craftStandardEdit -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1541035371154')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_procFeedback_craftStandardEdit,head,WOM_7.5.0.0_procFeedback_CraftStandards,WOM_7.5.0.0) -->
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
	CUI.ns('WOM.procFeedback.craftStandards.craftStandardEdit');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "WOM_procFeedback_craftStandards">
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
<#assign callbackName ="WOM.procFeedback.craftStandards.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="WOM_procFeedback_craftStandards_craftStandardEdit_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="WOM_procFeedback_craftStandards_craftStandardEdit_form" cssStyle="height:100%;" hiddenField="craftStandards.procFeedbackID.id," onsubmitMethod="WOM.procFeedback.craftStandards.craftStandardEdit.beforeSubmitMethod()" ecAction="/WOM/procFeedback/craftStandards/craftStandardEdit/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="craftStandardEdit">
	<input type="hidden" name="viewCode" value="WOM_7.5.0.0_procFeedback_craftStandardEdit">
	<input type="hidden" name="datagridKey" value="WOM_procFeedback_craftStandards_craftStandardEdit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="craftStandards.version" value="${(craftStandards.version)!0}" />
	<input type="hidden" name="craftStandards.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
		<input type="hidden" name="craftStandards.procFeedbackID.id" value="${(craftStandards.procFeedbackID.id)!""}"/>
	<div id="WOM_craftStandardEdit_edit_div" style="height:100%">
		<div id="WOM_procFeedback_craftStandards_craftStandardEdit_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "WOM_procFeedback_craftStandards_craftStandardEdit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=WOM_7.5.0.0_procFeedback', null, function(){
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
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:30%'></td><td style='height:0px;border:none;width:37%'></td><td style='height:0px;border:none;width:30%'></td></tr>
		<tr class="dialog_tr">
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1541034087253')}" >${getText('WOM.propertydisplayName.randon1541034087253')}</label>
				</td>
				
						<#assign craftStandards_craftName_defaultValue  = ''>
							 							<#assign craftStandards_craftName_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="craftStandards.craftName" id="craftStandards_craftName"  style=";" originalvalue="<#if !newObj || (craftStandards.craftName)?has_content>${(craftStandards.craftName?html)!}<#else>${craftStandards_craftName_defaultValue!}</#if>" value="<#if !newObj || (craftStandards.craftName)?has_content>${(craftStandards.craftName?html)!}<#else>${craftStandards_craftName_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1541034112568')}" >${getText('WOM.propertydisplayName.randon1541034112568')}</label>
				</td>
				
						<#assign craftStandards_standardValue_defaultValue  = ''>
							 							<#assign craftStandards_standardValue_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="craftStandards.standardValue" id="craftStandards_standardValue"  style=";" originalvalue="<#if newObj&& !(craftStandards.standardValue)?has_content>${craftStandards_standardValue_defaultValue!}<#elseif (craftStandards.standardValue)?has_content>#{(craftStandards.standardValue)!; m6M6}</#if>" value="<#if newObj&& !(craftStandards.standardValue)?has_content>${craftStandards_standardValue_defaultValue!}<#elseif (craftStandards.standardValue)?has_content>#{(craftStandards.standardValue)!; m6M6}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#craftStandards_standardValue').unbind('blur').bind('blur',function(){
										var percision = 6;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("WOM.propertydisplayName.randon1541034112568")}')}");
											return;
										}
										if(parseInt(percision) > -1 && $(this).val()!=undefined && $(this).val()!='' && isDecimal($(this).val())){
											$(this).val(($(this).val() * 1).toFixed(percision));
										}
									});
								});
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1541034061588')}" >${getText('WOM.propertydisplayName.randon1541034061588')}</label>
				</td>
				
						<#assign craftStandards_remark_defaultValue  = ''>
							 							<#assign craftStandards_remark_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="2" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="craftStandards.remark" id="craftStandards_remark"  style=";" originalvalue="<#if !newObj || (craftStandards.remark)?has_content>${(craftStandards.remark?html)!}<#else>${craftStandards_remark_defaultValue!}</#if>" value="<#if !newObj || (craftStandards.remark)?has_content>${(craftStandards.remark?html)!}<#else>${craftStandards_remark_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
		</tr>
	</table>
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="display:none">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:30%'></td><td style='height:0px;border:none;width:37%'></td><td style='height:0px;border:none;width:30%'></td></tr>
		<tr class="dialog_tr">
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('ec.common.ID')}" >${getText('ec.common.ID')}</label>
				</td>
				
						<#assign craftStandards_procFeedbackID_id_defaultValue  = ''>
														<#assign craftStandards_procFeedbackID_id_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   colspan="2" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="LONG" mneenable=false reftitle="${getText('WOM.viewtitle.randon1541036230940')}" viewType="${viewType!}" deValue="${craftStandards_procFeedbackID_id_defaultValue!}" conditionfunc="WOM.procFeedback.craftStandards.craftStandardEdit._querycustomFunc('craftStandards_procFeedbackID_id')"  value="${(craftStandards.procFeedbackID.id)!}" displayFieldName="id" name="craftStandards.procFeedbackID.id" id="craftStandards_procFeedbackID_id" type="other" url="/WOM/procFeedback/procFeedbackHead/procFeedbackRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_procFeedback_craftStandards_craftStandardEdit_form" editCustomCallback=";" refViewCode="WOM_7.5.0.0_procFeedback_procFeedbackRef"  onkeyupfuncname=";_callback_craftStandards_procFeedbackID_id(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(craftStandards.id)?? && (craftStandards.procFeedbackID.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${craftStandards.procFeedbackID.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_procFeedback_craftStandards_craftStandardEdit_form',obj, 'craftStandards.procFeedbackID', '/WOM/procFeedback/procFeedbackHead/procFeedbackRef.action');
												CUI.commonFills('WOM_procFeedback_craftStandards_craftStandardEdit_form', 'craftStandards.procFeedbackID',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
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
<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_procFeedback_craftStandardEdit,html,WOM_7.5.0.0_procFeedback_CraftStandards,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	WOM.procFeedback.craftStandards.craftStandardEdit.beforeSaveProcess = function(){}
	WOM.procFeedback.craftStandards.craftStandardEdit.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(WOM.procFeedback.craftStandards.craftStandardEdit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#WOM_procFeedback_craftStandards_craftStandardEdit_form').trigger('beforeSubmit');
		//craftStandards.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="craftStandards.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#WOM_procFeedback_craftStandards_craftStandardEdit_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#WOM_procFeedback_craftStandards_craftStandardEdit_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	WOM.procFeedback.craftStandards.craftStandardEdit.validate = function(){
		return true;
	}
	
	
	//打印
	WOM.procFeedback.craftStandards.craftStandardEdit.print = function(url){
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
		
		WOM.procFeedback.craftStandards.craftStandardEdit.saveSetting = function(){
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
		WOM.procFeedback.craftStandards.craftStandardEdit.printSetting = function(){
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
			WOM.procFeedback.craftStandards.craftStandardEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(WOM.procFeedback.craftStandards.craftStandardEdit.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				WOM.procFeedback.craftStandards.craftStandardEdit.settingDialog.show();
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
			WOM.procFeedback.craftStandards.craftStandardEdit._customCallBack = customCallBack;
		}
		WOM.procFeedback.craftStandards.craftStandardEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#WOM_procFeedback_craftStandards_craftStandardEdit_fileupload').length == 0) {
				$('body').append('<div id="WOM_procFeedback_craftStandards_craftStandardEdit_fileupload"></div>');
			}
			WOM.procFeedback.craftStandards.craftStandardEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "WOM_procFeedback_craftStandards_craftStandardEdit_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#WOM_procFeedback_craftStandards_craftStandardEdit_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			WOM.procFeedback.craftStandards.craftStandardEdit.infoDialog.show();
			if($('#WOM_procFeedback_craftStandards_craftStandardEdit_fileupload').html() == '') {
				$('#WOM_procFeedback_craftStandards_craftStandardEdit_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=WOM_procFeedback_craftStandards&entityCode=WOM_7.5.0.0_procFeedback&dialogId="+dialogId);
			}
		}
	//参照复制函数
	WOM.procFeedback.craftStandards.craftStandardEdit.referenceCopy = function(objName,url, dialog){
		var callbackName ="WOM.procFeedback.craftStandards.craftStandardEdit.referenceCopyBackInfo";
		WOM.procFeedback.craftStandards.craftStandardEdit.dialog = dialog;
		WOM.procFeedback.craftStandards.craftStandardEdit._dialog = foundation.common.select({
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
	
	WOM.procFeedback.craftStandards.craftStandardEdit.referenceCopyBackInfo = function(obj){
		if(WOM.procFeedback.craftStandards.craftStandardEdit._dialog){
			WOM.procFeedback.craftStandards.craftStandardEdit._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,WOM.procFeedback.craftStandards.craftStandardEdit.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('WOM_procFeedback_craftStandards_craftStandardEdit_form','WOM_procFeedback_craftStandards_craftStandardEdit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(WOM.procFeedback.craftStandards.craftStandardEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(WOM.procFeedback.craftStandards.craftStandardEdit.dialog._el).load('/WOM/procFeedback/craftStandards/craftStandardEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( WOM.procFeedback.craftStandards.craftStandardEdit.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + WOM.procFeedback.craftStandards.craftStandardEdit.dialog._config.iframe, WOM.procFeedback.craftStandards.craftStandardEdit.dialog._dialog ).prop( 'src', '/WOM/procFeedback/craftStandards/craftStandardEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(WOM.procFeedback.craftStandards.craftStandardEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(WOM.procFeedback.craftStandards.craftStandardEdit.dialog._el).load('/WOM/procFeedback/craftStandards/craftStandardEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	WOM.procFeedback.craftStandards.craftStandardEdit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		WOM.procFeedback.craftStandards.craftStandardEdit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		WOM.procFeedback.craftStandards.craftStandardEdit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			WOM.procFeedback.craftStandards.craftStandardEdit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	WOM.procFeedback.craftStandards.craftStandardEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'WOM_procFeedback_craftStandards_craftStandardEdit' + '_' + extraFrameParam;
		var callbackName="";
		WOM.procFeedback.craftStandards.craftStandardEdit._prefix = '';
		WOM.procFeedback.craftStandards.craftStandardEdit._oGrid = oGrid;
		WOM.procFeedback.craftStandards.craftStandardEdit._sUrl = url;
		if(customCallBack){
			WOM.procFeedback.craftStandards.craftStandardEdit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			WOM.procFeedback.craftStandards.craftStandardEdit.gridEventObj = gridEventObj;
			callbackName = "WOM.procFeedback.craftStandards.craftStandardEdit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				WOM.procFeedback.craftStandards.craftStandardEdit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "WOM.procFeedback.craftStandards.craftStandardEdit.getMultiselectCallBackInfo_DG" : "WOM.procFeedback.craftStandards.craftStandardEdit.getcallBackInfo_DG";
			WOM.procFeedback.craftStandards.craftStandardEdit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				WOM.procFeedback.craftStandards.craftStandardEdit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="WOM.procFeedback.craftStandards.craftStandardEdit.getcallBackInfo";
		}
		if(WOM.procFeedback.craftStandards.craftStandardEdit._prefix!=''){
			WOM.procFeedback.craftStandards.craftStandardEdit._prefix = WOM.procFeedback.craftStandards.craftStandardEdit._prefix.substring(1);
		}
		if(WOM.procFeedback.craftStandards.craftStandardEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.procFeedback.craftStandards.craftStandardEdit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof WOM.procFeedback.craftStandards.craftStandardEdit._querycustomFuncN == "function") {
				refparam += WOM.procFeedback.craftStandards.craftStandardEdit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		WOM.procFeedback.craftStandards.craftStandardEdit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	WOM.procFeedback.craftStandards.craftStandardEdit._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.procFeedback.craftStandards.craftStandardEdit.query_"+obj+")!='undefined'") ? eval('WOM.procFeedback.craftStandards.craftStandardEdit.query_'+obj+'()') : null;
		return str;
	
	};
	
	WOM.procFeedback.craftStandards.craftStandardEdit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('WOM_procFeedback_craftStandards_craftStandardEdit_form',obj[0], WOM.procFeedback.craftStandards.craftStandardEdit._prefix, WOM.procFeedback.craftStandards.craftStandardEdit._sUrl);
		CUI.commonFills('WOM_procFeedback_craftStandards_craftStandardEdit_form',WOM.procFeedback.craftStandards.craftStandardEdit._prefix,obj[0]);

		try{
			if(WOM.procFeedback.craftStandards.craftStandardEdit._customCallBack) {
				eval(WOM.procFeedback.craftStandards.craftStandardEdit._customCallBack);
				WOM.procFeedback.craftStandards.craftStandardEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			WOM.procFeedback.craftStandards.craftStandardEdit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	WOM.procFeedback.craftStandards.craftStandardEdit.getcallBackInfo_DG_IE = function(obj){
		if(WOM.procFeedback.craftStandards.craftStandardEdit._customBeforeCallBack) {
			var flag = eval(WOM.procFeedback.craftStandards.craftStandardEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = WOM.procFeedback.craftStandards.craftStandardEdit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,WOM.procFeedback.craftStandards.craftStandardEdit._sUrl);
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
			if(WOM.procFeedback.craftStandards.craftStandardEdit._customCallBack) {
				eval(WOM.procFeedback.craftStandards.craftStandardEdit._customCallBack);
				WOM.procFeedback.craftStandards.craftStandardEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			WOM.procFeedback.craftStandards.craftStandardEdit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	WOM.procFeedback.craftStandards.craftStandardEdit.getcallBackInfo_DG = function(obj){
		if(WOM.procFeedback.craftStandards.craftStandardEdit._customBeforeCallBack) {
			var flag = eval(WOM.procFeedback.craftStandards.craftStandardEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(WOM.procFeedback.craftStandards.craftStandardEdit._currRow).next().length==0){
					WOM.procFeedback.craftStandards.craftStandardEdit._oGrid.addNewRow();
				}	
				WOM.procFeedback.craftStandards.craftStandardEdit._currRow = $(WOM.procFeedback.craftStandards.craftStandardEdit._currRow).next();
				$(WOM.procFeedback.craftStandards.craftStandardEdit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(WOM.procFeedback.craftStandards.craftStandardEdit._currRow,obj[i],WOM.procFeedback.craftStandards.craftStandardEdit._prefix,WOM.procFeedback.craftStandards.craftStandardEdit._sUrl);
			eval("CUI.commonFills_DG(WOM.procFeedback.craftStandards.craftStandardEdit._currRow,WOM.procFeedback.craftStandards.craftStandardEdit._prefix,obj[i],WOM.procFeedback.craftStandards.craftStandardEdit._oGrid)");
		}
		try{
			if(WOM.procFeedback.craftStandards.craftStandardEdit._customCallBack) {
				eval(WOM.procFeedback.craftStandards.craftStandardEdit._customCallBack);
				WOM.procFeedback.craftStandards.craftStandardEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			WOM.procFeedback.craftStandards.craftStandardEdit._dialog.close();
		} catch(e){}
	};
	
	WOM.procFeedback.craftStandards.craftStandardEdit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(WOM.procFeedback.craftStandards.craftStandardEdit._oGrid, WOM.procFeedback.craftStandards.craftStandardEdit._currRow, WOM.procFeedback.craftStandards.craftStandardEdit._key, WOM.procFeedback.craftStandards.craftStandardEdit._displayFieldName, obj[i])
		}
		try{
			if(WOM.procFeedback.craftStandards.craftStandardEdit._customCallBack) {
				eval(WOM.procFeedback.craftStandards.craftStandardEdit._customCallBack);
				WOM.procFeedback.craftStandards.craftStandardEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			WOM.procFeedback.craftStandards.craftStandardEdit._dialog.close();
		} catch(e){}
	};
	
	WOM.procFeedback.craftStandards.craftStandardEdit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			WOM.procFeedback.craftStandards.craftStandardEdit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#WOM_procFeedback_craftStandards_craftStandardEdit_form'));
        			}
        	   	}
        	}
      	});
	};
	(function($){
		$(function(){
			if ($("#id").val()){
	$("input[name='craftStandards.procFeedbackID.id']").val($("#id").val())
}
		});
	})(jQuery);
	WOM.procFeedback.craftStandards.craftStandardEdit.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	WOM.procFeedback.craftStandards.craftStandardEdit.initCount = 0;
	WOM.procFeedback.craftStandards.craftStandardEdit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#WOM_craftStandardEdit_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('WOM_procFeedback_craftStandards_craftStandardEdit_datagrids');	
		var	conHeight = h-$("#WOM_procFeedback_craftStandards_craftStandardEdit_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#WOM_procFeedback_craftStandards_craftStandardEdit_main_div .edit-panes-s").each(function(index){
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
							if(WOM.procFeedback.craftStandards.craftStandardEdit.initCount <= 2) {
								setTimeout(function(){WOM.procFeedback.craftStandards.craftStandardEdit.initSize();}, 200);
								WOM.procFeedback.craftStandards.craftStandardEdit.initCount++;
							}/* else {
								WOM.procFeedback.craftStandards.craftStandardEdit.initCount = 0;
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
		WOM.procFeedback.craftStandards.craftStandardEdit.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    WOM.procFeedback.craftStandards.craftStandardEdit.initSize(index);
		});
		$(window).bind("dialog.resize",function(){WOM.procFeedback.craftStandards.craftStandardEdit.initSize();});
	});
</script>
<script type="text/javascript">
	

	/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_procFeedback_craftStandardEdit,js,WOM_7.5.0.0_procFeedback_CraftStandards,WOM_7.5.0.0) */
// 自定义代码
	var randgeEdit;
    /**
     * 保存完毕回调
     * @method WOM.procFeedback.craftStandards.callBackInfo
     */
    WOM.procFeedback.craftStandards.callBackInfo = function(res){
      if(res.dealSuccessFlag){
          if(res.operateType == 'save'){
              var viewselect = res.viewselect;
              var errorBarWidget = eval('WOM_procFeedback_craftStandards_' + viewselect + '_formDialogErrorBarWidget');
              errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
          } else if(res.operateType == 'delete') {
              workbenchErrorBarWidget.showMessage("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
          }  else if(res.operateType == 'restore') {
              workbenchErrorBarWidget.showMessage("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
          }
          setTimeout(function(){
              try{
                  randgeEdit.close();
                  closeLoadPanel();
                  if ($("input[name='procFeedbackHead.adjustDealRecord.recordDataSource.id']").val() == "womActiveSource/04" || $("input[name='procFeedbackHead.adjustDealRecord.recordDataSource.id']").val() == "womActiveSource/03") {
                      CraftStandards_dg1542186009188Widget._DT.setRequestDataUrl('/WOM/procFeedback/procFeedbackHead/data-dg1542186009188.action?procFeedbackHead.id='+$('#id').val())
                  }else{
                      var activeType = $("input[name='procFeedbackHead.processActive.activeType.id']").val();
                      if (activeType == "activeType/activeType3" || activeType == "activeType/activeType1") {
                          CraftStandards_dg1541073013999Widget._DT.setRequestDataUrl('/WOM/procFeedback/procFeedbackHead/data-dg1541073013999.action?procFeedbackHead.id='+$('#id').val())
                      }else if(activeType == "activeType/activeType2"){
                          CraftStandards_dg1540988573983Widget._DT.setRequestDataUrl('/WOM/procFeedback/procFeedbackHead/data-dg1540988573983.action?procFeedbackHead.id='+$('#id').val())
                      }
                  }
              }catch(e){}
          },1500);
      } else {
          CUI.showErrorInfos(res);
      }
  };
/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>