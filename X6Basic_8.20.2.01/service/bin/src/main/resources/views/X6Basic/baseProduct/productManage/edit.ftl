<style type="text/css">.ewc-dialog-el{height:100%;}.edit-table{width:98%;margin:0 auto;}</style>
<script type="text/javascript">
	CUI.ns('X6Basic.baseProduct.productManage.edit');
</script>
<link href="/struts/ec/style.css" rel="stylesheet" type="text/css" charset="utf-8"/>
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "X6Basic_baseProduct_productManage">
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
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<@errorbar id="X6Basic_baseProduct_productManage_edit_formDialogErrorBar" />
<@s.form id="X6Basic_baseProduct_productManage_edit_form" cssStyle="height:100%;" onsubmitMethod="X6Basic.baseProduct.productManage.edit.beforeSubmitMethod()" ecAction="/X6Basic/baseProduct/productManage/edit/submit.action?__pc__=${(Parameters.__pc__)!}" callback="X6Basic.baseProduct.productManage.callBackInfo" ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="edit">
	<input type="hidden" name="viewCode" value="X6Basic_1.0_baseProduct_edit">
	<input type="hidden" name="datagridKey" value="X6Basic_baseProduct_productManage_edit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="productManage.version" value="${(productManage.version)!0}" />
	<input type="hidden" name="productManage.extraCol" value='' />
		<input type="hidden" name="productManage.createStaff.id" value="${(productManage.createStaff.id)!""}"/>
	<div id="X6Basic_edit_edit_div" style="height:100%">
		<div id="X6Basic_baseProduct_productManage_edit_main_div" class="edit-content-dialog">
