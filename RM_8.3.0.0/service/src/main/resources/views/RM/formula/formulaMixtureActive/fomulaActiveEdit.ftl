<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1487812919927')}</title>
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
	CUI.ns('RM.formula.formulaMixtureActive.fomulaActiveEdit');
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
<#assign callbackName ="RM.formula.formulaMixtureActive.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="RM_formula_formulaMixtureActive_fomulaActiveEdit_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="RM_formula_formulaMixtureActive_fomulaActiveEdit_form" cssStyle="height:100%;" hiddenField="formulaMixtureActive.processActiveId.id," onsubmitMethod="RM.formula.formulaMixtureActive.fomulaActiveEdit.beforeSubmitMethod()" ecAction="/RM/formula/formulaMixtureActive/fomulaActiveEdit/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="fomulaActiveEdit">
	<input type="hidden" name="viewCode" value="RM_7.5.0.0_formula_fomulaActiveEdit">
	<input type="hidden" name="datagridKey" value="RM_formula_formulaMixtureActive_fomulaActiveEdit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="formulaMixtureActive.version" value="${(formulaMixtureActive.version)!0}" />
	<input type="hidden" name="formulaMixtureActive.extraCol" value='' />
		<input type="hidden" name="formulaMixtureActive.processActiveId.id" value="${(formulaMixtureActive.processActiveId.id)!""}"/>
	<div id="RM_fomulaActiveEdit_edit_div" style="height:100%">
		<div id="RM_formula_formulaMixtureActive_fomulaActiveEdit_main_div" class="edit-content-dialog">
