
	<#assign fileuploadLinkId = productManage.tableInfoId!>

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
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">

    <title>${getText('X6Basic.viewtitle.radion1371469291062')}</title>
	<@mobilecss /><@mobilejs />
  </head>

  <body>
	<@errorbar id="workbenchErrorBar" offsetY=50 />
	<header id="page-header" class="page-head navbar navbar-inverse  navbar-fixed-top bs-docs-nav" role="banner" style="top:-1px;">
		<div class="container" style="margin-top:8px;">
			<div class="row">
				<div id="buttonbarContainer" class="col-lg-12">
				</div>
			</div>
		</div>
	</header>

	<div id="X6Basic_baseProduct_productManage_view" class="container page-container page-body" style="padding-top:10px;">
		<@s.form class="bs-customizer" role="form" errorBarId="workbenchErrorBar" onsubmitMethod="X6Basic.baseProduct.productManage.view.beforeSubmitMethod()" id="X6Basic_baseProduct_productManage_view_form" namespace="/X6Basic/baseProduct/productManage/view" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=X6Basic_1.0_baseProduct_ProductManage&_bapFieldPermissonModelName_=ProductManage" callback="X6Basic.baseProduct.productManage.view._callBackInfo" ecform="true">
			<input type="hidden" name="viewselect" value="view">
			<input type="hidden" name="datagridKey" value="X6Basic_baseProduct_productManage_view_datagrids">
			<input type="hidden" name="viewCode" value="X6Basic_1.0_baseProduct_view">
			<input type="hidden" id="id" name="id" value="${id!}" />
			<input type="hidden" name="productManage.version" value="${(productManage.version)!0}" />
			<input type="hidden" name="productManage.extraCol" value='' />
			<input type="hidden" name="operateType" id="operateType" />
			<input type="hidden" name="uploadDocIds" value="${uploadDocIds!''}">
					<input type="hidden" name="productManage.createStaff.id" value="${(productManage.createStaff.id)!""}" originalvalue="${(productManage.createStaff.id)!""}"/>
			<div id="scroll-add-content-0">

				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 form-info"> 
						<div class="form-name">
							${getText('X6Basic.viewtitle.radion1371469291062')}
							<small class="form-time">${editNew?string(datetime(),(productManage.createTime?datetime)!)} </small>	
						</div>
						<span>
							${getText('ec.common.left.bracket')}${(creatorInfo.staff.name)!}
							<#if !editNew>
							<input type="hidden" name="productManage.createStaffId" value="${editNew?string((creatorInfo.staff.id)!'\'\'',(productManage.createStaffId)!'\'\'')}" />
							</#if> <#if !editNew>
								<input type="hidden" name="productManage.createTime" value="${(productManage.createTime?datetime)!}" />
							</#if>						
						</span>
						<span>
							<input id="positionLayRec" type="hidden" name="productManage.positionLayRec" value="<#if editNew>${(creatorInfo.positions[0].layRec)!}<#else>${(productManage.positionLayRec)!}</#if>" />
								<#if editNew>
									<#if creatorInfo.positions?size == 1>
									${(creatorInfo.positions[0].name)!}${getText('ec.common.right.bracket')}
									<input type="hidden" name="productManage.createPositionId" value="${creatorInfo.positions[0].id}" />
									<input type="hidden" name="productManage.createDepartmentId" value="${(creatorInfo.positions[0].department.id)!}" />
								
									<#else>
									<select id="creatorPosition" name="productManage.createPositionId" onchange="X6Basic.baseProduct.productManage.view.setDepartment()">
										<#list creatorInfo.positions as p>
											<option value="${p.id}" <#if (Session.staff.mainPosition.id)?? && p.id == Session.staff.mainPosition.id>selected</#if> layRec="${(p.layRec)!}" departmentId="${p.department.id}" departmentName="${p.department.name}">${p.name}</option>
										</#list>
									</select>${getText('ec.common.right.bracket')}
									</#if>
								<#else>
									${(creatorInfo.position.name)!}${getText('ec.common.right.bracket')}
									<input type="hidden" name="productManage.createPositionId" value="${(productManage.createPositionId)!}" />
								</#if>
						</span>
					</div>
			<#if !X6Basic_1_0_baseProduct_ProductManage_code_permit??>
			<#assign X6Basic_1_0_baseProduct_ProductManage_code_permit = checkFieldPermission('productManage.code','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_code')>
			</#if>
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4" nullable="true">
	<div class="row" nofieldPermission="${(X6Basic_1_0_baseProduct_ProductManage_code_permit?? && X6Basic_1_0_baseProduct_ProductManage_code_permit lt 2)?string}">
		<@ec_label label="X6Basic.propertydisplayName.radion1371468505565" cssClass="" divCssClass="text-right div-label" field_permit=X6Basic_1_0_baseProduct_ProductManage_code_permit! cssStyle=";" funcname="" />
			<#if !X6Basic_1_0_baseProduct_ProductManage_code_permit??>
			<#assign X6Basic_1_0_baseProduct_ProductManage_code_permit = checkFieldPermission('','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_code')>
			</#if>
		<#assign productManage_code_defaultValue  = ''>
				<#assign productManage_code_defaultValue  = ''>
		<div class="div-input form-control no-border">
						<#if (productManage.code)?has_content>
						<#assign productManage_code_ShowValue = productManage.code>
						<#elseif newObj && productManage_code_defaultValue?has_content>
						<#assign productManage_code_ShowValue = productManage_code_defaultValue>
						</#if>
					<@ec_text property_type="TEXT" showFormat="TEXT" name="productManage.code" readonly_flag=false showType="VIEW" field_permit=X6Basic_1_0_baseProduct_ProductManage_code_permit! cssClass="form-control" value=productManage_code_ShowValue cssStyle=";" funcname="" />

		</div>
	</div>
