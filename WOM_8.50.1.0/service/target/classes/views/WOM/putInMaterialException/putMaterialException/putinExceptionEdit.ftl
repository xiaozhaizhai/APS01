<!-- WOM_7.5.0.0/putInMaterialException/putinExceptionEdit -->
<#assign isWorkflow = true> 
<#assign isAttachment = true> 
	<#assign fileuploadType = "Table">
	<#assign fileuploadLinkId = putMaterialException.tableInfoId!>
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
<#assign tableObj = putMaterialException>
<#-- 命名空间 -->
<#assign editPageNs = "WOM.putInMaterialException.putMaterialException.putinExceptionEdit">
<#-- 模型名称-->
<#assign modelName = "putMaterialException">
<#-- 视图编码-->
<#assign viewCode = "WOM_7.5.0.0_putInMaterialException_putinExceptionEdit">
<#-- 实体编码-->
<#assign entity_code = "WOM_7.5.0.0_putInMaterialException">
<#-- 视图名称-->
<#assign viewName = "putinExceptionEdit">
<#-- datagrid编码-->
<#assign datagridCode = "WOM_putInMaterialException_putMaterialException_putinExceptionEdit_datagrids">
<#-- 首字母大写的模型名称-->
<#assign upcaseModelName = "PutMaterialException">
<#-- 页面打印按钮 -->
<#assign isPrint = false>
<#-- 控件打印按钮 -->
<#assign controlPrint = false>
<#-- 是否只读 -->
<#assign allReadOnly = false>
<#-- 是否是参照视图 -->
<#assign isReference =false>
<#-- 是否可弃审 -->
<#assign retrialFlag = false>
<#-- formid -->
<#assign editFormId = "WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form">
<#-- 待办状态 -->
<#assign pendingstatus =( putMaterialException.pending.taskDescription)!>
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
        <#assign configTitle = getText('WOM.viewtitle.randon1494823424172')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		
		#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form{float:left;width:100%;}
		
		
		</style>
		<script type="text/javascript">
			CUI.ns('WOM.putInMaterialException.putMaterialException.putinExceptionEdit');
			WOM.putInMaterialException.putMaterialException.putinExceptionEdit.currentUser = ${userJson};
			WOM.putInMaterialException.putMaterialException.putinExceptionEdit.currentStaff = ${staffJson};
			WOM.putInMaterialException.putMaterialException.putinExceptionEdit.currentDepartment = ${deptJson};
			WOM.putInMaterialException.putMaterialException.putinExceptionEdit.currentPosition = ${postJson};
			WOM.putInMaterialException.putMaterialException.putinExceptionEdit.currentCompany = ${compJson};
		</script>
		<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_putInMaterialException_putinExceptionEdit,head,WOM_7.5.0.0_putInMaterialException_PutMaterialException,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
    </head>
	<body class="view-edit ">
		<@loadpanel newType=true/>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="putMaterialException.batchNumObj.id,putMaterialException.putinPartID.id,putMaterialException.putinID.id," onsubmitMethod="WOM.putInMaterialException.putMaterialException.putinExceptionEdit.beforeSubmitMethod()" id="WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form" namespace="/WOM/putInMaterialException/putMaterialException/putinExceptionEdit" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=WOM_7.5.0.0_putInMaterialException_PutMaterialException&_bapFieldPermissonModelName_=PutMaterialException&superEdit=${(superEdit!false)?string}" editPageNs="WOM.putInMaterialException.putMaterialException.putinExceptionEdit" callback="WOM.putInMaterialException.putMaterialException.putinExceptionEdit._callBackInfo" ecform="true">
			<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
			<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="WOM_putInMaterialException_putMaterialException_putinExceptionEdit_main_div">
			<div class="edit-head">
				<#include "../../../ec/tableInfo/operateheadbar_all.ftl" >
				<#include "../../../ec/tableInfo/creatorInfo.ftl" >
			</div>
    		<div class="edit-main" id="WOM_putInMaterialException_putMaterialException_putinExceptionEdit">
    			<div class="edit-content">
    	<#include "../../../ec/tableInfo/formparam.ftl" >				
					<input type="hidden" name="putMaterialException.batchNumObj.id" value="${(putMaterialException.batchNumObj.id)!""}" originalvalue="${(putMaterialException.batchNumObj.id)!""}"/>
					<input type="hidden" name="putMaterialException.putinPartID.id" value="${(putMaterialException.putinPartID.id)!""}" originalvalue="${(putMaterialException.putinPartID.id)!""}"/>
					<input type="hidden" name="putMaterialException.putinID.id" value="${(putMaterialException.putinID.id)!""}" originalvalue="${(putMaterialException.putinID.id)!""}"/>
		<div class="dash-line"></div>
