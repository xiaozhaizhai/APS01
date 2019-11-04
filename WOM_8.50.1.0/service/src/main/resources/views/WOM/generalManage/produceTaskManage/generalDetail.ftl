<!-- WOM_7.5.0.0/generalManage/generalDetail -->
<#assign isWorkflow = false> 
<#assign isAttachment = true> 
	<#assign  fileuploadType = "WOM_generalManage_produceTaskManage">
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
<#assign userJson= Session.user.toJSON()>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<#-- 实体对象 -->
<#assign tableObj = produceTaskManage>
<#-- 命名空间 -->
<#assign editPageNs = "WOM.generalManage.produceTaskManage.generalDetail">
<#-- 模型名称-->
<#assign modelName = "produceTaskManage">
<#-- 视图编码-->
<#assign viewCode = "WOM_7.5.0.0_generalManage_generalDetail">
<#-- 实体编码-->
<#assign entity_code = "WOM_7.5.0.0_generalManage">
<#-- 视图名称-->
<#assign viewName = "generalDetail">
<#-- datagrid编码-->
<#assign datagridCode = "WOM_generalManage_produceTaskManage_generalDetail_datagrids">
<#-- 首字母大写的模型名称-->
<#assign upcaseModelName = "ProduceTaskManage">
<#-- 页面打印按钮 -->
<#assign isPrint = false>
<#-- 控件打印按钮 -->
<#assign controlPrint = false>
<#-- 是否只读 -->
<#assign allReadOnly = false>
<#-- 是否是参照视图 -->
<#assign isReference =false>
<#-- 是否可弃审 -->
<#assign retrialFlag = false>
<#-- formid -->
<#assign editFormId = "WOM_generalManage_produceTaskManage_generalDetail_form">
<#-- 待办状态 -->
<#assign pendingstatus =( produceTaskManage.pending.taskDescription)!>
<#-- 打印控件名称 -->
<#assign controlName = "ec.print.controlPrint">
<#-- 批量？？ -->
<#assign isBatch = false>
<#assign payCloseAttention = false>
<#-- 自定义按钮 -->
<#assign operateButtons =[] >
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
	
		
	
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <#assign configTitle = getText('WOM.viewtitle.randon1502700063556')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		
		#WOM_generalManage_produceTaskManage_generalDetail_form{float:left;width:100%;}
		
		
		</style>
		<script type="text/javascript">
			CUI.ns('WOM.generalManage.produceTaskManage.generalDetail');
			WOM.generalManage.produceTaskManage.generalDetail.currentUser = ${userJson};
			WOM.generalManage.produceTaskManage.generalDetail.currentStaff = ${staffJson};
			WOM.generalManage.produceTaskManage.generalDetail.currentDepartment = ${deptJson};
			WOM.generalManage.produceTaskManage.generalDetail.currentPosition = ${postJson};
			WOM.generalManage.produceTaskManage.generalDetail.currentCompany = ${compJson};
		</script>
		<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_generalManage_generalDetail,head,WOM_7.5.0.0_generalManage_ProduceTaskManage,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
    </head>
	<body class="view-edit ">
		<@loadpanel newType=true/>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="" onsubmitMethod="WOM.generalManage.produceTaskManage.generalDetail.beforeSubmitMethod()" id="WOM_generalManage_produceTaskManage_generalDetail_form" namespace="/WOM/generalManage/produceTaskManage/generalDetail" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=WOM_7.5.0.0_generalManage_ProduceTaskManage&_bapFieldPermissonModelName_=ProduceTaskManage" editPageNs="WOM.generalManage.produceTaskManage.generalDetail" callback="WOM.generalManage.produceTaskManage.generalDetail._callBackInfo" ecform="true">
			<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
			<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="WOM_generalManage_produceTaskManage_generalDetail_main_div">
			<div class="edit-head">
				<#include "../../../ec/tableInfo/operateheadbar_all.ftl" >
				<#include "../../../ec/tableInfo/creatorInfo.ftl" >
			</div>
    		<div class="edit-main" id="WOM_generalManage_produceTaskManage_generalDetail">
    			<div class="edit-content">
    	<#include "../../../ec/tableInfo/formparam.ftl" >				
		 <ul class="edit-tabs">
			<li>${getText('WOM.tabname.radion1502700390960')}</li>
			<li>${getText('WOM.tabname.radion1502700390961')}</li>
			<li>${getText('WOM.tabname.radion1502700738193')}</li>
		</ul>
