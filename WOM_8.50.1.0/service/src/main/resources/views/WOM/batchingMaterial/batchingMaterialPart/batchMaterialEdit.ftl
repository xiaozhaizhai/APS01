<!-- WOM_7.5.0.0/batchingMaterial/batchMaterialEdit -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1491982432259')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_batchingMaterial_batchMaterialEdit,head,WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart,WOM_7.5.0.0) -->
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
	CUI.ns('WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit');
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
<#assign callbackName ="WOM.batchingMaterial.batchingMaterialPart.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form" cssStyle="height:100%;" hiddenField="batchingMaterialPart.batchNumObj.id,batchingMaterialPart.headId.id,batchingMaterialPart.productId.id,batchingMaterialPart.storeID.id,batchingMaterialPart.exeStaff.id,batchingMaterialPart.wareID.id," onsubmitMethod="WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.beforeSubmitMethod()" ecAction="/WOM/batchingMaterial/batchingMaterialPart/batchMaterialEdit/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="batchMaterialEdit">
	<input type="hidden" name="viewCode" value="WOM_7.5.0.0_batchingMaterial_batchMaterialEdit">
	<input type="hidden" name="datagridKey" value="WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="batchingMaterialPart.version" value="${(batchingMaterialPart.version)!0}" />
	<input type="hidden" name="batchingMaterialPart.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
		<input type="hidden" name="batchingMaterialPart.batchNumObj.id" value="${(batchingMaterialPart.batchNumObj.id)!""}"/>
		<input type="hidden" name="batchingMaterialPart.headId.id" value="${(batchingMaterialPart.headId.id)!""}"/>
		<input type="hidden" name="batchingMaterialPart.productId.id" value="${(batchingMaterialPart.productId.id)!""}"/>
		<input type="hidden" name="batchingMaterialPart.storeID.id" value="${(batchingMaterialPart.storeID.id)!""}"/>
		<input type="hidden" name="batchingMaterialPart.exeStaff.id" value="${(batchingMaterialPart.exeStaff.id)!""}"/>
		<input type="hidden" name="batchingMaterialPart.wareID.id" value="${(batchingMaterialPart.wareID.id)!""}"/>
	<div id="WOM_batchMaterialEdit_edit_div" style="height:100%">
		<div id="WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form"+"_attcount";
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
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:22%'></td><td style='height:0px;border:none;width:25%'></td><td style='height:0px;border:none;width:22%'></td><td style='height:0px;border:none;width:25%'></td></tr>
		<tr class="dialog_tr">
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1491790473893')}" >${getText('WOM.propertydisplayName.randon1491790473893')}</label>
				</td>
				
						<#assign batchingMaterialPart_exeStaff_name_defaultValue  = 'currentUser'>
												<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.view.reference')}" viewType="readonly" deValue="${batchingMaterialPart_exeStaff_name_defaultValue!}" conditionfunc="WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._querycustomFunc('batchingMaterialPart_exeStaff_name')" view=true  value="${(batchingMaterialPart.exeStaff.name)!}" displayFieldName="name" name="batchingMaterialPart.exeStaff.name" id="batchingMaterialPart_exeStaff_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form" editCustomCallback=";" refViewCode="sysbase_1.0_staff_ref" onkeyupfuncname=";_callback_batchingMaterialPart_exeStaff_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (batchingMaterialPart_exeStaff_name_defaultValue)=='currentUser'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.id}'};
											obj = foundation.common.getObject('WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form',obj, 'batchingMaterialPart.exeStaff', '/foundation/staff/common/staffListFrameset.action');
											CUI.commonFills('WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form', 'batchingMaterialPart.exeStaff',obj,true);
											$('input:hidden[name="batchingMaterialPart.exeStaff.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(batchingMaterialPart.id)?? && (batchingMaterialPart.exeStaff.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${batchingMaterialPart.exeStaff.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form',obj, 'batchingMaterialPart.exeStaff', '/foundation/staff/common/staffListFrameset.action');
												CUI.commonFills('WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form', 'batchingMaterialPart.exeStaff',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1491790496670')}" >${getText('WOM.propertydisplayName.randon1491790496670')}</label>
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
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion14157726448331')}" >${getText('WOM.propertydisplayName.radion14157726448331')}</label>
				</td>
				
						<#assign batchingMaterialPart_productId_productCode_defaultValue  = ''>
														<#assign batchingMaterialPart_productId_productCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}" viewType="readonly" deValue="${batchingMaterialPart_productId_productCode_defaultValue!}" conditionfunc="WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._querycustomFunc('batchingMaterialPart_productId_productCode')" view=true  value="${(batchingMaterialPart.productId.productCode)!}" displayFieldName="productCode" name="batchingMaterialPart.productId.productCode" id="batchingMaterialPart_productId_productCode" type="other" url="/MESBasic/product/product/productRefNew.action" clicked=true multiple=false mnewidth=260 formId="WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form" editCustomCallback=";" refViewCode="MESBasic_1_product_productRefNew" onkeyupfuncname=";_callback_batchingMaterialPart_productId_productCode(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(batchingMaterialPart.id)?? && (batchingMaterialPart.productId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${batchingMaterialPart.productId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form',obj, 'batchingMaterialPart.productId', '/MESBasic/product/product/productRefNew.action');
												CUI.commonFills('WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form', 'batchingMaterialPart.productId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
									WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.query_batchingMaterialPart_productId_productCode = function() {
										return "goodID="+$("input[name='batchingMaterialPart.productId.id']").val();
									}
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
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon14917899223367')}" >${getText('WOM.propertydisplayName.randon14917899223367')}</label>
				</td>
				
						<#assign batchingMaterialPart_headId_needNum_defaultValue  = ''>
														<#assign batchingMaterialPart_headId_needNum_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="batchingMaterialPart.headId.needNum" id="batchingMaterialPart_headId_needNum"  style=";" originalvalue="<#if newObj&& !(batchingMaterialPart.headId.needNum)?has_content>${batchingMaterialPart_headId_needNum_defaultValue!}<#elseif (batchingMaterialPart.headId.needNum)?has_content>#{(batchingMaterialPart.headId.needNum)!; m6M6}</#if>" value="<#if newObj&& !(batchingMaterialPart.headId.needNum)?has_content>${batchingMaterialPart_headId_needNum_defaultValue!}<#elseif (batchingMaterialPart.headId.needNum)?has_content>#{(batchingMaterialPart.headId.needNum)!; m6M6}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1491789944047')}" >${getText('WOM.propertydisplayName.randon1491789944047')}</label>
				</td>
				
						<#assign batchingMaterialPart_headId_doneNum_defaultValue  = ''>
														<#assign batchingMaterialPart_headId_doneNum_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="batchingMaterialPart.headId.doneNum" id="batchingMaterialPart_headId_doneNum"  style=";" originalvalue="<#if newObj&& !(batchingMaterialPart.headId.doneNum)?has_content>${batchingMaterialPart_headId_doneNum_defaultValue!}<#elseif (batchingMaterialPart.headId.doneNum)?has_content>#{(batchingMaterialPart.headId.doneNum)!; m6M6}</#if>" value="<#if newObj&& !(batchingMaterialPart.headId.doneNum)?has_content>${batchingMaterialPart_headId_doneNum_defaultValue!}<#elseif (batchingMaterialPart.headId.doneNum)?has_content>#{(batchingMaterialPart.headId.doneNum)!; m6M6}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;color: rgb(179, 3, 3);;" value="${getText('WOM.propertydisplayName.randon1491790594009')}" >${getText('WOM.propertydisplayName.randon1491790594009')}</label>
				</td>
				
						<#assign batchingMaterialPart_batchNumObj_batchText_defaultValue  = ''>
														<#assign batchingMaterialPart_batchNumObj_batchText_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('WOM.viewtitle.randon1502607384728')}" viewType="${viewType!}" deValue="${batchingMaterialPart_batchNumObj_batchText_defaultValue!}" conditionfunc="WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._querycustomFunc('batchingMaterialPart_batchNumObj_batchText')"  value="${(batchingMaterialPart.batchNumObj.batchText)!}" displayFieldName="batchText" name="batchingMaterialPart.batchNumObj.batchText" id="batchingMaterialPart_batchNumObj_batchText" type="other" url="/WOM/standingcropRef/standingcropRef/batchNumOneBatRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form" editCustomCallback="batchObjCallback(obj);" refViewCode="WOM_7.5.0.0_standingcropRef_batchNumOneBatRef" onkeyupfuncname="batchObjCallback(obj);_callback_batchingMaterialPart_batchNumObj_batchText(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(batchingMaterialPart.id)?? && (batchingMaterialPart.batchNumObj.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${batchingMaterialPart.batchNumObj.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form',obj, 'batchingMaterialPart.batchNumObj', '/WOM/standingcropRef/standingcropRef/batchNumOneBatRef.action');
												CUI.commonFills('WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form', 'batchingMaterialPart.batchNumObj',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
									WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.query_batchingMaterialPart_batchNumObj_batchText = function() {
										return "goodID="+$("input[name='batchingMaterialPart.productId.id']").val();
									}
								</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1491790683313')}" >${getText('WOM.propertydisplayName.randon1491790683313')}</label>
				</td>
				
						<#assign batchingMaterialPart_doneNum_defaultValue  = ''>
							 							<#assign batchingMaterialPart_doneNum_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="batchingMaterialPart.doneNum" id="batchingMaterialPart_doneNum"  style=";" originalvalue="<#if newObj&& !(batchingMaterialPart.doneNum)?has_content>${batchingMaterialPart_doneNum_defaultValue!}<#elseif (batchingMaterialPart.doneNum)?has_content>#{(batchingMaterialPart.doneNum)!; m2M2}</#if>" value="<#if newObj&& !(batchingMaterialPart.doneNum)?has_content>${batchingMaterialPart_doneNum_defaultValue!}<#elseif (batchingMaterialPart.doneNum)?has_content>#{(batchingMaterialPart.doneNum)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#batchingMaterialPart_doneNum').unbind('blur').bind('blur',function(){
										var percision = 2;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("WOM.propertydisplayName.randon1491790683313")}')}");
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
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1484031239867')}" >${getText('WOM.propertydisplayName.randon1484031239867')}</label>
				</td>
				
						<#assign batchingMaterialPart_wareID_wareCode_defaultValue  = ''>
														<#assign batchingMaterialPart_wareID_wareCode_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1484032238590')}" viewType="${viewType!}" deValue="${batchingMaterialPart_wareID_wareCode_defaultValue!}" conditionfunc="WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._querycustomFunc('batchingMaterialPart_wareID_wareCode')"  value="${(batchingMaterialPart.wareID.wareCode)!}" displayFieldName="wareCode" name="batchingMaterialPart.wareID.wareCode" id="batchingMaterialPart_wareID_wareCode" type="other" url="/MESBasic/wareMan/ware/wareRefStore.action" clicked=true multiple=false mnewidth=260 formId="WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form" editCustomCallback=";" refViewCode="MESBasic_1_wareMan_wareRefStore" onkeyupfuncname=";_callback_batchingMaterialPart_wareID_wareCode(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(batchingMaterialPart.id)?? && (batchingMaterialPart.wareID.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${batchingMaterialPart.wareID.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form',obj, 'batchingMaterialPart.wareID', '/MESBasic/wareMan/ware/wareRefStore.action');
												CUI.commonFills('WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form', 'batchingMaterialPart.wareID',obj,true);
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
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1489731651448')}" >${getText('WOM.propertydisplayName.randon1489731651448')}</label>
				</td>
				
						<#assign batchingMaterialPart_storeID_placeSetCode_defaultValue  = ''>
														<#assign batchingMaterialPart_storeID_placeSetCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('MESBasic.viewtitle.randon1489735291062')}" viewType="${viewType!}" deValue="${batchingMaterialPart_storeID_placeSetCode_defaultValue!}" conditionfunc="WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._querycustomFunc('batchingMaterialPart_storeID_placeSetCode')"  value="${(batchingMaterialPart.storeID.placeSetCode)!}" displayFieldName="placeSetCode" name="batchingMaterialPart.storeID.placeSetCode" id="batchingMaterialPart_storeID_placeSetCode" type="other" url="/MESBasic/storeSet/storeSet/storeRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form" editCustomCallback=";" refViewCode="MESBasic_1_storeSet_storeRef"  onkeyupfuncname=";_callback_batchingMaterialPart_storeID_placeSetCode(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(batchingMaterialPart.id)?? && (batchingMaterialPart.storeID.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${batchingMaterialPart.storeID.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form',obj, 'batchingMaterialPart.storeID', '/MESBasic/storeSet/storeSet/storeRef.action');
												CUI.commonFills('WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form', 'batchingMaterialPart.storeID',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
									WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.query_batchingMaterialPart_storeID_placeSetCode = function() {
										var wareId=$("[name='batchingMaterialPart.wareID.id']").val();
	if(wareId=="" || wareId==null){
		wareId = -1;
	}
	return "wareId="+wareId;
									}
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
			<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart", "WOM_7.5.0.0_batchingMaterial_batchMaterialEdit", 'EDIT')>
			<#if customPropList?? && customPropList?size gte 1>
				<table class="edit-table" style="" cellspacing="0" cellpadding="0" border="0">
				<tr>
					<td style="width:22%;"></td><td style="width:29%;"></td>
					<td style="width:22%;"></td><td style="width:29%;"></td>
				</tr>
			<tr class="dialog_tr">
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
				</tr><tr class="dialog_tr">
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
						<#if batchingMaterialPart[columnName]??>
							<#assign dateVal = (batchingMaterialPart[columnName])?string('yyyy-MM-dd HH:mm:ss')>
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
							<@systemcode property_type="${columnType}" iscustom=true showType="${fieldType}" viewType=viewType cssStyle="text-align:${c.align!}" formId="WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form" classStyle="cui-noborder-input" view=(c.readonly!false) cssStyle="" ecFlag=true multable=isMultable name="${elementName}" code="${(c.property.fillcontentMap.fillContent)!}" value="${batchingMaterialPart[columnName]!}" seniorSystemCode=isS2 />
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
							<@mneclient iframe=false property_type="${columnType}" mneenable=false reftitle="${getText('${viewTitle!}')}" viewType=viewType cssStyle="text-align:${c.align!}" view=(c.readonly!false) value="${batchingMaterialPart[displayColumnName]!}" name="${elementName}.${mainDisplayName!'name'}" id="${elementName?replace('.', '_')}_${mainDisplayName!'name'}" type="${mneType}" url="${viewUrl!}" clicked=true multiple=false isEdit=true mnewidth=260 formId="WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form" editCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}()" delCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}_delete()" />
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
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td></tr>
		<tr class="dialog_tr">
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1491790724898')}" >${getText('WOM.propertydisplayName.randon1491790724898')}</label>
				</td>
				
						<#assign batchingMaterialPart_remark_defaultValue  = ''>
							 							<#assign batchingMaterialPart_remark_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="3" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input fix-ie7-textarea"><textarea property_type="TEXT" id="batchingMaterialPart_remark" originalvalue="<#if !newObj || (batchingMaterialPart.remark)?has_content>${(batchingMaterialPart.remark?html)!}<#else>${batchingMaterialPart_remark_defaultValue?html}</#if>"  name="batchingMaterialPart.remark" class="cui-noborder-textarea cui-textarea-auto" style=";" ><#if !newObj || (batchingMaterialPart.remark)?has_content>${(batchingMaterialPart.remark)!}<#else>${batchingMaterialPart_remark_defaultValue}</#if></textarea></div>
							
				</td>
		</tr>
	</table>
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="display:none;">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:22%'></td><td style='height:0px;border:none;width:29%'></td><td style='height:0px;border:none;width:22%'></td><td style='height:0px;border:none;width:29%'></td></tr>
		<tr class="dialog_tr">
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
					
							<label style="width:100%;;" value="${getText('ec.common.ID')}" >${getText('ec.common.ID')}</label>
				</td>
				
						<#assign batchingMaterialPart_headId_id_defaultValue  = ''>
														<#assign batchingMaterialPart_headId_id_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;display:none;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="LONG" mneenable=false reftitle="${getText('WOM.viewtitle.randon1491984336543')}" viewType="${viewType!}" deValue="${batchingMaterialPart_headId_id_defaultValue!}" conditionfunc="WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._querycustomFunc('batchingMaterialPart_headId_id')"  value="${(batchingMaterialPart.headId.id)!}" displayFieldName="id" name="batchingMaterialPart.headId.id" id="batchingMaterialPart_headId_id" type="other" url="/WOM/batchingMaterial/batchingMaterial/batMaterialRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form" editCustomCallback=";" refViewCode="WOM_7.5.0.0_batchingMaterial_batMaterialRef"  onkeyupfuncname=";_callback_batchingMaterialPart_headId_id(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(batchingMaterialPart.id)?? && (batchingMaterialPart.headId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${batchingMaterialPart.headId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form',obj, 'batchingMaterialPart.headId', '/WOM/batchingMaterial/batchingMaterial/batMaterialRef.action');
												CUI.commonFills('WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form', 'batchingMaterialPart.headId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449796384550')}" >${getText('MESBasic.propertydisplayName.randon1449796384550')}</label>
				</td>
				
						<#assign batchingMaterialPart_productId_id_defaultValue  = ''>
														<#assign batchingMaterialPart_productId_id_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;display:none;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="LONG" name="batchingMaterialPart.productId.id" id="batchingMaterialPart_productId_id"  style=";" originalvalue="<#if !newObj || (batchingMaterialPart.productId.id)?has_content>${(batchingMaterialPart.productId.id?html)!}<#else>${batchingMaterialPart_productId_id_defaultValue!}</#if>" value="<#if !newObj || (batchingMaterialPart.productId.id)?has_content>${(batchingMaterialPart.productId.id?html)!}<#else>${batchingMaterialPart_productId_id_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1484031944240')}" >${getText('MESBasic.propertydisplayName.randon1484031944240')}</label>
				</td>
				
						<#assign batchingMaterialPart_wareID_cargoStatue_defaultValue  = ''>
														<#assign batchingMaterialPart_wareID_cargoStatue_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${batchingMaterialPart_wareID_cargoStatue_defaultValue!}" formId="WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="batchingMaterialPart.wareID.cargoStatue.id" code="storageState" value="${(batchingMaterialPart.wareID.cargoStatue.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="batchingMaterialPart.wareID.cargoStatue.id" code="storageState" value="${(batchingMaterialPart.wareID.cargoStatue.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1491790594009')}" >${getText('WOM.propertydisplayName.randon1491790594009')}</label>
				</td>
				
						<#assign batchingMaterialPart_batchNum_defaultValue  = ''>
							 							<#assign batchingMaterialPart_batchNum_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="batchingMaterialPart.batchNum" id="batchingMaterialPart_batchNum"  style=";" originalvalue="<#if !newObj || (batchingMaterialPart.batchNum)?has_content>${(batchingMaterialPart.batchNum?html)!}<#else>${batchingMaterialPart_batchNum_defaultValue!}</#if>" value="<#if !newObj || (batchingMaterialPart.batchNum)?has_content>${(batchingMaterialPart.batchNum?html)!}<#else>${batchingMaterialPart_batchNum_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1505884945744')}" >${getText('WOM.propertydisplayName.randon1505884945744')}</label>
				</td>
				
						<#assign batchingMaterialPart_printCount_defaultValue  = '0'>
							 					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;display:none;;" >
					
							
							<div class="fix-input">
								<input property_type="INTEGER" name="batchingMaterialPart.printCount" id="batchingMaterialPart_printCount"  style=";" originalvalue="<#if !newObj || (batchingMaterialPart.printCount)?has_content>${(batchingMaterialPart.printCount?html)!}<#else>${batchingMaterialPart_printCount_defaultValue!}</#if>" value="<#if !newObj || (batchingMaterialPart.printCount)?has_content>${(batchingMaterialPart.printCount?html)!}<#else>${batchingMaterialPart_printCount_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" />
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

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_batchingMaterial_batchMaterialEdit,html,WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart,WOM_7.5.0.0) -->
<!-- 自定义代码 -->
<style type="text/css">
	#WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_main_div .edit-head {display:none;}
	#WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_main_div .edit-workflow {display:none;}
