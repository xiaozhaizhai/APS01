<!-- X6Basic_1.0/spellRule/ruleView -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('X6Basic.viewtitle.radion1398317042085')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-VIEW-X6Basic_1.0_spellRule_ruleView,head,X6Basic_1.0_spellRule_SpellRule,X6Basic_1.0) -->
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
	CUI.ns('X6Basic.spellRule.spellRule.ruleView');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "X6Basic_spellRule_spellRule">
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
<#assign callbackName ="X6Basic.spellRule.spellRule.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="X6Basic_spellRule_spellRule_ruleView_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="X6Basic_spellRule_spellRule_ruleView_form" cssStyle="height:100%;" hiddenField="" onsubmitMethod="X6Basic.spellRule.spellRule.ruleView.beforeSubmitMethod()" ecAction="/X6Basic/spellRule/spellRule/ruleView/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="ruleView">
	<input type="hidden" name="viewCode" value="X6Basic_1.0_spellRule_ruleView">
	<input type="hidden" name="datagridKey" value="X6Basic_spellRule_spellRule_ruleView_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="spellRule.version" value="${(spellRule.version)!0}" />
	<input type="hidden" name="spellRule.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
	<div id="X6Basic_ruleView_edit_div" style="height:100%">
		<div id="X6Basic_spellRule_spellRule_ruleView_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "X6Basic_spellRule_spellRule_ruleView_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=X6Basic_1.0_spellRule', null, function(){
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
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1398306715753')}" >${getText('X6Basic.propertydisplayName.radion1398306715753')}</label>
				</td>
				
						<#assign spellRule_code_defaultValue  = ''>
							 							<#assign spellRule_code_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="spellRule.code" id="spellRule_code"  style=";" originalvalue="<#if !newObj || (spellRule.code)?has_content>${(spellRule.code?html)!}<#else>${spellRule_code_defaultValue!}</#if>" value="<#if !newObj || (spellRule.code)?has_content>${(spellRule.code?html)!}<#else>${spellRule_code_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1398306741696')}" >${getText('X6Basic.propertydisplayName.radion1398306741696')}</label>
				</td>
				
						<#assign spellRule_name_defaultValue  = ''>
							 							<#assign spellRule_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="spellRule.name" id="spellRule_name"  style=";" originalvalue="<#if !newObj || (spellRule.name)?has_content>${(spellRule.name?html)!}<#else>${spellRule_name_defaultValue!}</#if>" value="<#if !newObj || (spellRule.name)?has_content>${(spellRule.name?html)!}<#else>${spellRule_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1398306810252')}" >${getText('X6Basic.propertydisplayName.radion1398306810252')}</label>
				</td>
				
						<#assign spellRule_srMemo_defaultValue  = ''>
							 							<#assign spellRule_srMemo_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="3" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly fix-ie7-textarea"><textarea property_type="LONGTEXT" id="spellRule_srMemo" originalvalue="<#if !newObj || (spellRule.srMemo)?has_content>${(spellRule.srMemo?html)!}<#else>${spellRule_srMemo_defaultValue?html}</#if>"  name="spellRule.srMemo" class="cui-noborder-textarea cui-textarea-auto" readonly="readonly" style=";" ><#if !newObj || (spellRule.srMemo)?has_content>${(spellRule.srMemo)!}<#else>${spellRule_srMemo_defaultValue}</#if></textarea></div>
							
				</td>
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
				<#assign dUrl="/X6Basic/spellRule/spellRule/data-dg1398317025305.action?spellRule.id=${refId!-1}&refId=${refId!-1}&datagridCode=X6Basic_1.0_spellRule_ruleViewdg1398317025305">
			<#else>
				<#assign dUrl="/X6Basic/spellRule/spellRule/data-dg1398317025305.action?spellRule.id=${(spellRule.id)!-1}&datagridCode=X6Basic_1.0_spellRule_ruleViewdg1398317025305">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_SpellRulePart_dg1398317025305_deldatagrid();}}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_SpellRulePart_dg1398317025305_deldatagrid();}}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_SpellRulePart_dg1398317025305" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1398317025305_id" value="SpellRulePart_dg1398317025305" />
			
			<input type="hidden" id="dg1398317025305_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('X6Basic.modelname.radion1398306848646')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/X6Basic/spellRule/spellRule/data-dg1398317025305.action?operateType=export&datagridCode=X6Basic_1.0_spellRule_ruleViewdg1398317025305"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="SpellRulePart_dg1398317025305" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="SpellRulePart_dg1398317025305" viewType="${viewType}" renderOverEvent="dg1398317025305RenderOverEvent" route="${routeFlag}" formId="X6Basic_spellRule_spellRule_ruleView_form" noPermissionKeys="teamOrder,startTime,endTime,srpMemo" modelCode="X6Basic_1.0_spellRule_SpellRulePart" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1398317025305" dtPage="dgPage"  hidekeyPrefix="dg1398317025305" hidekey="['id','version'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=false  buttons="${buttons}" noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1398317025305PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=false cannotDeleteRow=true assModelDisplayName=assModelDisplayName  activexButton="" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign teamOrder_displayDefaultType=''>
								<#assign teamOrder_defaultValue=''>
										<#assign teamOrder_defaultValue=''>
										 
									<@datacolumn key="teamOrder"  popView=true      showFormat="TEXT" defaultValue="${(teamOrder_defaultValue!)?string}" defaultDisplay="${(teamOrder_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('X6Basic.propertydisplayName.radion1398306959663')}" width=100 showFormatFunc=""  />
							<#assign startTime_displayDefaultType=''>
								<#assign startTime_defaultValue=''>
										<#assign startTime_defaultValue=''>
										 
									<@datacolumn key="startTime"  popView=true      showFormat="TEXT" defaultValue="${(startTime_defaultValue!)?string}" defaultDisplay="${(startTime_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('X6Basic.propertydisplayName.radion1398307020450')}" width=100 showFormatFunc=""  />
							<#assign endTime_displayDefaultType=''>
								<#assign endTime_defaultValue=''>
										<#assign endTime_defaultValue=''>
										 
									<@datacolumn key="endTime"  popView=true      showFormat="TEXT" defaultValue="${(endTime_defaultValue!)?string}" defaultDisplay="${(endTime_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('X6Basic.propertydisplayName.radion1398307050450')}" width=100 showFormatFunc=""  />
							<#assign srpMemo_displayDefaultType=''>
								<#assign srpMemo_defaultValue=''>
										<#assign srpMemo_defaultValue=''>
										 
									<@datacolumn key="srpMemo"  popView=true      showFormat="TEXT" defaultValue="${(srpMemo_defaultValue!)?string}" defaultDisplay="${(srpMemo_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="center"  viewUrl="" viewCode=""  crossCompany=false viewTitle="${getText('')}"  label="${getText('X6Basic.propertydisplayName.radion1398307069410')}" width=100 showFormatFunc=""  />
			
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
				function SpellRulePart_dg1398317025305_check_datagridvalid(){
					//
					var errorObj =SpellRulePart_dg1398317025305Widget._DT.testData();
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
				
				function savedg1398317025305DataGrid(){
					<#if  refId?? && (refId gt 0)>
					SpellRulePart_dg1398317025305Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('SpellRulePart_dg1398317025305Widget') > -1) {
						SpellRulePart_dg1398317025305Widget.setAllRowEdited();
					}
					var json = SpellRulePart_dg1398317025305Widget.parseEditedData();
					$('input[name="dg1398317025305ListJson"]').remove();
					$('input[name="dgLists[\'dg1398317025305\']"]').remove();
					$('input[name="dg1398317025305ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1398317025305\']">').val(json).appendTo($('#X6Basic_spellRule_spellRule_ruleView_form'));
					$('<input type="hidden" name="dg1398317025305ModelCode">').val('X6Basic_1.0_spellRule_SpellRulePart').appendTo($('#X6Basic_spellRule_spellRule_ruleView_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1398317025305ListJson">').val(json).appendTo($('#X6Basic_spellRule_spellRule_ruleView_form'));
				}
				function DT_SpellRulePart_dg1398317025305_deldatagrid(){
					var deleteRows = SpellRulePart_dg1398317025305Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','spellRule.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1398317025305DeletedIds").length>0){
							$("#dg1398317025305DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1398317025305DeletedIds" name="dgDeletedIds[\'dg1398317025305\']" value="'+tepID+'">').appendTo(CUI('#X6Basic_spellRule_spellRule_ruleView_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1398317025305DeletedIds['+CUI('input[name^="dg1398317025305DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#X6Basic_spellRule_spellRule_ruleView_form'));
					});
					return deleteRows;
				}
				function DT_SpellRulePart_dg1398317025305_delTreeNodes(){
					var deleteRows = SpellRulePart_dg1398317025305Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','spellRule.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1398317025305DeletedIds").length>0){
							$("#dg1398317025305DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1398317025305DeletedIds" name="dgDeletedIds[\'dg1398317025305\']" value="'+tepID+'">').appendTo(CUI('#X6Basic_spellRule_spellRule_ruleView_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1398317025305DeletedIds['+CUI('input[name^="dg1398317025305DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#X6Basic_spellRule_spellRule_ruleView_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('X6Basic_spellRule_spellRule_ruleView_datagrids');
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
							if(datagrids[0][i] == 'SpellRulePart_dg1398317025305') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'SpellRulePart_dg1398317025305';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'SpellRulePart_dg1398317025305';
					}
					$('body').data('X6Basic_spellRule_spellRule_ruleView_datagrids', datagrids);
				});
				
				var SpellRulePart_dg1398317025305_importDialog = null;
				function SpellRulePart_dg1398317025305_showImportDialog(){
					try{
						if(SpellRulePart_dg1398317025305_importDialog!=null&&SpellRulePart_dg1398317025305_importDialog.isShow==1){
							return false;
						}
						var url = "/X6Basic/spellRule/spellRule/initImport.action?datagridCode=X6Basic_1.0_spellRule_ruleViewdg1398317025305&tid=${id!}&datagridName=dg1398317025305";
							<#if canImportExcel>
								var buttonCode="X6Basic_1.0_spellRule_ruleViewdg1398317025305_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						SpellRulePart_dg1398317025305_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("SpellRulePart_dg1398317025305"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();SpellRulePart_dg1398317025305_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();SpellRulePart_dg1398317025305_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						SpellRulePart_dg1398317025305_importDialog.show();
					}catch(e){}
				}	
				
				function SpellRulePart_dg1398317025305_downLoadFile(){
					var url = "/X6Basic/spellRule/spellRule/downLoad.action?datagridCode=X6Basic_1.0_spellRule_ruleViewdg1398317025305&templateRelatedModelCode=X6Basic_1.0_spellRule_ruleViewdg1398317025305&downloadType=template&fileName=dg1398317025305";
					window.open(url,"","");
				}
				function dg1398317025305RenderOverEvent(){
				}
				function dg1398317025305PageInitMethod(nTabIndex){
					X6Basic.spellRule.spellRule.ruleView.initSize(nTabIndex);
				}
			</script>
			
			
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-VIEW-X6Basic_1.0_spellRule_ruleView,html,X6Basic_1.0_spellRule_SpellRule,X6Basic_1.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	X6Basic.spellRule.spellRule.ruleView.beforeSaveProcess = function(){}
	X6Basic.spellRule.spellRule.ruleView.beforeSubmitMethod = function() {
		try{eval("savedg1398317025305DataGrid()");}catch(e){}
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(X6Basic.spellRule.spellRule.ruleView.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#X6Basic_spellRule_spellRule_ruleView_form').trigger('beforeSubmit');
		//spellRule.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="spellRule.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#X6Basic_spellRule_spellRule_ruleView_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#X6Basic_spellRule_spellRule_ruleView_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	X6Basic.spellRule.spellRule.ruleView.validate = function(){
		return true;
	}
	
	
	//打印
	X6Basic.spellRule.spellRule.ruleView.print = function(url){
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
		
		X6Basic.spellRule.spellRule.ruleView.saveSetting = function(){
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
		X6Basic.spellRule.spellRule.ruleView.printSetting = function(){
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
			X6Basic.spellRule.spellRule.ruleView.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(X6Basic.spellRule.spellRule.ruleView.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				X6Basic.spellRule.spellRule.ruleView.settingDialog.show();
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
			X6Basic.spellRule.spellRule.ruleView._customCallBack = customCallBack;
		}
		X6Basic.spellRule.spellRule.ruleView._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#X6Basic_spellRule_spellRule_ruleView_fileupload').length == 0) {
				$('body').append('<div id="X6Basic_spellRule_spellRule_ruleView_fileupload"></div>');
			}
			X6Basic.spellRule.spellRule.ruleView.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "X6Basic_spellRule_spellRule_ruleView_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#X6Basic_spellRule_spellRule_ruleView_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			X6Basic.spellRule.spellRule.ruleView.infoDialog.show();
			if($('#X6Basic_spellRule_spellRule_ruleView_fileupload').html() == '') {
				$('#X6Basic_spellRule_spellRule_ruleView_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=X6Basic_spellRule_spellRule&entityCode=X6Basic_1.0_spellRule&dialogId="+dialogId);
			}
		}
	//参照复制函数
	X6Basic.spellRule.spellRule.ruleView.referenceCopy = function(objName,url, dialog){
		var callbackName ="X6Basic.spellRule.spellRule.ruleView.referenceCopyBackInfo";
		X6Basic.spellRule.spellRule.ruleView.dialog = dialog;
		X6Basic.spellRule.spellRule.ruleView._dialog = foundation.common.select({
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
	
	X6Basic.spellRule.spellRule.ruleView.referenceCopyBackInfo = function(obj){
		if(X6Basic.spellRule.spellRule.ruleView._dialog){
			X6Basic.spellRule.spellRule.ruleView._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,X6Basic.spellRule.spellRule.ruleView.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('X6Basic_spellRule_spellRule_ruleView_form','X6Basic_spellRule_spellRule_ruleView_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(X6Basic.spellRule.spellRule.ruleView.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(X6Basic.spellRule.spellRule.ruleView.dialog._el).load('/X6Basic/spellRule/spellRule/ruleView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( X6Basic.spellRule.spellRule.ruleView.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + X6Basic.spellRule.spellRule.ruleView.dialog._config.iframe, X6Basic.spellRule.spellRule.ruleView.dialog._dialog ).prop( 'src', '/X6Basic/spellRule/spellRule/ruleView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(X6Basic.spellRule.spellRule.ruleView.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(X6Basic.spellRule.spellRule.ruleView.dialog._el).load('/X6Basic/spellRule/spellRule/ruleView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	X6Basic.spellRule.spellRule.ruleView.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		X6Basic.spellRule.spellRule.ruleView.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		X6Basic.spellRule.spellRule.ruleView._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			X6Basic.spellRule.spellRule.ruleView._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	X6Basic.spellRule.spellRule.ruleView._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'X6Basic_spellRule_spellRule_ruleView' + '_' + extraFrameParam;
		var callbackName="";
		X6Basic.spellRule.spellRule.ruleView._prefix = '';
		X6Basic.spellRule.spellRule.ruleView._oGrid = oGrid;
		X6Basic.spellRule.spellRule.ruleView._sUrl = url;
		if(customCallBack){
			X6Basic.spellRule.spellRule.ruleView._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			X6Basic.spellRule.spellRule.ruleView.gridEventObj = gridEventObj;
			callbackName = "X6Basic.spellRule.spellRule.ruleView.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				X6Basic.spellRule.spellRule.ruleView._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "X6Basic.spellRule.spellRule.ruleView.getMultiselectCallBackInfo_DG" : "X6Basic.spellRule.spellRule.ruleView.getcallBackInfo_DG";
			X6Basic.spellRule.spellRule.ruleView._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				X6Basic.spellRule.spellRule.ruleView._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="X6Basic.spellRule.spellRule.ruleView.getcallBackInfo";
		}
		if(X6Basic.spellRule.spellRule.ruleView._prefix!=''){
			X6Basic.spellRule.spellRule.ruleView._prefix = X6Basic.spellRule.spellRule.ruleView._prefix.substring(1);
		}
		if(X6Basic.spellRule.spellRule.ruleView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(X6Basic.spellRule.spellRule.ruleView._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof X6Basic.spellRule.spellRule.ruleView._querycustomFuncN == "function") {
				refparam += X6Basic.spellRule.spellRule.ruleView._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		X6Basic.spellRule.spellRule.ruleView._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	X6Basic.spellRule.spellRule.ruleView._querycustomFunc = function(obj) {
		var str = eval("typeof(X6Basic.spellRule.spellRule.ruleView.query_"+obj+")!='undefined'") ? eval('X6Basic.spellRule.spellRule.ruleView.query_'+obj+'()') : null;
		return str;
	
	};
	
	X6Basic.spellRule.spellRule.ruleView.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('X6Basic_spellRule_spellRule_ruleView_form',obj[0], X6Basic.spellRule.spellRule.ruleView._prefix, X6Basic.spellRule.spellRule.ruleView._sUrl);
		CUI.commonFills('X6Basic_spellRule_spellRule_ruleView_form',X6Basic.spellRule.spellRule.ruleView._prefix,obj[0]);

		try{
			if(X6Basic.spellRule.spellRule.ruleView._customCallBack) {
				eval(X6Basic.spellRule.spellRule.ruleView._customCallBack);
				X6Basic.spellRule.spellRule.ruleView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.spellRule.spellRule.ruleView._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	X6Basic.spellRule.spellRule.ruleView.getcallBackInfo_DG_IE = function(obj){
		if(X6Basic.spellRule.spellRule.ruleView._customBeforeCallBack) {
			var flag = eval(X6Basic.spellRule.spellRule.ruleView._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = X6Basic.spellRule.spellRule.ruleView.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,X6Basic.spellRule.spellRule.ruleView._sUrl);
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
			if(X6Basic.spellRule.spellRule.ruleView._customCallBack) {
				eval(X6Basic.spellRule.spellRule.ruleView._customCallBack);
				X6Basic.spellRule.spellRule.ruleView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.spellRule.spellRule.ruleView._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	X6Basic.spellRule.spellRule.ruleView.getcallBackInfo_DG = function(obj){
		if(X6Basic.spellRule.spellRule.ruleView._customBeforeCallBack) {
			var flag = eval(X6Basic.spellRule.spellRule.ruleView._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(X6Basic.spellRule.spellRule.ruleView._currRow).next().length==0){
					X6Basic.spellRule.spellRule.ruleView._oGrid.addNewRow();
				}	
				X6Basic.spellRule.spellRule.ruleView._currRow = $(X6Basic.spellRule.spellRule.ruleView._currRow).next();
				$(X6Basic.spellRule.spellRule.ruleView._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(X6Basic.spellRule.spellRule.ruleView._currRow,obj[i],X6Basic.spellRule.spellRule.ruleView._prefix,X6Basic.spellRule.spellRule.ruleView._sUrl);
			eval("CUI.commonFills_DG(X6Basic.spellRule.spellRule.ruleView._currRow,X6Basic.spellRule.spellRule.ruleView._prefix,obj[i],X6Basic.spellRule.spellRule.ruleView._oGrid)");
		}
		try{
			if(X6Basic.spellRule.spellRule.ruleView._customCallBack) {
				eval(X6Basic.spellRule.spellRule.ruleView._customCallBack);
				X6Basic.spellRule.spellRule.ruleView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.spellRule.spellRule.ruleView._dialog.close();
		} catch(e){}
	};
	
	X6Basic.spellRule.spellRule.ruleView.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(X6Basic.spellRule.spellRule.ruleView._oGrid, X6Basic.spellRule.spellRule.ruleView._currRow, X6Basic.spellRule.spellRule.ruleView._key, X6Basic.spellRule.spellRule.ruleView._displayFieldName, obj[i])
		}
		try{
			if(X6Basic.spellRule.spellRule.ruleView._customCallBack) {
				eval(X6Basic.spellRule.spellRule.ruleView._customCallBack);
				X6Basic.spellRule.spellRule.ruleView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.spellRule.spellRule.ruleView._dialog.close();
		} catch(e){}
	};
	
	X6Basic.spellRule.spellRule.ruleView.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			X6Basic.spellRule.spellRule.ruleView.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#X6Basic_spellRule_spellRule_ruleView_form'));
        			}
        	   	}
        	}
      	});
	};
	X6Basic.spellRule.spellRule.ruleView.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	X6Basic.spellRule.spellRule.ruleView.initCount = 0;
	X6Basic.spellRule.spellRule.ruleView.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#X6Basic_ruleView_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('X6Basic_spellRule_spellRule_ruleView_datagrids');	
		var	conHeight = h-$("#X6Basic_spellRule_spellRule_ruleView_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#X6Basic_spellRule_spellRule_ruleView_main_div .edit-panes-s").each(function(index){
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
							if(X6Basic.spellRule.spellRule.ruleView.initCount <= 2) {
								setTimeout(function(){X6Basic.spellRule.spellRule.ruleView.initSize();}, 200);
								X6Basic.spellRule.spellRule.ruleView.initCount++;
							}/* else {
								X6Basic.spellRule.spellRule.ruleView.initCount = 0;
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
		X6Basic.spellRule.spellRule.ruleView.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    X6Basic.spellRule.spellRule.ruleView.initSize(index);
		});
		$(window).bind("dialog.resize",function(){X6Basic.spellRule.spellRule.ruleView.initSize();});
	});
</script>
<script type="text/javascript">
	



	/* CUSTOM CODE START(view-VIEW-X6Basic_1.0_spellRule_ruleView,js,X6Basic_1.0_spellRule_SpellRule,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>