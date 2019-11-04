<!-- WOM_7.5.0.0/prepareMaterial/prepareBackView -->
<#assign isWorkflow = true> 
<#assign isAttachment = true> 
	<#assign fileuploadType = "Table">
	<#assign fileuploadLinkId = prepareMaterial.tableInfoId!>
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
<#assign tableObj = prepareMaterial>
<#-- 命名空间 -->
<#assign editPageNs = "WOM.prepareMaterial.prepareMaterial.prepareBackView">
<#-- 模型名称-->
<#assign modelName = "prepareMaterial">
<#-- 视图编码-->
<#assign viewCode = "WOM_7.5.0.0_prepareMaterial_prepareBackView">
<#-- 实体编码-->
<#assign entity_code = "WOM_7.5.0.0_prepareMaterial">
<#-- 视图名称-->
<#assign viewName = "prepareBackView">
<#-- datagrid编码-->
<#assign datagridCode = "WOM_prepareMaterial_prepareMaterial_prepareBackView_datagrids">
<#-- 首字母大写的模型名称-->
<#assign upcaseModelName = "PrepareMaterial">
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
<#assign editFormId = "WOM_prepareMaterial_prepareMaterial_prepareBackView_form">
<#-- 待办状态 -->
<#assign pendingstatus =( prepareMaterial.pending.taskDescription)!>
<#-- 打印控件名称 -->
<#assign controlName = "ec.print.controlPrint">
<#-- 批量？？ -->
<#assign isBatch = false>
<#assign payCloseAttention = false>
<#-- 自定义按钮 -->
<#assign operateButtons =[{"operateButtonId":"prepareBackRef","permissionCode":"","ispermission":false,"isHide":true,"regionType":"BUTTON","funcname":"onclick='prepareBackRefClick()'","namekey":"WOM.buttonPropertyshowName.randon1566520979513.flag"}] >
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
	
		
	
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <#assign configTitle = getText('WOM.viewdisplayName.randon1566463020817')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		
		#WOM_prepareMaterial_prepareMaterial_prepareBackView_form{float:left;width:100%;}
		
		
		</style>
		<script type="text/javascript">
			CUI.ns('WOM.prepareMaterial.prepareMaterial.prepareBackView');
			WOM.prepareMaterial.prepareMaterial.prepareBackView.currentUser = ${userJson};
			WOM.prepareMaterial.prepareMaterial.prepareBackView.currentStaff = ${staffJson};
			WOM.prepareMaterial.prepareMaterial.prepareBackView.currentDepartment = ${deptJson};
			WOM.prepareMaterial.prepareMaterial.prepareBackView.currentPosition = ${postJson};
			WOM.prepareMaterial.prepareMaterial.prepareBackView.currentCompany = ${compJson};
		</script>
		<!-- CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_prepareMaterial_prepareBackView,head,WOM_7.5.0.0_prepareMaterial_PrepareMaterial,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
    </head>
	<body class="view-edit ">
		<@loadpanel newType=true/>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="prepareMaterial.applyStaff.id,prepareMaterial.wareID.id,prepareMaterial.manulOrderMain.id," onsubmitMethod="WOM.prepareMaterial.prepareMaterial.prepareBackView.beforeSubmitMethod()" id="WOM_prepareMaterial_prepareMaterial_prepareBackView_form" namespace="/WOM/prepareMaterial/prepareMaterial/prepareBackView" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=WOM_7.5.0.0_prepareMaterial_PrepareMaterial&_bapFieldPermissonModelName_=PrepareMaterial&superEdit=${(superEdit!false)?string}" editPageNs="WOM.prepareMaterial.prepareMaterial.prepareBackView" callback="WOM.prepareMaterial.prepareMaterial.prepareBackView._callBackInfo" ecform="true">
			<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
			<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="WOM_prepareMaterial_prepareMaterial_prepareBackView_main_div">
			<div class="edit-head">
				<#include "../../../ec/tableInfo/operateheadbar_all.ftl" >
				<#include "../../../ec/tableInfo/creatorInfo.ftl" >
			</div>
    		<div class="edit-main" id="WOM_prepareMaterial_prepareMaterial_prepareBackView">
    			<div class="edit-content">
    	<#include "../../../ec/tableInfo/formparam.ftl" >				
					<input type="hidden" name="prepareMaterial.applyStaff.id" value="${(prepareMaterial.applyStaff.id)!""}" originalvalue="${(prepareMaterial.applyStaff.id)!""}"/>
					<input type="hidden" name="prepareMaterial.wareID.id" value="${(prepareMaterial.wareID.id)!""}" originalvalue="${(prepareMaterial.wareID.id)!""}"/>
					<input type="hidden" name="prepareMaterial.manulOrderMain.id" value="${(prepareMaterial.manulOrderMain.id)!""}" originalvalue="${(prepareMaterial.manulOrderMain.id)!""}"/>
		<div class="dash-line"></div>
