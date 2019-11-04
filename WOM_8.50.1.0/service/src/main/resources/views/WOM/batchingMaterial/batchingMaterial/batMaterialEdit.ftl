<!-- WOM_7.5.0.0/batchingMaterial/batMaterialEdit -->
<#assign isWorkflow = true> 
<#assign isAttachment = true> 
	<#assign fileuploadType = "Table">
	<#assign fileuploadLinkId = batchingMaterial.tableInfoId!>
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
<#-- 实体对象 -->
<#assign tableObj = batchingMaterial>
<#-- 命名空间 -->
<#assign editPageNs = "WOM.batchingMaterial.batchingMaterial.batMaterialEdit">
<#-- 模型名称-->
<#assign modelName = "batchingMaterial">
<#-- 视图编码-->
<#assign viewCode = "WOM_7.5.0.0_batchingMaterial_batMaterialEdit">
<#-- 实体编码-->
<#assign entity_code = "WOM_7.5.0.0_batchingMaterial">
<#-- 视图名称-->
<#assign viewName = "batMaterialEdit">
<#-- datagrid编码-->
<#assign datagridCode = "WOM_batchingMaterial_batchingMaterial_batMaterialEdit_datagrids">
<#-- 首字母大写的模型名称-->
<#assign upcaseModelName = "BatchingMaterial">
<#-- 页面打印按钮 -->
<#assign isPrint = false>
<#-- 控件打印按钮 -->
<#assign controlPrint = true>
<#-- 是否只读 -->
<#assign allReadOnly = false>
<#-- 是否是参照视图 -->
<#assign isReference =false>
<#-- 是否可弃审 -->
<#assign retrialFlag = false>
<#-- formid -->
<#assign editFormId = "WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form">
<#-- 待办状态 -->
<#assign pendingstatus =( batchingMaterial.pending.taskDescription)!>
<#-- 打印控件名称 -->
<#assign controlName = "WOM.viewcontrolName.randon1500858000762">
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
        <#assign configTitle = getText('WOM.viewtitle.randon1491791055890')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		
		#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form{float:left;width:100%;}
		
		
		</style>
		<script type="text/javascript">
			CUI.ns('WOM.batchingMaterial.batchingMaterial.batMaterialEdit');
			WOM.batchingMaterial.batchingMaterial.batMaterialEdit.currentUser = ${userJson};
			WOM.batchingMaterial.batchingMaterial.batMaterialEdit.currentStaff = ${staffJson};
			WOM.batchingMaterial.batchingMaterial.batMaterialEdit.currentDepartment = ${deptJson};
			WOM.batchingMaterial.batchingMaterial.batMaterialEdit.currentPosition = ${postJson};
			WOM.batchingMaterial.batchingMaterial.batMaterialEdit.currentCompany = ${compJson};
		</script>
		<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_batchingMaterial_batMaterialEdit,head,WOM_7.5.0.0_batchingMaterial_BatchingMaterial,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
    </head>
	<body class="view-edit ">
		<@loadpanel newType=true/>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="batchingMaterial.productId.id,batchingMaterial.orderStaff.id,batchingMaterial.taskID.id,batchingMaterial.id,batchingMaterial.needPartId.id," onsubmitMethod="WOM.batchingMaterial.batchingMaterial.batMaterialEdit.beforeSubmitMethod()" id="WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form" namespace="/WOM/batchingMaterial/batchingMaterial/batMaterialEdit" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=WOM_7.5.0.0_batchingMaterial_BatchingMaterial&_bapFieldPermissonModelName_=BatchingMaterial&superEdit=${(superEdit!false)?string}" editPageNs="WOM.batchingMaterial.batchingMaterial.batMaterialEdit" callback="WOM.batchingMaterial.batchingMaterial.batMaterialEdit._callBackInfo" ecform="true">
			<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
			<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div">
			<div class="edit-head">
				<#include "../../../ec/tableInfo/operateheadbar_all.ftl" >
				<#include "../../../ec/tableInfo/creatorInfo.ftl" >
			</div>
    		<div class="edit-main" id="WOM_batchingMaterial_batchingMaterial_batMaterialEdit">
    			<div class="edit-content">
    	<#include "../../../ec/tableInfo/formparam.ftl" >				
					<input type="hidden" name="batchingMaterial.productId.id" value="${(batchingMaterial.productId.id)!""}" originalvalue="${(batchingMaterial.productId.id)!""}"/>
					<input type="hidden" name="batchingMaterial.orderStaff.id" value="${(batchingMaterial.orderStaff.id)!""}" originalvalue="${(batchingMaterial.orderStaff.id)!""}"/>
					<input type="hidden" name="batchingMaterial.taskID.id" value="${(batchingMaterial.taskID.id)!""}" originalvalue="${(batchingMaterial.taskID.id)!""}"/>
					<input type="hidden" name="batchingMaterial.id" value="${(batchingMaterial.id)!""}" originalvalue="${(batchingMaterial.id)!""}"/>
					<input type="hidden" name="batchingMaterial.needPartId.id" value="${(batchingMaterial.needPartId.id)!""}" originalvalue="${(batchingMaterial.needPartId.id)!""}"/>
		<div class="dash-line"></div>
