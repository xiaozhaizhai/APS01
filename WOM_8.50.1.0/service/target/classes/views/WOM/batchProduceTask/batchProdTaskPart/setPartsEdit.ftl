<!-- WOM_7.5.0.0/batchProduceTask/setPartsEdit -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1507699502198')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_batchProduceTask_setPartsEdit,head,WOM_7.5.0.0_batchProduceTask_BatchProdTaskPart,WOM_7.5.0.0) -->
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
	CUI.ns('WOM.batchProduceTask.batchProdTaskPart.setPartsEdit');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign fileuploadType = "Table">
	<#assign fileuploadLinkId = tableInfoId!>
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
<#assign callbackName ="WOM.batchProduceTask.batchProdTaskPart.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_form" cssStyle="height:100%;" hiddenField="batchProdTaskPart.factoryId.id,batchProdTaskPart.formularId.id,batchProdTaskPart.bulkProduct.id,batchProdTaskPart.bulkBatchNum.id,batchProdTaskPart.productId.id," onsubmitMethod="WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.beforeSubmitMethod()" ecAction="/WOM/batchProduceTask/batchProdTaskPart/setPartsEdit/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="setPartsEdit">
	<input type="hidden" name="viewCode" value="WOM_7.5.0.0_batchProduceTask_setPartsEdit">
	<input type="hidden" name="datagridKey" value="WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="batchProdTaskPart.version" value="${(batchProdTaskPart.version)!0}" />
	<input type="hidden" name="batchProdTaskPart.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
		<input type="hidden" name="batchProdTaskPart.factoryId.id" value="${(batchProdTaskPart.factoryId.id)!""}"/>
		<input type="hidden" name="batchProdTaskPart.formularId.id" value="${(batchProdTaskPart.formularId.id)!""}"/>
		<input type="hidden" name="batchProdTaskPart.bulkProduct.id" value="${(batchProdTaskPart.bulkProduct.id)!""}"/>
		<input type="hidden" name="batchProdTaskPart.bulkBatchNum.id" value="${(batchProdTaskPart.bulkBatchNum.id)!""}"/>
		<input type="hidden" name="batchProdTaskPart.productId.id" value="${(batchProdTaskPart.productId.id)!""}"/>
	<div id="WOM_setPartsEdit_edit_div" style="height:100%">
		<div id="WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_form"+"_attcount";
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
</script>			<div class="edit-panes" style="margin-top:0px;padding:0px;">
				<div>
				<div class="edit-panes-w">

