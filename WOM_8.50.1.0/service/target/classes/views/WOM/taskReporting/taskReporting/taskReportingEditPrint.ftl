	<#assign fileuploadType = "Table">
	<#assign fileuploadLinkId = tableInfoId!>
<#assign viewType = "readonly">
<#assign newObj = false >
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>${getText('WOM.viewtitle.randon1490775192316')}</title>
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
		<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="WOM_taskReporting_taskReporting_taskReportingEdit_main_div">
			<div class="edit-head">
				<div class="edit-title fix">								
					<span class="edit-title-view"></span>
					<span class="tableNo"><#if taskReporting.tableNo??> &nbsp;&nbsp;${taskReporting.tableNo}</#if></span>
					<span class="staff">${getHtmlText('ec.common.left.bracket')}${(creatorInfo.staff.name)!}
						<#if !editNew>
						<input type="hidden" name="taskReporting.createStaffId" value="${editNew?string((creatorInfo.staff.id)!'\'\'',(taskReporting.createStaffId)!'\'\'')}" />
						</#if> <#if !editNew>
							<input type="hidden" name="taskReporting.createTime" value="${(taskReporting.createTime?datetime)!}" />
						</#if>
						
						${editNew?string(datetime(),(taskReporting.createTime?datetime)!)} 
					</span>
					<span class="position">
						<input id="positionLayRec" type="hidden" name="taskReporting.positionLayRec" value="<#if editNew>${(creatorInfo.positions[0].layRec)!}<#else>${(taskReporting.positionLayRec)!}</#if>" />
							<#if editNew>
								<#if creatorInfo.positions?size == 1>
								${(creatorInfo.positions[0].name)!}${getHtmlText('ec.common.right.bracket')}
								<input type="hidden" name="taskReporting.createPositionId" value="${creatorInfo.positions[0].id}" />
								<input type="hidden" name="taskReporting.createDepartmentId" value="${(creatorInfo.positions[0].department.id)!}" />
							
								<#else>
								<select id="creatorPosition" name="taskReporting.createPositionId" onchange="WOM.taskReporting.taskReporting.taskReportingEdit.setDepartment()">
									<#list creatorInfo.positions as p>
										<option value="${p.id}" layRec="${(p.layRec)!}" departmentId="${p.department.id}" departmentName="${p.department.name}">${p.name}</option>
									</#list>
								</select>${getHtmlText('ec.common.right.bracket')}
								</#if>
							<#else>
								${(creatorInfo.position.name)!}${getHtmlText('ec.common.right.bracket')}
								<input type="hidden" name="taskReporting.createPositionId" value="${(taskReporting.createPositionId)!}" />
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
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr>
				
												<#if !WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_tableNo_permit??>
					<#assign WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_tableNo_permit = checkFieldPermission('taskReporting.taskID.tableNo','WOM_7.5.0.0_taskReporting_TaskReporting','WOM_7.5.0.0_produceTask_ProduceTask_tableNo')>
					</#if>
					<td <#if WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_tableNo_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"  width="13%" align="right" style="text-align: right;;" >
							<label style="<#if WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_tableNo_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('WOM.common.tableNo1111')}" >${getText('WOM.common.tableNo1111')}</label>
				</td>
				
												<#if !WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_tableNo_permit??>
					<#assign WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_tableNo_permit = checkFieldPermission('taskReporting.taskID.tableNo','WOM_7.5.0.0_taskReporting_TaskReporting','WOM_7.5.0.0_produceTask_ProduceTask_tableNo')>
					</#if>
					<td <#if WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_tableNo_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"  width="20%" align="left" style="text-align: left;;" >
							<#if WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_tableNo_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input" readonly="readonly" value="${(taskReporting.taskID.tableNo)!}" name="taskReporting.taskID.tableNo" id="taskReporting_taskID_tableNo" /></div>
							</#if>
				</td>
				
												<#if !WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_productId_MESBasic_1_product_Product_productCode_permit??>
					<#assign WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_productId_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('taskReporting.taskID.productId.productCode','WOM_7.5.0.0_taskReporting_TaskReporting','MESBasic_1_product_Product_productCode')>
					</#if>
					<td <#if WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_productId_MESBasic_1_product_Product_productCode_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"  width="13%" align="right" style="text-align: right;;" >
							<label style="<#if WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_productId_MESBasic_1_product_Product_productCode_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('WOM.propertydisplayName.radion1415772644833232')}" >${getText('WOM.propertydisplayName.radion1415772644833232')}</label>
				</td>
				
												<#if !WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_productId_MESBasic_1_product_Product_productCode_permit??>
					<#assign WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_productId_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('taskReporting.taskID.productId.productCode','WOM_7.5.0.0_taskReporting_TaskReporting','MESBasic_1_product_Product_productCode')>
					</#if>
					<td <#if WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_productId_MESBasic_1_product_Product_productCode_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"  width="20%" align="left" style="text-align: left;;" >
							<#if WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_productId_MESBasic_1_product_Product_productCode_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input name="taskReporting.taskID.productId.productCode" id="taskReporting_taskID_productId_productCode"  style=";"  value="${(taskReporting.taskID.productId.productCode?html)!}" type="text" class="cui-noborder-input " readonly="readonly"/>
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
												<#if !WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_productId_MESBasic_1_product_Product_productName_permit??>
					<#assign WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_productId_MESBasic_1_product_Product_productName_permit = checkFieldPermission('taskReporting.taskID.productId.productName','WOM_7.5.0.0_taskReporting_TaskReporting','MESBasic_1_product_Product_productName')>
					</#if>
					<td <#if WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_productId_MESBasic_1_product_Product_productName_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"  width="13%" align="right" style="text-align: right;;" >
							<label style="<#if WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_productId_MESBasic_1_product_Product_productName_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415772740737')}" >${getText('MESBasic.propertydisplayName.radion1415772740737')}</label>
				</td>
				
												<#if !WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_productId_MESBasic_1_product_Product_productName_permit??>
					<#assign WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_productId_MESBasic_1_product_Product_productName_permit = checkFieldPermission('taskReporting.taskID.productId.productName','WOM_7.5.0.0_taskReporting_TaskReporting','MESBasic_1_product_Product_productName')>
					</#if>
					<td <#if WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_productId_MESBasic_1_product_Product_productName_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"  width="20%" align="left" style="text-align: left;;" >
							<#if WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_productId_MESBasic_1_product_Product_productName_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input name="taskReporting.taskID.productId.productName" id="taskReporting_taskID_productId_productName"  style=";"  value="${(taskReporting.taskID.productId.productName?html)!}" type="text" class="cui-noborder-input " readonly="readonly"/>
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr>
												<#if !WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_productBatchNum_permit??>
					<#assign WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_productBatchNum_permit = checkFieldPermission('taskReporting.taskID.productBatchNum','WOM_7.5.0.0_taskReporting_TaskReporting','WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum')>
					</#if>
					<td <#if WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_productBatchNum_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_productBatchNum_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('WOM.propertydisplayName.randon1489668325364')}" >${getText('WOM.propertydisplayName.randon1489668325364')}</label>
				</td>
				
												<#if !WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_productBatchNum_permit??>
					<#assign WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_productBatchNum_permit = checkFieldPermission('taskReporting.taskID.productBatchNum','WOM_7.5.0.0_taskReporting_TaskReporting','WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum')>
					</#if>
					<td <#if WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_productBatchNum_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   style="text-align: left;;" >
							<#if WOM_7_5_0_0_taskReporting_TaskReporting_taskID_WOM_7_5_0_0_produceTask_ProduceTask_productBatchNum_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input name="taskReporting.taskID.productBatchNum" id="taskReporting_taskID_productBatchNum"  style=";"  value="${(taskReporting.taskID.productBatchNum?html)!}" type="text" class="cui-noborder-input " readonly="readonly"/>
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
												<#if !WOM_7_5_0_0_taskReporting_TaskReporting_reportStaff_base_staff_name_permit??>
					<#assign WOM_7_5_0_0_taskReporting_TaskReporting_reportStaff_base_staff_name_permit = checkFieldPermission('taskReporting.reportStaff.name','WOM_7.5.0.0_taskReporting_TaskReporting','base_staff_name')>
					</#if>
					<td <#if WOM_7_5_0_0_taskReporting_TaskReporting_reportStaff_base_staff_name_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if WOM_7_5_0_0_taskReporting_TaskReporting_reportStaff_base_staff_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('WOM.staff.dimissionStaff_xls.staffName0000')}" >${getText('WOM.staff.dimissionStaff_xls.staffName0000')}</label>
				</td>
				
												<#if !WOM_7_5_0_0_taskReporting_TaskReporting_reportStaff_base_staff_name_permit??>
					<#assign WOM_7_5_0_0_taskReporting_TaskReporting_reportStaff_base_staff_name_permit = checkFieldPermission('taskReporting.reportStaff.name','WOM_7.5.0.0_taskReporting_TaskReporting','base_staff_name')>
					</#if>
					<td <#if WOM_7_5_0_0_taskReporting_TaskReporting_reportStaff_base_staff_name_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if WOM_7_5_0_0_taskReporting_TaskReporting_reportStaff_base_staff_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input" readonly="readonly" value="${(taskReporting.reportStaff.name)!}" name="taskReporting.reportStaff.name" id="taskReporting_reportStaff_name" /></div>
							</#if>
				</td>
				
							 					<#if !WOM_7_5_0_0_taskReporting_TaskReporting_reportDate_permit??>
					<#assign WOM_7_5_0_0_taskReporting_TaskReporting_reportDate_permit = checkFieldPermission('taskReporting.reportDate','WOM_7.5.0.0_taskReporting_TaskReporting','WOM_7.5.0.0_taskReporting_TaskReporting_reportDate')>
					</#if>
					<td <#if WOM_7_5_0_0_taskReporting_TaskReporting_reportDate_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if WOM_7_5_0_0_taskReporting_TaskReporting_reportDate_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('WOM.propertydisplayName.randon1490787728846')}" >${getText('WOM.propertydisplayName.randon1490787728846')}</label>
				</td>
				
							 					<#if !WOM_7_5_0_0_taskReporting_TaskReporting_reportDate_permit??>
					<#assign WOM_7_5_0_0_taskReporting_TaskReporting_reportDate_permit = checkFieldPermission('taskReporting.reportDate','WOM_7.5.0.0_taskReporting_TaskReporting','WOM_7.5.0.0_taskReporting_TaskReporting_reportDate')>
					</#if>
					<td <#if WOM_7_5_0_0_taskReporting_TaskReporting_reportDate_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content" celltype="DATETIME"  align="left" style="text-align: left;;" >
							<#if WOM_7_5_0_0_taskReporting_TaskReporting_reportDate_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<#if (taskReporting.reportDate)??>
								<@datepicker  cssClass="cui-noborder-input" name="taskReporting.reportDate" value="${taskReporting.reportDate?string('yyyy-MM-dd HH:mm:ss')}"   id="taskReporting.reportDate" view=true cssStyle=""  />
							<#else>
								<@datepicker  cssClass="cui-noborder-input" name="taskReporting.reportDate" value=""  id="taskReporting.reportDate" cssStyle="" view=true />
							</#if>
							</#if>
				</td>
				</tr><tr>
							 					<#if !WOM_7_5_0_0_taskReporting_TaskReporting_reportType_permit??>
					<#assign WOM_7_5_0_0_taskReporting_TaskReporting_reportType_permit = checkFieldPermission('taskReporting.reportType','WOM_7.5.0.0_taskReporting_TaskReporting','WOM_7.5.0.0_taskReporting_TaskReporting_reportType')>
					</#if>
					<td <#if WOM_7_5_0_0_taskReporting_TaskReporting_reportType_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if WOM_7_5_0_0_taskReporting_TaskReporting_reportType_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('WOM.propertydisplayName.randon1490773072845')}" >${getText('WOM.propertydisplayName.randon1490773072845')}</label>
				</td>
				
							 					<#if !WOM_7_5_0_0_taskReporting_TaskReporting_reportType_permit??>
					<#assign WOM_7_5_0_0_taskReporting_TaskReporting_reportType_permit = checkFieldPermission('taskReporting.reportType','WOM_7.5.0.0_taskReporting_TaskReporting','WOM_7.5.0.0_taskReporting_TaskReporting_reportType')>
					</#if>
					<td <#if WOM_7_5_0_0_taskReporting_TaskReporting_reportType_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if WOM_7_5_0_0_taskReporting_TaskReporting_reportType_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<@systemcode onchange=""  viewType="readonly"  formId="WOM_taskReporting_taskReporting_taskReportingEdit_form" classStyle="cui-noborder-input" view=true cssStyle="" name="taskReporting.reportType.id" code="womReportType" value="${(taskReporting.reportType.id)!}" />
							</#if>
				</td>
				
												<#if !WOM_7_5_0_0_taskReporting_TaskReporting_wareID_MESBasic_1_wareMan_Ware_wareCode_permit??>
					<#assign WOM_7_5_0_0_taskReporting_TaskReporting_wareID_MESBasic_1_wareMan_Ware_wareCode_permit = checkFieldPermission('taskReporting.wareID.wareCode','WOM_7.5.0.0_taskReporting_TaskReporting','MESBasic_1_wareMan_Ware_wareCode')>
					</#if>
					<td <#if WOM_7_5_0_0_taskReporting_TaskReporting_wareID_MESBasic_1_wareMan_Ware_wareCode_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if WOM_7_5_0_0_taskReporting_TaskReporting_wareID_MESBasic_1_wareMan_Ware_wareCode_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1484031239866')}" >${getText('MESBasic.propertydisplayName.randon1484031239866')}</label>
				</td>
				
												<#if !WOM_7_5_0_0_taskReporting_TaskReporting_wareID_MESBasic_1_wareMan_Ware_wareCode_permit??>
					<#assign WOM_7_5_0_0_taskReporting_TaskReporting_wareID_MESBasic_1_wareMan_Ware_wareCode_permit = checkFieldPermission('taskReporting.wareID.wareCode','WOM_7.5.0.0_taskReporting_TaskReporting','MESBasic_1_wareMan_Ware_wareCode')>
					</#if>
					<td <#if WOM_7_5_0_0_taskReporting_TaskReporting_wareID_MESBasic_1_wareMan_Ware_wareCode_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   style="text-align: left;;" >
							<#if WOM_7_5_0_0_taskReporting_TaskReporting_wareID_MESBasic_1_wareMan_Ware_wareCode_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input" readonly="readonly" value="${(taskReporting.wareID.wareCode)!}" name="taskReporting.wareID.wareCode" id="taskReporting_wareID_wareCode" /></div>
							</#if>
				</td>
				
												<#if !WOM_7_5_0_0_taskReporting_TaskReporting_wareID_MESBasic_1_wareMan_Ware_wareName_permit??>
					<#assign WOM_7_5_0_0_taskReporting_TaskReporting_wareID_MESBasic_1_wareMan_Ware_wareName_permit = checkFieldPermission('taskReporting.wareID.wareName','WOM_7.5.0.0_taskReporting_TaskReporting','MESBasic_1_wareMan_Ware_wareName')>
					</#if>
					<td <#if WOM_7_5_0_0_taskReporting_TaskReporting_wareID_MESBasic_1_wareMan_Ware_wareName_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if WOM_7_5_0_0_taskReporting_TaskReporting_wareID_MESBasic_1_wareMan_Ware_wareName_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1484031316281')}" >${getText('MESBasic.propertydisplayName.randon1484031316281')}</label>
				</td>
				
												<#if !WOM_7_5_0_0_taskReporting_TaskReporting_wareID_MESBasic_1_wareMan_Ware_wareName_permit??>
					<#assign WOM_7_5_0_0_taskReporting_TaskReporting_wareID_MESBasic_1_wareMan_Ware_wareName_permit = checkFieldPermission('taskReporting.wareID.wareName','WOM_7.5.0.0_taskReporting_TaskReporting','MESBasic_1_wareMan_Ware_wareName')>
					</#if>
					<td <#if WOM_7_5_0_0_taskReporting_TaskReporting_wareID_MESBasic_1_wareMan_Ware_wareName_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if WOM_7_5_0_0_taskReporting_TaskReporting_wareID_MESBasic_1_wareMan_Ware_wareName_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input name="taskReporting.wareID.wareName" id="taskReporting_wareID_wareName"  style=";"  value="${(taskReporting.wareID.wareName?html)!}" type="text" class="cui-noborder-input " readonly="readonly"/>
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
		</tr>
	</table>
	<div style="height:20px;width:100%"></div>
	<table class="edit-table" style="display:none;">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr>
				
												<#if !WOM_7_5_0_0_taskReporting_TaskReporting_productID_MESBasic_1_product_Product_id_permit??>
					<#assign WOM_7_5_0_0_taskReporting_TaskReporting_productID_MESBasic_1_product_Product_id_permit = checkFieldPermission('taskReporting.productID.id','WOM_7.5.0.0_taskReporting_TaskReporting','MESBasic_1_product_Product_id')>
					</#if>
					<td <#if WOM_7_5_0_0_taskReporting_TaskReporting_productID_MESBasic_1_product_Product_id_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"  width="13%" align="right" style="text-align: right;display:none;;" >
							<label style="<#if WOM_7_5_0_0_taskReporting_TaskReporting_productID_MESBasic_1_product_Product_id_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449796384550')}" >${getText('MESBasic.propertydisplayName.randon1449796384550')}</label>
				</td>
				
												<#if !WOM_7_5_0_0_taskReporting_TaskReporting_productID_MESBasic_1_product_Product_id_permit??>
					<#assign WOM_7_5_0_0_taskReporting_TaskReporting_productID_MESBasic_1_product_Product_id_permit = checkFieldPermission('taskReporting.productID.id','WOM_7.5.0.0_taskReporting_TaskReporting','MESBasic_1_product_Product_id')>
					</#if>
					<td <#if WOM_7_5_0_0_taskReporting_TaskReporting_productID_MESBasic_1_product_Product_id_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"  width="20%" align="left" style="text-align: left;display:none;;" >
							<#if WOM_7_5_0_0_taskReporting_TaskReporting_productID_MESBasic_1_product_Product_id_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input" readonly="readonly" value="${(taskReporting.productID.id)!}" name="taskReporting.productID.id" id="taskReporting_productID_id" /></div>
							</#if>
				</td>
				
												<#if !WOM_7_5_0_0_taskReporting_TaskReporting_wareID_MESBasic_1_wareMan_Ware_id_permit??>
					<#assign WOM_7_5_0_0_taskReporting_TaskReporting_wareID_MESBasic_1_wareMan_Ware_id_permit = checkFieldPermission('taskReporting.wareID.id','WOM_7.5.0.0_taskReporting_TaskReporting','MESBasic_1_wareMan_Ware_id')>
					</#if>
					<td <#if WOM_7_5_0_0_taskReporting_TaskReporting_wareID_MESBasic_1_wareMan_Ware_id_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"  width="13%" align="right" style="text-align: right;;" >
							<label style="<#if WOM_7_5_0_0_taskReporting_TaskReporting_wareID_MESBasic_1_wareMan_Ware_id_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('ec.common.ID')}" >${getText('ec.common.ID')}</label>
				</td>
				
												<#if !WOM_7_5_0_0_taskReporting_TaskReporting_wareID_MESBasic_1_wareMan_Ware_id_permit??>
					<#assign WOM_7_5_0_0_taskReporting_TaskReporting_wareID_MESBasic_1_wareMan_Ware_id_permit = checkFieldPermission('taskReporting.wareID.id','WOM_7.5.0.0_taskReporting_TaskReporting','MESBasic_1_wareMan_Ware_id')>
					</#if>
					<td <#if WOM_7_5_0_0_taskReporting_TaskReporting_wareID_MESBasic_1_wareMan_Ware_id_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"  width="20%" style="text-align: left;;" >
							<#if WOM_7_5_0_0_taskReporting_TaskReporting_wareID_MESBasic_1_wareMan_Ware_id_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input name="taskReporting.wareID.id" id="taskReporting_wareID_id"  style=";"  value="${(taskReporting.wareID.id?html)!}" type="text" class="cui-noborder-input numberField" readonly="readonly"/>
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
				
		</tr>
	</table>
	<div style="height:20px;width:100%"></div>
	<table class="edit-table" style="" cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td style="width:13%;"></td><td style="width:20%;"></td>
			<td style="width:13%;"></td><td style="width:20%;"></td>
			<td style="width:13%;"></td><td style="width:20%;"></td>
		</tr>
		<tr>
		<#assign cpvmInfo = ''>
			<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_taskReporting_TaskReporting", "WOM_7.5.0.0_taskReporting_taskReportingEdit", 'EDIT')>
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
					<#assign elementName = 'taskReporting' + "." + columnName>
					<#assign elementId = 'taskReporting' + "_" + columnName>
					<#if cpvmInfo?? && c.relatedKey?has_content>
					<#assign cpvmInfo = cpvmInfo + ',' + c.relatedKey + "||" + elementName>
					</#if>
					<#assign fieldType = c.fieldType>
					<#if fieldType == 'TEXTFIELD'>
					<div class="fix-input-readonly">
					<#if columnType == 'DECIMAL'>
						<@s.hidden property_type="${columnType}" id="${elementName?replace('.', '_')}_hide" name="${elementName}" />
						<input property_type="${columnType}" type="text" id="${elementName?replace('.', '_')}" name="${elementName?replace('.', '_')}" class="cui-noborder-input numberField" readonly="readonly" />
					<#elseif columnType == 'INTEGER'>
						<@s.textfield id="${elementName?replace('.', '_')}" name="${elementName}" cssClass="cui-noborder-input numberField" readonly="true" />
					<#else>
						<@s.textfield id="${elementName?replace('.', '_')}" name="${elementName}" cssClass="cui-noborder-input" readonly="true" />
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
							<@s.textarea property_type="${columnType}" id="${elementName?replace('.', '_')}" name="${elementName}" rows="${c.textareaRow!3}" cssClass="cui-textarea-wh" cssStyle="border:0;line-height:16px;padding-left:2px;" readonly="true" onpropertychange="setTimeout(function(){autoTextarea('${elementName?replace('.', '_')}',null,null,true);}, 100);" oninput="setTimeout(function(){autoTextarea('${elementName?replace('.', '_')}',null,null,true);}, 100);" onkeyup="autoTextarea('${elementName?replace('.', '_')}',null,null,true);" />
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
					<#elseif fieldType == 'DATETIME'>
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
						<#if taskReporting[columnName]??>
							<#assign dateVal = (taskReporting[columnName])?string('yyyy-MM-dd HH:mm:ss')>
						</#if>
						<@datepicker property_type="${columnType}" cssClass="cui-noborder-input" name="${elementName}" id="${elementName?replace('.', '_')}" value=dateVal type="${dateType}" view=true />
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
							<@systemcode property_type="${columnType}" iscustom=true showType="${fieldType}" viewType=viewType formId="WOM_taskReporting_taskReporting_taskReportingEdit_form" classStyle="cui-noborder-input" view=true cssStyle="" ecFlag=true multable=isMultable name="${elementName}" code="${(c.property.fillcontentMap.fillContent)!}" value="${taskReporting[columnName]!}" seniorSystemCode=isS2 />
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
							<input type="hidden" iscustom="true" name="${elementName}" value="${taskReporting[columnName]!}" />
							<input type="hidden" name="${elementName}.${pkName!'id'}" value="${taskReporting[columnName]!}" />
							<@mneclient iframe=false property_type="${columnType}" mneenable=false reftitle="${getText('${viewTitle!}')}" viewType=viewType view=true value="${taskReporting[displayColumnName]!}" name="${elementName}.${mainDisplayName!'name'}" id="${elementName?replace('.', '_')}_${mainDisplayName!'name'}" type="${mneType}" url="${viewUrl!}" clicked=true multiple=false isEdit=true mnewidth=260 formId="WOM_taskReporting_taskReporting_taskReportingEdit_form" editCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}()" delCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}_delete()" />
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
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr>
				
							 					<#if !WOM_7_5_0_0_taskReporting_TaskReporting_remark_permit??>
					<#assign WOM_7_5_0_0_taskReporting_TaskReporting_remark_permit = checkFieldPermission('taskReporting.remark','WOM_7.5.0.0_taskReporting_TaskReporting','WOM_7.5.0.0_taskReporting_TaskReporting_remark')>
					</#if>
					<td <#if WOM_7_5_0_0_taskReporting_TaskReporting_remark_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"  width="13%" align="right" style="text-align: right;;" >
							<label style="<#if WOM_7_5_0_0_taskReporting_TaskReporting_remark_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('WOM.propertydisplayName.randon1490773089261')}" >${getText('WOM.propertydisplayName.randon1490773089261')}</label>
				</td>
				
							 					<#if !WOM_7_5_0_0_taskReporting_TaskReporting_remark_permit??>
					<#assign WOM_7_5_0_0_taskReporting_TaskReporting_remark_permit = checkFieldPermission('taskReporting.remark','WOM_7.5.0.0_taskReporting_TaskReporting','WOM_7.5.0.0_taskReporting_TaskReporting_remark')>
					</#if>
					<td <#if WOM_7_5_0_0_taskReporting_TaskReporting_remark_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"  width="66%" colspan="5" align="left" style="text-align: left;;" >
							<#if WOM_7_5_0_0_taskReporting_TaskReporting_remark_permit == 0>
							<div class="fix-input-readonly fix-ie7-textarea"><textarea id="taskReporting_remark" class="cui-noborder-textarea nopermit cui-textarea-wh" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"></textarea></div>
							<#else>
							<div class="fix-input-readonly fix-ie7-textarea"><textarea id="taskReporting_remark"  name="taskReporting.remark" class="cui-noborder-textarea cui-textarea-wh" readonly="readonly" style=";" >${(taskReporting.remark)!}</textarea></div>
							</#if>
							<script type="text/javascript">
								$(function(){
									CUI["taskReporting_remarkcompleteFlag"] = "first";
									autoTextarea("taskReporting_remark");
									//有业务中心的时候,非ie浏览器需要手动再延迟触发一次
									if(YAHOO.env.ua.ie == 0){
										setTimeout(function(){autoTextarea("taskReporting_remark")},200);
									}else{
										setTimeout(function(){autoTextarea("taskReporting_remark")},500);
									}
								})
							</script>
				</td>
				</tr><tr>
				<td class="edit-table-content"   colspan="6" style="text-align: left;;" >
				</td>
		</tr>
	</table>
	<div style="height:20px;width:100%"></div>
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/WOM/taskReporting/taskReporting/data-dg1490776543260.action?taskReporting.id=${refId!-1}&rt=json">
			<#else>
				<#assign dUrl="/WOM/taskReporting/taskReporting/data-dg1490776543260.action?taskReporting.id=${(taskReporting.id)!-1}&rt=json">
			</#if>
			<#assign postData="&dg1490776543260Page.pageSize=65536&datagridCode=WOM_7.5.0.0_taskReporting_taskReportingEditdg1490776543260" >
			<#assign propTypes = "">
			<#assign showTypes = "">
			<#assign showFormats = "">
			<#assign colkeys = "">
			<table id="TaskReportingPart_dg1490776543260" class="dg_table" width="100%" align="center" cellspacing="0" cellpadding="0" >
				<thead>
					<tr class="dg_tr">
					<th>${getText('ec.flowActive.mun')}</th>
											<#if colkeys?? && colkeys=="">
												<#assign colkeys = colkeys + 'quality' >
											<#else>
												<#assign colkeys = colkeys + ",">
												<#assign colkeys = colkeys + 'quality' >
											</#if>
											<#if showTypes?? && showTypes=="">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											<#else>
												<#assign showTypes = showTypes + ",">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											</#if>
													<#if showFormats?? && showFormats=="">
														<#assign showFormats = showFormats + 'TEXT'>
													<#else>
														<#assign showFormats = showFormats + ",">
														<#assign showFormats = showFormats + 'TEXT'>
													</#if>
												<#if propTypes?? && propTypes=="">
													<#assign propTypes = propTypes + 'DECIMAL'>
												<#else>
													<#assign propTypes = propTypes + ",">
													<#assign propTypes = propTypes + 'DECIMAL'>
												</#if>
											<th>${getText('WOM.propertydisplayName.randon1490773208429')}</th>
											<#if colkeys?? && colkeys=="">
												<#assign colkeys = colkeys + 'storeID.placeSetCode' >
											<#else>
												<#assign colkeys = colkeys + ",">
												<#assign colkeys = colkeys + 'storeID.placeSetCode' >
											</#if>
											<#if showTypes?? && showTypes=="">
												<#assign showTypes = showTypes + 'SELECTCOMP'>
											<#else>
												<#assign showTypes = showTypes + ",">
												<#assign showTypes = showTypes + 'SELECTCOMP'>
											</#if>
													<#if showFormats?? && showFormats=="">
														<#assign showFormats = showFormats + 'SELECTCOMP'>
													<#else>
														<#assign showFormats = showFormats + ",">
														<#assign showFormats = showFormats + 'SELECTCOMP'>
													</#if>
												<#if propTypes?? && propTypes=="">
													<#assign propTypes = propTypes + 'TEXT'>
												<#else>
													<#assign propTypes = propTypes + ",">
													<#assign propTypes = propTypes + 'TEXT'>
												</#if>
											<th>${getText('MESBasic.propertydisplayName.randon1489731651449')}</th>
											<#if colkeys?? && colkeys=="">
												<#assign colkeys = colkeys + 'storeID.placeSetName' >
											<#else>
												<#assign colkeys = colkeys + ",">
												<#assign colkeys = colkeys + 'storeID.placeSetName' >
											</#if>
											<#if showTypes?? && showTypes=="">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											<#else>
												<#assign showTypes = showTypes + ",">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											</#if>
													<#if showFormats?? && showFormats=="">
														<#assign showFormats = showFormats + 'TEXT'>
													<#else>
														<#assign showFormats = showFormats + ",">
														<#assign showFormats = showFormats + 'TEXT'>
													</#if>
												<#if propTypes?? && propTypes=="">
													<#assign propTypes = propTypes + 'TEXT'>
												<#else>
													<#assign propTypes = propTypes + ",">
													<#assign propTypes = propTypes + 'TEXT'>
												</#if>
											<th>${getText('MESBasic.propertydisplayName.randon1489731677162')}</th>
											<#if colkeys?? && colkeys=="">
												<#assign colkeys = colkeys + 'batchNum' >
											<#else>
												<#assign colkeys = colkeys + ",">
												<#assign colkeys = colkeys + 'batchNum' >
											</#if>
											<#if showTypes?? && showTypes=="">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											<#else>
												<#assign showTypes = showTypes + ",">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											</#if>
													<#if showFormats?? && showFormats=="">
														<#assign showFormats = showFormats + 'TEXT'>
													<#else>
														<#assign showFormats = showFormats + ",">
														<#assign showFormats = showFormats + 'TEXT'>
													</#if>
												<#if propTypes?? && propTypes=="">
													<#assign propTypes = propTypes + 'TEXT'>
												<#else>
													<#assign propTypes = propTypes + ",">
													<#assign propTypes = propTypes + 'TEXT'>
												</#if>
											<th>${getText('WOM.propertydisplayName.randon1490773190433')}</th>
										<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_taskReporting_TaskReportingPart", "WOM_7.5.0.0_taskReporting_taskReportingEditdg1490776543260", "DATAGRID", "taskReportingPart")>
											<#list customPropViewMappings as cpvms>
											<#assign columnName = cpvms.propertyLayRec>
											<#assign columnType = cpvms.property.type>
											<#assign columnFormat = cpvms.property.format>
											<#assign columnFieldType = cpvms.property.fieldType>
											<#if colkeys?? && colkeys=="">
												<#if columnFieldType?? && columnFieldType == 'SELECTCOMP'>
													<#assign colkeys = colkeys + columnName + 'MainDisplay'>
												<#else>
													<#assign colkeys = colkeys + columnName>
												</#if>
											<#else>
												<#assign colkeys = colkeys + ",">
												<#if columnFieldType?? && columnFieldType == 'SELECTCOMP'>
													<#assign colkeys = colkeys + columnName + 'MainDisplay'>
												<#else>
													<#assign colkeys = colkeys + columnName>
												</#if>
											</#if>
											<#if propTypes?? && propTypes=="">
													<#assign propTypes = propTypes + columnFieldType>
											<#else>
													<#assign propTypes = propTypes + ",">
													<#assign propTypes = propTypes + columnFieldType>
											</#if>
											<#if showTypes?? && showTypes=="">
												<#assign showTypes = showTypes + columnType>
											<#else>
												<#assign showTypes = showTypes + ",">
												<#assign showTypes = showTypes + columnType>
											</#if>
											<#if showFormats?? && showFormats=="">
												<#assign showFormats = showFormats + columnFormat>
											<#else>
												<#assign showFormats = showFormats + ",">
												<#assign showFormats = showFormats + columnFormat>
											</#if>
											</#list>
											<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_taskReporting_TaskReportingPart", "WOM_7.5.0.0_taskReporting_taskReportingEditdg1490776543260", "DATAGRID", "taskReportingPart")>
											<#list customPropViewMappings as cpvm>
												<th>${getText('${cpvm.property.displayName}')}</th>
											</#list>
											<#if colkeys?? && colkeys=="">
												<#assign colkeys = colkeys + 'remark' >
											<#else>
												<#assign colkeys = colkeys + ",">
												<#assign colkeys = colkeys + 'remark' >
											</#if>
											<#if showTypes?? && showTypes=="">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											<#else>
												<#assign showTypes = showTypes + ",">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											</#if>
													<#if showFormats?? && showFormats=="">
														<#assign showFormats = showFormats + 'TEXT'>
													<#else>
														<#assign showFormats = showFormats + ",">
														<#assign showFormats = showFormats + 'TEXT'>
													</#if>
												<#if propTypes?? && propTypes=="">
													<#assign propTypes = propTypes + 'TEXT'>
												<#else>
													<#assign propTypes = propTypes + ",">
													<#assign propTypes = propTypes + 'TEXT'>
												</#if>
											<th>${getText('WOM.propertydisplayName.randon1490773225991')}</th>
					</tr>
				</thead>
			</table>
			<script type="text/javascript">
				$(function(){
					ec.print.loadDataGrid("TaskReportingPart_dg1490776543260","${dUrl}${postData!}","${colkeys!}","${propTypes!}","${showTypes!}","${showFormats!}","right,left,left,left,left","false,false,false,false,false","2,0,0,0,0");
				});
			</script>
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
		
		<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_taskReporting_taskReportingEdit,html,WOM_7.5.0.0_taskReporting_TaskReporting,WOM_7.5.0.0) -->
<!-- 自定义代码 -->
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
						CUI("#dealInfoContain").load("/ec/workflow/dealInfo-print.action?dealInfoGroup=${(dealInfoGroup)!'byTime'}&dlTableInfoId=${tableInfoId!}&preName=mainFrame&dealDataUrl=/WOM/taskReporting/taskReporting/dealInfo-list.action&enableSimpleDealInfo=false", function(){
							setTimeout(function(){
						    	window.print();
						    },500);
						});
					</#if>
				});
			<#elseif dealInfo?? && (dealInfo!false)?string=='true'>
				CUI("#dealInfoContain").load("/ec/workflow/dealInfo-print.action?dealInfoGroup=${(dealInfoGroup)!'byTime'}&dlTableInfoId=${tableInfoId!}&preName=mainFrame&dealDataUrl=/WOM/taskReporting/taskReporting/dealInfo-list.action&enableSimpleDealInfo=false", function(){
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