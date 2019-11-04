<!-- MESBasic_1/product/prodEditforJS -->
<#assign isWorkflow = false> 
<#assign isAttachment = true> 
	<#assign  fileuploadType = "MESBasic_product_product">
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
<#-- 实体对象 -->
<#assign tableObj = product>
<#-- 命名空间 -->
<#assign editPageNs = "MESBasic.product.product.prodEditforJS">
<#-- 模型名称-->
<#assign modelName = "product">
<#-- 视图编码-->
<#assign viewCode = "MESBasic_1_product_prodEditforJS">
<#-- 实体编码-->
<#assign entity_code = "MESBasic_1_product">
<#-- 视图名称-->
<#assign viewName = "prodEditforJS">
<#-- datagrid编码-->
<#assign datagridCode = "MESBasic_product_product_prodEditforJS_datagrids">
<#-- 首字母大写的模型名称-->
<#assign upcaseModelName = "Product">
<#-- 页面打印按钮 -->
<#assign isPrint = false>
<#-- 控件打印按钮 -->
<#assign controlPrint = false>
<#-- 是否只读 -->
<#assign allReadOnly = false>
<#-- 是否是参照视图 -->
<#assign isReference =true>
<#-- 是否可弃审 -->
<#assign retrialFlag = false>
<#-- formid -->
<#assign editFormId = "MESBasic_product_product_prodEditforJS_form">
<#-- 待办状态 -->
<#assign pendingstatus =( product.pending.taskDescription)!>
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
        <#assign configTitle = getText('MESBasic.viewtitle.randon1572260450220')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		
		#MESBasic_product_product_prodEditforJS_form{float:left;width:100%;}
		
		
		</style>
		<script type="text/javascript">
			CUI.ns('MESBasic.product.product.prodEditforJS');
			MESBasic.product.product.prodEditforJS.currentUser = ${userJson};
			MESBasic.product.product.prodEditforJS.currentStaff = ${staffJson};
			MESBasic.product.product.prodEditforJS.currentDepartment = ${deptJson};
			MESBasic.product.product.prodEditforJS.currentPosition = ${postJson};
			MESBasic.product.product.prodEditforJS.currentCompany = ${compJson};
		</script>
		<!-- CUSTOM CODE START(view-EDIT-MESBasic_1_product_prodEditforJS,head,MESBasic_1_product_Product,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
    </head>
	<body class="view-edit ">
		<@loadpanel newType=true/>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="product.unitGroup.id,product.productBuyUnit.id,product.ware.id,product.productBaseUnit.id,product.factory.id,product.checkIndex.id,product.modifyPerson.id,product.creator.id,product.productCostUnit.id,product.limsUnit.id,product.id,product.deleteStaff.id,product.storeUnit.id,product.storeSet.id,product.productListID.id,product.saleUnit.id," onsubmitMethod="MESBasic.product.product.prodEditforJS.beforeSubmitMethod()" id="MESBasic_product_product_prodEditforJS_form" namespace="/MESBasic/product/product/prodEditforJS" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=MESBasic_1_product_Product&_bapFieldPermissonModelName_=Product" editPageNs="MESBasic.product.product.prodEditforJS" callback="MESBasic.product.product.prodEditforJS._callBackInfo" ecform="true">
			<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
			<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="MESBasic_product_product_prodEditforJS_main_div">
			<div class="edit-head">
				<#include "../../../ec/tableInfo/operateheadbar_all.ftl" >
				<#include "../../../ec/tableInfo/creatorInfo.ftl" >
			</div>
    		<div class="edit-main" id="MESBasic_product_product_prodEditforJS">
    			<div class="edit-content">
    	<#include "../../../ec/tableInfo/formparam.ftl" >				
					<input type="hidden" name="product.unitGroup.id" value="${(product.unitGroup.id)!""}" originalvalue="${(product.unitGroup.id)!""}"/>
					<input type="hidden" name="product.productBuyUnit.id" value="${(product.productBuyUnit.id)!""}" originalvalue="${(product.productBuyUnit.id)!""}"/>
					<input type="hidden" name="product.ware.id" value="${(product.ware.id)!""}" originalvalue="${(product.ware.id)!""}"/>
					<input type="hidden" name="product.productBaseUnit.id" value="${(product.productBaseUnit.id)!""}" originalvalue="${(product.productBaseUnit.id)!""}"/>
					<input type="hidden" name="product.factory.id" value="${(product.factory.id)!""}" originalvalue="${(product.factory.id)!""}"/>
					<input type="hidden" name="product.checkIndex.id" value="${(product.checkIndex.id)!""}" originalvalue="${(product.checkIndex.id)!""}"/>
					<input type="hidden" name="product.modifyPerson.id" value="${(product.modifyPerson.id)!""}" originalvalue="${(product.modifyPerson.id)!""}"/>
					<input type="hidden" name="product.creator.id" value="${(product.creator.id)!""}" originalvalue="${(product.creator.id)!""}"/>
					<input type="hidden" name="product.productCostUnit.id" value="${(product.productCostUnit.id)!""}" originalvalue="${(product.productCostUnit.id)!""}"/>
					<input type="hidden" name="product.limsUnit.id" value="${(product.limsUnit.id)!""}" originalvalue="${(product.limsUnit.id)!""}"/>
					<input type="hidden" name="product.id" value="${(product.id)!""}" originalvalue="${(product.id)!""}"/>
					<input type="hidden" name="product.deleteStaff.id" value="${(product.deleteStaff.id)!""}" originalvalue="${(product.deleteStaff.id)!""}"/>
					<input type="hidden" name="product.storeUnit.id" value="${(product.storeUnit.id)!""}" originalvalue="${(product.storeUnit.id)!""}"/>
					<input type="hidden" name="product.storeSet.id" value="${(product.storeSet.id)!""}" originalvalue="${(product.storeSet.id)!""}"/>
					<input type="hidden" name="product.productListID.id" value="${(product.productListID.id)!""}" originalvalue="${(product.productListID.id)!""}"/>
					<input type="hidden" name="product.saleUnit.id" value="${(product.saleUnit.id)!""}" originalvalue="${(product.saleUnit.id)!""}"/>
		 <ul class="edit-tabs">
			<li>${getText('ec.view.commoninfo')}</li>
			<li>${getText('MESBasic.tabname.radion1470127664920')}</li>
			<li>${getText('MESBasic.tabname.radion1471508110668')}</li>
			<li>${getText('MESBasic.tabname.radion1524759016428')}</li>
			<li>${getText('MESBasic.tabname.radion1530515575226')}</li>
		</ul>
<script type="text/javascript">
var attcountid = "MESBasic_product_product_prodEditforJS_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=MESBasic_1_product', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>				<div class="edit-panes edit-panes-w edit-container clearfix">
			<div class="clearfix pd_bottom">
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415772644833')}" >${getText('MESBasic.propertydisplayName.radion1415772644833')}</label>
				</td>
				
						<#assign product_productCode_defaultValue  = ''>
							 							<#assign product_productCode_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="product.productCode" id="product_productCode"  style=";" originalvalue="<#if !newObj || (product.productCode)?has_content>${(product.productCode?html)!}<#else>${product_productCode_defaultValue!}</#if>" value="<#if !newObj || (product.productCode)?has_content>${(product.productCode?html)!}<#else>${product_productCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415772740737')}" >${getText('MESBasic.propertydisplayName.radion1415772740737')}</label>
				</td>
				
						<#assign product_productName_defaultValue  = ''>
							 							<#assign product_productName_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="product.productName" id="product_productName"  style=";" originalvalue="<#if !newObj || (product.productName)?has_content>${(product.productName?html)!}<#else>${product_productName_defaultValue!}</#if>" value="<#if !newObj || (product.productName)?has_content>${(product.productName?html)!}<#else>${product_productName_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1450083209826')}" >${getText('MESBasic.propertydisplayName.randon1450083209826')}</label>
				</td>
				
						<#assign product_productAllas_defaultValue  = ''>
							 							<#assign product_productAllas_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="product.productAllas" id="product_productAllas"  style=";" originalvalue="<#if !newObj || (product.productAllas)?has_content>${(product.productAllas?html)!}<#else>${product_productAllas_defaultValue!}</#if>" value="<#if !newObj || (product.productAllas)?has_content>${(product.productAllas?html)!}<#else>${product_productAllas_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1398234617226')}" >${getText('X6Basic.propertydisplayName.radion1398234617226')}</label>
				</td>
				
						<#assign product_unitGroup_name_defaultValue  = ''>
														<#assign product_unitGroup_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('X6Basic.viewtitle.radion1398236389691')}" viewType="${viewType!}" deValue="${product_unitGroup_name_defaultValue!}" conditionfunc="MESBasic.product.product.prodEditforJS._querycustomFunc('product_unitGroup_name')"  value="${(product.unitGroup.name)!}" displayFieldName="name" name="product.unitGroup.name" id="product_unitGroup_name" type="other" url="/X6Basic/unitGroup/unitGroups/ref.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_prodEditforJS_form" editCustomCallback="unit();" refViewCode="X6Basic_1.0_unitGroup_ref"  onkeyupfuncname="unit();_callback_product_unitGroup_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(product.id)?? && (product.unitGroup.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.unitGroup.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_prodEditforJS_form',obj, 'product.unitGroup', '/X6Basic/unitGroup/unitGroups/ref.action');
												CUI.commonFills('MESBasic_product_product_prodEditforJS_form', 'product.unitGroup',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion139823564048301')}" >${getText('MESBasic.propertydisplayName.radion139823564048301')}</label>
				</td>
				
						<#assign product_productBaseUnit_name_defaultValue  = ''>
														<#assign product_productBaseUnit_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('X6Basic.viewtitle.radion1398240433147')}" viewType="${viewType!}" deValue="${product_productBaseUnit_name_defaultValue!}" conditionfunc="MESBasic.product.product.prodEditforJS._querycustomFunc('product_productBaseUnit_name')"  value="${(product.productBaseUnit.name)!}" displayFieldName="name" name="product.productBaseUnit.name" id="product_productBaseUnit_name" type="other" url="/X6Basic/unitGroup/baseUnit/unitRef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_prodEditforJS_form" editCustomCallback=";" refViewCode="X6Basic_1.0_unitGroup_unitRef"  onkeyupfuncname=";_callback_product_productBaseUnit_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(product.id)?? && (product.productBaseUnit.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.productBaseUnit.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_prodEditforJS_form',obj, 'product.productBaseUnit', '/X6Basic/unitGroup/baseUnit/unitRef.action');
												CUI.commonFills('MESBasic_product_product_prodEditforJS_form', 'product.productBaseUnit',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion139823564048302')}" >${getText('MESBasic.propertydisplayName.radion139823564048302')}</label>
				</td>
				
						<#assign product_storeUnit_name_defaultValue  = ''>
														<#assign product_storeUnit_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('X6Basic.viewtitle.randon1478506529624')}" viewType="${viewType!}" deValue="${product_storeUnit_name_defaultValue!}" conditionfunc="MESBasic.product.product.prodEditforJS._querycustomFunc('product_storeUnit_name')"  value="${(product.storeUnit.name)!}" displayFieldName="name" name="product.storeUnit.name" id="product_storeUnit_name" type="other" url="/X6Basic/unitGroup/baseUnit/unitRef2.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_prodEditforJS_form" editCustomCallback=";" refViewCode="X6Basic_1.0_unitGroup_unitRef2"  onkeyupfuncname=";_callback_product_storeUnit_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(product.id)?? && (product.storeUnit.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.storeUnit.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_prodEditforJS_form',obj, 'product.storeUnit', '/X6Basic/unitGroup/baseUnit/unitRef2.action');
												CUI.commonFills('MESBasic_product_product_prodEditforJS_form', 'product.storeUnit',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
									MESBasic.product.product.prodEditforJS.query_product_storeUnit_name = function() {
										var unitID = $("input[name='product.unitGroup.id']").val();
return "&unitID="+unitID;
									}
								</script>
							
				</td>
				</tr><tr >
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion139823564048303')}" >${getText('MESBasic.propertydisplayName.radion139823564048303')}</label>
				</td>
				
						<#assign product_productBuyUnit_name_defaultValue  = ''>
														<#assign product_productBuyUnit_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('X6Basic.viewtitle.randon1478506529624')}" viewType="${viewType!}" deValue="${product_productBuyUnit_name_defaultValue!}" conditionfunc="MESBasic.product.product.prodEditforJS._querycustomFunc('product_productBuyUnit_name')"  value="${(product.productBuyUnit.name)!}" displayFieldName="name" name="product.productBuyUnit.name" id="product_productBuyUnit_name" type="other" url="/X6Basic/unitGroup/baseUnit/unitRef2.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_prodEditforJS_form" editCustomCallback=";" refViewCode="X6Basic_1.0_unitGroup_unitRef2"  onkeyupfuncname=";_callback_product_productBuyUnit_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(product.id)?? && (product.productBuyUnit.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.productBuyUnit.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_prodEditforJS_form',obj, 'product.productBuyUnit', '/X6Basic/unitGroup/baseUnit/unitRef2.action');
												CUI.commonFills('MESBasic_product_product_prodEditforJS_form', 'product.productBuyUnit',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
									MESBasic.product.product.prodEditforJS.query_product_productBuyUnit_name = function() {
										var unitID = $("input[name='product.unitGroup.id']").val();
return "&unitID="+unitID;
									}
								</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion139823564048304')}" >${getText('MESBasic.propertydisplayName.radion139823564048304')}</label>
				</td>
				
						<#assign product_saleUnit_name_defaultValue  = ''>
														<#assign product_saleUnit_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('X6Basic.viewtitle.randon1478506529624')}" viewType="${viewType!}" deValue="${product_saleUnit_name_defaultValue!}" conditionfunc="MESBasic.product.product.prodEditforJS._querycustomFunc('product_saleUnit_name')"  value="${(product.saleUnit.name)!}" displayFieldName="name" name="product.saleUnit.name" id="product_saleUnit_name" type="other" url="/X6Basic/unitGroup/baseUnit/unitRef2.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_prodEditforJS_form" editCustomCallback=";" refViewCode="X6Basic_1.0_unitGroup_unitRef2"  onkeyupfuncname=";_callback_product_saleUnit_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(product.id)?? && (product.saleUnit.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.saleUnit.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_prodEditforJS_form',obj, 'product.saleUnit', '/X6Basic/unitGroup/baseUnit/unitRef2.action');
												CUI.commonFills('MESBasic_product_product_prodEditforJS_form', 'product.saleUnit',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
									MESBasic.product.product.prodEditforJS.query_product_saleUnit_name = function() {
										var unitID = $("input[name='product.unitGroup.id']").val();
return "&unitID="+unitID;
									}
								</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion139823564048305')}" >${getText('MESBasic.propertydisplayName.radion139823564048305')}</label>
				</td>
				
						<#assign product_productCostUnit_name_defaultValue  = ''>
														<#assign product_productCostUnit_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('X6Basic.viewtitle.randon1478506529624')}" viewType="${viewType!}" deValue="${product_productCostUnit_name_defaultValue!}" conditionfunc="MESBasic.product.product.prodEditforJS._querycustomFunc('product_productCostUnit_name')"  value="${(product.productCostUnit.name)!}" displayFieldName="name" name="product.productCostUnit.name" id="product_productCostUnit_name" type="other" url="/X6Basic/unitGroup/baseUnit/unitRef2.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_prodEditforJS_form" editCustomCallback=";" refViewCode="X6Basic_1.0_unitGroup_unitRef2"  onkeyupfuncname=";_callback_product_productCostUnit_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(product.id)?? && (product.productCostUnit.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.productCostUnit.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_prodEditforJS_form',obj, 'product.productCostUnit', '/X6Basic/unitGroup/baseUnit/unitRef2.action');
												CUI.commonFills('MESBasic_product_product_prodEditforJS_form', 'product.productCostUnit',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
									MESBasic.product.product.prodEditforJS.query_product_productCostUnit_name = function() {
										var unitID = $("input[name='product.unitGroup.id']").val();
return "&unitID="+unitID;
									}
								</script>
							
				</td>
				</tr><tr >
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1518140257422')}" >${getText('MESBasic.propertydisplayName.randon1518140257422')}</label>
				</td>
				
						<#assign product_limsUnit_name_defaultValue  = ''>
														<#assign product_limsUnit_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('X6Basic.viewtitle.randon1478506529624')}" viewType="${viewType!}" deValue="${product_limsUnit_name_defaultValue!}" conditionfunc="MESBasic.product.product.prodEditforJS._querycustomFunc('product_limsUnit_name')"  value="${(product.limsUnit.name)!}" displayFieldName="name" name="product.limsUnit.name" id="product_limsUnit_name" type="other" url="/X6Basic/unitGroup/baseUnit/unitRef2.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_prodEditforJS_form" editCustomCallback=";" refViewCode="X6Basic_1.0_unitGroup_unitRef2"  onkeyupfuncname=";_callback_product_limsUnit_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(product.id)?? && (product.limsUnit.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.limsUnit.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_prodEditforJS_form',obj, 'product.limsUnit', '/X6Basic/unitGroup/baseUnit/unitRef2.action');
												CUI.commonFills('MESBasic_product_product_prodEditforJS_form', 'product.limsUnit',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
									MESBasic.product.product.prodEditforJS.query_product_limsUnit_name = function() {
										var unitID = $("input[name='product.unitGroup.id']").val();
return "&unitID="+unitID;
									}
								</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1423897648875')}" >${getText('MESBasic.propertydisplayName.randon1423897648875')}</label>
				</td>
				
						<#assign product_prodType_defaultValue  = ''>
							 							<#assign product_prodType_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${product_prodType_defaultValue!}" formId="MESBasic_product_product_prodEditforJS_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="product.prodType" code="ProductType" value="${(product.prodType)!}" seniorSystemCode=true />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_product_product_prodEditforJS_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="product.prodType" code="ProductType" value="${(product.prodType)!}" seniorSystemCode=true />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1572250978514')}" >${getText('MESBasic.propertydisplayName.randon1572250978514')}</label>
				</td>
				
						<#assign product_cad_defaultValue  = ''>
							 					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="product.cad" id="product_cad"  style=";" originalvalue="<#if !newObj || (product.cad)?has_content>${(product.cad?html)!}<#else>${product_cad_defaultValue!}</#if>" value="<#if !newObj || (product.cad)?has_content>${(product.cad?html)!}<#else>${product_cad_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1572260054590')}" >${getText('MESBasic.propertydisplayName.randon1572260054590')}</label>
				</td>
				
						<#assign product_autoSupply_defaultValue  = 'MESBasic_AutoSupply/01'>
							 					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${product_autoSupply_defaultValue!}" formId="MESBasic_product_product_prodEditforJS_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="product.autoSupply.id" code="MESBasic_AutoSupply" value="${(product.autoSupply.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_product_product_prodEditforJS_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="product.autoSupply.id" code="MESBasic_AutoSupply" value="${(product.autoSupply.id)!}"  />
									
								</#if>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertyshowName.randon1572310310622.flag')}" >${getText('MESBasic.propertyshowName.randon1572310310622.flag')}</label>
				</td>
				
						<#assign product_factory_code_defaultValue  = ''>
														<#assign product_factory_code_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('MESBasic.viewtitle.randon1490322427886')}" viewType="${viewType!}" deValue="${product_factory_code_defaultValue!}" conditionfunc="MESBasic.product.product.prodEditforJS._querycustomFunc('product_factory_code')"  value="${(product.factory.code)!}" displayFieldName="code" name="product.factory.code" id="product_factory_code" type="other" url="/MESBasic/factoryModel/factoryModel/factoryProductRef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_prodEditforJS_form" editCustomCallback=";" refViewCode="MESBasic_1_factoryModel_factoryProductRef"  onkeyupfuncname=";_callback_product_factory_code(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(product.id)?? && (product.factory.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.factory.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_prodEditforJS_form',obj, 'product.factory', '/MESBasic/factoryModel/factoryModel/factoryProductRef.action');
												CUI.commonFills('MESBasic_product_product_prodEditforJS_form', 'product.factory',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
									MESBasic.product.product.prodEditforJS.query_product_factory_code = function() {
										var unitID = $("input[name='product.unitGroup.id']").val();
return "&unitID="+unitID;
									}
								</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertyshowName.randon1572310861836.flag')}" >${getText('MESBasic.propertyshowName.randon1572310861836.flag')}</label>
				</td>
				
						<#assign product_paRKINGSYS_defaultValue  = '默认方法'>
							 					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="product.paRKINGSYS" id="product_paRKINGSYS"  style=";" originalvalue="<#if !newObj || (product.paRKINGSYS)?has_content>${(product.paRKINGSYS?html)!}<#else>${product_paRKINGSYS_defaultValue!}</#if>" value="<#if !newObj || (product.paRKINGSYS)?has_content>${(product.paRKINGSYS?html)!}<#else>${product_paRKINGSYS_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1572260084075')}" >${getText('MESBasic.propertydisplayName.randon1572260084075')}</label>
				</td>
				
						<#assign product_mfgStockMode_defaultValue  = 'MESBasic_MFGMode/01'>
							 					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${product_mfgStockMode_defaultValue!}" formId="MESBasic_product_product_prodEditforJS_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="product.mfgStockMode.id" code="MESBasic_MFGMode" value="${(product.mfgStockMode.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_product_product_prodEditforJS_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="product.mfgStockMode.id" code="MESBasic_MFGMode" value="${(product.mfgStockMode.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1471517688085')}" >${getText('MESBasic.propertydisplayName.randon1471517688085')}</label>
				</td>
				
						<#assign product_checkMethodbap_defaultValue  = ''>
							 							<#assign product_checkMethodbap_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${product_checkMethodbap_defaultValue!}" formId="MESBasic_product_product_prodEditforJS_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="product.checkMethodbap.id" code="product_checkMethod" value="${(product.checkMethodbap.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_product_product_prodEditforJS_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="product.checkMethodbap.id" code="product_checkMethod" value="${(product.checkMethodbap.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1572251015400')}" >${getText('MESBasic.propertydisplayName.randon1572251015400')}</label>
				</td>
				
						<#assign product_minTargetStock_defaultValue  = '1000'>
							 					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="product.minTargetStock" id="product_minTargetStock"  style=";" originalvalue="<#if !newObj || (product.minTargetStock)?has_content>${(product.minTargetStock?html)!}<#else>${product_minTargetStock_defaultValue!}</#if>" value="<#if !newObj || (product.minTargetStock)?has_content>${(product.minTargetStock?html)!}<#else>${product_minTargetStock_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.staff.dimissionStaff_xls.staffName01')}" >${getText('MESBasic.staff.dimissionStaff_xls.staffName01')}</label>
				</td>
				
						<#assign product_creator_name_defaultValue  = 'currentUser'>
												<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.view.reference')}" viewType="readonly" deValue="${product_creator_name_defaultValue!}" conditionfunc="MESBasic.product.product.prodEditforJS._querycustomFunc('product_creator_name')" view=true  value="${(product.creator.name)!}" displayFieldName="name" name="product.creator.name" id="product_creator_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_prodEditforJS_form" editCustomCallback=";" refViewCode="sysbase_1.0_staff_ref" onkeyupfuncname=";_callback_product_creator_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (product_creator_name_defaultValue)=='currentUser'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.id}'};
											obj = foundation.common.getObject('MESBasic_product_product_prodEditforJS_form',obj, 'product.creator', '/foundation/staff/common/staffListFrameset.action');
											CUI.commonFills('MESBasic_product_product_prodEditforJS_form', 'product.creator',obj,true);
											$('input:hidden[name="product.creator.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(product.id)?? && (product.creator.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.creator.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_prodEditforJS_form',obj, 'product.creator', '/foundation/staff/common/staffListFrameset.action');
												CUI.commonFills('MESBasic_product_product_prodEditforJS_form', 'product.creator',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.common.createTime')}" >${getText('MESBasic.common.createTime')}</label>
				</td>
				
						<#assign product_createTime_defaultValue  = 'currentTime'>
							 					<#if (product_createTime_defaultValue)?? &&(product_createTime_defaultValue)?has_content>
							<#assign product_createTime_defaultValue  = getDefaultDateTime(product_createTime_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  align="left" style="text-align: left;;" >
					
							
							<#if newObj && !(product.createTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="product.createTime" value="${product_createTime_defaultValue!}" type="dateTime"  id="product.createTime"  view=true cssStyle=""   align="left"/>
								
							<#else>
							<#if (product.createTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="product.createTime" value="${product.createTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="product.createTime"  view=true cssStyle="" align="left"  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="product.createTime" value="" type="dateTime" id="product.createTime" cssStyle=""  view=true align="left"/>
								
							</#if>
							</#if>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.staff.dimissionStaff_xls.staffName001')}" >${getText('MESBasic.staff.dimissionStaff_xls.staffName001')}</label>
				</td>
				
						<#assign product_modifyPerson_name_defaultValue  = 'currentUser'>
												<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.view.reference')}" viewType="readonly" deValue="${product_modifyPerson_name_defaultValue!}" conditionfunc="MESBasic.product.product.prodEditforJS._querycustomFunc('product_modifyPerson_name')" view=true  value="${(product.modifyPerson.name)!}" displayFieldName="name" name="product.modifyPerson.name" id="product_modifyPerson_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_prodEditforJS_form" editCustomCallback=";" refViewCode="sysbase_1.0_staff_ref" onkeyupfuncname=";_callback_product_modifyPerson_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (product_modifyPerson_name_defaultValue)=='currentUser'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.id}'};
											obj = foundation.common.getObject('MESBasic_product_product_prodEditforJS_form',obj, 'product.modifyPerson', '/foundation/staff/common/staffListFrameset.action');
											CUI.commonFills('MESBasic_product_product_prodEditforJS_form', 'product.modifyPerson',obj,true);
											$('input:hidden[name="product.modifyPerson.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(product.id)?? && (product.modifyPerson.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.modifyPerson.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_prodEditforJS_form',obj, 'product.modifyPerson', '/foundation/staff/common/staffListFrameset.action');
												CUI.commonFills('MESBasic_product_product_prodEditforJS_form', 'product.modifyPerson',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.common.modifyTime')}" >${getText('MESBasic.common.modifyTime')}</label>
				</td>
				
						<#assign product_modifyTime_defaultValue  = 'currentTime'>
							 							<#assign product_modifyTime_defaultValue  = 'currentTime'>
					<#if (product_modifyTime_defaultValue)?? &&(product_modifyTime_defaultValue)?has_content>
							<#assign product_modifyTime_defaultValue  = getDefaultDateTime(product_modifyTime_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  align="left" style="text-align: left;;" >
					
							
							<#if newObj && !(product.modifyTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="product.modifyTime" value="${product_modifyTime_defaultValue!}" type="dateTime"  id="product.modifyTime"  view=true cssStyle=""   align="left"/>
								
							<#else>
							<#if (product.modifyTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="product.modifyTime" value="${product.modifyTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="product.modifyTime"  view=true cssStyle="" align="left"  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="product.modifyTime" value="" type="dateTime" id="product.modifyTime" cssStyle=""  view=true align="left"/>
								
							</#if>
							</#if>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.staff.dimissionStaff_xls.staffName03')}" >${getText('MESBasic.staff.dimissionStaff_xls.staffName03')}</label>
				</td>
				
						<#assign product_deleteStaff_name_defaultValue  = ''>
														<#assign product_deleteStaff_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.view.reference')}" viewType="readonly" deValue="${product_deleteStaff_name_defaultValue!}" conditionfunc="MESBasic.product.product.prodEditforJS._querycustomFunc('product_deleteStaff_name')" view=true  value="${(product.deleteStaff.name)!}" displayFieldName="name" name="product.deleteStaff.name" id="product_deleteStaff_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_prodEditforJS_form" editCustomCallback=";" refViewCode="sysbase_1.0_staff_ref" onkeyupfuncname=";_callback_product_deleteStaff_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (product_deleteStaff_name_defaultValue)=='currentUser'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.id}'};
											obj = foundation.common.getObject('MESBasic_product_product_prodEditforJS_form',obj, 'product.deleteStaff', '/foundation/staff/common/staffListFrameset.action');
											CUI.commonFills('MESBasic_product_product_prodEditforJS_form', 'product.deleteStaff',obj,true);
											$('input:hidden[name="product.deleteStaff.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(product.id)?? && (product.deleteStaff.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.deleteStaff.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_prodEditforJS_form',obj, 'product.deleteStaff', '/foundation/staff/common/staffListFrameset.action');
												CUI.commonFills('MESBasic_product_product_prodEditforJS_form', 'product.deleteStaff',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.common.deleteTime')}" >${getText('MESBasic.common.deleteTime')}</label>
				</td>
				
						<#assign product_deleteTime_defaultValue  = ''>
							 							<#assign product_deleteTime_defaultValue  = ''>
					<#if (product_deleteTime_defaultValue)?? &&(product_deleteTime_defaultValue)?has_content>
							<#assign product_deleteTime_defaultValue  = getDefaultDateTime(product_deleteTime_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  align="left" style="text-align: left;;" >
					
							
							<#if newObj && !(product.deleteTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="product.deleteTime" value="${product_deleteTime_defaultValue!}" type="dateTime"  id="product.deleteTime"  view=true cssStyle=""   align="left"/>
								
							<#else>
							<#if (product.deleteTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="product.deleteTime" value="${product.deleteTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="product.deleteTime"  view=true cssStyle="" align="left"  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="product.deleteTime" value="" type="dateTime" id="product.deleteTime" cssStyle=""  view=true align="left"/>
								
							</#if>
							</#if>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1466392576656')}" >${getText('MESBasic.propertydisplayName.randon1466392576656')}</label>
				</td>
				
						<#assign product_isNeedWeigh_defaultValue  = ''>
							 							<#assign product_isNeedWeigh_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="product.isNeedWeigh_check" originalvalue="<#if !newObj><#if (product.isNeedWeigh)??>${(product.isNeedWeigh!false)?string('true','false')}<#else>false</#if><#elseif product_isNeedWeigh_defaultValue?has_content>${(product_isNeedWeigh_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (product.isNeedWeigh)??>${(product.isNeedWeigh!false)?string('true','false')}<#else>false</#if><#else>${(product_isNeedWeigh_defaultValue!true)?string}</#if>"  />
								
								<input property_type="BOOLEAN" type="hidden" name="product.isNeedWeigh" originalvalue="<#if ((product.isNeedWeigh)?? &&  product.isNeedWeigh)||(product_isNeedWeigh_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((product.isNeedWeigh)?? &&  product.isNeedWeigh)||(product_isNeedWeigh_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="product.isNeedWeigh_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="product.isNeedWeigh"]');
												CUI('input[name="product.isNeedWeigh_check"]').each(function(){
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1477448474026')}" >${getText('MESBasic.propertydisplayName.randon1477448474026')}</label>
				</td>
				
						<#assign product_desity_defaultValue  = ''>
							 							<#assign product_desity_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="product.desity" id="product_desity"  style=";" originalvalue="<#if newObj&& !(product.desity)?has_content>${product_desity_defaultValue!}<#elseif (product.desity)?has_content>#{(product.desity)!; m6M6}</#if>" value="<#if newObj&& !(product.desity)?has_content>${product_desity_defaultValue!}<#elseif (product.desity)?has_content>#{(product.desity)!; m6M6}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#product_desity').unbind('blur').bind('blur',function(){
										var percision = 6;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("MESBasic.propertydisplayName.randon1477448474026")}')}");
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1572259915750')}" >${getText('MESBasic.propertydisplayName.randon1572259915750')}</label>
				</td>
				
						<#assign product_purDeliverDate_defaultValue  = ''>
							 							<#assign product_purDeliverDate_defaultValue  = ''>
					<#if (product_purDeliverDate_defaultValue)?? &&(product_purDeliverDate_defaultValue)?has_content>
							<#assign product_purDeliverDate_defaultValue  = getDefaultDateTime(product_purDeliverDate_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  align="left" style="text-align: left;;" >
					
							
							<#if newObj && !(product.purDeliverDate)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="product.purDeliverDate" value="${product_purDeliverDate_defaultValue!}" type="dateTime"  id="product.purDeliverDate"  cssStyle=""   align="left"/>
								
							<#else>
							<#if (product.purDeliverDate)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="product.purDeliverDate" value="${product.purDeliverDate?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="product.purDeliverDate"  cssStyle="" align="left"  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="product.purDeliverDate" value="" type="dateTime" id="product.purDeliverDate" cssStyle=""  align="left"/>
								
							</#if>
							</#if>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1466391287048')}" >${getText('MESBasic.propertydisplayName.randon1466391287048')}</label>
				</td>
				
						<#assign product_standardPercent_defaultValue  = ''>
							 							<#assign product_standardPercent_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="product.standardPercent" id="product_standardPercent"  style=";" originalvalue="<#if newObj&& !(product.standardPercent)?has_content>${product_standardPercent_defaultValue!}<#elseif (product.standardPercent)?has_content>#{(product.standardPercent)!; m6M6}</#if>" value="<#if newObj&& !(product.standardPercent)?has_content>${product_standardPercent_defaultValue!}<#elseif (product.standardPercent)?has_content>#{(product.standardPercent)!; m6M6}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#product_standardPercent').unbind('blur').bind('blur',function(){
										var percision = 6;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("MESBasic.propertydisplayName.randon1466391287048")}')}");
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon146639220961804')}" >${getText('MESBasic.propertydisplayName.randon146639220961804')}</label>
				</td>
				
						<#assign product_checkIndex_name_defaultValue  = ''>
														<#assign product_checkIndex_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('MESBasic.viewtitle.randon1491480425419')}" viewType="${viewType!}" deValue="${product_checkIndex_name_defaultValue!}" conditionfunc="MESBasic.product.product.prodEditforJS._querycustomFunc('product_checkIndex_name')"  value="${(product.checkIndex.name)!}" displayFieldName="name" name="product.checkIndex.name" id="product_checkIndex_name" type="other" url="/MESBasic/checkIndex/qACheckIndex/checkIndexRef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_prodEditforJS_form" editCustomCallback=";" refViewCode="MESBasic_1_checkIndex_checkIndexRef"  onkeyupfuncname=";_callback_product_checkIndex_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(product.id)?? && (product.checkIndex.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.checkIndex.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_prodEditforJS_form',obj, 'product.checkIndex', '/MESBasic/checkIndex/qACheckIndex/checkIndexRef.action');
												CUI.commonFills('MESBasic_product_product_prodEditforJS_form', 'product.checkIndex',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1572259899105')}" >${getText('MESBasic.propertydisplayName.randon1572259899105')}</label>
				</td>
				
						<#assign product_purMoveUpDate_defaultValue  = ''>
							 							<#assign product_purMoveUpDate_defaultValue  = ''>
					<#if (product_purMoveUpDate_defaultValue)?? &&(product_purMoveUpDate_defaultValue)?has_content>
							<#assign product_purMoveUpDate_defaultValue  = getDefaultDateTime(product_purMoveUpDate_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  align="left" style="text-align: left;;" >
					
							
							<#if newObj && !(product.purMoveUpDate)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="product.purMoveUpDate" value="${product_purMoveUpDate_defaultValue!}" type="dateTime"  id="product.purMoveUpDate"  cssStyle=""   align="left"/>
								
							<#else>
							<#if (product.purMoveUpDate)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="product.purMoveUpDate" value="${product.purMoveUpDate?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="product.purMoveUpDate"  cssStyle="" align="left"  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="product.purMoveUpDate" value="" type="dateTime" id="product.purMoveUpDate" cssStyle=""  align="left"/>
								
							</#if>
							</#if>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1476758578712')}" >${getText('MESBasic.propertydisplayName.randon1476758578712')}</label>
				</td>
				
						<#assign product_productBePropCheck_defaultValue  = ''>
							 							<#assign product_productBePropCheck_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="product.productBePropCheck_check" originalvalue="<#if !newObj><#if (product.productBePropCheck)??>${(product.productBePropCheck!false)?string('true','false')}<#else>false</#if><#elseif product_productBePropCheck_defaultValue?has_content>${(product_productBePropCheck_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (product.productBePropCheck)??>${(product.productBePropCheck!false)?string('true','false')}<#else>false</#if><#else>${(product_productBePropCheck_defaultValue!true)?string}</#if>" onclick='propcheck()' />
								
								<input property_type="BOOLEAN" type="hidden" name="product.productBePropCheck" originalvalue="<#if ((product.productBePropCheck)?? &&  product.productBePropCheck)||(product_productBePropCheck_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((product.productBePropCheck)?? &&  product.productBePropCheck)||(product_productBePropCheck_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="product.productBePropCheck_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="product.productBePropCheck"]');
												CUI('input[name="product.productBePropCheck_check"]').each(function(){
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1504251320587')}" >${getText('MESBasic.propertydisplayName.randon1504251320587')}</label>
				</td>
				
						<#assign product_isPack_defaultValue  = ''>
							 							<#assign product_isPack_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="product.isPack_check" originalvalue="<#if !newObj><#if (product.isPack)??>${(product.isPack!false)?string('true','false')}<#else>false</#if><#elseif product_isPack_defaultValue?has_content>${(product_isPack_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (product.isPack)??>${(product.isPack!false)?string('true','false')}<#else>false</#if><#else>${(product_isPack_defaultValue!true)?string}</#if>"  />
								
								<input property_type="BOOLEAN" type="hidden" name="product.isPack" originalvalue="<#if ((product.isPack)?? &&  product.isPack)||(product_isPack_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((product.isPack)?? &&  product.isPack)||(product_isPack_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="product.isPack_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="product.isPack"]');
												CUI('input[name="product.isPack_check"]').each(function(){
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
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1416221870395')}" >${getText('MESBasic.propertydisplayName.radion1416221870395')}</label>
				</td>
				
						<#assign product_batch_defaultValue  = 'batch/batch01'>
							 					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${product_batch_defaultValue!}" formId="MESBasic_product_product_prodEditforJS_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="product.batch.id" code="batch" value="${(product.batch.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_product_product_prodEditforJS_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="product.batch.id" code="batch" value="${(product.batch.id)!}"  />
									
								</#if>
							
				</td>
				</tr><tr >
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1477460221745')}" >${getText('MESBasic.propertydisplayName.randon1477460221745')}</label>
				</td>
				
						<#assign product_productComment_defaultValue  = ''>
							 							<#assign product_productComment_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="product.productComment" id="product_productComment"  style=";" originalvalue="<#if !newObj || (product.productComment)?has_content>${(product.productComment?html)!}<#else>${product_productComment_defaultValue!}</#if>" value="<#if !newObj || (product.productComment)?has_content>${(product.productComment?html)!}<#else>${product_productComment_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1470366318608')}" >${getText('MESBasic.propertydisplayName.randon1470366318608')}</label>
				</td>
				
						<#assign product_dcontent_defaultValue  = ''>
							 							<#assign product_dcontent_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   colspan="5" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input fix-ie7-textarea"><textarea property_type="TEXT" id="product_dcontent" originalvalue="<#if !newObj || (product.dcontent)?has_content>${(product.dcontent?html)!}<#else>${product_dcontent_defaultValue?html}</#if>"  name="product.dcontent" class="cui-noborder-textarea cui-textarea-auto" style=";" ><#if !newObj || (product.dcontent)?has_content>${(product.dcontent)!}<#else>${product_dcontent_defaultValue}</#if></textarea></div>
							
				</td>
				</tr><tr >
				<td nullable=true class="edit-table-symbol"  align="right" style="text-align: right;;" >
							<label style="width:100%;color:blue;
 text-decoration: underline;;" value="${getText('MESBasic.propertyshowName.radion1471668130921')}" onclick='showProdDealInfo()'>${getText('MESBasic.propertyshowName.radion1471668130921')}</label>
				</td>
				
				<td class="edit-table-symbol" colspan="5">&nbsp;</td>
		</tr>
	</table>
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="display:none">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
				<td class="edit-table-symbol">&nbsp;</td>
				
						<#assign product_productListID_prodListName_defaultValue  = ''>
														<#assign product_productListID_prodListName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('MESBasic.viewtitle.randon1450081171634')}" viewType="${viewType!}" deValue="${product_productListID_prodListName_defaultValue!}" conditionfunc="MESBasic.product.product.prodEditforJS._querycustomFunc('product_productListID_prodListName')"  value="${(product.productListID.prodListName)!}" displayFieldName="prodListName" name="product.productListID.prodListName" id="product_productListID_prodListName" type="other" url="/MESBasic/prodList/baseProdList/refProdList.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_prodEditforJS_form" editCustomCallback=";" refViewCode="MESBasic_1_prodList_refProdList"  onkeyupfuncname=";_callback_product_productListID_prodListName(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(product.id)?? && (product.productListID.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.productListID.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_prodEditforJS_form',obj, 'product.productListID', '/MESBasic/prodList/baseProdList/refProdList.action');
												CUI.commonFills('MESBasic_product_product_prodEditforJS_form', 'product.productListID',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
						<#assign product_costPriceOri_defaultValue  = ''>
							 							<#assign product_costPriceOri_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="right" style="text-align: right;;" >
					
							
							<div class="fix-input">
									<input name="product.costPriceOri" id="product_costPriceOri"  style=";" originalvalue="<#if newObj&& !(product.costPriceOri)?has_content>${product_costPriceOri_defaultValue!}<#elseif (product.costPriceOri)?has_content>#{(product.costPriceOri)!; m4M4}</#if>" value="<#if newObj&& !(product.costPriceOri)?has_content>${product_costPriceOri_defaultValue!}<#elseif (product.costPriceOri)?has_content>#{(product.costPriceOri)!; m4M4}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#product_costPriceOri').unbind('blur').bind('blur',function(){
										var percision = 4;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("MESBasic.propertydisplayName.randon1477398572448")}')}");
											return;
										}
										if(parseInt(percision) > -1 && $(this).val()!=undefined && $(this).val()!='' && isDecimal($(this).val())){
											$(this).val(($(this).val() * 1).toFixed(percision));
										}
									});
								});
							</script>
							
				</td>
				
						<#assign product_protoType_defaultValue  = ''>
							 							<#assign product_protoType_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="product.protoType" id="product_protoType"  style=";" originalvalue="<#if !newObj || (product.protoType)?has_content>${(product.protoType?html)!}<#else>${product_protoType_defaultValue!}</#if>" value="<#if !newObj || (product.protoType)?has_content>${(product.protoType?html)!}<#else>${product_protoType_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
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
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1470120092391')}" >${getText('MESBasic.propertydisplayName.randon1470120092391')}</label>
				</td>
				
						<#assign product_mnecode_defaultValue  = ''>
							 							<#assign product_mnecode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="product.mnecode" id="product_mnecode"  style=";" originalvalue="<#if !newObj || (product.mnecode)?has_content>${(product.mnecode?html)!}<#else>${product_mnecode_defaultValue!}</#if>" value="<#if !newObj || (product.mnecode)?has_content>${(product.mnecode?html)!}<#else>${product_mnecode_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
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

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
			</div>
		</div>
			<div class="clearfix pd_bottom">
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon14840312398662323')}" >${getText('MESBasic.propertydisplayName.randon14840312398662323')}</label>
				</td>
				
						<#assign product_ware_wareCode_defaultValue  = ''>
														<#assign product_ware_wareCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}" viewType="${viewType!}" deValue="${product_ware_wareCode_defaultValue!}" conditionfunc="MESBasic.product.product.prodEditforJS._querycustomFunc('product_ware_wareCode')"  value="${(product.ware.wareCode)!}" displayFieldName="wareCode" name="product.ware.wareCode" id="product_ware_wareCode" type="other" url="/MESBasic/wareMan/ware/wareRef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_prodEditforJS_form" editCustomCallback="checkPlaceSetCode();" refViewCode="MESBasic_1_wareMan_wareRef" onkeyupfuncname="checkPlaceSetCode();_callback_product_ware_wareCode(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(product.id)?? && (product.ware.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.ware.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_prodEditforJS_form',obj, 'product.ware', '/MESBasic/wareMan/ware/wareRef.action');
												CUI.commonFills('MESBasic_product_product_prodEditforJS_form', 'product.ware',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1484343434121')}" >${getText('MESBasic.propertydisplayName.randon1484343434121')}</label>
				</td>
				
						<#assign product_ware_wareName_defaultValue  = ''>
														<#assign product_ware_wareName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="product.ware.wareName" id="product_ware_wareName"  style=";" originalvalue="<#if !newObj || (product.ware.wareName)?has_content>${(product.ware.wareName?html)!}<#else>${product_ware_wareName_defaultValue!}</#if>" value="<#if !newObj || (product.ware.wareName)?has_content>${(product.ware.wareName?html)!}<#else>${product_ware_wareName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon514491212')}" >${getText('MESBasic.propertydisplayName.randon514491212')}</label>
				</td>
				
						<#assign product_storeSet_placeSetCode_defaultValue  = ''>
														<#assign product_storeSet_placeSetCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('MESBasic.viewtitle.randon1489735291062')}" viewType="${viewType!}" deValue="${product_storeSet_placeSetCode_defaultValue!}" conditionfunc="MESBasic.product.product.prodEditforJS._querycustomFunc('product_storeSet_placeSetCode')"  value="${(product.storeSet.placeSetCode)!}" displayFieldName="placeSetCode" name="product.storeSet.placeSetCode" id="product_storeSet_placeSetCode" type="other" url="/MESBasic/storeSet/storeSet/storeRef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_prodEditforJS_form" editCustomCallback=";" refViewCode="MESBasic_1_storeSet_storeRef"  onkeyupfuncname=";_callback_product_storeSet_placeSetCode(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(product.id)?? && (product.storeSet.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.storeSet.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_prodEditforJS_form',obj, 'product.storeSet', '/MESBasic/storeSet/storeSet/storeRef.action');
												CUI.commonFills('MESBasic_product_product_prodEditforJS_form', 'product.storeSet',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
									MESBasic.product.product.prodEditforJS.query_product_storeSet_placeSetCode = function() {
										var wareId=$('input[name="product.ware.id"]').val();
if(wareId=="" || wareId==null){
	wareId=-1;
}
return "wareId="+wareId;
									}
								</script>
							
				</td>
				</tr><tr >
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1489731677162232232')}" >${getText('MESBasic.propertydisplayName.randon1489731677162232232')}</label>
				</td>
				
						<#assign product_storeSet_placeSetName_defaultValue  = ''>
														<#assign product_storeSet_placeSetName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="product.storeSet.placeSetName" id="product_storeSet_placeSetName"  style=";" originalvalue="<#if !newObj || (product.storeSet.placeSetName)?has_content>${(product.storeSet.placeSetName?html)!}<#else>${product_storeSet_placeSetName_defaultValue!}</#if>" value="<#if !newObj || (product.storeSet.placeSetName)?has_content>${(product.storeSet.placeSetName?html)!}<#else>${product_storeSet_placeSetName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1475912031725')}" >${getText('MESBasic.propertydisplayName.randon1475912031725')}</label>
				</td>
				
						<#assign product_safeNum_defaultValue  = ''>
							 							<#assign product_safeNum_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="product.safeNum" id="product_safeNum"  style=";" originalvalue="<#if newObj&& !(product.safeNum)?has_content>${product_safeNum_defaultValue!}<#elseif (product.safeNum)?has_content>#{(product.safeNum)!; m3M3}</#if>" value="<#if newObj&& !(product.safeNum)?has_content>${product_safeNum_defaultValue!}<#elseif (product.safeNum)?has_content>#{(product.safeNum)!; m3M3}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#product_safeNum').unbind('blur').bind('blur',function(){
										var percision = 3;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("MESBasic.propertydisplayName.randon1475912031725")}')}");
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1475912134641')}" >${getText('MESBasic.propertydisplayName.randon1475912134641')}</label>
				</td>
				
						<#assign product_topNum_defaultValue  = ''>
							 							<#assign product_topNum_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="product.topNum" id="product_topNum"  style=";" originalvalue="<#if newObj&& !(product.topNum)?has_content>${product_topNum_defaultValue!}<#elseif (product.topNum)?has_content>#{(product.topNum)!; m3M3}</#if>" value="<#if newObj&& !(product.topNum)?has_content>${product_topNum_defaultValue!}<#elseif (product.topNum)?has_content>#{(product.topNum)!; m3M3}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#product_topNum').unbind('blur').bind('blur',function(){
										var percision = 3;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("MESBasic.propertydisplayName.randon1475912134641")}')}");
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1475912184114')}" >${getText('MESBasic.propertydisplayName.randon1475912184114')}</label>
				</td>
				
						<#assign product_lowNum_defaultValue  = ''>
							 							<#assign product_lowNum_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="product.lowNum" id="product_lowNum"  style=";" originalvalue="<#if newObj&& !(product.lowNum)?has_content>${product_lowNum_defaultValue!}<#elseif (product.lowNum)?has_content>#{(product.lowNum)!; m3M3}</#if>" value="<#if newObj&& !(product.lowNum)?has_content>${product_lowNum_defaultValue!}<#elseif (product.lowNum)?has_content>#{(product.lowNum)!; m3M3}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#product_lowNum').unbind('blur').bind('blur',function(){
										var percision = 3;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("MESBasic.propertydisplayName.randon1475912184114")}')}");
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1450083854272')}" >${getText('MESBasic.propertydisplayName.randon1450083854272')}</label>
				</td>
				
						<#assign product_productCheckFreq_defaultValue  = ''>
							 							<#assign product_productCheckFreq_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="INTEGER" name="product.productCheckFreq" id="product_productCheckFreq"  style=";" originalvalue="<#if !newObj || (product.productCheckFreq)?has_content>${(product.productCheckFreq?html)!}<#else>${product_productCheckFreq_defaultValue!}</#if>" value="<#if !newObj || (product.productCheckFreq)?has_content>${(product.productCheckFreq?html)!}<#else>${product_productCheckFreq_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1475912300584')}" >${getText('MESBasic.propertydisplayName.randon1475912300584')}</label>
				</td>
				
						<#assign product_lastDate_defaultValue  = ''>
							 							<#assign product_lastDate_defaultValue  = ''>
					<#if (product_lastDate_defaultValue)?? &&(product_lastDate_defaultValue)?has_content>
							<#assign product_lastDate_defaultValue  = getDefaultDateTime(product_lastDate_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  align="left" style="text-align: left;;" >
					
							
							<#if newObj && !(product.lastDate)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="product.lastDate" value="${product_lastDate_defaultValue!}" type="dateTime"  id="product.lastDate"  view=true cssStyle=""   align="left"/>
								
							<#else>
							<#if (product.lastDate)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="product.lastDate" value="${product.lastDate?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="product.lastDate"  view=true cssStyle="" align="left"  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="product.lastDate" value="" type="dateTime" id="product.lastDate" cssStyle=""  view=true align="left"/>
								
							</#if>
							</#if>
							
				</td>
				</tr><tr >
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1484031944240')}" >${getText('MESBasic.propertydisplayName.randon1484031944240')}</label>
				</td>
				
						<#assign product_ware_cargoStatue_defaultValue  = ''>
														<#assign product_ware_cargoStatue_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;display:none;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${product_ware_cargoStatue_defaultValue!}" formId="MESBasic_product_product_prodEditforJS_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="product.ware.cargoStatue.id" code="storageState" value="${(product.ware.cargoStatue.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_product_product_prodEditforJS_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="product.ware.cargoStatue.id" code="storageState" value="${(product.ware.cargoStatue.id)!}"  />
									
								</#if>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
					
							<label style="width:100%;;" value="${getText('ec.common.ID')}" >${getText('ec.common.ID')}</label>
				</td>
				
						<#assign product_storeSet_wareId_id_defaultValue  = ''>
														<#assign product_storeSet_wareId_id_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;display:none;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="LONG" name="product.storeSet.wareId.id" id="product_storeSet_wareId_id"  style=";" originalvalue="<#if !newObj || (product.storeSet.wareId.id)?has_content>${(product.storeSet.wareId.id?html)!}<#else>${product_storeSet_wareId_id_defaultValue!}</#if>" value="<#if !newObj || (product.storeSet.wareId.id)?has_content>${(product.storeSet.wareId.id?html)!}<#else>${product_storeSet_wareId_id_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
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
			<div class="clearfix pd_bottom">
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1470191030430')}" >${getText('MESBasic.propertydisplayName.randon1470191030430')}</label>
				</td>
				
						<#assign product_isKeepDate_defaultValue  = ''>
							 							<#assign product_isKeepDate_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="product.isKeepDate_check" originalvalue="<#if !newObj><#if (product.isKeepDate)??>${(product.isKeepDate!false)?string('true','false')}<#else>false</#if><#elseif product_isKeepDate_defaultValue?has_content>${(product_isKeepDate_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (product.isKeepDate)??>${(product.isKeepDate!false)?string('true','false')}<#else>false</#if><#else>${(product_isKeepDate_defaultValue!true)?string}</#if>" onclick='isKeepDate_check()' />
								
								<input property_type="BOOLEAN" type="hidden" name="product.isKeepDate" originalvalue="<#if ((product.isKeepDate)?? &&  product.isKeepDate)||(product_isKeepDate_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((product.isKeepDate)?? &&  product.isKeepDate)||(product_isKeepDate_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="product.isKeepDate_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="product.isKeepDate"]');
												CUI('input[name="product.isKeepDate_check"]').each(function(){
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1470191840683')}" >${getText('MESBasic.propertydisplayName.randon1470191840683')}</label>
				</td>
				
						<#assign product_isCtrlPass_defaultValue  = ''>
							 							<#assign product_isCtrlPass_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="product.isCtrlPass_check" originalvalue="<#if !newObj><#if (product.isCtrlPass)??>${(product.isCtrlPass!false)?string('true','false')}<#else>false</#if><#elseif product_isCtrlPass_defaultValue?has_content>${(product_isCtrlPass_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (product.isCtrlPass)??>${(product.isCtrlPass!false)?string('true','false')}<#else>false</#if><#else>${(product_isCtrlPass_defaultValue!true)?string}</#if>"  />
								
								<input property_type="BOOLEAN" type="hidden" name="product.isCtrlPass" originalvalue="<#if ((product.isCtrlPass)?? &&  product.isCtrlPass)||(product_isCtrlPass_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((product.isCtrlPass)?? &&  product.isCtrlPass)||(product_isCtrlPass_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="product.isCtrlPass_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="product.isCtrlPass"]');
												CUI('input[name="product.isCtrlPass_check"]').each(function(){
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1450083835129')}" >${getText('MESBasic.propertydisplayName.randon1450083835129')}</label>
				</td>
				
						<#assign product_productCheckDays_defaultValue  = ''>
							 							<#assign product_productCheckDays_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="INTEGER" name="product.productCheckDays" id="product_productCheckDays"  style=";" originalvalue="<#if !newObj || (product.productCheckDays)?has_content>${(product.productCheckDays?html)!}<#else>${product_productCheckDays_defaultValue!}</#if>" value="<#if !newObj || (product.productCheckDays)?has_content>${(product.productCheckDays?html)!}<#else>${product_productCheckDays_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1471520300572')}" >${getText('MESBasic.propertydisplayName.randon1471520300572')}</label>
				</td>
				
						<#assign product_keepUnit_defaultValue  = ''>
							 							<#assign product_keepUnit_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${product_keepUnit_defaultValue!}" formId="MESBasic_product_product_prodEditforJS_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="product.keepUnit.id" code="product_keepUnit" value="${(product.keepUnit.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_product_product_prodEditforJS_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="product.keepUnit.id" code="product_keepUnit" value="${(product.keepUnit.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1470192036318')}" >${getText('MESBasic.propertydisplayName.randon1470192036318')}</label>
				</td>
				
						<#assign product_keepDay_defaultValue  = ''>
							 							<#assign product_keepDay_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="INTEGER" name="product.keepDay" id="product_keepDay"  style=";" originalvalue="<#if !newObj || (product.keepDay)?has_content>${(product.keepDay?html)!}<#else>${product_keepDay_defaultValue!}</#if>" value="<#if !newObj || (product.keepDay)?has_content>${(product.keepDay?html)!}<#else>${product_keepDay_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randonday11525785600740')}" >${getText('MESBasic.propertydisplayName.randonday11525785600740')}</label>
				</td>
				
						<#assign product_ctlEffectiveDateCount_defaultValue  = ''>
							 							<#assign product_ctlEffectiveDateCount_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="INTEGER" name="product.ctlEffectiveDateCount" id="product_ctlEffectiveDateCount"  style=";" originalvalue="<#if !newObj || (product.ctlEffectiveDateCount)?has_content>${(product.ctlEffectiveDateCount?html)!}<#else>${product_ctlEffectiveDateCount_defaultValue!}</#if>" value="<#if !newObj || (product.ctlEffectiveDateCount)?has_content>${(product.ctlEffectiveDateCount?html)!}<#else>${product_ctlEffectiveDateCount_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1495540655758')}" >${getText('MESBasic.propertydisplayName.randon1495540655758')}</label>
				</td>
				
						<#assign product_approachUnit_defaultValue  = ''>
							 							<#assign product_approachUnit_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${product_approachUnit_defaultValue!}" formId="MESBasic_product_product_prodEditforJS_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="product.approachUnit.id" code="product_keepUnit" value="${(product.approachUnit.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_product_product_prodEditforJS_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="product.approachUnit.id" code="product_keepUnit" value="${(product.approachUnit.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1495540732500')}" >${getText('MESBasic.propertydisplayName.randon1495540732500')}</label>
				</td>
				
						<#assign product_approachTime_defaultValue  = ''>
							 							<#assign product_approachTime_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="INTEGER" name="product.approachTime" id="product_approachTime"  style=";" originalvalue="<#if !newObj || (product.approachTime)?has_content>${(product.approachTime?html)!}<#else>${product_approachTime_defaultValue!}</#if>" value="<#if !newObj || (product.approachTime)?has_content>${(product.approachTime?html)!}<#else>${product_approachTime_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1470192119584')}" >${getText('MESBasic.propertydisplayName.randon1470192119584')}</label>
				</td>
				
						<#assign product_notifyDays_defaultValue  = ''>
							 							<#assign product_notifyDays_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="INTEGER" name="product.notifyDays" id="product_notifyDays"  style=";" originalvalue="<#if !newObj || (product.notifyDays)?has_content>${(product.notifyDays?html)!}<#else>${product_notifyDays_defaultValue!}</#if>" value="<#if !newObj || (product.notifyDays)?has_content>${(product.notifyDays?html)!}<#else>${product_notifyDays_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1524758890916')}" >${getText('MESBasic.propertydisplayName.randon1524758890916')}</label>
				</td>
				
						<#assign product_storeDeadlineUnit_defaultValue  = ''>
							 							<#assign product_storeDeadlineUnit_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${product_storeDeadlineUnit_defaultValue!}" formId="MESBasic_product_product_prodEditforJS_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="product.storeDeadlineUnit.id" code="reinspectUnit" value="${(product.storeDeadlineUnit.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_product_product_prodEditforJS_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="product.storeDeadlineUnit.id" code="reinspectUnit" value="${(product.storeDeadlineUnit.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1524758849279')}" >${getText('MESBasic.propertydisplayName.randon1524758849279')}</label>
				</td>
				
						<#assign product_storeDeadline_defaultValue  = ''>
							 							<#assign product_storeDeadline_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="INTEGER" name="product.storeDeadline" id="product_storeDeadline"  style=";" originalvalue="<#if !newObj || (product.storeDeadline)?has_content>${(product.storeDeadline?html)!}<#else>${product_storeDeadline_defaultValue!}</#if>" value="<#if !newObj || (product.storeDeadline)?has_content>${(product.storeDeadline?html)!}<#else>${product_storeDeadline_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1524758953604')}" >${getText('MESBasic.propertydisplayName.randon1524758953604')}</label>
				</td>
				
						<#assign product_frequency_defaultValue  = ''>
							 							<#assign product_frequency_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="INTEGER" name="product.frequency" id="product_frequency"  style=";" originalvalue="<#if !newObj || (product.frequency)?has_content>${(product.frequency?html)!}<#else>${product_frequency_defaultValue!}</#if>" value="<#if !newObj || (product.frequency)?has_content>${(product.frequency?html)!}<#else>${product_frequency_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1524759969414')}" >${getText('MESBasic.propertydisplayName.randon1524759969414')}</label>
				</td>
				
						<#assign product_isProReset_defaultValue  = ''>
							 							<#assign product_isProReset_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="product.isProReset_check" originalvalue="<#if !newObj><#if (product.isProReset)??>${(product.isProReset!false)?string('true','false')}<#else>false</#if><#elseif product_isProReset_defaultValue?has_content>${(product_isProReset_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (product.isProReset)??>${(product.isProReset!false)?string('true','false')}<#else>false</#if><#else>${(product_isProReset_defaultValue!true)?string}</#if>" onchange='isProReset_check()' />
								
								<input property_type="BOOLEAN" type="hidden" name="product.isProReset" originalvalue="<#if ((product.isProReset)?? &&  product.isProReset)||(product_isProReset_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((product.isProReset)?? &&  product.isProReset)||(product_isProReset_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="product.isProReset_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="product.isProReset"]');
												CUI('input[name="product.isProReset_check"]').each(function(){
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
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1471520204490')}" >${getText('MESBasic.propertydisplayName.randon1471520204490')}</label>
				</td>
				
						<#assign product_keepReckon_defaultValue  = ''>
							 							<#assign product_keepReckon_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;display:none;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${product_keepReckon_defaultValue!}" formId="MESBasic_product_product_prodEditforJS_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="product.keepReckon.id" code="product_keepReckon" value="${(product.keepReckon.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_product_product_prodEditforJS_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="product.keepReckon.id" code="product_keepReckon" value="${(product.keepReckon.id)!}"  />
									
								</#if>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
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
				<#assign dUrl="/MESBasic/product/product/data-dg1572259458193.action?product.id=${refId!-1}&refId=${refId!-1}&datagridCode=MESBasic_1_product_prodEditforJSdg1572259458193">
			<#else>
				<#assign dUrl="/MESBasic/product/product/data-dg1572259458193.action?product.id=${(product.id)!-1}&datagridCode=MESBasic_1_product_prodEditforJSdg1572259458193">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('MESBasic.buttonPropertyshowName.radion1524762481815')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('MESBasic.buttonPropertyshowName.radion1524762481748')}\",handler:function(event){DT_ProdResetDaily_dg1572259458193_deldatagrid();},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('MESBasic.buttonPropertyshowName.radion1524762481815')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('MESBasic.buttonPropertyshowName.radion1524762481748')}\",handler:function(event){DT_ProdResetDaily_dg1572259458193_deldatagrid();},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_ProdResetDaily_dg1572259458193" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1572259458193_id" value="ProdResetDaily_dg1572259458193" />
			
			<input type="hidden" id="dg1572259458193_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('MESBasic.modelname.randon1471690809334')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/MESBasic/product/product/data-dg1572259458193.action?operateType=export&datagridCode=MESBasic_1_product_prodEditforJSdg1572259458193"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="ProdResetDaily_dg1572259458193" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="ProdResetDaily_dg1572259458193" viewType="${viewType}" renderOverEvent="dg1572259458193RenderOverEvent" route="${routeFlag}" formId="MESBasic_product_product_prodEditforJS_form" noPermissionKeys="reinspect,reinspectUnit,expireDaysForNotify,expireDaysInterval,demo" modelCode="MESBasic_1_product_ProdResetDaily" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1572259458193" dtPage="dgPage"  hidekeyPrefix="dg1572259458193" hidekey="['id','version'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=2 pageInitMethod="dg1572259458193PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName  activexButton="MESBasic.buttonPropertyshowName.radion1524762481815,ADDROW,add;MESBasic.buttonPropertyshowName.radion1524762481748,DELETEROW,del" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign reinspect_displayDefaultType=''>
								<#assign reinspect_defaultValue=''>
										<#assign reinspect_defaultValue=''>
										 									
									<@datacolumn key="reinspect"        showFormat="TEXT" defaultValue="${(reinspect_defaultValue!)?string}" defaultDisplay="${(reinspect_displayDefaultType!)?string}" decimal="" editable=true type="INTEGER" showType="integer" notnull=true     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1524758273267')}" width=100 showFormatFunc=""  />
							<#assign reinspectUnit_displayDefaultType=''>
								<#assign reinspectUnit_defaultValue=''>
										<#assign reinspectUnit_defaultValue=''>
										 									<@systemCodeColumn code="reinspectUnit" textalign="center" defaultValue="${(reinspectUnit_defaultValue!)?string}" key="reinspectUnit.id" editable=true type="selectcomp" notnull=true     label="${getText('MESBasic.propertydisplayName.randon1524758365563')}" width=100   />
							<#assign expireDaysForNotify_displayDefaultType=''>
								<#assign expireDaysForNotify_defaultValue=''>
										<#assign expireDaysForNotify_defaultValue=''>
										 									
									<@datacolumn key="expireDaysForNotify"        showFormat="TEXT" defaultValue="${(expireDaysForNotify_defaultValue!)?string}" defaultDisplay="${(expireDaysForNotify_displayDefaultType!)?string}" decimal="" editable=true type="INTEGER" showType="integer" notnull=true     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1524758580531')}" width=100 showFormatFunc=""  />
							<#assign expireDaysInterval_displayDefaultType=''>
								<#assign expireDaysInterval_defaultValue=''>
										<#assign expireDaysInterval_defaultValue=''>
										 									
									<@datacolumn key="expireDaysInterval"        showFormat="TEXT" defaultValue="${(expireDaysInterval_defaultValue!)?string}" defaultDisplay="${(expireDaysInterval_displayDefaultType!)?string}" decimal="" editable=true type="INTEGER" showType="integer" notnull=true     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1524758793705')}" width=100 showFormatFunc=""  />
							<#assign demo_displayDefaultType=''>
								<#assign demo_defaultValue=''>
										<#assign demo_defaultValue=''>
										  
									<@datacolumn key="demo"        showFormat="TEXT" defaultValue="${(demo_defaultValue!)?string}" defaultDisplay="${(demo_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1524762539648')}" width=100 showFormatFunc=""  />
			
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
				function ProdResetDaily_dg1572259458193_check_datagridvalid(){
					//
					var errorObj =ProdResetDaily_dg1572259458193Widget._DT.testData();
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
				
				function savedg1572259458193DataGrid(){
					<#if  refId?? && (refId gt 0)>
					ProdResetDaily_dg1572259458193Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('ProdResetDaily_dg1572259458193Widget') > -1) {
						ProdResetDaily_dg1572259458193Widget.setAllRowEdited();
					}
					var json = ProdResetDaily_dg1572259458193Widget.parseEditedData();
					$('input[name="dg1572259458193ListJson"]').remove();
					$('input[name="dgLists[\'dg1572259458193\']"]').remove();
					$('input[name="dg1572259458193ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1572259458193\']">').val(json).appendTo($('#MESBasic_product_product_prodEditforJS_form'));
					$('<input type="hidden" name="dg1572259458193ModelCode">').val('MESBasic_1_product_ProdResetDaily').appendTo($('#MESBasic_product_product_prodEditforJS_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1572259458193ListJson">').val(json).appendTo($('#MESBasic_product_product_prodEditforJS_form'));
				}
				function DT_ProdResetDaily_dg1572259458193_deldatagrid(){
					var deleteRows = ProdResetDaily_dg1572259458193Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','productID.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1572259458193DeletedIds").length>0){
							$("#dg1572259458193DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1572259458193DeletedIds" name="dgDeletedIds[\'dg1572259458193\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_product_product_prodEditforJS_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1572259458193DeletedIds['+CUI('input[name^="dg1572259458193DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_product_product_prodEditforJS_form'));
					});
					return deleteRows;
				}
				function DT_ProdResetDaily_dg1572259458193_delTreeNodes(){
					var deleteRows = ProdResetDaily_dg1572259458193Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','productID.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1572259458193DeletedIds").length>0){
							$("#dg1572259458193DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1572259458193DeletedIds" name="dgDeletedIds[\'dg1572259458193\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_product_product_prodEditforJS_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1572259458193DeletedIds['+CUI('input[name^="dg1572259458193DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_product_product_prodEditforJS_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('MESBasic_product_product_prodEditforJS_datagrids');
					if(!datagrids) {
						datagrids = [];
					}
					for(var i=0;i<5;i++) {
						if(!datagrids[i]) {
							datagrids[i] = [];
						}
					}
					if(datagrids[2].length>0) {
						for(var i=0;i<datagrids[2].length;i++) {
							if(datagrids[2][i] == 'ProdResetDaily_dg1572259458193') {
								break;
							}
							if(i==datagrids[2].length-1) {
								datagrids[2][datagrids[2].length] = 'ProdResetDaily_dg1572259458193';
							}
						}
					} else {
						datagrids[2][datagrids[2].length] = 'ProdResetDaily_dg1572259458193';
					}
					$('body').data('MESBasic_product_product_prodEditforJS_datagrids', datagrids);
				});
				
				var ProdResetDaily_dg1572259458193_importDialog = null;
				function ProdResetDaily_dg1572259458193_showImportDialog(){
					try{
						if(ProdResetDaily_dg1572259458193_importDialog!=null&&ProdResetDaily_dg1572259458193_importDialog.isShow==1){
							return false;
						}
						var url = "/MESBasic/product/product/initImport.action?datagridCode=MESBasic_1_product_prodEditforJSdg1572259458193&tid=${id!}&datagridName=dg1572259458193";
							<#if canImportExcel>
								var buttonCode="MESBasic_1_product_prodEditforJSdg1572259458193_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						ProdResetDaily_dg1572259458193_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("ProdResetDaily_dg1572259458193"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();ProdResetDaily_dg1572259458193_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();ProdResetDaily_dg1572259458193_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						ProdResetDaily_dg1572259458193_importDialog.show();
					}catch(e){}
				}	
				
				function ProdResetDaily_dg1572259458193_downLoadFile(){
					var url = "/MESBasic/product/product/downLoad.action?datagridCode=MESBasic_1_product_prodEditforJSdg1572259458193&templateRelatedModelCode=MESBasic_1_product_prodEditforJSdg1572259458193&downloadType=template&fileName=dg1572259458193";
					window.open(url,"","");
				}
				function dg1572259458193RenderOverEvent(){
					var proReset = $("input[name='product.isProReset_check']").is(":checked");
	if(proReset==true){
		$("#ProdResetDaily_dg1524762478590 .paginatorbar-operatebar").css("visibility","visible");
	}else{
	     $("#ProdResetDaily_dg1524762478590 .paginatorbar-operatebar").css("visibility","hidden");
	}
				}
				function dg1572259458193PageInitMethod(nTabIndex){
					MESBasic.product.product.prodEditforJS.initSize(nTabIndex);
				}
			</script>
			
			
			</div>
		</div>
			<div class="clearfix pd_bottom">
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1470191788998')}" >${getText('MESBasic.propertydisplayName.randon1470191788998')}</label>
				</td>
				
						<#assign product_isItemLevel_defaultValue  = ''>
							 							<#assign product_isItemLevel_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="product.isItemLevel_check" originalvalue="<#if !newObj><#if (product.isItemLevel)??>${(product.isItemLevel!false)?string('true','false')}<#else>false</#if><#elseif product_isItemLevel_defaultValue?has_content>${(product_isItemLevel_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (product.isItemLevel)??>${(product.isItemLevel!false)?string('true','false')}<#else>false</#if><#else>${(product_isItemLevel_defaultValue!true)?string}</#if>" onchange='isItemLevel_check()' />
								
								<input property_type="BOOLEAN" type="hidden" name="product.isItemLevel" originalvalue="<#if ((product.isItemLevel)?? &&  product.isItemLevel)||(product_isItemLevel_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((product.isItemLevel)?? &&  product.isItemLevel)||(product_isItemLevel_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="product.isItemLevel_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="product.isItemLevel"]');
												CUI('input[name="product.isItemLevel_check"]').each(function(){
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
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
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
								function ProdLevel_dg1572259458131_addLine(event)
																{
	 ProdLevel_dg1524759114829Widget._DT.addNewRow();
	 for(var j = 0;j<ProdLevel_dg1524759114829Widget.getRowLength();j++){
    	var itemChange = ProdLevel_dg1524759114829Widget._DT.getCellValue(j,'itemChange');
    	if(itemChange == null || itemChange ==''||itemChange == false || itemChange =='false'){
    			ProdLevel_dg1524759114829Widget._DT.setCellProperty(j,'productID.productCode','readonly',true);
    	}
    }
    
    var temp = 0;
    for(var i = 0;i<ProdLevel_dg1524759114829Widget.getRowLength();i++){
    	if(ProdLevel_dg1524759114829Widget._DT.getCellValue(i,'corder')!=null && ProdLevel_dg1524759114829Widget._DT.getCellValue(i,'corder')!='' ){
    		var clevel = parseInt(ProdLevel_dg1524759114829Widget._DT.getCellValue(i,'corder'));
    		if(clevel>temp){
    			temp=clevel;
    		}
    	}
    }
    for(var i = 0;i<ProdLevel_dg1524759114829Widget.getRowLength();i++){
    	if(ProdLevel_dg1524759114829Widget._DT.getCellValue(i,'corder')==null||ProdLevel_dg1524759114829Widget._DT.getCellValue(i,'corder')==''){
    		temp++;
    		ProdLevel_dg1524759114829Widget._DT.setCellValue(i,'corder',temp);
    	}
    }
    var lengthP = ProdLevel_dg1524759114829Widget.getRowLength()-1;
    ProdLevel_dg1524759114829Widget._DT.setCellValue(lengthP,'rejectLvl',ProdLevel_dg1524759114829Widget._DT.getCellValue(lengthP-1,'rejectLvl'));
}
							</script>
							<script type="text/javascript">
								function ProdLevel_dg1572259458131_deleteLine(event)
																{
DT_ProdLevel_dg1524759114829_deldatagrid();
}
							</script>
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/MESBasic/product/product/data-dg1572259458131.action?product.id=${refId!-1}&refId=${refId!-1}&datagridCode=MESBasic_1_product_prodEditforJSdg1572259458131">
			<#else>
				<#assign dUrl="/MESBasic/product/product/data-dg1572259458131.action?product.id=${(product.id)!-1}&datagridCode=MESBasic_1_product_prodEditforJSdg1572259458131">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('MESBasic.buttonPropertyshowName.radion1524759121662')}\",handler:function(event){ProdLevel_dg1572259458131_addLine(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('MESBasic.buttonPropertyshowName.radion1524759121591')}\",handler:function(event){ProdLevel_dg1572259458131_deleteLine(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('import.file.importExcel')}\",handler:function(){ProdLevel_dg1572259458131_showImportDialog();},iconClass:\"cui-btn-import\",useInMore:\"false\", subButtons:[{text:'${getText('import.file.downloadtemplate')}',handler:function(){ProdLevel_dg1572259458131_downLoadFile();},useInMore:'false'}]}]">
				<#assign canImportExcel=true>
			<#else>
				<#assign buttons="[{text:\"${getText('MESBasic.buttonPropertyshowName.radion1524759121662')}\",handler:function(event){ProdLevel_dg1572259458131_addLine(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('MESBasic.buttonPropertyshowName.radion1524759121591')}\",handler:function(event){ProdLevel_dg1572259458131_deleteLine(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_ProdLevel_dg1572259458131" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1572259458131_id" value="ProdLevel_dg1572259458131" />
			
			<input type="hidden" id="dg1572259458131_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('MESBasic.modelname.randon1470193147949')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/MESBasic/product/product/data-dg1572259458131.action?operateType=export&datagridCode=MESBasic_1_product_prodEditforJSdg1572259458131"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="ProdLevel_dg1572259458131" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="ProdLevel_dg1572259458131" viewType="${viewType}" renderOverEvent="dg1572259458131RenderOverEvent" route="${routeFlag}" formId="MESBasic_product_product_prodEditforJS_form" noPermissionKeys="clevel,corder,rejectLvl,levelMemo,itemChange,productID.productCode,productID.productName,isUsed" modelCode="MESBasic_1_product_ProdLevel" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1572259458131" dtPage="dgPage"  hidekeyPrefix="dg1572259458131" hidekey="['id','version','productID.id','productID.productCode','productID.id','productID.productName'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=3 pageInitMethod="dg1572259458131PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName  activexButton="MESBasic.buttonPropertyshowName.radion1524759121662,addLine,add;MESBasic.buttonPropertyshowName.radion1524759121591,deleteLine,add" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign clevel_displayDefaultType=''>
								<#assign clevel_defaultValue=''>
										<#assign clevel_defaultValue=''>
										 									
									<@datacolumn key="clevel"        showFormat="TEXT" defaultValue="${(clevel_defaultValue!)?string}" defaultDisplay="${(clevel_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=true     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1470193262662')}" width=100 showFormatFunc=""  />
							<#assign corder_displayDefaultType=''>
								<#assign corder_defaultValue=''>
										<#assign corder_defaultValue=''>
										  
									<@datacolumn key="corder"        showFormat="TEXT" defaultValue="${(corder_defaultValue!)?string}" defaultDisplay="${(corder_displayDefaultType!)?string}" decimal="" editable=true type="INTEGER" showType="integer" notnull=true     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1470193428773')}" width=100 showFormatFunc=""  />
							<#assign rejectLvl_displayDefaultType=''>
								<#assign rejectLvl_defaultValue=''>
										<#assign rejectLvl_defaultValue=''>
										  
									<@datacolumn key="rejectLvl"        showFormat="CHECKBOX" defaultValue="${(rejectLvl_defaultValue!)?string}" defaultDisplay="${(rejectLvl_displayDefaultType!)?string}" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1470193484810')}" width=100 showFormatFunc=""  />
							<#assign levelMemo_displayDefaultType=''>
								<#assign levelMemo_defaultValue=''>
										<#assign levelMemo_defaultValue=''>
										  
									<@datacolumn key="levelMemo"        showFormat="TEXT" defaultValue="${(levelMemo_defaultValue!)?string}" defaultDisplay="${(levelMemo_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1470193317753')}" width=100 showFormatFunc=""  />
							<#assign itemChange_displayDefaultType=''>
								<#assign itemChange_defaultValue=''>
										<#assign itemChange_defaultValue=''>
										 
										
										
										
										
										
 
									<@datacolumn key="itemChange"        showFormat="CHECKBOX" defaultValue="${(itemChange_defaultValue!)?string}" defaultDisplay="${(itemChange_displayDefaultType!)?string}" onchange="ProdLevel_dg1572259458131Widget.evalCustomFunction(nRow,sFieldName,'isChange()')" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1470193540651')}" width=100 showFormatFunc=""  />
							<#assign productID_productCode_displayDefaultType=''>
								<#assign productID_productCode_defaultValue=''>
										<#assign productID_productCode_defaultValue=''>
																	<#if (productID_productCode_defaultValue!)?string=="currentUser">
								<#assign productID_productCode_defaultValue='${staffJson!}'>
							<#elseif (productID_productCode_defaultValue!)?string=="currentPost">
								<#assign productID_productCode_defaultValue='${postJson!}'>
							<#elseif (productID_productCode_defaultValue!)?string=="currentDepart">
								<#assign productID_productCode_defaultValue='${deptJson!}'>
							<#elseif (productID_productCode_defaultValue!)?string=="currentComp">
								<#assign productID_productCode_defaultValue='${compJson!}'>
							</#if>

										
										
										
										
										

									<@datacolumn key="productID.productCode"        showFormat="SELECTCOMP" defaultValue="${(productID_productCode_defaultValue!)?string}" defaultDisplay="${(productID_productCode_displayDefaultType!)?string}" onchange="ProdLevel_dg1572259458131Widget.evalCustomFunction(nRow,sFieldName,'a(obj)')" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false   selectCompName="MESBasic.product.product.prodEditforJS"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" width=100 showFormatFunc=""  />
							<#assign productID_productName_displayDefaultType=''>
								<#assign productID_productName_defaultValue=''>
										<#assign productID_productName_defaultValue=''>
																	<#if (productID_productName_defaultValue!)?string=="currentUser">
								<#assign productID_productName_defaultValue='${staffJson!}'>
							<#elseif (productID_productName_defaultValue!)?string=="currentPost">
								<#assign productID_productName_defaultValue='${postJson!}'>
							<#elseif (productID_productName_defaultValue!)?string=="currentDepart">
								<#assign productID_productName_defaultValue='${deptJson!}'>
							<#elseif (productID_productName_defaultValue!)?string=="currentComp">
								<#assign productID_productName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="productID.productName"        showFormat="TEXT" defaultValue="${(productID_productName_defaultValue!)?string}" defaultDisplay="${(productID_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="MESBasic.product.product.prodEditforJS"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" width=100 showFormatFunc=""  />
							<#assign isUsed_displayDefaultType=''>
								<#assign isUsed_defaultValue=''>
										<#assign isUsed_defaultValue=''>
										  
									<@datacolumn key="isUsed"        showFormat="CHECKBOX" defaultValue="${(isUsed_defaultValue!)?string}" defaultDisplay="${(isUsed_displayDefaultType!)?string}" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1476185260891')}" width=100 showFormatFunc=""  />
			
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
				function ProdLevel_dg1572259458131_check_datagridvalid(){
					//
					var errorObj =ProdLevel_dg1572259458131Widget._DT.testData();
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
				
				function savedg1572259458131DataGrid(){
					<#if  refId?? && (refId gt 0)>
					ProdLevel_dg1572259458131Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('ProdLevel_dg1572259458131Widget') > -1) {
						ProdLevel_dg1572259458131Widget.setAllRowEdited();
					}
					var json = ProdLevel_dg1572259458131Widget.parseEditedData();
					$('input[name="dg1572259458131ListJson"]').remove();
					$('input[name="dgLists[\'dg1572259458131\']"]').remove();
					$('input[name="dg1572259458131ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1572259458131\']">').val(json).appendTo($('#MESBasic_product_product_prodEditforJS_form'));
					$('<input type="hidden" name="dg1572259458131ModelCode">').val('MESBasic_1_product_ProdLevel').appendTo($('#MESBasic_product_product_prodEditforJS_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1572259458131ListJson">').val(json).appendTo($('#MESBasic_product_product_prodEditforJS_form'));
				}
				function DT_ProdLevel_dg1572259458131_deldatagrid(){
					var deleteRows = ProdLevel_dg1572259458131Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','productID.id','compareID.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1572259458131DeletedIds").length>0){
							$("#dg1572259458131DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1572259458131DeletedIds" name="dgDeletedIds[\'dg1572259458131\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_product_product_prodEditforJS_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1572259458131DeletedIds['+CUI('input[name^="dg1572259458131DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_product_product_prodEditforJS_form'));
					});
					return deleteRows;
				}
				function DT_ProdLevel_dg1572259458131_delTreeNodes(){
					var deleteRows = ProdLevel_dg1572259458131Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','productID.id','compareID.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1572259458131DeletedIds").length>0){
							$("#dg1572259458131DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1572259458131DeletedIds" name="dgDeletedIds[\'dg1572259458131\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_product_product_prodEditforJS_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1572259458131DeletedIds['+CUI('input[name^="dg1572259458131DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_product_product_prodEditforJS_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('MESBasic_product_product_prodEditforJS_datagrids');
					if(!datagrids) {
						datagrids = [];
					}
					for(var i=0;i<5;i++) {
						if(!datagrids[i]) {
							datagrids[i] = [];
						}
					}
					if(datagrids[3].length>0) {
						for(var i=0;i<datagrids[3].length;i++) {
							if(datagrids[3][i] == 'ProdLevel_dg1572259458131') {
								break;
							}
							if(i==datagrids[3].length-1) {
								datagrids[3][datagrids[3].length] = 'ProdLevel_dg1572259458131';
							}
						}
					} else {
						datagrids[3][datagrids[3].length] = 'ProdLevel_dg1572259458131';
					}
					$('body').data('MESBasic_product_product_prodEditforJS_datagrids', datagrids);
				});
				
				var ProdLevel_dg1572259458131_importDialog = null;
				function ProdLevel_dg1572259458131_showImportDialog(){
					try{
						if(ProdLevel_dg1572259458131_importDialog!=null&&ProdLevel_dg1572259458131_importDialog.isShow==1){
							return false;
						}
						var url = "/MESBasic/product/product/initImport.action?datagridCode=MESBasic_1_product_prodEditforJSdg1572259458131&tid=${id!}&datagridName=dg1572259458131";
							<#if canImportExcel>
								var buttonCode="MESBasic_1_product_prodEditforJSdg1572259458131_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						ProdLevel_dg1572259458131_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("ProdLevel_dg1572259458131"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();ProdLevel_dg1572259458131_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();ProdLevel_dg1572259458131_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						ProdLevel_dg1572259458131_importDialog.show();
					}catch(e){}
				}	
				
				function ProdLevel_dg1572259458131_downLoadFile(){
					var url = "/MESBasic/product/product/downLoad.action?datagridCode=MESBasic_1_product_prodEditforJSdg1572259458131&templateRelatedModelCode=MESBasic_1_product_prodEditforJSdg1572259458131&downloadType=template&fileName=dg1572259458131";
					window.open(url,"","");
				}
				function dg1572259458131RenderOverEvent(){
					if($('#id').val()!=null&&$('#id').val()!=''){ 
	var productID = $('#id').val();  
	ProdLevel_dg1524759114829Widget._DT.configs.checkEditCondition = function( key, nRow){    
		if(ProdLevel_dg1524759114829Widget._DT.getCellValue(nRow,'isUsed')==true){ 
			return false;
		}else{
			return true;
		}
	}
}

	var isItemLevel_check = $("input[name='product.isItemLevel_check']").is(":checked");
	if(isItemLevel_check==true){
			$("#ProdLevel_dg1524759114829 .paginatorbar-operatebar").css("visibility","visible");
	}else{
			$("#ProdLevel_dg1524759114829 .paginatorbar-operatebar").css("visibility","hidden");
	}
	var rLength = ProdLevel_dg1524759114829Widget.getRowLength();
	 for(var j = 0;j<rLength;j++){
    	var itemChange = ProdLevel_dg1524759114829Widget._DT.getCellValue(j,'itemChange');
    	if(itemChange == null || itemChange ==''||itemChange == false ||itemChange == 'false' ){
    			ProdLevel_dg1524759114829Widget._DT.setCellProperty(j,'productID.productCode','readonly',true);
    	}
    }
				}
				function dg1572259458131PageInitMethod(nTabIndex){
					MESBasic.product.product.prodEditforJS.initSize(nTabIndex);
					$(".paginatorbar-operatebar span").eq(1).attr("class","buttonbar-button cui-btn-del")
				}
			</script>
			
			
			</div>
		</div>
			<div class="clearfix pd_bottom">
				<div class="cui-elements pd-top">

<div class="edit-panes-s" >
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
			
							<script type="text/javascript">
								function ProdSecUnit_dg1572259458240_addRowunit(event)
																{
	var unit = $('input[name="product.productBaseUnit.id"]').val();
	if(unit == '' || unit == undefined ){
		workbenchErrorBarWidget.showMessage("该物品没有设置主单位");
		return false;
	}
	ProdSecUnit_dg1530515613350Widget.addRow();
	$('input[name="dg1530515613350baseUnit.id"]') .val(unit);
	$('input[name="dg1530515613350baseUnit.name"]').val($('input[name="product.productBaseUnit.name"]').val());
	var rowLength = ProdSecUnit_dg1530515613350Widget.getRowLength();
	ProdSecUnit_dg1530515613350Widget.setCellValue(rowLength-1,'baseUnit.name',$('input[name="product.productBaseUnit.name"]').val());
	ProdSecUnit_dg1530515613350Widget.setCellValue(rowLength-1,'baseUnit.id',unit);
}
							</script>
								
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/MESBasic/product/product/data-dg1572259458240.action?product.id=${refId!-1}&refId=${refId!-1}&datagridCode=MESBasic_1_product_prodEditforJSdg1572259458240">
			<#else>
				<#assign dUrl="/MESBasic/product/product/data-dg1572259458240.action?product.id=${(product.id)!-1}&datagridCode=MESBasic_1_product_prodEditforJSdg1572259458240">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('MESBasic.buttonPropertyshowName.radion1530515623122')}\",handler:function(event){ProdSecUnit_dg1572259458240_addRowunit(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('MESBasic.buttonPropertyshowName.radion1530515623044')}\",handler:function(event){DT_ProdSecUnit_dg1572259458240_deldatagrid();},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('MESBasic.buttonPropertyshowName.radion1530515623122')}\",handler:function(event){ProdSecUnit_dg1572259458240_addRowunit(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('MESBasic.buttonPropertyshowName.radion1530515623044')}\",handler:function(event){DT_ProdSecUnit_dg1572259458240_deldatagrid();},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_ProdSecUnit_dg1572259458240" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1572259458240_id" value="ProdSecUnit_dg1572259458240" />
			
			<input type="hidden" id="dg1572259458240_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('MESBasic.modelname.randon1530515212961')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/MESBasic/product/product/data-dg1572259458240.action?operateType=export&datagridCode=MESBasic_1_product_prodEditforJSdg1572259458240"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="ProdSecUnit_dg1572259458240" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="ProdSecUnit_dg1572259458240" viewType="${viewType}" renderOverEvent="dg1572259458240RenderOverEvent" route="${routeFlag}" formId="MESBasic_product_product_prodEditforJS_form" noPermissionKeys="baseUnit.name,secUnit.name,changeRate,demo" modelCode="MESBasic_1_product_ProdSecUnit" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1572259458240" dtPage="dgPage"  hidekeyPrefix="dg1572259458240" hidekey="['id','version','baseUnit.id','baseUnit.name','secUnit.id','secUnit.name'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=4 pageInitMethod="dg1572259458240PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=false cannotDeleteRow=false assModelDisplayName=assModelDisplayName  activexButton="MESBasic.buttonPropertyshowName.radion1530515623122,addRowunit,add;MESBasic.buttonPropertyshowName.radion1530515623044,DELETEROW,del" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign baseUnit_name_displayDefaultType=''>
								<#assign baseUnit_name_defaultValue=''>
										<#assign baseUnit_name_defaultValue=''>
																	<#if (baseUnit_name_defaultValue!)?string=="currentUser">
								<#assign baseUnit_name_defaultValue='${staffJson!}'>
							<#elseif (baseUnit_name_defaultValue!)?string=="currentPost">
								<#assign baseUnit_name_defaultValue='${postJson!}'>
							<#elseif (baseUnit_name_defaultValue!)?string=="currentDepart">
								<#assign baseUnit_name_defaultValue='${deptJson!}'>
							<#elseif (baseUnit_name_defaultValue!)?string=="currentComp">
								<#assign baseUnit_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="baseUnit.name"        showFormat="SELECTCOMP" defaultValue="${(baseUnit_name_defaultValue!)?string}" defaultDisplay="${(baseUnit_name_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="MESBasic.product.product.prodEditforJS"  textalign="left"  viewUrl="/X6Basic/unitGroup/baseUnit/unitRef.action" viewCode="X6Basic_1.0_unitGroup_unitRef" mneenable=false crossCompany=false viewTitle="${getText('X6Basic.viewtitle.radion1398240433147')}"  label="${getText('MESBasic.propertydisplayName.randon1530515344717')}" width=100 showFormatFunc=""  />
							<#assign secUnit_name_displayDefaultType=''>
								<#assign secUnit_name_defaultValue=''>
										<#assign secUnit_name_defaultValue=''>
																	<#if (secUnit_name_defaultValue!)?string=="currentUser">
								<#assign secUnit_name_defaultValue='${staffJson!}'>
							<#elseif (secUnit_name_defaultValue!)?string=="currentPost">
								<#assign secUnit_name_defaultValue='${postJson!}'>
							<#elseif (secUnit_name_defaultValue!)?string=="currentDepart">
								<#assign secUnit_name_defaultValue='${deptJson!}'>
							<#elseif (secUnit_name_defaultValue!)?string=="currentComp">
								<#assign secUnit_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="secUnit.name"        showFormat="SELECTCOMP" defaultValue="${(secUnit_name_defaultValue!)?string}" defaultDisplay="${(secUnit_name_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false   selectCompName="MESBasic.product.product.prodEditforJS"  textalign="left"  viewUrl="/X6Basic/unitGroup/baseUnit/unitRef.action" viewCode="X6Basic_1.0_unitGroup_unitRef" mneenable=false crossCompany=false viewTitle="${getText('X6Basic.viewtitle.radion1398240433147')}"  label="${getText('MESBasic.propertydisplayName.randon1530515393619')}" width=100 showFormatFunc=""  />
							<#assign changeRate_displayDefaultType=''>
								<#assign changeRate_defaultValue=''>
										<#assign changeRate_defaultValue=''>
										 									
									<@datacolumn key="changeRate"        showFormat="TEXT" defaultValue="${(changeRate_defaultValue!)?string}" defaultDisplay="${(changeRate_displayDefaultType!)?string}" decimal="6" editable=true type="DECIMAL" showType="decimal" notnull=true     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1530515455954')}" width=100 showFormatFunc=""  />
							<#assign demo_displayDefaultType=''>
								<#assign demo_defaultValue=''>
										<#assign demo_defaultValue=''>
										  
									<@datacolumn key="demo"        showFormat="TEXT" defaultValue="${(demo_defaultValue!)?string}" defaultDisplay="${(demo_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1530515498015')}" width=100 showFormatFunc=""  />
			
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
				function ProdSecUnit_dg1572259458240_check_datagridvalid(){
					//
					var errorObj =ProdSecUnit_dg1572259458240Widget._DT.testData();
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
				
				function savedg1572259458240DataGrid(){
					<#if  refId?? && (refId gt 0)>
					ProdSecUnit_dg1572259458240Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('ProdSecUnit_dg1572259458240Widget') > -1) {
						ProdSecUnit_dg1572259458240Widget.setAllRowEdited();
					}
					var json = ProdSecUnit_dg1572259458240Widget.parseEditedData();
					$('input[name="dg1572259458240ListJson"]').remove();
					$('input[name="dgLists[\'dg1572259458240\']"]').remove();
					$('input[name="dg1572259458240ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1572259458240\']">').val(json).appendTo($('#MESBasic_product_product_prodEditforJS_form'));
					$('<input type="hidden" name="dg1572259458240ModelCode">').val('MESBasic_1_product_ProdSecUnit').appendTo($('#MESBasic_product_product_prodEditforJS_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1572259458240ListJson">').val(json).appendTo($('#MESBasic_product_product_prodEditforJS_form'));
				}
				function DT_ProdSecUnit_dg1572259458240_deldatagrid(){
					var deleteRows = ProdSecUnit_dg1572259458240Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','baseUnit.id','secUnit.id','product.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1572259458240DeletedIds").length>0){
							$("#dg1572259458240DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1572259458240DeletedIds" name="dgDeletedIds[\'dg1572259458240\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_product_product_prodEditforJS_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1572259458240DeletedIds['+CUI('input[name^="dg1572259458240DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_product_product_prodEditforJS_form'));
					});
					return deleteRows;
				}
				function DT_ProdSecUnit_dg1572259458240_delTreeNodes(){
					var deleteRows = ProdSecUnit_dg1572259458240Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','baseUnit.id','secUnit.id','product.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1572259458240DeletedIds").length>0){
							$("#dg1572259458240DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1572259458240DeletedIds" name="dgDeletedIds[\'dg1572259458240\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_product_product_prodEditforJS_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1572259458240DeletedIds['+CUI('input[name^="dg1572259458240DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_product_product_prodEditforJS_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('MESBasic_product_product_prodEditforJS_datagrids');
					if(!datagrids) {
						datagrids = [];
					}
					for(var i=0;i<5;i++) {
						if(!datagrids[i]) {
							datagrids[i] = [];
						}
					}
					if(datagrids[4].length>0) {
						for(var i=0;i<datagrids[4].length;i++) {
							if(datagrids[4][i] == 'ProdSecUnit_dg1572259458240') {
								break;
							}
							if(i==datagrids[4].length-1) {
								datagrids[4][datagrids[4].length] = 'ProdSecUnit_dg1572259458240';
							}
						}
					} else {
						datagrids[4][datagrids[4].length] = 'ProdSecUnit_dg1572259458240';
					}
					$('body').data('MESBasic_product_product_prodEditforJS_datagrids', datagrids);
				});
				
				var ProdSecUnit_dg1572259458240_importDialog = null;
				function ProdSecUnit_dg1572259458240_showImportDialog(){
					try{
						if(ProdSecUnit_dg1572259458240_importDialog!=null&&ProdSecUnit_dg1572259458240_importDialog.isShow==1){
							return false;
						}
						var url = "/MESBasic/product/product/initImport.action?datagridCode=MESBasic_1_product_prodEditforJSdg1572259458240&tid=${id!}&datagridName=dg1572259458240";
							<#if canImportExcel>
								var buttonCode="MESBasic_1_product_prodEditforJSdg1572259458240_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						ProdSecUnit_dg1572259458240_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("ProdSecUnit_dg1572259458240"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();ProdSecUnit_dg1572259458240_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();ProdSecUnit_dg1572259458240_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						ProdSecUnit_dg1572259458240_importDialog.show();
					}catch(e){}
				}	
				
				function ProdSecUnit_dg1572259458240_downLoadFile(){
					var url = "/MESBasic/product/product/downLoad.action?datagridCode=MESBasic_1_product_prodEditforJSdg1572259458240&templateRelatedModelCode=MESBasic_1_product_prodEditforJSdg1572259458240&downloadType=template&fileName=dg1572259458240";
					window.open(url,"","");
				}
				function dg1572259458240RenderOverEvent(){
				}
				function dg1572259458240PageInitMethod(nTabIndex){
					MESBasic.product.product.prodEditforJS.initSize(nTabIndex);
				}
			</script>
			
			
			</div>
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
     	
		<div id="MESBasic_product_product_prodEditforJS_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="MESBasic.product.product.prodEditforJS.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<div id="fileUploadDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-EDIT-MESBasic_1_product_prodEditforJS,html,MESBasic_1_product_Product,MESBasic_1) -->
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
						$("#MESBasic_product_product_prodEditforJS_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#MESBasic_product_product_prodEditforJS_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#MESBasic_product_product_prodEditforJS_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#MESBasic_product_product_prodEditforJS_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			MESBasic.product.product.prodEditforJS.initCount = 0;
			MESBasic.product.product.prodEditforJS.initSize = function(nTabIndex){
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
				var conHeight = h-$("#MESBasic_product_product_prodEditforJS_main_div .edit-head").height()-$("#MESBasic_product_product_prodEditforJS_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#MESBasic_product_product_prodEditforJS_main_div .edit-workflow").height()</#if>;
				$("#MESBasic_product_product_prodEditforJS_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('MESBasic_product_product_prodEditforJS_datagrids');
				var padding_bottom=16;
				$("#MESBasic_product_product_prodEditforJS_main_div .pd_bottom,#MESBasic_product_product_prodEditforJS_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#MESBasic_product_product_prodEditforJS_main_div .edit-panes-s").each(function(index){
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
									if(MESBasic.product.product.prodEditforJS.initCount <= 2) {
										setTimeout(function(){MESBasic.product.product.prodEditforJS.initSize();}, 200);
										MESBasic.product.product.prodEditforJS.initCount++;
									}/* else {
										MESBasic.product.product.prodEditforJS.initCount = 0;
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
							if(($("#MESBasic_product_product_prodEditforJS_main_div .edit-workflow").length > 0) && ($("#MESBasic_product_product_prodEditforJS_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				$('#MESBasic_product_product_prodEditforJS_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				MESBasic.product.product.prodEditforJS.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				MESBasic.product.product.prodEditforJS.initSize();
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
						if(parseInt($("#MESBasic_product_product_prodEditforJS_main_div").css("width"),10)==650){
							$("#MESBasic_product_product_prodEditforJS_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//MESBasic.product.product.prodEditforJS.resizeLayout();
						//MESBasic.product.product.prodEditforJS.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#MESBasic_product_product_prodEditforJS_main_div").css("width"),10)==800){
							$("#MESBasic_product_product_prodEditforJS_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//MESBasic.product.product.prodEditforJS.resizeLayout();
						//MESBasic.product.product.prodEditforJS.initSize();
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
					MESBasic.product.product.prodEditforJS.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					MESBasic.product.product.prodEditforJS.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){MESBasic.product.product.prodEditforJS.initSize();});
				/*
				MESBasic.product.product.prodEditforJS.resizeLayout=function(){
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

		MESBasic.product.product.prodEditforJS.validate = function(){
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
		MESBasic.product.product.prodEditforJS.beforeSaveProcess = function(){
			try{eval("savedg1572259458240DataGrid()");}catch(e){}
			try{eval("savedg1572259458131DataGrid()");}catch(e){}
			try{eval("savedg1572259458193DataGrid()");}catch(e){}

			var extraCol = '<extra-data>';
			$('#MESBasic_product_product_prodEditforJS_form').trigger('beforeSubmit');
			//product.extraCol
			$('*[name^="_complex_"]').each(function(index, item){
				if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
					if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
					var itemValue = CUI(item).val();
					extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
				}
			});
			extraCol += '</extra-data>';
			$('input[name="product.extraCol"]').val(extraCol);
		}
		MESBasic.product.product.prodEditforJS.processDataGrid = function(){
										<#if false && isIE>
										$('#MESBasic_product_product_prodEditforJS_form').append(ProdResetDaily_dg1572259458193Widget._DT.createInputs('dg1572259458193List'));
										</#if>
										<#if false && isIE>
										$('#MESBasic_product_product_prodEditforJS_form').append(ProdLevel_dg1572259458131Widget._DT.createInputs('dg1572259458131List'));
										</#if>
										<#if false && isIE>
										$('#MESBasic_product_product_prodEditforJS_form').append(ProdSecUnit_dg1572259458240Widget._DT.createInputs('dg1572259458240List'));
										</#if>
		};
		MESBasic.product.product.prodEditforJS.save = function(){
			$('#operateType').val("submit");
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!MESBasic.product.product.prodEditforJS.validate()){return;}
			//延迟到延迟提交中处理,解决onchange事件无法触发问题
			//MESBasic.product.product.prodEditforJS.beforeSaveProcess();

			//MESBasic.product.product.prodEditforJS.processDataGrid();
			$('#MESBasic_product_product_prodEditforJS_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('MESBasic_product_product_prodEditforJS_form','MESBasic_product_product_prodEditforJS_datagrids')) {      
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
		MESBasic.product.product.prodEditforJS.print = function(){
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
		
		MESBasic.product.product.prodEditforJS.saveSetting = function(){
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
		
		MESBasic.product.product.prodEditforJS.printSetting = function(){
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
				MESBasic.product.product.prodEditforJS.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(MESBasic.product.product.prodEditforJS.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				MESBasic.product.product.prodEditforJS.settingDialog.show();
			}
		}
		
		
		MESBasic.product.product.prodEditforJS.refcopy = function(){
			var callbackName ="MESBasic.product.product.prodEditforJS.referenceCopyBackInfo";
			MESBasic.product.product.prodEditforJS._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				callBackFuncName : callbackName,
				url : '/MESBasic/product/product/productRefNew.action',
				title : "${getText('ec.common.refcopyTitle')}",
				params : null
			});
		}
		MESBasic.product.product.prodEditforJS.referenceCopyBackInfo = function(obj){
			if(MESBasic.product.product.prodEditforJS._dialog) {
				MESBasic.product.product.prodEditforJS._dialog.close();
			}
			var url = "/MESBasic/product/product/prodEditforJS.action?entityCode=${entityCode}&pendingId=${pendingId?default('')}&&deploymentId=${deploymentId?default('')}&tableInfoId=${(product.tableInfoId)?default('')}&__pc__=${(Parameters.__pc__)!}&id="+document.getElementById("id").value+'&refId='+obj[0].id + "";
			
			window.location=url;
		};
		MESBasic.product.product.prodEditforJS._callBackInfo = function(res){
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
 						window.opener.MESBasic.product.product.editCallBackInfo(res); 						
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
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.MESBasic.product.product.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
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
				MESBasic.product.product.prodEditforJS._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				MESBasic.product.product.prodEditforJS._isObjCustomProp_IE = isObjCustomProp;
			} else {
				MESBasic.product.product.prodEditforJS._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				MESBasic.product.product.prodEditforJS._objCustomPropNames_IE = objCustomPropNames;
			} else {
				MESBasic.product.product.prodEditforJS._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				MESBasic.product.product.prodEditforJS._refViewCode_IE = viewCode;
			} else {
				MESBasic.product.product.prodEditforJS._refViewCode_IE = '';
			}
			MESBasic.product.product.prodEditforJS._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		MESBasic.product.product.prodEditforJS.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			MESBasic.product.product.prodEditforJS._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			MESBasic.product.product.prodEditforJS._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			MESBasic.product.product.prodEditforJS.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			MESBasic.product.product.prodEditforJS._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				MESBasic.product.product.prodEditforJS._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		MESBasic.product.product.prodEditforJS._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(MESBasic.product.product.prodEditforJS._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(MESBasic.product.product.prodEditforJS._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				MESBasic.product.product.prodEditforJS.gridEventObj = gridEventObj;
				callbackName = "MESBasic.product.product.prodEditforJS.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "MESBasic.product.product.prodEditforJS.getMultiselectCallBackInfo_DG" : "MESBasic.product.product.prodEditforJS.getcallBackInfo_DG";
				MESBasic.product.product.prodEditforJS._currRow = $(obj).closest('tr')[0];
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="MESBasic.product.product.prodEditforJS.getcallBackInfo";
			}

			if(_prefix!=''){
				MESBasic.product.product.prodEditforJS._prefix = _prefix.substring(1);
			}
			
			MESBasic.product.product.prodEditforJS._oGrid = oGrid;
			MESBasic.product.product.prodEditforJS._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					MESBasic.product.product.prodEditforJS._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					MESBasic.product.product.prodEditforJS._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					MESBasic.product.product.prodEditforJS._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					MESBasic.product.product.prodEditforJS._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					MESBasic.product.product.prodEditforJS._refViewCode = oColumn.viewCode;
				} else {
					MESBasic.product.product.prodEditforJS._refViewCode = '';
				}
			} else {
				MESBasic.product.product.prodEditforJS._isObjCustomProp = false;
				MESBasic.product.product.prodEditforJS._objCustomPropNames = '';
				MESBasic.product.product.prodEditforJS._refViewCode = '';
			}
			if (MESBasic.product.product.prodEditforJS._isObjCustomProp == true && MESBasic.product.product.prodEditforJS._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				MESBasic.product.product.prodEditforJS._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				MESBasic.product.product.prodEditforJS._customCallBack = customCallBack;
			}
			if(MESBasic.product.product.prodEditforJS._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(MESBasic.product.product.prodEditforJS._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof MESBasic.product.product.prodEditforJS._querycustomFuncN == "function") {
				refparam += MESBasic.product.product.prodEditforJS._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			MESBasic.product.product.prodEditforJS._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		MESBasic.product.product.prodEditforJS._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(MESBasic.product.product.prodEditforJS._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(MESBasic.product.product.prodEditforJS._querycustomFunc(objName.replace(/\./g, '_')));
			}
			MESBasic.product.product.prodEditforJS._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'MESBasic.product.product.prodEditforJS.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		MESBasic.product.product.prodEditforJS._querycustomFunc = function(obj) {
			var str = eval("typeof(MESBasic.product.product.prodEditforJS.query_"+obj+")!='undefined'") ? eval('MESBasic.product.product.prodEditforJS.query_'+obj+'()') : null;
			return str;
		};
		MESBasic.product.product.prodEditforJS.getcallBackGroupInfo = function(obj){
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
			MESBasic.product.product.prodEditforJS._dialog.close();
		}
		MESBasic.product.product.prodEditforJS.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('MESBasic_product_product_prodEditforJS_form',obj[0], MESBasic.product.product.prodEditforJS._prefix, MESBasic.product.product.prodEditforJS._sUrl);
			CUI.commonFills('MESBasic_product_product_prodEditforJS_form',MESBasic.product.product.prodEditforJS._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (MESBasic.product.product.prodEditforJS._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(MESBasic.product.product.prodEditforJS._customCallBack) {
					eval(MESBasic.product.product.prodEditforJS._customCallBack);
					MESBasic.product.product.prodEditforJS._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.product.product.prodEditforJS._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		MESBasic.product.product.prodEditforJS.getcallBackInfo_DG_IE = function(obj){
			if(MESBasic.product.product.prodEditforJS._customBeforeCallBack) {
				var flag = eval(MESBasic.product.product.prodEditforJS._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = MESBasic.product.product.prodEditforJS.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( MESBasic.product.product.prodEditforJS._isObjCustomProp_IE == true && MESBasic.product.product.prodEditforJS._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,MESBasic.product.product.prodEditforJS._sUrl,MESBasic.product.product.prodEditforJS._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,MESBasic.product.product.prodEditforJS._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (MESBasic.product.product.prodEditforJS._isObjCustomProp_IE == true && MESBasic.product.product.prodEditforJS._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = MESBasic.product.product.prodEditforJS._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = MESBasic.product.product.prodEditforJS._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && MESBasic.product.product.prodEditforJS._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + MESBasic.product.product.prodEditforJS._refViewCode_IE + '&id=' + id,
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
				if(MESBasic.product.product.prodEditforJS._customCallBack) {
					eval(MESBasic.product.product.prodEditforJS._customCallBack);
					MESBasic.product.product.prodEditforJS._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.product.product.prodEditforJS._dialog.close();
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
		
		MESBasic.product.product.prodEditforJS.getcallBackInfo_DG = function(obj){
			if(MESBasic.product.product.prodEditforJS._customBeforeCallBack) {
				var flag = eval(MESBasic.product.product.prodEditforJS._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(MESBasic.product.product.prodEditforJS._currRow).next().length==0){
						MESBasic.product.product.prodEditforJS._oGrid.addNewRow();
					}	
					MESBasic.product.product.prodEditforJS._currRow = $(MESBasic.product.product.prodEditforJS._currRow).next();
					$(MESBasic.product.product.prodEditforJS._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(MESBasic.product.product.prodEditforJS._currRow,obj[i], MESBasic.product.product.prodEditforJS._prefix, MESBasic.product.product.prodEditforJS._sUrl);
				if (MESBasic.product.product.prodEditforJS._isObjCustomProp == true && MESBasic.product.product.prodEditforJS._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(MESBasic.product.product.prodEditforJS._currRow,MESBasic.product.product.prodEditforJS._prefix,obj[i],MESBasic.product.product.prodEditforJS._oGrid,MESBasic.product.product.prodEditforJS._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(MESBasic.product.product.prodEditforJS._currRow,MESBasic.product.product.prodEditforJS._prefix,obj[i],MESBasic.product.product.prodEditforJS._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + MESBasic.product.product.prodEditforJS._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + MESBasic.product.product.prodEditforJS._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && MESBasic.product.product.prodEditforJS._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + MESBasic.product.product.prodEditforJS._refViewCode + '&id=' + id,
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
									name = MESBasic.product.product.prodEditforJS._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(MESBasic.product.product.prodEditforJS._currRow, objs, MESBasic.product.product.prodEditforJS._oGrid);
							}
						}
					}
				}
			}
			try{
				if(MESBasic.product.product.prodEditforJS._customCallBack) {
					eval(MESBasic.product.product.prodEditforJS._customCallBack);
					MESBasic.product.product.prodEditforJS._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.product.product.prodEditforJS._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + MESBasic.product.product.prodEditforJS._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		MESBasic.product.product.prodEditforJS.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(MESBasic.product.product.prodEditforJS._oGrid, MESBasic.product.product.prodEditforJS._currRow, MESBasic.product.product.prodEditforJS._key, MESBasic.product.product.prodEditforJS._displayFieldName, obj[i])
			}
			try{
				if(MESBasic.product.product.prodEditforJS._customCallBack) {
					eval(MESBasic.product.product.prodEditforJS._customCallBack);
					MESBasic.product.product.prodEditforJS._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.product.product.prodEditforJS._dialog.close();
			} catch(e){}
		};
		
		MESBasic.product.product.prodEditforJS.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						MESBasic.product.product.prodEditforJS.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#MESBasic_product_product_prodEditforJS_form'));
						}
					}
				}
			});
		};

		$(function(){
			MESBasic.product.product.prodEditforJS.onloadForProduct();
			/*隐藏自定义字段页签*/
	if($(".pd_bottom .edit-panes-s").eq(3).html()=='\n' ||$(".pd_bottom .edit-panes-s").eq(3).html()=='' ){
		$('.edit-tabs li:eq(3)').hide()
	}
	
	/*容器启用是否可选  20161011*/
	if($('#productbatchid').val()!='batch/batch01'){
		$("input[name='product.isContainer_check']").attr('disabled',true);
	}else{
		$("input[name='product.isContainer_check']").attr('disabled',false);
	}

	/*是否质检*/
	var bePropCheck = $("input[name='product.productBePropCheck_check']").is(":checked");
	if(bePropCheck==true){
		$("#productcheckMethodbapid").unDisabledSelect();
		$("input[name='product.frequency']").attr('readonly',false);
		$("input[name='product.storeDeadline']").attr('readonly',false);
		$('#productstoreDeadlineUnitid').unDisabledSelect();
	}else{
		$("#productcheckMethodbapid").disabledSelect();
		$("input[name='product.frequency']").attr('readonly',true);
		$("input[name='product.storeDeadline']").attr('readonly',true);
		$('#productstoreDeadlineUnitid').disabledSelect();
		//$("input[name='product.isCtrlPass_check']").attr('disabled','false');
	}
	
	/*是否折算*/
	var isNeedConvert_check = $("input[name='product.isNeedConvert_check']").is(":checked");
	if(isNeedConvert_check==true){
		$("#product_standardPercent").removeAttr('readonly');
		$("#product_checkIndex_name_click_button").removeAttr('disabled');
	}else{
		$("#product_standardPercent").attr('readonly',true);
		$("#product_checkIndex_name_click_button").attr('disabled',true);
	}
	
	/*保质期管理*/
	var productbatchid = $('#productbatchid').attr('originalvalue');
	if(productbatchid=='batch/batch03'){
	 	$("input[name='product.isKeepDate_check']").attr('checked',false);
	}
	var isKeepDate_check = $("input[name='product.isKeepDate_check']").is(":checked");
	if(isKeepDate_check == true){
		//$("label:contains(查看复验周期)").attr("onclick","showResetDaily()").css('color','blue');//查看复验周期链接
		$('#productkeepReckonid').unDisabledSelect();//有效期推算
		$('#product_notifyDays').attr('readonly',false);//提前提醒
		//$('#productresetMarkid').unDisabledSelect();//复验期推算
		//保质期单位
		$('#productkeepUnitid').unDisabledSelect();
		//保质期
		$('#product_keepDay').attr('readonly',false);
		//近效期单位
		$('#productapproachUnitid').unDisabledSelect();
		//近效期
		$('#product_approachTime').attr('readonly',false);
	}else{
		//保质期单位置空
		$('#product_keepUnit_id__jQSelect56 div h4').text('');
		//保质期置空
		$('#product_keepDay').val('');
		//有效期推算置空
		$('#product_keepReckon_id__jQSelect67 div h4').text('');
		//提前提醒（天）置空
		$('#product_notifyDays').val('');
		//近效期单位置空
		$('#product_approachUnit_id__jQSelect78 div h4').text('');
		//近效期置空
		$('#product_approachTime').val('');
		//复验期推置空
		$('#product_resetMark_id__jQSelect89 div h4').text('');
		//$("label:contains(查看复验周期)").attr("onclick","").css('color','gray');
		$('#productkeepReckonid').disabledSelect();
		$('#product_notifyDays').attr('readonly',true);
		//$('#productresetMarkid').disabledSelect();
		//保质期单位
		$('#productkeepUnitid').disabledSelect();
		//保质期
		$('#product_keepDay').attr('readonly',true);
		//近效期单位
		$('#productapproachUnitid').disabledSelect();
		//近效期
		$('#product_approachTime').attr('readonly',true);
	}
/*判断是否为新增页面*/
/*新建时除了单位组可选，其他单位都禁用*/
	var id = $('#id').val();
	if(id==''){
		/*物品目录判断*/
		var prodList =$("input[name='product.productListID.id']").val();
		if(prodList=='-1' || prodList==''){
			CUI.Dialog.alert('当前选中的物品目录为虚拟目录，无法正常保存，请重新选择有效物品目录！', 
			function(){window.close();}, 
			'警告', 70, 400);
			}
		//$("label:contains(复验周期)").hide();
		$("label:contains(查看维护记录)").hide();
		$("label:contains(查看历史价格)").hide();
		$("label:contains(查看更改记录)").hide();
		//$("label:contains(查看复验周期)").hide();
		
		$("#product_productBaseUnit_name_click_button").hide();//主单位
		$('#product_storeUnit_name_click_button').hide();//库存单位
		$('#product_productBuyUnit_name_click_button').hide();//采购单位
		$('#product_saleUnit_name_click_button').hide();//销售单位
		$('#product_productCostUnit_name_click_button').hide();//成本单位
		$('#product_limsUnit_name_click_button').hide();//取样单位
	}


/*检查是否有价格历史*/
	var productCode = $('#product_productCode').val();
	var isCostHistory;
	/*
	$.ajax({
		url : '/MESBasic/product/product/checkCostHistory.action',
		type :'post',
		async: false,
		data :{'productCode':productCode},
		success:function(res){
		if(res.dealSuccessFlag==true){
			isCostHistory = res.isCostHistory;
			if(isCostHistory){
				$('#productbapValueTypeid').disabledSelect();
				$('#product_planPrice').attr('readonly',true);
				}else{
				$('#productbapValueTypeid').unDisabledSelect();
				$('#product_planPrice').attr('readonly',false);
				}
			}
		}
	});
	*/

/*主单位编辑判断*/
	
	var unitGroupID = CUI("input[name='product.unitGroup.id']").val();
	//var BaseUnit = CUI("input[name='product.productBaseUnit.id']").val();

	if(unitGroupID!=''){
		//$('#product_unitGroup_name_click_button').hide();//单位组
		$("#product_productBaseUnit_name_click_button").hide();//主单位
		//$('#product_storeUnit_name_click_button').hide();//库存单位
		//$('#product_productBuyUnit_name_click_button').hide();//采购单位
		//$('#product_saleUnit_name_click_button').hide();//销售单位
		//$('#product_productCostUnit_name_click_button').hide();//成本单位
	}


/*是否勾选等级品管理*/
	var isItemLevel_check = $("input[name='product.isItemLevel_check']").is(":checked");
	if(isItemLevel_check==true || isItemLevel_check=='true'){
		$("#ProdLevel_dg1524759114829 .paginatorbar-operatebar").css("visibility","visible");
	}else{
		$("#ProdLevel_dg1524759114829 .paginatorbar-operatebar").css("visibility","hidden");
	}
	
/*是否勾选复验周期*/
	var isProReset = $("input[name='product.isProReset_check']").is(":checked");
	if(isProReset==true || isProReset_check=='true'){
		$("#ProdResetDaily_dg1524762478590 .paginatorbar-operatebar").css("visibility","visible");
		
	}else{
	    
		$("#ProdResetDaily_dg1524762478590 .paginatorbar-operatebar").css("visibility","hidden");

	}
	
	
	
	
	
	
	//货位状态
	var cargoStatue= $('input[name="product.ware.cargoStatue.id"]').val();
	//判断仓库是否启用货位
	if(cargoStatue=='storageState/storageState2'){
		$('#product_storeSet_placeSetCode_click_button').hide();
		//$("table tr td:contains('货位编码')").css("color","rgb(0, 0, 0)");
	}else{
		$('#product_storeSet_placeSetCode_click_button').show();
	}
	//如果物品启用批次为按件，则件数量必填。其他的件数量不可填
	/*
	if($("#productbatchid").val()!='batch/batch02'){
		$('input[name="product.pieceNum"]').parents("td").prev().css({color:""});
		$("#product_pieceNum").attr('readonly',true);
		$("#product_pieceNum").val('');
	}else{
		$('input[name="product.pieceNum"]').parents("td").prev().css({color:"rgb(179, 3, 3)"});
		$("#product_pieceNum").attr('readonly',false);
	}*/
		});

		MESBasic.product.product.prodEditforJS.beforeSubmitMethodSettingInPage = function(){
			MESBasic.product.product.prodEditforJS.onsaveForProduct();
			/*物品目录判断*/
	var prodList =$("input[name='product.productListID.id']").val();
	if(prodList=='-1'|| prodList==''){
		CUI.Dialog.alert('当前选中的物品目录为虚拟目录，无法正常保存，请重新选择有效物品目录！', 
		function(){}, 
		'警告', 70, 400);
		return false;
		}

/*勾选质检，应选择质检方式*/
	var beProPCheck = $("input[name='product.productBePropCheck_check']").is(":checked");
	var checkMethod = $("#productcheckMethodbapid").val();
	if(beProPCheck==true&& (checkMethod==null||checkMethod=='') ){
	workbenchErrorBarWidget.showMessage("${getText('MESBasic.productcheckMethodbap.radion1')}",'f');
	return false;
	}
	if(beProPCheck==false){
		$("#productcheckMethodbapid").val('');
	}
	/*勾选折算，系数和检验指标都必填*/
	var proSP = $("input[name='product.standardPercent']").val();
	var proCID = $('#product_checkIndex_name').val();
	var isNeedConvert_check = $("input[name='product.isNeedConvert_check']").is(":checked");
	if(isNeedConvert_check==true && (proSP==null||proSP=='')){
		workbenchErrorBarWidget.showMessage("${getText('MESBasic.product.standardPercent')}",'f');
		return false;
	}
	if(isNeedConvert_check==true && (proCID==null||proCID=='')){
		workbenchErrorBarWidget.showMessage("${getText('MESBasic.product.checkIndex1')}",'f');
		return false;
	}
	
	if( proSP !=null && proSP != ''&& parseFloat(proSP) <=0){
		workbenchErrorBarWidget.showMessage("${getText('MESBasic.errorMsg.radion1481692848047')}",'f');
		return false;
	}
/*比较安全库存，最高库存，最低库存*/
var topNum = $("#product_topNum").val();
var safeNum = $("#product_safeNum").val();
var lowNum = $("#product_lowNum").val();
if(topNum!=null && topNum!="" && safeNum!=null && safeNum!="" && parseFloat(topNum)<parseFloat(safeNum)){
	workbenchErrorBarWidget.showMessage("${getText('MESBasic.product.numCompare1')}",'f');
	return false;
}
if(topNum!=null && topNum!="" && lowNum!=null && lowNum!="" && parseFloat(topNum)<parseFloat(lowNum)){
	workbenchErrorBarWidget.showMessage("${getText('MESBasic.product.numCompare1')}",'f');
	return false;
}
if( safeNum!=null && safeNum!="" && lowNum!=null && lowNum!="" && parseFloat(safeNum)<parseFloat(lowNum)){
	workbenchErrorBarWidget.showMessage("${getText('MESBasic.product.numCompare1')}",'f');
	return false;
}

/*盘点周期0-1000*/
var product_productCheckFreq = $("#product_productCheckFreq").val();    
if(parseFloat(product_productCheckFreq)<0||parseFloat(product_productCheckFreq)>1000){
	workbenchErrorBarWidget.showMessage("${getText('MESBasic.product.productCheckFreq1')}",'f');;
	return false;
}
/*等级品管理控制*/
if(ProdLevel_dg1572259458131Widget!=null){
	var rowLength = ProdLevel_dg1572259458131Widget.getRowLength();
	var isQC = $("input[name='product.isItemLevel_check']").is(":checked");
	
	 if(isQC == true && rowLength == 0){
	 	workbenchErrorBarWidget.showMessage("${getText('MESBasic.product.isItemLevel_check')}",'f');
		return false;
	 }
	    for(var i = 0 ;i<rowLength ; i++){
	    	if(ProdLevel_dg1572259458131Widget._DT.getCellValue(i,'corder')==null||ProdLevel_dg1572259458131Widget._DT.getCellValue(i,'corder')==""){
	    		workbenchErrorBarWidget.showMessage("${getText('MESBasic.product.prodLevelcorder1')}",'f');
	    		return false;
	    	}
	    }
	    for(var j = 0;j<rowLength ;j++){
	    	var productCode = ProdLevel_dg1572259458131Widget._DT.getCellValue(j,'compareID.productCode');
	    	var itemChange = ProdLevel_dg1572259458131Widget._DT.getCellValue(j,'itemChange');
	    	if(itemChange == true || itemChange =='true'){
	    		if(productCode == null || productCode==''){
	    			workbenchErrorBarWidget.showMessage("${getText('MESBasic.product.compareIDproductCode1')}",'f');
	    			return false;
	    		}
	    	}
	    }
	    
	    var tmparry = [];
	    for(var k = 0;k<rowLength ;k++){
	    	var igrade = ProdLevel_dg1572259458131Widget._DT.getCellValue(k,'clevel');
	    	
	    	if(tmparry.length == 0){
	    		tmparry.push(igrade);
	    	}else{
	    		for(var m=0; m<tmparry.length; m++){
	    			if(tmparry[m] == igrade){
	    				workbenchErrorBarWidget.showMessage("${getText('MESBasic.product.ilevel1')}",'f');
	    				return false;
	    			}
	    		}
	    	tmparry.push(igrade);
	    	}
	    }
    }
    
    /*采购组原有字段的值做下保存*/
    var originalvalue = $('#product_purchGroupId_purchGroupName').attr('originalvalue');
    if($('#product_purchGroupId_purchGroupName').attr('originalvalue')==null||$('#product_purchGroupId_purchGroupName').attr('originalvalue')==''){
    	$('#product_purGroupMark').val("");
    }
	else{
		$('#product_purGroupMark').val(originalvalue);
	}
	
	//参考采购价
	
    if($('#product_productCostPrice').attr('originalvalue')!=null){
    	var costPriceOri = $('#product_productCostPrice').attr('originalvalue');
    	$('#product_costPriceOri').val(costPriceOri);
    }
	
	
	//参考售价

	if($('#product_salePrice').attr('originalvalue')!=null){
		var salePriceOri = $('#product_salePrice').attr('originalvalue');
		$('#product_salePriceOri').val(salePriceOri);
	}
	
	//最新库存成本

	if($('#product_recCost').attr('originalvalue')!=null){
		var recCostOri = $('#product_recCost').attr('originalvalue');
		$('#product_recCostOri').val(recCostOri);
	}
	
	/*如果批次启用为按件，则件数量不允许为空*/
	if($('#productbatchid').val()=='batch/batch02' &&($('#product_pieceNum').val()=='' ||$('#product_pieceNum').val()==null)){
		workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.asert.notnull','件重量')}","f");
					return false;
	}else{
		if(parseFloat($('#product_pieceNum').val())==0  || parseFloat($('#product_pieceNum').val())<0){
		workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.plus.error','件重量')}","f");
					return false;
		}
	}
	
	var proType=$('#productprodType').val();
	if(proType==""){
		workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.asert.notnull','物品类别')}","f");
		return false;
	}
	//物品发起复验需要填最大复验次数
	var isProReset = $("input[name='product.isProReset_check']").is(":checked");
	if(isProReset == true && ($('#product_frequency').val() =='' || $("#product_frequency").val() == null )){
		workbenchErrorBarWidget.showMessage("该物品需要复验，请填写最大复验次数","f");
		return false;
	}
//复验周期需要填写
    if(ProdResetDaily_dg1572259458193Widget != null){
		var rowLengthReset = ProdResetDaily_dg1572259458193Widget.getRowLength();
		if(rowLengthReset == 0 && isProReset == true){
			workbenchErrorBarWidget.showMessage("该物品需要复验，请设置物品的复验周期","f");
			return false;
		}	
	}
		};
		MESBasic.product.product.prodEditforJS.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  MESBasic.product.product.prodEditforJS.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		MESBasic.product.product.prodEditforJS.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#MESBasic_product_product_prodEditforJS_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#MESBasic_product_product_prodEditforJS_main_div").hide();
				},100);
				//CUI("#MESBasic_product_product_prodEditforJS_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		MESBasic.product.product.prodEditforJS.showThis = function(){
			if(!CUI("#MESBasic_product_product_prodEditforJS_main_div").is(':visible')) {
				CUI("#MESBasic_product_product_prodEditforJS_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		MESBasic.product.product.prodEditforJS.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			MESBasic.product.product.prodEditforJS.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "MESBasic_product_product_prodEditforJS_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=MESBasic&modelName=MESBasic_1_product_Product&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			MESBasic.product.product.prodEditforJS.auditDialog.show();
			</#if>
		}
		
		
		MESBasic.product.product.prodEditforJS.showInfoDialog=function(mode){
			
			MESBasic.product.product.prodEditforJS.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "MESBasic_product_product_prodEditforJS_dealInfo",
				modal:true,
				height:500,
				width: 950,//适应国际化版
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			MESBasic.product.product.prodEditforJS.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		MESBasic.product.product.prodEditforJS.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=MESBasic_1_product");
			}
		}
		
		MESBasic.product.product.prodEditforJS.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/MESBasic/product/product/dealInfo-list.action&dlTableInfoId=${(product.tableInfoId)?default('')}");
			}
		}
		MESBasic.product.product.prodEditforJS.showFlowInfo=function(){
		     //IE8环境下使用旧版flash流程展现页面，其他情况使用html5流程展现页面
		    var browser=navigator.appName; 
			var b_version=navigator.appVersion; 
			var version=b_version.split(";"); 
			var trim_Version=version[1]&&version[1].replace(/[ ]/g,"");
			var isIE8=(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE8.0")||($.browser.msie&&(Number($.browser.version)<= 8));//IE8兼容视图模式下浏览器版本判断逻辑补充
			if(CUI.trim(CUI("#flowDiv").html())==""){
				if(isIE8){
				    CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=MESBasic_1_product_Product&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(product.tableInfoId)?default('')}");
				}else{
				    CUI("#flowDiv").load("/ec/workflow/flowViewH5.action?env=runtime&modelCode=MESBasic_1_product_Product&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(product.tableInfoId)?default('')}");
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
		MESBasic.product.product.prodEditforJS.supervision=function(){
			MESBasic.product.product.prodEditforJS.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(product.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				MESBasic.product.product.prodEditforJS.modifyOwnerStaffDialog.show();
		}
		
function propcheck(){
    /*
	if($("input[name='product.isCtrlPass_check']").is(":checked")==true && $("input[name='product.productBePropCheck_check']").is(":checked")==false ){
		$("input[name='product.productBePropCheck_check']").attr('checked',true);
		alert("${getText('MESBasic.product.isCtrlPass_check1')}");
	}
	*/
	var bePropCheck = $("input[name='product.productBePropCheck_check']").is(":checked");
	if(bePropCheck==true){
		$("#productcheckMethodbapid").unDisabledSelect();
		$("input[name='product.frequency']").attr('readonly',false);
		$("input[name='product.storeDeadline']").attr('readonly',false);
		$('#productstoreDeadlineUnitid').unDisabledSelect();
		$("input[name='product.isCtrlPass_check']").attr('disabled',false);
	}else{
		$("#productcheckMethodbapid").disabledSelect();
		$("input[name='product.frequency']").attr('readonly',true);
		$("input[name='product.storeDeadline']").attr('readonly',true);
		$('#productstoreDeadlineUnitid').disabledSelect();
		//不管是否质检，放行检验都可编辑   之前为true
		$("input[name='product.isCtrlPass_check']").attr('disabled',false);
	}
}
function showProdDealInfo(){
	var product_code = $("#product_productCode").val();
	var dialog  = new CUI.Dialog({  
        title: "物品维护记录", 
        iframe: 'showProdDealInfo_iframe', 
        modal:true,  
        type:5,  
        dragable:true,  
        url: "/MESBasic/product/prodDealInfo/modifyList.action?${getPowerCode('MESBasic_1_product_productLayout_productPart_modify_modify_MESBasic_1_product_productPart')}&openType=page&listCustomCondition=assignID.productCode="+product_code, // 内容, 可以是url  
        //hideCloseBtn: true;  // 隐藏右上角关闭按钮, 默认不隐藏   
    });  
    dialog .show();
}
function isKeepDate_check(){
	var ischeck = $("input[name='product.isKeepDate_check']").is(":checked");
	var productbatchid = $('#productbatchid').attr('value');
	if((productbatchid=='batch/batch03'||productbatchid=='') && ischeck==true){
	 	$("input[name='product.isKeepDate_check']").attr('checked',false);
		CUI.Dialog.alert("${getText('MESBasic.product.productbatchid1')}", 
			function(){}, 
			'警告', 70, 400);
	}
	var isKeepDate_check = $("input[name='product.isKeepDate_check']").is(":checked");
	if(isKeepDate_check == true){
		//$("label:contains(查看复验周期)").attr("onclick","showResetDaily()").css('color','blue');//查看复验周期链接
		$('#productkeepReckonid').unDisabledSelect();//有效期推算
		$('#product_notifyDays').attr('readonly',false);//提前提醒
		//$('#productresetMarkid').unDisabledSelect();//复验期推算
		//保质期单位
		$('#productkeepUnitid').unDisabledSelect();
		//保质期
		$('#product_keepDay').attr('readonly',false);
		//近效期单位
		$('#productapproachUnitid').unDisabledSelect();
		//近效期
		$('#product_approachTime').attr('readonly',false);
	}else{
		//保质期单位置空
		$('#productkeepUnitid').setValue('');
		//保质期置空
		$('#product_keepDay').val('');
		//有效期推算置空
		$('#productkeepReckonid').setValue('');
		//提前提醒（天）置空
		$('#product_notifyDays').val('');
		//近效期单位置空
		$('#productapproachUnitid').setValue('');
		//近效期置空
		$('#product_approachTime').val('');
		//复验期推置空
		//$('#productresetMarkid').setValue('');
		//$("label:contains(查看复验周期)").attr("onclick","").css('color','gray');
		$('#productkeepReckonid').disabledSelect();
		$('#product_notifyDays').attr('readonly',true);
		//$('#productresetMarkid').disabledSelect();
		//保质期单位
		$('#productkeepUnitid').disabledSelect();
		//保质期
		$('#product_keepDay').attr('readonly',true);
		//近效期单位
		$('#productapproachUnitid').disabledSelect();
		//近效期
		$('#product_approachTime').attr('readonly',true);
	}
}
function isProReset_check(){
	var isProReset = $("input[name='product.isProReset_check']").is(":checked");
	var rowLength = ProdResetDaily_dg1524762478590Widget.getRowLength();
	if(isProReset == true){
	    
		$("#ProdResetDaily_dg1524762478590 .paginatorbar-operatebar").css("visibility","visible");
		//发起复验自动添加一行
		if(rowLength == 0){
			ProdResetDaily_dg1524762478590Widget.addRow();
			ProdResetDaily_dg1524762478590Widget.setCellValue(0,'reinspect','');
		}
		
	}else{
		$("#ProdResetDaily_dg1524762478590 .paginatorbar-operatebar").css("visibility","hidden");
	}
	if(isProReset == false && rowLength>0){
		$("input[name='product.isProReset_check']").attr('checked',true);
		$("#ProdResetDaily_dg1524762478590 .paginatorbar-operatebar").css("visibility","visible");
		workbenchErrorBarWidget.showMessage("复验周期需要全部删去",'f');
    	return false;
	}
	
}
function isItemLevel_check(){
	var isItemLevel_check = $("input[name='product.isItemLevel_check']").is(":checked");
	var rowLength = ProdLevel_dg1524759114829Widget.getRowLength();
	if(isItemLevel_check==true){
		$("#ProdLevel_dg1524759114829 .paginatorbar-operatebar").css("visibility","visible");
	}else{
		$("#ProdLevel_dg1524759114829 .paginatorbar-operatebar").css("visibility","hidden");
	}
	if(isItemLevel_check==false && rowLength>0){
		$("input[name='product.isItemLevel_check']").attr('checked',true);
		$("#ProdLevel_dg1524759114829 .paginatorbar-operatebar").css("visibility","visible");
		workbenchErrorBarWidget.showMessage("${getText('MESBasic.product.cancleProdLevel1')}",'f');
    	return false;
	}
}
function unit(){
	var unitGroupID = CUI("input[name='product.unitGroup.id']").val();
	var unitMain = "";
	var unitId = "";
	
	$.ajax({
		url : '/MESBasic/product/product/getUnitMain.action',
		type :'post',
		async: false,
		data :{'unitGroupIds':unitGroupID},
		success:function(res){
			if(res.dealSuccessFlag==true){
				unitMain = res.unitMain;
				unitId = res.unitId;
				$("input[name='product.productBaseUnit.name']").val(unitMain);
				$("input[name='product.storeUnit.name']").val(unitMain);
				$("input[name='product.productBuyUnit.name']").val(unitMain);
				$("input[name='product.saleUnit.name']").val(unitMain);
				$("input[name='product.productCostUnit.name']").val(unitMain);
				$("input[name='product.limsUnit.name']").val(unitMain);
				CUI("input[name='product.productBaseUnit.id']").val(unitId);
				CUI("input[name='product.storeUnit.id']").val(unitId);
				CUI("input[name='product.productBuyUnit.id']").val(unitId);
				CUI("input[name='product.saleUnit.id']").val(unitId);	
				CUI("input[name='product.productCostUnit.id']").val(unitId);
				CUI("input[name='product.limsUnit.id']").val(unitId);
				
				var id = $('#id').val();
				if(id==''){
					$("#product_productBaseUnit_name_click_button").hide();
					$('#product_storeUnit_name_click_button').show();//库存单位
					$('#product_productBuyUnit_name_click_button').show();//采购单位
					$('#product_saleUnit_name_click_button').show();//销售单位
					$('#product_productCostUnit_name_click_button').show();//成本单位
					$('#product_limsUnit_name_click_button').show();//取样单位
				}
			}
		}
	});

}
function checkPlaceSetCode(){
	//物品Id
	var wareId=$('input[name="product.ware.id"]').val();
	//货位带出来的物品的
	var wareStoreId=$('input[name="product.storeSet.wareId.id"]').val();
	if(wareId!=wareStoreId){
			//在更改仓库时将货位置空
		$('input[name="product.storeSet.placeSetCode"]').val('');
		$('input[name="product.storeSet.placeSetName"]').val('');
		$('input[name="product.storeSet.id"]').val('');
	}
	
	//货位状态
	var cargoStatue= $('input[name="product.ware.cargoStatue.id"]').val();
	//判断仓库是否启用货位
	if(cargoStatue=='storageState/storageState2'){
		$('#product_storeSet_placeSetCode_click_button').hide();
		//$("table tr td:contains('货位编码')").css("color","rgb(0, 0, 0)");
	}else{
		$('#product_storeSet_placeSetCode_click_button').show();
		//$("table tr td:contains('货位编码')").css("color","rgb(179, 3, 3)");
	}

}


function isChange(){
	var rowLength = ProdLevel_dg1524759114829Widget.getRowLength();
	 for(var j = 0;j<rowLength ;j++){
    	var itemChange = ProdLevel_dg1524759114829Widget._DT.getCellValue(j,'itemChange');
    	if(itemChange == false || itemChange =='false'){
    	    ProdLevel_dg1524759114829Widget._DT.setCellValue(j,'productID.id','');//productID.productCode
    		ProdLevel_dg1524759114829Widget._DT.setCellValue(j,'productID.productCode','');
    		ProdLevel_dg1524759114829Widget._DT.setCellValue(j,'productID.productName','');
    		$("input[name='dg1524759114829compareID.id']").val('');
    		ProdLevel_dg1524759114829Widget._DT.setCellProperty(j,'productID.productCode','readonly',true);
    	}
    	if(itemChange == true || itemChange =='true'){
    		ProdLevel_dg1524759114829Widget._DT.setCellProperty(j,'productID.productCode','readonly',false);
    	}
    }
}
function a(obj){
	var pugId = $("input[name='product.unitGroup.id']").val();
	var rplId = obj[0].unitGroup.id ;
	if(pugId!=rplId){
		MESBasic_product_product_refProductErrorbarWidget.showMessage("${getText('MESBasic.product.replaceProduct1')}",'f');
		return false;
	}
	if($('#id').val()==obj[0].id){
		MESBasic_product_product_refProductErrorbarWidget.showMessage("${getText('MESBasic.product.replaceProduct2')}",'f');
		return false;
	} 
}





		/* CUSTOM CODE START(view-EDIT-MESBasic_1_product_prodEditforJS,js,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
		MESBasic.product.product.prodEditforJS.onloadForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-MESBasic_1_product_prodEditforJS,onloadForProduct,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
		}

		MESBasic.product.product.prodEditforJS.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-MESBasic_1_product_prodEditforJS,onsaveForProduct,MESBasic_1_product_Product,MESBasic_1) */
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
				<div class="sidebar-top"><a href="#"  onclick="MESBasic.product.product.prodEditforJS.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="MESBasic.product.product.prodEditforJS.showBusinessList('${l.relatingModel.code.replace('.','')}',${(product.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
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