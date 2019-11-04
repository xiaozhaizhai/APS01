<!-- MESBasic_1/itemRecord/itemRecordView -->
<#assign isWorkflow = false> 
<#assign isAttachment = true> 
	<#assign  fileuploadType = "MESBasic_itemRecord_itemRecord">
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
<#assign userJson= Session.user.toJSON()>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<#assign viewType = "readonly">
<#-- 实体对象 -->
<#assign tableObj = itemRecord>
<#-- 命名空间 -->
<#assign editPageNs = "MESBasic.itemRecord.itemRecord.itemRecordView">
<#-- 模型名称-->
<#assign modelName = "itemRecord">
<#-- 视图编码-->
<#assign viewCode = "MESBasic_1_itemRecord_itemRecordView">
<#-- 实体编码-->
<#assign entity_code = "MESBasic_1_itemRecord">
<#-- 视图名称-->
<#assign viewName = "itemRecordView">
<#-- datagrid编码-->
<#assign datagridCode = "MESBasic_itemRecord_itemRecord_itemRecordView_datagrids">
<#-- 首字母大写的模型名称-->
<#assign upcaseModelName = "ItemRecord">
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
<#assign editFormId = "MESBasic_itemRecord_itemRecord_itemRecordView_form">
<#-- 待办状态 -->
<#assign pendingstatus =( itemRecord.pending.taskDescription)!>
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
        <#assign configTitle = getText('MESBasic.viewtitle.radion1415341053587')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		
		#MESBasic_itemRecord_itemRecord_itemRecordView_form{float:left;width:100%;}
		
		
		</style>
		<script type="text/javascript">
			CUI.ns('MESBasic.itemRecord.itemRecord.itemRecordView');
			MESBasic.itemRecord.itemRecord.itemRecordView.currentUser = ${userJson};
			MESBasic.itemRecord.itemRecord.itemRecordView.currentStaff = ${staffJson};
			MESBasic.itemRecord.itemRecord.itemRecordView.currentDepartment = ${deptJson};
			MESBasic.itemRecord.itemRecord.itemRecordView.currentPosition = ${postJson};
			MESBasic.itemRecord.itemRecord.itemRecordView.currentCompany = ${compJson};
		</script>
		<!-- CUSTOM CODE START(view-VIEW-MESBasic_1_itemRecord_itemRecordView,head,MESBasic_1_itemRecord_ItemRecord,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
    </head>
	<body class="view-edit ">
		<@loadpanel newType=true/>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="" onsubmitMethod="MESBasic.itemRecord.itemRecord.itemRecordView.beforeSubmitMethod()" id="MESBasic_itemRecord_itemRecord_itemRecordView_form" namespace="/MESBasic/itemRecord/itemRecord/itemRecordView" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=MESBasic_1_itemRecord_ItemRecord&_bapFieldPermissonModelName_=ItemRecord" editPageNs="MESBasic.itemRecord.itemRecord.itemRecordView" callback="MESBasic.itemRecord.itemRecord.itemRecordView._callBackInfo" ecform="true">
			<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
			<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="MESBasic_itemRecord_itemRecord_itemRecordView_main_div">
			<div class="edit-head">
				<#include "../../../ec/tableInfo/operateheadbar_all.ftl" >
				<#include "../../../ec/tableInfo/creatorInfo.ftl" >
			</div>
    		<div class="edit-main" id="MESBasic_itemRecord_itemRecord_itemRecordView">
    			<div class="edit-content">
    	<#include "../../../ec/tableInfo/formparam.ftl" >				
		<div class="dash-line"></div>
<script type="text/javascript">
var attcountid = "MESBasic_itemRecord_itemRecord_itemRecordView_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=MESBasic_1_itemRecord', null, function(){
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
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1481694645100')}" >${getText('MESBasic.propertydisplayName.randon1481694645100')}</label>
				</td>
				
						<#assign itemRecord_itemNumber_defaultValue  = ''>
							 							<#assign itemRecord_itemNumber_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="itemRecord.itemNumber" id="itemRecord_itemNumber"  style=";" originalvalue="<#if !newObj || (itemRecord.itemNumber)?has_content>${(itemRecord.itemNumber?html)!}<#else>${itemRecord_itemNumber_defaultValue!}</#if>" value="<#if !newObj || (itemRecord.itemNumber)?has_content>${(itemRecord.itemNumber?html)!}<#else>${itemRecord_itemNumber_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415340352536')}" >${getText('MESBasic.propertydisplayName.radion1415340352536')}</label>
				</td>
				
						<#assign itemRecord_averageValue_defaultValue  = ''>
							 							<#assign itemRecord_averageValue_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="itemRecord.averageValue" id="itemRecord_averageValue"  style=";" originalvalue="<#if newObj&& !(itemRecord.averageValue)?has_content>${itemRecord_averageValue_defaultValue!}<#elseif (itemRecord.averageValue)?has_content>#{(itemRecord.averageValue)!; m6M6}</#if>" value="<#if newObj&& !(itemRecord.averageValue)?has_content>${itemRecord_averageValue_defaultValue!}<#elseif (itemRecord.averageValue)?has_content>#{(itemRecord.averageValue)!; m6M6}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415340378186')}" >${getText('MESBasic.propertydisplayName.radion1415340378186')}</label>
				</td>
				
						<#assign itemRecord_balanceValue_defaultValue  = ''>
							 							<#assign itemRecord_balanceValue_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="itemRecord.balanceValue" id="itemRecord_balanceValue"  style=";" originalvalue="<#if newObj&& !(itemRecord.balanceValue)?has_content>${itemRecord_balanceValue_defaultValue!}<#elseif (itemRecord.balanceValue)?has_content>#{(itemRecord.balanceValue)!; m2M2}</#if>" value="<#if newObj&& !(itemRecord.balanceValue)?has_content>${itemRecord_balanceValue_defaultValue!}<#elseif (itemRecord.balanceValue)?has_content>#{(itemRecord.balanceValue)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415340400455')}" >${getText('MESBasic.propertydisplayName.radion1415340400455')}</label>
				</td>
				
						<#assign itemRecord_count_defaultValue  = ''>
							 							<#assign itemRecord_count_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="INTEGER" name="itemRecord.count" id="itemRecord_count"  style=";" originalvalue="<#if !newObj || (itemRecord.count)?has_content>${(itemRecord.count?html)!}<#else>${itemRecord_count_defaultValue!}</#if>" value="<#if !newObj || (itemRecord.count)?has_content>${(itemRecord.count?html)!}<#else>${itemRecord_count_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415340515757')}" >${getText('MESBasic.propertydisplayName.radion1415340515757')}</label>
				</td>
				
						<#assign itemRecord_maxValue_defaultValue  = ''>
							 							<#assign itemRecord_maxValue_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="itemRecord.maxValue" id="itemRecord_maxValue"  style=";" originalvalue="<#if newObj&& !(itemRecord.maxValue)?has_content>${itemRecord_maxValue_defaultValue!}<#elseif (itemRecord.maxValue)?has_content>#{(itemRecord.maxValue)!; m6M6}</#if>" value="<#if newObj&& !(itemRecord.maxValue)?has_content>${itemRecord_maxValue_defaultValue!}<#elseif (itemRecord.maxValue)?has_content>#{(itemRecord.maxValue)!; m6M6}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415340539418')}" >${getText('MESBasic.propertydisplayName.radion1415340539418')}</label>
				</td>
				
						<#assign itemRecord_minValue_defaultValue  = ''>
							 							<#assign itemRecord_minValue_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="itemRecord.minValue" id="itemRecord_minValue"  style=";" originalvalue="<#if newObj&& !(itemRecord.minValue)?has_content>${itemRecord_minValue_defaultValue!}<#elseif (itemRecord.minValue)?has_content>#{(itemRecord.minValue)!; m6M6}</#if>" value="<#if newObj&& !(itemRecord.minValue)?has_content>${itemRecord_minValue_defaultValue!}<#elseif (itemRecord.minValue)?has_content>#{(itemRecord.minValue)!; m6M6}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415340583078')}" >${getText('MESBasic.propertydisplayName.radion1415340583078')}</label>
				</td>
				
						<#assign itemRecord_realValue_defaultValue  = ''>
							 							<#assign itemRecord_realValue_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="itemRecord.realValue" id="itemRecord_realValue"  style=";" originalvalue="<#if newObj&& !(itemRecord.realValue)?has_content>${itemRecord_realValue_defaultValue!}<#elseif (itemRecord.realValue)?has_content>#{(itemRecord.realValue)!; m6M6}</#if>" value="<#if newObj&& !(itemRecord.realValue)?has_content>${itemRecord_realValue_defaultValue!}<#elseif (itemRecord.realValue)?has_content>#{(itemRecord.realValue)!; m6M6}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415340562803')}" >${getText('MESBasic.propertydisplayName.radion1415340562803')}</label>
				</td>
				
						<#assign itemRecord_planNo_defaultValue  = ''>
							 							<#assign itemRecord_planNo_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="itemRecord.planNo" id="itemRecord_planNo"  style=";" originalvalue="<#if !newObj || (itemRecord.planNo)?has_content>${(itemRecord.planNo?html)!}<#else>${itemRecord_planNo_defaultValue!}</#if>" value="<#if !newObj || (itemRecord.planNo)?has_content>${(itemRecord.planNo?html)!}<#else>${itemRecord_planNo_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415340718971')}" >${getText('MESBasic.propertydisplayName.radion1415340718971')}</label>
				</td>
				
						<#assign itemRecord_totalValue_defaultValue  = ''>
							 							<#assign itemRecord_totalValue_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="itemRecord.totalValue" id="itemRecord_totalValue"  style=";" originalvalue="<#if newObj&& !(itemRecord.totalValue)?has_content>${itemRecord_totalValue_defaultValue!}<#elseif (itemRecord.totalValue)?has_content>#{(itemRecord.totalValue)!; m6M6}</#if>" value="<#if newObj&& !(itemRecord.totalValue)?has_content>${itemRecord_totalValue_defaultValue!}<#elseif (itemRecord.totalValue)?has_content>#{(itemRecord.totalValue)!; m6M6}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415340607673')}" >${getText('MESBasic.propertydisplayName.radion1415340607673')}</label>
				</td>
				
						<#assign itemRecord_reaultValue_defaultValue  = ''>
							 							<#assign itemRecord_reaultValue_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="itemRecord.reaultValue_check" originalvalue="<#if !newObj><#if (itemRecord.reaultValue)??>${(itemRecord.reaultValue!false)?string('true','false')}<#else>false</#if><#elseif itemRecord_reaultValue_defaultValue?has_content>${(itemRecord_reaultValue_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (itemRecord.reaultValue)??>${(itemRecord.reaultValue!false)?string('true','false')}<#else>false</#if><#else>${(itemRecord_reaultValue_defaultValue!true)?string}</#if>"  disabled=true/>
								
								<input property_type="BOOLEAN" type="hidden" name="itemRecord.reaultValue" originalvalue="<#if ((itemRecord.reaultValue)?? &&  itemRecord.reaultValue)||(itemRecord_reaultValue_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((itemRecord.reaultValue)?? &&  itemRecord.reaultValue)||(itemRecord_reaultValue_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="itemRecord.reaultValue_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="itemRecord.reaultValue"]');
												CUI('input[name="itemRecord.reaultValue_check"]').each(function(){
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
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415340634767')}" >${getText('MESBasic.propertydisplayName.radion1415340634767')}</label>
				</td>
				
						<#assign itemRecord_recordDate_defaultValue  = ''>
							 							<#assign itemRecord_recordDate_defaultValue  = ''>
					<#if (itemRecord_recordDate_defaultValue)?? &&(itemRecord_recordDate_defaultValue)?has_content>
							<#assign itemRecord_recordDate_defaultValue  = getDefaultDateTime(itemRecord_recordDate_defaultValue!)?date>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATE"  style="text-align: left;;" >
					
							
							<#if newObj && !(itemRecord.recordDate)?has_content>
								
								<@datepicker  onchange="" property_type="DATE" cssClass="cui-noborder-input" name="itemRecord.recordDate" type="date" value="${itemRecord_recordDate_defaultValue!}" id="itemRecord.recordDate"  view=true  cssStyle=""  />
								
							<#else>
							<#if (itemRecord.recordDate)??>
								
								<@datepicker  onchange="" property_type="DATE" cssClass="cui-noborder-input" name="itemRecord.recordDate" type="date" value="${itemRecord.recordDate?string('yyyy-MM-dd')}" id="itemRecord.recordDate"  view=true  cssStyle="" />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATE" cssClass="cui-noborder-input" name="itemRecord.recordDate" type="date" value="" id="itemRecord.recordDate" cssStyle=""  view=true />
								
							</#if>
							</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415340663783')}" >${getText('MESBasic.propertydisplayName.radion1415340663783')}</label>
				</td>
				
						<#assign itemRecord_recordTime_defaultValue  = ''>
							 							<#assign itemRecord_recordTime_defaultValue  = ''>
					<#if (itemRecord_recordTime_defaultValue)?? &&(itemRecord_recordTime_defaultValue)?has_content>
							<#assign itemRecord_recordTime_defaultValue  = getDefaultDateTime(itemRecord_recordTime_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  style="text-align: left;;" >
					
							
							<#if newObj && !(itemRecord.recordTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="itemRecord.recordTime" value="${itemRecord_recordTime_defaultValue!}" type="dateTime"  id="itemRecord.recordTime"  view=true cssStyle=""  />
								
							<#else>
							<#if (itemRecord.recordTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="itemRecord.recordTime" value="${itemRecord.recordTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="itemRecord.recordTime"  view=true cssStyle=""  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="itemRecord.recordTime" value="" type="dateTime" id="itemRecord.recordTime" cssStyle=""  view=true/>
								
							</#if>
							</#if>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415340744970')}" >${getText('MESBasic.propertydisplayName.radion1415340744970')}</label>
				</td>
				
						<#assign itemRecord_workLine_defaultValue  = ''>
							 							<#assign itemRecord_workLine_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${itemRecord_workLine_defaultValue!}" formId="MESBasic_itemRecord_itemRecord_itemRecordView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="itemRecord.workLine" code="WorkArea" value="${(itemRecord.workLine)!}" seniorSystemCode=true />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_itemRecord_itemRecord_itemRecordView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="itemRecord.workLine" code="WorkArea" value="${(itemRecord.workLine)!}" seniorSystemCode=true />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415340802542')}" >${getText('MESBasic.propertydisplayName.radion1415340802542')}</label>
				</td>
				
						<#assign itemRecord_zoneMonth_defaultValue  = ''>
							 							<#assign itemRecord_zoneMonth_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="INTEGER" name="itemRecord.zoneMonth" id="itemRecord_zoneMonth"  style=";" originalvalue="<#if !newObj || (itemRecord.zoneMonth)?has_content>${(itemRecord.zoneMonth?html)!}<#else>${itemRecord_zoneMonth_defaultValue!}</#if>" value="<#if !newObj || (itemRecord.zoneMonth)?has_content>${(itemRecord.zoneMonth?html)!}<#else>${itemRecord_zoneMonth_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
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
		<#if businessCenterList??>
	     	<#list businessCenterList as l>
		<div style="float:none;width:auto;display:none;" class="edit-main grid-s5m0 col-main main-wrap" id="otherContentDiv_${l.relatingModel.code.replace('.','')}">
	     	</div>
	     	</#list>
     	</#if>
     	
		<div id="MESBasic_itemRecord_itemRecord_itemRecordView_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="MESBasic.itemRecord.itemRecord.itemRecordView.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<div id="fileUploadDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-VIEW-MESBasic_1_itemRecord_itemRecordView,html,MESBasic_1_itemRecord_ItemRecord,MESBasic_1) -->
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
						$("#MESBasic_itemRecord_itemRecord_itemRecordView_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#MESBasic_itemRecord_itemRecord_itemRecordView_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#MESBasic_itemRecord_itemRecord_itemRecordView_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#MESBasic_itemRecord_itemRecord_itemRecordView_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			MESBasic.itemRecord.itemRecord.itemRecordView.initCount = 0;
			MESBasic.itemRecord.itemRecord.itemRecordView.initSize = function(nTabIndex){
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
				var conHeight = h-$("#MESBasic_itemRecord_itemRecord_itemRecordView_main_div .edit-head").height()-$("#MESBasic_itemRecord_itemRecord_itemRecordView_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#MESBasic_itemRecord_itemRecord_itemRecordView_main_div .edit-workflow").height()</#if>;
				$("#MESBasic_itemRecord_itemRecord_itemRecordView_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('MESBasic_itemRecord_itemRecord_itemRecordView_datagrids');
				var padding_bottom=16;
				$("#MESBasic_itemRecord_itemRecord_itemRecordView_main_div .pd_bottom,#MESBasic_itemRecord_itemRecord_itemRecordView_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#MESBasic_itemRecord_itemRecord_itemRecordView_main_div .edit-panes-s").each(function(index){
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
									if(MESBasic.itemRecord.itemRecord.itemRecordView.initCount <= 2) {
										setTimeout(function(){MESBasic.itemRecord.itemRecord.itemRecordView.initSize();}, 200);
										MESBasic.itemRecord.itemRecord.itemRecordView.initCount++;
									}/* else {
										MESBasic.itemRecord.itemRecord.itemRecordView.initCount = 0;
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
							if(($("#MESBasic_itemRecord_itemRecord_itemRecordView_main_div .edit-workflow").length > 0) && ($("#MESBasic_itemRecord_itemRecord_itemRecordView_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				$('#MESBasic_itemRecord_itemRecord_itemRecordView_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				MESBasic.itemRecord.itemRecord.itemRecordView.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				MESBasic.itemRecord.itemRecord.itemRecordView.initSize();
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
						if(parseInt($("#MESBasic_itemRecord_itemRecord_itemRecordView_main_div").css("width"),10)==650){
							$("#MESBasic_itemRecord_itemRecord_itemRecordView_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//MESBasic.itemRecord.itemRecord.itemRecordView.resizeLayout();
						//MESBasic.itemRecord.itemRecord.itemRecordView.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#MESBasic_itemRecord_itemRecord_itemRecordView_main_div").css("width"),10)==800){
							$("#MESBasic_itemRecord_itemRecord_itemRecordView_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//MESBasic.itemRecord.itemRecord.itemRecordView.resizeLayout();
						//MESBasic.itemRecord.itemRecord.itemRecordView.initSize();
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
					MESBasic.itemRecord.itemRecord.itemRecordView.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					MESBasic.itemRecord.itemRecord.itemRecordView.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){MESBasic.itemRecord.itemRecord.itemRecordView.initSize();});
				/*
				MESBasic.itemRecord.itemRecord.itemRecordView.resizeLayout=function(){
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

		MESBasic.itemRecord.itemRecord.itemRecordView.validate = function(){
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
		MESBasic.itemRecord.itemRecord.itemRecordView.beforeSaveProcess = function(){
			$('input[name="itemRecord.extraCol"]').remove();
		}
		MESBasic.itemRecord.itemRecord.itemRecordView.processDataGrid = function(){
		};
		MESBasic.itemRecord.itemRecord.itemRecordView.save = function(){
			$('#operateType').val("submit");
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!MESBasic.itemRecord.itemRecord.itemRecordView.validate()){return;}
			//延迟到延迟提交中处理,解决onchange事件无法触发问题
			//MESBasic.itemRecord.itemRecord.itemRecordView.beforeSaveProcess();

			//MESBasic.itemRecord.itemRecord.itemRecordView.processDataGrid();
			$('#MESBasic_itemRecord_itemRecord_itemRecordView_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('MESBasic_itemRecord_itemRecord_itemRecordView_form','MESBasic_itemRecord_itemRecord_itemRecordView_datagrids')) {      
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
		MESBasic.itemRecord.itemRecord.itemRecordView.print = function(){
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
		
		MESBasic.itemRecord.itemRecord.itemRecordView.saveSetting = function(){
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
		
		MESBasic.itemRecord.itemRecord.itemRecordView.printSetting = function(){
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
				MESBasic.itemRecord.itemRecord.itemRecordView.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(MESBasic.itemRecord.itemRecord.itemRecordView.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				MESBasic.itemRecord.itemRecord.itemRecordView.settingDialog.show();
			}
		}
		
		
		MESBasic.itemRecord.itemRecord.itemRecordView._callBackInfo = function(res){
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
 						window.opener.MESBasic.itemRecord.itemRecord.editCallBackInfo(res); 						
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

 				setTimeout(function(){
					window.close();
				},1000);
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.MESBasic.itemRecord.itemRecord.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
			} else {
				CUI.showErrorInfos(res);
			}
		};
		refViewRefresh = function(){
			if($("[name='refViewRefresh']").val() != undefined && "" != $("[name='refViewRefresh']").val()){
				eval($("[name='refViewRefresh']").val());
			}
		}
		
		//控件版PT选人查看按钮单击事件处理函数
		function dataGridBtnImgClick(sUrl,objNameCustomCondition,sTitle,sPTGridID,nRow,sFieldName,oGrid,customCallBack,crossCompany,isObjCustomProp,objCustomPropNames,viewCode){
			//保存当前单击事件的对象信息
			var obj = {
				"oGrid" : oGrid,
				"nRow" : nRow - 1,
				"sKey":	sFieldName
			}
			if(customCallBack){
				MESBasic.itemRecord.itemRecord.itemRecordView._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				MESBasic.itemRecord.itemRecord.itemRecordView._isObjCustomProp_IE = isObjCustomProp;
			} else {
				MESBasic.itemRecord.itemRecord.itemRecordView._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				MESBasic.itemRecord.itemRecord.itemRecordView._objCustomPropNames_IE = objCustomPropNames;
			} else {
				MESBasic.itemRecord.itemRecord.itemRecordView._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				MESBasic.itemRecord.itemRecord.itemRecordView._refViewCode_IE = viewCode;
			} else {
				MESBasic.itemRecord.itemRecord.itemRecordView._refViewCode_IE = '';
			}
			MESBasic.itemRecord.itemRecord.itemRecordView._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		MESBasic.itemRecord.itemRecord.itemRecordView.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			MESBasic.itemRecord.itemRecord.itemRecordView._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			MESBasic.itemRecord.itemRecord.itemRecordView._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			MESBasic.itemRecord.itemRecord.itemRecordView.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			MESBasic.itemRecord.itemRecord.itemRecordView._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				MESBasic.itemRecord.itemRecord.itemRecordView._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		MESBasic.itemRecord.itemRecord.itemRecordView._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(MESBasic.itemRecord.itemRecord.itemRecordView._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(MESBasic.itemRecord.itemRecord.itemRecordView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				MESBasic.itemRecord.itemRecord.itemRecordView.gridEventObj = gridEventObj;
				callbackName = "MESBasic.itemRecord.itemRecord.itemRecordView.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "MESBasic.itemRecord.itemRecord.itemRecordView.getMultiselectCallBackInfo_DG" : "MESBasic.itemRecord.itemRecord.itemRecordView.getcallBackInfo_DG";
				MESBasic.itemRecord.itemRecord.itemRecordView._currRow = $(obj).closest('tr')[0];
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="MESBasic.itemRecord.itemRecord.itemRecordView.getcallBackInfo";
			}

			if(_prefix!=''){
				MESBasic.itemRecord.itemRecord.itemRecordView._prefix = _prefix.substring(1);
			}
			
			MESBasic.itemRecord.itemRecord.itemRecordView._oGrid = oGrid;
			MESBasic.itemRecord.itemRecord.itemRecordView._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					MESBasic.itemRecord.itemRecord.itemRecordView._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					MESBasic.itemRecord.itemRecord.itemRecordView._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					MESBasic.itemRecord.itemRecord.itemRecordView._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					MESBasic.itemRecord.itemRecord.itemRecordView._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					MESBasic.itemRecord.itemRecord.itemRecordView._refViewCode = oColumn.viewCode;
				} else {
					MESBasic.itemRecord.itemRecord.itemRecordView._refViewCode = '';
				}
			} else {
				MESBasic.itemRecord.itemRecord.itemRecordView._isObjCustomProp = false;
				MESBasic.itemRecord.itemRecord.itemRecordView._objCustomPropNames = '';
				MESBasic.itemRecord.itemRecord.itemRecordView._refViewCode = '';
			}
			if (MESBasic.itemRecord.itemRecord.itemRecordView._isObjCustomProp == true && MESBasic.itemRecord.itemRecord.itemRecordView._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				MESBasic.itemRecord.itemRecord.itemRecordView._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				MESBasic.itemRecord.itemRecord.itemRecordView._customCallBack = customCallBack;
			}
			if(MESBasic.itemRecord.itemRecord.itemRecordView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(MESBasic.itemRecord.itemRecord.itemRecordView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof MESBasic.itemRecord.itemRecord.itemRecordView._querycustomFuncN == "function") {
				refparam += MESBasic.itemRecord.itemRecord.itemRecordView._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			MESBasic.itemRecord.itemRecord.itemRecordView._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		MESBasic.itemRecord.itemRecord.itemRecordView._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(MESBasic.itemRecord.itemRecord.itemRecordView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(MESBasic.itemRecord.itemRecord.itemRecordView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			MESBasic.itemRecord.itemRecord.itemRecordView._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'MESBasic.itemRecord.itemRecord.itemRecordView.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		MESBasic.itemRecord.itemRecord.itemRecordView._querycustomFunc = function(obj) {
			var str = eval("typeof(MESBasic.itemRecord.itemRecord.itemRecordView.query_"+obj+")!='undefined'") ? eval('MESBasic.itemRecord.itemRecord.itemRecordView.query_'+obj+'()') : null;
			return str;
		};
		MESBasic.itemRecord.itemRecord.itemRecordView.getcallBackGroupInfo = function(obj){
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
			MESBasic.itemRecord.itemRecord.itemRecordView._dialog.close();
		}
		MESBasic.itemRecord.itemRecord.itemRecordView.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('MESBasic_itemRecord_itemRecord_itemRecordView_form',obj[0], MESBasic.itemRecord.itemRecord.itemRecordView._prefix, MESBasic.itemRecord.itemRecord.itemRecordView._sUrl);
			CUI.commonFills('MESBasic_itemRecord_itemRecord_itemRecordView_form',MESBasic.itemRecord.itemRecord.itemRecordView._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (MESBasic.itemRecord.itemRecord.itemRecordView._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(MESBasic.itemRecord.itemRecord.itemRecordView._customCallBack) {
					eval(MESBasic.itemRecord.itemRecord.itemRecordView._customCallBack);
					MESBasic.itemRecord.itemRecord.itemRecordView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.itemRecord.itemRecord.itemRecordView._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		MESBasic.itemRecord.itemRecord.itemRecordView.getcallBackInfo_DG_IE = function(obj){
			if(MESBasic.itemRecord.itemRecord.itemRecordView._customBeforeCallBack) {
				var flag = eval(MESBasic.itemRecord.itemRecord.itemRecordView._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = MESBasic.itemRecord.itemRecord.itemRecordView.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( MESBasic.itemRecord.itemRecord.itemRecordView._isObjCustomProp_IE == true && MESBasic.itemRecord.itemRecord.itemRecordView._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,MESBasic.itemRecord.itemRecord.itemRecordView._sUrl,MESBasic.itemRecord.itemRecord.itemRecordView._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,MESBasic.itemRecord.itemRecord.itemRecordView._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (MESBasic.itemRecord.itemRecord.itemRecordView._isObjCustomProp_IE == true && MESBasic.itemRecord.itemRecord.itemRecordView._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = MESBasic.itemRecord.itemRecord.itemRecordView._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = MESBasic.itemRecord.itemRecord.itemRecordView._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && MESBasic.itemRecord.itemRecord.itemRecordView._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + MESBasic.itemRecord.itemRecord.itemRecordView._refViewCode_IE + '&id=' + id,
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
				if(MESBasic.itemRecord.itemRecord.itemRecordView._customCallBack) {
					eval(MESBasic.itemRecord.itemRecord.itemRecordView._customCallBack);
					MESBasic.itemRecord.itemRecord.itemRecordView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.itemRecord.itemRecord.itemRecordView._dialog.close();
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
		
		MESBasic.itemRecord.itemRecord.itemRecordView.getcallBackInfo_DG = function(obj){
			if(MESBasic.itemRecord.itemRecord.itemRecordView._customBeforeCallBack) {
				var flag = eval(MESBasic.itemRecord.itemRecord.itemRecordView._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(MESBasic.itemRecord.itemRecord.itemRecordView._currRow).next().length==0){
						MESBasic.itemRecord.itemRecord.itemRecordView._oGrid.addNewRow();
					}	
					MESBasic.itemRecord.itemRecord.itemRecordView._currRow = $(MESBasic.itemRecord.itemRecord.itemRecordView._currRow).next();
					$(MESBasic.itemRecord.itemRecord.itemRecordView._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(MESBasic.itemRecord.itemRecord.itemRecordView._currRow,obj[i], MESBasic.itemRecord.itemRecord.itemRecordView._prefix, MESBasic.itemRecord.itemRecord.itemRecordView._sUrl);
				if (MESBasic.itemRecord.itemRecord.itemRecordView._isObjCustomProp == true && MESBasic.itemRecord.itemRecord.itemRecordView._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(MESBasic.itemRecord.itemRecord.itemRecordView._currRow,MESBasic.itemRecord.itemRecord.itemRecordView._prefix,obj[i],MESBasic.itemRecord.itemRecord.itemRecordView._oGrid,MESBasic.itemRecord.itemRecord.itemRecordView._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(MESBasic.itemRecord.itemRecord.itemRecordView._currRow,MESBasic.itemRecord.itemRecord.itemRecordView._prefix,obj[i],MESBasic.itemRecord.itemRecord.itemRecordView._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + MESBasic.itemRecord.itemRecord.itemRecordView._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + MESBasic.itemRecord.itemRecord.itemRecordView._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && MESBasic.itemRecord.itemRecord.itemRecordView._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + MESBasic.itemRecord.itemRecord.itemRecordView._refViewCode + '&id=' + id,
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
									name = MESBasic.itemRecord.itemRecord.itemRecordView._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(MESBasic.itemRecord.itemRecord.itemRecordView._currRow, objs, MESBasic.itemRecord.itemRecord.itemRecordView._oGrid);
							}
						}
					}
				}
			}
			try{
				if(MESBasic.itemRecord.itemRecord.itemRecordView._customCallBack) {
					eval(MESBasic.itemRecord.itemRecord.itemRecordView._customCallBack);
					MESBasic.itemRecord.itemRecord.itemRecordView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.itemRecord.itemRecord.itemRecordView._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + MESBasic.itemRecord.itemRecord.itemRecordView._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		MESBasic.itemRecord.itemRecord.itemRecordView.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(MESBasic.itemRecord.itemRecord.itemRecordView._oGrid, MESBasic.itemRecord.itemRecord.itemRecordView._currRow, MESBasic.itemRecord.itemRecord.itemRecordView._key, MESBasic.itemRecord.itemRecord.itemRecordView._displayFieldName, obj[i])
			}
			try{
				if(MESBasic.itemRecord.itemRecord.itemRecordView._customCallBack) {
					eval(MESBasic.itemRecord.itemRecord.itemRecordView._customCallBack);
					MESBasic.itemRecord.itemRecord.itemRecordView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.itemRecord.itemRecord.itemRecordView._dialog.close();
			} catch(e){}
		};
		
		MESBasic.itemRecord.itemRecord.itemRecordView.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						MESBasic.itemRecord.itemRecord.itemRecordView.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#MESBasic_itemRecord_itemRecord_itemRecordView_form'));
						}
					}
				}
			});
		};

		$(function(){
			MESBasic.itemRecord.itemRecord.itemRecordView.onloadForProduct();
		});

		MESBasic.itemRecord.itemRecord.itemRecordView.beforeSubmitMethodSettingInPage = function(){
			MESBasic.itemRecord.itemRecord.itemRecordView.onsaveForProduct();
		};
		MESBasic.itemRecord.itemRecord.itemRecordView.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  MESBasic.itemRecord.itemRecord.itemRecordView.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		MESBasic.itemRecord.itemRecord.itemRecordView.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#MESBasic_itemRecord_itemRecord_itemRecordView_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#MESBasic_itemRecord_itemRecord_itemRecordView_main_div").hide();
				},100);
				//CUI("#MESBasic_itemRecord_itemRecord_itemRecordView_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		MESBasic.itemRecord.itemRecord.itemRecordView.showThis = function(){
			if(!CUI("#MESBasic_itemRecord_itemRecord_itemRecordView_main_div").is(':visible')) {
				CUI("#MESBasic_itemRecord_itemRecord_itemRecordView_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		MESBasic.itemRecord.itemRecord.itemRecordView.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			MESBasic.itemRecord.itemRecord.itemRecordView.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "MESBasic_itemRecord_itemRecord_itemRecordView_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=MESBasic&modelName=MESBasic_1_itemRecord_ItemRecord&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			MESBasic.itemRecord.itemRecord.itemRecordView.auditDialog.show();
			</#if>
		}
		
		
		MESBasic.itemRecord.itemRecord.itemRecordView.showInfoDialog=function(mode){
			
			MESBasic.itemRecord.itemRecord.itemRecordView.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "MESBasic_itemRecord_itemRecord_itemRecordView_dealInfo",
				modal:true,
				height:500,
				width: 950,//适应国际化版
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			MESBasic.itemRecord.itemRecord.itemRecordView.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		MESBasic.itemRecord.itemRecord.itemRecordView.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			<#if pendingId??>
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=MESBasic_1_itemRecord");
			<#else>
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?readOnlyFlag=true&linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=MESBasic_1_itemRecord");
			</#if>
			}
		}
		
		MESBasic.itemRecord.itemRecord.itemRecordView.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/MESBasic/itemRecord/itemRecord/dealInfo-list.action&dlTableInfoId=${(itemRecord.tableInfoId)?default('')}");
			}
		}
		MESBasic.itemRecord.itemRecord.itemRecordView.showFlowInfo=function(){
		     //IE8环境下使用旧版flash流程展现页面，其他情况使用html5流程展现页面
		    var browser=navigator.appName; 
			var b_version=navigator.appVersion; 
			var version=b_version.split(";"); 
			var trim_Version=version[1]&&version[1].replace(/[ ]/g,"");
			var isIE8=(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE8.0")||($.browser.msie&&(Number($.browser.version)<= 8));//IE8兼容视图模式下浏览器版本判断逻辑补充
			if(CUI.trim(CUI("#flowDiv").html())==""){
				if(isIE8){
				    CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=MESBasic_1_itemRecord_ItemRecord&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(itemRecord.tableInfoId)?default('')}");
				}else{
				    CUI("#flowDiv").load("/ec/workflow/flowViewH5.action?env=runtime&modelCode=MESBasic_1_itemRecord_ItemRecord&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(itemRecord.tableInfoId)?default('')}");
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
		MESBasic.itemRecord.itemRecord.itemRecordView.supervision=function(){
			MESBasic.itemRecord.itemRecord.itemRecordView.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(itemRecord.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				MESBasic.itemRecord.itemRecord.itemRecordView.modifyOwnerStaffDialog.show();
		}
		

		/* CUSTOM CODE START(view-VIEW-MESBasic_1_itemRecord_itemRecordView,js,MESBasic_1_itemRecord_ItemRecord,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
		MESBasic.itemRecord.itemRecord.itemRecordView.onloadForProduct = function(){
		/* CUSTOM CODE START(view-VIEW-MESBasic_1_itemRecord_itemRecordView,onloadForProduct,MESBasic_1_itemRecord_ItemRecord,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
		}

		MESBasic.itemRecord.itemRecord.itemRecordView.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-VIEW-MESBasic_1_itemRecord_itemRecordView,onsaveForProduct,MESBasic_1_itemRecord_ItemRecord,MESBasic_1) */
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
				<div class="sidebar-top"><a href="#"  onclick="MESBasic.itemRecord.itemRecord.itemRecordView.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="MESBasic.itemRecord.itemRecord.itemRecordView.showBusinessList('${l.relatingModel.code.replace('.','')}',${(itemRecord.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
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