	<#assign fileuploadType = "Table">
	<#assign fileuploadLinkId = tableInfoId!>
<#assign viewType = "readonly">
<#assign newObj = false >
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>${getText('WOM.viewtitle.randon1491982432259')}</title>
        <link rel="stylesheet" type="text/css" href="/bap/struts/css/main_base.css">
		<link rel="stylesheet" type="text/css" href="/bap/struts/css/home.css">
		<link rel="stylesheet" type="text/css" href="/bap/struts/tabview/assets/tabview1.css">
		<link rel="stylesheet" type="text/css" href="/bap/struts/datepicker/assets/main.css">
		<link rel="stylesheet" type="text/css" href="/bap/struts/editor/themes/default/default.css">
		<link rel="stylesheet" type="text/css" href="/bap/struts/css/defaultSkin.css">
        <@editjstop /><@editjs /><@printjs />
        <link rel="stylesheet" type="text/css" href="/bap/struts/css/printStyleSheet.css" media="print" />
		<style>
		body{_width:100%;height:100%;overflow:auto;}
		.pd-top{padding-top:10px}
		.edit-panes-s{width:98%;margin-left:10px;}
		.dg_table{
			border: 1px solid #000;
			border-bottom: none;
			border-left: none;
		}
		.dg_tr{
			height:20px;
		}
		.dg_tr th{
			border-left: 1px solid #000;
			border-bottom: 1px solid #000;
		}
		.dg_tr td{
			border-left: 1px solid #000;
			border-bottom: 1px solid #000;
		}
		.fileAttachmentDiv{
			border:1px solid #000;
			margin-left:10px;
			width:95%;
		}
		.dealInfoContain{
			width:96%;
		}
		.dropdown h4{
			background: none;
			border: 1px solid #DCDCDC;
		}
		</style>
    </head>
	<body>
		<input type="hidden" name="mainContent" value="false" />
		<input type="hidden" name="attachmentInfo" value="false" />
		<input type="hidden" name="dealInfo" value="false" />
		<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_main_div">
			<div class="edit-head">
				<div class="edit-title fix">								
					<span class="edit-title-view"></span>
					<span class="tableNo"><#if batchingMaterialPart.tableNo??> &nbsp;&nbsp;${batchingMaterialPart.tableNo}</#if></span>
					<span class="staff">${getHtmlText('ec.common.left.bracket')}${(creatorInfo.staff.name)!}
						<#if !editNew>
						<input type="hidden" name="batchingMaterialPart.createStaffId" value="${editNew?string((creatorInfo.staff.id)!'\'\'',(batchingMaterialPart.createStaffId)!'\'\'')}" />
						</#if> <#if !editNew>
							<input type="hidden" name="batchingMaterialPart.createTime" value="${(batchingMaterialPart.createTime?datetime)!}" />
						</#if>
						
						${editNew?string(datetime(),(batchingMaterialPart.createTime?datetime)!)} 
					</span>
					<span class="position">
						<input id="positionLayRec" type="hidden" name="batchingMaterialPart.positionLayRec" value="<#if editNew>${(creatorInfo.positions[0].layRec)!}<#else>${(batchingMaterialPart.positionLayRec)!}</#if>" />
							<#if editNew>
								<#if creatorInfo.positions?size == 1>
								${(creatorInfo.positions[0].name)!}${getHtmlText('ec.common.right.bracket')}
								<input type="hidden" name="batchingMaterialPart.createPositionId" value="${creatorInfo.positions[0].id}" />
								<input type="hidden" name="batchingMaterialPart.createDepartmentId" value="${(creatorInfo.positions[0].department.id)!}" />
							
								<#else>
								<select id="creatorPosition" name="batchingMaterialPart.createPositionId" onchange="WOM.batchingMaterial.batchingMaterialPart.batchMaterialEdit.setDepartment()">
									<#list creatorInfo.positions as p>
										<option value="${p.id}" layRec="${(p.layRec)!}" departmentId="${p.department.id}" departmentName="${p.department.name}">${p.name}</option>
									</#list>
								</select>${getHtmlText('ec.common.right.bracket')}
								</#if>
							<#else>
								${(creatorInfo.position.name)!}${getHtmlText('ec.common.right.bracket')}
								<input type="hidden" name="batchingMaterialPart.createPositionId" value="${(batchingMaterialPart.createPositionId)!}" />
							</#if>
					</span>
				</div>
			</div>
			<div class="edit-main">
				<div class="edit-content">
					<div class="edit-panes edit-panes-w clearfix">
						<#if mainContent?? && (mainContent!false)?string=='true'>
							<div class="cui-elements pd-top">
									<div style="width:98%;text-align:left;">
										<h1>${getText('ec.view.commoninfo')}</h1>
										<hr />
									</div>
								<div class="edit-panes-s">
									
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:22%'></td><td style='height:0px;border:none;width:25%'></td><td style='height:0px;border:none;width:22%'></td><td style='height:0px;border:none;width:25%'></td></tr>
		<tr>
				
												<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeStaff_base_staff_name_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeStaff_base_staff_name_permit = checkFieldPermission('batchingMaterialPart.exeStaff.name','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','base_staff_name')>
					</#if>
					<td <#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeStaff_base_staff_name_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"  width="22%" align="right" style="text-align: right;;" >
							<label style="<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeStaff_base_staff_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('WOM.staff.dimissionStaff_xls.staffName0001')}" >${getText('WOM.staff.dimissionStaff_xls.staffName0001')}</label>
				</td>
				
												<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeStaff_base_staff_name_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeStaff_base_staff_name_permit = checkFieldPermission('batchingMaterialPart.exeStaff.name','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','base_staff_name')>
					</#if>
					<td <#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeStaff_base_staff_name_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"  width="25%" align="left" style="text-align: left;;" >
							<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeStaff_base_staff_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input" readonly="readonly" value="${(batchingMaterialPart.exeStaff.name)!}" name="batchingMaterialPart.exeStaff.name" id="batchingMaterialPart_exeStaff_name" /></div>
							</#if>
				</td>
				
							 					<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeDate_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeDate_permit = checkFieldPermission('batchingMaterialPart.exeDate','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_exeDate')>
					</#if>
					<td <#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeDate_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"  width="22%" align="right" style="text-align: right;;" >
							<label style="<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeDate_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('WOM.propertydisplayName.randon1491790496671')}" >${getText('WOM.propertydisplayName.randon1491790496671')}</label>
				</td>
				
							 					<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeDate_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeDate_permit = checkFieldPermission('batchingMaterialPart.exeDate','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_exeDate')>
					</#if>
					<td <#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeDate_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content" celltype="DATETIME" width="25%" align="left" style="text-align: left;;" >
							<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeDate_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<#if (batchingMaterialPart.exeDate)??>
								<@datepicker  cssClass="cui-noborder-input" name="batchingMaterialPart.exeDate" value="${batchingMaterialPart.exeDate?string('yyyy-MM-dd HH:mm:ss')}"   id="batchingMaterialPart.exeDate" view=true cssStyle=""  />
							<#else>
								<@datepicker  cssClass="cui-noborder-input" name="batchingMaterialPart.exeDate" value=""  id="batchingMaterialPart.exeDate" cssStyle="" view=true />
							</#if>
							</#if>
				</td>
				</tr><tr>
												<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_productCode_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('batchingMaterialPart.productId.productCode','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','MESBasic_1_product_Product_productCode')>
					</#if>
					<td <#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_productCode_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_productCode_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('WOM.propertydisplayName.radion14157726448331')}" >${getText('WOM.propertydisplayName.radion14157726448331')}</label>
				</td>
				
												<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_productCode_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('batchingMaterialPart.productId.productCode','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','MESBasic_1_product_Product_productCode')>
					</#if>
					<td <#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_productCode_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_productCode_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input" readonly="readonly" value="${(batchingMaterialPart.productId.productCode)!}" name="batchingMaterialPart.productId.productCode" id="batchingMaterialPart_productId_productCode" /></div>
							</#if>
				</td>
				
												<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_productName_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_productName_permit = checkFieldPermission('batchingMaterialPart.productId.productName','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','MESBasic_1_product_Product_productName')>
					</#if>
					<td <#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_productName_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_productName_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('WOM.propertydisplayName.radion1415772740737334')}" >${getText('WOM.propertydisplayName.radion1415772740737334')}</label>
				</td>
				
												<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_productName_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_productName_permit = checkFieldPermission('batchingMaterialPart.productId.productName','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','MESBasic_1_product_Product_productName')>
					</#if>
					<td <#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_productName_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_productName_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input name="batchingMaterialPart.productId.productName" id="batchingMaterialPart_productId_productName"  style=";"  value="${(batchingMaterialPart.productId.productName?html)!}" type="text" class="cui-noborder-input " readonly="readonly"/>
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr>
							 					<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_batchNum_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_batchNum_permit = checkFieldPermission('batchingMaterialPart.batchNum','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_batchNum')>
					</#if>
					<td <#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_batchNum_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_batchNum_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('WOM.propertydisplayName.randon1491790594009')}" >${getText('WOM.propertydisplayName.randon1491790594009')}</label>
				</td>
				
							 					<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_batchNum_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_batchNum_permit = checkFieldPermission('batchingMaterialPart.batchNum','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_batchNum')>
					</#if>
					<td <#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_batchNum_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   style="text-align: left;;" >
							<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_batchNum_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input name="batchingMaterialPart.batchNum" id="batchingMaterialPart_batchNum"  style=";"  value="${(batchingMaterialPart.batchNum?html)!}" type="text" class="cui-noborder-input " readonly="readonly"/>
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_doneNum_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_doneNum_permit = checkFieldPermission('batchingMaterialPart.doneNum','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_doneNum')>
					</#if>
					<td <#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_doneNum_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_doneNum_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('WOM.propertydisplayName.randon1491790683313')}" >${getText('WOM.propertydisplayName.randon1491790683313')}</label>
				</td>
				
							 					<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_doneNum_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_doneNum_permit = checkFieldPermission('batchingMaterialPart.doneNum','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_doneNum')>
					</#if>
					<td <#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_doneNum_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   style="text-align: left;;" >
							<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_doneNum_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
									<input name="batchingMaterialPart.doneNum" id="batchingMaterialPart_doneNum"  style=";"  value="<#if (batchingMaterialPart.doneNum)?has_content>#{(batchingMaterialPart.doneNum)!; m6M6}</#if>" type="text" class="cui-noborder-input numberField" readonly=readonly/>
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							</#if>
				</td>
				</tr><tr>
												<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_wareCode_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_wareCode_permit = checkFieldPermission('batchingMaterialPart.wareID.wareCode','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','MESBasic_1_wareMan_Ware_wareCode')>
					</#if>
					<td <#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_wareCode_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_wareCode_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('WOM.propertydisplayName.randon1484031239867')}" >${getText('WOM.propertydisplayName.randon1484031239867')}</label>
				</td>
				
												<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_wareCode_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_wareCode_permit = checkFieldPermission('batchingMaterialPart.wareID.wareCode','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','MESBasic_1_wareMan_Ware_wareCode')>
					</#if>
					<td <#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_wareCode_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_wareCode_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input" readonly="readonly" value="${(batchingMaterialPart.wareID.wareCode)!}" name="batchingMaterialPart.wareID.wareCode" id="batchingMaterialPart_wareID_wareCode" /></div>
							</#if>
				</td>
				
												<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_wareName_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_wareName_permit = checkFieldPermission('batchingMaterialPart.wareID.wareName','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','MESBasic_1_wareMan_Ware_wareName')>
					</#if>
					<td <#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_wareName_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_wareName_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('WOM.propertydisplayName.randon1484031316283')}" >${getText('WOM.propertydisplayName.randon1484031316283')}</label>
				</td>
				
												<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_wareName_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_wareName_permit = checkFieldPermission('batchingMaterialPart.wareID.wareName','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','MESBasic_1_wareMan_Ware_wareName')>
					</#if>
					<td <#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_wareName_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_wareName_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input name="batchingMaterialPart.wareID.wareName" id="batchingMaterialPart_wareID_wareName"  style=";"  value="${(batchingMaterialPart.wareID.wareName?html)!}" type="text" class="cui-noborder-input " readonly="readonly"/>
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr>
												<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_storeID_MESBasic_1_storeSet_StoreSet_placeSetCode_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_storeID_MESBasic_1_storeSet_StoreSet_placeSetCode_permit = checkFieldPermission('batchingMaterialPart.storeID.placeSetCode','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','MESBasic_1_storeSet_StoreSet_placeSetCode')>
					</#if>
					<td <#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_storeID_MESBasic_1_storeSet_StoreSet_placeSetCode_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_storeID_MESBasic_1_storeSet_StoreSet_placeSetCode_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('WOM.propertydisplayName.randon1489731651448')}" >${getText('WOM.propertydisplayName.randon1489731651448')}</label>
				</td>
				
												<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_storeID_MESBasic_1_storeSet_StoreSet_placeSetCode_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_storeID_MESBasic_1_storeSet_StoreSet_placeSetCode_permit = checkFieldPermission('batchingMaterialPart.storeID.placeSetCode','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','MESBasic_1_storeSet_StoreSet_placeSetCode')>
					</#if>
					<td <#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_storeID_MESBasic_1_storeSet_StoreSet_placeSetCode_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_storeID_MESBasic_1_storeSet_StoreSet_placeSetCode_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input" readonly="readonly" value="${(batchingMaterialPart.storeID.placeSetCode)!}" name="batchingMaterialPart.storeID.placeSetCode" id="batchingMaterialPart_storeID_placeSetCode" /></div>
							</#if>
				</td>
				
												<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_storeID_MESBasic_1_storeSet_StoreSet_placeSetName_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_storeID_MESBasic_1_storeSet_StoreSet_placeSetName_permit = checkFieldPermission('batchingMaterialPart.storeID.placeSetName','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','MESBasic_1_storeSet_StoreSet_placeSetName')>
					</#if>
					<td <#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_storeID_MESBasic_1_storeSet_StoreSet_placeSetName_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_storeID_MESBasic_1_storeSet_StoreSet_placeSetName_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('WOM.propertydisplayName.randon1489731677164')}" >${getText('WOM.propertydisplayName.randon1489731677164')}</label>
				</td>
				
												<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_storeID_MESBasic_1_storeSet_StoreSet_placeSetName_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_storeID_MESBasic_1_storeSet_StoreSet_placeSetName_permit = checkFieldPermission('batchingMaterialPart.storeID.placeSetName','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','MESBasic_1_storeSet_StoreSet_placeSetName')>
					</#if>
					<td <#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_storeID_MESBasic_1_storeSet_StoreSet_placeSetName_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_storeID_MESBasic_1_storeSet_StoreSet_placeSetName_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input name="batchingMaterialPart.storeID.placeSetName" id="batchingMaterialPart_storeID_placeSetName"  style=";"  value="${(batchingMaterialPart.storeID.placeSetName?html)!}" type="text" class="cui-noborder-input " readonly="readonly"/>
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr>
							 					<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_remark_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_remark_permit = checkFieldPermission('batchingMaterialPart.remark','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_remark')>
					</#if>
					<td <#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_remark_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_remark_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('WOM.propertydisplayName.randon1491790724898')}" >${getText('WOM.propertydisplayName.randon1491790724898')}</label>
				</td>
				
							 					<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_remark_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_remark_permit = checkFieldPermission('batchingMaterialPart.remark','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_remark')>
					</#if>
					<td <#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_remark_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   colspan="3" align="left" style="text-align: left;;" >
							<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_remark_permit == 0>
							<div class="fix-input-readonly fix-ie7-textarea"><textarea id="batchingMaterialPart_remark" class="cui-noborder-textarea nopermit cui-textarea-wh" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"></textarea></div>
							<#else>
							<div class="fix-input-readonly fix-ie7-textarea"><textarea id="batchingMaterialPart_remark"  name="batchingMaterialPart.remark" class="cui-noborder-textarea cui-textarea-wh" readonly="readonly" style=";" >${(batchingMaterialPart.remark)!}</textarea></div>
							</#if>
							<script type="text/javascript">
								$(function(){
									CUI["batchingMaterialPart_remarkcompleteFlag"] = "first";
									autoTextarea("batchingMaterialPart_remark");
									//有业务中心的时候,非ie浏览器需要手动再延迟触发一次
									if(YAHOO.env.ua.ie == 0){
										setTimeout(function(){autoTextarea("batchingMaterialPart_remark")},200);
									}else{
										setTimeout(function(){autoTextarea("batchingMaterialPart_remark")},500);
									}
								})
							</script>
				</td>
				</tr><tr>
												<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_headId_WOM_7_5_0_0_batchingMaterial_BatchingMaterial_id_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_headId_WOM_7_5_0_0_batchingMaterial_BatchingMaterial_id_permit = checkFieldPermission('batchingMaterialPart.headId.id','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterial_id')>
					</#if>
					<td <#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_headId_WOM_7_5_0_0_batchingMaterial_BatchingMaterial_id_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
							<label style="<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_headId_WOM_7_5_0_0_batchingMaterial_BatchingMaterial_id_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('ec.common.ID')}" >${getText('ec.common.ID')}</label>
				</td>
				
												<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_headId_WOM_7_5_0_0_batchingMaterial_BatchingMaterial_id_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_headId_WOM_7_5_0_0_batchingMaterial_BatchingMaterial_id_permit = checkFieldPermission('batchingMaterialPart.headId.id','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterial_id')>
					</#if>
					<td <#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_headId_WOM_7_5_0_0_batchingMaterial_BatchingMaterial_id_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   align="left" style="text-align: left;display:none;;" >
							<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_headId_WOM_7_5_0_0_batchingMaterial_BatchingMaterial_id_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input" readonly="readonly" value="${(batchingMaterialPart.headId.id)!}" name="batchingMaterialPart.headId.id" id="batchingMaterialPart_headId_id" /></div>
							</#if>
				</td>
				
				
		</tr>
	</table>
	<div style="height:20px;width:100%"></div>
								</div>									
							</div>
						</#if>
						<#if attachmentInfo?? && (attachmentInfo!false)?string=='true'>
						<div style="width:96%;height:20px"></div>
						<div class="clearfix">
						<div class="cui-elements pd-top">
						<div style="width:96%;height:20px"></div>
						<div style="width:98%;text-align:left;">
							<h1>${getHtmlText('ec.print.attachment.info')}</h1>
							<hr />
						</div>
						<div id="fileAttachmentDiv" class="fileAttachmentDiv"></div>
						</div>
						</div>
						</#if>
						<#if dealInfo?? && (dealInfo!false)?string=='true'>
						<div style="width:96%;height:20px"></div>
						<div id="dealInfoContain" class="dealInfoContain"></div>
						</#if>
					</div>
				</div>
			</div>
		</div>	
		
		<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_batchingMaterial_batchMaterialEdit,html,WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart,WOM_7.5.0.0) -->
