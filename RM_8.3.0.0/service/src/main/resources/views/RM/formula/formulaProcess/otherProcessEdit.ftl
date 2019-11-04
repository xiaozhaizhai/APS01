<!-- RM_7.5.0.0/formula/otherProcessEdit -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1509082337757')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_otherProcessEdit,head,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) -->
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
	CUI.ns('RM.formula.formulaProcess.otherProcessEdit');
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
<#assign callbackName ="RM.formula.formulaProcess.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="RM_formula_formulaProcess_otherProcessEdit_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="RM_formula_formulaProcess_otherProcessEdit_form" cssStyle="height:100%;" hiddenField="" onsubmitMethod="RM.formula.formulaProcess.otherProcessEdit.beforeSubmitMethod()" ecAction="/RM/formula/formulaProcess/otherProcessEdit/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="otherProcessEdit">
	<input type="hidden" name="viewCode" value="RM_7.5.0.0_formula_otherProcessEdit">
	<input type="hidden" name="datagridKey" value="RM_formula_formulaProcess_otherProcessEdit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="formulaProcess.version" value="${(formulaProcess.version)!0}" />
	<input type="hidden" name="formulaProcess.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
	<div id="RM_otherProcessEdit_edit_div" style="height:100%">
		<div id="RM_formula_formulaProcess_otherProcessEdit_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "RM_formula_formulaProcess_otherProcessEdit_form"+"_attcount";
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

