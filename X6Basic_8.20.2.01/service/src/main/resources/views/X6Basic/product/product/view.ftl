<style type="text/css">.ewc-dialog-el{height:100%;}.edit-table{width:98%;margin:0 auto;}</style>
<script type="text/javascript">
	CUI.ns('X6Basic.product.product.view');
</script>
<link href="/struts/ec/style.css" rel="stylesheet" type="text/css" charset="utf-8"/>
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = true> 
	<#assign  fileuploadType = "X6Basic_product_product">
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
<#assign viewType = "readonly">
<@errorbar id="X6Basic_product_product_view_formDialogErrorBar" />
<@s.form id="X6Basic_product_product_view_form" cssStyle="height:100%;" onsubmitMethod="X6Basic.product.product.view.beforeSubmitMethod()" ecAction="/X6Basic/product/product/view/submit.action?__pc__=${(Parameters.__pc__)!}" callback="X6Basic.product.product.callBackInfo" ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="view">
	<input type="hidden" name="viewCode" value="X6Basic_1.0_product_view">
	<input type="hidden" name="datagridKey" value="X6Basic_product_product_view_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="product.version" value="${(product.version)!0}" />
	<input type="hidden" name="product.extraCol" value='' />
		<input type="hidden" name="product.creator.id" value="${(product.creator.id)!""}"/>
	<div id="X6Basic_view_edit_div" style="height:100%">
		<div id="X6Basic_product_product_view_main_div" class="edit-content-dialog">
<script type="text/javascript">
var attcountid = "X6Basic_product_product_view_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=X6Basic_1.0_product', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>			<div class="edit-panes" style="margin-top:0px;padding:0px;">
				<div>
				<div class="edit-panes-w">