</div>
			<#if !X6Basic_1_0_baseProduct_ProductManage_name_permit??>
			<#assign X6Basic_1_0_baseProduct_ProductManage_name_permit = checkFieldPermission('productManage.name','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_name')>
			</#if>
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4" nullable="true">
	<div class="row" nofieldPermission="${(X6Basic_1_0_baseProduct_ProductManage_name_permit?? && X6Basic_1_0_baseProduct_ProductManage_name_permit lt 2)?string}">
		<@ec_label label="X6Basic.propertydisplayName.radion1371468737467" cssClass="" divCssClass="text-right div-label" field_permit=X6Basic_1_0_baseProduct_ProductManage_name_permit! cssStyle=";" funcname="" />
			<#if !X6Basic_1_0_baseProduct_ProductManage_name_permit??>
			<#assign X6Basic_1_0_baseProduct_ProductManage_name_permit = checkFieldPermission('productManage.code','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_name')>
			</#if>
		<#assign productManage_name_defaultValue  = ''>
				<#assign productManage_name_defaultValue  = ''>
		<div class="div-input form-control no-border">
						<#if (productManage.name)?has_content>
						<#assign productManage_name_ShowValue = productManage.name>
						<#elseif newObj && productManage_name_defaultValue?has_content>
						<#assign productManage_name_ShowValue = productManage_name_defaultValue>
						</#if>
					<@ec_text property_type="TEXT" showFormat="TEXT" name="productManage.name" readonly_flag=false showType="VIEW" field_permit=X6Basic_1_0_baseProduct_ProductManage_name_permit! cssClass="form-control" value=productManage_name_ShowValue cssStyle=";" funcname="" />

		</div>
	</div>
</div>
			<#if !X6Basic_1_0_baseProduct_ProductManage_specific_permit??>
			<#assign X6Basic_1_0_baseProduct_ProductManage_specific_permit = checkFieldPermission('productManage.specific','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_specific')>
			</#if>
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4" nullable="true">
	<div class="row" nofieldPermission="${(X6Basic_1_0_baseProduct_ProductManage_specific_permit?? && X6Basic_1_0_baseProduct_ProductManage_specific_permit lt 2)?string}">
		<@ec_label label="X6Basic.propertydisplayName.radion1371468803570" cssClass="" divCssClass="text-right div-label" field_permit=X6Basic_1_0_baseProduct_ProductManage_specific_permit! cssStyle=";" funcname="" />
			<#if !X6Basic_1_0_baseProduct_ProductManage_specific_permit??>
			<#assign X6Basic_1_0_baseProduct_ProductManage_specific_permit = checkFieldPermission('productManage.name','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_specific')>
			</#if>
		<#assign productManage_specific_defaultValue  = ''>
				<#assign productManage_specific_defaultValue  = ''>
		<div class="div-input form-control no-border">
						<#if (productManage.specific)?has_content>
						<#assign productManage_specific_ShowValue = productManage.specific>
						<#elseif newObj && productManage_specific_defaultValue?has_content>
						<#assign productManage_specific_ShowValue = productManage_specific_defaultValue>
						</#if>
					<@ec_text property_type="TEXT" showFormat="TEXT" name="productManage.specific" readonly_flag=false showType="VIEW" field_permit=X6Basic_1_0_baseProduct_ProductManage_specific_permit! cssClass="form-control" value=productManage_specific_ShowValue cssStyle=";" funcname="" />

		</div>
	</div>