<script type="text/javascript">
var attcountid = "WOM_generalManage_produceTaskManage_generalDetail_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=WOM_7.5.0.0_generalManage', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>				<div class="edit-panes edit-panes-w edit-container clearfix">
			<div class="clearfix pd_bottom">
				<div class="cui-elements pd-top">

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
				<#assign dUrl="/WOM/generalManage/produceTaskManage/data-dg1502700158273.action?produceTaskManage.id=${refId!-1}&refId=${refId!-1}&datagridCode=WOM_7.5.0.0_generalManage_generalDetaildg1502700158273">
			<#else>
				<#assign dUrl="/WOM/generalManage/produceTaskManage/data-dg1502700158273.action?produceTaskManage.id=${(produceTaskManage.id)!-1}&datagridCode=WOM_7.5.0.0_generalManage_generalDetaildg1502700158273">
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
					<input type="hidden" id="dg_cp_info_PutInManage_dg1502700158273" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1502700158273_id" value="PutInManage_dg1502700158273" />
			
			<input type="hidden" id="dg1502700158273_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('WOM.modelname.randon1502695666438')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/WOM/generalManage/produceTaskManage/data-dg1502700158273.action?operateType=export&datagridCode=WOM_7.5.0.0_generalManage_generalDetaildg1502700158273"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="PutInManage_dg1502700158273" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="PutInManage_dg1502700158273" viewType="${viewType}" renderOverEvent="dg1502700158273RenderOverEvent" route="${routeFlag}" formId="WOM_generalManage_produceTaskManage_generalDetail_form" noPermissionKeys="putInMetarialPart.headId.tableNo,putInUrl,putInMetarialPart.productId.productCode,putInMetarialPart.productId.productName,putInMetarialPart.batchNum,putInMetarialPart.putinStaff.name,putInMetarialPart.useNum,putInMetarialPart.lossNum,putInMetarialPart.putinDate,putInMetarialPart.remark" modelCode="WOM_7.5.0.0_generalManage_PutInManage" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1502700158273" dtPage="dgPage"  hidekeyPrefix="dg1502700158273" hidekey="['id','version','putInMetarialPart.id','putInMetarialPart.headId.tableNo','putInMetarialPart.id','putInMetarialPart.productId.productCode','putInMetarialPart.id','putInMetarialPart.productId.productName','putInMetarialPart.id','putInMetarialPart.batchNum','putInMetarialPart.id','putInMetarialPart.putinStaff.name','putInMetarialPart.id','putInMetarialPart.useNum','putInMetarialPart.id','putInMetarialPart.lossNum','putInMetarialPart.id','putInMetarialPart.putinDate','putInMetarialPart.id','putInMetarialPart.remark'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=false  buttons="${buttons}" noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1502700158273PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=false cannotDeleteRow=true assModelDisplayName=assModelDisplayName  activexButton="" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign putInMetarialPart_headId_tableNo_displayDefaultType=''>
								<#assign putInMetarialPart_headId_tableNo_defaultValue=''>
										<#assign putInMetarialPart_headId_tableNo_defaultValue=''>
																	<#if (putInMetarialPart_headId_tableNo_defaultValue!)?string=="currentUser">
								<#assign putInMetarialPart_headId_tableNo_defaultValue='${staffJson!}'>
							<#elseif (putInMetarialPart_headId_tableNo_defaultValue!)?string=="currentPost">
								<#assign putInMetarialPart_headId_tableNo_defaultValue='${postJson!}'>
							<#elseif (putInMetarialPart_headId_tableNo_defaultValue!)?string=="currentDepart">
								<#assign putInMetarialPart_headId_tableNo_defaultValue='${deptJson!}'>
							<#elseif (putInMetarialPart_headId_tableNo_defaultValue!)?string=="currentComp">
								<#assign putInMetarialPart_headId_tableNo_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="putInMetarialPart.headId.tableNo"        showFormat="TEXT" defaultValue="${(putInMetarialPart_headId_tableNo_defaultValue!)?string}" defaultDisplay="${(putInMetarialPart_headId_tableNo_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.generalManage.produceTaskManage.generalDetail"  textalign="left"  viewUrl="/WOM/putInMaterial/putInMaterialPart/putinRef.action" viewCode="WOM_7.5.0.0_putInMaterial_putinRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1494828456715')}"  label="${getText('WOM.modelname.randon1490604832447')}" width=180 showFormatFunc="putIn_showFormatFunc"  />
							<#assign putInUrl_displayDefaultType=''>
								<#assign putInUrl_defaultValue=''>
										<#assign putInUrl_defaultValue=''>
										 
									<@datacolumn key="putInUrl"        showFormat="TEXT" defaultValue="${(putInUrl_defaultValue!)?string}" defaultDisplay="${(putInUrl_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="center" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1503300915609')}" width=100 showFormatFunc=""  />
							<#assign putInMetarialPart_productId_productCode_displayDefaultType=''>
								<#assign putInMetarialPart_productId_productCode_defaultValue=''>
										<#assign putInMetarialPart_productId_productCode_defaultValue=''>
																	<#if (putInMetarialPart_productId_productCode_defaultValue!)?string=="currentUser">
								<#assign putInMetarialPart_productId_productCode_defaultValue='${staffJson!}'>
							<#elseif (putInMetarialPart_productId_productCode_defaultValue!)?string=="currentPost">
								<#assign putInMetarialPart_productId_productCode_defaultValue='${postJson!}'>
							<#elseif (putInMetarialPart_productId_productCode_defaultValue!)?string=="currentDepart">
								<#assign putInMetarialPart_productId_productCode_defaultValue='${deptJson!}'>
							<#elseif (putInMetarialPart_productId_productCode_defaultValue!)?string=="currentComp">
								<#assign putInMetarialPart_productId_productCode_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="putInMetarialPart.productId.productCode"        showFormat="TEXT" defaultValue="${(putInMetarialPart_productId_productCode_defaultValue!)?string}" defaultDisplay="${(putInMetarialPart_productId_productCode_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.generalManage.produceTaskManage.generalDetail"  textalign="left"  viewUrl="/WOM/putInMaterial/putInMaterialPart/putinRef.action" viewCode="WOM_7.5.0.0_putInMaterial_putinRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1494828456715')}"  label="${getText('WOM.propertydisplayName.radion14157726448331')}" width=100 showFormatFunc=""  />
							<#assign putInMetarialPart_productId_productName_displayDefaultType=''>
								<#assign putInMetarialPart_productId_productName_defaultValue=''>
										<#assign putInMetarialPart_productId_productName_defaultValue=''>
																	<#if (putInMetarialPart_productId_productName_defaultValue!)?string=="currentUser">
								<#assign putInMetarialPart_productId_productName_defaultValue='${staffJson!}'>
							<#elseif (putInMetarialPart_productId_productName_defaultValue!)?string=="currentPost">
								<#assign putInMetarialPart_productId_productName_defaultValue='${postJson!}'>
							<#elseif (putInMetarialPart_productId_productName_defaultValue!)?string=="currentDepart">
								<#assign putInMetarialPart_productId_productName_defaultValue='${deptJson!}'>
							<#elseif (putInMetarialPart_productId_productName_defaultValue!)?string=="currentComp">
								<#assign putInMetarialPart_productId_productName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="putInMetarialPart.productId.productName"        showFormat="TEXT" defaultValue="${(putInMetarialPart_productId_productName_defaultValue!)?string}" defaultDisplay="${(putInMetarialPart_productId_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.generalManage.produceTaskManage.generalDetail"  textalign="left"  viewUrl="/WOM/putInMaterial/putInMaterialPart/putinRef.action" viewCode="WOM_7.5.0.0_putInMaterial_putinRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1494828456715')}"  label="${getText('WOM.propertydisplayName.radion1415772740737334')}" width=100 showFormatFunc=""  />
							<#assign putInMetarialPart_batchNum_displayDefaultType=''>
								<#assign putInMetarialPart_batchNum_defaultValue=''>
										<#assign putInMetarialPart_batchNum_defaultValue=''>
																	<#if (putInMetarialPart_batchNum_defaultValue!)?string=="currentUser">
								<#assign putInMetarialPart_batchNum_defaultValue='${staffJson!}'>
							<#elseif (putInMetarialPart_batchNum_defaultValue!)?string=="currentPost">
								<#assign putInMetarialPart_batchNum_defaultValue='${postJson!}'>
							<#elseif (putInMetarialPart_batchNum_defaultValue!)?string=="currentDepart">
								<#assign putInMetarialPart_batchNum_defaultValue='${deptJson!}'>
							<#elseif (putInMetarialPart_batchNum_defaultValue!)?string=="currentComp">
								<#assign putInMetarialPart_batchNum_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="putInMetarialPart.batchNum"        showFormat="SELECTCOMP" defaultValue="${(putInMetarialPart_batchNum_defaultValue!)?string}" defaultDisplay="${(putInMetarialPart_batchNum_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.generalManage.produceTaskManage.generalDetail"  textalign="left"  viewUrl="/WOM/putInMaterial/putInMaterialPart/putinRef.action" viewCode="WOM_7.5.0.0_putInMaterial_putinRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1494828456715')}"  label="${getText('WOM.propertydisplayName.randon1490605271044')}" width=120 showFormatFunc=""  />
							<#assign putInMetarialPart_putinStaff_name_displayDefaultType=''>
								<#assign putInMetarialPart_putinStaff_name_defaultValue=''>
										<#assign putInMetarialPart_putinStaff_name_defaultValue=''>
																	<#if (putInMetarialPart_putinStaff_name_defaultValue!)?string=="currentUser">
								<#assign putInMetarialPart_putinStaff_name_defaultValue='${staffJson!}'>
							<#elseif (putInMetarialPart_putinStaff_name_defaultValue!)?string=="currentPost">
								<#assign putInMetarialPart_putinStaff_name_defaultValue='${postJson!}'>
							<#elseif (putInMetarialPart_putinStaff_name_defaultValue!)?string=="currentDepart">
								<#assign putInMetarialPart_putinStaff_name_defaultValue='${deptJson!}'>
							<#elseif (putInMetarialPart_putinStaff_name_defaultValue!)?string=="currentComp">
								<#assign putInMetarialPart_putinStaff_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="putInMetarialPart.putinStaff.name"        showFormat="TEXT" defaultValue="${(putInMetarialPart_putinStaff_name_defaultValue!)?string}" defaultDisplay="${(putInMetarialPart_putinStaff_name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.generalManage.produceTaskManage.generalDetail"  textalign="left"  viewUrl="/WOM/putInMaterial/putInMaterialPart/putinRef.action" viewCode="WOM_7.5.0.0_putInMaterial_putinRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1494828456715')}"  label="${getText('WOM.propertydisplayName.randon1492078276959')}" width=80 showFormatFunc=""  />
							<#assign putInMetarialPart_useNum_displayDefaultType=''>
								<#assign putInMetarialPart_useNum_defaultValue=''>
										<#assign putInMetarialPart_useNum_defaultValue=''>
																	<#if (putInMetarialPart_useNum_defaultValue!)?string=="currentUser">
								<#assign putInMetarialPart_useNum_defaultValue='${staffJson!}'>
							<#elseif (putInMetarialPart_useNum_defaultValue!)?string=="currentPost">
								<#assign putInMetarialPart_useNum_defaultValue='${postJson!}'>
							<#elseif (putInMetarialPart_useNum_defaultValue!)?string=="currentDepart">
								<#assign putInMetarialPart_useNum_defaultValue='${deptJson!}'>
							<#elseif (putInMetarialPart_useNum_defaultValue!)?string=="currentComp">
								<#assign putInMetarialPart_useNum_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="putInMetarialPart.useNum"        showFormat="TEXT" defaultValue="${(putInMetarialPart_useNum_defaultValue!)?string}" defaultDisplay="${(putInMetarialPart_useNum_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false   selectCompName="WOM.generalManage.produceTaskManage.generalDetail"  textalign="right"  viewUrl="/WOM/putInMaterial/putInMaterialPart/putinRef.action" viewCode="WOM_7.5.0.0_putInMaterial_putinRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1494828456715')}"  label="${getText('WOM.propertydisplayName.randon1490605292518')}" width=80 showFormatFunc=""  />
							<#assign putInMetarialPart_lossNum_displayDefaultType=''>
								<#assign putInMetarialPart_lossNum_defaultValue=''>
										<#assign putInMetarialPart_lossNum_defaultValue=''>
																	<#if (putInMetarialPart_lossNum_defaultValue!)?string=="currentUser">
								<#assign putInMetarialPart_lossNum_defaultValue='${staffJson!}'>
							<#elseif (putInMetarialPart_lossNum_defaultValue!)?string=="currentPost">
								<#assign putInMetarialPart_lossNum_defaultValue='${postJson!}'>
							<#elseif (putInMetarialPart_lossNum_defaultValue!)?string=="currentDepart">
								<#assign putInMetarialPart_lossNum_defaultValue='${deptJson!}'>
							<#elseif (putInMetarialPart_lossNum_defaultValue!)?string=="currentComp">
								<#assign putInMetarialPart_lossNum_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="putInMetarialPart.lossNum"        showFormat="TEXT" defaultValue="${(putInMetarialPart_lossNum_defaultValue!)?string}" defaultDisplay="${(putInMetarialPart_lossNum_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false   selectCompName="WOM.generalManage.produceTaskManage.generalDetail"  textalign="right"  viewUrl="/WOM/putInMaterial/putInMaterialPart/putinRef.action" viewCode="WOM_7.5.0.0_putInMaterial_putinRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1494828456715')}"  label="${getText('WOM.propertydisplayName.randon1490605314992')}" width=80 showFormatFunc=""  />
							<#assign putInMetarialPart_putinDate_displayDefaultType=''>
								<#assign putInMetarialPart_putinDate_defaultValue=''>
										<#assign putInMetarialPart_putinDate_defaultValue=''>
																		<#if (putInMetarialPart_putinDate_defaultValue)?? &&(putInMetarialPart_putinDate_defaultValue)?has_content>
									<#assign putInMetarialPart_putinDate_defaultValue  = getDefaultDateTime(putInMetarialPart_putinDate_defaultValue!)?datetime>
								</#if>
							<#if (putInMetarialPart_putinDate_defaultValue!)?string=="currentUser">
								<#assign putInMetarialPart_putinDate_defaultValue='${staffJson!}'>
							<#elseif (putInMetarialPart_putinDate_defaultValue!)?string=="currentPost">
								<#assign putInMetarialPart_putinDate_defaultValue='${postJson!}'>
							<#elseif (putInMetarialPart_putinDate_defaultValue!)?string=="currentDepart">
								<#assign putInMetarialPart_putinDate_defaultValue='${deptJson!}'>
							<#elseif (putInMetarialPart_putinDate_defaultValue!)?string=="currentComp">
								<#assign putInMetarialPart_putinDate_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="putInMetarialPart.putinDate"        showFormat="YMD_HMS" defaultValue="${(putInMetarialPart_putinDate_defaultValue!)?string}" defaultDisplay="${(putInMetarialPart_putinDate_displayDefaultType!)?string}" decimal="" editable=false type="datetime" showType="datetime" notnull=false   selectCompName="WOM.generalManage.produceTaskManage.generalDetail"  textalign="center"  viewUrl="/WOM/putInMaterial/putInMaterialPart/putinRef.action" viewCode="WOM_7.5.0.0_putInMaterial_putinRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1494828456715')}"  label="${getText('WOM.propertydisplayName.randon1492078322274')}" width=150 showFormatFunc=""  />
							<#assign putInMetarialPart_remark_displayDefaultType=''>
								<#assign putInMetarialPart_remark_defaultValue=''>
										<#assign putInMetarialPart_remark_defaultValue=''>
																	<#if (putInMetarialPart_remark_defaultValue!)?string=="currentUser">
								<#assign putInMetarialPart_remark_defaultValue='${staffJson!}'>
							<#elseif (putInMetarialPart_remark_defaultValue!)?string=="currentPost">
								<#assign putInMetarialPart_remark_defaultValue='${postJson!}'>
							<#elseif (putInMetarialPart_remark_defaultValue!)?string=="currentDepart">
								<#assign putInMetarialPart_remark_defaultValue='${deptJson!}'>
							<#elseif (putInMetarialPart_remark_defaultValue!)?string=="currentComp">
								<#assign putInMetarialPart_remark_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="putInMetarialPart.remark"        showFormat="TEXT" defaultValue="${(putInMetarialPart_remark_defaultValue!)?string}" defaultDisplay="${(putInMetarialPart_remark_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.generalManage.produceTaskManage.generalDetail"  textalign="left"  viewUrl="/WOM/putInMaterial/putInMaterialPart/putinRef.action" viewCode="WOM_7.5.0.0_putInMaterial_putinRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1494828456715')}"  label="${getText('WOM.propertydisplayName.randon1490605337153')}" width=200 showFormatFunc=""  />
			
			</@datagrid>
				<script type="text/javascript">
					function putIn_showFormatFunc( value,  nRow ){
  return "<a onclick='outInClick($(this).parents(\"tr\").eq(0).index())'><span onmouseover=\"this.style.color='#f00'\" onmouseout=\"this.style.color='#3366CC'\" style='text-decoration:underline;color:#3366CC;cursor:pointer'>"+value+"</span></a>";
};
function outInClick(nRow){
	var url = PutInManage_dg1502700158273Widget.getCellValue(nRow,"putInUrl");
	openFullScreen(url);
};
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
				function PutInManage_dg1502700158273_check_datagridvalid(){
					//
					var errorObj =PutInManage_dg1502700158273Widget._DT.testData();
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
				
				function savedg1502700158273DataGrid(){
					<#if  refId?? && (refId gt 0)>
					PutInManage_dg1502700158273Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('PutInManage_dg1502700158273Widget') > -1) {
						PutInManage_dg1502700158273Widget.setAllRowEdited();
					}
					var json = PutInManage_dg1502700158273Widget.parseEditedData();
					$('input[name="dg1502700158273ListJson"]').remove();
					$('input[name="dgLists[\'dg1502700158273\']"]').remove();
					$('input[name="dg1502700158273ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1502700158273\']">').val(json).appendTo($('#WOM_generalManage_produceTaskManage_generalDetail_form'));
					$('<input type="hidden" name="dg1502700158273ModelCode">').val('WOM_7.5.0.0_generalManage_PutInManage').appendTo($('#WOM_generalManage_produceTaskManage_generalDetail_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1502700158273ListJson">').val(json).appendTo($('#WOM_generalManage_produceTaskManage_generalDetail_form'));
				}
				function DT_PutInManage_dg1502700158273_deldatagrid(){
					var deleteRows = PutInManage_dg1502700158273Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','produceTask.id','putInMetarialPart.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1502700158273DeletedIds").length>0){
							$("#dg1502700158273DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1502700158273DeletedIds" name="dgDeletedIds[\'dg1502700158273\']" value="'+tepID+'">').appendTo(CUI('#WOM_generalManage_produceTaskManage_generalDetail_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1502700158273DeletedIds['+CUI('input[name^="dg1502700158273DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_generalManage_produceTaskManage_generalDetail_form'));
					});
					return deleteRows;
				}
				function DT_PutInManage_dg1502700158273_delTreeNodes(){
					var deleteRows = PutInManage_dg1502700158273Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','produceTask.id','putInMetarialPart.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1502700158273DeletedIds").length>0){
							$("#dg1502700158273DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1502700158273DeletedIds" name="dgDeletedIds[\'dg1502700158273\']" value="'+tepID+'">').appendTo(CUI('#WOM_generalManage_produceTaskManage_generalDetail_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1502700158273DeletedIds['+CUI('input[name^="dg1502700158273DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_generalManage_produceTaskManage_generalDetail_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('WOM_generalManage_produceTaskManage_generalDetail_datagrids');
					if(!datagrids) {
						datagrids = [];
					}
					for(var i=0;i<3;i++) {
						if(!datagrids[i]) {
							datagrids[i] = [];
						}
					}
					if(datagrids[0].length>0) {
						for(var i=0;i<datagrids[0].length;i++) {
							if(datagrids[0][i] == 'PutInManage_dg1502700158273') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'PutInManage_dg1502700158273';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'PutInManage_dg1502700158273';
					}
					$('body').data('WOM_generalManage_produceTaskManage_generalDetail_datagrids', datagrids);
				});
				
				var PutInManage_dg1502700158273_importDialog = null;
				function PutInManage_dg1502700158273_showImportDialog(){
					try{
						if(PutInManage_dg1502700158273_importDialog!=null&&PutInManage_dg1502700158273_importDialog.isShow==1){
							return false;
						}
						var url = "/WOM/generalManage/produceTaskManage/initImport.action?datagridCode=WOM_7.5.0.0_generalManage_generalDetaildg1502700158273&tid=${id!}&datagridName=dg1502700158273";
							<#if canImportExcel>
								var buttonCode="WOM_7.5.0.0_generalManage_generalDetaildg1502700158273_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						PutInManage_dg1502700158273_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("PutInManage_dg1502700158273"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();PutInManage_dg1502700158273_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();PutInManage_dg1502700158273_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						PutInManage_dg1502700158273_importDialog.show();
					}catch(e){}
				}	
				
				function PutInManage_dg1502700158273_downLoadFile(){
					var url = "/WOM/generalManage/produceTaskManage/downLoad.action?datagridCode=WOM_7.5.0.0_generalManage_generalDetaildg1502700158273&templateRelatedModelCode=WOM_7.5.0.0_generalManage_generalDetaildg1502700158273&downloadType=template&fileName=dg1502700158273";
					window.open(url,"","");
				}
				function dg1502700158273RenderOverEvent(){
				}
				function dg1502700158273PageInitMethod(nTabIndex){
					WOM.generalManage.produceTaskManage.generalDetail.initSize(nTabIndex);
					var mainHeight = $("#ec_WOM_produceTask_produceTask_generalManageView_container_main").height();   //总大小
var queryHeight = $("#ec_WOM_produceTask_produceTask_generalManageView_queryForm_allContainer").height();   //快速查询栏
var barHeight = $(".paginatorbar").height();   //表格栏
var tabsHeight = $(".edit-tabs").height();
var gridHeight = (mainHeight-queryHeight-barHeight*3)/2 -2*barHeight ;  //两个表格，平分大小
PutInManage_dg1502700158273Widget.setHeight(gridHeight);
				}
			</script>
			
			
			</div>
		</div>
			<div class="clearfix pd_bottom">
				<div class="cui-elements pd-top">

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
			
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/WOM/generalManage/produceTaskManage/data-dg1502700453811.action?produceTaskManage.id=${refId!-1}&refId=${refId!-1}&datagridCode=WOM_7.5.0.0_generalManage_generalDetaildg1502700453811">
			<#else>
				<#assign dUrl="/WOM/generalManage/produceTaskManage/data-dg1502700453811.action?produceTaskManage.id=${(produceTaskManage.id)!-1}&datagridCode=WOM_7.5.0.0_generalManage_generalDetaildg1502700453811">
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
					<input type="hidden" id="dg_cp_info_CheckManage_dg1502700453811" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1502700453811_id" value="CheckManage_dg1502700453811" />
			
			<input type="hidden" id="dg1502700453811_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('WOM.modelname.randon1502696273660')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/WOM/generalManage/produceTaskManage/data-dg1502700453811.action?operateType=export&datagridCode=WOM_7.5.0.0_generalManage_generalDetaildg1502700453811"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="CheckManage_dg1502700453811" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="CheckManage_dg1502700453811" viewType="${viewType}" renderOverEvent="dg1502700453811RenderOverEvent" route="${routeFlag}" formId="WOM_generalManage_produceTaskManage_generalDetail_form" noPermissionKeys="inspectName,inspectUrl,chenkReportName,chenkReportUrl,product.productCode,product.productName,batchNum,standard,result,inspectDept.name,checkDept.name,inspectTime,checkTime" modelCode="WOM_7.5.0.0_generalManage_CheckManage" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1502700453811" dtPage="dgPage"  hidekeyPrefix="dg1502700453811" hidekey="['id','version','product.id','product.productCode','product.id','product.productName','inspectDept.id','inspectDept.name','checkDept.id','checkDept.name'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=false  buttons="${buttons}" noPadding=true isEdit=true tabViewIndex=1 pageInitMethod="dg1502700453811PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=false cannotDeleteRow=true assModelDisplayName=assModelDisplayName  activexButton="" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign inspectName_displayDefaultType=''>
								<#assign inspectName_defaultValue=''>
										<#assign inspectName_defaultValue=''>
										 
									<@datacolumn key="inspectName"        showFormat="TEXT" defaultValue="${(inspectName_defaultValue!)?string}" defaultDisplay="${(inspectName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1503283861511')}" width=180 showFormatFunc="inspect_showFormatFunc"  />
							<#assign inspectUrl_displayDefaultType=''>
								<#assign inspectUrl_defaultValue=''>
										<#assign inspectUrl_defaultValue=''>
										 
									<@datacolumn key="inspectUrl"        showFormat="TEXT" defaultValue="${(inspectUrl_defaultValue!)?string}" defaultDisplay="${(inspectUrl_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="center" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1503283910367')}" width=100 showFormatFunc=""  />
							<#assign chenkReportName_displayDefaultType=''>
								<#assign chenkReportName_defaultValue=''>
										<#assign chenkReportName_defaultValue=''>
										 
									<@datacolumn key="chenkReportName"        showFormat="TEXT" defaultValue="${(chenkReportName_defaultValue!)?string}" defaultDisplay="${(chenkReportName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1503283960055')}" width=180 showFormatFunc="check_showFormatFunc"  />
							<#assign chenkReportUrl_displayDefaultType=''>
								<#assign chenkReportUrl_defaultValue=''>
										<#assign chenkReportUrl_defaultValue=''>
										 
									<@datacolumn key="chenkReportUrl"        showFormat="TEXT" defaultValue="${(chenkReportUrl_defaultValue!)?string}" defaultDisplay="${(chenkReportUrl_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="center" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1503283992347')}" width=100 showFormatFunc=""  />
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

									<@datacolumn key="product.productCode"        showFormat="SELECTCOMP" defaultValue="${(product_productCode_defaultValue!)?string}" defaultDisplay="${(product_productCode_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.generalManage.produceTaskManage.generalDetail"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" width=100 showFormatFunc=""  />
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

									<@datacolumn key="product.productName"        showFormat="TEXT" defaultValue="${(product_productName_defaultValue!)?string}" defaultDisplay="${(product_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.generalManage.produceTaskManage.generalDetail"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" width=100 showFormatFunc=""  />
							<#assign batchNum_displayDefaultType=''>
								<#assign batchNum_defaultValue=''>
										<#assign batchNum_defaultValue=''>
										 
									<@datacolumn key="batchNum"        showFormat="TEXT" defaultValue="${(batchNum_defaultValue!)?string}" defaultDisplay="${(batchNum_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1502699133169')}" width=100 showFormatFunc=""  />
							<#assign standard_displayDefaultType=''>
								<#assign standard_defaultValue=''>
										<#assign standard_defaultValue=''>
										 
									<@datacolumn key="standard"        showFormat="TEXT" defaultValue="${(standard_defaultValue!)?string}" defaultDisplay="${(standard_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1502699151254')}" width=100 showFormatFunc=""  />
							<#assign result_displayDefaultType=''>
								<#assign result_defaultValue=''>
										<#assign result_defaultValue=''>
										 
									<@datacolumn key="result"        showFormat="TEXT" defaultValue="${(result_defaultValue!)?string}" defaultDisplay="${(result_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1502699179590')}" width=100 showFormatFunc=""  />
							<#assign inspectDept_name_displayDefaultType=''>
								<#assign inspectDept_name_defaultValue=''>
										<#assign inspectDept_name_defaultValue=''>
																	<#if (inspectDept_name_defaultValue!)?string=="currentUser">
								<#assign inspectDept_name_defaultValue='${staffJson!}'>
							<#elseif (inspectDept_name_defaultValue!)?string=="currentPost">
								<#assign inspectDept_name_defaultValue='${postJson!}'>
							<#elseif (inspectDept_name_defaultValue!)?string=="currentDepart">
								<#assign inspectDept_name_defaultValue='${deptJson!}'>
							<#elseif (inspectDept_name_defaultValue!)?string=="currentComp">
								<#assign inspectDept_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="inspectDept.name"        showFormat="SELECTCOMP" defaultValue="${(inspectDept_name_defaultValue!)?string}" defaultDisplay="${(inspectDept_name_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.generalManage.produceTaskManage.generalDetail"  textalign="left"  viewUrl="/foundation/department/common/departmentListFrameCustom.action?operateCode=attendence_1.0_gatherDeal_list_self" viewCode="sysbase_1.0_department_departmentRefCustom" mneenable=false crossCompany=false viewTitle="${getText('foundation.ec.entity.department.reference')}"  label="${getText('WOM.propertydisplayName.randon1502699386806')}" width=80 showFormatFunc=""  />
							<#assign checkDept_name_displayDefaultType=''>
								<#assign checkDept_name_defaultValue=''>
										<#assign checkDept_name_defaultValue=''>
																	<#if (checkDept_name_defaultValue!)?string=="currentUser">
								<#assign checkDept_name_defaultValue='${staffJson!}'>
							<#elseif (checkDept_name_defaultValue!)?string=="currentPost">
								<#assign checkDept_name_defaultValue='${postJson!}'>
							<#elseif (checkDept_name_defaultValue!)?string=="currentDepart">
								<#assign checkDept_name_defaultValue='${deptJson!}'>
							<#elseif (checkDept_name_defaultValue!)?string=="currentComp">
								<#assign checkDept_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="checkDept.name"        showFormat="SELECTCOMP" defaultValue="${(checkDept_name_defaultValue!)?string}" defaultDisplay="${(checkDept_name_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.generalManage.produceTaskManage.generalDetail"  textalign="left"  viewUrl="/foundation/department/common/departmentListFrameCustom.action?operateCode=attendence_1.0_gatherDeal_list_self" viewCode="sysbase_1.0_department_departmentRefCustom" mneenable=false crossCompany=false viewTitle="${getText('foundation.ec.entity.department.reference')}"  label="${getText('WOM.propertydisplayName.randon1502699445827')}" width=80 showFormatFunc=""  />
							<#assign inspectTime_displayDefaultType=''>
								<#assign inspectTime_defaultValue=''>
										<#assign inspectTime_defaultValue=''>
										 								<#if (inspectTime_defaultValue)?? &&(inspectTime_defaultValue)?has_content>
									<#assign inspectTime_defaultValue  = getDefaultDateTime(inspectTime_defaultValue!)?datetime>
								</#if>

									<@datacolumn key="inspectTime"        showFormat="YMD_HMS" defaultValue="${(inspectTime_defaultValue!)?string}" defaultDisplay="${(inspectTime_displayDefaultType!)?string}" decimal="" editable=false type="datetime" showType="datetime" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1502699467125')}" width=150 showFormatFunc=""  />
							<#assign checkTime_displayDefaultType=''>
								<#assign checkTime_defaultValue=''>
										<#assign checkTime_defaultValue=''>
										 								<#if (checkTime_defaultValue)?? &&(checkTime_defaultValue)?has_content>
									<#assign checkTime_defaultValue  = getDefaultDateTime(checkTime_defaultValue!)?datetime>
								</#if>

									<@datacolumn key="checkTime"        showFormat="YMD_HMS" defaultValue="${(checkTime_defaultValue!)?string}" defaultDisplay="${(checkTime_displayDefaultType!)?string}" decimal="" editable=false type="datetime" showType="datetime" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1502699489899')}" width=150 showFormatFunc=""  />
			
			</@datagrid>
				<script type="text/javascript">
					function inspect_showFormatFunc( value,  nRow ){
  return "<a onclick='inspectClick($(this).parents(\"tr\").eq(0).index())'><span onmouseover=\"this.style.color='#f00'\" onmouseout=\"this.style.color='#3366CC'\" style='text-decoration:underline;color:#3366CC;cursor:pointer'>"+value+"</span></a>";
};
function inspectClick(nRow){
	var url = CheckManage_dg1502700453811Widget.getCellValue(nRow,"inspectUrl");
	openFullScreen(url);
};
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					function check_showFormatFunc( value,  nRow ){
  return "<a onclick='checkClick($(this).parents(\"tr\").eq(0).index())'><span onmouseover=\"this.style.color='#f00'\" onmouseout=\"this.style.color='#3366CC'\" style='text-decoration:underline;color:#3366CC;cursor:pointer'>"+value+"</span></a>";
};
function checkClick(nRow){
	var url = CheckManage_dg1502700453811Widget.getCellValue(nRow,"chenkReportUrl");
	openFullScreen(url);
};
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
				function CheckManage_dg1502700453811_check_datagridvalid(){
					//
					var errorObj =CheckManage_dg1502700453811Widget._DT.testData();
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
				
				function savedg1502700453811DataGrid(){
					<#if  refId?? && (refId gt 0)>
					CheckManage_dg1502700453811Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('CheckManage_dg1502700453811Widget') > -1) {
						CheckManage_dg1502700453811Widget.setAllRowEdited();
					}
					var json = CheckManage_dg1502700453811Widget.parseEditedData();
					$('input[name="dg1502700453811ListJson"]').remove();
					$('input[name="dgLists[\'dg1502700453811\']"]').remove();
					$('input[name="dg1502700453811ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1502700453811\']">').val(json).appendTo($('#WOM_generalManage_produceTaskManage_generalDetail_form'));
					$('<input type="hidden" name="dg1502700453811ModelCode">').val('WOM_7.5.0.0_generalManage_CheckManage').appendTo($('#WOM_generalManage_produceTaskManage_generalDetail_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1502700453811ListJson">').val(json).appendTo($('#WOM_generalManage_produceTaskManage_generalDetail_form'));
				}
				function DT_CheckManage_dg1502700453811_deldatagrid(){
					var deleteRows = CheckManage_dg1502700453811Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','produceTask.id','product.id','chenkReport.id','inspectDept.id','checkDept.id','inspect.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1502700453811DeletedIds").length>0){
							$("#dg1502700453811DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1502700453811DeletedIds" name="dgDeletedIds[\'dg1502700453811\']" value="'+tepID+'">').appendTo(CUI('#WOM_generalManage_produceTaskManage_generalDetail_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1502700453811DeletedIds['+CUI('input[name^="dg1502700453811DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_generalManage_produceTaskManage_generalDetail_form'));
					});
					return deleteRows;
				}
				function DT_CheckManage_dg1502700453811_delTreeNodes(){
					var deleteRows = CheckManage_dg1502700453811Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','produceTask.id','product.id','chenkReport.id','inspectDept.id','checkDept.id','inspect.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1502700453811DeletedIds").length>0){
							$("#dg1502700453811DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1502700453811DeletedIds" name="dgDeletedIds[\'dg1502700453811\']" value="'+tepID+'">').appendTo(CUI('#WOM_generalManage_produceTaskManage_generalDetail_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1502700453811DeletedIds['+CUI('input[name^="dg1502700453811DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_generalManage_produceTaskManage_generalDetail_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('WOM_generalManage_produceTaskManage_generalDetail_datagrids');
					if(!datagrids) {
						datagrids = [];
					}
					for(var i=0;i<3;i++) {
						if(!datagrids[i]) {
							datagrids[i] = [];
						}
					}
					if(datagrids[1].length>0) {
						for(var i=0;i<datagrids[1].length;i++) {
							if(datagrids[1][i] == 'CheckManage_dg1502700453811') {
								break;
							}
							if(i==datagrids[1].length-1) {
								datagrids[1][datagrids[1].length] = 'CheckManage_dg1502700453811';
							}
						}
					} else {
						datagrids[1][datagrids[1].length] = 'CheckManage_dg1502700453811';
					}
					$('body').data('WOM_generalManage_produceTaskManage_generalDetail_datagrids', datagrids);
				});
				
				var CheckManage_dg1502700453811_importDialog = null;
				function CheckManage_dg1502700453811_showImportDialog(){
					try{
						if(CheckManage_dg1502700453811_importDialog!=null&&CheckManage_dg1502700453811_importDialog.isShow==1){
							return false;
						}
						var url = "/WOM/generalManage/produceTaskManage/initImport.action?datagridCode=WOM_7.5.0.0_generalManage_generalDetaildg1502700453811&tid=${id!}&datagridName=dg1502700453811";
							<#if canImportExcel>
								var buttonCode="WOM_7.5.0.0_generalManage_generalDetaildg1502700453811_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						CheckManage_dg1502700453811_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("CheckManage_dg1502700453811"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();CheckManage_dg1502700453811_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();CheckManage_dg1502700453811_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						CheckManage_dg1502700453811_importDialog.show();
					}catch(e){}
				}	
				
				function CheckManage_dg1502700453811_downLoadFile(){
					var url = "/WOM/generalManage/produceTaskManage/downLoad.action?datagridCode=WOM_7.5.0.0_generalManage_generalDetaildg1502700453811&templateRelatedModelCode=WOM_7.5.0.0_generalManage_generalDetaildg1502700453811&downloadType=template&fileName=dg1502700453811";
					window.open(url,"","");
				}
				function dg1502700453811RenderOverEvent(){
					//如果上标题有选择，初始化赋值
if(isCheckFirst && ec_WOM_produceTask_produceTask_generalManageView_queryWidget.getSelectedRow()[0]!=undefined){
	var batchNum = ec_WOM_produceTask_produceTask_generalManageView_queryWidget.getSelectedRow()[0].productBatchNum;
	CheckManage_dg1502700453811Widget._DT.setRequestDataUrl("/WOM/generalManage/produceTaskManage/getCheckManage.action?batchNum="+batchNum);
	isCheckFirst=false;
}
				}
				function dg1502700453811PageInitMethod(nTabIndex){
					WOM.generalManage.produceTaskManage.generalDetail.initSize(nTabIndex);
					var mainHeight = $("#ec_WOM_produceTask_produceTask_generalManageView_container_main").height();   //总大小
var queryHeight = $("#ec_WOM_produceTask_produceTask_generalManageView_queryForm_allContainer").height();   //快速查询栏
var barHeight = $(".paginatorbar").height();   //表格栏
var tabsHeight = $(".edit-tabs").height();
var gridHeight = (mainHeight-queryHeight-barHeight*3)/2 -2*barHeight ;  //两个表格，平分大小
CheckManage_dg1502700453811Widget.setHeight(gridHeight);
				}
			</script>
			
			
			</div>
		</div>
			<div class="clearfix pd_bottom">
				<div class="cui-elements pd-top">

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
			
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/WOM/generalManage/produceTaskManage/data-dg1502700759865.action?produceTaskManage.id=${refId!-1}&refId=${refId!-1}&datagridCode=WOM_7.5.0.0_generalManage_generalDetaildg1502700759865">
			<#else>
				<#assign dUrl="/WOM/generalManage/produceTaskManage/data-dg1502700759865.action?produceTaskManage.id=${(produceTaskManage.id)!-1}&datagridCode=WOM_7.5.0.0_generalManage_generalDetaildg1502700759865">
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
					<input type="hidden" id="dg_cp_info_TaskReportManage_dg1502700759865" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1502700759865_id" value="TaskReportManage_dg1502700759865" />
			
			<input type="hidden" id="dg1502700759865_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('WOM.modelname.randon1502698712286')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/WOM/generalManage/produceTaskManage/data-dg1502700759865.action?operateType=export&datagridCode=WOM_7.5.0.0_generalManage_generalDetaildg1502700759865"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="TaskReportManage_dg1502700759865" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="TaskReportManage_dg1502700759865" viewType="${viewType}" renderOverEvent="dg1502700759865RenderOverEvent" route="${routeFlag}" formId="WOM_generalManage_produceTaskManage_generalDetail_form" noPermissionKeys="taskReportPart.headId.tableNo,taskReportUrl,taskReportPart.reportStaff.name,taskReportPart.reportNum,taskReportPart.reportType,taskReportPart.reportDate,taskReportPart.batchNum,taskReportPart.wareId.wareName,taskReportPart.storeID.placeSetName,taskReportPart.remark" modelCode="WOM_7.5.0.0_generalManage_TaskReportManage" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1502700759865" dtPage="dgPage"  hidekeyPrefix="dg1502700759865" hidekey="['id','version','taskReportPart.id','taskReportPart.headId.tableNo','taskReportPart.id','taskReportPart.reportStaff.name','taskReportPart.id','taskReportPart.reportNum','taskReportPart.id','taskReportPart.reportType.id','taskReportPart.id','taskReportPart.reportDate','taskReportPart.id','taskReportPart.batchNum','taskReportPart.id','taskReportPart.wareId.wareName','taskReportPart.id','taskReportPart.storeID.placeSetName','taskReportPart.id','taskReportPart.remark'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=false  buttons="${buttons}" noPadding=true isEdit=true tabViewIndex=2 pageInitMethod="dg1502700759865PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=false cannotDeleteRow=true assModelDisplayName=assModelDisplayName  activexButton="" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign taskReportPart_headId_tableNo_displayDefaultType=''>
								<#assign taskReportPart_headId_tableNo_defaultValue=''>
										<#assign taskReportPart_headId_tableNo_defaultValue=''>
																	<#if (taskReportPart_headId_tableNo_defaultValue!)?string=="currentUser">
								<#assign taskReportPart_headId_tableNo_defaultValue='${staffJson!}'>
							<#elseif (taskReportPart_headId_tableNo_defaultValue!)?string=="currentPost">
								<#assign taskReportPart_headId_tableNo_defaultValue='${postJson!}'>
							<#elseif (taskReportPart_headId_tableNo_defaultValue!)?string=="currentDepart">
								<#assign taskReportPart_headId_tableNo_defaultValue='${deptJson!}'>
							<#elseif (taskReportPart_headId_tableNo_defaultValue!)?string=="currentComp">
								<#assign taskReportPart_headId_tableNo_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="taskReportPart.headId.tableNo"        showFormat="SELECTCOMP" defaultValue="${(taskReportPart_headId_tableNo_defaultValue!)?string}" defaultDisplay="${(taskReportPart_headId_tableNo_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.generalManage.produceTaskManage.generalDetail"  textalign="left"  viewUrl="/WOM/taskReporting/taskReportingPart/reportDetaliRef.action" viewCode="WOM_7.5.0.0_taskReporting_reportDetaliRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1495093620878')}"  label="${getText('WOM.menuName.randon149078554261011')}" width=180 showFormatFunc="taskReport_showFormatFunc"  />
							<#assign taskReportUrl_displayDefaultType=''>
								<#assign taskReportUrl_defaultValue=''>
										<#assign taskReportUrl_defaultValue=''>
										 
									<@datacolumn key="taskReportUrl"        showFormat="TEXT" defaultValue="${(taskReportUrl_defaultValue!)?string}" defaultDisplay="${(taskReportUrl_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="center" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1503300950455')}" width=100 showFormatFunc=""  />
							<#assign taskReportPart_reportStaff_name_displayDefaultType=''>
								<#assign taskReportPart_reportStaff_name_defaultValue=''>
										<#assign taskReportPart_reportStaff_name_defaultValue=''>
																	<#if (taskReportPart_reportStaff_name_defaultValue!)?string=="currentUser">
								<#assign taskReportPart_reportStaff_name_defaultValue='${staffJson!}'>
							<#elseif (taskReportPart_reportStaff_name_defaultValue!)?string=="currentPost">
								<#assign taskReportPart_reportStaff_name_defaultValue='${postJson!}'>
							<#elseif (taskReportPart_reportStaff_name_defaultValue!)?string=="currentDepart">
								<#assign taskReportPart_reportStaff_name_defaultValue='${deptJson!}'>
							<#elseif (taskReportPart_reportStaff_name_defaultValue!)?string=="currentComp">
								<#assign taskReportPart_reportStaff_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="taskReportPart.reportStaff.name"        showFormat="TEXT" defaultValue="${(taskReportPart_reportStaff_name_defaultValue!)?string}" defaultDisplay="${(taskReportPart_reportStaff_name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.generalManage.produceTaskManage.generalDetail"  textalign="left"  viewUrl="/WOM/taskReporting/taskReportingPart/reportDetaliRef.action" viewCode="WOM_7.5.0.0_taskReporting_reportDetaliRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1495093620878')}"  label="${getText('WOM.staff.dimissionStaff_xls.staffName0000')}" width=80 showFormatFunc=""  />
							<#assign taskReportPart_reportNum_displayDefaultType=''>
								<#assign taskReportPart_reportNum_defaultValue=''>
										<#assign taskReportPart_reportNum_defaultValue=''>
																	<#if (taskReportPart_reportNum_defaultValue!)?string=="currentUser">
								<#assign taskReportPart_reportNum_defaultValue='${staffJson!}'>
							<#elseif (taskReportPart_reportNum_defaultValue!)?string=="currentPost">
								<#assign taskReportPart_reportNum_defaultValue='${postJson!}'>
							<#elseif (taskReportPart_reportNum_defaultValue!)?string=="currentDepart">
								<#assign taskReportPart_reportNum_defaultValue='${deptJson!}'>
							<#elseif (taskReportPart_reportNum_defaultValue!)?string=="currentComp">
								<#assign taskReportPart_reportNum_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="taskReportPart.reportNum"        showFormat="TEXT" defaultValue="${(taskReportPart_reportNum_defaultValue!)?string}" defaultDisplay="${(taskReportPart_reportNum_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false   selectCompName="WOM.generalManage.produceTaskManage.generalDetail"  textalign="right"  viewUrl="/WOM/taskReporting/taskReportingPart/reportDetaliRef.action" viewCode="WOM_7.5.0.0_taskReporting_reportDetaliRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1495093620878')}"  label="${getText('WOM.propertydisplayName.randon1492079279822858252')}" width=80 showFormatFunc=""  />
							<#assign taskReportPart_reportType_displayDefaultType=''>
								<#assign taskReportPart_reportType_defaultValue=''>
										<#assign taskReportPart_reportType_defaultValue=''>
																	<#if (taskReportPart_reportType_defaultValue!)?string=="currentUser">
								<#assign taskReportPart_reportType_defaultValue='${staffJson!}'>
							<#elseif (taskReportPart_reportType_defaultValue!)?string=="currentPost">
								<#assign taskReportPart_reportType_defaultValue='${postJson!}'>
							<#elseif (taskReportPart_reportType_defaultValue!)?string=="currentDepart">
								<#assign taskReportPart_reportType_defaultValue='${deptJson!}'>
							<#elseif (taskReportPart_reportType_defaultValue!)?string=="currentComp">
								<#assign taskReportPart_reportType_defaultValue='${compJson!}'>
							</#if>
									<@systemCodeColumn code="womReportType" textalign="center" defaultValue="${(taskReportPart_reportType_defaultValue!)?string}" key="taskReportPart.reportType.id" editable=false type="selectcomp" notnull=false     label="${getText('WOM.propertydisplayName.randon1492078645437')}" width=60   />
							<#assign taskReportPart_reportDate_displayDefaultType=''>
								<#assign taskReportPart_reportDate_defaultValue=''>
										<#assign taskReportPart_reportDate_defaultValue=''>
																		<#if (taskReportPart_reportDate_defaultValue)?? &&(taskReportPart_reportDate_defaultValue)?has_content>
									<#assign taskReportPart_reportDate_defaultValue  = getDefaultDateTime(taskReportPart_reportDate_defaultValue!)?datetime>
								</#if>
							<#if (taskReportPart_reportDate_defaultValue!)?string=="currentUser">
								<#assign taskReportPart_reportDate_defaultValue='${staffJson!}'>
							<#elseif (taskReportPart_reportDate_defaultValue!)?string=="currentPost">
								<#assign taskReportPart_reportDate_defaultValue='${postJson!}'>
							<#elseif (taskReportPart_reportDate_defaultValue!)?string=="currentDepart">
								<#assign taskReportPart_reportDate_defaultValue='${deptJson!}'>
							<#elseif (taskReportPart_reportDate_defaultValue!)?string=="currentComp">
								<#assign taskReportPart_reportDate_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="taskReportPart.reportDate"        showFormat="YMD_HMS" defaultValue="${(taskReportPart_reportDate_defaultValue!)?string}" defaultDisplay="${(taskReportPart_reportDate_displayDefaultType!)?string}" decimal="" editable=false type="datetime" showType="datetime" notnull=false   selectCompName="WOM.generalManage.produceTaskManage.generalDetail"  textalign="center"  viewUrl="/WOM/taskReporting/taskReportingPart/reportDetaliRef.action" viewCode="WOM_7.5.0.0_taskReporting_reportDetaliRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1495093620878')}"  label="${getText('WOM.propertydisplayName.randon1492078626890')}" width=150 showFormatFunc=""  />
							<#assign taskReportPart_batchNum_displayDefaultType=''>
								<#assign taskReportPart_batchNum_defaultValue=''>
										<#assign taskReportPart_batchNum_defaultValue=''>
																	<#if (taskReportPart_batchNum_defaultValue!)?string=="currentUser">
								<#assign taskReportPart_batchNum_defaultValue='${staffJson!}'>
							<#elseif (taskReportPart_batchNum_defaultValue!)?string=="currentPost">
								<#assign taskReportPart_batchNum_defaultValue='${postJson!}'>
							<#elseif (taskReportPart_batchNum_defaultValue!)?string=="currentDepart">
								<#assign taskReportPart_batchNum_defaultValue='${deptJson!}'>
							<#elseif (taskReportPart_batchNum_defaultValue!)?string=="currentComp">
								<#assign taskReportPart_batchNum_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="taskReportPart.batchNum"        showFormat="TEXT" defaultValue="${(taskReportPart_batchNum_defaultValue!)?string}" defaultDisplay="${(taskReportPart_batchNum_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.generalManage.produceTaskManage.generalDetail"  textalign="left"  viewUrl="/WOM/taskReporting/taskReportingPart/reportDetaliRef.action" viewCode="WOM_7.5.0.0_taskReporting_reportDetaliRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1495093620878')}"  label="${getText('WOM.propertydisplayName.randon1490773190433')}" width=120 showFormatFunc=""  />
							<#assign taskReportPart_wareId_wareName_displayDefaultType=''>
								<#assign taskReportPart_wareId_wareName_defaultValue=''>
										<#assign taskReportPart_wareId_wareName_defaultValue=''>
																	<#if (taskReportPart_wareId_wareName_defaultValue!)?string=="currentUser">
								<#assign taskReportPart_wareId_wareName_defaultValue='${staffJson!}'>
							<#elseif (taskReportPart_wareId_wareName_defaultValue!)?string=="currentPost">
								<#assign taskReportPart_wareId_wareName_defaultValue='${postJson!}'>
							<#elseif (taskReportPart_wareId_wareName_defaultValue!)?string=="currentDepart">
								<#assign taskReportPart_wareId_wareName_defaultValue='${deptJson!}'>
							<#elseif (taskReportPart_wareId_wareName_defaultValue!)?string=="currentComp">
								<#assign taskReportPart_wareId_wareName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="taskReportPart.wareId.wareName"        showFormat="TEXT" defaultValue="${(taskReportPart_wareId_wareName_defaultValue!)?string}" defaultDisplay="${(taskReportPart_wareId_wareName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.generalManage.produceTaskManage.generalDetail"  textalign="left"  viewUrl="/WOM/taskReporting/taskReportingPart/reportDetaliRef.action" viewCode="WOM_7.5.0.0_taskReporting_reportDetaliRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1495093620878')}"  label="${getText('WOM.propertydisplayName.randon1484031316281')}" width=100 showFormatFunc=""  />
							<#assign taskReportPart_storeID_placeSetName_displayDefaultType=''>
								<#assign taskReportPart_storeID_placeSetName_defaultValue=''>
										<#assign taskReportPart_storeID_placeSetName_defaultValue=''>
																	<#if (taskReportPart_storeID_placeSetName_defaultValue!)?string=="currentUser">
								<#assign taskReportPart_storeID_placeSetName_defaultValue='${staffJson!}'>
							<#elseif (taskReportPart_storeID_placeSetName_defaultValue!)?string=="currentPost">
								<#assign taskReportPart_storeID_placeSetName_defaultValue='${postJson!}'>
							<#elseif (taskReportPart_storeID_placeSetName_defaultValue!)?string=="currentDepart">
								<#assign taskReportPart_storeID_placeSetName_defaultValue='${deptJson!}'>
							<#elseif (taskReportPart_storeID_placeSetName_defaultValue!)?string=="currentComp">
								<#assign taskReportPart_storeID_placeSetName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="taskReportPart.storeID.placeSetName"        showFormat="TEXT" defaultValue="${(taskReportPart_storeID_placeSetName_defaultValue!)?string}" defaultDisplay="${(taskReportPart_storeID_placeSetName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.generalManage.produceTaskManage.generalDetail"  textalign="left"  viewUrl="/WOM/taskReporting/taskReportingPart/reportDetaliRef.action" viewCode="WOM_7.5.0.0_taskReporting_reportDetaliRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1495093620878')}"  label="${getText('WOM.propertydisplayName.randon1490096758348')}" width=100 showFormatFunc=""  />
							<#assign taskReportPart_remark_displayDefaultType=''>
								<#assign taskReportPart_remark_defaultValue=''>
										<#assign taskReportPart_remark_defaultValue=''>
																	<#if (taskReportPart_remark_defaultValue!)?string=="currentUser">
								<#assign taskReportPart_remark_defaultValue='${staffJson!}'>
							<#elseif (taskReportPart_remark_defaultValue!)?string=="currentPost">
								<#assign taskReportPart_remark_defaultValue='${postJson!}'>
							<#elseif (taskReportPart_remark_defaultValue!)?string=="currentDepart">
								<#assign taskReportPart_remark_defaultValue='${deptJson!}'>
							<#elseif (taskReportPart_remark_defaultValue!)?string=="currentComp">
								<#assign taskReportPart_remark_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="taskReportPart.remark"        showFormat="TEXT" defaultValue="${(taskReportPart_remark_defaultValue!)?string}" defaultDisplay="${(taskReportPart_remark_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.generalManage.produceTaskManage.generalDetail"  textalign="left"  viewUrl="/WOM/taskReporting/taskReportingPart/reportDetaliRef.action" viewCode="WOM_7.5.0.0_taskReporting_reportDetaliRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1495093620878')}"  label="${getText('WOM.propertydisplayName.randon1490773225991')}" width=150 showFormatFunc=""  />
			
			</@datagrid>
				<script type="text/javascript">
					function taskReport_showFormatFunc( value,  nRow ){
  return "<a onclick='taskReportClick($(this).parents(\"tr\").eq(0).index())'><span onmouseover=\"this.style.color='#f00'\" onmouseout=\"this.style.color='#3366CC'\" style='text-decoration:underline;color:#3366CC;cursor:pointer'>"+value+"</span></a>";
};
function taskReportClick(nRow){
	var url = TaskReportManage_dg1502700759865Widget.getCellValue(nRow,"taskReportUrl");
	openFullScreen(url);
};
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
				function TaskReportManage_dg1502700759865_check_datagridvalid(){
					//
					var errorObj =TaskReportManage_dg1502700759865Widget._DT.testData();
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
				
				function savedg1502700759865DataGrid(){
					<#if  refId?? && (refId gt 0)>
					TaskReportManage_dg1502700759865Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('TaskReportManage_dg1502700759865Widget') > -1) {
						TaskReportManage_dg1502700759865Widget.setAllRowEdited();
					}
					var json = TaskReportManage_dg1502700759865Widget.parseEditedData();
					$('input[name="dg1502700759865ListJson"]').remove();
					$('input[name="dgLists[\'dg1502700759865\']"]').remove();
					$('input[name="dg1502700759865ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1502700759865\']">').val(json).appendTo($('#WOM_generalManage_produceTaskManage_generalDetail_form'));
					$('<input type="hidden" name="dg1502700759865ModelCode">').val('WOM_7.5.0.0_generalManage_TaskReportManage').appendTo($('#WOM_generalManage_produceTaskManage_generalDetail_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1502700759865ListJson">').val(json).appendTo($('#WOM_generalManage_produceTaskManage_generalDetail_form'));
				}
				function DT_TaskReportManage_dg1502700759865_deldatagrid(){
					var deleteRows = TaskReportManage_dg1502700759865Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','produceTask.id','taskReportPart.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1502700759865DeletedIds").length>0){
							$("#dg1502700759865DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1502700759865DeletedIds" name="dgDeletedIds[\'dg1502700759865\']" value="'+tepID+'">').appendTo(CUI('#WOM_generalManage_produceTaskManage_generalDetail_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1502700759865DeletedIds['+CUI('input[name^="dg1502700759865DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_generalManage_produceTaskManage_generalDetail_form'));
					});
					return deleteRows;
				}
				function DT_TaskReportManage_dg1502700759865_delTreeNodes(){
					var deleteRows = TaskReportManage_dg1502700759865Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','produceTask.id','taskReportPart.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1502700759865DeletedIds").length>0){
							$("#dg1502700759865DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1502700759865DeletedIds" name="dgDeletedIds[\'dg1502700759865\']" value="'+tepID+'">').appendTo(CUI('#WOM_generalManage_produceTaskManage_generalDetail_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1502700759865DeletedIds['+CUI('input[name^="dg1502700759865DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_generalManage_produceTaskManage_generalDetail_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('WOM_generalManage_produceTaskManage_generalDetail_datagrids');
					if(!datagrids) {
						datagrids = [];
					}
					for(var i=0;i<3;i++) {
						if(!datagrids[i]) {
							datagrids[i] = [];
						}
					}
					if(datagrids[2].length>0) {
						for(var i=0;i<datagrids[2].length;i++) {
							if(datagrids[2][i] == 'TaskReportManage_dg1502700759865') {
								break;
							}
							if(i==datagrids[2].length-1) {
								datagrids[2][datagrids[2].length] = 'TaskReportManage_dg1502700759865';
							}
						}
					} else {
						datagrids[2][datagrids[2].length] = 'TaskReportManage_dg1502700759865';
					}
					$('body').data('WOM_generalManage_produceTaskManage_generalDetail_datagrids', datagrids);
				});
				
				var TaskReportManage_dg1502700759865_importDialog = null;
				function TaskReportManage_dg1502700759865_showImportDialog(){
					try{
						if(TaskReportManage_dg1502700759865_importDialog!=null&&TaskReportManage_dg1502700759865_importDialog.isShow==1){
							return false;
						}
						var url = "/WOM/generalManage/produceTaskManage/initImport.action?datagridCode=WOM_7.5.0.0_generalManage_generalDetaildg1502700759865&tid=${id!}&datagridName=dg1502700759865";
							<#if canImportExcel>
								var buttonCode="WOM_7.5.0.0_generalManage_generalDetaildg1502700759865_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						TaskReportManage_dg1502700759865_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("TaskReportManage_dg1502700759865"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();TaskReportManage_dg1502700759865_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();TaskReportManage_dg1502700759865_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						TaskReportManage_dg1502700759865_importDialog.show();
					}catch(e){}
				}	
				
				function TaskReportManage_dg1502700759865_downLoadFile(){
					var url = "/WOM/generalManage/produceTaskManage/downLoad.action?datagridCode=WOM_7.5.0.0_generalManage_generalDetaildg1502700759865&templateRelatedModelCode=WOM_7.5.0.0_generalManage_generalDetaildg1502700759865&downloadType=template&fileName=dg1502700759865";
					window.open(url,"","");
				}
				function dg1502700759865RenderOverEvent(){
					//如果上标题有选择，初始化赋值
if(isTaskReportFirst && ec_WOM_produceTask_produceTask_generalManageView_queryWidget.getSelectedRow()[0]!=undefined){
	var produceTaskId = ec_WOM_produceTask_produceTask_generalManageView_queryWidget.getSelectedRow()[0].id;
	TaskReportManage_dg1502700759865Widget._DT.setRequestDataUrl("/WOM/generalManage/produceTaskManage/getTaskReport.action?produceTaskId="+produceTaskId);
	isTaskReportFirst=false;
}
				}
				function dg1502700759865PageInitMethod(nTabIndex){
					WOM.generalManage.produceTaskManage.generalDetail.initSize(nTabIndex);
					//表体高度设置
var mainHeight = $("#ec_WOM_produceTask_produceTask_generalManageView_container_main").height();   //总大小
var queryHeight = $("#ec_WOM_produceTask_produceTask_generalManageView_queryForm_allContainer").height();   //快速查询栏
var barHeight = $(".paginatorbar").height();   //表格栏
var tabsHeight = $(".edit-tabs").height();
var gridHeight = (mainHeight-queryHeight-barHeight*3)/2 -2*barHeight ;  //两个表格，平分大小
TaskReportManage_dg1502700759865Widget.setHeight(gridHeight);
				}
			</script>
			
			
			</div>
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
     	
		<div id="WOM_generalManage_produceTaskManage_generalDetail_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="WOM.generalManage.produceTaskManage.generalDetail.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<div id="fileUploadDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_generalManage_generalDetail,html,WOM_7.5.0.0_generalManage_ProduceTaskManage,WOM_7.5.0.0) -->
<!-- 自定义代码 -->
	  <style type="text/css">
		#WOM_generalManage_produceTaskManage_generalDetail_main_div .edit-head {display:none;}
		</style>
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
						$("#WOM_generalManage_produceTaskManage_generalDetail_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#WOM_generalManage_produceTaskManage_generalDetail_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#WOM_generalManage_produceTaskManage_generalDetail_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#WOM_generalManage_produceTaskManage_generalDetail_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			WOM.generalManage.produceTaskManage.generalDetail.initCount = 0;
			WOM.generalManage.produceTaskManage.generalDetail.initSize = function(nTabIndex){
				var panesHeight;
				var thisHeight;
				var h = $(window).height();
			    var w = $(window).width();
			    var width_ = 0;
			    if($('#edit_side_btn').length > 0){
				 $('#edit_side_btn').hasClass('edit-side-btn-r') ? width_ = 0 : width_ = 145;			
				}
				<#if businessCenterList??&&businessCenterList?size gt 0 >
				if($("#edit_sidebar").css("display") === "none"){
					$("div.edit-workflow").css("left",1);
				}else{
					$("div.edit-workflow").css("left",145);
				}
				$("#edit_sidebar").height(h);
				$("div.edit-sidebar-inner").height(h);
				$("#edit_side_btn").css("top",(h-50)/2);
				CUI('div[id^="otherContentDiv_"]').height(h);
				</#if>
				var conHeight = h-$("#WOM_generalManage_produceTaskManage_generalDetail_main_div .edit-head").height()-$("#WOM_generalManage_produceTaskManage_generalDetail_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#WOM_generalManage_produceTaskManage_generalDetail_main_div .edit-workflow").height()</#if>;
				$("#WOM_generalManage_produceTaskManage_generalDetail_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('WOM_generalManage_produceTaskManage_generalDetail_datagrids');
				var padding_bottom=16;
				$("#WOM_generalManage_produceTaskManage_generalDetail_main_div .pd_bottom,#WOM_generalManage_produceTaskManage_generalDetail_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#WOM_generalManage_produceTaskManage_generalDetail_main_div .edit-panes-s").each(function(index){
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
							$(this).parent().height(thisHeight);			//解决存在存在pt的情况，当页面resize时，造成的高度设定不正确问题， BugID=27472			--fukun
							datatableHeight = conHeight - thisHeight;
						}
					} else {
						if(thisHeight > conHeight) {
							$(this).parent().height(conHeight);
							$(this).parent().css("overflow-y","auto");
						} else if(thisHeight && thisHeight > 0) {
							$(this).parent().height(conHeight);  //如果实际高度小于分配给它的高度，就使用分配给它的高度 BugID=18196     --xudihui
						}
					}
					if(datagrids && datagrids.length > 0) {
						if(datagrids[index].length > 0) {
							datatableHeight = datatableHeight; 
							var perHeight = datatableHeight/datagrids[index].length;
							for(var dg=0;dg<datagrids[index].length;dg++) {
								
								var dgwidget = eval(datagrids[index][dg]+'Widget');
								
								if(dgwidget) {
									var dg_container = dgwidget._DT ? ( dgwidget.isJS ? dgwidget._DT.container :  dgwidget._DT.oGridDiv ) : dgwidget.container;
									if ( $( dg_container ).is( ':visible' ) ) {
									   	 if( dgwidget._oGrid || dgwidget._DT._oGrid ){
                                          dgwidget.setHeight(perHeight - 78); 
										  if ( $('._DT_blank','#' + datagrids[index] + '_wrapper').length == 0 ) {
										     $('#' + datagrids[index] + '_wrapper').append('<div style="height:11px" class="_DT_blank" ></div>')  //当使用控件PT的时候，为底部增加10px的div，  xudihui  2015.01.27
										   } 
                                         }
									     else{
									      dgwidget.setHeight(perHeight - 68);
									     }	
									}
								} else {
									if(WOM.generalManage.produceTaskManage.generalDetail.initCount <= 2) {
										setTimeout(function(){WOM.generalManage.produceTaskManage.generalDetail.initSize();}, 200);
										WOM.generalManage.produceTaskManage.generalDetail.initCount++;
									}/* else {
										WOM.generalManage.produceTaskManage.generalDetail.initCount = 0;
									}*/
								}
							}
						}
					} else {
						if(thisHeight < conHeight){ //当此页签下面的实际内容高度小于分配给它的高度
						    $(this).parent().height(conHeight);
						}
						else{     //当此页签下面的实际内容高度大于分配给它的高度
							$(this).parent().height(conHeight);
							if(($("#WOM_generalManage_produceTaskManage_generalDetail_main_div .edit-workflow").length > 0) && ($("#WOM_generalManage_produceTaskManage_generalDetail_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
							 $(this).parent().height(conHeight-14); //有处理结果浮动层的时候，底部留白14像素
							}	
							$(this).parent().css("overflow-y","auto");
						}
					}
					/*
					// 文档申明换成更标准的之后,这个问题不会出现在真实的ie8及以上的浏览器中, 这里的算法会产生其他问题BugID=18197,先注释掉这段代码，后面如果有需要再调整这块代码 ———— lidong
					if($(this).parent().css("overflow-y")=="auto"){  //IE7 下面当内容出现滚动条的时候，不会主动去腾出滚动条的宽度，需要手动计算
						if(YAHOO.env.ua.ie < 8 ){
	                         var width = parseInt($(window).width());
							if($("#edit_side_btn").length>0){
							   $("#edit_side_btn").hasClass('edit-side-btn-r') ? width = width : width = width-145;
							}
							if($('.edit-tabs').length>0){
							   width = width*0.98; //IE7下面把总宽度的98%赋值给它的分配宽度，保持跟IE高版本一致
							}
							var style = ';width:' + (width-48) + 'px;';  //IE7下面把它的分配宽度再减去右侧滚动条的宽度
							$(this).attr('style',style);
							$(this).parent().parent().find('.edit-datatable').each(function(){ //IE7下面如果pt内容为空，直接隐藏，不然会有一个默认高度
								if($(this).html() ==''){$(this).css('display','none');}
							});
						}					
					}
					*/						
				});
			}
			$(function(){
				$('#WOM_generalManage_produceTaskManage_generalDetail_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				WOM.generalManage.produceTaskManage.generalDetail.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				WOM.generalManage.produceTaskManage.generalDetail.initSize();
				if(YAHOO.env.ua.ie == 6){
					$("#loading_wrap_first").css("display","block");
				}
				$("#load_mask_first").remove();
				$("#load_iframe_ie_first").remove();
				$("#loading_wrap_first").remove();
				<#if businessCenterList??&&businessCenterList?size gt 0 >
					$(window).resize(function(){
						for(var i=0; i<CUI.DataTable.Arrays.length; i++){
							if( CUI.DataTable.Arrays[i] && document.getElementById( CUI.DataTable.Arrays[i].dataTableId ) &&  $( CUI.DataTable.Arrays[i].container ).is(':visible') ){
								CUI.DataTable.Arrays[i]._initDomElements();
							}else if( CUI.DataTable.Arrays[i] && !document.getElementById( CUI.DataTable.Arrays[i].dataTableId ) ){
								CUI.DataTable.Arrays[i] = null;
								CUI.DataTable.Arrays.splice(i, 1);
							}
						}
					})
					$(".edit-workflow").css("left",145);
					$("#edit_side_btn").toggle(function(){
						if(parseInt($("#WOM_generalManage_produceTaskManage_generalDetail_main_div").css("width"),10)==650){
							$("#WOM_generalManage_produceTaskManage_generalDetail_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//WOM.generalManage.produceTaskManage.generalDetail.resizeLayout();
						//WOM.generalManage.produceTaskManage.generalDetail.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#WOM_generalManage_produceTaskManage_generalDetail_main_div").css("width"),10)==800){
							$("#WOM_generalManage_produceTaskManage_generalDetail_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//WOM.generalManage.produceTaskManage.generalDetail.resizeLayout();
						//WOM.generalManage.produceTaskManage.generalDetail.initSize();
						$('body').trigger('resize');
					});
				<#else>	
					$(".main-wrap").css("margin-left",0);
					$(".col-sub").width(0);
					$("#edit_side_btn").css("left",0);
					$(".edit-workflow").css("left",1);
					
				</#if>

				if($("ul.edit-tabs li").length > 0) {
			     	$("ul.edit-tabs").tabs("div.edit-panes > div");
			    }
				var datatableHeight;
				var bh = $(".edit-workflow tr:gt(0)").height();
				<#if pendingId?? || editNew>
				$("#workflow_toggle").toggle(function(){
					$(".edit-workflow tr:gt(0)").hide();
					WOM.generalManage.produceTaskManage.generalDetail.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					WOM.generalManage.produceTaskManage.generalDetail.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){WOM.generalManage.produceTaskManage.generalDetail.initSize();});
				/*
				WOM.generalManage.produceTaskManage.generalDetail.resizeLayout=function(){
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
		
		$(function(){
			//解决合并单元格后，同行（tr）内的所有td跨行数（rowspan）相同时,组态期表现为tr占n行单元格，在运行期错乱的bug
			var editContainer = $( 'div.edit-container' );
		    var editTr=editContainer.find(".edit-table tr");
		    $.each(editTr,function(i,item){
		        var editTd=$(item).find("td");
		        var isSameRowSpan=true;//单元格跨行数是否相等
		        var rsTemp;//跨行数
		        var csTemp=0;//跨列数（需累加）
		        for(var k=0;k<editTd.length;k++){
		           var ele=editTd[k];
		           var rowspan=$(ele).attr("rowspan");
		           var colspan=$(ele).attr("colspan");
		           if(!rowspan||rowspan=="") rowspan=1;
		           if(!colspan||colspan=="") colspan=1;
		           csTemp+=Number(colspan);
		           if(!rsTemp){
		              rsTemp=Number(rowspan);
		           }else{
		              if(rsTemp!=rowspan){
		                 isSameRowSpan=false;
		              }
		           }  
		        }
		        //单元格跨行数相等且不为1的情况下，重组本行内容
		        if(isSameRowSpan&&rsTemp!=1){
		           recombineTr(item,rsTemp,csTemp);
		        }
		    });
		    //对满足条件的行进行跨行重组
		    function recombineTr(editTr,rsNum,csNum){
		        var editTd=$(editTr).find("td");
		        $.each(editTd,function(i,item){
		           $(item).attr({"rowspan":"1","data-row":rsNum});
		        });
		        var appendTr="";
		        for(var i=0;i<rsNum-1;i++){
		          appendTr+="<tr data-tag='appendrow'><td class='edit-table-symbol' colspan='"+csNum+"'>&nbsp;</td></tr>";
		        }
		        $(appendTr).insertAfter(editTr);
		    }
		});

		WOM.generalManage.produceTaskManage.generalDetail.validate = function(){
		    <#if dealSet?? && dealSet == 1>
			var cancelItem = $('input[name="workFlowVarStatus"]');
	        validateRequiredFlag = $('input[name="operateType"]').val()=='submit' && (!cancelItem || cancelItem.length == 0 || !(cancelItem.val()=='cancel'));
			if(validateRequiredFlag){
				var comments = $.trim(CUI("#workflow_comments").val());
			 	if(comments != null && comments == ""){
		        	workbenchErrorBarWidget.showMessage("${getText('ec.property.dealinfo.isNotNull')}", 'f');
		        	return false;
				}
			}
		    </#if>
		    return true;
		}
		WOM.generalManage.produceTaskManage.generalDetail.beforeSaveProcess = function(){
			try{eval("savedg1502700158273DataGrid()");}catch(e){}
			try{eval("savedg1502700453811DataGrid()");}catch(e){}
			try{eval("savedg1502700759865DataGrid()");}catch(e){}

			var extraCol = '<extra-data>';
			$('#WOM_generalManage_produceTaskManage_generalDetail_form').trigger('beforeSubmit');
			//produceTaskManage.extraCol
			$('*[name^="_complex_"]').each(function(index, item){
				if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
					if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
					var itemValue = CUI(item).val();
					extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
				}
			});
			extraCol += '</extra-data>';
			$('input[name="produceTaskManage.extraCol"]').val(extraCol);
		}
		WOM.generalManage.produceTaskManage.generalDetail.processDataGrid = function(){
										<#if false && isIE>
										$('#WOM_generalManage_produceTaskManage_generalDetail_form').append(PutInManage_dg1502700158273Widget._DT.createInputs('dg1502700158273List'));
										</#if>
										<#if false && isIE>
										$('#WOM_generalManage_produceTaskManage_generalDetail_form').append(CheckManage_dg1502700453811Widget._DT.createInputs('dg1502700453811List'));
										</#if>
										<#if false && isIE>
										$('#WOM_generalManage_produceTaskManage_generalDetail_form').append(TaskReportManage_dg1502700759865Widget._DT.createInputs('dg1502700759865List'));
										</#if>
		};
		WOM.generalManage.produceTaskManage.generalDetail.save = function(){
			$('#operateType').val("submit");
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!WOM.generalManage.produceTaskManage.generalDetail.validate()){return;}
			//延迟到延迟提交中处理,解决onchange事件无法触发问题
			//WOM.generalManage.produceTaskManage.generalDetail.beforeSaveProcess();

			//WOM.generalManage.produceTaskManage.generalDetail.processDataGrid();
			$('#WOM_generalManage_produceTaskManage_generalDetail_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('WOM_generalManage_produceTaskManage_generalDetail_form','WOM_generalManage_produceTaskManage_generalDetail_datagrids')) {      
		            return "${getText('ec.view.losedata')}";      
		        }else{
		        	 if($('#workflow_comments').length!=0){
			        	if($('#workflow_comments').val()!=null && $('#workflow_comments').val()!=""){
			        		return "${getText('ec.view.losedata')}";
			        	}
				     }  
		        }   
	    });
		<#else>
		$(window).bind('beforeunload',function(){
		        if($('#workflow_comments').length!=0){
		        	if($('#workflow_comments').val()!=null && $('#workflow_comments').val()!=""){
		        		return "${getText('ec.view.losedata')}";
		        	}
		        }  		  
		});		
		</#if>
		//打印
		WOM.generalManage.produceTaskManage.generalDetail.print = function(){
			var viewCode = $('input[name="viewCode"]').val();
			var value = "";
			var printId = 0;
			var printVersion = 0;
			if(viewCode!=undefined && viewCode!=null && viewCode!=''){
				$.ajax({
					url : "/ec/print/getAjaxSetting.action",
					type : 'post',
					async : false,
					data:{"printCookie.type":viewCode},
					success : function(msg) {
						if(msg!=null){
							value = msg.value;
							printId = msg.id;
							printVersion = msg.version;
						}
					}
				});
				$("#printCookie_id").val(printId);
				$("#printCookie_version").val(printVersion);
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
				data += "&dealInfoGroup=" + $('#dealInfoGroup').val();

				var url = document.location.href;
				// TODO 去掉url后的'#'，将来页面上有锚点时，在打印可能也会有问题
				while(url.endsWith('#')) {
					url = url.substring(0, url.length - 1);
				}
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
		
		WOM.generalManage.produceTaskManage.generalDetail.saveSetting = function(){
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
		
		WOM.generalManage.produceTaskManage.generalDetail.printSetting = function(){
			var viewCode = $('input[name="viewCode"]').val();
			var value = "";
			var printId = 0;
			var printVersion = 0;
			if(viewCode!=undefined && viewCode!=null && viewCode!=''){
				$.ajax({
					url : "/ec/print/getAjaxSetting.action",
					type : 'post',
					async : false,
					data:{"printCookie.type":viewCode},
					success : function(msg) {
						if(msg!=null){
							value = msg.value;
							printId = msg.id;
							printVersion = msg.version;
						}
					}
				});
				$("#printCookie_id").val(printId);
				$("#printCookie_version").val(printVersion);
				var values = {};
				if(value!=undefined && value!=null && value != ""){
					values = value.split(/\|/g);
				}
				if(values != null && values.length > 0){
					for(var i=0;i < values.length;i++){
						var item = values[i].split("=");
						if(item[1]=='true'){
							$('#' + item[0]).prop('checked',true);
						}else{
							$('#' + item[0]).prop('checked',false);
						}
					}
				}else{
					$('#mainContent').prop('checked',true);
					$('#dealInfo').prop('checked',true);
					$('#attachmentInfo').prop('checked',true);
				}
				<#if isWorkflow?? && isWorkflow>
				$('td[name="deal"]').show();
				<#else>
				$('td[name="deal"]').hide();
				$('#dealInfo').prop('checked',false);
				</#if>
				<#if isAttachment?? && isAttachment>
				$('td[name="att"]').show();
				<#else>
				$('td[name="att"]').hide();
				$('#attachmentInfo').prop('checked',false);
				</#if>
				WOM.generalManage.produceTaskManage.generalDetail.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(WOM.generalManage.produceTaskManage.generalDetail.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				WOM.generalManage.produceTaskManage.generalDetail.settingDialog.show();
			}
		}
		
		
		WOM.generalManage.produceTaskManage.generalDetail._callBackInfo = function(res){
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

 				try{
					window.opener.refreshPortal('workflow');
					window.opener.timeData();
				}catch(e){
					try{
 						window.opener.WOM.generalManage.produceTaskManage.editCallBackInfo(res); 						
					}catch(e2){
						try{
							if(typeof window.opener.refViewRefresh == 'function'){
								window.opener.refViewRefresh()
							} else {
								window.opener.location.reload();
							}
						}catch(e3){}
					}
				};

 				setTimeout(function(){
					window.close();
				},1000);
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.WOM.generalManage.produceTaskManage.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
			} else {
				CUI.showErrorInfos(res);
			}
		};
		refViewRefresh = function(){
			if($("[name='refViewRefresh']").val() != undefined && "" != $("[name='refViewRefresh']").val()){
				eval($("[name='refViewRefresh']").val());
			}
		}
		
		//控件版PT选人查看按钮单击事件处理函数
		function dataGridBtnImgClick(sUrl,objNameCustomCondition,sTitle,sPTGridID,nRow,sFieldName,oGrid,customCallBack,crossCompany,isObjCustomProp,objCustomPropNames,viewCode){
			//保存当前单击事件的对象信息
			var obj = {
				"oGrid" : oGrid,
				"nRow" : nRow - 1,
				"sKey":	sFieldName
			}
			if(customCallBack){
				WOM.generalManage.produceTaskManage.generalDetail._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				WOM.generalManage.produceTaskManage.generalDetail._isObjCustomProp_IE = isObjCustomProp;
			} else {
				WOM.generalManage.produceTaskManage.generalDetail._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				WOM.generalManage.produceTaskManage.generalDetail._objCustomPropNames_IE = objCustomPropNames;
			} else {
				WOM.generalManage.produceTaskManage.generalDetail._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				WOM.generalManage.produceTaskManage.generalDetail._refViewCode_IE = viewCode;
			} else {
				WOM.generalManage.produceTaskManage.generalDetail._refViewCode_IE = '';
			}
			WOM.generalManage.produceTaskManage.generalDetail._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		WOM.generalManage.produceTaskManage.generalDetail.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			WOM.generalManage.produceTaskManage.generalDetail._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			WOM.generalManage.produceTaskManage.generalDetail._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			WOM.generalManage.produceTaskManage.generalDetail.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			WOM.generalManage.produceTaskManage.generalDetail._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				WOM.generalManage.produceTaskManage.generalDetail._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		WOM.generalManage.produceTaskManage.generalDetail._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(WOM.generalManage.produceTaskManage.generalDetail._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(WOM.generalManage.produceTaskManage.generalDetail._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				WOM.generalManage.produceTaskManage.generalDetail.gridEventObj = gridEventObj;
				callbackName = "WOM.generalManage.produceTaskManage.generalDetail.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "WOM.generalManage.produceTaskManage.generalDetail.getMultiselectCallBackInfo_DG" : "WOM.generalManage.produceTaskManage.generalDetail.getcallBackInfo_DG";
				WOM.generalManage.produceTaskManage.generalDetail._currRow = $(obj).closest('tr')[0];
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="WOM.generalManage.produceTaskManage.generalDetail.getcallBackInfo";
			}

			if(_prefix!=''){
				WOM.generalManage.produceTaskManage.generalDetail._prefix = _prefix.substring(1);
			}
			
			WOM.generalManage.produceTaskManage.generalDetail._oGrid = oGrid;
			WOM.generalManage.produceTaskManage.generalDetail._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					WOM.generalManage.produceTaskManage.generalDetail._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					WOM.generalManage.produceTaskManage.generalDetail._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					WOM.generalManage.produceTaskManage.generalDetail._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					WOM.generalManage.produceTaskManage.generalDetail._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					WOM.generalManage.produceTaskManage.generalDetail._refViewCode = oColumn.viewCode;
				} else {
					WOM.generalManage.produceTaskManage.generalDetail._refViewCode = '';
				}
			} else {
				WOM.generalManage.produceTaskManage.generalDetail._isObjCustomProp = false;
				WOM.generalManage.produceTaskManage.generalDetail._objCustomPropNames = '';
				WOM.generalManage.produceTaskManage.generalDetail._refViewCode = '';
			}
			if (WOM.generalManage.produceTaskManage.generalDetail._isObjCustomProp == true && WOM.generalManage.produceTaskManage.generalDetail._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				WOM.generalManage.produceTaskManage.generalDetail._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				WOM.generalManage.produceTaskManage.generalDetail._customCallBack = customCallBack;
			}
			if(WOM.generalManage.produceTaskManage.generalDetail._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.generalManage.produceTaskManage.generalDetail._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof WOM.generalManage.produceTaskManage.generalDetail._querycustomFuncN == "function") {
				refparam += WOM.generalManage.produceTaskManage.generalDetail._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			WOM.generalManage.produceTaskManage.generalDetail._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.generalManage.produceTaskManage.generalDetail._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(WOM.generalManage.produceTaskManage.generalDetail._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.generalManage.produceTaskManage.generalDetail._querycustomFunc(objName.replace(/\./g, '_')));
			}
			WOM.generalManage.produceTaskManage.generalDetail._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'WOM.generalManage.produceTaskManage.generalDetail.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.generalManage.produceTaskManage.generalDetail._querycustomFunc = function(obj) {
			var str = eval("typeof(WOM.generalManage.produceTaskManage.generalDetail.query_"+obj+")!='undefined'") ? eval('WOM.generalManage.produceTaskManage.generalDetail.query_'+obj+'()') : null;
			return str;
		};
		WOM.generalManage.produceTaskManage.generalDetail.getcallBackGroupInfo = function(obj){
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
			WOM.generalManage.produceTaskManage.generalDetail._dialog.close();
		}
		WOM.generalManage.produceTaskManage.generalDetail.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('WOM_generalManage_produceTaskManage_generalDetail_form',obj[0], WOM.generalManage.produceTaskManage.generalDetail._prefix, WOM.generalManage.produceTaskManage.generalDetail._sUrl);
			CUI.commonFills('WOM_generalManage_produceTaskManage_generalDetail_form',WOM.generalManage.produceTaskManage.generalDetail._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (WOM.generalManage.produceTaskManage.generalDetail._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(WOM.generalManage.produceTaskManage.generalDetail._customCallBack) {
					eval(WOM.generalManage.produceTaskManage.generalDetail._customCallBack);
					WOM.generalManage.produceTaskManage.generalDetail._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.generalManage.produceTaskManage.generalDetail._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		WOM.generalManage.produceTaskManage.generalDetail.getcallBackInfo_DG_IE = function(obj){
			if(WOM.generalManage.produceTaskManage.generalDetail._customBeforeCallBack) {
				var flag = eval(WOM.generalManage.produceTaskManage.generalDetail._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = WOM.generalManage.produceTaskManage.generalDetail.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( WOM.generalManage.produceTaskManage.generalDetail._isObjCustomProp_IE == true && WOM.generalManage.produceTaskManage.generalDetail._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,WOM.generalManage.produceTaskManage.generalDetail._sUrl,WOM.generalManage.produceTaskManage.generalDetail._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,WOM.generalManage.produceTaskManage.generalDetail._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (WOM.generalManage.produceTaskManage.generalDetail._isObjCustomProp_IE == true && WOM.generalManage.produceTaskManage.generalDetail._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = WOM.generalManage.produceTaskManage.generalDetail._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = WOM.generalManage.produceTaskManage.generalDetail._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
				for( var i = 0; i < xmlHead.children().length; i++ ){
					var tagName = xmlHead.children()[i].tagName;
					if ( tagName == (rootKey + 'MainDisplay') ) {
						try{
							var showVal = eval('jsonObj.' + showName);
						}catch(e){
							var showVal = eval('jsonObj["' + showName + '"]');
						}
						if (showVal != undefined ) {
							gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,showVal);
						} else {
							try {
								var trueVal = eval('jsonObj.' + trueName);
							} catch(e) {
								var trueVal = eval('jsonObj["' + trueName + '"]');
							}
							trueVal = ( trueVal != undefined ? trueVal : '' );
							gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,trueVal);
						}
					} else if ( tagName == rootKey ) {
						try{
							var trueVal = eval('jsonObj.' + trueName);
						}catch(e){
							var trueVal = eval('jsonObj["' + trueName + '"]');
						}
						trueVal = ( trueVal != undefined ? trueVal : '' );
						gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,trueVal);
					}
				}
			} else {
				for( var i = 0; i < xmlHead.children().length; i++ ){
					var tagName = xmlHead.children()[i].tagName;
					if( tagName.indexOf(rootKey) == 0 ){
						try{
							var value = eval('jsonObj.' + tagName.substring(rootKey.length+1));
						}catch(e){
							var value = eval('jsonObj["' + tagName.substring(rootKey.length+1)+'"]');
						}
						//判断符合条件的key是否存在
						value = ( value != undefined ? value : '' );
						gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,value);			
					}
				}
			}
			// 自定义字段参照回填
			if ( $('#dg_cp_info_' + gridEventObj.oGrid._DT.opts.id).length > 0 ) {
				var dg_cp_info = $('#dg_cp_info_' + gridEventObj.oGrid._DT.opts.id).val();
				var id = jsonObj.id;
				var relationMap;
				if (dg_cp_info && id && WOM.generalManage.produceTaskManage.generalDetail._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + WOM.generalManage.produceTaskManage.generalDetail._refViewCode_IE + '&id=' + id,
						success : function(res){
							if (res.dealSuccessFlag && res.relationMap) {
								relationMap = res.relationMap;
							}
						}
					});
					if (relationMap) {
						var objs = new Object();
						var infoArr = dg_cp_info.split(',');
						for (var n in infoArr) {
							var info = infoArr[n].split('||');
							var key = info[0];
							var name = info[1];
							var propCode = '';
							if (info.length > 2) {
								propCode = info[2];
							}
							var val = relationMap[key];
							if (val) {
								objs[name] = val;
								if (propCode) {
									$.ajax({
										async   : false,
										type    : 'POST',
										url     : '/foundation/customProp/getMainDisplayValue.action',
										data    : 'code=' + propCode + '&id=' + val,
										success : function(res){
											if (res.dealSuccessFlag && res.displayValue) {
												var displayName = name + 'MainDisplay';
												objs[displayName] = res.displayValue;
											}
										}
									});
								}
							}
						}
						// console.log(objs);
						if (objs) {
							for( var i = 0; i < xmlHead.children().length; i++ ){
								var tagName = xmlHead.children()[i].tagName;
								try{
									var value = eval('objs.' + tagName);
								}catch(e){
									var value = eval('objs["' + tagName + '"]');
								}
								if( value != undefined ){
									gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,value);
								}else if( objs.hasOwnProperty(  tagName  ) ){
									value = '';
									gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,value);
								}								
							}
						}
					}
				}
			}
			try{
				if(WOM.generalManage.produceTaskManage.generalDetail._customCallBack) {
					eval(WOM.generalManage.produceTaskManage.generalDetail._customCallBack);
					WOM.generalManage.produceTaskManage.generalDetail._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.generalManage.produceTaskManage.generalDetail._dialog.close();
			} catch(e){}
			
			try{
				var errorMsg = ''
				for ( var item in  CUI.error_msg_DG_CP_map ){
					errorMsg += ( '<b>' + gridEventObj.oGrid._DT._oGrid.ColGetProperty(item,'caption') +  '</b>第<b>' + ( gridEventObj.nRow + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
				}
				if( errorMsg ){
					workbenchErrorBarWidget.showMessage( errorMsg );
				}	
			}catch(e){};
			
			gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
		}
		
		WOM.generalManage.produceTaskManage.generalDetail.getcallBackInfo_DG = function(obj){
			if(WOM.generalManage.produceTaskManage.generalDetail._customBeforeCallBack) {
				var flag = eval(WOM.generalManage.produceTaskManage.generalDetail._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(WOM.generalManage.produceTaskManage.generalDetail._currRow).next().length==0){
						WOM.generalManage.produceTaskManage.generalDetail._oGrid.addNewRow();
					}	
					WOM.generalManage.produceTaskManage.generalDetail._currRow = $(WOM.generalManage.produceTaskManage.generalDetail._currRow).next();
					$(WOM.generalManage.produceTaskManage.generalDetail._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(WOM.generalManage.produceTaskManage.generalDetail._currRow,obj[i], WOM.generalManage.produceTaskManage.generalDetail._prefix, WOM.generalManage.produceTaskManage.generalDetail._sUrl);
				if (WOM.generalManage.produceTaskManage.generalDetail._isObjCustomProp == true && WOM.generalManage.produceTaskManage.generalDetail._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(WOM.generalManage.produceTaskManage.generalDetail._currRow,WOM.generalManage.produceTaskManage.generalDetail._prefix,obj[i],WOM.generalManage.produceTaskManage.generalDetail._oGrid,WOM.generalManage.produceTaskManage.generalDetail._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(WOM.generalManage.produceTaskManage.generalDetail._currRow,WOM.generalManage.produceTaskManage.generalDetail._prefix,obj[i],WOM.generalManage.produceTaskManage.generalDetail._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + WOM.generalManage.produceTaskManage.generalDetail._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + WOM.generalManage.produceTaskManage.generalDetail._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && WOM.generalManage.produceTaskManage.generalDetail._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + WOM.generalManage.produceTaskManage.generalDetail._refViewCode + '&id=' + id,
							success : function(res){
								if (res.dealSuccessFlag && res.relationMap) {
									relationMap = res.relationMap;
								}
							}
						});
						if (relationMap) {
							var objs = new Object();
							var infoArr = dg_cp_info.split(',');
							for (var n in infoArr) {
								var info = infoArr[n].split('||');
								var key = info[0];
								var name = info[1];
								var propCode = '';
								if (info.length > 2) {
									propCode = info[2];
								}
								var val = relationMap[key];
								if (val) {
									name = WOM.generalManage.produceTaskManage.generalDetail._oGrid.configs.hidekeyPrefix + name;
									objs[name] = val;
									if (propCode) {
										$.ajax({
											async   : false,
											type    : 'POST',
											url     : '/foundation/customProp/getMainDisplayValue.action',
											data    : 'code=' + propCode + '&id=' + val,
											success : function(res){
												if (res.dealSuccessFlag && res.displayValue) {
													var displayName = name + 'MainDisplay';
													objs[displayName] = res.displayValue;
												}
											}
										});
									}
								}
							}
							// console.log(objs);
							if (objs) {
								CUI.commonFills_DG_CP(WOM.generalManage.produceTaskManage.generalDetail._currRow, objs, WOM.generalManage.produceTaskManage.generalDetail._oGrid);
							}
						}
					}
				}
			}
			try{
				if(WOM.generalManage.produceTaskManage.generalDetail._customCallBack) {
					eval(WOM.generalManage.produceTaskManage.generalDetail._customCallBack);
					WOM.generalManage.produceTaskManage.generalDetail._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.generalManage.produceTaskManage.generalDetail._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + WOM.generalManage.produceTaskManage.generalDetail._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		WOM.generalManage.produceTaskManage.generalDetail.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(WOM.generalManage.produceTaskManage.generalDetail._oGrid, WOM.generalManage.produceTaskManage.generalDetail._currRow, WOM.generalManage.produceTaskManage.generalDetail._key, WOM.generalManage.produceTaskManage.generalDetail._displayFieldName, obj[i])
			}
			try{
				if(WOM.generalManage.produceTaskManage.generalDetail._customCallBack) {
					eval(WOM.generalManage.produceTaskManage.generalDetail._customCallBack);
					WOM.generalManage.produceTaskManage.generalDetail._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.generalManage.produceTaskManage.generalDetail._dialog.close();
			} catch(e){}
		};
		
		WOM.generalManage.produceTaskManage.generalDetail.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						WOM.generalManage.produceTaskManage.generalDetail.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#WOM_generalManage_produceTaskManage_generalDetail_form'));
						}
					}
				}
			});
		};

		$(function(){
			WOM.generalManage.produceTaskManage.generalDetail.onloadForProduct();
		});

		WOM.generalManage.produceTaskManage.generalDetail.beforeSubmitMethodSettingInPage = function(){
			WOM.generalManage.produceTaskManage.generalDetail.onsaveForProduct();
		};
		WOM.generalManage.produceTaskManage.generalDetail.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  WOM.generalManage.produceTaskManage.generalDetail.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		WOM.generalManage.produceTaskManage.generalDetail.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#WOM_generalManage_produceTaskManage_generalDetail_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#WOM_generalManage_produceTaskManage_generalDetail_main_div").hide();
				},100);
				//CUI("#WOM_generalManage_produceTaskManage_generalDetail_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		WOM.generalManage.produceTaskManage.generalDetail.showThis = function(){
			if(!CUI("#WOM_generalManage_produceTaskManage_generalDetail_main_div").is(':visible')) {
				CUI("#WOM_generalManage_produceTaskManage_generalDetail_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		WOM.generalManage.produceTaskManage.generalDetail.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			WOM.generalManage.produceTaskManage.generalDetail.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "WOM_generalManage_produceTaskManage_generalDetail_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=WOM&modelName=WOM_7.5.0.0_generalManage_ProduceTaskManage&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.generalManage.produceTaskManage.generalDetail.auditDialog.show();
			</#if>
		}
		
		
		WOM.generalManage.produceTaskManage.generalDetail.showInfoDialog=function(mode){
			
			WOM.generalManage.produceTaskManage.generalDetail.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "WOM_generalManage_produceTaskManage_generalDetail_dealInfo",
				modal:true,
				height:500,
				width: 950,//适应国际化版
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.generalManage.produceTaskManage.generalDetail.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		WOM.generalManage.produceTaskManage.generalDetail.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=WOM_7.5.0.0_generalManage");
			}
		}
		
		WOM.generalManage.produceTaskManage.generalDetail.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/WOM/generalManage/produceTaskManage/dealInfo-list.action&dlTableInfoId=${(produceTaskManage.tableInfoId)?default('')}");
			}
		}
		WOM.generalManage.produceTaskManage.generalDetail.showFlowInfo=function(){
		     //IE8环境下使用旧版flash流程展现页面，其他情况使用html5流程展现页面
		    var browser=navigator.appName; 
			var b_version=navigator.appVersion; 
			var version=b_version.split(";"); 
			var trim_Version=version[1]&&version[1].replace(/[ ]/g,"");
			var isIE8=(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE8.0")||($.browser.msie&&(Number($.browser.version)<= 8));//IE8兼容视图模式下浏览器版本判断逻辑补充
			if(CUI.trim(CUI("#flowDiv").html())==""){
				if(isIE8){
				    CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=WOM_7.5.0.0_generalManage_ProduceTaskManage&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(produceTaskManage.tableInfoId)?default('')}");
				}else{
				    CUI("#flowDiv").load("/ec/workflow/flowViewH5.action?env=runtime&modelCode=WOM_7.5.0.0_generalManage_ProduceTaskManage&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(produceTaskManage.tableInfoId)?default('')}");
				}		
			}else{
			  if(!isIE8){
			    //h5展现的情况下需重新适应视图大小
			    setTimeout(function(){
			      $("#flowH5Frame").contents().find("#resetFitView").trigger("click");//视图自适应容器大小 
			    },100); 
			  } 
			}
		}
		WOM.generalManage.produceTaskManage.generalDetail.supervision=function(){
			WOM.generalManage.produceTaskManage.generalDetail.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(produceTaskManage.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				WOM.generalManage.produceTaskManage.generalDetail.modifyOwnerStaffDialog.show();
		}
		







		/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_generalManage_generalDetail,js,WOM_7.5.0.0_generalManage_ProduceTaskManage,WOM_7.5.0.0) */
// 自定义代码
        WOM.generalManage.produceTaskManage.generalDetail.initSize = function(nTabIndex){
			var panesHeight;
            var thisHeight;
            var h = $(window).height();
            var w = $(window).width();
            var width_ = 0;
            if($('#edit_side_btn').length > 0){
              $('#edit_side_btn').hasClass('edit-side-btn-r') ? width_ = 0 : width_ = 145;			
            }
            var conHeight = h-$("#WOM_generalManage_produceTaskManage_generalDetail_main_div .edit-head").height()-$("#WOM_generalManage_produceTaskManage_generalDetail_main_div .edit-tabs").height()-$("#WOM_generalManage_produceTaskManage_generalDetail_main_div .edit-workflow").height();
            $("#WOM_generalManage_produceTaskManage_generalDetail_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
            panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
            var datagrids = $('body').data('WOM_generalManage_produceTaskManage_generalDetail_datagrids');
            var padding_bottom=16;
            $("#WOM_generalManage_produceTaskManage_generalDetail_main_div .pd_bottom,#WOM_generalManage_produceTaskManage_generalDetail_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
            $("#WOM_generalManage_produceTaskManage_generalDetail_main_div .edit-panes-s").each(function(index){
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
                  datatableHeight = conHeight - thisHeight;
                }
              } else {
                if(thisHeight > conHeight) {
                  $(this).parent().height(conHeight);
                  $(this).parent().css("overflow-y","auto");
                } else if(thisHeight && thisHeight > 0) {
                  $(this).parent().height(conHeight);  //如果实际高度小于分配给它的高度，就使用分配给它的高度 BugID=18196     --xudihui
                }
              }
              if(datagrids && datagrids.length > 0) {
                if(datagrids[index].length > 0) {
                  datatableHeight = datatableHeight; 
                  var perHeight = datatableHeight/datagrids[index].length;
                  for(var dg=0;dg<datagrids[index].length;dg++) {

                    var dgwidget = eval(datagrids[index][dg]+'Widget');

                    if(dgwidget) {
                      var dg_container = dgwidget._DT ? ( dgwidget.isJS ? dgwidget._DT.container :  dgwidget._DT.oGridDiv ) : dgwidget.container;
                      if ( $( dg_container ).is( ':visible' ) ) {
                        if( dgwidget._oGrid || dgwidget._DT._oGrid ){
                          //dgwidget.setHeight(perHeight - 78); 
                          if ( $('._DT_blank','#' + datagrids[index] + '_wrapper').length == 0 ) {
                            $('#' + datagrids[index] + '_wrapper').append('<div style="height:11px" class="_DT_blank" ></div>')  //当使用控件PT的时候，为底部增加10px的div，  xudihui  2015.01.27
                          } 
                        }
                        else{
                          //dgwidget.setHeight(perHeight - 68);
                        }	
                      }
                    } else {
                      if(WOM.generalManage.produceTaskManage.generalDetail.initCount <= 2) {
                        setTimeout(function(){WOM.generalManage.produceTaskManage.generalDetail.initSize();}, 200);
                        WOM.generalManage.produceTaskManage.generalDetail.initCount++;
                      }/* else {
                                          WOM.generalManage.produceTaskManage.generalDetail.initCount = 0;
                                      }*/
                                  }
                              }
                          }
                      } else {
                        if(thisHeight < conHeight){ //当此页签下面的实际内容高度小于分配给它的高度
                          $(this).parent().height(conHeight);
                        }
                        else{     //当此页签下面的实际内容高度大于分配给它的高度
                          $(this).parent().height(conHeight);
                          if(($("#WOM_generalManage_produceTaskManage_generalDetail_main_div .edit-workflow").length > 0) && ($("#WOM_generalManage_produceTaskManage_generalDetail_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
                            $(this).parent().height(conHeight-14); //有处理结果浮动层的时候，底部留白14像素
                          }	
                          $(this).parent().css("overflow-y","auto");
                        }
                      }
                    /*
                      // 文档申明换成更标准的之后,这个问题不会出现在真实的ie8及以上的浏览器中, 这里的算法会产生其他问题BugID=18197,先注释掉这段代码，后面如果有需要再调整这块代码 ———— lidong
                      if($(this).parent().css("overflow-y")=="auto"){  //IE7 下面当内容出现滚动条的时候，不会主动去腾出滚动条的宽度，需要手动计算
                          if(YAHOO.env.ua.ie < 8 ){
                               var width = parseInt($(window).width());
                              if($("#edit_side_btn").length>0){
                                 $("#edit_side_btn").hasClass('edit-side-btn-r') ? width = width : width = width-145;
                              }
                              if($('.edit-tabs').length>0){
                                 width = width*0.98; //IE7下面把总宽度的98%赋值给它的分配宽度，保持跟IE高版本一致
                              }
                              var style = ';width:' + (width-48) + 'px;';  //IE7下面把它的分配宽度再减去右侧滚动条的宽度
                              $(this).attr('style',style);
                              $(this).parent().parent().find('.edit-datatable').each(function(){ //IE7下面如果pt内容为空，直接隐藏，不然会有一个默认高度
                                  if($(this).html() ==''){$(this).css('display','none');}
                              });
                          }					
                      }
                      */						
                  });
		}
        
        var isTaskReportFirst=true;
		var isCheckFirst=true
        WOM.generalManage.produceTaskManage.generalDetail.getcallBackInfo_DG_IE = function(obj){}
/* CUSTOM CODE END */
		WOM.generalManage.produceTaskManage.generalDetail.onloadForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_generalManage_generalDetail,onloadForProduct,WOM_7.5.0.0_generalManage_ProduceTaskManage,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		}

		WOM.generalManage.produceTaskManage.generalDetail.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_generalManage_generalDetail,onsaveForProduct,WOM_7.5.0.0_generalManage_ProduceTaskManage,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */		
		}
		
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
			// 触发 resize 事件, 解决用户在其他页签下缩放窗口后，再切换回来时pt等元素宽度会对不上
			setTimeout( function(){
				$(window).trigger('resize');
			}, 100)
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
				<div class="sidebar-top"><a href="#"  onclick="WOM.generalManage.produceTaskManage.generalDetail.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="WOM.generalManage.produceTaskManage.generalDetail.showBusinessList('${l.relatingModel.code.replace('.','')}',${(produceTaskManage.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
							</#if>
						</li>
					    </#list>
					</ul>
				</div>
			</div>
			</div>				
		</div>
		</#if>
		
	<div id="printSettingDiv" style="display:none;width:100%;height:100%;text-align:center">
		<input type="hidden" id="printCookie_id" />
		<input type="hidden" id="printCookie_version" />
		<table width="100%" height="100%" align="center" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td class="td_right">
					<input type="checkbox" name="mainContent" id="mainContent" checked="checked" />
				</td>
				<td class="td_left">
					<label>正文</label>
				</td>
				<td class="td_right" name="att">
					<input type="checkbox" name="attachmentInfo" id="attachmentInfo" checked="checked"/>
				</td>
				<td class="td_left" name="att">
					<label>附件信息</label>
				</td>
				<td class="td_right" name="deal">
					<input type="checkbox" name="dealInfo" id="dealInfo" checked="checked"/>
				</td>
				<td class="td_left" name="deal">
					<label>处理意见</label>
				</td>
			</tr>
		</table>
	</div>
		<!--[if IE 6]><div style="clear:both;"></div><![endif]-->
		<iframe style="display:none;" id="downloadFrame" src="about:blank"/>
	</body>
</html>