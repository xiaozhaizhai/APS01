<!-- X6Basic_1.0/teamManage/edit -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('X6Basic.viewtitle.radion1398316416492')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-EDIT-X6Basic_1.0_teamManage_edit,head,X6Basic_1.0_teamManage_TeamInfo,X6Basic_1.0) -->
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
	CUI.ns('X6Basic.teamManage.teamInfo.edit');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "X6Basic_teamManage_teamInfo">
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
<#assign callbackName ="X6Basic.teamManage.teamInfo.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="X6Basic_teamManage_teamInfo_edit_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="X6Basic_teamManage_teamInfo_edit_form" cssStyle="height:100%;" hiddenField="teamInfo.principal.id,teamInfo.dept.id," onsubmitMethod="X6Basic.teamManage.teamInfo.edit.beforeSubmitMethod()" ecAction="/X6Basic/teamManage/teamInfo/edit/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="edit">
	<input type="hidden" name="viewCode" value="X6Basic_1.0_teamManage_edit">
	<input type="hidden" name="datagridKey" value="X6Basic_teamManage_teamInfo_edit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="teamInfo.version" value="${(teamInfo.version)!0}" />
	<input type="hidden" name="teamInfo.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
		<input type="hidden" name="teamInfo.principal.id" value="${(teamInfo.principal.id)!""}"/>
		<input type="hidden" name="teamInfo.dept.id" value="${(teamInfo.dept.id)!""}"/>
	<div id="X6Basic_edit_edit_div" style="height:100%">
		<div id="X6Basic_teamManage_teamInfo_edit_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "X6Basic_teamManage_teamInfo_edit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=X6Basic_1.0_teamManage', null, function(){
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
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1398303581302')}" >${getText('X6Basic.propertydisplayName.radion1398303581302')}</label>
				</td>
				
						<#assign teamInfo_code_defaultValue  = ''>
							 							<#assign teamInfo_code_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="teamInfo.code" id="teamInfo_code"  style=";" originalvalue="<#if !newObj || (teamInfo.code)?has_content>${(teamInfo.code?html)!}<#else>${teamInfo_code_defaultValue!}</#if>" value="<#if !newObj || (teamInfo.code)?has_content>${(teamInfo.code?html)!}<#else>${teamInfo_code_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1398303611599')}" >${getText('X6Basic.propertydisplayName.radion1398303611599')}</label>
				</td>
				
						<#assign teamInfo_name_defaultValue  = ''>
							 							<#assign teamInfo_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="teamInfo.name" id="teamInfo_name"  style=";" originalvalue="<#if !newObj || (teamInfo.name)?has_content>${(teamInfo.name?html)!}<#else>${teamInfo_name_defaultValue!}</#if>" value="<#if !newObj || (teamInfo.name)?has_content>${(teamInfo.name?html)!}<#else>${teamInfo_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('part.fzwdy.xm.mainPositionId.department.name')}" >${getText('part.fzwdy.xm.mainPositionId.department.name')}</label>
				</td>
				
						<#assign teamInfo_dept_name_defaultValue  = ''>
														<#assign teamInfo_dept_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.department.reference')}" viewType="${viewType!}" deValue="${teamInfo_dept_name_defaultValue!}" conditionfunc="X6Basic.teamManage.teamInfo.edit._querycustomFunc('teamInfo_dept_name')"  value="${(teamInfo.dept.name)!}" displayFieldName="name" name="teamInfo.dept.name" id="teamInfo_dept_name" type="Department" url="/foundation/department/common/departmentListFrameCustom.action?operateCode=attendence_1.0_gatherDeal_list_self" clicked=true multiple=false mnewidth=260 formId="X6Basic_teamManage_teamInfo_edit_form" editCustomCallback=";" refViewCode="sysbase_1.0_department_departmentRefCustom" onkeyupfuncname=";_callback_teamInfo_dept_name(obj);" cssStyle="" isEdit=true     isCrossCompany=true  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (teamInfo_dept_name_defaultValue)=='currentDepart'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.mainPosition.department.id}'};
											obj = foundation.common.getObject('X6Basic_teamManage_teamInfo_edit_form',obj, 'teamInfo.dept', '/foundation/department/common/departmentListFrameCustom.action?operateCode=attendence_1.0_gatherDeal_list_self');
											CUI.commonFills('X6Basic_teamManage_teamInfo_edit_form', 'teamInfo.dept',obj,true);
											$('input:hidden[name="teamInfo.dept.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(teamInfo.id)?? && (teamInfo.dept.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${teamInfo.dept.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('X6Basic_teamManage_teamInfo_edit_form',obj, 'teamInfo.dept', '/foundation/department/common/departmentListFrameCustom.action?operateCode=attendence_1.0_gatherDeal_list_self');
												CUI.commonFills('X6Basic_teamManage_teamInfo_edit_form', 'teamInfo.dept',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1398303671784')}" >${getText('X6Basic.propertydisplayName.radion1398303671784')}</label>
				</td>
				
						<#assign teamInfo_createDate_defaultValue  = ''>
							 							<#assign teamInfo_createDate_defaultValue  = ''>
					<#if (teamInfo_createDate_defaultValue)?? &&(teamInfo_createDate_defaultValue)?has_content>
							<#assign teamInfo_createDate_defaultValue  = getDefaultDateTime(teamInfo_createDate_defaultValue!)?date>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATE"  style="text-align: left;;" >
					
							
							<#if newObj && !(teamInfo.createDate)?has_content>
								
								<@datepicker  onchange="" property_type="DATE" cssClass="cui-noborder-input" name="teamInfo.createDate" type="date" value="${teamInfo_createDate_defaultValue!}" id="teamInfo.createDate"   cssStyle=""  />
								
							<#else>
							<#if (teamInfo.createDate)??>
								
								<@datepicker  onchange="" property_type="DATE" cssClass="cui-noborder-input" name="teamInfo.createDate" type="date" value="${teamInfo.createDate?string('yyyy-MM-dd')}" id="teamInfo.createDate"   cssStyle="" />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATE" cssClass="cui-noborder-input" name="teamInfo.createDate" type="date" value="" id="teamInfo.createDate" cssStyle=""  />
								
							</#if>
							</#if>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1366792717891')}" >${getText('X6Basic.propertydisplayName.radion1366792717891')}</label>
				</td>
				
						<#assign teamInfo_principal_name_defaultValue  = ''>
														<#assign teamInfo_principal_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.view.reference')}" viewType="${viewType!}" deValue="${teamInfo_principal_name_defaultValue!}" conditionfunc="X6Basic.teamManage.teamInfo.edit._querycustomFunc('teamInfo_principal_name')"  value="${(teamInfo.principal.name)!}" displayFieldName="name" name="teamInfo.principal.name" id="teamInfo_principal_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="X6Basic_teamManage_teamInfo_edit_form" editCustomCallback=";" refViewCode="sysbase_1.0_staff_ref" onkeyupfuncname=";_callback_teamInfo_principal_name(obj);" cssStyle="" isEdit=true     isCrossCompany=true  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (teamInfo_principal_name_defaultValue)=='currentUser'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.id}'};
											obj = foundation.common.getObject('X6Basic_teamManage_teamInfo_edit_form',obj, 'teamInfo.principal', '/foundation/staff/common/staffListFrameset.action');
											CUI.commonFills('X6Basic_teamManage_teamInfo_edit_form', 'teamInfo.principal',obj,true);
											$('input:hidden[name="teamInfo.principal.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(teamInfo.id)?? && (teamInfo.principal.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${teamInfo.principal.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('X6Basic_teamManage_teamInfo_edit_form',obj, 'teamInfo.principal', '/foundation/staff/common/staffListFrameset.action');
												CUI.commonFills('X6Basic_teamManage_teamInfo_edit_form', 'teamInfo.principal',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1398303797341')}" >${getText('X6Basic.propertydisplayName.radion1398303797341')}</label>
				</td>
				
						<#assign teamInfo_teamMemo_defaultValue  = ''>
							 							<#assign teamInfo_teamMemo_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="3" style="text-align: left;;" >
					
							
							<div class="fix-input fix-ie7-textarea"><textarea property_type="LONGTEXT" id="teamInfo_teamMemo" originalvalue="<#if !newObj || (teamInfo.teamMemo)?has_content>${(teamInfo.teamMemo?html)!}<#else>${teamInfo_teamMemo_defaultValue?html}</#if>"  name="teamInfo.teamMemo" class="cui-noborder-textarea cui-textarea-auto" style=";" ><#if !newObj || (teamInfo.teamMemo)?has_content>${(teamInfo.teamMemo)!}<#else>${teamInfo_teamMemo_defaultValue}</#if></textarea></div>
							
				</td>
		</tr>
	</table>
</div>				</div>	
				<div class="edit-datatable">	

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-EDIT-X6Basic_1.0_teamManage_edit,html,X6Basic_1.0_teamManage_TeamInfo,X6Basic_1.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	X6Basic.teamManage.teamInfo.edit.beforeSaveProcess = function(){}
	X6Basic.teamManage.teamInfo.edit.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(X6Basic.teamManage.teamInfo.edit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#X6Basic_teamManage_teamInfo_edit_form').trigger('beforeSubmit');
		//teamInfo.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="teamInfo.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#X6Basic_teamManage_teamInfo_edit_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#X6Basic_teamManage_teamInfo_edit_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	X6Basic.teamManage.teamInfo.edit.validate = function(){
		return true;
	}
	
	
	//打印
	X6Basic.teamManage.teamInfo.edit.print = function(url){
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
		
		X6Basic.teamManage.teamInfo.edit.saveSetting = function(){
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
		X6Basic.teamManage.teamInfo.edit.printSetting = function(){
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
			X6Basic.teamManage.teamInfo.edit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(X6Basic.teamManage.teamInfo.edit.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				X6Basic.teamManage.teamInfo.edit.settingDialog.show();
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
			X6Basic.teamManage.teamInfo.edit._customCallBack = customCallBack;
		}
		X6Basic.teamManage.teamInfo.edit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#X6Basic_teamManage_teamInfo_edit_fileupload').length == 0) {
				$('body').append('<div id="X6Basic_teamManage_teamInfo_edit_fileupload"></div>');
			}
			X6Basic.teamManage.teamInfo.edit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "X6Basic_teamManage_teamInfo_edit_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#X6Basic_teamManage_teamInfo_edit_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			X6Basic.teamManage.teamInfo.edit.infoDialog.show();
			if($('#X6Basic_teamManage_teamInfo_edit_fileupload').html() == '') {
				$('#X6Basic_teamManage_teamInfo_edit_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=X6Basic_teamManage_teamInfo&entityCode=X6Basic_1.0_teamManage&dialogId="+dialogId);
			}
		}
	//参照复制函数
	X6Basic.teamManage.teamInfo.edit.referenceCopy = function(objName,url, dialog){
		var callbackName ="X6Basic.teamManage.teamInfo.edit.referenceCopyBackInfo";
		X6Basic.teamManage.teamInfo.edit.dialog = dialog;
		X6Basic.teamManage.teamInfo.edit._dialog = foundation.common.select({
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
	
	X6Basic.teamManage.teamInfo.edit.referenceCopyBackInfo = function(obj){
		if(X6Basic.teamManage.teamInfo.edit._dialog){
			X6Basic.teamManage.teamInfo.edit._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,X6Basic.teamManage.teamInfo.edit.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('X6Basic_teamManage_teamInfo_edit_form','X6Basic_teamManage_teamInfo_edit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(X6Basic.teamManage.teamInfo.edit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(X6Basic.teamManage.teamInfo.edit.dialog._el).load('/X6Basic/teamManage/teamInfo/edit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( X6Basic.teamManage.teamInfo.edit.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + X6Basic.teamManage.teamInfo.edit.dialog._config.iframe, X6Basic.teamManage.teamInfo.edit.dialog._dialog ).prop( 'src', '/X6Basic/teamManage/teamInfo/edit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(X6Basic.teamManage.teamInfo.edit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(X6Basic.teamManage.teamInfo.edit.dialog._el).load('/X6Basic/teamManage/teamInfo/edit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	X6Basic.teamManage.teamInfo.edit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		X6Basic.teamManage.teamInfo.edit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		X6Basic.teamManage.teamInfo.edit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			X6Basic.teamManage.teamInfo.edit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	X6Basic.teamManage.teamInfo.edit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'X6Basic_teamManage_teamInfo_edit' + '_' + extraFrameParam;
		var callbackName="";
		X6Basic.teamManage.teamInfo.edit._prefix = '';
		X6Basic.teamManage.teamInfo.edit._oGrid = oGrid;
		X6Basic.teamManage.teamInfo.edit._sUrl = url;
		if(customCallBack){
			X6Basic.teamManage.teamInfo.edit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			X6Basic.teamManage.teamInfo.edit.gridEventObj = gridEventObj;
			callbackName = "X6Basic.teamManage.teamInfo.edit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				X6Basic.teamManage.teamInfo.edit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "X6Basic.teamManage.teamInfo.edit.getMultiselectCallBackInfo_DG" : "X6Basic.teamManage.teamInfo.edit.getcallBackInfo_DG";
			X6Basic.teamManage.teamInfo.edit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				X6Basic.teamManage.teamInfo.edit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="X6Basic.teamManage.teamInfo.edit.getcallBackInfo";
		}
		if(X6Basic.teamManage.teamInfo.edit._prefix!=''){
			X6Basic.teamManage.teamInfo.edit._prefix = X6Basic.teamManage.teamInfo.edit._prefix.substring(1);
		}
		if(X6Basic.teamManage.teamInfo.edit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(X6Basic.teamManage.teamInfo.edit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof X6Basic.teamManage.teamInfo.edit._querycustomFuncN == "function") {
				refparam += X6Basic.teamManage.teamInfo.edit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		X6Basic.teamManage.teamInfo.edit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	X6Basic.teamManage.teamInfo.edit._querycustomFunc = function(obj) {
		var str = eval("typeof(X6Basic.teamManage.teamInfo.edit.query_"+obj+")!='undefined'") ? eval('X6Basic.teamManage.teamInfo.edit.query_'+obj+'()') : null;
		return str;
	
	};
	
	X6Basic.teamManage.teamInfo.edit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('X6Basic_teamManage_teamInfo_edit_form',obj[0], X6Basic.teamManage.teamInfo.edit._prefix, X6Basic.teamManage.teamInfo.edit._sUrl);
		CUI.commonFills('X6Basic_teamManage_teamInfo_edit_form',X6Basic.teamManage.teamInfo.edit._prefix,obj[0]);

		try{
			if(X6Basic.teamManage.teamInfo.edit._customCallBack) {
				eval(X6Basic.teamManage.teamInfo.edit._customCallBack);
				X6Basic.teamManage.teamInfo.edit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.teamManage.teamInfo.edit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	X6Basic.teamManage.teamInfo.edit.getcallBackInfo_DG_IE = function(obj){
		if(X6Basic.teamManage.teamInfo.edit._customBeforeCallBack) {
			var flag = eval(X6Basic.teamManage.teamInfo.edit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = X6Basic.teamManage.teamInfo.edit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,X6Basic.teamManage.teamInfo.edit._sUrl);
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
			if(X6Basic.teamManage.teamInfo.edit._customCallBack) {
				eval(X6Basic.teamManage.teamInfo.edit._customCallBack);
				X6Basic.teamManage.teamInfo.edit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.teamManage.teamInfo.edit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	X6Basic.teamManage.teamInfo.edit.getcallBackInfo_DG = function(obj){
		if(X6Basic.teamManage.teamInfo.edit._customBeforeCallBack) {
			var flag = eval(X6Basic.teamManage.teamInfo.edit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(X6Basic.teamManage.teamInfo.edit._currRow).next().length==0){
					X6Basic.teamManage.teamInfo.edit._oGrid.addNewRow();
				}	
				X6Basic.teamManage.teamInfo.edit._currRow = $(X6Basic.teamManage.teamInfo.edit._currRow).next();
				$(X6Basic.teamManage.teamInfo.edit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(X6Basic.teamManage.teamInfo.edit._currRow,obj[i],X6Basic.teamManage.teamInfo.edit._prefix,X6Basic.teamManage.teamInfo.edit._sUrl);
			eval("CUI.commonFills_DG(X6Basic.teamManage.teamInfo.edit._currRow,X6Basic.teamManage.teamInfo.edit._prefix,obj[i],X6Basic.teamManage.teamInfo.edit._oGrid)");
		}
		try{
			if(X6Basic.teamManage.teamInfo.edit._customCallBack) {
				eval(X6Basic.teamManage.teamInfo.edit._customCallBack);
				X6Basic.teamManage.teamInfo.edit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.teamManage.teamInfo.edit._dialog.close();
		} catch(e){}
	};
	
	X6Basic.teamManage.teamInfo.edit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(X6Basic.teamManage.teamInfo.edit._oGrid, X6Basic.teamManage.teamInfo.edit._currRow, X6Basic.teamManage.teamInfo.edit._key, X6Basic.teamManage.teamInfo.edit._displayFieldName, obj[i])
		}
		try{
			if(X6Basic.teamManage.teamInfo.edit._customCallBack) {
				eval(X6Basic.teamManage.teamInfo.edit._customCallBack);
				X6Basic.teamManage.teamInfo.edit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.teamManage.teamInfo.edit._dialog.close();
		} catch(e){}
	};
	
	X6Basic.teamManage.teamInfo.edit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			X6Basic.teamManage.teamInfo.edit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#X6Basic_teamManage_teamInfo_edit_form'));
        			}
        	   	}
        	}
      	});
	};
	X6Basic.teamManage.teamInfo.edit.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	X6Basic.teamManage.teamInfo.edit.initCount = 0;
	X6Basic.teamManage.teamInfo.edit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#X6Basic_edit_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('X6Basic_teamManage_teamInfo_edit_datagrids');	
		var	conHeight = h-$("#X6Basic_teamManage_teamInfo_edit_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#X6Basic_teamManage_teamInfo_edit_main_div .edit-panes-s").each(function(index){
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
							if(X6Basic.teamManage.teamInfo.edit.initCount <= 2) {
								setTimeout(function(){X6Basic.teamManage.teamInfo.edit.initSize();}, 200);
								X6Basic.teamManage.teamInfo.edit.initCount++;
							}/* else {
								X6Basic.teamManage.teamInfo.edit.initCount = 0;
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
		X6Basic.teamManage.teamInfo.edit.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    X6Basic.teamManage.teamInfo.edit.initSize(index);
		});
		$(window).bind("dialog.resize",function(){X6Basic.teamManage.teamInfo.edit.initSize();});
	});
</script>
<script type="text/javascript">
	

	/* CUSTOM CODE START(view-EDIT-X6Basic_1.0_teamManage_edit,js,X6Basic_1.0_teamManage_TeamInfo,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>