<!-- X6Basic_1.0/accountingPeriod/periodView -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('X6Basic.viewtitle.radion1400468632236')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-VIEW-X6Basic_1.0_accountingPeriod_periodView,head,X6Basic_1.0_accountingPeriod_AccountPeriod,X6Basic_1.0) -->
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
	CUI.ns('X6Basic.accountingPeriod.accountPeriod.periodView');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "X6Basic_accountingPeriod_accountPeriod">
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
<#assign viewType = "readonly">
<#assign callbackName ="X6Basic.accountingPeriod.accountPeriod.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="X6Basic_accountingPeriod_accountPeriod_periodView_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="X6Basic_accountingPeriod_accountPeriod_periodView_form" cssStyle="height:100%;" hiddenField="accountPeriod.id," onsubmitMethod="X6Basic.accountingPeriod.accountPeriod.periodView.beforeSubmitMethod()" ecAction="/X6Basic/accountingPeriod/accountPeriod/periodView/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="periodView">
	<input type="hidden" name="viewCode" value="X6Basic_1.0_accountingPeriod_periodView">
	<input type="hidden" name="datagridKey" value="X6Basic_accountingPeriod_accountPeriod_periodView_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="accountPeriod.version" value="${(accountPeriod.version)!0}" />
	<input type="hidden" name="accountPeriod.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
		<input type="hidden" name="accountPeriod.id" value="${(accountPeriod.id)!""}"/>
	<div id="X6Basic_periodView_edit_div" style="height:100%">
		<div id="X6Basic_accountingPeriod_accountPeriod_periodView_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "X6Basic_accountingPeriod_accountPeriod_periodView_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=X6Basic_1.0_accountingPeriod', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>			<div class="edit-panes" style="margin-top:0px;padding:0px;">
				<div>
				<div class="edit-panes-w">

