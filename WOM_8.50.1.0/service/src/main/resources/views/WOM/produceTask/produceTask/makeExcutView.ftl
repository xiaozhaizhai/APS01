<!-- WOM_7.5.0.0/produceTask/makeExcutView -->
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
<#assign viewType = "readonly">
<#-- 实体对象 -->
<#assign tableObj = produceTask>
<#-- 命名空间 -->
<#assign editPageNs = "WOM.produceTask.produceTask.makeExcutView">
<#-- 模型名称-->
<#assign modelName = "produceTask">
<#-- 视图编码-->
<#assign viewCode = "WOM_7.5.0.0_produceTask_makeExcutView">
<#-- 实体编码-->
<#assign entity_code = "WOM_7.5.0.0_produceTask">
<#-- 视图名称-->
<#assign viewName = "makeExcutView">
<#-- datagrid编码-->
<#assign datagridCode = "WOM_produceTask_produceTask_makeExcutView_datagrids">
<#-- 首字母大写的模型名称-->
<#assign upcaseModelName = "ProduceTask">
<#-- 页面打印按钮 -->
<#assign isPrint = false>
<#-- 控件打印按钮 -->
<#assign controlPrint = false>
<#-- 是否只读 -->
<#assign allReadOnly = true>
<#-- 是否是参照视图 -->
<#assign isReference =false>
<#-- 是否可弃审 -->
<#assign retrialFlag = true>
<#-- formid -->
<#assign editFormId = "WOM_produceTask_produceTask_makeExcutView_form">
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
        <#assign configTitle = getText('WOM.viewtitle.randon1498733035457')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		
		#WOM_produceTask_produceTask_makeExcutView_form{float:left;width:100%;}
		
		
		</style>
		<script type="text/javascript">
			CUI.ns('WOM.produceTask.produceTask.makeExcutView');
			WOM.produceTask.produceTask.makeExcutView.currentUser = ${userJson};
			WOM.produceTask.produceTask.makeExcutView.currentStaff = ${staffJson};
			WOM.produceTask.produceTask.makeExcutView.currentDepartment = ${deptJson};
			WOM.produceTask.produceTask.makeExcutView.currentPosition = ${postJson};
			WOM.produceTask.produceTask.makeExcutView.currentCompany = ${compJson};
		</script>
		<!-- CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_produceTask_makeExcutView,head,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) -->
<!-- 自定义代码 -->
    <link rel="stylesheet" href="/bap/static/WOM/stepUtils/css/step.css">
    <style type="text/css">
        .cui-btn-gyfx {
            background: url('/bap/static/WOM/img/icon_347.png') no-repeat;
        }
        .cui-btn-ckst {
            background: url('/bap/static/WOM/img/icon_wlszyck.png') no-repeat;
        }
 		.cui-btn-sdtj {
            background: url('/bap/static/WOM/img/icon_87.png') no-repeat;
        }
    </style>
<!-- CUSTOM CODE END -->
    </head>
	<body class="view-edit ">
		<@loadpanel newType=true/>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="" onsubmitMethod="WOM.produceTask.produceTask.makeExcutView.beforeSubmitMethod()" id="WOM_produceTask_produceTask_makeExcutView_form" namespace="/WOM/produceTask/produceTask/makeExcutView" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=WOM_7.5.0.0_produceTask_ProduceTask&_bapFieldPermissonModelName_=ProduceTask&superEdit=${(superEdit!false)?string}" editPageNs="WOM.produceTask.produceTask.makeExcutView" callback="WOM.produceTask.produceTask.makeExcutView._callBackInfo" ecform="true">
			<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
			<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="WOM_produceTask_produceTask_makeExcutView_main_div">
			<div class="edit-head">
				<#include "../../../ec/tableInfo/operateheadbar_all.ftl" >
				<#include "../../../ec/tableInfo/creatorInfo.ftl" >
			</div>
    		<div class="edit-main" id="WOM_produceTask_produceTask_makeExcutView">
    			<div class="edit-content">
    	<#include "../../../ec/tableInfo/formparam.ftl" >				
		<div class="dash-line"></div>
