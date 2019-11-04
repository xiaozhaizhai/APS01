<!-- WOM_7.5.0.0/proActiveAndBatchState/stateEdit -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1509445969012')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_proActiveAndBatchState_stateEdit,head,WOM_7.5.0.0_proActiveAndBatchState_ProActAndBatState,WOM_7.5.0.0) -->
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
	CUI.ns('WOM.proActiveAndBatchState.proActAndBatState.stateEdit');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "WOM_proActiveAndBatchState_proActAndBatState">
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
<#assign callbackName ="WOM.proActiveAndBatchState.proActAndBatState.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="WOM_proActiveAndBatchState_proActAndBatState_stateEdit_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="WOM_proActiveAndBatchState_proActAndBatState_stateEdit_form" cssStyle="height:100%;" hiddenField="proActAndBatState.activeBatchStateID.id,proActAndBatState.id," onsubmitMethod="WOM.proActiveAndBatchState.proActAndBatState.stateEdit.beforeSubmitMethod()" ecAction="/WOM/proActiveAndBatchState/proActAndBatState/stateEdit/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="stateEdit">
	<input type="hidden" name="viewCode" value="WOM_7.5.0.0_proActiveAndBatchState_stateEdit">
	<input type="hidden" name="datagridKey" value="WOM_proActiveAndBatchState_proActAndBatState_stateEdit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="proActAndBatState.version" value="${(proActAndBatState.version)!0}" />
	<input type="hidden" name="proActAndBatState.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
		<input type="hidden" name="proActAndBatState.activeBatchStateID.id" value="${(proActAndBatState.activeBatchStateID.id)!""}"/>
		<input type="hidden" name="proActAndBatState.id" value="${(proActAndBatState.id)!""}"/>
	<div id="WOM_stateEdit_edit_div" style="height:100%">
		<div id="WOM_proActiveAndBatchState_proActAndBatState_stateEdit_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "WOM_proActiveAndBatchState_proActAndBatState_stateEdit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=WOM_7.5.0.0_proActiveAndBatchState', null, function(){
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
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:30%'></td><td style='height:0px;border:none;width:70%'></td></tr>
		<tr class="dialog_tr">
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('publicSet.propertydisplayName.randon1509427955424')}" >${getText('publicSet.propertydisplayName.randon1509427955424')}</label>
				</td>
				
						<#assign proActAndBatState_activeBatchStateID_name_defaultValue  = ''>
														<#assign proActAndBatState_activeBatchStateID_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('publicSet.viewtitle.randon1509430526337')}" viewType="${viewType!}" deValue="${proActAndBatState_activeBatchStateID_name_defaultValue!}" conditionfunc="WOM.proActiveAndBatchState.proActAndBatState.stateEdit._querycustomFunc('proActAndBatState_activeBatchStateID_name')"  value="${(proActAndBatState.activeBatchStateID.name)!}" displayFieldName="name" name="proActAndBatState.activeBatchStateID.name" id="proActAndBatState_activeBatchStateID_name" type="other" url="/publicSet/activeAndBatchState/actBatState/activeBatchStateRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_proActiveAndBatchState_proActAndBatState_stateEdit_form" editCustomCallback=";" refViewCode="publicSet_1.0_activeAndBatchState_activeBatchStateRef"  onkeyupfuncname=";_callback_proActAndBatState_activeBatchStateID_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(proActAndBatState.id)?? && (proActAndBatState.activeBatchStateID.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${proActAndBatState.activeBatchStateID.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_proActiveAndBatchState_proActAndBatState_stateEdit_form',obj, 'proActAndBatState.activeBatchStateID', '/publicSet/activeAndBatchState/actBatState/activeBatchStateRef.action');
												CUI.commonFills('WOM_proActiveAndBatchState_proActAndBatState_stateEdit_form', 'proActAndBatState.activeBatchStateID',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1509445588580')}" >${getText('WOM.propertydisplayName.randon1509445588580')}</label>
				</td>
				
						<#assign proActAndBatState_quaWithoutPass_defaultValue  = ''>
							 							<#assign proActAndBatState_quaWithoutPass_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="proActAndBatState.quaWithoutPass_check" originalvalue="<#if !newObj><#if (proActAndBatState.quaWithoutPass)??>${(proActAndBatState.quaWithoutPass!false)?string('true','false')}<#else>false</#if><#elseif proActAndBatState_quaWithoutPass_defaultValue?has_content>${(proActAndBatState_quaWithoutPass_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (proActAndBatState.quaWithoutPass)??>${(proActAndBatState.quaWithoutPass!false)?string('true','false')}<#else>false</#if><#else>${(proActAndBatState_quaWithoutPass_defaultValue!true)?string}</#if>"  />
								
								<input property_type="BOOLEAN" type="hidden" name="proActAndBatState.quaWithoutPass" originalvalue="<#if ((proActAndBatState.quaWithoutPass)?? &&  proActAndBatState.quaWithoutPass)||(proActAndBatState_quaWithoutPass_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((proActAndBatState.quaWithoutPass)?? &&  proActAndBatState.quaWithoutPass)||(proActAndBatState_quaWithoutPass_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="proActAndBatState.quaWithoutPass_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="proActAndBatState.quaWithoutPass"]');
												CUI('input[name="proActAndBatState.quaWithoutPass_check"]').each(function(){
													if(this.checked) {
														tempObj.val('true');
													} else {
														tempObj.val('false');
													}
												});
											});
										}catch(e){}	
									});
								</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1509445608978')}" >${getText('WOM.propertydisplayName.randon1509445608978')}</label>
				</td>
				
						<#assign proActAndBatState_regectsDeal_defaultValue  = ''>
							 							<#assign proActAndBatState_regectsDeal_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="proActAndBatState.regectsDeal_check" originalvalue="<#if !newObj><#if (proActAndBatState.regectsDeal)??>${(proActAndBatState.regectsDeal!false)?string('true','false')}<#else>false</#if><#elseif proActAndBatState_regectsDeal_defaultValue?has_content>${(proActAndBatState_regectsDeal_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (proActAndBatState.regectsDeal)??>${(proActAndBatState.regectsDeal!false)?string('true','false')}<#else>false</#if><#else>${(proActAndBatState_regectsDeal_defaultValue!true)?string}</#if>"  />
								
								<input property_type="BOOLEAN" type="hidden" name="proActAndBatState.regectsDeal" originalvalue="<#if ((proActAndBatState.regectsDeal)?? &&  proActAndBatState.regectsDeal)||(proActAndBatState_regectsDeal_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((proActAndBatState.regectsDeal)?? &&  proActAndBatState.regectsDeal)||(proActAndBatState_regectsDeal_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="proActAndBatState.regectsDeal_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="proActAndBatState.regectsDeal"]');
												CUI('input[name="proActAndBatState.regectsDeal_check"]').each(function(){
													if(this.checked) {
														tempObj.val('true');
													} else {
														tempObj.val('false');
													}
												});
											});
										}catch(e){}	
									});
								</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1509445631497')}" >${getText('WOM.propertydisplayName.randon1509445631497')}</label>
				</td>
				
						<#assign proActAndBatState_qualifiedPass_defaultValue  = ''>
							 							<#assign proActAndBatState_qualifiedPass_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="proActAndBatState.qualifiedPass_check" originalvalue="<#if !newObj><#if (proActAndBatState.qualifiedPass)??>${(proActAndBatState.qualifiedPass!false)?string('true','false')}<#else>false</#if><#elseif proActAndBatState_qualifiedPass_defaultValue?has_content>${(proActAndBatState_qualifiedPass_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (proActAndBatState.qualifiedPass)??>${(proActAndBatState.qualifiedPass!false)?string('true','false')}<#else>false</#if><#else>${(proActAndBatState_qualifiedPass_defaultValue!true)?string}</#if>"  />
								
								<input property_type="BOOLEAN" type="hidden" name="proActAndBatState.qualifiedPass" originalvalue="<#if ((proActAndBatState.qualifiedPass)?? &&  proActAndBatState.qualifiedPass)||(proActAndBatState_qualifiedPass_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((proActAndBatState.qualifiedPass)?? &&  proActAndBatState.qualifiedPass)||(proActAndBatState_qualifiedPass_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="proActAndBatState.qualifiedPass_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="proActAndBatState.qualifiedPass"]');
												CUI('input[name="proActAndBatState.qualifiedPass_check"]').each(function(){
													if(this.checked) {
														tempObj.val('true');
													} else {
														tempObj.val('false');
													}
												});
											});
										}catch(e){}	
									});
								</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1509445866110')}" >${getText('WOM.propertydisplayName.randon1509445866110')}</label>
				</td>
				
						<#assign proActAndBatState_activeEnd_defaultValue  = ''>
							 							<#assign proActAndBatState_activeEnd_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${proActAndBatState_activeEnd_defaultValue!}" formId="WOM_proActiveAndBatchState_proActAndBatState_stateEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="proActAndBatState.activeEnd.id" code="womActiveEnd" value="${(proActAndBatState.activeEnd.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="WOM_proActiveAndBatchState_proActAndBatState_stateEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="proActAndBatState.activeEnd.id" code="womActiveEnd" value="${(proActAndBatState.activeEnd.id)!}"  />
									
								</#if>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1509445670888')}" >${getText('WOM.propertydisplayName.randon1509445670888')}</label>
				</td>
				
						<#assign proActAndBatState_remark_defaultValue  = ''>
							 							<#assign proActAndBatState_remark_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="proActAndBatState.remark" id="proActAndBatState_remark"  style=";" originalvalue="<#if !newObj || (proActAndBatState.remark)?has_content>${(proActAndBatState.remark?html)!}<#else>${proActAndBatState_remark_defaultValue!}</#if>" value="<#if !newObj || (proActAndBatState.remark)?has_content>${(proActAndBatState.remark?html)!}<#else>${proActAndBatState_remark_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
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
<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_proActiveAndBatchState_stateEdit,html,WOM_7.5.0.0_proActiveAndBatchState_ProActAndBatState,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	WOM.proActiveAndBatchState.proActAndBatState.stateEdit.beforeSaveProcess = function(){}
	WOM.proActiveAndBatchState.proActAndBatState.stateEdit.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(WOM.proActiveAndBatchState.proActAndBatState.stateEdit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#WOM_proActiveAndBatchState_proActAndBatState_stateEdit_form').trigger('beforeSubmit');
		//proActAndBatState.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="proActAndBatState.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#WOM_proActiveAndBatchState_proActAndBatState_stateEdit_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#WOM_proActiveAndBatchState_proActAndBatState_stateEdit_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	WOM.proActiveAndBatchState.proActAndBatState.stateEdit.validate = function(){
		return true;
	}
	
	
	//打印
	WOM.proActiveAndBatchState.proActAndBatState.stateEdit.print = function(url){
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
		
		WOM.proActiveAndBatchState.proActAndBatState.stateEdit.saveSetting = function(){
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
		WOM.proActiveAndBatchState.proActAndBatState.stateEdit.printSetting = function(){
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
			WOM.proActiveAndBatchState.proActAndBatState.stateEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(WOM.proActiveAndBatchState.proActAndBatState.stateEdit.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				WOM.proActiveAndBatchState.proActAndBatState.stateEdit.settingDialog.show();
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
			WOM.proActiveAndBatchState.proActAndBatState.stateEdit._customCallBack = customCallBack;
		}
		WOM.proActiveAndBatchState.proActAndBatState.stateEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#WOM_proActiveAndBatchState_proActAndBatState_stateEdit_fileupload').length == 0) {
				$('body').append('<div id="WOM_proActiveAndBatchState_proActAndBatState_stateEdit_fileupload"></div>');
			}
			WOM.proActiveAndBatchState.proActAndBatState.stateEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "WOM_proActiveAndBatchState_proActAndBatState_stateEdit_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#WOM_proActiveAndBatchState_proActAndBatState_stateEdit_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			WOM.proActiveAndBatchState.proActAndBatState.stateEdit.infoDialog.show();
			if($('#WOM_proActiveAndBatchState_proActAndBatState_stateEdit_fileupload').html() == '') {
				$('#WOM_proActiveAndBatchState_proActAndBatState_stateEdit_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=WOM_proActiveAndBatchState_proActAndBatState&entityCode=WOM_7.5.0.0_proActiveAndBatchState&dialogId="+dialogId);
			}
		}
	//参照复制函数
	WOM.proActiveAndBatchState.proActAndBatState.stateEdit.referenceCopy = function(objName,url, dialog){
		var callbackName ="WOM.proActiveAndBatchState.proActAndBatState.stateEdit.referenceCopyBackInfo";
		WOM.proActiveAndBatchState.proActAndBatState.stateEdit.dialog = dialog;
		WOM.proActiveAndBatchState.proActAndBatState.stateEdit._dialog = foundation.common.select({
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
	
	WOM.proActiveAndBatchState.proActAndBatState.stateEdit.referenceCopyBackInfo = function(obj){
		if(WOM.proActiveAndBatchState.proActAndBatState.stateEdit._dialog){
			WOM.proActiveAndBatchState.proActAndBatState.stateEdit._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,WOM.proActiveAndBatchState.proActAndBatState.stateEdit.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('WOM_proActiveAndBatchState_proActAndBatState_stateEdit_form','WOM_proActiveAndBatchState_proActAndBatState_stateEdit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(WOM.proActiveAndBatchState.proActAndBatState.stateEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(WOM.proActiveAndBatchState.proActAndBatState.stateEdit.dialog._el).load('/WOM/proActiveAndBatchState/proActAndBatState/stateEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( WOM.proActiveAndBatchState.proActAndBatState.stateEdit.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + WOM.proActiveAndBatchState.proActAndBatState.stateEdit.dialog._config.iframe, WOM.proActiveAndBatchState.proActAndBatState.stateEdit.dialog._dialog ).prop( 'src', '/WOM/proActiveAndBatchState/proActAndBatState/stateEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(WOM.proActiveAndBatchState.proActAndBatState.stateEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(WOM.proActiveAndBatchState.proActAndBatState.stateEdit.dialog._el).load('/WOM/proActiveAndBatchState/proActAndBatState/stateEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	WOM.proActiveAndBatchState.proActAndBatState.stateEdit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		WOM.proActiveAndBatchState.proActAndBatState.stateEdit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		WOM.proActiveAndBatchState.proActAndBatState.stateEdit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			WOM.proActiveAndBatchState.proActAndBatState.stateEdit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	WOM.proActiveAndBatchState.proActAndBatState.stateEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'WOM_proActiveAndBatchState_proActAndBatState_stateEdit' + '_' + extraFrameParam;
		var callbackName="";
		WOM.proActiveAndBatchState.proActAndBatState.stateEdit._prefix = '';
		WOM.proActiveAndBatchState.proActAndBatState.stateEdit._oGrid = oGrid;
		WOM.proActiveAndBatchState.proActAndBatState.stateEdit._sUrl = url;
		if(customCallBack){
			WOM.proActiveAndBatchState.proActAndBatState.stateEdit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			WOM.proActiveAndBatchState.proActAndBatState.stateEdit.gridEventObj = gridEventObj;
			callbackName = "WOM.proActiveAndBatchState.proActAndBatState.stateEdit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				WOM.proActiveAndBatchState.proActAndBatState.stateEdit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "WOM.proActiveAndBatchState.proActAndBatState.stateEdit.getMultiselectCallBackInfo_DG" : "WOM.proActiveAndBatchState.proActAndBatState.stateEdit.getcallBackInfo_DG";
			WOM.proActiveAndBatchState.proActAndBatState.stateEdit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				WOM.proActiveAndBatchState.proActAndBatState.stateEdit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="WOM.proActiveAndBatchState.proActAndBatState.stateEdit.getcallBackInfo";
		}
		if(WOM.proActiveAndBatchState.proActAndBatState.stateEdit._prefix!=''){
			WOM.proActiveAndBatchState.proActAndBatState.stateEdit._prefix = WOM.proActiveAndBatchState.proActAndBatState.stateEdit._prefix.substring(1);
		}
		if(WOM.proActiveAndBatchState.proActAndBatState.stateEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.proActiveAndBatchState.proActAndBatState.stateEdit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof WOM.proActiveAndBatchState.proActAndBatState.stateEdit._querycustomFuncN == "function") {
				refparam += WOM.proActiveAndBatchState.proActAndBatState.stateEdit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		WOM.proActiveAndBatchState.proActAndBatState.stateEdit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	WOM.proActiveAndBatchState.proActAndBatState.stateEdit._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.proActiveAndBatchState.proActAndBatState.stateEdit.query_"+obj+")!='undefined'") ? eval('WOM.proActiveAndBatchState.proActAndBatState.stateEdit.query_'+obj+'()') : null;
		return str;
	
	};
	
	WOM.proActiveAndBatchState.proActAndBatState.stateEdit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('WOM_proActiveAndBatchState_proActAndBatState_stateEdit_form',obj[0], WOM.proActiveAndBatchState.proActAndBatState.stateEdit._prefix, WOM.proActiveAndBatchState.proActAndBatState.stateEdit._sUrl);
		CUI.commonFills('WOM_proActiveAndBatchState_proActAndBatState_stateEdit_form',WOM.proActiveAndBatchState.proActAndBatState.stateEdit._prefix,obj[0]);

		try{
			if(WOM.proActiveAndBatchState.proActAndBatState.stateEdit._customCallBack) {
				eval(WOM.proActiveAndBatchState.proActAndBatState.stateEdit._customCallBack);
				WOM.proActiveAndBatchState.proActAndBatState.stateEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			WOM.proActiveAndBatchState.proActAndBatState.stateEdit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	WOM.proActiveAndBatchState.proActAndBatState.stateEdit.getcallBackInfo_DG_IE = function(obj){
		if(WOM.proActiveAndBatchState.proActAndBatState.stateEdit._customBeforeCallBack) {
			var flag = eval(WOM.proActiveAndBatchState.proActAndBatState.stateEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = WOM.proActiveAndBatchState.proActAndBatState.stateEdit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,WOM.proActiveAndBatchState.proActAndBatState.stateEdit._sUrl);
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
			if(WOM.proActiveAndBatchState.proActAndBatState.stateEdit._customCallBack) {
				eval(WOM.proActiveAndBatchState.proActAndBatState.stateEdit._customCallBack);
				WOM.proActiveAndBatchState.proActAndBatState.stateEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			WOM.proActiveAndBatchState.proActAndBatState.stateEdit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	WOM.proActiveAndBatchState.proActAndBatState.stateEdit.getcallBackInfo_DG = function(obj){
		if(WOM.proActiveAndBatchState.proActAndBatState.stateEdit._customBeforeCallBack) {
			var flag = eval(WOM.proActiveAndBatchState.proActAndBatState.stateEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(WOM.proActiveAndBatchState.proActAndBatState.stateEdit._currRow).next().length==0){
					WOM.proActiveAndBatchState.proActAndBatState.stateEdit._oGrid.addNewRow();
				}	
				WOM.proActiveAndBatchState.proActAndBatState.stateEdit._currRow = $(WOM.proActiveAndBatchState.proActAndBatState.stateEdit._currRow).next();
				$(WOM.proActiveAndBatchState.proActAndBatState.stateEdit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(WOM.proActiveAndBatchState.proActAndBatState.stateEdit._currRow,obj[i],WOM.proActiveAndBatchState.proActAndBatState.stateEdit._prefix,WOM.proActiveAndBatchState.proActAndBatState.stateEdit._sUrl);
			eval("CUI.commonFills_DG(WOM.proActiveAndBatchState.proActAndBatState.stateEdit._currRow,WOM.proActiveAndBatchState.proActAndBatState.stateEdit._prefix,obj[i],WOM.proActiveAndBatchState.proActAndBatState.stateEdit._oGrid)");
		}
		try{
			if(WOM.proActiveAndBatchState.proActAndBatState.stateEdit._customCallBack) {
				eval(WOM.proActiveAndBatchState.proActAndBatState.stateEdit._customCallBack);
				WOM.proActiveAndBatchState.proActAndBatState.stateEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			WOM.proActiveAndBatchState.proActAndBatState.stateEdit._dialog.close();
		} catch(e){}
	};
	
	WOM.proActiveAndBatchState.proActAndBatState.stateEdit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(WOM.proActiveAndBatchState.proActAndBatState.stateEdit._oGrid, WOM.proActiveAndBatchState.proActAndBatState.stateEdit._currRow, WOM.proActiveAndBatchState.proActAndBatState.stateEdit._key, WOM.proActiveAndBatchState.proActAndBatState.stateEdit._displayFieldName, obj[i])
		}
		try{
			if(WOM.proActiveAndBatchState.proActAndBatState.stateEdit._customCallBack) {
				eval(WOM.proActiveAndBatchState.proActAndBatState.stateEdit._customCallBack);
				WOM.proActiveAndBatchState.proActAndBatState.stateEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			WOM.proActiveAndBatchState.proActAndBatState.stateEdit._dialog.close();
		} catch(e){}
	};
	
	WOM.proActiveAndBatchState.proActAndBatState.stateEdit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			WOM.proActiveAndBatchState.proActAndBatState.stateEdit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#WOM_proActiveAndBatchState_proActAndBatState_stateEdit_form'));
        			}
        	   	}
        	}
      	});
	};
	WOM.proActiveAndBatchState.proActAndBatState.stateEdit.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	WOM.proActiveAndBatchState.proActAndBatState.stateEdit.initCount = 0;
	WOM.proActiveAndBatchState.proActAndBatState.stateEdit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#WOM_stateEdit_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('WOM_proActiveAndBatchState_proActAndBatState_stateEdit_datagrids');	
		var	conHeight = h-$("#WOM_proActiveAndBatchState_proActAndBatState_stateEdit_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#WOM_proActiveAndBatchState_proActAndBatState_stateEdit_main_div .edit-panes-s").each(function(index){
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
							if(WOM.proActiveAndBatchState.proActAndBatState.stateEdit.initCount <= 2) {
								setTimeout(function(){WOM.proActiveAndBatchState.proActAndBatState.stateEdit.initSize();}, 200);
								WOM.proActiveAndBatchState.proActAndBatState.stateEdit.initCount++;
							}/* else {
								WOM.proActiveAndBatchState.proActAndBatState.stateEdit.initCount = 0;
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
		WOM.proActiveAndBatchState.proActAndBatState.stateEdit.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    WOM.proActiveAndBatchState.proActAndBatState.stateEdit.initSize(index);
		});
		$(window).bind("dialog.resize",function(){WOM.proActiveAndBatchState.proActAndBatState.stateEdit.initSize();});
	});
</script>
<script type="text/javascript">
	

	/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_proActiveAndBatchState_stateEdit,js,WOM_7.5.0.0_proActiveAndBatchState_ProActAndBatState,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>