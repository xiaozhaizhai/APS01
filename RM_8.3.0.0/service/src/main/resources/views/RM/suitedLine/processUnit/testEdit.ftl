<!-- RM_7.5.0.0/suitedLine/testEdit -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1490266476347')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_suitedLine_testEdit,head,RM_7.5.0.0_suitedLine_ProcessUnit,RM_7.5.0.0) -->
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
	CUI.ns('RM.suitedLine.processUnit.testEdit');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "RM_suitedLine_processUnit">
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
<#assign callbackName ="RM.suitedLine.processUnit.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="RM_suitedLine_processUnit_testEdit_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="RM_suitedLine_processUnit_testEdit_form" cssStyle="height:100%;" hiddenField="" onsubmitMethod="RM.suitedLine.processUnit.testEdit.beforeSubmitMethod()" ecAction="/RM/suitedLine/processUnit/testEdit/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="testEdit">
	<input type="hidden" name="viewCode" value="RM_7.5.0.0_suitedLine_testEdit">
	<input type="hidden" name="datagridKey" value="RM_suitedLine_processUnit_testEdit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="processUnit.version" value="${(processUnit.version)!0}" />
	<input type="hidden" name="processUnit.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
	<div id="RM_testEdit_edit_div" style="height:100%">
		<div id="RM_suitedLine_processUnit_testEdit_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "RM_suitedLine_processUnit_testEdit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=RM_7.5.0.0_suitedLine', null, function(){
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
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
</div>				</div>	
				<div class="edit-datatable">	

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

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
								<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_suitedLine_ProcessPoint", "RM_7.5.0.0_suitedLine_testEditdg1490266476594", "DATAGRID", "processPoint")>
								<#list customPropViewMappings as cpvm>
									<#if cpvm.property.type == 'OBJECT' && cpObjHideKey?index_of(",'" +cpvm.propertyLayRec) lt 0>
										<#assign cpObjHideKey = cpObjHideKey + ",'" + cpvm.propertyLayRec + "'">
									</#if>
									<#if cpvm.propertyLayRec?index_of('.') lt 0 && cpvm.relatedKey?has_content>
										<#assign cpvmInfo = cpvmInfo + ',' + cpvm.relatedKey + "||" + cpvm.propertyLayRec>
										<#if cpvm.property.type == 'OBJECT'>
											<#assign cpvmInfo = cpvmInfo + "||" + cpvm.property.code>	
										</#if>
									</#if>
								</#list>
			
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/RM/suitedLine/processUnit/data-dg1490266476594.action?processUnit.id=${refId!-1}&refId=${refId!-1}&datagridCode=RM_7.5.0.0_suitedLine_testEditdg1490266476594">
			<#else>
				<#assign dUrl="/RM/suitedLine/processUnit/data-dg1490266476594.action?processUnit.id=${(processUnit.id)!-1}&datagridCode=RM_7.5.0.0_suitedLine_testEditdg1490266476594">
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
					<input type="hidden" id="dg_cp_info_ProcessPoint_dg1490266476594" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1490266476594_id" value="ProcessPoint_dg1490266476594" />
			
			<input type="hidden" id="dg1490266476594_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('RM.modelname.randon1487986669931')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/RM/suitedLine/processUnit/data-dg1490266476594.action?operateType=export&datagridCode=RM_7.5.0.0_suitedLine_testEditdg1490266476594"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="ProcessPoint_dg1490266476594" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="ProcessPoint_dg1490266476594" viewType="${viewType}" renderOverEvent="dg1490266476594RenderOverEvent" route="${routeFlag}" formId="RM_suitedLine_processUnit_testEdit_form" noPermissionKeys="unitId.name,activeId.name,precessStandards.quota,itemId.code,itemId.itemName,pmemo" modelCode="RM_7.5.0.0_suitedLine_ProcessPoint" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1490266476594" dtPage="dgPage"  hidekeyPrefix="dg1490266476594" hidekey="['id','version','unitId.id','unitId.name','activeId.id','activeId.name','precessStandards.id','precessStandards.quota','itemId.id','itemId.code','itemId.id','itemId.itemName'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1490266476594PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName  activexButton="" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign unitId_name_displayDefaultType=''>
								<#assign unitId_name_defaultValue=''>
										<#assign unitId_name_defaultValue=''>
																	<#if (unitId_name_defaultValue!)?string=="currentUser">
								<#assign unitId_name_defaultValue='${staffJson!}'>
							<#elseif (unitId_name_defaultValue!)?string=="currentPost">
								<#assign unitId_name_defaultValue='${postJson!}'>
							<#elseif (unitId_name_defaultValue!)?string=="currentDepart">
								<#assign unitId_name_defaultValue='${deptJson!}'>
							<#elseif (unitId_name_defaultValue!)?string=="currentComp">
								<#assign unitId_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="unitId.name"        showFormat="SELECTCOMP" defaultValue="${(unitId_name_defaultValue!)?string}" defaultDisplay="${(unitId_name_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="RM.suitedLine.processUnit.testEdit"  textalign="left"  viewUrl="/MESBasic/factoryModel/factoryModel/factroyRef1.action" viewCode="MESBasic_1_factoryModel_factroyRef1" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.radion1419491307826')}"  label="${getText('RM.propertydisplayName.radion1419232393782111')}" width=100 showFormatFunc=""  />
							<#assign activeId_name_displayDefaultType=''>
								<#assign activeId_name_defaultValue=''>
										<#assign activeId_name_defaultValue=''>
																	<#if (activeId_name_defaultValue!)?string=="currentUser">
								<#assign activeId_name_defaultValue='${staffJson!}'>
							<#elseif (activeId_name_defaultValue!)?string=="currentPost">
								<#assign activeId_name_defaultValue='${postJson!}'>
							<#elseif (activeId_name_defaultValue!)?string=="currentDepart">
								<#assign activeId_name_defaultValue='${deptJson!}'>
							<#elseif (activeId_name_defaultValue!)?string=="currentComp">
								<#assign activeId_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="activeId.name"        showFormat="SELECTCOMP" defaultValue="${(activeId_name_defaultValue!)?string}" defaultDisplay="${(activeId_name_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="RM.suitedLine.processUnit.testEdit"  textalign="left"  viewUrl="/RM/formula/formulaProcessActive/activeRef.action" viewCode="RM_7.5.0.0_formula_activeRef" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1489564694469')}"  label="${getText('RM.propertydisplayName.randon1487330156499112')}" width=100 showFormatFunc=""  />
							<#assign precessStandards_quota_displayDefaultType=''>
								<#assign precessStandards_quota_defaultValue=''>
										<#assign precessStandards_quota_defaultValue=''>
																	<#if (precessStandards_quota_defaultValue!)?string=="currentUser">
								<#assign precessStandards_quota_defaultValue='${staffJson!}'>
							<#elseif (precessStandards_quota_defaultValue!)?string=="currentPost">
								<#assign precessStandards_quota_defaultValue='${postJson!}'>
							<#elseif (precessStandards_quota_defaultValue!)?string=="currentDepart">
								<#assign precessStandards_quota_defaultValue='${deptJson!}'>
							<#elseif (precessStandards_quota_defaultValue!)?string=="currentComp">
								<#assign precessStandards_quota_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="precessStandards.quota"        showFormat="SELECTCOMP" defaultValue="${(precessStandards_quota_defaultValue!)?string}" defaultDisplay="${(precessStandards_quota_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="RM.suitedLine.processUnit.testEdit"  textalign="left"  viewUrl="/RM/formula/precessStandards/precessStandardsRef.action" viewCode="RM_7.5.0.0_formula_precessStandardsRef" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1489564893234')}"  label="${getText('RM.propertydisplayName.randon1487331350188')}" width=100 showFormatFunc=""  />
							<#assign itemId_code_displayDefaultType=''>
								<#assign itemId_code_defaultValue=''>
										<#assign itemId_code_defaultValue=''>
																	<#if (itemId_code_defaultValue!)?string=="currentUser">
								<#assign itemId_code_defaultValue='${staffJson!}'>
							<#elseif (itemId_code_defaultValue!)?string=="currentPost">
								<#assign itemId_code_defaultValue='${postJson!}'>
							<#elseif (itemId_code_defaultValue!)?string=="currentDepart">
								<#assign itemId_code_defaultValue='${deptJson!}'>
							<#elseif (itemId_code_defaultValue!)?string=="currentComp">
								<#assign itemId_code_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="itemId.code"        showFormat="SELECTCOMP" defaultValue="${(itemId_code_defaultValue!)?string}" defaultDisplay="${(itemId_code_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=true   selectCompName="RM.suitedLine.processUnit.testEdit"  textalign="left"  viewUrl="/MESBasic/itemManage/itemSetup/itemSelfList.action" viewCode="MESBasic_1_itemManage_itemSelfList" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.radion1421223012419')}"  label="${getText('MESBasic.propertydisplayName.radion1415261315358')}" width=100 showFormatFunc=""  />
							<#assign itemId_itemName_displayDefaultType=''>
								<#assign itemId_itemName_defaultValue=''>
										<#assign itemId_itemName_defaultValue=''>
																	<#if (itemId_itemName_defaultValue!)?string=="currentUser">
								<#assign itemId_itemName_defaultValue='${staffJson!}'>
							<#elseif (itemId_itemName_defaultValue!)?string=="currentPost">
								<#assign itemId_itemName_defaultValue='${postJson!}'>
							<#elseif (itemId_itemName_defaultValue!)?string=="currentDepart">
								<#assign itemId_itemName_defaultValue='${deptJson!}'>
							<#elseif (itemId_itemName_defaultValue!)?string=="currentComp">
								<#assign itemId_itemName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="itemId.itemName"        showFormat="TEXT" defaultValue="${(itemId_itemName_defaultValue!)?string}" defaultDisplay="${(itemId_itemName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="RM.suitedLine.processUnit.testEdit"  textalign="left"  viewUrl="/MESBasic/itemManage/itemSetup/itemRefForContainer.action" viewCode="MESBasic_1_itemManage_itemRefForContainer" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1422422463756')}"  label="${getText('MESBasic.propertydisplayName.radion1415258813793')}" width=100 showFormatFunc=""  />
							<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_suitedLine_ProcessPoint", "RM_7.5.0.0_suitedLine_testEditdg1490266476594", "DATAGRID", "processPoint")>
							<#-- 排布自定义字段 -->
							<#list customPropViewMappings as cpvm>
								<#assign cpvmColumnType = cpvm.property.type>
								<#assign cpvmKey = cpvm.propertyLayRec>
								<#assign cpvmType = cpvmColumnType?lower_case>
								
								<#assign cpEditable = true>
								<#if cpEditable && cpvmKey?index_of('.') gt -1>
									<#assign cpEditable = false>
								</#if>
								<#if cpvm.readonly!false>
									<#assign cpEditable = false>
								</#if>
								<#assign cpvmNotNull = false>
								<#if cpEditable && !(cpvm.nullable!true)>
									<#assign cpvmNotNull = true>
								</#if>
								<#assign cpDecimal = ''>
								<#if cpvm.property.type == 'DECIMAL'>
									<#assign cpDecimal = (cpvm.property.decimalNum!0)>
									<#if cpvm.precision??>
										<#assign cpDecimal =cpvm.precision!>
									</#if>
								</#if>
								<#assign cpvmWidth = 100>
								<#if cpvmColumnType == 'DATETIME'>
									<#assign cpvmWidth = 130>
								</#if>
								<#if cpvm.fieldType == 'TEXTAREA'>
									<#assign cpvmWidth = 200>
								</#if>
								
								<#if cpvmColumnType == 'TEXT'>
									<#assign cpvmType = 'textfield'>
								<#elseif cpvmColumnType == 'DATETIME' || cpvmColumnType == 'SYSTEMCODE' || cpvmColumnType == 'OBJECT'>
									<#assign cpvmType = cpvm.fieldType?lower_case>
								</#if>
								
								<#if cpvmColumnType == 'SYSTEMCODE'>
									<#assign cpvmSeniorSystemCode = false>
									<#if cpvm.property.seniorSystemCode?? && cpvm.property.seniorSystemCode>
										<#assign cpvmSeniorSystemCode = true>
									</#if>
									<#assign systemEntityCode = cpvm.property.fillcontentMap.fillContent>
									<#assign systemEntity = getSystemCode(systemEntityCode)>
									<#assign systemCodelistType = systemEntity.listType>
									<#if cpvm.property.multable?? && cpvm.property.multable && systemCodelistType?? && systemCodelistType == 'TREE'>
										<@systemCodeColumn width=cpvmWidth label="${getText('${cpvm.displayName}')}" code="${(cpvm.property.fillcontentMap.fillContent)!}" key=cpvmKey isCustom=true editable=cpEditable type=cpvmType notnull=cpvmNotNull seniorSystemCode=cpvmSeniorSystemCode isTree=true isMultTree=true systemEntityCode=systemEntityCode systemCodeUrl="/foundation/systemCode/multiCodeTree.action?systemEntityCode=${systemEntityCode}"/>
									<#elseif cpvm.property.multable?? && cpvm.property.multable>
										<@systemCodeColumn width=cpvmWidth label="${getText('${cpvm.displayName}')}" code="${(cpvm.property.fillcontentMap.fillContent)!}" key=cpvmKey isCustom=true editable=cpEditable type=cpvmType notnull=cpvmNotNull seniorSystemCode=cpvmSeniorSystemCode isMultable=true systemEntityCode=systemEntityCode systemCodeUrl="/foundation/systemCode/multiCodeList.action?systemEntityCode=${systemEntityCode}"/>
									<#elseif systemCodelistType?? && systemCodelistType == 'TREE'>
										<@systemCodeColumn width=cpvmWidth label="${getText('${cpvm.displayName}')}" code="${(cpvm.property.fillcontentMap.fillContent)!}" key=cpvmKey isCustom=true editable=cpEditable type=cpvmType notnull=cpvmNotNull seniorSystemCode=cpvmSeniorSystemCode isTree=true systemEntityCode=systemEntityCode systemCodeUrl="/foundation/systemCode/singleCodeTree.action?systemEntityCode=${systemEntityCode}"/>
									<#else>
										<@systemCodeColumn width=cpvmWidth label="${getText('${cpvm.displayName}')}" code="${(cpvm.property.fillcontentMap.fillContent)!}" key=cpvmKey isCustom=true editable=cpEditable type=cpvmType notnull=cpvmNotNull seniorSystemCode=cpvmSeniorSystemCode/>
									</#if>
								<#else>
									<#assign viewUrl = ''>
									<#assign viewTitle = ''>
									<#assign viewCode = ''>
									<#assign selectCompName = ''>
									<#assign isObjCustomProp = false>
									<#assign objCustomPropNames = ''>
									<#if cpvmColumnType == 'OBJECT'>
										<#if cpvm.refView??>
											<#assign viewUrl = (cpvm.refView.url)!''>
											<#assign viewTitle = (cpvm.refView.title)!''>
											<#assign viewCode = (cpvm.refView.code)!''>
											<#assign selectCompName = 'RM.suitedLine.processUnit.testEdit'>
										</#if>
										<#assign pkName = ''>
										<#assign mainDisplayName = ''>
										<#list cpvm.property.associatedProperty.model.properties as p>
											<#if !pkName?has_content && p.isPk?? && p.isPk>
												<#assign pkName = p.name>
											</#if>
											<#if !mainDisplayName?has_content && p.isMainDisplay?? && p.isMainDisplay>
												<#assign mainDisplayName = p.name>
											</#if>
										</#list>
										<#assign cpvmKey = cpvmKey + 'MainDisplay'>
										<#assign isObjCustomProp = true>
										<#assign objCustomPropNames = (mainDisplayName!'name') + ',' + (pkName!'id')> 
									</#if>
									
									<#if cpvm.align??>
										<#assign columnAlign = cpvm.align >						
									<#elseif (cpvm.property.type=='INTEGER' || cpvm.property.type=='DECIMAL')>
										<#assign columnAlign = 'right'>
									<#else>
										<#assign columnAlign = 'left' >
									</#if>
						
									<@datacolumn key=cpvmKey width=cpvmWidth showFormat="${cpvm.format!'TEXT'}" decimal="${cpDecimal}" editable=cpEditable type=cpvmType showType="${cpvm.fieldType}" notnull=cpvmNotNull callbackname="" selectCompName=selectCompName viewUrl="${viewUrl!}" viewCode="${viewCode!}" crossCompany=false viewTitle="${getText('${viewTitle!}')}" label="${getText('${cpvm.displayName}')}" isObjCustomProp=isObjCustomProp objCustomPropNames="${objCustomPropNames}" textalign="${columnAlign}" />
								</#if>
							</#list>
							<#assign pmemo_displayDefaultType=''>
								<#assign pmemo_defaultValue=''>
										<#assign pmemo_defaultValue=''>
										  
									<@datacolumn key="pmemo"        showFormat="TEXT" defaultValue="${(pmemo_defaultValue!)?string}" defaultDisplay="${(pmemo_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487987361282')}" width=150 showFormatFunc=""  />
			
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
				function ProcessPoint_dg1490266476594_check_datagridvalid(){
					//
					var errorObj =ProcessPoint_dg1490266476594Widget._DT.testData();
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
				
				function savedg1490266476594DataGrid(){
					<#if  refId?? && (refId gt 0)>
					ProcessPoint_dg1490266476594Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('ProcessPoint_dg1490266476594Widget') > -1) {
						ProcessPoint_dg1490266476594Widget.setAllRowEdited();
					}
					var json = ProcessPoint_dg1490266476594Widget.parseEditedData();
					$('input[name="dg1490266476594ListJson"]').remove();
					$('input[name="dgLists[\'dg1490266476594\']"]').remove();
					$('input[name="dg1490266476594ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1490266476594\']">').val(json).appendTo($('#RM_suitedLine_processUnit_testEdit_form'));
					$('<input type="hidden" name="dg1490266476594ModelCode">').val('RM_7.5.0.0_suitedLine_ProcessPoint').appendTo($('#RM_suitedLine_processUnit_testEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1490266476594ListJson">').val(json).appendTo($('#RM_suitedLine_processUnit_testEdit_form'));
				}
				function DT_ProcessPoint_dg1490266476594_deldatagrid(){
					var deleteRows = ProcessPoint_dg1490266476594Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','activeId.id','formulaId.id','lineId.id','precessStandards.id','itemId.id','unitId.id','processUnit.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1490266476594DeletedIds").length>0){
							$("#dg1490266476594DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1490266476594DeletedIds" name="dgDeletedIds[\'dg1490266476594\']" value="'+tepID+'">').appendTo(CUI('#RM_suitedLine_processUnit_testEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1490266476594DeletedIds['+CUI('input[name^="dg1490266476594DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_suitedLine_processUnit_testEdit_form'));
					});
					return deleteRows;
				}
				function DT_ProcessPoint_dg1490266476594_delTreeNodes(){
					var deleteRows = ProcessPoint_dg1490266476594Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','activeId.id','formulaId.id','lineId.id','precessStandards.id','itemId.id','unitId.id','processUnit.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1490266476594DeletedIds").length>0){
							$("#dg1490266476594DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1490266476594DeletedIds" name="dgDeletedIds[\'dg1490266476594\']" value="'+tepID+'">').appendTo(CUI('#RM_suitedLine_processUnit_testEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1490266476594DeletedIds['+CUI('input[name^="dg1490266476594DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_suitedLine_processUnit_testEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('RM_suitedLine_processUnit_testEdit_datagrids');
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
							if(datagrids[0][i] == 'ProcessPoint_dg1490266476594') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'ProcessPoint_dg1490266476594';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'ProcessPoint_dg1490266476594';
					}
					$('body').data('RM_suitedLine_processUnit_testEdit_datagrids', datagrids);
				});
				
				var ProcessPoint_dg1490266476594_importDialog = null;
				function ProcessPoint_dg1490266476594_showImportDialog(){
					try{
						if(ProcessPoint_dg1490266476594_importDialog!=null&&ProcessPoint_dg1490266476594_importDialog.isShow==1){
							return false;
						}
						var url = "/RM/suitedLine/processUnit/initImport.action?datagridCode=RM_7.5.0.0_suitedLine_testEditdg1490266476594&tid=${id!}&datagridName=dg1490266476594";
							<#if canImportExcel>
								var buttonCode="RM_7.5.0.0_suitedLine_testEditdg1490266476594_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						ProcessPoint_dg1490266476594_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("ProcessPoint_dg1490266476594"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();ProcessPoint_dg1490266476594_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();ProcessPoint_dg1490266476594_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						ProcessPoint_dg1490266476594_importDialog.show();
					}catch(e){}
				}	
				
				function ProcessPoint_dg1490266476594_downLoadFile(){
					var url = "/RM/suitedLine/processUnit/downLoad.action?datagridCode=RM_7.5.0.0_suitedLine_testEditdg1490266476594&templateRelatedModelCode=RM_7.5.0.0_suitedLine_testEditdg1490266476594&downloadType=template&fileName=dg1490266476594";
					window.open(url,"","");
				}
				function dg1490266476594RenderOverEvent(){
					var processUntit;
if(ProcessUnit_dg1490263075678Widget.getCellValue(ProcessUnit_dg1490263075678Widget.getSelectedRow(),'processUnitIDUnitId').substr(0,1)==","){
	processUntit=ProcessUnit_dg1490263075678Widget.getCellValue(ProcessUnit_dg1490263075678Widget.getSelectedRow(),'processUnitIDUnitId').substr(1,ProcessUnit_dg1490263075678Widget.getCellValue(ProcessUnit_dg1490263075678Widget.getSelectedRow(),'processUnitIDUnitId').length-1);
}else{
	processUntit=ProcessUnit_dg1490263075678Widget.getCellValue(ProcessUnit_dg1490263075678Widget.getSelectedRow(),'processUnitIDUnitId');
}
var processUnitId=$('#RM_suitedLine_processUnit_testEdit_form input[id="id"]').val();
//判断试用产线中的工作单元是否进行了更改
var url1 = "/RM/suitedLine/processPoint/getTestPointCount.action?processUnitId="+processUnitId+"&processUntit="+processUntit;
	var pointFlag;
	$.ajax({
		url : url1,
		type : 'get',
		async : false,
		success : function(msg) {
			if(msg!=null){
				pointFlag = msg.result;
			}
		}
	});
	$('#pointFlag').val(pointFlag);
if(pointFlag==false){
var processUnitId=$('#RM_suitedLine_processUnit_testEdit_form input[id="id"]').val();
	//根据工作中心和工序构造测点的数据
	var url = "/RM/suitedLine/processPoint/setTestPoint.action?processUnitId="+processUnitId+"&processUntit="+processUntit;
	var paramResult;
	$.ajax({
		url : url,
		type : 'get',
		async : false,
		success : function(msg) {
			if(msg!=null){
				paramResult = msg;
			}
		}
	});
	ProcessPoint_dg1490266476594Widget._DT.delAllRows()
	for(var param in paramResult){
	console.log(param);
         //活动编码活动名称		 
		var activeId = paramResult[param]['activeId']==null?"":paramResult[param]['activeId'];
		var activeName= paramResult[param]['activeName']==null?"":paramResult[param]['activeName'];
		
		//指标编码指标名称
		var standardId = paramResult[param]['standardId']==null?"":paramResult[param]['standardId'];
		var standardName= paramResult[param]['standardName']==null?"":paramResult[param]['standardName'];
		
		//工作单元编码工作单元名称
		var unitId = paramResult[param]['unitId']==null?"":paramResult[param]['unitId'];
		var unitName= paramResult[param]['unitName']==null?"":paramResult[param]['unitName'];
		
		ProcessPoint_dg1490266476594Widget._DT.addNewRow();
		var lastRow = ProcessPoint_dg1490266476594Widget._DT.getAllRows().length - 1;
		 
		ProcessPoint_dg1490266476594Widget.setCellValue(lastRow,'unitId.name',unitName);
		ProcessPoint_dg1490266476594Widget.setCellValue(lastRow,'unitId.id',unitId);
		ProcessPoint_dg1490266476594Widget.setCellValue(lastRow,'activeId.name',activeName);
		ProcessPoint_dg1490266476594Widget.setCellValue(lastRow,'activeId.id',activeId);
		ProcessPoint_dg1490266476594Widget.setCellValue(lastRow,'precessStandards.quota',standardName);
		ProcessPoint_dg1490266476594Widget.setCellValue(lastRow,'precessStandards.id',standardId);

	}
}
				}
				function dg1490266476594PageInitMethod(nTabIndex){
					RM.suitedLine.processUnit.testEdit.initSize(nTabIndex);
				}
			</script>
			
			
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_suitedLine_testEdit,html,RM_7.5.0.0_suitedLine_ProcessUnit,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	RM.suitedLine.processUnit.testEdit.beforeSaveProcess = function(){}
	RM.suitedLine.processUnit.testEdit.beforeSubmitMethod = function() {
		try{eval("savedg1490266476594DataGrid()");}catch(e){}
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(RM.suitedLine.processUnit.testEdit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#RM_suitedLine_processUnit_testEdit_form').trigger('beforeSubmit');
		//processUnit.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="processUnit.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#RM_suitedLine_processUnit_testEdit_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#RM_suitedLine_processUnit_testEdit_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	RM.suitedLine.processUnit.testEdit.validate = function(){
		return true;
	}
	
	
	//打印
	RM.suitedLine.processUnit.testEdit.print = function(url){
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
		
		RM.suitedLine.processUnit.testEdit.saveSetting = function(){
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
		RM.suitedLine.processUnit.testEdit.printSetting = function(){
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
			RM.suitedLine.processUnit.testEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(RM.suitedLine.processUnit.testEdit.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				RM.suitedLine.processUnit.testEdit.settingDialog.show();
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
			RM.suitedLine.processUnit.testEdit._customCallBack = customCallBack;
		}
		RM.suitedLine.processUnit.testEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#RM_suitedLine_processUnit_testEdit_fileupload').length == 0) {
				$('body').append('<div id="RM_suitedLine_processUnit_testEdit_fileupload"></div>');
			}
			RM.suitedLine.processUnit.testEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "RM_suitedLine_processUnit_testEdit_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#RM_suitedLine_processUnit_testEdit_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			RM.suitedLine.processUnit.testEdit.infoDialog.show();
			if($('#RM_suitedLine_processUnit_testEdit_fileupload').html() == '') {
				$('#RM_suitedLine_processUnit_testEdit_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=RM_suitedLine_processUnit&entityCode=RM_7.5.0.0_suitedLine&dialogId="+dialogId);
			}
		}
	//参照复制函数
	RM.suitedLine.processUnit.testEdit.referenceCopy = function(objName,url, dialog){
		var callbackName ="RM.suitedLine.processUnit.testEdit.referenceCopyBackInfo";
		RM.suitedLine.processUnit.testEdit.dialog = dialog;
		RM.suitedLine.processUnit.testEdit._dialog = foundation.common.select({
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
	
	RM.suitedLine.processUnit.testEdit.referenceCopyBackInfo = function(obj){
		if(RM.suitedLine.processUnit.testEdit._dialog){
			RM.suitedLine.processUnit.testEdit._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,RM.suitedLine.processUnit.testEdit.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('RM_suitedLine_processUnit_testEdit_form','RM_suitedLine_processUnit_testEdit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(RM.suitedLine.processUnit.testEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(RM.suitedLine.processUnit.testEdit.dialog._el).load('/RM/suitedLine/processUnit/testEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( RM.suitedLine.processUnit.testEdit.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + RM.suitedLine.processUnit.testEdit.dialog._config.iframe, RM.suitedLine.processUnit.testEdit.dialog._dialog ).prop( 'src', '/RM/suitedLine/processUnit/testEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(RM.suitedLine.processUnit.testEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(RM.suitedLine.processUnit.testEdit.dialog._el).load('/RM/suitedLine/processUnit/testEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	RM.suitedLine.processUnit.testEdit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		RM.suitedLine.processUnit.testEdit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		RM.suitedLine.processUnit.testEdit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			RM.suitedLine.processUnit.testEdit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	RM.suitedLine.processUnit.testEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'RM_suitedLine_processUnit_testEdit' + '_' + extraFrameParam;
		var callbackName="";
		RM.suitedLine.processUnit.testEdit._prefix = '';
		RM.suitedLine.processUnit.testEdit._oGrid = oGrid;
		RM.suitedLine.processUnit.testEdit._sUrl = url;
		if(customCallBack){
			RM.suitedLine.processUnit.testEdit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			RM.suitedLine.processUnit.testEdit.gridEventObj = gridEventObj;
			callbackName = "RM.suitedLine.processUnit.testEdit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				RM.suitedLine.processUnit.testEdit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "RM.suitedLine.processUnit.testEdit.getMultiselectCallBackInfo_DG" : "RM.suitedLine.processUnit.testEdit.getcallBackInfo_DG";
			RM.suitedLine.processUnit.testEdit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				RM.suitedLine.processUnit.testEdit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="RM.suitedLine.processUnit.testEdit.getcallBackInfo";
		}
		if(RM.suitedLine.processUnit.testEdit._prefix!=''){
			RM.suitedLine.processUnit.testEdit._prefix = RM.suitedLine.processUnit.testEdit._prefix.substring(1);
		}
		if(RM.suitedLine.processUnit.testEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.suitedLine.processUnit.testEdit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof RM.suitedLine.processUnit.testEdit._querycustomFuncN == "function") {
				refparam += RM.suitedLine.processUnit.testEdit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		RM.suitedLine.processUnit.testEdit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.suitedLine.processUnit.testEdit._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.suitedLine.processUnit.testEdit.query_"+obj+")!='undefined'") ? eval('RM.suitedLine.processUnit.testEdit.query_'+obj+'()') : null;
		return str;
	
	};
	
	RM.suitedLine.processUnit.testEdit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('RM_suitedLine_processUnit_testEdit_form',obj[0], RM.suitedLine.processUnit.testEdit._prefix, RM.suitedLine.processUnit.testEdit._sUrl);
		CUI.commonFills('RM_suitedLine_processUnit_testEdit_form',RM.suitedLine.processUnit.testEdit._prefix,obj[0]);

		try{
			if(RM.suitedLine.processUnit.testEdit._customCallBack) {
				eval(RM.suitedLine.processUnit.testEdit._customCallBack);
				RM.suitedLine.processUnit.testEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.suitedLine.processUnit.testEdit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	RM.suitedLine.processUnit.testEdit.getcallBackInfo_DG_IE = function(obj){
		if(RM.suitedLine.processUnit.testEdit._customBeforeCallBack) {
			var flag = eval(RM.suitedLine.processUnit.testEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = RM.suitedLine.processUnit.testEdit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,RM.suitedLine.processUnit.testEdit._sUrl);
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
			if(RM.suitedLine.processUnit.testEdit._customCallBack) {
				eval(RM.suitedLine.processUnit.testEdit._customCallBack);
				RM.suitedLine.processUnit.testEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.suitedLine.processUnit.testEdit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	RM.suitedLine.processUnit.testEdit.getcallBackInfo_DG = function(obj){
		if(RM.suitedLine.processUnit.testEdit._customBeforeCallBack) {
			var flag = eval(RM.suitedLine.processUnit.testEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(RM.suitedLine.processUnit.testEdit._currRow).next().length==0){
					RM.suitedLine.processUnit.testEdit._oGrid.addNewRow();
				}	
				RM.suitedLine.processUnit.testEdit._currRow = $(RM.suitedLine.processUnit.testEdit._currRow).next();
				$(RM.suitedLine.processUnit.testEdit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(RM.suitedLine.processUnit.testEdit._currRow,obj[i],RM.suitedLine.processUnit.testEdit._prefix,RM.suitedLine.processUnit.testEdit._sUrl);
			eval("CUI.commonFills_DG(RM.suitedLine.processUnit.testEdit._currRow,RM.suitedLine.processUnit.testEdit._prefix,obj[i],RM.suitedLine.processUnit.testEdit._oGrid)");
		}
		try{
			if(RM.suitedLine.processUnit.testEdit._customCallBack) {
				eval(RM.suitedLine.processUnit.testEdit._customCallBack);
				RM.suitedLine.processUnit.testEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.suitedLine.processUnit.testEdit._dialog.close();
		} catch(e){}
	};
	
	RM.suitedLine.processUnit.testEdit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(RM.suitedLine.processUnit.testEdit._oGrid, RM.suitedLine.processUnit.testEdit._currRow, RM.suitedLine.processUnit.testEdit._key, RM.suitedLine.processUnit.testEdit._displayFieldName, obj[i])
		}
		try{
			if(RM.suitedLine.processUnit.testEdit._customCallBack) {
				eval(RM.suitedLine.processUnit.testEdit._customCallBack);
				RM.suitedLine.processUnit.testEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.suitedLine.processUnit.testEdit._dialog.close();
		} catch(e){}
	};
	
	RM.suitedLine.processUnit.testEdit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			RM.suitedLine.processUnit.testEdit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#RM_suitedLine_processUnit_testEdit_form'));
        			}
        	   	}
        	}
      	});
	};
	(function($){
		$(function(){
			$("#RM_suitedLine_lineFormula_suitedLineEdit_main_div").append("<input type=\"hidden\" id=\"pointFlag\">");
		});
	})(jQuery);
	RM.suitedLine.processUnit.testEdit.beforeSubmitMethodSettingInPage = function(){
		//保存测点
if($('#pointFlag').val()=='false'){//判断单元是否修改，若修改则重新生成测点
	var processUnitId=$('#RM_suitedLine_processUnit_testEdit_form input[id="id"]').val();
	var url = "/RM/suitedLine/processPoint/deleteTestPoint.action?processUnitId="+processUnitId;
	var paramResult;
	$.ajax({
		url : url,
		type : 'get',
		async : false,
		success : function(msg) {
			if(msg!=null){
				paramResult = msg;
			}
		}
	});
}
var height=ProcessPoint_dg1490266476594Widget.getRowLength();
var errorMessage='';
if(height>0){
	for(var i=0;i<height;i++){
		var itemCode=ProcessPoint_dg1490266476594Widget.getCellValue(i,'itemId.code');
		if(itemCode==null ||itemCode==''||itemCode==undefined){
			errorMessage+=i+1+"、"
		}
	}
	if(errorMessage!=''){
		RM_suitedLine_processUnit_testEdit_formDialogErrorBarWidget.showMessage("表体中第"+errorMessage.substring(0,errorMessage.length-1)+"行测点编码不允许为空！");
		return false;
	}
}
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	RM.suitedLine.processUnit.testEdit.initCount = 0;
	RM.suitedLine.processUnit.testEdit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#RM_testEdit_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('RM_suitedLine_processUnit_testEdit_datagrids');	
		var	conHeight = h-$("#RM_suitedLine_processUnit_testEdit_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#RM_suitedLine_processUnit_testEdit_main_div .edit-panes-s").each(function(index){
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
							if(RM.suitedLine.processUnit.testEdit.initCount <= 2) {
								setTimeout(function(){RM.suitedLine.processUnit.testEdit.initSize();}, 200);
								RM.suitedLine.processUnit.testEdit.initCount++;
							}/* else {
								RM.suitedLine.processUnit.testEdit.initCount = 0;
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
		RM.suitedLine.processUnit.testEdit.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    RM.suitedLine.processUnit.testEdit.initSize(index);
		});
		$(window).bind("dialog.resize",function(){RM.suitedLine.processUnit.testEdit.initSize();});
	});
</script>
<script type="text/javascript">
	



	/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_suitedLine_testEdit,js,RM_7.5.0.0_suitedLine_ProcessUnit,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>