</div>
			<#if !X6Basic_1_0_baseProduct_ProductManage_models_permit??>
			<#assign X6Basic_1_0_baseProduct_ProductManage_models_permit = checkFieldPermission('productManage.models','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_models')>
			</#if>
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4" nullable="true">
	<div class="row" nofieldPermission="${(X6Basic_1_0_baseProduct_ProductManage_models_permit?? && X6Basic_1_0_baseProduct_ProductManage_models_permit lt 2)?string}">
		<@ec_label label="X6Basic.propertydisplayName.radion1371468706627" cssClass="" divCssClass="text-right div-label" field_permit=X6Basic_1_0_baseProduct_ProductManage_models_permit! cssStyle=";" funcname="" />
			<#if !X6Basic_1_0_baseProduct_ProductManage_models_permit??>
			<#assign X6Basic_1_0_baseProduct_ProductManage_models_permit = checkFieldPermission('productManage.specific','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_models')>
			</#if>
		<#assign productManage_models_defaultValue  = ''>
				<#assign productManage_models_defaultValue  = ''>
		<div class="div-input form-control no-border">
						<#if (productManage.models)?has_content>
						<#assign productManage_models_ShowValue = productManage.models>
						<#elseif newObj && productManage_models_defaultValue?has_content>
						<#assign productManage_models_ShowValue = productManage_models_defaultValue>
						</#if>
					<@ec_text property_type="TEXT" showFormat="TEXT" name="productManage.models" readonly_flag=false showType="VIEW" field_permit=X6Basic_1_0_baseProduct_ProductManage_models_permit! cssClass="form-control" value=productManage_models_ShowValue cssStyle=";" funcname="" />

		</div>
	</div>
</div>
			<#if !X6Basic_1_0_baseProduct_ProductManage_unit_permit??>
			<#assign X6Basic_1_0_baseProduct_ProductManage_unit_permit = checkFieldPermission('productManage.unit','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_unit')>
			</#if>
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4" nullable="true">
	<div class="row" nofieldPermission="${(X6Basic_1_0_baseProduct_ProductManage_unit_permit?? && X6Basic_1_0_baseProduct_ProductManage_unit_permit lt 2)?string}">
		<@ec_label label="X6Basic.propertydisplayName.radion1371468832370" cssClass="" divCssClass="text-right div-label" field_permit=X6Basic_1_0_baseProduct_ProductManage_unit_permit! cssStyle=";" funcname="" />
			<#if !X6Basic_1_0_baseProduct_ProductManage_unit_permit??>
			<#assign X6Basic_1_0_baseProduct_ProductManage_unit_permit = checkFieldPermission('productManage.models','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_unit')>
			</#if>
		<#assign productManage_unit_defaultValue  = ''>
				<#assign productManage_unit_defaultValue  = ''>
		<div class="div-input form-control no-border">
						<#if (productManage.unit)?has_content>
						<#assign productManage_unit_ShowValue = productManage.unit>
						<#elseif newObj && productManage_unit_defaultValue?has_content>
						<#assign productManage_unit_ShowValue = productManage_unit_defaultValue>
						</#if>
					<@ec_text property_type="TEXT" showFormat="TEXT" name="productManage.unit" readonly_flag=false showType="VIEW" field_permit=X6Basic_1_0_baseProduct_ProductManage_unit_permit! cssClass="form-control" value=productManage_unit_ShowValue cssStyle=";" funcname="" />

		</div>
	</div>