<script type="text/javascript">
var attcountid = "WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=WOM_7.5.0.0_putInMaterialException', null, function(){
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
					
							<label style="width:100%;;" value="${getText('WOM.tableNo1122')}" >${getText('WOM.tableNo1122')}</label>
				</td>
				
						<#assign putMaterialException_putinID_tableNo_defaultValue  = ''>
														<#assign putMaterialException_putinID_tableNo_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('WOM.viewtitle.randon1499688003143')}" viewType="${viewType!}" deValue="${putMaterialException_putinID_tableNo_defaultValue!}" conditionfunc="WOM.putInMaterialException.putMaterialException.putinExceptionEdit._querycustomFunc('putMaterialException_putinID_tableNo')"  value="${(putMaterialException.putinID.tableNo)!}" displayFieldName="tableNo" name="putMaterialException.putinID.tableNo" id="putMaterialException_putinID_tableNo" type="other" url="/WOM/putInMaterial/putInMaterial/putinEXRefList.action" clicked=true multiple=false mnewidth=260 formId="WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form" editCustomCallback="checkproductCode();" refViewCode="WOM_7.5.0.0_putInMaterial_putinEXRefList"  onkeyupfuncname="checkproductCode();_callback_putMaterialException_putinID_tableNo(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(putMaterialException.id)?? && (putMaterialException.putinID.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${putMaterialException.putinID.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form',obj, 'putMaterialException.putinID', '/WOM/putInMaterial/putInMaterial/putinEXRefList.action');
												CUI.commonFills('WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form', 'putMaterialException.putinID',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion1415772644833222')}" >${getText('WOM.propertydisplayName.radion1415772644833222')}</label>
				</td>
				
						<#assign putMaterialException_putinPartID_productId_productCode_defaultValue  = ''>
														<#assign putMaterialException_putinPartID_productId_productCode_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('WOM.viewtitle.randon1494828456715')}" viewType="${viewType!}" deValue="${putMaterialException_putinPartID_productId_productCode_defaultValue!}" conditionfunc="WOM.putInMaterialException.putMaterialException.putinExceptionEdit._querycustomFunc('putMaterialException_putinPartID_productId_productCode')"  value="${(putMaterialException.putinPartID.productId.productCode)!}" displayFieldName="productCode" name="putMaterialException.putinPartID.productId.productCode" id="putMaterialException_putinPartID_productId_productCode" type="other" url="/WOM/putInMaterial/putInMaterialPart/putinRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form" editCustomCallback="setBackfunc();" refViewCode="WOM_7.5.0.0_putInMaterial_putinRef"  onkeyupfuncname="setBackfunc();_callback_putMaterialException_putinPartID_productId_productCode(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(putMaterialException.id)?? && (putMaterialException.putinPartID.productId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${putMaterialException.putinPartID.productId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form',obj, 'putMaterialException.putinPartID.productId', '/WOM/putInMaterial/putInMaterialPart/putinRef.action');
												CUI.commonFills('WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form', 'putMaterialException.putinPartID.productId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
									WOM.putInMaterialException.putMaterialException.putinExceptionEdit.query_putMaterialException_putinPartID_productId_productCode = function() {
										return "putinID="+$("[name='putMaterialException.putinID.id']").val();
									}
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion1415772740737455')}" >${getText('WOM.propertydisplayName.radion1415772740737455')}</label>
				</td>
				
						<#assign putMaterialException_putinPartID_productId_productName_defaultValue  = ''>
														<#assign putMaterialException_putinPartID_productId_productName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="putMaterialException.putinPartID.productId.productName" id="putMaterialException_putinPartID_productId_productName"  style=";" originalvalue="<#if !newObj || (putMaterialException.putinPartID.productId.productName)?has_content>${(putMaterialException.putinPartID.productId.productName?html)!}<#else>${putMaterialException_putinPartID_productId_productName_defaultValue!}</#if>" value="<#if !newObj || (putMaterialException.putinPartID.productId.productName)?has_content>${(putMaterialException.putinPartID.productId.productName?html)!}<#else>${putMaterialException_putinPartID_productId_productName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1490605271044')}" >${getText('WOM.propertydisplayName.randon1490605271044')}</label>
				</td>
				
						<#assign putMaterialException_putinPartID_batchNum_defaultValue  = ''>
														<#assign putMaterialException_putinPartID_batchNum_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="putMaterialException.putinPartID.batchNum" id="putMaterialException_putinPartID_batchNum"  style=";" originalvalue="<#if !newObj || (putMaterialException.putinPartID.batchNum)?has_content>${(putMaterialException.putinPartID.batchNum?html)!}<#else>${putMaterialException_putinPartID_batchNum_defaultValue!}</#if>" value="<#if !newObj || (putMaterialException.putinPartID.batchNum)?has_content>${(putMaterialException.putinPartID.batchNum?html)!}<#else>${putMaterialException_putinPartID_batchNum_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1484031239866')}" >${getText('MESBasic.propertydisplayName.randon1484031239866')}</label>
				</td>
				
						<#assign putMaterialException_putinPartID_wareID_wareCode_defaultValue  = ''>
														<#assign putMaterialException_putinPartID_wareID_wareCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="putMaterialException.putinPartID.wareID.wareCode" id="putMaterialException_putinPartID_wareID_wareCode"  style=";" originalvalue="<#if !newObj || (putMaterialException.putinPartID.wareID.wareCode)?has_content>${(putMaterialException.putinPartID.wareID.wareCode?html)!}<#else>${putMaterialException_putinPartID_wareID_wareCode_defaultValue!}</#if>" value="<#if !newObj || (putMaterialException.putinPartID.wareID.wareCode)?has_content>${(putMaterialException.putinPartID.wareID.wareCode?html)!}<#else>${putMaterialException_putinPartID_wareID_wareCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1484031316281')}" >${getText('MESBasic.propertydisplayName.randon1484031316281')}</label>
				</td>
				
						<#assign putMaterialException_putinPartID_wareID_wareName_defaultValue  = ''>
														<#assign putMaterialException_putinPartID_wareID_wareName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="putMaterialException.putinPartID.wareID.wareName" id="putMaterialException_putinPartID_wareID_wareName"  style=";" originalvalue="<#if !newObj || (putMaterialException.putinPartID.wareID.wareName)?has_content>${(putMaterialException.putinPartID.wareID.wareName?html)!}<#else>${putMaterialException_putinPartID_wareID_wareName_defaultValue!}</#if>" value="<#if !newObj || (putMaterialException.putinPartID.wareID.wareName)?has_content>${(putMaterialException.putinPartID.wareID.wareName?html)!}<#else>${putMaterialException_putinPartID_wareID_wareName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1489731651449')}" >${getText('MESBasic.propertydisplayName.randon1489731651449')}</label>
				</td>
				
						<#assign putMaterialException_putinPartID_storeID_placeSetCode_defaultValue  = ''>
														<#assign putMaterialException_putinPartID_storeID_placeSetCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="putMaterialException.putinPartID.storeID.placeSetCode" id="putMaterialException_putinPartID_storeID_placeSetCode"  style=";" originalvalue="<#if !newObj || (putMaterialException.putinPartID.storeID.placeSetCode)?has_content>${(putMaterialException.putinPartID.storeID.placeSetCode?html)!}<#else>${putMaterialException_putinPartID_storeID_placeSetCode_defaultValue!}</#if>" value="<#if !newObj || (putMaterialException.putinPartID.storeID.placeSetCode)?has_content>${(putMaterialException.putinPartID.storeID.placeSetCode?html)!}<#else>${putMaterialException_putinPartID_storeID_placeSetCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1489731677162')}" >${getText('MESBasic.propertydisplayName.randon1489731677162')}</label>
				</td>
				
						<#assign putMaterialException_putinPartID_storeID_placeSetName_defaultValue  = ''>
														<#assign putMaterialException_putinPartID_storeID_placeSetName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="putMaterialException.putinPartID.storeID.placeSetName" id="putMaterialException_putinPartID_storeID_placeSetName"  style=";" originalvalue="<#if !newObj || (putMaterialException.putinPartID.storeID.placeSetName)?has_content>${(putMaterialException.putinPartID.storeID.placeSetName?html)!}<#else>${putMaterialException_putinPartID_storeID_placeSetName_defaultValue!}</#if>" value="<#if !newObj || (putMaterialException.putinPartID.storeID.placeSetName)?has_content>${(putMaterialException.putinPartID.storeID.placeSetName?html)!}<#else>${putMaterialException_putinPartID_storeID_placeSetName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1490605292518')}" >${getText('WOM.propertydisplayName.randon1490605292518')}</label>
				</td>
				
						<#assign putMaterialException_putinPartID_useNum_defaultValue  = ''>
														<#assign putMaterialException_putinPartID_useNum_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="putMaterialException.putinPartID.useNum" id="putMaterialException_putinPartID_useNum"  style=";" originalvalue="<#if newObj&& !(putMaterialException.putinPartID.useNum)?has_content>${putMaterialException_putinPartID_useNum_defaultValue!}<#elseif (putMaterialException.putinPartID.useNum)?has_content>#{(putMaterialException.putinPartID.useNum)!; m2M2}</#if>" value="<#if newObj&& !(putMaterialException.putinPartID.useNum)?has_content>${putMaterialException_putinPartID_useNum_defaultValue!}<#elseif (putMaterialException.putinPartID.useNum)?has_content>#{(putMaterialException.putinPartID.useNum)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				</tr><tr >
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1490605314992')}" >${getText('WOM.propertydisplayName.randon1490605314992')}</label>
				</td>
				
						<#assign putMaterialException_putinPartID_lossNum_defaultValue  = ''>
														<#assign putMaterialException_putinPartID_lossNum_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="putMaterialException.putinPartID.lossNum" id="putMaterialException_putinPartID_lossNum"  style=";" originalvalue="<#if newObj&& !(putMaterialException.putinPartID.lossNum)?has_content>${putMaterialException_putinPartID_lossNum_defaultValue!}<#elseif (putMaterialException.putinPartID.lossNum)?has_content>#{(putMaterialException.putinPartID.lossNum)!; m2M2}</#if>" value="<#if newObj&& !(putMaterialException.putinPartID.lossNum)?has_content>${putMaterialException_putinPartID_lossNum_defaultValue!}<#elseif (putMaterialException.putinPartID.lossNum)?has_content>#{(putMaterialException.putinPartID.lossNum)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1494818656207')}" >${getText('WOM.propertydisplayName.randon1494818656207')}</label>
				</td>
				
						<#assign putMaterialException_useNum_defaultValue  = ''>
							 							<#assign putMaterialException_useNum_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="putMaterialException.useNum" id="putMaterialException_useNum"  style=";" originalvalue="<#if newObj&& !(putMaterialException.useNum)?has_content>${putMaterialException_useNum_defaultValue!}<#elseif (putMaterialException.useNum)?has_content>#{(putMaterialException.useNum)!; m2M2}</#if>" value="<#if newObj&& !(putMaterialException.useNum)?has_content>${putMaterialException_useNum_defaultValue!}<#elseif (putMaterialException.useNum)?has_content>#{(putMaterialException.useNum)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#putMaterialException_useNum').unbind('blur').bind('blur',function(){
										var percision = 2;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("WOM.propertydisplayName.randon1494818656207")}')}");
											return;
										}
										if(parseInt(percision) > -1 && $(this).val()!=undefined && $(this).val()!='' && isDecimal($(this).val())){
											$(this).val(($(this).val() * 1).toFixed(percision));
										}
									});
								});
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1494818693335')}" >${getText('WOM.propertydisplayName.randon1494818693335')}</label>
				</td>
				
						<#assign putMaterialException_lossNum_defaultValue  = ''>
							 							<#assign putMaterialException_lossNum_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="putMaterialException.lossNum" id="putMaterialException_lossNum"  style=";" originalvalue="<#if newObj&& !(putMaterialException.lossNum)?has_content>${putMaterialException_lossNum_defaultValue!}<#elseif (putMaterialException.lossNum)?has_content>#{(putMaterialException.lossNum)!; m2M2}</#if>" value="<#if newObj&& !(putMaterialException.lossNum)?has_content>${putMaterialException_lossNum_defaultValue!}<#elseif (putMaterialException.lossNum)?has_content>#{(putMaterialException.lossNum)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#putMaterialException_lossNum').unbind('blur').bind('blur',function(){
										var percision = 2;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("WOM.propertydisplayName.randon1494818693335")}')}");
											return;
										}
										if(parseInt(percision) > -1 && $(this).val()!=undefined && $(this).val()!='' && isDecimal($(this).val())){
											$(this).val(($(this).val() * 1).toFixed(percision));
										}
									});
								});
							</script>
							
				</td>
				</tr><tr >
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon149006450146911')}" >${getText('WOM.propertydisplayName.randon149006450146911')}</label>
				</td>
				
						<#assign putMaterialException_batchNumObj_batchText_defaultValue  = ''>
														<#assign putMaterialException_batchNumObj_batchText_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('WOM.viewtitle.randon1495175726566')}" viewType="${viewType!}" deValue="${putMaterialException_batchNumObj_batchText_defaultValue!}" conditionfunc="WOM.putInMaterialException.putMaterialException.putinExceptionEdit._querycustomFunc('putMaterialException_batchNumObj_batchText')"  value="${(putMaterialException.batchNumObj.batchText)!}" displayFieldName="batchText" name="putMaterialException.batchNumObj.batchText" id="putMaterialException_batchNumObj_batchText" type="other" url="/WOM/standingcropRef/standingcropRef/batchNumOneRefExp.action" clicked=true multiple=false mnewidth=260 formId="WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form" editCustomCallback="setBackInfo();" refViewCode="WOM_7.5.0.0_standingcropRef_batchNumOneRefExp" onkeyupfuncname="setBackInfo();_callback_putMaterialException_batchNumObj_batchText(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(putMaterialException.id)?? && (putMaterialException.batchNumObj.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${putMaterialException.batchNumObj.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form',obj, 'putMaterialException.batchNumObj', '/WOM/standingcropRef/standingcropRef/batchNumOneRefExp.action');
												CUI.commonFills('WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form', 'putMaterialException.batchNumObj',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
									WOM.putInMaterialException.putMaterialException.putinExceptionEdit.query_putMaterialException_batchNumObj_batchText = function() {
										return "goodID="+$("[name='putMaterialException.putinPartID.productId.id']").val();
									}
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1484031239866hyc12')}" >${getText('WOM.propertydisplayName.randon1484031239866hyc12')}</label>
				</td>
				
						<#assign putMaterialException_batchNumObj_wareID_wareCode_defaultValue  = ''>
														<#assign putMaterialException_batchNumObj_wareID_wareCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="putMaterialException.batchNumObj.wareID.wareCode" id="putMaterialException_batchNumObj_wareID_wareCode"  style=";" originalvalue="<#if !newObj || (putMaterialException.batchNumObj.wareID.wareCode)?has_content>${(putMaterialException.batchNumObj.wareID.wareCode?html)!}<#else>${putMaterialException_batchNumObj_wareID_wareCode_defaultValue!}</#if>" value="<#if !newObj || (putMaterialException.batchNumObj.wareID.wareCode)?has_content>${(putMaterialException.batchNumObj.wareID.wareCode?html)!}<#else>${putMaterialException_batchNumObj_wareID_wareCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1484031316281hyc123')}" >${getText('WOM.propertydisplayName.randon1484031316281hyc123')}</label>
				</td>
				
						<#assign putMaterialException_batchNumObj_wareID_wareName_defaultValue  = ''>
														<#assign putMaterialException_batchNumObj_wareID_wareName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="putMaterialException.batchNumObj.wareID.wareName" id="putMaterialException_batchNumObj_wareID_wareName"  style=";" originalvalue="<#if !newObj || (putMaterialException.batchNumObj.wareID.wareName)?has_content>${(putMaterialException.batchNumObj.wareID.wareName?html)!}<#else>${putMaterialException_batchNumObj_wareID_wareName_defaultValue!}</#if>" value="<#if !newObj || (putMaterialException.batchNumObj.wareID.wareName)?has_content>${(putMaterialException.batchNumObj.wareID.wareName?html)!}<#else>${putMaterialException_batchNumObj_wareID_wareName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1489731651449')}" >${getText('WOM.propertydisplayName.randon1489731651449')}</label>
				</td>
				
						<#assign putMaterialException_batchNumObj_placeSet_placeSetCode_defaultValue  = ''>
														<#assign putMaterialException_batchNumObj_placeSet_placeSetCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="putMaterialException.batchNumObj.placeSet.placeSetCode" id="putMaterialException_batchNumObj_placeSet_placeSetCode"  style=";" originalvalue="<#if !newObj || (putMaterialException.batchNumObj.placeSet.placeSetCode)?has_content>${(putMaterialException.batchNumObj.placeSet.placeSetCode?html)!}<#else>${putMaterialException_batchNumObj_placeSet_placeSetCode_defaultValue!}</#if>" value="<#if !newObj || (putMaterialException.batchNumObj.placeSet.placeSetCode)?has_content>${(putMaterialException.batchNumObj.placeSet.placeSetCode?html)!}<#else>${putMaterialException_batchNumObj_placeSet_placeSetCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1489731677162')}" >${getText('WOM.propertydisplayName.randon1489731677162')}</label>
				</td>
				
						<#assign putMaterialException_batchNumObj_placeSet_placeSetName_defaultValue  = ''>
														<#assign putMaterialException_batchNumObj_placeSet_placeSetName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="putMaterialException.batchNumObj.placeSet.placeSetName" id="putMaterialException_batchNumObj_placeSet_placeSetName"  style=";" originalvalue="<#if !newObj || (putMaterialException.batchNumObj.placeSet.placeSetName)?has_content>${(putMaterialException.batchNumObj.placeSet.placeSetName?html)!}<#else>${putMaterialException_batchNumObj_placeSet_placeSetName_defaultValue!}</#if>" value="<#if !newObj || (putMaterialException.batchNumObj.placeSet.placeSetName)?has_content>${(putMaterialException.batchNumObj.placeSet.placeSetName?html)!}<#else>${putMaterialException_batchNumObj_placeSet_placeSetName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
		</tr>
	</table>
		<#assign cpvmInfo = ''>
			<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_putInMaterialException_PutMaterialException", "WOM_7.5.0.0_putInMaterialException_putinExceptionEdit", 'EDIT')>
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
					<#assign elementName = 'putMaterialException' + "." + columnName>
					<#assign elementId = 'putMaterialException' + "_" + columnName>
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
						<#if putMaterialException[columnName]??>
							<#assign dateVal = (putMaterialException[columnName])?string('yyyy-MM-dd HH:mm:ss')>
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
							<@systemcode property_type="${columnType}" iscustom=true showType="${fieldType}" viewType=viewType cssStyle="text-align:${c.align!}" formId="WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form" classStyle="cui-noborder-input" view=(c.readonly!false) cssStyle="" ecFlag=true multable=isMultable name="${elementName}" code="${(c.property.fillcontentMap.fillContent)!}" value="${putMaterialException[columnName]!}" seniorSystemCode=isS2 />
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
							<input type="hidden" iscustom="true" name="${elementName}" value="${putMaterialException[columnName]!}" />
							<input type="hidden" name="${elementName}.${pkName!'id'}" value="${putMaterialException[columnName]!}" />
							<@mneclient iframe=false property_type="${columnType}" mneenable=false reftitle="${getText('${viewTitle!}')}" viewType=viewType cssStyle="text-align:${c.align!}" view=(c.readonly!false) value="${putMaterialException[displayColumnName]!}" name="${elementName}.${mainDisplayName!'name'}" id="${elementName?replace('.', '_')}_${mainDisplayName!'name'}" type="${mneType}" url="${viewUrl!}" clicked=true multiple=false isEdit=true mnewidth=260 formId="WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form" editCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}()" delCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}_delete()" />
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
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1494814438997')}" >${getText('WOM.propertydisplayName.randon1494814438997')}</label>
				</td>
				
						<#assign putMaterialException_remark_defaultValue  = ''>
							 							<#assign putMaterialException_remark_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="putMaterialException.remark" id="putMaterialException_remark"  style=";" originalvalue="<#if !newObj || (putMaterialException.remark)?has_content>${(putMaterialException.remark?html)!}<#else>${putMaterialException_remark_defaultValue!}</#if>" value="<#if !newObj || (putMaterialException.remark)?has_content>${(putMaterialException.remark?html)!}<#else>${putMaterialException_remark_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
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
	<table class="edit-table" style="display:none;">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1494896691508')}" >${getText('WOM.propertydisplayName.randon1494896691508')}</label>
				</td>
				
						<#assign putMaterialException_batchNumStr_defaultValue  = ''>
							 							<#assign putMaterialException_batchNumStr_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="putMaterialException.batchNumStr" id="putMaterialException_batchNumStr"  style=";" originalvalue="<#if !newObj || (putMaterialException.batchNumStr)?has_content>${(putMaterialException.batchNumStr?html)!}<#else>${putMaterialException_batchNumStr_defaultValue!}</#if>" value="<#if !newObj || (putMaterialException.batchNumStr)?has_content>${(putMaterialException.batchNumStr?html)!}<#else>${putMaterialException_batchNumStr_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1449796384550')}" >${getText('WOM.propertydisplayName.randon1449796384550')}</label>
				</td>
				
						<#assign putMaterialException_putinPartID_productId_id_defaultValue  = ''>
														<#assign putMaterialException_putinPartID_productId_id_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="LONG" name="putMaterialException.putinPartID.productId.id" id="putMaterialException_putinPartID_productId_id"  style=";" originalvalue="<#if !newObj || (putMaterialException.putinPartID.productId.id)?has_content>${(putMaterialException.putinPartID.productId.id?html)!}<#else>${putMaterialException_putinPartID_productId_id_defaultValue!}</#if>" value="<#if !newObj || (putMaterialException.putinPartID.productId.id)?has_content>${(putMaterialException.putinPartID.productId.id?html)!}<#else>${putMaterialException_putinPartID_productId_id_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.part.ID')}" >${getText('WOM.part.ID')}</label>
				</td>
				
						<#assign putMaterialException_putinPartID_id_defaultValue  = ''>
														<#assign putMaterialException_putinPartID_id_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="LONG" name="putMaterialException.putinPartID.id" id="putMaterialException_putinPartID_id"  style=";" originalvalue="<#if !newObj || (putMaterialException.putinPartID.id)?has_content>${(putMaterialException.putinPartID.id?html)!}<#else>${putMaterialException_putinPartID_id_defaultValue!}</#if>" value="<#if !newObj || (putMaterialException.putinPartID.id)?has_content>${(putMaterialException.putinPartID.id?html)!}<#else>${putMaterialException_putinPartID_id_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.common.ID')}" >${getText('WOM.common.ID')}</label>
				</td>
				
						<#assign putMaterialException_putinPartID_headId_id_defaultValue  = ''>
														<#assign putMaterialException_putinPartID_headId_id_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="LONG" name="putMaterialException.putinPartID.headId.id" id="putMaterialException_putinPartID_headId_id"  style=";" originalvalue="<#if !newObj || (putMaterialException.putinPartID.headId.id)?has_content>${(putMaterialException.putinPartID.headId.id?html)!}<#else>${putMaterialException_putinPartID_headId_id_defaultValue!}</#if>" value="<#if !newObj || (putMaterialException.putinPartID.headId.id)?has_content>${(putMaterialException.putinPartID.headId.id?html)!}<#else>${putMaterialException_putinPartID_headId_id_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon144979638455011111')}" >${getText('WOM.propertydisplayName.randon144979638455011111')}</label>
				</td>
				
						<#assign putMaterialException_batchNumObj_good_id_defaultValue  = ''>
														<#assign putMaterialException_batchNumObj_good_id_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="LONG" name="putMaterialException.batchNumObj.good.id" id="putMaterialException_batchNumObj_good_id"  style=";" originalvalue="<#if !newObj || (putMaterialException.batchNumObj.good.id)?has_content>${(putMaterialException.batchNumObj.good.id?html)!}<#else>${putMaterialException_batchNumObj_good_id_defaultValue!}</#if>" value="<#if !newObj || (putMaterialException.batchNumObj.good.id)?has_content>${(putMaterialException.batchNumObj.good.id?html)!}<#else>${putMaterialException_batchNumObj_good_id_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.tlmxwlphID')}" >${getText('WOM.tlmxwlphID')}</label>
				</td>
				
						<#assign putMaterialException_putinPartID_proBatch_id_defaultValue  = ''>
														<#assign putMaterialException_putinPartID_proBatch_id_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="LONG" name="putMaterialException.putinPartID.proBatch.id" id="putMaterialException_putinPartID_proBatch_id"  style=";" originalvalue="<#if !newObj || (putMaterialException.putinPartID.proBatch.id)?has_content>${(putMaterialException.putinPartID.proBatch.id?html)!}<#else>${putMaterialException_putinPartID_proBatch_id_defaultValue!}</#if>" value="<#if !newObj || (putMaterialException.putinPartID.proBatch.id)?has_content>${(putMaterialException.putinPartID.proBatch.id?html)!}<#else>${putMaterialException_putinPartID_proBatch_id_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.sjwlphID')}" >${getText('WOM.sjwlphID')}</label>
				</td>
				
						<#assign putMaterialException_batchNumObj_id_defaultValue  = ''>
														<#assign putMaterialException_batchNumObj_id_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="LONG" name="putMaterialException.batchNumObj.id" id="putMaterialException_batchNumObj_id"  style=";" originalvalue="<#if !newObj || (putMaterialException.batchNumObj.id)?has_content>${(putMaterialException.batchNumObj.id?html)!}<#else>${putMaterialException_batchNumObj_id_defaultValue!}</#if>" value="<#if !newObj || (putMaterialException.batchNumObj.id)?has_content>${(putMaterialException.batchNumObj.id?html)!}<#else>${putMaterialException_batchNumObj_id_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1495524777954')}" >${getText('WOM.propertydisplayName.randon1495524777954')}</label>
				</td>
				
						<#assign putMaterialException_oldBatchNumStr_defaultValue  = ''>
							 							<#assign putMaterialException_oldBatchNumStr_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="putMaterialException.oldBatchNumStr" id="putMaterialException_oldBatchNumStr"  style=";" originalvalue="<#if !newObj || (putMaterialException.oldBatchNumStr)?has_content>${(putMaterialException.oldBatchNumStr?html)!}<#else>${putMaterialException_oldBatchNumStr_defaultValue!}</#if>" value="<#if !newObj || (putMaterialException.oldBatchNumStr)?has_content>${(putMaterialException.oldBatchNumStr?html)!}<#else>${putMaterialException_oldBatchNumStr_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1495524277382')}" >${getText('WOM.propertydisplayName.randon1495524277382')}</label>
				</td>
				
						<#assign putMaterialException_oldLossNum_defaultValue  = ''>
							 							<#assign putMaterialException_oldLossNum_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="putMaterialException.oldLossNum" id="putMaterialException_oldLossNum"  style=";" originalvalue="<#if !newObj || (putMaterialException.oldLossNum)?has_content>${(putMaterialException.oldLossNum?html)!}<#else>${putMaterialException_oldLossNum_defaultValue!}</#if>" value="<#if !newObj || (putMaterialException.oldLossNum)?has_content>${(putMaterialException.oldLossNum?html)!}<#else>${putMaterialException_oldLossNum_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1495524215377')}" >${getText('WOM.propertydisplayName.randon1495524215377')}</label>
				</td>
				
						<#assign putMaterialException_oldUseNum_defaultValue  = ''>
							 							<#assign putMaterialException_oldUseNum_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="putMaterialException.oldUseNum" id="putMaterialException_oldUseNum"  style=";" originalvalue="<#if !newObj || (putMaterialException.oldUseNum)?has_content>${(putMaterialException.oldUseNum?html)!}<#else>${putMaterialException_oldUseNum_defaultValue!}</#if>" value="<#if !newObj || (putMaterialException.oldUseNum)?has_content>${(putMaterialException.oldUseNum?html)!}<#else>${putMaterialException_oldUseNum_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1495526857123')}" >${getText('WOM.propertydisplayName.randon1495526857123')}</label>
				</td>
				
						<#assign putMaterialException_oldplaceSetCode_defaultValue  = ''>
							 							<#assign putMaterialException_oldplaceSetCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="putMaterialException.oldplaceSetCode" id="putMaterialException_oldplaceSetCode"  style=";" originalvalue="<#if !newObj || (putMaterialException.oldplaceSetCode)?has_content>${(putMaterialException.oldplaceSetCode?html)!}<#else>${putMaterialException_oldplaceSetCode_defaultValue!}</#if>" value="<#if !newObj || (putMaterialException.oldplaceSetCode)?has_content>${(putMaterialException.oldplaceSetCode?html)!}<#else>${putMaterialException_oldplaceSetCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1495526975854')}" >${getText('WOM.propertydisplayName.randon1495526975854')}</label>
				</td>
				
						<#assign putMaterialException_oldplaceSetName_defaultValue  = ''>
							 							<#assign putMaterialException_oldplaceSetName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="putMaterialException.oldplaceSetName" id="putMaterialException_oldplaceSetName"  style=";" originalvalue="<#if !newObj || (putMaterialException.oldplaceSetName)?has_content>${(putMaterialException.oldplaceSetName?html)!}<#else>${putMaterialException_oldplaceSetName_defaultValue!}</#if>" value="<#if !newObj || (putMaterialException.oldplaceSetName)?has_content>${(putMaterialException.oldplaceSetName?html)!}<#else>${putMaterialException_oldplaceSetName_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
		</tr>
	</table>
