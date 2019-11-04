<!-- WOM_7.5.0.0/manulOrder/manulOrdersView -->
<#assign isWorkflow = false> 
<#assign isAttachment = true> 
	<#assign  fileuploadType = "WOM_manulOrder_manulOrderMain">
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
<#assign tableObj = manulOrderMain>
<#-- 命名空间 -->
<#assign editPageNs = "WOM.manulOrder.manulOrderMain.manulOrdersView">
<#-- 模型名称-->
<#assign modelName = "manulOrderMain">
<#-- 视图编码-->
<#assign viewCode = "WOM_7.5.0.0_manulOrder_manulOrdersView">
<#-- 实体编码-->
<#assign entity_code = "WOM_7.5.0.0_manulOrder">
<#-- 视图名称-->
<#assign viewName = "manulOrdersView">
<#-- datagrid编码-->
<#assign datagridCode = "WOM_manulOrder_manulOrderMain_manulOrdersView_datagrids">
<#-- 首字母大写的模型名称-->
<#assign upcaseModelName = "ManulOrderMain">
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
<#assign editFormId = "WOM_manulOrder_manulOrderMain_manulOrdersView_form">
<#-- 待办状态 -->
<#assign pendingstatus =( manulOrderMain.pending.taskDescription)!>
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
        <#assign configTitle = getText('WOM.viewtitle.randon1568964902370')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		
		#WOM_manulOrder_manulOrderMain_manulOrdersView_form{float:left;width:100%;}
		
		
		</style>
		<script type="text/javascript">
			CUI.ns('WOM.manulOrder.manulOrderMain.manulOrdersView');
			WOM.manulOrder.manulOrderMain.manulOrdersView.currentUser = ${userJson};
			WOM.manulOrder.manulOrderMain.manulOrdersView.currentStaff = ${staffJson};
			WOM.manulOrder.manulOrderMain.manulOrdersView.currentDepartment = ${deptJson};
			WOM.manulOrder.manulOrderMain.manulOrdersView.currentPosition = ${postJson};
			WOM.manulOrder.manulOrderMain.manulOrdersView.currentCompany = ${compJson};
		</script>
		<!-- CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_manulOrder_manulOrdersView,head,WOM_7.5.0.0_manulOrder_ManulOrderMain,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
    </head>
	<body class="view-edit ">
		<@loadpanel newType=true/>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="manulOrderMain.ware.id,manulOrderMain.manulStaff.id,manulOrderMain.product.id,manulOrderMain.unit.id," onsubmitMethod="WOM.manulOrder.manulOrderMain.manulOrdersView.beforeSubmitMethod()" id="WOM_manulOrder_manulOrderMain_manulOrdersView_form" namespace="/WOM/manulOrder/manulOrderMain/manulOrdersView" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=WOM_7.5.0.0_manulOrder_ManulOrderMain&_bapFieldPermissonModelName_=ManulOrderMain" editPageNs="WOM.manulOrder.manulOrderMain.manulOrdersView" callback="WOM.manulOrder.manulOrderMain.manulOrdersView._callBackInfo" ecform="true">
			<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
			<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="WOM_manulOrder_manulOrderMain_manulOrdersView_main_div">
			<div class="edit-head">
				<#include "../../../ec/tableInfo/operateheadbar_all.ftl" >
				<#include "../../../ec/tableInfo/creatorInfo.ftl" >
			</div>
    		<div class="edit-main" id="WOM_manulOrder_manulOrderMain_manulOrdersView">
    			<div class="edit-content">
    	<#include "../../../ec/tableInfo/formparam.ftl" >				
					<input type="hidden" name="manulOrderMain.ware.id" value="${(manulOrderMain.ware.id)!""}" originalvalue="${(manulOrderMain.ware.id)!""}"/>
					<input type="hidden" name="manulOrderMain.manulStaff.id" value="${(manulOrderMain.manulStaff.id)!""}" originalvalue="${(manulOrderMain.manulStaff.id)!""}"/>
					<input type="hidden" name="manulOrderMain.product.id" value="${(manulOrderMain.product.id)!""}" originalvalue="${(manulOrderMain.product.id)!""}"/>
					<input type="hidden" name="manulOrderMain.unit.id" value="${(manulOrderMain.unit.id)!""}" originalvalue="${(manulOrderMain.unit.id)!""}"/>
		<div class="dash-line"></div>
