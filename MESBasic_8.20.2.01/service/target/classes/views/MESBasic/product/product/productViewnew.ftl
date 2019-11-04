<!-- MESBasic_1/product/productViewnew -->
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
<#assign viewType = "readonly">
<#-- 实体对象 -->
<#assign tableObj = product>
<#-- 命名空间 -->
<#assign editPageNs = "MESBasic.product.product.productViewnew">
<#-- 模型名称-->
<#assign modelName = "product">
<#-- 视图编码-->
<#assign viewCode = "MESBasic_1_product_productViewnew">
<#-- 实体编码-->
<#assign entity_code = "MESBasic_1_product">
<#-- 视图名称-->
<#assign viewName = "productViewnew">
<#-- datagrid编码-->
<#assign datagridCode = "MESBasic_product_product_productViewnew_datagrids">
<#-- 首字母大写的模型名称-->
<#assign upcaseModelName = "Product">
<#-- 页面打印按钮 -->
<#assign isPrint = false>
<#-- 控件打印按钮 -->
<#assign controlPrint = false>
<#-- 是否只读 -->
<#assign allReadOnly = true>
<#-- 是否是参照视图 -->
<#assign isReference =true>
<#-- 是否可弃审 -->
<#assign retrialFlag = false>
<#-- formid -->
<#assign editFormId = "MESBasic_product_product_productViewnew_form">
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
        <#assign configTitle = getText('MESBasic.viewtitle.randon1476012501418')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		
		#MESBasic_product_product_productViewnew_form{float:left;width:100%;}
		
		
		</style>
		<script type="text/javascript">
			CUI.ns('MESBasic.product.product.productViewnew');
			MESBasic.product.product.productViewnew.currentUser = ${userJson};
			MESBasic.product.product.productViewnew.currentStaff = ${staffJson};
			MESBasic.product.product.productViewnew.currentDepartment = ${deptJson};
			MESBasic.product.product.productViewnew.currentPosition = ${postJson};
			MESBasic.product.product.productViewnew.currentCompany = ${compJson};
		</script>
		<!-- CUSTOM CODE START(view-VIEW-MESBasic_1_product_productViewnew,head,MESBasic_1_product_Product,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
    </head>
	<body class="view-edit ">
		<@loadpanel newType=true/>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="product.unitGroup.id,product.productBuyUnit.id,product.ware.id,product.productBaseUnit.id,product.modifyPerson.id,product.checkIndex.id,product.purchGroupId.id,product.creator.id,product.productCostUnit.id,product.id,product.deleteStaff.id,product.storeUnit.id,product.replaceItem.id,product.storeSet.id,product.productListID.id,product.saleUnit.id," onsubmitMethod="MESBasic.product.product.productViewnew.beforeSubmitMethod()" id="MESBasic_product_product_productViewnew_form" namespace="/MESBasic/product/product/productViewnew" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=MESBasic_1_product_Product&_bapFieldPermissonModelName_=Product" editPageNs="MESBasic.product.product.productViewnew" callback="MESBasic.product.product.productViewnew._callBackInfo" ecform="true">
			<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
			<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="MESBasic_product_product_productViewnew_main_div">
			<div class="edit-head">
				<#include "../../../ec/tableInfo/operateheadbar_all.ftl" >
				<#include "../../../ec/tableInfo/creatorInfo.ftl" >
			</div>
    		<div class="edit-main" id="MESBasic_product_product_productViewnew">
    			<div class="edit-content">
    	<#include "../../../ec/tableInfo/formparam.ftl" >				
					<input type="hidden" name="product.unitGroup.id" value="${(product.unitGroup.id)!""}" originalvalue="${(product.unitGroup.id)!""}"/>
					<input type="hidden" name="product.productBuyUnit.id" value="${(product.productBuyUnit.id)!""}" originalvalue="${(product.productBuyUnit.id)!""}"/>
					<input type="hidden" name="product.ware.id" value="${(product.ware.id)!""}" originalvalue="${(product.ware.id)!""}"/>
					<input type="hidden" name="product.productBaseUnit.id" value="${(product.productBaseUnit.id)!""}" originalvalue="${(product.productBaseUnit.id)!""}"/>
					<input type="hidden" name="product.modifyPerson.id" value="${(product.modifyPerson.id)!""}" originalvalue="${(product.modifyPerson.id)!""}"/>
					<input type="hidden" name="product.checkIndex.id" value="${(product.checkIndex.id)!""}" originalvalue="${(product.checkIndex.id)!""}"/>
					<input type="hidden" name="product.purchGroupId.id" value="${(product.purchGroupId.id)!""}" originalvalue="${(product.purchGroupId.id)!""}"/>
					<input type="hidden" name="product.creator.id" value="${(product.creator.id)!""}" originalvalue="${(product.creator.id)!""}"/>
					<input type="hidden" name="product.productCostUnit.id" value="${(product.productCostUnit.id)!""}" originalvalue="${(product.productCostUnit.id)!""}"/>
					<input type="hidden" name="product.id" value="${(product.id)!""}" originalvalue="${(product.id)!""}"/>
					<input type="hidden" name="product.deleteStaff.id" value="${(product.deleteStaff.id)!""}" originalvalue="${(product.deleteStaff.id)!""}"/>
					<input type="hidden" name="product.storeUnit.id" value="${(product.storeUnit.id)!""}" originalvalue="${(product.storeUnit.id)!""}"/>
					<input type="hidden" name="product.replaceItem.id" value="${(product.replaceItem.id)!""}" originalvalue="${(product.replaceItem.id)!""}"/>
					<input type="hidden" name="product.storeSet.id" value="${(product.storeSet.id)!""}" originalvalue="${(product.storeSet.id)!""}"/>
					<input type="hidden" name="product.productListID.id" value="${(product.productListID.id)!""}" originalvalue="${(product.productListID.id)!""}"/>
					<input type="hidden" name="product.saleUnit.id" value="${(product.saleUnit.id)!""}" originalvalue="${(product.saleUnit.id)!""}"/>
		 <ul class="edit-tabs">
			<li>${getText('ec.view.commoninfo')}</li>
			<li>${getText('MESBasic.tabname.radion1470127643632')}</li>
			<li>${getText('MESBasic.tabname.radion1470127664920')}</li>
			<li>${getText('MESBasic.tabname.radion1471508090437')}</li>
			<li>${getText('MESBasic.tabname.radion1471508110668')}</li>
			<li>${getText('MESBasic.tabname.radion1471522901420')}</li>
		</ul>
<script type="text/javascript">
var attcountid = "MESBasic_product_product_productViewnew_form"+"_attcount";
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
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="product.productCode" id="product_productCode"  style=";" originalvalue="<#if !newObj || (product.productCode)?has_content>${(product.productCode?html)!}<#else>${product_productCode_defaultValue!}</#if>" value="<#if !newObj || (product.productCode)?has_content>${(product.productCode?html)!}<#else>${product_productCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
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
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="product.productName" id="product_productName"  style=";" originalvalue="<#if !newObj || (product.productName)?has_content>${(product.productName?html)!}<#else>${product_productName_defaultValue!}</#if>" value="<#if !newObj || (product.productName)?has_content>${(product.productName?html)!}<#else>${product_productName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" onchange='ChartoPY()'/>
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1470120092391')}" >${getText('MESBasic.propertydisplayName.randon1470120092391')}</label>
				</td>
				
						<#assign product_mnecode_defaultValue  = ''>
							 							<#assign product_mnecode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="product.mnecode" id="product_mnecode"  style=";" originalvalue="<#if !newObj || (product.mnecode)?has_content>${(product.mnecode?html)!}<#else>${product_mnecode_defaultValue!}</#if>" value="<#if !newObj || (product.mnecode)?has_content>${(product.mnecode?html)!}<#else>${product_mnecode_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1450083209826')}" >${getText('MESBasic.propertydisplayName.randon1450083209826')}</label>
				</td>
				
						<#assign product_productAllas_defaultValue  = ''>
							 							<#assign product_productAllas_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="product.productAllas" id="product_productAllas"  style=";" originalvalue="<#if !newObj || (product.productAllas)?has_content>${(product.productAllas?html)!}<#else>${product_productAllas_defaultValue!}</#if>" value="<#if !newObj || (product.productAllas)?has_content>${(product.productAllas?html)!}<#else>${product_productAllas_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415772620384')}" >${getText('MESBasic.propertydisplayName.radion1415772620384')}</label>
				</td>
				
						<#assign product_productSpecif_defaultValue  = ''>
							 							<#assign product_productSpecif_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="product.productSpecif" id="product_productSpecif"  style=";" originalvalue="<#if !newObj || (product.productSpecif)?has_content>${(product.productSpecif?html)!}<#else>${product_productSpecif_defaultValue!}</#if>" value="<#if !newObj || (product.productSpecif)?has_content>${(product.productSpecif?html)!}<#else>${product_productSpecif_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415772568665')}" >${getText('MESBasic.propertydisplayName.radion1415772568665')}</label>
				</td>
				
						<#assign product_productModel_defaultValue  = ''>
							 							<#assign product_productModel_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="product.productModel" id="product_productModel"  style=";" originalvalue="<#if !newObj || (product.productModel)?has_content>${(product.productModel?html)!}<#else>${product_productModel_defaultValue!}</#if>" value="<#if !newObj || (product.productModel)?has_content>${(product.productModel?html)!}<#else>${product_productModel_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
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
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('X6Basic.viewtitle.radion1398236389691')}" viewType="${viewType!}" deValue="${product_unitGroup_name_defaultValue!}" conditionfunc="MESBasic.product.product.productViewnew._querycustomFunc('product_unitGroup_name')" view=true  value="${(product.unitGroup.name)!}" displayFieldName="name" name="product.unitGroup.name" id="product_unitGroup_name" type="other" url="/X6Basic/unitGroup/unitGroups/ref.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_productViewnew_form" editCustomCallback=";" refViewCode="X6Basic_1.0_unitGroup_ref"  onkeyupfuncname=";_callback_product_unitGroup_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(product.id)?? && (product.unitGroup.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.unitGroup.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_productViewnew_form',obj, 'product.unitGroup', '/X6Basic/unitGroup/unitGroups/ref.action');
												CUI.commonFills('MESBasic_product_product_productViewnew_form', 'product.unitGroup',obj,true);
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
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('X6Basic.viewtitle.radion1398240433147')}" viewType="${viewType!}" deValue="${product_productBaseUnit_name_defaultValue!}" conditionfunc="MESBasic.product.product.productViewnew._querycustomFunc('product_productBaseUnit_name')" view=true  value="${(product.productBaseUnit.name)!}" displayFieldName="name" name="product.productBaseUnit.name" id="product_productBaseUnit_name" type="other" url="/X6Basic/unitGroup/baseUnit/unitRef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_productViewnew_form" editCustomCallback=";" refViewCode="X6Basic_1.0_unitGroup_unitRef"  onkeyupfuncname=";_callback_product_productBaseUnit_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(product.id)?? && (product.productBaseUnit.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.productBaseUnit.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_productViewnew_form',obj, 'product.productBaseUnit', '/X6Basic/unitGroup/baseUnit/unitRef.action');
												CUI.commonFills('MESBasic_product_product_productViewnew_form', 'product.productBaseUnit',obj,true);
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
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('X6Basic.viewtitle.radion1398240433147')}" viewType="${viewType!}" deValue="${product_storeUnit_name_defaultValue!}" conditionfunc="MESBasic.product.product.productViewnew._querycustomFunc('product_storeUnit_name')" view=true  value="${(product.storeUnit.name)!}" displayFieldName="name" name="product.storeUnit.name" id="product_storeUnit_name" type="other" url="/X6Basic/unitGroup/baseUnit/unitRef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_productViewnew_form" editCustomCallback=";" refViewCode="X6Basic_1.0_unitGroup_unitRef"  onkeyupfuncname=";_callback_product_storeUnit_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(product.id)?? && (product.storeUnit.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.storeUnit.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_productViewnew_form',obj, 'product.storeUnit', '/X6Basic/unitGroup/baseUnit/unitRef.action');
												CUI.commonFills('MESBasic_product_product_productViewnew_form', 'product.storeUnit',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr >
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion139823564048303')}" >${getText('MESBasic.propertydisplayName.radion139823564048303')}</label>
				</td>
				
						<#assign product_productBuyUnit_name_defaultValue  = ''>
														<#assign product_productBuyUnit_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('X6Basic.viewtitle.radion1398240433147')}" viewType="${viewType!}" deValue="${product_productBuyUnit_name_defaultValue!}" conditionfunc="MESBasic.product.product.productViewnew._querycustomFunc('product_productBuyUnit_name')" view=true  value="${(product.productBuyUnit.name)!}" displayFieldName="name" name="product.productBuyUnit.name" id="product_productBuyUnit_name" type="other" url="/X6Basic/unitGroup/baseUnit/unitRef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_productViewnew_form" editCustomCallback=";" refViewCode="X6Basic_1.0_unitGroup_unitRef"  onkeyupfuncname=";_callback_product_productBuyUnit_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(product.id)?? && (product.productBuyUnit.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.productBuyUnit.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_productViewnew_form',obj, 'product.productBuyUnit', '/X6Basic/unitGroup/baseUnit/unitRef.action');
												CUI.commonFills('MESBasic_product_product_productViewnew_form', 'product.productBuyUnit',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion139823564048304')}" >${getText('MESBasic.propertydisplayName.radion139823564048304')}</label>
				</td>
				
						<#assign product_saleUnit_name_defaultValue  = ''>
														<#assign product_saleUnit_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('X6Basic.viewtitle.radion1398240433147')}" viewType="${viewType!}" deValue="${product_saleUnit_name_defaultValue!}" conditionfunc="MESBasic.product.product.productViewnew._querycustomFunc('product_saleUnit_name')" view=true  value="${(product.saleUnit.name)!}" displayFieldName="name" name="product.saleUnit.name" id="product_saleUnit_name" type="other" url="/X6Basic/unitGroup/baseUnit/unitRef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_productViewnew_form" editCustomCallback=";" refViewCode="X6Basic_1.0_unitGroup_unitRef"  onkeyupfuncname=";_callback_product_saleUnit_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(product.id)?? && (product.saleUnit.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.saleUnit.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_productViewnew_form',obj, 'product.saleUnit', '/X6Basic/unitGroup/baseUnit/unitRef.action');
												CUI.commonFills('MESBasic_product_product_productViewnew_form', 'product.saleUnit',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion139823564048305')}" >${getText('MESBasic.propertydisplayName.radion139823564048305')}</label>
				</td>
				
						<#assign product_productCostUnit_name_defaultValue  = ''>
														<#assign product_productCostUnit_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('X6Basic.viewtitle.radion1398240433147')}" viewType="${viewType!}" deValue="${product_productCostUnit_name_defaultValue!}" conditionfunc="MESBasic.product.product.productViewnew._querycustomFunc('product_productCostUnit_name')" view=true  value="${(product.productCostUnit.name)!}" displayFieldName="name" name="product.productCostUnit.name" id="product_productCostUnit_name" type="other" url="/X6Basic/unitGroup/baseUnit/unitRef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_productViewnew_form" editCustomCallback=";" refViewCode="X6Basic_1.0_unitGroup_unitRef"  onkeyupfuncname=";_callback_product_productCostUnit_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(product.id)?? && (product.productCostUnit.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.productCostUnit.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_productViewnew_form',obj, 'product.productCostUnit', '/X6Basic/unitGroup/baseUnit/unitRef.action');
												CUI.commonFills('MESBasic_product_product_productViewnew_form', 'product.productCostUnit',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1470121485711')}" >${getText('MESBasic.propertydisplayName.randon1470121485711')}</label>
				</td>
				
						<#assign product_taxRate_defaultValue  = ''>
							 							<#assign product_taxRate_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="product.taxRate" id="product_taxRate"  style=";" originalvalue="<#if newObj&& !(product.taxRate)?has_content>${product_taxRate_defaultValue!}<#elseif (product.taxRate)?has_content>#{(product.taxRate)!; m6M6}</#if>" value="<#if newObj&& !(product.taxRate)?has_content>${product_taxRate_defaultValue!}<#elseif (product.taxRate)?has_content>#{(product.taxRate)!; m6M6}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1416221414520')}" >${getText('MESBasic.propertydisplayName.radion1416221414520')}</label>
				</td>
				
						<#assign product_abcClass_defaultValue  = ''>
							 							<#assign product_abcClass_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${product_abcClass_defaultValue!}" formId="MESBasic_product_product_productViewnew_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="product.abcClass" code="ABC_CLASS" value="${(product.abcClass)!}" seniorSystemCode=true />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_product_product_productViewnew_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="product.abcClass" code="ABC_CLASS" value="${(product.abcClass)!}" seniorSystemCode=true />
									
								</#if>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion141577274073701')}" >${getText('MESBasic.propertydisplayName.radion141577274073701')}</label>
				</td>
				
						<#assign product_replaceItem_productName_defaultValue  = ''>
														<#assign product_replaceItem_productName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}" viewType="${viewType!}" deValue="${product_replaceItem_productName_defaultValue!}" conditionfunc="MESBasic.product.product.productViewnew._querycustomFunc('product_replaceItem_productName')" view=true  value="${(product.replaceItem.productName)!}" displayFieldName="productName" name="product.replaceItem.productName" id="product_replaceItem_productName" type="other" url="/MESBasic/product/product/refProductLayout.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_productViewnew_form" editCustomCallback=";" refViewCode="MESBasic_1_product_refProductLayout" onkeyupfuncname=";_callback_product_replaceItem_productName(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(product.id)?? && (product.replaceItem.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.replaceItem.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_productViewnew_form',obj, 'product.replaceItem', '/MESBasic/product/product/refProductLayout.action');
												CUI.commonFills('MESBasic_product_product_productViewnew_form', 'product.replaceItem',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1476758578712')}" >${getText('MESBasic.propertydisplayName.randon1476758578712')}</label>
				</td>
				
						<#assign product_productBePropCheck_defaultValue  = ''>
							 							<#assign product_productBePropCheck_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="product.productBePropCheck_check" originalvalue="<#if !newObj><#if (product.productBePropCheck)??>${(product.productBePropCheck!false)?string('true','false')}<#else>false</#if><#elseif product_productBePropCheck_defaultValue?has_content>${(product_productBePropCheck_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (product.productBePropCheck)??>${(product.productBePropCheck!false)?string('true','false')}<#else>false</#if><#else>${(product_productBePropCheck_defaultValue!true)?string}</#if>"  disabled=true/>
								
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1471517688085')}" >${getText('MESBasic.propertydisplayName.randon1471517688085')}</label>
				</td>
				
						<#assign product_checkMethodbap_defaultValue  = ''>
							 							<#assign product_checkMethodbap_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${product_checkMethodbap_defaultValue!}" formId="MESBasic_product_product_productViewnew_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="product.checkMethodbap.id" code="product_checkMethod" value="${(product.checkMethodbap.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_product_product_productViewnew_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="product.checkMethodbap.id" code="product_checkMethod" value="${(product.checkMethodbap.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1470121518675')}" >${getText('MESBasic.propertydisplayName.randon1470121518675')}</label>
				</td>
				
						<#assign product_isContainer_defaultValue  = ''>
							 							<#assign product_isContainer_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="product.isContainer_check" originalvalue="<#if !newObj><#if (product.isContainer)??>${(product.isContainer!false)?string('true','false')}<#else>false</#if><#elseif product_isContainer_defaultValue?has_content>${(product_isContainer_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (product.isContainer)??>${(product.isContainer!false)?string('true','false')}<#else>false</#if><#else>${(product_isContainer_defaultValue!true)?string}</#if>"  disabled=true/>
								
								<input property_type="BOOLEAN" type="hidden" name="product.isContainer" originalvalue="<#if ((product.isContainer)?? &&  product.isContainer)||(product_isContainer_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((product.isContainer)?? &&  product.isContainer)||(product_isContainer_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="product.isContainer_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="product.isContainer"]');
												CUI('input[name="product.isContainer_check"]').each(function(){
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
				</tr><tr >
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.staff.dimissionStaff_xls.staffName01')}" >${getText('MESBasic.staff.dimissionStaff_xls.staffName01')}</label>
				</td>
				
						<#assign product_creator_name_defaultValue  = 'currentUser'>
												<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.view.reference')}" viewType="readonly" deValue="${product_creator_name_defaultValue!}" conditionfunc="MESBasic.product.product.productViewnew._querycustomFunc('product_creator_name')" view=true  value="${(product.creator.name)!}" displayFieldName="name" name="product.creator.name" id="product_creator_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_productViewnew_form" editCustomCallback=";" refViewCode="sysbase_1.0_staff_ref" onkeyupfuncname=";_callback_product_creator_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (product_creator_name_defaultValue)=='currentUser'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.id}'};
											obj = foundation.common.getObject('MESBasic_product_product_productViewnew_form',obj, 'product.creator', '/foundation/staff/common/staffListFrameset.action');
											CUI.commonFills('MESBasic_product_product_productViewnew_form', 'product.creator',obj,true);
											$('input:hidden[name="product.creator.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(product.id)?? && (product.creator.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.creator.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_productViewnew_form',obj, 'product.creator', '/foundation/staff/common/staffListFrameset.action');
												CUI.commonFills('MESBasic_product_product_productViewnew_form', 'product.creator',obj,true);
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
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.staff.dimissionStaff_xls.staffName05')}" >${getText('MESBasic.staff.dimissionStaff_xls.staffName05')}</label>
				</td>
				
						<#assign product_modifyPerson_name_defaultValue  = 'currentUser'>
												<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.view.reference')}" viewType="readonly" deValue="${product_modifyPerson_name_defaultValue!}" conditionfunc="MESBasic.product.product.productViewnew._querycustomFunc('product_modifyPerson_name')" view=true  value="${(product.modifyPerson.name)!}" displayFieldName="name" name="product.modifyPerson.name" id="product_modifyPerson_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_productViewnew_form" editCustomCallback=";" refViewCode="sysbase_1.0_staff_ref" onkeyupfuncname=";_callback_product_modifyPerson_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (product_modifyPerson_name_defaultValue)=='currentUser'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.id}'};
											obj = foundation.common.getObject('MESBasic_product_product_productViewnew_form',obj, 'product.modifyPerson', '/foundation/staff/common/staffListFrameset.action');
											CUI.commonFills('MESBasic_product_product_productViewnew_form', 'product.modifyPerson',obj,true);
											$('input:hidden[name="product.modifyPerson.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(product.id)?? && (product.modifyPerson.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.modifyPerson.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_productViewnew_form',obj, 'product.modifyPerson', '/foundation/staff/common/staffListFrameset.action');
												CUI.commonFills('MESBasic_product_product_productViewnew_form', 'product.modifyPerson',obj,true);
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
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.view.reference')}" viewType="readonly" deValue="${product_deleteStaff_name_defaultValue!}" conditionfunc="MESBasic.product.product.productViewnew._querycustomFunc('product_deleteStaff_name')" view=true  value="${(product.deleteStaff.name)!}" displayFieldName="name" name="product.deleteStaff.name" id="product_deleteStaff_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_productViewnew_form" editCustomCallback=";" refViewCode="sysbase_1.0_staff_ref" onkeyupfuncname=";_callback_product_deleteStaff_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (product_deleteStaff_name_defaultValue)=='currentUser'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.id}'};
											obj = foundation.common.getObject('MESBasic_product_product_productViewnew_form',obj, 'product.deleteStaff', '/foundation/staff/common/staffListFrameset.action');
											CUI.commonFills('MESBasic_product_product_productViewnew_form', 'product.deleteStaff',obj,true);
											$('input:hidden[name="product.deleteStaff.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(product.id)?? && (product.deleteStaff.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.deleteStaff.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_productViewnew_form',obj, 'product.deleteStaff', '/foundation/staff/common/staffListFrameset.action');
												CUI.commonFills('MESBasic_product_product_productViewnew_form', 'product.deleteStaff',obj,true);
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
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="product.isNeedWeigh_check" originalvalue="<#if !newObj><#if (product.isNeedWeigh)??>${(product.isNeedWeigh!false)?string('true','false')}<#else>false</#if><#elseif product_isNeedWeigh_defaultValue?has_content>${(product_isNeedWeigh_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (product.isNeedWeigh)??>${(product.isNeedWeigh!false)?string('true','false')}<#else>false</#if><#else>${(product_isNeedWeigh_defaultValue!true)?string}</#if>"  disabled=true/>
								
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
					
							
							<div class="fix-input-readonly">
									<input name="product.desity" id="product_desity"  style=";" originalvalue="<#if newObj&& !(product.desity)?has_content>${product_desity_defaultValue!}<#elseif (product.desity)?has_content>#{(product.desity)!; m6M6}</#if>" value="<#if newObj&& !(product.desity)?has_content>${product_desity_defaultValue!}<#elseif (product.desity)?has_content>#{(product.desity)!; m6M6}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1466392364290')}" >${getText('MESBasic.propertydisplayName.randon1466392364290')}</label>
				</td>
				
						<#assign product_isNeedConvert_defaultValue  = ''>
							 							<#assign product_isNeedConvert_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="product.isNeedConvert_check" originalvalue="<#if !newObj><#if (product.isNeedConvert)??>${(product.isNeedConvert!false)?string('true','false')}<#else>false</#if><#elseif product_isNeedConvert_defaultValue?has_content>${(product_isNeedConvert_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (product.isNeedConvert)??>${(product.isNeedConvert!false)?string('true','false')}<#else>false</#if><#else>${(product_isNeedConvert_defaultValue!true)?string}</#if>" onclick='isNeedConvert_check()' disabled=true/>
								
								<input property_type="BOOLEAN" type="hidden" name="product.isNeedConvert" originalvalue="<#if ((product.isNeedConvert)?? &&  product.isNeedConvert)||(product_isNeedConvert_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((product.isNeedConvert)?? &&  product.isNeedConvert)||(product_isNeedConvert_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="product.isNeedConvert_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="product.isNeedConvert"]');
												CUI('input[name="product.isNeedConvert_check"]').each(function(){
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
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1466391287048')}" >${getText('MESBasic.propertydisplayName.randon1466391287048')}</label>
				</td>
				
						<#assign product_standardPercent_defaultValue  = ''>
							 							<#assign product_standardPercent_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="product.standardPercent" id="product_standardPercent"  style=";" originalvalue="<#if newObj&& !(product.standardPercent)?has_content>${product_standardPercent_defaultValue!}<#elseif (product.standardPercent)?has_content>#{(product.standardPercent)!; m6M6}</#if>" value="<#if newObj&& !(product.standardPercent)?has_content>${product_standardPercent_defaultValue!}<#elseif (product.standardPercent)?has_content>#{(product.standardPercent)!; m6M6}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon146639220961804')}" >${getText('MESBasic.propertydisplayName.randon146639220961804')}</label>
				</td>
				
						<#assign product_checkIndex_name_defaultValue  = ''>
														<#assign product_checkIndex_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('MESBasic.viewtitle.randon1491480425419')}" viewType="${viewType!}" deValue="${product_checkIndex_name_defaultValue!}" conditionfunc="MESBasic.product.product.productViewnew._querycustomFunc('product_checkIndex_name')" view=true  value="${(product.checkIndex.name)!}" displayFieldName="name" name="product.checkIndex.name" id="product_checkIndex_name" type="other" url="/MESBasic/checkIndex/qACheckIndex/checkIndexRef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_productViewnew_form" editCustomCallback=";" refViewCode="MESBasic_1_checkIndex_checkIndexRef"  onkeyupfuncname=";_callback_product_checkIndex_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(product.id)?? && (product.checkIndex.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.checkIndex.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_productViewnew_form',obj, 'product.checkIndex', '/MESBasic/checkIndex/qACheckIndex/checkIndexRef.action');
												CUI.commonFills('MESBasic_product_product_productViewnew_form', 'product.checkIndex',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1416221870395')}" >${getText('MESBasic.propertydisplayName.radion1416221870395')}</label>
				</td>
				
						<#assign product_batch_defaultValue  = ''>
							 							<#assign product_batch_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${product_batch_defaultValue!}" formId="MESBasic_product_product_productViewnew_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="product.batch.id" code="batch" value="${(product.batch.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_product_product_productViewnew_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="product.batch.id" code="batch" value="${(product.batch.id)!}"  />
									
								</#if>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1504251291588')}" >${getText('MESBasic.propertydisplayName.randon1504251291588')}</label>
				</td>
				
						<#assign product_pieceNum_defaultValue  = ''>
							 							<#assign product_pieceNum_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="product.pieceNum" id="product_pieceNum"  style=";" originalvalue="<#if newObj&& !(product.pieceNum)?has_content>${product_pieceNum_defaultValue!}<#elseif (product.pieceNum)?has_content>#{(product.pieceNum)!; m2M2}</#if>" value="<#if newObj&& !(product.pieceNum)?has_content>${product_pieceNum_defaultValue!}<#elseif (product.pieceNum)?has_content>#{(product.pieceNum)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1504251320587')}" >${getText('MESBasic.propertydisplayName.randon1504251320587')}</label>
				</td>
				
						<#assign product_isPack_defaultValue  = ''>
							 							<#assign product_isPack_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="product.isPack_check" originalvalue="<#if !newObj><#if (product.isPack)??>${(product.isPack!false)?string('true','false')}<#else>false</#if><#elseif product_isPack_defaultValue?has_content>${(product_isPack_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (product.isPack)??>${(product.isPack!false)?string('true','false')}<#else>false</#if><#else>${(product_isPack_defaultValue!true)?string}</#if>"  disabled=true/>
								
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
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				</tr><tr >
				<td nullable=false class="edit-table-symbol"  align="right" style="text-align: right;;" >
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1471571483270')}" >${getText('MESBasic.propertydisplayName.randon1471571483270')}</label>
				</td>
				
						<#assign product_productidProdAttrId_defaultValue  = ''>
				<td nullable=false class="edit-table-content"  colspan="5" style="text-align: left;;" >
								<@mneclient iframe=mneIframe!false mneenable=false reftitle="${getText('MESBasic.viewtitle.randon1471570747293')}" conditionfunc="MESBasic.product.product.productViewnew._querycustomFunc('product_productidProdAttrId')" view=true  name="product.productidProdAttrId" id="product_productidProdAttrId" type="other" url="/MESBasic/prodAttribute/prodAttribute/prodAttrLayout.action" displayFieldName="name"  ids="${(product.productidProdAttrIdmultiselectIDs)!}" names="${(product.productidProdAttrIdmultiselectNames)!}"  onkeyupfuncname="getproduct_productidProdAttrIdMultiInfo()" clicked=true multiple=true cssStyle="padding-left: 0px; width: 100%;" mnewidth=260 isCrossCompany=false isEdit=true />
								<#if refId?has_content>
								<script type="text/javascript">
									$(function(){
										$("#product_productidProdAttrIdAddIds").val("${(product.productidProdAttrIdmultiselectIDs)!},");
									});
								</script>
								</#if>
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1477460221745')}" >${getText('MESBasic.propertydisplayName.randon1477460221745')}</label>
				</td>
				
						<#assign product_productComment_defaultValue  = ''>
							 							<#assign product_productComment_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="product.productComment" id="product_productComment"  style=";" originalvalue="<#if !newObj || (product.productComment)?has_content>${(product.productComment?html)!}<#else>${product_productComment_defaultValue!}</#if>" value="<#if !newObj || (product.productComment)?has_content>${(product.productComment?html)!}<#else>${product_productComment_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
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
					
							
							<div class="fix-input-readonly fix-ie7-textarea"><textarea property_type="TEXT" id="product_dcontent" originalvalue="<#if !newObj || (product.dcontent)?has_content>${(product.dcontent?html)!}<#else>${product_dcontent_defaultValue?html}</#if>"  name="product.dcontent" class="cui-noborder-textarea cui-textarea-auto" readonly="readonly" style=";" ><#if !newObj || (product.dcontent)?has_content>${(product.dcontent)!}<#else>${product_dcontent_defaultValue}</#if></textarea></div>
							
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
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('MESBasic.viewtitle.randon1450081171634')}" viewType="${viewType!}" deValue="${product_productListID_prodListName_defaultValue!}" conditionfunc="MESBasic.product.product.productViewnew._querycustomFunc('product_productListID_prodListName')" view=true  value="${(product.productListID.prodListName)!}" displayFieldName="prodListName" name="product.productListID.prodListName" id="product_productListID_prodListName" type="other" url="/MESBasic/prodList/baseProdList/refProdList.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_productViewnew_form" editCustomCallback=";" refViewCode="MESBasic_1_prodList_refProdList"  onkeyupfuncname=";_callback_product_productListID_prodListName(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(product.id)?? && (product.productListID.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.productListID.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_productViewnew_form',obj, 'product.productListID', '/MESBasic/prodList/baseProdList/refProdList.action');
												CUI.commonFills('MESBasic_product_product_productViewnew_form', 'product.productListID',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1470294678031')}" >${getText('MESBasic.propertydisplayName.randon1470294678031')}</label>
				</td>
				
						<#assign product_protoType_defaultValue  = ''>
							 							<#assign product_protoType_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="product.protoType" id="product_protoType"  style=";" originalvalue="<#if !newObj || (product.protoType)?has_content>${(product.protoType?html)!}<#else>${product_protoType_defaultValue!}</#if>" value="<#if !newObj || (product.protoType)?has_content>${(product.protoType?html)!}<#else>${product_protoType_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
		</tr>
	</table>
</div>				</div>
				<div class="edit-datatable">	

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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1450083900246')}" >${getText('MESBasic.propertydisplayName.randon1450083900246')}</label>
				</td>
				
						<#assign product_productCostPrice_defaultValue  = ''>
							 							<#assign product_productCostPrice_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="product.productCostPrice" id="product_productCostPrice"  style=";" originalvalue="<#if newObj&& !(product.productCostPrice)?has_content>${product_productCostPrice_defaultValue!}<#elseif (product.productCostPrice)?has_content>#{(product.productCostPrice)!; m4M4}</#if>" value="<#if newObj&& !(product.productCostPrice)?has_content>${product_productCostPrice_defaultValue!}<#elseif (product.productCostPrice)?has_content>#{(product.productCostPrice)!; m4M4}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1464167201782')}" >${getText('MESBasic.propertydisplayName.randon1464167201782')}</label>
				</td>
				
						<#assign product_salePrice_defaultValue  = ''>
							 							<#assign product_salePrice_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="product.salePrice" id="product_salePrice"  style=";" originalvalue="<#if newObj&& !(product.salePrice)?has_content>${product_salePrice_defaultValue!}<#elseif (product.salePrice)?has_content>#{(product.salePrice)!; m4M4}</#if>" value="<#if newObj&& !(product.salePrice)?has_content>${product_salePrice_defaultValue!}<#elseif (product.salePrice)?has_content>#{(product.salePrice)!; m4M4}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1464167129093')}" >${getText('MESBasic.propertydisplayName.randon1464167129093')}</label>
				</td>
				
						<#assign product_recCost_defaultValue  = ''>
							 							<#assign product_recCost_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="product.recCost" id="product_recCost"  style=";" originalvalue="<#if newObj&& !(product.recCost)?has_content>${product_recCost_defaultValue!}<#elseif (product.recCost)?has_content>#{(product.recCost)!; m4M4}</#if>" value="<#if newObj&& !(product.recCost)?has_content>${product_recCost_defaultValue!}<#elseif (product.recCost)?has_content>#{(product.recCost)!; m4M4}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1470187842110')}" >${getText('MESBasic.propertydisplayName.randon1470187842110')}</label>
				</td>
				
						<#assign product_precentPrice_defaultValue  = ''>
							 							<#assign product_precentPrice_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="product.precentPrice" id="product_precentPrice"  style=";" originalvalue="<#if newObj&& !(product.precentPrice)?has_content>${product_precentPrice_defaultValue!}<#elseif (product.precentPrice)?has_content>#{(product.precentPrice)!; m4M4}</#if>" value="<#if newObj&& !(product.precentPrice)?has_content>${product_precentPrice_defaultValue!}<#elseif (product.precentPrice)?has_content>#{(product.precentPrice)!; m4M4}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1471519637082')}" >${getText('MESBasic.propertydisplayName.randon1471519637082')}</label>
				</td>
				
						<#assign product_bapValueType_defaultValue  = ''>
							 							<#assign product_bapValueType_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${product_bapValueType_defaultValue!}" formId="MESBasic_product_product_productViewnew_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="product.bapValueType.id" code="valueType" value="${(product.bapValueType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_product_product_productViewnew_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="product.bapValueType.id" code="valueType" value="${(product.bapValueType.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1470188245634')}" >${getText('MESBasic.propertydisplayName.randon1470188245634')}</label>
				</td>
				
						<#assign product_refCostPrice_defaultValue  = ''>
							 							<#assign product_refCostPrice_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="product.refCostPrice" id="product_refCostPrice"  style=";" originalvalue="<#if newObj&& !(product.refCostPrice)?has_content>${product_refCostPrice_defaultValue!}<#elseif (product.refCostPrice)?has_content>#{(product.refCostPrice)!; m4M4}</#if>" value="<#if newObj&& !(product.refCostPrice)?has_content>${product_refCostPrice_defaultValue!}<#elseif (product.refCostPrice)?has_content>#{(product.refCostPrice)!; m4M4}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1470188562931')}" >${getText('MESBasic.propertydisplayName.randon1470188562931')}</label>
				</td>
				
						<#assign product_planPrice_defaultValue  = ''>
							 							<#assign product_planPrice_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="product.planPrice" id="product_planPrice"  style=";" originalvalue="<#if newObj&& !(product.planPrice)?has_content>${product_planPrice_defaultValue!}<#elseif (product.planPrice)?has_content>#{(product.planPrice)!; m4M4}</#if>" value="<#if newObj&& !(product.planPrice)?has_content>${product_planPrice_defaultValue!}<#elseif (product.planPrice)?has_content>#{(product.planPrice)!; m4M4}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				
				<td nullable=true class="edit-table-symbol"  align="right" style="text-align: right;;" >
							<label style="width:100%;color:blue;
 text-decoration: underline;;" value="${getText('MESBasic.propertyshowName.radion1471674102736')}" onclick='showCostHistory()'>${getText('MESBasic.propertyshowName.radion1471674102736')}</label>
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
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
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1484031239866232')}" >${getText('MESBasic.propertydisplayName.randon1484031239866232')}</label>
				</td>
				
						<#assign product_ware_wareCode_defaultValue  = ''>
														<#assign product_ware_wareCode_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}" viewType="${viewType!}" deValue="${product_ware_wareCode_defaultValue!}" conditionfunc="MESBasic.product.product.productViewnew._querycustomFunc('product_ware_wareCode')" view=true  value="${(product.ware.wareCode)!}" displayFieldName="wareCode" name="product.ware.wareCode" id="product_ware_wareCode" type="other" url="/MESBasic/wareMan/ware/wareRef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_productViewnew_form" editCustomCallback=";" refViewCode="MESBasic_1_wareMan_wareRef" onkeyupfuncname=";_callback_product_ware_wareCode(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(product.id)?? && (product.ware.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.ware.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_productViewnew_form',obj, 'product.ware', '/MESBasic/wareMan/ware/wareRef.action');
												CUI.commonFills('MESBasic_product_product_productViewnew_form', 'product.ware',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon148403131628123')}" >${getText('MESBasic.propertydisplayName.randon148403131628123')}</label>
				</td>
				
						<#assign product_ware_wareName_defaultValue  = ''>
														<#assign product_ware_wareName_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="product.ware.wareName" id="product_ware_wareName"  style=";" originalvalue="<#if !newObj || (product.ware.wareName)?has_content>${(product.ware.wareName?html)!}<#else>${product_ware_wareName_defaultValue!}</#if>" value="<#if !newObj || (product.ware.wareName)?has_content>${(product.ware.wareName?html)!}<#else>${product_ware_wareName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon148973165144923')}" >${getText('MESBasic.propertydisplayName.randon148973165144923')}</label>
				</td>
				
						<#assign product_storeSet_placeSetCode_defaultValue  = ''>
														<#assign product_storeSet_placeSetCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('MESBasic.viewtitle.randon1489735291062')}" viewType="${viewType!}" deValue="${product_storeSet_placeSetCode_defaultValue!}" conditionfunc="MESBasic.product.product.productViewnew._querycustomFunc('product_storeSet_placeSetCode')" view=true  value="${(product.storeSet.placeSetCode)!}" displayFieldName="placeSetCode" name="product.storeSet.placeSetCode" id="product_storeSet_placeSetCode" type="other" url="/MESBasic/storeSet/storeSet/storeRef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_productViewnew_form" editCustomCallback=";" refViewCode="MESBasic_1_storeSet_storeRef"  onkeyupfuncname=";_callback_product_storeSet_placeSetCode(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(product.id)?? && (product.storeSet.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.storeSet.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_productViewnew_form',obj, 'product.storeSet', '/MESBasic/storeSet/storeSet/storeRef.action');
												CUI.commonFills('MESBasic_product_product_productViewnew_form', 'product.storeSet',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr >
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1489731677162')}" >${getText('MESBasic.propertydisplayName.randon1489731677162')}</label>
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
					
							
							<div class="fix-input-readonly">
									<input name="product.safeNum" id="product_safeNum"  style=";" originalvalue="<#if newObj&& !(product.safeNum)?has_content>${product_safeNum_defaultValue!}<#elseif (product.safeNum)?has_content>#{(product.safeNum)!; m3M3}</#if>" value="<#if newObj&& !(product.safeNum)?has_content>${product_safeNum_defaultValue!}<#elseif (product.safeNum)?has_content>#{(product.safeNum)!; m3M3}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1475912134641')}" >${getText('MESBasic.propertydisplayName.randon1475912134641')}</label>
				</td>
				
						<#assign product_topNum_defaultValue  = ''>
							 							<#assign product_topNum_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="product.topNum" id="product_topNum"  style=";" originalvalue="<#if newObj&& !(product.topNum)?has_content>${product_topNum_defaultValue!}<#elseif (product.topNum)?has_content>#{(product.topNum)!; m3M3}</#if>" value="<#if newObj&& !(product.topNum)?has_content>${product_topNum_defaultValue!}<#elseif (product.topNum)?has_content>#{(product.topNum)!; m3M3}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
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
					
							
							<div class="fix-input-readonly">
									<input name="product.lowNum" id="product_lowNum"  style=";" originalvalue="<#if newObj&& !(product.lowNum)?has_content>${product_lowNum_defaultValue!}<#elseif (product.lowNum)?has_content>#{(product.lowNum)!; m3M3}</#if>" value="<#if newObj&& !(product.lowNum)?has_content>${product_lowNum_defaultValue!}<#elseif (product.lowNum)?has_content>#{(product.lowNum)!; m3M3}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1450083854272')}" >${getText('MESBasic.propertydisplayName.randon1450083854272')}</label>
				</td>
				
						<#assign product_productCheckFreq_defaultValue  = ''>
							 							<#assign product_productCheckFreq_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="INTEGER" name="product.productCheckFreq" id="product_productCheckFreq"  style=";" originalvalue="<#if !newObj || (product.productCheckFreq)?has_content>${(product.productCheckFreq?html)!}<#else>${product_productCheckFreq_defaultValue!}</#if>" value="<#if !newObj || (product.productCheckFreq)?has_content>${(product.productCheckFreq?html)!}<#else>${product_productCheckFreq_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
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
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  style="text-align: left;;" >
					
							
							<#if newObj && !(product.lastDate)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="product.lastDate" value="${product_lastDate_defaultValue!}" type="dateTime"  id="product.lastDate"  view=true cssStyle=""  />
								
							<#else>
							<#if (product.lastDate)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="product.lastDate" value="${product.lastDate?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="product.lastDate"  view=true cssStyle=""  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="product.lastDate" value="" type="dateTime" id="product.lastDate" cssStyle=""  view=true/>
								
							</#if>
							</#if>
							
				</td>
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1477034245724')}" >${getText('MESBasic.propertydisplayName.randon1477034245724')}</label>
				</td>
				
						<#assign product_reqType_defaultValue  = ''>
							 							<#assign product_reqType_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${product_reqType_defaultValue!}" formId="MESBasic_product_product_productViewnew_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="product.reqType.id" code="productReqType" value="${(product.reqType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_product_product_productViewnew_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="product.reqType.id" code="productReqType" value="${(product.reqType.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1470190232252')}" >${getText('MESBasic.propertydisplayName.randon1470190232252')}</label>
				</td>
				
						<#assign product_receiveDate_defaultValue  = ''>
							 							<#assign product_receiveDate_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="INTEGER" name="product.receiveDate" id="product_receiveDate"  style=";" originalvalue="<#if !newObj || (product.receiveDate)?has_content>${(product.receiveDate?html)!}<#else>${product_receiveDate_defaultValue!}</#if>" value="<#if !newObj || (product.receiveDate)?has_content>${(product.receiveDate?html)!}<#else>${product_receiveDate_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1470291954144')}" >${getText('MESBasic.propertydisplayName.randon1470291954144')}</label>
				</td>
				
						<#assign product_purchGroupId_purchGroupName_defaultValue  = ''>
														<#assign product_purchGroupId_purchGroupName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('MESBasic.viewtitle.randon1470361445002')}" viewType="${viewType!}" deValue="${product_purchGroupId_purchGroupName_defaultValue!}" conditionfunc="MESBasic.product.product.productViewnew._querycustomFunc('product_purchGroupId_purchGroupName')" view=true  value="${(product.purchGroupId.purchGroupName)!}" displayFieldName="purchGroupName" name="product.purchGroupId.purchGroupName" id="product_purchGroupId_purchGroupName" type="other" url="/MESBasic/purch_Group/purchGroup/purchGroupRef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_product_product_productViewnew_form" editCustomCallback=";" refViewCode="MESBasic_1_purch_Group_purchGroupRef"  onkeyupfuncname=";_callback_product_purchGroupId_purchGroupName(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(product.id)?? && (product.purchGroupId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.purchGroupId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_product_product_productViewnew_form',obj, 'product.purchGroupId', '/MESBasic/purch_Group/purchGroup/purchGroupRef.action');
												CUI.commonFills('MESBasic_product_product_productViewnew_form', 'product.purchGroupId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1475911290161')}" >${getText('MESBasic.propertydisplayName.randon1475911290161')}</label>
				</td>
				
						<#assign product_purPoint_defaultValue  = ''>
							 							<#assign product_purPoint_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="product.purPoint" id="product_purPoint"  style=";" originalvalue="<#if newObj&& !(product.purPoint)?has_content>${product_purPoint_defaultValue!}<#elseif (product.purPoint)?has_content>#{(product.purPoint)!; m3M3}</#if>" value="<#if newObj&& !(product.purPoint)?has_content>${product_purPoint_defaultValue!}<#elseif (product.purPoint)?has_content>#{(product.purPoint)!; m3M3}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1475911668431')}" >${getText('MESBasic.propertydisplayName.randon1475911668431')}</label>
				</td>
				
						<#assign product_mrpNum_defaultValue  = ''>
							 							<#assign product_mrpNum_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="product.mrpNum" id="product_mrpNum"  style=";" originalvalue="<#if newObj&& !(product.mrpNum)?has_content>${product_mrpNum_defaultValue!}<#elseif (product.mrpNum)?has_content>#{(product.mrpNum)!; m3M3}</#if>" value="<#if newObj&& !(product.mrpNum)?has_content>${product_mrpNum_defaultValue!}<#elseif (product.mrpNum)?has_content>#{(product.mrpNum)!; m3M3}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				
				<td nullable=true class="edit-table-symbol"  align="right" style="text-align: right;;" >
							<label style="width:100%;color:blue;
 text-decoration: underline;;" value="${getText('MESBasic.propertyshowName.radion1471674969018')}" onclick='showDealInfo()'>${getText('MESBasic.propertyshowName.radion1471674969018')}</label>
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1475911721508')}" >${getText('MESBasic.propertydisplayName.randon1475911721508')}</label>
				</td>
				
						<#assign product_pointNum_defaultValue  = ''>
							 							<#assign product_pointNum_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="product.pointNum" id="product_pointNum"  style=";" originalvalue="<#if newObj&& !(product.pointNum)?has_content>${product_pointNum_defaultValue!}<#elseif (product.pointNum)?has_content>#{(product.pointNum)!; m3M3}</#if>" value="<#if newObj&& !(product.pointNum)?has_content>${product_pointNum_defaultValue!}<#elseif (product.pointNum)?has_content>#{(product.pointNum)!; m3M3}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1475911612886')}" >${getText('MESBasic.propertydisplayName.randon1475911612886')}</label>
				</td>
				
						<#assign product_minOrderQuantity_defaultValue  = ''>
							 							<#assign product_minOrderQuantity_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="product.minOrderQuantity" id="product_minOrderQuantity"  style=";" originalvalue="<#if newObj&& !(product.minOrderQuantity)?has_content>${product_minOrderQuantity_defaultValue!}<#elseif (product.minOrderQuantity)?has_content>#{(product.minOrderQuantity)!; m3M3}</#if>" value="<#if newObj&& !(product.minOrderQuantity)?has_content>${product_minOrderQuantity_defaultValue!}<#elseif (product.minOrderQuantity)?has_content>#{(product.minOrderQuantity)!; m3M3}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
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
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="product.isKeepDate_check" originalvalue="<#if !newObj><#if (product.isKeepDate)??>${(product.isKeepDate!false)?string('true','false')}<#else>false</#if><#elseif product_isKeepDate_defaultValue?has_content>${(product_isKeepDate_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (product.isKeepDate)??>${(product.isKeepDate!false)?string('true','false')}<#else>false</#if><#else>${(product_isKeepDate_defaultValue!true)?string}</#if>" onclick='isKeepDate_check()' disabled=true/>
								
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1450083835129')}" >${getText('MESBasic.propertydisplayName.randon1450083835129')}</label>
				</td>
				
						<#assign product_productCheckDays_defaultValue  = ''>
							 							<#assign product_productCheckDays_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="INTEGER" name="product.productCheckDays" id="product_productCheckDays"  style=";" originalvalue="<#if !newObj || (product.productCheckDays)?has_content>${(product.productCheckDays?html)!}<#else>${product_productCheckDays_defaultValue!}</#if>" value="<#if !newObj || (product.productCheckDays)?has_content>${(product.productCheckDays?html)!}<#else>${product_productCheckDays_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1471520300572')}" >${getText('MESBasic.propertydisplayName.randon1471520300572')}</label>
				</td>
				
						<#assign product_keepUnit_defaultValue  = ''>
							 							<#assign product_keepUnit_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${product_keepUnit_defaultValue!}" formId="MESBasic_product_product_productViewnew_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="product.keepUnit.id" code="product_keepUnit" value="${(product.keepUnit.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_product_product_productViewnew_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="product.keepUnit.id" code="product_keepUnit" value="${(product.keepUnit.id)!}"  />
									
								</#if>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1470192036318')}" >${getText('MESBasic.propertydisplayName.randon1470192036318')}</label>
				</td>
				
						<#assign product_keepDay_defaultValue  = ''>
							 							<#assign product_keepDay_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="INTEGER" name="product.keepDay" id="product_keepDay"  style=";" originalvalue="<#if !newObj || (product.keepDay)?has_content>${(product.keepDay?html)!}<#else>${product_keepDay_defaultValue!}</#if>" value="<#if !newObj || (product.keepDay)?has_content>${(product.keepDay?html)!}<#else>${product_keepDay_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1471520204490')}" >${getText('MESBasic.propertydisplayName.randon1471520204490')}</label>
				</td>
				
						<#assign product_keepReckon_defaultValue  = ''>
							 							<#assign product_keepReckon_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${product_keepReckon_defaultValue!}" formId="MESBasic_product_product_productViewnew_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="product.keepReckon.id" code="product_keepReckon" value="${(product.keepReckon.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_product_product_productViewnew_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="product.keepReckon.id" code="product_keepReckon" value="${(product.keepReckon.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1470192119584')}" >${getText('MESBasic.propertydisplayName.randon1470192119584')}</label>
				</td>
				
						<#assign product_notifyDays_defaultValue  = ''>
							 							<#assign product_notifyDays_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="INTEGER" name="product.notifyDays" id="product_notifyDays"  style=";" originalvalue="<#if !newObj || (product.notifyDays)?has_content>${(product.notifyDays?html)!}<#else>${product_notifyDays_defaultValue!}</#if>" value="<#if !newObj || (product.notifyDays)?has_content>${(product.notifyDays?html)!}<#else>${product_notifyDays_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
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
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${product_approachUnit_defaultValue!}" formId="MESBasic_product_product_productViewnew_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="product.approachUnit.id" code="product_keepUnit" value="${(product.approachUnit.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_product_product_productViewnew_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="product.approachUnit.id" code="product_keepUnit" value="${(product.approachUnit.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1495540732500')}" >${getText('MESBasic.propertydisplayName.randon1495540732500')}</label>
				</td>
				
						<#assign product_approachTime_defaultValue  = ''>
							 							<#assign product_approachTime_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="INTEGER" name="product.approachTime" id="product_approachTime"  style=";" originalvalue="<#if !newObj || (product.approachTime)?has_content>${(product.approachTime?html)!}<#else>${product_approachTime_defaultValue!}</#if>" value="<#if !newObj || (product.approachTime)?has_content>${(product.approachTime?html)!}<#else>${product_approachTime_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1471520111052')}" >${getText('MESBasic.propertydisplayName.randon1471520111052')}</label>
				</td>
				
						<#assign product_resetMark_defaultValue  = ''>
							 							<#assign product_resetMark_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${product_resetMark_defaultValue!}" formId="MESBasic_product_product_productViewnew_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="product.resetMark.id" code="product_resetMark" value="${(product.resetMark.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_product_product_productViewnew_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="product.resetMark.id" code="product_resetMark" value="${(product.resetMark.id)!}"  />
									
								</#if>
							
				</td>
				</tr><tr >
				<td nullable=true class="edit-table-symbol"  align="right" style="text-align: right;;" >
							<label style="width:100%;;" value="${getText('MESBasic.propertyshowName.radion1471522332920')}" >${getText('MESBasic.propertyshowName.radion1471522332920')}</label>
				</td>
				
				<td nullable=false class="edit-table-symbol"  align="left" style="text-align: left;;" >
							<label style="width:100%;padding-left:5px;color:blue;
 text-decoration: underline;;" value="${getText('MESBasic.propertyshowName.radion1471748542124')}" onclick='showResetDaily()'>${getText('MESBasic.propertyshowName.radion1471748542124')}</label>
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1470191788998')}" >${getText('MESBasic.propertydisplayName.randon1470191788998')}</label>
				</td>
				
						<#assign product_isItemLevel_defaultValue  = ''>
							 							<#assign product_isItemLevel_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="product.isItemLevel_check" originalvalue="<#if !newObj><#if (product.isItemLevel)??>${(product.isItemLevel!false)?string('true','false')}<#else>false</#if><#elseif product_isItemLevel_defaultValue?has_content>${(product_isItemLevel_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (product.isItemLevel)??>${(product.isItemLevel!false)?string('true','false')}<#else>false</#if><#else>${(product_isItemLevel_defaultValue!true)?string}</#if>" onclick='isItemLevel_check()' disabled=true/>
								
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
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1470191840683')}" >${getText('MESBasic.propertydisplayName.randon1470191840683')}</label>
				</td>
				
						<#assign product_isCtrlPass_defaultValue  = ''>
							 							<#assign product_isCtrlPass_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="product.isCtrlPass_check" originalvalue="<#if !newObj><#if (product.isCtrlPass)??>${(product.isCtrlPass!false)?string('true','false')}<#else>false</#if><#elseif product_isCtrlPass_defaultValue?has_content>${(product_isCtrlPass_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (product.isCtrlPass)??>${(product.isCtrlPass!false)?string('true','false')}<#else>false</#if><#else>${(product_isCtrlPass_defaultValue!true)?string}</#if>"  disabled=true/>
								
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
				<#assign dUrl="/MESBasic/product/product/data-dg1476012237332.action?product.id=${refId!-1}&refId=${refId!-1}&datagridCode=MESBasic_1_product_productViewnewdg1476012237332">
			<#else>
				<#assign dUrl="/MESBasic/product/product/data-dg1476012237332.action?product.id=${(product.id)!-1}&datagridCode=MESBasic_1_product_productViewnewdg1476012237332">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_ProdLevel_dg1476012237332_deldatagrid();}}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_ProdLevel_dg1476012237332_deldatagrid();}}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_ProdLevel_dg1476012237332" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1476012237332_id" value="ProdLevel_dg1476012237332" />
			
			<input type="hidden" id="dg1476012237332_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('MESBasic.modelname.randon1470193147949')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/MESBasic/product/product/data-dg1476012237332.action?operateType=export&datagridCode=MESBasic_1_product_productViewnewdg1476012237332"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="ProdLevel_dg1476012237332" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="ProdLevel_dg1476012237332" viewType="${viewType}" renderOverEvent="dg1476012237332RenderOverEvent" route="${routeFlag}" formId="MESBasic_product_product_productViewnew_form" noPermissionKeys="clevel,corder,rejectLvl,levelMemo,itemChange,compareID.productCode,compareID.productName" modelCode="MESBasic_1_product_ProdLevel" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1476012237332" dtPage="dgPage"  hidekeyPrefix="dg1476012237332" hidekey="['id','version','compareID.id','compareID.productCode','compareID.id','compareID.productName'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=false  buttons="${buttons}" noPadding=true isEdit=true tabViewIndex=4 pageInitMethod="dg1476012237332PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=false cannotDeleteRow=true assModelDisplayName=assModelDisplayName  activexButton="" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign clevel_displayDefaultType=''>
								<#assign clevel_defaultValue=''>
										<#assign clevel_defaultValue=''>
										 
									<@datacolumn key="clevel"        showFormat="TEXT" defaultValue="${(clevel_defaultValue!)?string}" defaultDisplay="${(clevel_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1470193262662')}" width=100 showFormatFunc=""  />
							<#assign corder_displayDefaultType=''>
								<#assign corder_defaultValue=''>
										<#assign corder_defaultValue=''>
										 
									<@datacolumn key="corder"        showFormat="TEXT" defaultValue="${(corder_defaultValue!)?string}" defaultDisplay="${(corder_displayDefaultType!)?string}" decimal="" editable=false type="INTEGER" showType="integer" notnull=false     textalign="right"  viewUrl="" viewCode=""  crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1470193428773')}" width=100 showFormatFunc=""  />
							<#assign rejectLvl_displayDefaultType=''>
								<#assign rejectLvl_defaultValue=''>
										<#assign rejectLvl_defaultValue=''>
										 
									<@datacolumn key="rejectLvl"        showFormat="CHECKBOX" defaultValue="${(rejectLvl_defaultValue!)?string}" defaultDisplay="${(rejectLvl_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode=""  crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1470193484810')}" width=100 showFormatFunc=""  />
							<#assign levelMemo_displayDefaultType=''>
								<#assign levelMemo_defaultValue=''>
										<#assign levelMemo_defaultValue=''>
										 
									<@datacolumn key="levelMemo"        showFormat="TEXT" defaultValue="${(levelMemo_defaultValue!)?string}" defaultDisplay="${(levelMemo_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="center"  viewUrl="" viewCode=""  crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1470193317753')}" width=100 showFormatFunc=""  />
							<#assign itemChange_displayDefaultType=''>
								<#assign itemChange_defaultValue=''>
										<#assign itemChange_defaultValue=''>
										 
									<@datacolumn key="itemChange"        showFormat="CHECKBOX" defaultValue="${(itemChange_defaultValue!)?string}" defaultDisplay="${(itemChange_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode=""  crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1470193540651')}" width=100 showFormatFunc=""  />
							<#assign compareID_productCode_displayDefaultType=''>
								<#assign compareID_productCode_defaultValue=''>
										<#assign compareID_productCode_defaultValue=''>
																	<#if (compareID_productCode_defaultValue!)?string=="currentUser">
								<#assign compareID_productCode_defaultValue='${staffJson!}'>
							<#elseif (compareID_productCode_defaultValue!)?string=="currentPost">
								<#assign compareID_productCode_defaultValue='${postJson!}'>
							<#elseif (compareID_productCode_defaultValue!)?string=="currentDepart">
								<#assign compareID_productCode_defaultValue='${deptJson!}'>
							<#elseif (compareID_productCode_defaultValue!)?string=="currentComp">
								<#assign compareID_productCode_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="compareID.productCode"        showFormat="SELECTCOMP" defaultValue="${(compareID_productCode_defaultValue!)?string}" defaultDisplay="${(compareID_productCode_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="MESBasic.product.product.productViewnew"  textalign="center"  viewUrl="/MESBasic/product/product/ref.action" viewCode="MESBasic_1_product_ref"  crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1428027703233')}"  label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" width=100 showFormatFunc=""  />
							<#assign compareID_productName_displayDefaultType=''>
								<#assign compareID_productName_defaultValue=''>
										<#assign compareID_productName_defaultValue=''>
																	<#if (compareID_productName_defaultValue!)?string=="currentUser">
								<#assign compareID_productName_defaultValue='${staffJson!}'>
							<#elseif (compareID_productName_defaultValue!)?string=="currentPost">
								<#assign compareID_productName_defaultValue='${postJson!}'>
							<#elseif (compareID_productName_defaultValue!)?string=="currentDepart">
								<#assign compareID_productName_defaultValue='${deptJson!}'>
							<#elseif (compareID_productName_defaultValue!)?string=="currentComp">
								<#assign compareID_productName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="compareID.productName"        showFormat="TEXT" defaultValue="${(compareID_productName_defaultValue!)?string}" defaultDisplay="${(compareID_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="MESBasic.product.product.productViewnew"  textalign="center"  viewUrl="/MESBasic/product/product/ref.action" viewCode="MESBasic_1_product_ref"  crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1428027703233')}"  label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" width=100 showFormatFunc=""  />
			
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
				function ProdLevel_dg1476012237332_check_datagridvalid(){
					//
					var errorObj =ProdLevel_dg1476012237332Widget._DT.testData();
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
				
				function savedg1476012237332DataGrid(){
					<#if  refId?? && (refId gt 0)>
					ProdLevel_dg1476012237332Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('ProdLevel_dg1476012237332Widget') > -1) {
						ProdLevel_dg1476012237332Widget.setAllRowEdited();
					}
					var json = ProdLevel_dg1476012237332Widget.parseEditedData();
					$('input[name="dg1476012237332ListJson"]').remove();
					$('input[name="dgLists[\'dg1476012237332\']"]').remove();
					$('input[name="dg1476012237332ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1476012237332\']">').val(json).appendTo($('#MESBasic_product_product_productViewnew_form'));
					$('<input type="hidden" name="dg1476012237332ModelCode">').val('MESBasic_1_product_ProdLevel').appendTo($('#MESBasic_product_product_productViewnew_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1476012237332ListJson">').val(json).appendTo($('#MESBasic_product_product_productViewnew_form'));
				}
				function DT_ProdLevel_dg1476012237332_deldatagrid(){
					var deleteRows = ProdLevel_dg1476012237332Widget.deleteRows();
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
						if($("#dg1476012237332DeletedIds").length>0){
							$("#dg1476012237332DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1476012237332DeletedIds" name="dgDeletedIds[\'dg1476012237332\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_product_product_productViewnew_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1476012237332DeletedIds['+CUI('input[name^="dg1476012237332DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_product_product_productViewnew_form'));
					});
					return deleteRows;
				}
				function DT_ProdLevel_dg1476012237332_delTreeNodes(){
					var deleteRows = ProdLevel_dg1476012237332Widget._DT.removeTreeNode();
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
						if($("#dg1476012237332DeletedIds").length>0){
							$("#dg1476012237332DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1476012237332DeletedIds" name="dgDeletedIds[\'dg1476012237332\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_product_product_productViewnew_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1476012237332DeletedIds['+CUI('input[name^="dg1476012237332DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_product_product_productViewnew_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('MESBasic_product_product_productViewnew_datagrids');
					if(!datagrids) {
						datagrids = [];
					}
					for(var i=0;i<6;i++) {
						if(!datagrids[i]) {
							datagrids[i] = [];
						}
					}
					if(datagrids[4].length>0) {
						for(var i=0;i<datagrids[4].length;i++) {
							if(datagrids[4][i] == 'ProdLevel_dg1476012237332') {
								break;
							}
							if(i==datagrids[4].length-1) {
								datagrids[4][datagrids[4].length] = 'ProdLevel_dg1476012237332';
							}
						}
					} else {
						datagrids[4][datagrids[4].length] = 'ProdLevel_dg1476012237332';
					}
					$('body').data('MESBasic_product_product_productViewnew_datagrids', datagrids);
				});
				
				var ProdLevel_dg1476012237332_importDialog = null;
				function ProdLevel_dg1476012237332_showImportDialog(){
					try{
						if(ProdLevel_dg1476012237332_importDialog!=null&&ProdLevel_dg1476012237332_importDialog.isShow==1){
							return false;
						}
						var url = "/MESBasic/product/product/initImport.action?datagridCode=MESBasic_1_product_productViewnewdg1476012237332&tid=${id!}&datagridName=dg1476012237332";
							<#if canImportExcel>
								var buttonCode="MESBasic_1_product_productViewnewdg1476012237332_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						ProdLevel_dg1476012237332_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("ProdLevel_dg1476012237332"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();ProdLevel_dg1476012237332_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();ProdLevel_dg1476012237332_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						ProdLevel_dg1476012237332_importDialog.show();
					}catch(e){}
				}	
				
				function ProdLevel_dg1476012237332_downLoadFile(){
					var url = "/MESBasic/product/product/downLoad.action?datagridCode=MESBasic_1_product_productViewnewdg1476012237332&templateRelatedModelCode=MESBasic_1_product_productViewnewdg1476012237332&downloadType=template&fileName=dg1476012237332";
					window.open(url,"","");
				}
				function dg1476012237332RenderOverEvent(){
				}
				function dg1476012237332PageInitMethod(nTabIndex){
					MESBasic.product.product.productViewnew.initSize(nTabIndex);
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
		<#assign cpvmInfo = ''>
			<#assign customPropList = getShowCustomProps("MESBasic_1_product_Product", "MESBasic_1_product_productViewnew", 'EDIT')>
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
					<#assign elementName = 'product' + "." + columnName>
					<#assign elementId = 'product' + "_" + columnName>
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
						<#if product[columnName]??>
							<#assign dateVal = (product[columnName])?string('yyyy-MM-dd HH:mm:ss')>
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
							<@systemcode property_type="${columnType}" iscustom=true showType="${fieldType}" viewType=viewType cssStyle="text-align:${c.align!}" formId="MESBasic_product_product_productViewnew_form" classStyle="cui-noborder-input" view=true cssStyle="" ecFlag=true multable=isMultable name="${elementName}" code="${(c.property.fillcontentMap.fillContent)!}" value="${product[columnName]!}" seniorSystemCode=isS2 />
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
							<input type="hidden" iscustom="true" name="${elementName}" value="${product[columnName]!}" />
							<input type="hidden" name="${elementName}.${pkName!'id'}" value="${product[columnName]!}" />
							<@mneclient iframe=false property_type="${columnType}" mneenable=false reftitle="${getText('${viewTitle!}')}" viewType=viewType cssStyle="text-align:${c.align!}" view=true value="${product[displayColumnName]!}" name="${elementName}.${mainDisplayName!'name'}" id="${elementName?replace('.', '_')}_${mainDisplayName!'name'}" type="${mneType}" url="${viewUrl!}" clicked=true multiple=false isEdit=true mnewidth=260 formId="MESBasic_product_product_productViewnew_form" editCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}()" delCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}_delete()" />
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
</div>				</div>
				<div class="edit-datatable">	

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
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
     	
		<div id="MESBasic_product_product_productViewnew_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="MESBasic.product.product.productViewnew.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<div id="fileUploadDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-VIEW-MESBasic_1_product_productViewnew,html,MESBasic_1_product_Product,MESBasic_1) -->
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
						$("#MESBasic_product_product_productViewnew_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#MESBasic_product_product_productViewnew_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#MESBasic_product_product_productViewnew_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#MESBasic_product_product_productViewnew_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			MESBasic.product.product.productViewnew.initCount = 0;
			MESBasic.product.product.productViewnew.initSize = function(nTabIndex){
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
				var conHeight = h-$("#MESBasic_product_product_productViewnew_main_div .edit-head").height()-$("#MESBasic_product_product_productViewnew_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#MESBasic_product_product_productViewnew_main_div .edit-workflow").height()</#if>;
				$("#MESBasic_product_product_productViewnew_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('MESBasic_product_product_productViewnew_datagrids');
				var padding_bottom=16;
				$("#MESBasic_product_product_productViewnew_main_div .pd_bottom,#MESBasic_product_product_productViewnew_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#MESBasic_product_product_productViewnew_main_div .edit-panes-s").each(function(index){
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
									if(MESBasic.product.product.productViewnew.initCount <= 2) {
										setTimeout(function(){MESBasic.product.product.productViewnew.initSize();}, 200);
										MESBasic.product.product.productViewnew.initCount++;
									}/* else {
										MESBasic.product.product.productViewnew.initCount = 0;
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
							if(($("#MESBasic_product_product_productViewnew_main_div .edit-workflow").length > 0) && ($("#MESBasic_product_product_productViewnew_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				$('#MESBasic_product_product_productViewnew_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				MESBasic.product.product.productViewnew.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				MESBasic.product.product.productViewnew.initSize();
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
						if(parseInt($("#MESBasic_product_product_productViewnew_main_div").css("width"),10)==650){
							$("#MESBasic_product_product_productViewnew_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//MESBasic.product.product.productViewnew.resizeLayout();
						//MESBasic.product.product.productViewnew.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#MESBasic_product_product_productViewnew_main_div").css("width"),10)==800){
							$("#MESBasic_product_product_productViewnew_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//MESBasic.product.product.productViewnew.resizeLayout();
						//MESBasic.product.product.productViewnew.initSize();
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
					MESBasic.product.product.productViewnew.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					MESBasic.product.product.productViewnew.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){MESBasic.product.product.productViewnew.initSize();});
				/*
				MESBasic.product.product.productViewnew.resizeLayout=function(){
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

		MESBasic.product.product.productViewnew.validate = function(){
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
		MESBasic.product.product.productViewnew.beforeSaveProcess = function(){
			$('input[name="product.extraCol"]').remove();
		}
		MESBasic.product.product.productViewnew.processDataGrid = function(){
										<#if false && isIE>
										$('#MESBasic_product_product_productViewnew_form').append(ProdLevel_dg1476012237332Widget._DT.createInputs('dg1476012237332List'));
										</#if>
		};
		MESBasic.product.product.productViewnew.save = function(){
			$('#operateType').val("submit");
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!MESBasic.product.product.productViewnew.validate()){return;}
			//延迟到延迟提交中处理,解决onchange事件无法触发问题
			//MESBasic.product.product.productViewnew.beforeSaveProcess();

			//MESBasic.product.product.productViewnew.processDataGrid();
			$('#MESBasic_product_product_productViewnew_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('MESBasic_product_product_productViewnew_form','MESBasic_product_product_productViewnew_datagrids')) {      
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
		MESBasic.product.product.productViewnew.print = function(){
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
		
		MESBasic.product.product.productViewnew.saveSetting = function(){
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
		
		MESBasic.product.product.productViewnew.printSetting = function(){
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
				MESBasic.product.product.productViewnew.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(MESBasic.product.product.productViewnew.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				MESBasic.product.product.productViewnew.settingDialog.show();
			}
		}
		
		
		MESBasic.product.product.productViewnew.refcopy = function(){
			var callbackName ="MESBasic.product.product.productViewnew.referenceCopyBackInfo";
			MESBasic.product.product.productViewnew._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				callBackFuncName : callbackName,
				url : '/MESBasic/product/product/productRefNew.action',
				title : "${getText('ec.common.refcopyTitle')}",
				params : null
			});
		}
		MESBasic.product.product.productViewnew.referenceCopyBackInfo = function(obj){
			if(MESBasic.product.product.productViewnew._dialog) {
				MESBasic.product.product.productViewnew._dialog.close();
			}
			var url = "/MESBasic/product/product/productViewnew.action?entityCode=${entityCode}&pendingId=${pendingId?default('')}&&deploymentId=${deploymentId?default('')}&tableInfoId=${(product.tableInfoId)?default('')}&__pc__=${(Parameters.__pc__)!}&id="+document.getElementById("id").value+'&refId='+obj[0].id + "";
			
			window.location=url;
		};
		MESBasic.product.product.productViewnew._callBackInfo = function(res){
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
				MESBasic.product.product.productViewnew._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				MESBasic.product.product.productViewnew._isObjCustomProp_IE = isObjCustomProp;
			} else {
				MESBasic.product.product.productViewnew._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				MESBasic.product.product.productViewnew._objCustomPropNames_IE = objCustomPropNames;
			} else {
				MESBasic.product.product.productViewnew._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				MESBasic.product.product.productViewnew._refViewCode_IE = viewCode;
			} else {
				MESBasic.product.product.productViewnew._refViewCode_IE = '';
			}
			MESBasic.product.product.productViewnew._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		MESBasic.product.product.productViewnew.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			MESBasic.product.product.productViewnew._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			MESBasic.product.product.productViewnew._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			MESBasic.product.product.productViewnew.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			MESBasic.product.product.productViewnew._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				MESBasic.product.product.productViewnew._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		MESBasic.product.product.productViewnew._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(MESBasic.product.product.productViewnew._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(MESBasic.product.product.productViewnew._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				MESBasic.product.product.productViewnew.gridEventObj = gridEventObj;
				callbackName = "MESBasic.product.product.productViewnew.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "MESBasic.product.product.productViewnew.getMultiselectCallBackInfo_DG" : "MESBasic.product.product.productViewnew.getcallBackInfo_DG";
				MESBasic.product.product.productViewnew._currRow = $(obj).closest('tr')[0];
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="MESBasic.product.product.productViewnew.getcallBackInfo";
			}

			if(_prefix!=''){
				MESBasic.product.product.productViewnew._prefix = _prefix.substring(1);
			}
			
			MESBasic.product.product.productViewnew._oGrid = oGrid;
			MESBasic.product.product.productViewnew._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					MESBasic.product.product.productViewnew._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					MESBasic.product.product.productViewnew._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					MESBasic.product.product.productViewnew._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					MESBasic.product.product.productViewnew._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					MESBasic.product.product.productViewnew._refViewCode = oColumn.viewCode;
				} else {
					MESBasic.product.product.productViewnew._refViewCode = '';
				}
			} else {
				MESBasic.product.product.productViewnew._isObjCustomProp = false;
				MESBasic.product.product.productViewnew._objCustomPropNames = '';
				MESBasic.product.product.productViewnew._refViewCode = '';
			}
			if (MESBasic.product.product.productViewnew._isObjCustomProp == true && MESBasic.product.product.productViewnew._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				MESBasic.product.product.productViewnew._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				MESBasic.product.product.productViewnew._customCallBack = customCallBack;
			}
			if(MESBasic.product.product.productViewnew._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(MESBasic.product.product.productViewnew._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof MESBasic.product.product.productViewnew._querycustomFuncN == "function") {
				refparam += MESBasic.product.product.productViewnew._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			MESBasic.product.product.productViewnew._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		MESBasic.product.product.productViewnew._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(MESBasic.product.product.productViewnew._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(MESBasic.product.product.productViewnew._querycustomFunc(objName.replace(/\./g, '_')));
			}
			MESBasic.product.product.productViewnew._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'MESBasic.product.product.productViewnew.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		MESBasic.product.product.productViewnew._querycustomFunc = function(obj) {
			var str = eval("typeof(MESBasic.product.product.productViewnew.query_"+obj+")!='undefined'") ? eval('MESBasic.product.product.productViewnew.query_'+obj+'()') : null;
			return str;
		};
		MESBasic.product.product.productViewnew.getcallBackGroupInfo = function(obj){
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
			MESBasic.product.product.productViewnew._dialog.close();
		}
		MESBasic.product.product.productViewnew.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('MESBasic_product_product_productViewnew_form',obj[0], MESBasic.product.product.productViewnew._prefix, MESBasic.product.product.productViewnew._sUrl);
			CUI.commonFills('MESBasic_product_product_productViewnew_form',MESBasic.product.product.productViewnew._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (MESBasic.product.product.productViewnew._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(MESBasic.product.product.productViewnew._customCallBack) {
					eval(MESBasic.product.product.productViewnew._customCallBack);
					MESBasic.product.product.productViewnew._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.product.product.productViewnew._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		MESBasic.product.product.productViewnew.getcallBackInfo_DG_IE = function(obj){
			if(MESBasic.product.product.productViewnew._customBeforeCallBack) {
				var flag = eval(MESBasic.product.product.productViewnew._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = MESBasic.product.product.productViewnew.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( MESBasic.product.product.productViewnew._isObjCustomProp_IE == true && MESBasic.product.product.productViewnew._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,MESBasic.product.product.productViewnew._sUrl,MESBasic.product.product.productViewnew._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,MESBasic.product.product.productViewnew._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (MESBasic.product.product.productViewnew._isObjCustomProp_IE == true && MESBasic.product.product.productViewnew._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = MESBasic.product.product.productViewnew._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = MESBasic.product.product.productViewnew._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && MESBasic.product.product.productViewnew._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + MESBasic.product.product.productViewnew._refViewCode_IE + '&id=' + id,
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
				if(MESBasic.product.product.productViewnew._customCallBack) {
					eval(MESBasic.product.product.productViewnew._customCallBack);
					MESBasic.product.product.productViewnew._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.product.product.productViewnew._dialog.close();
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
		
		MESBasic.product.product.productViewnew.getcallBackInfo_DG = function(obj){
			if(MESBasic.product.product.productViewnew._customBeforeCallBack) {
				var flag = eval(MESBasic.product.product.productViewnew._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(MESBasic.product.product.productViewnew._currRow).next().length==0){
						MESBasic.product.product.productViewnew._oGrid.addNewRow();
					}	
					MESBasic.product.product.productViewnew._currRow = $(MESBasic.product.product.productViewnew._currRow).next();
					$(MESBasic.product.product.productViewnew._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(MESBasic.product.product.productViewnew._currRow,obj[i], MESBasic.product.product.productViewnew._prefix, MESBasic.product.product.productViewnew._sUrl);
				if (MESBasic.product.product.productViewnew._isObjCustomProp == true && MESBasic.product.product.productViewnew._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(MESBasic.product.product.productViewnew._currRow,MESBasic.product.product.productViewnew._prefix,obj[i],MESBasic.product.product.productViewnew._oGrid,MESBasic.product.product.productViewnew._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(MESBasic.product.product.productViewnew._currRow,MESBasic.product.product.productViewnew._prefix,obj[i],MESBasic.product.product.productViewnew._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + MESBasic.product.product.productViewnew._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + MESBasic.product.product.productViewnew._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && MESBasic.product.product.productViewnew._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + MESBasic.product.product.productViewnew._refViewCode + '&id=' + id,
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
									name = MESBasic.product.product.productViewnew._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(MESBasic.product.product.productViewnew._currRow, objs, MESBasic.product.product.productViewnew._oGrid);
							}
						}
					}
				}
			}
			try{
				if(MESBasic.product.product.productViewnew._customCallBack) {
					eval(MESBasic.product.product.productViewnew._customCallBack);
					MESBasic.product.product.productViewnew._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.product.product.productViewnew._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + MESBasic.product.product.productViewnew._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		MESBasic.product.product.productViewnew.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(MESBasic.product.product.productViewnew._oGrid, MESBasic.product.product.productViewnew._currRow, MESBasic.product.product.productViewnew._key, MESBasic.product.product.productViewnew._displayFieldName, obj[i])
			}
			try{
				if(MESBasic.product.product.productViewnew._customCallBack) {
					eval(MESBasic.product.product.productViewnew._customCallBack);
					MESBasic.product.product.productViewnew._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.product.product.productViewnew._dialog.close();
			} catch(e){}
		};
		
		MESBasic.product.product.productViewnew.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						MESBasic.product.product.productViewnew.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#MESBasic_product_product_productViewnew_form'));
						}
					}
				}
			});
		};

		$(function(){
			MESBasic.product.product.productViewnew.onloadForProduct();
			if($(".pd_bottom .edit-panes-s").eq(5).html()=='\n'){
		$('.edit-tabs li:eq(5)').hide()
	}
		});

		MESBasic.product.product.productViewnew.beforeSubmitMethodSettingInPage = function(){
			MESBasic.product.product.productViewnew.onsaveForProduct();
		};
		MESBasic.product.product.productViewnew.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  MESBasic.product.product.productViewnew.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		MESBasic.product.product.productViewnew.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#MESBasic_product_product_productViewnew_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#MESBasic_product_product_productViewnew_main_div").hide();
				},100);
				//CUI("#MESBasic_product_product_productViewnew_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		MESBasic.product.product.productViewnew.showThis = function(){
			if(!CUI("#MESBasic_product_product_productViewnew_main_div").is(':visible')) {
				CUI("#MESBasic_product_product_productViewnew_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		MESBasic.product.product.productViewnew.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			MESBasic.product.product.productViewnew.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "MESBasic_product_product_productViewnew_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=MESBasic&modelName=MESBasic_1_product_Product&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			MESBasic.product.product.productViewnew.auditDialog.show();
			</#if>
		}
		
		
		MESBasic.product.product.productViewnew.showInfoDialog=function(mode){
			
			MESBasic.product.product.productViewnew.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "MESBasic_product_product_productViewnew_dealInfo",
				modal:true,
				height:500,
				width: 950,//适应国际化版
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			MESBasic.product.product.productViewnew.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		MESBasic.product.product.productViewnew.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			<#if pendingId??>
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=MESBasic_1_product");
			<#else>
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?readOnlyFlag=true&linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=MESBasic_1_product");
			</#if>
			}
		}
		
		MESBasic.product.product.productViewnew.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/MESBasic/product/product/dealInfo-list.action&dlTableInfoId=${(product.tableInfoId)?default('')}");
			}
		}
		MESBasic.product.product.productViewnew.showFlowInfo=function(){
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
		MESBasic.product.product.productViewnew.supervision=function(){
			MESBasic.product.product.productViewnew.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(product.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				MESBasic.product.product.productViewnew.modifyOwnerStaffDialog.show();
		}
		
function ChartoPY(){
	var NoChange_Name=$('#product_productName').val();
	if(NoChange_Name!=''){
		
		//NoChange_Name = ConvertFirstPinyin(NoChange_Name).toUpperCase;
		NoChange_Name = ConvertFirstPinyin(NoChange_Name);
		NoChange_Name = NoChange_Name.toUpperCase();
	}
	$('#product_mnecode').val(NoChange_Name);
}
function isNeedConvert_check(){
	var isNeedConvert_check = $("input[name='product.isNeedConvert_check']").is(":checked");
	if(isNeedConvert_check==true){
		$("#product_standardPercent").removeAttr('readonly');
		$("#product_checkIndex_checkIndexName_click_button").removeAttr('disabled');
		}
	else{
		$("#product_standardPercent").attr('readonly',true);
		$("#product_checkIndex_checkIndexName_click_button").attr('disabled',true);
		CUI("input[name='product.checkIndex.id']").val('');
		$("input[name='product.standardPercent']").val('');
		$('#product_checkIndex_checkIndexName').val('')
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
function showCostHistory(){
	var productCode = $('#product_productCode').val();
	var dialog  = new CUI.Dialog({  
        title: "物品历史价格",  
        iframe: 'showCostHistory_iframe',
        modal:true,  
        type:5,  
        dragable:true,  
        url: "/MESBasic/product/productCost/productCostList.action?${getPowerCode('MESBasic_1_product_productLayout_productPart_modify_modify_MESBasic_1_product_productPart')}&openType=page&listCustomCondition=assignID.productCode="+productCode,// 内容, 可以是url  
        //hideCloseBtn: true;  // 隐藏右上角关闭按钮, 默认不隐藏   
    });  
    dialog .show();
}
function showDealInfo(){
	var productCode = $('#product_productCode').val();
	var dialog  = new CUI.Dialog({  
        title: "查看采购组更改记录",  
        iframe: 'showDealInfo_iframe',
        modal:true,  
        type:5,  
        dragable:true,  
        url: "/MESBasic/product/commDealInfo/dealInfoList.action?${getPowerCode('MESBasic_1_product_productLayout_productPart_modify_modify_MESBasic_1_product_productPart')}&openType=page&listCustomCondition=assignID.productCode="+productCode, // 内容, 可以是url  
        //hideCloseBtn: true;  // 隐藏右上角关闭按钮, 默认不隐藏   
    });  
    dialog .show();
}
function isKeepDate_check(){
	var isKeepDate_check = $("input[name='product.isKeepDate_check']").is(":checked");
	if(isKeepDate_check == true){
		$("label:contains(查看复验周期)").attr("onclick","showResetDaily()").css('color','red');//查看复验周期链接
		$('#productkeepReckonid').unDisabledSelect();//有效期推算
		$('#product_notifyDays').attr('readonly',false);//提前提醒
		$('#productresetMarkid').unDisabledSelect();//复验期推算
	}else{
		$("label:contains(查看复验周期)").attr("onclick","").css('color','gray');
		$('#productkeepReckonid').disabledSelect();
		$('#product_notifyDays').attr('readonly',true);
		$('#productresetMarkid').disabledSelect();
	}
	var id = $('#id').val();
	if(id==''){
		$("label:contains(查看复验周期)").attr("onclick","").css('color','gray');
	}
	}
function showResetDaily(){
	var productCode = $('#product_productCode').val();
	MESBasic.product.product.newdialog=new CUI.Dialog({  
        title: "复验周期", 
        modal:true,  
        type:5,  
        dragable:true,	
        url: "/MESBasic/product/product/resetDailyEdit.action?${getPowerCode('MESBasic_1_product_productLayout_productPart_modify_modify_MESBasic_1_product_productPart')}&openType=page&id=${id!}",
        buttons:[{	name:"保存",
					handler:function(){
						
							$('#MESBasic_product_product_resetDailyEdit_form').submit();
						}
				},
						{	name:"取消",
							handler:function(){this.close()}
						}]
    });
    MESBasic.product.product.newdialog.show();
}
function isItemLevel_check(){
	var isItemLevel_check = $("input[name='product.isItemLevel_check']").is(":checked");
	var rowLength = ProdLevel_dg1471522536506Widget.getRowLength();
	if(isItemLevel_check==true){
		$(".paginatorbar-operatebar").css("visibility","visible");
	}else{
		$(".paginatorbar-operatebar").css("visibility","hidden");
	}
	if(isItemLevel_check==false && rowLength>0){
		$("input[name='product.isItemLevel_check']").attr('checked',true);
		$(".paginatorbar-operatebar").css("visibility","visible");
		workbenchErrorBarWidget.showMessage("${getText('MESBasic.product.cancleProdLevel1')}",'f');
    	return false;
	}
}



		/* CUSTOM CODE START(view-VIEW-MESBasic_1_product_productViewnew,js,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
		MESBasic.product.product.productViewnew.onloadForProduct = function(){
		/* CUSTOM CODE START(view-VIEW-MESBasic_1_product_productViewnew,onloadForProduct,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
		}

		MESBasic.product.product.productViewnew.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-VIEW-MESBasic_1_product_productViewnew,onsaveForProduct,MESBasic_1_product_Product,MESBasic_1) */
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
				<div class="sidebar-top"><a href="#"  onclick="MESBasic.product.product.productViewnew.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="MESBasic.product.product.productViewnew.showBusinessList('${l.relatingModel.code.replace('.','')}',${(product.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
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