</div>
			<#if !X6Basic_1_0_baseProduct_ProductManage_currQuantity_permit??>
			<#assign X6Basic_1_0_baseProduct_ProductManage_currQuantity_permit = checkFieldPermission('productManage.currQuantity','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_currQuantity')>
			</#if>
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4" nullable="true">
	<div class="row" nofieldPermission="${(X6Basic_1_0_baseProduct_ProductManage_currQuantity_permit?? && X6Basic_1_0_baseProduct_ProductManage_currQuantity_permit lt 2)?string}">
		<@ec_label label="X6Basic.propertydisplayName.radion1371468561988" cssClass="" divCssClass="text-right div-label" field_permit=X6Basic_1_0_baseProduct_ProductManage_currQuantity_permit! cssStyle=";" funcname="" />
			<#if !X6Basic_1_0_baseProduct_ProductManage_currQuantity_permit??>
			<#assign X6Basic_1_0_baseProduct_ProductManage_currQuantity_permit = checkFieldPermission('productManage.unit','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_currQuantity')>
			</#if>
		<#assign productManage_currQuantity_defaultValue  = ''>
				<#assign productManage_currQuantity_defaultValue  = ''>
		<div class="div-input form-control no-border">
						<#if (productManage.currQuantity)?has_content>
						<#assign productManage_currQuantity_ShowValue = (productManage.currQuantity)>
						<#elseif newObj && productManage_currQuantity_defaultValue?has_content>
						<#assign productManage_currQuantity_ShowValue = (productManage_currQuantity_defaultValue)>
						</#if>
					<#if (productManage_currQuantity_ShowValue)?has_content>
					<@ec_text property_type="DECIMAL" showFormat="TEXT" name="productManage.currQuantity" readonly_flag=false showType="VIEW" field_permit=X6Basic_1_0_baseProduct_ProductManage_currQuantity_permit! cssClass="form-control" value="#{productManage_currQuantity_ShowValue!; m2M2}" cssStyle=";" funcname="" decimalNum=2 />
					<#else>
					<@ec_text property_type="DECIMAL" showFormat="TEXT" name="productManage.currQuantity" readonly_flag=false showType="VIEW" field_permit=X6Basic_1_0_baseProduct_ProductManage_currQuantity_permit! cssClass="form-control" value=productManage_currQuantity_ShowValue cssStyle=";" funcname="" decimalNum=2 />
					</#if>

		</div>
	</div>
</div>
			<#if !X6Basic_1_0_baseProduct_ProductManage_createStaff_base_staff_name_permit??>
			<#assign X6Basic_1_0_baseProduct_ProductManage_createStaff_base_staff_name_permit = checkFieldPermission('productManage.createStaff.name','X6Basic_1.0_baseProduct_ProductManage','base_staff_name')>
			</#if>
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4" nullable="false">
	<div class="row" nofieldPermission="${(X6Basic_1_0_baseProduct_ProductManage_createStaff_base_staff_name_permit?? && X6Basic_1_0_baseProduct_ProductManage_createStaff_base_staff_name_permit lt 2)?string}">
		<@ec_label label="X6Basic.propertydisplayName.radion1368682044237" cssClass="must-field" divCssClass="text-right div-label" field_permit=X6Basic_1_0_baseProduct_ProductManage_createStaff_base_staff_name_permit! cssStyle=";" funcname="" />
			<#if !X6Basic_1_0_baseProduct_ProductManage_createStaff_base_staff_name_permit??>
			<#assign X6Basic_1_0_baseProduct_ProductManage_createStaff_base_staff_name_permit = checkFieldPermission('productManage.currQuantity','X6Basic_1.0_baseProduct_ProductManage','base_staff_name')>
			</#if>
		<#assign productManage_createStaff_name_defaultValue  = ''>
				<#assign productManage_createStaff_name_defaultValue  = ''>
		<div class="div-input form-control no-border">
						<#if (productManage.createStaff.name)?has_content>
						<#assign productManage_createStaff_name_ShowValue = productManage.createStaff.name>
						<#elseif newObj && productManage_createStaff_name_defaultValue?has_content>
						<#assign productManage_createStaff_name_ShowValue = productManage_createStaff_name_defaultValue>
						</#if>
							<@mneclient reftitle="${getText('foundation.ec.entity.view.reference')}" field_permit=X6Basic_1_0_baseProduct_ProductManage_createStaff_base_staff_name_permit! viewType="${viewType!}" deValue="${productManage_createStaff_name_defaultValue!}" conditionfunc="X6Basic.baseProduct.productManage.view._querycustomFunc('productManage_createStaff_name')"  value="${(productManage.createStaff.name)!}" displayFieldName="name" name="productManage.createStaff.name" id="productManage_createStaff_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="X6Basic_baseProduct_productManage_view_form" editCustomCallback=";" onkeyupfuncname=";_callback_productManage_createStaff_name(obj);" cssStyle="" classStyle="form-control" isEdit=true   isCrossCompany=false field_permit=X6Basic_1_0_baseProduct_ProductManage_createStaff_base_staff_name_permit! showType="VIEW"/>

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
		</div>
	</div>
