<!-- WOM_7.5.0.0/batchingMaterial/batchMaterialView -->
<#assign isWorkflow = true> 
<#assign isAttachment = true> 
	<#assign fileuploadType = "Table">
	<#assign fileuploadLinkId = batchingMaterialPart.tableInfoId!>
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
<#assign tableObj = batchingMaterialPart>
<#-- 命名空间 -->
<#assign editPageNs = "WOM.batchingMaterial.batchingMaterialPart.batchMaterialView">
<#-- 模型名称-->
<#assign modelName = "batchingMaterialPart">
<#-- 视图编码-->
<#assign viewCode = "WOM_7.5.0.0_batchingMaterial_batchMaterialView">
<#-- 实体编码-->
<#assign entity_code = "WOM_7.5.0.0_batchingMaterial">
<#-- 视图名称-->
<#assign viewName = "batchMaterialView">
<#-- datagrid编码-->
<#assign datagridCode = "WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_datagrids">
<#-- 首字母大写的模型名称-->
<#assign upcaseModelName = "BatchingMaterialPart">
<#-- 页面打印按钮 -->
<#assign isPrint = true>
<#-- 控件打印按钮 -->
<#assign controlPrint = true>
<#-- 是否只读 -->
<#assign allReadOnly = true>
<#-- 是否是参照视图 -->
<#assign isReference =false>
<#-- 是否可弃审 -->
<#assign retrialFlag = false>
<#-- formid -->
<#assign editFormId = "WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form">
<#-- 待办状态 -->
<#assign pendingstatus =( batchingMaterialPart.pending.taskDescription)!>
<#-- 打印控件名称 -->
<#assign controlName = "WOM.viewcontrolName.randon1491995866567">
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
        <#assign configTitle = getText('WOM.viewtitle.randon1491994052949')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		
		#WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form{float:left;width:100%;}
		
		
		</style>
		<script type="text/javascript">
			CUI.ns('WOM.batchingMaterial.batchingMaterialPart.batchMaterialView');
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.currentUser = ${userJson};
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.currentStaff = ${staffJson};
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.currentDepartment = ${deptJson};
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.currentPosition = ${postJson};
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.currentCompany = ${compJson};
		</script>
		<!-- CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_batchingMaterial_batchMaterialView,head,WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
    </head>
	<body class="view-edit ">
		<@loadpanel newType=true/>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="batchingMaterialPart.headId.id,batchingMaterialPart.productId.id,batchingMaterialPart.storeID.id,batchingMaterialPart.exeStaff.id,batchingMaterialPart.wareID.id," onsubmitMethod="WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.beforeSubmitMethod()" id="WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form" namespace="/WOM/batchingMaterial/batchingMaterialPart/batchMaterialView" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart&_bapFieldPermissonModelName_=BatchingMaterialPart" editPageNs="WOM.batchingMaterial.batchingMaterialPart.batchMaterialView" callback="WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._callBackInfo" ecform="true">
			<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
			<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_main_div">
			<div class="edit-head">
				<#include "../../../ec/tableInfo/operateheadbar_all.ftl" >
				<#include "../../../ec/tableInfo/creatorInfo.ftl" >
			</div>
    		<div class="edit-main" id="WOM_batchingMaterial_batchingMaterialPart_batchMaterialView">
    			<div class="edit-content">
    	<#include "../../../ec/tableInfo/formparam.ftl" >				
					<input type="hidden" name="batchingMaterialPart.headId.id" value="${(batchingMaterialPart.headId.id)!""}" originalvalue="${(batchingMaterialPart.headId.id)!""}"/>
					<input type="hidden" name="batchingMaterialPart.productId.id" value="${(batchingMaterialPart.productId.id)!""}" originalvalue="${(batchingMaterialPart.productId.id)!""}"/>
					<input type="hidden" name="batchingMaterialPart.storeID.id" value="${(batchingMaterialPart.storeID.id)!""}" originalvalue="${(batchingMaterialPart.storeID.id)!""}"/>
					<input type="hidden" name="batchingMaterialPart.exeStaff.id" value="${(batchingMaterialPart.exeStaff.id)!""}" originalvalue="${(batchingMaterialPart.exeStaff.id)!""}"/>
					<input type="hidden" name="batchingMaterialPart.wareID.id" value="${(batchingMaterialPart.wareID.id)!""}" originalvalue="${(batchingMaterialPart.wareID.id)!""}"/>
		<div class="dash-line"></div>