<div class="edit-panes-s" style="width:98%;margin-left:10px;">
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td></tr>
		<tr class="dialog_tr">
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1400468158682')}" >${getText('X6Basic.propertydisplayName.radion1400468158682')}</label>
				</td>
				
						<#assign accountPeriod_year_defaultValue  = ''>
							 							<#assign accountPeriod_year_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${accountPeriod_year_defaultValue!}" formId="X6Basic_accountingPeriod_accountPeriod_periodView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="accountPeriod.year.id" code="accYear" value="${(accountPeriod.year.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="X6Basic_accountingPeriod_accountPeriod_periodView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="accountPeriod.year.id" code="accYear" value="${(accountPeriod.year.id)!}"  />
									
								</#if>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
		</tr>
	</table>
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
				<#assign dUrl="/X6Basic/accountingPeriod/accountPeriod/data-dg1400468531194.action?accountPeriod.id=${refId!-1}&refId=${refId!-1}&datagridCode=X6Basic_1.0_accountingPeriod_periodViewdg1400468531194">
			<#else>
				<#assign dUrl="/X6Basic/accountingPeriod/accountPeriod/data-dg1400468531194.action?accountPeriod.id=${(accountPeriod.id)!-1}&datagridCode=X6Basic_1.0_accountingPeriod_periodViewdg1400468531194">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_AccountPeriodPart_dg1400468531194_deldatagrid();}},{text:\"${getText('ec.view.button.insertRow')}\",handler:function(){this.appendRow();},iconClass:\"cui-btn-insert\",useInMore:\"false\"},{text:\"${getText('ec.view.button.moveRowUp')}\",handler:function(){this.moveRow('up');},iconClass:\"cui-btn-up\",useInMore:\"false\"},{text:\"${getText('ec.view.button.moveRowDown')}\",handler:function(){this.moveRow('down');},iconClass:\"cui-btn-down\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_AccountPeriodPart_dg1400468531194_deldatagrid();}},{text:\"${getText('ec.view.button.insertRow')}\",handler:function(){this.appendRow();},iconClass:\"cui-btn-insert\",useInMore:\"false\"},{text:\"${getText('ec.view.button.moveRowUp')}\",handler:function(){this.moveRow('up');},iconClass:\"cui-btn-up\",useInMore:\"false\"},{text:\"${getText('ec.view.button.moveRowDown')}\",handler:function(){this.moveRow('down');},iconClass:\"cui-btn-down\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_AccountPeriodPart_dg1400468531194" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1400468531194_id" value="AccountPeriodPart_dg1400468531194" />
			
			<input type="hidden" id="dg1400468531194_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('X6Basic.modelname.radion1400468245576')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/X6Basic/accountingPeriod/accountPeriod/data-dg1400468531194.action?operateType=export&datagridCode=X6Basic_1.0_accountingPeriod_periodViewdg1400468531194"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="AccountPeriodPart_dg1400468531194" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="AccountPeriodPart_dg1400468531194" viewType="${viewType}" renderOverEvent="dg1400468531194RenderOverEvent" route="${routeFlag}" formId="X6Basic_accountingPeriod_accountPeriod_periodView_form" noPermissionKeys="month,startDate,endDate" modelCode="X6Basic_1.0_accountingPeriod_AccountPeriodPart" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1400468531194" dtPage="dgPage"  hidekeyPrefix="dg1400468531194" hidekey="['id','version'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=false  buttons="${buttons}" noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1400468531194PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=false cannotDeleteRow=true assModelDisplayName=assModelDisplayName  activexButton="" exportExcel=exportExcel addNewRow=true   canInsertRow=true  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign month_displayDefaultType=''>
								<#assign month_defaultValue=''>
										<#assign month_defaultValue=''>
										 									<@systemCodeColumn code="accMonth" textalign="center" defaultValue="${(month_defaultValue!)?string}" key="month.id" editable=false type="selectcomp" notnull=false     label="${getText('X6Basic.propertydisplayName.radion1400468421895')}" width=100   />
							<#assign startDate_displayDefaultType=''>
								<#assign startDate_defaultValue=''>
										<#assign startDate_defaultValue=''>
										 								<#if (startDate_defaultValue)?? &&(startDate_defaultValue)?has_content>
									<#assign startDate_defaultValue  = getDefaultDateTime(startDate_defaultValue!)?date>
								</#if>

									<@datacolumn key="startDate"        showFormat="YMD" defaultValue="${(startDate_defaultValue!)?string}" defaultDisplay="${(startDate_displayDefaultType!)?string}" decimal="" editable=false type="date" showType="date" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('X6Basic.propertydisplayName.radion1400468386807')}" width=100 showFormatFunc=""  />
							<#assign endDate_displayDefaultType=''>
								<#assign endDate_defaultValue=''>
										<#assign endDate_defaultValue=''>
										 								<#if (endDate_defaultValue)?? &&(endDate_defaultValue)?has_content>
									<#assign endDate_defaultValue  = getDefaultDateTime(endDate_defaultValue!)?date>
								</#if>

									<@datacolumn key="endDate"        showFormat="YMD" defaultValue="${(endDate_defaultValue!)?string}" defaultDisplay="${(endDate_displayDefaultType!)?string}" decimal="" editable=false type="date" showType="date" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('X6Basic.propertydisplayName.radion1400468406727')}" width=100 showFormatFunc=""  />
			
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
				function AccountPeriodPart_dg1400468531194_check_datagridvalid(){
					//
					var errorObj =AccountPeriodPart_dg1400468531194Widget._DT.testData();
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
				
				function savedg1400468531194DataGrid(){
					<#if  refId?? && (refId gt 0)>
					AccountPeriodPart_dg1400468531194Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('AccountPeriodPart_dg1400468531194Widget') > -1) {
						AccountPeriodPart_dg1400468531194Widget.setAllRowEdited();
					}
					var json = AccountPeriodPart_dg1400468531194Widget.parseEditedData();
					$('input[name="dg1400468531194ListJson"]').remove();
					$('input[name="dgLists[\'dg1400468531194\']"]').remove();
					$('input[name="dg1400468531194ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1400468531194\']">').val(json).appendTo($('#X6Basic_accountingPeriod_accountPeriod_periodView_form'));
					$('<input type="hidden" name="dg1400468531194ModelCode">').val('X6Basic_1.0_accountingPeriod_AccountPeriodPart').appendTo($('#X6Basic_accountingPeriod_accountPeriod_periodView_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1400468531194ListJson">').val(json).appendTo($('#X6Basic_accountingPeriod_accountPeriod_periodView_form'));
				}
				function DT_AccountPeriodPart_dg1400468531194_deldatagrid(){
					var deleteRows = AccountPeriodPart_dg1400468531194Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','accountPeriod.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1400468531194DeletedIds").length>0){
							$("#dg1400468531194DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1400468531194DeletedIds" name="dgDeletedIds[\'dg1400468531194\']" value="'+tepID+'">').appendTo(CUI('#X6Basic_accountingPeriod_accountPeriod_periodView_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1400468531194DeletedIds['+CUI('input[name^="dg1400468531194DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#X6Basic_accountingPeriod_accountPeriod_periodView_form'));
					});
					return deleteRows;
				}
				function DT_AccountPeriodPart_dg1400468531194_delTreeNodes(){
					var deleteRows = AccountPeriodPart_dg1400468531194Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','accountPeriod.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1400468531194DeletedIds").length>0){
							$("#dg1400468531194DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1400468531194DeletedIds" name="dgDeletedIds[\'dg1400468531194\']" value="'+tepID+'">').appendTo(CUI('#X6Basic_accountingPeriod_accountPeriod_periodView_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1400468531194DeletedIds['+CUI('input[name^="dg1400468531194DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#X6Basic_accountingPeriod_accountPeriod_periodView_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('X6Basic_accountingPeriod_accountPeriod_periodView_datagrids');
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
							if(datagrids[0][i] == 'AccountPeriodPart_dg1400468531194') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'AccountPeriodPart_dg1400468531194';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'AccountPeriodPart_dg1400468531194';
					}
					$('body').data('X6Basic_accountingPeriod_accountPeriod_periodView_datagrids', datagrids);
				});
				
				var AccountPeriodPart_dg1400468531194_importDialog = null;
				function AccountPeriodPart_dg1400468531194_showImportDialog(){
					try{
						if(AccountPeriodPart_dg1400468531194_importDialog!=null&&AccountPeriodPart_dg1400468531194_importDialog.isShow==1){
							return false;
						}
						var url = "/X6Basic/accountingPeriod/accountPeriod/initImport.action?datagridCode=X6Basic_1.0_accountingPeriod_periodViewdg1400468531194&tid=${id!}&datagridName=dg1400468531194";
							<#if canImportExcel>
								var buttonCode="X6Basic_1.0_accountingPeriod_periodViewdg1400468531194_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						AccountPeriodPart_dg1400468531194_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("AccountPeriodPart_dg1400468531194"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();AccountPeriodPart_dg1400468531194_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();AccountPeriodPart_dg1400468531194_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						AccountPeriodPart_dg1400468531194_importDialog.show();
					}catch(e){}
				}	
				
				function AccountPeriodPart_dg1400468531194_downLoadFile(){
					var url = "/X6Basic/accountingPeriod/accountPeriod/downLoad.action?datagridCode=X6Basic_1.0_accountingPeriod_periodViewdg1400468531194&templateRelatedModelCode=X6Basic_1.0_accountingPeriod_periodViewdg1400468531194&downloadType=template&fileName=dg1400468531194";
					window.open(url,"","");
				}
				function dg1400468531194RenderOverEvent(){
				}
				function dg1400468531194PageInitMethod(nTabIndex){
					X6Basic.accountingPeriod.accountPeriod.periodView.initSize(nTabIndex);
				}
			</script>
			
			
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-VIEW-X6Basic_1.0_accountingPeriod_periodView,html,X6Basic_1.0_accountingPeriod_AccountPeriod,X6Basic_1.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	X6Basic.accountingPeriod.accountPeriod.periodView.beforeSaveProcess = function(){}
	X6Basic.accountingPeriod.accountPeriod.periodView.beforeSubmitMethod = function() {
		try{eval("savedg1400468531194DataGrid()");}catch(e){}
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(X6Basic.accountingPeriod.accountPeriod.periodView.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#X6Basic_accountingPeriod_accountPeriod_periodView_form').trigger('beforeSubmit');
		//accountPeriod.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="accountPeriod.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#X6Basic_accountingPeriod_accountPeriod_periodView_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#X6Basic_accountingPeriod_accountPeriod_periodView_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	X6Basic.accountingPeriod.accountPeriod.periodView.validate = function(){
		return true;
	}
	
	
	//打印
	X6Basic.accountingPeriod.accountPeriod.periodView.print = function(url){
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
		
		X6Basic.accountingPeriod.accountPeriod.periodView.saveSetting = function(){
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
		X6Basic.accountingPeriod.accountPeriod.periodView.printSetting = function(){
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
			X6Basic.accountingPeriod.accountPeriod.periodView.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(X6Basic.accountingPeriod.accountPeriod.periodView.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				X6Basic.accountingPeriod.accountPeriod.periodView.settingDialog.show();
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
			X6Basic.accountingPeriod.accountPeriod.periodView._customCallBack = customCallBack;
		}
		X6Basic.accountingPeriod.accountPeriod.periodView._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#X6Basic_accountingPeriod_accountPeriod_periodView_fileupload').length == 0) {
				$('body').append('<div id="X6Basic_accountingPeriod_accountPeriod_periodView_fileupload"></div>');
			}
			X6Basic.accountingPeriod.accountPeriod.periodView.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "X6Basic_accountingPeriod_accountPeriod_periodView_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#X6Basic_accountingPeriod_accountPeriod_periodView_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			X6Basic.accountingPeriod.accountPeriod.periodView.infoDialog.show();
			if($('#X6Basic_accountingPeriod_accountPeriod_periodView_fileupload').html() == '') {
				$('#X6Basic_accountingPeriod_accountPeriod_periodView_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=X6Basic_accountingPeriod_accountPeriod&entityCode=X6Basic_1.0_accountingPeriod&dialogId="+dialogId);
			}
		}
	//参照复制函数
	X6Basic.accountingPeriod.accountPeriod.periodView.referenceCopy = function(objName,url, dialog){
		var callbackName ="X6Basic.accountingPeriod.accountPeriod.periodView.referenceCopyBackInfo";
		X6Basic.accountingPeriod.accountPeriod.periodView.dialog = dialog;
		X6Basic.accountingPeriod.accountPeriod.periodView._dialog = foundation.common.select({
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
	
	X6Basic.accountingPeriod.accountPeriod.periodView.referenceCopyBackInfo = function(obj){
		if(X6Basic.accountingPeriod.accountPeriod.periodView._dialog){
			X6Basic.accountingPeriod.accountPeriod.periodView._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,X6Basic.accountingPeriod.accountPeriod.periodView.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('X6Basic_accountingPeriod_accountPeriod_periodView_form','X6Basic_accountingPeriod_accountPeriod_periodView_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(X6Basic.accountingPeriod.accountPeriod.periodView.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(X6Basic.accountingPeriod.accountPeriod.periodView.dialog._el).load('/X6Basic/accountingPeriod/accountPeriod/periodView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( X6Basic.accountingPeriod.accountPeriod.periodView.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + X6Basic.accountingPeriod.accountPeriod.periodView.dialog._config.iframe, X6Basic.accountingPeriod.accountPeriod.periodView.dialog._dialog ).prop( 'src', '/X6Basic/accountingPeriod/accountPeriod/periodView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(X6Basic.accountingPeriod.accountPeriod.periodView.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(X6Basic.accountingPeriod.accountPeriod.periodView.dialog._el).load('/X6Basic/accountingPeriod/accountPeriod/periodView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	X6Basic.accountingPeriod.accountPeriod.periodView.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		X6Basic.accountingPeriod.accountPeriod.periodView.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		X6Basic.accountingPeriod.accountPeriod.periodView._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			X6Basic.accountingPeriod.accountPeriod.periodView._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	X6Basic.accountingPeriod.accountPeriod.periodView._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'X6Basic_accountingPeriod_accountPeriod_periodView' + '_' + extraFrameParam;
		var callbackName="";
		X6Basic.accountingPeriod.accountPeriod.periodView._prefix = '';
		X6Basic.accountingPeriod.accountPeriod.periodView._oGrid = oGrid;
		X6Basic.accountingPeriod.accountPeriod.periodView._sUrl = url;
		if(customCallBack){
			X6Basic.accountingPeriod.accountPeriod.periodView._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			X6Basic.accountingPeriod.accountPeriod.periodView.gridEventObj = gridEventObj;
			callbackName = "X6Basic.accountingPeriod.accountPeriod.periodView.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				X6Basic.accountingPeriod.accountPeriod.periodView._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "X6Basic.accountingPeriod.accountPeriod.periodView.getMultiselectCallBackInfo_DG" : "X6Basic.accountingPeriod.accountPeriod.periodView.getcallBackInfo_DG";
			X6Basic.accountingPeriod.accountPeriod.periodView._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				X6Basic.accountingPeriod.accountPeriod.periodView._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="X6Basic.accountingPeriod.accountPeriod.periodView.getcallBackInfo";
		}
		if(X6Basic.accountingPeriod.accountPeriod.periodView._prefix!=''){
			X6Basic.accountingPeriod.accountPeriod.periodView._prefix = X6Basic.accountingPeriod.accountPeriod.periodView._prefix.substring(1);
		}
		if(X6Basic.accountingPeriod.accountPeriod.periodView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(X6Basic.accountingPeriod.accountPeriod.periodView._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof X6Basic.accountingPeriod.accountPeriod.periodView._querycustomFuncN == "function") {
				refparam += X6Basic.accountingPeriod.accountPeriod.periodView._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		X6Basic.accountingPeriod.accountPeriod.periodView._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	X6Basic.accountingPeriod.accountPeriod.periodView._querycustomFunc = function(obj) {
		var str = eval("typeof(X6Basic.accountingPeriod.accountPeriod.periodView.query_"+obj+")!='undefined'") ? eval('X6Basic.accountingPeriod.accountPeriod.periodView.query_'+obj+'()') : null;
		return str;
	
	};
	
	X6Basic.accountingPeriod.accountPeriod.periodView.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('X6Basic_accountingPeriod_accountPeriod_periodView_form',obj[0], X6Basic.accountingPeriod.accountPeriod.periodView._prefix, X6Basic.accountingPeriod.accountPeriod.periodView._sUrl);
		CUI.commonFills('X6Basic_accountingPeriod_accountPeriod_periodView_form',X6Basic.accountingPeriod.accountPeriod.periodView._prefix,obj[0]);

		try{
			if(X6Basic.accountingPeriod.accountPeriod.periodView._customCallBack) {
				eval(X6Basic.accountingPeriod.accountPeriod.periodView._customCallBack);
				X6Basic.accountingPeriod.accountPeriod.periodView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.accountingPeriod.accountPeriod.periodView._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	X6Basic.accountingPeriod.accountPeriod.periodView.getcallBackInfo_DG_IE = function(obj){
		if(X6Basic.accountingPeriod.accountPeriod.periodView._customBeforeCallBack) {
			var flag = eval(X6Basic.accountingPeriod.accountPeriod.periodView._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = X6Basic.accountingPeriod.accountPeriod.periodView.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,X6Basic.accountingPeriod.accountPeriod.periodView._sUrl);
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
			if(X6Basic.accountingPeriod.accountPeriod.periodView._customCallBack) {
				eval(X6Basic.accountingPeriod.accountPeriod.periodView._customCallBack);
				X6Basic.accountingPeriod.accountPeriod.periodView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.accountingPeriod.accountPeriod.periodView._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	X6Basic.accountingPeriod.accountPeriod.periodView.getcallBackInfo_DG = function(obj){
		if(X6Basic.accountingPeriod.accountPeriod.periodView._customBeforeCallBack) {
			var flag = eval(X6Basic.accountingPeriod.accountPeriod.periodView._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(X6Basic.accountingPeriod.accountPeriod.periodView._currRow).next().length==0){
					X6Basic.accountingPeriod.accountPeriod.periodView._oGrid.addNewRow();
				}	
				X6Basic.accountingPeriod.accountPeriod.periodView._currRow = $(X6Basic.accountingPeriod.accountPeriod.periodView._currRow).next();
				$(X6Basic.accountingPeriod.accountPeriod.periodView._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(X6Basic.accountingPeriod.accountPeriod.periodView._currRow,obj[i],X6Basic.accountingPeriod.accountPeriod.periodView._prefix,X6Basic.accountingPeriod.accountPeriod.periodView._sUrl);
			eval("CUI.commonFills_DG(X6Basic.accountingPeriod.accountPeriod.periodView._currRow,X6Basic.accountingPeriod.accountPeriod.periodView._prefix,obj[i],X6Basic.accountingPeriod.accountPeriod.periodView._oGrid)");
		}
		try{
			if(X6Basic.accountingPeriod.accountPeriod.periodView._customCallBack) {
				eval(X6Basic.accountingPeriod.accountPeriod.periodView._customCallBack);
				X6Basic.accountingPeriod.accountPeriod.periodView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.accountingPeriod.accountPeriod.periodView._dialog.close();
		} catch(e){}
	};
	
	X6Basic.accountingPeriod.accountPeriod.periodView.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(X6Basic.accountingPeriod.accountPeriod.periodView._oGrid, X6Basic.accountingPeriod.accountPeriod.periodView._currRow, X6Basic.accountingPeriod.accountPeriod.periodView._key, X6Basic.accountingPeriod.accountPeriod.periodView._displayFieldName, obj[i])
		}
		try{
			if(X6Basic.accountingPeriod.accountPeriod.periodView._customCallBack) {
				eval(X6Basic.accountingPeriod.accountPeriod.periodView._customCallBack);
				X6Basic.accountingPeriod.accountPeriod.periodView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.accountingPeriod.accountPeriod.periodView._dialog.close();
		} catch(e){}
	};
	
	X6Basic.accountingPeriod.accountPeriod.periodView.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			X6Basic.accountingPeriod.accountPeriod.periodView.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#X6Basic_accountingPeriod_accountPeriod_periodView_form'));
        			}
        	   	}
        	}
      	});
	};
	X6Basic.accountingPeriod.accountPeriod.periodView.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	X6Basic.accountingPeriod.accountPeriod.periodView.initCount = 0;
	X6Basic.accountingPeriod.accountPeriod.periodView.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#X6Basic_periodView_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('X6Basic_accountingPeriod_accountPeriod_periodView_datagrids');	
		var	conHeight = h-$("#X6Basic_accountingPeriod_accountPeriod_periodView_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#X6Basic_accountingPeriod_accountPeriod_periodView_main_div .edit-panes-s").each(function(index){
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
							if(X6Basic.accountingPeriod.accountPeriod.periodView.initCount <= 2) {
								setTimeout(function(){X6Basic.accountingPeriod.accountPeriod.periodView.initSize();}, 200);
								X6Basic.accountingPeriod.accountPeriod.periodView.initCount++;
							}/* else {
								X6Basic.accountingPeriod.accountPeriod.periodView.initCount = 0;
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
		X6Basic.accountingPeriod.accountPeriod.periodView.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    X6Basic.accountingPeriod.accountPeriod.periodView.initSize(index);
		});
		$(window).bind("dialog.resize",function(){X6Basic.accountingPeriod.accountPeriod.periodView.initSize();});
	});
</script>
<script type="text/javascript">
	



	/* CUSTOM CODE START(view-VIEW-X6Basic_1.0_accountingPeriod_periodView,js,X6Basic_1.0_accountingPeriod_AccountPeriod,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>