</div>
			<#if !X6Basic_1_0_baseProduct_ProductManage_createTime_permit??>
			<#assign X6Basic_1_0_baseProduct_ProductManage_createTime_permit = checkFieldPermission('productManage.createTime','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_createTime')>
			</#if>
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4" nullable="true">
	<div class="row" nofieldPermission="${(X6Basic_1_0_baseProduct_ProductManage_createTime_permit?? && X6Basic_1_0_baseProduct_ProductManage_createTime_permit lt 2)?string}">
		<@ec_label label="ec.common.createTime" cssClass="" divCssClass="text-right div-label" field_permit=X6Basic_1_0_baseProduct_ProductManage_createTime_permit! cssStyle=";" funcname="" />
			<#if !X6Basic_1_0_baseProduct_ProductManage_createTime_permit??>
			<#assign X6Basic_1_0_baseProduct_ProductManage_createTime_permit = checkFieldPermission('productManage.createStaff.name','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_createTime')>
			</#if>
		<#assign productManage_createTime_defaultValue  = ''>
				<#assign productManage_createTime_defaultValue  = ''>
		<div class="div-input form-control no-border">
						<#if (productManage.createTime)?has_content>
						<#assign productManage_createTime_ShowValue = productManage.createTime!?string('yyyy-MM-dd HH:mm:ss')>
						<#elseif newObj && productManage_createTime_defaultValue?has_content>
						<#assign productManage_createTime_ShowValue = productManage_createTime_defaultValue!?string('yyyy-MM-dd HH:mm:ss')>
						</#if>
					<@datepicker cssClass="form-control" name="productManage.createTime" readonly=false showType="VIEW" field_permit=X6Basic_1_0_baseProduct_ProductManage_createTime_permit! type="dateTime" value=productManage_createTime_ShowValue id="productManage.createTime" cssStyle=""  />

		</div>
	</div>
</div>
			<#if !X6Basic_1_0_baseProduct_ProductManage_prodMemo_permit??>
			<#assign X6Basic_1_0_baseProduct_ProductManage_prodMemo_permit = checkFieldPermission('productManage.prodMemo','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_prodMemo')>
			</#if>
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4" nullable="true">
	<div class="row" nofieldPermission="${(X6Basic_1_0_baseProduct_ProductManage_prodMemo_permit?? && X6Basic_1_0_baseProduct_ProductManage_prodMemo_permit lt 2)?string}">
		<@ec_label label="X6Basic.propertydisplayName.radion1371468769273" cssClass="" divCssClass="text-right div-label" field_permit=X6Basic_1_0_baseProduct_ProductManage_prodMemo_permit! cssStyle=";" funcname="" />
			<#if !X6Basic_1_0_baseProduct_ProductManage_prodMemo_permit??>
			<#assign X6Basic_1_0_baseProduct_ProductManage_prodMemo_permit = checkFieldPermission('productManage.createTime','X6Basic_1.0_baseProduct_ProductManage','X6Basic_1.0_baseProduct_ProductManage_prodMemo')>
			</#if>
		<#assign productManage_prodMemo_defaultValue  = ''>
				<#assign productManage_prodMemo_defaultValue  = ''>
		<div class="div-input form-control no-border">
						<#if (productManage.prodMemo)?has_content>
						<#assign productManage_prodMemo_ShowValue = productManage.prodMemo>
						<#elseif newObj && productManage_prodMemo_defaultValue?has_content>
						<#assign productManage_prodMemo_ShowValue = productManage_prodMemo_defaultValue>
						</#if>
					<@ec_textarea property_type="TEXT" name="productManage.prodMemo" readonly_flag=false showType="VIEW" field_permit=X6Basic_1_0_baseProduct_ProductManage_prodMemo_permit! cssClass="form-control" value=productManage_prodMemo_ShowValue cssStyle=";" funcname="" />

		</div>
	</div>