<script type="text/javascript">
var attcountid = "WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form"+"_attcount";
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
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:22%'></td><td style='height:0px;border:none;width:25%'></td><td style='height:0px;border:none;width:22%'></td><td style='height:0px;border:none;width:25%'></td></tr>
		<tr >
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.staff.dimissionStaff_xls.staffName0001')}" >${getText('WOM.staff.dimissionStaff_xls.staffName0001')}</label>
				</td>
				
						<#assign batchingMaterialPart_exeStaff_name_defaultValue  = 'currentUser'>
												<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.view.reference')}" viewType="readonly" deValue="${batchingMaterialPart_exeStaff_name_defaultValue!}" conditionfunc="WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._querycustomFunc('batchingMaterialPart_exeStaff_name')" view=true  value="${(batchingMaterialPart.exeStaff.name)!}" displayFieldName="name" name="batchingMaterialPart.exeStaff.name" id="batchingMaterialPart_exeStaff_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form" editCustomCallback=";" refViewCode="sysbase_1.0_staff_ref" onkeyupfuncname=";_callback_batchingMaterialPart_exeStaff_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (batchingMaterialPart_exeStaff_name_defaultValue)=='currentUser'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.id}'};
											obj = foundation.common.getObject('WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form',obj, 'batchingMaterialPart.exeStaff', '/foundation/staff/common/staffListFrameset.action');
											CUI.commonFills('WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form', 'batchingMaterialPart.exeStaff',obj,true);
											$('input:hidden[name="batchingMaterialPart.exeStaff.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(batchingMaterialPart.id)?? && (batchingMaterialPart.exeStaff.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${batchingMaterialPart.exeStaff.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form',obj, 'batchingMaterialPart.exeStaff', '/foundation/staff/common/staffListFrameset.action');
												CUI.commonFills('WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form', 'batchingMaterialPart.exeStaff',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1491790496671')}" >${getText('WOM.propertydisplayName.randon1491790496671')}</label>
				</td>
				
						<#assign batchingMaterialPart_exeDate_defaultValue  = 'currentTime'>
							 					<#if (batchingMaterialPart_exeDate_defaultValue)?? &&(batchingMaterialPart_exeDate_defaultValue)?has_content>
							<#assign batchingMaterialPart_exeDate_defaultValue  = getDefaultDateTime(batchingMaterialPart_exeDate_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  align="left" style="text-align: left;;" >
					
							
							<#if newObj && !(batchingMaterialPart.exeDate)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="batchingMaterialPart.exeDate" value="${batchingMaterialPart_exeDate_defaultValue!}" type="dateTime"  id="batchingMaterialPart.exeDate"  view=true cssStyle=""   align="left"/>
								
							<#else>
							<#if (batchingMaterialPart.exeDate)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="batchingMaterialPart.exeDate" value="${batchingMaterialPart.exeDate?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="batchingMaterialPart.exeDate"  view=true cssStyle="" align="left"  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="batchingMaterialPart.exeDate" value="" type="dateTime" id="batchingMaterialPart.exeDate" cssStyle=""  view=true align="left"/>
								
							</#if>
							</#if>
							
				</td>
				</tr><tr >
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion14157726448331')}" >${getText('WOM.propertydisplayName.radion14157726448331')}</label>
				</td>
				
						<#assign batchingMaterialPart_productId_productCode_defaultValue  = ''>
														<#assign batchingMaterialPart_productId_productCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}" viewType="readonly" deValue="${batchingMaterialPart_productId_productCode_defaultValue!}" conditionfunc="WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._querycustomFunc('batchingMaterialPart_productId_productCode')" view=true  value="${(batchingMaterialPart.productId.productCode)!}" displayFieldName="productCode" name="batchingMaterialPart.productId.productCode" id="batchingMaterialPart_productId_productCode" type="other" url="/MESBasic/product/product/productRefNew.action" clicked=true multiple=false mnewidth=260 formId="WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form" editCustomCallback=";" refViewCode="MESBasic_1_product_productRefNew" onkeyupfuncname=";_callback_batchingMaterialPart_productId_productCode(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(batchingMaterialPart.id)?? && (batchingMaterialPart.productId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${batchingMaterialPart.productId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form',obj, 'batchingMaterialPart.productId', '/MESBasic/product/product/productRefNew.action');
												CUI.commonFills('WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form', 'batchingMaterialPart.productId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion1415772740737334')}" >${getText('WOM.propertydisplayName.radion1415772740737334')}</label>
				</td>
				
						<#assign batchingMaterialPart_productId_productName_defaultValue  = ''>
														<#assign batchingMaterialPart_productId_productName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="batchingMaterialPart.productId.productName" id="batchingMaterialPart_productId_productName"  style=";" originalvalue="<#if !newObj || (batchingMaterialPart.productId.productName)?has_content>${(batchingMaterialPart.productId.productName?html)!}<#else>${batchingMaterialPart_productId_productName_defaultValue!}</#if>" value="<#if !newObj || (batchingMaterialPart.productId.productName)?has_content>${(batchingMaterialPart.productId.productName?html)!}<#else>${batchingMaterialPart_productId_productName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1491790594009')}" >${getText('WOM.propertydisplayName.randon1491790594009')}</label>
				</td>
				
						<#assign batchingMaterialPart_batchNum_defaultValue  = ''>
							 							<#assign batchingMaterialPart_batchNum_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="batchingMaterialPart.batchNum" id="batchingMaterialPart_batchNum"  style=";" originalvalue="<#if !newObj || (batchingMaterialPart.batchNum)?has_content>${(batchingMaterialPart.batchNum?html)!}<#else>${batchingMaterialPart_batchNum_defaultValue!}</#if>" value="<#if !newObj || (batchingMaterialPart.batchNum)?has_content>${(batchingMaterialPart.batchNum?html)!}<#else>${batchingMaterialPart_batchNum_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1491790683313')}" >${getText('WOM.propertydisplayName.randon1491790683313')}</label>
				</td>
				
						<#assign batchingMaterialPart_doneNum_defaultValue  = ''>
							 							<#assign batchingMaterialPart_doneNum_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="batchingMaterialPart.doneNum" id="batchingMaterialPart_doneNum"  style=";" originalvalue="<#if newObj&& !(batchingMaterialPart.doneNum)?has_content>${batchingMaterialPart_doneNum_defaultValue!}<#elseif (batchingMaterialPart.doneNum)?has_content>#{(batchingMaterialPart.doneNum)!; m6M6}</#if>" value="<#if newObj&& !(batchingMaterialPart.doneNum)?has_content>${batchingMaterialPart_doneNum_defaultValue!}<#elseif (batchingMaterialPart.doneNum)?has_content>#{(batchingMaterialPart.doneNum)!; m6M6}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				</tr><tr >
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1484031239867')}" >${getText('WOM.propertydisplayName.randon1484031239867')}</label>
				</td>
				
						<#assign batchingMaterialPart_wareID_wareCode_defaultValue  = ''>
														<#assign batchingMaterialPart_wareID_wareCode_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}" viewType="${viewType!}" deValue="${batchingMaterialPart_wareID_wareCode_defaultValue!}" conditionfunc="WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._querycustomFunc('batchingMaterialPart_wareID_wareCode')" view=true  value="${(batchingMaterialPart.wareID.wareCode)!}" displayFieldName="wareCode" name="batchingMaterialPart.wareID.wareCode" id="batchingMaterialPart_wareID_wareCode" type="other" url="/MESBasic/wareMan/ware/wareRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form" editCustomCallback=";" refViewCode="MESBasic_1_wareMan_wareRef" onkeyupfuncname=";_callback_batchingMaterialPart_wareID_wareCode(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(batchingMaterialPart.id)?? && (batchingMaterialPart.wareID.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${batchingMaterialPart.wareID.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form',obj, 'batchingMaterialPart.wareID', '/MESBasic/wareMan/ware/wareRef.action');
												CUI.commonFills('WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form', 'batchingMaterialPart.wareID',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1484031316283')}" >${getText('WOM.propertydisplayName.randon1484031316283')}</label>
				</td>
				
						<#assign batchingMaterialPart_wareID_wareName_defaultValue  = ''>
														<#assign batchingMaterialPart_wareID_wareName_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="batchingMaterialPart.wareID.wareName" id="batchingMaterialPart_wareID_wareName"  style=";" originalvalue="<#if !newObj || (batchingMaterialPart.wareID.wareName)?has_content>${(batchingMaterialPart.wareID.wareName?html)!}<#else>${batchingMaterialPart_wareID_wareName_defaultValue!}</#if>" value="<#if !newObj || (batchingMaterialPart.wareID.wareName)?has_content>${(batchingMaterialPart.wareID.wareName?html)!}<#else>${batchingMaterialPart_wareID_wareName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1489731651448')}" >${getText('WOM.propertydisplayName.randon1489731651448')}</label>
				</td>
				
						<#assign batchingMaterialPart_storeID_placeSetCode_defaultValue  = ''>
														<#assign batchingMaterialPart_storeID_placeSetCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('MESBasic.viewtitle.randon1489735291062')}" viewType="${viewType!}" deValue="${batchingMaterialPart_storeID_placeSetCode_defaultValue!}" conditionfunc="WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._querycustomFunc('batchingMaterialPart_storeID_placeSetCode')" view=true  value="${(batchingMaterialPart.storeID.placeSetCode)!}" displayFieldName="placeSetCode" name="batchingMaterialPart.storeID.placeSetCode" id="batchingMaterialPart_storeID_placeSetCode" type="other" url="/MESBasic/storeSet/storeSet/storeRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form" editCustomCallback=";" refViewCode="MESBasic_1_storeSet_storeRef"  onkeyupfuncname=";_callback_batchingMaterialPart_storeID_placeSetCode(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(batchingMaterialPart.id)?? && (batchingMaterialPart.storeID.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${batchingMaterialPart.storeID.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form',obj, 'batchingMaterialPart.storeID', '/MESBasic/storeSet/storeSet/storeRef.action');
												CUI.commonFills('WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form', 'batchingMaterialPart.storeID',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1489731677164')}" >${getText('WOM.propertydisplayName.randon1489731677164')}</label>
				</td>
				
						<#assign batchingMaterialPart_storeID_placeSetName_defaultValue  = ''>
														<#assign batchingMaterialPart_storeID_placeSetName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="batchingMaterialPart.storeID.placeSetName" id="batchingMaterialPart_storeID_placeSetName"  style=";" originalvalue="<#if !newObj || (batchingMaterialPart.storeID.placeSetName)?has_content>${(batchingMaterialPart.storeID.placeSetName?html)!}<#else>${batchingMaterialPart_storeID_placeSetName_defaultValue!}</#if>" value="<#if !newObj || (batchingMaterialPart.storeID.placeSetName)?has_content>${(batchingMaterialPart.storeID.placeSetName?html)!}<#else>${batchingMaterialPart_storeID_placeSetName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
		</tr>
	</table>
		<#assign cpvmInfo = ''>
			<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart", "WOM_7.5.0.0_batchingMaterial_batchMaterialView", 'EDIT')>
			<#if customPropList?? && customPropList?size gte 1>
				<table class="edit-table" style="" cellspacing="0" cellpadding="0" border="0">
				<tr>
					<td style="width:22%;"></td><td style="width:29%;"></td>
					<td style="width:22%;"></td><td style="width:29%;"></td>
				</tr>
			<tr>
				<#-- 排布自定义字段 -->
				<#assign totalspan = 0>
				<#list customPropList as c>
				<#assign cspan = (c.colspan!1)>
				<#if cspan gt 2>
					<#assign cspan = 2>
				</#if>
				<#if cspan gt 1>
					<#assign colspanVal = cspan * 2 - 1>
				</#if> 
				<#assign cp_index = c_index + totalspan>
				<#if (cp_index + 1) % 2 == 0>
					<#assign restcol = 1>
				<#else>
					<#assign restcol = 2 - (cp_index + 1) % 2 + 1>
				</#if>
				<#if (cp_index gt 0 && ((cp_index + 1) % 2 == 1 || 2 == 1)) || cspan gt restcol>
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
					<#assign elementName = 'batchingMaterialPart' + "." + columnName>
					<#assign elementId = 'batchingMaterialPart' + "_" + columnName>
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
						<#if batchingMaterialPart[columnName]??>
							<#assign dateVal = (batchingMaterialPart[columnName])?string('yyyy-MM-dd HH:mm:ss')>
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
							<@systemcode property_type="${columnType}" iscustom=true showType="${fieldType}" viewType=viewType cssStyle="text-align:${c.align!}" formId="WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form" classStyle="cui-noborder-input" view=true cssStyle="" ecFlag=true multable=isMultable name="${elementName}" code="${(c.property.fillcontentMap.fillContent)!}" value="${batchingMaterialPart[columnName]!}" seniorSystemCode=isS2 />
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
							<input type="hidden" iscustom="true" name="${elementName}" value="${batchingMaterialPart[columnName]!}" />
							<input type="hidden" name="${elementName}.${pkName!'id'}" value="${batchingMaterialPart[columnName]!}" />
							<@mneclient iframe=false property_type="${columnType}" mneenable=false reftitle="${getText('${viewTitle!}')}" viewType=viewType cssStyle="text-align:${c.align!}" view=true value="${batchingMaterialPart[displayColumnName]!}" name="${elementName}.${mainDisplayName!'name'}" id="${elementName?replace('.', '_')}_${mainDisplayName!'name'}" type="${mneType}" url="${viewUrl!}" clicked=true multiple=false isEdit=true mnewidth=260 formId="WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form" editCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}()" delCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}_delete()" />
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
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:22%'></td><td style='height:0px;border:none;width:29%'></td><td style='height:0px;border:none;width:22%'></td><td style='height:0px;border:none;width:29%'></td></tr>
		<tr >
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1491790724898')}" >${getText('WOM.propertydisplayName.randon1491790724898')}</label>
				</td>
				
						<#assign batchingMaterialPart_remark_defaultValue  = ''>
							 							<#assign batchingMaterialPart_remark_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="3" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly fix-ie7-textarea"><textarea property_type="TEXT" id="batchingMaterialPart_remark" originalvalue="<#if !newObj || (batchingMaterialPart.remark)?has_content>${(batchingMaterialPart.remark?html)!}<#else>${batchingMaterialPart_remark_defaultValue?html}</#if>"  name="batchingMaterialPart.remark" class="cui-noborder-textarea cui-textarea-auto" readonly="readonly" style=";" ><#if !newObj || (batchingMaterialPart.remark)?has_content>${(batchingMaterialPart.remark)!}<#else>${batchingMaterialPart_remark_defaultValue}</#if></textarea></div>
							
				</td>
				</tr><tr >
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
					
							<label style="width:100%;;" value="${getText('ec.common.ID')}" >${getText('ec.common.ID')}</label>
				</td>
				
						<#assign batchingMaterialPart_headId_id_defaultValue  = ''>
														<#assign batchingMaterialPart_headId_id_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;display:none;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="LONG" mneenable=false reftitle="${getText('WOM.viewtitle.randon1491984336543')}" viewType="${viewType!}" deValue="${batchingMaterialPart_headId_id_defaultValue!}" conditionfunc="WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._querycustomFunc('batchingMaterialPart_headId_id')" view=true  value="${(batchingMaterialPart.headId.id)!}" displayFieldName="id" name="batchingMaterialPart.headId.id" id="batchingMaterialPart_headId_id" type="other" url="/WOM/batchingMaterial/batchingMaterial/batMaterialRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form" editCustomCallback=";" refViewCode="WOM_7.5.0.0_batchingMaterial_batMaterialRef"  onkeyupfuncname=";_callback_batchingMaterialPart_headId_id(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(batchingMaterialPart.id)?? && (batchingMaterialPart.headId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${batchingMaterialPart.headId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form',obj, 'batchingMaterialPart.headId', '/WOM/batchingMaterial/batchingMaterial/batMaterialRef.action');
												CUI.commonFills('WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form', 'batchingMaterialPart.headId',obj,true);
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
</div>				<@printJs route="0" id="WOM_7_5_0_0_batchingMaterial_batchMaterialView" menuOperateCodes="WOM_7.5.0.0_batchingMaterial_batchMaterialView_controlPrintSetting,WOM_7.5.0.0_batchingMaterial_batchMaterialView_controlPrint" deploymentId="${deploymentId!}" tableInfoId="${(batchingMaterialPart.tableInfoId)!''}" isWorkflow=isWorkflow />
				</div>
				<div class="edit-datatable">	

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

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
     	
		<div id="WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<#if ((batchingMaterialPart.effectiveState)!0) == 0>
				<#if !(superEdit!false)>
				<li id="flowHead" onclick="WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.showFlowInfo('flow')"><span class="icon_prograss"></span>${getText("ec.flow.flowImage")}</li>
				</#if>
				</#if>
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
				<li id="dealInfoHead" class="bar" onclick="WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.showDealInfo('dealInfo')"><span class="icon_handle"></span>${getText("ec.view.dealadvice")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<#if ((batchingMaterialPart.effectiveState)!0) == 0>
				<#if !(superEdit!false)>
				<div class="flow-height wid" id="flowDiv"></div>
				</#if>
				</#if>
				<div id="fileUploadDiv" class="wid-hei"></div>
				<div style="padding:1px 0px 0px 0px;" id="dealInfoDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_batchingMaterial_batchMaterialView,html,WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart,WOM_7.5.0.0) -->
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
						$("#WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.initCount = 0;
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.initSize = function(nTabIndex){
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
				var conHeight = h-$("#WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_main_div .edit-head").height()-$("#WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_main_div .edit-workflow").height()</#if>;
				$("#WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_datagrids');
				var padding_bottom=16;
				$("#WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_main_div .pd_bottom,#WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_main_div .edit-panes-s").each(function(index){
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
									if(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.initCount <= 2) {
										setTimeout(function(){WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.initSize();}, 200);
										WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.initCount++;
									}/* else {
										WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.initCount = 0;
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
							if(($("#WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_main_div .edit-workflow").length > 0) && ($("#WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				$('#WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.initSize();
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
						if(parseInt($("#WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_main_div").css("width"),10)==650){
							$("#WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.resizeLayout();
						//WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_main_div").css("width"),10)==800){
							$("#WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.resizeLayout();
						//WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.initSize();
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
					WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.initSize();});
				/*
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.resizeLayout=function(){
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
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.setDepartment();
			<#else>
			CUI("#dealInfoContain").load("/ec/workflow/dealInfo.action?dlTableInfoId=${batchingMaterialPart.tableInfoId!}&dealInfoGroup=byTime&preName=mainFrame&dealDataUrl=/WOM/batchingMaterial/batchingMaterialPart/dealInfo-list.action&enableSimpleDealInfo=false");
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

		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.validate = function(){
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
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.beforeSaveProcess = function(){
			$('input[name="batchingMaterialPart.extraCol"]').remove();
		}
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.processDataGrid = function(){
		};
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.save = function(){
			<#if !(superEdit!false)>
			$('#operateType').val("save");
			<#else>
			$('#operateType').val("submit");
			</#if>
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.validate()){return;}
			//延迟到延迟提交中处理,解决onchange事件无法触发问题
			//WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.beforeSaveProcess();

			//WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.processDataGrid();
			$('#WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form','WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_datagrids')) {      
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
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.print = function(){
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
		
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.saveSetting = function(){
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
		
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.printSetting = function(){
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
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.settingDialog.show();
			}
		}
		
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.toTakeShowPrint = function(selViewCode, selCode,params){
			var ieEnable = (!!window.ActiveXObject || "ActiveXObject" in window);
	        if(ieEnable) {
				var postData = {
					'id' : '${(batchingMaterialPart.id)!''}',
					'code': selCode,
					'viewCode': 'WOM_7.5.0.0_batchingMaterial_batchMaterialView',
					'deploymentId' : selViewCode,
					'tableInfoId' : '${(batchingMaterialPart.tableInfoId)!''}',
					'templateCode':selCode
				}
				if(params != undefined) {
					$.extend(postData,params);	
				}
				WOM_7_5_0_0_batchingMaterial_batchMaterialView_PrintControl.takeShowPrint(
				$('#sqlKeyWordCheck').val()?$('#sqlKeyWordCheck').val():"update",
				selCode, 
				"/WOM/batchingMaterial/batchingMaterialPart/loadXMLRefOrData.action?${getPowerCode('WOM_7.5.0.0_batchingMaterial_batchMaterialView_controlPrint')}", 
				postData, 1, <#if isWorkflow>true<#else>false</#if>);
			}else{
				var postData = {
					'id' : '${(batchingMaterialPart.id)!''}',
					'viewCode': 'WOM_7.5.0.0_batchingMaterial_batchMaterialView',
					'tableInfoId' : '${(batchingMaterialPart.tableInfoId)!''}',
					'templateCode':selCode
				}
				if(params != undefined) {
					$.extend(postData,params);	
				}
				$.ajax({
					async   : false,
					type    : 'POST',
					url     : '/WOM/batchingMaterial/batchingMaterialPart/printOnServer.action',
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
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.controlPrint = function(){
			if(WOM_7_5_0_0_batchingMaterial_batchMaterialView_PrintControl) {
				var viewCode = $("input[name='viewCode']").val();
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.printTemplateSel = new CUI.Dialog({
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
											WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.toTakeShowPrint(selViewCode, selCode,params);
										}
										signatureUtil.showSignatureDialog(signatureInfo[1],signatureInfo[0],viewCode+"_print_print",'','print',false,'');
									}
									else {
										WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.toTakeShowPrint(selViewCode, selCode);
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
										WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.toTakeShowPrint(viewCode, msg.result[0].code, params);
									}
									signatureUtil.showSignatureDialog(signatureInfo[1],signatureInfo[0],viewCode+"_print_print",'','print',false,'');
								}
								else {
									WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.toTakeShowPrint(viewCode, msg.result[0].code);
								}
							} else {
								WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.printTemplateSel.show();
							}
						}
					}
				});
			}
		}
		
		
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.reject = function(){
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
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.submit();
		}
		
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.submit = function(uncheck){
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
			if(!WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.validate()){return;}
			
			//$('#__workflow_outcomeDes').val($('input[name="workFlowVar.outcome"]:checked').attr('des'));
			
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.beforeSaveProcess();
			
			//WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.processDataGrid();
			
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
			$('#WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form').submit();
			//$(".wfcancel").remove();
			
		}
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.recall = function(){
			CUI.Dialog.confirm("${getText('ec.recall.checkrecall')}", function(){
					$.ajax({
					url : "/WOM/batchingMaterial/batchingMaterialPart/common/recall.action",
					type : 'post',
					async : false,
					data:{"tableInfoId": "${(batchingMaterialPart.tableInfoId)?default('')}"},
					success : function(msg) {
						if(msg && msg.success){
							workbenchErrorBarWidget.showMessage("${getText('ec.recall.success')}", 's');
		 					var url = "/foundation/user/open-pending.action?pendingId=" + msg.data.id + "&tableInfoId=${(batchingMaterialPart.tableInfoId)?default('')}&id=${(batchingMaterialPart.id)?default('')}&entityCode=WOM_7.5.0.0_batchingMaterial";

			 				try{
								window.opener.refreshPortal('workflow');
								window.opener.timeData();
							}catch(e){
								try{
			 						window.opener.WOM.batchingMaterial.batchingMaterialPart.editCallBackInfo(res); 						
								}catch(e2){
									try{
										<#if calltype??&&calltype=='ref'>
										window.opener.WOM.batchingMaterial.batchingMaterialPart.callBackInfo(res);
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
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._callBackInfo = function(res){
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
 						window.opener.WOM.batchingMaterial.batchingMaterialPart.editCallBackInfo(res); 						
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
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.WOM.batchingMaterial.batchingMaterialPart.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
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
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.setDepartment = function(){
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
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._isObjCustomProp_IE = isObjCustomProp;
			} else {
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._objCustomPropNames_IE = objCustomPropNames;
			} else {
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._refViewCode_IE = viewCode;
			} else {
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._refViewCode_IE = '';
			}
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.gridEventObj = gridEventObj;
				callbackName = "WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.getMultiselectCallBackInfo_DG" : "WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.getcallBackInfo_DG";
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._currRow = $(obj).closest('tr')[0];
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.getcallBackInfo";
			}

			if(_prefix!=''){
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._prefix = _prefix.substring(1);
			}
			
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._oGrid = oGrid;
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._refViewCode = oColumn.viewCode;
				} else {
					WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._refViewCode = '';
				}
			} else {
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._isObjCustomProp = false;
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._objCustomPropNames = '';
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._refViewCode = '';
			}
			if (WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._isObjCustomProp == true && WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._customCallBack = customCallBack;
			}
			if(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._querycustomFuncN == "function") {
				refparam += WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._querycustomFunc = function(obj) {
			var str = eval("typeof(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.query_"+obj+")!='undefined'") ? eval('WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.query_'+obj+'()') : null;
			return str;
		};
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.getcallBackGroupInfo = function(obj){
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
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._dialog.close();
		}
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form',obj[0], WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._prefix, WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._sUrl);
			CUI.commonFills('WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form',WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._customCallBack) {
					eval(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._customCallBack);
					WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.getcallBackInfo_DG_IE = function(obj){
			if(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._customBeforeCallBack) {
				var flag = eval(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._isObjCustomProp_IE == true && WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._sUrl,WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._isObjCustomProp_IE == true && WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._refViewCode_IE + '&id=' + id,
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
				if(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._customCallBack) {
					eval(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._customCallBack);
					WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._dialog.close();
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
		
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.getcallBackInfo_DG = function(obj){
			if(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._customBeforeCallBack) {
				var flag = eval(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._currRow).next().length==0){
						WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._oGrid.addNewRow();
					}	
					WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._currRow = $(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._currRow).next();
					$(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._currRow,obj[i], WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._prefix, WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._sUrl);
				if (WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._isObjCustomProp == true && WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._currRow,WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._prefix,obj[i],WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._oGrid,WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._currRow,WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._prefix,obj[i],WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._refViewCode + '&id=' + id,
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
									name = WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._currRow, objs, WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._oGrid);
							}
						}
					}
				}
			}
			try{
				if(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._customCallBack) {
					eval(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._customCallBack);
					WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._oGrid, WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._currRow, WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._key, WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._displayFieldName, obj[i])
			}
			try{
				if(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._customCallBack) {
					eval(WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._customCallBack);
					WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialView._dialog.close();
			} catch(e){}
		};
		
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_form'));
						}
					}
				}
			});
		};

		$(function(){
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.onloadForProduct();
		});

		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.beforeSubmitMethodSettingInPage = function(){
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.onsaveForProduct();
		};
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_main_div").hide();
				},100);
				//CUI("#WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.showThis = function(){
			if(!CUI("#WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_main_div").is(':visible')) {
				CUI("#WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=WOM&modelName=WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.auditDialog.show();
			</#if>
		}
		
		
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.showInfoDialog=function(mode){
			
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "WOM_batchingMaterial_batchingMaterialPart_batchMaterialView_dealInfo",
				modal:true,
				height:500,
				width: 950,//适应国际化版
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			<#if pendingId??>
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=WOM_7.5.0.0_batchingMaterial");
			<#else>
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?readOnlyFlag=true&linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=WOM_7.5.0.0_batchingMaterial");
			</#if>
			}
		}
		
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/WOM/batchingMaterial/batchingMaterialPart/dealInfo-list.action&dlTableInfoId=${(batchingMaterialPart.tableInfoId)?default('')}");
			}
		}
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.showFlowInfo=function(){
		     //IE8环境下使用旧版flash流程展现页面，其他情况使用html5流程展现页面
		    var browser=navigator.appName; 
			var b_version=navigator.appVersion; 
			var version=b_version.split(";"); 
			var trim_Version=version[1]&&version[1].replace(/[ ]/g,"");
			var isIE8=(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE8.0")||($.browser.msie&&(Number($.browser.version)<= 8));//IE8兼容视图模式下浏览器版本判断逻辑补充
			if(CUI.trim(CUI("#flowDiv").html())==""){
				if(isIE8){
				    CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(batchingMaterialPart.tableInfoId)?default('')}");
				}else{
				    CUI("#flowDiv").load("/ec/workflow/flowViewH5.action?env=runtime&modelCode=WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(batchingMaterialPart.tableInfoId)?default('')}");
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
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.supervision=function(){
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(batchingMaterialPart.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.modifyOwnerStaffDialog.show();
		}
		

		/* CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_batchingMaterial_batchMaterialView,js,WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.onloadForProduct = function(){
		/* CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_batchingMaterial_batchMaterialView,onloadForProduct,WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		}

		WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_batchingMaterial_batchMaterialView,onsaveForProduct,WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart,WOM_7.5.0.0) */
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
				<div class="sidebar-top"><a href="#"  onclick="WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="WOM.batchingMaterial.batchingMaterialPart.batchMaterialView.showBusinessList('${l.relatingModel.code.replace('.','')}',${(batchingMaterialPart.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
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