</div>				</div>
				<div class="edit-datatable">	

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

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
     	
		<div id="WOM_putInMaterialException_putMaterialException_putinExceptionEdit_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<#if !(superEdit!false)>
				<li id="flowHead" onclick="WOM.putInMaterialException.putMaterialException.putinExceptionEdit.showFlowInfo('flow')"><span class="icon_prograss"></span>${getText("ec.flow.flowImage")}</li>
				</#if>
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="WOM.putInMaterialException.putMaterialException.putinExceptionEdit.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
				<li id="dealInfoHead" class="bar" onclick="WOM.putInMaterialException.putMaterialException.putinExceptionEdit.showDealInfo('dealInfo')"><span class="icon_handle"></span>${getText("ec.view.dealadvice")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<#if !(superEdit!false)>
				<div class="flow-height wid" id="flowDiv"></div>
				</#if>
				<div id="fileUploadDiv" class="wid-hei"></div>
				<div style="padding:1px 0px 0px 0px;" id="dealInfoDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_putInMaterialException_putinExceptionEdit,html,WOM_7.5.0.0_putInMaterialException_PutMaterialException,WOM_7.5.0.0) -->
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
						$("#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			WOM.putInMaterialException.putMaterialException.putinExceptionEdit.initCount = 0;
			WOM.putInMaterialException.putMaterialException.putinExceptionEdit.initSize = function(nTabIndex){
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
				var conHeight = h-$("#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_main_div .edit-head").height()-$("#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_main_div .edit-workflow").height()</#if>;
				$("#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('WOM_putInMaterialException_putMaterialException_putinExceptionEdit_datagrids');
				var padding_bottom=16;
				$("#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_main_div .pd_bottom,#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_main_div .edit-panes-s").each(function(index){
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
									if(WOM.putInMaterialException.putMaterialException.putinExceptionEdit.initCount <= 2) {
										setTimeout(function(){WOM.putInMaterialException.putMaterialException.putinExceptionEdit.initSize();}, 200);
										WOM.putInMaterialException.putMaterialException.putinExceptionEdit.initCount++;
									}/* else {
										WOM.putInMaterialException.putMaterialException.putinExceptionEdit.initCount = 0;
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
							if(($("#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_main_div .edit-workflow").length > 0) && ($("#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				$('#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				WOM.putInMaterialException.putMaterialException.putinExceptionEdit.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				WOM.putInMaterialException.putMaterialException.putinExceptionEdit.initSize();
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
						if(parseInt($("#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_main_div").css("width"),10)==650){
							$("#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//WOM.putInMaterialException.putMaterialException.putinExceptionEdit.resizeLayout();
						//WOM.putInMaterialException.putMaterialException.putinExceptionEdit.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_main_div").css("width"),10)==800){
							$("#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//WOM.putInMaterialException.putMaterialException.putinExceptionEdit.resizeLayout();
						//WOM.putInMaterialException.putMaterialException.putinExceptionEdit.initSize();
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
					WOM.putInMaterialException.putMaterialException.putinExceptionEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					WOM.putInMaterialException.putMaterialException.putinExceptionEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){WOM.putInMaterialException.putMaterialException.putinExceptionEdit.initSize();});
				/*
				WOM.putInMaterialException.putMaterialException.putinExceptionEdit.resizeLayout=function(){
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
			WOM.putInMaterialException.putMaterialException.putinExceptionEdit.setDepartment();
			<#else>
			CUI("#dealInfoContain").load("/ec/workflow/dealInfo.action?dlTableInfoId=${putMaterialException.tableInfoId!}&dealInfoGroup=byTime&preName=mainFrame&dealDataUrl=/WOM/putInMaterialException/putMaterialException/dealInfo-list.action&enableSimpleDealInfo=false");
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

		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.validate = function(){
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
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.beforeSaveProcess = function(){

			var extraCol = '<extra-data>';
			$('#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form').trigger('beforeSubmit');
			//putMaterialException.extraCol
			$('*[name^="_complex_"]').each(function(index, item){
				if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
					if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
					var itemValue = CUI(item).val();
					extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
				}
			});
			extraCol += '</extra-data>';
			$('input[name="putMaterialException.extraCol"]').val(extraCol);
		}
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.processDataGrid = function(){
		};
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.save = function(){
			<#if !(superEdit!false)>
			$('#operateType').val("save");
			<#else>
			$('#operateType').val("submit");
			</#if>
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!WOM.putInMaterialException.putMaterialException.putinExceptionEdit.validate()){return;}
			//延迟到延迟提交中处理,解决onchange事件无法触发问题
			//WOM.putInMaterialException.putMaterialException.putinExceptionEdit.beforeSaveProcess();

			//WOM.putInMaterialException.putMaterialException.putinExceptionEdit.processDataGrid();
			$('#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form','WOM_putInMaterialException_putMaterialException_putinExceptionEdit_datagrids')) {      
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
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.print = function(){
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
		
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.saveSetting = function(){
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
		
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.printSetting = function(){
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
				WOM.putInMaterialException.putMaterialException.putinExceptionEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(WOM.putInMaterialException.putMaterialException.putinExceptionEdit.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				WOM.putInMaterialException.putMaterialException.putinExceptionEdit.settingDialog.show();
			}
		}
		
		
		
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.reject = function(){
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
			WOM.putInMaterialException.putMaterialException.putinExceptionEdit.submit();
		}
		
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.submit = function(uncheck){
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
			if(!WOM.putInMaterialException.putMaterialException.putinExceptionEdit.validate()){return;}
			
			//$('#__workflow_outcomeDes').val($('input[name="workFlowVar.outcome"]:checked').attr('des'));
			
			WOM.putInMaterialException.putMaterialException.putinExceptionEdit.beforeSaveProcess();
			
			//WOM.putInMaterialException.putMaterialException.putinExceptionEdit.processDataGrid();
			
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
			$('#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form').submit();
			//$(".wfcancel").remove();
			
		}
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.recall = function(){
			CUI.Dialog.confirm("${getText('ec.recall.checkrecall')}", function(){
					$.ajax({
					url : "/WOM/putInMaterialException/putMaterialException/common/recall.action",
					type : 'post',
					async : false,
					data:{"tableInfoId": "${(putMaterialException.tableInfoId)?default('')}"},
					success : function(msg) {
						if(msg && msg.success){
							workbenchErrorBarWidget.showMessage("${getText('ec.recall.success')}", 's');
		 					var url = "/foundation/user/open-pending.action?pendingId=" + msg.data.id + "&tableInfoId=${(putMaterialException.tableInfoId)?default('')}&id=${(putMaterialException.id)?default('')}&entityCode=WOM_7.5.0.0_putInMaterialException";

			 				try{
								window.opener.refreshPortal('workflow');
								window.opener.timeData();
							}catch(e){
								try{
			 						window.opener.WOM.putInMaterialException.putMaterialException.editCallBackInfo(res); 						
								}catch(e2){
									try{
										<#if calltype??&&calltype=='ref'>
										window.opener.WOM.putInMaterialException.putMaterialException.callBackInfo(res);
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
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit._callBackInfo = function(res){
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
 						window.opener.WOM.putInMaterialException.putMaterialException.editCallBackInfo(res); 						
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
 					var url = "/foundation/user/open-pending.action?pendingId=" + res.pendingId + "&tableInfoId=" + res.tableInfoId + "&id=" + res.id + "&entityCode=WOM_7.5.0.0_putInMaterialException";
 					setTimeout(function(){
						document.location.href=url;
 					}, 1000);
					return;
 				}
 				</#if>

 				setTimeout(function(){
					window.close();
				},1000);
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.WOM.putInMaterialException.putMaterialException.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
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
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.setDepartment = function(){
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
				WOM.putInMaterialException.putMaterialException.putinExceptionEdit._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				WOM.putInMaterialException.putMaterialException.putinExceptionEdit._isObjCustomProp_IE = isObjCustomProp;
			} else {
				WOM.putInMaterialException.putMaterialException.putinExceptionEdit._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				WOM.putInMaterialException.putMaterialException.putinExceptionEdit._objCustomPropNames_IE = objCustomPropNames;
			} else {
				WOM.putInMaterialException.putMaterialException.putinExceptionEdit._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				WOM.putInMaterialException.putMaterialException.putinExceptionEdit._refViewCode_IE = viewCode;
			} else {
				WOM.putInMaterialException.putMaterialException.putinExceptionEdit._refViewCode_IE = '';
			}
			WOM.putInMaterialException.putMaterialException.putinExceptionEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			WOM.putInMaterialException.putMaterialException.putinExceptionEdit._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			WOM.putInMaterialException.putMaterialException.putinExceptionEdit._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			WOM.putInMaterialException.putMaterialException.putinExceptionEdit.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			WOM.putInMaterialException.putMaterialException.putinExceptionEdit._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				WOM.putInMaterialException.putMaterialException.putinExceptionEdit._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(WOM.putInMaterialException.putMaterialException.putinExceptionEdit._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(WOM.putInMaterialException.putMaterialException.putinExceptionEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				WOM.putInMaterialException.putMaterialException.putinExceptionEdit.gridEventObj = gridEventObj;
				callbackName = "WOM.putInMaterialException.putMaterialException.putinExceptionEdit.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "WOM.putInMaterialException.putMaterialException.putinExceptionEdit.getMultiselectCallBackInfo_DG" : "WOM.putInMaterialException.putMaterialException.putinExceptionEdit.getcallBackInfo_DG";
				WOM.putInMaterialException.putMaterialException.putinExceptionEdit._currRow = $(obj).closest('tr')[0];
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="WOM.putInMaterialException.putMaterialException.putinExceptionEdit.getcallBackInfo";
			}

			if(_prefix!=''){
				WOM.putInMaterialException.putMaterialException.putinExceptionEdit._prefix = _prefix.substring(1);
			}
			
			WOM.putInMaterialException.putMaterialException.putinExceptionEdit._oGrid = oGrid;
			WOM.putInMaterialException.putMaterialException.putinExceptionEdit._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					WOM.putInMaterialException.putMaterialException.putinExceptionEdit._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					WOM.putInMaterialException.putMaterialException.putinExceptionEdit._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					WOM.putInMaterialException.putMaterialException.putinExceptionEdit._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					WOM.putInMaterialException.putMaterialException.putinExceptionEdit._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					WOM.putInMaterialException.putMaterialException.putinExceptionEdit._refViewCode = oColumn.viewCode;
				} else {
					WOM.putInMaterialException.putMaterialException.putinExceptionEdit._refViewCode = '';
				}
			} else {
				WOM.putInMaterialException.putMaterialException.putinExceptionEdit._isObjCustomProp = false;
				WOM.putInMaterialException.putMaterialException.putinExceptionEdit._objCustomPropNames = '';
				WOM.putInMaterialException.putMaterialException.putinExceptionEdit._refViewCode = '';
			}
			if (WOM.putInMaterialException.putMaterialException.putinExceptionEdit._isObjCustomProp == true && WOM.putInMaterialException.putMaterialException.putinExceptionEdit._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				WOM.putInMaterialException.putMaterialException.putinExceptionEdit._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				WOM.putInMaterialException.putMaterialException.putinExceptionEdit._customCallBack = customCallBack;
			}
			if(WOM.putInMaterialException.putMaterialException.putinExceptionEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.putInMaterialException.putMaterialException.putinExceptionEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof WOM.putInMaterialException.putMaterialException.putinExceptionEdit._querycustomFuncN == "function") {
				refparam += WOM.putInMaterialException.putMaterialException.putinExceptionEdit._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			WOM.putInMaterialException.putMaterialException.putinExceptionEdit._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(WOM.putInMaterialException.putMaterialException.putinExceptionEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.putInMaterialException.putMaterialException.putinExceptionEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			WOM.putInMaterialException.putMaterialException.putinExceptionEdit._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'WOM.putInMaterialException.putMaterialException.putinExceptionEdit.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit._querycustomFunc = function(obj) {
			var str = eval("typeof(WOM.putInMaterialException.putMaterialException.putinExceptionEdit.query_"+obj+")!='undefined'") ? eval('WOM.putInMaterialException.putMaterialException.putinExceptionEdit.query_'+obj+'()') : null;
			return str;
		};
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.getcallBackGroupInfo = function(obj){
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
			WOM.putInMaterialException.putMaterialException.putinExceptionEdit._dialog.close();
		}
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form',obj[0], WOM.putInMaterialException.putMaterialException.putinExceptionEdit._prefix, WOM.putInMaterialException.putMaterialException.putinExceptionEdit._sUrl);
			CUI.commonFills('WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form',WOM.putInMaterialException.putMaterialException.putinExceptionEdit._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (WOM.putInMaterialException.putMaterialException.putinExceptionEdit._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(WOM.putInMaterialException.putMaterialException.putinExceptionEdit._customCallBack) {
					eval(WOM.putInMaterialException.putMaterialException.putinExceptionEdit._customCallBack);
					WOM.putInMaterialException.putMaterialException.putinExceptionEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.putInMaterialException.putMaterialException.putinExceptionEdit._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.getcallBackInfo_DG_IE = function(obj){
			if(WOM.putInMaterialException.putMaterialException.putinExceptionEdit._customBeforeCallBack) {
				var flag = eval(WOM.putInMaterialException.putMaterialException.putinExceptionEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = WOM.putInMaterialException.putMaterialException.putinExceptionEdit.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( WOM.putInMaterialException.putMaterialException.putinExceptionEdit._isObjCustomProp_IE == true && WOM.putInMaterialException.putMaterialException.putinExceptionEdit._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,WOM.putInMaterialException.putMaterialException.putinExceptionEdit._sUrl,WOM.putInMaterialException.putMaterialException.putinExceptionEdit._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,WOM.putInMaterialException.putMaterialException.putinExceptionEdit._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (WOM.putInMaterialException.putMaterialException.putinExceptionEdit._isObjCustomProp_IE == true && WOM.putInMaterialException.putMaterialException.putinExceptionEdit._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = WOM.putInMaterialException.putMaterialException.putinExceptionEdit._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = WOM.putInMaterialException.putMaterialException.putinExceptionEdit._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && WOM.putInMaterialException.putMaterialException.putinExceptionEdit._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + WOM.putInMaterialException.putMaterialException.putinExceptionEdit._refViewCode_IE + '&id=' + id,
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
				if(WOM.putInMaterialException.putMaterialException.putinExceptionEdit._customCallBack) {
					eval(WOM.putInMaterialException.putMaterialException.putinExceptionEdit._customCallBack);
					WOM.putInMaterialException.putMaterialException.putinExceptionEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.putInMaterialException.putMaterialException.putinExceptionEdit._dialog.close();
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
		
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.getcallBackInfo_DG = function(obj){
			if(WOM.putInMaterialException.putMaterialException.putinExceptionEdit._customBeforeCallBack) {
				var flag = eval(WOM.putInMaterialException.putMaterialException.putinExceptionEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(WOM.putInMaterialException.putMaterialException.putinExceptionEdit._currRow).next().length==0){
						WOM.putInMaterialException.putMaterialException.putinExceptionEdit._oGrid.addNewRow();
					}	
					WOM.putInMaterialException.putMaterialException.putinExceptionEdit._currRow = $(WOM.putInMaterialException.putMaterialException.putinExceptionEdit._currRow).next();
					$(WOM.putInMaterialException.putMaterialException.putinExceptionEdit._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(WOM.putInMaterialException.putMaterialException.putinExceptionEdit._currRow,obj[i], WOM.putInMaterialException.putMaterialException.putinExceptionEdit._prefix, WOM.putInMaterialException.putMaterialException.putinExceptionEdit._sUrl);
				if (WOM.putInMaterialException.putMaterialException.putinExceptionEdit._isObjCustomProp == true && WOM.putInMaterialException.putMaterialException.putinExceptionEdit._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(WOM.putInMaterialException.putMaterialException.putinExceptionEdit._currRow,WOM.putInMaterialException.putMaterialException.putinExceptionEdit._prefix,obj[i],WOM.putInMaterialException.putMaterialException.putinExceptionEdit._oGrid,WOM.putInMaterialException.putMaterialException.putinExceptionEdit._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(WOM.putInMaterialException.putMaterialException.putinExceptionEdit._currRow,WOM.putInMaterialException.putMaterialException.putinExceptionEdit._prefix,obj[i],WOM.putInMaterialException.putMaterialException.putinExceptionEdit._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + WOM.putInMaterialException.putMaterialException.putinExceptionEdit._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + WOM.putInMaterialException.putMaterialException.putinExceptionEdit._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && WOM.putInMaterialException.putMaterialException.putinExceptionEdit._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + WOM.putInMaterialException.putMaterialException.putinExceptionEdit._refViewCode + '&id=' + id,
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
									name = WOM.putInMaterialException.putMaterialException.putinExceptionEdit._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(WOM.putInMaterialException.putMaterialException.putinExceptionEdit._currRow, objs, WOM.putInMaterialException.putMaterialException.putinExceptionEdit._oGrid);
							}
						}
					}
				}
			}
			try{
				if(WOM.putInMaterialException.putMaterialException.putinExceptionEdit._customCallBack) {
					eval(WOM.putInMaterialException.putMaterialException.putinExceptionEdit._customCallBack);
					WOM.putInMaterialException.putMaterialException.putinExceptionEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.putInMaterialException.putMaterialException.putinExceptionEdit._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + WOM.putInMaterialException.putMaterialException.putinExceptionEdit._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(WOM.putInMaterialException.putMaterialException.putinExceptionEdit._oGrid, WOM.putInMaterialException.putMaterialException.putinExceptionEdit._currRow, WOM.putInMaterialException.putMaterialException.putinExceptionEdit._key, WOM.putInMaterialException.putMaterialException.putinExceptionEdit._displayFieldName, obj[i])
			}
			try{
				if(WOM.putInMaterialException.putMaterialException.putinExceptionEdit._customCallBack) {
					eval(WOM.putInMaterialException.putMaterialException.putinExceptionEdit._customCallBack);
					WOM.putInMaterialException.putMaterialException.putinExceptionEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.putInMaterialException.putMaterialException.putinExceptionEdit._dialog.close();
			} catch(e){}
		};
		
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						WOM.putInMaterialException.putMaterialException.putinExceptionEdit.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form'));
						}
					}
				}
			});
		};

		$(function(){
			WOM.putInMaterialException.putMaterialException.putinExceptionEdit.onloadForProduct();
			//如果不启用MES物料管理
	if(!ismesProBatch){
	//insertAfter编辑文本框
	$("#putMaterialException_batchNumStr").parents("td").insertAfter($("#putMaterialException_batchNumObj_batchText_mneTipLabel").parents("td").prev("td"))
	//删除obj框
	$("#putMaterialException_batchNumObj_batchText_mneTipLabel").parents("td").remove();
	//实际物料批号字段变红
	$("#putMaterialException_batchNumStr").parents("td").prev().css({color:"rgb(179, 3, 3)"})
	}else{
	$("#putMaterialException_batchNumObj_batchText").parents("td").prev().css({color:"rgb(179, 3, 3)"})
	}
		});

		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.beforeSubmitMethodSettingInPage = function(){
			WOM.putInMaterialException.putMaterialException.putinExceptionEdit.onsaveForProduct();
			var tlsl=$("input[name='putMaterialException.putinPartID.useNum']").val();//投料数量   
	var shsl=$("input[name='putMaterialException.putinPartID.lossNum']").val();//损耗数量
	var sjtlsl=$("input[name='putMaterialException.useNum']").val();//实际投料数量   
	var sjshsl=$("input[name='putMaterialException.lossNum']").val();//实际损耗数量
	var wlph=$("input[name='putMaterialException.putinPartID.batchNum']").val();//物料批号
	var sjwlph=$("input[name='putMaterialException.batchNumStr']").val();//实际物料批号
	
	var wlphid=$("input[name='putMaterialException.batchNumObj.batchText']").val();//实际物料批号对象
	
	var wlphtext=$("input[name='putMaterialException.batchNumStr']").val();//实际物料批号text
	if(wlph!=""&&sjwlph!=""&&wlph==sjwlph){
		if(tlsl==sjtlsl&&shsl==sjshsl){
		//实际投料量实际损耗量与投料单相同请重新填写
		workbenchErrorBarWidget.showMessage("${getText('WOM.putInMaterialException.randon123456')}","f");
		return false;
		}
	}
	if($("#operateType").val() == 'submit'){//提交
		if(ismesProBatch){//启用物料批号
			if(wlphid==""){
				$("#putMaterialException_batchNumObj_batchText").css("background-color","#fcd6d6");	//input背景粉色
				$("#putMaterialException_batchNumObj_batchTextdiv").css("background-color","#fcd6d6");	//div背景粉色
				$("#putMaterialException_batchNumObj_batchTextdiv").css("border","1px solid red");//边框红色
				//实际物料批号不能为空
				workbenchErrorBarWidget.showMessage("${getText('WOM.putInMaterialException.wlphnotnull')}","f");
				return false;
			}
		}else{
			if(wlphtext==""){
				$("#putMaterialException_batchNumStr").css("background-color","#fcd6d6");	//input背景粉色
				$("#putMaterialException_batchNumStr").css("border","1px solid red");//边框红色
				workbenchErrorBarWidget.showMessage("${getText('WOM.putInMaterialException.wlphnotnull')}","f");
				return false;
			}
		}
	}
	
		if($("input[name='putMaterialException.oldLossNum']").val()==""){
			$("input[name='putMaterialException.oldLossNum']").val("0");
					}
		if($("input[name='putMaterialException.lossNum']").val()==""){
			$("input[name='putMaterialException.lossNum']").val("0");
		}
		};
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  WOM.putInMaterialException.putMaterialException.putinExceptionEdit.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_main_div").hide();
				},100);
				//CUI("#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.showThis = function(){
			if(!CUI("#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_main_div").is(':visible')) {
				CUI("#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			WOM.putInMaterialException.putMaterialException.putinExceptionEdit.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "WOM_putInMaterialException_putMaterialException_putinExceptionEdit_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=WOM&modelName=WOM_7.5.0.0_putInMaterialException_PutMaterialException&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.putInMaterialException.putMaterialException.putinExceptionEdit.auditDialog.show();
			</#if>
		}
		
		
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.showInfoDialog=function(mode){
			
			WOM.putInMaterialException.putMaterialException.putinExceptionEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "WOM_putInMaterialException_putMaterialException_putinExceptionEdit_dealInfo",
				modal:true,
				height:500,
				width: 950,//适应国际化版
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.putInMaterialException.putMaterialException.putinExceptionEdit.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=WOM_7.5.0.0_putInMaterialException");
			}
		}
		
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/WOM/putInMaterialException/putMaterialException/dealInfo-list.action&dlTableInfoId=${(putMaterialException.tableInfoId)?default('')}");
			}
		}
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.showFlowInfo=function(){
		     //IE8环境下使用旧版flash流程展现页面，其他情况使用html5流程展现页面
		    var browser=navigator.appName; 
			var b_version=navigator.appVersion; 
			var version=b_version.split(";"); 
			var trim_Version=version[1]&&version[1].replace(/[ ]/g,"");
			var isIE8=(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE8.0")||($.browser.msie&&(Number($.browser.version)<= 8));//IE8兼容视图模式下浏览器版本判断逻辑补充
			if(CUI.trim(CUI("#flowDiv").html())==""){
				if(isIE8){
				    CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=WOM_7.5.0.0_putInMaterialException_PutMaterialException&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(putMaterialException.tableInfoId)?default('')}");
				}else{
				    CUI("#flowDiv").load("/ec/workflow/flowViewH5.action?env=runtime&modelCode=WOM_7.5.0.0_putInMaterialException_PutMaterialException&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(putMaterialException.tableInfoId)?default('')}");
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
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.supervision=function(){
			WOM.putInMaterialException.putMaterialException.putinExceptionEdit.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(putMaterialException.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				WOM.putInMaterialException.putMaterialException.putinExceptionEdit.modifyOwnerStaffDialog.show();
		}
		
function setBackInfo(){
		//实际物料批号callback函数 冗余到批号编码,方便list页面拖动编码的实际批号
		var batchObj=$("[name='putMaterialException.batchNumObj.batchText']").val()
		if(""!=batchObj){
			$("[name='putMaterialException.batchNumStr']").val(batchObj);
		}
	
	
}
function setBackfunc(){
			//选择物料之后，设置实际投料数量默认值为投料数量；设置实际损耗数量为损耗数量
			var batchObj=$("[name='putMaterialException.batchNumObj.batchText']").val()
			var useNum=$("#putMaterialException_putinPartID_useNum").val();//投料数量
			var lossNum=$("#putMaterialException_putinPartID_lossNum").val();//损耗数量
			if(""!=useNum){
				$("#putMaterialException_useNum").val(useNum);
				$("#putMaterialException_oldUseNum").val(useNum);//冗余原投料数量，用于view和List视图
			}
			if(""!=lossNum){
				$("#putMaterialException_lossNum").val(lossNum);
				$("#putMaterialException_oldLossNum").val(lossNum);//冗余原损耗数量
			}
			//投料明细单物品id
			var putinId=$("[name='putMaterialException.putinPartID.productId.id']").val();
			//现存量物品id
			var goodId=$("[name='putMaterialException.batchNumObj.good.id']").val();
			if(putinId!=goodId){
				//更改物料编码重置实际物料批号
				$('input[name="putMaterialException.batchNumObj.batchText"]').val('');
				$('input[name="putMaterialException.batchNumStr"]').val('');
			}
			
			var wlph=$("input[name='putMaterialException.putinPartID.batchNum']").val();//物料批号
			var wlphid=$("input[name='putMaterialException.putinPartID.proBatch.id']").val();//物料批号id
			var sjwlphstr=$("input[name='putMaterialException.batchNumStr']").val();//实际物料批号
			if(ismesProBatch){//启用MES物料管理
				$("input[name='putMaterialException.batchNumObj.batchText']").val(wlph);
				$("input[name='putMaterialException.batchNumObj.id']").val(wlphid);
				$("input[name='putMaterialException.batchNumStr']").val(wlph);
				$('#putMaterialException_batchNumObj_batchText_mneTipLabel').hide()
			}else{//不启用MES物料管理
				$("input[name='putMaterialException.batchNumStr']").val(wlph);
			}
			$("input[name='putMaterialException.oldBatchNumStr']").val(wlph);
			var hwbm=$("input[name='putMaterialException.putinPartID.storeID.placeSetCode']").val();//货位编码
			var hwmc=$("input[name='putMaterialException.putinPartID.storeID.placeSetName']").val();//货位名称
			$("input[name='putMaterialException.batchNumObj.placeSet.placeSetCode']").val(hwbm);//实际货位编码
			$("input[name='putMaterialException.batchNumObj.placeSet.placeSetName']").val(hwmc);//实际货位名称
			
			$("input[name='putMaterialException.batchNumObj.wareID.wareCode']").val($("input[name='putMaterialException.putinPartID.wareID.wareCode']").val());//实际仓库编码
			$("input[name='putMaterialException.batchNumObj.wareID.wareName']").val($("input[name='putMaterialException.putinPartID.wareID.wareName']").val());//实际仓库名称
			
		
}
function checkproductCode(){
	//投料单Id
	var putinId=$("[name='putMaterialException.putinID.id']").val();
	//投料明细带出的投料单表头id
	var partPutinId=$("input[name='putMaterialException.putinPartID.headId.id']").val();
	if(putinId!=partPutinId){
		//在更改投料单时将带出的重置
		$('input[name="putMaterialException.putinPartID.productId.productCode"]').val('');
		$('input[name="putMaterialException.putinPartID.productId.productName"]').val('');
		$('input[name="putMaterialException.putinPartID.batchNum"]').val('');
		$('input[name="putMaterialException.putinPartID.wareID.wareCode"]').val('');
		$('input[name="putMaterialException.putinPartID.wareID.wareName"]').val('');
		$('input[name="putMaterialException.putinPartID.storeID.placeSetCode"]').val('');
		$('input[name="putMaterialException.putinPartID.storeID.placeSetName"]').val('');
		$('input[name="putMaterialException.putinPartID.useNum"]').val('');
		$('input[name="putMaterialException.putinPartID.lossNum"]').val('');
		$('input[name="putMaterialException.useNum"]').val('');
		$('input[name="putMaterialException.lossNum"]').val('');
		$('input[name="putMaterialException.batchNumObj.batchText"]').val('');
		$('input[name="putMaterialException.batchNumStr"]').val('');
		$('input[name="putMaterialException.putinPartID.productId.id"]').val('');
		$('input[name="putMaterialException.putinPartID.id"]').val('');
		$('input[name="putMaterialException.putinPartID.headId.id"]').val('');
		$('input[name="putMaterialException.putinPartID.headId.id"]').val('');
		$('input[name="putMaterialException.batchNumObj.placeSet.placeSetCode"]').val('');
		$('input[name="putMaterialException.batchNumObj.placeSet.placeSetName"]').val('');	
	}

}

		/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_putInMaterialException_putinExceptionEdit,js,WOM_7.5.0.0_putInMaterialException_PutMaterialException,WOM_7.5.0.0) */
// 自定义代码
var url="/WOM/putInMaterialException/putMaterialException/getIsmesProBatch.action";
var ismesProBatch="";
	$.ajax({
		type:'POST',
		url:url,
		async:false,
		success:function(msg){
			if(msg!=null){
				ismesProBatch=msg.result;
			}
		}
	});

	//物品编码扫把按钮重写
		function putMaterialException_putinPartID_productId_productCode_delete(){
	   putMaterialException_putinPartID_productId_productCode_prefix = '',
	   //$("#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form #putMaterialException_putinPartID_productId_productCode").val('');
	   //var arr="putMaterialException.putinPartID.productId.productCode".split('.');
	   //for(var i=0;i<arr.length-1;i++) {
	   //	if(i!=0) {
	   //		putMaterialException_putinPartID_productId_productCode_prefix += '.';
	   //	}
	   //	putMaterialException_putinPartID_productId_productCode_prefix += arr[i];
	   //}
	   //CUI('#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form input[name="'+putMaterialException_putinPartID_productId_productCode_prefix + '.id"]').val('');
	   CUI.clearInput("putMaterialException.putinPartID.productId.productCode");
	   CUI("#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form #putMaterialException_putinPartID_productId_productCode").attr('valuebak','');
	   CUI('#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form input[name="'+putMaterialException_putinPartID_productId_productCode_prefix + '.id"]').attr('valuebak','');
		//实际物料批号扫把
		putMaterialException_batchNumObj_batchText_delete();
		$('input[name="putMaterialException.putinPartID.batchNum"]').val('');
		$('input[name="putMaterialException.putinPartID.wareID.wareCode"]').val('');
		$('input[name="putMaterialException.putinPartID.wareID.wareName"]').val('');
		$('input[name="putMaterialException.putinPartID.storeID.placeSetCode"]').val('');
		$('input[name="putMaterialException.putinPartID.storeID.placeSetName"]').val('');
		$('input[name="putMaterialException.putinPartID.useNum"]').val('');
		$('input[name="putMaterialException.putinPartID.lossNum"]').val('');
		$('input[name="putMaterialException.useNum"]').val('');
		$('input[name="putMaterialException.lossNum"]').val('');
		$('input[name="putMaterialException.putinPartID.batchNum"]').val('');
		$('input[name="putMaterialException.batchNumStr"]').val('');
		$('input[name="putMaterialException.putinPartID.id"]').val('');
		$('input[name="putMaterialException.putinPartID.headId.id"]').val('');
		$('input[name="putMaterialException.putinPartID.proBatch.id"]').val('');
		$('input[name="putMaterialException.oldBatchNumStr"]').val('');
		$('input[name="putMaterialException.oldLossNum"]').val('');
		$('input[name="putMaterialException.oldUseNum"]').val('');
	}
	//重写投料单扫把
	function putMaterialException_putinID_tableNo_delete(){
	   putMaterialException_putinID_tableNo_prefix = '',
	   //$("#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form #putMaterialException_putinID_tableNo").val('');
	   //var arr="putMaterialException.putinID.tableNo".split('.');
	   //for(var i=0;i<arr.length-1;i++) {
	   //	if(i!=0) {
	   //		putMaterialException_putinID_tableNo_prefix += '.';
	   //	}
	   //	putMaterialException_putinID_tableNo_prefix += arr[i];
	   //}
	   //CUI('#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form input[name="'+putMaterialException_putinID_tableNo_prefix + '.id"]').val('');
	   CUI.clearInput("putMaterialException.putinID.tableNo");
	   CUI("#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form #putMaterialException_putinID_tableNo").attr('valuebak','');
	   CUI('#WOM_putInMaterialException_putMaterialException_putinExceptionEdit_form input[name="'+putMaterialException_putinID_tableNo_prefix + '.id"]').attr('valuebak','');
		//调用物品编码扫把
		putMaterialException_putinPartID_productId_productCode_delete();
	}
/* CUSTOM CODE END */
		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.onloadForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_putInMaterialException_putinExceptionEdit,onloadForProduct,WOM_7.5.0.0_putInMaterialException_PutMaterialException,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		}

		WOM.putInMaterialException.putMaterialException.putinExceptionEdit.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_putInMaterialException_putinExceptionEdit,onsaveForProduct,WOM_7.5.0.0_putInMaterialException_PutMaterialException,WOM_7.5.0.0) */
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
				<div class="sidebar-top"><a href="#"  onclick="WOM.putInMaterialException.putMaterialException.putinExceptionEdit.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="WOM.putInMaterialException.putMaterialException.putinExceptionEdit.showBusinessList('${l.relatingModel.code.replace('.','')}',${(putMaterialException.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
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