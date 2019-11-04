<!-- WOM_7.5.0.0/batchProduceTask/batchTastView -->
<#assign isWorkflow = true> 
<#assign isAttachment = true> 
	<#assign fileuploadType = "Table">
	<#assign fileuploadLinkId = batchProduceTask.tableInfoId!>
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
<#assign userJson= Session.user.toJSON()>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<#assign viewType = "readonly">
<#-- 实体对象 -->
<#assign tableObj = batchProduceTask>
<#-- 命名空间 -->
<#assign editPageNs = "WOM.batchProduceTask.batchProduceTask.batchTastView">
<#-- 模型名称-->
<#assign modelName = "batchProduceTask">
<#-- 视图编码-->
<#assign viewCode = "WOM_7.5.0.0_batchProduceTask_batchTastView">
<#-- 实体编码-->
<#assign entity_code = "WOM_7.5.0.0_batchProduceTask">
<#-- 视图名称-->
<#assign viewName = "batchTastView">
<#-- datagrid编码-->
<#assign datagridCode = "WOM_batchProduceTask_batchProduceTask_batchTastView_datagrids">
<#-- 首字母大写的模型名称-->
<#assign upcaseModelName = "BatchProduceTask">
<#-- 页面打印按钮 -->
<#assign isPrint = false>
<#-- 控件打印按钮 -->
<#assign controlPrint = false>
<#-- 是否只读 -->
<#assign allReadOnly = true>
<#-- 是否是参照视图 -->
<#assign isReference =false>
<#-- 是否可弃审 -->
<#assign retrialFlag = false>
<#-- formid -->
<#assign editFormId = "WOM_batchProduceTask_batchProduceTask_batchTastView_form">
<#-- 待办状态 -->
<#assign pendingstatus =( batchProduceTask.pending.taskDescription)!>
<#-- 打印控件名称 -->
<#assign controlName = "ec.print.controlPrint">
<#-- 批量？？ -->
<#assign isBatch = false>
<#assign payCloseAttention = false>
<#-- 自定义按钮 -->
<#assign operateButtons =[] >
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
	
		
	
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <#assign configTitle = getText('WOM.viewtitle.randon1496366125263')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		
		#WOM_batchProduceTask_batchProduceTask_batchTastView_form{float:left;width:100%;}
		
		
		</style>
		<script type="text/javascript">
			CUI.ns('WOM.batchProduceTask.batchProduceTask.batchTastView');
			WOM.batchProduceTask.batchProduceTask.batchTastView.currentUser = ${userJson};
			WOM.batchProduceTask.batchProduceTask.batchTastView.currentStaff = ${staffJson};
			WOM.batchProduceTask.batchProduceTask.batchTastView.currentDepartment = ${deptJson};
			WOM.batchProduceTask.batchProduceTask.batchTastView.currentPosition = ${postJson};
			WOM.batchProduceTask.batchProduceTask.batchTastView.currentCompany = ${compJson};
		</script>
		<!-- CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_batchProduceTask_batchTastView,head,WOM_7.5.0.0_batchProduceTask_BatchProduceTask,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
    </head>
	<body class="view-edit ">
		<@loadpanel newType=true/>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="batchProduceTask.staffID.id," onsubmitMethod="WOM.batchProduceTask.batchProduceTask.batchTastView.beforeSubmitMethod()" id="WOM_batchProduceTask_batchProduceTask_batchTastView_form" namespace="/WOM/batchProduceTask/batchProduceTask/batchTastView" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=WOM_7.5.0.0_batchProduceTask_BatchProduceTask&_bapFieldPermissonModelName_=BatchProduceTask&superEdit=${(superEdit!false)?string}" editPageNs="WOM.batchProduceTask.batchProduceTask.batchTastView" callback="WOM.batchProduceTask.batchProduceTask.batchTastView._callBackInfo" ecform="true">
			<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
			<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="WOM_batchProduceTask_batchProduceTask_batchTastView_main_div">
			<div class="edit-head">
				<#include "../../../ec/tableInfo/operateheadbar_all.ftl" >
				<#include "../../../ec/tableInfo/creatorInfo.ftl" >
			</div>
    		<div class="edit-main" id="WOM_batchProduceTask_batchProduceTask_batchTastView">
    			<div class="edit-content">
    	<#include "../../../ec/tableInfo/formparam.ftl" >				
					<input type="hidden" name="batchProduceTask.staffID.id" value="${(batchProduceTask.staffID.id)!""}" originalvalue="${(batchProduceTask.staffID.id)!""}"/>
		<div class="dash-line"></div>
<script type="text/javascript">
var attcountid = "WOM_batchProduceTask_batchProduceTask_batchTastView_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=WOM_7.5.0.0_batchProduceTask', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>				<div class="edit-panes edit-panes-w edit-container clearfix">
				<div class="cui-elements pd-top">