<script type="text/javascript">
var attcountid = "WOM_manulOrder_manulOrderMain_manulOrdersView_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=WOM_7.5.0.0_manulOrder', null, function(){
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
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1563193157341')}" >${getText('WOM.propertydisplayName.randon1563193157341')}</label>
				</td>
				
						<#assign manulOrderMain_manulOrderNum_defaultValue  = ''>
							 							<#assign manulOrderMain_manulOrderNum_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="manulOrderMain.manulOrderNum" id="manulOrderMain_manulOrderNum"  style=";" originalvalue="<#if !newObj || (manulOrderMain.manulOrderNum)?has_content>${(manulOrderMain.manulOrderNum?html)!}<#else>${manulOrderMain_manulOrderNum_defaultValue!}</#if>" value="<#if !newObj || (manulOrderMain.manulOrderNum)?has_content>${(manulOrderMain.manulOrderNum?html)!}<#else>${manulOrderMain_manulOrderNum_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415772644833')}" >${getText('MESBasic.propertydisplayName.radion1415772644833')}</label>
				</td>
				
						<#assign manulOrderMain_product_productCode_defaultValue  = ''>
														<#assign manulOrderMain_product_productCode_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}" viewType="readonly" deValue="${manulOrderMain_product_productCode_defaultValue!}" conditionfunc="WOM.manulOrder.manulOrderMain.manulOrdersView._querycustomFunc('manulOrderMain_product_productCode')" view=true  value="${(manulOrderMain.product.productCode)!}" displayFieldName="productCode" name="manulOrderMain.product.productCode" id="manulOrderMain_product_productCode" type="other" url="/MESBasic/product/product/productRefNew.action" clicked=true multiple=false mnewidth=260 formId="WOM_manulOrder_manulOrderMain_manulOrdersView_form" editCustomCallback=";" refViewCode="MESBasic_1_product_productRefNew" onkeyupfuncname=";_callback_manulOrderMain_product_productCode(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(manulOrderMain.id)?? && (manulOrderMain.product.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${manulOrderMain.product.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_manulOrder_manulOrderMain_manulOrdersView_form',obj, 'manulOrderMain.product', '/MESBasic/product/product/productRefNew.action');
												CUI.commonFills('WOM_manulOrder_manulOrderMain_manulOrdersView_form', 'manulOrderMain.product',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1563193270725')}" >${getText('WOM.propertydisplayName.randon1563193270725')}</label>
				</td>
				
						<#assign manulOrderMain_edition_defaultValue  = ''>
							 							<#assign manulOrderMain_edition_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="manulOrderMain.edition" id="manulOrderMain_edition"  style=";" originalvalue="<#if !newObj || (manulOrderMain.edition)?has_content>${(manulOrderMain.edition?html)!}<#else>${manulOrderMain_edition_defaultValue!}</#if>" value="<#if !newObj || (manulOrderMain.edition)?has_content>${(manulOrderMain.edition?html)!}<#else>${manulOrderMain_edition_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertyshowName.randon1563947675681.flag')}" >${getText('WOM.propertyshowName.randon1563947675681.flag')}</label>
				</td>
				
						<#assign manulOrderMain_product_unitGroup_name_defaultValue  = ''>
														<#assign manulOrderMain_product_unitGroup_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="manulOrderMain.product.unitGroup.name" id="manulOrderMain_product_unitGroup_name"  style=";" originalvalue="<#if !newObj || (manulOrderMain.product.unitGroup.name)?has_content>${(manulOrderMain.product.unitGroup.name?html)!}<#else>${manulOrderMain_product_unitGroup_name_defaultValue!}</#if>" value="<#if !newObj || (manulOrderMain.product.unitGroup.name)?has_content>${(manulOrderMain.product.unitGroup.name?html)!}<#else>${manulOrderMain_product_unitGroup_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1563254234602')}" >${getText('WOM.propertydisplayName.randon1563254234602')}</label>
				</td>
				
						<#assign manulOrderMain_orderNumber_defaultValue  = ''>
							 							<#assign manulOrderMain_orderNumber_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="manulOrderMain.orderNumber" id="manulOrderMain_orderNumber"  style=";" originalvalue="<#if newObj&& !(manulOrderMain.orderNumber)?has_content>${manulOrderMain_orderNumber_defaultValue!}<#elseif (manulOrderMain.orderNumber)?has_content>#{(manulOrderMain.orderNumber)!; m3M3}</#if>" value="<#if newObj&& !(manulOrderMain.orderNumber)?has_content>${manulOrderMain_orderNumber_defaultValue!}<#elseif (manulOrderMain.orderNumber)?has_content>#{(manulOrderMain.orderNumber)!; m3M3}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415772740737')}" >${getText('MESBasic.propertydisplayName.radion1415772740737')}</label>
				</td>
				
						<#assign manulOrderMain_product_productName_defaultValue  = ''>
														<#assign manulOrderMain_product_productName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('MESBasic.viewtitle.radion1415773613713')}" viewType="readonly" deValue="${manulOrderMain_product_productName_defaultValue!}" conditionfunc="WOM.manulOrder.manulOrderMain.manulOrdersView._querycustomFunc('manulOrderMain_product_productName')" view=true  value="${(manulOrderMain.product.productName)!}" displayFieldName="productName" name="manulOrderMain.product.productName" id="manulOrderMain_product_productName" type="other" url="/MESBasic/product/product/productRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_manulOrder_manulOrderMain_manulOrdersView_form" editCustomCallback=";" refViewCode="MESBasic_1_product_productRef"  onkeyupfuncname=";_callback_manulOrderMain_product_productName(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(manulOrderMain.id)?? && (manulOrderMain.product.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${manulOrderMain.product.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_manulOrder_manulOrderMain_manulOrdersView_form',obj, 'manulOrderMain.product', '/MESBasic/product/product/productRef.action');
												CUI.commonFills('WOM_manulOrder_manulOrderMain_manulOrdersView_form', 'manulOrderMain.product',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1563193285800')}" >${getText('WOM.propertydisplayName.randon1563193285800')}</label>
				</td>
				
						<#assign manulOrderMain_planStartTime_defaultValue  = ''>
							 							<#assign manulOrderMain_planStartTime_defaultValue  = ''>
					<#if (manulOrderMain_planStartTime_defaultValue)?? &&(manulOrderMain_planStartTime_defaultValue)?has_content>
							<#assign manulOrderMain_planStartTime_defaultValue  = getDefaultDateTime(manulOrderMain_planStartTime_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  align="left" style="text-align: left;;" >
					
							
							<#if newObj && !(manulOrderMain.planStartTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="manulOrderMain.planStartTime" value="${manulOrderMain_planStartTime_defaultValue!}" type="dateTime"  id="manulOrderMain.planStartTime"  view=true cssStyle=""   align="left"/>
								
							<#else>
							<#if (manulOrderMain.planStartTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="manulOrderMain.planStartTime" value="${manulOrderMain.planStartTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="manulOrderMain.planStartTime"  view=true cssStyle="" align="left"  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="manulOrderMain.planStartTime" value="" type="dateTime" id="manulOrderMain.planStartTime" cssStyle=""  view=true align="left"/>
								
							</#if>
							</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1563193313630')}" >${getText('WOM.propertydisplayName.randon1563193313630')}</label>
				</td>
				
						<#assign manulOrderMain_planEndTime_defaultValue  = ''>
							 							<#assign manulOrderMain_planEndTime_defaultValue  = ''>
					<#if (manulOrderMain_planEndTime_defaultValue)?? &&(manulOrderMain_planEndTime_defaultValue)?has_content>
							<#assign manulOrderMain_planEndTime_defaultValue  = getDefaultDateTime(manulOrderMain_planEndTime_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  align="left" style="text-align: left;;" >
					
							
							<#if newObj && !(manulOrderMain.planEndTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="manulOrderMain.planEndTime" value="${manulOrderMain_planEndTime_defaultValue!}" type="dateTime"  id="manulOrderMain.planEndTime"  view=true cssStyle=""   align="left"/>
								
							<#else>
							<#if (manulOrderMain.planEndTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="manulOrderMain.planEndTime" value="${manulOrderMain.planEndTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="manulOrderMain.planEndTime"  view=true cssStyle="" align="left"  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="manulOrderMain.planEndTime" value="" type="dateTime" id="manulOrderMain.planEndTime" cssStyle=""  view=true align="left"/>
								
							</#if>
							</#if>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertyshowName.randon1563346326026.flag')}" >${getText('WOM.propertyshowName.randon1563346326026.flag')}</label>
				</td>
				
						<#assign manulOrderMain_manulStaff_name_defaultValue  = ''>
														<#assign manulOrderMain_manulStaff_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.view.reference')}" viewType="readonly" deValue="${manulOrderMain_manulStaff_name_defaultValue!}" conditionfunc="WOM.manulOrder.manulOrderMain.manulOrdersView._querycustomFunc('manulOrderMain_manulStaff_name')" view=true  value="${(manulOrderMain.manulStaff.name)!}" displayFieldName="name" name="manulOrderMain.manulStaff.name" id="manulOrderMain_manulStaff_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="WOM_manulOrder_manulOrderMain_manulOrdersView_form" editCustomCallback=";" refViewCode="sysbase_1.0_staff_ref" onkeyupfuncname=";_callback_manulOrderMain_manulStaff_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (manulOrderMain_manulStaff_name_defaultValue)=='currentUser'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.id}'};
											obj = foundation.common.getObject('WOM_manulOrder_manulOrderMain_manulOrdersView_form',obj, 'manulOrderMain.manulStaff', '/foundation/staff/common/staffListFrameset.action');
											CUI.commonFills('WOM_manulOrder_manulOrderMain_manulOrdersView_form', 'manulOrderMain.manulStaff',obj,true);
											$('input:hidden[name="manulOrderMain.manulStaff.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(manulOrderMain.id)?? && (manulOrderMain.manulStaff.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${manulOrderMain.manulStaff.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_manulOrder_manulOrderMain_manulOrdersView_form',obj, 'manulOrderMain.manulStaff', '/foundation/staff/common/staffListFrameset.action');
												CUI.commonFills('WOM_manulOrder_manulOrderMain_manulOrdersView_form', 'manulOrderMain.manulStaff',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr >
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1484031239866')}" >${getText('MESBasic.propertydisplayName.randon1484031239866')}</label>
				</td>
				
						<#assign manulOrderMain_ware_wareCode_defaultValue  = ''>
														<#assign manulOrderMain_ware_wareCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}" viewType="readonly" deValue="${manulOrderMain_ware_wareCode_defaultValue!}" conditionfunc="WOM.manulOrder.manulOrderMain.manulOrdersView._querycustomFunc('manulOrderMain_ware_wareCode')" view=true  value="${(manulOrderMain.ware.wareCode)!}" displayFieldName="wareCode" name="manulOrderMain.ware.wareCode" id="manulOrderMain_ware_wareCode" type="other" url="/MESBasic/wareMan/ware/wareRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_manulOrder_manulOrderMain_manulOrdersView_form" editCustomCallback=";" refViewCode="MESBasic_1_wareMan_wareRef"  onkeyupfuncname=";_callback_manulOrderMain_ware_wareCode(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(manulOrderMain.id)?? && (manulOrderMain.ware.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${manulOrderMain.ware.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_manulOrder_manulOrderMain_manulOrdersView_form',obj, 'manulOrderMain.ware', '/MESBasic/wareMan/ware/wareRef.action');
												CUI.commonFills('WOM_manulOrder_manulOrderMain_manulOrdersView_form', 'manulOrderMain.ware',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1563193334953')}" >${getText('WOM.propertydisplayName.randon1563193334953')}</label>
				</td>
				
						<#assign manulOrderMain_saleOrderNum_defaultValue  = ''>
							 							<#assign manulOrderMain_saleOrderNum_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="manulOrderMain.saleOrderNum" id="manulOrderMain_saleOrderNum"  style=";" originalvalue="<#if !newObj || (manulOrderMain.saleOrderNum)?has_content>${(manulOrderMain.saleOrderNum?html)!}<#else>${manulOrderMain_saleOrderNum_defaultValue!}</#if>" value="<#if !newObj || (manulOrderMain.saleOrderNum)?has_content>${(manulOrderMain.saleOrderNum?html)!}<#else>${manulOrderMain_saleOrderNum_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1563193344677')}" >${getText('WOM.propertydisplayName.randon1563193344677')}</label>
				</td>
				
						<#assign manulOrderMain_saleOrderProject_defaultValue  = ''>
							 							<#assign manulOrderMain_saleOrderProject_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="manulOrderMain.saleOrderProject" id="manulOrderMain_saleOrderProject"  style=";" originalvalue="<#if !newObj || (manulOrderMain.saleOrderProject)?has_content>${(manulOrderMain.saleOrderProject?html)!}<#else>${manulOrderMain_saleOrderProject_defaultValue!}</#if>" value="<#if !newObj || (manulOrderMain.saleOrderProject)?has_content>${(manulOrderMain.saleOrderProject?html)!}<#else>${manulOrderMain_saleOrderProject_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1565937058910')}" >${getText('WOM.propertydisplayName.randon1565937058910')}</label>
				</td>
				
						<#assign manulOrderMain_isFinshed_defaultValue  = 'false'>
							 							<#assign manulOrderMain_isFinshed_defaultValue  = 'false'>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="manulOrderMain.isFinshed_check" originalvalue="<#if !newObj><#if (manulOrderMain.isFinshed)??>${(manulOrderMain.isFinshed!false)?string('true','false')}<#else>false</#if><#elseif manulOrderMain_isFinshed_defaultValue?has_content>${(manulOrderMain_isFinshed_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (manulOrderMain.isFinshed)??>${(manulOrderMain.isFinshed!false)?string('true','false')}<#else>false</#if><#else>${(manulOrderMain_isFinshed_defaultValue!true)?string}</#if>"  disabled=true/>
								
								<input property_type="BOOLEAN" type="hidden" name="manulOrderMain.isFinshed" originalvalue="<#if ((manulOrderMain.isFinshed)?? &&  manulOrderMain.isFinshed)||(manulOrderMain_isFinshed_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((manulOrderMain.isFinshed)?? &&  manulOrderMain.isFinshed)||(manulOrderMain_isFinshed_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="manulOrderMain.isFinshed_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="manulOrderMain.isFinshed"]');
												CUI('input[name="manulOrderMain.isFinshed_check"]').each(function(){
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
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1563254276051')}" >${getText('WOM.propertydisplayName.randon1563254276051')}</label>
				</td>
				
						<#assign manulOrderMain_hasManualNumber_defaultValue  = ''>
							 							<#assign manulOrderMain_hasManualNumber_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="manulOrderMain.hasManualNumber" id="manulOrderMain_hasManualNumber"  style=";" originalvalue="<#if newObj&& !(manulOrderMain.hasManualNumber)?has_content>${manulOrderMain_hasManualNumber_defaultValue!}<#elseif (manulOrderMain.hasManualNumber)?has_content>#{(manulOrderMain.hasManualNumber)!; m3M3}</#if>" value="<#if newObj&& !(manulOrderMain.hasManualNumber)?has_content>${manulOrderMain_hasManualNumber_defaultValue!}<#elseif (manulOrderMain.hasManualNumber)?has_content>#{(manulOrderMain.hasManualNumber)!; m3M3}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
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
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1563267783528')}" >${getText('WOM.propertydisplayName.randon1563267783528')}</label>
				</td>
				
						<#assign manulOrderMain_remarks_defaultValue  = ''>
							 							<#assign manulOrderMain_remarks_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly fix-ie7-textarea"><textarea property_type="TEXT" id="manulOrderMain_remarks" originalvalue="<#if !newObj || (manulOrderMain.remarks)?has_content>${(manulOrderMain.remarks?html)!}<#else>${manulOrderMain_remarks_defaultValue?html}</#if>"  name="manulOrderMain.remarks" class="cui-noborder-textarea cui-textarea-auto" readonly="readonly" style=";" ><#if !newObj || (manulOrderMain.remarks)?has_content>${(manulOrderMain.remarks)!}<#else>${manulOrderMain_remarks_defaultValue}</#if></textarea></div>
							
				</td>
		</tr>
	</table>
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
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1398235640483')}" >${getText('X6Basic.propertydisplayName.radion1398235640483')}</label>
				</td>
				
						<#assign manulOrderMain_unit_name_defaultValue  = ''>
														<#assign manulOrderMain_unit_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;display:none;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('X6Basic.viewtitle.radion1398240433147')}" viewType="${viewType!}" deValue="${manulOrderMain_unit_name_defaultValue!}" conditionfunc="WOM.manulOrder.manulOrderMain.manulOrdersView._querycustomFunc('manulOrderMain_unit_name')" view=true  value="${(manulOrderMain.unit.name)!}" displayFieldName="name" name="manulOrderMain.unit.name" id="manulOrderMain_unit_name" type="other" url="/X6Basic/unitGroup/baseUnit/unitRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_manulOrder_manulOrderMain_manulOrdersView_form" editCustomCallback=";" refViewCode="X6Basic_1.0_unitGroup_unitRef"  onkeyupfuncname=";_callback_manulOrderMain_unit_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(manulOrderMain.id)?? && (manulOrderMain.unit.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${manulOrderMain.unit.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_manulOrder_manulOrderMain_manulOrdersView_form',obj, 'manulOrderMain.unit', '/X6Basic/unitGroup/baseUnit/unitRef.action');
												CUI.commonFills('WOM_manulOrder_manulOrderMain_manulOrdersView_form', 'manulOrderMain.unit',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
		</tr>
	</table>
</div>				</div>
				<div class="edit-datatable">	

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
			
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/WOM/manulOrder/manulOrderMain/data-dg1568964886993.action?manulOrderMain.id=${refId!-1}&refId=${refId!-1}&datagridCode=WOM_7.5.0.0_manulOrder_manulOrdersViewdg1568964886993">
			<#else>
				<#assign dUrl="/WOM/manulOrder/manulOrderMain/data-dg1568964886993.action?manulOrderMain.id=${(manulOrderMain.id)!-1}&datagridCode=WOM_7.5.0.0_manulOrder_manulOrdersViewdg1568964886993">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_ManulOrderMaterial_dg1568964886993" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1568964886993_id" value="ManulOrderMaterial_dg1568964886993" />
			
			<input type="hidden" id="dg1568964886993_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('WOM.modelname.randon1563193064716')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/WOM/manulOrder/manulOrderMain/data-dg1568964886993.action?operateType=export&datagridCode=WOM_7.5.0.0_manulOrder_manulOrdersViewdg1568964886993"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="ManulOrderMaterial_dg1568964886993" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="ManulOrderMaterial_dg1568964886993" viewType="${viewType}" renderOverEvent="dg1568964886993RenderOverEvent" route="${routeFlag}" formId="WOM_manulOrder_manulOrderMain_manulOrdersView_form" noPermissionKeys="material.productCode,material.productName,ablePass,ware.wareName,ware.wareCode,unit.name,needNumber,materialBatchNum,edition,coOperation,rsNUM,rsPOS" modelCode="WOM_7.5.0.0_manulOrder_ManulOrderMaterial" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1568964886993" dtPage="dgPage"  hidekeyPrefix="dg1568964886993" hidekey="['id','version','material.id','material.productCode','material.id','material.productName','ware.id','ware.wareName','ware.id','ware.wareCode','unit.id','unit.name'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=false  buttons="${buttons}" noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1568964886993PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=false cannotDeleteRow=true assModelDisplayName=assModelDisplayName  activexButton="" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign material_productCode_displayDefaultType=''>
								<#assign material_productCode_defaultValue=''>
										<#assign material_productCode_defaultValue=''>
																	<#if (material_productCode_defaultValue!)?string=="currentUser">
								<#assign material_productCode_defaultValue='${staffJson!}'>
							<#elseif (material_productCode_defaultValue!)?string=="currentPost">
								<#assign material_productCode_defaultValue='${postJson!}'>
							<#elseif (material_productCode_defaultValue!)?string=="currentDepart">
								<#assign material_productCode_defaultValue='${deptJson!}'>
							<#elseif (material_productCode_defaultValue!)?string=="currentComp">
								<#assign material_productCode_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="material.productCode"        showFormat="SELECTCOMP" defaultValue="${(material_productCode_defaultValue!)?string}" defaultDisplay="${(material_productCode_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.manulOrder.manulOrderMain.manulOrdersView"  textalign="left"  viewUrl="/MESBasic/product/product/productRef.action" viewCode="MESBasic_1_product_productRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.radion1415773613713')}"  label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" width=100 showFormatFunc=""  />
							<#assign material_productName_displayDefaultType=''>
								<#assign material_productName_defaultValue=''>
										<#assign material_productName_defaultValue=''>
																	<#if (material_productName_defaultValue!)?string=="currentUser">
								<#assign material_productName_defaultValue='${staffJson!}'>
							<#elseif (material_productName_defaultValue!)?string=="currentPost">
								<#assign material_productName_defaultValue='${postJson!}'>
							<#elseif (material_productName_defaultValue!)?string=="currentDepart">
								<#assign material_productName_defaultValue='${deptJson!}'>
							<#elseif (material_productName_defaultValue!)?string=="currentComp">
								<#assign material_productName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="material.productName"        showFormat="TEXT" defaultValue="${(material_productName_defaultValue!)?string}" defaultDisplay="${(material_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.manulOrder.manulOrderMain.manulOrdersView"  textalign="left"  viewUrl="/MESBasic/product/product/customRef.action" viewCode="MESBasic_1_product_customRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" width=50 showFormatFunc=""  />
							<#assign ablePass_displayDefaultType=''>
								<#assign ablePass_defaultValue=''>
										<#assign ablePass_defaultValue=''>
										 
									<@datacolumn key="ablePass"        showFormat="CHECKBOX" defaultValue="${(ablePass_defaultValue!)?string}" defaultDisplay="${(ablePass_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1563254591438')}" width=100 showFormatFunc=""  />
							<#assign ware_wareName_displayDefaultType=''>
								<#assign ware_wareName_defaultValue=''>
										<#assign ware_wareName_defaultValue=''>
																	<#if (ware_wareName_defaultValue!)?string=="currentUser">
								<#assign ware_wareName_defaultValue='${staffJson!}'>
							<#elseif (ware_wareName_defaultValue!)?string=="currentPost">
								<#assign ware_wareName_defaultValue='${postJson!}'>
							<#elseif (ware_wareName_defaultValue!)?string=="currentDepart">
								<#assign ware_wareName_defaultValue='${deptJson!}'>
							<#elseif (ware_wareName_defaultValue!)?string=="currentComp">
								<#assign ware_wareName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="ware.wareName"        showFormat="SELECTCOMP" defaultValue="${(ware_wareName_defaultValue!)?string}" defaultDisplay="${(ware_wareName_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.manulOrder.manulOrderMain.manulOrdersView"  textalign="left"  viewUrl="/MESBasic/wareMan/ware/wareRef.action" viewCode="MESBasic_1_wareMan_wareRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  label="${getText('WOM.propertyshowName.randon1563348308936.flag')}" width=100 showFormatFunc=""  />
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

									<@datacolumn key="ware.wareCode"        showFormat="TEXT" defaultValue="${(ware_wareCode_defaultValue!)?string}" defaultDisplay="${(ware_wareCode_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.manulOrder.manulOrderMain.manulOrdersView"  textalign="left"  viewUrl="/MESBasic/wareMan/ware/wareRef.action" viewCode="MESBasic_1_wareMan_wareRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" width=100 showFormatFunc=""  />
							<#assign unit_name_displayDefaultType=''>
								<#assign unit_name_defaultValue=''>
										<#assign unit_name_defaultValue=''>
																	<#if (unit_name_defaultValue!)?string=="currentUser">
								<#assign unit_name_defaultValue='${staffJson!}'>
							<#elseif (unit_name_defaultValue!)?string=="currentPost">
								<#assign unit_name_defaultValue='${postJson!}'>
							<#elseif (unit_name_defaultValue!)?string=="currentDepart">
								<#assign unit_name_defaultValue='${deptJson!}'>
							<#elseif (unit_name_defaultValue!)?string=="currentComp">
								<#assign unit_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="unit.name"        showFormat="SELECTCOMP" defaultValue="${(unit_name_defaultValue!)?string}" defaultDisplay="${(unit_name_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.manulOrder.manulOrderMain.manulOrdersView"  textalign="left"  viewUrl="/X6Basic/unitGroup/baseUnit/unitRef.action" viewCode="X6Basic_1.0_unitGroup_unitRef" mneenable=false crossCompany=false viewTitle="${getText('X6Basic.viewtitle.radion1398240433147')}"  label="${getText('X6Basic.propertydisplayName.radion1398235640483')}" width=100 showFormatFunc=""  />
							<#assign needNumber_displayDefaultType=''>
								<#assign needNumber_defaultValue=''>
										<#assign needNumber_defaultValue=''>
										 
									<@datacolumn key="needNumber"        showFormat="TEXT" defaultValue="${(needNumber_defaultValue!)?string}" defaultDisplay="${(needNumber_displayDefaultType!)?string}" decimal="3" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1563254572747')}" width=100 showFormatFunc=""  />
							<#assign materialBatchNum_displayDefaultType=''>
								<#assign materialBatchNum_defaultValue=''>
										<#assign materialBatchNum_defaultValue=''>
										 
									<@datacolumn key="materialBatchNum"        showFormat="TEXT" defaultValue="${(materialBatchNum_defaultValue!)?string}" defaultDisplay="${(materialBatchNum_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1563254620511')}" width=100 showFormatFunc=""  />
							<#assign edition_displayDefaultType=''>
								<#assign edition_defaultValue=''>
										<#assign edition_defaultValue=''>
										 
									<@datacolumn key="edition"        showFormat="TEXT" defaultValue="${(edition_defaultValue!)?string}" defaultDisplay="${(edition_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1563254644099')}" width=100 showFormatFunc=""  />
							<#assign coOperation_displayDefaultType=''>
								<#assign coOperation_defaultValue=''>
										<#assign coOperation_defaultValue=''>
										 
									<@datacolumn key="coOperation"        showFormat="CHECKBOX" defaultValue="${(coOperation_defaultValue!)?string}" defaultDisplay="${(coOperation_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertyshowName.randon1568163535873.flag')}" width=100 showFormatFunc=""  />
							<#assign rsNUM_displayDefaultType=''>
								<#assign rsNUM_defaultValue=''>
										<#assign rsNUM_defaultValue=''>
										 
									<@datacolumn key="rsNUM"        showFormat="TEXT" defaultValue="${(rsNUM_defaultValue!)?string}" defaultDisplay="${(rsNUM_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1565685798260')}" width=100 showFormatFunc=""  />
							<#assign rsPOS_displayDefaultType=''>
								<#assign rsPOS_defaultValue=''>
										<#assign rsPOS_defaultValue=''>
										 
									<@datacolumn key="rsPOS"        showFormat="TEXT" defaultValue="${(rsPOS_defaultValue!)?string}" defaultDisplay="${(rsPOS_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1565685818679')}" width=100 showFormatFunc=""  />
			
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
				function ManulOrderMaterial_dg1568964886993_check_datagridvalid(){
					//
					var errorObj =ManulOrderMaterial_dg1568964886993Widget._DT.testData();
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
				
				function savedg1568964886993DataGrid(){
					<#if  refId?? && (refId gt 0)>
					ManulOrderMaterial_dg1568964886993Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('ManulOrderMaterial_dg1568964886993Widget') > -1) {
						ManulOrderMaterial_dg1568964886993Widget.setAllRowEdited();
					}
					var json = ManulOrderMaterial_dg1568964886993Widget.parseEditedData();
					$('input[name="dg1568964886993ListJson"]').remove();
					$('input[name="dgLists[\'dg1568964886993\']"]').remove();
					$('input[name="dg1568964886993ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1568964886993\']">').val(json).appendTo($('#WOM_manulOrder_manulOrderMain_manulOrdersView_form'));
					$('<input type="hidden" name="dg1568964886993ModelCode">').val('WOM_7.5.0.0_manulOrder_ManulOrderMaterial').appendTo($('#WOM_manulOrder_manulOrderMain_manulOrdersView_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1568964886993ListJson">').val(json).appendTo($('#WOM_manulOrder_manulOrderMain_manulOrdersView_form'));
				}
				function DT_ManulOrderMaterial_dg1568964886993_deldatagrid(){
					var deleteRows = ManulOrderMaterial_dg1568964886993Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','unit.id','manulOrderId.id','material.id','ware.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1568964886993DeletedIds").length>0){
							$("#dg1568964886993DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1568964886993DeletedIds" name="dgDeletedIds[\'dg1568964886993\']" value="'+tepID+'">').appendTo(CUI('#WOM_manulOrder_manulOrderMain_manulOrdersView_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1568964886993DeletedIds['+CUI('input[name^="dg1568964886993DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_manulOrder_manulOrderMain_manulOrdersView_form'));
					});
					return deleteRows;
				}
				function DT_ManulOrderMaterial_dg1568964886993_delTreeNodes(){
					var deleteRows = ManulOrderMaterial_dg1568964886993Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','unit.id','manulOrderId.id','material.id','ware.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1568964886993DeletedIds").length>0){
							$("#dg1568964886993DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1568964886993DeletedIds" name="dgDeletedIds[\'dg1568964886993\']" value="'+tepID+'">').appendTo(CUI('#WOM_manulOrder_manulOrderMain_manulOrdersView_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1568964886993DeletedIds['+CUI('input[name^="dg1568964886993DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_manulOrder_manulOrderMain_manulOrdersView_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('WOM_manulOrder_manulOrderMain_manulOrdersView_datagrids');
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
							if(datagrids[0][i] == 'ManulOrderMaterial_dg1568964886993') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'ManulOrderMaterial_dg1568964886993';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'ManulOrderMaterial_dg1568964886993';
					}
					$('body').data('WOM_manulOrder_manulOrderMain_manulOrdersView_datagrids', datagrids);
				});
				
				var ManulOrderMaterial_dg1568964886993_importDialog = null;
				function ManulOrderMaterial_dg1568964886993_showImportDialog(){
					try{
						if(ManulOrderMaterial_dg1568964886993_importDialog!=null&&ManulOrderMaterial_dg1568964886993_importDialog.isShow==1){
							return false;
						}
						var url = "/WOM/manulOrder/manulOrderMain/initImport.action?datagridCode=WOM_7.5.0.0_manulOrder_manulOrdersViewdg1568964886993&tid=${id!}&datagridName=dg1568964886993";
							<#if canImportExcel>
								var buttonCode="WOM_7.5.0.0_manulOrder_manulOrdersViewdg1568964886993_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						ManulOrderMaterial_dg1568964886993_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("ManulOrderMaterial_dg1568964886993"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();ManulOrderMaterial_dg1568964886993_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();ManulOrderMaterial_dg1568964886993_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						ManulOrderMaterial_dg1568964886993_importDialog.show();
					}catch(e){}
				}	
				
				function ManulOrderMaterial_dg1568964886993_downLoadFile(){
					var url = "/WOM/manulOrder/manulOrderMain/downLoad.action?datagridCode=WOM_7.5.0.0_manulOrder_manulOrdersViewdg1568964886993&templateRelatedModelCode=WOM_7.5.0.0_manulOrder_manulOrdersViewdg1568964886993&downloadType=template&fileName=dg1568964886993";
					window.open(url,"","");
				}
				function dg1568964886993RenderOverEvent(){
				}
				function dg1568964886993PageInitMethod(nTabIndex){
					WOM.manulOrder.manulOrderMain.manulOrdersView.initSize(nTabIndex);
				}
			</script>
			
			

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
     	
		<div id="WOM_manulOrder_manulOrderMain_manulOrdersView_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="WOM.manulOrder.manulOrderMain.manulOrdersView.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<div id="fileUploadDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_manulOrder_manulOrdersView,html,WOM_7.5.0.0_manulOrder_ManulOrderMain,WOM_7.5.0.0) -->
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
						$("#WOM_manulOrder_manulOrderMain_manulOrdersView_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#WOM_manulOrder_manulOrderMain_manulOrdersView_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#WOM_manulOrder_manulOrderMain_manulOrdersView_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#WOM_manulOrder_manulOrderMain_manulOrdersView_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			WOM.manulOrder.manulOrderMain.manulOrdersView.initCount = 0;
			WOM.manulOrder.manulOrderMain.manulOrdersView.initSize = function(nTabIndex){
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
				var conHeight = h-$("#WOM_manulOrder_manulOrderMain_manulOrdersView_main_div .edit-head").height()-$("#WOM_manulOrder_manulOrderMain_manulOrdersView_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#WOM_manulOrder_manulOrderMain_manulOrdersView_main_div .edit-workflow").height()</#if>;
				$("#WOM_manulOrder_manulOrderMain_manulOrdersView_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('WOM_manulOrder_manulOrderMain_manulOrdersView_datagrids');
				var padding_bottom=16;
				$("#WOM_manulOrder_manulOrderMain_manulOrdersView_main_div .pd_bottom,#WOM_manulOrder_manulOrderMain_manulOrdersView_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#WOM_manulOrder_manulOrderMain_manulOrdersView_main_div .edit-panes-s").each(function(index){
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
									if(WOM.manulOrder.manulOrderMain.manulOrdersView.initCount <= 2) {
										setTimeout(function(){WOM.manulOrder.manulOrderMain.manulOrdersView.initSize();}, 200);
										WOM.manulOrder.manulOrderMain.manulOrdersView.initCount++;
									}/* else {
										WOM.manulOrder.manulOrderMain.manulOrdersView.initCount = 0;
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
							if(($("#WOM_manulOrder_manulOrderMain_manulOrdersView_main_div .edit-workflow").length > 0) && ($("#WOM_manulOrder_manulOrderMain_manulOrdersView_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				$('#WOM_manulOrder_manulOrderMain_manulOrdersView_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				WOM.manulOrder.manulOrderMain.manulOrdersView.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				WOM.manulOrder.manulOrderMain.manulOrdersView.initSize();
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
						if(parseInt($("#WOM_manulOrder_manulOrderMain_manulOrdersView_main_div").css("width"),10)==650){
							$("#WOM_manulOrder_manulOrderMain_manulOrdersView_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//WOM.manulOrder.manulOrderMain.manulOrdersView.resizeLayout();
						//WOM.manulOrder.manulOrderMain.manulOrdersView.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#WOM_manulOrder_manulOrderMain_manulOrdersView_main_div").css("width"),10)==800){
							$("#WOM_manulOrder_manulOrderMain_manulOrdersView_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//WOM.manulOrder.manulOrderMain.manulOrdersView.resizeLayout();
						//WOM.manulOrder.manulOrderMain.manulOrdersView.initSize();
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
					WOM.manulOrder.manulOrderMain.manulOrdersView.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					WOM.manulOrder.manulOrderMain.manulOrdersView.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){WOM.manulOrder.manulOrderMain.manulOrdersView.initSize();});
				/*
				WOM.manulOrder.manulOrderMain.manulOrdersView.resizeLayout=function(){
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

		WOM.manulOrder.manulOrderMain.manulOrdersView.validate = function(){
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
		WOM.manulOrder.manulOrderMain.manulOrdersView.beforeSaveProcess = function(){
			$('input[name="manulOrderMain.extraCol"]').remove();
		}
		WOM.manulOrder.manulOrderMain.manulOrdersView.processDataGrid = function(){
										<#if false && isIE>
										$('#WOM_manulOrder_manulOrderMain_manulOrdersView_form').append(ManulOrderMaterial_dg1568964886993Widget._DT.createInputs('dg1568964886993List'));
										</#if>
		};
		WOM.manulOrder.manulOrderMain.manulOrdersView.save = function(){
			$('#operateType').val("submit");
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!WOM.manulOrder.manulOrderMain.manulOrdersView.validate()){return;}
			//延迟到延迟提交中处理,解决onchange事件无法触发问题
			//WOM.manulOrder.manulOrderMain.manulOrdersView.beforeSaveProcess();

			//WOM.manulOrder.manulOrderMain.manulOrdersView.processDataGrid();
			$('#WOM_manulOrder_manulOrderMain_manulOrdersView_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('WOM_manulOrder_manulOrderMain_manulOrdersView_form','WOM_manulOrder_manulOrderMain_manulOrdersView_datagrids')) {      
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
		WOM.manulOrder.manulOrderMain.manulOrdersView.print = function(){
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
		
		WOM.manulOrder.manulOrderMain.manulOrdersView.saveSetting = function(){
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
		
		WOM.manulOrder.manulOrderMain.manulOrdersView.printSetting = function(){
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
				WOM.manulOrder.manulOrderMain.manulOrdersView.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(WOM.manulOrder.manulOrderMain.manulOrdersView.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				WOM.manulOrder.manulOrderMain.manulOrdersView.settingDialog.show();
			}
		}
		
		
		WOM.manulOrder.manulOrderMain.manulOrdersView._callBackInfo = function(res){
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
 						window.opener.WOM.manulOrder.manulOrderMain.editCallBackInfo(res); 						
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
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.WOM.manulOrder.manulOrderMain.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
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
				WOM.manulOrder.manulOrderMain.manulOrdersView._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				WOM.manulOrder.manulOrderMain.manulOrdersView._isObjCustomProp_IE = isObjCustomProp;
			} else {
				WOM.manulOrder.manulOrderMain.manulOrdersView._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				WOM.manulOrder.manulOrderMain.manulOrdersView._objCustomPropNames_IE = objCustomPropNames;
			} else {
				WOM.manulOrder.manulOrderMain.manulOrdersView._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				WOM.manulOrder.manulOrderMain.manulOrdersView._refViewCode_IE = viewCode;
			} else {
				WOM.manulOrder.manulOrderMain.manulOrdersView._refViewCode_IE = '';
			}
			WOM.manulOrder.manulOrderMain.manulOrdersView._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		WOM.manulOrder.manulOrderMain.manulOrdersView.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			WOM.manulOrder.manulOrderMain.manulOrdersView._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			WOM.manulOrder.manulOrderMain.manulOrdersView._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			WOM.manulOrder.manulOrderMain.manulOrdersView.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			WOM.manulOrder.manulOrderMain.manulOrdersView._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				WOM.manulOrder.manulOrderMain.manulOrdersView._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		WOM.manulOrder.manulOrderMain.manulOrdersView._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(WOM.manulOrder.manulOrderMain.manulOrdersView._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(WOM.manulOrder.manulOrderMain.manulOrdersView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				WOM.manulOrder.manulOrderMain.manulOrdersView.gridEventObj = gridEventObj;
				callbackName = "WOM.manulOrder.manulOrderMain.manulOrdersView.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "WOM.manulOrder.manulOrderMain.manulOrdersView.getMultiselectCallBackInfo_DG" : "WOM.manulOrder.manulOrderMain.manulOrdersView.getcallBackInfo_DG";
				WOM.manulOrder.manulOrderMain.manulOrdersView._currRow = $(obj).closest('tr')[0];
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="WOM.manulOrder.manulOrderMain.manulOrdersView.getcallBackInfo";
			}

			if(_prefix!=''){
				WOM.manulOrder.manulOrderMain.manulOrdersView._prefix = _prefix.substring(1);
			}
			
			WOM.manulOrder.manulOrderMain.manulOrdersView._oGrid = oGrid;
			WOM.manulOrder.manulOrderMain.manulOrdersView._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					WOM.manulOrder.manulOrderMain.manulOrdersView._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					WOM.manulOrder.manulOrderMain.manulOrdersView._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					WOM.manulOrder.manulOrderMain.manulOrdersView._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					WOM.manulOrder.manulOrderMain.manulOrdersView._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					WOM.manulOrder.manulOrderMain.manulOrdersView._refViewCode = oColumn.viewCode;
				} else {
					WOM.manulOrder.manulOrderMain.manulOrdersView._refViewCode = '';
				}
			} else {
				WOM.manulOrder.manulOrderMain.manulOrdersView._isObjCustomProp = false;
				WOM.manulOrder.manulOrderMain.manulOrdersView._objCustomPropNames = '';
				WOM.manulOrder.manulOrderMain.manulOrdersView._refViewCode = '';
			}
			if (WOM.manulOrder.manulOrderMain.manulOrdersView._isObjCustomProp == true && WOM.manulOrder.manulOrderMain.manulOrdersView._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				WOM.manulOrder.manulOrderMain.manulOrdersView._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				WOM.manulOrder.manulOrderMain.manulOrdersView._customCallBack = customCallBack;
			}
			if(WOM.manulOrder.manulOrderMain.manulOrdersView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.manulOrder.manulOrderMain.manulOrdersView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof WOM.manulOrder.manulOrderMain.manulOrdersView._querycustomFuncN == "function") {
				refparam += WOM.manulOrder.manulOrderMain.manulOrdersView._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			WOM.manulOrder.manulOrderMain.manulOrdersView._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.manulOrder.manulOrderMain.manulOrdersView._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(WOM.manulOrder.manulOrderMain.manulOrdersView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.manulOrder.manulOrderMain.manulOrdersView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			WOM.manulOrder.manulOrderMain.manulOrdersView._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'WOM.manulOrder.manulOrderMain.manulOrdersView.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.manulOrder.manulOrderMain.manulOrdersView._querycustomFunc = function(obj) {
			var str = eval("typeof(WOM.manulOrder.manulOrderMain.manulOrdersView.query_"+obj+")!='undefined'") ? eval('WOM.manulOrder.manulOrderMain.manulOrdersView.query_'+obj+'()') : null;
			return str;
		};
		WOM.manulOrder.manulOrderMain.manulOrdersView.getcallBackGroupInfo = function(obj){
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
			WOM.manulOrder.manulOrderMain.manulOrdersView._dialog.close();
		}
		WOM.manulOrder.manulOrderMain.manulOrdersView.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('WOM_manulOrder_manulOrderMain_manulOrdersView_form',obj[0], WOM.manulOrder.manulOrderMain.manulOrdersView._prefix, WOM.manulOrder.manulOrderMain.manulOrdersView._sUrl);
			CUI.commonFills('WOM_manulOrder_manulOrderMain_manulOrdersView_form',WOM.manulOrder.manulOrderMain.manulOrdersView._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (WOM.manulOrder.manulOrderMain.manulOrdersView._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(WOM.manulOrder.manulOrderMain.manulOrdersView._customCallBack) {
					eval(WOM.manulOrder.manulOrderMain.manulOrdersView._customCallBack);
					WOM.manulOrder.manulOrderMain.manulOrdersView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.manulOrder.manulOrderMain.manulOrdersView._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		WOM.manulOrder.manulOrderMain.manulOrdersView.getcallBackInfo_DG_IE = function(obj){
			if(WOM.manulOrder.manulOrderMain.manulOrdersView._customBeforeCallBack) {
				var flag = eval(WOM.manulOrder.manulOrderMain.manulOrdersView._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = WOM.manulOrder.manulOrderMain.manulOrdersView.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( WOM.manulOrder.manulOrderMain.manulOrdersView._isObjCustomProp_IE == true && WOM.manulOrder.manulOrderMain.manulOrdersView._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,WOM.manulOrder.manulOrderMain.manulOrdersView._sUrl,WOM.manulOrder.manulOrderMain.manulOrdersView._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,WOM.manulOrder.manulOrderMain.manulOrdersView._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (WOM.manulOrder.manulOrderMain.manulOrdersView._isObjCustomProp_IE == true && WOM.manulOrder.manulOrderMain.manulOrdersView._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = WOM.manulOrder.manulOrderMain.manulOrdersView._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = WOM.manulOrder.manulOrderMain.manulOrdersView._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && WOM.manulOrder.manulOrderMain.manulOrdersView._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + WOM.manulOrder.manulOrderMain.manulOrdersView._refViewCode_IE + '&id=' + id,
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
				if(WOM.manulOrder.manulOrderMain.manulOrdersView._customCallBack) {
					eval(WOM.manulOrder.manulOrderMain.manulOrdersView._customCallBack);
					WOM.manulOrder.manulOrderMain.manulOrdersView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.manulOrder.manulOrderMain.manulOrdersView._dialog.close();
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
		
		WOM.manulOrder.manulOrderMain.manulOrdersView.getcallBackInfo_DG = function(obj){
			if(WOM.manulOrder.manulOrderMain.manulOrdersView._customBeforeCallBack) {
				var flag = eval(WOM.manulOrder.manulOrderMain.manulOrdersView._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(WOM.manulOrder.manulOrderMain.manulOrdersView._currRow).next().length==0){
						WOM.manulOrder.manulOrderMain.manulOrdersView._oGrid.addNewRow();
					}	
					WOM.manulOrder.manulOrderMain.manulOrdersView._currRow = $(WOM.manulOrder.manulOrderMain.manulOrdersView._currRow).next();
					$(WOM.manulOrder.manulOrderMain.manulOrdersView._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(WOM.manulOrder.manulOrderMain.manulOrdersView._currRow,obj[i], WOM.manulOrder.manulOrderMain.manulOrdersView._prefix, WOM.manulOrder.manulOrderMain.manulOrdersView._sUrl);
				if (WOM.manulOrder.manulOrderMain.manulOrdersView._isObjCustomProp == true && WOM.manulOrder.manulOrderMain.manulOrdersView._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(WOM.manulOrder.manulOrderMain.manulOrdersView._currRow,WOM.manulOrder.manulOrderMain.manulOrdersView._prefix,obj[i],WOM.manulOrder.manulOrderMain.manulOrdersView._oGrid,WOM.manulOrder.manulOrderMain.manulOrdersView._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(WOM.manulOrder.manulOrderMain.manulOrdersView._currRow,WOM.manulOrder.manulOrderMain.manulOrdersView._prefix,obj[i],WOM.manulOrder.manulOrderMain.manulOrdersView._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + WOM.manulOrder.manulOrderMain.manulOrdersView._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + WOM.manulOrder.manulOrderMain.manulOrdersView._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && WOM.manulOrder.manulOrderMain.manulOrdersView._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + WOM.manulOrder.manulOrderMain.manulOrdersView._refViewCode + '&id=' + id,
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
									name = WOM.manulOrder.manulOrderMain.manulOrdersView._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(WOM.manulOrder.manulOrderMain.manulOrdersView._currRow, objs, WOM.manulOrder.manulOrderMain.manulOrdersView._oGrid);
							}
						}
					}
				}
			}
			try{
				if(WOM.manulOrder.manulOrderMain.manulOrdersView._customCallBack) {
					eval(WOM.manulOrder.manulOrderMain.manulOrdersView._customCallBack);
					WOM.manulOrder.manulOrderMain.manulOrdersView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.manulOrder.manulOrderMain.manulOrdersView._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + WOM.manulOrder.manulOrderMain.manulOrdersView._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		WOM.manulOrder.manulOrderMain.manulOrdersView.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(WOM.manulOrder.manulOrderMain.manulOrdersView._oGrid, WOM.manulOrder.manulOrderMain.manulOrdersView._currRow, WOM.manulOrder.manulOrderMain.manulOrdersView._key, WOM.manulOrder.manulOrderMain.manulOrdersView._displayFieldName, obj[i])
			}
			try{
				if(WOM.manulOrder.manulOrderMain.manulOrdersView._customCallBack) {
					eval(WOM.manulOrder.manulOrderMain.manulOrdersView._customCallBack);
					WOM.manulOrder.manulOrderMain.manulOrdersView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.manulOrder.manulOrderMain.manulOrdersView._dialog.close();
			} catch(e){}
		};
		
		WOM.manulOrder.manulOrderMain.manulOrdersView.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						WOM.manulOrder.manulOrderMain.manulOrdersView.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#WOM_manulOrder_manulOrderMain_manulOrdersView_form'));
						}
					}
				}
			});
		};

		$(function(){
			WOM.manulOrder.manulOrderMain.manulOrdersView.onloadForProduct();
		});

		WOM.manulOrder.manulOrderMain.manulOrdersView.beforeSubmitMethodSettingInPage = function(){
			WOM.manulOrder.manulOrderMain.manulOrdersView.onsaveForProduct();
		};
		WOM.manulOrder.manulOrderMain.manulOrdersView.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  WOM.manulOrder.manulOrderMain.manulOrdersView.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		WOM.manulOrder.manulOrderMain.manulOrdersView.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#WOM_manulOrder_manulOrderMain_manulOrdersView_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#WOM_manulOrder_manulOrderMain_manulOrdersView_main_div").hide();
				},100);
				//CUI("#WOM_manulOrder_manulOrderMain_manulOrdersView_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		WOM.manulOrder.manulOrderMain.manulOrdersView.showThis = function(){
			if(!CUI("#WOM_manulOrder_manulOrderMain_manulOrdersView_main_div").is(':visible')) {
				CUI("#WOM_manulOrder_manulOrderMain_manulOrdersView_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		WOM.manulOrder.manulOrderMain.manulOrdersView.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			WOM.manulOrder.manulOrderMain.manulOrdersView.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "WOM_manulOrder_manulOrderMain_manulOrdersView_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=WOM&modelName=WOM_7.5.0.0_manulOrder_ManulOrderMain&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.manulOrder.manulOrderMain.manulOrdersView.auditDialog.show();
			</#if>
		}
		
		
		WOM.manulOrder.manulOrderMain.manulOrdersView.showInfoDialog=function(mode){
			
			WOM.manulOrder.manulOrderMain.manulOrdersView.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "WOM_manulOrder_manulOrderMain_manulOrdersView_dealInfo",
				modal:true,
				height:500,
				width: 950,//适应国际化版
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.manulOrder.manulOrderMain.manulOrdersView.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		WOM.manulOrder.manulOrderMain.manulOrdersView.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			<#if pendingId??>
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=WOM_7.5.0.0_manulOrder");
			<#else>
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?readOnlyFlag=true&linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=WOM_7.5.0.0_manulOrder");
			</#if>
			}
		}
		
		WOM.manulOrder.manulOrderMain.manulOrdersView.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/WOM/manulOrder/manulOrderMain/dealInfo-list.action&dlTableInfoId=${(manulOrderMain.tableInfoId)?default('')}");
			}
		}
		WOM.manulOrder.manulOrderMain.manulOrdersView.showFlowInfo=function(){
		     //IE8环境下使用旧版flash流程展现页面，其他情况使用html5流程展现页面
		    var browser=navigator.appName; 
			var b_version=navigator.appVersion; 
			var version=b_version.split(";"); 
			var trim_Version=version[1]&&version[1].replace(/[ ]/g,"");
			var isIE8=(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE8.0")||($.browser.msie&&(Number($.browser.version)<= 8));//IE8兼容视图模式下浏览器版本判断逻辑补充
			if(CUI.trim(CUI("#flowDiv").html())==""){
				if(isIE8){
				    CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=WOM_7.5.0.0_manulOrder_ManulOrderMain&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(manulOrderMain.tableInfoId)?default('')}");
				}else{
				    CUI("#flowDiv").load("/ec/workflow/flowViewH5.action?env=runtime&modelCode=WOM_7.5.0.0_manulOrder_ManulOrderMain&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(manulOrderMain.tableInfoId)?default('')}");
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
		WOM.manulOrder.manulOrderMain.manulOrdersView.supervision=function(){
			WOM.manulOrder.manulOrderMain.manulOrdersView.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(manulOrderMain.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				WOM.manulOrder.manulOrderMain.manulOrdersView.modifyOwnerStaffDialog.show();
		}
		



		/* CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_manulOrder_manulOrdersView,js,WOM_7.5.0.0_manulOrder_ManulOrderMain,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		WOM.manulOrder.manulOrderMain.manulOrdersView.onloadForProduct = function(){
		/* CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_manulOrder_manulOrdersView,onloadForProduct,WOM_7.5.0.0_manulOrder_ManulOrderMain,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		}

		WOM.manulOrder.manulOrderMain.manulOrdersView.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_manulOrder_manulOrdersView,onsaveForProduct,WOM_7.5.0.0_manulOrder_ManulOrderMain,WOM_7.5.0.0) */
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
				<div class="sidebar-top"><a href="#"  onclick="WOM.manulOrder.manulOrderMain.manulOrdersView.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="WOM.manulOrder.manulOrderMain.manulOrdersView.showBusinessList('${l.relatingModel.code.replace('.','')}',${(manulOrderMain.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
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