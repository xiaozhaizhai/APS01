<#assign isWorkflow = false> 
<#assign isAttachment = true> 
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
<#assign viewType = "readonly">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>${getText('X6Basic.viewtitle.radion1371469291062')}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		body{_width:100%;}
		.ewc-dialog-el{height:100%;}
		.flow-height{
			height:97%;
			height:94%\9;
		}
		#X6Basic_baseProduct_productManage_view_form{float:left;width:100%;}		
		.pd-top{padding-top:10px}
		</style>
		<script type="text/javascript">
			CUI.ns('X6Basic.baseProduct.productManage.view');
		</script>
    </head>
	<body>
		<@loadpanel/>
		<div id="load_mask_first" class="load_mask_first"></div>
		<iframe id="load_iframe_ie_first" class="load_iframe_ie" style="z-index: 199; display: block;"></iframe>
		<div id="loading_wrap_first" class="loading_wrap_first">
			<div class="loading_process">
				<div class="loading_msg_first">${getText("foundation.common.data.waiting")}</div>
			</div>
		</div>
		<@s.form errorBarId="workbenchErrorBar" onsubmitMethod="X6Basic.baseProduct.productManage.view.beforeSubmitMethod()" id="X6Basic_baseProduct_productManage_view_form" namespace="/X6Basic/baseProduct/productManage/view" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=X6Basic_1.0_baseProduct_ProductManage&_bapFieldPermissonModelName_=ProductManage" callback="X6Basic.baseProduct.productManage.view._callBackInfo" ecform="true">
		<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
		<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="X6Basic_baseProduct_productManage_view_main_div">
    					<div class="edit-head">
    						<#if !((Parameters.mobileFlag)?? && Parameters.mobileFlag == 'true')>
    						<div class="edit-menubar">
								<div class="fl">
									<#if pendingId??>
									<div class="edit-btn" id="edit-save-btn" onclick="X6Basic.baseProduct.productManage.view.save()">
										<a class="cui-btn-l">&nbsp;</a>
										<a class="cui-btn-c">${getHtmlText("ec.flow.save")}</a>
										<a class="cui-btn-r">&nbsp;</a>
									</div>
									</#if>
									<#if pendingId??>
									<div class="edit-btn"  onclick="X6Basic.baseProduct.productManage.view.proxyPending(${pendingId})">
										<a class="cui-btn-l" >&nbsp;</a>
										<a class="cui-btn-c">${getHtmlText("ec.pending.proxyPending")}</a>
										<a class="cui-btn-r">&nbsp;</a>
									</div>
									</#if>
									<div class="edit-btn"  onclick="window.close()">
										<a class="cui-btn-l">&nbsp;</a>
										<a class="cui-btn-c">${getHtmlText("foundation.common.closeWindow")}</a>
										<a class="cui-btn-r">&nbsp;</a>
									</div>
								</div>
								<div class="fr">
									<ul>
										<li onMouseOver="this.style.color='#ffc001'" onMouseOut="this.style.color='#FFFFFF'"><a onclick="X6Basic.baseProduct.productManage.view.showInfoDialog('fileUpload')" <#if id??>style="position:relative\0;position:static\9\0;bottom:1px\0;"</#if>>${getHtmlText("foundation.upload.attachment")}<span id="X6Basic_baseProduct_productManage_view_form_attcount"></span></a></li>
									</ul>
								</div>
							</div>
							</#if>
							<div class="edit-title fix">								
								<span class="edit-title-view"></span>
								<h1>${getText('X6Basic.viewtitle.radion1371469291062')}</h1>
							</div>
    					</div>
    					<div class="edit-main">
    						<div class="edit-content">
								<input type="hidden" name="viewselect" value="view">
								<input type="hidden" name="datagridKey" value="X6Basic_baseProduct_productManage_view_datagrids">
								<input type="hidden" name="viewCode" value="X6Basic_1.0_baseProduct_view">
								<input type="hidden" id="id" name="id" value="${id!}" />
								<input type="hidden" name="productManage.version" value="${(productManage.version)!0}" />
								<input type="hidden" name="productManage.extraCol" value='' />
								<input type="hidden" name="operateType" id="operateType" />
										<input type="hidden" name="productManage.createStaff.id" value="${(productManage.createStaff.id)!""}" originalvalue="${(productManage.createStaff.id)!""}"/>

		<div class="dash-line"></div>
