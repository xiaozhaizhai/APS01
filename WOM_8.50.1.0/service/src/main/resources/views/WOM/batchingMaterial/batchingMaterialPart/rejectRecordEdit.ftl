<!-- WOM_7.5.0.0/batchingMaterial/rejectRecordEdit -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1543392454604')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_batchingMaterial_rejectRecordEdit,head,WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart,WOM_7.5.0.0) -->
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
	CUI.ns('WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit');
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
<#assign callbackName ="WOM.batchingMaterial.batchingMaterialPart.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_form" cssStyle="height:100%;" hiddenField="" onsubmitMethod="WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.beforeSubmitMethod()" ecAction="/WOM/batchingMaterial/batchingMaterialPart/rejectRecordEdit/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="rejectRecordEdit">
	<input type="hidden" name="viewCode" value="WOM_7.5.0.0_batchingMaterial_rejectRecordEdit">
	<input type="hidden" name="datagridKey" value="WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="batchingMaterialPart.version" value="${(batchingMaterialPart.version)!0}" />
	<input type="hidden" name="batchingMaterialPart.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
	<div id="WOM_rejectRecordEdit_edit_div" style="height:100%">
		<div id="WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=WOM_7.5.0.0_batchingMaterial', null, function(){
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
				<#assign dUrl="/WOM/batchingMaterial/batchingMaterialPart/data-dg1543470616564.action?batchingMaterialPart.id=${refId!-1}&refId=${refId!-1}&datagridCode=WOM_7.5.0.0_batchingMaterial_rejectRecordEditdg1543470616564">
			<#else>
				<#assign dUrl="/WOM/batchingMaterial/batchingMaterialPart/data-dg1543470616564.action?batchingMaterialPart.id=${(batchingMaterialPart.id)!-1}&datagridCode=WOM_7.5.0.0_batchingMaterial_rejectRecordEditdg1543470616564">
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
					<input type="hidden" id="dg_cp_info_BatchingRejectParts_dg1543470616564" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1543470616564_id" value="BatchingRejectParts_dg1543470616564" />
			
			<input type="hidden" id="dg1543470616564_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('WOM.modelname.randon1543236237180')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/WOM/batchingMaterial/batchingMaterialPart/data-dg1543470616564.action?operateType=export&datagridCode=WOM_7.5.0.0_batchingMaterial_rejectRecordEditdg1543470616564"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="BatchingRejectParts_dg1543470616564" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="BatchingRejectParts_dg1543470616564" viewType="${viewType}" renderOverEvent="dg1543470616564RenderOverEvent" route="${routeFlag}" formId="WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_form" noPermissionKeys="batchNum,rejectProduct.productCode,rejectProduct.productName,productBatchNum,rejectNum,rejectReasonId.rejectReson,rejectReasonId.isChangeNeed,ware.wareCode,ware.wareName,ware.cargoStatue,store.placeSetCode,store.placeSetName,produceTaskId.tableNo,produceTaskId.factoryId.name,produceTaskId.productId.productName,batchingPartId.state,batchingId.id,batchingPartId.id,produceTaskId.id,rejectExeStaff.name,rejectTime" modelCode="WOM_7.5.0.0_batchingMaterial_BatchingRejectParts" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1543470616564" dtPage="dgPage"  hidekeyPrefix="dg1543470616564" hidekey="['id','version','rejectProduct.id','rejectProduct.productCode','rejectProduct.id','rejectProduct.productName','rejectReasonId.id','rejectReasonId.rejectReson','rejectReasonId.id','rejectReasonId.isChangeNeed','ware.id','ware.wareCode','ware.id','ware.wareName','ware.id','ware.cargoStatue.id','store.id','store.placeSetCode','store.id','store.placeSetName','produceTaskId.id','produceTaskId.tableNo','produceTaskId.id','produceTaskId.factoryId.name','produceTaskId.id','produceTaskId.productId.productName','batchingPartId.id','batchingPartId.state.id','batchingId.id','batchingId.id','batchingPartId.id','batchingPartId.id','produceTaskId.id','produceTaskId.id','rejectExeStaff.id','rejectExeStaff.name'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1543470616564PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName  activexButton="" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign batchNum_displayDefaultType=''>
								<#assign batchNum_defaultValue=''>
										<#assign batchNum_defaultValue=''>
										  
									<@datacolumn key="batchNum"        showFormat="TEXT" defaultValue="${(batchNum_defaultValue!)?string}" defaultDisplay="${(batchNum_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1543236260606')}" width=100 showFormatFunc=""  />
							<#assign rejectProduct_productCode_displayDefaultType=''>
								<#assign rejectProduct_productCode_defaultValue=''>
										<#assign rejectProduct_productCode_defaultValue=''>
																	<#if (rejectProduct_productCode_defaultValue!)?string=="currentUser">
								<#assign rejectProduct_productCode_defaultValue='${staffJson!}'>
							<#elseif (rejectProduct_productCode_defaultValue!)?string=="currentPost">
								<#assign rejectProduct_productCode_defaultValue='${postJson!}'>
							<#elseif (rejectProduct_productCode_defaultValue!)?string=="currentDepart">
								<#assign rejectProduct_productCode_defaultValue='${deptJson!}'>
							<#elseif (rejectProduct_productCode_defaultValue!)?string=="currentComp">
								<#assign rejectProduct_productCode_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="rejectProduct.productCode"        showFormat="SELECTCOMP" defaultValue="${(rejectProduct_productCode_defaultValue!)?string}" defaultDisplay="${(rejectProduct_productCode_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit"  textalign="left"  viewUrl="/MESBasic/product/product/customRef.action" viewCode="MESBasic_1_product_customRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" width=100 showFormatFunc=""  />
							<#assign rejectProduct_productName_displayDefaultType=''>
								<#assign rejectProduct_productName_defaultValue=''>
										<#assign rejectProduct_productName_defaultValue=''>
																	<#if (rejectProduct_productName_defaultValue!)?string=="currentUser">
								<#assign rejectProduct_productName_defaultValue='${staffJson!}'>
							<#elseif (rejectProduct_productName_defaultValue!)?string=="currentPost">
								<#assign rejectProduct_productName_defaultValue='${postJson!}'>
							<#elseif (rejectProduct_productName_defaultValue!)?string=="currentDepart">
								<#assign rejectProduct_productName_defaultValue='${deptJson!}'>
							<#elseif (rejectProduct_productName_defaultValue!)?string=="currentComp">
								<#assign rejectProduct_productName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="rejectProduct.productName"        showFormat="TEXT" defaultValue="${(rejectProduct_productName_defaultValue!)?string}" defaultDisplay="${(rejectProduct_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit"  textalign="left"  viewUrl="/MESBasic/product/product/customRef.action" viewCode="MESBasic_1_product_customRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" width=100 showFormatFunc=""  />
							<#assign productBatchNum_displayDefaultType=''>
								<#assign productBatchNum_defaultValue=''>
										<#assign productBatchNum_defaultValue=''>
										  
									<@datacolumn key="productBatchNum"        showFormat="TEXT" defaultValue="${(productBatchNum_defaultValue!)?string}" defaultDisplay="${(productBatchNum_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1543236355408')}" width=100 showFormatFunc=""  />
							<#assign rejectNum_displayDefaultType=''>
								<#assign rejectNum_defaultValue=''>
										<#assign rejectNum_defaultValue=''>
										  
									<@datacolumn key="rejectNum"        showFormat="TEXT" defaultValue="${(rejectNum_defaultValue!)?string}" defaultDisplay="${(rejectNum_displayDefaultType!)?string}" decimal="6" editable=true type="DECIMAL" showType="decimal" notnull=true     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1543236406431')}" width=100 showFormatFunc=""  />
							<#assign rejectReasonId_rejectReson_displayDefaultType=''>
								<#assign rejectReasonId_rejectReson_defaultValue=''>
										<#assign rejectReasonId_rejectReson_defaultValue=''>
																	<#if (rejectReasonId_rejectReson_defaultValue!)?string=="currentUser">
								<#assign rejectReasonId_rejectReson_defaultValue='${staffJson!}'>
							<#elseif (rejectReasonId_rejectReson_defaultValue!)?string=="currentPost">
								<#assign rejectReasonId_rejectReson_defaultValue='${postJson!}'>
							<#elseif (rejectReasonId_rejectReson_defaultValue!)?string=="currentDepart">
								<#assign rejectReasonId_rejectReson_defaultValue='${deptJson!}'>
							<#elseif (rejectReasonId_rejectReson_defaultValue!)?string=="currentComp">
								<#assign rejectReasonId_rejectReson_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="rejectReasonId.rejectReson"        showFormat="SELECTCOMP" defaultValue="${(rejectReasonId_rejectReson_defaultValue!)?string}" defaultDisplay="${(rejectReasonId_rejectReson_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=true   selectCompName="WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit"  textalign="left"  viewUrl="/WOM/materialReject/rejectReason/rejectReasonRef.action" viewCode="WOM_7.5.0.0_materialReject_rejectReasonRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1543219942185')}"  label="${getText('WOM.propertydisplayName.randon1543218783588')}" width=100 showFormatFunc=""  />
							<#assign rejectReasonId_isChangeNeed_displayDefaultType=''>
								<#assign rejectReasonId_isChangeNeed_defaultValue=''>
										<#assign rejectReasonId_isChangeNeed_defaultValue=''>
																	<#if (rejectReasonId_isChangeNeed_defaultValue!)?string=="currentUser">
								<#assign rejectReasonId_isChangeNeed_defaultValue='${staffJson!}'>
							<#elseif (rejectReasonId_isChangeNeed_defaultValue!)?string=="currentPost">
								<#assign rejectReasonId_isChangeNeed_defaultValue='${postJson!}'>
							<#elseif (rejectReasonId_isChangeNeed_defaultValue!)?string=="currentDepart">
								<#assign rejectReasonId_isChangeNeed_defaultValue='${deptJson!}'>
							<#elseif (rejectReasonId_isChangeNeed_defaultValue!)?string=="currentComp">
								<#assign rejectReasonId_isChangeNeed_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="rejectReasonId.isChangeNeed"        showFormat="CHECKBOX" defaultValue="${(rejectReasonId_isChangeNeed_defaultValue!)?string}" defaultDisplay="${(rejectReasonId_isChangeNeed_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false   selectCompName="WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit"  textalign="center"  viewUrl="/WOM/materialReject/rejectReason/rejectReasonRef.action" viewCode="WOM_7.5.0.0_materialReject_rejectReasonRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1543219942185')}"  label="${getText('WOM.propertydisplayName.randon1543218766334')}" width=130 showFormatFunc=""  />
							<#assign ware_wareCode_displayDefaultType=''>
								<#assign ware_wareCode_defaultValue=''>
										<#assign ware_wareCode_defaultValue=''>
																	<#if (ware_wareCode_defaultValue!)?string=="currentUser">
								<#assign ware_wareCode_defaultValue='${staffJson!}'>
							<#elseif (ware_wareCode_defaultValue!)?string=="currentPost">
								<#assign ware_wareCode_defaultValue='${postJson!}'>
							<#elseif (ware_wareCode_defaultValue!)?string=="currentDepart">
								<#assign ware_wareCode_defaultValue='${deptJson!}'>
							<#elseif (ware_wareCode_defaultValue!)?string=="currentComp">
								<#assign ware_wareCode_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="ware.wareCode"        showFormat="SELECTCOMP" defaultValue="${(ware_wareCode_defaultValue!)?string}" defaultDisplay="${(ware_wareCode_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit"  textalign="left"  viewUrl="/MESBasic/wareMan/ware/wareRef.action" viewCode="MESBasic_1_wareMan_wareRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" width=100 showFormatFunc=""  />
							<#assign ware_wareName_displayDefaultType=''>
								<#assign ware_wareName_defaultValue=''>
										<#assign ware_wareName_defaultValue=''>
																	<#if (ware_wareName_defaultValue!)?string=="currentUser">
								<#assign ware_wareName_defaultValue='${staffJson!}'>
							<#elseif (ware_wareName_defaultValue!)?string=="currentPost">
								<#assign ware_wareName_defaultValue='${postJson!}'>
							<#elseif (ware_wareName_defaultValue!)?string=="currentDepart">
								<#assign ware_wareName_defaultValue='${deptJson!}'>
							<#elseif (ware_wareName_defaultValue!)?string=="currentComp">
								<#assign ware_wareName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="ware.wareName"        showFormat="TEXT" defaultValue="${(ware_wareName_defaultValue!)?string}" defaultDisplay="${(ware_wareName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit"  textalign="left"  viewUrl="/MESBasic/wareMan/ware/wareRef.action" viewCode="MESBasic_1_wareMan_wareRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  label="${getText('MESBasic.propertydisplayName.randon1484031316281')}" width=100 showFormatFunc=""  />
							<#assign ware_cargoStatue_displayDefaultType=''>
								<#assign ware_cargoStatue_defaultValue=''>
										<#assign ware_cargoStatue_defaultValue=''>
																	<#if (ware_cargoStatue_defaultValue!)?string=="currentUser">
								<#assign ware_cargoStatue_defaultValue='${staffJson!}'>
							<#elseif (ware_cargoStatue_defaultValue!)?string=="currentPost">
								<#assign ware_cargoStatue_defaultValue='${postJson!}'>
							<#elseif (ware_cargoStatue_defaultValue!)?string=="currentDepart">
								<#assign ware_cargoStatue_defaultValue='${deptJson!}'>
							<#elseif (ware_cargoStatue_defaultValue!)?string=="currentComp">
								<#assign ware_cargoStatue_defaultValue='${compJson!}'>
							</#if>
									<@systemCodeColumn code="storageState" textalign="center" defaultValue="${(ware_cargoStatue_defaultValue!)?string}" key="ware.cargoStatue.id" editable=false type="selectcomp" notnull=false     label="${getText('MESBasic.propertydisplayName.randon1484031944240')}" width=100   />
							<#assign store_placeSetCode_displayDefaultType=''>
								<#assign store_placeSetCode_defaultValue=''>
										<#assign store_placeSetCode_defaultValue=''>
																	<#if (store_placeSetCode_defaultValue!)?string=="currentUser">
								<#assign store_placeSetCode_defaultValue='${staffJson!}'>
							<#elseif (store_placeSetCode_defaultValue!)?string=="currentPost">
								<#assign store_placeSetCode_defaultValue='${postJson!}'>
							<#elseif (store_placeSetCode_defaultValue!)?string=="currentDepart">
								<#assign store_placeSetCode_defaultValue='${deptJson!}'>
							<#elseif (store_placeSetCode_defaultValue!)?string=="currentComp">
								<#assign store_placeSetCode_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="store.placeSetCode"        showFormat="SELECTCOMP" defaultValue="${(store_placeSetCode_defaultValue!)?string}" defaultDisplay="${(store_placeSetCode_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit"  textalign="left"  viewUrl="/MESBasic/storeSet/storeSet/pubStoreRef.action" viewCode="MESBasic_1_storeSet_pubStoreRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1514434358343')}"  label="${getText('MESBasic.propertydisplayName.randon1489731651449')}" width=100 showFormatFunc=""  />
							<#assign store_placeSetName_displayDefaultType=''>
								<#assign store_placeSetName_defaultValue=''>
										<#assign store_placeSetName_defaultValue=''>
																	<#if (store_placeSetName_defaultValue!)?string=="currentUser">
								<#assign store_placeSetName_defaultValue='${staffJson!}'>
							<#elseif (store_placeSetName_defaultValue!)?string=="currentPost">
								<#assign store_placeSetName_defaultValue='${postJson!}'>
							<#elseif (store_placeSetName_defaultValue!)?string=="currentDepart">
								<#assign store_placeSetName_defaultValue='${deptJson!}'>
							<#elseif (store_placeSetName_defaultValue!)?string=="currentComp">
								<#assign store_placeSetName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="store.placeSetName"        showFormat="TEXT" defaultValue="${(store_placeSetName_defaultValue!)?string}" defaultDisplay="${(store_placeSetName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit"  textalign="left"  viewUrl="/MESBasic/storeSet/storeSet/pubStoreRef.action" viewCode="MESBasic_1_storeSet_pubStoreRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1514434358343')}"  label="${getText('MESBasic.propertydisplayName.randon1489731677162')}" width=100 showFormatFunc=""  />
							<#assign produceTaskId_tableNo_displayDefaultType=''>
								<#assign produceTaskId_tableNo_defaultValue=''>
										<#assign produceTaskId_tableNo_defaultValue=''>
																	<#if (produceTaskId_tableNo_defaultValue!)?string=="currentUser">
								<#assign produceTaskId_tableNo_defaultValue='${staffJson!}'>
							<#elseif (produceTaskId_tableNo_defaultValue!)?string=="currentPost">
								<#assign produceTaskId_tableNo_defaultValue='${postJson!}'>
							<#elseif (produceTaskId_tableNo_defaultValue!)?string=="currentDepart">
								<#assign produceTaskId_tableNo_defaultValue='${deptJson!}'>
							<#elseif (produceTaskId_tableNo_defaultValue!)?string=="currentComp">
								<#assign produceTaskId_tableNo_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="produceTaskId.tableNo"        showFormat="SELECTCOMP" defaultValue="${(produceTaskId_tableNo_defaultValue!)?string}" defaultDisplay="${(produceTaskId_tableNo_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit"  textalign="left"  viewUrl="/WOM/produceTask/produceTask/maketaskRef.action" viewCode="WOM_7.5.0.0_produceTask_maketaskRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1490145723075')}"  label="${getText('WOM.201811281354001')}" width=210 showFormatFunc=""  />
							<#assign produceTaskId_factoryId_name_displayDefaultType=''>
								<#assign produceTaskId_factoryId_name_defaultValue=''>
										<#assign produceTaskId_factoryId_name_defaultValue=''>
																	<#if (produceTaskId_factoryId_name_defaultValue!)?string=="currentUser">
								<#assign produceTaskId_factoryId_name_defaultValue='${staffJson!}'>
							<#elseif (produceTaskId_factoryId_name_defaultValue!)?string=="currentPost">
								<#assign produceTaskId_factoryId_name_defaultValue='${postJson!}'>
							<#elseif (produceTaskId_factoryId_name_defaultValue!)?string=="currentDepart">
								<#assign produceTaskId_factoryId_name_defaultValue='${deptJson!}'>
							<#elseif (produceTaskId_factoryId_name_defaultValue!)?string=="currentComp">
								<#assign produceTaskId_factoryId_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="produceTaskId.factoryId.name"        showFormat="TEXT" defaultValue="${(produceTaskId_factoryId_name_defaultValue!)?string}" defaultDisplay="${(produceTaskId_factoryId_name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit"  textalign="left"  viewUrl="/WOM/produceTask/produceTask/maketaskRef.action" viewCode="WOM_7.5.0.0_produceTask_maketaskRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1490145723075')}"  label="${getText('WOM.201811251355001')}" width=100 showFormatFunc=""  />
							<#assign produceTaskId_productId_productName_displayDefaultType=''>
								<#assign produceTaskId_productId_productName_defaultValue=''>
										<#assign produceTaskId_productId_productName_defaultValue=''>
																	<#if (produceTaskId_productId_productName_defaultValue!)?string=="currentUser">
								<#assign produceTaskId_productId_productName_defaultValue='${staffJson!}'>
							<#elseif (produceTaskId_productId_productName_defaultValue!)?string=="currentPost">
								<#assign produceTaskId_productId_productName_defaultValue='${postJson!}'>
							<#elseif (produceTaskId_productId_productName_defaultValue!)?string=="currentDepart">
								<#assign produceTaskId_productId_productName_defaultValue='${deptJson!}'>
							<#elseif (produceTaskId_productId_productName_defaultValue!)?string=="currentComp">
								<#assign produceTaskId_productId_productName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="produceTaskId.productId.productName"        showFormat="TEXT" defaultValue="${(produceTaskId_productId_productName_defaultValue!)?string}" defaultDisplay="${(produceTaskId_productId_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.201811291356')}" width=100 showFormatFunc=""  />
							<#assign batchingPartId_state_displayDefaultType=''>
								<#assign batchingPartId_state_defaultValue=''>
										<#assign batchingPartId_state_defaultValue=''>
																	<#if (batchingPartId_state_defaultValue!)?string=="currentUser">
								<#assign batchingPartId_state_defaultValue='${staffJson!}'>
							<#elseif (batchingPartId_state_defaultValue!)?string=="currentPost">
								<#assign batchingPartId_state_defaultValue='${postJson!}'>
							<#elseif (batchingPartId_state_defaultValue!)?string=="currentDepart">
								<#assign batchingPartId_state_defaultValue='${deptJson!}'>
							<#elseif (batchingPartId_state_defaultValue!)?string=="currentComp">
								<#assign batchingPartId_state_defaultValue='${compJson!}'>
							</#if>
									<@systemCodeColumn code="womBatPartState" textalign="center" defaultValue="${(batchingPartId_state_defaultValue!)?string}" key="batchingPartId.state.id" editable=false type="selectcomp" notnull=false     label="${getText('WOM.propertydisplayName.randon1491790699395')}" width=100   />
							<#assign batchingId_id_displayDefaultType=''>
								<#assign batchingId_id_defaultValue=''>
										<#assign batchingId_id_defaultValue=''>
																	<#if (batchingId_id_defaultValue!)?string=="currentUser">
								<#assign batchingId_id_defaultValue='${staffJson!}'>
							<#elseif (batchingId_id_defaultValue!)?string=="currentPost">
								<#assign batchingId_id_defaultValue='${postJson!}'>
							<#elseif (batchingId_id_defaultValue!)?string=="currentDepart">
								<#assign batchingId_id_defaultValue='${deptJson!}'>
							<#elseif (batchingId_id_defaultValue!)?string=="currentComp">
								<#assign batchingId_id_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="batchingId.id"        showFormat="SELECTCOMP" defaultValue="${(batchingId_id_defaultValue!)?string}" defaultDisplay="${(batchingId_id_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit"  textalign="center" hiddenCol=true viewUrl="/WOM/batchingMaterial/batchingMaterial/batMaterialRef.action" viewCode="WOM_7.5.0.0_batchingMaterial_batMaterialRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1491984336543')}"  label="${getText('ec.common.ID')}" width=100 showFormatFunc=""  />
							<#assign batchingPartId_id_displayDefaultType=''>
								<#assign batchingPartId_id_defaultValue=''>
										<#assign batchingPartId_id_defaultValue=''>
																	<#if (batchingPartId_id_defaultValue!)?string=="currentUser">
								<#assign batchingPartId_id_defaultValue='${staffJson!}'>
							<#elseif (batchingPartId_id_defaultValue!)?string=="currentPost">
								<#assign batchingPartId_id_defaultValue='${postJson!}'>
							<#elseif (batchingPartId_id_defaultValue!)?string=="currentDepart">
								<#assign batchingPartId_id_defaultValue='${deptJson!}'>
							<#elseif (batchingPartId_id_defaultValue!)?string=="currentComp">
								<#assign batchingPartId_id_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="batchingPartId.id"        showFormat="TEXT" defaultValue="${(batchingPartId_id_defaultValue!)?string}" defaultDisplay="${(batchingPartId_id_displayDefaultType!)?string}" decimal="" editable=false type="long" showType="long" notnull=false   selectCompName="WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit"  textalign="center"  viewUrl="/WOM/batchingMaterial/batchingMaterialPart/batPartForProcRef.action" viewCode="WOM_7.5.0.0_batchingMaterial_batPartForProcRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1541064596345')}"  label="${getText('ec.common.ID')}" width=100 showFormatFunc=""  />
							<#assign produceTaskId_id_displayDefaultType=''>
								<#assign produceTaskId_id_defaultValue=''>
										<#assign produceTaskId_id_defaultValue=''>
																	<#if (produceTaskId_id_defaultValue!)?string=="currentUser">
								<#assign produceTaskId_id_defaultValue='${staffJson!}'>
							<#elseif (produceTaskId_id_defaultValue!)?string=="currentPost">
								<#assign produceTaskId_id_defaultValue='${postJson!}'>
							<#elseif (produceTaskId_id_defaultValue!)?string=="currentDepart">
								<#assign produceTaskId_id_defaultValue='${deptJson!}'>
							<#elseif (produceTaskId_id_defaultValue!)?string=="currentComp">
								<#assign produceTaskId_id_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="produceTaskId.id"        showFormat="TEXT" defaultValue="${(produceTaskId_id_defaultValue!)?string}" defaultDisplay="${(produceTaskId_id_displayDefaultType!)?string}" decimal="" editable=false type="long" showType="long" notnull=false   selectCompName="WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit"  textalign="center" hiddenCol=true viewUrl="/WOM/produceTask/produceTask/maketaskRef.action" viewCode="WOM_7.5.0.0_produceTask_maketaskRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1490145723075')}"  label="${getText('ec.common.ID')}" width=100 showFormatFunc=""  />
							<#assign rejectExeStaff_name_displayDefaultType=''>
								<#assign rejectExeStaff_name_defaultValue='currentUser'>
																	<#if (rejectExeStaff_name_defaultValue!)?string=="currentUser">
								<#assign rejectExeStaff_name_defaultValue='${staffJson!}'>
							<#elseif (rejectExeStaff_name_defaultValue!)?string=="currentPost">
								<#assign rejectExeStaff_name_defaultValue='${postJson!}'>
							<#elseif (rejectExeStaff_name_defaultValue!)?string=="currentDepart">
								<#assign rejectExeStaff_name_defaultValue='${deptJson!}'>
							<#elseif (rejectExeStaff_name_defaultValue!)?string=="currentComp">
								<#assign rejectExeStaff_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="rejectExeStaff.name"        showFormat="SELECTCOMP" defaultValue="${(rejectExeStaff_name_defaultValue!)?string}" defaultDisplay="${(rejectExeStaff_name_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit"  textalign="left" hiddenCol=true viewUrl="/foundation/staff/common/staffListFrameset.action" viewCode="sysbase_1.0_staff_ref" mneenable=false crossCompany=false viewTitle="${getText('foundation.ec.entity.view.reference')}"  label="${getText('foundation.staff.dimissionStaff_xls.staffName')}" width=100 showFormatFunc=""  />
							<#assign rejectTime_displayDefaultType=''>
								<#assign rejectTime_defaultValue='currentTime'>
										 								<#if (rejectTime_defaultValue)?? &&(rejectTime_defaultValue)?has_content>
									<#assign rejectTime_defaultValue  = getDefaultDateTime(rejectTime_defaultValue!)?datetime>
								</#if>
 
									<@datacolumn key="rejectTime"        showFormat="YMD_HMS" defaultValue="${(rejectTime_defaultValue!)?string}" defaultDisplay="${(rejectTime_displayDefaultType!)?string}" decimal="" editable=true type="datetime" showType="datetime" notnull=false     textalign="center" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1543392762311')}" width=100 showFormatFunc=""  />
			
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
				function BatchingRejectParts_dg1543470616564_check_datagridvalid(){
					//
					var errorObj =BatchingRejectParts_dg1543470616564Widget._DT.testData();
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
				
				function savedg1543470616564DataGrid(){
					<#if  refId?? && (refId gt 0)>
					BatchingRejectParts_dg1543470616564Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('BatchingRejectParts_dg1543470616564Widget') > -1) {
						BatchingRejectParts_dg1543470616564Widget.setAllRowEdited();
					}
					var json = BatchingRejectParts_dg1543470616564Widget.parseEditedData();
					$('input[name="dg1543470616564ListJson"]').remove();
					$('input[name="dgLists[\'dg1543470616564\']"]').remove();
					$('input[name="dg1543470616564ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1543470616564\']">').val(json).appendTo($('#WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_form'));
					$('<input type="hidden" name="dg1543470616564ModelCode">').val('WOM_7.5.0.0_batchingMaterial_BatchingRejectParts').appendTo($('#WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1543470616564ListJson">').val(json).appendTo($('#WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_form'));
				}
				function DT_BatchingRejectParts_dg1543470616564_deldatagrid(){
					var deleteRows = BatchingRejectParts_dg1543470616564Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','store.id','rejectExeStaff.id','rejectReceiveStaff.id','rejectReasonId.id','batchingPartId.id','batchingId.id','rejectProduct.id','ware.id','produceTaskId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1543470616564DeletedIds").length>0){
							$("#dg1543470616564DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1543470616564DeletedIds" name="dgDeletedIds[\'dg1543470616564\']" value="'+tepID+'">').appendTo(CUI('#WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1543470616564DeletedIds['+CUI('input[name^="dg1543470616564DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_form'));
					});
					return deleteRows;
				}
				function DT_BatchingRejectParts_dg1543470616564_delTreeNodes(){
					var deleteRows = BatchingRejectParts_dg1543470616564Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','store.id','rejectExeStaff.id','rejectReceiveStaff.id','rejectReasonId.id','batchingPartId.id','batchingId.id','rejectProduct.id','ware.id','produceTaskId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1543470616564DeletedIds").length>0){
							$("#dg1543470616564DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1543470616564DeletedIds" name="dgDeletedIds[\'dg1543470616564\']" value="'+tepID+'">').appendTo(CUI('#WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1543470616564DeletedIds['+CUI('input[name^="dg1543470616564DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_datagrids');
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
							if(datagrids[0][i] == 'BatchingRejectParts_dg1543470616564') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'BatchingRejectParts_dg1543470616564';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'BatchingRejectParts_dg1543470616564';
					}
					$('body').data('WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_datagrids', datagrids);
				});
				
				var BatchingRejectParts_dg1543470616564_importDialog = null;
				function BatchingRejectParts_dg1543470616564_showImportDialog(){
					try{
						if(BatchingRejectParts_dg1543470616564_importDialog!=null&&BatchingRejectParts_dg1543470616564_importDialog.isShow==1){
							return false;
						}
						var url = "/WOM/batchingMaterial/batchingMaterialPart/initImport.action?datagridCode=WOM_7.5.0.0_batchingMaterial_rejectRecordEditdg1543470616564&tid=${id!}&datagridName=dg1543470616564";
							<#if canImportExcel>
								var buttonCode="WOM_7.5.0.0_batchingMaterial_rejectRecordEditdg1543470616564_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						BatchingRejectParts_dg1543470616564_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("BatchingRejectParts_dg1543470616564"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();BatchingRejectParts_dg1543470616564_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();BatchingRejectParts_dg1543470616564_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						BatchingRejectParts_dg1543470616564_importDialog.show();
					}catch(e){}
				}	
				
				function BatchingRejectParts_dg1543470616564_downLoadFile(){
					var url = "/WOM/batchingMaterial/batchingMaterialPart/downLoad.action?datagridCode=WOM_7.5.0.0_batchingMaterial_rejectRecordEditdg1543470616564&templateRelatedModelCode=WOM_7.5.0.0_batchingMaterial_rejectRecordEditdg1543470616564&downloadType=template&fileName=dg1543470616564";
					window.open(url,"","");
				}
				function dg1543470616564RenderOverEvent(){
					var selectRowLength = parent.ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow().length;
for(var i = 0; i < selectRowLength; i++){
	//制造指令单id
	var taskID = parent.ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[i].taskID.id;
	//生产批号
	var productBatchNum = parent.ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[i].taskID.productBatchNum;
	//制造指令单tableNo
	var taskTableNo = parent.ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[i].taskID.tableNo;
	//产线
	var factoryId = parent.ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[i].taskID.factoryId.id;
	var factoryName = parent.ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[i].taskID.factoryId.name;
	//产品
	var productId = parent.ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[i].taskID.productId.id;
	var productName = parent.ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[i].taskID.productId.productName;
	//物料
	var rejecProductId = parent.ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[i].productId.id;
	var rejecProductCode = parent.ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[i].productId.productCode;
	var rejecProductName = parent.ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[i].productId.productName;
	//配料指令单id
	var batchMaterialId = parent.ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[i].headId.id;
	//仓库
	var wareID = parent.ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[i].wareID.id;
	var wareCode = parent.ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[i].wareID.wareCode;
	var wareNme = parent.ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[i].wareID.wareName;
	//货位
	var storeID = parent.ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[i].storeID.id;
	var placeSetCode = parent.ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[i].storeID.placeSetCode;
	var placeSetName = parent.ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[i].storeID.placeSetName;
	//配料记录id
	var batchPartId = parent.ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[i].id;
	//物料批号
	var batchNum = parent.ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[i].batchNum;
	//配料记录状态
	var state = parent.ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[i].state.value;
	var stateId = parent.ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[i].state.id;
	//配料数量
	var doneNum = parent.ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[i].doneNum;
	//已投数量
	var putinNum = parent.ec_WOM_batchingMaterial_batchingMaterialPart_batMaterialPartList_queryWidget.getSelectedRow()[i].putinNum;
	//退料数量
	var rejectNum = doneNum;
	if(putinNum != null && putinNum != undefined && putinNum != ''){
		rejectNum = doneNum - putinNum;
	}	
	
	BatchingRejectParts_dg1543470616564Widget.addRow();
	//生产批号
	BatchingRejectParts_dg1543470616564Widget.setCellValue(i,'batchNum',productBatchNum);
	//生产批号
	BatchingRejectParts_dg1543470616564Widget.setCellValue(i,'produceTaskId.tableNo',taskTableNo);
	//生产线
	BatchingRejectParts_dg1543470616564Widget.setCellValue(i,'produceTaskId.factoryId.name',factoryName);
	//产品
	BatchingRejectParts_dg1543470616564Widget.setCellValue(i,'produceTaskId.productId.productName',productName);
	//物料编码
	BatchingRejectParts_dg1543470616564Widget.setCellValue(i,'rejectProduct.productCode',rejecProductCode);
	//物料名称
	BatchingRejectParts_dg1543470616564Widget.setCellValue(i,'rejectProduct.productName',rejecProductName);
	//物料id
	BatchingRejectParts_dg1543470616564Widget.setCellValue(i,'rejectProduct.id',rejecProductId);
	if(batchNum != null && batchNum != undefined && batchNum != '' ){
		//物料批号
		BatchingRejectParts_dg1543470616564Widget.setCellValue(i,'productBatchNum',batchNum);
	}
	if(wareID != null && wareID != undefined && wareID != '' ){
		//仓库编码
		BatchingRejectParts_dg1543470616564Widget.setCellValue(i,'ware.wareCode',wareCode);
		//仓库名称
		BatchingRejectParts_dg1543470616564Widget.setCellValue(i,'ware.wareName',wareNme);
		//仓库id
		BatchingRejectParts_dg1543470616564Widget.setCellValue(i,'ware.id',wareID);
	}
	if(storeID != null && storeID != undefined && storeID != '' ){
		//货位编码
		BatchingRejectParts_dg1543470616564Widget.setCellValue(i,'store.placeSetCode',placeSetCode);
		//货位名称
		BatchingRejectParts_dg1543470616564Widget.setCellValue(i,'store.placeSetName',placeSetName);
		//货位id
		BatchingRejectParts_dg1543470616564Widget.setCellValue(i,'store.id',storeID);
	}
	//退料数量
	BatchingRejectParts_dg1543470616564Widget.setCellValue(i,'rejectNum',rejectNum);
	//状态
	BatchingRejectParts_dg1543470616564Widget.setCellValue(i,'batchingPartId.state.id',stateId);
	//配料指令单id
	BatchingRejectParts_dg1543470616564Widget.setCellValue(i,'batchingId.id',batchMaterialId);
	//配料记录id
	BatchingRejectParts_dg1543470616564Widget.setCellValue(i,'batchingPartId.id',batchPartId);
	//制造指令单id
	BatchingRejectParts_dg1543470616564Widget.setCellValue(i,'produceTaskId.id',taskID);
}
				}
				function dg1543470616564PageInitMethod(nTabIndex){
					WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.initSize(nTabIndex);
					$('#WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_form').attr('action','/WOM/batchingMaterial/batchingMaterialPart/rejectRecordEdit/submitCustom.action?1=1'+powderCode)
				}
			</script>
			
			
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_batchingMaterial_rejectRecordEdit,html,WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.beforeSaveProcess = function(){}
	WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.beforeSubmitMethod = function() {
		try{eval("savedg1543470616564DataGrid()");}catch(e){}
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_form').trigger('beforeSubmit');
		//batchingMaterialPart.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="batchingMaterialPart.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.validate = function(){
		return true;
	}
	
	
	//打印
	WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.print = function(url){
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
		
		WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.saveSetting = function(){
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
		WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.printSetting = function(){
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
			WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.settingDialog.show();
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
			WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._customCallBack = customCallBack;
		}
		WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_fileupload').length == 0) {
				$('body').append('<div id="WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_fileupload"></div>');
			}
			WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.infoDialog.show();
			if($('#WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_fileupload').html() == '') {
				$('#WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=WOM_batchingMaterial_batchingMaterialPart&entityCode=WOM_7.5.0.0_batchingMaterial&dialogId="+dialogId);
			}
		}
	//参照复制函数
	WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.referenceCopy = function(objName,url, dialog){
		var callbackName ="WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.referenceCopyBackInfo";
		WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.dialog = dialog;
		WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._dialog = foundation.common.select({
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
	
	WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.referenceCopyBackInfo = function(obj){
		if(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._dialog){
			WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_form','WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.dialog._el).load('/WOM/batchingMaterial/batchingMaterialPart/rejectRecordEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.dialog._config.iframe, WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.dialog._dialog ).prop( 'src', '/WOM/batchingMaterial/batchingMaterialPart/rejectRecordEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.dialog._el).load('/WOM/batchingMaterial/batchingMaterialPart/rejectRecordEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit' + '_' + extraFrameParam;
		var callbackName="";
		WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._prefix = '';
		WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._oGrid = oGrid;
		WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._sUrl = url;
		if(customCallBack){
			WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.gridEventObj = gridEventObj;
			callbackName = "WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.getMultiselectCallBackInfo_DG" : "WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.getcallBackInfo_DG";
			WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.getcallBackInfo";
		}
		if(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._prefix!=''){
			WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._prefix = WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._prefix.substring(1);
		}
		if(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._querycustomFuncN == "function") {
				refparam += WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.query_"+obj+")!='undefined'") ? eval('WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.query_'+obj+'()') : null;
		return str;
	
	};
	
	WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_form',obj[0], WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._prefix, WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._sUrl);
		CUI.commonFills('WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_form',WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._prefix,obj[0]);

		try{
			if(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._customCallBack) {
				eval(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._customCallBack);
				WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.getcallBackInfo_DG_IE = function(obj){
		if(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._customBeforeCallBack) {
			var flag = eval(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._sUrl);
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
			if(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._customCallBack) {
				eval(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._customCallBack);
				WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.getcallBackInfo_DG = function(obj){
		if(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._customBeforeCallBack) {
			var flag = eval(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._currRow).next().length==0){
					WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._oGrid.addNewRow();
				}	
				WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._currRow = $(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._currRow).next();
				$(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._currRow,obj[i],WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._prefix,WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._sUrl);
			eval("CUI.commonFills_DG(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._currRow,WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._prefix,obj[i],WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._oGrid)");
		}
		try{
			if(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._customCallBack) {
				eval(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._customCallBack);
				WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._dialog.close();
		} catch(e){}
	};
	
	WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._oGrid, WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._currRow, WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._key, WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._displayFieldName, obj[i])
		}
		try{
			if(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._customCallBack) {
				eval(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._customCallBack);
				WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit._dialog.close();
		} catch(e){}
	};
	
	WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_form'));
        			}
        	   	}
        	}
      	});
	};
	WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.initCount = 0;
	WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#WOM_rejectRecordEdit_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_datagrids');	
		var	conHeight = h-$("#WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#WOM_batchingMaterial_batchingMaterialPart_rejectRecordEdit_main_div .edit-panes-s").each(function(index){
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
							if(WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.initCount <= 2) {
								setTimeout(function(){WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.initSize();}, 200);
								WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.initCount++;
							}/* else {
								WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.initCount = 0;
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
		WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.initSize(index);
		});
		$(window).bind("dialog.resize",function(){WOM.batchingMaterial.batchingMaterialPart.rejectRecordEdit.initSize();});
	});
</script>
<script type="text/javascript">
	



	/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_batchingMaterial_rejectRecordEdit,js,WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart,WOM_7.5.0.0) */
// 自定义代码
	var powderCode = "&${getPowerCode('batMaterialPartList_reject_modify_WOM_7.5.0.0_batchingMaterial_batMaterialPartList')}";
/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>