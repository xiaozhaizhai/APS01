<!-- WOM_7.5.0.0/procFeedback/craftRecordsEdit -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1540981599094')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_procFeedback_craftRecordsEdit,head,WOM_7.5.0.0_procFeedback_CraftRecords,WOM_7.5.0.0) -->
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
	CUI.ns('WOM.procFeedback.craftRecords.craftRecordsEdit');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "WOM_procFeedback_craftRecords">
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
<#assign callbackName ="WOM.procFeedback.craftRecords.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="WOM_procFeedback_craftRecords_craftRecordsEdit_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="WOM_procFeedback_craftRecords_craftRecordsEdit_form" cssStyle="height:100%;" hiddenField="craftRecords.header.id,craftRecords.standardCraft.id," onsubmitMethod="WOM.procFeedback.craftRecords.craftRecordsEdit.beforeSubmitMethod()" ecAction="/WOM/procFeedback/craftRecords/craftRecordsEdit/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="craftRecordsEdit">
	<input type="hidden" name="viewCode" value="WOM_7.5.0.0_procFeedback_craftRecordsEdit">
	<input type="hidden" name="datagridKey" value="WOM_procFeedback_craftRecords_craftRecordsEdit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="craftRecords.version" value="${(craftRecords.version)!0}" />
	<input type="hidden" name="craftRecords.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
		<input type="hidden" name="craftRecords.header.id" value="${(craftRecords.header.id)!""}"/>
		<input type="hidden" name="craftRecords.standardCraft.id" value="${(craftRecords.standardCraft.id)!""}"/>
	<div id="WOM_craftRecordsEdit_edit_div" style="height:100%">
		<div id="WOM_procFeedback_craftRecords_craftRecordsEdit_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "WOM_procFeedback_craftRecords_craftRecordsEdit_form"+"_attcount";
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
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1541034087253')}" >${getText('WOM.propertydisplayName.randon1541034087253')}</label>
				</td>
				
						<#assign craftRecords_standardCraft_craftName_defaultValue  = ''>
														<#assign craftRecords_standardCraft_craftName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('WOM.viewtitle.randon1541040976766')}" viewType="readonly" deValue="${craftRecords_standardCraft_craftName_defaultValue!}" conditionfunc="WOM.procFeedback.craftRecords.craftRecordsEdit._querycustomFunc('craftRecords_standardCraft_craftName')" view=true  value="${(craftRecords.standardCraft.craftName)!}" displayFieldName="craftName" name="craftRecords.standardCraft.craftName" id="craftRecords_standardCraft_craftName" type="other" url="/WOM/procFeedback/craftStandards/craftStandardRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_procFeedback_craftRecords_craftRecordsEdit_form" editCustomCallback=";" refViewCode="WOM_7.5.0.0_procFeedback_craftStandardRef"  onkeyupfuncname=";_callback_craftRecords_standardCraft_craftName(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(craftRecords.id)?? && (craftRecords.standardCraft.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${craftRecords.standardCraft.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_procFeedback_craftRecords_craftRecordsEdit_form',obj, 'craftRecords.standardCraft', '/WOM/procFeedback/craftStandards/craftStandardRef.action');
												CUI.commonFills('WOM_procFeedback_craftRecords_craftRecordsEdit_form', 'craftRecords.standardCraft',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1541034112568')}" >${getText('WOM.propertydisplayName.randon1541034112568')}</label>
				</td>
				
						<#assign craftRecords_standardCraft_standardValue_defaultValue  = ''>
														<#assign craftRecords_standardCraft_standardValue_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="craftRecords.standardCraft.standardValue" id="craftRecords_standardCraft_standardValue"  style=";" originalvalue="<#if newObj&& !(craftRecords.standardCraft.standardValue)?has_content>${craftRecords_standardCraft_standardValue_defaultValue!}<#elseif (craftRecords.standardCraft.standardValue)?has_content>#{(craftRecords.standardCraft.standardValue)!; m6M6}</#if>" value="<#if newObj&& !(craftRecords.standardCraft.standardValue)?has_content>${craftRecords_standardCraft_standardValue_defaultValue!}<#elseif (craftRecords.standardCraft.standardValue)?has_content>#{(craftRecords.standardCraft.standardValue)!; m6M6}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1540953974241')}" >${getText('WOM.propertydisplayName.randon1540953974241')}</label>
				</td>
				
						<#assign craftRecords_recordStartTime_defaultValue  = 'currentTime'>
							 					<#if (craftRecords_recordStartTime_defaultValue)?? &&(craftRecords_recordStartTime_defaultValue)?has_content>
							<#assign craftRecords_recordStartTime_defaultValue  = getDefaultDateTime(craftRecords_recordStartTime_defaultValue!)?datetime>
					</#if>
					<td  nullable=false class="edit-table-content" celltype="DATETIME"  colspan="2" align="left" style="text-align: left;;" >
					
							
							<#if newObj && !(craftRecords.recordStartTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="craftRecords.recordStartTime" value="${craftRecords_recordStartTime_defaultValue!}" type="dateTime"  id="craftRecords.recordStartTime"  cssStyle=""   align="left"/>
								
							<#else>
							<#if (craftRecords.recordStartTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="craftRecords.recordStartTime" value="${craftRecords.recordStartTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="craftRecords.recordStartTime"  cssStyle="" align="left"  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="craftRecords.recordStartTime" value="" type="dateTime" id="craftRecords.recordStartTime" cssStyle=""  align="left"/>
								
							</#if>
							</#if>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1540961339757')}" >${getText('WOM.propertydisplayName.randon1540961339757')}</label>
				</td>
				
						<#assign craftRecords_recordEndTime_defaultValue  = ''>
							 							<#assign craftRecords_recordEndTime_defaultValue  = ''>
					<#if (craftRecords_recordEndTime_defaultValue)?? &&(craftRecords_recordEndTime_defaultValue)?has_content>
							<#assign craftRecords_recordEndTime_defaultValue  = getDefaultDateTime(craftRecords_recordEndTime_defaultValue!)?datetime>
					</#if>
					<td  nullable=false class="edit-table-content" celltype="DATETIME"  colspan="2" align="left" style="text-align: left;;" >
					
							
							<#if newObj && !(craftRecords.recordEndTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="craftRecords.recordEndTime" value="${craftRecords_recordEndTime_defaultValue!}" type="dateTime"  id="craftRecords.recordEndTime"  cssStyle=""   align="left"/>
								
							<#else>
							<#if (craftRecords.recordEndTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="craftRecords.recordEndTime" value="${craftRecords.recordEndTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="craftRecords.recordEndTime"  cssStyle="" align="left"  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="craftRecords.recordEndTime" value="" type="dateTime" id="craftRecords.recordEndTime" cssStyle=""  align="left"/>
								
							</#if>
							</#if>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1540953800378')}" >${getText('WOM.propertydisplayName.randon1540953800378')}</label>
				</td>
				
						<#assign craftRecords_actualValue_defaultValue  = ''>
							 							<#assign craftRecords_actualValue_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="craftRecords.actualValue" id="craftRecords_actualValue"  style=";" originalvalue="<#if newObj&& !(craftRecords.actualValue)?has_content>${craftRecords_actualValue_defaultValue!}<#elseif (craftRecords.actualValue)?has_content>#{(craftRecords.actualValue)!; m6M6}</#if>" value="<#if newObj&& !(craftRecords.actualValue)?has_content>${craftRecords_actualValue_defaultValue!}<#elseif (craftRecords.actualValue)?has_content>#{(craftRecords.actualValue)!; m6M6}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#craftRecords_actualValue').unbind('blur').bind('blur',function(){
										var percision = 6;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("WOM.propertydisplayName.randon1540953800378")}')}");
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
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1540961366516')}" >${getText('WOM.propertydisplayName.randon1540961366516')}</label>
				</td>
				
						<#assign craftRecords_remark_defaultValue  = ''>
							 							<#assign craftRecords_remark_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="2" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="craftRecords.remark" id="craftRecords_remark"  style=";" originalvalue="<#if !newObj || (craftRecords.remark)?has_content>${(craftRecords.remark?html)!}<#else>${craftRecords_remark_defaultValue!}</#if>" value="<#if !newObj || (craftRecords.remark)?has_content>${(craftRecords.remark?html)!}<#else>${craftRecords_remark_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
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
	<table class="edit-table" style="display : none">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:30%'></td><td style='height:0px;border:none;width:37%'></td><td style='height:0px;border:none;width:30%'></td></tr>
		<tr class="dialog_tr">
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1541034907538')}" >${getText('WOM.propertydisplayName.randon1541034907538')}</label>
				</td>
				
						<#assign craftRecords_standardID_defaultValue  = ''>
							 							<#assign craftRecords_standardID_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="LONG" name="craftRecords.standardID" id="craftRecords_standardID"  style=";" originalvalue="<#if !newObj || (craftRecords.standardID)?has_content>${(craftRecords.standardID?html)!}<#else>${craftRecords_standardID_defaultValue!}</#if>" value="<#if !newObj || (craftRecords.standardID)?has_content>${(craftRecords.standardID?html)!}<#else>${craftRecords_standardID_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('ec.common.ID')}" >${getText('ec.common.ID')}</label>
				</td>
				
						<#assign craftRecords_header_id_defaultValue  = ''>
														<#assign craftRecords_header_id_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="LONG" mneenable=false reftitle="${getText('WOM.viewtitle.randon1541036230940')}" viewType="readonly" deValue="${craftRecords_header_id_defaultValue!}" conditionfunc="WOM.procFeedback.craftRecords.craftRecordsEdit._querycustomFunc('craftRecords_header_id')" view=true  value="${(craftRecords.header.id)!}" displayFieldName="id" name="craftRecords.header.id" id="craftRecords_header_id" type="other" url="/WOM/procFeedback/procFeedbackHead/procFeedbackRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_procFeedback_craftRecords_craftRecordsEdit_form" editCustomCallback=";" refViewCode="WOM_7.5.0.0_procFeedback_procFeedbackRef"  onkeyupfuncname=";_callback_craftRecords_header_id(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(craftRecords.id)?? && (craftRecords.header.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${craftRecords.header.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_procFeedback_craftRecords_craftRecordsEdit_form',obj, 'craftRecords.header', '/WOM/procFeedback/procFeedbackHead/procFeedbackRef.action');
												CUI.commonFills('WOM_procFeedback_craftRecords_craftRecordsEdit_form', 'craftRecords.header',obj,true);
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
<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_procFeedback_craftRecordsEdit,html,WOM_7.5.0.0_procFeedback_CraftRecords,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	WOM.procFeedback.craftRecords.craftRecordsEdit.beforeSaveProcess = function(){}
	WOM.procFeedback.craftRecords.craftRecordsEdit.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(WOM.procFeedback.craftRecords.craftRecordsEdit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#WOM_procFeedback_craftRecords_craftRecordsEdit_form').trigger('beforeSubmit');
		//craftRecords.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="craftRecords.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#WOM_procFeedback_craftRecords_craftRecordsEdit_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#WOM_procFeedback_craftRecords_craftRecordsEdit_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	WOM.procFeedback.craftRecords.craftRecordsEdit.validate = function(){
		return true;
	}
	
	
	//打印
	WOM.procFeedback.craftRecords.craftRecordsEdit.print = function(url){
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
		
		WOM.procFeedback.craftRecords.craftRecordsEdit.saveSetting = function(){
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
		WOM.procFeedback.craftRecords.craftRecordsEdit.printSetting = function(){
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
			WOM.procFeedback.craftRecords.craftRecordsEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(WOM.procFeedback.craftRecords.craftRecordsEdit.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				WOM.procFeedback.craftRecords.craftRecordsEdit.settingDialog.show();
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
			WOM.procFeedback.craftRecords.craftRecordsEdit._customCallBack = customCallBack;
		}
		WOM.procFeedback.craftRecords.craftRecordsEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#WOM_procFeedback_craftRecords_craftRecordsEdit_fileupload').length == 0) {
				$('body').append('<div id="WOM_procFeedback_craftRecords_craftRecordsEdit_fileupload"></div>');
			}
			WOM.procFeedback.craftRecords.craftRecordsEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "WOM_procFeedback_craftRecords_craftRecordsEdit_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#WOM_procFeedback_craftRecords_craftRecordsEdit_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			WOM.procFeedback.craftRecords.craftRecordsEdit.infoDialog.show();
			if($('#WOM_procFeedback_craftRecords_craftRecordsEdit_fileupload').html() == '') {
				$('#WOM_procFeedback_craftRecords_craftRecordsEdit_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=WOM_procFeedback_craftRecords&entityCode=WOM_7.5.0.0_procFeedback&dialogId="+dialogId);
			}
		}
	//参照复制函数
	WOM.procFeedback.craftRecords.craftRecordsEdit.referenceCopy = function(objName,url, dialog){
		var callbackName ="WOM.procFeedback.craftRecords.craftRecordsEdit.referenceCopyBackInfo";
		WOM.procFeedback.craftRecords.craftRecordsEdit.dialog = dialog;
		WOM.procFeedback.craftRecords.craftRecordsEdit._dialog = foundation.common.select({
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
	
	WOM.procFeedback.craftRecords.craftRecordsEdit.referenceCopyBackInfo = function(obj){
		if(WOM.procFeedback.craftRecords.craftRecordsEdit._dialog){
			WOM.procFeedback.craftRecords.craftRecordsEdit._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,WOM.procFeedback.craftRecords.craftRecordsEdit.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('WOM_procFeedback_craftRecords_craftRecordsEdit_form','WOM_procFeedback_craftRecords_craftRecordsEdit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(WOM.procFeedback.craftRecords.craftRecordsEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(WOM.procFeedback.craftRecords.craftRecordsEdit.dialog._el).load('/WOM/procFeedback/craftRecords/craftRecordsEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( WOM.procFeedback.craftRecords.craftRecordsEdit.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + WOM.procFeedback.craftRecords.craftRecordsEdit.dialog._config.iframe, WOM.procFeedback.craftRecords.craftRecordsEdit.dialog._dialog ).prop( 'src', '/WOM/procFeedback/craftRecords/craftRecordsEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(WOM.procFeedback.craftRecords.craftRecordsEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(WOM.procFeedback.craftRecords.craftRecordsEdit.dialog._el).load('/WOM/procFeedback/craftRecords/craftRecordsEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	WOM.procFeedback.craftRecords.craftRecordsEdit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		WOM.procFeedback.craftRecords.craftRecordsEdit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		WOM.procFeedback.craftRecords.craftRecordsEdit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			WOM.procFeedback.craftRecords.craftRecordsEdit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	WOM.procFeedback.craftRecords.craftRecordsEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'WOM_procFeedback_craftRecords_craftRecordsEdit' + '_' + extraFrameParam;
		var callbackName="";
		WOM.procFeedback.craftRecords.craftRecordsEdit._prefix = '';
		WOM.procFeedback.craftRecords.craftRecordsEdit._oGrid = oGrid;
		WOM.procFeedback.craftRecords.craftRecordsEdit._sUrl = url;
		if(customCallBack){
			WOM.procFeedback.craftRecords.craftRecordsEdit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			WOM.procFeedback.craftRecords.craftRecordsEdit.gridEventObj = gridEventObj;
			callbackName = "WOM.procFeedback.craftRecords.craftRecordsEdit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				WOM.procFeedback.craftRecords.craftRecordsEdit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "WOM.procFeedback.craftRecords.craftRecordsEdit.getMultiselectCallBackInfo_DG" : "WOM.procFeedback.craftRecords.craftRecordsEdit.getcallBackInfo_DG";
			WOM.procFeedback.craftRecords.craftRecordsEdit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				WOM.procFeedback.craftRecords.craftRecordsEdit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="WOM.procFeedback.craftRecords.craftRecordsEdit.getcallBackInfo";
		}
		if(WOM.procFeedback.craftRecords.craftRecordsEdit._prefix!=''){
			WOM.procFeedback.craftRecords.craftRecordsEdit._prefix = WOM.procFeedback.craftRecords.craftRecordsEdit._prefix.substring(1);
		}
		if(WOM.procFeedback.craftRecords.craftRecordsEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.procFeedback.craftRecords.craftRecordsEdit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof WOM.procFeedback.craftRecords.craftRecordsEdit._querycustomFuncN == "function") {
				refparam += WOM.procFeedback.craftRecords.craftRecordsEdit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		WOM.procFeedback.craftRecords.craftRecordsEdit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	WOM.procFeedback.craftRecords.craftRecordsEdit._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.procFeedback.craftRecords.craftRecordsEdit.query_"+obj+")!='undefined'") ? eval('WOM.procFeedback.craftRecords.craftRecordsEdit.query_'+obj+'()') : null;
		return str;
	
	};
	
	WOM.procFeedback.craftRecords.craftRecordsEdit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('WOM_procFeedback_craftRecords_craftRecordsEdit_form',obj[0], WOM.procFeedback.craftRecords.craftRecordsEdit._prefix, WOM.procFeedback.craftRecords.craftRecordsEdit._sUrl);
		CUI.commonFills('WOM_procFeedback_craftRecords_craftRecordsEdit_form',WOM.procFeedback.craftRecords.craftRecordsEdit._prefix,obj[0]);

		try{
			if(WOM.procFeedback.craftRecords.craftRecordsEdit._customCallBack) {
				eval(WOM.procFeedback.craftRecords.craftRecordsEdit._customCallBack);
				WOM.procFeedback.craftRecords.craftRecordsEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			WOM.procFeedback.craftRecords.craftRecordsEdit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	WOM.procFeedback.craftRecords.craftRecordsEdit.getcallBackInfo_DG_IE = function(obj){
		if(WOM.procFeedback.craftRecords.craftRecordsEdit._customBeforeCallBack) {
			var flag = eval(WOM.procFeedback.craftRecords.craftRecordsEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = WOM.procFeedback.craftRecords.craftRecordsEdit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,WOM.procFeedback.craftRecords.craftRecordsEdit._sUrl);
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
			if(WOM.procFeedback.craftRecords.craftRecordsEdit._customCallBack) {
				eval(WOM.procFeedback.craftRecords.craftRecordsEdit._customCallBack);
				WOM.procFeedback.craftRecords.craftRecordsEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			WOM.procFeedback.craftRecords.craftRecordsEdit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	WOM.procFeedback.craftRecords.craftRecordsEdit.getcallBackInfo_DG = function(obj){
		if(WOM.procFeedback.craftRecords.craftRecordsEdit._customBeforeCallBack) {
			var flag = eval(WOM.procFeedback.craftRecords.craftRecordsEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(WOM.procFeedback.craftRecords.craftRecordsEdit._currRow).next().length==0){
					WOM.procFeedback.craftRecords.craftRecordsEdit._oGrid.addNewRow();
				}	
				WOM.procFeedback.craftRecords.craftRecordsEdit._currRow = $(WOM.procFeedback.craftRecords.craftRecordsEdit._currRow).next();
				$(WOM.procFeedback.craftRecords.craftRecordsEdit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(WOM.procFeedback.craftRecords.craftRecordsEdit._currRow,obj[i],WOM.procFeedback.craftRecords.craftRecordsEdit._prefix,WOM.procFeedback.craftRecords.craftRecordsEdit._sUrl);
			eval("CUI.commonFills_DG(WOM.procFeedback.craftRecords.craftRecordsEdit._currRow,WOM.procFeedback.craftRecords.craftRecordsEdit._prefix,obj[i],WOM.procFeedback.craftRecords.craftRecordsEdit._oGrid)");
		}
		try{
			if(WOM.procFeedback.craftRecords.craftRecordsEdit._customCallBack) {
				eval(WOM.procFeedback.craftRecords.craftRecordsEdit._customCallBack);
				WOM.procFeedback.craftRecords.craftRecordsEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			WOM.procFeedback.craftRecords.craftRecordsEdit._dialog.close();
		} catch(e){}
	};
	
	WOM.procFeedback.craftRecords.craftRecordsEdit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(WOM.procFeedback.craftRecords.craftRecordsEdit._oGrid, WOM.procFeedback.craftRecords.craftRecordsEdit._currRow, WOM.procFeedback.craftRecords.craftRecordsEdit._key, WOM.procFeedback.craftRecords.craftRecordsEdit._displayFieldName, obj[i])
		}
		try{
			if(WOM.procFeedback.craftRecords.craftRecordsEdit._customCallBack) {
				eval(WOM.procFeedback.craftRecords.craftRecordsEdit._customCallBack);
				WOM.procFeedback.craftRecords.craftRecordsEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			WOM.procFeedback.craftRecords.craftRecordsEdit._dialog.close();
		} catch(e){}
	};
	
	WOM.procFeedback.craftRecords.craftRecordsEdit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			WOM.procFeedback.craftRecords.craftRecordsEdit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#WOM_procFeedback_craftRecords_craftRecordsEdit_form'));
        			}
        	   	}
        	}
      	});
	};
	(function($){
		$(function(){
			if (!$("#WOM_procFeedback_craftRecords_craftRecordsEdit_form #id").val()){
	var ptObj;
	if ($("input[name='procFeedbackHead.adjustDealRecord.recordDataSource.id']").val() == "womActiveSource/04" || $("input[name='procFeedbackHead.adjustDealRecord.recordDataSource.id']").val() == "womActiveSource/03") {
		ptObj = CraftStandards_dg1542186009188Widget
	}else{
		var activeType = $("input[name='procFeedbackHead.processActive.activeType.id']").val();
		if (activeType == "activeType/activeType3" || activeType == "activeType/activeType1") { //投料
			ptObj = CraftStandards_dg1541073013999Widget
		}else if(activeType == "activeType/activeType2"){//配料
			ptObj = CraftStandards_dg1540988573983Widget;
		}
	}

	

	if (ptObj.getSelectedRow() != undefined) {
		var selectedStandardId = ptObj.getCellValue(ptObj.getSelectedRow(),'id');
		$("input[name='craftRecords.standardID']").val(selectedStandardId)
		$("input[name='craftRecords.header.id']").val($("#id").val())
		$("input[name='craftRecords.standardCraft.craftName']").val(ptObj.getCellValue(ptObj.getSelectedRow(),'craftName'))
		$("input[name='craftRecords.standardCraft.standardValue']").val(ptObj.getCellValue(ptObj.getSelectedRow(),'standardValue'))
	}else {
		
	}
}
		});
	})(jQuery);
	WOM.procFeedback.craftRecords.craftRecordsEdit.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	WOM.procFeedback.craftRecords.craftRecordsEdit.initCount = 0;
	WOM.procFeedback.craftRecords.craftRecordsEdit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#WOM_craftRecordsEdit_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('WOM_procFeedback_craftRecords_craftRecordsEdit_datagrids');	
		var	conHeight = h-$("#WOM_procFeedback_craftRecords_craftRecordsEdit_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#WOM_procFeedback_craftRecords_craftRecordsEdit_main_div .edit-panes-s").each(function(index){
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
							if(WOM.procFeedback.craftRecords.craftRecordsEdit.initCount <= 2) {
								setTimeout(function(){WOM.procFeedback.craftRecords.craftRecordsEdit.initSize();}, 200);
								WOM.procFeedback.craftRecords.craftRecordsEdit.initCount++;
							}/* else {
								WOM.procFeedback.craftRecords.craftRecordsEdit.initCount = 0;
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
		WOM.procFeedback.craftRecords.craftRecordsEdit.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    WOM.procFeedback.craftRecords.craftRecordsEdit.initSize(index);
		});
		$(window).bind("dialog.resize",function(){WOM.procFeedback.craftRecords.craftRecordsEdit.initSize();});
	});
</script>
<script type="text/javascript">
	

	/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_procFeedback_craftRecordsEdit,js,WOM_7.5.0.0_procFeedback_CraftRecords,WOM_7.5.0.0) */
// 自定义代码
	var randgeEdit;
    /**
     * 保存完毕回调
     * @method WOM.procFeedback.craftRecords.callBackInfo
     */
    WOM.procFeedback.craftRecords.callBackInfo = function(res){
      if(res.dealSuccessFlag){
          if(res.operateType == 'save'){
              var viewselect = res.viewselect;
              var errorBarWidget = eval('WOM_procFeedback_craftRecords_' + viewselect + '_formDialogErrorBarWidget');
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
                  var selectedStandardId;
                  if ($("input[name='procFeedbackHead.adjustDealRecord.recordDataSource.id']").val() == "womActiveSource/04" || $("input[name='procFeedbackHead.adjustDealRecord.recordDataSource.id']").val() == "womActiveSource/03") {
                      selectedStandardId = CraftStandards_dg1542186009188Widget.getCellValue(CraftStandards_dg1542186009188Widget.getSelectedRow(),'id');
                      CraftRecords_dg1542186009283Widget._DT.setRequestDataUrl('/WOM/procFeedback/procFeedbackHead/data-dg1542186009283.action?procFeedbackHead.id='+$("#id").val() + "&standardID="+selectedStandardId)
                  }else{
                      var activeType = $("input[name='procFeedbackHead.processActive.activeType.id']").val();

                      var activeType;
                      if (activeType == "activeType/activeType3" || activeType == "activeType/activeType1") {
                          if (CraftStandards_dg1541073013999Widget.getSelectedRow() != undefined) {
                              selectedStandardId= CraftStandards_dg1541073013999Widget.getCellValue(CraftStandards_dg1541073013999Widget.getSelectedRow(),'id');
                              activeType= $("input[name='procFeedbackHead.processActive.activeType.id']").val();
                              CraftRecords_dg1541073014077Widget._DT.setRequestDataUrl('/WOM/procFeedback/procFeedbackHead/data-dg1541073014077.action?procFeedbackHead.id='+$("#id").val() + "&standardID="+selectedStandardId)
                          }else {

                          }

                      }else if(activeType == "activeType/activeType2"){
                          if (CraftStandards_dg1540988573983Widget.getSelectedRow() != undefined) {
                              selectedStandardId = CraftStandards_dg1540988573983Widget.getCellValue(CraftStandards_dg1540988573983Widget.getSelectedRow(),'id');
                              activeType = $("input[name='procFeedbackHead.processActive.activeType.id']").val();
                              CraftRecords_dg1541043071770Widget._DT.setRequestDataUrl('/WOM/procFeedback/procFeedbackHead/data-dg1541043071770.action?procFeedbackHead.id='+$("#id").val() + "&standardID="+selectedStandardId)
                          }else {

                          }

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