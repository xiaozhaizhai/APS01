<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1487593876403')}</title>
<@maincss/>
<@mainjs/>
</head>

<body id="dialog_page">
<@loadpanel></@loadpanel>
<@errorbar id="workbenchErrorBar" offsetY=0></@errorbar>
</#if>


<style type="text/css">
.ewc-dialog-el{height:100%;} 
.ewc-dialog-el .edit-table{width:98%;margin:0 auto;}
</style>
<script type="text/javascript">
	CUI.ns('RM.formula.formulaProcessActive.otherActivaEdit');
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
<#assign callbackName ="RM.formula.formulaProcessActive.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="RM_formula_formulaProcessActive_otherActivaEdit_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="RM_formula_formulaProcessActive_otherActivaEdit_form" cssStyle="height:100%;" hiddenField="formulaProcessActive.qualityStandard.id,formulaProcessActive.id,formulaProcessActive.product.id,formulaProcessActive.testProduct.id," onsubmitMethod="RM.formula.formulaProcessActive.otherActivaEdit.beforeSubmitMethod()" ecAction="/RM/formula/formulaProcessActive/otherActivaEdit/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="otherActivaEdit">
	<input type="hidden" name="viewCode" value="RM_7.5.0.0_formula_otherActivaEdit">
	<input type="hidden" name="datagridKey" value="RM_formula_formulaProcessActive_otherActivaEdit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="formulaProcessActive.version" value="${(formulaProcessActive.version)!0}" />
	<input type="hidden" name="formulaProcessActive.extraCol" value='' />
		<input type="hidden" name="formulaProcessActive.qualityStandard.id" value="${(formulaProcessActive.qualityStandard.id)!""}"/>
		<input type="hidden" name="formulaProcessActive.id" value="${(formulaProcessActive.id)!""}"/>
		<input type="hidden" name="formulaProcessActive.product.id" value="${(formulaProcessActive.product.id)!""}"/>
		<input type="hidden" name="formulaProcessActive.testProduct.id" value="${(formulaProcessActive.testProduct.id)!""}"/>
	<div id="RM_otherActivaEdit_edit_div" style="height:100%">
		<div id="RM_formula_formulaProcessActive_otherActivaEdit_main_div" class="edit-content-dialog">
<script type="text/javascript">
var attcountid = "RM_formula_formulaProcessActive_otherActivaEdit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=RM_7.5.0.0_formula', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>			<div class="edit-panes" style="margin-top:0px;padding:0px;">
				<div>
				<div class="edit-panes-w">