<div class="edit-panes-s" style="width:98%;margin-left:10px;">
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1495090009466')}" >${getText('WOM.propertydisplayName.randon1495090009466')}</label>
				</td>
				
						<#assign batchProduceTask_staffID_name_defaultValue  = 'currentUser'>
												<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.view.reference')}" viewType="${viewType!}" deValue="${batchProduceTask_staffID_name_defaultValue!}" conditionfunc="WOM.batchProduceTask.batchProduceTask.batchTastView._querycustomFunc('batchProduceTask_staffID_name')" view=true  value="${(batchProduceTask.staffID.name)!}" displayFieldName="name" name="batchProduceTask.staffID.name" id="batchProduceTask_staffID_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="WOM_batchProduceTask_batchProduceTask_batchTastView_form" editCustomCallback=";" refViewCode="sysbase_1.0_staff_ref" onkeyupfuncname=";_callback_batchProduceTask_staffID_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (batchProduceTask_staffID_name_defaultValue)=='currentUser'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.id}'};
											obj = foundation.common.getObject('WOM_batchProduceTask_batchProduceTask_batchTastView_form',obj, 'batchProduceTask.staffID', '/foundation/staff/common/staffListFrameset.action');
											CUI.commonFills('WOM_batchProduceTask_batchProduceTask_batchTastView_form', 'batchProduceTask.staffID',obj,true);
											$('input:hidden[name="batchProduceTask.staffID.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(batchProduceTask.id)?? && (batchProduceTask.staffID.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${batchProduceTask.staffID.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_batchProduceTask_batchProduceTask_batchTastView_form',obj, 'batchProduceTask.staffID', '/foundation/staff/common/staffListFrameset.action');
												CUI.commonFills('WOM_batchProduceTask_batchProduceTask_batchTastView_form', 'batchProduceTask.staffID',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1495090040714')}" >${getText('WOM.propertydisplayName.randon1495090040714')}</label>
				</td>
				
						<#assign batchProduceTask_makeTime_defaultValue  = 'currentTime'>
							 					<#if (batchProduceTask_makeTime_defaultValue)?? &&(batchProduceTask_makeTime_defaultValue)?has_content>
							<#assign batchProduceTask_makeTime_defaultValue  = getDefaultDateTime(batchProduceTask_makeTime_defaultValue!)?datetime>
					</#if>
					<td  nullable=false class="edit-table-content" celltype="DATETIME"  align="left" style="text-align: left;;" >
					
							
							<#if newObj && !(batchProduceTask.makeTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="batchProduceTask.makeTime" value="${batchProduceTask_makeTime_defaultValue!}" type="dateTime"  id="batchProduceTask.makeTime"  view=true cssStyle=""   align="left"/>
								
							<#else>
							<#if (batchProduceTask.makeTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="batchProduceTask.makeTime" value="${batchProduceTask.makeTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="batchProduceTask.makeTime"  view=true cssStyle="" align="left"  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="batchProduceTask.makeTime" value="" type="dateTime" id="batchProduceTask.makeTime" cssStyle=""  view=true align="left"/>
								
							</#if>
							</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1503904068848')}" >${getText('WOM.propertydisplayName.randon1503904068848')}</label>
				</td>
				
						<#assign batchProduceTask_taskType_defaultValue  = ''>
							 							<#assign batchProduceTask_taskType_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${batchProduceTask_taskType_defaultValue!}" formId="WOM_batchProduceTask_batchProduceTask_batchTastView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="batchProduceTask.taskType.id" code="womTaskType" value="${(batchProduceTask.taskType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="WOM_batchProduceTask_batchProduceTask_batchTastView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="batchProduceTask.taskType.id" code="womTaskType" value="${(batchProduceTask.taskType.id)!}"  />
									
								</#if>
							
				</td>
		</tr>
	</table>
		<#assign cpvmInfo = ''>
			<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_batchProduceTask_BatchProduceTask", "WOM_7.5.0.0_batchProduceTask_batchTastView", 'EDIT')>
			<#if customPropList?? && customPropList?size gte 1>
				<table class="edit-table" style="" cellspacing="0" cellpadding="0" border="0">
				<tr>
					<td style="width:13%;"></td><td style="width:20%;"></td>
					<td style="width:13%;"></td><td style="width:20%;"></td>
					<td style="width:13%;"></td><td style="width:20%;"></td>
				</tr>
			<tr>
				<#-- 排布自定义字段 -->
				<#assign totalspan = 0>
				<#list customPropList as c>
				<#assign cspan = (c.colspan!1)>
				<#if cspan gt 3>
					<#assign cspan = 3>
				</#if>
				<#if cspan gt 1>
					<#assign colspanVal = cspan * 2 - 1>
				</#if> 
				<#assign cp_index = c_index + totalspan>
				<#if (cp_index + 1) % 3 == 0>
					<#assign restcol = 1>
				<#else>
					<#assign restcol = 3 - (cp_index + 1) % 3 + 1>
				</#if>
				<#if (cp_index gt 0 && ((cp_index + 1) % 3 == 1 || 3 == 1)) || cspan gt restcol>
					<#if cspan gt restcol>
						<#assign totalspan = totalspan + restcol>
					</#if>
				</tr><tr>
				</#if>
				<#assign totalspan = totalspan + cspan - 1>
				<td nullable=<#if (c.nullable!false)>true<#else>false</#if> class="edit-table-symbol" <#if c.fieldType?? && c.fieldType == 'DATATIME'>celltype="DATATIME"</#if> style="text-align:right;">
					<label value="${getText('${c.displayName}')}">${getText('${c.displayName}')}</label>
				</td>
				<td nullable=<#if (c.nullable!false)>true<#else>false</#if> class="edit-table-content" <#if c.fieldType?? && c.fieldType == 'DATATIME'>celltype="DATATIME"</#if> <#if cspan gt 1>colspan="${colspanVal}"</#if> style="text-align:left;">
					<#assign columnType = c.property.type>
					<#assign columnName = c.property.name>
					<#assign decimalNum = (c.property.decimalNum!-1)>
					<#assign elementName = 'batchProduceTask' + "." + columnName>
					<#assign elementId = 'batchProduceTask' + "_" + columnName>
					<#if cpvmInfo?? && c.relatedKey?has_content>
					<#assign cpvmInfo = cpvmInfo + ',' + c.relatedKey + "||" + elementName>
					</#if>
					<#assign fieldType = c.fieldType>
					<#if fieldType == 'TEXTFIELD'>
					<div class="fix-input-readonly">
					<#if columnType == 'DECIMAL'>
						<#if c.precision??>
							<#assign decimalNum =c.precision!>
						</#if>
						<@s.hidden property_type="${columnType}" id="${elementName?replace('.', '_')}_hide" name="${elementName}" />
						<input property_type="${columnType}" type="text" id="${elementName?replace('.', '_')}" name="${elementName?replace('.', '_')}" class="cui-noborder-input numberField" <#if c.align??>style="text-align:${c.align?html};"</#if> readonly="readonly"  />
					<#elseif columnType == 'INTEGER'>
						<@s.textfield id="${elementName?replace('.', '_')}" name="${elementName}" cssClass="cui-noborder-input numberField" cssStyle="text-align:${c.align!}" readonly="true" />
					<#else>
						<@s.textfield id="${elementName?replace('.', '_')}" name="${elementName}" cssClass="cui-noborder-input" cssStyle="text-align:${c.align!}" readonly="true" />
					</#if>
					</div>
					<script type="text/javascript">
						$(function(){
							<#if columnType == 'DECIMAL'>
							var tmpVal = parseFloat($("#${elementName?replace('.', '_')}_hide").val());
							if (!isNaN(tmpVal)) {
								var percision = parseInt("${decimalNum}");
								var countVal = (percision > -1 ? tmpVal.toFixed(percision) : tmpVal);
								$("#${elementName?replace('.', '_')}_hide").val(countVal);
								$("#${elementName?replace('.', '_')}_hide").attr("originalvalue", countVal);
								<#if c.format == 'THOUSAND' || c.format == 'TEN_THOUSAND'>
								countVal = formatMoney(<#if c.format == 'THOUSAND'>3<#elseif c.format = 'TEN_THOUSAND'>4</#if>, countVal);
								<#elseif c.format == 'PERCENT'>
								if (percision > -1) {
									var tmpPercision = percision - 2 >= 0 ? percision - 2 : 0;
									countVal = (countVal * 100).toFixed(tmpPercision) + "%";
								} else {
									countVal = (countVal * 100) + "%";
								}
								</#if>
								$("#${elementName?replace('.', '_')}").val(countVal);
								$("#${elementName?replace('.', '_')}").attr('originalvalue', countVal);
							}
							</#if>
						});
					</script>
					<#elseif fieldType == 'TEXTAREA'>
						<div class="fix-input-readonly fix-ie7-textarea">
							<@s.textarea property_type="${columnType}" id="${elementName?replace('.', '_')}" name="${elementName}" rows="${c.textareaRow!3}" cssClass="cui-textarea-wh" cssStyle="border:0;line-height:16px;padding-left:2px;text-align:${c.align!}" readonly="true" onpropertychange="setTimeout(function(){autoTextarea('${elementName?replace('.', '_')}',null,null,true);}, 100);" oninput="setTimeout(function(){autoTextarea('${elementName?replace('.', '_')}',null,null,true);}, 100);" onkeyup="autoTextarea('${elementName?replace('.', '_')}',null,null,true);" />
						</div>
						<script type="text/javascript">
							$(function(){
								CUI["${elementName?replace('.', '_')}completeFlag"] = "first";
								autoTextarea("${elementName?replace('[^a-zA-Z0-9_]', '_', 'r')}");
								//有业务中心的时候,非ie浏览器需要手动再延迟触发一次
								if (YAHOO.env.ua.ie == 0) {
									setTimeout(function(){autoTextarea("${elementName?replace('.', '_')}")}, 200);
								}else{
									setTimeout(function(){autoTextarea("${elementName?replace('.', '_')}")}, 1000);
								}
							});
						</script>
					<#elseif fieldType == 'DATETIME' || fieldType == 'DATE'>
						<#assign dateType = ''>
						<#if c.format == 'YMD_H'>
							<#assign dateType = 'dateTimeHour'>
						<#elseif c.format == 'YMD_HM'>
							<#assign dateType = 'dateTimeMin'>
						<#elseif c.format == 'YMD'>
							<#assign dateType = 'date'>
						<#elseif c.format == 'YM'>
							<#assign dateType = 'yearMonth'>
						<#elseif c.format == 'Y'>
							<#assign dateType = 'year'>
						<#else>
							<#assign dateType = 'dateTime'>
						</#if>
						<#assign dateVal = ''>
						<#if batchProduceTask[columnName]??>
							<#assign dateVal = (batchProduceTask[columnName])?string('yyyy-MM-dd HH:mm:ss')>
						</#if>
						<@datepicker property_type="${columnType}" cssClass="cui-noborder-input" name="${elementName}" id="${elementName?replace('.', '_')}" value=dateVal type="${dateType}" align="${c.align!}" view=true />
					<#elseif fieldType == 'SELECTCOMP'>
						<#if columnType == 'SYSTEMCODE'>
							<#assign isS2 = false>
							<#if c.property.seniorSystemCode?? && c.property.seniorSystemCode>
								<#assign isS2 = true>
							</#if>
							<#assign isMultable = false>
							<#if c.property.multable?? && c.property.multable>
								<#assign isMultable = true>
							</#if>
							<@systemcode property_type="${columnType}" iscustom=true showType="${fieldType}" viewType=viewType cssStyle="text-align:${c.align!}" formId="WOM_batchProduceTask_batchProduceTask_batchTastView_form" classStyle="cui-noborder-input" view=true cssStyle="" ecFlag=true multable=isMultable name="${elementName}" code="${(c.property.fillcontentMap.fillContent)!}" value="${batchProduceTask[columnName]!}" seniorSystemCode=isS2 />
						<#else>
							<#assign displayColumnName = columnName + "MainDisplay">
							<#assign viewUrl = (c.refView.url)!''>
							<#assign viewTitle = (c.refView.title)!''>
							<#assign typeVal = ''>
							<#if viewUrl?? && viewUrl?index_of('/foundation/') gte 0 && viewUrl?index_of('/common/') gte 0 >
								<#assign viewSplitArr = viewUrl?split('/')>
								<#assign typeVal = viewSplitArr[2]>
							</#if>
							<#assign pkName = ''>
							<#assign mainDisplayName = ''>
							<#list c.property.associatedProperty.model.properties as p>
								<#if !pkName?has_content && p.isPk?? && p.isPk>
									<#assign pkName = p.name>
								</#if>
								<#if !mainDisplayName?has_content && p.isMainDisplay?? && p.isMainDisplay>
									<#assign mainDisplayName = p.name>
								</#if>
							</#list>
							<#if typeVal?? && typeVal?has_content>
								<#assign mneType = typeVal?cap_first>
							<#else>
								<#assign mneType = 'other'>
							</#if>
							<input type="hidden" iscustom="true" name="${elementName}" value="${batchProduceTask[columnName]!}" />
							<input type="hidden" name="${elementName}.${pkName!'id'}" value="${batchProduceTask[columnName]!}" />
							<@mneclient iframe=false property_type="${columnType}" mneenable=false reftitle="${getText('${viewTitle!}')}" viewType=viewType cssStyle="text-align:${c.align!}" view=true value="${batchProduceTask[displayColumnName]!}" name="${elementName}.${mainDisplayName!'name'}" id="${elementName?replace('.', '_')}_${mainDisplayName!'name'}" type="${mneType}" url="${viewUrl!}" clicked=true multiple=false isEdit=true mnewidth=260 formId="WOM_batchProduceTask_batchProduceTask_batchTastView_form" editCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}()" delCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}_delete()" />
							<script type="text/javascript">
								function callback_obj_cp_${elementName?replace('.', '_')}() {
									if ( $('input:hidden[name="${elementName}.${pkName!'id'}"]').val() ) {
										$('input:hidden[name="${elementName}"]').val( $('input:hidden[name="${elementName}.${pkName!'id'}"]').val() );
									}
								}
								function callback_obj_cp_${elementName?replace('.', '_')}_delete() {
									$('input:hidden[name="${elementName}.${pkName!'id'}"]').val('');
									$('input:hidden[name="${elementName}"]').val('');
									if ( $('#cp_info').length > 0 ) {
											var dg_cp_info = $('#cp_info').val();
											var infoArr = dg_cp_info.split(',');
											for (var n in infoArr) {
												var info = infoArr[n].split('||');
												var name = info[1];
												CUI('input[name="'+ name +'"]').val('');
											}
									}
								}
							</script>
						</#if>
					</#if>
				</td>
				</#list>
					<#if cpvmInfo?? && cpvmInfo?length gt 0>
						<#assign cpvmInfo = cpvmInfo?substring(1)>
						<input type="hidden" id="cp_info" value="${cpvmInfo!}" />
					</#if>
		</tr>
	</table>
	</#if>
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1495090125387')}" >${getText('WOM.propertydisplayName.randon1495090125387')}</label>
				</td>
				
						<#assign batchProduceTask_remark_defaultValue  = ''>
							 							<#assign batchProduceTask_remark_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly fix-ie7-textarea"><textarea property_type="TEXT" id="batchProduceTask_remark" originalvalue="<#if !newObj || (batchProduceTask.remark)?has_content>${(batchProduceTask.remark?html)!}<#else>${batchProduceTask_remark_defaultValue?html}</#if>"  name="batchProduceTask.remark" class="cui-noborder-textarea cui-textarea-auto" readonly="readonly" style=";" ><#if !newObj || (batchProduceTask.remark)?has_content>${(batchProduceTask.remark)!}<#else>${batchProduceTask_remark_defaultValue}</#if></textarea></div>
							
				</td>
		</tr>
	</table>
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
</div>				</div>
				<div class="edit-datatable">	

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
				
					<#if  refId?? && (refId > 0)>
						<#assign nodeExpanded = true>
					<#else>
						<#assign nodeExpanded = false>
					</#if>
					
				<#if newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign exportExcel=false>
				<#else>
				<#assign exportExcel=false>
				</#if>
			<#if false>
				<#assign routeFlag = "2">
			<#else>
				<#if false && isIE>
						<#assign routeFlag = "1">
				<#else>
						<#assign routeFlag = "0">
				</#if>
			</#if>

			<#assign cpObjHideKey = '' >
			<#assign cpvmInfo = ''>
								<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_batchProduceTask_BatchProdTaskPart", "WOM_7.5.0.0_batchProduceTask_batchTastViewdg1496366180645", "DATAGRID", "batchProdTaskPart")>
								<#list customPropViewMappings as cpvm>
									<#if cpvm.property.type == 'OBJECT' && cpObjHideKey?index_of(",'" +cpvm.propertyLayRec) lt 0>
										<#assign cpObjHideKey = cpObjHideKey + ",'" + cpvm.propertyLayRec + "'">
									</#if>
									<#if cpvm.propertyLayRec?index_of('.') lt 0 && cpvm.relatedKey?has_content>
										<#assign cpvmInfo = cpvmInfo + ',' + cpvm.relatedKey + "||" + cpvm.propertyLayRec>
										<#if cpvm.property.type == 'OBJECT'>
											<#assign cpvmInfo = cpvmInfo + "||" + cpvm.property.code>	
										</#if>
									</#if>
								</#list>
			
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/WOM/batchProduceTask/batchProduceTask/data-dg1496366180645.action?batchProduceTask.id=${refId!-1}&refId=${refId!-1}&datagridCode=WOM_7.5.0.0_batchProduceTask_batchTastViewdg1496366180645">
			<#else>
				<#assign dUrl="/WOM/batchProduceTask/batchProduceTask/data-dg1496366180645.action?batchProduceTask.id=${(batchProduceTask.id)!-1}&datagridCode=WOM_7.5.0.0_batchProduceTask_batchTastViewdg1496366180645">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_BatchProdTaskPart_dg1496366180645_deldatagrid();}}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_BatchProdTaskPart_dg1496366180645_deldatagrid();}}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_BatchProdTaskPart_dg1496366180645" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1496366180645_id" value="BatchProdTaskPart_dg1496366180645" />
			
			<input type="hidden" id="dg1496366180645_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('WOM.modelname.randon1495089930032')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/WOM/batchProduceTask/batchProduceTask/data-dg1496366180645.action?operateType=export&datagridCode=WOM_7.5.0.0_batchProduceTask_batchTastViewdg1496366180645"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="BatchProdTaskPart_dg1496366180645" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="BatchProdTaskPart_dg1496366180645" viewType="${viewType}" renderOverEvent="dg1496366180645RenderOverEvent" route="${routeFlag}" formId="WOM_batchProduceTask_batchProduceTask_batchTastView_form" noPermissionKeys="productId.productCode,productId.productName,productId.id,productNum,productBatchNum,factoryId.name,factoryId.id,formularId.code,formularId.name,formularId.id,bulkProduct.productCode,bulkProduct.productName,bulkProduct.id,bulkBatchNum.batchText,bulkBatchNum.id,bulkNum,bulkType,planStartTime,planEndTime,remark" modelCode="WOM_7.5.0.0_batchProduceTask_BatchProdTaskPart" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1496366180645" dtPage="dgPage"  hidekeyPrefix="dg1496366180645" hidekey="['id','version','productId.id','productId.productCode','productId.id','productId.productName','productId.id','productId.id','factoryId.id','factoryId.name','factoryId.id','factoryId.id','formularId.id','formularId.code','formularId.id','formularId.name','formularId.id','formularId.id','bulkProduct.id','bulkProduct.productCode','bulkProduct.id','bulkProduct.productName','bulkProduct.id','bulkProduct.id','bulkBatchNum.id','bulkBatchNum.batchText','bulkBatchNum.id','bulkBatchNum.id'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=false  buttons="${buttons}" noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1496366180645PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=false cannotDeleteRow=true assModelDisplayName=assModelDisplayName  activexButton="" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign productId_productCode_displayDefaultType=''>
								<#assign productId_productCode_defaultValue=''>
										<#assign productId_productCode_defaultValue=''>
																	<#if (productId_productCode_defaultValue!)?string=="currentUser">
								<#assign productId_productCode_defaultValue='${staffJson!}'>
							<#elseif (productId_productCode_defaultValue!)?string=="currentPost">
								<#assign productId_productCode_defaultValue='${postJson!}'>
							<#elseif (productId_productCode_defaultValue!)?string=="currentDepart">
								<#assign productId_productCode_defaultValue='${deptJson!}'>
							<#elseif (productId_productCode_defaultValue!)?string=="currentComp">
								<#assign productId_productCode_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="productId.productCode"        showFormat="SELECTCOMP" defaultValue="${(productId_productCode_defaultValue!)?string}" defaultDisplay="${(productId_productCode_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.batchProduceTask.batchProduceTask.batchTastView"  textalign="left"  viewUrl="/MESBasic/product/product/refProductLayout.action" viewCode="MESBasic_1_product_refProductLayout" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  label="${getText('WOM.propertydisplayName.radion14157726448334334')}" width=100 showFormatFunc=""  />
							<#assign productId_productName_displayDefaultType=''>
								<#assign productId_productName_defaultValue=''>
										<#assign productId_productName_defaultValue=''>
																	<#if (productId_productName_defaultValue!)?string=="currentUser">
								<#assign productId_productName_defaultValue='${staffJson!}'>
							<#elseif (productId_productName_defaultValue!)?string=="currentPost">
								<#assign productId_productName_defaultValue='${postJson!}'>
							<#elseif (productId_productName_defaultValue!)?string=="currentDepart">
								<#assign productId_productName_defaultValue='${deptJson!}'>
							<#elseif (productId_productName_defaultValue!)?string=="currentComp">
								<#assign productId_productName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="productId.productName"        showFormat="TEXT" defaultValue="${(productId_productName_defaultValue!)?string}" defaultDisplay="${(productId_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.batchProduceTask.batchProduceTask.batchTastView"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('WOM.propertydisplayName.radion1415772740737333344')}" width=100 showFormatFunc=""  />
							<#assign productId_id_displayDefaultType=''>
								<#assign productId_id_defaultValue=''>
										<#assign productId_id_defaultValue=''>
																	<#if (productId_id_defaultValue!)?string=="currentUser">
								<#assign productId_id_defaultValue='${staffJson!}'>
							<#elseif (productId_id_defaultValue!)?string=="currentPost">
								<#assign productId_id_defaultValue='${postJson!}'>
							<#elseif (productId_id_defaultValue!)?string=="currentDepart">
								<#assign productId_id_defaultValue='${deptJson!}'>
							<#elseif (productId_id_defaultValue!)?string=="currentComp">
								<#assign productId_id_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="productId.id"        showFormat="TEXT" defaultValue="${(productId_id_defaultValue!)?string}" defaultDisplay="${(productId_id_displayDefaultType!)?string}" decimal="" editable=false type="long" showType="long" notnull=false   selectCompName="WOM.batchProduceTask.batchProduceTask.batchTastView"  textalign="center" hiddenCol=true viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.randon1449796384550')}" width=100 showFormatFunc=""  />
							<#assign productNum_displayDefaultType=''>
								<#assign productNum_defaultValue=''>
										<#assign productNum_defaultValue=''>
										 
									<@datacolumn key="productNum"        showFormat="TEXT" defaultValue="${(productNum_defaultValue!)?string}" defaultDisplay="${(productNum_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1495090296499')}" width=100 showFormatFunc=""  />
							<#assign productBatchNum_displayDefaultType=''>
								<#assign productBatchNum_defaultValue=''>
										<#assign productBatchNum_defaultValue=''>
										 
									<@datacolumn key="productBatchNum"        showFormat="TEXT" defaultValue="${(productBatchNum_defaultValue!)?string}" defaultDisplay="${(productBatchNum_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1495090360495')}" width=120 showFormatFunc=""  />
							<#assign factoryId_name_displayDefaultType=''>
								<#assign factoryId_name_defaultValue=''>
										<#assign factoryId_name_defaultValue=''>
																	<#if (factoryId_name_defaultValue!)?string=="currentUser">
								<#assign factoryId_name_defaultValue='${staffJson!}'>
							<#elseif (factoryId_name_defaultValue!)?string=="currentPost">
								<#assign factoryId_name_defaultValue='${postJson!}'>
							<#elseif (factoryId_name_defaultValue!)?string=="currentDepart">
								<#assign factoryId_name_defaultValue='${deptJson!}'>
							<#elseif (factoryId_name_defaultValue!)?string=="currentComp">
								<#assign factoryId_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="factoryId.name"        showFormat="SELECTCOMP" defaultValue="${(factoryId_name_defaultValue!)?string}" defaultDisplay="${(factoryId_name_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.batchProduceTask.batchProduceTask.batchTastView"  textalign="left"  viewUrl="/MESBasic/factoryModel/factoryModel/factroyRef1.action" viewCode="MESBasic_1_factoryModel_factroyRef1" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.radion1419491307826')}"  label="${getText('WOM.propertydisplayName.randonpl5')}" width=100 showFormatFunc=""  />
							<#assign factoryId_id_displayDefaultType=''>
								<#assign factoryId_id_defaultValue=''>
										<#assign factoryId_id_defaultValue=''>
																	<#if (factoryId_id_defaultValue!)?string=="currentUser">
								<#assign factoryId_id_defaultValue='${staffJson!}'>
							<#elseif (factoryId_id_defaultValue!)?string=="currentPost">
								<#assign factoryId_id_defaultValue='${postJson!}'>
							<#elseif (factoryId_id_defaultValue!)?string=="currentDepart">
								<#assign factoryId_id_defaultValue='${deptJson!}'>
							<#elseif (factoryId_id_defaultValue!)?string=="currentComp">
								<#assign factoryId_id_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="factoryId.id"        showFormat="TEXT" defaultValue="${(factoryId_id_defaultValue!)?string}" defaultDisplay="${(factoryId_id_displayDefaultType!)?string}" decimal="" editable=false type="long" showType="long" notnull=false   selectCompName="WOM.batchProduceTask.batchProduceTask.batchTastView"  textalign="center" hiddenCol=true viewUrl="/MESBasic/factoryModel/factoryModel/factroyRef1.action" viewCode="MESBasic_1_factoryModel_factroyRef1" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.radion1419491307826')}"  label="${getText('ID')}" width=100 showFormatFunc=""  />
							<#assign formularId_code_displayDefaultType=''>
								<#assign formularId_code_defaultValue=''>
										<#assign formularId_code_defaultValue=''>
																	<#if (formularId_code_defaultValue!)?string=="currentUser">
								<#assign formularId_code_defaultValue='${staffJson!}'>
							<#elseif (formularId_code_defaultValue!)?string=="currentPost">
								<#assign formularId_code_defaultValue='${postJson!}'>
							<#elseif (formularId_code_defaultValue!)?string=="currentDepart">
								<#assign formularId_code_defaultValue='${deptJson!}'>
							<#elseif (formularId_code_defaultValue!)?string=="currentComp">
								<#assign formularId_code_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="formularId.code"        showFormat="SELECTCOMP" defaultValue="${(formularId_code_defaultValue!)?string}" defaultDisplay="${(formularId_code_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.batchProduceTask.batchProduceTask.batchTastView"  textalign="left"  viewUrl="/RM/formula/formula/formulaRef.action" viewCode="RM_7.5.0.0_formula_formulaRef" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1488246963795')}"  label="${getText('WOM.propertydisplayName.randon148824631209sss2')}" width=100 showFormatFunc=""  />
							<#assign formularId_name_displayDefaultType=''>
								<#assign formularId_name_defaultValue=''>
										<#assign formularId_name_defaultValue=''>
																	<#if (formularId_name_defaultValue!)?string=="currentUser">
								<#assign formularId_name_defaultValue='${staffJson!}'>
							<#elseif (formularId_name_defaultValue!)?string=="currentPost">
								<#assign formularId_name_defaultValue='${postJson!}'>
							<#elseif (formularId_name_defaultValue!)?string=="currentDepart">
								<#assign formularId_name_defaultValue='${deptJson!}'>
							<#elseif (formularId_name_defaultValue!)?string=="currentComp">
								<#assign formularId_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="formularId.name"        showFormat="TEXT" defaultValue="${(formularId_name_defaultValue!)?string}" defaultDisplay="${(formularId_name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.batchProduceTask.batchProduceTask.batchTastView"  textalign="left"  viewUrl="/RM/formula/formula/formulaRef.action" viewCode="RM_7.5.0.0_formula_formulaRef" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1488246963795')}"  label="${getText('WOM.propertydisplayName.randon14870758237ee90')}" width=100 showFormatFunc=""  />
							<#assign formularId_id_displayDefaultType=''>
								<#assign formularId_id_defaultValue=''>
										<#assign formularId_id_defaultValue=''>
																	<#if (formularId_id_defaultValue!)?string=="currentUser">
								<#assign formularId_id_defaultValue='${staffJson!}'>
							<#elseif (formularId_id_defaultValue!)?string=="currentPost">
								<#assign formularId_id_defaultValue='${postJson!}'>
							<#elseif (formularId_id_defaultValue!)?string=="currentDepart">
								<#assign formularId_id_defaultValue='${deptJson!}'>
							<#elseif (formularId_id_defaultValue!)?string=="currentComp">
								<#assign formularId_id_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="formularId.id"        showFormat="TEXT" defaultValue="${(formularId_id_defaultValue!)?string}" defaultDisplay="${(formularId_id_displayDefaultType!)?string}" decimal="" editable=false type="long" showType="long" notnull=false   selectCompName="WOM.batchProduceTask.batchProduceTask.batchTastView"  textalign="center" hiddenCol=true viewUrl="/RM/formula/formula/formulaRef.action" viewCode="RM_7.5.0.0_formula_formulaRef" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1488246963795')}"  label="${getText('ec.common.ID')}" width=100 showFormatFunc=""  />
							<#assign bulkProduct_productCode_displayDefaultType=''>
								<#assign bulkProduct_productCode_defaultValue=''>
										<#assign bulkProduct_productCode_defaultValue=''>
																	<#if (bulkProduct_productCode_defaultValue!)?string=="currentUser">
								<#assign bulkProduct_productCode_defaultValue='${staffJson!}'>
							<#elseif (bulkProduct_productCode_defaultValue!)?string=="currentPost">
								<#assign bulkProduct_productCode_defaultValue='${postJson!}'>
							<#elseif (bulkProduct_productCode_defaultValue!)?string=="currentDepart">
								<#assign bulkProduct_productCode_defaultValue='${deptJson!}'>
							<#elseif (bulkProduct_productCode_defaultValue!)?string=="currentComp">
								<#assign bulkProduct_productCode_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="bulkProduct.productCode"        showFormat="SELECTCOMP" defaultValue="${(bulkProduct_productCode_defaultValue!)?string}" defaultDisplay="${(bulkProduct_productCode_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.batchProduceTask.batchProduceTask.batchTastView"  textalign="center"  viewUrl="/MESBasic/product/product/refProductLayout.action" viewCode="MESBasic_1_product_refProductLayout" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  label="${getText('WOM.propertydisplayName.radion4434356222')}" width=100 showFormatFunc="" cssstyle="color: rgb(179, 3, 3);" />
							<#assign bulkProduct_productName_displayDefaultType=''>
								<#assign bulkProduct_productName_defaultValue=''>
										<#assign bulkProduct_productName_defaultValue=''>
																	<#if (bulkProduct_productName_defaultValue!)?string=="currentUser">
								<#assign bulkProduct_productName_defaultValue='${staffJson!}'>
							<#elseif (bulkProduct_productName_defaultValue!)?string=="currentPost">
								<#assign bulkProduct_productName_defaultValue='${postJson!}'>
							<#elseif (bulkProduct_productName_defaultValue!)?string=="currentDepart">
								<#assign bulkProduct_productName_defaultValue='${deptJson!}'>
							<#elseif (bulkProduct_productName_defaultValue!)?string=="currentComp">
								<#assign bulkProduct_productName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="bulkProduct.productName"        showFormat="TEXT" defaultValue="${(bulkProduct_productName_defaultValue!)?string}" defaultDisplay="${(bulkProduct_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.batchProduceTask.batchProduceTask.batchTastView"  textalign="center"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('WOM.propertydisplayName.radion141572452740737')}" width=100 showFormatFunc="" cssstyle="color: rgb(179, 3, 3);" />
							<#assign bulkProduct_id_displayDefaultType=''>
								<#assign bulkProduct_id_defaultValue=''>
										<#assign bulkProduct_id_defaultValue=''>
																	<#if (bulkProduct_id_defaultValue!)?string=="currentUser">
								<#assign bulkProduct_id_defaultValue='${staffJson!}'>
							<#elseif (bulkProduct_id_defaultValue!)?string=="currentPost">
								<#assign bulkProduct_id_defaultValue='${postJson!}'>
							<#elseif (bulkProduct_id_defaultValue!)?string=="currentDepart">
								<#assign bulkProduct_id_defaultValue='${deptJson!}'>
							<#elseif (bulkProduct_id_defaultValue!)?string=="currentComp">
								<#assign bulkProduct_id_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="bulkProduct.id"        showFormat="TEXT" defaultValue="${(bulkProduct_id_defaultValue!)?string}" defaultDisplay="${(bulkProduct_id_displayDefaultType!)?string}" decimal="" editable=false type="long" showType="long" notnull=false   selectCompName="WOM.batchProduceTask.batchProduceTask.batchTastView"  textalign="center" hiddenCol=true viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.randon1449796384550')}" width=100 showFormatFunc=""  />
							<#assign bulkBatchNum_batchText_displayDefaultType=''>
								<#assign bulkBatchNum_batchText_defaultValue=''>
										<#assign bulkBatchNum_batchText_defaultValue=''>
																	<#if (bulkBatchNum_batchText_defaultValue!)?string=="currentUser">
								<#assign bulkBatchNum_batchText_defaultValue='${staffJson!}'>
							<#elseif (bulkBatchNum_batchText_defaultValue!)?string=="currentPost">
								<#assign bulkBatchNum_batchText_defaultValue='${postJson!}'>
							<#elseif (bulkBatchNum_batchText_defaultValue!)?string=="currentDepart">
								<#assign bulkBatchNum_batchText_defaultValue='${deptJson!}'>
							<#elseif (bulkBatchNum_batchText_defaultValue!)?string=="currentComp">
								<#assign bulkBatchNum_batchText_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="bulkBatchNum.batchText"        showFormat="SELECTCOMP" defaultValue="${(bulkBatchNum_batchText_defaultValue!)?string}" defaultDisplay="${(bulkBatchNum_batchText_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.batchProduceTask.batchProduceTask.batchTastView"  textalign="left"  viewUrl="/WOM/standingcropRef/standingcropRef/batchNumOneRef.action" viewCode="WOM_7.5.0.0_standingcropRef_batchNumOneRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1495109507430')}"  label="${getText('WOM.propertydisplayName.randon1495853982459')}" width=100 showFormatFunc="" cssstyle="color: rgb(179, 3, 3);" />
							<#assign bulkBatchNum_id_displayDefaultType=''>
								<#assign bulkBatchNum_id_defaultValue=''>
										<#assign bulkBatchNum_id_defaultValue=''>
																	<#if (bulkBatchNum_id_defaultValue!)?string=="currentUser">
								<#assign bulkBatchNum_id_defaultValue='${staffJson!}'>
							<#elseif (bulkBatchNum_id_defaultValue!)?string=="currentPost">
								<#assign bulkBatchNum_id_defaultValue='${postJson!}'>
							<#elseif (bulkBatchNum_id_defaultValue!)?string=="currentDepart">
								<#assign bulkBatchNum_id_defaultValue='${deptJson!}'>
							<#elseif (bulkBatchNum_id_defaultValue!)?string=="currentComp">
								<#assign bulkBatchNum_id_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="bulkBatchNum.id"        showFormat="TEXT" defaultValue="${(bulkBatchNum_id_defaultValue!)?string}" defaultDisplay="${(bulkBatchNum_id_displayDefaultType!)?string}" decimal="" editable=false type="long" showType="long" notnull=false   selectCompName="WOM.batchProduceTask.batchProduceTask.batchTastView"  textalign="center" hiddenCol=true viewUrl="/WOM/standingcropRef/standingcropRef/batchNumRef.action" viewCode="WOM_7.5.0.0_standingcropRef_batchNumRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1490065762725')}"  label="${getText('ec.common.ID')}" width=100 showFormatFunc=""  />
							<#assign bulkNum_displayDefaultType=''>
								<#assign bulkNum_defaultValue=''>
										<#assign bulkNum_defaultValue=''>
										 
									<@datacolumn key="bulkNum"        showFormat="TEXT" defaultValue="${(bulkNum_defaultValue!)?string}" defaultDisplay="${(bulkNum_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1495090772143')}" width=100 showFormatFunc="" cssstyle="color: rgb(179, 3, 3);" />
							<#assign bulkType_displayDefaultType=''>
								<#assign bulkType_defaultValue=''>
										<#assign bulkType_defaultValue=''>
										 									<@systemCodeColumn code="womPackageType" textalign="center" defaultValue="${(bulkType_defaultValue!)?string}" key="bulkType.id" editable=false type="selectcomp" notnull=false     label="${getText('WOM.propertydisplayName.randon1509501197099')}" width=60   />
							<#assign planStartTime_displayDefaultType=''>
								<#assign planStartTime_defaultValue='currentTime'>
										 								<#if (planStartTime_defaultValue)?? &&(planStartTime_defaultValue)?has_content>
									<#assign planStartTime_defaultValue  = getDefaultDateTime(planStartTime_defaultValue!)?datetime>
								</#if>

									<@datacolumn key="planStartTime"        showFormat="YMD_HMS" defaultValue="${(planStartTime_defaultValue!)?string}" defaultDisplay="${(planStartTime_displayDefaultType!)?string}" decimal="" editable=false type="datetime" showType="datetime" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1495090680963')}" width=150 showFormatFunc=""  />
							<#assign planEndTime_displayDefaultType=''>
								<#assign planEndTime_defaultValue=''>
										<#assign planEndTime_defaultValue=''>
										 								<#if (planEndTime_defaultValue)?? &&(planEndTime_defaultValue)?has_content>
									<#assign planEndTime_defaultValue  = getDefaultDateTime(planEndTime_defaultValue!)?datetime>
								</#if>

									<@datacolumn key="planEndTime"        showFormat="YMD_HMS" defaultValue="${(planEndTime_defaultValue!)?string}" defaultDisplay="${(planEndTime_displayDefaultType!)?string}" decimal="" editable=false type="datetime" showType="datetime" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1495090700531')}" width=150 showFormatFunc=""  />
							<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_batchProduceTask_BatchProdTaskPart", "WOM_7.5.0.0_batchProduceTask_batchTastViewdg1496366180645", "DATAGRID", "batchProdTaskPart")>
							<#-- 排布自定义字段 -->
							<#list customPropViewMappings as cpvm>
								<#assign cpvmColumnType = cpvm.property.type>
								<#assign cpvmKey = cpvm.propertyLayRec>
								<#assign cpvmType = cpvmColumnType?lower_case>
								
								<#assign cpEditable = false>
								<#if cpEditable && cpvmKey?index_of('.') gt -1>
									<#assign cpEditable = false>
								</#if>
								<#if cpvm.readonly!false>
									<#assign cpEditable = false>
								</#if>
								<#assign cpvmNotNull = false>
								<#if cpEditable && !(cpvm.nullable!true)>
									<#assign cpvmNotNull = true>
								</#if>
								<#assign cpDecimal = ''>
								<#if cpvm.property.type == 'DECIMAL'>
									<#assign cpDecimal = (cpvm.property.decimalNum!0)>
									<#if cpvm.precision??>
										<#assign cpDecimal =cpvm.precision!>
									</#if>
								</#if>
								<#assign cpvmWidth = 100>
								<#if cpvmColumnType == 'DATETIME'>
									<#assign cpvmWidth = 130>
								</#if>
								<#if cpvm.fieldType == 'TEXTAREA'>
									<#assign cpvmWidth = 200>
								</#if>
								
								<#if cpvmColumnType == 'TEXT'>
									<#assign cpvmType = 'textfield'>
								<#elseif cpvmColumnType == 'DATETIME' || cpvmColumnType == 'SYSTEMCODE' || cpvmColumnType == 'OBJECT'>
									<#assign cpvmType = cpvm.fieldType?lower_case>
								</#if>
								
								<#if cpvmColumnType == 'SYSTEMCODE'>
									<#assign cpvmSeniorSystemCode = false>
									<#if cpvm.property.seniorSystemCode?? && cpvm.property.seniorSystemCode>
										<#assign cpvmSeniorSystemCode = true>
									</#if>
									<#assign systemEntityCode = cpvm.property.fillcontentMap.fillContent>
									<#assign systemEntity = getSystemCode(systemEntityCode)>
									<#assign systemCodelistType = systemEntity.listType>
									<#if cpvm.property.multable?? && cpvm.property.multable && systemCodelistType?? && systemCodelistType == 'TREE'>
										<@systemCodeColumn width=cpvmWidth label="${getText('${cpvm.displayName}')}" code="${(cpvm.property.fillcontentMap.fillContent)!}" key=cpvmKey isCustom=true editable=cpEditable type=cpvmType notnull=cpvmNotNull seniorSystemCode=cpvmSeniorSystemCode isTree=true isMultTree=true systemEntityCode=systemEntityCode systemCodeUrl="/foundation/systemCode/multiCodeTree.action?systemEntityCode=${systemEntityCode}"/>
									<#elseif cpvm.property.multable?? && cpvm.property.multable>
										<@systemCodeColumn width=cpvmWidth label="${getText('${cpvm.displayName}')}" code="${(cpvm.property.fillcontentMap.fillContent)!}" key=cpvmKey isCustom=true editable=cpEditable type=cpvmType notnull=cpvmNotNull seniorSystemCode=cpvmSeniorSystemCode isMultable=true systemEntityCode=systemEntityCode systemCodeUrl="/foundation/systemCode/multiCodeList.action?systemEntityCode=${systemEntityCode}"/>
									<#elseif systemCodelistType?? && systemCodelistType == 'TREE'>
										<@systemCodeColumn width=cpvmWidth label="${getText('${cpvm.displayName}')}" code="${(cpvm.property.fillcontentMap.fillContent)!}" key=cpvmKey isCustom=true editable=cpEditable type=cpvmType notnull=cpvmNotNull seniorSystemCode=cpvmSeniorSystemCode isTree=true systemEntityCode=systemEntityCode systemCodeUrl="/foundation/systemCode/singleCodeTree.action?systemEntityCode=${systemEntityCode}"/>
									<#else>
										<@systemCodeColumn width=cpvmWidth label="${getText('${cpvm.displayName}')}" code="${(cpvm.property.fillcontentMap.fillContent)!}" key=cpvmKey isCustom=true editable=cpEditable type=cpvmType notnull=cpvmNotNull seniorSystemCode=cpvmSeniorSystemCode/>
									</#if>
								<#else>
									<#assign viewUrl = ''>
									<#assign viewTitle = ''>
									<#assign viewCode = ''>
									<#assign selectCompName = ''>
									<#assign isObjCustomProp = false>
									<#assign objCustomPropNames = ''>
									<#if cpvmColumnType == 'OBJECT'>
										<#if cpvm.refView??>
											<#assign viewUrl = (cpvm.refView.url)!''>
											<#assign viewTitle = (cpvm.refView.title)!''>
											<#assign viewCode = (cpvm.refView.code)!''>
											<#assign selectCompName = 'WOM.batchProduceTask.batchProduceTask.batchTastView'>
										</#if>
										<#assign pkName = ''>
										<#assign mainDisplayName = ''>
										<#list cpvm.property.associatedProperty.model.properties as p>
											<#if !pkName?has_content && p.isPk?? && p.isPk>
												<#assign pkName = p.name>
											</#if>
											<#if !mainDisplayName?has_content && p.isMainDisplay?? && p.isMainDisplay>
												<#assign mainDisplayName = p.name>
											</#if>
										</#list>
										<#assign cpvmKey = cpvmKey + 'MainDisplay'>
										<#assign isObjCustomProp = true>
										<#assign objCustomPropNames = (mainDisplayName!'name') + ',' + (pkName!'id')> 
									</#if>
									
									<#if cpvm.align??>
										<#assign columnAlign = cpvm.align >						
									<#elseif (cpvm.property.type=='INTEGER' || cpvm.property.type=='DECIMAL')>
										<#assign columnAlign = 'right'>
									<#else>
										<#assign columnAlign = 'left' >
									</#if>
						
									<@datacolumn key=cpvmKey width=cpvmWidth showFormat="${cpvm.format!'TEXT'}" decimal="${cpDecimal}" editable=cpEditable type=cpvmType showType="${cpvm.fieldType}" notnull=cpvmNotNull callbackname="" selectCompName=selectCompName viewUrl="${viewUrl!}" viewCode="${viewCode!}" crossCompany=false viewTitle="${getText('${viewTitle!}')}" label="${getText('${cpvm.displayName}')}" isObjCustomProp=isObjCustomProp objCustomPropNames="${objCustomPropNames}" textalign="${columnAlign}" />
								</#if>
							</#list>
							<#assign remark_displayDefaultType=''>
								<#assign remark_defaultValue=''>
										<#assign remark_defaultValue=''>
										 
									<@datacolumn key="remark"  popView=true      showFormat="TEXT" defaultValue="${(remark_defaultValue!)?string}" defaultDisplay="${(remark_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1495090662614')}" width=150 showFormatFunc=""  />
			
			</@datagrid>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
			
			<script type="text/javascript">
				function BatchProdTaskPart_dg1496366180645_check_datagridvalid(){
					//
					var errorObj =BatchProdTaskPart_dg1496366180645Widget._DT.testData();
					var errorContent='';
					if(errorObj!=null){
					  for(var i=0;i<errorObj.length;i++){
						var obj1=errorObj[i];
						if(obj1.errorType=='date'){
						  errorContent+=obj1.label+'必须为日期类型！';
						  break;
						}else if(obj1.errorType=='integer'){
						  errorContent+=obj1.label+'必须为数字类型！';
						  break;
						}else if(obj1.errorType=='decimal'){
						  errorContent+=obj1.label+'必须为整数类型！';
						  break;
						}else if(obj1.errorType=='notnull'){
						   errorContent+=obj1.label+'不能为空';
						   break;
						}else if(obj1.errorType=='toolong'){
						   errorContent+=obj1.label+'字段长度不能超过'+obj1.length+'字节(注：英文字母占1个字节，中文字占3个字节)！';
						   break;
						}
					  }
					  if(errorContent!=""){
						hasErr = true;
					  }
					  if(hasErr){
						EditDialogErrorBarWidget.show(errorContent);
						return false;
					  }
					}
					return true;
				}
				
				function savedg1496366180645DataGrid(){
					<#if  refId?? && (refId gt 0)>
					BatchProdTaskPart_dg1496366180645Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('BatchProdTaskPart_dg1496366180645Widget') > -1) {
						BatchProdTaskPart_dg1496366180645Widget.setAllRowEdited();
					}
					var json = BatchProdTaskPart_dg1496366180645Widget.parseEditedData();
					$('input[name="dg1496366180645ListJson"]').remove();
					$('input[name="dgLists[\'dg1496366180645\']"]').remove();
					$('input[name="dg1496366180645ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1496366180645\']">').val(json).appendTo($('#WOM_batchProduceTask_batchProduceTask_batchTastView_form'));
					$('<input type="hidden" name="dg1496366180645ModelCode">').val('WOM_7.5.0.0_batchProduceTask_BatchProdTaskPart').appendTo($('#WOM_batchProduceTask_batchProduceTask_batchTastView_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1496366180645ListJson">').val(json).appendTo($('#WOM_batchProduceTask_batchProduceTask_batchTastView_form'));
				}
				function DT_BatchProdTaskPart_dg1496366180645_deldatagrid(){
					var deleteRows = BatchProdTaskPart_dg1496366180645Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','productId.id','factoryId.id','bulkProduct.id','headId.id','formularId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1496366180645DeletedIds").length>0){
							$("#dg1496366180645DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1496366180645DeletedIds" name="dgDeletedIds[\'dg1496366180645\']" value="'+tepID+'">').appendTo(CUI('#WOM_batchProduceTask_batchProduceTask_batchTastView_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1496366180645DeletedIds['+CUI('input[name^="dg1496366180645DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_batchProduceTask_batchProduceTask_batchTastView_form'));
					});
					return deleteRows;
				}
				function DT_BatchProdTaskPart_dg1496366180645_delTreeNodes(){
					var deleteRows = BatchProdTaskPart_dg1496366180645Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','productId.id','factoryId.id','bulkProduct.id','headId.id','formularId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1496366180645DeletedIds").length>0){
							$("#dg1496366180645DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1496366180645DeletedIds" name="dgDeletedIds[\'dg1496366180645\']" value="'+tepID+'">').appendTo(CUI('#WOM_batchProduceTask_batchProduceTask_batchTastView_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1496366180645DeletedIds['+CUI('input[name^="dg1496366180645DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_batchProduceTask_batchProduceTask_batchTastView_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('WOM_batchProduceTask_batchProduceTask_batchTastView_datagrids');
					if(!datagrids) {
						datagrids = [];
					}
					for(var i=0;i<1;i++) {
						if(!datagrids[i]) {
							datagrids[i] = [];
						}
					}
					if(datagrids[0].length>0) {
						for(var i=0;i<datagrids[0].length;i++) {
							if(datagrids[0][i] == 'BatchProdTaskPart_dg1496366180645') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'BatchProdTaskPart_dg1496366180645';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'BatchProdTaskPart_dg1496366180645';
					}
					$('body').data('WOM_batchProduceTask_batchProduceTask_batchTastView_datagrids', datagrids);
				});
				
				var BatchProdTaskPart_dg1496366180645_importDialog = null;
				function BatchProdTaskPart_dg1496366180645_showImportDialog(){
					try{
						if(BatchProdTaskPart_dg1496366180645_importDialog!=null&&BatchProdTaskPart_dg1496366180645_importDialog.isShow==1){
							return false;
						}
						var url = "/WOM/batchProduceTask/batchProduceTask/initImport.action?datagridCode=WOM_7.5.0.0_batchProduceTask_batchTastViewdg1496366180645&tid=${id!}&datagridName=dg1496366180645";
							<#if canImportExcel>
								var buttonCode="WOM_7.5.0.0_batchProduceTask_batchTastViewdg1496366180645_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						BatchProdTaskPart_dg1496366180645_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("BatchProdTaskPart_dg1496366180645"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();BatchProdTaskPart_dg1496366180645_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();BatchProdTaskPart_dg1496366180645_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						BatchProdTaskPart_dg1496366180645_importDialog.show();
					}catch(e){}
				}	
				
				function BatchProdTaskPart_dg1496366180645_downLoadFile(){
					var url = "/WOM/batchProduceTask/batchProduceTask/downLoad.action?datagridCode=WOM_7.5.0.0_batchProduceTask_batchTastViewdg1496366180645&templateRelatedModelCode=WOM_7.5.0.0_batchProduceTask_batchTastViewdg1496366180645&downloadType=template&fileName=dg1496366180645";
					window.open(url,"","");
				}
				function dg1496366180645RenderOverEvent(){
					$('.paginatorbar-operatebar').append('<div class="paginatorbar-operatebar"><a href="###"><span id="refBaseCheckAuto" class="buttonbar-button cui-btn-wlszyck">物料设置与查看</span></a></div>');
var taskType=$('#batchProduceTasktaskTypeid').val();
if(taskType!='womTaskType/type2'){
	$( 'td[key="bulkProduct.productCode"]').hide();
	$( 'td[key="bulkProduct.productName"]').hide();
	$( 'td[key="bulkBatchNum.batchText"]').hide();
	$( 'td[key="bulkNum"]').hide(); 
	$( 'td[key="bulkType.id"]').hide();
	
	//表体滚动条bug修改
	BatchProdTaskPart_dg1496366180645Widget._DT._resizeHeight = true;
	BatchProdTaskPart_dg1496366180645Widget._DT._initDomElements();
}
$('#refBaseCheckAuto').click(function(){
    var type=$("[name='batchProduceTask.taskType.id']").val();
	var row=BatchProdTaskPart_dg1496366180645Widget.getSelectedRow();
	if(row==undefined){
		 workbenchErrorBarWidget.showMessage("请选择一行数据！","f");
		 return false;
	}else{
		 var batchTaskId=BatchProdTaskPart_dg1496366180645Widget.getCellValue(BatchProdTaskPart_dg1496366180645Widget.getSelectedRow(),'id');
		 //所选择的行数据尚未生成指令
		 if(batchTaskId=='' || batchTaskId==undefined){
		   workbenchErrorBarWidget.showMessage("所选择的数据尚未进行展开！","f");
		   return false;
		 }
		 
		 //通过样品id查找默认配方
		 $.ajax({
			url : "/WOM/produceTask/produceTask/getProduceTaskByBatchID.action",
			type : 'post',
			traditional: true,
			async : false,
			data:{"batchTaskId":batchTaskId},
			success : function(res) {
			    //已经生成了指令
				if(res.dealSuccessFlag==true){
				  var id=res.taskId;
				  var tableInfoId=res.taskTableInfoId;
				  var url='';
				  //制造
				  if(type=='womTaskType/type1'){
				    var powerCode=gerPowerCode('makeTaskFlow');
				    var url='/WOM/produceTask/produceTask/makeTaskView.action?&tableInfoId='+tableInfoId+'&entityCode=WOM_7.5.0.0_produceTask&id='+id+'&__pc__='+powerCode;
				  }
				  //包装
				  if(type=='womTaskType/type2'){
				    var powerCode=gerPowerCode('packageTaskFlow');
				    var url='/WOM/produceTask/produceTask/packageTaskView.action?&tableInfoId='+tableInfoId+'&entityCode=WOM_7.5.0.0_produceTask&id='+id+'&__pc__='+powerCode;
				  }
				  if(url!=''){
					 openFullScreen(url);
				  }
				}
				 //尚未生成指令
				if(res.dealSuccessFlag==false){
				   workbenchErrorBarWidget.showMessage("所选择的数据尚未进行展开！","f");
		           return false;
				}
			}
		 });		 		
	}
}
);
				}
				function dg1496366180645PageInitMethod(nTabIndex){
					WOM.batchProduceTask.batchProduceTask.batchTastView.initSize(nTabIndex);
				}
			</script>
			
			
			</div>
			</div>
		</div>
	</div>
	<#if (pendingId?? || editNew) && !(superEdit!false)>
	<#include "../../../ec/tableInfo/flowDealContainer_all.ftl">
	</#if>
			
			
</div>
		<#if businessCenterList??>
	     	<#list businessCenterList as l>
		<div style="float:none;width:auto;display:none;" class="edit-main grid-s5m0 col-main main-wrap" id="otherContentDiv_${l.relatingModel.code.replace('.','')}">
	     	</div>
	     	</#list>
     	</#if>
     	
		<div id="WOM_batchProduceTask_batchProduceTask_batchTastView_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<#if ((batchProduceTask.effectiveState)!0) == 0>
				<#if !(superEdit!false)>
				<li id="flowHead" onclick="WOM.batchProduceTask.batchProduceTask.batchTastView.showFlowInfo('flow')"><span class="icon_prograss"></span>${getText("ec.flow.flowImage")}</li>
				</#if>
				</#if>
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="WOM.batchProduceTask.batchProduceTask.batchTastView.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
				<li id="dealInfoHead" class="bar" onclick="WOM.batchProduceTask.batchProduceTask.batchTastView.showDealInfo('dealInfo')"><span class="icon_handle"></span>${getText("ec.view.dealadvice")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<#if ((batchProduceTask.effectiveState)!0) == 0>
				<#if !(superEdit!false)>
				<div class="flow-height wid" id="flowDiv"></div>
				</#if>
				</#if>
				<div id="fileUploadDiv" class="wid-hei"></div>
				<div style="padding:1px 0px 0px 0px;" id="dealInfoDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_batchProduceTask_batchTastView,html,WOM_7.5.0.0_batchProduceTask_BatchProduceTask,WOM_7.5.0.0) -->
<!-- 自定义代码 -->
<style type="text/css">
	.cui-btn-putin {
    	background: url('/bap/static/WOM/img/icon_jxtl.png') no-repeat;
	}
    .cui-btn-inspect {
    	background: url('/bap/static/WOM/img/icon_fqqj.png') no-repeat;
	}
	.cui-btn-taskReport {
    	background: url('/bap/static/WOM/img/icon_jxbg.png') no-repeat;
	}
	.cui-btn-cdsz {
    	background: url('/bap/static/WOM/img/icon_cdsz.png') no-repeat;
	}
	.cui-btn-copy {
    	background: url('/bap/static/WOM/img/icon_copy.png') no-repeat;
	}
	.cui-btn-end {
    	background: url('/bap/static/WOM/img/icon_end.png') no-repeat;
	}
	.cui-btn-gdtpl {
    	background: url('/bap/static/WOM/img/icon_gdtpl.png') no-repeat;
	}
	.cui-btn-hdsz {
    	background: url('/bap/static/WOM/img/icon_hdsz.png') no-repeat;
	}
	.cui-btn-jxps {
    	background: url('/bap/static/WOM/img/icon_jxps.png') no-repeat;
	}
	.cui-btn-plwc {
    	background: url('/bap/static/WOM/img/icon_plwc.png') no-repeat;
	}
	.cui-btn-print {
    	background: url('/bap/static/WOM/img/icon_print.png') no-repeat;
	}
	.cui-btn-sgtpl {
    	background: url('/bap/static/WOM/img/icon_sgtpl.png') no-repeat;
	}
	.cui-btn-wlszyck {
    	background: url('/bap/static/WOM/img/icon_wlszyck.png') no-repeat;
	}
	.cui-btn-xtdbd {
    	background: url('/bap/static/WOM/img/icon_xtdbd.png') no-repeat;
	}
	.cui-btn-zdsc {
    	background: url('/bap/static/WOM/img/icon_zdsc.png') no-repeat;
	}
	.cui-btn-disable{
		background: url('/bap/struts/css/buttons.png') no-repeat 0px -49px;
	}

</style>
<!-- CUSTOM CODE END -->
		<@errorbar id="workbenchErrorBar" offsetY=42 />
		
		<script type="text/javascript">
		$(function(){
			//修复select下拉框不能跟随滚动条一起滚动的bug
			$(".cui-elements").bind("scroll", function(){ 
			    $(".edit-select-box").hide();
				$(".select-iframe").hide();     
			});
			$(window).resize(function(){
				//var isoldie = $.browser.msie&&($.browser.version == "6.0")&&!$.support.style;
				//var body = isoldie?(document.documentElement||document.body):document.body;
				var width = parseInt($('html').width(),10);
				var w1 = parseInt($(window).width(),10);
				if($("#edit_sidebar").css("display") == "block"){
					w1 = w1 - 150;
				}
				if (width <= 800) {
					if($("#edit_sidebar").length==0 || $("#edit_sidebar").css("display")=="none"){
						$("#WOM_batchProduceTask_batchProduceTask_batchTastView_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#WOM_batchProduceTask_batchProduceTask_batchTastView_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#WOM_batchProduceTask_batchProduceTask_batchTastView_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#WOM_batchProduceTask_batchProduceTask_batchTastView_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			WOM.batchProduceTask.batchProduceTask.batchTastView.initCount = 0;
			WOM.batchProduceTask.batchProduceTask.batchTastView.initSize = function(nTabIndex){
				var panesHeight;
				var thisHeight;
				var h = $(window).height();
			    var w = $(window).width();
			    var width_ = 0;
			    if($('#edit_side_btn').length > 0){
				 $('#edit_side_btn').hasClass('edit-side-btn-r') ? width_ = 0 : width_ = 145;			
				}
				<#if businessCenterList??&&businessCenterList?size gt 0 >
				if($("#edit_sidebar").css("display") === "none"){
					$("div.edit-workflow").css("left",1);
				}else{
					$("div.edit-workflow").css("left",145);
				}
				$("#edit_sidebar").height(h);
				$("div.edit-sidebar-inner").height(h);
				$("#edit_side_btn").css("top",(h-50)/2);
				CUI('div[id^="otherContentDiv_"]').height(h);
				</#if>
				var conHeight = h-$("#WOM_batchProduceTask_batchProduceTask_batchTastView_main_div .edit-head").height()-$("#WOM_batchProduceTask_batchProduceTask_batchTastView_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#WOM_batchProduceTask_batchProduceTask_batchTastView_main_div .edit-workflow").height()</#if>;
				$("#WOM_batchProduceTask_batchProduceTask_batchTastView_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('WOM_batchProduceTask_batchProduceTask_batchTastView_datagrids');
				var padding_bottom=16;
				$("#WOM_batchProduceTask_batchProduceTask_batchTastView_main_div .pd_bottom,#WOM_batchProduceTask_batchProduceTask_batchTastView_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#WOM_batchProduceTask_batchProduceTask_batchTastView_main_div .edit-panes-s").each(function(index){
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
							$(this).parent().height(thisHeight);			//解决存在存在pt的情况，当页面resize时，造成的高度设定不正确问题， BugID=27472			--fukun
							datatableHeight = conHeight - thisHeight;
						}
					} else {
						if(thisHeight > conHeight) {
							$(this).parent().height(conHeight);
							$(this).parent().css("overflow-y","auto");
						} else if(thisHeight && thisHeight > 0) {
							$(this).parent().height(conHeight);  //如果实际高度小于分配给它的高度，就使用分配给它的高度 BugID=18196     --xudihui
						}
					}
					if(datagrids && datagrids.length > 0) {
						if(datagrids[index].length > 0) {
							datatableHeight = datatableHeight; 
							var perHeight = datatableHeight/datagrids[index].length;
							for(var dg=0;dg<datagrids[index].length;dg++) {
								
								var dgwidget = eval(datagrids[index][dg]+'Widget');
								
								if(dgwidget) {
									var dg_container = dgwidget._DT ? ( dgwidget.isJS ? dgwidget._DT.container :  dgwidget._DT.oGridDiv ) : dgwidget.container;
									if ( $( dg_container ).is( ':visible' ) ) {
									   	 if( dgwidget._oGrid || dgwidget._DT._oGrid ){
                                          dgwidget.setHeight(perHeight - 78); 
										  if ( $('._DT_blank','#' + datagrids[index] + '_wrapper').length == 0 ) {
										     $('#' + datagrids[index] + '_wrapper').append('<div style="height:11px" class="_DT_blank" ></div>')  //当使用控件PT的时候，为底部增加10px的div，  xudihui  2015.01.27
										   } 
                                         }
									     else{
									      dgwidget.setHeight(perHeight - 68);
									     }	
									}
								} else {
									if(WOM.batchProduceTask.batchProduceTask.batchTastView.initCount <= 2) {
										setTimeout(function(){WOM.batchProduceTask.batchProduceTask.batchTastView.initSize();}, 200);
										WOM.batchProduceTask.batchProduceTask.batchTastView.initCount++;
									}/* else {
										WOM.batchProduceTask.batchProduceTask.batchTastView.initCount = 0;
									}*/
								}
							}
						}
					} else {
						if(thisHeight < conHeight){ //当此页签下面的实际内容高度小于分配给它的高度
						    $(this).parent().height(conHeight);
						}
						else{     //当此页签下面的实际内容高度大于分配给它的高度
							$(this).parent().height(conHeight);
							if(($("#WOM_batchProduceTask_batchProduceTask_batchTastView_main_div .edit-workflow").length > 0) && ($("#WOM_batchProduceTask_batchProduceTask_batchTastView_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
							 $(this).parent().height(conHeight-14); //有处理结果浮动层的时候，底部留白14像素
							}	
							$(this).parent().css("overflow-y","auto");
						}
					}
					/*
					// 文档申明换成更标准的之后,这个问题不会出现在真实的ie8及以上的浏览器中, 这里的算法会产生其他问题BugID=18197,先注释掉这段代码，后面如果有需要再调整这块代码 ———— lidong
					if($(this).parent().css("overflow-y")=="auto"){  //IE7 下面当内容出现滚动条的时候，不会主动去腾出滚动条的宽度，需要手动计算
						if(YAHOO.env.ua.ie < 8 ){
	                         var width = parseInt($(window).width());
							if($("#edit_side_btn").length>0){
							   $("#edit_side_btn").hasClass('edit-side-btn-r') ? width = width : width = width-145;
							}
							if($('.edit-tabs').length>0){
							   width = width*0.98; //IE7下面把总宽度的98%赋值给它的分配宽度，保持跟IE高版本一致
							}
							var style = ';width:' + (width-48) + 'px;';  //IE7下面把它的分配宽度再减去右侧滚动条的宽度
							$(this).attr('style',style);
							$(this).parent().parent().find('.edit-datatable').each(function(){ //IE7下面如果pt内容为空，直接隐藏，不然会有一个默认高度
								if($(this).html() ==''){$(this).css('display','none');}
							});
						}					
					}
					*/						
				});
			}
			$(function(){
				$('#WOM_batchProduceTask_batchProduceTask_batchTastView_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				WOM.batchProduceTask.batchProduceTask.batchTastView.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				WOM.batchProduceTask.batchProduceTask.batchTastView.initSize();
				if(YAHOO.env.ua.ie == 6){
					$("#loading_wrap_first").css("display","block");
				}
				$("#load_mask_first").remove();
				$("#load_iframe_ie_first").remove();
				$("#loading_wrap_first").remove();
				<#if businessCenterList??&&businessCenterList?size gt 0 >
					$(window).resize(function(){
						for(var i=0; i<CUI.DataTable.Arrays.length; i++){
							if( CUI.DataTable.Arrays[i] && document.getElementById( CUI.DataTable.Arrays[i].dataTableId ) &&  $( CUI.DataTable.Arrays[i].container ).is(':visible') ){
								CUI.DataTable.Arrays[i]._initDomElements();
							}else if( CUI.DataTable.Arrays[i] && !document.getElementById( CUI.DataTable.Arrays[i].dataTableId ) ){
								CUI.DataTable.Arrays[i] = null;
								CUI.DataTable.Arrays.splice(i, 1);
							}
						}
					})
					$(".edit-workflow").css("left",145);
					$("#edit_side_btn").toggle(function(){
						if(parseInt($("#WOM_batchProduceTask_batchProduceTask_batchTastView_main_div").css("width"),10)==650){
							$("#WOM_batchProduceTask_batchProduceTask_batchTastView_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//WOM.batchProduceTask.batchProduceTask.batchTastView.resizeLayout();
						//WOM.batchProduceTask.batchProduceTask.batchTastView.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#WOM_batchProduceTask_batchProduceTask_batchTastView_main_div").css("width"),10)==800){
							$("#WOM_batchProduceTask_batchProduceTask_batchTastView_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//WOM.batchProduceTask.batchProduceTask.batchTastView.resizeLayout();
						//WOM.batchProduceTask.batchProduceTask.batchTastView.initSize();
						$('body').trigger('resize');
					});
				<#else>	
					$(".main-wrap").css("margin-left",0);
					$(".col-sub").width(0);
					$("#edit_side_btn").css("left",0);
					$(".edit-workflow").css("left",1);
					
				</#if>

				if($("ul.edit-tabs li").length > 0) {
			     	$("ul.edit-tabs").tabs("div.edit-panes > div");
			    }
				var datatableHeight;
				var bh = $(".edit-workflow tr:gt(0)").height();
				<#if pendingId?? || editNew>
				$("#workflow_toggle").toggle(function(){
					$(".edit-workflow tr:gt(0)").hide();
					WOM.batchProduceTask.batchProduceTask.batchTastView.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					WOM.batchProduceTask.batchProduceTask.batchTastView.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){WOM.batchProduceTask.batchProduceTask.batchTastView.initSize();});
				/*
				WOM.batchProduceTask.batchProduceTask.batchTastView.resizeLayout=function(){
					CUI("div[class='elm-layout-doc elm-layout-doc-in-wrap']").each(function(){
						var id=CUI(this).attr("id");
						var layoutObj=eval(id+"Widget");
						layoutObj.resize();
					})
				}
				*/
			});
		</script>
		<script type="text/javascript">
		
		$(function(){
			<#if editNew>
			WOM.batchProduceTask.batchProduceTask.batchTastView.setDepartment();
			<#else>
			CUI("#dealInfoContain").load("/ec/workflow/dealInfo.action?dlTableInfoId=${batchProduceTask.tableInfoId!}&dealInfoGroup=byTime&preName=mainFrame&dealDataUrl=/WOM/batchProduceTask/batchProduceTask/dealInfo-list.action&enableSimpleDealInfo=false");
			</#if>
			//解决合并单元格后，同行（tr）内的所有td跨行数（rowspan）相同时,组态期表现为tr占n行单元格，在运行期错乱的bug
			var editContainer = $( 'div.edit-container' );
		    var editTr=editContainer.find(".edit-table tr");
		    $.each(editTr,function(i,item){
		        var editTd=$(item).find("td");
		        var isSameRowSpan=true;//单元格跨行数是否相等
		        var rsTemp;//跨行数
		        var csTemp=0;//跨列数（需累加）
		        for(var k=0;k<editTd.length;k++){
		           var ele=editTd[k];
		           var rowspan=$(ele).attr("rowspan");
		           var colspan=$(ele).attr("colspan");
		           if(!rowspan||rowspan=="") rowspan=1;
		           if(!colspan||colspan=="") colspan=1;
		           csTemp+=Number(colspan);
		           if(!rsTemp){
		              rsTemp=Number(rowspan);
		           }else{
		              if(rsTemp!=rowspan){
		                 isSameRowSpan=false;
		              }
		           }  
		        }
		        //单元格跨行数相等且不为1的情况下，重组本行内容
		        if(isSameRowSpan&&rsTemp!=1){
		           recombineTr(item,rsTemp,csTemp);
		        }
		    });
		    //对满足条件的行进行跨行重组
		    function recombineTr(editTr,rsNum,csNum){
		        var editTd=$(editTr).find("td");
		        $.each(editTd,function(i,item){
		           $(item).attr({"rowspan":"1","data-row":rsNum});
		        });
		        var appendTr="";
		        for(var i=0;i<rsNum-1;i++){
		          appendTr+="<tr data-tag='appendrow'><td class='edit-table-symbol' colspan='"+csNum+"'>&nbsp;</td></tr>";
		        }
		        $(appendTr).insertAfter(editTr);
		    }
		});

		WOM.batchProduceTask.batchProduceTask.batchTastView.validate = function(){
		    <#if dealSet?? && dealSet == 1>
			var cancelItem = $('input[name="workFlowVarStatus"]');
	        validateRequiredFlag = $('input[name="operateType"]').val()=='submit' && (!cancelItem || cancelItem.length == 0 || !(cancelItem.val()=='cancel'));
			if(validateRequiredFlag){
				var comments = $.trim(CUI("#workflow_comments").val());
			 	if(comments != null && comments == ""){
		        	workbenchErrorBarWidget.showMessage("${getText('ec.property.dealinfo.isNotNull')}", 'f');
		        	return false;
				}
			}
		    </#if>
		    return true;
		}
		WOM.batchProduceTask.batchProduceTask.batchTastView.beforeSaveProcess = function(){
			$('input[name="batchProduceTask.extraCol"]').remove();
		}
		WOM.batchProduceTask.batchProduceTask.batchTastView.processDataGrid = function(){
										<#if false && isIE>
										$('#WOM_batchProduceTask_batchProduceTask_batchTastView_form').append(BatchProdTaskPart_dg1496366180645Widget._DT.createInputs('dg1496366180645List'));
										</#if>
		};
		WOM.batchProduceTask.batchProduceTask.batchTastView.save = function(){
			<#if !(superEdit!false)>
			$('#operateType').val("save");
			<#else>
			$('#operateType').val("submit");
			</#if>
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!WOM.batchProduceTask.batchProduceTask.batchTastView.validate()){return;}
			//延迟到延迟提交中处理,解决onchange事件无法触发问题
			//WOM.batchProduceTask.batchProduceTask.batchTastView.beforeSaveProcess();

			//WOM.batchProduceTask.batchProduceTask.batchTastView.processDataGrid();
			$('#WOM_batchProduceTask_batchProduceTask_batchTastView_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('WOM_batchProduceTask_batchProduceTask_batchTastView_form','WOM_batchProduceTask_batchProduceTask_batchTastView_datagrids')) {      
		            return "${getText('ec.view.losedata')}";      
		        }else{
		        	 if($('#workflow_comments').length!=0){
			        	if($('#workflow_comments').val()!=null && $('#workflow_comments').val()!=""){
			        		return "${getText('ec.view.losedata')}";
			        	}
				     }  
		        }   
	    });
		<#else>
		$(window).bind('beforeunload',function(){
		        if($('#workflow_comments').length!=0){
		        	if($('#workflow_comments').val()!=null && $('#workflow_comments').val()!=""){
		        		return "${getText('ec.view.losedata')}";
		        	}
		        }  		  
		});		
		</#if>
		//打印
		WOM.batchProduceTask.batchProduceTask.batchTastView.print = function(){
			var viewCode = $('input[name="viewCode"]').val();
			var value = "";
			var printId = 0;
			var printVersion = 0;
			if(viewCode!=undefined && viewCode!=null && viewCode!=''){
				$.ajax({
					url : "/ec/print/getAjaxSetting.action",
					type : 'post',
					async : false,
					data:{"printCookie.type":viewCode},
					success : function(msg) {
						if(msg!=null){
							value = msg.value;
							printId = msg.id;
							printVersion = msg.version;
						}
					}
				});
				$("#printCookie_id").val(printId);
				$("#printCookie_version").val(printVersion);
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
				data += "&dealInfoGroup=" + $('#dealInfoGroup').val();

				var url = document.location.href;
				// TODO 去掉url后的'#'，将来页面上有锚点时，在打印可能也会有问题
				while(url.endsWith('#')) {
					url = url.substring(0, url.length - 1);
				}
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
		
		WOM.batchProduceTask.batchProduceTask.batchTastView.saveSetting = function(){
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
		
		WOM.batchProduceTask.batchProduceTask.batchTastView.printSetting = function(){
			var viewCode = $('input[name="viewCode"]').val();
			var value = "";
			var printId = 0;
			var printVersion = 0;
			if(viewCode!=undefined && viewCode!=null && viewCode!=''){
				$.ajax({
					url : "/ec/print/getAjaxSetting.action",
					type : 'post',
					async : false,
					data:{"printCookie.type":viewCode},
					success : function(msg) {
						if(msg!=null){
							value = msg.value;
							printId = msg.id;
							printVersion = msg.version;
						}
					}
				});
				$("#printCookie_id").val(printId);
				$("#printCookie_version").val(printVersion);
				var values = {};
				if(value!=undefined && value!=null && value != ""){
					values = value.split(/\|/g);
				}
				if(values != null && values.length > 0){
					for(var i=0;i < values.length;i++){
						var item = values[i].split("=");
						if(item[1]=='true'){
							$('#' + item[0]).prop('checked',true);
						}else{
							$('#' + item[0]).prop('checked',false);
						}
					}
				}else{
					$('#mainContent').prop('checked',true);
					$('#dealInfo').prop('checked',true);
					$('#attachmentInfo').prop('checked',true);
				}
				<#if isWorkflow?? && isWorkflow>
				$('td[name="deal"]').show();
				<#else>
				$('td[name="deal"]').hide();
				$('#dealInfo').prop('checked',false);
				</#if>
				<#if isAttachment?? && isAttachment>
				$('td[name="att"]').show();
				<#else>
				$('td[name="att"]').hide();
				$('#attachmentInfo').prop('checked',false);
				</#if>
				WOM.batchProduceTask.batchProduceTask.batchTastView.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(WOM.batchProduceTask.batchProduceTask.batchTastView.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				WOM.batchProduceTask.batchProduceTask.batchTastView.settingDialog.show();
			}
		}
		
		
		
		WOM.batchProduceTask.batchProduceTask.batchTastView.reject = function(){
			var rejectDiv = $("div.deal-result[id^='reject_']");
			if(rejectDiv.length == 1 && $($('input[name="workFlowVar.outcome"][rejectFlag="1"]')[0]).prop('checked') == false){
				$($('input[name="workFlowVar.outcome"][rejectFlag="1"]')[0]).prop('checked',true);
				$($('input[name="workFlowVar.outcome"][rejectFlag="1"]')[0]).click();
			} else {
				if(undefined == $('input[name="workFlowVar.outcome"][rejectFlag="1"]:checked').val()){
					workbenchErrorBarWidget.showMessage("${getText('ec.flow.outcome.reject.select')}");
					return;
				}
			}
			$('#operateType').val("reject");
			WOM.batchProduceTask.batchProduceTask.batchTastView.submit();
		}
		
		WOM.batchProduceTask.batchProduceTask.batchTastView.submit = function(uncheck){
			if(uncheck){
			
			} else {
				var operateType = $('#operateType').val();
				if(operateType == "reject"){
					$('#operateType').val("submit");
				} else {
					var normalActives = $('input[name="workFlowVar.outcome"]').not('[rejectFlag="1"]');
					if(null != normalActives && undefined != normalActives && normalActives.length == 1 && $(normalActives[0]).prop('checked') == false){ //普通活动只有一个
						$(normalActives[0]).prop('checked',true);
						$(normalActives[0]).click();
					} else {//多个普通活动
						if(!($('#__workflow_outcome_countersign').prop("checked")||$('input[name="workFlowVar.outcome"]:checked').not('[rejectFlag="1"]').val())){
							workbenchErrorBarWidget.showMessage("${getText('ec.flow.outcome.select')}");
							return;
						}
					}
				}
			}
			$('#operateType').val("submit");
			if(!WOM.batchProduceTask.batchProduceTask.batchTastView.validate()){return;}
			
			//$('#__workflow_outcomeDes').val($('input[name="workFlowVar.outcome"]:checked').attr('des'));
			
			WOM.batchProduceTask.batchProduceTask.batchTastView.beforeSaveProcess();
			
			//WOM.batchProduceTask.batchProduceTask.batchTastView.processDataGrid();
			
			var array=new Array();
			
			var requiredStaff=false;
			var outcomeDesc="";
			$('input[name="workFlowVar.outcome"]:checked').each(function(){
				var checkNull=CUI(this).attr("checkNull");
				
				var paramObj=new Object();
				paramObj.type='normal';
				paramObj.outcome=$(this).val();
				paramObj.dec=$(this).attr("dec");
				outcomeDesc=$(this).attr("dec");
				var id="#assignStaffSelect_"+$(this).val()+"MultiIDs";
				var values=$(id).val();
				var checkNull=$(this).attr("checkNull");
				if(checkNull=='true'&&values==''){
					requiredStaff=true;
					return ;
				}
				paramObj.assignUser=values;
				array.push(paramObj);
			
			})
			
			
			$('input[id*="__workflow_outcome_nodification_"]:checked').each(function(){
				var paramObj1=new Object();
				paramObj1.type='notification';
				paramObj1.outcome=$(this).val();
				paramObj1.dec=$(this).attr("dec");
				if(outcomeDesc!=""){
					outcomeDesc+=","+$(this).attr("dec");
				}else{
					outcomeDesc=$(this).attr("dec");
				}
				var id="#assignStaffSelect_"+$(this).val()+"MultiIDs";
				var values1=CUI(id).val();
				var checkNull1=$(this).attr("checkNull");
				if(checkNull1=='true'&&values1==''){
					requiredStaff=true;
					return ;
				}
				paramObj1.assignUser=values1;
				array.push(paramObj1);
			
			})
			if(requiredStaff){
				workbenchErrorBarWidget.showMessage(outcomeDesc+"${getText("ec.flow.outcome.assStaffNull")}");
				return ;
			}
			if(array.length>0){
				$("#__workflow_outcomeMap").val(YAHOO.lang.JSON.stringify(array));
			}else if($('#__workflow_outcome_countersign').prop("checked")){
				var paramObj1=new Object();
				paramObj1.type='countersignAssign';
				paramObj1.outcome="countersignAssign";
				paramObj1.dec="countersignAssign";
				var countersignUsers=CUI('#countersignUsersMultiIDs').val();
				
				if(countersignUsers==''){
					workbenchErrorBarWidget.showMessage(outcomeDesc+"您勾选了转发，请指定转发人员！");
					return ;
				}
				
				array.push(paramObj1);
				$("#__workflow_outcomeMap").val(YAHOO.lang.JSON.stringify(array));
			}
			$('#WOM_batchProduceTask_batchProduceTask_batchTastView_form').submit();
			//$(".wfcancel").remove();
			
		}
		WOM.batchProduceTask.batchProduceTask.batchTastView.recall = function(){
			CUI.Dialog.confirm("${getText('ec.recall.checkrecall')}", function(){
					$.ajax({
					url : "/WOM/batchProduceTask/batchProduceTask/common/recall.action",
					type : 'post',
					async : false,
					data:{"tableInfoId": "${(batchProduceTask.tableInfoId)?default('')}"},
					success : function(msg) {
						if(msg && msg.success){
							workbenchErrorBarWidget.showMessage("${getText('ec.recall.success')}", 's');
		 					var url = "/foundation/user/open-pending.action?pendingId=" + msg.data.id + "&tableInfoId=${(batchProduceTask.tableInfoId)?default('')}&id=${(batchProduceTask.id)?default('')}&entityCode=WOM_7.5.0.0_batchProduceTask";

			 				try{
								window.opener.refreshPortal('workflow');
								window.opener.timeData();
							}catch(e){
								try{
			 						window.opener.WOM.batchProduceTask.batchProduceTask.editCallBackInfo(res); 						
								}catch(e2){
									try{
										<#if calltype??&&calltype=='ref'>
										window.opener.WOM.batchProduceTask.batchProduceTask.callBackInfo(res);
										<#else>
										window.opener.location.reload();
										</#if>
									}catch(e3){}
								}
							};

		 					setTimeout(function(){
		 						window.onbeforeunload = null;
								document.location.href=url;
		 					}, 1000);
						}
					}
				});
			});
		}
		WOM.batchProduceTask.batchProduceTask.batchTastView._callBackInfo = function(res){
			if(res.dealSuccessFlag){
					var showMsg ;
				if(res.operateType == 'save'){
					showMsg = "${getText("ec.common.savesuccessful")}";
				}else{
					showMsg = "${getText("ec.common.saveandclosesuccessful")}";
				}
				
				//提交成功时隐藏之前的错误信息
				workbenchErrorBarWidget.close();
				
				if(containerLoadPanelWidget && containerLoadPanelWidget.loading && YUD.get("loading_wrap")){
 					YUD.get("loading_wrap").innerHTML = "<div class='success-middle'></div>" ;
 				}

 				try{
					window.opener.refreshPortal('workflow');
					window.opener.timeData();
				}catch(e){
					try{
 						window.opener.WOM.batchProduceTask.batchProduceTask.editCallBackInfo(res); 						
					}catch(e2){
						try{
							if(typeof window.opener.refViewRefresh == 'function'){
								window.opener.refViewRefresh()
							} else {
								window.opener.location.reload();
							}
						}catch(e3){}
					}
				};
				<#if !(superEdit!false)>
 				if(res.operateType == 'save'){
 					var url = "/foundation/user/open-pending.action?pendingId=" + res.pendingId + "&tableInfoId=" + res.tableInfoId + "&id=" + res.id + "&entityCode=WOM_7.5.0.0_batchProduceTask";
 					setTimeout(function(){
						document.location.href=url;
 					}, 1000);
					return;
 				}
 				</#if>

 				setTimeout(function(){
					window.close();
				},1000);
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.WOM.batchProduceTask.batchProduceTask.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
			} else {
				CUI.showErrorInfos(res);
			}
		};
		refViewRefresh = function(){
			if($("[name='refViewRefresh']").val() != undefined && "" != $("[name='refViewRefresh']").val()){
				eval($("[name='refViewRefresh']").val());
			}
		}
		<#if editNew>
		WOM.batchProduceTask.batchProduceTask.batchTastView.setDepartment = function(){
			var o = $('#creatorPosition').find("option[selected]");
			if(o && o.length == 1) {
				$('#creatorDepartmentName').text(o.attr('departmentName'));
				$('#creatorDepartmentId').val(o.attr('departmentId'));
				$('#positionLayRec').val(o.attr('layRec'));
			}
		};
		</#if>
		
		//控件版PT选人查看按钮单击事件处理函数
		function dataGridBtnImgClick(sUrl,objNameCustomCondition,sTitle,sPTGridID,nRow,sFieldName,oGrid,customCallBack,crossCompany,isObjCustomProp,objCustomPropNames,viewCode){
			//保存当前单击事件的对象信息
			var obj = {
				"oGrid" : oGrid,
				"nRow" : nRow - 1,
				"sKey":	sFieldName
			}
			if(customCallBack){
				WOM.batchProduceTask.batchProduceTask.batchTastView._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				WOM.batchProduceTask.batchProduceTask.batchTastView._isObjCustomProp_IE = isObjCustomProp;
			} else {
				WOM.batchProduceTask.batchProduceTask.batchTastView._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				WOM.batchProduceTask.batchProduceTask.batchTastView._objCustomPropNames_IE = objCustomPropNames;
			} else {
				WOM.batchProduceTask.batchProduceTask.batchTastView._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				WOM.batchProduceTask.batchProduceTask.batchTastView._refViewCode_IE = viewCode;
			} else {
				WOM.batchProduceTask.batchProduceTask.batchTastView._refViewCode_IE = '';
			}
			WOM.batchProduceTask.batchProduceTask.batchTastView._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		WOM.batchProduceTask.batchProduceTask.batchTastView.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			WOM.batchProduceTask.batchProduceTask.batchTastView._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			WOM.batchProduceTask.batchProduceTask.batchTastView._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			WOM.batchProduceTask.batchProduceTask.batchTastView.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			WOM.batchProduceTask.batchProduceTask.batchTastView._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				WOM.batchProduceTask.batchProduceTask.batchTastView._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		WOM.batchProduceTask.batchProduceTask.batchTastView._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(WOM.batchProduceTask.batchProduceTask.batchTastView._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(WOM.batchProduceTask.batchProduceTask.batchTastView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				WOM.batchProduceTask.batchProduceTask.batchTastView.gridEventObj = gridEventObj;
				callbackName = "WOM.batchProduceTask.batchProduceTask.batchTastView.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "WOM.batchProduceTask.batchProduceTask.batchTastView.getMultiselectCallBackInfo_DG" : "WOM.batchProduceTask.batchProduceTask.batchTastView.getcallBackInfo_DG";
				WOM.batchProduceTask.batchProduceTask.batchTastView._currRow = $(obj).closest('tr')[0];
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="WOM.batchProduceTask.batchProduceTask.batchTastView.getcallBackInfo";
			}

			if(_prefix!=''){
				WOM.batchProduceTask.batchProduceTask.batchTastView._prefix = _prefix.substring(1);
			}
			
			WOM.batchProduceTask.batchProduceTask.batchTastView._oGrid = oGrid;
			WOM.batchProduceTask.batchProduceTask.batchTastView._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					WOM.batchProduceTask.batchProduceTask.batchTastView._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					WOM.batchProduceTask.batchProduceTask.batchTastView._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					WOM.batchProduceTask.batchProduceTask.batchTastView._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					WOM.batchProduceTask.batchProduceTask.batchTastView._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					WOM.batchProduceTask.batchProduceTask.batchTastView._refViewCode = oColumn.viewCode;
				} else {
					WOM.batchProduceTask.batchProduceTask.batchTastView._refViewCode = '';
				}
			} else {
				WOM.batchProduceTask.batchProduceTask.batchTastView._isObjCustomProp = false;
				WOM.batchProduceTask.batchProduceTask.batchTastView._objCustomPropNames = '';
				WOM.batchProduceTask.batchProduceTask.batchTastView._refViewCode = '';
			}
			if (WOM.batchProduceTask.batchProduceTask.batchTastView._isObjCustomProp == true && WOM.batchProduceTask.batchProduceTask.batchTastView._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				WOM.batchProduceTask.batchProduceTask.batchTastView._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				WOM.batchProduceTask.batchProduceTask.batchTastView._customCallBack = customCallBack;
			}
			if(WOM.batchProduceTask.batchProduceTask.batchTastView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.batchProduceTask.batchProduceTask.batchTastView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof WOM.batchProduceTask.batchProduceTask.batchTastView._querycustomFuncN == "function") {
				refparam += WOM.batchProduceTask.batchProduceTask.batchTastView._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			WOM.batchProduceTask.batchProduceTask.batchTastView._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.batchProduceTask.batchProduceTask.batchTastView._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(WOM.batchProduceTask.batchProduceTask.batchTastView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.batchProduceTask.batchProduceTask.batchTastView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			WOM.batchProduceTask.batchProduceTask.batchTastView._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'WOM.batchProduceTask.batchProduceTask.batchTastView.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.batchProduceTask.batchProduceTask.batchTastView._querycustomFunc = function(obj) {
			var str = eval("typeof(WOM.batchProduceTask.batchProduceTask.batchTastView.query_"+obj+")!='undefined'") ? eval('WOM.batchProduceTask.batchProduceTask.batchTastView.query_'+obj+'()') : null;
			return str;
		};
		WOM.batchProduceTask.batchProduceTask.batchTastView.getcallBackGroupInfo = function(obj){
			var ids = "";
			var names = "";
			for(var i = 0 ; i < obj.length; i++){
				ids += "," + obj[i].id;
				names += "," + obj[i].name;
			}
			if(ids){ids = ids.substring(1);}
			if(names){names = names.substring(1);}
			$('#groupInfoIds').val(ids);
			$('#groupInfos').val(names);
			WOM.batchProduceTask.batchProduceTask.batchTastView._dialog.close();
		}
		WOM.batchProduceTask.batchProduceTask.batchTastView.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('WOM_batchProduceTask_batchProduceTask_batchTastView_form',obj[0], WOM.batchProduceTask.batchProduceTask.batchTastView._prefix, WOM.batchProduceTask.batchProduceTask.batchTastView._sUrl);
			CUI.commonFills('WOM_batchProduceTask_batchProduceTask_batchTastView_form',WOM.batchProduceTask.batchProduceTask.batchTastView._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (WOM.batchProduceTask.batchProduceTask.batchTastView._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(WOM.batchProduceTask.batchProduceTask.batchTastView._customCallBack) {
					eval(WOM.batchProduceTask.batchProduceTask.batchTastView._customCallBack);
					WOM.batchProduceTask.batchProduceTask.batchTastView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.batchProduceTask.batchProduceTask.batchTastView._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		WOM.batchProduceTask.batchProduceTask.batchTastView.getcallBackInfo_DG_IE = function(obj){
			if(WOM.batchProduceTask.batchProduceTask.batchTastView._customBeforeCallBack) {
				var flag = eval(WOM.batchProduceTask.batchProduceTask.batchTastView._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = WOM.batchProduceTask.batchProduceTask.batchTastView.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( WOM.batchProduceTask.batchProduceTask.batchTastView._isObjCustomProp_IE == true && WOM.batchProduceTask.batchProduceTask.batchTastView._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,WOM.batchProduceTask.batchProduceTask.batchTastView._sUrl,WOM.batchProduceTask.batchProduceTask.batchTastView._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,WOM.batchProduceTask.batchProduceTask.batchTastView._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (WOM.batchProduceTask.batchProduceTask.batchTastView._isObjCustomProp_IE == true && WOM.batchProduceTask.batchProduceTask.batchTastView._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = WOM.batchProduceTask.batchProduceTask.batchTastView._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = WOM.batchProduceTask.batchProduceTask.batchTastView._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
				for( var i = 0; i < xmlHead.children().length; i++ ){
					var tagName = xmlHead.children()[i].tagName;
					if ( tagName == (rootKey + 'MainDisplay') ) {
						try{
							var showVal = eval('jsonObj.' + showName);
						}catch(e){
							var showVal = eval('jsonObj["' + showName + '"]');
						}
						if (showVal != undefined ) {
							gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,showVal);
						} else {
							try {
								var trueVal = eval('jsonObj.' + trueName);
							} catch(e) {
								var trueVal = eval('jsonObj["' + trueName + '"]');
							}
							trueVal = ( trueVal != undefined ? trueVal : '' );
							gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,trueVal);
						}
					} else if ( tagName == rootKey ) {
						try{
							var trueVal = eval('jsonObj.' + trueName);
						}catch(e){
							var trueVal = eval('jsonObj["' + trueName + '"]');
						}
						trueVal = ( trueVal != undefined ? trueVal : '' );
						gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,trueVal);
					}
				}
			} else {
				for( var i = 0; i < xmlHead.children().length; i++ ){
					var tagName = xmlHead.children()[i].tagName;
					if( tagName.indexOf(rootKey) == 0 ){
						try{
							var value = eval('jsonObj.' + tagName.substring(rootKey.length+1));
						}catch(e){
							var value = eval('jsonObj["' + tagName.substring(rootKey.length+1)+'"]');
						}
						//判断符合条件的key是否存在
						value = ( value != undefined ? value : '' );
						gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,value);			
					}
				}
			}
			// 自定义字段参照回填
			if ( $('#dg_cp_info_' + gridEventObj.oGrid._DT.opts.id).length > 0 ) {
				var dg_cp_info = $('#dg_cp_info_' + gridEventObj.oGrid._DT.opts.id).val();
				var id = jsonObj.id;
				var relationMap;
				if (dg_cp_info && id && WOM.batchProduceTask.batchProduceTask.batchTastView._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + WOM.batchProduceTask.batchProduceTask.batchTastView._refViewCode_IE + '&id=' + id,
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
							var propCode = '';
							if (info.length > 2) {
								propCode = info[2];
							}
							var val = relationMap[key];
							if (val) {
								objs[name] = val;
								if (propCode) {
									$.ajax({
										async   : false,
										type    : 'POST',
										url     : '/foundation/customProp/getMainDisplayValue.action',
										data    : 'code=' + propCode + '&id=' + val,
										success : function(res){
											if (res.dealSuccessFlag && res.displayValue) {
												var displayName = name + 'MainDisplay';
												objs[displayName] = res.displayValue;
											}
										}
									});
								}
							}
						}
						// console.log(objs);
						if (objs) {
							for( var i = 0; i < xmlHead.children().length; i++ ){
								var tagName = xmlHead.children()[i].tagName;
								try{
									var value = eval('objs.' + tagName);
								}catch(e){
									var value = eval('objs["' + tagName + '"]');
								}
								if( value != undefined ){
									gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,value);
								}else if( objs.hasOwnProperty(  tagName  ) ){
									value = '';
									gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,value);
								}								
							}
						}
					}
				}
			}
			try{
				if(WOM.batchProduceTask.batchProduceTask.batchTastView._customCallBack) {
					eval(WOM.batchProduceTask.batchProduceTask.batchTastView._customCallBack);
					WOM.batchProduceTask.batchProduceTask.batchTastView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.batchProduceTask.batchProduceTask.batchTastView._dialog.close();
			} catch(e){}
			
			try{
				var errorMsg = ''
				for ( var item in  CUI.error_msg_DG_CP_map ){
					errorMsg += ( '<b>' + gridEventObj.oGrid._DT._oGrid.ColGetProperty(item,'caption') +  '</b>第<b>' + ( gridEventObj.nRow + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
				}
				if( errorMsg ){
					workbenchErrorBarWidget.showMessage( errorMsg );
				}	
			}catch(e){};
			
			gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
		}
		
		WOM.batchProduceTask.batchProduceTask.batchTastView.getcallBackInfo_DG = function(obj){
			if(WOM.batchProduceTask.batchProduceTask.batchTastView._customBeforeCallBack) {
				var flag = eval(WOM.batchProduceTask.batchProduceTask.batchTastView._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(WOM.batchProduceTask.batchProduceTask.batchTastView._currRow).next().length==0){
						WOM.batchProduceTask.batchProduceTask.batchTastView._oGrid.addNewRow();
					}	
					WOM.batchProduceTask.batchProduceTask.batchTastView._currRow = $(WOM.batchProduceTask.batchProduceTask.batchTastView._currRow).next();
					$(WOM.batchProduceTask.batchProduceTask.batchTastView._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(WOM.batchProduceTask.batchProduceTask.batchTastView._currRow,obj[i], WOM.batchProduceTask.batchProduceTask.batchTastView._prefix, WOM.batchProduceTask.batchProduceTask.batchTastView._sUrl);
				if (WOM.batchProduceTask.batchProduceTask.batchTastView._isObjCustomProp == true && WOM.batchProduceTask.batchProduceTask.batchTastView._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(WOM.batchProduceTask.batchProduceTask.batchTastView._currRow,WOM.batchProduceTask.batchProduceTask.batchTastView._prefix,obj[i],WOM.batchProduceTask.batchProduceTask.batchTastView._oGrid,WOM.batchProduceTask.batchProduceTask.batchTastView._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(WOM.batchProduceTask.batchProduceTask.batchTastView._currRow,WOM.batchProduceTask.batchProduceTask.batchTastView._prefix,obj[i],WOM.batchProduceTask.batchProduceTask.batchTastView._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + WOM.batchProduceTask.batchProduceTask.batchTastView._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + WOM.batchProduceTask.batchProduceTask.batchTastView._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && WOM.batchProduceTask.batchProduceTask.batchTastView._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + WOM.batchProduceTask.batchProduceTask.batchTastView._refViewCode + '&id=' + id,
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
								var propCode = '';
								if (info.length > 2) {
									propCode = info[2];
								}
								var val = relationMap[key];
								if (val) {
									name = WOM.batchProduceTask.batchProduceTask.batchTastView._oGrid.configs.hidekeyPrefix + name;
									objs[name] = val;
									if (propCode) {
										$.ajax({
											async   : false,
											type    : 'POST',
											url     : '/foundation/customProp/getMainDisplayValue.action',
											data    : 'code=' + propCode + '&id=' + val,
											success : function(res){
												if (res.dealSuccessFlag && res.displayValue) {
													var displayName = name + 'MainDisplay';
													objs[displayName] = res.displayValue;
												}
											}
										});
									}
								}
							}
							// console.log(objs);
							if (objs) {
								CUI.commonFills_DG_CP(WOM.batchProduceTask.batchProduceTask.batchTastView._currRow, objs, WOM.batchProduceTask.batchProduceTask.batchTastView._oGrid);
							}
						}
					}
				}
			}
			try{
				if(WOM.batchProduceTask.batchProduceTask.batchTastView._customCallBack) {
					eval(WOM.batchProduceTask.batchProduceTask.batchTastView._customCallBack);
					WOM.batchProduceTask.batchProduceTask.batchTastView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.batchProduceTask.batchProduceTask.batchTastView._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + WOM.batchProduceTask.batchProduceTask.batchTastView._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		WOM.batchProduceTask.batchProduceTask.batchTastView.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(WOM.batchProduceTask.batchProduceTask.batchTastView._oGrid, WOM.batchProduceTask.batchProduceTask.batchTastView._currRow, WOM.batchProduceTask.batchProduceTask.batchTastView._key, WOM.batchProduceTask.batchProduceTask.batchTastView._displayFieldName, obj[i])
			}
			try{
				if(WOM.batchProduceTask.batchProduceTask.batchTastView._customCallBack) {
					eval(WOM.batchProduceTask.batchProduceTask.batchTastView._customCallBack);
					WOM.batchProduceTask.batchProduceTask.batchTastView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.batchProduceTask.batchProduceTask.batchTastView._dialog.close();
			} catch(e){}
		};
		
		WOM.batchProduceTask.batchProduceTask.batchTastView.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						WOM.batchProduceTask.batchProduceTask.batchTastView.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#WOM_batchProduceTask_batchProduceTask_batchTastView_form'));
						}
					}
				}
			});
		};

		$(function(){
			WOM.batchProduceTask.batchProduceTask.batchTastView.onloadForProduct();
		});

		WOM.batchProduceTask.batchProduceTask.batchTastView.beforeSubmitMethodSettingInPage = function(){
			WOM.batchProduceTask.batchProduceTask.batchTastView.onsaveForProduct();
		};
		WOM.batchProduceTask.batchProduceTask.batchTastView.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  WOM.batchProduceTask.batchProduceTask.batchTastView.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		WOM.batchProduceTask.batchProduceTask.batchTastView.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
			var id="#otherContentDiv_"+relatingModelCode;
			if(url.indexOf('?')==-1){
				url+="?mainBusinessId="+mainEntityId+"&businessCenterCode="+businessCenterCode;
			}else{
				url+="&mainBusinessId="+mainEntityId+"&businessCenterCode="+businessCenterCode;
			}
			if(showType == 'PART') {
				url += "&viewShowType=" + showType;
			}
			url += "&useInBusiness=yes";
			$('div[id^="otherContentDiv_"]').each(function(){
				CUI(this).hide();
			});
			CUI(id).show();
			if(CUI(id).html() == null || $.trim(CUI(id).html()) == ""){
				CUI(id).load(url);
				setTimeout(function(){
					CUI("#WOM_batchProduceTask_batchProduceTask_batchTastView_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#WOM_batchProduceTask_batchProduceTask_batchTastView_main_div").hide();
				},100);
				//CUI("#WOM_batchProduceTask_batchProduceTask_batchTastView_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		WOM.batchProduceTask.batchProduceTask.batchTastView.showThis = function(){
			if(!CUI("#WOM_batchProduceTask_batchProduceTask_batchTastView_main_div").is(':visible')) {
				CUI("#WOM_batchProduceTask_batchProduceTask_batchTastView_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		WOM.batchProduceTask.batchProduceTask.batchTastView.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			WOM.batchProduceTask.batchProduceTask.batchTastView.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "WOM_batchProduceTask_batchProduceTask_batchTastView_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=WOM&modelName=WOM_7.5.0.0_batchProduceTask_BatchProduceTask&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.batchProduceTask.batchProduceTask.batchTastView.auditDialog.show();
			</#if>
		}
		
		
		WOM.batchProduceTask.batchProduceTask.batchTastView.showInfoDialog=function(mode){
			
			WOM.batchProduceTask.batchProduceTask.batchTastView.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "WOM_batchProduceTask_batchProduceTask_batchTastView_dealInfo",
				modal:true,
				height:500,
				width: 950,//适应国际化版
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.batchProduceTask.batchProduceTask.batchTastView.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		WOM.batchProduceTask.batchProduceTask.batchTastView.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			<#if pendingId??>
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=WOM_7.5.0.0_batchProduceTask");
			<#else>
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?readOnlyFlag=true&linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=WOM_7.5.0.0_batchProduceTask");
			</#if>
			}
		}
		
		WOM.batchProduceTask.batchProduceTask.batchTastView.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/WOM/batchProduceTask/batchProduceTask/dealInfo-list.action&dlTableInfoId=${(batchProduceTask.tableInfoId)?default('')}");
			}
		}
		WOM.batchProduceTask.batchProduceTask.batchTastView.showFlowInfo=function(){
		     //IE8环境下使用旧版flash流程展现页面，其他情况使用html5流程展现页面
		    var browser=navigator.appName; 
			var b_version=navigator.appVersion; 
			var version=b_version.split(";"); 
			var trim_Version=version[1]&&version[1].replace(/[ ]/g,"");
			var isIE8=(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE8.0")||($.browser.msie&&(Number($.browser.version)<= 8));//IE8兼容视图模式下浏览器版本判断逻辑补充
			if(CUI.trim(CUI("#flowDiv").html())==""){
				if(isIE8){
				    CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=WOM_7.5.0.0_batchProduceTask_BatchProduceTask&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(batchProduceTask.tableInfoId)?default('')}");
				}else{
				    CUI("#flowDiv").load("/ec/workflow/flowViewH5.action?env=runtime&modelCode=WOM_7.5.0.0_batchProduceTask_BatchProduceTask&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(batchProduceTask.tableInfoId)?default('')}");
				}		
			}else{
			  if(!isIE8){
			    //h5展现的情况下需重新适应视图大小
			    setTimeout(function(){
			      $("#flowH5Frame").contents().find("#resetFitView").trigger("click");//视图自适应容器大小 
			    },100); 
			  } 
			}
		}
		WOM.batchProduceTask.batchProduceTask.batchTastView.supervision=function(){
			WOM.batchProduceTask.batchProduceTask.batchTastView.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(batchProduceTask.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				WOM.batchProduceTask.batchProduceTask.batchTastView.modifyOwnerStaffDialog.show();
		}
		



		/* CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_batchProduceTask_batchTastView,js,WOM_7.5.0.0_batchProduceTask_BatchProduceTask,WOM_7.5.0.0) */
// 自定义代码


 function  taskDetailView(){
    var type=$("[name='batchProduceTask.taskType.id']").val();
	var row=BatchProdTaskPart_dg1496366180645Widget.getSelectedRow();
	if(row==undefined){
		 workbenchErrorBarWidget.showMessage("${getText('ec.business.view.choose.one')}","f");
		 return false;
	}else{
		 var batchTaskId=BatchProdTaskPart_dg1496366180645Widget.getCellValue(BatchProdTaskPart_dg1496366180645Widget.getSelectedRow(),'id');
		 //所选择的行数据尚未生成指令
		 if(batchTaskId=='' || batchTaskId==undefined){
		   workbenchErrorBarWidget.showMessage("${getText('WOM.errorMesg.randogfffdeftg4456')}","f");
		   return false;
		 }
		 
		 //通过样品id查找默认配方
		 $.ajax({
			url : "/WOM/produceTask/produceTask/getProduceTaskByBatchID.action",
			type : 'post',
			traditional: true,
			async : false,
			data:{"batchTaskId":batchTaskId},
			success : function(res) {
			    //已经生成了指令
				if(res.dealSuccessFlag==true){
				  var id=res.taskId;
				  var tableInfoId=res.taskTableInfoId;
				  var url='';
				  //制造
				  if(type=='womTaskType/type1'){
				    var powerCode=gerPowerCode('makeTaskFlow');
				    var url='/WOM/produceTask/produceTask/makeTaskView.action?&tableInfoId='+tableInfoId+'&entityCode=WOM_7.5.0.0_produceTask&id='+id+'&__pc__='+powerCode;
				  }
				  //包装
				  if(type=='womTaskType/type2'){
				    var powerCode=gerPowerCode('packageTaskFlow');
				    var url='/WOM/produceTask/produceTask/packageTaskView.action?&tableInfoId='+tableInfoId+'&entityCode=WOM_7.5.0.0_produceTask&id='+id+'&__pc__='+powerCode;
				  }
				  if(url!=''){
					 openFullScreen(url);
				  }
				}
				 //尚未生成指令
				if(res.dealSuccessFlag==false){
				   workbenchErrorBarWidget.showMessage("${getText('WOM.errorMesg.randogfffdeftg4456')}","f");
		           return false;
				}
			}
		 });		 		
	}
}




  function gerPowerCode(change){

      var deploymentId="";  //流程部署id
      var powerCode = "";   //权限code（_pc_）
      CUI.ajax({
          url: "/ec/workflow/getCurrentDeployment.action?processKey="+change, //change为工作流key
          type: 'post',
          async: false,
          success: function(msg) {
                 deploymentId = msg.deploymentId;
      }
      });
      if(deploymentId==undefined || deploymentId===""){
          CUI.Dialog.alert("工作流配置有问题，请联系管理员！");
          return false;
      }
      CUI.ajax({
          url: "/ec/workflow/getStartActivePowerCode.action?deploymentId="+deploymentId,
          type: 'post',
          async: false,
          success: function(msg) {
          powerCode = msg.powerCode;
      }
      });

      return powerCode;
  }
/* CUSTOM CODE END */
		WOM.batchProduceTask.batchProduceTask.batchTastView.onloadForProduct = function(){
		/* CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_batchProduceTask_batchTastView,onloadForProduct,WOM_7.5.0.0_batchProduceTask_BatchProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		}

		WOM.batchProduceTask.batchProduceTask.batchTastView.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_batchProduceTask_batchTastView,onsaveForProduct,WOM_7.5.0.0_batchProduceTask_BatchProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */		
		}
		
		</script>
		<script type="text/javascript">
		
		var __last_click_item = null;
		$(".edit-tabs li").click(function(){
			var li = $(this);
			var ul=$("#flowHead").parent()[0];
			if(__last_click_item != null){
				$(ul).children().eq(__last_click_item).next().addClass("bar");
			}
			if(__last_click_item == null){
				__last_click_item = li.index();
			}
			__last_click_item = li.index();
			if(li.index() == ($(".edit-tabs li").length-1)){
			}else{
				li.next().removeClass("bar");
			}
			if(li.index() != 0){
				li.addClass("bar");
			}
			// 触发 resize 事件, 解决用户在其他页签下缩放窗口后，再切换回来时pt等元素宽度会对不上
			setTimeout( function(){
				$(window).trigger('resize');
			}, 100)
		})
		
		</script>
		<script type="text/javascript">
			$(function(){
				$(".edit-btn").hover(
				  function () {
					$(this).addClass("edit-btn-hover");
				  },
				  function () {
					$(this).removeClass("edit-btn-hover");
				  });
				  $(".edit-btn").mousedown(
				  function () {
					$(this).addClass("edit-btn-click");
				  });
				  $(".edit-btn").mouseup(
				  function () {
					$(this).removeClass("edit-btn-click");
				  });
			})
		</script>
		</@s.form>
		<#if businessCenterList??&&businessCenterList?size gt 0 >
		<script type="text/javascript">
			$(function(){
				$(".col-sub").css("display","block");
				$(".main-wrap").css("margin-left",145);
			})
		</script>
		<div class="col-sub">
			<div id="edit_side_btn" class="edit-side-btn"></div>
			<div class="edit-sidebar" id="edit_sidebar" style='height:1000px;'>
			<div class="edit-sidebar-inner" style='height:1000px;'>
				<div class="sidebar-top"><a href="#"  onclick="WOM.batchProduceTask.batchProduceTask.batchTastView.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="WOM.batchProduceTask.batchProduceTask.batchTastView.showBusinessList('${l.relatingModel.code.replace('.','')}',${(batchProduceTask.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
							</#if>
						</li>
					    </#list>
					</ul>
				</div>
			</div>
			</div>				
		</div>
		</#if>
		
	<div id="printSettingDiv" style="display:none;width:100%;height:100%;text-align:center">
		<input type="hidden" id="printCookie_id" />
		<input type="hidden" id="printCookie_version" />
		<table width="100%" height="100%" align="center" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td class="td_right">
					<input type="checkbox" name="mainContent" id="mainContent" checked="checked" />
				</td>
				<td class="td_left">
					<label>正文</label>
				</td>
				<td class="td_right" name="att">
					<input type="checkbox" name="attachmentInfo" id="attachmentInfo" checked="checked"/>
				</td>
				<td class="td_left" name="att">
					<label>附件信息</label>
				</td>
				<td class="td_right" name="deal">
					<input type="checkbox" name="dealInfo" id="dealInfo" checked="checked"/>
				</td>
				<td class="td_left" name="deal">
					<label>处理意见</label>
				</td>
			</tr>
		</table>
	</div>
		<!--[if IE 6]><div style="clear:both;"></div><![endif]-->
		<iframe style="display:none;" id="downloadFrame" src="about:blank"/>
	</body>
</html>