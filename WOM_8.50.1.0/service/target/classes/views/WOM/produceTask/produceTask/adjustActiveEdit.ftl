<!-- WOM_7.5.0.0/produceTask/adjustActiveEdit -->
<#assign isWorkflow = true> 
<#assign isAttachment = true> 
	<#assign fileuploadType = "Table">
	<#assign fileuploadLinkId = produceTask.tableInfoId!>
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
<#assign tableObj = produceTask>
<#-- 命名空间 -->
<#assign editPageNs = "WOM.produceTask.produceTask.adjustActiveEdit">
<#-- 模型名称-->
<#assign modelName = "produceTask">
<#-- 视图编码-->
<#assign viewCode = "WOM_7.5.0.0_produceTask_adjustActiveEdit">
<#-- 实体编码-->
<#assign entity_code = "WOM_7.5.0.0_produceTask">
<#-- 视图名称-->
<#assign viewName = "adjustActiveEdit">
<#-- datagrid编码-->
<#assign datagridCode = "WOM_produceTask_produceTask_adjustActiveEdit_datagrids">
<#-- 首字母大写的模型名称-->
<#assign upcaseModelName = "ProduceTask">
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
<#assign editFormId = "WOM_produceTask_produceTask_adjustActiveEdit_form">
<#-- 待办状态 -->
<#assign pendingstatus =( produceTask.pending.taskDescription)!>
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
        <#assign configTitle = getText('WOM.viewtitle.randon1542099610948')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		
		#WOM_produceTask_produceTask_adjustActiveEdit_form{float:left;width:100%;}
		
		
		</style>
		<script type="text/javascript">
			CUI.ns('WOM.produceTask.produceTask.adjustActiveEdit');
			WOM.produceTask.produceTask.adjustActiveEdit.currentUser = ${userJson};
			WOM.produceTask.produceTask.adjustActiveEdit.currentStaff = ${staffJson};
			WOM.produceTask.produceTask.adjustActiveEdit.currentDepartment = ${deptJson};
			WOM.produceTask.produceTask.adjustActiveEdit.currentPosition = ${postJson};
			WOM.produceTask.produceTask.adjustActiveEdit.currentCompany = ${compJson};
		</script>
		<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_produceTask_adjustActiveEdit,head,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
    </head>
	<body class="view-edit ">
		<@loadpanel newType=true/>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="" onsubmitMethod="WOM.produceTask.produceTask.adjustActiveEdit.beforeSubmitMethod()" id="WOM_produceTask_produceTask_adjustActiveEdit_form" namespace="/WOM/produceTask/produceTask/adjustActiveEdit" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=WOM_7.5.0.0_produceTask_ProduceTask&_bapFieldPermissonModelName_=ProduceTask&superEdit=${(superEdit!false)?string}" editPageNs="WOM.produceTask.produceTask.adjustActiveEdit" callback="WOM.produceTask.produceTask.adjustActiveEdit._callBackInfo" ecform="true">
			<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
			<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="WOM_produceTask_produceTask_adjustActiveEdit_main_div">
			<div class="edit-head">
				<#include "../../../ec/tableInfo/operateheadbar_all.ftl" >
				<#include "../../../ec/tableInfo/creatorInfo.ftl" >
			</div>
    		<div class="edit-main" id="WOM_produceTask_produceTask_adjustActiveEdit">
    			<div class="edit-content">
    	<#include "../../../ec/tableInfo/formparam.ftl" >				
		<div class="dash-line"></div>