<!-- 自定义代码 -->
<style type="text/css">
	#WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_main_div .edit-head {display:none;}
	#WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_main_div .edit-workflow {display:none;}
</style>
<!-- CUSTOM CODE END -->		
		<script type="text/javascript">
		$(function(){
			<#if attachmentInfo?? && (attachmentInfo!false)?string=='true'>
				CUI("#fileAttachmentDiv").load("/ec/print/fileupload-print.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=${(view.entity.code)!}", function(){
					<#if !(dealInfo?? && (dealInfo!false)?string=='true')>
						setTimeout(function(){
					    	window.print();
					    },500);
					<#else>
						CUI("#dealInfoContain").load("/ec/workflow/dealInfo-print.action?dealInfoGroup=${(dealInfoGroup)!'byTime'}&dlTableInfoId=${tableInfoId!}&preName=mainFrame&dealDataUrl=/WOM/batchingMaterial/batchingMaterialPart/dealInfo-list.action&enableSimpleDealInfo=false", function(){
							setTimeout(function(){
						    	window.print();
						    },500);
						});
					</#if>
				});
			<#elseif dealInfo?? && (dealInfo!false)?string=='true'>
				CUI("#dealInfoContain").load("/ec/workflow/dealInfo-print.action?dealInfoGroup=${(dealInfoGroup)!'byTime'}&dlTableInfoId=${tableInfoId!}&preName=mainFrame&dealDataUrl=/WOM/batchingMaterial/batchingMaterialPart/dealInfo-list.action&enableSimpleDealInfo=false", function(){
					setTimeout(function(){
				    	window.print();
				    },500);
				});
			<#else>
				setTimeout(function(){
			    	window.print();
			    },500);
			</#if>
		});
		</script>
	</body>
</html>