<div class="edit-panes-s" style="width:98%;margin-left:10px;">
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr class="dialog_tr">
				
							 					<#if !RM_7_5_0_0_formula_FormulaProcessActive_name_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_name_permit = checkFieldPermission('formulaProcessActive.name','RM_7.5.0.0_formula_FormulaProcessActive','RM_7.5.0.0_formula_FormulaProcessActive_name')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_name_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_FormulaProcessActive_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487330156499')}" >${getText('RM.propertydisplayName.randon1487330156499')}</label>
				</td>
				
						<#assign formulaProcessActive_name_defaultValue  = ''>
							 							<#assign formulaProcessActive_name_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_FormulaProcessActive_name_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_name_permit = checkFieldPermission('formulaProcessActive.name','RM_7.5.0.0_formula_FormulaProcessActive','RM_7.5.0.0_formula_FormulaProcessActive_name')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_name_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_FormulaProcessActive_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if RM_7_5_0_0_formula_FormulaProcessActive_name_permit == 1>-readonly</#if>">
								<input property_type="TEXT" name="formulaProcessActive.name" id="formulaProcessActive_name"  style=";" originalvalue="<#if !newObj || (formulaProcessActive.name)?has_content>${(formulaProcessActive.name?html)!}<#else>${formulaProcessActive_name_defaultValue!}</#if>" value="<#if !newObj || (formulaProcessActive.name)?has_content>${(formulaProcessActive.name?html)!}<#else>${formulaProcessActive_name_defaultValue!}</#if>" type="text" class="cui-noborder-input "<#if RM_7_5_0_0_formula_FormulaProcessActive_name_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !RM_7_5_0_0_formula_FormulaProcessActive_activeType_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_activeType_permit = checkFieldPermission('formulaProcessActive.activeType','RM_7.5.0.0_formula_FormulaProcessActive','RM_7.5.0.0_formula_FormulaProcessActive_activeType')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_activeType_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_FormulaProcessActive_activeType_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487330759313')}" >${getText('RM.propertydisplayName.randon1487330759313')}</label>
				</td>
				
						<#assign formulaProcessActive_activeType_defaultValue  = ''>
							 							<#assign formulaProcessActive_activeType_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_FormulaProcessActive_activeType_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_activeType_permit = checkFieldPermission('formulaProcessActive.activeType','RM_7.5.0.0_formula_FormulaProcessActive','RM_7.5.0.0_formula_FormulaProcessActive_activeType')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_activeType_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_FormulaProcessActive_activeType_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if newObj>
									<#if RM_7_5_0_0_formula_FormulaProcessActive_activeType_permit == 1>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange="activityTypeChange()" viewType="${viewType!}" deValue="${formulaProcessActive_activeType_defaultValue!}" formId="RM_formula_formulaProcessActive_otherActivaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formulaProcessActive.activeType.id" code="activeType" value="${(formulaProcessActive.activeType.id)!}"  />
									<#else>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange="activityTypeChange()"  viewType="${viewType!}" deValue="${formulaProcessActive_activeType_defaultValue!}" formId="RM_formula_formulaProcessActive_otherActivaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formulaProcessActive.activeType.id" code="activeType" value="${(formulaProcessActive.activeType.id)!}"  />
									</#if>
								<#else>
									<#if RM_7_5_0_0_formula_FormulaProcessActive_activeType_permit == 1>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange="activityTypeChange()"  viewType="${viewType!}"  formId="RM_formula_formulaProcessActive_otherActivaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formulaProcessActive.activeType.id" code="activeType" value="${(formulaProcessActive.activeType.id)!}"  />
									<#else>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange="activityTypeChange()"  viewType="${viewType!}"  formId="RM_formula_formulaProcessActive_otherActivaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formulaProcessActive.activeType.id" code="activeType" value="${(formulaProcessActive.activeType.id)!}"  />
									</#if>
								</#if>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
							 					<#if !RM_7_5_0_0_formula_FormulaProcessActive_occurTurn_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_occurTurn_permit = checkFieldPermission('formulaProcessActive.occurTurn','RM_7.5.0.0_formula_FormulaProcessActive','RM_7.5.0.0_formula_FormulaProcessActive_occurTurn')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_occurTurn_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_FormulaProcessActive_occurTurn_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487330199423')}" >${getText('RM.propertydisplayName.randon1487330199423')}</label>
				</td>
				
						<#assign formulaProcessActive_occurTurn_defaultValue  = ''>
							 							<#assign formulaProcessActive_occurTurn_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_FormulaProcessActive_occurTurn_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_occurTurn_permit = checkFieldPermission('formulaProcessActive.occurTurn','RM_7.5.0.0_formula_FormulaProcessActive','RM_7.5.0.0_formula_FormulaProcessActive_occurTurn')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_occurTurn_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_FormulaProcessActive_occurTurn_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if newObj>
									<#if RM_7_5_0_0_formula_FormulaProcessActive_occurTurn_permit == 1>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange="" viewType="${viewType!}" deValue="${formulaProcessActive_occurTurn_defaultValue!}" formId="RM_formula_formulaProcessActive_otherActivaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formulaProcessActive.occurTurn.id" code="occurTurn" value="${(formulaProcessActive.occurTurn.id)!}"  />
									<#else>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${formulaProcessActive_occurTurn_defaultValue!}" formId="RM_formula_formulaProcessActive_otherActivaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formulaProcessActive.occurTurn.id" code="occurTurn" value="${(formulaProcessActive.occurTurn.id)!}"  />
									</#if>
								<#else>
									<#if RM_7_5_0_0_formula_FormulaProcessActive_occurTurn_permit == 1>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formulaProcessActive_otherActivaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formulaProcessActive.occurTurn.id" code="occurTurn" value="${(formulaProcessActive.occurTurn.id)!}"  />
									<#else>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formulaProcessActive_otherActivaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formulaProcessActive.occurTurn.id" code="occurTurn" value="${(formulaProcessActive.occurTurn.id)!}"  />
									</#if>
								</#if>
							</#if>
				</td>
				
							 					<#if !RM_7_5_0_0_formula_FormulaProcessActive_exeOrder_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_exeOrder_permit = checkFieldPermission('formulaProcessActive.exeOrder','RM_7.5.0.0_formula_FormulaProcessActive','RM_7.5.0.0_formula_FormulaProcessActive_exeOrder')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_exeOrder_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_FormulaProcessActive_exeOrder_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487330171009')}" >${getText('RM.propertydisplayName.randon1487330171009')}</label>
				</td>
				
						<#assign formulaProcessActive_exeOrder_defaultValue  = ''>
							 							<#assign formulaProcessActive_exeOrder_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_FormulaProcessActive_exeOrder_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_exeOrder_permit = checkFieldPermission('formulaProcessActive.exeOrder','RM_7.5.0.0_formula_FormulaProcessActive','RM_7.5.0.0_formula_FormulaProcessActive_exeOrder')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_exeOrder_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="2" style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_FormulaProcessActive_exeOrder_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if RM_7_5_0_0_formula_FormulaProcessActive_exeOrder_permit == 1>-readonly</#if>">
								<input property_type="INTEGER" name="formulaProcessActive.exeOrder" id="formulaProcessActive_exeOrder"  style=";" originalvalue="<#if !newObj || (formulaProcessActive.exeOrder)?has_content>${(formulaProcessActive.exeOrder?html)!}<#else>${formulaProcessActive_exeOrder_defaultValue!}</#if>" value="<#if !newObj || (formulaProcessActive.exeOrder)?has_content>${(formulaProcessActive.exeOrder?html)!}<#else>${formulaProcessActive_exeOrder_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField"<#if RM_7_5_0_0_formula_FormulaProcessActive_exeOrder_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
							 					<#if !RM_7_5_0_0_formula_FormulaProcessActive_longTime_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_longTime_permit = checkFieldPermission('formulaProcessActive.longTime','RM_7.5.0.0_formula_FormulaProcessActive','RM_7.5.0.0_formula_FormulaProcessActive_longTime')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_longTime_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_FormulaProcessActive_longTime_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487330334270')}" >${getText('RM.propertydisplayName.randon1487330334270')}</label>
				</td>
				
						<#assign formulaProcessActive_longTime_defaultValue  = ''>
							 							<#assign formulaProcessActive_longTime_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_FormulaProcessActive_longTime_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_longTime_permit = checkFieldPermission('formulaProcessActive.longTime','RM_7.5.0.0_formula_FormulaProcessActive','RM_7.5.0.0_formula_FormulaProcessActive_longTime')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_longTime_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="2" style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_FormulaProcessActive_longTime_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if RM_7_5_0_0_formula_FormulaProcessActive_longTime_permit == 1>-readonly</#if>">
									<input name="formulaProcessActive.longTime" id="formulaProcessActive_longTime"  style=";" originalvalue="<#if newObj&& !(formulaProcessActive.longTime)?has_content>${formulaProcessActive_longTime_defaultValue!}<#elseif (formulaProcessActive.longTime)?has_content>#{(formulaProcessActive.longTime)!; m6M6}</#if>" value="<#if newObj&& !(formulaProcessActive.longTime)?has_content>${formulaProcessActive_longTime_defaultValue!}<#elseif (formulaProcessActive.longTime)?has_content>#{(formulaProcessActive.longTime)!; m6M6}</#if>" type="text" class="cui-noborder-input numberField"<#if RM_7_5_0_0_formula_FormulaProcessActive_longTime_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#formulaProcessActive_longTime').unbind('blur').bind('blur',function(){
										var percision = 6;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("RM.propertydisplayName.randon1487330334270")}')}");
											return;
										}
										if(parseInt(percision) > -1 && $(this).val()!=undefined && $(this).val()!='' && isDecimal($(this).val())){
											$(this).val(($(this).val() * 1).toFixed(percision));
										}
									});
								});
							</script>
							</#if>
				</td>
				
												<#if !RM_7_5_0_0_formula_FormulaProcessActive_product_MESBasic_1_product_Product_productName_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_product_MESBasic_1_product_Product_productName_permit = checkFieldPermission('formulaProcessActive.product.productName','RM_7.5.0.0_formula_FormulaProcessActive','MESBasic_1_product_Product_productName')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_product_MESBasic_1_product_Product_productName_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_FormulaProcessActive_product_MESBasic_1_product_Product_productName_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415772740737')}" >${getText('MESBasic.propertydisplayName.radion1415772740737')}</label>
				</td>
				
						<#assign formulaProcessActive_product_productName_defaultValue  = ''>
														<#assign formulaProcessActive_product_productName_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_FormulaProcessActive_product_MESBasic_1_product_Product_productName_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_product_MESBasic_1_product_Product_productName_permit = checkFieldPermission('formulaProcessActive.product.productName','RM_7.5.0.0_formula_FormulaProcessActive','MESBasic_1_product_Product_productName')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_product_MESBasic_1_product_Product_productName_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_FormulaProcessActive_product_MESBasic_1_product_Product_productName_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								
								
								<#if RM_7_5_0_0_formula_FormulaProcessActive_product_MESBasic_1_product_Product_productName_permit == 1>
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}" conditionfunc="RM.formula.formulaProcessActive.otherActivaEdit._querycustomFunc('formulaProcessActive_product_productName')" view=true value="${(formulaProcessActive.product.productName)!}" displayFieldName="productName" name="formulaProcessActive.product.productName" id="formulaProcessActive_product_productName" type="other" url="/MESBasic/product/product/productRefNew.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formulaProcessActive_otherActivaEdit_form" editCustomCallback=";" onkeyupfuncname=";_callback_formulaProcessActive_product_productName(obj);" cssStyle="" isEdit=true   refViewCode="MESBasic_1_product_productRefNew"  isCrossCompany=false />
								<#else>
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}" viewType="${viewType!}" deValue="${formulaProcessActive_product_productName_defaultValue!}" conditionfunc="RM.formula.formulaProcessActive.otherActivaEdit._querycustomFunc('formulaProcessActive_product_productName')"  value="${(formulaProcessActive.product.productName)!}" displayFieldName="productName" name="formulaProcessActive.product.productName" id="formulaProcessActive_product_productName" type="other" url="/MESBasic/product/product/productRefNew.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formulaProcessActive_otherActivaEdit_form" editCustomCallback=";" refViewCode="MESBasic_1_product_productRefNew" onkeyupfuncname=";_callback_formulaProcessActive_product_productName(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								</#if>
								
								
								<script type="text/javascript">
								<#if !(formulaProcessActive.id)?? && (formulaProcessActive.product.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formulaProcessActive.product.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_formulaProcessActive_otherActivaEdit_form',obj, 'formulaProcessActive.product', '/MESBasic/product/product/productRefNew.action');
												CUI.commonFills('RM_formula_formulaProcessActive_otherActivaEdit_form', 'formulaProcessActive.product',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
							 					<#if !RM_7_5_0_0_formula_FormulaProcessActive_isReplace_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_isReplace_permit = checkFieldPermission('formulaProcessActive.isReplace','RM_7.5.0.0_formula_FormulaProcessActive','RM_7.5.0.0_formula_FormulaProcessActive_isReplace')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_isReplace_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_FormulaProcessActive_isReplace_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487331060176')}" >${getText('RM.propertydisplayName.randon1487331060176')}</label>
				</td>
				
						<#assign formulaProcessActive_isReplace_defaultValue  = ''>
							 							<#assign formulaProcessActive_isReplace_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_FormulaProcessActive_isReplace_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_isReplace_permit = checkFieldPermission('formulaProcessActive.isReplace','RM_7.5.0.0_formula_FormulaProcessActive','RM_7.5.0.0_formula_FormulaProcessActive_isReplace')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_isReplace_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_FormulaProcessActive_isReplace_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if RM_7_5_0_0_formula_FormulaProcessActive_isReplace_permit == 1>
									<div class="fix-search-click">
										<select property_type="BOOLEAN" class="edit-select"  originalvalue="<#if !newObj || (formulaProcessActive.isReplace)?has_content>${(formulaProcessActive.isReplace!false)?string('true','false')}<#elseif formulaProcessActive_isReplace_defaultValue?has_content>${(formulaProcessActive_isReplace_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj || (formulaProcessActive.isReplace)?has_content>${(formulaProcessActive.isReplace!false)?string('true','false')}<#else>${(formulaProcessActive_isReplace_defaultValue!true)?string}</#if>" style=";" name="formulaProcessActive.isReplace" onchange='isType()'> 
											<option value=""></option>
											<#if (newObj?? && !newObj)||(formulaProcessActive.isReplace)?has_content>
											<option value="true" <#if (formulaProcessActive.isReplace!false)?string('true','false')=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="false" <#if (formulaProcessActive.isReplace!false)?string('true','false')=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
											<#else>
											<option value="true" <#if (formulaProcessActive_isReplace_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="false" <#if (formulaProcessActive_isReplace_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
											</#if>
										</select>
									</div>
									<script type="text/javascript">
										$(function(){
											$('select[name="formulaProcessActive.isReplace"]').disabledSelect();
										});
									</script>
								<#else>
									<div class="fix-search-click">
										<select property_type="BOOLEAN" class="edit-select" originalvalue="<#if !newObj || (formulaProcessActive.isReplace)?has_content>${(formulaProcessActive.isReplace!false)?string('true','false')}<#elseif formulaProcessActive_isReplace_defaultValue?has_content>${(formulaProcessActive_isReplace_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj || (formulaProcessActive.isReplace)?has_content>${(formulaProcessActive.isReplace!false)?string('true','false')}<#else>${(formulaProcessActive_isReplace_defaultValue!true)?string}</#if>" style=";" name="formulaProcessActive.isReplace" onchange='isType()'> 
											<option value=""></option>
											<#if (newObj?? && !newObj)||(formulaProcessActive.isReplace)?has_content>
											<option value="true" <#if (formulaProcessActive.isReplace!false)?string('true','false')=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="false" <#if (formulaProcessActive.isReplace!false)?string('true','false')=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
											<#else>
											<option value="true" <#if (formulaProcessActive_isReplace_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="false" <#if (formulaProcessActive_isReplace_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
											</#if>
										</select>
									</div>
							</#if>
							</#if>
				</td>
				
							 					<#if !RM_7_5_0_0_formula_FormulaProcessActive_standardQuantity_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_standardQuantity_permit = checkFieldPermission('formulaProcessActive.standardQuantity','RM_7.5.0.0_formula_FormulaProcessActive','RM_7.5.0.0_formula_FormulaProcessActive_standardQuantity')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_standardQuantity_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_FormulaProcessActive_standardQuantity_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487331086583')}" >${getText('RM.propertydisplayName.randon1487331086583')}</label>
				</td>
				
						<#assign formulaProcessActive_standardQuantity_defaultValue  = ''>
							 							<#assign formulaProcessActive_standardQuantity_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_FormulaProcessActive_standardQuantity_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_standardQuantity_permit = checkFieldPermission('formulaProcessActive.standardQuantity','RM_7.5.0.0_formula_FormulaProcessActive','RM_7.5.0.0_formula_FormulaProcessActive_standardQuantity')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_standardQuantity_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="2" style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_FormulaProcessActive_standardQuantity_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if RM_7_5_0_0_formula_FormulaProcessActive_standardQuantity_permit == 1>-readonly</#if>">
									<input name="formulaProcessActive.standardQuantity" id="formulaProcessActive_standardQuantity"  style=";" originalvalue="<#if newObj&& !(formulaProcessActive.standardQuantity)?has_content>${formulaProcessActive_standardQuantity_defaultValue!}<#elseif (formulaProcessActive.standardQuantity)?has_content>#{(formulaProcessActive.standardQuantity)!; m6M6}</#if>" value="<#if newObj&& !(formulaProcessActive.standardQuantity)?has_content>${formulaProcessActive_standardQuantity_defaultValue!}<#elseif (formulaProcessActive.standardQuantity)?has_content>#{(formulaProcessActive.standardQuantity)!; m6M6}</#if>" type="text" class="cui-noborder-input numberField"<#if RM_7_5_0_0_formula_FormulaProcessActive_standardQuantity_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#formulaProcessActive_standardQuantity').unbind('blur').bind('blur',function(){
										var percision = 6;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("RM.propertydisplayName.randon1487331086583")}')}");
											return;
										}
										if(parseInt(percision) > -1 && $(this).val()!=undefined && $(this).val()!='' && isDecimal($(this).val())){
											$(this).val(($(this).val() * 1).toFixed(percision));
										}
									});
								});
							</script>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
							 					<#if !RM_7_5_0_0_formula_FormulaProcessActive_auto_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_auto_permit = checkFieldPermission('formulaProcessActive.auto','RM_7.5.0.0_formula_FormulaProcessActive','RM_7.5.0.0_formula_FormulaProcessActive_auto')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_auto_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_FormulaProcessActive_auto_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487331130107')}" >${getText('RM.propertydisplayName.randon1487331130107')}</label>
				</td>
				
						<#assign formulaProcessActive_auto_defaultValue  = ''>
							 							<#assign formulaProcessActive_auto_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_FormulaProcessActive_auto_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_auto_permit = checkFieldPermission('formulaProcessActive.auto','RM_7.5.0.0_formula_FormulaProcessActive','RM_7.5.0.0_formula_FormulaProcessActive_auto')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_auto_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_FormulaProcessActive_auto_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
									<div class="fix-search-click">
										<select property_type="BOOLEAN" class="edit-select" originalvalue="<#if !newObj || (formulaProcessActive.auto)?has_content>${(formulaProcessActive.auto!false)?string('true','false')}<#elseif formulaProcessActive_auto_defaultValue?has_content>${(formulaProcessActive_auto_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj || (formulaProcessActive.auto)?has_content>${(formulaProcessActive.auto!false)?string('true','false')}<#else>${(formulaProcessActive_auto_defaultValue!true)?string}</#if>" style=";" name="formulaProcessActive.auto" > 
											<option value=""></option>
											<#if (newObj?? && !newObj)||(formulaProcessActive.auto)?has_content>
											<option value="true" <#if (formulaProcessActive.auto!false)?string('true','false')=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="false" <#if (formulaProcessActive.auto!false)?string('true','false')=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
											<#else>
											<option value="true" <#if (formulaProcessActive_auto_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="false" <#if (formulaProcessActive_auto_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
											</#if>
										</select>
									</div>
									<script type="text/javascript">
										$(function(){
											$('select[name="formulaProcessActive.auto"]').disabledSelect();
										});
									</script>
							</#if>
				</td>
				
							 					<#if !RM_7_5_0_0_formula_FormulaProcessActive_exeBillName_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_exeBillName_permit = checkFieldPermission('formulaProcessActive.exeBillName','RM_7.5.0.0_formula_FormulaProcessActive','RM_7.5.0.0_formula_FormulaProcessActive_exeBillName')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_exeBillName_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_FormulaProcessActive_exeBillName_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487331143778')}" >${getText('RM.propertydisplayName.randon1487331143778')}</label>
				</td>
				
						<#assign formulaProcessActive_exeBillName_defaultValue  = ''>
							 							<#assign formulaProcessActive_exeBillName_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_FormulaProcessActive_exeBillName_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_exeBillName_permit = checkFieldPermission('formulaProcessActive.exeBillName','RM_7.5.0.0_formula_FormulaProcessActive','RM_7.5.0.0_formula_FormulaProcessActive_exeBillName')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_exeBillName_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="2" style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_FormulaProcessActive_exeBillName_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if RM_7_5_0_0_formula_FormulaProcessActive_exeBillName_permit == 1>-readonly</#if>">
								<input property_type="TEXT" name="formulaProcessActive.exeBillName" id="formulaProcessActive_exeBillName"  style=";" originalvalue="<#if !newObj || (formulaProcessActive.exeBillName)?has_content>${(formulaProcessActive.exeBillName?html)!}<#else>${formulaProcessActive_exeBillName_defaultValue!}</#if>" value="<#if !newObj || (formulaProcessActive.exeBillName)?has_content>${(formulaProcessActive.exeBillName?html)!}<#else>${formulaProcessActive_exeBillName_defaultValue!}</#if>" type="text" class="cui-noborder-input "<#if RM_7_5_0_0_formula_FormulaProcessActive_exeBillName_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
												<#if !RM_7_5_0_0_formula_FormulaProcessActive_testProduct_RM_7_5_0_0_testProj_TestProj_name_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_testProduct_RM_7_5_0_0_testProj_TestProj_name_permit = checkFieldPermission('formulaProcessActive.testProduct.name','RM_7.5.0.0_formula_FormulaProcessActive','RM_7.5.0.0_testProj_TestProj_name')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_testProduct_RM_7_5_0_0_testProj_TestProj_name_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_FormulaProcessActive_testProduct_RM_7_5_0_0_testProj_TestProj_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.entityname.randon1487596283533')}" >${getText('RM.entityname.randon1487596283533')}</label>
				</td>
				
						<#assign formulaProcessActive_testProduct_name_defaultValue  = ''>
														<#assign formulaProcessActive_testProduct_name_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_FormulaProcessActive_testProduct_RM_7_5_0_0_testProj_TestProj_name_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_testProduct_RM_7_5_0_0_testProj_TestProj_name_permit = checkFieldPermission('formulaProcessActive.testProduct.name','RM_7.5.0.0_formula_FormulaProcessActive','RM_7.5.0.0_testProj_TestProj_name')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_testProduct_RM_7_5_0_0_testProj_TestProj_name_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="2" style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_FormulaProcessActive_testProduct_RM_7_5_0_0_testProj_TestProj_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								
								
								<#if RM_7_5_0_0_formula_FormulaProcessActive_testProduct_RM_7_5_0_0_testProj_TestProj_name_permit == 1>
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('RM.viewtitle.randon1487596519107')}" conditionfunc="RM.formula.formulaProcessActive.otherActivaEdit._querycustomFunc('formulaProcessActive_testProduct_name')" view=true value="${(formulaProcessActive.testProduct.name)!}" displayFieldName="name" name="formulaProcessActive.testProduct.name" id="formulaProcessActive_testProduct_name" type="other" url="/RM/testProj/testProj/testProjSIRef.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formulaProcessActive_otherActivaEdit_form" editCustomCallback=";" onkeyupfuncname=";_callback_formulaProcessActive_testProduct_name(obj);" cssStyle="" isEdit=true  refViewCode="RM_7.5.0.0_testProj_testProjSIRef"   isCrossCompany=false  />
								<#else>
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('RM.viewtitle.randon1487596519107')}" viewType="${viewType!}" deValue="${formulaProcessActive_testProduct_name_defaultValue!}" conditionfunc="RM.formula.formulaProcessActive.otherActivaEdit._querycustomFunc('formulaProcessActive_testProduct_name')"  value="${(formulaProcessActive.testProduct.name)!}" displayFieldName="name" name="formulaProcessActive.testProduct.name" id="formulaProcessActive_testProduct_name" type="other" url="/RM/testProj/testProj/testProjSIRef.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formulaProcessActive_otherActivaEdit_form" editCustomCallback=";" refViewCode="RM_7.5.0.0_testProj_testProjSIRef"  onkeyupfuncname=";_callback_formulaProcessActive_testProduct_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								</#if>
								
								
								<script type="text/javascript">
								<#if !(formulaProcessActive.id)?? && (formulaProcessActive.testProduct.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formulaProcessActive.testProduct.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_formulaProcessActive_otherActivaEdit_form',obj, 'formulaProcessActive.testProduct', '/RM/testProj/testProj/testProjSIRef.action');
												CUI.commonFills('RM_formula_formulaProcessActive_otherActivaEdit_form', 'formulaProcessActive.testProduct',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							</#if>
				</td>
				
												<#if !RM_7_5_0_0_formula_FormulaProcessActive_qualityStandard_RM_7_5_0_0_qualityStandard_Stand_name_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_qualityStandard_RM_7_5_0_0_qualityStandard_Stand_name_permit = checkFieldPermission('formulaProcessActive.qualityStandard.name','RM_7.5.0.0_formula_FormulaProcessActive','RM_7.5.0.0_qualityStandard_Stand_name')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_qualityStandard_RM_7_5_0_0_qualityStandard_Stand_name_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_FormulaProcessActive_qualityStandard_RM_7_5_0_0_qualityStandard_Stand_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.entityname.randon1487594970448')}" >${getText('RM.entityname.randon1487594970448')}</label>
				</td>
				
						<#assign formulaProcessActive_qualityStandard_name_defaultValue  = ''>
														<#assign formulaProcessActive_qualityStandard_name_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_FormulaProcessActive_qualityStandard_RM_7_5_0_0_qualityStandard_Stand_name_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_qualityStandard_RM_7_5_0_0_qualityStandard_Stand_name_permit = checkFieldPermission('formulaProcessActive.qualityStandard.name','RM_7.5.0.0_formula_FormulaProcessActive','RM_7.5.0.0_qualityStandard_Stand_name')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_qualityStandard_RM_7_5_0_0_qualityStandard_Stand_name_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="2" style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_FormulaProcessActive_qualityStandard_RM_7_5_0_0_qualityStandard_Stand_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								
								
								<#if RM_7_5_0_0_formula_FormulaProcessActive_qualityStandard_RM_7_5_0_0_qualityStandard_Stand_name_permit == 1>
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('RM.viewtitle.randon1487596068024')}" conditionfunc="RM.formula.formulaProcessActive.otherActivaEdit._querycustomFunc('formulaProcessActive_qualityStandard_name')" view=true value="${(formulaProcessActive.qualityStandard.name)!}" displayFieldName="name" name="formulaProcessActive.qualityStandard.name" id="formulaProcessActive_qualityStandard_name" type="other" url="/RM/qualityStandard/stand/standRef.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formulaProcessActive_otherActivaEdit_form" editCustomCallback=";" onkeyupfuncname=";_callback_formulaProcessActive_qualityStandard_name(obj);" cssStyle="" isEdit=true  refViewCode="RM_7.5.0.0_qualityStandard_standRef"   isCrossCompany=false  />
								<#else>
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('RM.viewtitle.randon1487596068024')}" viewType="${viewType!}" deValue="${formulaProcessActive_qualityStandard_name_defaultValue!}" conditionfunc="RM.formula.formulaProcessActive.otherActivaEdit._querycustomFunc('formulaProcessActive_qualityStandard_name')"  value="${(formulaProcessActive.qualityStandard.name)!}" displayFieldName="name" name="formulaProcessActive.qualityStandard.name" id="formulaProcessActive_qualityStandard_name" type="other" url="/RM/qualityStandard/stand/standRef.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formulaProcessActive_otherActivaEdit_form" editCustomCallback=";" refViewCode="RM_7.5.0.0_qualityStandard_standRef"  onkeyupfuncname=";_callback_formulaProcessActive_qualityStandard_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								</#if>
								
								
								<script type="text/javascript">
								<#if !(formulaProcessActive.id)?? && (formulaProcessActive.qualityStandard.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formulaProcessActive.qualityStandard.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_formulaProcessActive_otherActivaEdit_form',obj, 'formulaProcessActive.qualityStandard', '/RM/qualityStandard/stand/standRef.action');
												CUI.commonFills('RM_formula_formulaProcessActive_otherActivaEdit_form', 'formulaProcessActive.qualityStandard',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
							 					<#if !RM_7_5_0_0_formula_FormulaProcessActive_processHiddenId_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_processHiddenId_permit = checkFieldPermission('formulaProcessActive.processHiddenId','RM_7.5.0.0_formula_FormulaProcessActive','RM_7.5.0.0_formula_FormulaProcessActive_processHiddenId')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_processHiddenId_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
							<label style="<#if RM_7_5_0_0_formula_FormulaProcessActive_processHiddenId_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487812534269')}" >${getText('RM.propertydisplayName.randon1487812534269')}</label>
				</td>
				
						<#assign formulaProcessActive_processHiddenId_defaultValue  = ''>
							 							<#assign formulaProcessActive_processHiddenId_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_FormulaProcessActive_processHiddenId_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_processHiddenId_permit = checkFieldPermission('formulaProcessActive.processHiddenId','RM_7.5.0.0_formula_FormulaProcessActive','RM_7.5.0.0_formula_FormulaProcessActive_processHiddenId')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_processHiddenId_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="2" align="left" style="text-align: left;display:none;;" >
							<#if RM_7_5_0_0_formula_FormulaProcessActive_processHiddenId_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if RM_7_5_0_0_formula_FormulaProcessActive_processHiddenId_permit == 1>-readonly</#if>">
								<input property_type="LONG" name="formulaProcessActive.processHiddenId" id="formulaProcessActive_processHiddenId"  style=";" originalvalue="<#if !newObj || (formulaProcessActive.processHiddenId)?has_content>${(formulaProcessActive.processHiddenId?html)!}<#else>${formulaProcessActive_processHiddenId_defaultValue!}</#if>" value="<#if !newObj || (formulaProcessActive.processHiddenId)?has_content>${(formulaProcessActive.processHiddenId?html)!}<#else>${formulaProcessActive_processHiddenId_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField"<#if RM_7_5_0_0_formula_FormulaProcessActive_processHiddenId_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !RM_7_5_0_0_formula_FormulaProcessActive_processTableId_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_processTableId_permit = checkFieldPermission('formulaProcessActive.processTableId','RM_7.5.0.0_formula_FormulaProcessActive','RM_7.5.0.0_formula_FormulaProcessActive_processTableId')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_processTableId_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
							<label style="<#if RM_7_5_0_0_formula_FormulaProcessActive_processTableId_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487812507672')}" >${getText('RM.propertydisplayName.randon1487812507672')}</label>
				</td>
				
						<#assign formulaProcessActive_processTableId_defaultValue  = ''>
							 							<#assign formulaProcessActive_processTableId_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_FormulaProcessActive_processTableId_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_processTableId_permit = checkFieldPermission('formulaProcessActive.processTableId','RM_7.5.0.0_formula_FormulaProcessActive','RM_7.5.0.0_formula_FormulaProcessActive_processTableId')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_processTableId_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="2" align="left" style="text-align: left;display:none;;" >
							<#if RM_7_5_0_0_formula_FormulaProcessActive_processTableId_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if RM_7_5_0_0_formula_FormulaProcessActive_processTableId_permit == 1>-readonly</#if>">
								<input property_type="LONG" name="formulaProcessActive.processTableId" id="formulaProcessActive_processTableId"  style=";" originalvalue="<#if !newObj || (formulaProcessActive.processTableId)?has_content>${(formulaProcessActive.processTableId?html)!}<#else>${formulaProcessActive_processTableId_defaultValue!}</#if>" value="<#if !newObj || (formulaProcessActive.processTableId)?has_content>${(formulaProcessActive.processTableId?html)!}<#else>${formulaProcessActive_processTableId_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField"<#if RM_7_5_0_0_formula_FormulaProcessActive_processTableId_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
							 					<#if !RM_7_5_0_0_formula_FormulaProcessActive_meno_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_meno_permit = checkFieldPermission('formulaProcessActive.meno','RM_7.5.0.0_formula_FormulaProcessActive','RM_7.5.0.0_formula_FormulaProcessActive_meno')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_meno_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   rowspan="2" align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_FormulaProcessActive_meno_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487331194516')}" >${getText('RM.propertydisplayName.randon1487331194516')}</label>
				</td>
				
						<#assign formulaProcessActive_meno_defaultValue  = ''>
							 							<#assign formulaProcessActive_meno_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_FormulaProcessActive_meno_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcessActive_meno_permit = checkFieldPermission('formulaProcessActive.meno','RM_7.5.0.0_formula_FormulaProcessActive','RM_7.5.0.0_formula_FormulaProcessActive_meno')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcessActive_meno_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="5" rowspan="2" align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_FormulaProcessActive_meno_permit == 0>
							<div class="fix-input-readonly fix-ie7-textarea"><textarea property_type="TEXT" id="formulaProcessActive_meno" class="cui-noborder-textarea nopermit cui-textarea-auto" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"></textarea></div>
							<#else>
							<div class="fix-input<#if RM_7_5_0_0_formula_FormulaProcessActive_meno_permit == 1>-readonly</#if> fix-ie7-textarea"><textarea property_type="TEXT" id="formulaProcessActive_meno" originalvalue="<#if !newObj || (formulaProcessActive.meno)?has_content>${(formulaProcessActive.meno?html)!}<#else>${formulaProcessActive_meno_defaultValue?html}</#if>"  name="formulaProcessActive.meno" class="cui-noborder-textarea cui-textarea-auto"<#if RM_7_5_0_0_formula_FormulaProcessActive_meno_permit == 1> readonly=readonly</#if> style=";" ><#if !newObj || (formulaProcessActive.meno)?has_content>${(formulaProcessActive.meno)!}<#else>${formulaProcessActive_meno_defaultValue}</#if></textarea></div>
							</#if>
				</td>
		</tr>
	</table>
</div>				</div>	
				<div class="edit-datatable">	
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_otherActivaEdit,html,RM_7.5.0.0_formula_FormulaProcessActive,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	RM.formula.formulaProcessActive.otherActivaEdit.beforeSaveProcess = function(){}
	RM.formula.formulaProcessActive.otherActivaEdit.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(RM.formula.formulaProcessActive.otherActivaEdit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#RM_formula_formulaProcessActive_otherActivaEdit_form').trigger('beforeSubmit');
		//formulaProcessActive.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="formulaProcessActive.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#RM_formula_formulaProcessActive_otherActivaEdit_form ul.edit-tabs").tabs("div.edit-panes > div");
		});
	})(jQuery);
	RM.formula.formulaProcessActive.otherActivaEdit.validate = function(){
		return true;
	}
	
	
	//打印
	RM.formula.formulaProcessActive.otherActivaEdit.print = function(url){
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
		
		RM.formula.formulaProcessActive.otherActivaEdit.saveSetting = function(){
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
		RM.formula.formulaProcessActive.otherActivaEdit.printSetting = function(){
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
			RM.formula.formulaProcessActive.otherActivaEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(RM.formula.formulaProcessActive.otherActivaEdit.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				RM.formula.formulaProcessActive.otherActivaEdit.settingDialog.show();
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
			RM.formula.formulaProcessActive.otherActivaEdit._customCallBack = customCallBack;
		}
		RM.formula.formulaProcessActive.otherActivaEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#RM_formula_formulaProcessActive_otherActivaEdit_fileupload').length == 0) {
				$('body').append('<div id="RM_formula_formulaProcessActive_otherActivaEdit_fileupload"></div>');
			}
			RM.formula.formulaProcessActive.otherActivaEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "RM_formula_formulaProcessActive_otherActivaEdit_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#RM_formula_formulaProcessActive_otherActivaEdit_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			RM.formula.formulaProcessActive.otherActivaEdit.infoDialog.show();
			if($('#RM_formula_formulaProcessActive_otherActivaEdit_fileupload').html() == '') {
				$('#RM_formula_formulaProcessActive_otherActivaEdit_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=RM_formula_formulaProcessActive&entityCode=RM_7.5.0.0_formula&dialogId="+dialogId);
			}
		}
	//参照复制函数
	RM.formula.formulaProcessActive.otherActivaEdit.referenceCopy = function(objName,url, dialog){
		var callbackName ="RM.formula.formulaProcessActive.otherActivaEdit.referenceCopyBackInfo";
		RM.formula.formulaProcessActive.otherActivaEdit.dialog = dialog;
		RM.formula.formulaProcessActive.otherActivaEdit._dialog = foundation.common.select({
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
	
	RM.formula.formulaProcessActive.otherActivaEdit.referenceCopyBackInfo = function(obj){
		if(RM.formula.formulaProcessActive.otherActivaEdit._dialog){
			RM.formula.formulaProcessActive.otherActivaEdit._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,RM.formula.formulaProcessActive.otherActivaEdit.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('RM_formula_formulaProcessActive_otherActivaEdit_form','RM_formula_formulaProcessActive_otherActivaEdit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(RM.formula.formulaProcessActive.otherActivaEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(RM.formula.formulaProcessActive.otherActivaEdit.dialog._el).load('/RM/formula/formulaProcessActive/otherActivaEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( RM.formula.formulaProcessActive.otherActivaEdit.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + RM.formula.formulaProcessActive.otherActivaEdit.dialog._config.iframe, RM.formula.formulaProcessActive.otherActivaEdit.dialog._dialog ).prop( 'src', '/RM/formula/formulaProcessActive/otherActivaEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(RM.formula.formulaProcessActive.otherActivaEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(RM.formula.formulaProcessActive.otherActivaEdit.dialog._el).load('/RM/formula/formulaProcessActive/otherActivaEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	RM.formula.formulaProcessActive.otherActivaEdit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		RM.formula.formulaProcessActive.otherActivaEdit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		RM.formula.formulaProcessActive.otherActivaEdit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			RM.formula.formulaProcessActive.otherActivaEdit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	RM.formula.formulaProcessActive.otherActivaEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var frameName = 'RM_formula_formulaProcessActive_otherActivaEdit';
		var callbackName="";
		RM.formula.formulaProcessActive.otherActivaEdit._prefix = '';
		RM.formula.formulaProcessActive.otherActivaEdit._oGrid = oGrid;
		RM.formula.formulaProcessActive.otherActivaEdit._sUrl = url;
		if(customCallBack){
			RM.formula.formulaProcessActive.otherActivaEdit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			RM.formula.formulaProcessActive.otherActivaEdit.gridEventObj = gridEventObj;
			callbackName = "RM.formula.formulaProcessActive.otherActivaEdit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				RM.formula.formulaProcessActive.otherActivaEdit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "RM.formula.formulaProcessActive.otherActivaEdit.getMultiselectCallBackInfo_DG" : "RM.formula.formulaProcessActive.otherActivaEdit.getcallBackInfo_DG";
			RM.formula.formulaProcessActive.otherActivaEdit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				RM.formula.formulaProcessActive.otherActivaEdit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="RM.formula.formulaProcessActive.otherActivaEdit.getcallBackInfo";
		}
		if(RM.formula.formulaProcessActive.otherActivaEdit._prefix!=''){
			RM.formula.formulaProcessActive.otherActivaEdit._prefix = RM.formula.formulaProcessActive.otherActivaEdit._prefix.substring(1);
		}
		if(RM.formula.formulaProcessActive.otherActivaEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.formula.formulaProcessActive.otherActivaEdit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof RM.formula.formulaProcessActive.otherActivaEdit._querycustomFuncN == "function") {
				refparam += RM.formula.formulaProcessActive.otherActivaEdit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		RM.formula.formulaProcessActive.otherActivaEdit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.formula.formulaProcessActive.otherActivaEdit._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.formula.formulaProcessActive.otherActivaEdit.query_"+obj+")!='undefined'") ? eval('RM.formula.formulaProcessActive.otherActivaEdit.query_'+obj+'()') : null;
		return str;
	
	};
	
	RM.formula.formulaProcessActive.otherActivaEdit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('RM_formula_formulaProcessActive_otherActivaEdit_form',obj[0], RM.formula.formulaProcessActive.otherActivaEdit._prefix, RM.formula.formulaProcessActive.otherActivaEdit._sUrl);
		CUI.commonFills('RM_formula_formulaProcessActive_otherActivaEdit_form',RM.formula.formulaProcessActive.otherActivaEdit._prefix,obj[0]);

		try{
			if(RM.formula.formulaProcessActive.otherActivaEdit._customCallBack) {
				eval(RM.formula.formulaProcessActive.otherActivaEdit._customCallBack);
				RM.formula.formulaProcessActive.otherActivaEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcessActive.otherActivaEdit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	RM.formula.formulaProcessActive.otherActivaEdit.getcallBackInfo_DG_IE = function(obj){
		if(RM.formula.formulaProcessActive.otherActivaEdit._customBeforeCallBack) {
			var flag = eval(RM.formula.formulaProcessActive.otherActivaEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = RM.formula.formulaProcessActive.otherActivaEdit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,RM.formula.formulaProcessActive.otherActivaEdit._sUrl);
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
			if(RM.formula.formulaProcessActive.otherActivaEdit._customCallBack) {
				eval(RM.formula.formulaProcessActive.otherActivaEdit._customCallBack);
				RM.formula.formulaProcessActive.otherActivaEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcessActive.otherActivaEdit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	RM.formula.formulaProcessActive.otherActivaEdit.getcallBackInfo_DG = function(obj){
		if(RM.formula.formulaProcessActive.otherActivaEdit._customBeforeCallBack) {
			var flag = eval(RM.formula.formulaProcessActive.otherActivaEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(RM.formula.formulaProcessActive.otherActivaEdit._currRow).next().length==0){
					RM.formula.formulaProcessActive.otherActivaEdit._oGrid.addNewRow();
				}	
				RM.formula.formulaProcessActive.otherActivaEdit._currRow = $(RM.formula.formulaProcessActive.otherActivaEdit._currRow).next();
				$(RM.formula.formulaProcessActive.otherActivaEdit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(RM.formula.formulaProcessActive.otherActivaEdit._currRow,obj[i],RM.formula.formulaProcessActive.otherActivaEdit._prefix,RM.formula.formulaProcessActive.otherActivaEdit._sUrl);
			eval("CUI.commonFills_DG(RM.formula.formulaProcessActive.otherActivaEdit._currRow,RM.formula.formulaProcessActive.otherActivaEdit._prefix,obj[i],RM.formula.formulaProcessActive.otherActivaEdit._oGrid)");
		}
		try{
			if(RM.formula.formulaProcessActive.otherActivaEdit._customCallBack) {
				eval(RM.formula.formulaProcessActive.otherActivaEdit._customCallBack);
				RM.formula.formulaProcessActive.otherActivaEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcessActive.otherActivaEdit._dialog.close();
		} catch(e){}
	};
	
	RM.formula.formulaProcessActive.otherActivaEdit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(RM.formula.formulaProcessActive.otherActivaEdit._oGrid, RM.formula.formulaProcessActive.otherActivaEdit._currRow, RM.formula.formulaProcessActive.otherActivaEdit._key, RM.formula.formulaProcessActive.otherActivaEdit._displayFieldName, obj[i])
		}
		try{
			if(RM.formula.formulaProcessActive.otherActivaEdit._customCallBack) {
				eval(RM.formula.formulaProcessActive.otherActivaEdit._customCallBack);
				RM.formula.formulaProcessActive.otherActivaEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcessActive.otherActivaEdit._dialog.close();
		} catch(e){}
	};
	
	RM.formula.formulaProcessActive.otherActivaEdit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			RM.formula.formulaProcessActive.otherActivaEdit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#RM_formula_formulaProcessActive_otherActivaEdit_form'));
        			}
        	   	}
        	}
      	});
	};
	(function($){
		$(function(){
			//下拉框去除配料和投配料
		$($("#formulaProcessActiveactiveTypeid").children("option")[2]).remove();
		$($("#formulaProcessActiveactiveTypeid").children("option")[3]).remove();
$("input[name='formulaProcessActive.product.productName']").attr("readonly",true);
        $("#formulaProcessActive_product_productName_click_button").css("display","none");
        $("#formulaProcessActive_product_productName_mneTipLabel").css("display","none");
        //选择类型之前替代料不可编辑
        $('select[name="formulaProcessActive.isReplace"]').disabledSelect();
        //选择类型之前单位数量不可编辑
        $("#formulaProcessActive_standardQuantity").attr("readonly",true);
        //选择类型之前检测方案不可编辑
        //$("input[name='formulaProcessActive.testProduct.name']").attr("readonly",true);
        $("#formulaProcessActive_testProduct_name_click_button").css("display","none");
        //选择类型之前质量标准不可编辑
        $("#formulaProcessActive_qualityStandard_name_click_button").css("display","none");
        
        //插入隐藏的表单号
        $('input[name="formulaProcessActive.processTableId"]').val($("input[name='formulaProcess.processTableId']").val());
        //插入工序Id
        $('input[name="formulaProcessActive.processHiddenId"]').val($("input[name='formulaProcess.formId']").val());
		});
	})(jQuery);
	RM.formula.formulaProcessActive.otherActivaEdit.beforeSubmitMethodSettingInPage = function(){
		//活动类型选择投料与产出
if($("#formulaProcessActiveactiveTypeid").val()=="activeType/activeType3" ||$("#formulaProcessActiveactiveTypeid").val()=="activeType/activeType6"){
	if($("input[name='formulaProcessActive.product.productName']").val()==""){
		RM_formula_formulaProcessActive_otherActivaEdit_formDialogErrorBarWidget.showMessage("${getText('RM.fomula.radon1487074975312')}");
		return false;
	}
	if($("#formulaProcessActive_standardQuantity").val()==""){
		RM_formula_formulaProcessActive_otherActivaEdit_formDialogErrorBarWidget.showMessage("${getText('RM.fomula.radon1487074975374')}");
		return false;
	}
}
//活动类型选择检查
if($("#formulaProcessActiveactiveTypeid").val()=="activeType/activeType5"){
	if($("input[name='formulaProcessActive.testProduct.name']").val()==""){
		RM_formula_formulaProcessActive_otherActivaEdit_formDialogErrorBarWidget.showMessage("${getText('RM.fomula.radon1487074975326')}");
		return false;
	}
	if($("input[name='formulaProcessActive.qualityStandard.name']").val()==""){
		RM_formula_formulaProcessActive_otherActivaEdit_formDialogErrorBarWidget.showMessage("${getText('RM.fomula.radon1487074975375')}");
		return false;
	}
}
if($("#formulaProcessActive_name").val()==""){
	RM_formula_formulaProcessActive_otherActivaEdit_formDialogErrorBarWidget.showMessage("${getText('RM.fomula.radon1487074975311')}");
	return false;
}
if($("#formulaProcessActiveoccurTurnid").val()==""){
	RM_formula_formulaProcessActive_otherActivaEdit_formDialogErrorBarWidget.showMessage("${getText('RM.fomula.radon1487074975388')}");
	return false;
}
if($("#formulaProcessActiveactiveTypeid").val()==""){
	RM_formula_formulaProcessActive_otherActivaEdit_formDialogErrorBarWidget.showMessage("${getText('RM.fomula.radon1487074975389')}");
	return false;
}
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	RM.formula.formulaProcessActive.otherActivaEdit.initCount = 0;
	RM.formula.formulaProcessActive.otherActivaEdit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#RM_otherActivaEdit_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('RM_formula_formulaProcessActive_otherActivaEdit_datagrids');	
		var	conHeight = h-$("#RM_formula_formulaProcessActive_otherActivaEdit_main_div .edit-tabs").height() - 6;
		panesHeight = conHeight*0.4;
		$("#RM_formula_formulaProcessActive_otherActivaEdit_main_div .edit-panes-s").each(function(index){
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
							if(RM.formula.formulaProcessActive.otherActivaEdit.initCount <= 2) {
								setTimeout(function(){RM.formula.formulaProcessActive.otherActivaEdit.initSize();}, 200);
								RM.formula.formulaProcessActive.otherActivaEdit.initCount++;
							}/* else {
								RM.formula.formulaProcessActive.otherActivaEdit.initCount = 0;
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
		RM.formula.formulaProcessActive.otherActivaEdit.initSize();
		$(window).bind("dialog.resize",function(){RM.formula.formulaProcessActive.otherActivaEdit.initSize();});
	});
</script>
<script type="text/javascript">
	
function activityTypeChange(){
   //活动类型只能选择投料、产出、常规、检查	
   if($("#formulaProcessActiveactiveTypeid").val()=="activeType/activeType2" ||$("#formulaProcessActiveactiveTypeid").val()=="activeType/activeType4"){
	RM_formula_formulaProcessActive_otherActivaEdit_formDialogErrorBarWidget.showMessage("${getText('RM.fomula.radon1487074975350')}");
	$("#formulaProcessActive_activeType_id__jQSelect01 h4").html("");
   }
   //活动类型选择投料或者产出
   if($("#formulaProcessActiveactiveTypeid").val()=="activeType/activeType3" ||$("#formulaProcessActiveactiveTypeid").val()=="activeType/activeType6"){
	//物料可编辑
	$("input[name='formulaProcessActive.product.productName']").attr("readonly",false);
    $("#formulaProcessActive_product_productName_click_button").css("display","block");
    $("#formulaProcessActive_product_productName_mneTipLabel").css("display","block");
	//替代料可编辑
	$('select[name="formulaProcessActive.isReplace"]').unDisabledSelect();
	//单位数量可编辑
	$("#formulaProcessActive_standardQuantity").attr("readonly",false);
   }
   //活动类型选择常规或者不选时
   if($("#formulaProcessActiveactiveTypeid").val()=="activeType/activeType1" ||$("#formulaProcessActiveactiveTypeid").val()==""){
	    //物料不可编辑
	   $("input[name='formulaProcessActive.product.productName']").attr("readonly",true);
       $("#formulaProcessActive_product_productName_click_button").css("display","none");
       $("#formulaProcessActive_product_productName_mneTipLabel").css("display","none");
	   $("#formulaProcessActive_product_productName_mneTipLabel").html("");
       //替代料不可编辑
       $('select[name="formulaProcessActive.isReplace"]').disabledSelect();
	   $("#formulaProcessActive_isReplace__jQSelect23 h4").html("");
       //单位数量不可编辑
       $("#formulaProcessActive_standardQuantity").attr("readonly",true);
       //检测方案不可编辑
       //$("input[name='formulaProcessActive.testProduct.name']").attr("readonly",true);
       $("#formulaProcessActive_testProduct_name_click_button").css("display","none");
       //质量标准不可编辑
       $("#formulaProcessActive_qualityStandard_name_click_button").css("display","none");
   }
   //活动类型选择检查
   if($("#formulaProcessActiveactiveTypeid").val()=="activeType/activeType5"){
	     //物料不可编辑
	   $("input[name='formulaProcessActive.product.productName']").attr("readonly",true);
       $("#formulaProcessActive_product_productName_click_button").css("display","none");
       $("#formulaProcessActive_product_productName_mneTipLabel").css("display","none");
	   $("#formulaProcessActive_product_productName_mneTipLabel").html("");
       //替代料不可编辑
       $('select[name="formulaProcessActive.isReplace"]').disabledSelect();
	   $("#formulaProcessActive_isReplace__jQSelect23 h4").html("");
       //单位数量不可编辑
       $("#formulaProcessActive_standardQuantity").attr("readonly",true);
	   //检测方案可编辑
	   $("#formulaProcessActive_testProduct_name_click_button").css("display","block");
	   //质量标准可编辑
	   $("#formulaProcessActive_qualityStandard_name_click_button").css("display","block");
   }
}
function isType(){
	if($("#formulaProcessActiveactiveTypeid").val()==""){
		$("select[name='formulaProcessActive.isReplace']").val("");
		$("#formulaProcessActive_isReplace__jQSelect23 h4").html("");
		$('select[name="formulaProcessActive.isReplace"]').disabledSelect();
		RM_formula_formulaProcessActive_otherActivaEdit_formDialogErrorBarWidget.showMessage("${getText('RM.fomula.radon1487074975351')}");
		
		return false;
	}$("#formulaProcessActive_isReplace__jQSelect23 h4").html("");
}


	/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_otherActivaEdit,js,RM_7.5.0.0_formula_FormulaProcessActive,RM_7.5.0.0) */
// 自定义代码
//新打开界面

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>