<script type="text/javascript">
var attcountid = "WOM_prepareMaterial_prepareMaterial_prepareBackView_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=WOM_7.5.0.0_prepareMaterial', null, function(){
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
					
							<label style="width:100%;;" value="${getText('WOM.propertyshowName.randon1566463541868.flag')}" >${getText('WOM.propertyshowName.randon1566463541868.flag')}</label>
				</td>
				
						<#assign prepareMaterial_applyStaff_name_defaultValue  = 'currentUser'>
												<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.view.reference')}" viewType="${viewType!}" deValue="${prepareMaterial_applyStaff_name_defaultValue!}" conditionfunc="WOM.prepareMaterial.prepareMaterial.prepareBackView._querycustomFunc('prepareMaterial_applyStaff_name')" view=true  value="${(prepareMaterial.applyStaff.name)!}" displayFieldName="name" name="prepareMaterial.applyStaff.name" id="prepareMaterial_applyStaff_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="WOM_prepareMaterial_prepareMaterial_prepareBackView_form" editCustomCallback=";" refViewCode="sysbase_1.0_staff_ref" onkeyupfuncname=";_callback_prepareMaterial_applyStaff_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (prepareMaterial_applyStaff_name_defaultValue)=='currentUser'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.id}'};
											obj = foundation.common.getObject('WOM_prepareMaterial_prepareMaterial_prepareBackView_form',obj, 'prepareMaterial.applyStaff', '/foundation/staff/common/staffListFrameset.action');
											CUI.commonFills('WOM_prepareMaterial_prepareMaterial_prepareBackView_form', 'prepareMaterial.applyStaff',obj,true);
											$('input:hidden[name="prepareMaterial.applyStaff.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(prepareMaterial.id)?? && (prepareMaterial.applyStaff.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${prepareMaterial.applyStaff.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_prepareMaterial_prepareMaterial_prepareBackView_form',obj, 'prepareMaterial.applyStaff', '/foundation/staff/common/staffListFrameset.action');
												CUI.commonFills('WOM_prepareMaterial_prepareMaterial_prepareBackView_form', 'prepareMaterial.applyStaff',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1492392059136')}" >${getText('WOM.propertydisplayName.randon1492392059136')}</label>
				</td>
				
						<#assign prepareMaterial_applyDate_defaultValue  = 'currentTime'>
							 					<#if (prepareMaterial_applyDate_defaultValue)?? &&(prepareMaterial_applyDate_defaultValue)?has_content>
							<#assign prepareMaterial_applyDate_defaultValue  = getDefaultDateTime(prepareMaterial_applyDate_defaultValue!)?datetime>
					</#if>
					<td  nullable=false class="edit-table-content" celltype="DATETIME"  align="left" style="text-align: left;;" >
					
							
							<#if newObj && !(prepareMaterial.applyDate)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="prepareMaterial.applyDate" value="${prepareMaterial_applyDate_defaultValue!}" type="dateTime"  id="prepareMaterial.applyDate"  view=true cssStyle=""   align="left"/>
								
							<#else>
							<#if (prepareMaterial.applyDate)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="prepareMaterial.applyDate" value="${prepareMaterial.applyDate?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="prepareMaterial.applyDate"  view=true cssStyle="" align="left"  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="prepareMaterial.applyDate" value="" type="dateTime" id="prepareMaterial.applyDate" cssStyle=""  view=true align="left"/>
								
							</#if>
							</#if>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1563193157341')}" >${getText('WOM.propertydisplayName.randon1563193157341')}</label>
				</td>
				
						<#assign prepareMaterial_manulOrderMain_manulOrderNum_defaultValue  = ''>
														<#assign prepareMaterial_manulOrderMain_manulOrderNum_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('WOM.viewtitle.randon1563350015905')}" viewType="${viewType!}" deValue="${prepareMaterial_manulOrderMain_manulOrderNum_defaultValue!}" conditionfunc="WOM.prepareMaterial.prepareMaterial.prepareBackView._querycustomFunc('prepareMaterial_manulOrderMain_manulOrderNum')" view=true  value="${(prepareMaterial.manulOrderMain.manulOrderNum)!}" displayFieldName="manulOrderNum" name="prepareMaterial.manulOrderMain.manulOrderNum" id="prepareMaterial_manulOrderMain_manulOrderNum" type="other" url="/WOM/manulOrder/manulOrderMain/manulOrdersRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_prepareMaterial_prepareMaterial_prepareBackView_form" editCustomCallback=";" refViewCode="WOM_7.5.0.0_manulOrder_manulOrdersRef"  onkeyupfuncname=";_callback_prepareMaterial_manulOrderMain_manulOrderNum(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(prepareMaterial.id)?? && (prepareMaterial.manulOrderMain.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${prepareMaterial.manulOrderMain.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_prepareMaterial_prepareMaterial_prepareBackView_form',obj, 'prepareMaterial.manulOrderMain', '/WOM/manulOrder/manulOrderMain/manulOrdersRef.action');
												CUI.commonFills('WOM_prepareMaterial_prepareMaterial_prepareBackView_form', 'prepareMaterial.manulOrderMain',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertyshowName.randon1566805057967.flag')}" >${getText('WOM.propertyshowName.randon1566805057967.flag')}</label>
				</td>
				
						<#assign prepareMaterial_incode_defaultValue  = ''>
							 							<#assign prepareMaterial_incode_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="prepareMaterial.incode" id="prepareMaterial_incode"  style=";" originalvalue="<#if !newObj || (prepareMaterial.incode)?has_content>${(prepareMaterial.incode?html)!}<#else>${prepareMaterial_incode_defaultValue!}</#if>" value="<#if !newObj || (prepareMaterial.incode)?has_content>${(prepareMaterial.incode?html)!}<#else>${prepareMaterial_incode_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1565059377008')}" >${getText('WOM.propertydisplayName.randon1565059377008')}</label>
				</td>
				
						<#assign prepareMaterial_outCode_defaultValue  = ''>
							 							<#assign prepareMaterial_outCode_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="prepareMaterial.outCode" id="prepareMaterial_outCode"  style=";" originalvalue="<#if !newObj || (prepareMaterial.outCode)?has_content>${(prepareMaterial.outCode?html)!}<#else>${prepareMaterial_outCode_defaultValue!}</#if>" value="<#if !newObj || (prepareMaterial.outCode)?has_content>${(prepareMaterial.outCode?html)!}<#else>${prepareMaterial_outCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
		</tr>
	</table>
		<#assign cpvmInfo = ''>
			<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_prepareMaterial_PrepareMaterial", "WOM_7.5.0.0_prepareMaterial_prepareBackView", 'EDIT')>
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
					<#assign elementName = 'prepareMaterial' + "." + columnName>
					<#assign elementId = 'prepareMaterial' + "_" + columnName>
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
						<#if prepareMaterial[columnName]??>
							<#assign dateVal = (prepareMaterial[columnName])?string('yyyy-MM-dd HH:mm:ss')>
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
							<@systemcode property_type="${columnType}" iscustom=true showType="${fieldType}" viewType=viewType cssStyle="text-align:${c.align!}" formId="WOM_prepareMaterial_prepareMaterial_prepareBackView_form" classStyle="cui-noborder-input" view=true cssStyle="" ecFlag=true multable=isMultable name="${elementName}" code="${(c.property.fillcontentMap.fillContent)!}" value="${prepareMaterial[columnName]!}" seniorSystemCode=isS2 />
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
							<input type="hidden" iscustom="true" name="${elementName}" value="${prepareMaterial[columnName]!}" />
							<input type="hidden" name="${elementName}.${pkName!'id'}" value="${prepareMaterial[columnName]!}" />
							<@mneclient iframe=false property_type="${columnType}" mneenable=false reftitle="${getText('${viewTitle!}')}" viewType=viewType cssStyle="text-align:${c.align!}" view=true value="${prepareMaterial[displayColumnName]!}" name="${elementName}.${mainDisplayName!'name'}" id="${elementName?replace('.', '_')}_${mainDisplayName!'name'}" type="${mneType}" url="${viewUrl!}" clicked=true multiple=false isEdit=true mnewidth=260 formId="WOM_prepareMaterial_prepareMaterial_prepareBackView_form" editCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}()" delCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}_delete()" />
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
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertyshowName.randon1566464224015.flag')}" >${getText('WOM.propertyshowName.randon1566464224015.flag')}</label>
				</td>
				
						<#assign prepareMaterial_remark_defaultValue  = ''>
							 							<#assign prepareMaterial_remark_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   colspan="5" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly fix-ie7-textarea"><textarea property_type="TEXT" id="prepareMaterial_remark" originalvalue="<#if !newObj || (prepareMaterial.remark)?has_content>${(prepareMaterial.remark?html)!}<#else>${prepareMaterial_remark_defaultValue?html}</#if>"  name="prepareMaterial.remark" class="cui-noborder-textarea cui-textarea-auto" readonly="readonly" style=";" ><#if !newObj || (prepareMaterial.remark)?has_content>${(prepareMaterial.remark)!}<#else>${prepareMaterial_remark_defaultValue}</#if></textarea></div>
							
				</td>
				</tr><tr >
						<#assign complex_datagrid_1489978265559_defaultValue  = ''>
				<td nullable=false class="edit-table-content"  colspan="6" style="text-align: left;;" >
				</td>
		</tr>
	</table>
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display :none;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1566464583222')}" >${getText('WOM.propertydisplayName.randon1566464583222')}</label>
				</td>
				
						<#assign prepareMaterial_backFlag_defaultValue  = 'true'>
							 					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;display :none;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="prepareMaterial.backFlag_check" originalvalue="<#if !newObj><#if (prepareMaterial.backFlag)??>${(prepareMaterial.backFlag!false)?string('true','false')}<#else>false</#if><#elseif prepareMaterial_backFlag_defaultValue?has_content>${(prepareMaterial_backFlag_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (prepareMaterial.backFlag)??>${(prepareMaterial.backFlag!false)?string('true','false')}<#else>false</#if><#else>${(prepareMaterial_backFlag_defaultValue!true)?string}</#if>"  disabled=true/>
								
								<input property_type="BOOLEAN" type="hidden" name="prepareMaterial.backFlag" originalvalue="<#if ((prepareMaterial.backFlag)?? &&  prepareMaterial.backFlag)||(prepareMaterial_backFlag_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((prepareMaterial.backFlag)?? &&  prepareMaterial.backFlag)||(prepareMaterial_backFlag_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="prepareMaterial.backFlag_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="prepareMaterial.backFlag"]');
												CUI('input[name="prepareMaterial.backFlag_check"]').each(function(){
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
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display :none;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1484031239866')}" >${getText('MESBasic.propertydisplayName.randon1484031239866')}</label>
				</td>
				
						<#assign prepareMaterial_wareID_wareCode_defaultValue  = ''>
														<#assign prepareMaterial_wareID_wareCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;display :none;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1484032238590')}" viewType="${viewType!}" deValue="${prepareMaterial_wareID_wareCode_defaultValue!}" conditionfunc="WOM.prepareMaterial.prepareMaterial.prepareBackView._querycustomFunc('prepareMaterial_wareID_wareCode')" view=true  value="${(prepareMaterial.wareID.wareCode)!}" displayFieldName="wareCode" name="prepareMaterial.wareID.wareCode" id="prepareMaterial_wareID_wareCode" type="other" url="/MESBasic/wareMan/ware/wareRefStore.action" clicked=true multiple=false mnewidth=260 formId="WOM_prepareMaterial_prepareMaterial_prepareBackView_form" editCustomCallback=";" refViewCode="MESBasic_1_wareMan_wareRefStore" onkeyupfuncname=";_callback_prepareMaterial_wareID_wareCode(obj);" cssStyle="" isEdit=true beforecallback='clearStore(obj)'    isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(prepareMaterial.id)?? && (prepareMaterial.wareID.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${prepareMaterial.wareID.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_prepareMaterial_prepareMaterial_prepareBackView_form',obj, 'prepareMaterial.wareID', '/MESBasic/wareMan/ware/wareRefStore.action');
												CUI.commonFills('WOM_prepareMaterial_prepareMaterial_prepareBackView_form', 'prepareMaterial.wareID',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
		</tr>
	</table>
</div>				</div>
				<div class="edit-datatable">	

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
			
								<script type="text/javascript">
									function PrepareMaterialPart_dg1567404925228_prepareBackRefClick(event)
																		 {
				//当表体数据不为空时，做出提示
				
				if(PrepareMaterialPart_dg1566463128930Widget.getRowLength()!=0){			
					CUI.Dialog.confirm("${getText('WOM.showMessage00000004')}",
						function() {
							//如果确认则继续执行
							//打开指令单dialog框
							taskRef_dialog = foundation.common.select({
								pageType: 'other',
								closePage: false,
								callBackFuncName: '_callback_preparePartRef',
								url: '/WOM/prepareMaterial/prepareMaterialPart/preparePartRef.action',
								title: "${getText('WOM.viewtitle.randon1489977705571')}",
								params: ''
							});
						}
					);
				
				} else {
					//打开指令单dialog框
					taskRef_dialog = foundation.common.select({
						pageType: 'other',
						closePage: false,
						callBackFuncName: '_callback_preparePartRef',
						url: '/WOM/prepareMaterial/prepareMaterialPart/preparePartRef.action',
						title: "${getText('WOM.viewtitle.randon1489977705571')}",
						params: ''
					});
				}
					
			}
								</script>
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/WOM/prepareMaterial/prepareMaterial/data-dg1567404925228.action?prepareMaterial.id=${refId!-1}&refId=${refId!-1}&datagridCode=WOM_7.5.0.0_prepareMaterial_prepareBackViewdg1567404925228">
			<#else>
				<#assign dUrl="/WOM/prepareMaterial/prepareMaterial/data-dg1567404925228.action?prepareMaterial.id=${(prepareMaterial.id)!-1}&datagridCode=WOM_7.5.0.0_prepareMaterial_prepareBackViewdg1567404925228">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('WOM.buttonPropertyshowName.randon1566551324579.flag')}\",handler:function(event){PrepareMaterialPart_dg1567404925228_prepareBackRefClick(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('WOM.buttonPropertyshowName.randon1566551324579.flag')}\",handler:function(event){PrepareMaterialPart_dg1567404925228_prepareBackRefClick(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_PrepareMaterialPart_dg1567404925228" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1567404925228_id" value="PrepareMaterialPart_dg1567404925228" />
			
			<input type="hidden" id="dg1567404925228_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('WOM.modelname.randon1489976792140')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/WOM/prepareMaterial/prepareMaterial/data-dg1567404925228.action?operateType=export&datagridCode=WOM_7.5.0.0_prepareMaterial_prepareBackViewdg1567404925228"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="PrepareMaterialPart_dg1567404925228" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="PrepareMaterialPart_dg1567404925228" viewType="${viewType}" renderOverEvent="dg1567404925228RenderOverEvent" route="${routeFlag}" formId="WOM_prepareMaterial_prepareMaterial_prepareBackView_form" noPermissionKeys="productId.productCode,productId.productName,productId.productBaseUnit.name,useNum,hasDoneNum,ware.wareCode,remark,batchNum" modelCode="WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1567404925228" dtPage="dgPage"  hidekeyPrefix="dg1567404925228" hidekey="['id','version','productId.id','productId.productCode','productId.id','productId.productName','productId.id','productId.productBaseUnit.name','ware.id','ware.wareCode'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=false  buttons="${buttons}" noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1567404925228PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=false cannotDeleteRow=true assModelDisplayName=assModelDisplayName  activexButton="WOM.buttonPropertyshowName.randon1566551324579.flag,prepareBackRefClick,add" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
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

									<@datacolumn key="productId.productCode"        showFormat="SELECTCOMP" defaultValue="${(productId_productCode_defaultValue!)?string}" defaultDisplay="${(productId_productCode_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.prepareMaterial.prepareMaterial.prepareBackView"  textalign="left"  viewUrl="/MESBasic/product/product/refProductLayout_kc.action" viewCode="MESBasic_1_product_refProductLayout_kc" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1478746948423')}"  label="${getText('WOM.propertydisplayName.radion1415772644833222')}" width=150 showFormatFunc=""  />
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

									<@datacolumn key="productId.productName"        showFormat="SELECTCOMP" defaultValue="${(productId_productName_defaultValue!)?string}" defaultDisplay="${(productId_productName_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.prepareMaterial.prepareMaterial.prepareBackView"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('WOM.propertydisplayName.radion1415772740737334')}" width=150 showFormatFunc=""  />
							<#assign productId_productBaseUnit_name_displayDefaultType=''>
								<#assign productId_productBaseUnit_name_defaultValue=''>
										<#assign productId_productBaseUnit_name_defaultValue=''>
																	<#if (productId_productBaseUnit_name_defaultValue!)?string=="currentUser">
								<#assign productId_productBaseUnit_name_defaultValue='${staffJson!}'>
							<#elseif (productId_productBaseUnit_name_defaultValue!)?string=="currentPost">
								<#assign productId_productBaseUnit_name_defaultValue='${postJson!}'>
							<#elseif (productId_productBaseUnit_name_defaultValue!)?string=="currentDepart">
								<#assign productId_productBaseUnit_name_defaultValue='${deptJson!}'>
							<#elseif (productId_productBaseUnit_name_defaultValue!)?string=="currentComp">
								<#assign productId_productBaseUnit_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="productId.productBaseUnit.name"        showFormat="TEXT" defaultValue="${(productId_productBaseUnit_name_defaultValue!)?string}" defaultDisplay="${(productId_productBaseUnit_name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.prepareMaterial.prepareMaterial.prepareBackView"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('WOM.propertydisplayName.radion1398235640483')}" width=100 showFormatFunc=""  />
							<#assign useNum_displayDefaultType=''>
								<#assign useNum_defaultValue=''>
										<#assign useNum_defaultValue=''>
										 
									<@datacolumn key="useNum"        showFormat="TEXT" defaultValue="${(useNum_defaultValue!)?string}" defaultDisplay="${(useNum_displayDefaultType!)?string}" decimal="3" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertyshowName.randon1566367615619.flag')}" width=100 showFormatFunc=""  />
							<#assign hasDoneNum_displayDefaultType=''>
								<#assign hasDoneNum_defaultValue=''>
										<#assign hasDoneNum_defaultValue=''>
										 
									<@datacolumn key="hasDoneNum"        showFormat="TEXT" defaultValue="${(hasDoneNum_defaultValue!)?string}" defaultDisplay="${(hasDoneNum_displayDefaultType!)?string}" decimal="6" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1496907448812')}" width=100 showFormatFunc=""  />
							<#assign ware_wareCode_displayDefaultType=''>
								<#assign ware_wareCode_defaultValue=''>
										<#assign ware_wareCode_defaultValue=''>
																	<#if (ware_wareCode_defaultValue!)?string=="currentUser">
								<#assign ware_wareCode_defaultValue='${staffJson!}'>
							<#elseif (ware_wareCode_defaultValue!)?string=="currentPost">
								<#assign ware_wareCode_defaultValue='${postJson!}'>
							<#elseif (ware_wareCode_defaultValue!)?string=="currentDepart">
								<#assign ware_wareCode_defaultValue='${deptJson!}'>
							<#elseif (ware_wareCode_defaultValue!)?string=="currentComp">
								<#assign ware_wareCode_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="ware.wareCode"        showFormat="SELECTCOMP" defaultValue="${(ware_wareCode_defaultValue!)?string}" defaultDisplay="${(ware_wareCode_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.prepareMaterial.prepareMaterial.prepareBackView"  textalign="left"  viewUrl="/MESBasic/wareMan/ware/wareRef.action" viewCode="MESBasic_1_wareMan_wareRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" width=100 showFormatFunc=""  />
							<#assign remark_displayDefaultType=''>
								<#assign remark_defaultValue=''>
										<#assign remark_defaultValue=''>
										 
									<@datacolumn key="remark"  popView=true      showFormat="TEXT" defaultValue="${(remark_defaultValue!)?string}" defaultDisplay="${(remark_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertyshowName.randon1566464085062.flag')}" width=250 showFormatFunc=""  />
							<#assign batchNum_displayDefaultType=''>
								<#assign batchNum_defaultValue=''>
										<#assign batchNum_defaultValue=''>
										 
									<@datacolumn key="batchNum"        showFormat="TEXT" defaultValue="${(batchNum_defaultValue!)?string}" defaultDisplay="${(batchNum_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489977087708')}" width=100 showFormatFunc=""  />
			
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
				function PrepareMaterialPart_dg1567404925228_check_datagridvalid(){
					//
					var errorObj =PrepareMaterialPart_dg1567404925228Widget._DT.testData();
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
				
				function savedg1567404925228DataGrid(){
					<#if  refId?? && (refId gt 0)>
					PrepareMaterialPart_dg1567404925228Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('PrepareMaterialPart_dg1567404925228Widget') > -1) {
						PrepareMaterialPart_dg1567404925228Widget.setAllRowEdited();
					}
					var json = PrepareMaterialPart_dg1567404925228Widget.parseEditedData();
					$('input[name="dg1567404925228ListJson"]').remove();
					$('input[name="dgLists[\'dg1567404925228\']"]').remove();
					$('input[name="dg1567404925228ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1567404925228\']">').val(json).appendTo($('#WOM_prepareMaterial_prepareMaterial_prepareBackView_form'));
					$('<input type="hidden" name="dg1567404925228ModelCode">').val('WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart').appendTo($('#WOM_prepareMaterial_prepareMaterial_prepareBackView_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1567404925228ListJson">').val(json).appendTo($('#WOM_prepareMaterial_prepareMaterial_prepareBackView_form'));
				}
				function DT_PrepareMaterialPart_dg1567404925228_deldatagrid(){
					var deleteRows = PrepareMaterialPart_dg1567404925228Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','formulaId.id','productId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1567404925228DeletedIds").length>0){
							$("#dg1567404925228DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1567404925228DeletedIds" name="dgDeletedIds[\'dg1567404925228\']" value="'+tepID+'">').appendTo(CUI('#WOM_prepareMaterial_prepareMaterial_prepareBackView_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1567404925228DeletedIds['+CUI('input[name^="dg1567404925228DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_prepareMaterial_prepareMaterial_prepareBackView_form'));
					});
					return deleteRows;
				}
				function DT_PrepareMaterialPart_dg1567404925228_delTreeNodes(){
					var deleteRows = PrepareMaterialPart_dg1567404925228Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','formulaId.id','productId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1567404925228DeletedIds").length>0){
							$("#dg1567404925228DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1567404925228DeletedIds" name="dgDeletedIds[\'dg1567404925228\']" value="'+tepID+'">').appendTo(CUI('#WOM_prepareMaterial_prepareMaterial_prepareBackView_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1567404925228DeletedIds['+CUI('input[name^="dg1567404925228DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_prepareMaterial_prepareMaterial_prepareBackView_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('WOM_prepareMaterial_prepareMaterial_prepareBackView_datagrids');
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
							if(datagrids[0][i] == 'PrepareMaterialPart_dg1567404925228') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'PrepareMaterialPart_dg1567404925228';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'PrepareMaterialPart_dg1567404925228';
					}
					$('body').data('WOM_prepareMaterial_prepareMaterial_prepareBackView_datagrids', datagrids);
				});
				
				var PrepareMaterialPart_dg1567404925228_importDialog = null;
				function PrepareMaterialPart_dg1567404925228_showImportDialog(){
					try{
						if(PrepareMaterialPart_dg1567404925228_importDialog!=null&&PrepareMaterialPart_dg1567404925228_importDialog.isShow==1){
							return false;
						}
						var url = "/WOM/prepareMaterial/prepareMaterial/initImport.action?datagridCode=WOM_7.5.0.0_prepareMaterial_prepareBackViewdg1567404925228&tid=${id!}&datagridName=dg1567404925228";
							<#if canImportExcel>
								var buttonCode="WOM_7.5.0.0_prepareMaterial_prepareBackViewdg1567404925228_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						PrepareMaterialPart_dg1567404925228_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("PrepareMaterialPart_dg1567404925228"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();PrepareMaterialPart_dg1567404925228_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();PrepareMaterialPart_dg1567404925228_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						PrepareMaterialPart_dg1567404925228_importDialog.show();
					}catch(e){}
				}	
				
				function PrepareMaterialPart_dg1567404925228_downLoadFile(){
					var url = "/WOM/prepareMaterial/prepareMaterial/downLoad.action?datagridCode=WOM_7.5.0.0_prepareMaterial_prepareBackViewdg1567404925228&templateRelatedModelCode=WOM_7.5.0.0_prepareMaterial_prepareBackViewdg1567404925228&downloadType=template&fileName=dg1567404925228";
					window.open(url,"","");
				}
				function dg1567404925228RenderOverEvent(){
				}
				function dg1567404925228PageInitMethod(nTabIndex){
					WOM.prepareMaterial.prepareMaterial.prepareBackView.initSize(nTabIndex);
				}
			</script>
			
			

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
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
     	
		<div id="WOM_prepareMaterial_prepareMaterial_prepareBackView_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<#if ((prepareMaterial.effectiveState)!0) == 0>
				<#if !(superEdit!false)>
				<li id="flowHead" onclick="WOM.prepareMaterial.prepareMaterial.prepareBackView.showFlowInfo('flow')"><span class="icon_prograss"></span>${getText("ec.flow.flowImage")}</li>
				</#if>
				</#if>
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="WOM.prepareMaterial.prepareMaterial.prepareBackView.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
				<li id="dealInfoHead" class="bar" onclick="WOM.prepareMaterial.prepareMaterial.prepareBackView.showDealInfo('dealInfo')"><span class="icon_handle"></span>${getText("ec.view.dealadvice")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<#if ((prepareMaterial.effectiveState)!0) == 0>
				<#if !(superEdit!false)>
				<div class="flow-height wid" id="flowDiv"></div>
				</#if>
				</#if>
				<div id="fileUploadDiv" class="wid-hei"></div>
				<div style="padding:1px 0px 0px 0px;" id="dealInfoDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_prepareMaterial_prepareBackView,html,WOM_7.5.0.0_prepareMaterial_PrepareMaterial,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

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
						$("#WOM_prepareMaterial_prepareMaterial_prepareBackView_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#WOM_prepareMaterial_prepareMaterial_prepareBackView_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#WOM_prepareMaterial_prepareMaterial_prepareBackView_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#WOM_prepareMaterial_prepareMaterial_prepareBackView_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			WOM.prepareMaterial.prepareMaterial.prepareBackView.initCount = 0;
			WOM.prepareMaterial.prepareMaterial.prepareBackView.initSize = function(nTabIndex){
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
				var conHeight = h-$("#WOM_prepareMaterial_prepareMaterial_prepareBackView_main_div .edit-head").height()-$("#WOM_prepareMaterial_prepareMaterial_prepareBackView_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#WOM_prepareMaterial_prepareMaterial_prepareBackView_main_div .edit-workflow").height()</#if>;
				$("#WOM_prepareMaterial_prepareMaterial_prepareBackView_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('WOM_prepareMaterial_prepareMaterial_prepareBackView_datagrids');
				var padding_bottom=16;
				$("#WOM_prepareMaterial_prepareMaterial_prepareBackView_main_div .pd_bottom,#WOM_prepareMaterial_prepareMaterial_prepareBackView_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#WOM_prepareMaterial_prepareMaterial_prepareBackView_main_div .edit-panes-s").each(function(index){
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
									if(WOM.prepareMaterial.prepareMaterial.prepareBackView.initCount <= 2) {
										setTimeout(function(){WOM.prepareMaterial.prepareMaterial.prepareBackView.initSize();}, 200);
										WOM.prepareMaterial.prepareMaterial.prepareBackView.initCount++;
									}/* else {
										WOM.prepareMaterial.prepareMaterial.prepareBackView.initCount = 0;
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
							if(($("#WOM_prepareMaterial_prepareMaterial_prepareBackView_main_div .edit-workflow").length > 0) && ($("#WOM_prepareMaterial_prepareMaterial_prepareBackView_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				$('#WOM_prepareMaterial_prepareMaterial_prepareBackView_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				WOM.prepareMaterial.prepareMaterial.prepareBackView.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				WOM.prepareMaterial.prepareMaterial.prepareBackView.initSize();
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
						if(parseInt($("#WOM_prepareMaterial_prepareMaterial_prepareBackView_main_div").css("width"),10)==650){
							$("#WOM_prepareMaterial_prepareMaterial_prepareBackView_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//WOM.prepareMaterial.prepareMaterial.prepareBackView.resizeLayout();
						//WOM.prepareMaterial.prepareMaterial.prepareBackView.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#WOM_prepareMaterial_prepareMaterial_prepareBackView_main_div").css("width"),10)==800){
							$("#WOM_prepareMaterial_prepareMaterial_prepareBackView_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//WOM.prepareMaterial.prepareMaterial.prepareBackView.resizeLayout();
						//WOM.prepareMaterial.prepareMaterial.prepareBackView.initSize();
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
					WOM.prepareMaterial.prepareMaterial.prepareBackView.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					WOM.prepareMaterial.prepareMaterial.prepareBackView.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){WOM.prepareMaterial.prepareMaterial.prepareBackView.initSize();});
				/*
				WOM.prepareMaterial.prepareMaterial.prepareBackView.resizeLayout=function(){
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
			WOM.prepareMaterial.prepareMaterial.prepareBackView.setDepartment();
			<#else>
			CUI("#dealInfoContain").load("/ec/workflow/dealInfo.action?dlTableInfoId=${prepareMaterial.tableInfoId!}&dealInfoGroup=byTime&preName=mainFrame&dealDataUrl=/WOM/prepareMaterial/prepareMaterial/dealInfo-list.action&enableSimpleDealInfo=false");
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

		WOM.prepareMaterial.prepareMaterial.prepareBackView.validate = function(){
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
		WOM.prepareMaterial.prepareMaterial.prepareBackView.beforeSaveProcess = function(){
			$('input[name="prepareMaterial.extraCol"]').remove();
		}
		WOM.prepareMaterial.prepareMaterial.prepareBackView.processDataGrid = function(){
										<#if false && isIE>
										$('#WOM_prepareMaterial_prepareMaterial_prepareBackView_form').append(PrepareMaterialPart_dg1567404925228Widget._DT.createInputs('dg1567404925228List'));
										</#if>
		};
		WOM.prepareMaterial.prepareMaterial.prepareBackView.save = function(){
			<#if !(superEdit!false)>
			$('#operateType').val("save");
			<#else>
			$('#operateType').val("submit");
			</#if>
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!WOM.prepareMaterial.prepareMaterial.prepareBackView.validate()){return;}
			//延迟到延迟提交中处理,解决onchange事件无法触发问题
			//WOM.prepareMaterial.prepareMaterial.prepareBackView.beforeSaveProcess();

			//WOM.prepareMaterial.prepareMaterial.prepareBackView.processDataGrid();
			$('#WOM_prepareMaterial_prepareMaterial_prepareBackView_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('WOM_prepareMaterial_prepareMaterial_prepareBackView_form','WOM_prepareMaterial_prepareMaterial_prepareBackView_datagrids')) {      
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
		WOM.prepareMaterial.prepareMaterial.prepareBackView.print = function(){
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
		
		WOM.prepareMaterial.prepareMaterial.prepareBackView.saveSetting = function(){
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
		
		WOM.prepareMaterial.prepareMaterial.prepareBackView.printSetting = function(){
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
				WOM.prepareMaterial.prepareMaterial.prepareBackView.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(WOM.prepareMaterial.prepareMaterial.prepareBackView.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				WOM.prepareMaterial.prepareMaterial.prepareBackView.settingDialog.show();
			}
		}
		
		
		
		WOM.prepareMaterial.prepareMaterial.prepareBackView.reject = function(){
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
			WOM.prepareMaterial.prepareMaterial.prepareBackView.submit();
		}
		
		WOM.prepareMaterial.prepareMaterial.prepareBackView.submit = function(uncheck){
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
			if(!WOM.prepareMaterial.prepareMaterial.prepareBackView.validate()){return;}
			
			//$('#__workflow_outcomeDes').val($('input[name="workFlowVar.outcome"]:checked').attr('des'));
			
			WOM.prepareMaterial.prepareMaterial.prepareBackView.beforeSaveProcess();
			
			//WOM.prepareMaterial.prepareMaterial.prepareBackView.processDataGrid();
			
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
			$('#WOM_prepareMaterial_prepareMaterial_prepareBackView_form').submit();
			//$(".wfcancel").remove();
			
		}
		WOM.prepareMaterial.prepareMaterial.prepareBackView.recall = function(){
			CUI.Dialog.confirm("${getText('ec.recall.checkrecall')}", function(){
					$.ajax({
					url : "/WOM/prepareMaterial/prepareMaterial/common/recall.action",
					type : 'post',
					async : false,
					data:{"tableInfoId": "${(prepareMaterial.tableInfoId)?default('')}"},
					success : function(msg) {
						if(msg && msg.success){
							workbenchErrorBarWidget.showMessage("${getText('ec.recall.success')}", 's');
		 					var url = "/foundation/user/open-pending.action?pendingId=" + msg.data.id + "&tableInfoId=${(prepareMaterial.tableInfoId)?default('')}&id=${(prepareMaterial.id)?default('')}&entityCode=WOM_7.5.0.0_prepareMaterial";

			 				try{
								window.opener.refreshPortal('workflow');
								window.opener.timeData();
							}catch(e){
								try{
			 						window.opener.WOM.prepareMaterial.prepareMaterial.editCallBackInfo(res); 						
								}catch(e2){
									try{
										<#if calltype??&&calltype=='ref'>
										window.opener.WOM.prepareMaterial.prepareMaterial.callBackInfo(res);
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
		WOM.prepareMaterial.prepareMaterial.prepareBackView._callBackInfo = function(res){
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
 						window.opener.WOM.prepareMaterial.prepareMaterial.editCallBackInfo(res); 						
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
 					var url = "/foundation/user/open-pending.action?pendingId=" + res.pendingId + "&tableInfoId=" + res.tableInfoId + "&id=" + res.id + "&entityCode=WOM_7.5.0.0_prepareMaterial";
 					setTimeout(function(){
						document.location.href=url;
 					}, 1000);
					return;
 				}
 				</#if>

 				setTimeout(function(){
					window.close();
				},1000);
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.WOM.prepareMaterial.prepareMaterial.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
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
		WOM.prepareMaterial.prepareMaterial.prepareBackView.setDepartment = function(){
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
				WOM.prepareMaterial.prepareMaterial.prepareBackView._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				WOM.prepareMaterial.prepareMaterial.prepareBackView._isObjCustomProp_IE = isObjCustomProp;
			} else {
				WOM.prepareMaterial.prepareMaterial.prepareBackView._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				WOM.prepareMaterial.prepareMaterial.prepareBackView._objCustomPropNames_IE = objCustomPropNames;
			} else {
				WOM.prepareMaterial.prepareMaterial.prepareBackView._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				WOM.prepareMaterial.prepareMaterial.prepareBackView._refViewCode_IE = viewCode;
			} else {
				WOM.prepareMaterial.prepareMaterial.prepareBackView._refViewCode_IE = '';
			}
			WOM.prepareMaterial.prepareMaterial.prepareBackView._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		WOM.prepareMaterial.prepareMaterial.prepareBackView.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			WOM.prepareMaterial.prepareMaterial.prepareBackView._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			WOM.prepareMaterial.prepareMaterial.prepareBackView._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			WOM.prepareMaterial.prepareMaterial.prepareBackView.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			WOM.prepareMaterial.prepareMaterial.prepareBackView._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				WOM.prepareMaterial.prepareMaterial.prepareBackView._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		WOM.prepareMaterial.prepareMaterial.prepareBackView._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(WOM.prepareMaterial.prepareMaterial.prepareBackView._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(WOM.prepareMaterial.prepareMaterial.prepareBackView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				WOM.prepareMaterial.prepareMaterial.prepareBackView.gridEventObj = gridEventObj;
				callbackName = "WOM.prepareMaterial.prepareMaterial.prepareBackView.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "WOM.prepareMaterial.prepareMaterial.prepareBackView.getMultiselectCallBackInfo_DG" : "WOM.prepareMaterial.prepareMaterial.prepareBackView.getcallBackInfo_DG";
				WOM.prepareMaterial.prepareMaterial.prepareBackView._currRow = $(obj).closest('tr')[0];
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="WOM.prepareMaterial.prepareMaterial.prepareBackView.getcallBackInfo";
			}

			if(_prefix!=''){
				WOM.prepareMaterial.prepareMaterial.prepareBackView._prefix = _prefix.substring(1);
			}
			
			WOM.prepareMaterial.prepareMaterial.prepareBackView._oGrid = oGrid;
			WOM.prepareMaterial.prepareMaterial.prepareBackView._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					WOM.prepareMaterial.prepareMaterial.prepareBackView._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					WOM.prepareMaterial.prepareMaterial.prepareBackView._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					WOM.prepareMaterial.prepareMaterial.prepareBackView._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					WOM.prepareMaterial.prepareMaterial.prepareBackView._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					WOM.prepareMaterial.prepareMaterial.prepareBackView._refViewCode = oColumn.viewCode;
				} else {
					WOM.prepareMaterial.prepareMaterial.prepareBackView._refViewCode = '';
				}
			} else {
				WOM.prepareMaterial.prepareMaterial.prepareBackView._isObjCustomProp = false;
				WOM.prepareMaterial.prepareMaterial.prepareBackView._objCustomPropNames = '';
				WOM.prepareMaterial.prepareMaterial.prepareBackView._refViewCode = '';
			}
			if (WOM.prepareMaterial.prepareMaterial.prepareBackView._isObjCustomProp == true && WOM.prepareMaterial.prepareMaterial.prepareBackView._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				WOM.prepareMaterial.prepareMaterial.prepareBackView._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				WOM.prepareMaterial.prepareMaterial.prepareBackView._customCallBack = customCallBack;
			}
			if(WOM.prepareMaterial.prepareMaterial.prepareBackView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.prepareMaterial.prepareMaterial.prepareBackView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof WOM.prepareMaterial.prepareMaterial.prepareBackView._querycustomFuncN == "function") {
				refparam += WOM.prepareMaterial.prepareMaterial.prepareBackView._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			WOM.prepareMaterial.prepareMaterial.prepareBackView._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.prepareMaterial.prepareMaterial.prepareBackView._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(WOM.prepareMaterial.prepareMaterial.prepareBackView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.prepareMaterial.prepareMaterial.prepareBackView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			WOM.prepareMaterial.prepareMaterial.prepareBackView._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'WOM.prepareMaterial.prepareMaterial.prepareBackView.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.prepareMaterial.prepareMaterial.prepareBackView._querycustomFunc = function(obj) {
			var str = eval("typeof(WOM.prepareMaterial.prepareMaterial.prepareBackView.query_"+obj+")!='undefined'") ? eval('WOM.prepareMaterial.prepareMaterial.prepareBackView.query_'+obj+'()') : null;
			return str;
		};
		WOM.prepareMaterial.prepareMaterial.prepareBackView.getcallBackGroupInfo = function(obj){
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
			WOM.prepareMaterial.prepareMaterial.prepareBackView._dialog.close();
		}
		WOM.prepareMaterial.prepareMaterial.prepareBackView.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('WOM_prepareMaterial_prepareMaterial_prepareBackView_form',obj[0], WOM.prepareMaterial.prepareMaterial.prepareBackView._prefix, WOM.prepareMaterial.prepareMaterial.prepareBackView._sUrl);
			CUI.commonFills('WOM_prepareMaterial_prepareMaterial_prepareBackView_form',WOM.prepareMaterial.prepareMaterial.prepareBackView._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (WOM.prepareMaterial.prepareMaterial.prepareBackView._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(WOM.prepareMaterial.prepareMaterial.prepareBackView._customCallBack) {
					eval(WOM.prepareMaterial.prepareMaterial.prepareBackView._customCallBack);
					WOM.prepareMaterial.prepareMaterial.prepareBackView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.prepareMaterial.prepareMaterial.prepareBackView._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		WOM.prepareMaterial.prepareMaterial.prepareBackView.getcallBackInfo_DG_IE = function(obj){
			if(WOM.prepareMaterial.prepareMaterial.prepareBackView._customBeforeCallBack) {
				var flag = eval(WOM.prepareMaterial.prepareMaterial.prepareBackView._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = WOM.prepareMaterial.prepareMaterial.prepareBackView.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( WOM.prepareMaterial.prepareMaterial.prepareBackView._isObjCustomProp_IE == true && WOM.prepareMaterial.prepareMaterial.prepareBackView._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,WOM.prepareMaterial.prepareMaterial.prepareBackView._sUrl,WOM.prepareMaterial.prepareMaterial.prepareBackView._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,WOM.prepareMaterial.prepareMaterial.prepareBackView._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (WOM.prepareMaterial.prepareMaterial.prepareBackView._isObjCustomProp_IE == true && WOM.prepareMaterial.prepareMaterial.prepareBackView._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = WOM.prepareMaterial.prepareMaterial.prepareBackView._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = WOM.prepareMaterial.prepareMaterial.prepareBackView._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && WOM.prepareMaterial.prepareMaterial.prepareBackView._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + WOM.prepareMaterial.prepareMaterial.prepareBackView._refViewCode_IE + '&id=' + id,
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
				if(WOM.prepareMaterial.prepareMaterial.prepareBackView._customCallBack) {
					eval(WOM.prepareMaterial.prepareMaterial.prepareBackView._customCallBack);
					WOM.prepareMaterial.prepareMaterial.prepareBackView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.prepareMaterial.prepareMaterial.prepareBackView._dialog.close();
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
		
		WOM.prepareMaterial.prepareMaterial.prepareBackView.getcallBackInfo_DG = function(obj){
			if(WOM.prepareMaterial.prepareMaterial.prepareBackView._customBeforeCallBack) {
				var flag = eval(WOM.prepareMaterial.prepareMaterial.prepareBackView._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(WOM.prepareMaterial.prepareMaterial.prepareBackView._currRow).next().length==0){
						WOM.prepareMaterial.prepareMaterial.prepareBackView._oGrid.addNewRow();
					}	
					WOM.prepareMaterial.prepareMaterial.prepareBackView._currRow = $(WOM.prepareMaterial.prepareMaterial.prepareBackView._currRow).next();
					$(WOM.prepareMaterial.prepareMaterial.prepareBackView._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(WOM.prepareMaterial.prepareMaterial.prepareBackView._currRow,obj[i], WOM.prepareMaterial.prepareMaterial.prepareBackView._prefix, WOM.prepareMaterial.prepareMaterial.prepareBackView._sUrl);
				if (WOM.prepareMaterial.prepareMaterial.prepareBackView._isObjCustomProp == true && WOM.prepareMaterial.prepareMaterial.prepareBackView._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(WOM.prepareMaterial.prepareMaterial.prepareBackView._currRow,WOM.prepareMaterial.prepareMaterial.prepareBackView._prefix,obj[i],WOM.prepareMaterial.prepareMaterial.prepareBackView._oGrid,WOM.prepareMaterial.prepareMaterial.prepareBackView._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(WOM.prepareMaterial.prepareMaterial.prepareBackView._currRow,WOM.prepareMaterial.prepareMaterial.prepareBackView._prefix,obj[i],WOM.prepareMaterial.prepareMaterial.prepareBackView._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + WOM.prepareMaterial.prepareMaterial.prepareBackView._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + WOM.prepareMaterial.prepareMaterial.prepareBackView._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && WOM.prepareMaterial.prepareMaterial.prepareBackView._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + WOM.prepareMaterial.prepareMaterial.prepareBackView._refViewCode + '&id=' + id,
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
									name = WOM.prepareMaterial.prepareMaterial.prepareBackView._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(WOM.prepareMaterial.prepareMaterial.prepareBackView._currRow, objs, WOM.prepareMaterial.prepareMaterial.prepareBackView._oGrid);
							}
						}
					}
				}
			}
			try{
				if(WOM.prepareMaterial.prepareMaterial.prepareBackView._customCallBack) {
					eval(WOM.prepareMaterial.prepareMaterial.prepareBackView._customCallBack);
					WOM.prepareMaterial.prepareMaterial.prepareBackView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.prepareMaterial.prepareMaterial.prepareBackView._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + WOM.prepareMaterial.prepareMaterial.prepareBackView._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		WOM.prepareMaterial.prepareMaterial.prepareBackView.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(WOM.prepareMaterial.prepareMaterial.prepareBackView._oGrid, WOM.prepareMaterial.prepareMaterial.prepareBackView._currRow, WOM.prepareMaterial.prepareMaterial.prepareBackView._key, WOM.prepareMaterial.prepareMaterial.prepareBackView._displayFieldName, obj[i])
			}
			try{
				if(WOM.prepareMaterial.prepareMaterial.prepareBackView._customCallBack) {
					eval(WOM.prepareMaterial.prepareMaterial.prepareBackView._customCallBack);
					WOM.prepareMaterial.prepareMaterial.prepareBackView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.prepareMaterial.prepareMaterial.prepareBackView._dialog.close();
			} catch(e){}
		};
		
		WOM.prepareMaterial.prepareMaterial.prepareBackView.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						WOM.prepareMaterial.prepareMaterial.prepareBackView.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#WOM_prepareMaterial_prepareMaterial_prepareBackView_form'));
						}
					}
				}
			});
		};

		$(function(){
			WOM.prepareMaterial.prepareMaterial.prepareBackView.onloadForProduct();
			//根据是否有id判断修改新增
	if(GetQueryString("id")==null){
		//新增隐藏参照计划单和参照指令单
		//$("#edit-btn-planRef").hide();
		//$("#edit-btn-taskRef").hide();
		
		//将参照按钮提前
		$('div .edit-menubar:eq(0) a:eq(2)').insertBefore( $('div .edit-menubar:eq(0) a:eq(1)') );
		$('div .edit-menubar:eq(0) a:eq(1)').insertBefore( $('div .edit-menubar:eq(0) a:eq(0)') );
		$('div .edit-menubar:eq(0) a:eq(3)').insertBefore( $('div .edit-menubar:eq(0) a:eq(2)') );
		$('div .edit-menubar:eq(0) a:eq(2)').insertBefore( $('div .edit-menubar:eq(0) a:eq(1)') );
	}else{
		//将参照按钮提前
		$('div .edit-menubar:eq(0) a:eq(5)').insertBefore( $('div .edit-menubar:eq(0) a:eq(4)') );
		$('div .edit-menubar:eq(0) a:eq(4)').insertBefore( $('div .edit-menubar:eq(0) a:eq(3)') );
		$('div .edit-menubar:eq(0) a:eq(3)').insertBefore( $('div .edit-menubar:eq(0) a:eq(2)') );
		$('div .edit-menubar:eq(0) a:eq(2)').insertBefore( $('div .edit-menubar:eq(0) a:eq(1)') );
		$('div .edit-menubar:eq(0) a:eq(1)').insertBefore( $('div .edit-menubar:eq(0) a:eq(0)') );
		$('div .edit-menubar:eq(0) a:eq(6)').insertBefore( $('div .edit-menubar:eq(0) a:eq(5)') );
		$('div .edit-menubar:eq(0) a:eq(5)').insertBefore( $('div .edit-menubar:eq(0) a:eq(4)') );
		$('div .edit-menubar:eq(0) a:eq(4)').insertBefore( $('div .edit-menubar:eq(0) a:eq(3)') );
		$('div .edit-menubar:eq(0) a:eq(3)').insertBefore( $('div .edit-menubar:eq(0) a:eq(2)') );
		$('div .edit-menubar:eq(0) a:eq(2)').insertBefore( $('div .edit-menubar:eq(0) a:eq(1)') );
		
	}
	//仓库若不为空，仓库不可编辑
	if($("[name='prepareMaterial.wareID.wareCode']").val()!=null && $("[name='prepareMaterial.wareID.wareCode']").val()!=""){
		$("#prepareMaterial_wareID_wareCodediv").removeAttr("onmouseenter");
		$("#prepareMaterial_wareID_wareCodediv").unbind('mouseenter');
		$("[name='prepareMaterial.wareID.wareCode']").attr("readonly",true);
		$("#prepareMaterial_wareID_wareCode_click_button").remove();
	}
		});

		WOM.prepareMaterial.prepareMaterial.prepareBackView.beforeSubmitMethodSettingInPage = function(){
			WOM.prepareMaterial.prepareMaterial.prepareBackView.onsaveForProduct();
			// 去除可用量参照的id，否则会导致无法保存
/*$('.dg-bd-tr').attr('dg1489977909385useneedref.id', '');
// 判断可用量
for(var i = 0; i < PrepareMaterialPart_dg1489977909385Widget.getRowLength(); i++) {
	var useNum = PrepareMaterialPart_dg1489977909385Widget.getCellValue(i, 'useNum');
	var canUseNum = PrepareMaterialPart_dg1489977909385Widget.getCellValue(i, 'useNeedRef.batchText');
	useNum = (useNum == undefined || useNum == '') ? 0 : parseFloat(useNum);
	canUseNum = (canUseNum == undefined || canUseNum == '') ? 0 : parseFloat(canUseNum);
	if(useNum > canUseNum) {
		workbenchErrorBarWidget.showMessage('备料明细："使用量"第' + (i + 1) + '行不能多于"现存量"','f');
		return false;
	}
}*/
var type = $("#operateType").val();
var type1=$("input[name='workFlowVarStatus']").val();
var storeState=$('input[name="prepareMaterial.wareID.cargoStatue.id"]').val();
if( storeState=='storageState/storageState1' &&  type =='submit' && type1!='reject' &&  type1!='cancel'  ){//货位状态启用
    var len= PrepareMaterialPart_dg1489977909385Widget._DT.getAllData().length
	for(var i=0;i<len;i++){
		var placeSetCode=PrepareMaterialPart_dg1489977909385Widget._DT.getCellValue(i,'storeID.placeSetCode')
        if(placeSetCode==''){//货位编码不能为空
		  workbenchErrorBarWidget.showMessage('${getText('WOM.errorMesg.randon1489737417838345')}','f');//仓库启用货位时，货位不允许为空！
		  return false;
		}
		if(len>1){//多于两行才判断
			//表体物料，货位编码相同不允许提交
			var productCode1=PrepareMaterialPart_dg1489977909385Widget.getCellValue(i,"productId.productCode");//物料编码
			for(var j=0;j<len;j++){
				if(j!=i){
					var productCode2=PrepareMaterialPart_dg1489977909385Widget.getCellValue(j,"productId.productCode");//物料编码
					var placeSetCode2=PrepareMaterialPart_dg1489977909385Widget._DT.getCellValue(j,'storeID.placeSetCode');//货位编码
					if(productCode1==productCode2&&placeSetCode==placeSetCode2){
						 workbenchErrorBarWidget.showMessage('${getText('WOM.errorMesg.randon1489737417838345dxtbyxtj')}','f');//仓库启用货位时，表体物料编码，货位编码都相同不允许提交！
						 return false;
					}
				}
				
			}
			
		}
		
		
	}
}else if(storeState=='storageState/storageState2' &&  type =='submit' && type1!='reject' &&  type1!='cancel' ){//货位状态停用
	//表体物料编码不重复
	var len= PrepareMaterialPart_dg1489977909385Widget._DT.getAllData().length;
	if(len>1){
		for(var i=0;i<len;i++){
			var productCode1=PrepareMaterialPart_dg1489977909385Widget.getCellValue(i,"productId.productCode");//物料编码
			for(var j=1;j<len;j++){
				if(j!=i){
					var productCode2=PrepareMaterialPart_dg1489977909385Widget.getCellValue(j,"productId.productCode");//物料编码	
					if(productCode1==productCode2){
						workbenchErrorBarWidget.showMessage('${getText('WOM.errorMesg.randon148973741783834512dqFAF')}','f');//仓库不启用货位时，物料编码不重复！
						 return false;
					}
				}
			}
		}
	}
}
		};
		WOM.prepareMaterial.prepareMaterial.prepareBackView.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  WOM.prepareMaterial.prepareMaterial.prepareBackView.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		WOM.prepareMaterial.prepareMaterial.prepareBackView.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#WOM_prepareMaterial_prepareMaterial_prepareBackView_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#WOM_prepareMaterial_prepareMaterial_prepareBackView_main_div").hide();
				},100);
				//CUI("#WOM_prepareMaterial_prepareMaterial_prepareBackView_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		WOM.prepareMaterial.prepareMaterial.prepareBackView.showThis = function(){
			if(!CUI("#WOM_prepareMaterial_prepareMaterial_prepareBackView_main_div").is(':visible')) {
				CUI("#WOM_prepareMaterial_prepareMaterial_prepareBackView_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		WOM.prepareMaterial.prepareMaterial.prepareBackView.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			WOM.prepareMaterial.prepareMaterial.prepareBackView.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "WOM_prepareMaterial_prepareMaterial_prepareBackView_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=WOM&modelName=WOM_7.5.0.0_prepareMaterial_PrepareMaterial&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.prepareMaterial.prepareMaterial.prepareBackView.auditDialog.show();
			</#if>
		}
		
		
		WOM.prepareMaterial.prepareMaterial.prepareBackView.showInfoDialog=function(mode){
			
			WOM.prepareMaterial.prepareMaterial.prepareBackView.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "WOM_prepareMaterial_prepareMaterial_prepareBackView_dealInfo",
				modal:true,
				height:500,
				width: 950,//适应国际化版
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.prepareMaterial.prepareMaterial.prepareBackView.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		WOM.prepareMaterial.prepareMaterial.prepareBackView.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			<#if pendingId??>
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=WOM_7.5.0.0_prepareMaterial");
			<#else>
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?readOnlyFlag=true&linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=WOM_7.5.0.0_prepareMaterial");
			</#if>
			}
		}
		
		WOM.prepareMaterial.prepareMaterial.prepareBackView.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/WOM/prepareMaterial/prepareMaterial/dealInfo-list.action&dlTableInfoId=${(prepareMaterial.tableInfoId)?default('')}");
			}
		}
		WOM.prepareMaterial.prepareMaterial.prepareBackView.showFlowInfo=function(){
		     //IE8环境下使用旧版flash流程展现页面，其他情况使用html5流程展现页面
		    var browser=navigator.appName; 
			var b_version=navigator.appVersion; 
			var version=b_version.split(";"); 
			var trim_Version=version[1]&&version[1].replace(/[ ]/g,"");
			var isIE8=(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE8.0")||($.browser.msie&&(Number($.browser.version)<= 8));//IE8兼容视图模式下浏览器版本判断逻辑补充
			if(CUI.trim(CUI("#flowDiv").html())==""){
				if(isIE8){
				    CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=WOM_7.5.0.0_prepareMaterial_PrepareMaterial&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(prepareMaterial.tableInfoId)?default('')}");
				}else{
				    CUI("#flowDiv").load("/ec/workflow/flowViewH5.action?env=runtime&modelCode=WOM_7.5.0.0_prepareMaterial_PrepareMaterial&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(prepareMaterial.tableInfoId)?default('')}");
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
		WOM.prepareMaterial.prepareMaterial.prepareBackView.supervision=function(){
			WOM.prepareMaterial.prepareMaterial.prepareBackView.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(prepareMaterial.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				WOM.prepareMaterial.prepareMaterial.prepareBackView.modifyOwnerStaffDialog.show();
		}
		
function clearStore(obj){
	if(obj[0].id!=$("[name='prepareMaterial.wareID.id']").val()){
		var len= PrepareMaterialPart_dg1489977909385Widget._DT.getAllData().length
		for(var i=0;i<len;i++){
			PrepareMaterialPart_dg1489977909385Widget._DT.setCellValue(i,'storeID.placeSetCode','')
			PrepareMaterialPart_dg1489977909385Widget._DT.setCellValue(i,'storeID.placeSetName','')
			PrepareMaterialPart_dg1489977909385Widget._DT.setCellValue(i,'storeID.id','')
		}
	}
}





		/* CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_prepareMaterial_prepareBackView,js,WOM_7.5.0.0_prepareMaterial_PrepareMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		WOM.prepareMaterial.prepareMaterial.prepareBackView.onloadForProduct = function(){
		/* CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_prepareMaterial_prepareBackView,onloadForProduct,WOM_7.5.0.0_prepareMaterial_PrepareMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		}

		WOM.prepareMaterial.prepareMaterial.prepareBackView.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_prepareMaterial_prepareBackView,onsaveForProduct,WOM_7.5.0.0_prepareMaterial_PrepareMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */		
		}
		
function prepareBackRefClick() {
				//当表体数据不为空时，做出提示
				if(PrepareMaterialPart_dg1566463128930Widget.getRowLength()!=0){
					CUI.Dialog.confirm("${getText('WOM.showMessage00000004')}",
						function() {
							//如果确认则继续执行
							//打开指令单dialog框
							taskRef_dialog = foundation.common.select({
								pageType: 'other',
								closePage: false,
								callBackFuncName: '_callback_prepareRef',
								url: '/WOM/prepareMaterial/prepareMaterial/prepareMaterialRef.action',
								title: "${getText('WOM.viewtitle.randon1489977705571')}",
								params: ''
							});
						}
					);
				} else {
					//打开指令单dialog框
					taskRef_dialog = foundation.common.select({
						pageType: 'other',
						closePage: false,
						callBackFuncName: '_callback_prepareRef',
						url: '/WOM/prepareMaterial/prepareMaterial/prepareMaterialRef.action',
						title: "${getText('WOM.viewtitle.randon1489977705571')}",
						params: ''
					});
				}
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
				<div class="sidebar-top"><a href="#"  onclick="WOM.prepareMaterial.prepareMaterial.prepareBackView.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="WOM.prepareMaterial.prepareMaterial.prepareBackView.showBusinessList('${l.relatingModel.code.replace('.','')}',${(prepareMaterial.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
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