<div class="edit-panes-s" >
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
</div>				</div>	
				<div class="edit-datatable">	

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
					
				
					<#if  refId?? && (refId > 0)>
						<#assign nodeExpanded = true>
					<#else>
						<#assign nodeExpanded = false>
					</#if>
					
				<#if newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign exportExcel=false>
				<#else>
				<#assign exportExcel=false>
				</#if>
			<#if false>
				<#assign routeFlag = "2">
			<#else>
				<#if false && isIE>
						<#assign routeFlag = "1">
				<#else>
						<#assign routeFlag = "0">
				</#if>
			</#if>

			<#assign cpObjHideKey = '' >
			<#assign cpvmInfo = ''>
			
								
							<script type="text/javascript">
								function FormulaProcessActive_dg1509082857052_addNewRow(event)
																{
	FormulaProcessActive_dg1509082857052Widget.addRow();
	FormulaProcessActive_dg1509082857052Widget.setCellValue(FormulaProcessActive_dg1509082857052Widget.getRowLength()-1,"processId.name",FormulaProcess_dg1487242802285Widget.getCellValue(FormulaProcess_dg1487242802285Widget.getSelectedRow(),"name"));
	
	//初始化赋值
	typechange("",FormulaProcessActive_dg1509082857052Widget.getRowLength()-1);
	
	resetClick(FormulaProcessActive_dg1509082857052Widget.getRowLength()-1);
}
							</script>
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/RM/formula/formulaProcess/data-dg1509082857052.action?formulaProcess.id=${refId!-1}&refId=${refId!-1}&datagridCode=RM_7.5.0.0_formula_otherProcessEditdg1509082857052">
			<#else>
				<#assign dUrl="/RM/formula/formulaProcess/data-dg1509082857052.action?formulaProcess.id=${(formulaProcess.id)!-1}&datagridCode=RM_7.5.0.0_formula_otherProcessEditdg1509082857052">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('RM.buttonPropertyshowName.radion1542075604315')}\",handler:function(event){DT_FormulaProcessActive_dg1509082857052_deldatagrid();},iconClass:\"cui-btn-del\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1509088554036')}\",handler:function(event){FormulaProcessActive_dg1509082857052_addNewRow(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('RM.buttonPropertyshowName.radion1542075604315')}\",handler:function(event){DT_FormulaProcessActive_dg1509082857052_deldatagrid();},iconClass:\"cui-btn-del\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1509088554036')}\",handler:function(event){FormulaProcessActive_dg1509082857052_addNewRow(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_FormulaProcessActive_dg1509082857052" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1509082857052_id" value="FormulaProcessActive_dg1509082857052" />
			
			<input type="hidden" id="dg1509082857052_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('RM.modelname.randon1487330059541')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/RM/formula/formulaProcess/data-dg1509082857052.action?operateType=export&datagridCode=RM_7.5.0.0_formula_otherProcessEditdg1509082857052"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="FormulaProcessActive_dg1509082857052" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="FormulaProcessActive_dg1509082857052" viewType="${viewType}" renderOverEvent="dg1509082857052RenderOverEvent" route="${routeFlag}" formId="RM_formula_formulaProcess_otherProcessEdit_form" noPermissionKeys="processId.name,name,activeType,isAgile,product.productCode,product.productName,product.id,mobileTerminal,qualityStandard.name,qualityStandard.id,isForAdjust,isForTemp,isMoreOther,occurTurn,isWatchActive,exeSystem" modelCode="RM_7.5.0.0_formula_FormulaProcessActive" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1509082857052" dtPage="dgPage"  hidekeyPrefix="dg1509082857052" hidekey="['id','version','processId.id','processId.name','product.id','product.productCode','product.id','product.productName','product.id','product.id','qualityStandard.id','qualityStandard.name','qualityStandard.id','qualityStandard.id'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1509082857052PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName  activexButton="RM.buttonPropertyshowName.radion1542075604315,DELETEROW,del;RM.buttonPropertyshowName.radion1509088554036,addNewRow,add" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign processId_name_displayDefaultType=''>
								<#assign processId_name_defaultValue=''>
										<#assign processId_name_defaultValue=''>
																	<#if (processId_name_defaultValue!)?string=="currentUser">
								<#assign processId_name_defaultValue='${staffJson!}'>
							<#elseif (processId_name_defaultValue!)?string=="currentPost">
								<#assign processId_name_defaultValue='${postJson!}'>
							<#elseif (processId_name_defaultValue!)?string=="currentDepart">
								<#assign processId_name_defaultValue='${deptJson!}'>
							<#elseif (processId_name_defaultValue!)?string=="currentComp">
								<#assign processId_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="processId.name"        showFormat="SELECTCOMP" defaultValue="${(processId_name_defaultValue!)?string}" defaultDisplay="${(processId_name_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="RM.formula.formulaProcess.otherProcessEdit"  textalign="left"  viewUrl="/RM/formula/formulaProcess/processReference.action" viewCode="RM_7.5.0.0_formula_processReference" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1488596828660')}"  label="${getText('RM.propertydisplayName.randon1487295011793')}" width=80 showFormatFunc=""  />
							<#assign name_displayDefaultType=''>
								<#assign name_defaultValue=''>
										<#assign name_defaultValue=''>
										  
									<@datacolumn key="name"        showFormat="TEXT" defaultValue="${(name_defaultValue!)?string}" defaultDisplay="${(name_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=true     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487330156499')}" width=80 showFormatFunc=""  />
							<#assign activeType_displayDefaultType=''>
								<#assign activeType_defaultValue=''>
										<#assign activeType_defaultValue=''>
										 									<@systemCodeColumn code="activeType" textalign="left" defaultValue="${(activeType_defaultValue!)?string}" key="activeType.id" editable=true type="selectcomp" notnull=true     label="${getText('RM.propertydisplayName.randon1487330759313')}" width=60   />
							<#assign isAgile_displayDefaultType=''>
								<#assign isAgile_defaultValue=''>
										<#assign isAgile_defaultValue=''>
										  
									<@datacolumn key="isAgile"        showFormat="CHECKBOX" defaultValue="${(isAgile_defaultValue!)?string}" defaultDisplay="${(isAgile_displayDefaultType!)?string}" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon15035391802161121')}" width=50 showFormatFunc=""  />
							<#assign product_productCode_displayDefaultType=''>
								<#assign product_productCode_defaultValue=''>
										<#assign product_productCode_defaultValue=''>
																	<#if (product_productCode_defaultValue!)?string=="currentUser">
								<#assign product_productCode_defaultValue='${staffJson!}'>
							<#elseif (product_productCode_defaultValue!)?string=="currentPost">
								<#assign product_productCode_defaultValue='${postJson!}'>
							<#elseif (product_productCode_defaultValue!)?string=="currentDepart">
								<#assign product_productCode_defaultValue='${deptJson!}'>
							<#elseif (product_productCode_defaultValue!)?string=="currentComp">
								<#assign product_productCode_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="product.productCode"        showFormat="SELECTCOMP" defaultValue="${(product_productCode_defaultValue!)?string}" defaultDisplay="${(product_productCode_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false   selectCompName="RM.formula.formulaProcess.otherProcessEdit"  textalign="left"  viewUrl="/MESBasic/product/product/refProductLayout.action" viewCode="MESBasic_1_product_refProductLayout" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  label="${getText('RM.propertydisplayName.radion141577264483311')}" width=80 showFormatFunc=""  />
							<#assign product_productName_displayDefaultType=''>
								<#assign product_productName_defaultValue=''>
										<#assign product_productName_defaultValue=''>
																	<#if (product_productName_defaultValue!)?string=="currentUser">
								<#assign product_productName_defaultValue='${staffJson!}'>
							<#elseif (product_productName_defaultValue!)?string=="currentPost">
								<#assign product_productName_defaultValue='${postJson!}'>
							<#elseif (product_productName_defaultValue!)?string=="currentDepart">
								<#assign product_productName_defaultValue='${deptJson!}'>
							<#elseif (product_productName_defaultValue!)?string=="currentComp">
								<#assign product_productName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="product.productName"        showFormat="TEXT" defaultValue="${(product_productName_defaultValue!)?string}" defaultDisplay="${(product_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="RM.formula.formulaProcess.otherProcessEdit"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('RM.propertydisplayName.radion141577274073711')}" width=100 showFormatFunc=""  />
							<#assign product_id_displayDefaultType=''>
								<#assign product_id_defaultValue=''>
										<#assign product_id_defaultValue=''>
																	<#if (product_id_defaultValue!)?string=="currentUser">
								<#assign product_id_defaultValue='${staffJson!}'>
							<#elseif (product_id_defaultValue!)?string=="currentPost">
								<#assign product_id_defaultValue='${postJson!}'>
							<#elseif (product_id_defaultValue!)?string=="currentDepart">
								<#assign product_id_defaultValue='${deptJson!}'>
							<#elseif (product_id_defaultValue!)?string=="currentComp">
								<#assign product_id_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="product.id"        showFormat="TEXT" defaultValue="${(product_id_defaultValue!)?string}" defaultDisplay="${(product_id_displayDefaultType!)?string}" decimal="" editable=false type="long" showType="long" notnull=false   selectCompName="RM.formula.formulaProcess.otherProcessEdit"  textalign="center" hiddenCol=true viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.randon1449796384550')}" width=100 showFormatFunc=""  />
							<#assign mobileTerminal_displayDefaultType=''>
								<#assign mobileTerminal_defaultValue='true'>
										  
									<@datacolumn key="mobileTerminal"        showFormat="CHECKBOX" defaultValue="${(mobileTerminal_defaultValue!)?string}" defaultDisplay="${(mobileTerminal_displayDefaultType!)?string}" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1497849359617')}" width=60 showFormatFunc=""  />
							<#assign qualityStandard_name_displayDefaultType=''>
								<#assign qualityStandard_name_defaultValue=''>
										<#assign qualityStandard_name_defaultValue=''>
																	<#if (qualityStandard_name_defaultValue!)?string=="currentUser">
								<#assign qualityStandard_name_defaultValue='${staffJson!}'>
							<#elseif (qualityStandard_name_defaultValue!)?string=="currentPost">
								<#assign qualityStandard_name_defaultValue='${postJson!}'>
							<#elseif (qualityStandard_name_defaultValue!)?string=="currentDepart">
								<#assign qualityStandard_name_defaultValue='${deptJson!}'>
							<#elseif (qualityStandard_name_defaultValue!)?string=="currentComp">
								<#assign qualityStandard_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="qualityStandard.name"        showFormat="SELECTCOMP" defaultValue="${(qualityStandard_name_defaultValue!)?string}" defaultDisplay="${(qualityStandard_name_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false   selectCompName="RM.formula.formulaProcess.otherProcessEdit"  textalign="left"  viewUrl="/RM/qualityStandard/stand/standRef.action" viewCode="RM_7.5.0.0_qualityStandard_standRef" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1487596068024')}"  label="${getText('RM.propertydisplayName.randon1487595139633232')}" width=80 showFormatFunc=""  />
							<#assign qualityStandard_id_displayDefaultType=''>
								<#assign qualityStandard_id_defaultValue=''>
										<#assign qualityStandard_id_defaultValue=''>
																	<#if (qualityStandard_id_defaultValue!)?string=="currentUser">
								<#assign qualityStandard_id_defaultValue='${staffJson!}'>
							<#elseif (qualityStandard_id_defaultValue!)?string=="currentPost">
								<#assign qualityStandard_id_defaultValue='${postJson!}'>
							<#elseif (qualityStandard_id_defaultValue!)?string=="currentDepart">
								<#assign qualityStandard_id_defaultValue='${deptJson!}'>
							<#elseif (qualityStandard_id_defaultValue!)?string=="currentComp">
								<#assign qualityStandard_id_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="qualityStandard.id"        showFormat="TEXT" defaultValue="${(qualityStandard_id_defaultValue!)?string}" defaultDisplay="${(qualityStandard_id_displayDefaultType!)?string}" decimal="" editable=false type="long" showType="long" notnull=false   selectCompName="RM.formula.formulaProcess.otherProcessEdit"  textalign="center" hiddenCol=true viewUrl="/RM/qualityStandard/stand/standRef.action" viewCode="RM_7.5.0.0_qualityStandard_standRef" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1487596068024')}"  label="${getText('ec.common.ID')}" width=100 showFormatFunc=""  />
							<#assign isForAdjust_displayDefaultType=''>
								<#assign isForAdjust_defaultValue=''>
										<#assign isForAdjust_defaultValue=''>
										  
									<@datacolumn key="isForAdjust"        showFormat="CHECKBOX" defaultValue="${(isForAdjust_defaultValue!)?string}" defaultDisplay="${(isForAdjust_displayDefaultType!)?string}" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1509069657907')}" width=60 showFormatFunc=""  />
							<#assign isForTemp_displayDefaultType=''>
								<#assign isForTemp_defaultValue=''>
										<#assign isForTemp_defaultValue=''>
										  
									<@datacolumn key="isForTemp"        showFormat="CHECKBOX" defaultValue="${(isForTemp_defaultValue!)?string}" defaultDisplay="${(isForTemp_displayDefaultType!)?string}" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1509069685586')}" width=60 showFormatFunc=""  />
							<#assign isMoreOther_displayDefaultType=''>
								<#assign isMoreOther_defaultValue='true'>
										  
									<@datacolumn key="isMoreOther"        showFormat="CHECKBOX" defaultValue="${(isMoreOther_defaultValue!)?string}" defaultDisplay="${(isMoreOther_displayDefaultType!)?string}" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1509069705178')}" width=100 showFormatFunc=""  />
							<#assign occurTurn_displayDefaultType=''>
								<#assign occurTurn_defaultValue='occurTurn/occurTurn2'>
										 									<@systemCodeColumn code="occurTurn" textalign="center" defaultValue="${(occurTurn_defaultValue!)?string}" key="occurTurn.id" editable=true type="selectcomp" notnull=false     label="${getText('RM.propertydisplayName.randon1487330199423')}" width=100 hiddenCol=true  />
							<#assign isWatchActive_displayDefaultType=''>
								<#assign isWatchActive_defaultValue=''>
										<#assign isWatchActive_defaultValue=''>
										  
									<@datacolumn key="isWatchActive"        showFormat="CHECKBOX" defaultValue="${(isWatchActive_defaultValue!)?string}" defaultDisplay="${(isWatchActive_displayDefaultType!)?string}" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1488696526426')}" width=100 showFormatFunc=""  />
							<#assign exeSystem_displayDefaultType=''>
								<#assign exeSystem_defaultValue='RMsystem/system2'>
										 									<@systemCodeColumn code="RMsystem" textalign="center" defaultValue="${(exeSystem_defaultValue!)?string}" key="exeSystem.id" editable=true type="selectcomp" notnull=false     label="${getText('RM.propertydisplayName.randon1490010085314')}" width=100 hiddenCol=true  />
			
			</@datagrid>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
						RM.formula.formulaProcess.otherProcessEdit.query_dg1509082857052qualityStandard_name = function() {
							if(FormulaProcessActive_dg1509082857052Widget.getCellValue(FormulaProcessActive_dg1509082857052Widget.getSelectedRow(),'product.id') != "" && FormulaProcessActive_dg1509082857052Widget.getCellValue(FormulaProcessActive_dg1509082857052Widget.getSelectedRow(),'product.id') != null && FormulaProcessActive_dg1509082857052Widget.getCellValue(FormulaProcessActive_dg1509082857052Widget.getSelectedRow(),'product.id')!= undefined){
    var productID = FormulaProcessActive_dg1509082857052Widget.getCellValue(FormulaProcessActive_dg1509082857052Widget.getSelectedRow(),'product.id');
    return "productID="+productID;
}else{
    return "productID="+0;
}
						}
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
			
			<script type="text/javascript">
				function FormulaProcessActive_dg1509082857052_check_datagridvalid(){
					//
					var errorObj =FormulaProcessActive_dg1509082857052Widget._DT.testData();
					var errorContent='';
					if(errorObj!=null){
					  for(var i=0;i<errorObj.length;i++){
						var obj1=errorObj[i];
						if(obj1.errorType=='date'){
						  errorContent+=obj1.label+'必须为日期类型！';
						  break;
						}else if(obj1.errorType=='integer'){
						  errorContent+=obj1.label+'必须为数字类型！';
						  break;
						}else if(obj1.errorType=='decimal'){
						  errorContent+=obj1.label+'必须为整数类型！';
						  break;
						}else if(obj1.errorType=='notnull'){
						   errorContent+=obj1.label+'不能为空';
						   break;
						}else if(obj1.errorType=='toolong'){
						   errorContent+=obj1.label+'字段长度不能超过'+obj1.length+'字节(注：英文字母占1个字节，中文字占3个字节)！';
						   break;
						}
					  }
					  if(errorContent!=""){
						hasErr = true;
					  }
					  if(hasErr){
						EditDialogErrorBarWidget.show(errorContent);
						return false;
					  }
					}
					return true;
				}
				
				function savedg1509082857052DataGrid(){
					<#if  refId?? && (refId gt 0)>
					FormulaProcessActive_dg1509082857052Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('FormulaProcessActive_dg1509082857052Widget') > -1) {
						FormulaProcessActive_dg1509082857052Widget.setAllRowEdited();
					}
					var json = FormulaProcessActive_dg1509082857052Widget.parseEditedData();
					$('input[name="dg1509082857052ListJson"]').remove();
					$('input[name="dgLists[\'dg1509082857052\']"]').remove();
					$('input[name="dg1509082857052ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1509082857052\']">').val(json).appendTo($('#RM_formula_formulaProcess_otherProcessEdit_form'));
					$('<input type="hidden" name="dg1509082857052ModelCode">').val('RM_7.5.0.0_formula_FormulaProcessActive').appendTo($('#RM_formula_formulaProcess_otherProcessEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1509082857052ListJson">').val(json).appendTo($('#RM_formula_formulaProcess_otherProcessEdit_form'));
				}
				function DT_FormulaProcessActive_dg1509082857052_deldatagrid(){
					var deleteRows = FormulaProcessActive_dg1509082857052Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','processId.id','pickSite.id','qualityStandard.id','formulaId.id','testProduct.id','product.id','id.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1509082857052DeletedIds").length>0){
							$("#dg1509082857052DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1509082857052DeletedIds" name="dgDeletedIds[\'dg1509082857052\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_otherProcessEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1509082857052DeletedIds['+CUI('input[name^="dg1509082857052DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_otherProcessEdit_form'));
					});
					return deleteRows;
				}
				function DT_FormulaProcessActive_dg1509082857052_delTreeNodes(){
					var deleteRows = FormulaProcessActive_dg1509082857052Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','processId.id','pickSite.id','qualityStandard.id','formulaId.id','testProduct.id','product.id','id.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1509082857052DeletedIds").length>0){
							$("#dg1509082857052DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1509082857052DeletedIds" name="dgDeletedIds[\'dg1509082857052\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_otherProcessEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1509082857052DeletedIds['+CUI('input[name^="dg1509082857052DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_otherProcessEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('RM_formula_formulaProcess_otherProcessEdit_datagrids');
					if(!datagrids) {
						datagrids = [];
					}
					for(var i=0;i<1;i++) {
						if(!datagrids[i]) {
							datagrids[i] = [];
						}
					}
					if(datagrids[0].length>0) {
						for(var i=0;i<datagrids[0].length;i++) {
							if(datagrids[0][i] == 'FormulaProcessActive_dg1509082857052') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'FormulaProcessActive_dg1509082857052';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'FormulaProcessActive_dg1509082857052';
					}
					$('body').data('RM_formula_formulaProcess_otherProcessEdit_datagrids', datagrids);
				});
				
				var FormulaProcessActive_dg1509082857052_importDialog = null;
				function FormulaProcessActive_dg1509082857052_showImportDialog(){
					try{
						if(FormulaProcessActive_dg1509082857052_importDialog!=null&&FormulaProcessActive_dg1509082857052_importDialog.isShow==1){
							return false;
						}
						var url = "/RM/formula/formulaProcess/initImport.action?datagridCode=RM_7.5.0.0_formula_otherProcessEditdg1509082857052&tid=${id!}&datagridName=dg1509082857052";
							<#if canImportExcel>
								var buttonCode="RM_7.5.0.0_formula_otherProcessEditdg1509082857052_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						FormulaProcessActive_dg1509082857052_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("FormulaProcessActive_dg1509082857052"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();FormulaProcessActive_dg1509082857052_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();FormulaProcessActive_dg1509082857052_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						FormulaProcessActive_dg1509082857052_importDialog.show();
					}catch(e){}
				}	
				
				function FormulaProcessActive_dg1509082857052_downLoadFile(){
					var url = "/RM/formula/formulaProcess/downLoad.action?datagridCode=RM_7.5.0.0_formula_otherProcessEditdg1509082857052&templateRelatedModelCode=RM_7.5.0.0_formula_otherProcessEditdg1509082857052&downloadType=template&fileName=dg1509082857052";
					window.open(url,"","");
				}
				function dg1509082857052RenderOverEvent(){
					$('#FormulaProcessActive_dg1509082857052 .paginatorbar-operatebar:eq(0) a:eq(1)').insertBefore( $('#FormulaProcessActive_dg1509082857052 .paginatorbar-operatebar:eq(0) a:eq(0)') );

for(var i = 0 ; i <FormulaProcessActive_dg1509082857052Widget.getRowLength() ;i++){
	//原td解绑
	$("#FormulaProcessActive_dg1509082857052_tbody td[key='activeType.id']").eq(i).unbind("click");
	//表体类型下拉框 绑定事件
	resetClick(i)
	//$("#FormulaProcessActive_dg1509082857052_tbody td[key='isAgile'] input").eq(i).click(function(){isAgileClick(i)});
	
	//初始化赋值
	loadChange(FormulaProcessActive_dg1509082857052Widget.getCellValue(i,"activeType.id"),i);
}
				}
				function dg1509082857052PageInitMethod(nTabIndex){
					RM.formula.formulaProcess.otherProcessEdit.initSize(nTabIndex);
				}
			</script>
			
			
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_otherProcessEdit,html,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	RM.formula.formulaProcess.otherProcessEdit.beforeSaveProcess = function(){}
	RM.formula.formulaProcess.otherProcessEdit.beforeSubmitMethod = function() {
		try{eval("savedg1509082857052DataGrid()");}catch(e){}
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(RM.formula.formulaProcess.otherProcessEdit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#RM_formula_formulaProcess_otherProcessEdit_form').trigger('beforeSubmit');
		//formulaProcess.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="formulaProcess.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#RM_formula_formulaProcess_otherProcessEdit_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#RM_formula_formulaProcess_otherProcessEdit_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	RM.formula.formulaProcess.otherProcessEdit.validate = function(){
		return true;
	}
	
	
	//打印
	RM.formula.formulaProcess.otherProcessEdit.print = function(url){
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
		
		RM.formula.formulaProcess.otherProcessEdit.saveSetting = function(){
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
		RM.formula.formulaProcess.otherProcessEdit.printSetting = function(){
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
			RM.formula.formulaProcess.otherProcessEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(RM.formula.formulaProcess.otherProcessEdit.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				RM.formula.formulaProcess.otherProcessEdit.settingDialog.show();
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
			RM.formula.formulaProcess.otherProcessEdit._customCallBack = customCallBack;
		}
		RM.formula.formulaProcess.otherProcessEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#RM_formula_formulaProcess_otherProcessEdit_fileupload').length == 0) {
				$('body').append('<div id="RM_formula_formulaProcess_otherProcessEdit_fileupload"></div>');
			}
			RM.formula.formulaProcess.otherProcessEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "RM_formula_formulaProcess_otherProcessEdit_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#RM_formula_formulaProcess_otherProcessEdit_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			RM.formula.formulaProcess.otherProcessEdit.infoDialog.show();
			if($('#RM_formula_formulaProcess_otherProcessEdit_fileupload').html() == '') {
				$('#RM_formula_formulaProcess_otherProcessEdit_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=RM_formula_formulaProcess&entityCode=RM_7.5.0.0_formula&dialogId="+dialogId);
			}
		}
	//参照复制函数
	RM.formula.formulaProcess.otherProcessEdit.referenceCopy = function(objName,url, dialog){
		var callbackName ="RM.formula.formulaProcess.otherProcessEdit.referenceCopyBackInfo";
		RM.formula.formulaProcess.otherProcessEdit.dialog = dialog;
		RM.formula.formulaProcess.otherProcessEdit._dialog = foundation.common.select({
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
	
	RM.formula.formulaProcess.otherProcessEdit.referenceCopyBackInfo = function(obj){
		if(RM.formula.formulaProcess.otherProcessEdit._dialog){
			RM.formula.formulaProcess.otherProcessEdit._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,RM.formula.formulaProcess.otherProcessEdit.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('RM_formula_formulaProcess_otherProcessEdit_form','RM_formula_formulaProcess_otherProcessEdit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(RM.formula.formulaProcess.otherProcessEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(RM.formula.formulaProcess.otherProcessEdit.dialog._el).load('/RM/formula/formulaProcess/otherProcessEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( RM.formula.formulaProcess.otherProcessEdit.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + RM.formula.formulaProcess.otherProcessEdit.dialog._config.iframe, RM.formula.formulaProcess.otherProcessEdit.dialog._dialog ).prop( 'src', '/RM/formula/formulaProcess/otherProcessEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(RM.formula.formulaProcess.otherProcessEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(RM.formula.formulaProcess.otherProcessEdit.dialog._el).load('/RM/formula/formulaProcess/otherProcessEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	RM.formula.formulaProcess.otherProcessEdit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		RM.formula.formulaProcess.otherProcessEdit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		RM.formula.formulaProcess.otherProcessEdit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			RM.formula.formulaProcess.otherProcessEdit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	RM.formula.formulaProcess.otherProcessEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'RM_formula_formulaProcess_otherProcessEdit' + '_' + extraFrameParam;
		var callbackName="";
		RM.formula.formulaProcess.otherProcessEdit._prefix = '';
		RM.formula.formulaProcess.otherProcessEdit._oGrid = oGrid;
		RM.formula.formulaProcess.otherProcessEdit._sUrl = url;
		if(customCallBack){
			RM.formula.formulaProcess.otherProcessEdit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			RM.formula.formulaProcess.otherProcessEdit.gridEventObj = gridEventObj;
			callbackName = "RM.formula.formulaProcess.otherProcessEdit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				RM.formula.formulaProcess.otherProcessEdit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "RM.formula.formulaProcess.otherProcessEdit.getMultiselectCallBackInfo_DG" : "RM.formula.formulaProcess.otherProcessEdit.getcallBackInfo_DG";
			RM.formula.formulaProcess.otherProcessEdit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				RM.formula.formulaProcess.otherProcessEdit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="RM.formula.formulaProcess.otherProcessEdit.getcallBackInfo";
		}
		if(RM.formula.formulaProcess.otherProcessEdit._prefix!=''){
			RM.formula.formulaProcess.otherProcessEdit._prefix = RM.formula.formulaProcess.otherProcessEdit._prefix.substring(1);
		}
		if(RM.formula.formulaProcess.otherProcessEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.formula.formulaProcess.otherProcessEdit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof RM.formula.formulaProcess.otherProcessEdit._querycustomFuncN == "function") {
				refparam += RM.formula.formulaProcess.otherProcessEdit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		RM.formula.formulaProcess.otherProcessEdit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.formula.formulaProcess.otherProcessEdit._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.formula.formulaProcess.otherProcessEdit.query_"+obj+")!='undefined'") ? eval('RM.formula.formulaProcess.otherProcessEdit.query_'+obj+'()') : null;
		return str;
	
	};
	
	RM.formula.formulaProcess.otherProcessEdit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('RM_formula_formulaProcess_otherProcessEdit_form',obj[0], RM.formula.formulaProcess.otherProcessEdit._prefix, RM.formula.formulaProcess.otherProcessEdit._sUrl);
		CUI.commonFills('RM_formula_formulaProcess_otherProcessEdit_form',RM.formula.formulaProcess.otherProcessEdit._prefix,obj[0]);

		try{
			if(RM.formula.formulaProcess.otherProcessEdit._customCallBack) {
				eval(RM.formula.formulaProcess.otherProcessEdit._customCallBack);
				RM.formula.formulaProcess.otherProcessEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcess.otherProcessEdit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	RM.formula.formulaProcess.otherProcessEdit.getcallBackInfo_DG_IE = function(obj){
		if(RM.formula.formulaProcess.otherProcessEdit._customBeforeCallBack) {
			var flag = eval(RM.formula.formulaProcess.otherProcessEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = RM.formula.formulaProcess.otherProcessEdit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,RM.formula.formulaProcess.otherProcessEdit._sUrl);
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
			if(RM.formula.formulaProcess.otherProcessEdit._customCallBack) {
				eval(RM.formula.formulaProcess.otherProcessEdit._customCallBack);
				RM.formula.formulaProcess.otherProcessEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcess.otherProcessEdit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	RM.formula.formulaProcess.otherProcessEdit.getcallBackInfo_DG = function(obj){
		if(RM.formula.formulaProcess.otherProcessEdit._customBeforeCallBack) {
			var flag = eval(RM.formula.formulaProcess.otherProcessEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(RM.formula.formulaProcess.otherProcessEdit._currRow).next().length==0){
					RM.formula.formulaProcess.otherProcessEdit._oGrid.addNewRow();
				}	
				RM.formula.formulaProcess.otherProcessEdit._currRow = $(RM.formula.formulaProcess.otherProcessEdit._currRow).next();
				$(RM.formula.formulaProcess.otherProcessEdit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(RM.formula.formulaProcess.otherProcessEdit._currRow,obj[i],RM.formula.formulaProcess.otherProcessEdit._prefix,RM.formula.formulaProcess.otherProcessEdit._sUrl);
			eval("CUI.commonFills_DG(RM.formula.formulaProcess.otherProcessEdit._currRow,RM.formula.formulaProcess.otherProcessEdit._prefix,obj[i],RM.formula.formulaProcess.otherProcessEdit._oGrid)");
		}
		try{
			if(RM.formula.formulaProcess.otherProcessEdit._customCallBack) {
				eval(RM.formula.formulaProcess.otherProcessEdit._customCallBack);
				RM.formula.formulaProcess.otherProcessEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcess.otherProcessEdit._dialog.close();
		} catch(e){}
	};
	
	RM.formula.formulaProcess.otherProcessEdit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(RM.formula.formulaProcess.otherProcessEdit._oGrid, RM.formula.formulaProcess.otherProcessEdit._currRow, RM.formula.formulaProcess.otherProcessEdit._key, RM.formula.formulaProcess.otherProcessEdit._displayFieldName, obj[i])
		}
		try{
			if(RM.formula.formulaProcess.otherProcessEdit._customCallBack) {
				eval(RM.formula.formulaProcess.otherProcessEdit._customCallBack);
				RM.formula.formulaProcess.otherProcessEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcess.otherProcessEdit._dialog.close();
		} catch(e){}
	};
	
	RM.formula.formulaProcess.otherProcessEdit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			RM.formula.formulaProcess.otherProcessEdit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#RM_formula_formulaProcess_otherProcessEdit_form'));
        			}
        	   	}
        	}
      	});
	};
	RM.formula.formulaProcess.otherProcessEdit.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	RM.formula.formulaProcess.otherProcessEdit.initCount = 0;
	RM.formula.formulaProcess.otherProcessEdit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#RM_otherProcessEdit_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('RM_formula_formulaProcess_otherProcessEdit_datagrids');	
		var	conHeight = h-$("#RM_formula_formulaProcess_otherProcessEdit_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#RM_formula_formulaProcess_otherProcessEdit_main_div .edit-panes-s").each(function(index){
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
							if(RM.formula.formulaProcess.otherProcessEdit.initCount <= 2) {
								setTimeout(function(){RM.formula.formulaProcess.otherProcessEdit.initSize();}, 200);
								RM.formula.formulaProcess.otherProcessEdit.initCount++;
							}/* else {
								RM.formula.formulaProcess.otherProcessEdit.initCount = 0;
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
		RM.formula.formulaProcess.otherProcessEdit.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    RM.formula.formulaProcess.otherProcessEdit.initSize(index);
		});
		$(window).bind("dialog.resize",function(){RM.formula.formulaProcess.otherProcessEdit.initSize();});
	});
</script>
<script type="text/javascript">
	



	/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_otherProcessEdit,js,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) */
// 自定义代码
//界面加载事件
function loadChange(val,row){
	resetProperty(row);
	if("activeType/activeType1"==val){
	//常规
		//灵活投料
		$("[name='dg1509082857052isAgile'] input:eq("+ row +")").attr("disabled",true);
		FormulaProcessActive_dg1509082857052Widget.setCellValue( row, "isAgile",false);
		//物料
		FormulaProcessActive_dg1509082857052Widget.setCellProperty( row, "product.productCode", 'readonly', 'true');
		FormulaProcessActive_dg1509082857052Widget.setCellValue( row, "product.productCode","");
		FormulaProcessActive_dg1509082857052Widget.setCellValue( row, "product.productName","");
		FormulaProcessActive_dg1509082857052Widget.setCellValue( row, "product.id","");
		//质量标准  
		FormulaProcessActive_dg1509082857052Widget.setCellProperty( row, "qualityStandard.name", 'readonly', 'true');
		FormulaProcessActive_dg1509082857052Widget.setCellValue( row, "qualityStandard.id","");
		FormulaProcessActive_dg1509082857052Widget.setCellValue( row, "qualityStandard.name","");
	}
	else if("activeType/activeType3"==val){
	//投料
		//质量标准  
		FormulaProcessActive_dg1509082857052Widget.setCellProperty( row, "qualityStandard.name", 'readonly', 'true');
		FormulaProcessActive_dg1509082857052Widget.setCellValue( row, "qualityStandard.id","");
		FormulaProcessActive_dg1509082857052Widget.setCellValue( row, "qualityStandard.name","");
	}
	else if("activeType/activeType5"==val){
	//检验
		//灵活投料
		$("[name='dg1509082857052isAgile'] input:eq("+ row +")").attr("disabled",true);
		FormulaProcessActive_dg1509082857052Widget.setCellValue( row, "isAgile",false);
		//物料
		//FormulaProcessActive_dg1509082857052Widget.setCellProperty( row, "product.productCode", 'readonly', 'true');
		//FormulaProcessActive_dg1509082857052Widget.setCellValue( row, "product.productCode","");
		//FormulaProcessActive_dg1509082857052Widget.setCellValue( row, "product.productName","");
		//FormulaProcessActive_dg1509082857052Widget.setCellValue( row, "product.id","");
		//移动端
		//$("[name='dg1509082857052mobileTerminal'] input:eq("+ row +")").attr("disabled",true);
		//FormulaProcessActive_dg1509082857052Widget.setCellValue( row, "mobileTerminal",false);
		//可用于调整
		$("[name='dg1509082857052isForAdjust'] input:eq("+ row +")").attr("disabled",true);
		FormulaProcessActive_dg1509082857052Widget.setCellValue( row, "isForAdjust",false);
		//可机动执行
		//$("[name='dg1509082857052isForTemp'] input:eq("+ row +")").attr("disabled",true);
		//FormulaProcessActive_dg1509082857052Widget.setCellValue( row, "isForTemp",true);
	}
	else if(""==val){
		//灵活投料
		$("[name='dg1509082857052isAgile'] input:eq("+ row +")").attr("disabled",true);
		FormulaProcessActive_dg1509082857052Widget.setCellValue( row, "isAgile",false);
		//物料
		FormulaProcessActive_dg1509082857052Widget.setCellProperty( row, "product.productCode", 'readonly', 'true');
		FormulaProcessActive_dg1509082857052Widget.setCellValue( row, "product.productCode","");
		FormulaProcessActive_dg1509082857052Widget.setCellValue( row, "product.productName","");
		FormulaProcessActive_dg1509082857052Widget.setCellValue( row, "product.id","");
		//质量标准  
		FormulaProcessActive_dg1509082857052Widget.setCellProperty( row, "qualityStandard.name", 'readonly', 'true');
		FormulaProcessActive_dg1509082857052Widget.setCellValue( row, "qualityStandard.id","");
		FormulaProcessActive_dg1509082857052Widget.setCellValue( row, "qualityStandard.name","");
		//移动端
		$("[name='dg1509082857052mobileTerminal'] input:eq("+ row +")").attr("disabled",true);
		FormulaProcessActive_dg1509082857052Widget.setCellValue( row, "mobileTerminal",false);
		//可用于调整
		$("[name='dg1509082857052isForAdjust'] input:eq("+ row +")").attr("disabled",true);
		FormulaProcessActive_dg1509082857052Widget.setCellValue( row, "isForAdjust",false);
		//可机动执行
		$("[name='dg1509082857052isForTemp'] input:eq("+ row +")").attr("disabled",true);
		FormulaProcessActive_dg1509082857052Widget.setCellValue( row, "isForTemp",false);
	}
}
//类型changge事件
function typechange(val,row){
	resetProperty(row);
	loadChange(val,row);
	if("activeType/activeType1"==val){
	//常规
		FormulaProcessActive_dg1509082857052Widget.setCellValue( row, "mobileTerminal",true);
	}
	else if("activeType/activeType3"==val){
	//投料
		FormulaProcessActive_dg1509082857052Widget.setCellValue( row, "mobileTerminal",true);
	}
	else if("activeType/activeType5"==val){
	//检验
		FormulaProcessActive_dg1509082857052Widget.setCellValue( row, "mobileTerminal",true);
	}
	else if(""==val){
		
	}
}
//每行初始化设定
function resetProperty(row){
	$("[name='dg1509082857052isAgile'] input:eq("+ row +")").attr("disabled",false);
	FormulaProcessActive_dg1509082857052Widget.setCellProperty( row, "product.productCode", 'readonly', 'false');
	FormulaProcessActive_dg1509082857052Widget.setCellProperty( row, "qualityStandard.name", 'readonly', 'false');
	$("[name='dg1509082857052mobileTerminal'] input:eq("+ row +")").attr("disabled",false);
	$("[name='dg1509082857052isForAdjust'] input:eq("+ row +")").attr("disabled",false);
	$("[name='dg1509082857052isForTemp'] input:eq("+ row +")").attr("disabled",false);
}

//重写绑定
function resetClick(row){
	$("#FormulaProcessActive_dg1509082857052_tbody td[key='activeType.id']").eq(row).click(function(){
		if($(this).find('select').length==0){
			var width = $("#FormulaProcessActive_dg1509082857052_hdbox thead td[key='activeType.id'] .dg-hd-td-label").width(); 
			var oldValue = $(this).find('div').html();
			var addNew = "<select class='td-edit-select' style='margin-top;-3px;margin-bottom;-2px;width:"+width+"px;border-width:0px;outline:0px'><option value =''></option>";
			//获取值
			var nRow = $(this).parent().index();
			addNew += "<option value ='activeType/activeType1'>"+"常规"+"</option>";    
			addNew += "<option value ='activeType/activeType3'>"+"投料"+"</option>";   
			addNew += "<option value ='activeType/activeType5'>"+"检验"+"</option>";   
			addNew +="</select>";
			$(this).html(addNew);
			if("常规"==oldValue){
				$(this).find('select').val("activeType/activeType1");
			}
			if("投料"==oldValue){
				$(this).find('select').val("activeType/activeType3");
			}
			if("检验"==oldValue){
				$(this).find('select').val("activeType/activeType5");
			}
			//失去节点事件
			$(this).find('select').focus();
			$(this).find('select').blur(function(){
				var selectValue = $(this).val();
				$(this).parent().html("<div title=\""+selectValue+"\" class=\"dg-bd-tr-td-div\" style=\"width: "+width+"px; text-align: left;\">"+selectValue+"</div>");
				FormulaProcessActive_dg1509082857052Widget.setCellValue(nRow,"activeType.id",selectValue);
				typechange(selectValue,nRow);
			});
		}
	});
}
/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>