</style>
<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.beforeSaveProcess = function(){}
	WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form').trigger('beforeSubmit');
		//batchingMaterialPart.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="batchingMaterialPart.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.validate = function(){
		return true;
	}
	
	
	//打印
	WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.print = function(url){
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
		
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.saveSetting = function(){
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
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.printSetting = function(){
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
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.settingDialog.show();
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
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._customCallBack = customCallBack;
		}
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_fileupload').length == 0) {
				$('body').append('<div id="WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_fileupload"></div>');
			}
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.infoDialog.show();
			if($('#WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_fileupload').html() == '') {
				$('#WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=WOM_batchingMaterial_batchingMaterialPart&entityCode=WOM_7.5.0.0_batchingMaterial&dialogId="+dialogId);
			}
		}
	//参照复制函数
	WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.referenceCopy = function(objName,url, dialog){
		var callbackName ="WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.referenceCopyBackInfo";
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.dialog = dialog;
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._dialog = foundation.common.select({
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
	
	WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.referenceCopyBackInfo = function(obj){
		if(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._dialog){
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form','WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.dialog._el).load('/WOM/batchingMaterial/batchingMaterialPart/batchMaterialEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.dialog._config.iframe, WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.dialog._dialog ).prop( 'src', '/WOM/batchingMaterial/batchingMaterialPart/batchMaterialEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.dialog._el).load('/WOM/batchingMaterial/batchingMaterialPart/batchMaterialEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit' + '_' + extraFrameParam;
		var callbackName="";
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._prefix = '';
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._oGrid = oGrid;
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._sUrl = url;
		if(customCallBack){
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.gridEventObj = gridEventObj;
			callbackName = "WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.getMultiselectCallBackInfo_DG" : "WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.getcallBackInfo_DG";
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.getcallBackInfo";
		}
		if(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._prefix!=''){
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._prefix = WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._prefix.substring(1);
		}
		if(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._querycustomFuncN == "function") {
				refparam += WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.query_"+obj+")!='undefined'") ? eval('WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.query_'+obj+'()') : null;
		return str;
	
	};
	
	WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form',obj[0], WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._prefix, WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._sUrl);
		CUI.commonFills('WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form',WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._prefix,obj[0]);

		try{
			if(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._customCallBack) {
				eval(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._customCallBack);
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.getcallBackInfo_DG_IE = function(obj){
		if(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._customBeforeCallBack) {
			var flag = eval(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._sUrl);
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
			if(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._customCallBack) {
				eval(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._customCallBack);
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.getcallBackInfo_DG = function(obj){
		if(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._customBeforeCallBack) {
			var flag = eval(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._currRow).next().length==0){
					WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._oGrid.addNewRow();
				}	
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._currRow = $(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._currRow).next();
				$(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._currRow,obj[i],WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._prefix,WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._sUrl);
			eval("CUI.commonFills_DG(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._currRow,WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._prefix,obj[i],WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._oGrid)");
		}
		try{
			if(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._customCallBack) {
				eval(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._customCallBack);
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._dialog.close();
		} catch(e){}
	};
	
	WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._oGrid, WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._currRow, WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._key, WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._displayFieldName, obj[i])
		}
		try{
			if(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._customCallBack) {
				eval(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._customCallBack);
				WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit._dialog.close();
		} catch(e){}
	};
	
	WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form'));
        			}
        	   	}
        	}
      	});
	};
	(function($){
		$(function(){
			<#if headID??>
			$("[name='batchingMaterialPart.headId.id']").val("${(headID)!}");
		</#if>
		<#if proID??>
			$("[name='batchingMaterialPart.productId.id']").val("${(proID)!}");
		</#if>
		<#if proCode??>
			$("[name='batchingMaterialPart.productId.productCode']").val("${(proCode)!}");
		</#if>
		<#if proName??>
			$("[name='batchingMaterialPart.productId.productName']").val("${(proName)!}");
		</#if>
		$("#WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form").append( "<input type='hidden' name='out' value='out' />" );

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
		//是否启用MES物料管理
		if(!isMesProBatch){//不启用MES
			//insertAfter编辑文本框   文本插到对象后面
			$("#batchingMaterialPart_batchNum").parents("td").insertAfter($("#batchingMaterialPart_batchNumObj_batchText_mneTipLabel").parents("td").prev("td"))
			//删除obj框
			$("#batchingMaterialPart_batchNumObj_batchText_mneTipLabel").parents("td").remove();
		}else{
		//启用MES物料管理,仓库货位只读,通过批号带出
			$("#batchingMaterialPart_batchNumObj_batchText_mneTipLabel").remove();
			//仓库编码只读
			 $("#batchingMaterialPart_wareID_wareCodediv").removeAttr("onmouseenter");//div删除属性
			 $("#batchingMaterialPart_wareID_wareCodediv").unbind('mouseenter');//div解除绑定
			 $("[name='batchingMaterialPart.wareID.wareCode']").attr("readonly",true);//input只读
			 $("#batchingMaterialPart_wareID_wareCode_click_button").remove();//按钮删除
			 $("#batchingMaterialPart_wareID_wareCode_mneTipLabel").remove()
			//货位编码只读
			 $("#batchingMaterialPart_storeID_placeSetCodediv").removeAttr("onmouseenter");//div删除属性
			 $("#batchingMaterialPart_storeID_placeSetCodediv").unbind('mouseenter');//div解除绑定
			 $("[name='batchingMaterialPart.storeID.placeSetCode']").attr("readonly",true);//input只读
			 $("#batchingMaterialPart_storeID_placeSetCode_click_button").remove();//按钮删除
			 //货位状态只读onload没用,节隐藏
			 //$("#batchingMaterialPartwareIDcargoStatueid").disabledSelect();
		}
		//填写需求数量
		$("[name='batchingMaterialPart.headId.needNum']").val(ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.getSelectedRow()[0].needNum);
		//填写已配数量
		$("[name='batchingMaterialPart.headId.doneNum']").val(ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.getSelectedRow()[0].doneNum);
		});
	})(jQuery);
	WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.beforeSubmitMethodSettingInPage = function(){
		WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_formDialogErrorBarWidget.showMessage('${getText("ec.common.saveandclosesuccessful")}','s');
	//仓库如果启用货位，则必须填写货位
	var cargoStatue=$("[name='batchingMaterialPart.wareID.cargoStatue.id']").val();
	var placeSetCode=$("[name='batchingMaterialPart.storeID.placeSetCode']").val();
	if(cargoStatue=='storageState/storageState1' && placeSetCode==''){
	  WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_formDialogErrorBarWidget.showMessage('${getText('WOM.errorMesg.randon1489737417838345')}','f');
	  return false;
	}
	//回填已配数量
	if($("[name='batchingMaterialPart.headId.doneNum']").val()=="" || $("[name='batchingMaterialPart.headId.doneNum']").val()==null){
		ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.setCellValue($("#ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query .trSelected").attr('bakindex'),"doneNum",parseFloat($("[name='batchingMaterialPart.doneNum']").val()));
	}else{
		ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.setCellValue($("#ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query .trSelected").attr('bakindex'),"doneNum",parseFloat($("[name='batchingMaterialPart.headId.doneNum']").val())+parseFloat($("[name='batchingMaterialPart.doneNum']").val()));
	}
	var batchNumObjText=$("input[name='batchingMaterialPart.batchNumObj.batchText']").val();
	var url="/WOM/putInMaterial/putInMaterial/getIsMesProBatch.action";
	//物料批号粉色弹框
	var ismesProBatch;
	$.ajax({
		type:'POST',
		url:url,
		async : false,
		success:function(msg){
			if(msg!=null){
				ismesProBatch=msg.result;
			}
		}
	});
	if(ismesProBatch){//启用物料批号
		if(batchNumObjText==""){
			$("#batchingMaterialPart_batchNumObj_batchText").css("background-color","#fcd6d6");	//input背景粉色
			$("#batchingMaterialPart_batchNumObj_batchTextdiv").css("background-color","#fcd6d6");	//div背景粉色
			$("#batchingMaterialPart_batchNumObj_batchTextdiv").css("border","1px solid red");//边框红色
			//实际物料批号不能为空
			//workbenchErrorBarWidget.showMessage("${getText('WOM.showMessage00000038')}","f");
			WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_formDialogErrorBarWidget.showMessage("${getText('WOM.showMessage00000038')}","f");
			return false;
		}
	}
	//配料数量大于0
	var doneNum = $("#batchingMaterialPart_doneNum").val();
	if(doneNum != "" && parseFloat(doneNum) <= 0){
		$("#batchingMaterialPart_doneNum").css("background-color","#fcd6d6");	//input背景粉色
		$("#batchingMaterialPart_doneNum").parent("div").css("background-color","#fcd6d6");	//div背景粉色
		$("#batchingMaterialPart_doneNum").parent("div").css("border","1px solid red");//边框红色	
		
		WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_formDialogErrorBarWidget.showMessage("配料数量需大于0","f");
		return false;
	}
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.initCount = 0;
	WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#WOM_batchMaterialEdit_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_datagrids');	
		var	conHeight = h-$("#WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_main_div .edit-panes-s").each(function(index){
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
							if(WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.initCount <= 2) {
								setTimeout(function(){WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.initSize();}, 200);
								WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.initCount++;
							}/* else {
								WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.initCount = 0;
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
		WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.initSize(index);
		});
		$(window).bind("dialog.resize",function(){WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.initSize();});
	});
</script>
<script type="text/javascript">
	
function  batchObjCallback(obj){
		//var obj=ec_WOM_standingcropRef_standingcropRef_batchNumOneBatRef_queryWidget.getSelectedRow();
		console.log(obj);
		//将批号回填到物料批号文本,非空由批号文本判断
		$("input[name='batchingMaterialPart.batchNum']").val(obj[0].batchText); 
		//仓库id,编码,名称     
		$("input[name='batchingMaterialPart.wareID.id']").val(obj[0].wareID.id); 
		$("input[name='batchingMaterialPart.wareID.wareCode']").val(obj[0].wareID.wareCode); 
		$("input[name='batchingMaterialPart.wareID.wareName']").val(obj[0].wareID.wareName); 	
		//货位编码,货位名称  batchingMaterialPart.storeID.placeSetCode
		$("input[name='batchingMaterialPart.storeID.id']").val(obj[0].placeSet.id); 	
		$("input[name='batchingMaterialPart.storeID.placeSetCode']").val(obj[0].placeSet.placeSetCode); 	
		$("input[name='batchingMaterialPart.storeID.placeSetName']").val(obj[0].placeSet.placeSetName); 	
		//货位状态id,value
		$("input[name='batchingMaterialPart.wareID.cargoStatue.id']").val(obj[0].wareID.cargoStatue.id); 	
		$("input[name='batchingMaterialPart.wareID.cargoStatue.value']").val(obj[0].wareID.cargoStatue.value);
	
}

	/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_batchingMaterial_batchMaterialEdit,js,WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart,WOM_7.5.0.0) */
// 自定义代码
  	var isMesProBatch;//是否启用MES物料管理
/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>