<script type="text/javascript">
var attcountid = "X6Basic_baseProduct_productManage_view_form"+"_attcount";
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
</script>								<div class="edit-panes edit-panes-w clearfix">
										<div class="cui-elements pd-top">
<div class="edit-panes-s" style="width:98%;margin-left:10px;">
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td></tr>
		<tr >
				
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
							<div class="fix-input-readonly">
								<input name="productManage.code" id="productManage_code"  style=";" originalvalue="<#if !newObj || (productManage.code)?has_content>${(productManage.code?html)!}<#else>${productManage_code_defaultValue!}</#if>" value="<#if !newObj || (productManage.code)?has_content>${(productManage.code?html)!}<#else>${productManage_code_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
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
							<div class="fix-input-readonly">
								<input name="productManage.name" id="productManage_name"  style=";" originalvalue="<#if !newObj || (productManage.name)?has_content>${(productManage.name?html)!}<#else>${productManage_name_defaultValue!}</#if>" value="<#if !newObj || (productManage.name)?has_content>${(productManage.name?html)!}<#else>${productManage_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr >
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
							<div class="fix-input-readonly">
								<input name="productManage.specific" id="productManage_specific"  style=";" originalvalue="<#if !newObj || (productManage.specific)?has_content>${(productManage.specific?html)!}<#else>${productManage_specific_defaultValue!}</#if>" value="<#if !newObj || (productManage.specific)?has_content>${(productManage.specific?html)!}<#else>${productManage_specific_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
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
							<div class="fix-input-readonly">
								<input name="productManage.models" id="productManage_models"  style=";" originalvalue="<#if !newObj || (productManage.models)?has_content>${(productManage.models?html)!}<#else>${productManage_models_defaultValue!}</#if>" value="<#if !newObj || (productManage.models)?has_content>${(productManage.models?html)!}<#else>${productManage_models_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr >
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
							<div class="fix-input-readonly">
								<input name="productManage.unit" id="productManage_unit"  style=";" originalvalue="<#if !newObj || (productManage.unit)?has_content>${(productManage.unit?html)!}<#else>${productManage_unit_defaultValue!}</#if>" value="<#if !newObj || (productManage.unit)?has_content>${(productManage.unit?html)!}<#else>${productManage_unit_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
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
							<div class="fix-input-readonly">
									<input name="productManage.currQuantity" id="productManage_currQuantity"  style=";" originalvalue="<#if newObj&& !(productManage.currQuantity)?has_content>${productManage_currQuantity_defaultValue!}<#elseif (productManage.currQuantity)?has_content>#{(productManage.currQuantity)!; m2M2}</#if>" value="<#if newObj&& !(productManage.currQuantity)?has_content>${productManage_currQuantity_defaultValue!}<#elseif (productManage.currQuantity)?has_content>#{(productManage.currQuantity)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							</#if>
				</td>
				</tr><tr >
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
									<@mneclient reftitle="${getText('foundation.ec.entity.view.reference')}" conditionfunc="X6Basic.baseProduct.productManage.view._querycustomFunc('productManage_createStaff_name')" view=true value="${(productManage.createStaff.name)!}" displayFieldName="name" name="productManage.createStaff.name" id="productManage_createStaff_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="X6Basic_baseProduct_productManage_view_form" editCustomCallback=";" onkeyupfuncname=";_callback_productManage_createStaff_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false/>
								<#else>
									<@mneclient reftitle="${getText('foundation.ec.entity.view.reference')}" viewType="${viewType!}" deValue="${productManage_createStaff_name_defaultValue!}" conditionfunc="X6Basic.baseProduct.productManage.view._querycustomFunc('productManage_createStaff_name')" view=true  value="${(productManage.createStaff.name)!}" displayFieldName="name" name="productManage.createStaff.name" id="productManage_createStaff_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="X6Basic_baseProduct_productManage_view_form" editCustomCallback=";" onkeyupfuncname=";_callback_productManage_createStaff_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false/>
								</#if>
								
								<script type="text/javascript">
								<#if newObj && (productManage_createStaff_name_defaultValue)=='currentUser'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.id}'};
											obj = foundation.common.getObject('X6Basic_baseProduct_productManage_view_form',obj, 'productManage.createStaff', '/foundation/staff/common/staffListFrameset.action');
											CUI.commonFills('X6Basic_baseProduct_productManage_view_form', 'productManage.createStaff',obj,true);
											$('input:hidden[name="productManage.createStaff.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(productManage.id)?? && (productManage.createStaff.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${productManage.createStaff.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('X6Basic_baseProduct_productManage_view_form',obj, 'productManage.createStaff', '/foundation/staff/common/staffListFrameset.action');
												CUI.commonFills('X6Basic_baseProduct_productManage_view_form', 'productManage.createStaff',obj,true);
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
								<@datepicker  cssClass="cui-noborder-input" name="productManage.createTime" value="${productManage_createTime_defaultValue!}" type="dateTime"  id="productManage.createTime"  view=true cssStyle=""  />
								</#if>
							<#else>
							<#if (productManage.createTime)??>
								<#if X6Basic_1_0_baseProduct_ProductManage_createTime_permit == 1>
								<@datepicker  cssClass="cui-noborder-input" name="productManage.createTime" value="${productManage.createTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="productManage.createTime" view=true cssStyle=""  />
								<#else>
								<@datepicker  cssClass="cui-noborder-input" name="productManage.createTime" value="${productManage.createTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="productManage.createTime"  view=true cssStyle=""  />
								</#if>
							<#else>
								<#if X6Basic_1_0_baseProduct_ProductManage_createTime_permit == 1>
								<@datepicker  cssClass="cui-noborder-input" name="productManage.createTime" value="" type="dateTime" id="productManage.createTime" cssStyle="" view=true />
								<#else>
								<@datepicker  cssClass="cui-noborder-input" name="productManage.createTime" value="" type="dateTime" id="productManage.createTime" cssStyle=""   view=true />
								</#if>
							</#if>
							</#if>
							</#if>
				</td>
				</tr><tr >
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
							<div class="fix-input-readonly fix-ie7-textarea"><textarea id="productManage_prodMemo" originalvalue="<#if !newObj || (productManage.prodMemo)?has_content>${(productManage.prodMemo?html)!}<#else>${productManage_prodMemo_defaultValue?html}</#if>"  name="productManage.prodMemo" class="cui-noborder-textarea cui-textarea-auto" readonly="readonly" style=";" ><#if !newObj || (productManage.prodMemo)?has_content>${(productManage.prodMemo)!}<#else>${productManage_prodMemo_defaultValue}</#if></textarea></div>
							</#if>
				</td>
		</tr>
	</table>
</div>										</div>
										<div class="edit-datatable">	
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
		<div id="X6Basic_baseProduct_productManage_view" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<li id="fileUploadHead" class="bar" onclick="X6Basic.baseProduct.productManage.view.showFileUpload('fileUpload')">${getText("foundation.upload.attachment")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<div id="fileUploadDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-VIEW-X6Basic_1.0_baseProduct_view,html,X6Basic_1.0_baseProduct_ProductManage,X6Basic_1.0) -->
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
						$("#X6Basic_baseProduct_productManage_view_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#X6Basic_baseProduct_productManage_view_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#X6Basic_baseProduct_productManage_view_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#X6Basic_baseProduct_productManage_view_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			X6Basic.baseProduct.productManage.view.initCount = 0;
			X6Basic.baseProduct.productManage.view.initSize = function(nTabIndex){
				var panesHeight;
				var thisHeight;
				var h = $(window).height();
				<#if businessCenterList??&&businessCenterList?size gt 0 >
				if($("#edit_sidebar").css("display") === "none"){
					$(".edit-workflow").css("left",1);
				}else{
					$(".edit-workflow").css("left",145);
				}
				$("#edit_sidebar").height(h);
				$(".edit-sidebar-inner").height(h);
				$("#edit_side_btn").css("top",(h-50)/2);
				var businessHeight=CUI("html").height();
				CUI('div[id^="otherContentDiv_"]').height(businessHeight);
				</#if>
				var conHeight = h-$("#X6Basic_baseProduct_productManage_view_main_div .edit-head").height()-$("#X6Basic_baseProduct_productManage_view_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#X6Basic_baseProduct_productManage_view_main_div .edit-workflow").height()</#if>;
				panesHeight = conHeight*0.4;
				var datagrids = $('body').data('X6Basic_baseProduct_productManage_view_datagrids');
				$("#X6Basic_baseProduct_productManage_view_main_div .edit-panes-s").each(function(index){
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
									// PT间距有调整，需要多减15
									dgwidget.setHeight(perHeight - 68);
									
								} else {
									if(X6Basic.baseProduct.productManage.view.initCount <= 2) {
										setTimeout(function(){X6Basic.baseProduct.productManage.view.initSize();}, 200);
										X6Basic.baseProduct.productManage.view.initCount++;
									}/* else {
										X6Basic.baseProduct.productManage.view.initCount = 0;
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
				X6Basic.baseProduct.productManage.view.initSize();
				if(YAHOO.env.ua.ie == 6){
					$("#loading_wrap_first").css("display","block");
				}
				$("#load_mask_first").remove();
				$("#load_iframe_ie_first").remove();
				$("#loading_wrap_first").remove();
				<#if businessCenterList??&&businessCenterList?size gt 0 >
					$(".edit-workflow").css("left",145);
					$("#edit_side_btn").toggle(function(){
						if(parseInt($("#X6Basic_baseProduct_productManage_view_main_div").css("width"),10)==650){
							$("#X6Basic_baseProduct_productManage_view_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//X6Basic.baseProduct.productManage.view.resizeLayout();
						//X6Basic.baseProduct.productManage.view.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#X6Basic_baseProduct_productManage_view_main_div").css("width"),10)==800){
							$("#X6Basic_baseProduct_productManage_view_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//X6Basic.baseProduct.productManage.view.resizeLayout();
						//X6Basic.baseProduct.productManage.view.initSize();
						$('body').trigger('resize');
					});
				<#else>	
					$(".main-wrap").css("margin-left",0);
					$(".col-sub").width(0);
					$("#edit_side_btn").css("left",0);
					$(".edit-workflow").css("left",1);
					
				</#if>
				
				$("ul.edit-tabs").tabs("div.edit-panes > div");
				var datatableHeight;
				var bh = $(".edit-workflow tr:gt(0)").height();
				<#if pendingId?? || editNew>
				$("#workflow_toggle").toggle(function(){
					$(".edit-workflow tr:gt(0)").hide();
					X6Basic.baseProduct.productManage.view.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					X6Basic.baseProduct.productManage.view.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){X6Basic.baseProduct.productManage.view.initSize();});
				/*
				X6Basic.baseProduct.productManage.view.resizeLayout=function(){
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
		(function($){
			$(function(){
				if(CUI("#dealInfoContain")){
					CUI("#dealInfoContain").load("/ec/workflow/dealInfo.action?dlTableInfoId=${tableInfoId!}&preName=mainFrame&dealDataUrl=/X6Basic/baseProduct/productManage/dealInfo-list.action");
				}
			});
		})(jQuery);
		X6Basic.baseProduct.productManage.view.validate = function(){
			return true;
		}
		X6Basic.baseProduct.productManage.view.beforeSaveProcess = function(){
			$('input[name="productManage.extraCol"]').remove();
		}
		X6Basic.baseProduct.productManage.view.processDataGrid = function(){
		};
		X6Basic.baseProduct.productManage.view.save = function(){
			$('#operateType').val("submit");
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!X6Basic.baseProduct.productManage.view.validate()){return;}
			X6Basic.baseProduct.productManage.view.beforeSaveProcess();

			//X6Basic.baseProduct.productManage.view.processDataGrid();
			
			$('#X6Basic_baseProduct_productManage_view_form').submit();
		}
		
		<#if viewType != "readonly">
		window.onbeforeunload = function() {      
		        if(isFormChanged('X6Basic_baseProduct_productManage_view_form','X6Basic_baseProduct_productManage_view_datagrids')) {      
		            return "${getText('ec.view.losedata')}";      
		        }else{
		        	 if($('#workflow_comments').length!=0){
			        	if($('#workflow_comments').val()!=null && $('#workflow_comments').val()!=""){
			        		return "${getText('ec.view.losedata')}";
			        	}
				     }  
		        }      
		}
		<#else>
		window.onbeforeunload = function() {      
		        if($('#workflow_comments').length!=0){
		        	if($('#workflow_comments').val()!=null && $('#workflow_comments').val()!=""){
		        		return "${getText('ec.view.losedata')}";
		        	}
		        }     
		}
		</#if>
		//打印
		X6Basic.baseProduct.productManage.view.print = function(){
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
				var url = document.location.href;
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
		
		X6Basic.baseProduct.productManage.view.saveSetting = function(){
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
		
		X6Basic.baseProduct.productManage.view.printSetting = function(){
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
			X6Basic.baseProduct.productManage.view.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(X6Basic.baseProduct.productManage.view.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
				})
				X6Basic.baseProduct.productManage.view.settingDialog.show();
		}
		
		X6Basic.baseProduct.productManage.view._callBackInfo = function(res){
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

 				if(res.operateType == 'save'){
 					var url = "/foundation/user/open-pending.action?pendingId=" + res.pendingId + "&tableInfoId=" + res.tableInfoId + "&id=" + res.id + "&entityCode=X6Basic_1.0_baseProduct";
					document.location.href=url;
					return;
 				}

 				try{
					window.opener.WorkFlowCallbackRefresh();
					window.opener.timeData();
				}catch(e){
					try{
 						window.opener.X6Basic.baseProduct.productManage.editCallBackInfo(); 						
					}catch(e2){
						try{
							window.opener.reload();
						}catch(e3){}
					}
				};
 				
 				setTimeout(function(){
					window.close();
				},1000);
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.X6Basic.baseProduct.productManage.editCallBackInfo();}catch(e){try{window.opener.reload();}catch(e2){}};window.close();});
			} else {
				CUI.showErrorInfos(res);
			}
		};
		
		//控件版PT选人查看按钮单击事件处理函数
		function dataGridBtnImgClick(sUrl,objNameCustomCondition,sTitle,sPTGridID,nRow,sFieldName,oGrid,customCallBack,crossCompany){
			//保存当前单击事件的对象信息
			var obj = {
				"oGrid" : oGrid,
				"nRow" : nRow - 1,
				"sKey":	sFieldName
			}
			if(customCallBack){
				X6Basic.baseProduct.productManage.view._customCallBack = customCallBack;
			}
			X6Basic.baseProduct.productManage.view._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		X6Basic.baseProduct.productManage.view.initMnemonic_DG_IE = function(oConfig){
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			X6Basic.baseProduct.productManage.view.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			X6Basic.baseProduct.productManage.view._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				X6Basic.baseProduct.productManage.view._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		X6Basic.baseProduct.productManage.view._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){

			var callbackName="";
			var _prefix= '';
			var arr = objName.split('.');
			if(gridEventObj) {
				X6Basic.baseProduct.productManage.view.gridEventObj = gridEventObj;
				callbackName = "X6Basic.baseProduct.productManage.view.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "X6Basic.baseProduct.productManage.view.getMultiselectCallBackInfo_DG" : "X6Basic.baseProduct.productManage.view.getcallBackInfo_DG";
				X6Basic.baseProduct.productManage.view._currRow = obj.parentNode.parentNode.parentNode;
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="X6Basic.baseProduct.productManage.view.getcallBackInfo";
			}

			if(_prefix!=''){
				X6Basic.baseProduct.productManage.view._prefix = _prefix.substring(1);
			}
			
			X6Basic.baseProduct.productManage.view._oGrid = oGrid;
			X6Basic.baseProduct.productManage.view._sUrl = url;
			if(customCallBack){
				X6Basic.baseProduct.productManage.view._customCallBack = customCallBack;
			}
			if(X6Basic.baseProduct.productManage.view._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(X6Basic.baseProduct.productManage.view._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof X6Basic.baseProduct.productManage.view._querycustomFuncN == "function") {
				refparam += X6Basic.baseProduct.productManage.view._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			}
			X6Basic.baseProduct.productManage.view._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		X6Basic.baseProduct.productManage.view._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(X6Basic.baseProduct.productManage.view._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(X6Basic.baseProduct.productManage.view._querycustomFunc(objName.replace(/\./g, '_')));
			}
			X6Basic.baseProduct.productManage.view._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'X6Basic.baseProduct.productManage.view.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		X6Basic.baseProduct.productManage.view._querycustomFunc = function(obj) {
			var str = eval("typeof(X6Basic.baseProduct.productManage.view.query_"+obj+")!='undefined'") ? eval('X6Basic.baseProduct.productManage.view.query_'+obj+'()') : null;
			return str;
		};
		X6Basic.baseProduct.productManage.view.getcallBackGroupInfo = function(obj){
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
			X6Basic.baseProduct.productManage.view._dialog.close();
		}
		X6Basic.baseProduct.productManage.view.getcallBackInfo = function(obj){
			obj[0] = foundation.common.getObject('X6Basic_baseProduct_productManage_view_form',obj[0], X6Basic.baseProduct.productManage.view._prefix, X6Basic.baseProduct.productManage.view._sUrl);
			CUI.commonFills('X6Basic_baseProduct_productManage_view_form',X6Basic.baseProduct.productManage.view._prefix,obj[0]);

			try{
				if(X6Basic.baseProduct.productManage.view._customCallBack) {
					eval(X6Basic.baseProduct.productManage.view._customCallBack);
					X6Basic.baseProduct.productManage.view._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				X6Basic.baseProduct.productManage.view._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		X6Basic.baseProduct.productManage.view.getcallBackInfo_DG_IE = function(obj){
			var gridEventObj = X6Basic.baseProduct.productManage.view.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,X6Basic.baseProduct.productManage.view._sUrl);
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
				if(X6Basic.baseProduct.productManage.view._customCallBack) {
					eval(X6Basic.baseProduct.productManage.view._customCallBack);
					X6Basic.baseProduct.productManage.view._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				X6Basic.baseProduct.productManage.view._dialog.close();
			} catch(e){}
			gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
		}
		
		X6Basic.baseProduct.productManage.view.getcallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(X6Basic.baseProduct.productManage.view._currRow).next().length==0){
						X6Basic.baseProduct.productManage.view._oGrid.addNewRow();
					}	
					X6Basic.baseProduct.productManage.view._currRow = $(X6Basic.baseProduct.productManage.view._currRow).next();
					$(X6Basic.baseProduct.productManage.view._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(X6Basic.baseProduct.productManage.view._currRow,obj[i], X6Basic.baseProduct.productManage.view._prefix, X6Basic.baseProduct.productManage.view._sUrl);
				eval("CUI.commonFills_DG(X6Basic.baseProduct.productManage.view._currRow,X6Basic.baseProduct.productManage.view._prefix,obj[i],X6Basic.baseProduct.productManage.view._oGrid)");
			}
			try{
				if(X6Basic.baseProduct.productManage.view._customCallBack) {
					eval(X6Basic.baseProduct.productManage.view._customCallBack);
					X6Basic.baseProduct.productManage.view._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				X6Basic.baseProduct.productManage.view._dialog.close();
			} catch(e){}
		}
		
		X6Basic.baseProduct.productManage.view.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(X6Basic.baseProduct.productManage.view._oGrid, X6Basic.baseProduct.productManage.view._currRow, X6Basic.baseProduct.productManage.view._key, X6Basic.baseProduct.productManage.view._displayFieldName, obj[i])
			}
			try{
				if(X6Basic.baseProduct.productManage.view._customCallBack) {
					eval(X6Basic.baseProduct.productManage.view._customCallBack);
					X6Basic.baseProduct.productManage.view._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				X6Basic.baseProduct.productManage.view._dialog.close();
			} catch(e){}
		};
		
		X6Basic.baseProduct.productManage.view.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						X6Basic.baseProduct.productManage.view.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#X6Basic_baseProduct_productManage_view_form'));
						}
					}
				}
			});
		};
		X6Basic.baseProduct.productManage.view.proxyPending=function(pendingId){
			var url="/ec/workflow/proxyPending.action?pendingId="+pendingId;
			CUI(function(){
				X6Basic.baseProduct.productManage.view.proxyPendingDialog = new CUI.Dialog({
					title: "${getText("ec.pending.proxyPending")}",
					url:url,
					modal:true,
					height:260,
					width: 450,
					dragable:true,
					buttons:[
							{	name:"${getText("ec.flow.submit")}",
								handler:function(){X6Basic.baseProduct.productManage.view.saveProxyPending()}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
				})
				X6Basic.baseProduct.productManage.view.proxyPendingDialog.show();
			});
		};
		X6Basic.baseProduct.productManage.view.proxyType="2";//2普通委托，3全权委托
		X6Basic.baseProduct.productManage.view.saveProxyPending=function(){
			if(CUI("#proxyUsers_MultiIDs").val()==""){
				alert("${getText("ec.proxyPending.proxyor")}");
				return ;
			}else{
				CUI("#proxyUsersInput").val(CUI("#proxyUsers_MultiIDs").val());
			}
				
			X6Basic.baseProduct.productManage.view.proxyType=CUI("input[name=proxyType]:checked").val();
			CUI('#SubmitForm').submit();
		};
		proxyPendingCallBackInfo=function(res){
			if(res.dealSuccessFlag == true){
				proxyPendIngDialogErrorBarWidget.show("${getText("ec.common.saveandclosesuccessful")}！","s");
				setTimeout(function(){
					try{
						if(X6Basic.baseProduct.productManage.view.proxyType=='3'){
							top.opener.reload();
							window.close();
						}else{
							X6Basic.baseProduct.productManage.view.proxyPendingDialog.close();	
						}
					}catch(e){}
					
				},1500);
			}else{
				alert('${getText("ec.common.unsuccessfully")}！','f');
			}
		};
		X6Basic.baseProduct.productManage.view.beforeSubmitMethodSettingInPage = function(){
		};
		X6Basic.baseProduct.productManage.view.beforeSubmitMethod = function(){
			<#if pending?? && (pending.loop==1 || pending.loop==2)>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			
			
			return X6Basic.baseProduct.productManage.view.beforeSubmitMethodSettingInPage();
		};
		</script>
		<script type="text/javascript">
		X6Basic.baseProduct.productManage.view.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#X6Basic_baseProduct_productManage_view_main_div").hide();
				},500);
			}else{
				CUI("#X6Basic_baseProduct_productManage_view_main_div").hide();
			  	$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		X6Basic.baseProduct.productManage.view.showThis = function(){
			if(!CUI("#X6Basic_baseProduct_productManage_view_main_div").is(':visible')) {
				CUI("#X6Basic_baseProduct_productManage_view_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload()
		}
		X6Basic.baseProduct.productManage.view.showInfoDialog=function(mode){
			
			X6Basic.baseProduct.productManage.view.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "X6Basic_baseProduct_productManage_view",
				modal:true,
				height:500,
				width: 850,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			X6Basic.baseProduct.productManage.view.infoDialog.show();
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		X6Basic.baseProduct.productManage.view.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			<#if pendingId??>
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=X6Basic_1.0_baseProduct");
			<#else>
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?readOnlyFlag=true&linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=X6Basic_1.0_baseProduct");
			</#if>
			}
		}
		
		X6Basic.baseProduct.productManage.view.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealDataUrl=/X6Basic/baseProduct/productManage/dealInfo-list.action&dlTableInfoId=${tableInfoId?default('')}");
			}
		}
		X6Basic.baseProduct.productManage.view.showFlowInfo=function(){
			if(CUI.trim(CUI("#flowDiv").html())==""){
				CUI("#flowDiv").load("/ec/workflow/flowView.action?modelCode=X6Basic_1.0_baseProduct_ProductManage&deploymentId=${deploymentId?default('')}&fvTableInfoId=${tableInfoId?default('')}");
			}
		}
		
		X6Basic.baseProduct.productManage.view.remind=function(){
			X6Basic.baseProduct.productManage.view.remindDialog = new CUI.Dialog({
				title: "${getText("ec.pending.remind.view")}",
				url: "/ec/workflow/remindFrame.action?tableInfoId=${tableInfoId?default('')}&pendingId=${pendingId!}",
				modal:true,
				height:450,
				width: 750,
				buttons:[{	name:"${getText("foundation.common.checked")}",
							handler:function(){ec.remind.submitRemind();}
						},
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			X6Basic.baseProduct.productManage.view.remindDialog.show();
		}
		waitWork_remindCallBack=function(res){
			if(res.dealSuccessFlag == true){
				remidnSubmitFormDialogErrorBarWidget.showMessage("${getText("ec.common.saveandclosesuccessful")}！","s");
				setTimeout(function(){
					try{X6Basic.baseProduct.productManage.view.remindDialog.close();}catch(e){}
				},1500);
			}else{
				remidnSubmitFormDialogErrorBarWidget.showMessage("${getText("ec.common.unsuccessfully")}！",'f');
				if(CUI.Dialog) CUI.Dialog.toggleAllButton();
				
			}
		}
		
		


		/* CUSTOM CODE START(view-VIEW-X6Basic_1.0_baseProduct_view,js,X6Basic_1.0_baseProduct_ProductManage,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */

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
				<div class="sidebar-top"><a href="#"  onclick="X6Basic.baseProduct.productManage.view.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
							 <li>
								<#if editNew>
								<a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;">${getText(l.relatingModel.name)}</a>
								<#else>
									<a href="#" onclick="X6Basic.baseProduct.productManage.view.showBusinessList('${l.relatingModel.code.replace('.','')}',${(productManage.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')">${getText(l.relatingModel.entity.name)}(${(l.count)!})</a>
								</#if>
							</li>
						 </#list>
					</ul>
				</div>
			</div>
			</div>				
		</div>
		</#if>
		
		
		<!--[if IE 6]><div style="clear:both;"></div><![endif]-->
		<iframe style="display:none;" id="downloadFrame" src="about:blank"/>
	</body>
</html>