<script type="text/javascript">
var attcountid = "WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=WOM_7.5.0.0_batchingMaterial', null, function(){
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
					
							<label style="width:100%;;" value="${getText('ec.common.tableNo')}" >${getText('ec.common.tableNo')}</label>
				</td>
				
						<#assign batchingMaterial_tableNo_defaultValue  = ''>
							 							<#assign batchingMaterial_tableNo_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="batchingMaterial.tableNo" id="batchingMaterial_tableNo"  style=";" originalvalue="<#if !newObj || (batchingMaterial.tableNo)?has_content>${(batchingMaterial.tableNo?html)!}<#else>${batchingMaterial_tableNo_defaultValue!}</#if>" value="<#if !newObj || (batchingMaterial.tableNo)?has_content>${(batchingMaterial.tableNo?html)!}<#else>${batchingMaterial_tableNo_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.common.tableNo11111111')}" >${getText('WOM.common.tableNo11111111')}</label>
				</td>
				
						<#assign batchingMaterial_taskID_tableNo_defaultValue  = ''>
														<#assign batchingMaterial_taskID_tableNo_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('WOM.viewtitle.randon1489737198145')}" viewType="readonly" deValue="${batchingMaterial_taskID_tableNo_defaultValue!}" conditionfunc="WOM.batchingMaterial.batchingMaterial.batMaterialEdit._querycustomFunc('batchingMaterial_taskID_tableNo')" view=true  value="${(batchingMaterial.taskID.tableNo)!}" displayFieldName="tableNo" name="batchingMaterial.taskID.tableNo" id="batchingMaterial_taskID_tableNo" type="other" url="/WOM/produceTask/produceTask/taskRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form" editCustomCallback=";" refViewCode="WOM_7.5.0.0_produceTask_taskRef"  onkeyupfuncname=";_callback_batchingMaterial_taskID_tableNo(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(batchingMaterial.id)?? && (batchingMaterial.taskID.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${batchingMaterial.taskID.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form',obj, 'batchingMaterial.taskID', '/WOM/produceTask/produceTask/taskRef.action');
												CUI.commonFills('WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form', 'batchingMaterial.taskID',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('ec.common.createTime')}" >${getText('ec.common.createTime')}</label>
				</td>
				
						<#assign batchingMaterial_createTime_defaultValue  = ''>
							 							<#assign batchingMaterial_createTime_defaultValue  = ''>
					<#if (batchingMaterial_createTime_defaultValue)?? &&(batchingMaterial_createTime_defaultValue)?has_content>
							<#assign batchingMaterial_createTime_defaultValue  = getDefaultDateTime(batchingMaterial_createTime_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  align="left" style="text-align: left;;" >
					
							
							<#if newObj && !(batchingMaterial.createTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="batchingMaterial.createTime" value="${batchingMaterial_createTime_defaultValue!}" type="dateTime"  id="batchingMaterial.createTime"  view=true cssStyle=""   align="left"/>
								
							<#else>
							<#if (batchingMaterial.createTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="batchingMaterial.createTime" value="${batchingMaterial.createTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="batchingMaterial.createTime"  view=true cssStyle="" align="left"  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="batchingMaterial.createTime" value="" type="dateTime" id="batchingMaterial.createTime" cssStyle=""  view=true align="left"/>
								
							</#if>
							</#if>
							
				</td>
				</tr><tr >
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.staff.dimissionStaff_xls.staffName334')}" >${getText('WOM.staff.dimissionStaff_xls.staffName334')}</label>
				</td>
				
						<#assign batchingMaterial_orderStaff_name_defaultValue  = ''>
														<#assign batchingMaterial_orderStaff_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.view.reference')}" viewType="readonly" deValue="${batchingMaterial_orderStaff_name_defaultValue!}" conditionfunc="WOM.batchingMaterial.batchingMaterial.batMaterialEdit._querycustomFunc('batchingMaterial_orderStaff_name')" view=true  value="${(batchingMaterial.orderStaff.name)!}" displayFieldName="name" name="batchingMaterial.orderStaff.name" id="batchingMaterial_orderStaff_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form" editCustomCallback=";" refViewCode="sysbase_1.0_staff_ref" onkeyupfuncname=";_callback_batchingMaterial_orderStaff_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (batchingMaterial_orderStaff_name_defaultValue)=='currentUser'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.id}'};
											obj = foundation.common.getObject('WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form',obj, 'batchingMaterial.orderStaff', '/foundation/staff/common/staffListFrameset.action');
											CUI.commonFills('WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form', 'batchingMaterial.orderStaff',obj,true);
											$('input:hidden[name="batchingMaterial.orderStaff.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(batchingMaterial.id)?? && (batchingMaterial.orderStaff.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${batchingMaterial.orderStaff.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form',obj, 'batchingMaterial.orderStaff', '/foundation/staff/common/staffListFrameset.action');
												CUI.commonFills('WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form', 'batchingMaterial.orderStaff',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion1415772644833222')}" >${getText('WOM.propertydisplayName.radion1415772644833222')}</label>
				</td>
				
						<#assign batchingMaterial_productId_productCode_defaultValue  = ''>
														<#assign batchingMaterial_productId_productCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}" viewType="readonly" deValue="${batchingMaterial_productId_productCode_defaultValue!}" conditionfunc="WOM.batchingMaterial.batchingMaterial.batMaterialEdit._querycustomFunc('batchingMaterial_productId_productCode')" view=true  value="${(batchingMaterial.productId.productCode)!}" displayFieldName="productCode" name="batchingMaterial.productId.productCode" id="batchingMaterial_productId_productCode" type="other" url="/MESBasic/product/product/productRefNew.action" clicked=true multiple=false mnewidth=260 formId="WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form" editCustomCallback=";" refViewCode="MESBasic_1_product_productRefNew" onkeyupfuncname=";_callback_batchingMaterial_productId_productCode(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(batchingMaterial.id)?? && (batchingMaterial.productId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${batchingMaterial.productId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form',obj, 'batchingMaterial.productId', '/MESBasic/product/product/productRefNew.action');
												CUI.commonFills('WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form', 'batchingMaterial.productId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion1415772740737334')}" >${getText('WOM.propertydisplayName.radion1415772740737334')}</label>
				</td>
				
						<#assign batchingMaterial_productId_productName_defaultValue  = ''>
														<#assign batchingMaterial_productId_productName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="batchingMaterial.productId.productName" id="batchingMaterial_productId_productName"  style=";" originalvalue="<#if !newObj || (batchingMaterial.productId.productName)?has_content>${(batchingMaterial.productId.productName?html)!}<#else>${batchingMaterial_productId_productName_defaultValue!}</#if>" value="<#if !newObj || (batchingMaterial.productId.productName)?has_content>${(batchingMaterial.productId.productName?html)!}<#else>${batchingMaterial_productId_productName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon14917899223367')}" >${getText('WOM.propertydisplayName.randon14917899223367')}</label>
				</td>
				
						<#assign batchingMaterial_needNum_defaultValue  = ''>
							 							<#assign batchingMaterial_needNum_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="batchingMaterial.needNum" id="batchingMaterial_needNum"  style=";" originalvalue="<#if newObj&& !(batchingMaterial.needNum)?has_content>${batchingMaterial_needNum_defaultValue!}<#elseif (batchingMaterial.needNum)?has_content>#{(batchingMaterial.needNum)!; m2M2}</#if>" value="<#if newObj&& !(batchingMaterial.needNum)?has_content>${batchingMaterial_needNum_defaultValue!}<#elseif (batchingMaterial.needNum)?has_content>#{(batchingMaterial.needNum)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion1419232393782555')}" >${getText('WOM.propertydisplayName.radion1419232393782555')}</label>
				</td>
				
						<#assign batchingMaterial_needPartId_factoryId_name_defaultValue  = ''>
														<#assign batchingMaterial_needPartId_factoryId_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('WOM.viewtitle.randon1491792578939')}" viewType="readonly" deValue="${batchingMaterial_needPartId_factoryId_name_defaultValue!}" conditionfunc="WOM.batchingMaterial.batchingMaterial.batMaterialEdit._querycustomFunc('batchingMaterial_needPartId_factoryId_name')" view=true  value="${(batchingMaterial.needPartId.factoryId.name)!}" displayFieldName="name" name="batchingMaterial.needPartId.factoryId.name" id="batchingMaterial_needPartId_factoryId_name" type="other" url="/WOM/batchingMaterialNeed/batchingMaterialNeed/batchNeedRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form" editCustomCallback=";" refViewCode="WOM_7.5.0.0_batchingMaterialNeed_batchNeedRef"  onkeyupfuncname=";_callback_batchingMaterial_needPartId_factoryId_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(batchingMaterial.id)?? && (batchingMaterial.needPartId.factoryId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${batchingMaterial.needPartId.factoryId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form',obj, 'batchingMaterial.needPartId.factoryId', '/WOM/batchingMaterialNeed/batchingMaterialNeed/batchNeedRef.action');
												CUI.commonFills('WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form', 'batchingMaterial.needPartId.factoryId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1489991460442')}" >${getText('MESBasic.propertydisplayName.randon1489991460442')}</label>
				</td>
				
						<#assign batchingMaterial_needPartId_factoryId_area_defaultValue  = ''>
														<#assign batchingMaterial_needPartId_factoryId_area_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${batchingMaterial_needPartId_factoryId_area_defaultValue!}" formId="WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="batchingMaterial.needPartId.factoryId.area.id" code="MesArea" value="${(batchingMaterial.needPartId.factoryId.area.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="batchingMaterial.needPartId.factoryId.area.id" code="MesArea" value="${(batchingMaterial.needPartId.factoryId.area.id)!}"  />
									
								</#if>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1491789966310')}" >${getText('WOM.propertydisplayName.randon1491789966310')}</label>
				</td>
				
						<#assign batchingMaterial_arriveTime_defaultValue  = ''>
							 							<#assign batchingMaterial_arriveTime_defaultValue  = ''>
					<#if (batchingMaterial_arriveTime_defaultValue)?? &&(batchingMaterial_arriveTime_defaultValue)?has_content>
							<#assign batchingMaterial_arriveTime_defaultValue  = getDefaultDateTime(batchingMaterial_arriveTime_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  align="left" style="text-align: left;;" >
					
							
							<#if newObj && !(batchingMaterial.arriveTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="batchingMaterial.arriveTime" value="${batchingMaterial_arriveTime_defaultValue!}" type="dateTime"  id="batchingMaterial.arriveTime"  view=true cssStyle=""   align="left"/>
								
							<#else>
							<#if (batchingMaterial.arriveTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="batchingMaterial.arriveTime" value="${batchingMaterial.arriveTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="batchingMaterial.arriveTime"  view=true cssStyle="" align="left"  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="batchingMaterial.arriveTime" value="" type="dateTime" id="batchingMaterial.arriveTime" cssStyle=""  view=true align="left"/>
								
							</#if>
							</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1491789944047')}" >${getText('WOM.propertydisplayName.randon1491789944047')}</label>
				</td>
				
						<#assign batchingMaterial_doneNum_defaultValue  = '0'>
							 					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="batchingMaterial.doneNum" id="batchingMaterial_doneNum"  style=";" originalvalue="<#if newObj&& !(batchingMaterial.doneNum)?has_content>${batchingMaterial_doneNum_defaultValue!}<#elseif (batchingMaterial.doneNum)?has_content>#{(batchingMaterial.doneNum)!; m2M2}</#if>" value="<#if newObj&& !(batchingMaterial.doneNum)?has_content>${batchingMaterial_doneNum_defaultValue!}<#elseif (batchingMaterial.doneNum)?has_content>#{(batchingMaterial.doneNum)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1491790319028')}" >${getText('WOM.propertydisplayName.randon1491790319028')}</label>
				</td>
				
						<#assign batchingMaterial_state_defaultValue  = 'womBatOrderState/01'>
							 					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${batchingMaterial_state_defaultValue!}" formId="WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="batchingMaterial.state.id" code="womBatOrderState" value="${(batchingMaterial.state.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="batchingMaterial.state.id" code="womBatOrderState" value="${(batchingMaterial.state.id)!}"  />
									
								</#if>
							
				</td>
		</tr>
	</table>
		<#assign cpvmInfo = ''>
			<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_batchingMaterial_BatchingMaterial", "WOM_7.5.0.0_batchingMaterial_batMaterialEdit", 'EDIT')>
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
					<#assign elementName = 'batchingMaterial' + "." + columnName>
					<#assign elementId = 'batchingMaterial' + "_" + columnName>
					<#if cpvmInfo?? && c.relatedKey?has_content>
					<#assign cpvmInfo = cpvmInfo + ',' + c.relatedKey + "||" + elementName>
					</#if>
					<#assign fieldType = c.fieldType>
					<#if fieldType == 'TEXTFIELD'>
					<div class="fix-input">
					<#if columnType == 'DECIMAL'>
						<#if c.precision??>
							<#assign decimalNum =c.precision!>
						</#if>
						<@s.hidden property_type="${columnType}" id="${elementName?replace('.', '_')}_hide" name="${elementName}" />
						<input property_type="${columnType}" type="text" id="${elementName?replace('.', '_')}" name="${elementName?replace('.', '_')}" class="cui-noborder-input numberField" <#if c.align??>style="text-align:${c.align?html};"</#if> <#if (c.readonly!false)>readonly="readonly"</#if>  />
					<#elseif columnType == 'INTEGER'>
						<@s.textfield id="${elementName?replace('.', '_')}" name="${elementName}" cssClass="cui-noborder-input numberField" cssStyle="text-align:${c.align!}" readonly="${(c.readonly!false)?c}" />
					<#else>
						<@s.textfield id="${elementName?replace('.', '_')}" name="${elementName}" cssClass="cui-noborder-input" cssStyle="text-align:${c.align!}" readonly="${(c.readonly!false)?c}" />
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
							<#if c.format == 'THOUSAND' || c.format == 'TEN_THOUSAND'>
							$("#${elementName?replace('.', '_')}").unbind("blur").unbind("focus").bind({
								blur : function() {
									if ( !$(this).val() ) {
										$('#${elementName?replace('.', '_')}_hide').val('');
										return;
									}
									if ( !isDecimal($(this).val()) ) {
										$('#${elementName?replace('.', '_')}_hide').val($(this).val());
										return;
									}
									var temp = $(this).val();
									var percision = parseInt("${decimalNum}");
									if (percision > -1) {
										temp = (temp * 1).toFixed(percision);
									}
									$('#${elementName?replace('.', '_')}_hide').val( temp );
									temp = formatMoney(<#if c.format == 'THOUSAND'>3<#elseif c.format = 'TEN_THOUSAND'>4</#if>, temp);
									$(this).val(temp);
								},
								focus : function() {
									$(this).val($('#${elementName?replace('.', '_')}_hide').val());
								}	
							});
							<#elseif c.format == 'PERCENT'>
							$("#${elementName?replace('.', '_')}").unbind('blur').unbind('focus').bind({
								blur : function() {
									if ( !$(this).val() ) {
										$('#${elementName?replace('.', '_')}_hide').val('');
										return;
									}
									if ( !isDecimal($(this).val()) ) {
										$('#${elementName?replace('.', '_')}_hide').val($(this).val());
										return;
									}
									var percision = parseInt("${decimalNum}");
									if ( percision > -1 ) {
										$('#${elementName?replace('.', '_')}_hide').val( ($(this).val() / 100).toFixed(percision) );
										var num = percision - 2 >= 0 ? percision - 2 : 0;
										var temp = ($(this).val() * 1).toFixed(num) + "%";
										$(this).val(temp);
									} else {
										$('#${elementName?replace('.', '_')}_hide').val( ($(this).val() / 100) );
										$(this).val($(this).val() + "%");
									}
								},
								focus : function() {
									if ( $('#${elementName?replace('.', '_')}_hide').val() ) {
										if ( !isDecimal($('#${elementName?replace('.', '_')}_hide').val()) ) {
											$(this).val( $('#${elementName?replace('.', '_')}_hide').val() );
										} else {
											var percision = parseInt("${decimalNum}");
											if (percision > -1) {
												var num = percision - 2 >= 0 ? percision - 2 : 0;
												$(this).val( ($('#${elementName?replace('.', '_')}_hide').val() * 100).toFixed(num) );
											} else {
												$(this).val( ($('#${elementName?replace('.', '_')}_hide').val() * 100) );
											}
										}
									} else {
										$(this).val('');
									}
								}
							});
							<#else>
							$('#${elementName?replace('.', '_')}').unbind('blur').bind('blur', function(){
								if ( !$(this).val() ) {
									$('#${elementName?replace('.', '_')}_hide').val('');
									return;
								}
								if ( !isDecimal($(this).val()) ) {
									$('#${elementName?replace('.', '_')}_hide').val( $(this).val() );
									return;
								}
								var percision = parseInt("${decimalNum}");
								if (percision > -1) {
									$(this).val( ($(this).val() * 1).toFixed(percision) );
								}
								$('#${elementName?replace('.', '_')}_hide').val( $(this).val() );
							});
							</#if>
							</#if>
						});
					</script>
					<#elseif fieldType == 'TEXTAREA'>
						<div class="fix-input fix-ie7-textarea">
							<@s.textarea property_type="${columnType}" id="${elementName?replace('.', '_')}" name="${elementName}" rows="${c.textareaRow!3}" cssClass="cui-textarea-wh" cssStyle="border:0;line-height:16px;padding-left:2px;text-align:${c.align!}" readonly="${(c.readonly!false)?c}" onpropertychange="setTimeout(function(){autoTextarea('${elementName?replace('.', '_')}',null,null,true);}, 100);" oninput="setTimeout(function(){autoTextarea('${elementName?replace('.', '_')}',null,null,true);}, 100);" onkeyup="autoTextarea('${elementName?replace('.', '_')}',null,null,true);" />
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
						<#if batchingMaterial[columnName]??>
							<#assign dateVal = (batchingMaterial[columnName])?string('yyyy-MM-dd HH:mm:ss')>
						</#if>
						<@datepicker property_type="${columnType}" cssClass="cui-noborder-input" name="${elementName}" id="${elementName?replace('.', '_')}" value=dateVal type="${dateType}" align="${c.align!}" view=(c.readonly!false) />
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
							<@systemcode property_type="${columnType}" iscustom=true showType="${fieldType}" viewType=viewType cssStyle="text-align:${c.align!}" formId="WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form" classStyle="cui-noborder-input" view=(c.readonly!false) cssStyle="" ecFlag=true multable=isMultable name="${elementName}" code="${(c.property.fillcontentMap.fillContent)!}" value="${batchingMaterial[columnName]!}" seniorSystemCode=isS2 />
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
							<input type="hidden" iscustom="true" name="${elementName}" value="${batchingMaterial[columnName]!}" />
							<input type="hidden" name="${elementName}.${pkName!'id'}" value="${batchingMaterial[columnName]!}" />
							<@mneclient iframe=false property_type="${columnType}" mneenable=false reftitle="${getText('${viewTitle!}')}" viewType=viewType cssStyle="text-align:${c.align!}" view=(c.readonly!false) value="${batchingMaterial[displayColumnName]!}" name="${elementName}.${mainDisplayName!'name'}" id="${elementName?replace('.', '_')}_${mainDisplayName!'name'}" type="${mneType}" url="${viewUrl!}" clicked=true multiple=false isEdit=true mnewidth=260 formId="WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form" editCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}()" delCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}_delete()" />
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
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1491790056696')}" >${getText('WOM.propertydisplayName.randon1491790056696')}</label>
				</td>
				
						<#assign batchingMaterial_remark_defaultValue  = ''>
							 							<#assign batchingMaterial_remark_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input fix-ie7-textarea"><textarea property_type="TEXT" id="batchingMaterial_remark" originalvalue="<#if !newObj || (batchingMaterial.remark)?has_content>${(batchingMaterial.remark?html)!}<#else>${batchingMaterial_remark_defaultValue?html}</#if>"  name="batchingMaterial.remark" class="cui-noborder-textarea cui-textarea-auto" style=";" ><#if !newObj || (batchingMaterial.remark)?has_content>${(batchingMaterial.remark)!}<#else>${batchingMaterial_remark_defaultValue}</#if></textarea></div>
							
				</td>
		</tr>
	</table>
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
</div>				<@printJs route="0" id="WOM_7_5_0_0_batchingMaterial_batMaterialEdit" menuOperateCodes="WOM_7.5.0.0_batchingMaterial_batMaterialEdit_controlPrintSetting,WOM_7.5.0.0_batchingMaterial_batMaterialEdit_controlPrint" deploymentId="${deploymentId!}" tableInfoId="${(batchingMaterial.tableInfoId)!''}" isWorkflow=isWorkflow />
				</div>
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
								<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart", "WOM_7.5.0.0_batchingMaterial_batMaterialEditdg1491792702452", "DATAGRID", "batchingMaterialPart")>
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
			
							<script type="text/javascript">
								function BatchingMaterialPart_dg1491792702452_addRow(event)
																{  
	BatchingMaterialPart_dg1491792702452Widget.addRow();
	var row = BatchingMaterialPart_dg1491792702452Widget.getRowLength()-1;
	//产品编码
	var proCode = $("[name='batchingMaterial.productId.productCode']").val();
	//产品名称
	var proName = $("[name='batchingMaterial.productId.productName']").val();
	//产品id
	var proId = $("[name='batchingMaterial.productId.id']").val();
	//赋值
	BatchingMaterialPart_dg1491792702452Widget.setCellValue(row,"productId.productCode",proCode);
	BatchingMaterialPart_dg1491792702452Widget.setCellValue(row,"productId.productName",proName);
	BatchingMaterialPart_dg1491792702452Widget.setCellValue(row,"productId.id",proId);
	//物料批号隐藏显示
	//是否启用MES物料管理
	if(isMesProBatch==true){
		$( 'td[key="batchNum"]').hide();
		BatchingMaterialPart_dg1491792702452Widget._DT._resizeHeight = true;
		BatchingMaterialPart_dg1491792702452Widget._DT._initDomElements();
		BatchingMaterialPart_dg1491792702452Widget._DT._resizeHeight = false;
	}else if(isMesProBatch==false){
		$( 'td[key="batchNumObj.batchText"]').hide();
		BatchingMaterialPart_dg1491792702452Widget._DT._resizeHeight = true;
		BatchingMaterialPart_dg1491792702452Widget._DT._initDomElements();
		BatchingMaterialPart_dg1491792702452Widget._DT._resizeHeight = false;
	}
}
							</script>
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/WOM/batchingMaterial/batchingMaterial/data-dg1491792702452.action?batchingMaterial.id=${refId!-1}&refId=${refId!-1}&datagridCode=WOM_7.5.0.0_batchingMaterial_batMaterialEditdg1491792702452">
			<#else>
				<#assign dUrl="/WOM/batchingMaterial/batchingMaterial/data-dg1491792702452.action?batchingMaterial.id=${(batchingMaterial.id)!-1}&datagridCode=WOM_7.5.0.0_batchingMaterial_batMaterialEditdg1491792702452">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_BatchingMaterialPart_dg1491792702452_deldatagrid();}},{text:\"${getText('WOM.buttonPropertyshowName.radion1491997323641')}\",handler:function(event){BatchingMaterialPart_dg1491792702452_addRow(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_BatchingMaterialPart_dg1491792702452_deldatagrid();}},{text:\"${getText('WOM.buttonPropertyshowName.radion1491997323641')}\",handler:function(event){BatchingMaterialPart_dg1491792702452_addRow(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_BatchingMaterialPart_dg1491792702452" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1491792702452_id" value="BatchingMaterialPart_dg1491792702452" />
			
			<input type="hidden" id="dg1491792702452_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('WOM.modelname.randon1491789803097')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/WOM/batchingMaterial/batchingMaterial/data-dg1491792702452.action?operateType=export&datagridCode=WOM_7.5.0.0_batchingMaterial_batMaterialEditdg1491792702452"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="BatchingMaterialPart_dg1491792702452" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="BatchingMaterialPart_dg1491792702452" viewType="${viewType}" renderOverEvent="dg1491792702452RenderOverEvent" route="${routeFlag}" formId="WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form" noPermissionKeys="productId.productCode,productId.productName,productId.id,batchNumObj.batchText,batchNum,doneNum,wareID.wareCode,wareID.wareName,wareID.cargoStatue,wareID.id,storeID.placeSetCode,storeID.placeSetName,exeStaff.name,exeDate,printCount,state,remark,actOrder,lableCode,taskBatch,factoryId.name" modelCode="WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1491792702452" dtPage="dgPage"  hidekeyPrefix="dg1491792702452" hidekey="['id','version','productId.id','productId.productCode','productId.id','productId.productName','productId.id','productId.id','batchNumObj.id','batchNumObj.batchText','wareID.id','wareID.wareCode','wareID.id','wareID.wareName','wareID.id','wareID.cargoStatue.id','wareID.id','wareID.id','storeID.id','storeID.placeSetCode','storeID.id','storeID.placeSetName','exeStaff.id','exeStaff.name','factoryId.id','factoryId.name'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1491792702452PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName  activexButton="WOM.buttonPropertyshowName.radion1491997323641,addRow,add" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
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

									<@datacolumn key="productId.productCode"        showFormat="SELECTCOMP" defaultValue="${(productId_productCode_defaultValue!)?string}" defaultDisplay="${(productId_productCode_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=true   selectCompName="WOM.batchingMaterial.batchingMaterial.batMaterialEdit"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('WOM.propertydisplayName.radion1415772644833222')}" width=100 showFormatFunc=""  />
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

									<@datacolumn key="productId.productName"        showFormat="TEXT" defaultValue="${(productId_productName_defaultValue!)?string}" defaultDisplay="${(productId_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.batchingMaterial.batchingMaterial.batMaterialEdit"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('WOM.propertydisplayName.radion1415772740737334')}" width=80 showFormatFunc=""  />
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

									<@datacolumn key="productId.id"        showFormat="TEXT" defaultValue="${(productId_id_defaultValue!)?string}" defaultDisplay="${(productId_id_displayDefaultType!)?string}" decimal="" editable=false type="long" showType="long" notnull=false   selectCompName="WOM.batchingMaterial.batchingMaterial.batMaterialEdit"  textalign="center" hiddenCol=true viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.randon1449796384550')}" width=100 showFormatFunc=""  />
							<#assign batchNumObj_batchText_displayDefaultType=''>
								<#assign batchNumObj_batchText_defaultValue=''>
										<#assign batchNumObj_batchText_defaultValue=''>
																	<#if (batchNumObj_batchText_defaultValue!)?string=="currentUser">
								<#assign batchNumObj_batchText_defaultValue='${staffJson!}'>
							<#elseif (batchNumObj_batchText_defaultValue!)?string=="currentPost">
								<#assign batchNumObj_batchText_defaultValue='${postJson!}'>
							<#elseif (batchNumObj_batchText_defaultValue!)?string=="currentDepart">
								<#assign batchNumObj_batchText_defaultValue='${deptJson!}'>
							<#elseif (batchNumObj_batchText_defaultValue!)?string=="currentComp">
								<#assign batchNumObj_batchText_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="batchNumObj.batchText"        showFormat="SELECTCOMP" defaultValue="${(batchNumObj_batchText_defaultValue!)?string}" defaultDisplay="${(batchNumObj_batchText_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false  callbackname="batchObjCallback(obj)" selectCompName="WOM.batchingMaterial.batchingMaterial.batMaterialEdit"  textalign="center"  viewUrl="/WOM/standingcropRef/standingcropRef/batchNumOneBatRef.action" viewCode="WOM_7.5.0.0_standingcropRef_batchNumOneBatRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1502607384728')}"  label="${getText('WOM.propertydisplayName.randon1491790594009')}" width=100 showFormatFunc="" cssstyle="color: rgb(179, 3, 3);" />
							<#assign batchNum_displayDefaultType=''>
								<#assign batchNum_defaultValue=''>
										<#assign batchNum_defaultValue=''>
										  
									<@datacolumn key="batchNum"        showFormat="TEXT" defaultValue="${(batchNum_defaultValue!)?string}" defaultDisplay="${(batchNum_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=true     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1491790594009')}" width=100 showFormatFunc=""  />
							<#assign doneNum_displayDefaultType=''>
								<#assign doneNum_defaultValue=''>
										<#assign doneNum_defaultValue=''>
										 
										
										
										
										
										
 
									<@datacolumn key="doneNum"        showFormat="TEXT" defaultValue="${(doneNum_defaultValue!)?string}" defaultDisplay="${(doneNum_displayDefaultType!)?string}" onchange="BatchingMaterialPart_dg1491792702452Widget.evalCustomFunction(nRow,sFieldName,'doneNumChang()')" decimal="2" editable=true type="DECIMAL" showType="decimal" notnull=true     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1491790683313')}" width=80 showFormatFunc=""  />
							<#assign wareID_wareCode_displayDefaultType=''>
								<#assign wareID_wareCode_defaultValue=''>
										<#assign wareID_wareCode_defaultValue=''>
																	<#if (wareID_wareCode_defaultValue!)?string=="currentUser">
								<#assign wareID_wareCode_defaultValue='${staffJson!}'>
							<#elseif (wareID_wareCode_defaultValue!)?string=="currentPost">
								<#assign wareID_wareCode_defaultValue='${postJson!}'>
							<#elseif (wareID_wareCode_defaultValue!)?string=="currentDepart">
								<#assign wareID_wareCode_defaultValue='${deptJson!}'>
							<#elseif (wareID_wareCode_defaultValue!)?string=="currentComp">
								<#assign wareID_wareCode_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="wareID.wareCode"        showFormat="SELECTCOMP" defaultValue="${(wareID_wareCode_defaultValue!)?string}" defaultDisplay="${(wareID_wareCode_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=true   selectCompName="WOM.batchingMaterial.batchingMaterial.batMaterialEdit"  textalign="left"  viewUrl="/MESBasic/wareMan/ware/wareRef.action" viewCode="MESBasic_1_wareMan_wareRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  label="${getText('WOM.propertydisplayName.randon1484031239867')}" width=100 showFormatFunc=""  />
							<#assign wareID_wareName_displayDefaultType=''>
								<#assign wareID_wareName_defaultValue=''>
										<#assign wareID_wareName_defaultValue=''>
																	<#if (wareID_wareName_defaultValue!)?string=="currentUser">
								<#assign wareID_wareName_defaultValue='${staffJson!}'>
							<#elseif (wareID_wareName_defaultValue!)?string=="currentPost">
								<#assign wareID_wareName_defaultValue='${postJson!}'>
							<#elseif (wareID_wareName_defaultValue!)?string=="currentDepart">
								<#assign wareID_wareName_defaultValue='${deptJson!}'>
							<#elseif (wareID_wareName_defaultValue!)?string=="currentComp">
								<#assign wareID_wareName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="wareID.wareName"        showFormat="TEXT" defaultValue="${(wareID_wareName_defaultValue!)?string}" defaultDisplay="${(wareID_wareName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.batchingMaterial.batchingMaterial.batMaterialEdit"  textalign="left"  viewUrl="/MESBasic/wareMan/ware/wareRef.action" viewCode="MESBasic_1_wareMan_wareRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  label="${getText('WOM.propertydisplayName.randon1484031316283')}" width=100 showFormatFunc=""  />
							<#assign wareID_cargoStatue_displayDefaultType=''>
								<#assign wareID_cargoStatue_defaultValue=''>
										<#assign wareID_cargoStatue_defaultValue=''>
																	<#if (wareID_cargoStatue_defaultValue!)?string=="currentUser">
								<#assign wareID_cargoStatue_defaultValue='${staffJson!}'>
							<#elseif (wareID_cargoStatue_defaultValue!)?string=="currentPost">
								<#assign wareID_cargoStatue_defaultValue='${postJson!}'>
							<#elseif (wareID_cargoStatue_defaultValue!)?string=="currentDepart">
								<#assign wareID_cargoStatue_defaultValue='${deptJson!}'>
							<#elseif (wareID_cargoStatue_defaultValue!)?string=="currentComp">
								<#assign wareID_cargoStatue_defaultValue='${compJson!}'>
							</#if>
									<@systemCodeColumn code="storageState" textalign="center" defaultValue="${(wareID_cargoStatue_defaultValue!)?string}" key="wareID.cargoStatue.id" editable=false type="selectcomp" notnull=false     label="${getText('MESBasic.propertydisplayName.randon1484031944240')}" width=60   />
							<#assign wareID_id_displayDefaultType=''>
								<#assign wareID_id_defaultValue=''>
										<#assign wareID_id_defaultValue=''>
																	<#if (wareID_id_defaultValue!)?string=="currentUser">
								<#assign wareID_id_defaultValue='${staffJson!}'>
							<#elseif (wareID_id_defaultValue!)?string=="currentPost">
								<#assign wareID_id_defaultValue='${postJson!}'>
							<#elseif (wareID_id_defaultValue!)?string=="currentDepart">
								<#assign wareID_id_defaultValue='${deptJson!}'>
							<#elseif (wareID_id_defaultValue!)?string=="currentComp">
								<#assign wareID_id_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="wareID.id"        showFormat="TEXT" defaultValue="${(wareID_id_defaultValue!)?string}" defaultDisplay="${(wareID_id_displayDefaultType!)?string}" decimal="" editable=false type="long" showType="long" notnull=false   selectCompName="WOM.batchingMaterial.batchingMaterial.batMaterialEdit"  textalign="center" hiddenCol=true viewUrl="/MESBasic/wareMan/ware/wareRef.action" viewCode="MESBasic_1_wareMan_wareRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  label="${getText('ec.common.ID')}" width=100 showFormatFunc=""  />
							<#assign storeID_placeSetCode_displayDefaultType=''>
								<#assign storeID_placeSetCode_defaultValue=''>
										<#assign storeID_placeSetCode_defaultValue=''>
																	<#if (storeID_placeSetCode_defaultValue!)?string=="currentUser">
								<#assign storeID_placeSetCode_defaultValue='${staffJson!}'>
							<#elseif (storeID_placeSetCode_defaultValue!)?string=="currentPost">
								<#assign storeID_placeSetCode_defaultValue='${postJson!}'>
							<#elseif (storeID_placeSetCode_defaultValue!)?string=="currentDepart">
								<#assign storeID_placeSetCode_defaultValue='${deptJson!}'>
							<#elseif (storeID_placeSetCode_defaultValue!)?string=="currentComp">
								<#assign storeID_placeSetCode_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="storeID.placeSetCode"        showFormat="SELECTCOMP" defaultValue="${(storeID_placeSetCode_defaultValue!)?string}" defaultDisplay="${(storeID_placeSetCode_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.batchingMaterial.batchingMaterial.batMaterialEdit"  textalign="left"  viewUrl="/MESBasic/storeSet/storeSet/storeRef.action" viewCode="MESBasic_1_storeSet_storeRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1489735291062')}"  label="${getText('WOM.propertydisplayName.randon1489731651448')}" width=100 showFormatFunc=""  />
							<#assign storeID_placeSetName_displayDefaultType=''>
								<#assign storeID_placeSetName_defaultValue=''>
										<#assign storeID_placeSetName_defaultValue=''>
																	<#if (storeID_placeSetName_defaultValue!)?string=="currentUser">
								<#assign storeID_placeSetName_defaultValue='${staffJson!}'>
							<#elseif (storeID_placeSetName_defaultValue!)?string=="currentPost">
								<#assign storeID_placeSetName_defaultValue='${postJson!}'>
							<#elseif (storeID_placeSetName_defaultValue!)?string=="currentDepart">
								<#assign storeID_placeSetName_defaultValue='${deptJson!}'>
							<#elseif (storeID_placeSetName_defaultValue!)?string=="currentComp">
								<#assign storeID_placeSetName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="storeID.placeSetName"        showFormat="TEXT" defaultValue="${(storeID_placeSetName_defaultValue!)?string}" defaultDisplay="${(storeID_placeSetName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.batchingMaterial.batchingMaterial.batMaterialEdit"  textalign="left"  viewUrl="/MESBasic/storeSet/storeSet/storeRef.action" viewCode="MESBasic_1_storeSet_storeRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1489735291062')}"  label="${getText('WOM.propertydisplayName.randon1489731677164')}" width=100 showFormatFunc=""  />
							<#assign exeStaff_name_displayDefaultType=''>
								<#assign exeStaff_name_defaultValue='currentUser'>
																	<#if (exeStaff_name_defaultValue!)?string=="currentUser">
								<#assign exeStaff_name_defaultValue='${staffJson!}'>
							<#elseif (exeStaff_name_defaultValue!)?string=="currentPost">
								<#assign exeStaff_name_defaultValue='${postJson!}'>
							<#elseif (exeStaff_name_defaultValue!)?string=="currentDepart">
								<#assign exeStaff_name_defaultValue='${deptJson!}'>
							<#elseif (exeStaff_name_defaultValue!)?string=="currentComp">
								<#assign exeStaff_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="exeStaff.name"        showFormat="SELECTCOMP" defaultValue="${(exeStaff_name_defaultValue!)?string}" defaultDisplay="${(exeStaff_name_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.batchingMaterial.batchingMaterial.batMaterialEdit"  textalign="left"  viewUrl="/foundation/staff/common/staffListFrameset.action" viewCode="sysbase_1.0_staff_ref" mneenable=false crossCompany=false viewTitle="${getText('foundation.ec.entity.view.reference')}"  label="${getText('WOM.propertydisplayName.randon1491790473893')}" width=80 showFormatFunc=""  />
							<#assign exeDate_displayDefaultType=''>
								<#assign exeDate_defaultValue='currentTime'>
										 								<#if (exeDate_defaultValue)?? &&(exeDate_defaultValue)?has_content>
									<#assign exeDate_defaultValue  = getDefaultDateTime(exeDate_defaultValue!)?datetime>
								</#if>
 
									<@datacolumn key="exeDate"        showFormat="YMD_HMS" defaultValue="${(exeDate_defaultValue!)?string}" defaultDisplay="${(exeDate_displayDefaultType!)?string}" decimal="" editable=false type="datetime" showType="datetime" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1491790496670')}" width=150 showFormatFunc=""  />
							<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart", "WOM_7.5.0.0_batchingMaterial_batMaterialEditdg1491792702452", "DATAGRID", "batchingMaterialPart")>
							<#-- 排布自定义字段 -->
							<#list customPropViewMappings as cpvm>
								<#assign cpvmColumnType = cpvm.property.type>
								<#assign cpvmKey = cpvm.propertyLayRec>
								<#assign cpvmType = cpvmColumnType?lower_case>
								
								<#assign cpEditable = true>
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
											<#assign selectCompName = 'WOM.batchingMaterial.batchingMaterial.batMaterialEdit'>
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
							<#assign printCount_displayDefaultType=''>
								<#assign printCount_defaultValue='0'>
										  
									<@datacolumn key="printCount"        showFormat="TEXT" defaultValue="${(printCount_defaultValue!)?string}" defaultDisplay="${(printCount_displayDefaultType!)?string}" decimal="" editable=false type="INTEGER" showType="integer" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1505884945744')}" width=100 showFormatFunc=""  />
							<#assign state_displayDefaultType=''>
								<#assign state_defaultValue='womBatPartState/01'>
										 									<@systemCodeColumn code="womBatPartState" textalign="center" defaultValue="${(state_defaultValue!)?string}" key="state.id" editable=false type="selectcomp" notnull=false     label="${getText('WOM.propertydisplayName.randon1491790699395')}" width=60   />
							<#assign remark_displayDefaultType=''>
								<#assign remark_defaultValue=''>
										<#assign remark_defaultValue=''>
										  
									<@datacolumn key="remark"  popView=true      showFormat="TEXT" defaultValue="${(remark_defaultValue!)?string}" defaultDisplay="${(remark_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1491790724898')}" width=150 showFormatFunc=""  />
							<#assign actOrder_displayDefaultType=''>
								<#assign actOrder_defaultValue=''>
										<#assign actOrder_defaultValue=''>
										  
									<@datacolumn key="actOrder"        showFormat="TEXT" defaultValue="${(actOrder_defaultValue!)?string}" defaultDisplay="${(actOrder_displayDefaultType!)?string}" decimal="" editable=true type="INTEGER" showType="integer" notnull=false     textalign="right" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1496991574267')}" width=100 showFormatFunc=""  />
							<#assign lableCode_displayDefaultType=''>
								<#assign lableCode_defaultValue=''>
										<#assign lableCode_defaultValue=''>
										  
									<@datacolumn key="lableCode"        showFormat="TEXT" defaultValue="${(lableCode_defaultValue!)?string}" defaultDisplay="${(lableCode_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="center" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1496886333189')}" width=100 showFormatFunc=""  />
							<#assign taskBatch_displayDefaultType=''>
								<#assign taskBatch_defaultValue=''>
										<#assign taskBatch_defaultValue=''>
										  
									<@datacolumn key="taskBatch"        showFormat="TEXT" defaultValue="${(taskBatch_defaultValue!)?string}" defaultDisplay="${(taskBatch_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="center" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1497426812197')}" width=100 showFormatFunc=""  />
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

									<@datacolumn key="factoryId.name"        showFormat="SELECTCOMP" defaultValue="${(factoryId_name_defaultValue!)?string}" defaultDisplay="${(factoryId_name_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.batchingMaterial.batchingMaterial.batMaterialEdit"  textalign="center" hiddenCol=true viewUrl="/MESBasic/factoryModel/factoryModel/factoryProductRef.action" viewCode="MESBasic_1_factoryModel_factoryProductRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1490322427886')}"  label="${getText('MESBasic.propertydisplayName.radion1419232393782')}" width=100 showFormatFunc=""  />
			
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
					;
					//datagrid自定义参数方法
				</script>
			
			<script type="text/javascript">
				function BatchingMaterialPart_dg1491792702452_check_datagridvalid(){
					//
					var errorObj =BatchingMaterialPart_dg1491792702452Widget._DT.testData();
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
				
				function savedg1491792702452DataGrid(){
					<#if  refId?? && (refId gt 0)>
					BatchingMaterialPart_dg1491792702452Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('BatchingMaterialPart_dg1491792702452Widget') > -1) {
						BatchingMaterialPart_dg1491792702452Widget.setAllRowEdited();
					}
					var json = BatchingMaterialPart_dg1491792702452Widget.parseEditedData();
					$('input[name="dg1491792702452ListJson"]').remove();
					$('input[name="dgLists[\'dg1491792702452\']"]').remove();
					$('input[name="dg1491792702452ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1491792702452\']">').val(json).appendTo($('#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form'));
					$('<input type="hidden" name="dg1491792702452ModelCode">').val('WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart').appendTo($('#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1491792702452ListJson">').val(json).appendTo($('#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form'));
				}
				function DT_BatchingMaterialPart_dg1491792702452_deldatagrid(){
					var deleteRows = BatchingMaterialPart_dg1491792702452Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','exeStaff.id','receiveStaff.id','productId.id','storeID.id','headId.id','wareID.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1491792702452DeletedIds").length>0){
							$("#dg1491792702452DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1491792702452DeletedIds" name="dgDeletedIds[\'dg1491792702452\']" value="'+tepID+'">').appendTo(CUI('#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1491792702452DeletedIds['+CUI('input[name^="dg1491792702452DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form'));
					});
					return deleteRows;
				}
				function DT_BatchingMaterialPart_dg1491792702452_delTreeNodes(){
					var deleteRows = BatchingMaterialPart_dg1491792702452Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','exeStaff.id','receiveStaff.id','productId.id','storeID.id','headId.id','wareID.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1491792702452DeletedIds").length>0){
							$("#dg1491792702452DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1491792702452DeletedIds" name="dgDeletedIds[\'dg1491792702452\']" value="'+tepID+'">').appendTo(CUI('#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1491792702452DeletedIds['+CUI('input[name^="dg1491792702452DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('WOM_batchingMaterial_batchingMaterial_batMaterialEdit_datagrids');
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
							if(datagrids[0][i] == 'BatchingMaterialPart_dg1491792702452') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'BatchingMaterialPart_dg1491792702452';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'BatchingMaterialPart_dg1491792702452';
					}
					$('body').data('WOM_batchingMaterial_batchingMaterial_batMaterialEdit_datagrids', datagrids);
				});
				
				var BatchingMaterialPart_dg1491792702452_importDialog = null;
				function BatchingMaterialPart_dg1491792702452_showImportDialog(){
					try{
						if(BatchingMaterialPart_dg1491792702452_importDialog!=null&&BatchingMaterialPart_dg1491792702452_importDialog.isShow==1){
							return false;
						}
						var url = "/WOM/batchingMaterial/batchingMaterial/initImport.action?datagridCode=WOM_7.5.0.0_batchingMaterial_batMaterialEditdg1491792702452&tid=${id!}&datagridName=dg1491792702452";
							<#if canImportExcel>
								var buttonCode="WOM_7.5.0.0_batchingMaterial_batMaterialEditdg1491792702452_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						BatchingMaterialPart_dg1491792702452_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("BatchingMaterialPart_dg1491792702452"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();BatchingMaterialPart_dg1491792702452_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();BatchingMaterialPart_dg1491792702452_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						BatchingMaterialPart_dg1491792702452_importDialog.show();
					}catch(e){}
				}	
				
				function BatchingMaterialPart_dg1491792702452_downLoadFile(){
					var url = "/WOM/batchingMaterial/batchingMaterial/downLoad.action?datagridCode=WOM_7.5.0.0_batchingMaterial_batMaterialEditdg1491792702452&templateRelatedModelCode=WOM_7.5.0.0_batchingMaterial_batMaterialEditdg1491792702452&downloadType=template&fileName=dg1491792702452";
					window.open(url,"","");
				}
				function dg1491792702452RenderOverEvent(){
					//重设pt高度
var ptNewHeight = $(window).height() - $(".edit-head").height() - $(".cui-elements").height() -80;

BatchingMaterialPart_dg1491792702452Widget.setHeight(ptNewHeight);
//是否启用MES物料管理
if(isMesProBatch==true){
	$('#BatchingMaterialPart_dg1491792702452_hdbox thead tr td[key="wareID.wareCode"] div div:eq(0)').css("color","rgb(179, 3, 3)");
	$('#BatchingMaterialPart_dg1491792702452_hdbox thead tr td[key="batchNumObj.batchText"] div div:eq(0)').css("color","rgb(179, 3, 3)");//字段变红
	//隐藏批号文本
	$( 'td[key="batchNum"]').hide();
	BatchingMaterialPart_dg1491792702452Widget._DT._resizeHeight = true;
	BatchingMaterialPart_dg1491792702452Widget._DT._initDomElements();
	BatchingMaterialPart_dg1491792702452Widget._DT._resizeHeight = false;
	//仓库货位编码状态只读   
	BatchingMaterialPart_dg1491792702452Widget._DT.configs.checkEditCondition = function( key, nRow){
		//仓库编码
		if(key=="wareID.wareCode"){
			return false;//返回false不可编辑，返回true可编辑
		}
		//货位编码
		if(key=="storeID.placeSetCode"){
			return false;//返回false不可编辑，返回true可编辑
		}
		return true;
	}
}else if(isMesProBatch==false){
	//隐藏批号对象
	$( 'td[key="batchNumObj.batchText"]').hide();
	BatchingMaterialPart_dg1491792702452Widget._DT._resizeHeight = true;
	BatchingMaterialPart_dg1491792702452Widget._DT._initDomElements();
	BatchingMaterialPart_dg1491792702452Widget._DT._resizeHeight = false;
}
//已配送数据不允许修改
var length = BatchingMaterialPart_dg1491792702452Widget.getRowLength();
for(var i = 0 ; i < length ; i++){
	if(BatchingMaterialPart_dg1491792702452Widget.getCellValue(i,"state.id")=="womBatPartState/02"){
		BatchingMaterialPart_dg1491792702452Widget.setCellProperty( i, "batchNumObj.batchText", 'readonly', 'true');
		BatchingMaterialPart_dg1491792702452Widget.setCellProperty( i, "batchNum", 'readonly', 'true');
		BatchingMaterialPart_dg1491792702452Widget.setCellProperty( i, "doneNum", 'readonly', 'true');
		BatchingMaterialPart_dg1491792702452Widget.setCellProperty( i, "wareID.wareCode", 'readonly', 'true');
		BatchingMaterialPart_dg1491792702452Widget.setCellProperty( i, "storeID.placeSetCode", 'readonly', 'true');
	}
}
				}
				function dg1491792702452PageInitMethod(nTabIndex){
					WOM.batchingMaterial.batchingMaterial.batMaterialEdit.initSize(nTabIndex);
					$('div .paginatorbar-operatebar:eq(0) a:eq(1)').insertBefore( $('div .paginatorbar-operatebar:eq(0) a:eq(0)') );
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
     	
		<div id="WOM_batchingMaterial_batchingMaterial_batMaterialEdit_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<#if !(superEdit!false)>
				<li id="flowHead" onclick="WOM.batchingMaterial.batchingMaterial.batMaterialEdit.showFlowInfo('flow')"><span class="icon_prograss"></span>${getText("ec.flow.flowImage")}</li>
				</#if>
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="WOM.batchingMaterial.batchingMaterial.batMaterialEdit.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
				<li id="dealInfoHead" class="bar" onclick="WOM.batchingMaterial.batchingMaterial.batMaterialEdit.showDealInfo('dealInfo')"><span class="icon_handle"></span>${getText("ec.view.dealadvice")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<#if !(superEdit!false)>
				<div class="flow-height wid" id="flowDiv"></div>
				</#if>
				<div id="fileUploadDiv" class="wid-hei"></div>
				<div style="padding:1px 0px 0px 0px;" id="dealInfoDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_batchingMaterial_batMaterialEdit,html,WOM_7.5.0.0_batchingMaterial_BatchingMaterial,WOM_7.5.0.0) -->
<!-- 自定义代码 -->
<style type="text/css">
	#WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_main_div .edit-workflow {display:none;}
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
						$("#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			WOM.batchingMaterial.batchingMaterial.batMaterialEdit.initCount = 0;
			WOM.batchingMaterial.batchingMaterial.batMaterialEdit.initSize = function(nTabIndex){
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
				var conHeight = h-$("#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div .edit-head").height()-$("#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div .edit-workflow").height()</#if>;
				$("#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('WOM_batchingMaterial_batchingMaterial_batMaterialEdit_datagrids');
				var padding_bottom=16;
				$("#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div .pd_bottom,#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div .edit-panes-s").each(function(index){
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
									if(WOM.batchingMaterial.batchingMaterial.batMaterialEdit.initCount <= 2) {
										setTimeout(function(){WOM.batchingMaterial.batchingMaterial.batMaterialEdit.initSize();}, 200);
										WOM.batchingMaterial.batchingMaterial.batMaterialEdit.initCount++;
									}/* else {
										WOM.batchingMaterial.batchingMaterial.batMaterialEdit.initCount = 0;
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
							if(($("#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div .edit-workflow").length > 0) && ($("#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				$('#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				WOM.batchingMaterial.batchingMaterial.batMaterialEdit.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				WOM.batchingMaterial.batchingMaterial.batMaterialEdit.initSize();
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
						if(parseInt($("#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div").css("width"),10)==650){
							$("#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//WOM.batchingMaterial.batchingMaterial.batMaterialEdit.resizeLayout();
						//WOM.batchingMaterial.batchingMaterial.batMaterialEdit.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div").css("width"),10)==800){
							$("#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//WOM.batchingMaterial.batchingMaterial.batMaterialEdit.resizeLayout();
						//WOM.batchingMaterial.batchingMaterial.batMaterialEdit.initSize();
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
					WOM.batchingMaterial.batchingMaterial.batMaterialEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					WOM.batchingMaterial.batchingMaterial.batMaterialEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){WOM.batchingMaterial.batchingMaterial.batMaterialEdit.initSize();});
				/*
				WOM.batchingMaterial.batchingMaterial.batMaterialEdit.resizeLayout=function(){
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
			WOM.batchingMaterial.batchingMaterial.batMaterialEdit.setDepartment();
			<#else>
			CUI("#dealInfoContain").load("/ec/workflow/dealInfo.action?dlTableInfoId=${batchingMaterial.tableInfoId!}&dealInfoGroup=byTime&preName=mainFrame&dealDataUrl=/WOM/batchingMaterial/batchingMaterial/dealInfo-list.action&enableSimpleDealInfo=false");
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

		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.validate = function(){
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
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.beforeSaveProcess = function(){
			try{eval("savedg1491792702452DataGrid()");}catch(e){}

			var extraCol = '<extra-data>';
			$('#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form').trigger('beforeSubmit');
			//batchingMaterial.extraCol
			$('*[name^="_complex_"]').each(function(index, item){
				if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
					if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
					var itemValue = CUI(item).val();
					extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
				}
			});
			extraCol += '</extra-data>';
			$('input[name="batchingMaterial.extraCol"]').val(extraCol);
		}
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.processDataGrid = function(){
										<#if false && isIE>
										$('#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form').append(BatchingMaterialPart_dg1491792702452Widget._DT.createInputs('dg1491792702452List'));
										</#if>
		};
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.save = function(){
			<#if !(superEdit!false)>
			$('#operateType').val("save");
			<#else>
			$('#operateType').val("submit");
			</#if>
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!WOM.batchingMaterial.batchingMaterial.batMaterialEdit.validate()){return;}
			//延迟到延迟提交中处理,解决onchange事件无法触发问题
			//WOM.batchingMaterial.batchingMaterial.batMaterialEdit.beforeSaveProcess();

			//WOM.batchingMaterial.batchingMaterial.batMaterialEdit.processDataGrid();
			$('#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form','WOM_batchingMaterial_batchingMaterial_batMaterialEdit_datagrids')) {      
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
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.print = function(){
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
		
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.saveSetting = function(){
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
		
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.printSetting = function(){
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
				WOM.batchingMaterial.batchingMaterial.batMaterialEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(WOM.batchingMaterial.batchingMaterial.batMaterialEdit.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				WOM.batchingMaterial.batchingMaterial.batMaterialEdit.settingDialog.show();
			}
		}
		
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.toTakeShowPrint = function(selViewCode, selCode,params){
			var ieEnable = (!!window.ActiveXObject || "ActiveXObject" in window);
	        if(ieEnable) {
				var postData = {
					'id' : '${(batchingMaterial.id)!''}',
					'code': selCode,
					'viewCode': 'WOM_7.5.0.0_batchingMaterial_batMaterialEdit',
					'deploymentId' : selViewCode,
					'tableInfoId' : '${(batchingMaterial.tableInfoId)!''}',
					'templateCode':selCode
				}
				if(params != undefined) {
					$.extend(postData,params);	
				}
				WOM_7_5_0_0_batchingMaterial_batMaterialEdit_PrintControl.takeShowPrint(
				$('#sqlKeyWordCheck').val()?$('#sqlKeyWordCheck').val():"update",
				selCode, 
				"/WOM/batchingMaterial/batchingMaterial/loadXMLRefOrData.action?${getPowerCode('WOM_7.5.0.0_batchingMaterial_batMaterialEdit_controlPrint')}", 
				postData, 1, <#if isWorkflow>true<#else>false</#if>);
			}else{
				var postData = {
					'id' : '${(batchingMaterial.id)!''}',
					'viewCode': 'WOM_7.5.0.0_batchingMaterial_batMaterialEdit',
					'tableInfoId' : '${(batchingMaterial.tableInfoId)!''}',
					'templateCode':selCode
				}
				if(params != undefined) {
					$.extend(postData,params);	
				}
				$.ajax({
					async   : false,
					type    : 'POST',
					url     : '/WOM/batchingMaterial/batchingMaterial/printOnServer.action',
					data    : postData,
					success : function(msg){
						if (msg) {
							window.open("/bap/public/print/"+msg.pdfFileName+".pdf").print();
						}
					}
				});
				return;
			}
		}
		
		//控件打印
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.controlPrint = function(){
			if(WOM_7_5_0_0_batchingMaterial_batMaterialEdit_PrintControl) {
				var viewCode = $("input[name='viewCode']").val();
				WOM.batchingMaterial.batchingMaterial.batMaterialEdit.printTemplateSel = new CUI.Dialog({
					title:"${getText('ec.printTemplate.customeListSelect')}",
					height:300,
					width: 550,
					url : '/ec/printManage/customViewSelectForward.action?viewCode='+viewCode+'&id='+document.getElementById("id").value,
					buttons:[
						{
							name: "${getText('ec.common.confirm')}",
							handler:function(){
								if(print_template_select_dgViewRecordWidget.selectedRows == null
									|| print_template_select_dgViewRecordWidget.selectedRows == undefined
									|| print_template_select_dgViewRecordWidget.selectedRows[0] == null
									|| print_template_select_dgViewRecordWidget.selectedRows[0] == undefined){
									// CUI.Dialog.alert("${getText('ec.business.SelectRow')}");
									printTemplateSelectWidget.show("${getText('ec.business.SelectRow')}");
								} else {
									var selViewCode = print_template_select_dgViewRecordWidget.selectedRows[0].viewCode;
									var selCode = print_template_select_dgViewRecordWidget.selectedRows[0].code;
									var signatureInfo=signatureUtil.getSignatureInfo(false,viewCode+"_print_print");
									if(signatureInfo[0] != '') {
										print_callback=function(params){
											WOM.batchingMaterial.batchingMaterial.batMaterialEdit.toTakeShowPrint(selViewCode, selCode,params);
										}
										signatureUtil.showSignatureDialog(signatureInfo[1],signatureInfo[0],viewCode+"_print_print",'','print',false,'');
									}
									else {
										WOM.batchingMaterial.batchingMaterial.batMaterialEdit.toTakeShowPrint(selViewCode, selCode);
									}
									this.close();
								}
							}
						},
						{	
							name:"${getText("ec.flow.cancal")}",
							handler:function(){this.close();}
						}
					]
				});
				$.ajax({
					async   : false,
					type    : 'POST',
					url     : '/ec/printManage/customViewSelect.action',
					data    : 'viewCode=' + viewCode+'&id='+document.getElementById("id").value,
					success : function(msg){
						if (msg) {
							var totalCount = msg.totalCount;
							if (totalCount == 0) {
								CUI.Dialog.alert("${getText('ec.print.template.notemplate')}");
							} else if (totalCount == 1) {
								var signatureInfo=signatureUtil.getSignatureInfo(false,viewCode+"_print_print");
								if(signatureInfo[0] != '') {
									print_callback=function(params){
										WOM.batchingMaterial.batchingMaterial.batMaterialEdit.toTakeShowPrint(viewCode, msg.result[0].code, params);
									}
									signatureUtil.showSignatureDialog(signatureInfo[1],signatureInfo[0],viewCode+"_print_print",'','print',false,'');
								}
								else {
									WOM.batchingMaterial.batchingMaterial.batMaterialEdit.toTakeShowPrint(viewCode, msg.result[0].code);
								}
							} else {
								WOM.batchingMaterial.batchingMaterial.batMaterialEdit.printTemplateSel.show();
							}
						}
					}
				});
			}
		}
		
		
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.reject = function(){
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
			WOM.batchingMaterial.batchingMaterial.batMaterialEdit.submit();
		}
		
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.submit = function(uncheck){
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
			if(!WOM.batchingMaterial.batchingMaterial.batMaterialEdit.validate()){return;}
			
			//$('#__workflow_outcomeDes').val($('input[name="workFlowVar.outcome"]:checked').attr('des'));
			
			WOM.batchingMaterial.batchingMaterial.batMaterialEdit.beforeSaveProcess();
			
			//WOM.batchingMaterial.batchingMaterial.batMaterialEdit.processDataGrid();
			
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
			$('#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form').submit();
			//$(".wfcancel").remove();
			
		}
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.recall = function(){
			CUI.Dialog.confirm("${getText('ec.recall.checkrecall')}", function(){
					$.ajax({
					url : "/WOM/batchingMaterial/batchingMaterial/common/recall.action",
					type : 'post',
					async : false,
					data:{"tableInfoId": "${(batchingMaterial.tableInfoId)?default('')}"},
					success : function(msg) {
						if(msg && msg.success){
							workbenchErrorBarWidget.showMessage("${getText('ec.recall.success')}", 's');
		 					var url = "/foundation/user/open-pending.action?pendingId=" + msg.data.id + "&tableInfoId=${(batchingMaterial.tableInfoId)?default('')}&id=${(batchingMaterial.id)?default('')}&entityCode=WOM_7.5.0.0_batchingMaterial";

			 				try{
								window.opener.refreshPortal('workflow');
								window.opener.timeData();
							}catch(e){
								try{
			 						window.opener.WOM.batchingMaterial.batchingMaterial.editCallBackInfo(res); 						
								}catch(e2){
									try{
										<#if calltype??&&calltype=='ref'>
										window.opener.WOM.batchingMaterial.batchingMaterial.callBackInfo(res);
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
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit._callBackInfo = function(res){
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
 						window.opener.WOM.batchingMaterial.batchingMaterial.editCallBackInfo(res); 						
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
 					var url = "/foundation/user/open-pending.action?pendingId=" + res.pendingId + "&tableInfoId=" + res.tableInfoId + "&id=" + res.id + "&entityCode=WOM_7.5.0.0_batchingMaterial";
 					setTimeout(function(){
						document.location.href=url;
 					}, 1000);
					return;
 				}
 				</#if>

 				setTimeout(function(){
					window.close();
				},1000);
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.WOM.batchingMaterial.batchingMaterial.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
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
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.setDepartment = function(){
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
				WOM.batchingMaterial.batchingMaterial.batMaterialEdit._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				WOM.batchingMaterial.batchingMaterial.batMaterialEdit._isObjCustomProp_IE = isObjCustomProp;
			} else {
				WOM.batchingMaterial.batchingMaterial.batMaterialEdit._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				WOM.batchingMaterial.batchingMaterial.batMaterialEdit._objCustomPropNames_IE = objCustomPropNames;
			} else {
				WOM.batchingMaterial.batchingMaterial.batMaterialEdit._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				WOM.batchingMaterial.batchingMaterial.batMaterialEdit._refViewCode_IE = viewCode;
			} else {
				WOM.batchingMaterial.batchingMaterial.batMaterialEdit._refViewCode_IE = '';
			}
			WOM.batchingMaterial.batchingMaterial.batMaterialEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			WOM.batchingMaterial.batchingMaterial.batMaterialEdit._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			WOM.batchingMaterial.batchingMaterial.batMaterialEdit._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			WOM.batchingMaterial.batchingMaterial.batMaterialEdit.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			WOM.batchingMaterial.batchingMaterial.batMaterialEdit._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				WOM.batchingMaterial.batchingMaterial.batMaterialEdit._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(WOM.batchingMaterial.batchingMaterial.batMaterialEdit._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(WOM.batchingMaterial.batchingMaterial.batMaterialEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				WOM.batchingMaterial.batchingMaterial.batMaterialEdit.gridEventObj = gridEventObj;
				callbackName = "WOM.batchingMaterial.batchingMaterial.batMaterialEdit.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "WOM.batchingMaterial.batchingMaterial.batMaterialEdit.getMultiselectCallBackInfo_DG" : "WOM.batchingMaterial.batchingMaterial.batMaterialEdit.getcallBackInfo_DG";
				WOM.batchingMaterial.batchingMaterial.batMaterialEdit._currRow = $(obj).closest('tr')[0];
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="WOM.batchingMaterial.batchingMaterial.batMaterialEdit.getcallBackInfo";
			}

			if(_prefix!=''){
				WOM.batchingMaterial.batchingMaterial.batMaterialEdit._prefix = _prefix.substring(1);
			}
			
			WOM.batchingMaterial.batchingMaterial.batMaterialEdit._oGrid = oGrid;
			WOM.batchingMaterial.batchingMaterial.batMaterialEdit._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					WOM.batchingMaterial.batchingMaterial.batMaterialEdit._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					WOM.batchingMaterial.batchingMaterial.batMaterialEdit._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					WOM.batchingMaterial.batchingMaterial.batMaterialEdit._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					WOM.batchingMaterial.batchingMaterial.batMaterialEdit._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					WOM.batchingMaterial.batchingMaterial.batMaterialEdit._refViewCode = oColumn.viewCode;
				} else {
					WOM.batchingMaterial.batchingMaterial.batMaterialEdit._refViewCode = '';
				}
			} else {
				WOM.batchingMaterial.batchingMaterial.batMaterialEdit._isObjCustomProp = false;
				WOM.batchingMaterial.batchingMaterial.batMaterialEdit._objCustomPropNames = '';
				WOM.batchingMaterial.batchingMaterial.batMaterialEdit._refViewCode = '';
			}
			if (WOM.batchingMaterial.batchingMaterial.batMaterialEdit._isObjCustomProp == true && WOM.batchingMaterial.batchingMaterial.batMaterialEdit._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				WOM.batchingMaterial.batchingMaterial.batMaterialEdit._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				WOM.batchingMaterial.batchingMaterial.batMaterialEdit._customCallBack = customCallBack;
			}
			if(WOM.batchingMaterial.batchingMaterial.batMaterialEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.batchingMaterial.batchingMaterial.batMaterialEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof WOM.batchingMaterial.batchingMaterial.batMaterialEdit._querycustomFuncN == "function") {
				refparam += WOM.batchingMaterial.batchingMaterial.batMaterialEdit._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			WOM.batchingMaterial.batchingMaterial.batMaterialEdit._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(WOM.batchingMaterial.batchingMaterial.batMaterialEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.batchingMaterial.batchingMaterial.batMaterialEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			WOM.batchingMaterial.batchingMaterial.batMaterialEdit._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'WOM.batchingMaterial.batchingMaterial.batMaterialEdit.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit._querycustomFunc = function(obj) {
			var str = eval("typeof(WOM.batchingMaterial.batchingMaterial.batMaterialEdit.query_"+obj+")!='undefined'") ? eval('WOM.batchingMaterial.batchingMaterial.batMaterialEdit.query_'+obj+'()') : null;
			return str;
		};
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.getcallBackGroupInfo = function(obj){
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
			WOM.batchingMaterial.batchingMaterial.batMaterialEdit._dialog.close();
		}
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form',obj[0], WOM.batchingMaterial.batchingMaterial.batMaterialEdit._prefix, WOM.batchingMaterial.batchingMaterial.batMaterialEdit._sUrl);
			CUI.commonFills('WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form',WOM.batchingMaterial.batchingMaterial.batMaterialEdit._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (WOM.batchingMaterial.batchingMaterial.batMaterialEdit._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(WOM.batchingMaterial.batchingMaterial.batMaterialEdit._customCallBack) {
					eval(WOM.batchingMaterial.batchingMaterial.batMaterialEdit._customCallBack);
					WOM.batchingMaterial.batchingMaterial.batMaterialEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.batchingMaterial.batchingMaterial.batMaterialEdit._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.getcallBackInfo_DG_IE = function(obj){
			if(WOM.batchingMaterial.batchingMaterial.batMaterialEdit._customBeforeCallBack) {
				var flag = eval(WOM.batchingMaterial.batchingMaterial.batMaterialEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = WOM.batchingMaterial.batchingMaterial.batMaterialEdit.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( WOM.batchingMaterial.batchingMaterial.batMaterialEdit._isObjCustomProp_IE == true && WOM.batchingMaterial.batchingMaterial.batMaterialEdit._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,WOM.batchingMaterial.batchingMaterial.batMaterialEdit._sUrl,WOM.batchingMaterial.batchingMaterial.batMaterialEdit._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,WOM.batchingMaterial.batchingMaterial.batMaterialEdit._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (WOM.batchingMaterial.batchingMaterial.batMaterialEdit._isObjCustomProp_IE == true && WOM.batchingMaterial.batchingMaterial.batMaterialEdit._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = WOM.batchingMaterial.batchingMaterial.batMaterialEdit._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = WOM.batchingMaterial.batchingMaterial.batMaterialEdit._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && WOM.batchingMaterial.batchingMaterial.batMaterialEdit._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + WOM.batchingMaterial.batchingMaterial.batMaterialEdit._refViewCode_IE + '&id=' + id,
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
				if(WOM.batchingMaterial.batchingMaterial.batMaterialEdit._customCallBack) {
					eval(WOM.batchingMaterial.batchingMaterial.batMaterialEdit._customCallBack);
					WOM.batchingMaterial.batchingMaterial.batMaterialEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.batchingMaterial.batchingMaterial.batMaterialEdit._dialog.close();
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
		
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.getcallBackInfo_DG = function(obj){
			if(WOM.batchingMaterial.batchingMaterial.batMaterialEdit._customBeforeCallBack) {
				var flag = eval(WOM.batchingMaterial.batchingMaterial.batMaterialEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(WOM.batchingMaterial.batchingMaterial.batMaterialEdit._currRow).next().length==0){
						WOM.batchingMaterial.batchingMaterial.batMaterialEdit._oGrid.addNewRow();
					}	
					WOM.batchingMaterial.batchingMaterial.batMaterialEdit._currRow = $(WOM.batchingMaterial.batchingMaterial.batMaterialEdit._currRow).next();
					$(WOM.batchingMaterial.batchingMaterial.batMaterialEdit._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(WOM.batchingMaterial.batchingMaterial.batMaterialEdit._currRow,obj[i], WOM.batchingMaterial.batchingMaterial.batMaterialEdit._prefix, WOM.batchingMaterial.batchingMaterial.batMaterialEdit._sUrl);
				if (WOM.batchingMaterial.batchingMaterial.batMaterialEdit._isObjCustomProp == true && WOM.batchingMaterial.batchingMaterial.batMaterialEdit._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(WOM.batchingMaterial.batchingMaterial.batMaterialEdit._currRow,WOM.batchingMaterial.batchingMaterial.batMaterialEdit._prefix,obj[i],WOM.batchingMaterial.batchingMaterial.batMaterialEdit._oGrid,WOM.batchingMaterial.batchingMaterial.batMaterialEdit._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(WOM.batchingMaterial.batchingMaterial.batMaterialEdit._currRow,WOM.batchingMaterial.batchingMaterial.batMaterialEdit._prefix,obj[i],WOM.batchingMaterial.batchingMaterial.batMaterialEdit._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + WOM.batchingMaterial.batchingMaterial.batMaterialEdit._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + WOM.batchingMaterial.batchingMaterial.batMaterialEdit._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && WOM.batchingMaterial.batchingMaterial.batMaterialEdit._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + WOM.batchingMaterial.batchingMaterial.batMaterialEdit._refViewCode + '&id=' + id,
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
									name = WOM.batchingMaterial.batchingMaterial.batMaterialEdit._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(WOM.batchingMaterial.batchingMaterial.batMaterialEdit._currRow, objs, WOM.batchingMaterial.batchingMaterial.batMaterialEdit._oGrid);
							}
						}
					}
				}
			}
			try{
				if(WOM.batchingMaterial.batchingMaterial.batMaterialEdit._customCallBack) {
					eval(WOM.batchingMaterial.batchingMaterial.batMaterialEdit._customCallBack);
					WOM.batchingMaterial.batchingMaterial.batMaterialEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.batchingMaterial.batchingMaterial.batMaterialEdit._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + WOM.batchingMaterial.batchingMaterial.batMaterialEdit._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(WOM.batchingMaterial.batchingMaterial.batMaterialEdit._oGrid, WOM.batchingMaterial.batchingMaterial.batMaterialEdit._currRow, WOM.batchingMaterial.batchingMaterial.batMaterialEdit._key, WOM.batchingMaterial.batchingMaterial.batMaterialEdit._displayFieldName, obj[i])
			}
			try{
				if(WOM.batchingMaterial.batchingMaterial.batMaterialEdit._customCallBack) {
					eval(WOM.batchingMaterial.batchingMaterial.batMaterialEdit._customCallBack);
					WOM.batchingMaterial.batchingMaterial.batMaterialEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.batchingMaterial.batchingMaterial.batMaterialEdit._dialog.close();
			} catch(e){}
		};
		
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						WOM.batchingMaterial.batchingMaterial.batMaterialEdit.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form'));
						}
					}
				}
			});
		};

		$(function(){
			WOM.batchingMaterial.batchingMaterial.batMaterialEdit.onloadForProduct();
			$("#edit-submit-btn span:eq(1)").html("配送");
$("#edit-remind-btn").hide();
$("#edit-proxyPending-btn").hide();
$(".edit-workflow").hide();
$("#icon_handle").hide();
$("#fr_flow").hide();
$("#edit_sidebar").css("display","none");
var url="/WOM/putInMaterial/putInMaterial/getIsMesProBatch.action";
$.ajax({
    type:'POST',
    url:url,
    async : false,
    success:function(msg){
        if(msg!=null){
	        isMesProBatch=msg.result;
        }
    }
});
		});

		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.beforeSubmitMethodSettingInPage = function(){
			WOM.batchingMaterial.batchingMaterial.batMaterialEdit.onsaveForProduct();
			var type = $("#operateType").val();
var type1=$("input[name='workFlowVarStatus']").val();

var rowlen = BatchingMaterialPart_dg1491792702452Widget.getRowLength();
for(var i = 0 ; i < rowlen ; i++){
	var doneNum = BatchingMaterialPart_dg1491792702452Widget.getCellValue(i,"doneNum");	
	var donNumFloat = parseFloat(doneNum) ? parseFloat(doneNum) : "NaN";
	if(donNumFloat == "NaN"){
		workbenchErrorBarWidget.showMessage('配料数量需大于0','f');
		return false;
	}else if(donNumFloat <=0 ){
		workbenchErrorBarWidget.showMessage('配料数量需大于0','f');
		return false;	
	}
}
		

if(  type =='submit' && type1!='reject' &&  type1!='cancel'  ){
    var len= BatchingMaterialPart_dg1491792702452Widget._DT.getAllData().length
	for(var i=0;i<len;i++){
		var cargoStatue=BatchingMaterialPart_dg1491792702452Widget._DT.getCellValue(i,'wareID.cargoStatue.id')
		var placeSetCode=BatchingMaterialPart_dg1491792702452Widget._DT.getCellValue(i,'storeID.placeSetCode')
        if(cargoStatue=='storageState/storageState1' && placeSetCode==''){
		  workbenchErrorBarWidget.showMessage('${getText('WOM.errorMesg.randon1489737417838345')}','f');
		  return false;
		}
	}
	//是否启用MES物料管理
	if(isMesProBatch==true){
		for(var i=0;i<len;i++){
			var wareCode=BatchingMaterialPart_dg1491792702452Widget._DT.getCellValue(i,'wareID.wareCode');
			if(wareCode==null || wareCode==""){
				workbenchErrorBarWidget.showMessage('${getText('WOM.showMessage00000025')}','f');
		  		return false;
			}
		}
	}else if(isMesProBatch==false){
		//TODO
	}
}
if(  type =='save' || type1!='submit'){
	//是否启用MES物料管理
	if(isMesProBatch==true){
		//添加必填校验
		var len = BatchingMaterialPart_dg1491792702452Widget.getRowLength();
		for(var i = 0 ; i < len ; i++){
			if(BatchingMaterialPart_dg1491792702452Widget.getCellValue(i,"batchNum")==null || BatchingMaterialPart_dg1491792702452Widget.getCellValue(i,"batchNum")==""){
				workbenchErrorBarWidget.showMessage("${getText('WOM.showMessage00000038')}");
				return false;
			}
			if(BatchingMaterialPart_dg1491792702452Widget.getCellValue(i,"batchNumObj.batchText")==null || BatchingMaterialPart_dg1491792702452Widget.getCellValue(i,"batchNumObj.batchText")==""){
				workbenchErrorBarWidget.showMessage("${getText('WOM.showMessage00000038')}");
				return false;
			}
			if(BatchingMaterialPart_dg1491792702452Widget.getCellValue(i,"doneNum")==null || BatchingMaterialPart_dg1491792702452Widget.getCellValue(i,"doneNum")==""){
				workbenchErrorBarWidget.showMessage("${getText('WOM.showMessage00000039')}");
				return false;
			}
			if(BatchingMaterialPart_dg1491792702452Widget.getCellValue(i,"wareID.wareCode")==null || BatchingMaterialPart_dg1491792702452Widget.getCellValue(i,"wareID.wareCode")==""){
				workbenchErrorBarWidget.showMessage("${getText('WOM.showMessage00000040')}");
				return false;
			}
		}
	}else if(isMesProBatch==false){
		//添加必填校验
		var len = BatchingMaterialPart_dg1491792702452Widget.getRowLength();
		for(var i = 0 ; i < len ; i++){
			if(BatchingMaterialPart_dg1491792702452Widget.getCellValue(i,"batchNum")==null || BatchingMaterialPart_dg1491792702452Widget.getCellValue(i,"batchNum")==""){
				workbenchErrorBarWidget.showMessage("${getText('WOM.showMessage00000038')}");
				return false;
			}
			if(BatchingMaterialPart_dg1491792702452Widget.getCellValue(i,"doneNum")==null || BatchingMaterialPart_dg1491792702452Widget.getCellValue(i,"doneNum")==""){
				workbenchErrorBarWidget.showMessage("${getText('WOM.showMessage00000039')}");
				return false;
			}
		}
	}
}
		};
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  WOM.batchingMaterial.batchingMaterial.batMaterialEdit.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div").hide();
				},100);
				//CUI("#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.showThis = function(){
			if(!CUI("#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div").is(':visible')) {
				CUI("#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			WOM.batchingMaterial.batchingMaterial.batMaterialEdit.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "WOM_batchingMaterial_batchingMaterial_batMaterialEdit_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=WOM&modelName=WOM_7.5.0.0_batchingMaterial_BatchingMaterial&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.batchingMaterial.batchingMaterial.batMaterialEdit.auditDialog.show();
			</#if>
		}
		
		
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.showInfoDialog=function(mode){
			
			WOM.batchingMaterial.batchingMaterial.batMaterialEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "WOM_batchingMaterial_batchingMaterial_batMaterialEdit_dealInfo",
				modal:true,
				height:500,
				width: 950,//适应国际化版
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.batchingMaterial.batchingMaterial.batMaterialEdit.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=WOM_7.5.0.0_batchingMaterial");
			}
		}
		
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/WOM/batchingMaterial/batchingMaterial/dealInfo-list.action&dlTableInfoId=${(batchingMaterial.tableInfoId)?default('')}");
			}
		}
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.showFlowInfo=function(){
		     //IE8环境下使用旧版flash流程展现页面，其他情况使用html5流程展现页面
		    var browser=navigator.appName; 
			var b_version=navigator.appVersion; 
			var version=b_version.split(";"); 
			var trim_Version=version[1]&&version[1].replace(/[ ]/g,"");
			var isIE8=(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE8.0")||($.browser.msie&&(Number($.browser.version)<= 8));//IE8兼容视图模式下浏览器版本判断逻辑补充
			if(CUI.trim(CUI("#flowDiv").html())==""){
				if(isIE8){
				    CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=WOM_7.5.0.0_batchingMaterial_BatchingMaterial&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(batchingMaterial.tableInfoId)?default('')}");
				}else{
				    CUI("#flowDiv").load("/ec/workflow/flowViewH5.action?env=runtime&modelCode=WOM_7.5.0.0_batchingMaterial_BatchingMaterial&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(batchingMaterial.tableInfoId)?default('')}");
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
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.supervision=function(){
			WOM.batchingMaterial.batchingMaterial.batMaterialEdit.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(batchingMaterial.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				WOM.batchingMaterial.batchingMaterial.batMaterialEdit.modifyOwnerStaffDialog.show();
		}
		


function  batchObjCallback(obj){
	//var obj=ec_WOM_standingcropRef_standingcropRef_batchNumOneBatRef_queryWidget.getSelectedRow();
	//console.log(obj);
	var nRow=BatchingMaterialPart_dg1491792702452Widget.getSelectedRow();
	//将批号回填到物料批号文本
	BatchingMaterialPart_dg1491792702452Widget.setCellValue(nRow,"batchNum",obj[0].batchText);//非空由批号文本判断
	//仓库id,编码，名称
	BatchingMaterialPart_dg1491792702452Widget.setCellValue(nRow,"wareID.id",obj[0].wareID.id);
	BatchingMaterialPart_dg1491792702452Widget.setCellValue(nRow,"wareID.wareCode",obj[0].wareID.wareCode);
	BatchingMaterialPart_dg1491792702452Widget.setCellValue(nRow,"wareID.wareName",obj[0].wareID.wareName);
	//货位状态id,value
	BatchingMaterialPart_dg1491792702452Widget.setCellValue(nRow,"wareID.cargoStatue.id",obj[0].wareID.cargoStatue.id);
	BatchingMaterialPart_dg1491792702452Widget.setCellValue(nRow,"wareID.cargoStatue.value",obj[0].wareID.cargoStatue.value);
	//货位编码，货位名称(启用货位时)
	if(obj[0].wareID.cargoStatue.id == "storageState/storageState1"){
		BatchingMaterialPart_dg1491792702452Widget.setCellValue(nRow,"storeID.id",obj[0].placeSet.id);
		BatchingMaterialPart_dg1491792702452Widget.setCellValue(nRow,"storeID.placeSetCode",obj[0].placeSet.placeSetCode);
		BatchingMaterialPart_dg1491792702452Widget.setCellValue(nRow,"storeID.placeSetName",obj[0].placeSet.placeSetName);
	}else{
		BatchingMaterialPart_dg1491792702452Widget.setCellValue(nRow,"storeID.id","");
		BatchingMaterialPart_dg1491792702452Widget.setCellValue(nRow,"storeID.placeSetCode","");
		BatchingMaterialPart_dg1491792702452Widget.setCellValue(nRow,"storeID.placeSetName","");
	}	
}
function doneNumChang(){
	var sum=0;
	for (var i = 0 ; i<BatchingMaterialPart_dg1491792702452Widget.getRowLength() ; i++){
		sum +=parseFloat(BatchingMaterialPart_dg1491792702452Widget.getCellValue(i,"doneNum"));
	}
	$("[name='batchingMaterial.doneNum']").val(sum.toFixed(2));
}

		/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_batchingMaterial_batMaterialEdit,js,WOM_7.5.0.0_batchingMaterial_BatchingMaterial,WOM_7.5.0.0) */
// 自定义代码

	var isMesProBatch;//是否启用货位系统配置项
	var obj;//初始化对象
	WOM.batchingMaterial.batchingMaterial.batMaterialEdit.query_dg1491792702452storeID_placeSetCode = function(){
		var wareId=BatchingMaterialPart_dg1491792702452Widget.getCellValue(BatchingMaterialPart_dg1491792702452Widget.getSelectedRow(),"wareID.id")
		if(wareId=="" || wareId==null){
      		wareId = -1;
     	}
        return "wareId="+wareId;
    }
        
    WOM.batchingMaterial.batchingMaterial.batMaterialEdit.initSize = function(nTabIndex){
        var panesHeight;
        var thisHeight;
        var h = $(window).height();
        var w = $(window).width();
        var width_ = 0;
        if($('#edit_side_btn').length > 0){
         $('#edit_side_btn').hasClass('edit-side-btn-r') ? width_ = 0 : width_ = 145;			
        }
        <#if businessCenterList??&&businessCenterList?size gt 0 >
        $("#edit_sidebar").height(h);
        $("div.edit-sidebar-inner").height(h);
        $("#edit_side_btn").css("top",(h-50)/2);
        CUI('div[id^="otherContentDiv_"]').height(h);
        </#if>
        var conHeight = h-$("#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div .edit-head").height()-$("#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div .edit-tabs").height()<#if pendingId?? || editNew></#if>;
        $("#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
        panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
        var datagrids = $('body').data('WOM_batchingMaterial_batchingMaterial_batMaterialEdit_datagrids');
        var padding_bottom=16;
        $("#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div .pd_bottom,#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
        $("#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div .edit-panes-s").each(function(index){
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
                            if(WOM.batchingMaterial.batchingMaterial.batMaterialEdit.initCount <= 2) {
                                setTimeout(function(){WOM.batchingMaterial.batchingMaterial.batMaterialEdit.initSize();}, 200);
                                WOM.batchingMaterial.batchingMaterial.batMaterialEdit.initCount++;
                            }
                        }
                    }
                }
            } else {
                if(thisHeight < conHeight){ //当此页签下面的实际内容高度小于分配给它的高度
                    $(this).parent().height(conHeight);
                }
                else{     //当此页签下面的实际内容高度大于分配给它的高度
                    $(this).parent().height(conHeight);
                    $(this).parent().css("overflow-y","auto");
                }
            }					
        });
    }
    //删除重写
    function DT_BatchingMaterialPart_dg1491792702452_deldatagrid(){
        if(BatchingMaterialPart_dg1491792702452Widget._DT.getSelectedRow()[0].state.id=="womBatPartState/02"){
            workbenchErrorBarWidget.showMessage("${getText('WOM.showMessage00000034')}")
        }else{
            var deleteRows = BatchingMaterialPart_dg1491792702452Widget.deleteRows();
            if(!deleteRows || deleteRows.length == 0) {
                CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
                return false;
            }
            var delproperty = "'id','version','exeStaff.id','receiveStaff.id','productId.id','storeID.id','headId.id','wareID.id'";
            delproperty= delproperty.split(",")[0].substring(1).replace("'","");
            $.each(deleteRows, function(index, deleteRow){
                var tepID = eval("deleteRow."+delproperty);
                if(tepID==null || tepID == undefined || tepID == '') {
                    return true;
                }
                if($("#dg1491792702452DeletedIds").length>0){
                    $("#dg1491792702452DeletedIds")[0].value+=","+tepID;
                }else{
                    CUI('<input type="hidden" id="dg1491792702452DeletedIds" name="dgDeletedIds[\'dg1491792702452\']" value="'+tepID+'">').appendTo(CUI('#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form'));
                }
                //兼容旧版本提交函数
                CUI('<input type="hidden" name="dg1491792702452DeletedIds['+CUI('input[name^="dg1491792702452DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form'));
            });
        }
    }
//产品过滤物料批号		
	WOM.batchingMaterial.batchingMaterial.batMaterialEdit.query_dg1491792702452batchNumObj_batchText = function(){
		var goodID = BatchingMaterialPart_dg1491792702452Widget.getCellValue(BatchingMaterialPart_dg1491792702452Widget.getSelectedRow(),"productId.id");
		return "goodID=" + goodID ;
	}
	
	//控件打印
	WOM.batchingMaterial.batchingMaterial.batMaterialEdit.controlPrint = function(){
		if(BatchingMaterialPart_dg1491792702452Widget.checkEdited()){
			workbenchErrorBarWidget.showMessage("打印前请先保存！");
			return false;
		}

		if(WOM_7_5_0_0_batchingMaterial_batMaterialEdit_PrintControl) {
			var viewCode = $("input[name='viewCode']").val();
			WOM.batchingMaterial.batchingMaterial.batMaterialEdit.printTemplateSel = new CUI.Dialog({
				title:"${getText('ec.printTemplate.customeListSelect')}",
				height:300,
				width: 550,
				url : '/ec/printManage/customViewSelectForward.action?viewCode='+viewCode,
				buttons:[
					{
						name: "${getText('ec.common.confirm')}",
						handler:function(){
							if(print_template_select_dgViewRecordWidget.selectedRows == null
								|| print_template_select_dgViewRecordWidget.selectedRows == undefined
								|| print_template_select_dgViewRecordWidget.selectedRows[0] == null
								|| print_template_select_dgViewRecordWidget.selectedRows[0] == undefined){
								// CUI.Dialog.alert("${getText('ec.business.SelectRow')}");
								printTemplateSelectWidget.show("${getText('ec.business.SelectRow')}");
							} else {
								var selViewCode = print_template_select_dgViewRecordWidget.selectedRows[0].viewCode;
								var selCode = print_template_select_dgViewRecordWidget.selectedRows[0].code;
								var signatureInfo=signatureUtil.getSignatureInfo(false,viewCode+"_print_print");
								if(signatureInfo[0] != '') {
									print_callback=function(params){
										WOM.batchingMaterial.batchingMaterial.batMaterialEdit.toTakeShowPrint(selViewCode, selCode,params);
									}
									signatureUtil.showSignatureDialog(signatureInfo[1],signatureInfo[0],viewCode+"_print_print",'','print',false,'');
								}
								else {
									WOM.batchingMaterial.batchingMaterial.batMaterialEdit.toTakeShowPrint(selViewCode, selCode);
								}
								this.close();
							}
						}
					},
					{	
						name:"${getText("ec.flow.cancal")}",
						handler:function(){this.close();}
					}
				]
			});
			$.ajax({
				async   : false,
				type    : 'POST',
				url     : '/ec/printManage/customViewSelect.action',
				data    : 'viewCode=' + viewCode,
				success : function(msg){
					if (msg) {
						var totalCount = msg.totalCount;
						if (totalCount == 0) {
							CUI.Dialog.alert("没有可用的打印模板！");
						} else if (totalCount == 1) {
							var signatureInfo=signatureUtil.getSignatureInfo(false,viewCode+"_print_print");
							if(signatureInfo[0] != '') {
								print_callback=function(params){
									WOM.batchingMaterial.batchingMaterial.batMaterialEdit.toTakeShowPrint(viewCode, msg.result[0].code, params);
								}
								signatureUtil.showSignatureDialog(signatureInfo[1],signatureInfo[0],viewCode+"_print_print",'','print',false,'');
							}
							else {
								WOM.batchingMaterial.batchingMaterial.batMaterialEdit.toTakeShowPrint(viewCode, msg.result[0].code);
							}
						} else {
							WOM.batchingMaterial.batchingMaterial.batMaterialEdit.printTemplateSel.show();
						}
					}
				}
			});
		}
		
		var rowLength = BatchingMaterialPart_dg1491792702452Widget.getRowLength();		
		var printPartIds = "";
		for(var i = 0 ; i < rowLength ; i++){
			printPartId = BatchingMaterialPart_dg1491792702452Widget.getCellValue(i,"id");
			//console.log(printPartId);
			printPartIds += printPartId + ",";
		}
		if(printPartIds.length > 0){
			printPartIds = printPartIds.substr(0 , printPartIds.length-1 ) ;	
			
			//打印次数+1
			$.ajax({
				url : "/WOM/batchingMaterial/batchingMaterialPart/addPrintCount.action",
				type : 'post',
				data:{printDataIds:printPartIds},
				success : function(res) {
					if(res.dealSuccessFlag==true){
						//刷新表体
						//BatchingMaterialPart_dg1491792702452Widget.load(${dUrl});
						var reloadurl = BatchingMaterialPart_dg1491792702452Widget._DT.requestUrl.substr(0,BatchingMaterialPart_dg1491792702452Widget._DT.requestUrl.length-8);
						BatchingMaterialPart_dg1491792702452Widget.load(reloadurl);
					}
				}
			});
		}
	}
	
	//复写打印js，添加增加打印次数方法
	/*WOM.batchingMaterial.batchingMaterial.batMaterialEdit.controlPrint = function(){
		if(BatchingMaterialPart_dg1491792702452Widget.checkEdited()){
			workbenchErrorBarWidget.showMessage("打印前请先保存！");
			return false;
		}
	
		if(WOM_7_5_0_0_batchingMaterial_batMaterialEdit_PrintControl) {
			var postData = {
				'id' : '${(batchingMaterial.id)!}',
				'viewCode' :　'WOM_7.5.0.0_batchingMaterial_batMaterialEdit', 
				'deploymentId' : '${deploymentId!}',
				'tableInfoId' : '${(batchingMaterial.tableInfoId)!}'
			}
			WOM_7_5_0_0_batchingMaterial_batMaterialEdit_PrintControl.takeShowPrint('WOM_7.5.0.0_batchingMaterial_batMaterialEdit', "/WOM/batchingMaterial/batchingMaterial/loadXMLRefOrData.action?${getPowerCode('WOM_7.5.0.0_batchingMaterial_batMaterialEdit_controlPrint')}", postData, 1, <#if isWorkflow>true<#else>false</#if>);
		}
		
		var rowLength = BatchingMaterialPart_dg1491792702452Widget.getRowLength();		
		var printPartIds = "";
		for(var i = 0 ; i < rowLength ; i++){
			printPartId = BatchingMaterialPart_dg1491792702452Widget.getCellValue(i,"id");
			//console.log(printPartId);
			printPartIds += printPartId + ",";
		}
		if(printPartIds.length > 0){
			printPartIds = printPartIds.substr(0 , printPartIds.length-1 ) ;	
			
			//打印次数+1
			$.ajax({
				url : "/WOM/batchingMaterial/batchingMaterialPart/addPrintCount.action",
				type : 'post',
				data:{printDataIds:printPartIds},
				success : function(res) {
					if(res.dealSuccessFlag==true){
						//刷新表体
						//BatchingMaterialPart_dg1491792702452Widget.load(${dUrl});
						var reloadurl = BatchingMaterialPart_dg1491792702452Widget._DT.requestUrl.substr(0,BatchingMaterialPart_dg1491792702452Widget._DT.requestUrl.length-8);
						BatchingMaterialPart_dg1491792702452Widget.load(reloadurl);
						//for(var i = 0 ; i < rowLength ; i++){
						//	var printCount = 0;
						//	printCount = Number(BatchingMaterialPart_dg1491792702452Widget.getCellValue(i,"printCount")) + 1;
						//	printPartId = BatchingMaterialPart_dg1491792702452Widget.setCellValue(i,"printCount",printCount);
						//}
						//window.location.reload();
					}
				}
			});
		}
		
	}*/
	
	WOM.batchingMaterial.batchingMaterial.batMaterialEdit.submit = function(uncheck){
		$('#operateType').val("submit");
		if(uncheck){}
		else
		if(!($('#__workflow_outcome_countersign').prop("checked")||$('input[name="workFlowVar.outcome"]:checked').val())){
			workbenchErrorBarWidget.showMessage("${getText('ec.flow.outcome.select')}");
			return;
		}
		if(!WOM.batchingMaterial.batchingMaterial.batMaterialEdit.validate()){return;}
		
		//$('#__workflow_outcomeDes').val($('input[name="workFlowVar.outcome"]:checked').attr('des'));
		
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.beforeSaveProcess();
			
		//WOM.batchingMaterial.batchingMaterial.batMaterialEdit.processDataGrid();
			
		var rowLength = BatchingMaterialPart_dg1491792702452Widget.getRowLength();
		for(i = 0 ; i < rowLength; i++){
			//如果打印次数为0，不允许配送
			if(BatchingMaterialPart_dg1491792702452Widget.getCellValue(i,"printCount")=="0" ||
				BatchingMaterialPart_dg1491792702452Widget.getCellValue(i,"printCount")==""){
				workbenchErrorBarWidget.showMessage("${getText('WOM.showMessage00000051')}");
				return false;
			}
		}
			
		var totalDoneNum = 0;
		for(i = 0 ; i < rowLength; i++){
			var doneNum = BatchingMaterialPart_dg1491792702452Widget.getCellValue(i,"doneNum");
			var donNumFloat = parseFloat(doneNum) ? parseFloat(doneNum) : "NaN";
			if(donNumFloat!='NaN'){
				totalDoneNum += donNumFloat;
			}
		}
			
		var needNum = parseFloat($("#batchingMaterial_needNum").val());
			
		if(totalDoneNum > needNum){
				
			CUI.Dialog.confirm("累计配料数量大于需配送数量（" + needNum + "） " + Subtr(totalDoneNum,needNum) + ",继续配送？",
			function(){
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
				$('#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form').submit();
				//$(".wfcancel").remove();
						
			},
			function(){
				return false;
			},
			"确认"
			);
		}else{
				
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
			$('#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form').submit();
			//$(".wfcancel").remove();
			
		}
	}
		
	/*WOM.batchingMaterial.batchingMaterial.batMaterialEdit.save = function(){
		<#if !(superEdit!false)>
		$('#operateType').val("save");
		<#else>
		$('#operateType').val("submit");
		</#if>
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		if(!WOM.batchingMaterial.batchingMaterial.batMaterialEdit.validate()){return;}
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.beforeSaveProcess();
		
		var rowLength = BatchingMaterialPart_dg1491792702452Widget.getRowLength();
		var totalDoneNum = 0;
		for(i = 0 ; i < rowLength; i++){
			var doneNum = BatchingMaterialPart_dg1491792702452Widget.getCellValue(i,"doneNum");
			var donNumFloat = parseFloat(doneNum) ? parseFloat(doneNum) : "NaN";
			if(donNumFloat!='NaN'){
				totalDoneNum += donNumFloat;
			}
		}
				
		var needNum = parseFloat($("#batchingMaterial_needNum").val());
				
		if(totalDoneNum > needNum){
			CUI.Dialog.confirm("累计配料数量大于需配送数量（" + totalDoneNum + "） " + String(totalDoneNum - needNum) + ",继续配送？",
			function(){
				console.log(1);
				$('#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form').submit();
			},
			function(){
				return false;
			},
			"确认"
			);
		}else{
			$('#WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form').submit();
		}
		//WOM.batchingMaterial.batchingMaterial.batMaterialEdit.processDataGrid();		
	}*/
	
	//减法  
	function Subtr(arg1,arg2){ 
		var r1,r2,m,n; 
		try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0} 
		try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0} 
		m=Math.pow(10,Math.max(r1,r2)); 
		n=2; 
		return ((arg1*m-arg2*m)/m).toFixed(n); 
	}
/* CUSTOM CODE END */
		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.onloadForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_batchingMaterial_batMaterialEdit,onloadForProduct,WOM_7.5.0.0_batchingMaterial_BatchingMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		}

		WOM.batchingMaterial.batchingMaterial.batMaterialEdit.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_batchingMaterial_batMaterialEdit,onsaveForProduct,WOM_7.5.0.0_batchingMaterial_BatchingMaterial,WOM_7.5.0.0) */
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
				<div class="sidebar-top"><a href="#"  onclick="WOM.batchingMaterial.batchingMaterial.batMaterialEdit.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="WOM.batchingMaterial.batchingMaterial.batMaterialEdit.showBusinessList('${l.relatingModel.code.replace('.','')}',${(batchingMaterial.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
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