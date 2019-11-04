<!-- RM_7.5.0.0/formula/otherProcessView -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1509359935009')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-VIEW-RM_7.5.0.0_formula_otherProcessView,head,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) -->
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
	CUI.ns('RM.formula.formulaProcess.otherProcessView');
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
<#assign viewType = "readonly">
<#assign callbackName ="RM.formula.formulaProcess.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="RM_formula_formulaProcess_otherProcessView_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="RM_formula_formulaProcess_otherProcessView_form" cssStyle="height:100%;" hiddenField="" onsubmitMethod="RM.formula.formulaProcess.otherProcessView.beforeSubmitMethod()" ecAction="/RM/formula/formulaProcess/otherProcessView/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="otherProcessView">
	<input type="hidden" name="viewCode" value="RM_7.5.0.0_formula_otherProcessView">
	<input type="hidden" name="datagridKey" value="RM_formula_formulaProcess_otherProcessView_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="formulaProcess.version" value="${(formulaProcess.version)!0}" />
	<input type="hidden" name="formulaProcess.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
	<div id="RM_otherProcessView_edit_div" style="height:100%">
		<div id="RM_formula_formulaProcess_otherProcessView_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "RM_formula_formulaProcess_otherProcessView_form"+"_attcount";
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
			
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/RM/formula/formulaProcess/data-dg1509359955601.action?formulaProcess.id=${refId!-1}&refId=${refId!-1}&datagridCode=RM_7.5.0.0_formula_otherProcessViewdg1509359955601">
			<#else>
				<#assign dUrl="/RM/formula/formulaProcess/data-dg1509359955601.action?formulaProcess.id=${(formulaProcess.id)!-1}&datagridCode=RM_7.5.0.0_formula_otherProcessViewdg1509359955601">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_FormulaProcessActive_dg1509359955601" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1509359955601_id" value="FormulaProcessActive_dg1509359955601" />
			
			<input type="hidden" id="dg1509359955601_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('RM.modelname.randon1487330059541')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/RM/formula/formulaProcess/data-dg1509359955601.action?operateType=export&datagridCode=RM_7.5.0.0_formula_otherProcessViewdg1509359955601"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="FormulaProcessActive_dg1509359955601" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="FormulaProcessActive_dg1509359955601" viewType="${viewType}" renderOverEvent="dg1509359955601RenderOverEvent" route="${routeFlag}" formId="RM_formula_formulaProcess_otherProcessView_form" noPermissionKeys="processId.name,name,activeType,isAgile,product.productCode,product.productName,product.id,mobileTerminal,qualityStandard.name,qualityStandard.id,isForAdjust,isForTemp,isMoreOther,occurTurn,isWatchActive,exeSystem" modelCode="RM_7.5.0.0_formula_FormulaProcessActive" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1509359955601" dtPage="dgPage"  hidekeyPrefix="dg1509359955601" hidekey="['id','version','processId.id','processId.name','product.id','product.productCode','product.id','product.productName','product.id','product.id','qualityStandard.id','qualityStandard.name','qualityStandard.id','qualityStandard.id'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=false  buttons="${buttons}" noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1509359955601PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=false cannotDeleteRow=true assModelDisplayName=assModelDisplayName  activexButton="" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
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

									<@datacolumn key="processId.name"        showFormat="SELECTCOMP" defaultValue="${(processId_name_defaultValue!)?string}" defaultDisplay="${(processId_name_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="RM.formula.formulaProcess.otherProcessView"  textalign="left"  viewUrl="/RM/formula/formulaProcess/processReference.action" viewCode="RM_7.5.0.0_formula_processReference" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1488596828660')}"  label="${getText('RM.propertydisplayName.randon1487295011793')}" width=80 showFormatFunc=""  />
							<#assign name_displayDefaultType=''>
								<#assign name_defaultValue=''>
										<#assign name_defaultValue=''>
										 
									<@datacolumn key="name"        showFormat="TEXT" defaultValue="${(name_defaultValue!)?string}" defaultDisplay="${(name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487330156499')}" width=80 showFormatFunc=""  />
							<#assign activeType_displayDefaultType=''>
								<#assign activeType_defaultValue=''>
										<#assign activeType_defaultValue=''>
										 									<@systemCodeColumn code="activeType" textalign="left" defaultValue="${(activeType_defaultValue!)?string}" key="activeType.id" editable=false type="selectcomp" notnull=false     label="${getText('RM.propertydisplayName.randon1487330759313')}" width=60   />
							<#assign isAgile_displayDefaultType=''>
								<#assign isAgile_defaultValue=''>
										<#assign isAgile_defaultValue=''>
										 
									<@datacolumn key="isAgile"        showFormat="CHECKBOX" defaultValue="${(isAgile_defaultValue!)?string}" defaultDisplay="${(isAgile_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon15035391802161121')}" width=50 showFormatFunc=""  />
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

									<@datacolumn key="product.productCode"        showFormat="SELECTCOMP" defaultValue="${(product_productCode_defaultValue!)?string}" defaultDisplay="${(product_productCode_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="RM.formula.formulaProcess.otherProcessView"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('RM.propertydisplayName.radion141577264483311')}" width=80 showFormatFunc=""  />
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

									<@datacolumn key="product.productName"        showFormat="TEXT" defaultValue="${(product_productName_defaultValue!)?string}" defaultDisplay="${(product_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="RM.formula.formulaProcess.otherProcessView"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('RM.propertydisplayName.radion141577274073711')}" width=100 showFormatFunc=""  />
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

									<@datacolumn key="product.id"        showFormat="TEXT" defaultValue="${(product_id_defaultValue!)?string}" defaultDisplay="${(product_id_displayDefaultType!)?string}" decimal="" editable=false type="long" showType="long" notnull=false   selectCompName="RM.formula.formulaProcess.otherProcessView"  textalign="center" hiddenCol=true viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.randon1449796384550')}" width=100 showFormatFunc=""  />
							<#assign mobileTerminal_displayDefaultType=''>
								<#assign mobileTerminal_defaultValue='true'>
										 
									<@datacolumn key="mobileTerminal"        showFormat="CHECKBOX" defaultValue="${(mobileTerminal_defaultValue!)?string}" defaultDisplay="${(mobileTerminal_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1497849359617')}" width=60 showFormatFunc=""  />
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

									<@datacolumn key="qualityStandard.name"        showFormat="SELECTCOMP" defaultValue="${(qualityStandard_name_defaultValue!)?string}" defaultDisplay="${(qualityStandard_name_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="RM.formula.formulaProcess.otherProcessView"  textalign="left"  viewUrl="/RM/qualityStandard/stand/standRef.action" viewCode="RM_7.5.0.0_qualityStandard_standRef" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1487596068024')}"  label="${getText('RM.propertydisplayName.randon1487595139633232')}" width=80 showFormatFunc=""  />
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

									<@datacolumn key="qualityStandard.id"        showFormat="TEXT" defaultValue="${(qualityStandard_id_defaultValue!)?string}" defaultDisplay="${(qualityStandard_id_displayDefaultType!)?string}" decimal="" editable=false type="long" showType="long" notnull=false   selectCompName="RM.formula.formulaProcess.otherProcessView"  textalign="center" hiddenCol=true viewUrl="/RM/qualityStandard/stand/standRef.action" viewCode="RM_7.5.0.0_qualityStandard_standRef" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1487596068024')}"  label="${getText('ec.common.ID')}" width=100 showFormatFunc=""  />
							<#assign isForAdjust_displayDefaultType=''>
								<#assign isForAdjust_defaultValue=''>
										<#assign isForAdjust_defaultValue=''>
										 
									<@datacolumn key="isForAdjust"        showFormat="CHECKBOX" defaultValue="${(isForAdjust_defaultValue!)?string}" defaultDisplay="${(isForAdjust_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1509069657907')}" width=60 showFormatFunc=""  />
							<#assign isForTemp_displayDefaultType=''>
								<#assign isForTemp_defaultValue=''>
										<#assign isForTemp_defaultValue=''>
										 
									<@datacolumn key="isForTemp"        showFormat="CHECKBOX" defaultValue="${(isForTemp_defaultValue!)?string}" defaultDisplay="${(isForTemp_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1509069685586')}" width=60 showFormatFunc=""  />
							<#assign isMoreOther_displayDefaultType=''>
								<#assign isMoreOther_defaultValue='true'>
										 
									<@datacolumn key="isMoreOther"        showFormat="CHECKBOX" defaultValue="${(isMoreOther_defaultValue!)?string}" defaultDisplay="${(isMoreOther_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1509069705178')}" width=100 showFormatFunc=""  />
							<#assign occurTurn_displayDefaultType=''>
								<#assign occurTurn_defaultValue='occurTurn/occurTurn2'>
										 									<@systemCodeColumn code="occurTurn" textalign="center" defaultValue="${(occurTurn_defaultValue!)?string}" key="occurTurn.id" editable=false type="selectcomp" notnull=false     label="${getText('RM.propertydisplayName.randon1487330199423')}" width=100 hiddenCol=true  />
							<#assign isWatchActive_displayDefaultType=''>
								<#assign isWatchActive_defaultValue=''>
										<#assign isWatchActive_defaultValue=''>
										 
									<@datacolumn key="isWatchActive"        showFormat="CHECKBOX" defaultValue="${(isWatchActive_defaultValue!)?string}" defaultDisplay="${(isWatchActive_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1488696526426')}" width=100 showFormatFunc=""  />
							<#assign exeSystem_displayDefaultType=''>
								<#assign exeSystem_defaultValue='RMsystem/system2'>
										 									<@systemCodeColumn code="RMsystem" textalign="center" defaultValue="${(exeSystem_defaultValue!)?string}" key="exeSystem.id" editable=false type="selectcomp" notnull=false     label="${getText('RM.propertydisplayName.randon1490010085314')}" width=100 hiddenCol=true  />
			
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
				function FormulaProcessActive_dg1509359955601_check_datagridvalid(){
					//
					var errorObj =FormulaProcessActive_dg1509359955601Widget._DT.testData();
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
				
				function savedg1509359955601DataGrid(){
					<#if  refId?? && (refId gt 0)>
					FormulaProcessActive_dg1509359955601Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('FormulaProcessActive_dg1509359955601Widget') > -1) {
						FormulaProcessActive_dg1509359955601Widget.setAllRowEdited();
					}
					var json = FormulaProcessActive_dg1509359955601Widget.parseEditedData();
					$('input[name="dg1509359955601ListJson"]').remove();
					$('input[name="dgLists[\'dg1509359955601\']"]').remove();
					$('input[name="dg1509359955601ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1509359955601\']">').val(json).appendTo($('#RM_formula_formulaProcess_otherProcessView_form'));
					$('<input type="hidden" name="dg1509359955601ModelCode">').val('RM_7.5.0.0_formula_FormulaProcessActive').appendTo($('#RM_formula_formulaProcess_otherProcessView_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1509359955601ListJson">').val(json).appendTo($('#RM_formula_formulaProcess_otherProcessView_form'));
				}
				function DT_FormulaProcessActive_dg1509359955601_deldatagrid(){
					var deleteRows = FormulaProcessActive_dg1509359955601Widget.deleteRows();
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
						if($("#dg1509359955601DeletedIds").length>0){
							$("#dg1509359955601DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1509359955601DeletedIds" name="dgDeletedIds[\'dg1509359955601\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_otherProcessView_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1509359955601DeletedIds['+CUI('input[name^="dg1509359955601DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_otherProcessView_form'));
					});
					return deleteRows;
				}
				function DT_FormulaProcessActive_dg1509359955601_delTreeNodes(){
					var deleteRows = FormulaProcessActive_dg1509359955601Widget._DT.removeTreeNode();
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
						if($("#dg1509359955601DeletedIds").length>0){
							$("#dg1509359955601DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1509359955601DeletedIds" name="dgDeletedIds[\'dg1509359955601\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_otherProcessView_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1509359955601DeletedIds['+CUI('input[name^="dg1509359955601DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_otherProcessView_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('RM_formula_formulaProcess_otherProcessView_datagrids');
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
							if(datagrids[0][i] == 'FormulaProcessActive_dg1509359955601') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'FormulaProcessActive_dg1509359955601';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'FormulaProcessActive_dg1509359955601';
					}
					$('body').data('RM_formula_formulaProcess_otherProcessView_datagrids', datagrids);
				});
				
				var FormulaProcessActive_dg1509359955601_importDialog = null;
				function FormulaProcessActive_dg1509359955601_showImportDialog(){
					try{
						if(FormulaProcessActive_dg1509359955601_importDialog!=null&&FormulaProcessActive_dg1509359955601_importDialog.isShow==1){
							return false;
						}
						var url = "/RM/formula/formulaProcess/initImport.action?datagridCode=RM_7.5.0.0_formula_otherProcessViewdg1509359955601&tid=${id!}&datagridName=dg1509359955601";
							<#if canImportExcel>
								var buttonCode="RM_7.5.0.0_formula_otherProcessViewdg1509359955601_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						FormulaProcessActive_dg1509359955601_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("FormulaProcessActive_dg1509359955601"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();FormulaProcessActive_dg1509359955601_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();FormulaProcessActive_dg1509359955601_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						FormulaProcessActive_dg1509359955601_importDialog.show();
					}catch(e){}
				}	
				
				function FormulaProcessActive_dg1509359955601_downLoadFile(){
					var url = "/RM/formula/formulaProcess/downLoad.action?datagridCode=RM_7.5.0.0_formula_otherProcessViewdg1509359955601&templateRelatedModelCode=RM_7.5.0.0_formula_otherProcessViewdg1509359955601&downloadType=template&fileName=dg1509359955601";
					window.open(url,"","");
				}
				function dg1509359955601RenderOverEvent(){
				}
				function dg1509359955601PageInitMethod(nTabIndex){
					RM.formula.formulaProcess.otherProcessView.initSize(nTabIndex);
				}
			</script>
			
			
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-VIEW-RM_7.5.0.0_formula_otherProcessView,html,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	RM.formula.formulaProcess.otherProcessView.beforeSaveProcess = function(){}
	RM.formula.formulaProcess.otherProcessView.beforeSubmitMethod = function() {
		try{eval("savedg1509359955601DataGrid()");}catch(e){}
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(RM.formula.formulaProcess.otherProcessView.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#RM_formula_formulaProcess_otherProcessView_form').trigger('beforeSubmit');
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
			$("#RM_formula_formulaProcess_otherProcessView_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#RM_formula_formulaProcess_otherProcessView_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	RM.formula.formulaProcess.otherProcessView.validate = function(){
		return true;
	}
	
	
	//打印
	RM.formula.formulaProcess.otherProcessView.print = function(url){
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
		
		RM.formula.formulaProcess.otherProcessView.saveSetting = function(){
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
		RM.formula.formulaProcess.otherProcessView.printSetting = function(){
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
			RM.formula.formulaProcess.otherProcessView.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(RM.formula.formulaProcess.otherProcessView.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				RM.formula.formulaProcess.otherProcessView.settingDialog.show();
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
			RM.formula.formulaProcess.otherProcessView._customCallBack = customCallBack;
		}
		RM.formula.formulaProcess.otherProcessView._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#RM_formula_formulaProcess_otherProcessView_fileupload').length == 0) {
				$('body').append('<div id="RM_formula_formulaProcess_otherProcessView_fileupload"></div>');
			}
			RM.formula.formulaProcess.otherProcessView.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "RM_formula_formulaProcess_otherProcessView_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#RM_formula_formulaProcess_otherProcessView_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			RM.formula.formulaProcess.otherProcessView.infoDialog.show();
			if($('#RM_formula_formulaProcess_otherProcessView_fileupload').html() == '') {
				$('#RM_formula_formulaProcess_otherProcessView_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=RM_formula_formulaProcess&entityCode=RM_7.5.0.0_formula&dialogId="+dialogId);
			}
		}
	//参照复制函数
	RM.formula.formulaProcess.otherProcessView.referenceCopy = function(objName,url, dialog){
		var callbackName ="RM.formula.formulaProcess.otherProcessView.referenceCopyBackInfo";
		RM.formula.formulaProcess.otherProcessView.dialog = dialog;
		RM.formula.formulaProcess.otherProcessView._dialog = foundation.common.select({
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
	
	RM.formula.formulaProcess.otherProcessView.referenceCopyBackInfo = function(obj){
		if(RM.formula.formulaProcess.otherProcessView._dialog){
			RM.formula.formulaProcess.otherProcessView._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,RM.formula.formulaProcess.otherProcessView.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('RM_formula_formulaProcess_otherProcessView_form','RM_formula_formulaProcess_otherProcessView_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(RM.formula.formulaProcess.otherProcessView.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(RM.formula.formulaProcess.otherProcessView.dialog._el).load('/RM/formula/formulaProcess/otherProcessView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( RM.formula.formulaProcess.otherProcessView.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + RM.formula.formulaProcess.otherProcessView.dialog._config.iframe, RM.formula.formulaProcess.otherProcessView.dialog._dialog ).prop( 'src', '/RM/formula/formulaProcess/otherProcessView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(RM.formula.formulaProcess.otherProcessView.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(RM.formula.formulaProcess.otherProcessView.dialog._el).load('/RM/formula/formulaProcess/otherProcessView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	RM.formula.formulaProcess.otherProcessView.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		RM.formula.formulaProcess.otherProcessView.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		RM.formula.formulaProcess.otherProcessView._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			RM.formula.formulaProcess.otherProcessView._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	RM.formula.formulaProcess.otherProcessView._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'RM_formula_formulaProcess_otherProcessView' + '_' + extraFrameParam;
		var callbackName="";
		RM.formula.formulaProcess.otherProcessView._prefix = '';
		RM.formula.formulaProcess.otherProcessView._oGrid = oGrid;
		RM.formula.formulaProcess.otherProcessView._sUrl = url;
		if(customCallBack){
			RM.formula.formulaProcess.otherProcessView._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			RM.formula.formulaProcess.otherProcessView.gridEventObj = gridEventObj;
			callbackName = "RM.formula.formulaProcess.otherProcessView.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				RM.formula.formulaProcess.otherProcessView._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "RM.formula.formulaProcess.otherProcessView.getMultiselectCallBackInfo_DG" : "RM.formula.formulaProcess.otherProcessView.getcallBackInfo_DG";
			RM.formula.formulaProcess.otherProcessView._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				RM.formula.formulaProcess.otherProcessView._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="RM.formula.formulaProcess.otherProcessView.getcallBackInfo";
		}
		if(RM.formula.formulaProcess.otherProcessView._prefix!=''){
			RM.formula.formulaProcess.otherProcessView._prefix = RM.formula.formulaProcess.otherProcessView._prefix.substring(1);
		}
		if(RM.formula.formulaProcess.otherProcessView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.formula.formulaProcess.otherProcessView._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof RM.formula.formulaProcess.otherProcessView._querycustomFuncN == "function") {
				refparam += RM.formula.formulaProcess.otherProcessView._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		RM.formula.formulaProcess.otherProcessView._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.formula.formulaProcess.otherProcessView._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.formula.formulaProcess.otherProcessView.query_"+obj+")!='undefined'") ? eval('RM.formula.formulaProcess.otherProcessView.query_'+obj+'()') : null;
		return str;
	
	};
	
	RM.formula.formulaProcess.otherProcessView.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('RM_formula_formulaProcess_otherProcessView_form',obj[0], RM.formula.formulaProcess.otherProcessView._prefix, RM.formula.formulaProcess.otherProcessView._sUrl);
		CUI.commonFills('RM_formula_formulaProcess_otherProcessView_form',RM.formula.formulaProcess.otherProcessView._prefix,obj[0]);

		try{
			if(RM.formula.formulaProcess.otherProcessView._customCallBack) {
				eval(RM.formula.formulaProcess.otherProcessView._customCallBack);
				RM.formula.formulaProcess.otherProcessView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcess.otherProcessView._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	RM.formula.formulaProcess.otherProcessView.getcallBackInfo_DG_IE = function(obj){
		if(RM.formula.formulaProcess.otherProcessView._customBeforeCallBack) {
			var flag = eval(RM.formula.formulaProcess.otherProcessView._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = RM.formula.formulaProcess.otherProcessView.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,RM.formula.formulaProcess.otherProcessView._sUrl);
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
			if(RM.formula.formulaProcess.otherProcessView._customCallBack) {
				eval(RM.formula.formulaProcess.otherProcessView._customCallBack);
				RM.formula.formulaProcess.otherProcessView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcess.otherProcessView._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	RM.formula.formulaProcess.otherProcessView.getcallBackInfo_DG = function(obj){
		if(RM.formula.formulaProcess.otherProcessView._customBeforeCallBack) {
			var flag = eval(RM.formula.formulaProcess.otherProcessView._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(RM.formula.formulaProcess.otherProcessView._currRow).next().length==0){
					RM.formula.formulaProcess.otherProcessView._oGrid.addNewRow();
				}	
				RM.formula.formulaProcess.otherProcessView._currRow = $(RM.formula.formulaProcess.otherProcessView._currRow).next();
				$(RM.formula.formulaProcess.otherProcessView._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(RM.formula.formulaProcess.otherProcessView._currRow,obj[i],RM.formula.formulaProcess.otherProcessView._prefix,RM.formula.formulaProcess.otherProcessView._sUrl);
			eval("CUI.commonFills_DG(RM.formula.formulaProcess.otherProcessView._currRow,RM.formula.formulaProcess.otherProcessView._prefix,obj[i],RM.formula.formulaProcess.otherProcessView._oGrid)");
		}
		try{
			if(RM.formula.formulaProcess.otherProcessView._customCallBack) {
				eval(RM.formula.formulaProcess.otherProcessView._customCallBack);
				RM.formula.formulaProcess.otherProcessView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcess.otherProcessView._dialog.close();
		} catch(e){}
	};
	
	RM.formula.formulaProcess.otherProcessView.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(RM.formula.formulaProcess.otherProcessView._oGrid, RM.formula.formulaProcess.otherProcessView._currRow, RM.formula.formulaProcess.otherProcessView._key, RM.formula.formulaProcess.otherProcessView._displayFieldName, obj[i])
		}
		try{
			if(RM.formula.formulaProcess.otherProcessView._customCallBack) {
				eval(RM.formula.formulaProcess.otherProcessView._customCallBack);
				RM.formula.formulaProcess.otherProcessView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcess.otherProcessView._dialog.close();
		} catch(e){}
	};
	
	RM.formula.formulaProcess.otherProcessView.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			RM.formula.formulaProcess.otherProcessView.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#RM_formula_formulaProcess_otherProcessView_form'));
        			}
        	   	}
        	}
      	});
	};
	RM.formula.formulaProcess.otherProcessView.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	RM.formula.formulaProcess.otherProcessView.initCount = 0;
	RM.formula.formulaProcess.otherProcessView.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#RM_otherProcessView_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('RM_formula_formulaProcess_otherProcessView_datagrids');	
		var	conHeight = h-$("#RM_formula_formulaProcess_otherProcessView_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#RM_formula_formulaProcess_otherProcessView_main_div .edit-panes-s").each(function(index){
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
							if(RM.formula.formulaProcess.otherProcessView.initCount <= 2) {
								setTimeout(function(){RM.formula.formulaProcess.otherProcessView.initSize();}, 200);
								RM.formula.formulaProcess.otherProcessView.initCount++;
							}/* else {
								RM.formula.formulaProcess.otherProcessView.initCount = 0;
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
		RM.formula.formulaProcess.otherProcessView.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    RM.formula.formulaProcess.otherProcessView.initSize(index);
		});
		$(window).bind("dialog.resize",function(){RM.formula.formulaProcess.otherProcessView.initSize();});
	});
</script>
<script type="text/javascript">
	



	/* CUSTOM CODE START(view-VIEW-RM_7.5.0.0_formula_otherProcessView,js,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>