<script type="text/javascript">
var attcountid = "WOM_produceTask_produceTask_makeExcutView_form"+"_attcount";
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
			
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/WOM/produceTask/produceTask/data-dg1498733248586.action?produceTask.id=${refId!-1}&refId=${refId!-1}&datagridCode=WOM_7.5.0.0_produceTask_makeExcutViewdg1498733248586">
			<#else>
				<#assign dUrl="/WOM/produceTask/produceTask/data-dg1498733248586.action?produceTask.id=${(produceTask.id)!-1}&datagridCode=WOM_7.5.0.0_produceTask_makeExcutViewdg1498733248586">
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
					<input type="hidden" id="dg_cp_info_ProdTaskProcExelog_dg1498733248586" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1498733248586_id" value="ProdTaskProcExelog_dg1498733248586" />
			
			<input type="hidden" id="dg1498733248586_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('WOM.modelname.randon1495777422447')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/WOM/produceTask/produceTask/data-dg1498733248586.action?operateType=export&datagridCode=WOM_7.5.0.0_produceTask_makeExcutViewdg1498733248586"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="ProdTaskProcExelog_dg1498733248586" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="ProdTaskProcExelog_dg1498733248586" viewType="${viewType}" renderOverEvent="dg1498733248586RenderOverEvent" route="${routeFlag}" formId="WOM_produceTask_produceTask_makeExcutView_form" noPermissionKeys="taskProcessID.name,taskProcessID.processType.name,taskProcessID.factoryId.name,taskProcessID.longTime,taskProcessID.processState,state,startTime,endTime" modelCode="WOM_7.5.0.0_produceTask_ProdTaskProcExelog" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1498733248586" dtPage="dgPage"  hidekeyPrefix="dg1498733248586" hidekey="['id','version','taskProcessID.id','taskProcessID.name','taskProcessID.id','taskProcessID.processType.name','taskProcessID.id','taskProcessID.factoryId.name','taskProcessID.id','taskProcessID.longTime','taskProcessID.id','taskProcessID.processState.id'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=false  buttons="${buttons}" noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1498733248586PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=false cannotDeleteRow=true assModelDisplayName=assModelDisplayName dgTitle="${getText('WOM.dataGriddataGridName.radion1505797207191')}" activexButton="" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign taskProcessID_name_displayDefaultType=''>
								<#assign taskProcessID_name_defaultValue=''>
										<#assign taskProcessID_name_defaultValue=''>
																	<#if (taskProcessID_name_defaultValue!)?string=="currentUser">
								<#assign taskProcessID_name_defaultValue='${staffJson!}'>
							<#elseif (taskProcessID_name_defaultValue!)?string=="currentPost">
								<#assign taskProcessID_name_defaultValue='${postJson!}'>
							<#elseif (taskProcessID_name_defaultValue!)?string=="currentDepart">
								<#assign taskProcessID_name_defaultValue='${deptJson!}'>
							<#elseif (taskProcessID_name_defaultValue!)?string=="currentComp">
								<#assign taskProcessID_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="taskProcessID.name"        showFormat="SELECTCOMP" defaultValue="${(taskProcessID_name_defaultValue!)?string}" defaultDisplay="${(taskProcessID_name_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.produceTask.produceTask.makeExcutView"  textalign="center"  viewUrl="/WOM/produceTask/produceTaskProcess/taskProcessRef.action" viewCode="WOM_7.5.0.0_produceTask_taskProcessRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1490685207348')}"  label="${getText('WOM.propertydisplayName.randon1489720649125')}" width=100 showFormatFunc=""  />
							<#assign taskProcessID_processType_name_displayDefaultType=''>
								<#assign taskProcessID_processType_name_defaultValue=''>
										<#assign taskProcessID_processType_name_defaultValue=''>
																	<#if (taskProcessID_processType_name_defaultValue!)?string=="currentUser">
								<#assign taskProcessID_processType_name_defaultValue='${staffJson!}'>
							<#elseif (taskProcessID_processType_name_defaultValue!)?string=="currentPost">
								<#assign taskProcessID_processType_name_defaultValue='${postJson!}'>
							<#elseif (taskProcessID_processType_name_defaultValue!)?string=="currentDepart">
								<#assign taskProcessID_processType_name_defaultValue='${deptJson!}'>
							<#elseif (taskProcessID_processType_name_defaultValue!)?string=="currentComp">
								<#assign taskProcessID_processType_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="taskProcessID.processType.name"        showFormat="TEXT" defaultValue="${(taskProcessID_processType_name_defaultValue!)?string}" defaultDisplay="${(taskProcessID_processType_name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.produceTask.produceTask.makeExcutView"  textalign="center"  viewUrl="/WOM/produceTask/produceTaskProcess/taskProcessRef.action" viewCode="WOM_7.5.0.0_produceTask_taskProcessRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1490685207348')}"  label="${getText('WOM.propertydisplayName.randon1489720664942')}" width=100 showFormatFunc=""  />
							<#assign taskProcessID_factoryId_name_displayDefaultType=''>
								<#assign taskProcessID_factoryId_name_defaultValue=''>
										<#assign taskProcessID_factoryId_name_defaultValue=''>
																	<#if (taskProcessID_factoryId_name_defaultValue!)?string=="currentUser">
								<#assign taskProcessID_factoryId_name_defaultValue='${staffJson!}'>
							<#elseif (taskProcessID_factoryId_name_defaultValue!)?string=="currentPost">
								<#assign taskProcessID_factoryId_name_defaultValue='${postJson!}'>
							<#elseif (taskProcessID_factoryId_name_defaultValue!)?string=="currentDepart">
								<#assign taskProcessID_factoryId_name_defaultValue='${deptJson!}'>
							<#elseif (taskProcessID_factoryId_name_defaultValue!)?string=="currentComp">
								<#assign taskProcessID_factoryId_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="taskProcessID.factoryId.name"        showFormat="TEXT" defaultValue="${(taskProcessID_factoryId_name_defaultValue!)?string}" defaultDisplay="${(taskProcessID_factoryId_name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.produceTask.produceTask.makeExcutView"  textalign="left"  viewUrl="/WOM/produceTask/produceTaskProcess/taskProcessExelogRef.action" viewCode="WOM_7.5.0.0_produceTask_taskProcessExelogRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1495700893633')}"  label="${getText('WOM.propertydisplayName.radion14192323937823455')}" width=100 showFormatFunc=""  />
							<#assign taskProcessID_longTime_displayDefaultType=''>
								<#assign taskProcessID_longTime_defaultValue=''>
										<#assign taskProcessID_longTime_defaultValue=''>
																	<#if (taskProcessID_longTime_defaultValue!)?string=="currentUser">
								<#assign taskProcessID_longTime_defaultValue='${staffJson!}'>
							<#elseif (taskProcessID_longTime_defaultValue!)?string=="currentPost">
								<#assign taskProcessID_longTime_defaultValue='${postJson!}'>
							<#elseif (taskProcessID_longTime_defaultValue!)?string=="currentDepart">
								<#assign taskProcessID_longTime_defaultValue='${deptJson!}'>
							<#elseif (taskProcessID_longTime_defaultValue!)?string=="currentComp">
								<#assign taskProcessID_longTime_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="taskProcessID.longTime"        showFormat="TEXT" defaultValue="${(taskProcessID_longTime_defaultValue!)?string}" defaultDisplay="${(taskProcessID_longTime_displayDefaultType!)?string}" decimal="6" editable=false type="DECIMAL" showType="decimal" notnull=false   selectCompName="WOM.produceTask.produceTask.makeExcutView"  textalign="right"  viewUrl="/WOM/produceTask/produceTaskProcess/taskProcessRef.action" viewCode="WOM_7.5.0.0_produceTask_taskProcessRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1490685207348')}"  label="${getText('WOM.propertydisplayName.randon1489720689233')}" width=100 showFormatFunc=""  />
							<#assign taskProcessID_processState_displayDefaultType=''>
								<#assign taskProcessID_processState_defaultValue='processState/state01'>
										<#assign taskProcessID_processState_defaultValue='processState/state01'>
																	<#if (taskProcessID_processState_defaultValue!)?string=="currentUser">
								<#assign taskProcessID_processState_defaultValue='${staffJson!}'>
							<#elseif (taskProcessID_processState_defaultValue!)?string=="currentPost">
								<#assign taskProcessID_processState_defaultValue='${postJson!}'>
							<#elseif (taskProcessID_processState_defaultValue!)?string=="currentDepart">
								<#assign taskProcessID_processState_defaultValue='${deptJson!}'>
							<#elseif (taskProcessID_processState_defaultValue!)?string=="currentComp">
								<#assign taskProcessID_processState_defaultValue='${compJson!}'>
							</#if>
									<@systemCodeColumn code="processState" textalign="center" defaultValue="${(taskProcessID_processState_defaultValue!)?string}" key="taskProcessID.processState.id" editable=false type="selectcomp" notnull=false     label="${getText('WOM.propertydisplayName.randon1540798261838')}" width=100 hiddenCol=true  />
							<#assign state_displayDefaultType=''>
								<#assign state_defaultValue=''>
										<#assign state_defaultValue=''>
										 									<@systemCodeColumn code="womProActiveType" textalign="center" defaultValue="${(state_defaultValue!)?string}" key="state.id" editable=false type="selectcomp" notnull=false     label="${getText('WOM.201903271915')}" width=100   />
							<#assign startTime_displayDefaultType=''>
								<#assign startTime_defaultValue=''>
										<#assign startTime_defaultValue=''>
										 								<#if (startTime_defaultValue)?? &&(startTime_defaultValue)?has_content>
									<#assign startTime_defaultValue  = getDefaultDateTime(startTime_defaultValue!)?datetime>
								</#if>

									<@datacolumn key="startTime"        showFormat="YMD_HMS" defaultValue="${(startTime_defaultValue!)?string}" defaultDisplay="${(startTime_displayDefaultType!)?string}" decimal="" editable=false type="datetime" showType="datetime" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1495777911979')}" width=175 showFormatFunc=""  />
							<#assign endTime_displayDefaultType=''>
								<#assign endTime_defaultValue=''>
										<#assign endTime_defaultValue=''>
										 								<#if (endTime_defaultValue)?? &&(endTime_defaultValue)?has_content>
									<#assign endTime_defaultValue  = getDefaultDateTime(endTime_defaultValue!)?datetime>
								</#if>

									<@datacolumn key="endTime"        showFormat="YMD_HMS" defaultValue="${(endTime_defaultValue!)?string}" defaultDisplay="${(endTime_displayDefaultType!)?string}" decimal="" editable=false type="datetime" showType="datetime" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1495852960311')}" width=175 showFormatFunc=""  />
			
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
				function ProdTaskProcExelog_dg1498733248586_check_datagridvalid(){
					//
					var errorObj =ProdTaskProcExelog_dg1498733248586Widget._DT.testData();
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
				
				function savedg1498733248586DataGrid(){
					<#if  refId?? && (refId gt 0)>
					ProdTaskProcExelog_dg1498733248586Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('ProdTaskProcExelog_dg1498733248586Widget') > -1) {
						ProdTaskProcExelog_dg1498733248586Widget.setAllRowEdited();
					}
					var json = ProdTaskProcExelog_dg1498733248586Widget.parseEditedData();
					$('input[name="dg1498733248586ListJson"]').remove();
					$('input[name="dgLists[\'dg1498733248586\']"]').remove();
					$('input[name="dg1498733248586ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1498733248586\']">').val(json).appendTo($('#WOM_produceTask_produceTask_makeExcutView_form'));
					$('<input type="hidden" name="dg1498733248586ModelCode">').val('WOM_7.5.0.0_produceTask_ProdTaskProcExelog').appendTo($('#WOM_produceTask_produceTask_makeExcutView_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1498733248586ListJson">').val(json).appendTo($('#WOM_produceTask_produceTask_makeExcutView_form'));
				}
				function DT_ProdTaskProcExelog_dg1498733248586_deldatagrid(){
					var deleteRows = ProdTaskProcExelog_dg1498733248586Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','taskID.id','taskProcessID.id','factoryID.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1498733248586DeletedIds").length>0){
							$("#dg1498733248586DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1498733248586DeletedIds" name="dgDeletedIds[\'dg1498733248586\']" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_makeExcutView_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1498733248586DeletedIds['+CUI('input[name^="dg1498733248586DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_makeExcutView_form'));
					});
					return deleteRows;
				}
				function DT_ProdTaskProcExelog_dg1498733248586_delTreeNodes(){
					var deleteRows = ProdTaskProcExelog_dg1498733248586Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','taskID.id','taskProcessID.id','factoryID.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1498733248586DeletedIds").length>0){
							$("#dg1498733248586DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1498733248586DeletedIds" name="dgDeletedIds[\'dg1498733248586\']" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_makeExcutView_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1498733248586DeletedIds['+CUI('input[name^="dg1498733248586DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_makeExcutView_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('WOM_produceTask_produceTask_makeExcutView_datagrids');
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
							if(datagrids[0][i] == 'ProdTaskProcExelog_dg1498733248586') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'ProdTaskProcExelog_dg1498733248586';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'ProdTaskProcExelog_dg1498733248586';
					}
					$('body').data('WOM_produceTask_produceTask_makeExcutView_datagrids', datagrids);
				});
				
				var ProdTaskProcExelog_dg1498733248586_importDialog = null;
				function ProdTaskProcExelog_dg1498733248586_showImportDialog(){
					try{
						if(ProdTaskProcExelog_dg1498733248586_importDialog!=null&&ProdTaskProcExelog_dg1498733248586_importDialog.isShow==1){
							return false;
						}
						var url = "/WOM/produceTask/produceTask/initImport.action?datagridCode=WOM_7.5.0.0_produceTask_makeExcutViewdg1498733248586&tid=${id!}&datagridName=dg1498733248586";
							<#if canImportExcel>
								var buttonCode="WOM_7.5.0.0_produceTask_makeExcutViewdg1498733248586_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						ProdTaskProcExelog_dg1498733248586_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("ProdTaskProcExelog_dg1498733248586"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();ProdTaskProcExelog_dg1498733248586_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();ProdTaskProcExelog_dg1498733248586_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						ProdTaskProcExelog_dg1498733248586_importDialog.show();
					}catch(e){}
				}	
				
				function ProdTaskProcExelog_dg1498733248586_downLoadFile(){
					var url = "/WOM/produceTask/produceTask/downLoad.action?datagridCode=WOM_7.5.0.0_produceTask_makeExcutViewdg1498733248586&templateRelatedModelCode=WOM_7.5.0.0_produceTask_makeExcutViewdg1498733248586&downloadType=template&fileName=dg1498733248586";
					window.open(url,"","");
				}
				function dg1498733248586RenderOverEvent(){
				}
				function dg1498733248586PageInitMethod(nTabIndex){
					WOM.produceTask.produceTask.makeExcutView.initSize(nTabIndex);
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
								<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_produceTask_ProdTaskActiExelog", "WOM_7.5.0.0_produceTask_makeExcutViewdg1498733279732", "DATAGRID", "prodTaskActiExelog")>
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
			
								<script type="text/javascript">
									function ProdTaskActiExelog_dg1498733279732_proAnl(event)
																		{
	var data = JSON.parse(ProdTaskActiExelog_dg1498733279732Widget.getAllRowData())
	var selectedRow = data[ProdTaskActiExelog_dg1498733279732Widget.getSelectedRow()];

	var selectedRows = ProdTaskActiExelog_dg1498733279732Widget.getSelectedRow();

	if(ProdTaskActiExelog_dg1498733279732Widget.getSelectedRow()!= undefined){
		var activeId =  '';
		var batchNo =  selectedRow.batchNum;
		var startTime =  selectedRow.startTime;
		var endTime =  selectedRow.endTime;
		var activeName = selectedRow.activeName;
		var mappingType = 'batchKinds/active';

		var statisticsFlag =  selectedRow.statisticsFlag;
		var id = selectedRow.id;	
		if(selectedRow.isAnaly == 'true'){
				var url="/processAnl/processDetail/procRecord/editDetailWOM.action?entityCode=processAnl_1.0.0_processModelSet&id="+encodeURI(id)+"&mappingKey="+encodeURI(id)+"&mappingType="+encodeURI(mappingType)+"&activeId="+encodeURI(activeId)+"&batchNo="+encodeURI(batchNo)+"&startTime="+encodeURI(startTime)+"&endTime="+encodeURI(endTime)+"&activeName="+encodeURI(activeName)+"&__pc__=cHJvY2Vzc01vZGVsTGlzdF9uZXdfYWRkX3Byb2Nlc3NBbmxfMS4wLjBfcHJvY2Vzc01vZGVsU2V0X3Byb2Nlc3NNb2RlbExpc3R8";
				openFullScreen(url); 
		}else{
		console.log("bbbb");	
	workbenchErrorBarWidget.showMessage('该活动尚未统计工艺或该活动统计工艺失败');
				//workbenchErrorBarWidget.showMessage(\"${getText('batchManag.errorMessage.radion201608310953')}\");
			return false;
		}

	}else{
		workbenchErrorBarWidget.showMessage('请选择一条记录进行操作');
		return false;
	}    
}
								</script>
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/WOM/produceTask/produceTask/data-dg1498733279732.action?produceTask.id=${refId!-1}&refId=${refId!-1}&datagridCode=WOM_7.5.0.0_produceTask_makeExcutViewdg1498733279732">
			<#else>
				<#assign dUrl="/WOM/produceTask/produceTask/data-dg1498733279732.action?produceTask.id=${(produceTask.id)!-1}&datagridCode=WOM_7.5.0.0_produceTask_makeExcutViewdg1498733279732">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('WOM.buttonPropertyshowName.radion1543546355790')}\",handler:function(event){ProdTaskActiExelog_dg1498733279732_proAnl(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('WOM.buttonPropertyshowName.radion1543546355790')}\",handler:function(event){ProdTaskActiExelog_dg1498733279732_proAnl(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_ProdTaskActiExelog_dg1498733279732" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1498733279732_id" value="ProdTaskActiExelog_dg1498733279732" />
			
			<input type="hidden" id="dg1498733279732_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('WOM.modelname.randon1495778243721')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/WOM/produceTask/produceTask/data-dg1498733279732.action?operateType=export&datagridCode=WOM_7.5.0.0_produceTask_makeExcutViewdg1498733279732"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="ProdTaskActiExelog_dg1498733279732" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="ProdTaskActiExelog_dg1498733279732" viewType="${viewType}" renderOverEvent="dg1498733279732RenderOverEvent" route="${routeFlag}" formId="WOM_produceTask_produceTask_makeExcutView_form" noPermissionKeys="taskProcessID.name,activeName,activeType,isPassCheck,finalInspection,dataSource,activeSource,productID.productCode,productID.productName,productNum,planNum,actualNum,taskActiveID.activeState,activeBatchStateID.name,checkResult,checkResultID,rejectsDealID,startTime,endTime,isFinish,formularActice.isAnaly,isAnaly,remark" modelCode="WOM_7.5.0.0_produceTask_ProdTaskActiExelog" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1498733279732" dtPage="dgPage"  hidekeyPrefix="dg1498733279732" hidekey="['id','version','taskProcessID.id','taskProcessID.name','productID.id','productID.productCode','productID.id','productID.productName','taskActiveID.id','taskActiveID.activeState.id','activeBatchStateID.id','activeBatchStateID.name','formularActice.id','formularActice.isAnaly'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=false  buttons="${buttons}" noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1498733279732PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=false cannotDeleteRow=true assModelDisplayName=assModelDisplayName dgTitle="${getText('WOM.dataGriddataGridName.radion1505797233606')}" activexButton="WOM.buttonPropertyshowName.radion1543546355790,proAnl,add" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign taskProcessID_name_displayDefaultType=''>
								<#assign taskProcessID_name_defaultValue=''>
										<#assign taskProcessID_name_defaultValue=''>
																	<#if (taskProcessID_name_defaultValue!)?string=="currentUser">
								<#assign taskProcessID_name_defaultValue='${staffJson!}'>
							<#elseif (taskProcessID_name_defaultValue!)?string=="currentPost">
								<#assign taskProcessID_name_defaultValue='${postJson!}'>
							<#elseif (taskProcessID_name_defaultValue!)?string=="currentDepart">
								<#assign taskProcessID_name_defaultValue='${deptJson!}'>
							<#elseif (taskProcessID_name_defaultValue!)?string=="currentComp">
								<#assign taskProcessID_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="taskProcessID.name"        showFormat="SELECTCOMP" defaultValue="${(taskProcessID_name_defaultValue!)?string}" defaultDisplay="${(taskProcessID_name_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.produceTask.produceTask.makeExcutView"  textalign="left"  viewUrl="/WOM/produceTask/produceTaskProcess/taskProcessRef.action" viewCode="WOM_7.5.0.0_produceTask_taskProcessRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1490685207348')}"  label="${getText('WOM.propertydisplayName.randon1489720649125')}" width=80 showFormatFunc=""  />
							<#assign activeName_displayDefaultType=''>
								<#assign activeName_defaultValue=''>
										<#assign activeName_defaultValue=''>
										 
									<@datacolumn key="activeName"        showFormat="TEXT" defaultValue="${(activeName_defaultValue!)?string}" defaultDisplay="${(activeName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1509414632809')}" width=80 showFormatFunc=""  />
							<#assign activeType_displayDefaultType=''>
								<#assign activeType_defaultValue=''>
										<#assign activeType_defaultValue=''>
										 									<@systemCodeColumn code="activeType" textalign="center" defaultValue="${(activeType_defaultValue!)?string}" key="activeType.id" editable=false type="selectcomp" notnull=false     label="${getText('WOM.propertydisplayName.randon1496885739673')}" width=80   />
							<#assign isPassCheck_displayDefaultType=''>
								<#assign isPassCheck_defaultValue=''>
										<#assign isPassCheck_defaultValue=''>
										 
									<@datacolumn key="isPassCheck"        showFormat="CHECKBOX" defaultValue="${(isPassCheck_defaultValue!)?string}" defaultDisplay="${(isPassCheck_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon150941445567577')}" width=60 showFormatFunc=""  />
							<#assign finalInspection_displayDefaultType=''>
								<#assign finalInspection_defaultValue=''>
										<#assign finalInspection_defaultValue=''>
										 
									<@datacolumn key="finalInspection"        showFormat="CHECKBOX" defaultValue="${(finalInspection_defaultValue!)?string}" defaultDisplay="${(finalInspection_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1509414528360')}" width=60 showFormatFunc=""  />
							<#assign dataSource_displayDefaultType=''>
								<#assign dataSource_defaultValue=''>
										<#assign dataSource_defaultValue=''>
										 									<@systemCodeColumn code="RMsystem" textalign="center" defaultValue="${(dataSource_defaultValue!)?string}" key="dataSource.id" editable=false type="selectcomp" notnull=false     label="${getText('WOM.propertydisplayName.randon1495786231888')}" width=80   />
							<#assign activeSource_displayDefaultType=''>
								<#assign activeSource_defaultValue=''>
										<#assign activeSource_defaultValue=''>
										 									<@systemCodeColumn code="womActiveSource" textalign="center" defaultValue="${(activeSource_defaultValue!)?string}" key="activeSource.id" editable=false type="selectcomp" notnull=false     label="${getText('WOM.propertydisplayName.randon1509676150205')}" width=80   />
							<#assign productID_productCode_displayDefaultType=''>
								<#assign productID_productCode_defaultValue=''>
										<#assign productID_productCode_defaultValue=''>
																	<#if (productID_productCode_defaultValue!)?string=="currentUser">
								<#assign productID_productCode_defaultValue='${staffJson!}'>
							<#elseif (productID_productCode_defaultValue!)?string=="currentPost">
								<#assign productID_productCode_defaultValue='${postJson!}'>
							<#elseif (productID_productCode_defaultValue!)?string=="currentDepart">
								<#assign productID_productCode_defaultValue='${deptJson!}'>
							<#elseif (productID_productCode_defaultValue!)?string=="currentComp">
								<#assign productID_productCode_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="productID.productCode"        showFormat="SELECTCOMP" defaultValue="${(productID_productCode_defaultValue!)?string}" defaultDisplay="${(productID_productCode_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.produceTask.produceTask.makeExcutView"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('WOM.propertydisplayName.randon1502676745355')}" width=80 showFormatFunc=""  />
							<#assign productID_productName_displayDefaultType=''>
								<#assign productID_productName_defaultValue=''>
										<#assign productID_productName_defaultValue=''>
																	<#if (productID_productName_defaultValue!)?string=="currentUser">
								<#assign productID_productName_defaultValue='${staffJson!}'>
							<#elseif (productID_productName_defaultValue!)?string=="currentPost">
								<#assign productID_productName_defaultValue='${postJson!}'>
							<#elseif (productID_productName_defaultValue!)?string=="currentDepart">
								<#assign productID_productName_defaultValue='${deptJson!}'>
							<#elseif (productID_productName_defaultValue!)?string=="currentComp">
								<#assign productID_productName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="productID.productName"        showFormat="TEXT" defaultValue="${(productID_productName_defaultValue!)?string}" defaultDisplay="${(productID_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.produceTask.produceTask.makeExcutView"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('WOM.propertydisplayName.radion1415772740737455')}" width=80 showFormatFunc=""  />
							<#assign productNum_displayDefaultType=''>
								<#assign productNum_defaultValue=''>
										<#assign productNum_defaultValue=''>
										 
									<@datacolumn key="productNum"        showFormat="TEXT" defaultValue="${(productNum_defaultValue!)?string}" defaultDisplay="${(productNum_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1495778711921')}" width=80 showFormatFunc=""  />
							<#assign planNum_displayDefaultType=''>
								<#assign planNum_defaultValue=''>
										<#assign planNum_defaultValue=''>
										 
									<@datacolumn key="planNum"        showFormat="TEXT" defaultValue="${(planNum_defaultValue!)?string}" defaultDisplay="${(planNum_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1495788715231')}" width=80 showFormatFunc=""  />
							<#assign actualNum_displayDefaultType=''>
								<#assign actualNum_defaultValue=''>
										<#assign actualNum_defaultValue=''>
										 
									<@datacolumn key="actualNum"        showFormat="TEXT" defaultValue="${(actualNum_defaultValue!)?string}" defaultDisplay="${(actualNum_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1495788684389')}" width=80 showFormatFunc=""  />
							<#assign taskActiveID_activeState_displayDefaultType=''>
								<#assign taskActiveID_activeState_defaultValue='processState/state01'>
										<#assign taskActiveID_activeState_defaultValue='processState/state01'>
																	<#if (taskActiveID_activeState_defaultValue!)?string=="currentUser">
								<#assign taskActiveID_activeState_defaultValue='${staffJson!}'>
							<#elseif (taskActiveID_activeState_defaultValue!)?string=="currentPost">
								<#assign taskActiveID_activeState_defaultValue='${postJson!}'>
							<#elseif (taskActiveID_activeState_defaultValue!)?string=="currentDepart">
								<#assign taskActiveID_activeState_defaultValue='${deptJson!}'>
							<#elseif (taskActiveID_activeState_defaultValue!)?string=="currentComp">
								<#assign taskActiveID_activeState_defaultValue='${compJson!}'>
							</#if>
									<@systemCodeColumn code="processState" textalign="center" defaultValue="${(taskActiveID_activeState_defaultValue!)?string}" key="taskActiveID.activeState.id" editable=false type="selectcomp" notnull=false     label="${getText('WOM.propertydisplayName.randon1540798457415')}" width=100 hiddenCol=true  />
							<#assign activeBatchStateID_name_displayDefaultType=''>
								<#assign activeBatchStateID_name_defaultValue=''>
										<#assign activeBatchStateID_name_defaultValue=''>
																	<#if (activeBatchStateID_name_defaultValue!)?string=="currentUser">
								<#assign activeBatchStateID_name_defaultValue='${staffJson!}'>
							<#elseif (activeBatchStateID_name_defaultValue!)?string=="currentPost">
								<#assign activeBatchStateID_name_defaultValue='${postJson!}'>
							<#elseif (activeBatchStateID_name_defaultValue!)?string=="currentDepart">
								<#assign activeBatchStateID_name_defaultValue='${deptJson!}'>
							<#elseif (activeBatchStateID_name_defaultValue!)?string=="currentComp">
								<#assign activeBatchStateID_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="activeBatchStateID.name"        showFormat="SELECTCOMP" defaultValue="${(activeBatchStateID_name_defaultValue!)?string}" defaultDisplay="${(activeBatchStateID_name_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.produceTask.produceTask.makeExcutView"  textalign="left" hiddenCol=true viewUrl="/publicSet/activeAndBatchState/actBatState/activeBatchStateRef.action" viewCode="publicSet_1.0_activeAndBatchState_activeBatchStateRef" mneenable=false crossCompany=false viewTitle="${getText('publicSet.viewtitle.randon1509430526337')}"  label="${getText('WOM.propertydisplayName.randon15094279554246')}" width=120 showFormatFunc=""  />
							<#assign checkResult_displayDefaultType=''>
								<#assign checkResult_defaultValue=''>
										<#assign checkResult_defaultValue=''>
										 
									<@datacolumn key="checkResult"        showFormat="TEXT" defaultValue="${(checkResult_defaultValue!)?string}" defaultDisplay="${(checkResult_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1509414588866')}" width=80 showFormatFunc=""  />
							<#assign checkResultID_displayDefaultType=''>
								<#assign checkResultID_defaultValue=''>
										<#assign checkResultID_defaultValue=''>
										 
									<@datacolumn key="checkResultID"        showFormat="TEXT" defaultValue="${(checkResultID_defaultValue!)?string}" defaultDisplay="${(checkResultID_displayDefaultType!)?string}" decimal="" editable=false type="long" showType="long" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1509592075545')}" width=80 showFormatFunc="manu_checkInfo"  />
							<#assign rejectsDealID_displayDefaultType=''>
								<#assign rejectsDealID_defaultValue=''>
										<#assign rejectsDealID_defaultValue=''>
										 
									<@datacolumn key="rejectsDealID"        showFormat="TEXT" defaultValue="${(rejectsDealID_defaultValue!)?string}" defaultDisplay="${(rejectsDealID_displayDefaultType!)?string}" decimal="" editable=false type="long" showType="long" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1509592106077')}" width=80 showFormatFunc="deal_checkInfo"  />
							<#assign startTime_displayDefaultType=''>
								<#assign startTime_defaultValue=''>
										<#assign startTime_defaultValue=''>
										 								<#if (startTime_defaultValue)?? &&(startTime_defaultValue)?has_content>
									<#assign startTime_defaultValue  = getDefaultDateTime(startTime_defaultValue!)?datetime>
								</#if>

									<@datacolumn key="startTime"        showFormat="YMD_HMS" defaultValue="${(startTime_defaultValue!)?string}" defaultDisplay="${(startTime_displayDefaultType!)?string}" decimal="" editable=false type="datetime" showType="datetime" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1495778838166')}" width=175 showFormatFunc=""  />
							<#assign endTime_displayDefaultType=''>
								<#assign endTime_defaultValue=''>
										<#assign endTime_defaultValue=''>
										 								<#if (endTime_defaultValue)?? &&(endTime_defaultValue)?has_content>
									<#assign endTime_defaultValue  = getDefaultDateTime(endTime_defaultValue!)?datetime>
								</#if>

									<@datacolumn key="endTime"        showFormat="YMD_HMS" defaultValue="${(endTime_defaultValue!)?string}" defaultDisplay="${(endTime_displayDefaultType!)?string}" decimal="" editable=false type="datetime" showType="datetime" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1495852239409')}" width=175 showFormatFunc=""  />
							<#assign isFinish_displayDefaultType=''>
								<#assign isFinish_defaultValue=''>
										<#assign isFinish_defaultValue=''>
										 
									<@datacolumn key="isFinish"        showFormat="CHECKBOX" defaultValue="${(isFinish_defaultValue!)?string}" defaultDisplay="${(isFinish_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1496885957793')}" width=60 showFormatFunc=""  />
							<#assign formularActice_isAnaly_displayDefaultType=''>
								<#assign formularActice_isAnaly_defaultValue=''>
										<#assign formularActice_isAnaly_defaultValue=''>
																	<#if (formularActice_isAnaly_defaultValue!)?string=="currentUser">
								<#assign formularActice_isAnaly_defaultValue='${staffJson!}'>
							<#elseif (formularActice_isAnaly_defaultValue!)?string=="currentPost">
								<#assign formularActice_isAnaly_defaultValue='${postJson!}'>
							<#elseif (formularActice_isAnaly_defaultValue!)?string=="currentDepart">
								<#assign formularActice_isAnaly_defaultValue='${deptJson!}'>
							<#elseif (formularActice_isAnaly_defaultValue!)?string=="currentComp">
								<#assign formularActice_isAnaly_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="formularActice.isAnaly"        showFormat="SELECTCOMP" defaultValue="${(formularActice_isAnaly_defaultValue!)?string}" defaultDisplay="${(formularActice_isAnaly_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="selectcomp" notnull=false   selectCompName="WOM.produceTask.produceTask.makeExcutView"  textalign="center"  viewUrl="/RM/formula/formulaProcessActive/activeCheckRef.action" viewCode="RM_7.5.0.0_formula_activeCheckRef" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1497922173328')}"  label="${getText('RM.propertydisplayName.randon1543321671519')}" width=100 showFormatFunc=""  />
							<#assign isAnaly_displayDefaultType=''>
								<#assign isAnaly_defaultValue=''>
										<#assign isAnaly_defaultValue=''>
										 
									<@datacolumn key="isAnaly"        showFormat="CHECKBOX" defaultValue="${(isAnaly_defaultValue!)?string}" defaultDisplay="${(isAnaly_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1543321974645')}" width=100 showFormatFunc=""  />
							<#assign remark_displayDefaultType=''>
								<#assign remark_defaultValue=''>
										<#assign remark_defaultValue=''>
										 
									<@datacolumn key="remark"        showFormat="TEXT" defaultValue="${(remark_defaultValue!)?string}" defaultDisplay="${(remark_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1495779312198')}" width=100 showFormatFunc=""  />
							<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_produceTask_ProdTaskActiExelog", "WOM_7.5.0.0_produceTask_makeExcutViewdg1498733279732", "DATAGRID", "prodTaskActiExelog")>
							<#-- 排布自定义字段 -->
							<#list customPropViewMappings as cpvm>
								<#assign cpvmColumnType = cpvm.property.type>
								<#assign cpvmKey = cpvm.propertyLayRec>
								<#assign cpvmType = cpvmColumnType?lower_case>
								
								<#assign cpEditable = false>
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
											<#assign selectCompName = 'WOM.produceTask.produceTask.makeExcutView'>
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
					function manu_checkInfo(value,nRow){
     var showdata="";
     if((""+value).length>0 ){
		showdata="查看";
	 }
  return "<a onclick='checkManuReportRef($(this).parents(\"tr\").eq(0).index())'><span onmouseover=\"this.style.color='#f00'\" onmouseout=\"this.style.color='#3366CC'\" style='text-decoration:underline;color:#3366CC;cursor:pointer'>"+showdata+"</span></a>";
};;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					function deal_checkInfo(value,nRow){
    var showdata="";
     if((""+value).length>0 ){
		showdata="查看";
	 }
  return "<a onclick='checkDealReportRef($(this).parents(\"tr\").eq(0).index())'><span onmouseover=\"this.style.color='#f00'\" onmouseout=\"this.style.color='#3366CC'\" style='text-decoration:underline;color:#3366CC;cursor:pointer'>"+showdata+"</span></a>";
};;
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
				function ProdTaskActiExelog_dg1498733279732_check_datagridvalid(){
					//
					var errorObj =ProdTaskActiExelog_dg1498733279732Widget._DT.testData();
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
				
				function savedg1498733279732DataGrid(){
					<#if  refId?? && (refId gt 0)>
					ProdTaskActiExelog_dg1498733279732Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('ProdTaskActiExelog_dg1498733279732Widget') > -1) {
						ProdTaskActiExelog_dg1498733279732Widget.setAllRowEdited();
					}
					var json = ProdTaskActiExelog_dg1498733279732Widget.parseEditedData();
					$('input[name="dg1498733279732ListJson"]').remove();
					$('input[name="dgLists[\'dg1498733279732\']"]').remove();
					$('input[name="dg1498733279732ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1498733279732\']">').val(json).appendTo($('#WOM_produceTask_produceTask_makeExcutView_form'));
					$('<input type="hidden" name="dg1498733279732ModelCode">').val('WOM_7.5.0.0_produceTask_ProdTaskActiExelog').appendTo($('#WOM_produceTask_produceTask_makeExcutView_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1498733279732ListJson">').val(json).appendTo($('#WOM_produceTask_produceTask_makeExcutView_form'));
				}
				function DT_ProdTaskActiExelog_dg1498733279732_deldatagrid(){
					var deleteRows = ProdTaskActiExelog_dg1498733279732Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','taskID.id','productID.id','waitPutinRecordID.id','taskProcessID.id','taskActiveID.id','staffID.id','factoryID.id','processExeLog.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1498733279732DeletedIds").length>0){
							$("#dg1498733279732DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1498733279732DeletedIds" name="dgDeletedIds[\'dg1498733279732\']" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_makeExcutView_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1498733279732DeletedIds['+CUI('input[name^="dg1498733279732DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_makeExcutView_form'));
					});
					return deleteRows;
				}
				function DT_ProdTaskActiExelog_dg1498733279732_delTreeNodes(){
					var deleteRows = ProdTaskActiExelog_dg1498733279732Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','taskID.id','productID.id','waitPutinRecordID.id','taskProcessID.id','taskActiveID.id','staffID.id','factoryID.id','processExeLog.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1498733279732DeletedIds").length>0){
							$("#dg1498733279732DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1498733279732DeletedIds" name="dgDeletedIds[\'dg1498733279732\']" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_makeExcutView_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1498733279732DeletedIds['+CUI('input[name^="dg1498733279732DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_makeExcutView_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('WOM_produceTask_produceTask_makeExcutView_datagrids');
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
							if(datagrids[0][i] == 'ProdTaskActiExelog_dg1498733279732') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'ProdTaskActiExelog_dg1498733279732';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'ProdTaskActiExelog_dg1498733279732';
					}
					$('body').data('WOM_produceTask_produceTask_makeExcutView_datagrids', datagrids);
				});
				
				var ProdTaskActiExelog_dg1498733279732_importDialog = null;
				function ProdTaskActiExelog_dg1498733279732_showImportDialog(){
					try{
						if(ProdTaskActiExelog_dg1498733279732_importDialog!=null&&ProdTaskActiExelog_dg1498733279732_importDialog.isShow==1){
							return false;
						}
						var url = "/WOM/produceTask/produceTask/initImport.action?datagridCode=WOM_7.5.0.0_produceTask_makeExcutViewdg1498733279732&tid=${id!}&datagridName=dg1498733279732";
							<#if canImportExcel>
								var buttonCode="WOM_7.5.0.0_produceTask_makeExcutViewdg1498733279732_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						ProdTaskActiExelog_dg1498733279732_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("ProdTaskActiExelog_dg1498733279732"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();ProdTaskActiExelog_dg1498733279732_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();ProdTaskActiExelog_dg1498733279732_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						ProdTaskActiExelog_dg1498733279732_importDialog.show();
					}catch(e){}
				}	
				
				function ProdTaskActiExelog_dg1498733279732_downLoadFile(){
					var url = "/WOM/produceTask/produceTask/downLoad.action?datagridCode=WOM_7.5.0.0_produceTask_makeExcutViewdg1498733279732&templateRelatedModelCode=WOM_7.5.0.0_produceTask_makeExcutViewdg1498733279732&downloadType=template&fileName=dg1498733279732";
					window.open(url,"","");
				}
				function dg1498733279732RenderOverEvent(){
					$('.paginatorbar-operatebar').eq(1).append('<a href="javascript:makeRejectsDeal()"><span id="makeRejectsDeal" class="buttonbar-button cui-btn-edit">不良品处理</span></a>');
$.ajax({
    url : "/RM/formula/formula/getSynchronData.action",
    type : "get",
    dataType : "json",
    success : function(data){
        var IsOpen = JSON.stringify(data.result);
        if(IsOpen == 'false'){
            $(".paginatorbar-operatebar a").eq(0).hide();
             $( 'td[key="isAnaly"]').hide();$( 'td[key="formularActice.isAnaly"]').hide();
            ProdTaskActiExelog_dg1498733279732Widget._DT._resizeHeight = true;  
            ProdTaskActiExelog_dg1498733279732Widget._DT._initDomElements();
            ProdTaskActiExelog_dg1498733279732Widget._DT._resizeHeight = false; 
        }
    }
})
				}
				function dg1498733279732PageInitMethod(nTabIndex){
					WOM.produceTask.produceTask.makeExcutView.initSize(nTabIndex);
					$.ajax({
    url : "/RM/formula/formula/getSynchronData.action",
    type : "get",
    dataType : "json",
    async : false,
    success : function(data){
		$("#ProdTaskActiExelog_dg1498733279732 .paginatorbar-operatebar span:eq(0)").attr('class','buttonbar-button cui-btn-ckst');
		$("#ProdTaskActiExelog_dg1498733279732 .paginatorbar-operatebar span:eq(1)").attr('class','buttonbar-button cui-btn-ckst');
        var IsOpen = JSON.stringify(data.result);
        if(IsOpen == 'false'){
            $(".paginatorbar-operatebar a").eq(0).hide();
        }else{
			$("#ProdTaskActiExelog_dg1498733279732 .paginatorbar-operatebar span:eq(0)").attr('class','buttonbar-button cui-btn-ckst');
		}
    }
});
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
     	
		<div id="WOM_produceTask_produceTask_makeExcutView_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<#if ((produceTask.effectiveState)!0) == 0>
				<#if !(superEdit!false)>
				<li id="flowHead" onclick="WOM.produceTask.produceTask.makeExcutView.showFlowInfo('flow')"><span class="icon_prograss"></span>${getText("ec.flow.flowImage")}</li>
				</#if>
				</#if>
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="WOM.produceTask.produceTask.makeExcutView.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
				<li id="dealInfoHead" class="bar" onclick="WOM.produceTask.produceTask.makeExcutView.showDealInfo('dealInfo')"><span class="icon_handle"></span>${getText("ec.view.dealadvice")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<#if ((produceTask.effectiveState)!0) == 0>
				<#if !(superEdit!false)>
				<div class="flow-height wid" id="flowDiv"></div>
				</#if>
				</#if>
				<div id="fileUploadDiv" class="wid-hei"></div>
				<div style="padding:1px 0px 0px 0px;" id="dealInfoDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_produceTask_makeExcutView,html,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) -->
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
						$("#WOM_produceTask_produceTask_makeExcutView_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#WOM_produceTask_produceTask_makeExcutView_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#WOM_produceTask_produceTask_makeExcutView_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#WOM_produceTask_produceTask_makeExcutView_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			WOM.produceTask.produceTask.makeExcutView.initCount = 0;
			WOM.produceTask.produceTask.makeExcutView.initSize = function(nTabIndex){
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
				var conHeight = h-$("#WOM_produceTask_produceTask_makeExcutView_main_div .edit-head").height()-$("#WOM_produceTask_produceTask_makeExcutView_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#WOM_produceTask_produceTask_makeExcutView_main_div .edit-workflow").height()</#if>;
				$("#WOM_produceTask_produceTask_makeExcutView_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('WOM_produceTask_produceTask_makeExcutView_datagrids');
				var padding_bottom=16;
				$("#WOM_produceTask_produceTask_makeExcutView_main_div .pd_bottom,#WOM_produceTask_produceTask_makeExcutView_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#WOM_produceTask_produceTask_makeExcutView_main_div .edit-panes-s").each(function(index){
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
									if(WOM.produceTask.produceTask.makeExcutView.initCount <= 2) {
										setTimeout(function(){WOM.produceTask.produceTask.makeExcutView.initSize();}, 200);
										WOM.produceTask.produceTask.makeExcutView.initCount++;
									}/* else {
										WOM.produceTask.produceTask.makeExcutView.initCount = 0;
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
							if(($("#WOM_produceTask_produceTask_makeExcutView_main_div .edit-workflow").length > 0) && ($("#WOM_produceTask_produceTask_makeExcutView_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				$('#WOM_produceTask_produceTask_makeExcutView_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				WOM.produceTask.produceTask.makeExcutView.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				WOM.produceTask.produceTask.makeExcutView.initSize();
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
						if(parseInt($("#WOM_produceTask_produceTask_makeExcutView_main_div").css("width"),10)==650){
							$("#WOM_produceTask_produceTask_makeExcutView_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//WOM.produceTask.produceTask.makeExcutView.resizeLayout();
						//WOM.produceTask.produceTask.makeExcutView.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#WOM_produceTask_produceTask_makeExcutView_main_div").css("width"),10)==800){
							$("#WOM_produceTask_produceTask_makeExcutView_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//WOM.produceTask.produceTask.makeExcutView.resizeLayout();
						//WOM.produceTask.produceTask.makeExcutView.initSize();
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
					WOM.produceTask.produceTask.makeExcutView.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					WOM.produceTask.produceTask.makeExcutView.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){WOM.produceTask.produceTask.makeExcutView.initSize();});
				/*
				WOM.produceTask.produceTask.makeExcutView.resizeLayout=function(){
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
			WOM.produceTask.produceTask.makeExcutView.setDepartment();
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

		WOM.produceTask.produceTask.makeExcutView.validate = function(){
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
		WOM.produceTask.produceTask.makeExcutView.beforeSaveProcess = function(){
			$('input[name="produceTask.extraCol"]').remove();
		}
		WOM.produceTask.produceTask.makeExcutView.processDataGrid = function(){
										<#if false && isIE>
										$('#WOM_produceTask_produceTask_makeExcutView_form').append(ProdTaskProcExelog_dg1498733248586Widget._DT.createInputs('dg1498733248586List'));
										</#if>
										<#if false && isIE>
										$('#WOM_produceTask_produceTask_makeExcutView_form').append(ProdTaskActiExelog_dg1498733279732Widget._DT.createInputs('dg1498733279732List'));
										</#if>
		};
		WOM.produceTask.produceTask.makeExcutView.save = function(){
			<#if !(superEdit!false)>
			$('#operateType').val("save");
			<#else>
			$('#operateType').val("submit");
			</#if>
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!WOM.produceTask.produceTask.makeExcutView.validate()){return;}
			//延迟到延迟提交中处理,解决onchange事件无法触发问题
			//WOM.produceTask.produceTask.makeExcutView.beforeSaveProcess();

			//WOM.produceTask.produceTask.makeExcutView.processDataGrid();
			$('#WOM_produceTask_produceTask_makeExcutView_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('WOM_produceTask_produceTask_makeExcutView_form','WOM_produceTask_produceTask_makeExcutView_datagrids')) {      
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
		WOM.produceTask.produceTask.makeExcutView.print = function(){
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
		
		WOM.produceTask.produceTask.makeExcutView.saveSetting = function(){
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
		
		WOM.produceTask.produceTask.makeExcutView.printSetting = function(){
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
				WOM.produceTask.produceTask.makeExcutView.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(WOM.produceTask.produceTask.makeExcutView.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				WOM.produceTask.produceTask.makeExcutView.settingDialog.show();
			}
		}
		
		
		
		WOM.produceTask.produceTask.makeExcutView.reject = function(){
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
			WOM.produceTask.produceTask.makeExcutView.submit();
		}
		
		WOM.produceTask.produceTask.makeExcutView.submit = function(uncheck){
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
			if(!WOM.produceTask.produceTask.makeExcutView.validate()){return;}
			
			//$('#__workflow_outcomeDes').val($('input[name="workFlowVar.outcome"]:checked').attr('des'));
			
			WOM.produceTask.produceTask.makeExcutView.beforeSaveProcess();
			
			//WOM.produceTask.produceTask.makeExcutView.processDataGrid();
			
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
			$('#WOM_produceTask_produceTask_makeExcutView_form').submit();
			//$(".wfcancel").remove();
			
		}
		WOM.produceTask.produceTask.makeExcutView.recall = function(){
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
		WOM.produceTask.produceTask.makeExcutView._callBackInfo = function(res){
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
		WOM.produceTask.produceTask.makeExcutView.setDepartment = function(){
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
				WOM.produceTask.produceTask.makeExcutView._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				WOM.produceTask.produceTask.makeExcutView._isObjCustomProp_IE = isObjCustomProp;
			} else {
				WOM.produceTask.produceTask.makeExcutView._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				WOM.produceTask.produceTask.makeExcutView._objCustomPropNames_IE = objCustomPropNames;
			} else {
				WOM.produceTask.produceTask.makeExcutView._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				WOM.produceTask.produceTask.makeExcutView._refViewCode_IE = viewCode;
			} else {
				WOM.produceTask.produceTask.makeExcutView._refViewCode_IE = '';
			}
			WOM.produceTask.produceTask.makeExcutView._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		WOM.produceTask.produceTask.makeExcutView.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			WOM.produceTask.produceTask.makeExcutView._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			WOM.produceTask.produceTask.makeExcutView._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			WOM.produceTask.produceTask.makeExcutView.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			WOM.produceTask.produceTask.makeExcutView._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				WOM.produceTask.produceTask.makeExcutView._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		WOM.produceTask.produceTask.makeExcutView._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(WOM.produceTask.produceTask.makeExcutView._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(WOM.produceTask.produceTask.makeExcutView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				WOM.produceTask.produceTask.makeExcutView.gridEventObj = gridEventObj;
				callbackName = "WOM.produceTask.produceTask.makeExcutView.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "WOM.produceTask.produceTask.makeExcutView.getMultiselectCallBackInfo_DG" : "WOM.produceTask.produceTask.makeExcutView.getcallBackInfo_DG";
				WOM.produceTask.produceTask.makeExcutView._currRow = $(obj).closest('tr')[0];
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="WOM.produceTask.produceTask.makeExcutView.getcallBackInfo";
			}

			if(_prefix!=''){
				WOM.produceTask.produceTask.makeExcutView._prefix = _prefix.substring(1);
			}
			
			WOM.produceTask.produceTask.makeExcutView._oGrid = oGrid;
			WOM.produceTask.produceTask.makeExcutView._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					WOM.produceTask.produceTask.makeExcutView._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					WOM.produceTask.produceTask.makeExcutView._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					WOM.produceTask.produceTask.makeExcutView._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					WOM.produceTask.produceTask.makeExcutView._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					WOM.produceTask.produceTask.makeExcutView._refViewCode = oColumn.viewCode;
				} else {
					WOM.produceTask.produceTask.makeExcutView._refViewCode = '';
				}
			} else {
				WOM.produceTask.produceTask.makeExcutView._isObjCustomProp = false;
				WOM.produceTask.produceTask.makeExcutView._objCustomPropNames = '';
				WOM.produceTask.produceTask.makeExcutView._refViewCode = '';
			}
			if (WOM.produceTask.produceTask.makeExcutView._isObjCustomProp == true && WOM.produceTask.produceTask.makeExcutView._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				WOM.produceTask.produceTask.makeExcutView._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				WOM.produceTask.produceTask.makeExcutView._customCallBack = customCallBack;
			}
			if(WOM.produceTask.produceTask.makeExcutView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.produceTask.produceTask.makeExcutView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof WOM.produceTask.produceTask.makeExcutView._querycustomFuncN == "function") {
				refparam += WOM.produceTask.produceTask.makeExcutView._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			WOM.produceTask.produceTask.makeExcutView._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.produceTask.produceTask.makeExcutView._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(WOM.produceTask.produceTask.makeExcutView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.produceTask.produceTask.makeExcutView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			WOM.produceTask.produceTask.makeExcutView._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'WOM.produceTask.produceTask.makeExcutView.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.produceTask.produceTask.makeExcutView._querycustomFunc = function(obj) {
			var str = eval("typeof(WOM.produceTask.produceTask.makeExcutView.query_"+obj+")!='undefined'") ? eval('WOM.produceTask.produceTask.makeExcutView.query_'+obj+'()') : null;
			return str;
		};
		WOM.produceTask.produceTask.makeExcutView.getcallBackGroupInfo = function(obj){
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
			WOM.produceTask.produceTask.makeExcutView._dialog.close();
		}
		WOM.produceTask.produceTask.makeExcutView.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('WOM_produceTask_produceTask_makeExcutView_form',obj[0], WOM.produceTask.produceTask.makeExcutView._prefix, WOM.produceTask.produceTask.makeExcutView._sUrl);
			CUI.commonFills('WOM_produceTask_produceTask_makeExcutView_form',WOM.produceTask.produceTask.makeExcutView._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (WOM.produceTask.produceTask.makeExcutView._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(WOM.produceTask.produceTask.makeExcutView._customCallBack) {
					eval(WOM.produceTask.produceTask.makeExcutView._customCallBack);
					WOM.produceTask.produceTask.makeExcutView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.produceTask.produceTask.makeExcutView._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		WOM.produceTask.produceTask.makeExcutView.getcallBackInfo_DG_IE = function(obj){
			if(WOM.produceTask.produceTask.makeExcutView._customBeforeCallBack) {
				var flag = eval(WOM.produceTask.produceTask.makeExcutView._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = WOM.produceTask.produceTask.makeExcutView.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( WOM.produceTask.produceTask.makeExcutView._isObjCustomProp_IE == true && WOM.produceTask.produceTask.makeExcutView._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,WOM.produceTask.produceTask.makeExcutView._sUrl,WOM.produceTask.produceTask.makeExcutView._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,WOM.produceTask.produceTask.makeExcutView._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (WOM.produceTask.produceTask.makeExcutView._isObjCustomProp_IE == true && WOM.produceTask.produceTask.makeExcutView._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = WOM.produceTask.produceTask.makeExcutView._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = WOM.produceTask.produceTask.makeExcutView._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && WOM.produceTask.produceTask.makeExcutView._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + WOM.produceTask.produceTask.makeExcutView._refViewCode_IE + '&id=' + id,
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
				if(WOM.produceTask.produceTask.makeExcutView._customCallBack) {
					eval(WOM.produceTask.produceTask.makeExcutView._customCallBack);
					WOM.produceTask.produceTask.makeExcutView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.produceTask.produceTask.makeExcutView._dialog.close();
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
		
		WOM.produceTask.produceTask.makeExcutView.getcallBackInfo_DG = function(obj){
			if(WOM.produceTask.produceTask.makeExcutView._customBeforeCallBack) {
				var flag = eval(WOM.produceTask.produceTask.makeExcutView._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(WOM.produceTask.produceTask.makeExcutView._currRow).next().length==0){
						WOM.produceTask.produceTask.makeExcutView._oGrid.addNewRow();
					}	
					WOM.produceTask.produceTask.makeExcutView._currRow = $(WOM.produceTask.produceTask.makeExcutView._currRow).next();
					$(WOM.produceTask.produceTask.makeExcutView._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(WOM.produceTask.produceTask.makeExcutView._currRow,obj[i], WOM.produceTask.produceTask.makeExcutView._prefix, WOM.produceTask.produceTask.makeExcutView._sUrl);
				if (WOM.produceTask.produceTask.makeExcutView._isObjCustomProp == true && WOM.produceTask.produceTask.makeExcutView._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(WOM.produceTask.produceTask.makeExcutView._currRow,WOM.produceTask.produceTask.makeExcutView._prefix,obj[i],WOM.produceTask.produceTask.makeExcutView._oGrid,WOM.produceTask.produceTask.makeExcutView._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(WOM.produceTask.produceTask.makeExcutView._currRow,WOM.produceTask.produceTask.makeExcutView._prefix,obj[i],WOM.produceTask.produceTask.makeExcutView._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + WOM.produceTask.produceTask.makeExcutView._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + WOM.produceTask.produceTask.makeExcutView._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && WOM.produceTask.produceTask.makeExcutView._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + WOM.produceTask.produceTask.makeExcutView._refViewCode + '&id=' + id,
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
									name = WOM.produceTask.produceTask.makeExcutView._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(WOM.produceTask.produceTask.makeExcutView._currRow, objs, WOM.produceTask.produceTask.makeExcutView._oGrid);
							}
						}
					}
				}
			}
			try{
				if(WOM.produceTask.produceTask.makeExcutView._customCallBack) {
					eval(WOM.produceTask.produceTask.makeExcutView._customCallBack);
					WOM.produceTask.produceTask.makeExcutView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.produceTask.produceTask.makeExcutView._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + WOM.produceTask.produceTask.makeExcutView._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		WOM.produceTask.produceTask.makeExcutView.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(WOM.produceTask.produceTask.makeExcutView._oGrid, WOM.produceTask.produceTask.makeExcutView._currRow, WOM.produceTask.produceTask.makeExcutView._key, WOM.produceTask.produceTask.makeExcutView._displayFieldName, obj[i])
			}
			try{
				if(WOM.produceTask.produceTask.makeExcutView._customCallBack) {
					eval(WOM.produceTask.produceTask.makeExcutView._customCallBack);
					WOM.produceTask.produceTask.makeExcutView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.produceTask.produceTask.makeExcutView._dialog.close();
			} catch(e){}
		};
		
		WOM.produceTask.produceTask.makeExcutView.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						WOM.produceTask.produceTask.makeExcutView.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#WOM_produceTask_produceTask_makeExcutView_form'));
						}
					}
				}
			});
		};
		WOM.produceTask.produceTask.makeExcutView.retrialThisTable=function(){
			<#if (produceTask.processKey)?? && produceTask.processKey == "excelImport">
			workbenchErrorBarWidget.showMessage("该单据由excel导入，不能弃审");//若表单为excel导入，不可弃审
			<#else>
			if(!confirm("${getText("ec.pending.retrial.checked")}？")){
				return ;
			}
			var signatureInfo=signatureUtil.getSignatureInfo(true,'','${deploymentId!}','${(produceTask.tableInfoId)!''}','WOM_7.5.0.0_produceTask_ProduceTask')//判断是否需要进行电子签名
			if(signatureInfo[0] != '') {
				if($('#signature_viewCode').length == 0) {
    				$("#WOM_produceTask_produceTask_retrial_form").append("<input type='hidden' id='signature_viewCode' name='viewCode' value='WOM_7.5.0.0_produceTask_makeExcutView'>");
    			}
				signatureUtil.showSignatureDialog(signatureInfo[1],signatureInfo[0],'ec.flow.retrial','','WOM_produceTask_produceTask_retrial_form');
			}
			else {
				CUI("#WOM_produceTask_produceTask_retrial_form").submit();
			}
			</#if>
		}
		WOM.produceTask.produceTask.makeExcutView.retrial_callBackInfo=function(res){
			if(res.dealSuccessFlag){
				//弃审成功之后的提示信息样式和提交成功的样式保持一致
				if(containerLoadPanelWidget && containerLoadPanelWidget.loading && YUD.get("loading_wrap")){
					YUD.get("loading_wrap").innerHTML = "<div class='success-middle'></div>" ;
				}
				setTimeout(function(){
					try{
						window.opener.WOM.produceTask.produceTask.editCallBackInfo();
					}catch(e){
						try{
							window.opener.location.reload();
						}catch(e2){
						}
					}
					window.close();
				},1000);
				/*
					var showMsg  = "${getText("ec.common.saveandclosesuccessful")}";
					workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.WOM.produceTask.produceTask.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
				*/
			} else {
				CUI.showErrorInfos(res);
			}
		}

		$(function(){
			WOM.produceTask.produceTask.makeExcutView.onloadForProduct();
			$("#edit-retrialThisTable-btn").attr("style","display:none");//弃审隐藏

//流程的三个图标隐藏
$("#fr_flow").attr("style","display:none");
$("#fr_fileUpload").attr("style","display:none");
$("#fr_dealInfo").attr("style","display:none");
		});

		WOM.produceTask.produceTask.makeExcutView.beforeSubmitMethodSettingInPage = function(){
			WOM.produceTask.produceTask.makeExcutView.onsaveForProduct();
		};
		WOM.produceTask.produceTask.makeExcutView.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  WOM.produceTask.produceTask.makeExcutView.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		WOM.produceTask.produceTask.makeExcutView.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#WOM_produceTask_produceTask_makeExcutView_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#WOM_produceTask_produceTask_makeExcutView_main_div").hide();
				},100);
				//CUI("#WOM_produceTask_produceTask_makeExcutView_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		WOM.produceTask.produceTask.makeExcutView.showThis = function(){
			if(!CUI("#WOM_produceTask_produceTask_makeExcutView_main_div").is(':visible')) {
				CUI("#WOM_produceTask_produceTask_makeExcutView_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		WOM.produceTask.produceTask.makeExcutView.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			WOM.produceTask.produceTask.makeExcutView.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "WOM_produceTask_produceTask_makeExcutView_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=WOM&modelName=WOM_7.5.0.0_produceTask_ProduceTask&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.produceTask.produceTask.makeExcutView.auditDialog.show();
			</#if>
		}
		
		
		WOM.produceTask.produceTask.makeExcutView.showInfoDialog=function(mode){
			
			WOM.produceTask.produceTask.makeExcutView.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "WOM_produceTask_produceTask_makeExcutView_dealInfo",
				modal:true,
				height:500,
				width: 950,//适应国际化版
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.produceTask.produceTask.makeExcutView.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		WOM.produceTask.produceTask.makeExcutView.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			<#if pendingId??>
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=WOM_7.5.0.0_produceTask");
			<#else>
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?readOnlyFlag=true&linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=WOM_7.5.0.0_produceTask");
			</#if>
			}
		}
		
		WOM.produceTask.produceTask.makeExcutView.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/WOM/produceTask/produceTask/dealInfo-list.action&dlTableInfoId=${(produceTask.tableInfoId)?default('')}");
			}
		}
		WOM.produceTask.produceTask.makeExcutView.showFlowInfo=function(){
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
		WOM.produceTask.produceTask.makeExcutView.supervision=function(){
			WOM.produceTask.produceTask.makeExcutView.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(produceTask.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				WOM.produceTask.produceTask.makeExcutView.modifyOwnerStaffDialog.show();
		}
		





		/* CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_produceTask_makeExcutView,js,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码
        function checkManuReportRef(nRow){
       		//alert(111);
		var reportId=ProdTaskActiExelog_dg1498733279732Widget.getCellValue(nRow,"checkResultID");
		if(reportId!=null){
			var url='/qualityMan/manuCheck/manuCheck/checkView.action?id='+reportId+'&entityCode=qualityMan_7.5.0.0_manuCheck'+'&${getPowerCode('${buttonPerfix!}qualityMan_7.5.0.0_manuCheck_checkList_self')}';
			openFullScreen(url);
		}
        }
          
          
        function checkDealReportRef(nRow){
            //alert(111);
            var dealId=ProdTaskActiExelog_dg1498733279732Widget.getCellValue(nRow,"rejectsDealID");
            if(dealId!=null){
                var url='/qualityMan/manuDeal/manuDeal/dealView.action?id='+dealId+'&entityCode=qualityMan_7.5.0.0_manuDeal'+'&${getPowerCode('${buttonPerfix!}qualityMan_7.5.0.0_manuDeal_dealList_self')}';
                openFullScreen(url);
            }		
        }
          //不良品处理按钮
         function makeRejectsDeal(){
			var slength=ProdTaskActiExelog_dg1498733279732Widget._DT.getSelectedRow().length;
            if(slength!=0){
                var nRow=ProdTaskActiExelog_dg1498733279732Widget.getSelectedRow();
                var activeBatchStateID=ProdTaskActiExelog_dg1498733279732Widget.getCellValue(nRow,"activeBatchStateID.id");
                var rejectsDealID=ProdTaskActiExelog_dg1498733279732Widget.getCellValue(nRow,"rejectsDealID");
                var manuCheckId=ProdTaskActiExelog_dg1498733279732Widget.getCellValue(nRow,"checkResultID");
                if(activeBatchStateID==1002 ){
                    if(rejectsDealID==null){
                        if(manuCheckId!=null){
                                var deploymentId="";  //流程部署id
                                CUI.ajax({
                                    url: "/ec/workflow/getCurrentDeployment.action?processKey=manudealWorkFlow", //工作流
                                    type: 'post',
                                    async: false,
                                    success: function(msg) {
                                        deploymentId = msg.deploymentId;
                                    }
                                });
                            if(deploymentId==undefined || deploymentId===""){
                                CUI.Dialog.alert("工作流配置有问题，请联系管理员！");
                                return false;
                            }
                            var powerCode = "";   //权限code（_pc_）
                            CUI.ajax({
                                url: "/ec/workflow/getStartActivePowerCode.action?deploymentId="+deploymentId,
                                type: 'post',
                                async: false,
                                success: function(msg) {
                                    powerCode = msg.powerCode;
                                }
                            });
                            //将上述参数传入url
                            var url="/qualityMan/manuDeal/manuDeal/dealEdit.action?deploymentId="+deploymentId+"&entityCode=qualityMan_7.5.0.0_manuDeal&__pc__="+powerCode;				
                            url += "&manuCheckId=" + encodeURI(manuCheckId);
                            openFullScreen(url);
                        }else{
                            //检验报告单为空为空，不能进行不良品处理
                            workbenchErrorBarWidget.showMessage("${getText('WOM.makeExcutView.randon1234561reportnull1111')}","f");
                        }
                    }else{
                        //不良品处理单不为空，不能进行不良品处理
                        workbenchErrorBarWidget.showMessage("${getText('WOM.makeExcutView.randon1234561dealnotnull1111')}","f");
                    }
                }else{
                    //选择的活动与批状态不为待不良品处理，不能进行不良品处理
                    workbenchErrorBarWidget.showMessage("${getText('WOM.makeExcutView.randon1234561sdacadhyascaca')}","f");
                }

            }else{
                //请先选中一行再进行不良品处理
                workbenchErrorBarWidget.showMessage("${getText('WOM.makeExcutView.randon1234561sdsdvaa')}","f");
            }
        }
/* CUSTOM CODE END */
		WOM.produceTask.produceTask.makeExcutView.onloadForProduct = function(){
		/* CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_produceTask_makeExcutView,onloadForProduct,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		}

		WOM.produceTask.produceTask.makeExcutView.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_produceTask_makeExcutView,onsaveForProduct,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
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
				<div class="sidebar-top"><a href="#"  onclick="WOM.produceTask.produceTask.makeExcutView.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="WOM.produceTask.produceTask.makeExcutView.showBusinessList('${l.relatingModel.code.replace('.','')}',${(produceTask.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
							</#if>
						</li>
					    </#list>
					</ul>
				</div>
			</div>
			</div>				
		</div>
		</#if>
		
		<@s.form editPageNs="WOM.produceTask.produceTask.makeExcutView" errorBarId="workbenchErrorBar"  id="WOM_produceTask_produceTask_retrial_form" namespace="/WOM/produceTask/produceTask" action="retrial?scriptCode=&tableInfoId=${produceTask.tableInfoId!}&id=${id!}&${getPowerCode('WOM_7.5.0.0_produceTask_retrial')}" callback="WOM.produceTask.produceTask.makeExcutView.retrial_callBackInfo" retrialform="true">
		</@s.form>
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