<script type="text/javascript">
var attcountid = "RM_formula_formulaMixtureActive_fomulaActiveEdit_form"+"_attcount";
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
				
							 					<#if !RM_7_5_0_0_formula_FormulaMixtureActive_name_permit??>
					<#assign RM_7_5_0_0_formula_FormulaMixtureActive_name_permit = checkFieldPermission('formulaMixtureActive.name','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_name')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaMixtureActive_name_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_FormulaMixtureActive_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487811442421')}" >${getText('RM.propertydisplayName.randon1487811442421')}</label>
				</td>
				
						<#assign formulaMixtureActive_name_defaultValue  = ''>
							 							<#assign formulaMixtureActive_name_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_FormulaMixtureActive_name_permit??>
					<#assign RM_7_5_0_0_formula_FormulaMixtureActive_name_permit = checkFieldPermission('formulaMixtureActive.name','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_name')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaMixtureActive_name_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_FormulaMixtureActive_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if RM_7_5_0_0_formula_FormulaMixtureActive_name_permit == 1>-readonly</#if>">
								<input property_type="TEXT" name="formulaMixtureActive.name" id="formulaMixtureActive_name"  style=";" originalvalue="<#if !newObj || (formulaMixtureActive.name)?has_content>${(formulaMixtureActive.name?html)!}<#else>${formulaMixtureActive_name_defaultValue!}</#if>" value="<#if !newObj || (formulaMixtureActive.name)?has_content>${(formulaMixtureActive.name?html)!}<#else>${formulaMixtureActive_name_defaultValue!}</#if>" type="text" class="cui-noborder-input "<#if RM_7_5_0_0_formula_FormulaMixtureActive_name_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !RM_7_5_0_0_formula_FormulaMixtureActive_formulaType_permit??>
					<#assign RM_7_5_0_0_formula_FormulaMixtureActive_formulaType_permit = checkFieldPermission('formulaMixtureActive.formulaType','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_formulaType')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaMixtureActive_formulaType_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_FormulaMixtureActive_formulaType_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487811825429')}" >${getText('RM.propertydisplayName.randon1487811825429')}</label>
				</td>
				
						<#assign formulaMixtureActive_formulaType_defaultValue  = ''>
							 							<#assign formulaMixtureActive_formulaType_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_FormulaMixtureActive_formulaType_permit??>
					<#assign RM_7_5_0_0_formula_FormulaMixtureActive_formulaType_permit = checkFieldPermission('formulaMixtureActive.formulaType','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_formulaType')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaMixtureActive_formulaType_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_FormulaMixtureActive_formulaType_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if newObj>
									<#if RM_7_5_0_0_formula_FormulaMixtureActive_formulaType_permit == 1>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange="" viewType="${viewType!}" deValue="${formulaMixtureActive_formulaType_defaultValue!}" formId="RM_formula_formulaMixtureActive_fomulaActiveEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formulaMixtureActive.formulaType.id" code="activeType" value="${(formulaMixtureActive.formulaType.id)!}"  />
									<#else>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${formulaMixtureActive_formulaType_defaultValue!}" formId="RM_formula_formulaMixtureActive_fomulaActiveEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formulaMixtureActive.formulaType.id" code="activeType" value="${(formulaMixtureActive.formulaType.id)!}"  />
									</#if>
								<#else>
									<#if RM_7_5_0_0_formula_FormulaMixtureActive_formulaType_permit == 1>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formulaMixtureActive_fomulaActiveEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formulaMixtureActive.formulaType.id" code="activeType" value="${(formulaMixtureActive.formulaType.id)!}"  />
									<#else>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formulaMixtureActive_fomulaActiveEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formulaMixtureActive.formulaType.id" code="activeType" value="${(formulaMixtureActive.formulaType.id)!}"  />
									</#if>
								</#if>
							</#if>
				</td>
				
							 					<#if !RM_7_5_0_0_formula_FormulaMixtureActive_longTime_permit??>
					<#assign RM_7_5_0_0_formula_FormulaMixtureActive_longTime_permit = checkFieldPermission('formulaMixtureActive.longTime','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_longTime')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaMixtureActive_longTime_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_FormulaMixtureActive_longTime_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487811796153')}" >${getText('RM.propertydisplayName.randon1487811796153')}</label>
				</td>
				
						<#assign formulaMixtureActive_longTime_defaultValue  = ''>
							 							<#assign formulaMixtureActive_longTime_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_FormulaMixtureActive_longTime_permit??>
					<#assign RM_7_5_0_0_formula_FormulaMixtureActive_longTime_permit = checkFieldPermission('formulaMixtureActive.longTime','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_longTime')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaMixtureActive_longTime_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_FormulaMixtureActive_longTime_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if RM_7_5_0_0_formula_FormulaMixtureActive_longTime_permit == 1>-readonly</#if>">
									<input name="formulaMixtureActive.longTime" id="formulaMixtureActive_longTime"  style=";" originalvalue="<#if newObj&& !(formulaMixtureActive.longTime)?has_content>${formulaMixtureActive_longTime_defaultValue!}<#elseif (formulaMixtureActive.longTime)?has_content>#{(formulaMixtureActive.longTime)!; m6M6}</#if>" value="<#if newObj&& !(formulaMixtureActive.longTime)?has_content>${formulaMixtureActive_longTime_defaultValue!}<#elseif (formulaMixtureActive.longTime)?has_content>#{(formulaMixtureActive.longTime)!; m6M6}</#if>" type="text" class="cui-noborder-input numberField"<#if RM_7_5_0_0_formula_FormulaMixtureActive_longTime_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#formulaMixtureActive_longTime').unbind('blur').bind('blur',function(){
										var percision = 6;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("RM.propertydisplayName.randon1487811796153")}')}");
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
							 					<#if !RM_7_5_0_0_formula_FormulaMixtureActive_ingredientsOrder_permit??>
					<#assign RM_7_5_0_0_formula_FormulaMixtureActive_ingredientsOrder_permit = checkFieldPermission('formulaMixtureActive.ingredientsOrder','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_ingredientsOrder')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaMixtureActive_ingredientsOrder_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_FormulaMixtureActive_ingredientsOrder_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487812100211')}" >${getText('RM.propertydisplayName.randon1487812100211')}</label>
				</td>
				
						<#assign formulaMixtureActive_ingredientsOrder_defaultValue  = ''>
							 							<#assign formulaMixtureActive_ingredientsOrder_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_FormulaMixtureActive_ingredientsOrder_permit??>
					<#assign RM_7_5_0_0_formula_FormulaMixtureActive_ingredientsOrder_permit = checkFieldPermission('formulaMixtureActive.ingredientsOrder','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_ingredientsOrder')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaMixtureActive_ingredientsOrder_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_FormulaMixtureActive_ingredientsOrder_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if RM_7_5_0_0_formula_FormulaMixtureActive_ingredientsOrder_permit == 1>-readonly</#if>">
								<input property_type="INTEGER" name="formulaMixtureActive.ingredientsOrder" id="formulaMixtureActive_ingredientsOrder"  style=";" originalvalue="<#if !newObj || (formulaMixtureActive.ingredientsOrder)?has_content>${(formulaMixtureActive.ingredientsOrder?html)!}<#else>${formulaMixtureActive_ingredientsOrder_defaultValue!}</#if>" value="<#if !newObj || (formulaMixtureActive.ingredientsOrder)?has_content>${(formulaMixtureActive.ingredientsOrder?html)!}<#else>${formulaMixtureActive_ingredientsOrder_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField"<#if RM_7_5_0_0_formula_FormulaMixtureActive_ingredientsOrder_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !RM_7_5_0_0_formula_FormulaMixtureActive_auto_permit??>
					<#assign RM_7_5_0_0_formula_FormulaMixtureActive_auto_permit = checkFieldPermission('formulaMixtureActive.auto','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_auto')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaMixtureActive_auto_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_FormulaMixtureActive_auto_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487812128791')}" >${getText('RM.propertydisplayName.randon1487812128791')}</label>
				</td>
				
						<#assign formulaMixtureActive_auto_defaultValue  = ''>
							 							<#assign formulaMixtureActive_auto_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_FormulaMixtureActive_auto_permit??>
					<#assign RM_7_5_0_0_formula_FormulaMixtureActive_auto_permit = checkFieldPermission('formulaMixtureActive.auto','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_auto')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaMixtureActive_auto_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_FormulaMixtureActive_auto_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if RM_7_5_0_0_formula_FormulaMixtureActive_auto_permit == 1>
									<div class="fix-search-click">
										<select property_type="BOOLEAN" class="edit-select"  originalvalue="<#if !newObj || (formulaMixtureActive.auto)?has_content>${(formulaMixtureActive.auto!false)?string('true','false')}<#elseif formulaMixtureActive_auto_defaultValue?has_content>${(formulaMixtureActive_auto_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj || (formulaMixtureActive.auto)?has_content>${(formulaMixtureActive.auto!false)?string('true','false')}<#else>${(formulaMixtureActive_auto_defaultValue!true)?string}</#if>" style=";" name="formulaMixtureActive.auto" > 
											<option value=""></option>
											<#if (newObj?? && !newObj)||(formulaMixtureActive.auto)?has_content>
											<option value="true" <#if (formulaMixtureActive.auto!false)?string('true','false')=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="false" <#if (formulaMixtureActive.auto!false)?string('true','false')=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
											<#else>
											<option value="true" <#if (formulaMixtureActive_auto_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="false" <#if (formulaMixtureActive_auto_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
											</#if>
										</select>
									</div>
									<script type="text/javascript">
										$(function(){
											$('select[name="formulaMixtureActive.auto"]').disabledSelect();
										});
									</script>
								<#else>
									<div class="fix-search-click">
										<select property_type="BOOLEAN" class="edit-select" originalvalue="<#if !newObj || (formulaMixtureActive.auto)?has_content>${(formulaMixtureActive.auto!false)?string('true','false')}<#elseif formulaMixtureActive_auto_defaultValue?has_content>${(formulaMixtureActive_auto_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj || (formulaMixtureActive.auto)?has_content>${(formulaMixtureActive.auto!false)?string('true','false')}<#else>${(formulaMixtureActive_auto_defaultValue!true)?string}</#if>" style=";" name="formulaMixtureActive.auto" > 
											<option value=""></option>
											<#if (newObj?? && !newObj)||(formulaMixtureActive.auto)?has_content>
											<option value="true" <#if (formulaMixtureActive.auto!false)?string('true','false')=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="false" <#if (formulaMixtureActive.auto!false)?string('true','false')=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
											<#else>
											<option value="true" <#if (formulaMixtureActive_auto_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="false" <#if (formulaMixtureActive_auto_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
											</#if>
										</select>
									</div>
							</#if>
							</#if>
				</td>
				
												<#if !RM_7_5_0_0_formula_FormulaMixtureActive_processActiveId_RM_7_5_0_0_formula_FormulaProcessActive_exeBillName_permit??>
					<#assign RM_7_5_0_0_formula_FormulaMixtureActive_processActiveId_RM_7_5_0_0_formula_FormulaProcessActive_exeBillName_permit = checkFieldPermission('formulaMixtureActive.processActiveId.exeBillName','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaProcessActive_exeBillName')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaMixtureActive_processActiveId_RM_7_5_0_0_formula_FormulaProcessActive_exeBillName_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_FormulaMixtureActive_processActiveId_RM_7_5_0_0_formula_FormulaProcessActive_exeBillName_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487331143778')}" >${getText('RM.propertydisplayName.randon1487331143778')}</label>
				</td>
				
						<#assign formulaMixtureActive_processActiveId_exeBillName_defaultValue  = ''>
														<#assign formulaMixtureActive_processActiveId_exeBillName_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_FormulaMixtureActive_processActiveId_RM_7_5_0_0_formula_FormulaProcessActive_exeBillName_permit??>
					<#assign RM_7_5_0_0_formula_FormulaMixtureActive_processActiveId_RM_7_5_0_0_formula_FormulaProcessActive_exeBillName_permit = checkFieldPermission('formulaMixtureActive.processActiveId.exeBillName','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaProcessActive_exeBillName')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaMixtureActive_processActiveId_RM_7_5_0_0_formula_FormulaProcessActive_exeBillName_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_FormulaMixtureActive_processActiveId_RM_7_5_0_0_formula_FormulaProcessActive_exeBillName_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								
								
								<#if RM_7_5_0_0_formula_FormulaMixtureActive_processActiveId_RM_7_5_0_0_formula_FormulaProcessActive_exeBillName_permit == 1>
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('RM.viewtitle.randon1487813227274')}" conditionfunc="RM.formula.formulaMixtureActive.fomulaActiveEdit._querycustomFunc('formulaMixtureActive_processActiveId_exeBillName')" view=true value="${(formulaMixtureActive.processActiveId.exeBillName)!}" displayFieldName="exeBillName" name="formulaMixtureActive.processActiveId.exeBillName" id="formulaMixtureActive_processActiveId_exeBillName" type="other" url="/RM/formula/formulaProcessActive/processActiveRef.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formulaMixtureActive_fomulaActiveEdit_form" editCustomCallback=";" onkeyupfuncname=";_callback_formulaMixtureActive_processActiveId_exeBillName(obj);" cssStyle="" isEdit=true  refViewCode="RM_7.5.0.0_formula_processActiveRef"   isCrossCompany=false  />
								<#else>
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('RM.viewtitle.randon1487813227274')}" viewType="${viewType!}" deValue="${formulaMixtureActive_processActiveId_exeBillName_defaultValue!}" conditionfunc="RM.formula.formulaMixtureActive.fomulaActiveEdit._querycustomFunc('formulaMixtureActive_processActiveId_exeBillName')"  value="${(formulaMixtureActive.processActiveId.exeBillName)!}" displayFieldName="exeBillName" name="formulaMixtureActive.processActiveId.exeBillName" id="formulaMixtureActive_processActiveId_exeBillName" type="other" url="/RM/formula/formulaProcessActive/processActiveRef.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formulaMixtureActive_fomulaActiveEdit_form" editCustomCallback=";" refViewCode="RM_7.5.0.0_formula_processActiveRef"  onkeyupfuncname=";_callback_formulaMixtureActive_processActiveId_exeBillName(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								</#if>
								
								
								<script type="text/javascript">
								<#if !(formulaMixtureActive.id)?? && (formulaMixtureActive.processActiveId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formulaMixtureActive.processActiveId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_formulaMixtureActive_fomulaActiveEdit_form',obj, 'formulaMixtureActive.processActiveId', '/RM/formula/formulaProcessActive/processActiveRef.action');
												CUI.commonFills('RM_formula_formulaMixtureActive_fomulaActiveEdit_form', 'formulaMixtureActive.processActiveId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
							 					<#if !RM_7_5_0_0_formula_FormulaMixtureActive_meno_permit??>
					<#assign RM_7_5_0_0_formula_FormulaMixtureActive_meno_permit = checkFieldPermission('formulaMixtureActive.meno','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_meno')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaMixtureActive_meno_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_FormulaMixtureActive_meno_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487812510638')}" >${getText('RM.propertydisplayName.randon1487812510638')}</label>
				</td>
				
						<#assign formulaMixtureActive_meno_defaultValue  = ''>
							 							<#assign formulaMixtureActive_meno_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_FormulaMixtureActive_meno_permit??>
					<#assign RM_7_5_0_0_formula_FormulaMixtureActive_meno_permit = checkFieldPermission('formulaMixtureActive.meno','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_meno')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaMixtureActive_meno_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="5" style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_FormulaMixtureActive_meno_permit == 0>
							<div class="fix-input-readonly fix-ie7-textarea"><textarea property_type="TEXT" id="formulaMixtureActive_meno" class="cui-noborder-textarea nopermit cui-textarea-auto" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"></textarea></div>
							<#else>
							<div class="fix-input<#if RM_7_5_0_0_formula_FormulaMixtureActive_meno_permit == 1>-readonly</#if> fix-ie7-textarea"><textarea property_type="TEXT" id="formulaMixtureActive_meno" originalvalue="<#if !newObj || (formulaMixtureActive.meno)?has_content>${(formulaMixtureActive.meno?html)!}<#else>${formulaMixtureActive_meno_defaultValue?html}</#if>"  name="formulaMixtureActive.meno" class="cui-noborder-textarea cui-textarea-auto"<#if RM_7_5_0_0_formula_FormulaMixtureActive_meno_permit == 1> readonly=readonly</#if> style=";" ><#if !newObj || (formulaMixtureActive.meno)?has_content>${(formulaMixtureActive.meno)!}<#else>${formulaMixtureActive_meno_defaultValue}</#if></textarea></div>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
				<td class="edit-table-symbol" colspan="6">&nbsp;</td>
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
<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_fomulaActiveEdit,html,RM_7.5.0.0_formula_FormulaMixtureActive,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	RM.formula.formulaMixtureActive.fomulaActiveEdit.beforeSaveProcess = function(){}
	RM.formula.formulaMixtureActive.fomulaActiveEdit.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(RM.formula.formulaMixtureActive.fomulaActiveEdit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#RM_formula_formulaMixtureActive_fomulaActiveEdit_form').trigger('beforeSubmit');
		//formulaMixtureActive.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="formulaMixtureActive.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#RM_formula_formulaMixtureActive_fomulaActiveEdit_form ul.edit-tabs").tabs("div.edit-panes > div");
		});
	})(jQuery);
	RM.formula.formulaMixtureActive.fomulaActiveEdit.validate = function(){
		return true;
	}
	
	
	//打印
	RM.formula.formulaMixtureActive.fomulaActiveEdit.print = function(url){
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
		
		RM.formula.formulaMixtureActive.fomulaActiveEdit.saveSetting = function(){
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
		RM.formula.formulaMixtureActive.fomulaActiveEdit.printSetting = function(){
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
			RM.formula.formulaMixtureActive.fomulaActiveEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(RM.formula.formulaMixtureActive.fomulaActiveEdit.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				RM.formula.formulaMixtureActive.fomulaActiveEdit.settingDialog.show();
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
			RM.formula.formulaMixtureActive.fomulaActiveEdit._customCallBack = customCallBack;
		}
		RM.formula.formulaMixtureActive.fomulaActiveEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#RM_formula_formulaMixtureActive_fomulaActiveEdit_fileupload').length == 0) {
				$('body').append('<div id="RM_formula_formulaMixtureActive_fomulaActiveEdit_fileupload"></div>');
			}
			RM.formula.formulaMixtureActive.fomulaActiveEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "RM_formula_formulaMixtureActive_fomulaActiveEdit_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#RM_formula_formulaMixtureActive_fomulaActiveEdit_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			RM.formula.formulaMixtureActive.fomulaActiveEdit.infoDialog.show();
			if($('#RM_formula_formulaMixtureActive_fomulaActiveEdit_fileupload').html() == '') {
				$('#RM_formula_formulaMixtureActive_fomulaActiveEdit_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=RM_formula_formulaMixtureActive&entityCode=RM_7.5.0.0_formula&dialogId="+dialogId);
			}
		}
	//参照复制函数
	RM.formula.formulaMixtureActive.fomulaActiveEdit.referenceCopy = function(objName,url, dialog){
		var callbackName ="RM.formula.formulaMixtureActive.fomulaActiveEdit.referenceCopyBackInfo";
		RM.formula.formulaMixtureActive.fomulaActiveEdit.dialog = dialog;
		RM.formula.formulaMixtureActive.fomulaActiveEdit._dialog = foundation.common.select({
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
	
	RM.formula.formulaMixtureActive.fomulaActiveEdit.referenceCopyBackInfo = function(obj){
		if(RM.formula.formulaMixtureActive.fomulaActiveEdit._dialog){
			RM.formula.formulaMixtureActive.fomulaActiveEdit._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,RM.formula.formulaMixtureActive.fomulaActiveEdit.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('RM_formula_formulaMixtureActive_fomulaActiveEdit_form','RM_formula_formulaMixtureActive_fomulaActiveEdit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(RM.formula.formulaMixtureActive.fomulaActiveEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(RM.formula.formulaMixtureActive.fomulaActiveEdit.dialog._el).load('/RM/formula/formulaMixtureActive/fomulaActiveEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( RM.formula.formulaMixtureActive.fomulaActiveEdit.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + RM.formula.formulaMixtureActive.fomulaActiveEdit.dialog._config.iframe, RM.formula.formulaMixtureActive.fomulaActiveEdit.dialog._dialog ).prop( 'src', '/RM/formula/formulaMixtureActive/fomulaActiveEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(RM.formula.formulaMixtureActive.fomulaActiveEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(RM.formula.formulaMixtureActive.fomulaActiveEdit.dialog._el).load('/RM/formula/formulaMixtureActive/fomulaActiveEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	RM.formula.formulaMixtureActive.fomulaActiveEdit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		RM.formula.formulaMixtureActive.fomulaActiveEdit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		RM.formula.formulaMixtureActive.fomulaActiveEdit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			RM.formula.formulaMixtureActive.fomulaActiveEdit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	RM.formula.formulaMixtureActive.fomulaActiveEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var frameName = 'RM_formula_formulaMixtureActive_fomulaActiveEdit';
		var callbackName="";
		RM.formula.formulaMixtureActive.fomulaActiveEdit._prefix = '';
		RM.formula.formulaMixtureActive.fomulaActiveEdit._oGrid = oGrid;
		RM.formula.formulaMixtureActive.fomulaActiveEdit._sUrl = url;
		if(customCallBack){
			RM.formula.formulaMixtureActive.fomulaActiveEdit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			RM.formula.formulaMixtureActive.fomulaActiveEdit.gridEventObj = gridEventObj;
			callbackName = "RM.formula.formulaMixtureActive.fomulaActiveEdit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				RM.formula.formulaMixtureActive.fomulaActiveEdit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "RM.formula.formulaMixtureActive.fomulaActiveEdit.getMultiselectCallBackInfo_DG" : "RM.formula.formulaMixtureActive.fomulaActiveEdit.getcallBackInfo_DG";
			RM.formula.formulaMixtureActive.fomulaActiveEdit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				RM.formula.formulaMixtureActive.fomulaActiveEdit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="RM.formula.formulaMixtureActive.fomulaActiveEdit.getcallBackInfo";
		}
		if(RM.formula.formulaMixtureActive.fomulaActiveEdit._prefix!=''){
			RM.formula.formulaMixtureActive.fomulaActiveEdit._prefix = RM.formula.formulaMixtureActive.fomulaActiveEdit._prefix.substring(1);
		}
		if(RM.formula.formulaMixtureActive.fomulaActiveEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.formula.formulaMixtureActive.fomulaActiveEdit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof RM.formula.formulaMixtureActive.fomulaActiveEdit._querycustomFuncN == "function") {
				refparam += RM.formula.formulaMixtureActive.fomulaActiveEdit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		RM.formula.formulaMixtureActive.fomulaActiveEdit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.formula.formulaMixtureActive.fomulaActiveEdit._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.formula.formulaMixtureActive.fomulaActiveEdit.query_"+obj+")!='undefined'") ? eval('RM.formula.formulaMixtureActive.fomulaActiveEdit.query_'+obj+'()') : null;
		return str;
	
	};
	
	RM.formula.formulaMixtureActive.fomulaActiveEdit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('RM_formula_formulaMixtureActive_fomulaActiveEdit_form',obj[0], RM.formula.formulaMixtureActive.fomulaActiveEdit._prefix, RM.formula.formulaMixtureActive.fomulaActiveEdit._sUrl);
		CUI.commonFills('RM_formula_formulaMixtureActive_fomulaActiveEdit_form',RM.formula.formulaMixtureActive.fomulaActiveEdit._prefix,obj[0]);

		try{
			if(RM.formula.formulaMixtureActive.fomulaActiveEdit._customCallBack) {
				eval(RM.formula.formulaMixtureActive.fomulaActiveEdit._customCallBack);
				RM.formula.formulaMixtureActive.fomulaActiveEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaMixtureActive.fomulaActiveEdit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	RM.formula.formulaMixtureActive.fomulaActiveEdit.getcallBackInfo_DG_IE = function(obj){
		if(RM.formula.formulaMixtureActive.fomulaActiveEdit._customBeforeCallBack) {
			var flag = eval(RM.formula.formulaMixtureActive.fomulaActiveEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = RM.formula.formulaMixtureActive.fomulaActiveEdit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,RM.formula.formulaMixtureActive.fomulaActiveEdit._sUrl);
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
			if(RM.formula.formulaMixtureActive.fomulaActiveEdit._customCallBack) {
				eval(RM.formula.formulaMixtureActive.fomulaActiveEdit._customCallBack);
				RM.formula.formulaMixtureActive.fomulaActiveEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaMixtureActive.fomulaActiveEdit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	RM.formula.formulaMixtureActive.fomulaActiveEdit.getcallBackInfo_DG = function(obj){
		if(RM.formula.formulaMixtureActive.fomulaActiveEdit._customBeforeCallBack) {
			var flag = eval(RM.formula.formulaMixtureActive.fomulaActiveEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(RM.formula.formulaMixtureActive.fomulaActiveEdit._currRow).next().length==0){
					RM.formula.formulaMixtureActive.fomulaActiveEdit._oGrid.addNewRow();
				}	
				RM.formula.formulaMixtureActive.fomulaActiveEdit._currRow = $(RM.formula.formulaMixtureActive.fomulaActiveEdit._currRow).next();
				$(RM.formula.formulaMixtureActive.fomulaActiveEdit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(RM.formula.formulaMixtureActive.fomulaActiveEdit._currRow,obj[i],RM.formula.formulaMixtureActive.fomulaActiveEdit._prefix,RM.formula.formulaMixtureActive.fomulaActiveEdit._sUrl);
			eval("CUI.commonFills_DG(RM.formula.formulaMixtureActive.fomulaActiveEdit._currRow,RM.formula.formulaMixtureActive.fomulaActiveEdit._prefix,obj[i],RM.formula.formulaMixtureActive.fomulaActiveEdit._oGrid)");
		}
		try{
			if(RM.formula.formulaMixtureActive.fomulaActiveEdit._customCallBack) {
				eval(RM.formula.formulaMixtureActive.fomulaActiveEdit._customCallBack);
				RM.formula.formulaMixtureActive.fomulaActiveEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaMixtureActive.fomulaActiveEdit._dialog.close();
		} catch(e){}
	};
	
	RM.formula.formulaMixtureActive.fomulaActiveEdit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(RM.formula.formulaMixtureActive.fomulaActiveEdit._oGrid, RM.formula.formulaMixtureActive.fomulaActiveEdit._currRow, RM.formula.formulaMixtureActive.fomulaActiveEdit._key, RM.formula.formulaMixtureActive.fomulaActiveEdit._displayFieldName, obj[i])
		}
		try{
			if(RM.formula.formulaMixtureActive.fomulaActiveEdit._customCallBack) {
				eval(RM.formula.formulaMixtureActive.fomulaActiveEdit._customCallBack);
				RM.formula.formulaMixtureActive.fomulaActiveEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaMixtureActive.fomulaActiveEdit._dialog.close();
		} catch(e){}
	};
	
	RM.formula.formulaMixtureActive.fomulaActiveEdit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			RM.formula.formulaMixtureActive.fomulaActiveEdit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#RM_formula_formulaMixtureActive_fomulaActiveEdit_form'));
        			}
        	   	}
        	}
      	});
	};
	RM.formula.formulaMixtureActive.fomulaActiveEdit.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	RM.formula.formulaMixtureActive.fomulaActiveEdit.initCount = 0;
	RM.formula.formulaMixtureActive.fomulaActiveEdit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#RM_fomulaActiveEdit_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('RM_formula_formulaMixtureActive_fomulaActiveEdit_datagrids');	
		var	conHeight = h-$("#RM_formula_formulaMixtureActive_fomulaActiveEdit_main_div .edit-tabs").height() - 6;
		panesHeight = conHeight*0.4;
		$("#RM_formula_formulaMixtureActive_fomulaActiveEdit_main_div .edit-panes-s").each(function(index){
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
							if(RM.formula.formulaMixtureActive.fomulaActiveEdit.initCount <= 2) {
								setTimeout(function(){RM.formula.formulaMixtureActive.fomulaActiveEdit.initSize();}, 200);
								RM.formula.formulaMixtureActive.fomulaActiveEdit.initCount++;
							}/* else {
								RM.formula.formulaMixtureActive.fomulaActiveEdit.initCount = 0;
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
		RM.formula.formulaMixtureActive.fomulaActiveEdit.initSize();
		$(window).bind("dialog.resize",function(){RM.formula.formulaMixtureActive.fomulaActiveEdit.initSize();});
	});
</script>
<script type="text/javascript">
	


	/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_fomulaActiveEdit,js,RM_7.5.0.0_formula_FormulaMixtureActive,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>