</div>

				</div> 

			</div>





		</@s.form>
	</div>

	<script>
		CUI.ns('X6Basic.baseProduct.productManage.view');
		X6Basic.baseProduct.productManage.view.save = function(){
			$('#operateType').val("submit");
			//if(!X6Basic.baseProduct.productManage.view.validate()){return;}
			X6Basic.baseProduct.productManage.view.beforeSaveProcess();

			//X6Basic.baseProduct.productManage.view.processDataGrid();
			$('#X6Basic_baseProduct_productManage_view_form').submit();
		}
		X6Basic.baseProduct.productManage.view.beforeSaveProcess = function(){
			var extraCol = '<extra-data>';
			//$('#X6Basic_baseProduct_productManage_view_form').trigger('beforeSubmit');
			$('*[name^="_complex_"]').each(function(index, item){
				if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
					if($(item).attr('name') && $(item).attr('name').length > 9)
					var itemValue = $(item).val();
					extraCol += '<' + $(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + $(item).attr('name').substr(9) + '>';
				}
			});
			extraCol += '</extra-data>';
			$('input[name="productManage.extraCol"]').val(extraCol);
		}
		X6Basic.baseProduct.productManage.view.showFileUpload=function(){
			$("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?readOnlyFlag=true&linkId=${fileuploadLinkId!-1}&type=Table&entityCode=X6Basic_1.0_baseProduct");
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
				workbenchErrorBarWidget.showMessage(showMsg, 's');

				setTimeout(function(){
					var referer = '${referer!}';
					if(referer) {
						document.location.href=referer;
						//window.close();
					}
				},1000);
			} else {
				CUI.showErrorInfos(res);
			}
			CUI.hideLoadPanel();
		};
		


		/* CUSTOM CODE START(view-VIEW-X6Basic_1.0_baseProduct_view,js,X6Basic_1.0_baseProduct_ProductManage,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
	<script>
		$('body').click(function(e){
			$('#editPt').hide();
			$('#pop-top-menu').hide();
		})

		$('#pop-top').click(function(e){
			$('#pop-top-menu').toggle();
			e.stopPropagation();
		})

		var scrollLoadFlag = true;
		var scrollLoadCount = 1;
		$(window).scroll(function () {
			
			var scrollTop =  $(window).scrollTop();
			
			if ( scrollLoadCount && scrollLoadFlag  && ( $(window).height() + $(window).scrollTop() + 160 >= $('body').height() ) ) {
				scrollLoadFlag = false;
				$('#loading-tip').show();
				setTimeout(function(){
					$('#scroll-add-content-' + scrollLoadCount).show();
					$('#loading-tip').hide();
					scrollLoadCount ++;
					scrollLoadFlag = true;
					if(scrollLoadCount > 3){
						scrollLoadCount = 0
					}
					$('#slide-nav-right a').css('color','').each(function(){
						var id = this.getAttribute('href');
						if(id.length > 1 && ($(id).length == 0 || $(id).is(':hidden') ) ){
							this.style.color = '#ccc';
						}
					})
				},500)
			}
			var ScrollSpyTargetsVisible = [];
			var ScrollSpyOffsets = [];
			for(var i = 0 ; i < ScrollSpyTargets.length; i++ ){
				if( $(ScrollSpyTargets[i]).is(':visible') ){
					ScrollSpyTargetsVisible.push(ScrollSpyTargets[i]);
					ScrollSpyOffsets.push( $(ScrollSpyTargets[i]).offset().top );
				}
			}
			for(var i = 0 ; i < ScrollSpyTargetsVisible.length; i++ ){
				if(scrollTop < 35){
					topInfoSpan.html( '' + topInfoSpan.attr('page-title') );
				}else if( scrollTop >= 35 && scrollTop + 50 >= ScrollSpyOffsets[i] && (!ScrollSpyOffsets[i + 1] || scrollTop + 50 <= ScrollSpyOffsets[i + 1]) ){
					topInfoSpan.html( '' + $('span' ,ScrollSpyTargetsVisible[i]).text() );
				}
			}
			
		});
	</script>
	<script>
	$(function(){
		new CUI.ButtonBar( [
		   {name:'${getText("ec.flow.submit")}',click:'X6Basic.baseProduct.productManage.view.submit()'},
		   {name:'${getText("ec.flow.save")}',click:'X6Basic.baseProduct.productManage.view.save()'},
		   {name:'${getText("ec.pending.proxyPending")}',click:'ec.common.proxyPending(${pendingId!})'},
		   {name:'${getText("ec.flow.remind")}',click:'ec.common.remind(${productManage.tableInfoId!}, ${pendingId!})'},
		   {name:'${getText("foundation.upload.attachment")}',click:'X6Basic.baseProduct.productManage.view.showFileUpload()'},
		   {name:'${getText("ec.view.dealadvice")}',click:'alert("222")'}
		],4 );
		if($("#dealInfoContain")){
			$("#dealInfoContain").load("/ec/workflow/dealInfo.action?dlTableInfoId=${productManage.tableInfoId!}&preName=mainFrame&dealDataUrl=/X6Basic/baseProduct/productManage/dealInfo-list.action");
		}
	});
	</script>
  </body>
</html>