<div class="edit-panes-s" style="width:98%;margin-left:10px;">
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td></tr>
		<tr class="dialog_tr">
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion1415772644833')}" >${getText('WOM.propertydisplayName.radion1415772644833')}</label>
				</td>
				
						<#assign batchProdTaskPart_productId_productCode_defaultValue  = ''>
														<#assign batchProdTaskPart_productId_productCode_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}" viewType="${viewType!}" deValue="${batchProdTaskPart_productId_productCode_defaultValue!}" conditionfunc="WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._querycustomFunc('batchProdTaskPart_productId_productCode')"  value="${(batchProdTaskPart.productId.productCode)!}" displayFieldName="productCode" name="batchProdTaskPart.productId.productCode" id="batchProdTaskPart_productId_productCode" type="other" url="/MESBasic/product/product/refProductLayout.action" clicked=true multiple=false mnewidth=260 formId="WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_form" editCustomCallback="getDefaultFormular(obj);" refViewCode="MESBasic_1_product_refProductLayout"  onkeyupfuncname="getDefaultFormular(obj);_callback_batchProdTaskPart_productId_productCode(obj);" cssStyle="" isEdit=true beforecallback='clearFormular(obj)'  isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(batchProdTaskPart.id)?? && (batchProdTaskPart.productId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${batchProdTaskPart.productId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_form',obj, 'batchProdTaskPart.productId', '/MESBasic/product/product/refProductLayout.action');
												CUI.commonFills('WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_form', 'batchProdTaskPart.productId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion1415772740737')}" >${getText('WOM.propertydisplayName.radion1415772740737')}</label>
				</td>
				
						<#assign batchProdTaskPart_productId_productName_defaultValue  = ''>
														<#assign batchProdTaskPart_productId_productName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="batchProdTaskPart.productId.productName" id="batchProdTaskPart_productId_productName"  style=";" originalvalue="<#if !newObj || (batchProdTaskPart.productId.productName)?has_content>${(batchProdTaskPart.productId.productName?html)!}<#else>${batchProdTaskPart_productId_productName_defaultValue!}</#if>" value="<#if !newObj || (batchProdTaskPart.productId.productName)?has_content>${(batchProdTaskPart.productId.productName?html)!}<#else>${batchProdTaskPart_productId_productName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1495090296499')}" >${getText('WOM.propertydisplayName.randon1495090296499')}</label>
				</td>
				
						<#assign batchProdTaskPart_productNum_defaultValue  = ''>
							 							<#assign batchProdTaskPart_productNum_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="batchProdTaskPart.productNum" id="batchProdTaskPart_productNum"  style=";" originalvalue="<#if newObj&& !(batchProdTaskPart.productNum)?has_content>${batchProdTaskPart_productNum_defaultValue!}<#elseif (batchProdTaskPart.productNum)?has_content>#{(batchProdTaskPart.productNum)!; m2M2}</#if>" value="<#if newObj&& !(batchProdTaskPart.productNum)?has_content>${batchProdTaskPart_productNum_defaultValue!}<#elseif (batchProdTaskPart.productNum)?has_content>#{(batchProdTaskPart.productNum)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#batchProdTaskPart_productNum').unbind('blur').bind('blur',function(){
										var percision = 2;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("WOM.propertydisplayName.randon1495090296499")}')}");
											return;
										}
										if(parseInt(percision) > -1 && $(this).val()!=undefined && $(this).val()!='' && isDecimal($(this).val())){
											$(this).val(($(this).val() * 1).toFixed(percision));
										}
									});
								});
							</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randonpl5')}" >${getText('WOM.propertydisplayName.randonpl5')}</label>
				</td>
				
						<#assign batchProdTaskPart_factoryId_name_defaultValue  = ''>
														<#assign batchProdTaskPart_factoryId_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('MESBasic.viewtitle.randon1498043312692')}" viewType="${viewType!}" deValue="${batchProdTaskPart_factoryId_name_defaultValue!}" conditionfunc="WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._querycustomFunc('batchProdTaskPart_factoryId_name')"  value="${(batchProdTaskPart.factoryId.name)!}" displayFieldName="name" name="batchProdTaskPart.factoryId.name" id="batchProdTaskPart_factoryId_name" type="other" url="/MESBasic/factoryModel/factoryModel/factoryProBatchRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_form" editCustomCallback=";" refViewCode="MESBasic_1_factoryModel_factoryProBatchRef"  onkeyupfuncname=";_callback_batchProdTaskPart_factoryId_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(batchProdTaskPart.id)?? && (batchProdTaskPart.factoryId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${batchProdTaskPart.factoryId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_form',obj, 'batchProdTaskPart.factoryId', '/MESBasic/factoryModel/factoryModel/factoryProBatchRef.action');
												CUI.commonFills('WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_form', 'batchProdTaskPart.factoryId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
									WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.query_batchProdTaskPart_factoryId_name = function() {
										return "formulaId="+$("input[name='batchProdTaskPart.formularId.id']").val();
									}
								</script>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randonpl3')}" >${getText('WOM.propertydisplayName.randonpl3')}</label>
				</td>
				
						<#assign batchProdTaskPart_formularId_code_defaultValue  = ''>
														<#assign batchProdTaskPart_formularId_code_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="BAPCODE" mneenable=false reftitle="${getText('RM.viewtitle.randon1498047455529')}" viewType="${viewType!}" deValue="${batchProdTaskPart_formularId_code_defaultValue!}" conditionfunc="WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._querycustomFunc('batchProdTaskPart_formularId_code')"  value="${(batchProdTaskPart.formularId.code)!}" displayFieldName="code" name="batchProdTaskPart.formularId.code" id="batchProdTaskPart_formularId_code" type="other" url="/RM/formula/formula/formulaTaskRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_form" editCustomCallback="produceTaskCallback(obj);" refViewCode="RM_7.5.0.0_formula_formulaTaskRef"  onkeyupfuncname="produceTaskCallback(obj);_callback_batchProdTaskPart_formularId_code(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(batchProdTaskPart.id)?? && (batchProdTaskPart.formularId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${batchProdTaskPart.formularId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_form',obj, 'batchProdTaskPart.formularId', '/RM/formula/formula/formulaTaskRef.action');
												CUI.commonFills('WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_form', 'batchProdTaskPart.formularId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
									WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.query_batchProdTaskPart_formularId_code = function() {
										var factoryId = $('input[name="batchProdTaskPart.factoryId.id"]').val();
      	var product = $('input[name="batchProdTaskPart.productId.id"]').val();
      	var produceType = $("[name='batchProduceTask.taskType.id']").val();
        return "factoryModelId="+factoryId+"&product="+product+"&produceType="+produceType;
									}
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randonpl4')}" >${getText('WOM.propertydisplayName.randonpl4')}</label>
				</td>
				
						<#assign batchProdTaskPart_formularId_name_defaultValue  = ''>
														<#assign batchProdTaskPart_formularId_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="batchProdTaskPart.formularId.name" id="batchProdTaskPart_formularId_name"  style=";" originalvalue="<#if !newObj || (batchProdTaskPart.formularId.name)?has_content>${(batchProdTaskPart.formularId.name?html)!}<#else>${batchProdTaskPart_formularId_name_defaultValue!}</#if>" value="<#if !newObj || (batchProdTaskPart.formularId.name)?has_content>${(batchProdTaskPart.formularId.name?html)!}<#else>${batchProdTaskPart_formularId_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1495090680963')}" >${getText('WOM.propertydisplayName.randon1495090680963')}</label>
				</td>
				
						<#assign batchProdTaskPart_planStartTime_defaultValue  = 'currentTime'>
							 					<#if (batchProdTaskPart_planStartTime_defaultValue)?? &&(batchProdTaskPart_planStartTime_defaultValue)?has_content>
							<#assign batchProdTaskPart_planStartTime_defaultValue  = getDefaultDateTime(batchProdTaskPart_planStartTime_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  align="left" style="text-align: left;;" >
					
							
							<#if newObj && !(batchProdTaskPart.planStartTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="batchProdTaskPart.planStartTime" value="${batchProdTaskPart_planStartTime_defaultValue!}" type="dateTime"  id="batchProdTaskPart.planStartTime"  cssStyle=""   align="left"/>
								
							<#else>
							<#if (batchProdTaskPart.planStartTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="batchProdTaskPart.planStartTime" value="${batchProdTaskPart.planStartTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="batchProdTaskPart.planStartTime"  cssStyle="" align="left"  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="batchProdTaskPart.planStartTime" value="" type="dateTime" id="batchProdTaskPart.planStartTime" cssStyle=""  align="left"/>
								
							</#if>
							</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1495090700531')}" >${getText('WOM.propertydisplayName.randon1495090700531')}</label>
				</td>
				
						<#assign batchProdTaskPart_planEndTime_defaultValue  = ''>
							 							<#assign batchProdTaskPart_planEndTime_defaultValue  = ''>
					<#if (batchProdTaskPart_planEndTime_defaultValue)?? &&(batchProdTaskPart_planEndTime_defaultValue)?has_content>
							<#assign batchProdTaskPart_planEndTime_defaultValue  = getDefaultDateTime(batchProdTaskPart_planEndTime_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  style="text-align: left;;" >
					
							
							<#if newObj && !(batchProdTaskPart.planEndTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="batchProdTaskPart.planEndTime" value="${batchProdTaskPart_planEndTime_defaultValue!}" type="dateTime"  id="batchProdTaskPart.planEndTime"  cssStyle=""  />
								
							<#else>
							<#if (batchProdTaskPart.planEndTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="batchProdTaskPart.planEndTime" value="${batchProdTaskPart.planEndTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="batchProdTaskPart.planEndTime"  cssStyle=""  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="batchProdTaskPart.planEndTime" value="" type="dateTime" id="batchProdTaskPart.planEndTime" cssStyle="" />
								
							</#if>
							</#if>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion4434356222')}" >${getText('WOM.propertydisplayName.radion4434356222')}</label>
				</td>
				
						<#assign batchProdTaskPart_bulkProduct_productCode_defaultValue  = ''>
														<#assign batchProdTaskPart_bulkProduct_productCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}" viewType="${viewType!}" deValue="${batchProdTaskPart_bulkProduct_productCode_defaultValue!}" conditionfunc="WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._querycustomFunc('batchProdTaskPart_bulkProduct_productCode')"  value="${(batchProdTaskPart.bulkProduct.productCode)!}" displayFieldName="productCode" name="batchProdTaskPart.bulkProduct.productCode" id="batchProdTaskPart_bulkProduct_productCode" type="other" url="/MESBasic/product/product/refProductLayout.action" clicked=true multiple=false mnewidth=260 formId="WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_form" editCustomCallback=";" refViewCode="MESBasic_1_product_refProductLayout"  onkeyupfuncname=";_callback_batchProdTaskPart_bulkProduct_productCode(obj);" cssStyle="" isEdit=true beforecallback='clearbulkProduct(obj)'  isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(batchProdTaskPart.id)?? && (batchProdTaskPart.bulkProduct.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${batchProdTaskPart.bulkProduct.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_form',obj, 'batchProdTaskPart.bulkProduct', '/MESBasic/product/product/refProductLayout.action');
												CUI.commonFills('WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_form', 'batchProdTaskPart.bulkProduct',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion141572452740737')}" >${getText('WOM.propertydisplayName.radion141572452740737')}</label>
				</td>
				
						<#assign batchProdTaskPart_bulkProduct_productName_defaultValue  = ''>
														<#assign batchProdTaskPart_bulkProduct_productName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="batchProdTaskPart.bulkProduct.productName" id="batchProdTaskPart_bulkProduct_productName"  style=";" originalvalue="<#if !newObj || (batchProdTaskPart.bulkProduct.productName)?has_content>${(batchProdTaskPart.bulkProduct.productName?html)!}<#else>${batchProdTaskPart_bulkProduct_productName_defaultValue!}</#if>" value="<#if !newObj || (batchProdTaskPart.bulkProduct.productName)?has_content>${(batchProdTaskPart.bulkProduct.productName?html)!}<#else>${batchProdTaskPart_bulkProduct_productName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1495854202030')}" >${getText('WOM.propertydisplayName.randon1495854202030')}</label>
				</td>
				
						<#assign batchProdTaskPart_bulkBatchNum_batchText_defaultValue  = ''>
														<#assign batchProdTaskPart_bulkBatchNum_batchText_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('WOM.viewtitle.randon1503994294075')}" viewType="${viewType!}" deValue="${batchProdTaskPart_bulkBatchNum_batchText_defaultValue!}" conditionfunc="WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._querycustomFunc('batchProdTaskPart_bulkBatchNum_batchText')"  value="${(batchProdTaskPart.bulkBatchNum.batchText)!}" displayFieldName="batchText" name="batchProdTaskPart.bulkBatchNum.batchText" id="batchProdTaskPart_bulkBatchNum_batchText" type="other" url="/WOM/standingcropRef/standingcropRef/batchNumOneMakeTask.action" clicked=true multiple=false mnewidth=260 formId="WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_form" editCustomCallback="bulkProductCallback(obj);" refViewCode="WOM_7.5.0.0_standingcropRef_batchNumOneMakeTask"  onkeyupfuncname="bulkProductCallback(obj);_callback_batchProdTaskPart_bulkBatchNum_batchText(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(batchProdTaskPart.id)?? && (batchProdTaskPart.bulkBatchNum.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${batchProdTaskPart.bulkBatchNum.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_form',obj, 'batchProdTaskPart.bulkBatchNum', '/WOM/standingcropRef/standingcropRef/batchNumOneMakeTask.action');
												CUI.commonFills('WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_form', 'batchProdTaskPart.bulkBatchNum',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
									WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.query_batchProdTaskPart_bulkBatchNum_batchText = function() {
										return "goodID="+$("input[name='batchProdTaskPart.bulkProduct.id']").val();
									}
								</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1495090772143')}" >${getText('WOM.propertydisplayName.randon1495090772143')}</label>
				</td>
				
						<#assign batchProdTaskPart_bulkNum_defaultValue  = ''>
							 							<#assign batchProdTaskPart_bulkNum_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="batchProdTaskPart.bulkNum" id="batchProdTaskPart_bulkNum"  style=";" originalvalue="<#if newObj&& !(batchProdTaskPart.bulkNum)?has_content>${batchProdTaskPart_bulkNum_defaultValue!}<#elseif (batchProdTaskPart.bulkNum)?has_content>#{(batchProdTaskPart.bulkNum)!; m2M2}</#if>" value="<#if newObj&& !(batchProdTaskPart.bulkNum)?has_content>${batchProdTaskPart_bulkNum_defaultValue!}<#elseif (batchProdTaskPart.bulkNum)?has_content>#{(batchProdTaskPart.bulkNum)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#batchProdTaskPart_bulkNum').unbind('blur').bind('blur',function(){
										var percision = 2;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("WOM.propertydisplayName.randon1495090772143")}')}");
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
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1507699183174')}" >${getText('WOM.propertydisplayName.randon1507699183174')}</label>
				</td>
				
						<#assign batchProdTaskPart_amount_defaultValue  = ''>
							 							<#assign batchProdTaskPart_amount_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="INTEGER" name="batchProdTaskPart.amount" id="batchProdTaskPart_amount"  style=";" originalvalue="<#if !newObj || (batchProdTaskPart.amount)?has_content>${(batchProdTaskPart.amount?html)!}<#else>${batchProdTaskPart_amount_defaultValue!}</#if>" value="<#if !newObj || (batchProdTaskPart.amount)?has_content>${(batchProdTaskPart.amount?html)!}<#else>${batchProdTaskPart_amount_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1509501197099')}" >${getText('WOM.propertydisplayName.randon1509501197099')}</label>
				</td>
				
						<#assign batchProdTaskPart_bulkType_defaultValue  = ''>
							 							<#assign batchProdTaskPart_bulkType_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${batchProdTaskPart_bulkType_defaultValue!}" formId="WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="batchProdTaskPart.bulkType.id" code="womPackageType" value="${(batchProdTaskPart.bulkType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="batchProdTaskPart.bulkType.id" code="womPackageType" value="${(batchProdTaskPart.bulkType.id)!}"  />
									
								</#if>
							
				</td>
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
</@s.form>
<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_batchProduceTask_setPartsEdit,html,WOM_7.5.0.0_batchProduceTask_BatchProdTaskPart,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.beforeSaveProcess = function(){}
	WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_form').trigger('beforeSubmit');
		//batchProdTaskPart.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="batchProdTaskPart.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.validate = function(){
		return true;
	}
	
	
	//打印
	WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.print = function(url){
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
		
		WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.saveSetting = function(){
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
		WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.printSetting = function(){
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
			WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.settingDialog.show();
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
			WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._customCallBack = customCallBack;
		}
		WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_fileupload').length == 0) {
				$('body').append('<div id="WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_fileupload"></div>');
			}
			WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.infoDialog.show();
			if($('#WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_fileupload').html() == '') {
				$('#WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=WOM_batchProduceTask_batchProdTaskPart&entityCode=WOM_7.5.0.0_batchProduceTask&dialogId="+dialogId);
			}
		}
	//参照复制函数
	WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.referenceCopy = function(objName,url, dialog){
		var callbackName ="WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.referenceCopyBackInfo";
		WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.dialog = dialog;
		WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._dialog = foundation.common.select({
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
	
	WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.referenceCopyBackInfo = function(obj){
		if(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._dialog){
			WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_form','WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.dialog._el).load('/WOM/batchProduceTask/batchProdTaskPart/setPartsEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.dialog._config.iframe, WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.dialog._dialog ).prop( 'src', '/WOM/batchProduceTask/batchProdTaskPart/setPartsEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.dialog._el).load('/WOM/batchProduceTask/batchProdTaskPart/setPartsEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'WOM_batchProduceTask_batchProdTaskPart_setPartsEdit' + '_' + extraFrameParam;
		var callbackName="";
		WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._prefix = '';
		WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._oGrid = oGrid;
		WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._sUrl = url;
		if(customCallBack){
			WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.gridEventObj = gridEventObj;
			callbackName = "WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.getMultiselectCallBackInfo_DG" : "WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.getcallBackInfo_DG";
			WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.getcallBackInfo";
		}
		if(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._prefix!=''){
			WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._prefix = WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._prefix.substring(1);
		}
		if(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._querycustomFuncN == "function") {
				refparam += WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.query_"+obj+")!='undefined'") ? eval('WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.query_'+obj+'()') : null;
		return str;
	
	};
	
	WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_form',obj[0], WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._prefix, WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._sUrl);
		CUI.commonFills('WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_form',WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._prefix,obj[0]);

		try{
			if(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._customCallBack) {
				eval(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._customCallBack);
				WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.getcallBackInfo_DG_IE = function(obj){
		if(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._customBeforeCallBack) {
			var flag = eval(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._sUrl);
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
			if(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._customCallBack) {
				eval(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._customCallBack);
				WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.getcallBackInfo_DG = function(obj){
		if(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._customBeforeCallBack) {
			var flag = eval(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._currRow).next().length==0){
					WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._oGrid.addNewRow();
				}	
				WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._currRow = $(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._currRow).next();
				$(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._currRow,obj[i],WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._prefix,WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._sUrl);
			eval("CUI.commonFills_DG(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._currRow,WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._prefix,obj[i],WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._oGrid)");
		}
		try{
			if(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._customCallBack) {
				eval(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._customCallBack);
				WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._dialog.close();
		} catch(e){}
	};
	
	WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._oGrid, WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._currRow, WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._key, WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._displayFieldName, obj[i])
		}
		try{
			if(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._customCallBack) {
				eval(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._customCallBack);
				WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			WOM.batchProduceTask.batchProdTaskPart.setPartsEdit._dialog.close();
		} catch(e){}
	};
	
	WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_form'));
        			}
        	   	}
        	}
      	});
	};
	(function($){
		$(function(){
			var taskType= $('#batchProduceTasktaskTypeid').val();

//制造
if(taskType=='womTaskType/type1'){

	$('input[name="batchProdTaskPart.bulkProduct.productName"]').parent().parent().prev().parent().hide();
	$('input[name="batchProdTaskPart.bulkNum"]').parent().parent().prev().parent().hide();
	$("#batchProdTaskPartbulkTypeid").parent().parent().hide();
	$("#batchProdTaskPartbulkTypeid").parent().parent().prev().hide();

}
		});
	})(jQuery);
	WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.initCount = 0;
	WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#WOM_setPartsEdit_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_datagrids');	
		var	conHeight = h-$("#WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#WOM_batchProduceTask_batchProdTaskPart_setPartsEdit_main_div .edit-panes-s").each(function(index){
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
							if(WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.initCount <= 2) {
								setTimeout(function(){WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.initSize();}, 200);
								WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.initCount++;
							}/* else {
								WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.initCount = 0;
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
		WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.initSize(index);
		});
		$(window).bind("dialog.resize",function(){WOM.batchProduceTask.batchProdTaskPart.setPartsEdit.initSize();});
	});
</script>
<script type="text/javascript">
	
function clearFormular(obj){
	//获取样品ID
	var productID = obj[0].id;
	
	var old = $("[name='produceTask.productId.id']").val();
	if(old!=productID){
		$("[name='batchProdTaskPart.formularId.code']").val("");
		$("[name='batchProdTaskPart.formularId.id']").val("");
		$("[name='batchProdTaskPart.formularId.name']").val("");

	}

}
function clearbulkProduct(obj){
	//获取样品ID
	var productID = obj[0].id;
	
	var old = $("[name='produceTask.bulkProduct.id']").val();
	if(old!=productID){
		$("[name='batchProdTaskPart.bulkBatchNum.batchText']").val("");
		$("[name='batchProdTaskPart.bulkBatchNum.id']").val("");

	}

}
function produceTaskCallback(obj){
		console.log(obj);
		//将产品赋值
		$('input[name="batchProdTaskPart.productId.id"]').val(obj[0].product.id);
		$('input[name="batchProdTaskPart.productId.productCode"]').val(obj[0].product.productCode);
		$('input[name="batchProdTaskPart.productId.productName"]').val(obj[0].product.productName);
	
}
function bulkProductCallback(obj){
		console.log(obj);
		//将产品赋值
		$('input[name="batchProdTaskPart.bulkProduct.id"]').val(obj[0].good.id);
		$('input[name="batchProdTaskPart.bulkProduct.productCode"]').val(obj[0].good.productCode);
		$('input[name="batchProdTaskPart.bulkProduct.productName"]').val(obj[0].good.productName);
	
}
function getDefaultFormular(obj){
	var productID = obj[0].id;
	var line=$("[name='batchProdTaskPart.factoryId.name']").val();
	if(line==""){
		var taskTypeid=$("#batchProduceTasktaskTypeid").val();
	var taskType="";
	if(taskTypeid=="womTaskType/type2"){
		taskType="packageTask";
	}
	if(taskTypeid=="womTaskType/type1"){
		taskType="produceTask";
	}
	$.ajax({
		url : "/WOM/produceTask/produceTask/getDefaultFormular.action",
		type : 'post',
		traditional: true,
		async : false,
		data:{"productID":productID,"taskType":taskType},
		success : function(res) {
			if(res.dealSuccessFlag==true){
			  $('input[name="batchProdTaskPart.formularId.id"]').val(res.formularID)
			  $('input[name="batchProdTaskPart.formularId.code"]').val(res.formularCode)
			  $('input[name="batchProdTaskPart.formularId.name"]').val(res.formularName)
			}
		}
	});
	}


}

	/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_batchProduceTask_setPartsEdit,js,WOM_7.5.0.0_batchProduceTask_BatchProdTaskPart,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>