<script type="text/javascript">
var attcountid = "WOM_produceTask_produceTask_adjustActiveEdit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=WOM_7.5.0.0_produceTask', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>				<div class="edit-panes edit-panes-w edit-container clearfix">
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
								function AdjustOrTempHead_dg1542100691662_adjustStartActive(event)
																{
	if (AdjustOrTempHead_dg1542100691662Widget.getSelectedRow() == undefined){
		CUI.Dialog.alert("请先从[待选活动列表]中选择要开始的活动！");
		return false;
	}
	$.ajax({
	    url : "/WOM/produceTask/adjustOrTempHead/adjustStartActive.action",
	    type : 'post',
	    async : false,
	    data:{
	        "processId":AdjustOrTempHead_dg1542100691662Widget.getCellValue(AdjustOrTempHead_dg1542100691662Widget.getSelectedRow(),'processId.id'),
	        "dealId": AdjustOrTempHead_dg1542100691662Widget.getCellValue(AdjustOrTempHead_dg1542100691662Widget.getSelectedRow(),'id')
	    },
	    success : function(data) {
	        if (data.result){

	            AdjustOrTempRecords_dg1542100698339Widget._DT.setRequestDataUrl("/WOM/produceTask/produceTask/data-dg1542100698339.action?produceTask.id="+$("#id").val()+"&datagridCode=WOM_7.5.0.0_produceTask_adjustActiveEditdg1542100698339&rt=json");
	        }           
	    }
	});
}
							</script>
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/WOM/produceTask/produceTask/data-dg1542100691662.action?produceTask.id=${refId!-1}&refId=${refId!-1}&datagridCode=WOM_7.5.0.0_produceTask_adjustActiveEditdg1542100691662">
			<#else>
				<#assign dUrl="/WOM/produceTask/produceTask/data-dg1542100691662.action?produceTask.id=${(produceTask.id)!-1}&datagridCode=WOM_7.5.0.0_produceTask_adjustActiveEditdg1542100691662">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('WOM.reProcessTaskFlow.start310reProcessTaskFlow')}\",handler:function(event){AdjustOrTempHead_dg1542100691662_adjustStartActive(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('WOM.reProcessTaskFlow.start310reProcessTaskFlow')}\",handler:function(event){AdjustOrTempHead_dg1542100691662_adjustStartActive(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_AdjustOrTempHead_dg1542100691662" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1542100691662_id" value="AdjustOrTempHead_dg1542100691662" />
			
			<input type="hidden" id="dg1542100691662_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('WOM.modelname.randon1542097427304')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/WOM/produceTask/produceTask/data-dg1542100691662.action?operateType=export&datagridCode=WOM_7.5.0.0_produceTask_adjustActiveEditdg1542100691662"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="AdjustOrTempHead_dg1542100691662" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="AdjustOrTempHead_dg1542100691662" viewType="${viewType}" renderOverEvent="dg1542100691662RenderOverEvent" route="${routeFlag}" formId="WOM_produceTask_produceTask_adjustActiveEdit_form" noPermissionKeys="processId.name,activeName,activeType,dataSource,isAgile,product.productCode,product.productName,qualityStandard.name,remark" modelCode="WOM_7.5.0.0_produceTask_AdjustOrTempHead" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1542100691662" dtPage="dgPage"  hidekeyPrefix="dg1542100691662" hidekey="['id','version','processId.id','processId.name','product.id','product.productCode','product.id','product.productName','qualityStandard.id','qualityStandard.name'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=false  buttons="${buttons}" noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1542100691662PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=false cannotDeleteRow=true assModelDisplayName=assModelDisplayName dgTitle="${getText('WOM.dataGriddataGridName.radion1542178101144')}" activexButton="WOM.reProcessTaskFlow.start310reProcessTaskFlow,adjustStartActive,add" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
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

									<@datacolumn key="processId.name"        showFormat="SELECTCOMP" defaultValue="${(processId_name_defaultValue!)?string}" defaultDisplay="${(processId_name_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.produceTask.produceTask.adjustActiveEdit"  textalign="left"  viewUrl="/WOM/produceTask/produceTaskProcess/taskProcessExelogRef.action" viewCode="WOM_7.5.0.0_produceTask_taskProcessExelogRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1495700893633')}"  label="${getText('WOM.propertydisplayName.randon1489720649125')}" width=100 showFormatFunc=""  />
							<#assign activeName_displayDefaultType=''>
								<#assign activeName_defaultValue=''>
										<#assign activeName_defaultValue=''>
										 
									<@datacolumn key="activeName"        showFormat="TEXT" defaultValue="${(activeName_defaultValue!)?string}" defaultDisplay="${(activeName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1542099121174')}" width=100 showFormatFunc=""  />
							<#assign activeType_displayDefaultType=''>
								<#assign activeType_defaultValue=''>
										<#assign activeType_defaultValue=''>
										 									<@systemCodeColumn code="activeType" textalign="center" defaultValue="${(activeType_defaultValue!)?string}" key="activeType.id" editable=false type="selectcomp" notnull=false     label="${getText('WOM.propertydisplayName.randon1542099160827')}" width=100   />
							<#assign dataSource_displayDefaultType=''>
								<#assign dataSource_defaultValue=''>
										<#assign dataSource_defaultValue=''>
										 									<@systemCodeColumn code="womActiveSource" textalign="center" defaultValue="${(dataSource_defaultValue!)?string}" key="dataSource.id" editable=false type="selectcomp" notnull=false     label="${getText('WOM.propertydisplayName.randon1542351171621')}" width=100   />
							<#assign isAgile_displayDefaultType=''>
								<#assign isAgile_defaultValue=''>
										<#assign isAgile_defaultValue=''>
										 
									<@datacolumn key="isAgile"        showFormat="CHECKBOX" defaultValue="${(isAgile_defaultValue!)?string}" defaultDisplay="${(isAgile_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1542174675142')}" width=100 showFormatFunc=""  />
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

									<@datacolumn key="product.productCode"        showFormat="TEXT" defaultValue="${(product_productCode_defaultValue!)?string}" defaultDisplay="${(product_productCode_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.produceTask.produceTask.adjustActiveEdit"  textalign="left"  viewUrl="/MESBasic/product/product/customRef.action" viewCode="MESBasic_1_product_customRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" width=100 showFormatFunc=""  />
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

									<@datacolumn key="product.productName"        showFormat="SELECTCOMP" defaultValue="${(product_productName_defaultValue!)?string}" defaultDisplay="${(product_productName_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.produceTask.produceTask.adjustActiveEdit"  textalign="left"  viewUrl="/MESBasic/product/product/customRef.action" viewCode="MESBasic_1_product_customRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" width=100 showFormatFunc=""  />
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

									<@datacolumn key="qualityStandard.name"        showFormat="SELECTCOMP" defaultValue="${(qualityStandard_name_defaultValue!)?string}" defaultDisplay="${(qualityStandard_name_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.produceTask.produceTask.adjustActiveEdit"  textalign="left"  viewUrl="/RM/qualityStandard/stand/standRef.action" viewCode="RM_7.5.0.0_qualityStandard_standRef" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1487596068024')}"  label="${getText('WOM.propertydisplayName.randon148759513963344')}" width=100 showFormatFunc=""  />
							<#assign remark_displayDefaultType=''>
								<#assign remark_defaultValue=''>
										<#assign remark_defaultValue=''>
										 
									<@datacolumn key="remark"        showFormat="TEXT" defaultValue="${(remark_defaultValue!)?string}" defaultDisplay="${(remark_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1542097956779')}" width=100 showFormatFunc=""  />
			
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
				function AdjustOrTempHead_dg1542100691662_check_datagridvalid(){
					//
					var errorObj =AdjustOrTempHead_dg1542100691662Widget._DT.testData();
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
				
				function savedg1542100691662DataGrid(){
					<#if  refId?? && (refId gt 0)>
					AdjustOrTempHead_dg1542100691662Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('AdjustOrTempHead_dg1542100691662Widget') > -1) {
						AdjustOrTempHead_dg1542100691662Widget.setAllRowEdited();
					}
					var json = AdjustOrTempHead_dg1542100691662Widget.parseEditedData();
					$('input[name="dg1542100691662ListJson"]').remove();
					$('input[name="dgLists[\'dg1542100691662\']"]').remove();
					$('input[name="dg1542100691662ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1542100691662\']">').val(json).appendTo($('#WOM_produceTask_produceTask_adjustActiveEdit_form'));
					$('<input type="hidden" name="dg1542100691662ModelCode">').val('WOM_7.5.0.0_produceTask_AdjustOrTempHead').appendTo($('#WOM_produceTask_produceTask_adjustActiveEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1542100691662ListJson">').val(json).appendTo($('#WOM_produceTask_produceTask_adjustActiveEdit_form'));
				}
				function DT_AdjustOrTempHead_dg1542100691662_deldatagrid(){
					var deleteRows = AdjustOrTempHead_dg1542100691662Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','processId.id','adjustHeadID.id','qualityStandard.id','product.id','processActiveID.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1542100691662DeletedIds").length>0){
							$("#dg1542100691662DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1542100691662DeletedIds" name="dgDeletedIds[\'dg1542100691662\']" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_adjustActiveEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1542100691662DeletedIds['+CUI('input[name^="dg1542100691662DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_adjustActiveEdit_form'));
					});
					return deleteRows;
				}
				function DT_AdjustOrTempHead_dg1542100691662_delTreeNodes(){
					var deleteRows = AdjustOrTempHead_dg1542100691662Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','processId.id','adjustHeadID.id','qualityStandard.id','product.id','processActiveID.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1542100691662DeletedIds").length>0){
							$("#dg1542100691662DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1542100691662DeletedIds" name="dgDeletedIds[\'dg1542100691662\']" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_adjustActiveEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1542100691662DeletedIds['+CUI('input[name^="dg1542100691662DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_adjustActiveEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('WOM_produceTask_produceTask_adjustActiveEdit_datagrids');
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
							if(datagrids[0][i] == 'AdjustOrTempHead_dg1542100691662') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'AdjustOrTempHead_dg1542100691662';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'AdjustOrTempHead_dg1542100691662';
					}
					$('body').data('WOM_produceTask_produceTask_adjustActiveEdit_datagrids', datagrids);
				});
				
				var AdjustOrTempHead_dg1542100691662_importDialog = null;
				function AdjustOrTempHead_dg1542100691662_showImportDialog(){
					try{
						if(AdjustOrTempHead_dg1542100691662_importDialog!=null&&AdjustOrTempHead_dg1542100691662_importDialog.isShow==1){
							return false;
						}
						var url = "/WOM/produceTask/produceTask/initImport.action?datagridCode=WOM_7.5.0.0_produceTask_adjustActiveEditdg1542100691662&tid=${id!}&datagridName=dg1542100691662";
							<#if canImportExcel>
								var buttonCode="WOM_7.5.0.0_produceTask_adjustActiveEditdg1542100691662_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						AdjustOrTempHead_dg1542100691662_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("AdjustOrTempHead_dg1542100691662"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();AdjustOrTempHead_dg1542100691662_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();AdjustOrTempHead_dg1542100691662_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						AdjustOrTempHead_dg1542100691662_importDialog.show();
					}catch(e){}
				}	
				
				function AdjustOrTempHead_dg1542100691662_downLoadFile(){
					var url = "/WOM/produceTask/produceTask/downLoad.action?datagridCode=WOM_7.5.0.0_produceTask_adjustActiveEditdg1542100691662&templateRelatedModelCode=WOM_7.5.0.0_produceTask_adjustActiveEditdg1542100691662&downloadType=template&fileName=dg1542100691662";
					window.open(url,"","");
				}
				function dg1542100691662RenderOverEvent(){
					$("#AdjustOrTempHead_dg1542100691662_tbody tr").each(function(i,v){
	if($(this).find("input[name='dg1542100691662processId.id']").val() != processId || AdjustOrTempHead_dg1542100691662Widget.getCellValue(i,'dataSource.id') != "womActiveSource/03"){
		$(this).hide();
		AdjustOrTempHead_dg1542100691662Widget._DT.resetBdHeight();   
	    AdjustOrTempHead_dg1542100691662Widget._DT.updataTable();
	    // 重新计算表格大小
	    AdjustOrTempHead_dg1542100691662Widget._DT._resetSize();
	    AdjustOrTempHead_dg1542100691662Widget._DT.autoResetHeight();
	    AdjustOrTempHead_dg1542100691662Widget._DT.expandTreeNodeFlag = false;
	}

})
				}
				function dg1542100691662PageInitMethod(nTabIndex){
					WOM.produceTask.produceTask.adjustActiveEdit.initSize(nTabIndex);
				}
			</script>
			
			

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
								function AdjustOrTempRecords_dg1542100698339_adjustEndActive(event)
																{
    if (AdjustOrTempRecords_dg1542100698339Widget.getSelectedRow() == undefined){
        CUI.Dialog.alert("请选中需要结束的活动！");
        return false;
    }else{
        if(AdjustOrTempRecords_dg1542100698339Widget.getCellValue(AdjustOrTempRecords_dg1542100698339Widget.getSelectedRow(),'activeRecordState.id') != "processState/state02"){
            CUI.Dialog.alert("请选中[执行中]的活动！");
            return false;
        }else{
            $.ajax({
                url : "/WOM/produceTask/adjustOrTempHead/adjustEndActive.action",
                type : 'post',
                async : false,
                data:{
                    "activeRecordId": AdjustOrTempRecords_dg1542100698339Widget.getCellValue(AdjustOrTempRecords_dg1542100698339Widget.getSelectedRow(),'id')
                },
                success : function(data) {
                    if (data.result == "处理成功"){

                        AdjustOrTempRecords_dg1542100698339Widget._DT.setRequestDataUrl("/WOM/produceTask/produceTask/data-dg1542100698339.action?produceTask.id="+$("#id").val()+"&datagridCode=WOM_7.5.0.0_produceTask_adjustActiveEditdg1542100698339&rt=json");
                    }else{
                        CUI.Dialog.alert(data.result);
                    }           
                }
            });
        }
    }  
}
							</script>
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/WOM/produceTask/produceTask/data-dg1542100698339.action?produceTask.id=${refId!-1}&refId=${refId!-1}&datagridCode=WOM_7.5.0.0_produceTask_adjustActiveEditdg1542100698339">
			<#else>
				<#assign dUrl="/WOM/produceTask/produceTask/data-dg1542100698339.action?produceTask.id=${(produceTask.id)!-1}&datagridCode=WOM_7.5.0.0_produceTask_adjustActiveEditdg1542100698339">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('WOM.buttonPropertyshowName.radion1539843789678')}\",handler:function(event){AdjustOrTempRecords_dg1542100698339_adjustEndActive(event)},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('WOM.buttonPropertyshowName.radion1539843789678')}\",handler:function(event){AdjustOrTempRecords_dg1542100698339_adjustEndActive(event)},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_AdjustOrTempRecords_dg1542100698339" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1542100698339_id" value="AdjustOrTempRecords_dg1542100698339" />
			
			<input type="hidden" id="dg1542100698339_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('WOM.modelname.randon1542097599573')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/WOM/produceTask/produceTask/data-dg1542100698339.action?operateType=export&datagridCode=WOM_7.5.0.0_produceTask_adjustActiveEditdg1542100698339"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="AdjustOrTempRecords_dg1542100698339" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="AdjustOrTempRecords_dg1542100698339" viewType="${viewType}" renderOverEvent="dg1542100698339RenderOverEvent" route="${routeFlag}" formId="WOM_produceTask_produceTask_adjustActiveEdit_form" noPermissionKeys="processName,acticeName,activeType,activeRecordState,recordDataSource,recordProduct.productCode,recordProduct.productName,actualUse,recordProduct.productBaseUnit.name,startTime,endTime,remark,processID" modelCode="WOM_7.5.0.0_produceTask_AdjustOrTempRecords" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1542100698339" dtPage="dgPage"  hidekeyPrefix="dg1542100698339" hidekey="['id','version','recordProduct.id','recordProduct.productCode','recordProduct.id','recordProduct.productName','recordProduct.id','recordProduct.productBaseUnit.name'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1542100698339PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName  activexButton="WOM.buttonPropertyshowName.radion1539843789678,adjustEndActive,del" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign processName_displayDefaultType=''>
								<#assign processName_defaultValue=''>
										<#assign processName_defaultValue=''>
										  
									<@datacolumn key="processName"        showFormat="TEXT" defaultValue="${(processName_defaultValue!)?string}" defaultDisplay="${(processName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1542192019742')}" width=100 showFormatFunc=""  />
							<#assign acticeName_displayDefaultType=''>
								<#assign acticeName_defaultValue=''>
										<#assign acticeName_defaultValue=''>
										  
									<@datacolumn key="acticeName"        showFormat="TEXT" defaultValue="${(acticeName_defaultValue!)?string}" defaultDisplay="${(acticeName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1542181804390')}" width=100 showFormatFunc=""  />
							<#assign activeType_displayDefaultType=''>
								<#assign activeType_defaultValue=''>
										<#assign activeType_defaultValue=''>
										 									<@systemCodeColumn code="activeType" textalign="center" defaultValue="${(activeType_defaultValue!)?string}" key="activeType.id" editable=false type="selectcomp" notnull=false     label="${getText('WOM.propertydisplayName.randon1542182374652')}" width=100   />
							<#assign activeRecordState_displayDefaultType=''>
								<#assign activeRecordState_defaultValue='processState/state02'>
										<#assign activeRecordState_defaultValue='processState/state02'>
										 									<@systemCodeColumn code="processState" textalign="center" defaultValue="${(activeRecordState_defaultValue!)?string}" key="activeRecordState.id" editable=false type="selectcomp" notnull=false     label="${getText('WOM.propertydisplayName.randon1542181818133')}" width=100   />
							<#assign recordDataSource_displayDefaultType=''>
								<#assign recordDataSource_defaultValue=''>
										<#assign recordDataSource_defaultValue=''>
										 									<@systemCodeColumn code="womActiveSource" textalign="center" defaultValue="${(recordDataSource_defaultValue!)?string}" key="recordDataSource.id" editable=false type="selectcomp" notnull=false     label="${getText('WOM.propertydisplayName.randon1542351209071')}" width=100   />
							<#assign recordProduct_productCode_displayDefaultType=''>
								<#assign recordProduct_productCode_defaultValue=''>
										<#assign recordProduct_productCode_defaultValue=''>
																	<#if (recordProduct_productCode_defaultValue!)?string=="currentUser">
								<#assign recordProduct_productCode_defaultValue='${staffJson!}'>
							<#elseif (recordProduct_productCode_defaultValue!)?string=="currentPost">
								<#assign recordProduct_productCode_defaultValue='${postJson!}'>
							<#elseif (recordProduct_productCode_defaultValue!)?string=="currentDepart">
								<#assign recordProduct_productCode_defaultValue='${deptJson!}'>
							<#elseif (recordProduct_productCode_defaultValue!)?string=="currentComp">
								<#assign recordProduct_productCode_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="recordProduct.productCode"        showFormat="SELECTCOMP" defaultValue="${(recordProduct_productCode_defaultValue!)?string}" defaultDisplay="${(recordProduct_productCode_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.produceTask.produceTask.adjustActiveEdit"  textalign="left"  viewUrl="/MESBasic/product/product/customRef.action" viewCode="MESBasic_1_product_customRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" width=100 showFormatFunc=""  />
							<#assign recordProduct_productName_displayDefaultType=''>
								<#assign recordProduct_productName_defaultValue=''>
										<#assign recordProduct_productName_defaultValue=''>
																	<#if (recordProduct_productName_defaultValue!)?string=="currentUser">
								<#assign recordProduct_productName_defaultValue='${staffJson!}'>
							<#elseif (recordProduct_productName_defaultValue!)?string=="currentPost">
								<#assign recordProduct_productName_defaultValue='${postJson!}'>
							<#elseif (recordProduct_productName_defaultValue!)?string=="currentDepart">
								<#assign recordProduct_productName_defaultValue='${deptJson!}'>
							<#elseif (recordProduct_productName_defaultValue!)?string=="currentComp">
								<#assign recordProduct_productName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="recordProduct.productName"        showFormat="TEXT" defaultValue="${(recordProduct_productName_defaultValue!)?string}" defaultDisplay="${(recordProduct_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.produceTask.produceTask.adjustActiveEdit"  textalign="left"  viewUrl="/MESBasic/product/product/customRef.action" viewCode="MESBasic_1_product_customRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" width=100 showFormatFunc=""  />
							<#assign actualUse_displayDefaultType=''>
								<#assign actualUse_defaultValue=''>
										<#assign actualUse_defaultValue=''>
										  
									<@datacolumn key="actualUse"        showFormat="TEXT" defaultValue="${(actualUse_defaultValue!)?string}" defaultDisplay="${(actualUse_displayDefaultType!)?string}" decimal="6" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1542179773992')}" width=100 showFormatFunc=""  />
							<#assign recordProduct_productBaseUnit_name_displayDefaultType=''>
								<#assign recordProduct_productBaseUnit_name_defaultValue=''>
										<#assign recordProduct_productBaseUnit_name_defaultValue=''>
																	<#if (recordProduct_productBaseUnit_name_defaultValue!)?string=="currentUser">
								<#assign recordProduct_productBaseUnit_name_defaultValue='${staffJson!}'>
							<#elseif (recordProduct_productBaseUnit_name_defaultValue!)?string=="currentPost">
								<#assign recordProduct_productBaseUnit_name_defaultValue='${postJson!}'>
							<#elseif (recordProduct_productBaseUnit_name_defaultValue!)?string=="currentDepart">
								<#assign recordProduct_productBaseUnit_name_defaultValue='${deptJson!}'>
							<#elseif (recordProduct_productBaseUnit_name_defaultValue!)?string=="currentComp">
								<#assign recordProduct_productBaseUnit_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="recordProduct.productBaseUnit.name"        showFormat="TEXT" defaultValue="${(recordProduct_productBaseUnit_name_defaultValue!)?string}" defaultDisplay="${(recordProduct_productBaseUnit_name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.produceTask.produceTask.adjustActiveEdit"  textalign="left"  viewUrl="/MESBasic/product/product/customRef.action" viewCode="MESBasic_1_product_customRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  label="${getText('X6Basic.propertydisplayName.radion1398235640483')}" width=100 showFormatFunc=""  />
							<#assign startTime_displayDefaultType=''>
								<#assign startTime_defaultValue=''>
										<#assign startTime_defaultValue=''>
										 								<#if (startTime_defaultValue)?? &&(startTime_defaultValue)?has_content>
									<#assign startTime_defaultValue  = getDefaultDateTime(startTime_defaultValue!)?datetime>
								</#if>
 
									<@datacolumn key="startTime"        showFormat="YMD_HMS" defaultValue="${(startTime_defaultValue!)?string}" defaultDisplay="${(startTime_displayDefaultType!)?string}" decimal="" editable=false type="datetime" showType="datetime" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1542098129762')}" width=150 showFormatFunc=""  />
							<#assign endTime_displayDefaultType=''>
								<#assign endTime_defaultValue=''>
										<#assign endTime_defaultValue=''>
										 								<#if (endTime_defaultValue)?? &&(endTime_defaultValue)?has_content>
									<#assign endTime_defaultValue  = getDefaultDateTime(endTime_defaultValue!)?datetime>
								</#if>
 
									<@datacolumn key="endTime"        showFormat="YMD_HMS" defaultValue="${(endTime_defaultValue!)?string}" defaultDisplay="${(endTime_displayDefaultType!)?string}" decimal="" editable=false type="datetime" showType="datetime" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1542098149042')}" width=150 showFormatFunc=""  />
							<#assign remark_displayDefaultType=''>
								<#assign remark_defaultValue=''>
										<#assign remark_defaultValue=''>
										  
									<@datacolumn key="remark"        showFormat="TEXT" defaultValue="${(remark_defaultValue!)?string}" defaultDisplay="${(remark_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1542098160250')}" width=100 showFormatFunc=""  />
							<#assign processID_displayDefaultType=''>
								<#assign processID_defaultValue=''>
										<#assign processID_defaultValue=''>
										  
									<@datacolumn key="processID"        showFormat="TEXT" defaultValue="${(processID_defaultValue!)?string}" defaultDisplay="${(processID_displayDefaultType!)?string}" decimal="" editable=false type="long" showType="long" notnull=false     textalign="center" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1542190402118')}" width=30 showFormatFunc=""  />
			
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
				function AdjustOrTempRecords_dg1542100698339_check_datagridvalid(){
					//
					var errorObj =AdjustOrTempRecords_dg1542100698339Widget._DT.testData();
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
				
				function savedg1542100698339DataGrid(){
					<#if  refId?? && (refId gt 0)>
					AdjustOrTempRecords_dg1542100698339Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('AdjustOrTempRecords_dg1542100698339Widget') > -1) {
						AdjustOrTempRecords_dg1542100698339Widget.setAllRowEdited();
					}
					var json = AdjustOrTempRecords_dg1542100698339Widget.parseEditedData();
					$('input[name="dg1542100698339ListJson"]').remove();
					$('input[name="dgLists[\'dg1542100698339\']"]').remove();
					$('input[name="dg1542100698339ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1542100698339\']">').val(json).appendTo($('#WOM_produceTask_produceTask_adjustActiveEdit_form'));
					$('<input type="hidden" name="dg1542100698339ModelCode">').val('WOM_7.5.0.0_produceTask_AdjustOrTempRecords').appendTo($('#WOM_produceTask_produceTask_adjustActiveEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1542100698339ListJson">').val(json).appendTo($('#WOM_produceTask_produceTask_adjustActiveEdit_form'));
				}
				function DT_AdjustOrTempRecords_dg1542100698339_deldatagrid(){
					var deleteRows = AdjustOrTempRecords_dg1542100698339Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','headerID.id','activeDealID.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1542100698339DeletedIds").length>0){
							$("#dg1542100698339DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1542100698339DeletedIds" name="dgDeletedIds[\'dg1542100698339\']" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_adjustActiveEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1542100698339DeletedIds['+CUI('input[name^="dg1542100698339DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_adjustActiveEdit_form'));
					});
					return deleteRows;
				}
				function DT_AdjustOrTempRecords_dg1542100698339_delTreeNodes(){
					var deleteRows = AdjustOrTempRecords_dg1542100698339Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','headerID.id','activeDealID.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1542100698339DeletedIds").length>0){
							$("#dg1542100698339DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1542100698339DeletedIds" name="dgDeletedIds[\'dg1542100698339\']" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_adjustActiveEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1542100698339DeletedIds['+CUI('input[name^="dg1542100698339DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_adjustActiveEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('WOM_produceTask_produceTask_adjustActiveEdit_datagrids');
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
							if(datagrids[0][i] == 'AdjustOrTempRecords_dg1542100698339') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'AdjustOrTempRecords_dg1542100698339';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'AdjustOrTempRecords_dg1542100698339';
					}
					$('body').data('WOM_produceTask_produceTask_adjustActiveEdit_datagrids', datagrids);
				});
				
				var AdjustOrTempRecords_dg1542100698339_importDialog = null;
				function AdjustOrTempRecords_dg1542100698339_showImportDialog(){
					try{
						if(AdjustOrTempRecords_dg1542100698339_importDialog!=null&&AdjustOrTempRecords_dg1542100698339_importDialog.isShow==1){
							return false;
						}
						var url = "/WOM/produceTask/produceTask/initImport.action?datagridCode=WOM_7.5.0.0_produceTask_adjustActiveEditdg1542100698339&tid=${id!}&datagridName=dg1542100698339";
							<#if canImportExcel>
								var buttonCode="WOM_7.5.0.0_produceTask_adjustActiveEditdg1542100698339_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						AdjustOrTempRecords_dg1542100698339_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("AdjustOrTempRecords_dg1542100698339"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();AdjustOrTempRecords_dg1542100698339_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();AdjustOrTempRecords_dg1542100698339_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						AdjustOrTempRecords_dg1542100698339_importDialog.show();
					}catch(e){}
				}	
				
				function AdjustOrTempRecords_dg1542100698339_downLoadFile(){
					var url = "/WOM/produceTask/produceTask/downLoad.action?datagridCode=WOM_7.5.0.0_produceTask_adjustActiveEditdg1542100698339&templateRelatedModelCode=WOM_7.5.0.0_produceTask_adjustActiveEditdg1542100698339&downloadType=template&fileName=dg1542100698339";
					window.open(url,"","");
				}
				function dg1542100698339RenderOverEvent(){
					$("#AdjustOrTempRecords_dg1542100698339_tbody tr").each(function(){
    var activeRecordId = $(this).find("input[name='dg1542100698339id']").val()
    var activeType = $(this).find("td[key='activeType.id']").attr("truevalue")
    var activeState = $(this).find("td[key='activeRecordState.id']").attr("truevalue");
    $(this).on('click',function(){
        //点击时如果当前活动的状态为已完成，禁止点击 开始按钮 和 结束按钮
        if (activeState == "processState/state03"){
            // forbiddenEnd();
            // forbiddenStart();
        }else if (activeState == "processState/state02"){    //如果当前活动为执行中
            // allow();
            // forbiddenStart();
        }
    })
    $(this).on('dblclick',function(){

        $.ajax({
                url : "/WOM/produceTask/adjustOrTempHead/getAdjustActivePage.action",
                type : 'post',
                async : false,
                data:{
                    "activeRecordId":activeRecordId,
                },
                success : function(data) {
                    if (data.result){
                    	if (activeState == "processState/state03"){		//已完成
                    		if (activeType == "activeType/activeType3" || activeType == 'activeType/activeType1'){    //3投料 、1常规
	                            operateCode = "&${getPowerCode('adjustBatchView')}";
	                            url = "/WOM/procFeedback/procFeedbackHead/adjustBatchView.action";
	                            window.open (url+"?id="+data.result+"&entityCode=WOM_7.5.0.0_procFeedback" + operateCode);
	                        }
                    	}else{
                    		if (activeType == "activeType/activeType3" || activeType == 'activeType/activeType1'){    //3投料 、1常规
	                            operateCode = "&${getPowerCode('adjustBatchEdit')}";
	                            url = "/WOM/procFeedback/procFeedbackHead/adjustBatchEdit.action";
	                            window.open (url+"?id="+data.result+"&entityCode=WOM_7.5.0.0_procFeedback" + operateCode);
	                        }
                    	}

                    }           
                }
            });

        
    })
    
})
$("#AdjustOrTempRecords_dg1542100698339_tbody tr").each(function(i,v){
	if(AdjustOrTempRecords_dg1542100698339Widget.getCellValue(i,'processID') != processId || AdjustOrTempRecords_dg1542100698339Widget.getCellValue(i,'recordDataSource.id') != "womActiveSource/03"){
		$(this).hide();
		AdjustOrTempRecords_dg1542100698339Widget._DT.resetBdHeight();   
	    AdjustOrTempRecords_dg1542100698339Widget._DT.updataTable();
	    // 重新计算表格大小
	    AdjustOrTempRecords_dg1542100698339Widget._DT._resetSize();
	    AdjustOrTempRecords_dg1542100698339Widget._DT.autoResetHeight();
	    AdjustOrTempRecords_dg1542100698339Widget._DT.expandTreeNodeFlag = false;
	}
	
})
				}
				function dg1542100698339PageInitMethod(nTabIndex){
					WOM.produceTask.produceTask.adjustActiveEdit.initSize(nTabIndex);
				}
			</script>
			
			
			</div>
			</div>
		</div>
	</div>
	<#if (pendingId?? || editNew) && !(superEdit!false)>
	<#include "../../../ec/tableInfo/flowDealContainer_all.ftl">
	</#if>
			
			
</div>
		<#if businessCenterList??>
	     	<#list businessCenterList as l>
		<div style="float:none;width:auto;display:none;" class="edit-main grid-s5m0 col-main main-wrap" id="otherContentDiv_${l.relatingModel.code.replace('.','')}">
	     	</div>
	     	</#list>
     	</#if>
     	
		<div id="WOM_produceTask_produceTask_adjustActiveEdit_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<#if !(superEdit!false)>
				<li id="flowHead" onclick="WOM.produceTask.produceTask.adjustActiveEdit.showFlowInfo('flow')"><span class="icon_prograss"></span>${getText("ec.flow.flowImage")}</li>
				</#if>
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="WOM.produceTask.produceTask.adjustActiveEdit.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
				<li id="dealInfoHead" class="bar" onclick="WOM.produceTask.produceTask.adjustActiveEdit.showDealInfo('dealInfo')"><span class="icon_handle"></span>${getText("ec.view.dealadvice")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<#if !(superEdit!false)>
				<div class="flow-height wid" id="flowDiv"></div>
				</#if>
				<div id="fileUploadDiv" class="wid-hei"></div>
				<div style="padding:1px 0px 0px 0px;" id="dealInfoDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_produceTask_adjustActiveEdit,html,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) -->
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
						$("#WOM_produceTask_produceTask_adjustActiveEdit_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#WOM_produceTask_produceTask_adjustActiveEdit_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#WOM_produceTask_produceTask_adjustActiveEdit_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#WOM_produceTask_produceTask_adjustActiveEdit_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			WOM.produceTask.produceTask.adjustActiveEdit.initCount = 0;
			WOM.produceTask.produceTask.adjustActiveEdit.initSize = function(nTabIndex){
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
				var conHeight = h-$("#WOM_produceTask_produceTask_adjustActiveEdit_main_div .edit-head").height()-$("#WOM_produceTask_produceTask_adjustActiveEdit_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#WOM_produceTask_produceTask_adjustActiveEdit_main_div .edit-workflow").height()</#if>;
				$("#WOM_produceTask_produceTask_adjustActiveEdit_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('WOM_produceTask_produceTask_adjustActiveEdit_datagrids');
				var padding_bottom=16;
				$("#WOM_produceTask_produceTask_adjustActiveEdit_main_div .pd_bottom,#WOM_produceTask_produceTask_adjustActiveEdit_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#WOM_produceTask_produceTask_adjustActiveEdit_main_div .edit-panes-s").each(function(index){
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
									if(WOM.produceTask.produceTask.adjustActiveEdit.initCount <= 2) {
										setTimeout(function(){WOM.produceTask.produceTask.adjustActiveEdit.initSize();}, 200);
										WOM.produceTask.produceTask.adjustActiveEdit.initCount++;
									}/* else {
										WOM.produceTask.produceTask.adjustActiveEdit.initCount = 0;
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
							if(($("#WOM_produceTask_produceTask_adjustActiveEdit_main_div .edit-workflow").length > 0) && ($("#WOM_produceTask_produceTask_adjustActiveEdit_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				$('#WOM_produceTask_produceTask_adjustActiveEdit_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				WOM.produceTask.produceTask.adjustActiveEdit.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				WOM.produceTask.produceTask.adjustActiveEdit.initSize();
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
						if(parseInt($("#WOM_produceTask_produceTask_adjustActiveEdit_main_div").css("width"),10)==650){
							$("#WOM_produceTask_produceTask_adjustActiveEdit_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//WOM.produceTask.produceTask.adjustActiveEdit.resizeLayout();
						//WOM.produceTask.produceTask.adjustActiveEdit.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#WOM_produceTask_produceTask_adjustActiveEdit_main_div").css("width"),10)==800){
							$("#WOM_produceTask_produceTask_adjustActiveEdit_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//WOM.produceTask.produceTask.adjustActiveEdit.resizeLayout();
						//WOM.produceTask.produceTask.adjustActiveEdit.initSize();
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
					WOM.produceTask.produceTask.adjustActiveEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					WOM.produceTask.produceTask.adjustActiveEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){WOM.produceTask.produceTask.adjustActiveEdit.initSize();});
				/*
				WOM.produceTask.produceTask.adjustActiveEdit.resizeLayout=function(){
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
			<#if editNew>
			WOM.produceTask.produceTask.adjustActiveEdit.setDepartment();
			<#else>
			CUI("#dealInfoContain").load("/ec/workflow/dealInfo.action?dlTableInfoId=${produceTask.tableInfoId!}&dealInfoGroup=byTime&preName=mainFrame&dealDataUrl=/WOM/produceTask/produceTask/dealInfo-list.action&enableSimpleDealInfo=false");
			</#if>
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

		WOM.produceTask.produceTask.adjustActiveEdit.validate = function(){
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
		WOM.produceTask.produceTask.adjustActiveEdit.beforeSaveProcess = function(){
			try{eval("savedg1542100691662DataGrid()");}catch(e){}
			try{eval("savedg1542100698339DataGrid()");}catch(e){}

			var extraCol = '<extra-data>';
			$('#WOM_produceTask_produceTask_adjustActiveEdit_form').trigger('beforeSubmit');
			//produceTask.extraCol
			$('*[name^="_complex_"]').each(function(index, item){
				if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
					if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
					var itemValue = CUI(item).val();
					extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
				}
			});
			extraCol += '</extra-data>';
			$('input[name="produceTask.extraCol"]').val(extraCol);
		}
		WOM.produceTask.produceTask.adjustActiveEdit.processDataGrid = function(){
										<#if false && isIE>
										$('#WOM_produceTask_produceTask_adjustActiveEdit_form').append(AdjustOrTempHead_dg1542100691662Widget._DT.createInputs('dg1542100691662List'));
										</#if>
										<#if false && isIE>
										$('#WOM_produceTask_produceTask_adjustActiveEdit_form').append(AdjustOrTempRecords_dg1542100698339Widget._DT.createInputs('dg1542100698339List'));
										</#if>
		};
		WOM.produceTask.produceTask.adjustActiveEdit.save = function(){
			<#if !(superEdit!false)>
			$('#operateType').val("save");
			<#else>
			$('#operateType').val("submit");
			</#if>
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!WOM.produceTask.produceTask.adjustActiveEdit.validate()){return;}
			//延迟到延迟提交中处理,解决onchange事件无法触发问题
			//WOM.produceTask.produceTask.adjustActiveEdit.beforeSaveProcess();

			//WOM.produceTask.produceTask.adjustActiveEdit.processDataGrid();
			$('#WOM_produceTask_produceTask_adjustActiveEdit_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('WOM_produceTask_produceTask_adjustActiveEdit_form','WOM_produceTask_produceTask_adjustActiveEdit_datagrids')) {      
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
		WOM.produceTask.produceTask.adjustActiveEdit.print = function(){
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
		
		WOM.produceTask.produceTask.adjustActiveEdit.saveSetting = function(){
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
		
		WOM.produceTask.produceTask.adjustActiveEdit.printSetting = function(){
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
				WOM.produceTask.produceTask.adjustActiveEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(WOM.produceTask.produceTask.adjustActiveEdit.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				WOM.produceTask.produceTask.adjustActiveEdit.settingDialog.show();
			}
		}
		
		
		
		WOM.produceTask.produceTask.adjustActiveEdit.reject = function(){
			var rejectDiv = $("div.deal-result[id^='reject_']");
			if(rejectDiv.length == 1 && $($('input[name="workFlowVar.outcome"][rejectFlag="1"]')[0]).prop('checked') == false){
				$($('input[name="workFlowVar.outcome"][rejectFlag="1"]')[0]).prop('checked',true);
				$($('input[name="workFlowVar.outcome"][rejectFlag="1"]')[0]).click();
			} else {
				if(undefined == $('input[name="workFlowVar.outcome"][rejectFlag="1"]:checked').val()){
					workbenchErrorBarWidget.showMessage("${getText('ec.flow.outcome.reject.select')}");
					return;
				}
			}
			$('#operateType').val("reject");
			WOM.produceTask.produceTask.adjustActiveEdit.submit();
		}
		
		WOM.produceTask.produceTask.adjustActiveEdit.submit = function(uncheck){
			if(uncheck){
			
			} else {
				var operateType = $('#operateType').val();
				if(operateType == "reject"){
					$('#operateType').val("submit");
				} else {
					var normalActives = $('input[name="workFlowVar.outcome"]').not('[rejectFlag="1"]');
					if(null != normalActives && undefined != normalActives && normalActives.length == 1 && $(normalActives[0]).prop('checked') == false){ //普通活动只有一个
						$(normalActives[0]).prop('checked',true);
						$(normalActives[0]).click();
					} else {//多个普通活动
						if(!($('#__workflow_outcome_countersign').prop("checked")||$('input[name="workFlowVar.outcome"]:checked').not('[rejectFlag="1"]').val())){
							workbenchErrorBarWidget.showMessage("${getText('ec.flow.outcome.select')}");
							return;
						}
					}
				}
			}
			$('#operateType').val("submit");
			if(!WOM.produceTask.produceTask.adjustActiveEdit.validate()){return;}
			
			//$('#__workflow_outcomeDes').val($('input[name="workFlowVar.outcome"]:checked').attr('des'));
			
			WOM.produceTask.produceTask.adjustActiveEdit.beforeSaveProcess();
			
			//WOM.produceTask.produceTask.adjustActiveEdit.processDataGrid();
			
			var array=new Array();
			
			var requiredStaff=false;
			var outcomeDesc="";
			$('input[name="workFlowVar.outcome"]:checked').each(function(){
				var checkNull=CUI(this).attr("checkNull");
				
				var paramObj=new Object();
				paramObj.type='normal';
				paramObj.outcome=$(this).val();
				paramObj.dec=$(this).attr("dec");
				outcomeDesc=$(this).attr("dec");
				var id="#assignStaffSelect_"+$(this).val()+"MultiIDs";
				var values=$(id).val();
				var checkNull=$(this).attr("checkNull");
				if(checkNull=='true'&&values==''){
					requiredStaff=true;
					return ;
				}
				paramObj.assignUser=values;
				array.push(paramObj);
			
			})
			
			
			$('input[id*="__workflow_outcome_nodification_"]:checked').each(function(){
				var paramObj1=new Object();
				paramObj1.type='notification';
				paramObj1.outcome=$(this).val();
				paramObj1.dec=$(this).attr("dec");
				if(outcomeDesc!=""){
					outcomeDesc+=","+$(this).attr("dec");
				}else{
					outcomeDesc=$(this).attr("dec");
				}
				var id="#assignStaffSelect_"+$(this).val()+"MultiIDs";
				var values1=CUI(id).val();
				var checkNull1=$(this).attr("checkNull");
				if(checkNull1=='true'&&values1==''){
					requiredStaff=true;
					return ;
				}
				paramObj1.assignUser=values1;
				array.push(paramObj1);
			
			})
			if(requiredStaff){
				workbenchErrorBarWidget.showMessage(outcomeDesc+"${getText("ec.flow.outcome.assStaffNull")}");
				return ;
			}
			if(array.length>0){
				$("#__workflow_outcomeMap").val(YAHOO.lang.JSON.stringify(array));
			}else if($('#__workflow_outcome_countersign').prop("checked")){
				var paramObj1=new Object();
				paramObj1.type='countersignAssign';
				paramObj1.outcome="countersignAssign";
				paramObj1.dec="countersignAssign";
				var countersignUsers=CUI('#countersignUsersMultiIDs').val();
				
				if(countersignUsers==''){
					workbenchErrorBarWidget.showMessage(outcomeDesc+"您勾选了转发，请指定转发人员！");
					return ;
				}
				
				array.push(paramObj1);
				$("#__workflow_outcomeMap").val(YAHOO.lang.JSON.stringify(array));
			}
			$('#WOM_produceTask_produceTask_adjustActiveEdit_form').submit();
			//$(".wfcancel").remove();
			
		}
		WOM.produceTask.produceTask.adjustActiveEdit.recall = function(){
			CUI.Dialog.confirm("${getText('ec.recall.checkrecall')}", function(){
					$.ajax({
					url : "/WOM/produceTask/produceTask/common/recall.action",
					type : 'post',
					async : false,
					data:{"tableInfoId": "${(produceTask.tableInfoId)?default('')}"},
					success : function(msg) {
						if(msg && msg.success){
							workbenchErrorBarWidget.showMessage("${getText('ec.recall.success')}", 's');
		 					var url = "/foundation/user/open-pending.action?pendingId=" + msg.data.id + "&tableInfoId=${(produceTask.tableInfoId)?default('')}&id=${(produceTask.id)?default('')}&entityCode=WOM_7.5.0.0_produceTask";

			 				try{
								window.opener.refreshPortal('workflow');
								window.opener.timeData();
							}catch(e){
								try{
			 						window.opener.WOM.produceTask.produceTask.editCallBackInfo(res); 						
								}catch(e2){
									try{
										<#if calltype??&&calltype=='ref'>
										window.opener.WOM.produceTask.produceTask.callBackInfo(res);
										<#else>
										window.opener.location.reload();
										</#if>
									}catch(e3){}
								}
							};

		 					setTimeout(function(){
		 						window.onbeforeunload = null;
								document.location.href=url;
		 					}, 1000);
						}
					}
				});
			});
		}
		WOM.produceTask.produceTask.adjustActiveEdit._callBackInfo = function(res){
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
 						window.opener.WOM.produceTask.produceTask.editCallBackInfo(res); 						
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
				<#if !(superEdit!false)>
 				if(res.operateType == 'save'){
 					var url = "/foundation/user/open-pending.action?pendingId=" + res.pendingId + "&tableInfoId=" + res.tableInfoId + "&id=" + res.id + "&entityCode=WOM_7.5.0.0_produceTask";
 					setTimeout(function(){
						document.location.href=url;
 					}, 1000);
					return;
 				}
 				</#if>

 				setTimeout(function(){
					window.close();
				},1000);
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.WOM.produceTask.produceTask.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
			} else {
				CUI.showErrorInfos(res);
			}
		};
		refViewRefresh = function(){
			if($("[name='refViewRefresh']").val() != undefined && "" != $("[name='refViewRefresh']").val()){
				eval($("[name='refViewRefresh']").val());
			}
		}
		<#if editNew>
		WOM.produceTask.produceTask.adjustActiveEdit.setDepartment = function(){
			var o = $('#creatorPosition').find("option[selected]");
			if(o && o.length == 1) {
				$('#creatorDepartmentName').text(o.attr('departmentName'));
				$('#creatorDepartmentId').val(o.attr('departmentId'));
				$('#positionLayRec').val(o.attr('layRec'));
			}
		};
		</#if>
		
		//控件版PT选人查看按钮单击事件处理函数
		function dataGridBtnImgClick(sUrl,objNameCustomCondition,sTitle,sPTGridID,nRow,sFieldName,oGrid,customCallBack,crossCompany,isObjCustomProp,objCustomPropNames,viewCode){
			//保存当前单击事件的对象信息
			var obj = {
				"oGrid" : oGrid,
				"nRow" : nRow - 1,
				"sKey":	sFieldName
			}
			if(customCallBack){
				WOM.produceTask.produceTask.adjustActiveEdit._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				WOM.produceTask.produceTask.adjustActiveEdit._isObjCustomProp_IE = isObjCustomProp;
			} else {
				WOM.produceTask.produceTask.adjustActiveEdit._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				WOM.produceTask.produceTask.adjustActiveEdit._objCustomPropNames_IE = objCustomPropNames;
			} else {
				WOM.produceTask.produceTask.adjustActiveEdit._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				WOM.produceTask.produceTask.adjustActiveEdit._refViewCode_IE = viewCode;
			} else {
				WOM.produceTask.produceTask.adjustActiveEdit._refViewCode_IE = '';
			}
			WOM.produceTask.produceTask.adjustActiveEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		WOM.produceTask.produceTask.adjustActiveEdit.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			WOM.produceTask.produceTask.adjustActiveEdit._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			WOM.produceTask.produceTask.adjustActiveEdit._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			WOM.produceTask.produceTask.adjustActiveEdit.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			WOM.produceTask.produceTask.adjustActiveEdit._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				WOM.produceTask.produceTask.adjustActiveEdit._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		WOM.produceTask.produceTask.adjustActiveEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(WOM.produceTask.produceTask.adjustActiveEdit._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(WOM.produceTask.produceTask.adjustActiveEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				WOM.produceTask.produceTask.adjustActiveEdit.gridEventObj = gridEventObj;
				callbackName = "WOM.produceTask.produceTask.adjustActiveEdit.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "WOM.produceTask.produceTask.adjustActiveEdit.getMultiselectCallBackInfo_DG" : "WOM.produceTask.produceTask.adjustActiveEdit.getcallBackInfo_DG";
				WOM.produceTask.produceTask.adjustActiveEdit._currRow = $(obj).closest('tr')[0];
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="WOM.produceTask.produceTask.adjustActiveEdit.getcallBackInfo";
			}

			if(_prefix!=''){
				WOM.produceTask.produceTask.adjustActiveEdit._prefix = _prefix.substring(1);
			}
			
			WOM.produceTask.produceTask.adjustActiveEdit._oGrid = oGrid;
			WOM.produceTask.produceTask.adjustActiveEdit._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					WOM.produceTask.produceTask.adjustActiveEdit._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					WOM.produceTask.produceTask.adjustActiveEdit._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					WOM.produceTask.produceTask.adjustActiveEdit._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					WOM.produceTask.produceTask.adjustActiveEdit._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					WOM.produceTask.produceTask.adjustActiveEdit._refViewCode = oColumn.viewCode;
				} else {
					WOM.produceTask.produceTask.adjustActiveEdit._refViewCode = '';
				}
			} else {
				WOM.produceTask.produceTask.adjustActiveEdit._isObjCustomProp = false;
				WOM.produceTask.produceTask.adjustActiveEdit._objCustomPropNames = '';
				WOM.produceTask.produceTask.adjustActiveEdit._refViewCode = '';
			}
			if (WOM.produceTask.produceTask.adjustActiveEdit._isObjCustomProp == true && WOM.produceTask.produceTask.adjustActiveEdit._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				WOM.produceTask.produceTask.adjustActiveEdit._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				WOM.produceTask.produceTask.adjustActiveEdit._customCallBack = customCallBack;
			}
			if(WOM.produceTask.produceTask.adjustActiveEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.produceTask.produceTask.adjustActiveEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof WOM.produceTask.produceTask.adjustActiveEdit._querycustomFuncN == "function") {
				refparam += WOM.produceTask.produceTask.adjustActiveEdit._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			WOM.produceTask.produceTask.adjustActiveEdit._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.produceTask.produceTask.adjustActiveEdit._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(WOM.produceTask.produceTask.adjustActiveEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.produceTask.produceTask.adjustActiveEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			WOM.produceTask.produceTask.adjustActiveEdit._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'WOM.produceTask.produceTask.adjustActiveEdit.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.produceTask.produceTask.adjustActiveEdit._querycustomFunc = function(obj) {
			var str = eval("typeof(WOM.produceTask.produceTask.adjustActiveEdit.query_"+obj+")!='undefined'") ? eval('WOM.produceTask.produceTask.adjustActiveEdit.query_'+obj+'()') : null;
			return str;
		};
		WOM.produceTask.produceTask.adjustActiveEdit.getcallBackGroupInfo = function(obj){
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
			WOM.produceTask.produceTask.adjustActiveEdit._dialog.close();
		}
		WOM.produceTask.produceTask.adjustActiveEdit.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('WOM_produceTask_produceTask_adjustActiveEdit_form',obj[0], WOM.produceTask.produceTask.adjustActiveEdit._prefix, WOM.produceTask.produceTask.adjustActiveEdit._sUrl);
			CUI.commonFills('WOM_produceTask_produceTask_adjustActiveEdit_form',WOM.produceTask.produceTask.adjustActiveEdit._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (WOM.produceTask.produceTask.adjustActiveEdit._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(WOM.produceTask.produceTask.adjustActiveEdit._customCallBack) {
					eval(WOM.produceTask.produceTask.adjustActiveEdit._customCallBack);
					WOM.produceTask.produceTask.adjustActiveEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.produceTask.produceTask.adjustActiveEdit._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		WOM.produceTask.produceTask.adjustActiveEdit.getcallBackInfo_DG_IE = function(obj){
			if(WOM.produceTask.produceTask.adjustActiveEdit._customBeforeCallBack) {
				var flag = eval(WOM.produceTask.produceTask.adjustActiveEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = WOM.produceTask.produceTask.adjustActiveEdit.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( WOM.produceTask.produceTask.adjustActiveEdit._isObjCustomProp_IE == true && WOM.produceTask.produceTask.adjustActiveEdit._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,WOM.produceTask.produceTask.adjustActiveEdit._sUrl,WOM.produceTask.produceTask.adjustActiveEdit._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,WOM.produceTask.produceTask.adjustActiveEdit._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (WOM.produceTask.produceTask.adjustActiveEdit._isObjCustomProp_IE == true && WOM.produceTask.produceTask.adjustActiveEdit._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = WOM.produceTask.produceTask.adjustActiveEdit._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = WOM.produceTask.produceTask.adjustActiveEdit._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && WOM.produceTask.produceTask.adjustActiveEdit._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + WOM.produceTask.produceTask.adjustActiveEdit._refViewCode_IE + '&id=' + id,
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
				if(WOM.produceTask.produceTask.adjustActiveEdit._customCallBack) {
					eval(WOM.produceTask.produceTask.adjustActiveEdit._customCallBack);
					WOM.produceTask.produceTask.adjustActiveEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.produceTask.produceTask.adjustActiveEdit._dialog.close();
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
		
		WOM.produceTask.produceTask.adjustActiveEdit.getcallBackInfo_DG = function(obj){
			if(WOM.produceTask.produceTask.adjustActiveEdit._customBeforeCallBack) {
				var flag = eval(WOM.produceTask.produceTask.adjustActiveEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(WOM.produceTask.produceTask.adjustActiveEdit._currRow).next().length==0){
						WOM.produceTask.produceTask.adjustActiveEdit._oGrid.addNewRow();
					}	
					WOM.produceTask.produceTask.adjustActiveEdit._currRow = $(WOM.produceTask.produceTask.adjustActiveEdit._currRow).next();
					$(WOM.produceTask.produceTask.adjustActiveEdit._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(WOM.produceTask.produceTask.adjustActiveEdit._currRow,obj[i], WOM.produceTask.produceTask.adjustActiveEdit._prefix, WOM.produceTask.produceTask.adjustActiveEdit._sUrl);
				if (WOM.produceTask.produceTask.adjustActiveEdit._isObjCustomProp == true && WOM.produceTask.produceTask.adjustActiveEdit._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(WOM.produceTask.produceTask.adjustActiveEdit._currRow,WOM.produceTask.produceTask.adjustActiveEdit._prefix,obj[i],WOM.produceTask.produceTask.adjustActiveEdit._oGrid,WOM.produceTask.produceTask.adjustActiveEdit._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(WOM.produceTask.produceTask.adjustActiveEdit._currRow,WOM.produceTask.produceTask.adjustActiveEdit._prefix,obj[i],WOM.produceTask.produceTask.adjustActiveEdit._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + WOM.produceTask.produceTask.adjustActiveEdit._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + WOM.produceTask.produceTask.adjustActiveEdit._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && WOM.produceTask.produceTask.adjustActiveEdit._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + WOM.produceTask.produceTask.adjustActiveEdit._refViewCode + '&id=' + id,
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
									name = WOM.produceTask.produceTask.adjustActiveEdit._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(WOM.produceTask.produceTask.adjustActiveEdit._currRow, objs, WOM.produceTask.produceTask.adjustActiveEdit._oGrid);
							}
						}
					}
				}
			}
			try{
				if(WOM.produceTask.produceTask.adjustActiveEdit._customCallBack) {
					eval(WOM.produceTask.produceTask.adjustActiveEdit._customCallBack);
					WOM.produceTask.produceTask.adjustActiveEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.produceTask.produceTask.adjustActiveEdit._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + WOM.produceTask.produceTask.adjustActiveEdit._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		WOM.produceTask.produceTask.adjustActiveEdit.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(WOM.produceTask.produceTask.adjustActiveEdit._oGrid, WOM.produceTask.produceTask.adjustActiveEdit._currRow, WOM.produceTask.produceTask.adjustActiveEdit._key, WOM.produceTask.produceTask.adjustActiveEdit._displayFieldName, obj[i])
			}
			try{
				if(WOM.produceTask.produceTask.adjustActiveEdit._customCallBack) {
					eval(WOM.produceTask.produceTask.adjustActiveEdit._customCallBack);
					WOM.produceTask.produceTask.adjustActiveEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.produceTask.produceTask.adjustActiveEdit._dialog.close();
			} catch(e){}
		};
		
		WOM.produceTask.produceTask.adjustActiveEdit.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						WOM.produceTask.produceTask.adjustActiveEdit.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#WOM_produceTask_produceTask_adjustActiveEdit_form'));
						}
					}
				}
			});
		};

		$(function(){
			WOM.produceTask.produceTask.adjustActiveEdit.onloadForProduct();
			$("#edit-submit-btn,#edit-save-btn").hide()
processId = ${request.getParameter("processId")}
		});

		WOM.produceTask.produceTask.adjustActiveEdit.beforeSubmitMethodSettingInPage = function(){
			WOM.produceTask.produceTask.adjustActiveEdit.onsaveForProduct();
		};
		WOM.produceTask.produceTask.adjustActiveEdit.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  WOM.produceTask.produceTask.adjustActiveEdit.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		WOM.produceTask.produceTask.adjustActiveEdit.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#WOM_produceTask_produceTask_adjustActiveEdit_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#WOM_produceTask_produceTask_adjustActiveEdit_main_div").hide();
				},100);
				//CUI("#WOM_produceTask_produceTask_adjustActiveEdit_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		WOM.produceTask.produceTask.adjustActiveEdit.showThis = function(){
			if(!CUI("#WOM_produceTask_produceTask_adjustActiveEdit_main_div").is(':visible')) {
				CUI("#WOM_produceTask_produceTask_adjustActiveEdit_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		WOM.produceTask.produceTask.adjustActiveEdit.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			WOM.produceTask.produceTask.adjustActiveEdit.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "WOM_produceTask_produceTask_adjustActiveEdit_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=WOM&modelName=WOM_7.5.0.0_produceTask_ProduceTask&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.produceTask.produceTask.adjustActiveEdit.auditDialog.show();
			</#if>
		}
		
		
		WOM.produceTask.produceTask.adjustActiveEdit.showInfoDialog=function(mode){
			
			WOM.produceTask.produceTask.adjustActiveEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "WOM_produceTask_produceTask_adjustActiveEdit_dealInfo",
				modal:true,
				height:500,
				width: 950,//适应国际化版
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.produceTask.produceTask.adjustActiveEdit.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		WOM.produceTask.produceTask.adjustActiveEdit.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=WOM_7.5.0.0_produceTask");
			}
		}
		
		WOM.produceTask.produceTask.adjustActiveEdit.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/WOM/produceTask/produceTask/dealInfo-list.action&dlTableInfoId=${(produceTask.tableInfoId)?default('')}");
			}
		}
		WOM.produceTask.produceTask.adjustActiveEdit.showFlowInfo=function(){
		     //IE8环境下使用旧版flash流程展现页面，其他情况使用html5流程展现页面
		    var browser=navigator.appName; 
			var b_version=navigator.appVersion; 
			var version=b_version.split(";"); 
			var trim_Version=version[1]&&version[1].replace(/[ ]/g,"");
			var isIE8=(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE8.0")||($.browser.msie&&(Number($.browser.version)<= 8));//IE8兼容视图模式下浏览器版本判断逻辑补充
			if(CUI.trim(CUI("#flowDiv").html())==""){
				if(isIE8){
				    CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=WOM_7.5.0.0_produceTask_ProduceTask&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(produceTask.tableInfoId)?default('')}");
				}else{
				    CUI("#flowDiv").load("/ec/workflow/flowViewH5.action?env=runtime&modelCode=WOM_7.5.0.0_produceTask_ProduceTask&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(produceTask.tableInfoId)?default('')}");
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
		WOM.produceTask.produceTask.adjustActiveEdit.supervision=function(){
			WOM.produceTask.produceTask.adjustActiveEdit.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(produceTask.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				WOM.produceTask.produceTask.adjustActiveEdit.modifyOwnerStaffDialog.show();
		}
		





		/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_produceTask_adjustActiveEdit,js,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码
	var processId;
/* CUSTOM CODE END */
		WOM.produceTask.produceTask.adjustActiveEdit.onloadForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_produceTask_adjustActiveEdit,onloadForProduct,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		}

		WOM.produceTask.produceTask.adjustActiveEdit.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_produceTask_adjustActiveEdit,onsaveForProduct,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
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
				<div class="sidebar-top"><a href="#"  onclick="WOM.produceTask.produceTask.adjustActiveEdit.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="WOM.produceTask.produceTask.adjustActiveEdit.showBusinessList('${l.relatingModel.code.replace('.','')}',${(produceTask.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
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