<div class="edit-panes-s" style="width:98%;">
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td></tr>
		<tr class="dialog_tr">
				
							 					<#if !X6Basic_1_0_product_Product_code_permit??>
					<#assign X6Basic_1_0_product_Product_code_permit = checkFieldPermission('product.code','X6Basic_1.0_product_Product','X6Basic_1.0_product_Product_code')>
					</#if>
					<td <#if X6Basic_1_0_product_Product_code_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_product_Product_code_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1368681604500')}" >${getText('X6Basic.propertydisplayName.radion1368681604500')}</label>
				</td>
				
						<#assign product_code_defaultValue  = ''>
							 							<#assign product_code_defaultValue  = ''>
					<#if !X6Basic_1_0_product_Product_code_permit??>
					<#assign X6Basic_1_0_product_Product_code_permit = checkFieldPermission('product.code','X6Basic_1.0_product_Product','X6Basic_1.0_product_Product_code')>
					</#if>
					<td <#if X6Basic_1_0_product_Product_code_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-content"   style="text-align: left;;" >
							<#if X6Basic_1_0_product_Product_code_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input name="product.code" id="product_code"  style=";" originalvalue="<#if !newObj || (product.code)?has_content>${(product.code?html)!}<#else>${product_code_defaultValue!}</#if>" value="<#if !newObj || (product.code)?has_content>${(product.code?html)!}<#else>${product_code_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_product_Product_name_permit??>
					<#assign X6Basic_1_0_product_Product_name_permit = checkFieldPermission('product.name','X6Basic_1.0_product_Product','X6Basic_1.0_product_Product_name')>
					</#if>
					<td <#if X6Basic_1_0_product_Product_name_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_product_Product_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1368681673024')}" >${getText('X6Basic.propertydisplayName.radion1368681673024')}</label>
				</td>
				
						<#assign product_name_defaultValue  = ''>
							 							<#assign product_name_defaultValue  = ''>
					<#if !X6Basic_1_0_product_Product_name_permit??>
					<#assign X6Basic_1_0_product_Product_name_permit = checkFieldPermission('product.name','X6Basic_1.0_product_Product','X6Basic_1.0_product_Product_name')>
					</#if>
					<td <#if X6Basic_1_0_product_Product_name_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-content"   style="text-align: left;;" >
							<#if X6Basic_1_0_product_Product_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input name="product.name" id="product_name"  style=";" originalvalue="<#if !newObj || (product.name)?has_content>${(product.name?html)!}<#else>${product_name_defaultValue!}</#if>" value="<#if !newObj || (product.name)?has_content>${(product.name?html)!}<#else>${product_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
							 					<#if !X6Basic_1_0_product_Product_specific_permit??>
					<#assign X6Basic_1_0_product_Product_specific_permit = checkFieldPermission('product.specific','X6Basic_1.0_product_Product','X6Basic_1.0_product_Product_specific')>
					</#if>
					<td <#if X6Basic_1_0_product_Product_specific_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_product_Product_specific_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1368681879062')}" >${getText('X6Basic.propertydisplayName.radion1368681879062')}</label>
				</td>
				
						<#assign product_specific_defaultValue  = ''>
							 							<#assign product_specific_defaultValue  = ''>
					<#if !X6Basic_1_0_product_Product_specific_permit??>
					<#assign X6Basic_1_0_product_Product_specific_permit = checkFieldPermission('product.specific','X6Basic_1.0_product_Product','X6Basic_1.0_product_Product_specific')>
					</#if>
					<td <#if X6Basic_1_0_product_Product_specific_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if X6Basic_1_0_product_Product_specific_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input name="product.specific" id="product_specific"  style=";" originalvalue="<#if !newObj || (product.specific)?has_content>${(product.specific?html)!}<#else>${product_specific_defaultValue!}</#if>" value="<#if !newObj || (product.specific)?has_content>${(product.specific?html)!}<#else>${product_specific_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_product_Product_model_permit??>
					<#assign X6Basic_1_0_product_Product_model_permit = checkFieldPermission('product.model','X6Basic_1.0_product_Product','X6Basic_1.0_product_Product_model')>
					</#if>
					<td <#if X6Basic_1_0_product_Product_model_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_product_Product_model_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1368681895029')}" >${getText('X6Basic.propertydisplayName.radion1368681895029')}</label>
				</td>
				
						<#assign product_model_defaultValue  = ''>
							 							<#assign product_model_defaultValue  = ''>
					<#if !X6Basic_1_0_product_Product_model_permit??>
					<#assign X6Basic_1_0_product_Product_model_permit = checkFieldPermission('product.model','X6Basic_1.0_product_Product','X6Basic_1.0_product_Product_model')>
					</#if>
					<td <#if X6Basic_1_0_product_Product_model_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if X6Basic_1_0_product_Product_model_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input name="product.model" id="product_model"  style=";" originalvalue="<#if !newObj || (product.model)?has_content>${(product.model?html)!}<#else>${product_model_defaultValue!}</#if>" value="<#if !newObj || (product.model)?has_content>${(product.model?html)!}<#else>${product_model_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
							 					<#if !X6Basic_1_0_product_Product_unit_permit??>
					<#assign X6Basic_1_0_product_Product_unit_permit = checkFieldPermission('product.unit','X6Basic_1.0_product_Product','X6Basic_1.0_product_Product_unit')>
					</#if>
					<td <#if X6Basic_1_0_product_Product_unit_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_product_Product_unit_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1368681711641')}" >${getText('X6Basic.propertydisplayName.radion1368681711641')}</label>
				</td>
				
						<#assign product_unit_defaultValue  = ''>
							 							<#assign product_unit_defaultValue  = ''>
					<#if !X6Basic_1_0_product_Product_unit_permit??>
					<#assign X6Basic_1_0_product_Product_unit_permit = checkFieldPermission('product.unit','X6Basic_1.0_product_Product','X6Basic_1.0_product_Product_unit')>
					</#if>
					<td <#if X6Basic_1_0_product_Product_unit_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if X6Basic_1_0_product_Product_unit_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input name="product.unit" id="product_unit"  style=";" originalvalue="<#if !newObj || (product.unit)?has_content>${(product.unit?html)!}<#else>${product_unit_defaultValue!}</#if>" value="<#if !newObj || (product.unit)?has_content>${(product.unit?html)!}<#else>${product_unit_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_product_Product_currQuantity_permit??>
					<#assign X6Basic_1_0_product_Product_currQuantity_permit = checkFieldPermission('product.currQuantity','X6Basic_1.0_product_Product','X6Basic_1.0_product_Product_currQuantity')>
					</#if>
					<td <#if X6Basic_1_0_product_Product_currQuantity_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_product_Product_currQuantity_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1368847653211')}" >${getText('X6Basic.propertydisplayName.radion1368847653211')}</label>
				</td>
				
						<#assign product_currQuantity_defaultValue  = ''>
							 							<#assign product_currQuantity_defaultValue  = ''>
					<#if !X6Basic_1_0_product_Product_currQuantity_permit??>
					<#assign X6Basic_1_0_product_Product_currQuantity_permit = checkFieldPermission('product.currQuantity','X6Basic_1.0_product_Product','X6Basic_1.0_product_Product_currQuantity')>
					</#if>
					<td <#if X6Basic_1_0_product_Product_currQuantity_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if X6Basic_1_0_product_Product_currQuantity_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
									<input name="product.currQuantity" id="product_currQuantity"  style=";" originalvalue="<#if newObj&& !(product.currQuantity)?has_content>${product_currQuantity_defaultValue!}<#elseif (product.currQuantity)?has_content>#{(product.currQuantity)!; m2M2}</#if>" value="<#if newObj&& !(product.currQuantity)?has_content>${product_currQuantity_defaultValue!}<#elseif (product.currQuantity)?has_content>#{(product.currQuantity)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
												<#if !X6Basic_1_0_product_Product_creator_base_staff_name_permit??>
					<#assign X6Basic_1_0_product_Product_creator_base_staff_name_permit = checkFieldPermission('product.creator.name','X6Basic_1.0_product_Product','base_staff_name')>
					</#if>
					<td <#if X6Basic_1_0_product_Product_creator_base_staff_name_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_product_Product_creator_base_staff_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1368682044237')}" >${getText('X6Basic.propertydisplayName.radion1368682044237')}</label>
				</td>
				
						<#assign product_creator_name_defaultValue  = 'currentUser'>
												<#if !X6Basic_1_0_product_Product_creator_base_staff_name_permit??>
					<#assign X6Basic_1_0_product_Product_creator_base_staff_name_permit = checkFieldPermission('product.creator.name','X6Basic_1.0_product_Product','base_staff_name')>
					</#if>
					<td <#if X6Basic_1_0_product_Product_creator_base_staff_name_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_product_Product_creator_base_staff_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if X6Basic_1_0_product_Product_creator_base_staff_name_permit == 1>
									<@mneclient reftitle="${getText('foundation.ec.entity.view.reference')}" conditionfunc="X6Basic.product.product.view._querycustomFunc('product_creator_name')" view=true value="${(product.creator.name)!}" displayFieldName="name" name="product.creator.name" id="product_creator_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="X6Basic_product_product_view_form" editCustomCallback=";" onkeyupfuncname=";_callback_product_creator_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false/>
								<#else>
									<@mneclient reftitle="${getText('foundation.ec.entity.view.reference')}" viewType="${viewType!}" deValue="${product_creator_name_defaultValue!}" conditionfunc="X6Basic.product.product.view._querycustomFunc('product_creator_name')" view=true  value="${(product.creator.name)!}" displayFieldName="name" name="product.creator.name" id="product_creator_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="X6Basic_product_product_view_form" editCustomCallback=";" onkeyupfuncname=";_callback_product_creator_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false/>
								</#if>
								
								<script type="text/javascript">
								<#if newObj && (product_creator_name_defaultValue)=='currentUser'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.id}'};
											obj = foundation.common.getObject('X6Basic_product_product_view_form',obj, 'product.creator', '/foundation/staff/common/staffListFrameset.action');
											CUI.commonFills('X6Basic_product_product_view_form', 'product.creator',obj);
										});
									})(jQuery);
								</#if>
								<#if !(product.id)?? && (product.creator.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${product.creator.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('X6Basic_product_product_view_form',obj, 'product.creator', '/foundation/staff/common/staffListFrameset.action');
												CUI.commonFills('X6Basic_product_product_view_form', 'product.creator',obj);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_product_Product_createDate_permit??>
					<#assign X6Basic_1_0_product_Product_createDate_permit = checkFieldPermission('product.createDate','X6Basic_1.0_product_Product','X6Basic_1.0_product_Product_createDate')>
					</#if>
					<td <#if X6Basic_1_0_product_Product_createDate_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_product_Product_createDate_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1368682378525')}" >${getText('X6Basic.propertydisplayName.radion1368682378525')}</label>
				</td>
				
						<#assign product_createDate_defaultValue  = ''>
							 							<#assign product_createDate_defaultValue  = ''>
					<#if (product_createDate_defaultValue)?? &&(product_createDate_defaultValue)?has_content>
							<#assign product_createDate_defaultValue  = getDefaultDateTime(product_createDate_defaultValue!)?date>
					</#if>
					<#if !X6Basic_1_0_product_Product_createDate_permit??>
					<#assign X6Basic_1_0_product_Product_createDate_permit = checkFieldPermission('product.createDate','X6Basic_1.0_product_Product','X6Basic_1.0_product_Product_createDate')>
					</#if>
					<td <#if X6Basic_1_0_product_Product_createDate_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content" celltype="DATE"  style="text-align: left;;" >
							<#if X6Basic_1_0_product_Product_createDate_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<#if newObj && !(product.createDate)?has_content>
								<#if X6Basic_1_0_product_Product_createDate_permit == 1>
								<@datepicker  cssClass="cui-noborder-input" name="product.createDate" type="date" value="${product_createDate_defaultValue!}" id="product.createDate" view=true cssStyle=""  />
								<#else>
								<@datepicker  cssClass="cui-noborder-input" name="product.createDate" type="date" value="${product_createDate_defaultValue!}" id="product.createDate"  view=true  cssStyle=""  />
								</#if>
							<#else>
							<#if (product.createDate)??>
								<#if X6Basic_1_0_product_Product_createDate_permit == 1>
								<@datepicker  cssClass="cui-noborder-input" name="product.createDate" type="date" value="${product.createDate?string('yyyy-MM-dd')}" id="product.createDate" view=true cssStyle=""  />
								<#else>
								<@datepicker  cssClass="cui-noborder-input" name="product.createDate" type="date" value="${product.createDate?string('yyyy-MM-dd')}" id="product.createDate"  view=true  cssStyle=""  />
								</#if>
							<#else>
								<#if X6Basic_1_0_product_Product_createDate_permit == 1>
								<@datepicker  cssClass="cui-noborder-input" name="product.createDate" type="date" value="" id="product.createDate" cssStyle="" view=true />
								<#else>
								<@datepicker  cssClass="cui-noborder-input" name="product.createDate" type="date" value="" id="product.createDate" cssStyle=""   view=true />
								</#if>
							</#if>
							</#if>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
							 					<#if !X6Basic_1_0_product_Product_prodMemo_permit??>
					<#assign X6Basic_1_0_product_Product_prodMemo_permit = checkFieldPermission('product.prodMemo','X6Basic_1.0_product_Product','X6Basic_1.0_product_Product_prodMemo')>
					</#if>
					<td <#if X6Basic_1_0_product_Product_prodMemo_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_product_Product_prodMemo_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1368681949671')}" >${getText('X6Basic.propertydisplayName.radion1368681949671')}</label>
				</td>
				
						<#assign product_prodMemo_defaultValue  = ''>
							 							<#assign product_prodMemo_defaultValue  = ''>
					<#if !X6Basic_1_0_product_Product_prodMemo_permit??>
					<#assign X6Basic_1_0_product_Product_prodMemo_permit = checkFieldPermission('product.prodMemo','X6Basic_1.0_product_Product','X6Basic_1.0_product_Product_prodMemo')>
					</#if>
					<td <#if X6Basic_1_0_product_Product_prodMemo_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="3" style="text-align: left;;" >
							<#if X6Basic_1_0_product_Product_prodMemo_permit == 0>
							<div class="fix-input-readonly fix-ie7-textarea"><textarea id="product_prodMemo" class="cui-noborder-textarea nopermit cui-textarea-auto" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"></textarea></div>
							<#else>
							<div class="fix-input-readonly fix-ie7-textarea"><textarea id="product_prodMemo" originalvalue="<#if !newObj || (product.prodMemo)?has_content>${(product.prodMemo?html)!}<#else>${product_prodMemo_defaultValue?html}</#if>"  name="product.prodMemo" class="cui-noborder-textarea cui-textarea-auto" readonly="readonly" style=";" ><#if !newObj || (product.prodMemo)?has_content>${(product.prodMemo)!}<#else>${product_prodMemo_defaultValue}</#if></textarea></div>
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
<!-- CUSTOM CODE START(view-VIEW-X6Basic_1.0_product_view,html,X6Basic_1.0_product_Product,X6Basic_1.0) -->
<!-- 自定义代码 -->
<!-- CUSTOM CODE END -->
<script type="text/javascript">
	X6Basic.product.product.view.beforeSaveProcess = function(){}
	X6Basic.product.product.view.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(X6Basic.product.product.view.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#X6Basic_product_product_view_form').trigger('beforeSubmit');
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
		
	};
	(function($){

		$(function(){
			$("ul.edit-tabs").tabs("div.edit-panes > div");
		});
	})(jQuery);
	X6Basic.product.product.view.validate = function(){
		return true;
	}
	
	
	//打印
	X6Basic.product.product.view.print = function(url){
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
		
		X6Basic.product.product.view.saveSetting = function(){
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
		
		X6Basic.product.product.view.printSetting = function(){
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
			X6Basic.product.product.view.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(X6Basic.product.product.view.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
				})
				X6Basic.product.product.view.settingDialog.show();
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
			X6Basic.product.product.view._customCallBack = customCallBack;
		}
		X6Basic.product.product.view._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	
	//参照复制函数
	X6Basic.product.product.view.referenceCopy = function(objName,url, dialog){
		var callbackName ="X6Basic.product.product.view.referenceCopyBackInfo";
		X6Basic.product.product.view.dialog = dialog;
		X6Basic.product.product.view._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			url : url,
			title : "${getText('ec.view.property.refview')}",
			params : null
		});
	}
	
	X6Basic.product.product.view.referenceCopyBackInfo = function(obj){
		if(X6Basic.product.product.view._dialog){
			X6Basic.product.product.view._dialog.close();
		}
		createLoadPanel(false,X6Basic.product.product.view.dialog._el);
		var value = document.getElementById("id").value;
		if(isFormChanged('X6Basic_product_product_view_form','X6Basic_product_product_view_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(X6Basic.product.product.view.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(X6Basic.product.product.view.dialog._el).load('/X6Basic/product/product/view.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			$(X6Basic.product.product.view.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(X6Basic.product.product.view.dialog._el).load('/X6Basic/product/product/view.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	X6Basic.product.product.view.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		X6Basic.product.product.view.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		X6Basic.product.product.view._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			X6Basic.product.product.view._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	X6Basic.product.product.view._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var callbackName="";
		X6Basic.product.product.view._prefix = '';
		X6Basic.product.product.view._oGrid = oGrid;
		X6Basic.product.product.view._sUrl = url;
		if(customCallBack){
			X6Basic.product.product.view._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			X6Basic.product.product.view.gridEventObj = gridEventObj;
			callbackName = "X6Basic.product.product.view.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				X6Basic.product.product.view._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "X6Basic.product.product.view.getMultiselectCallBackInfo_DG" : "X6Basic.product.product.view.getcallBackInfo_DG";
			X6Basic.product.product.view._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				X6Basic.product.product.view._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="X6Basic.product.product.view.getcallBackInfo";
		}
		if(X6Basic.product.product.view._prefix!=''){
			X6Basic.product.product.view._prefix = X6Basic.product.product.view._prefix.substring(1);
		}
		if(X6Basic.product.product.view._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + X6Basic.product.product.view._querycustomFunc(objName.replace(/\./g, '_')).replace(/\s+/g,'@@space_quote@@').replace(/\"/g,'@@double_quote@@').replace(/\'/g,'@@single_quote@@').replace(/%/g,'@@wcard_quote@@').replace(/=/g,'@@equal_quote@@');
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		X6Basic.product.product.view._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			url : url,
			title : title,
			params : refparam
		});
	};
	
	X6Basic.product.product.view._querycustomFunc = function(obj) {
		var str = eval("typeof(X6Basic.product.product.view.query_"+obj+")!='undefined'") ? eval('X6Basic.product.product.view.query_'+obj+'()') : null;
		return str;
	
	};
	
	X6Basic.product.product.view.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('X6Basic_product_product_view_form',obj[0], X6Basic.product.product.view._prefix, X6Basic.product.product.view._sUrl);
		CUI.commonFills('X6Basic_product_product_view_form',X6Basic.product.product.view._prefix,obj[0]);

		try{
			if(X6Basic.product.product.view._customCallBack) {
				eval(X6Basic.product.product.view._customCallBack);
				X6Basic.product.product.view._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.product.product.view._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	X6Basic.product.product.view.getcallBackInfo_DG_IE = function(obj){
		var gridEventObj = X6Basic.product.product.view.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,X6Basic.product.product.view._sUrl);
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
			if(X6Basic.product.product.view._customCallBack) {
				eval(X6Basic.product.product.view._customCallBack);
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.product.product.view._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	X6Basic.product.product.view.getcallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(X6Basic.product.product.view._currRow).next().length==0){
					X6Basic.product.product.view._oGrid.addNewRow();
				}	
				X6Basic.product.product.view._currRow = $(X6Basic.product.product.view._currRow).next();
				$(X6Basic.product.product.view._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(X6Basic.product.product.view._currRow,obj[i],X6Basic.product.product.view._prefix,X6Basic.product.product.view._sUrl);
			eval("CUI.commonFills_DG(X6Basic.product.product.view._currRow,X6Basic.product.product.view._prefix,obj[i],X6Basic.product.product.view._oGrid)");
		}
		try{
			if(X6Basic.product.product.view._customCallBack) {
				eval(X6Basic.product.product.view._customCallBack);
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.product.product.view._dialog.close();
		} catch(e){}
	};
	
	X6Basic.product.product.view.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(X6Basic.product.product.view._oGrid, X6Basic.product.product.view._currRow, X6Basic.product.product.view._key, X6Basic.product.product.view._displayFieldName, obj[i])
		}
		try{
			if(X6Basic.product.product.view._customCallBack) {
				eval(X6Basic.product.product.view._customCallBack);
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.product.product.view._dialog.close();
		} catch(e){}
	};
	
	X6Basic.product.product.view.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			X6Basic.product.product.view.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#X6Basic_product_product_view_form'));
        			}
        	   	}
        	}
      	});
	};
	X6Basic.product.product.view.beforeSubmitMethodSettingInPage = function(){
	};
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	X6Basic.product.product.view.initCount = 0;
	X6Basic.product.product.view.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		var h = $('#X6Basic_view_edit_div').parents('div.content').first().height();
		var datagrids = $('body').data('X6Basic_product_product_view_datagrids');
		var	conHeight = h-$("#X6Basic_product_product_view_main_div .edit-tabs").height() - 6;
		panesHeight = conHeight*0.4;
		$("#X6Basic_product_product_view_main_div .edit-panes-s").each(function(index){
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
							
							dgwidget.setHeight(perHeight - 68 + 20);
							
						} else {
							if(X6Basic.product.product.view.initCount <= 2) {
								setTimeout(function(){X6Basic.product.product.view.initSize();}, 200);
								X6Basic.product.product.view.initCount++;
							}/* else {
								X6Basic.product.product.view.initCount = 0;
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
		X6Basic.product.product.view.initSize();
		$(window).bind("dialog.resize",function(){X6Basic.product.product.view.initSize();});
	});
</script>
<script type="text/javascript">
	


	/* CUSTOM CODE START(view-VIEW-X6Basic_1.0_product_view,js,X6Basic_1.0_product_Product,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
</script>