<script type="text/javascript">
var attcountid = "X6Basic_baseProduct_productManage_edit_form"+"_attcount";
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
					CUI('#'+attcountid).html('(' + fileCount + ')');
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=X6Basic_1.0_baseProduct', null, function(){
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
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td></tr>
		<tr class="dialog_tr">
				
							 					<#if !X6Basic_1_0_baseProduct_ProductManage_code_permit??>
					<#assign X6Basic_1_0_baseProduct_ProductManage_code_permit = checkFieldPermission('productManage.code','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_code')>
					</#if>
					<td <#if X6Basic_1_0_baseProduct_ProductManage_code_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_baseProduct_ProductManage_code_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1371468505565')}" >${getText('X6Basic.propertydisplayName.radion1371468505565')}</label>
				</td>
				
						<#assign productManage_code_defaultValue  = ''>
							 							<#assign productManage_code_defaultValue  = ''>
					<#if !X6Basic_1_0_baseProduct_ProductManage_code_permit??>
					<#assign X6Basic_1_0_baseProduct_ProductManage_code_permit = checkFieldPermission('productManage.code','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_code')>
					</#if>
					<td <#if X6Basic_1_0_baseProduct_ProductManage_code_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if X6Basic_1_0_baseProduct_ProductManage_code_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if X6Basic_1_0_baseProduct_ProductManage_code_permit == 1>-readonly</#if>">
								<input name="productManage.code" id="productManage_code"  style=";" originalvalue="<#if !newObj || (productManage.code)?has_content>${(productManage.code?html)!}<#else>${productManage_code_defaultValue!}</#if>" value="<#if !newObj || (productManage.code)?has_content>${(productManage.code?html)!}<#else>${productManage_code_defaultValue!}</#if>" type="text" class="cui-noborder-input "<#if X6Basic_1_0_baseProduct_ProductManage_code_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_baseProduct_ProductManage_name_permit??>
					<#assign X6Basic_1_0_baseProduct_ProductManage_name_permit = checkFieldPermission('productManage.name','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_name')>
					</#if>
					<td <#if X6Basic_1_0_baseProduct_ProductManage_name_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_baseProduct_ProductManage_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1371468737467')}" >${getText('X6Basic.propertydisplayName.radion1371468737467')}</label>
				</td>
				
						<#assign productManage_name_defaultValue  = ''>
							 							<#assign productManage_name_defaultValue  = ''>
					<#if !X6Basic_1_0_baseProduct_ProductManage_name_permit??>
					<#assign X6Basic_1_0_baseProduct_ProductManage_name_permit = checkFieldPermission('productManage.name','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_name')>
					</#if>
					<td <#if X6Basic_1_0_baseProduct_ProductManage_name_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if X6Basic_1_0_baseProduct_ProductManage_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if X6Basic_1_0_baseProduct_ProductManage_name_permit == 1>-readonly</#if>">
								<input name="productManage.name" id="productManage_name"  style=";" originalvalue="<#if !newObj || (productManage.name)?has_content>${(productManage.name?html)!}<#else>${productManage_name_defaultValue!}</#if>" value="<#if !newObj || (productManage.name)?has_content>${(productManage.name?html)!}<#else>${productManage_name_defaultValue!}</#if>" type="text" class="cui-noborder-input "<#if X6Basic_1_0_baseProduct_ProductManage_name_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
							 					<#if !X6Basic_1_0_baseProduct_ProductManage_specific_permit??>
					<#assign X6Basic_1_0_baseProduct_ProductManage_specific_permit = checkFieldPermission('productManage.specific','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_specific')>
					</#if>
					<td <#if X6Basic_1_0_baseProduct_ProductManage_specific_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_baseProduct_ProductManage_specific_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1371468803570')}" >${getText('X6Basic.propertydisplayName.radion1371468803570')}</label>
				</td>
				
						<#assign productManage_specific_defaultValue  = ''>
							 							<#assign productManage_specific_defaultValue  = ''>
					<#if !X6Basic_1_0_baseProduct_ProductManage_specific_permit??>
					<#assign X6Basic_1_0_baseProduct_ProductManage_specific_permit = checkFieldPermission('productManage.specific','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_specific')>
					</#if>
					<td <#if X6Basic_1_0_baseProduct_ProductManage_specific_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if X6Basic_1_0_baseProduct_ProductManage_specific_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if X6Basic_1_0_baseProduct_ProductManage_specific_permit == 1>-readonly</#if>">
								<input name="productManage.specific" id="productManage_specific"  style=";" originalvalue="<#if !newObj || (productManage.specific)?has_content>${(productManage.specific?html)!}<#else>${productManage_specific_defaultValue!}</#if>" value="<#if !newObj || (productManage.specific)?has_content>${(productManage.specific?html)!}<#else>${productManage_specific_defaultValue!}</#if>" type="text" class="cui-noborder-input "<#if X6Basic_1_0_baseProduct_ProductManage_specific_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_baseProduct_ProductManage_models_permit??>
					<#assign X6Basic_1_0_baseProduct_ProductManage_models_permit = checkFieldPermission('productManage.models','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_models')>
					</#if>
					<td <#if X6Basic_1_0_baseProduct_ProductManage_models_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_baseProduct_ProductManage_models_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1371468706627')}" >${getText('X6Basic.propertydisplayName.radion1371468706627')}</label>
				</td>
				
						<#assign productManage_models_defaultValue  = ''>
							 							<#assign productManage_models_defaultValue  = ''>
					<#if !X6Basic_1_0_baseProduct_ProductManage_models_permit??>
					<#assign X6Basic_1_0_baseProduct_ProductManage_models_permit = checkFieldPermission('productManage.models','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_models')>
					</#if>
					<td <#if X6Basic_1_0_baseProduct_ProductManage_models_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if X6Basic_1_0_baseProduct_ProductManage_models_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if X6Basic_1_0_baseProduct_ProductManage_models_permit == 1>-readonly</#if>">
								<input name="productManage.models" id="productManage_models"  style=";" originalvalue="<#if !newObj || (productManage.models)?has_content>${(productManage.models?html)!}<#else>${productManage_models_defaultValue!}</#if>" value="<#if !newObj || (productManage.models)?has_content>${(productManage.models?html)!}<#else>${productManage_models_defaultValue!}</#if>" type="text" class="cui-noborder-input "<#if X6Basic_1_0_baseProduct_ProductManage_models_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
							 					<#if !X6Basic_1_0_baseProduct_ProductManage_unit_permit??>
					<#assign X6Basic_1_0_baseProduct_ProductManage_unit_permit = checkFieldPermission('productManage.unit','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_unit')>
					</#if>
					<td <#if X6Basic_1_0_baseProduct_ProductManage_unit_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_baseProduct_ProductManage_unit_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1371468832370')}" >${getText('X6Basic.propertydisplayName.radion1371468832370')}</label>
				</td>
				
						<#assign productManage_unit_defaultValue  = ''>
							 							<#assign productManage_unit_defaultValue  = ''>
					<#if !X6Basic_1_0_baseProduct_ProductManage_unit_permit??>
					<#assign X6Basic_1_0_baseProduct_ProductManage_unit_permit = checkFieldPermission('productManage.unit','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_unit')>
					</#if>
					<td <#if X6Basic_1_0_baseProduct_ProductManage_unit_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if X6Basic_1_0_baseProduct_ProductManage_unit_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if X6Basic_1_0_baseProduct_ProductManage_unit_permit == 1>-readonly</#if>">
								<input name="productManage.unit" id="productManage_unit"  style=";" originalvalue="<#if !newObj || (productManage.unit)?has_content>${(productManage.unit?html)!}<#else>${productManage_unit_defaultValue!}</#if>" value="<#if !newObj || (productManage.unit)?has_content>${(productManage.unit?html)!}<#else>${productManage_unit_defaultValue!}</#if>" type="text" class="cui-noborder-input "<#if X6Basic_1_0_baseProduct_ProductManage_unit_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_baseProduct_ProductManage_currQuantity_permit??>
					<#assign X6Basic_1_0_baseProduct_ProductManage_currQuantity_permit = checkFieldPermission('productManage.currQuantity','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_currQuantity')>
					</#if>
					<td <#if X6Basic_1_0_baseProduct_ProductManage_currQuantity_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_baseProduct_ProductManage_currQuantity_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1371468561988')}" >${getText('X6Basic.propertydisplayName.radion1371468561988')}</label>
				</td>
				
						<#assign productManage_currQuantity_defaultValue  = ''>
							 							<#assign productManage_currQuantity_defaultValue  = ''>
					<#if !X6Basic_1_0_baseProduct_ProductManage_currQuantity_permit??>
					<#assign X6Basic_1_0_baseProduct_ProductManage_currQuantity_permit = checkFieldPermission('productManage.currQuantity','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_currQuantity')>
					</#if>
					<td <#if X6Basic_1_0_baseProduct_ProductManage_currQuantity_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if X6Basic_1_0_baseProduct_ProductManage_currQuantity_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if X6Basic_1_0_baseProduct_ProductManage_currQuantity_permit == 1>-readonly</#if>">
									<input name="productManage.currQuantity" id="productManage_currQuantity"  style=";" originalvalue="<#if newObj&& !(productManage.currQuantity)?has_content>${productManage_currQuantity_defaultValue!}<#elseif (productManage.currQuantity)?has_content>#{(productManage.currQuantity)!; m2M2}</#if>" value="<#if newObj&& !(productManage.currQuantity)?has_content>${productManage_currQuantity_defaultValue!}<#elseif (productManage.currQuantity)?has_content>#{(productManage.currQuantity)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField"<#if X6Basic_1_0_baseProduct_ProductManage_currQuantity_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#productManage_currQuantity').unbind('blur').bind('blur',function(){
										var percision = 2;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("X6Basic.propertydisplayName.radion1371468561988")}')}");
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
												<#if !X6Basic_1_0_baseProduct_ProductManage_createStaff_base_staff_name_permit??>
					<#assign X6Basic_1_0_baseProduct_ProductManage_createStaff_base_staff_name_permit = checkFieldPermission('productManage.createStaff.name','X6Basic_1.0_baseProduct_ProductManage','base_staff_name')>
					</#if>
					<td <#if X6Basic_1_0_baseProduct_ProductManage_createStaff_base_staff_name_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_baseProduct_ProductManage_createStaff_base_staff_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1368682044237')}" >${getText('X6Basic.propertydisplayName.radion1368682044237')}</label>
				</td>
				
						<#assign productManage_createStaff_name_defaultValue  = ''>
														<#assign productManage_createStaff_name_defaultValue  = ''>
					<#if !X6Basic_1_0_baseProduct_ProductManage_createStaff_base_staff_name_permit??>
					<#assign X6Basic_1_0_baseProduct_ProductManage_createStaff_base_staff_name_permit = checkFieldPermission('productManage.createStaff.name','X6Basic_1.0_baseProduct_ProductManage','base_staff_name')>
					</#if>
					<td <#if X6Basic_1_0_baseProduct_ProductManage_createStaff_base_staff_name_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-content"   style="text-align: left;;" >
							<#if X6Basic_1_0_baseProduct_ProductManage_createStaff_base_staff_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if X6Basic_1_0_baseProduct_ProductManage_createStaff_base_staff_name_permit == 1>
									<@mneclient reftitle="${getText('foundation.ec.entity.view.reference')}" conditionfunc="X6Basic.baseProduct.productManage.edit._querycustomFunc('productManage_createStaff_name')" view=true value="${(productManage.createStaff.name)!}" displayFieldName="name" name="productManage.createStaff.name" id="productManage_createStaff_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="X6Basic_baseProduct_productManage_edit_form" editCustomCallback=";" onkeyupfuncname=";_callback_productManage_createStaff_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false/>
								<#else>
									<@mneclient reftitle="${getText('foundation.ec.entity.view.reference')}" viewType="${viewType!}" deValue="${productManage_createStaff_name_defaultValue!}" conditionfunc="X6Basic.baseProduct.productManage.edit._querycustomFunc('productManage_createStaff_name')"  value="${(productManage.createStaff.name)!}" displayFieldName="name" name="productManage.createStaff.name" id="productManage_createStaff_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="X6Basic_baseProduct_productManage_edit_form" editCustomCallback=";" onkeyupfuncname=";_callback_productManage_createStaff_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false/>
								</#if>
								
								<script type="text/javascript">
								<#if newObj && (productManage_createStaff_name_defaultValue)=='currentUser'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.id}'};
											obj = foundation.common.getObject('X6Basic_baseProduct_productManage_edit_form',obj, 'productManage.createStaff', '/foundation/staff/common/staffListFrameset.action');
											CUI.commonFills('X6Basic_baseProduct_productManage_edit_form', 'productManage.createStaff',obj,true);
											$('input:hidden[name="productManage.createStaff.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(productManage.id)?? && (productManage.createStaff.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${productManage.createStaff.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('X6Basic_baseProduct_productManage_edit_form',obj, 'productManage.createStaff', '/foundation/staff/common/staffListFrameset.action');
												CUI.commonFills('X6Basic_baseProduct_productManage_edit_form', 'productManage.createStaff',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_baseProduct_ProductManage_createTime_permit??>
					<#assign X6Basic_1_0_baseProduct_ProductManage_createTime_permit = checkFieldPermission('productManage.createTime','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_createTime')>
					</#if>
					<td <#if X6Basic_1_0_baseProduct_ProductManage_createTime_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_baseProduct_ProductManage_createTime_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('ec.common.createTime')}" >${getText('ec.common.createTime')}</label>
				</td>
				
						<#assign productManage_createTime_defaultValue  = ''>
							 							<#assign productManage_createTime_defaultValue  = ''>
					<#if (productManage_createTime_defaultValue)?? &&(productManage_createTime_defaultValue)?has_content>
							<#assign productManage_createTime_defaultValue  = getDefaultDateTime(productManage_createTime_defaultValue!)?datetime>
					</#if>
					<#if !X6Basic_1_0_baseProduct_ProductManage_createTime_permit??>
					<#assign X6Basic_1_0_baseProduct_ProductManage_createTime_permit = checkFieldPermission('productManage.createTime','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_createTime')>
					</#if>
					<td <#if X6Basic_1_0_baseProduct_ProductManage_createTime_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content" celltype="DATETIME"  style="text-align: left;;" >
							<#if X6Basic_1_0_baseProduct_ProductManage_createTime_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<#if newObj && !(productManage.createTime)?has_content>
								<#if X6Basic_1_0_baseProduct_ProductManage_createTime_permit == 1>
								<@datepicker  cssClass="cui-noborder-input" name="productManage.createTime" value="${productManage_createTime_defaultValue!}" type="dateTime"  id="productManage.createTime" view=true cssStyle=""  />
								<#else>
								<@datepicker  cssClass="cui-noborder-input" name="productManage.createTime" value="${productManage_createTime_defaultValue!}" type="dateTime"  id="productManage.createTime"  cssStyle=""  />
								</#if>
							<#else>
							<#if (productManage.createTime)??>
								<#if X6Basic_1_0_baseProduct_ProductManage_createTime_permit == 1>
								<@datepicker  cssClass="cui-noborder-input" name="productManage.createTime" value="${productManage.createTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="productManage.createTime" view=true cssStyle=""  />
								<#else>
								<@datepicker  cssClass="cui-noborder-input" name="productManage.createTime" value="${productManage.createTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="productManage.createTime"  cssStyle=""  />
								</#if>
							<#else>
								<#if X6Basic_1_0_baseProduct_ProductManage_createTime_permit == 1>
								<@datepicker  cssClass="cui-noborder-input" name="productManage.createTime" value="" type="dateTime" id="productManage.createTime" cssStyle="" view=true />
								<#else>
								<@datepicker  cssClass="cui-noborder-input" name="productManage.createTime" value="" type="dateTime" id="productManage.createTime" cssStyle=""   />
								</#if>
							</#if>
							</#if>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
							 					<#if !X6Basic_1_0_baseProduct_ProductManage_prodMemo_permit??>
					<#assign X6Basic_1_0_baseProduct_ProductManage_prodMemo_permit = checkFieldPermission('productManage.prodMemo','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_prodMemo')>
					</#if>
					<td <#if X6Basic_1_0_baseProduct_ProductManage_prodMemo_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_baseProduct_ProductManage_prodMemo_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1371468769273')}" >${getText('X6Basic.propertydisplayName.radion1371468769273')}</label>
				</td>
				
						<#assign productManage_prodMemo_defaultValue  = ''>
							 							<#assign productManage_prodMemo_defaultValue  = ''>
					<#if !X6Basic_1_0_baseProduct_ProductManage_prodMemo_permit??>
					<#assign X6Basic_1_0_baseProduct_ProductManage_prodMemo_permit = checkFieldPermission('productManage.prodMemo','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_prodMemo')>
					</#if>
					<td <#if X6Basic_1_0_baseProduct_ProductManage_prodMemo_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="3" style="text-align: left;;" >
							<#if X6Basic_1_0_baseProduct_ProductManage_prodMemo_permit == 0>
							<div class="fix-input-readonly fix-ie7-textarea"><textarea id="productManage_prodMemo" class="cui-noborder-textarea nopermit cui-textarea-auto" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"></textarea></div>
							<#else>
							<div class="fix-input<#if X6Basic_1_0_baseProduct_ProductManage_prodMemo_permit == 1>-readonly</#if> fix-ie7-textarea"><textarea id="productManage_prodMemo" originalvalue="<#if !newObj || (productManage.prodMemo)?has_content>${(productManage.prodMemo?html)!}<#else>${productManage_prodMemo_defaultValue?html}</#if>"  name="productManage.prodMemo" class="cui-noborder-textarea cui-textarea-auto"<#if X6Basic_1_0_baseProduct_ProductManage_prodMemo_permit == 1> readonly=readonly</#if> style=";" ><#if !newObj || (productManage.prodMemo)?has_content>${(productManage.prodMemo)!}<#else>${productManage_prodMemo_defaultValue}</#if></textarea></div>
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
<!-- CUSTOM CODE START(view-EDIT-X6Basic_1.0_baseProduct_edit,html,X6Basic_1.0_baseProduct_ProductManage,X6Basic_1.0) -->
<!-- 自定义代码 -->
<!-- CUSTOM CODE END -->
<script type="text/javascript">
	X6Basic.baseProduct.productManage.edit.beforeSaveProcess = function(){}
	X6Basic.baseProduct.productManage.edit.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(X6Basic.baseProduct.productManage.edit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#X6Basic_baseProduct_productManage_edit_form').trigger('beforeSubmit');
		//productManage.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="productManage.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("ul.edit-tabs").tabs("div.edit-panes > div");
		});
	})(jQuery);
	X6Basic.baseProduct.productManage.edit.validate = function(){
		return true;
	}
	
	
	//打印
	X6Basic.baseProduct.productManage.edit.print = function(url){
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
		
		X6Basic.baseProduct.productManage.edit.saveSetting = function(){
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
		
		X6Basic.baseProduct.productManage.edit.printSetting = function(){
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
			X6Basic.baseProduct.productManage.edit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(X6Basic.baseProduct.productManage.edit.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
				})
				X6Basic.baseProduct.productManage.edit.settingDialog.show();
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
			X6Basic.baseProduct.productManage.edit._customCallBack = customCallBack;
		}
		X6Basic.baseProduct.productManage.edit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	
	//参照复制函数
	X6Basic.baseProduct.productManage.edit.referenceCopy = function(objName,url, dialog){
		var callbackName ="X6Basic.baseProduct.productManage.edit.referenceCopyBackInfo";
		X6Basic.baseProduct.productManage.edit.dialog = dialog;
		X6Basic.baseProduct.productManage.edit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			url : url,
			title : "${getText('ec.view.property.refview')}",
			params : null
		});
	}
	
	X6Basic.baseProduct.productManage.edit.referenceCopyBackInfo = function(obj){
		if(X6Basic.baseProduct.productManage.edit._dialog){
			X6Basic.baseProduct.productManage.edit._dialog.close();
		}
		createLoadPanel(false,X6Basic.baseProduct.productManage.edit.dialog._el);
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('X6Basic_baseProduct_productManage_edit_form','X6Basic_baseProduct_productManage_edit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(X6Basic.baseProduct.productManage.edit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(X6Basic.baseProduct.productManage.edit.dialog._el).load('/X6Basic/baseProduct/productManage/edit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			$(X6Basic.baseProduct.productManage.edit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(X6Basic.baseProduct.productManage.edit.dialog._el).load('/X6Basic/baseProduct/productManage/edit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
					closeLoadPanel();
					try{
						StrutsUtilsOnLoad();
					}catch(e){}
					try{
						if(me._config.onload != undefined) eval(me._config.onload + "(me)");
					}catch(e){}
			});
		}
	};
	
	X6Basic.baseProduct.productManage.edit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		X6Basic.baseProduct.productManage.edit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		X6Basic.baseProduct.productManage.edit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			X6Basic.baseProduct.productManage.edit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	X6Basic.baseProduct.productManage.edit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var callbackName="";
		X6Basic.baseProduct.productManage.edit._prefix = '';
		X6Basic.baseProduct.productManage.edit._oGrid = oGrid;
		X6Basic.baseProduct.productManage.edit._sUrl = url;
		if(customCallBack){
			X6Basic.baseProduct.productManage.edit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			X6Basic.baseProduct.productManage.edit.gridEventObj = gridEventObj;
			callbackName = "X6Basic.baseProduct.productManage.edit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				X6Basic.baseProduct.productManage.edit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "X6Basic.baseProduct.productManage.edit.getMultiselectCallBackInfo_DG" : "X6Basic.baseProduct.productManage.edit.getcallBackInfo_DG";
			X6Basic.baseProduct.productManage.edit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				X6Basic.baseProduct.productManage.edit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="X6Basic.baseProduct.productManage.edit.getcallBackInfo";
		}
		if(X6Basic.baseProduct.productManage.edit._prefix!=''){
			X6Basic.baseProduct.productManage.edit._prefix = X6Basic.baseProduct.productManage.edit._prefix.substring(1);
		}
		if(X6Basic.baseProduct.productManage.edit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(X6Basic.baseProduct.productManage.edit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof X6Basic.baseProduct.productManage.edit._querycustomFuncN == "function") {
				refparam += X6Basic.baseProduct.productManage.edit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		X6Basic.baseProduct.productManage.edit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			url : url,
			title : title,
			params : refparam
		});
	};
	
	X6Basic.baseProduct.productManage.edit._querycustomFunc = function(obj) {
		var str = eval("typeof(X6Basic.baseProduct.productManage.edit.query_"+obj+")!='undefined'") ? eval('X6Basic.baseProduct.productManage.edit.query_'+obj+'()') : null;
		return str;
	
	};
	
	X6Basic.baseProduct.productManage.edit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('X6Basic_baseProduct_productManage_edit_form',obj[0], X6Basic.baseProduct.productManage.edit._prefix, X6Basic.baseProduct.productManage.edit._sUrl);
		CUI.commonFills('X6Basic_baseProduct_productManage_edit_form',X6Basic.baseProduct.productManage.edit._prefix,obj[0]);

		try{
			if(X6Basic.baseProduct.productManage.edit._customCallBack) {
				eval(X6Basic.baseProduct.productManage.edit._customCallBack);
				X6Basic.baseProduct.productManage.edit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.baseProduct.productManage.edit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	X6Basic.baseProduct.productManage.edit.getcallBackInfo_DG_IE = function(obj){
		var gridEventObj = X6Basic.baseProduct.productManage.edit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,X6Basic.baseProduct.productManage.edit._sUrl);
		var xmlHead = gridEventObj.oGrid._DT.opts.oXMLData.childNodes[0].childNodes[0];
		for( var i = 0; i < xmlHead.childNodes.length; i++ ){
			var tagName = xmlHead.childNodes[i].tagName;
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
			if(X6Basic.baseProduct.productManage.edit._customCallBack) {
				eval(X6Basic.baseProduct.productManage.edit._customCallBack);
				X6Basic.baseProduct.productManage.edit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.baseProduct.productManage.edit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	X6Basic.baseProduct.productManage.edit.getcallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(X6Basic.baseProduct.productManage.edit._currRow).next().length==0){
					X6Basic.baseProduct.productManage.edit._oGrid.addNewRow();
				}	
				X6Basic.baseProduct.productManage.edit._currRow = $(X6Basic.baseProduct.productManage.edit._currRow).next();
				$(X6Basic.baseProduct.productManage.edit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(X6Basic.baseProduct.productManage.edit._currRow,obj[i],X6Basic.baseProduct.productManage.edit._prefix,X6Basic.baseProduct.productManage.edit._sUrl);
			eval("CUI.commonFills_DG(X6Basic.baseProduct.productManage.edit._currRow,X6Basic.baseProduct.productManage.edit._prefix,obj[i],X6Basic.baseProduct.productManage.edit._oGrid)");
		}
		try{
			if(X6Basic.baseProduct.productManage.edit._customCallBack) {
				eval(X6Basic.baseProduct.productManage.edit._customCallBack);
				X6Basic.baseProduct.productManage.edit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.baseProduct.productManage.edit._dialog.close();
		} catch(e){}
	};
	
	X6Basic.baseProduct.productManage.edit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(X6Basic.baseProduct.productManage.edit._oGrid, X6Basic.baseProduct.productManage.edit._currRow, X6Basic.baseProduct.productManage.edit._key, X6Basic.baseProduct.productManage.edit._displayFieldName, obj[i])
		}
		try{
			if(X6Basic.baseProduct.productManage.edit._customCallBack) {
				eval(X6Basic.baseProduct.productManage.edit._customCallBack);
				X6Basic.baseProduct.productManage.edit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.baseProduct.productManage.edit._dialog.close();
		} catch(e){}
	};
	
	X6Basic.baseProduct.productManage.edit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			X6Basic.baseProduct.productManage.edit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#X6Basic_baseProduct_productManage_edit_form'));
        			}
        	   	}
        	}
      	});
	};
	X6Basic.baseProduct.productManage.edit.beforeSubmitMethodSettingInPage = function(){
	};
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	X6Basic.baseProduct.productManage.edit.initCount = 0;
	X6Basic.baseProduct.productManage.edit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		var h = $('#X6Basic_edit_edit_div').parents('div.content').first().height();
		var datagrids = $('body').data('X6Basic_baseProduct_productManage_edit_datagrids');
		var	conHeight = h-$("#X6Basic_baseProduct_productManage_edit_main_div .edit-tabs").height() - 6;
		panesHeight = conHeight*0.4;
		$("#X6Basic_baseProduct_productManage_edit_main_div .edit-panes-s").each(function(index){
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
							if(X6Basic.baseProduct.productManage.edit.initCount <= 2) {
								setTimeout(function(){X6Basic.baseProduct.productManage.edit.initSize();}, 200);
								X6Basic.baseProduct.productManage.edit.initCount++;
							}/* else {
								X6Basic.baseProduct.productManage.edit.initCount = 0;
							}*/
						}
					}
				}
			} else {
				$(this).parent().height(conHeight-30);
				$(this).parent().css("overflow-y","auto");
			}
		});
	}

	$(function(){
		X6Basic.baseProduct.productManage.edit.initSize();
		$(window).bind("dialog.resize",function(){X6Basic.baseProduct.productManage.edit.initSize();});
	});
</script>
<script type="text/javascript">
	


	/* CUSTOM CODE START(view-EDIT-X6Basic_1.0_baseProduct_edit,js,X6Basic_1.0_baseProduct_ProductManage,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
</script>