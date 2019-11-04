<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('X6Basic.viewtitle.randon1444821979273')}</title>
<@maincss/>
<@mainjs/>
</head>

<body id="dialog_page">
<@loadpanel></@loadpanel>
<@errorbar id="workbenchErrorBar" offsetY=0></@errorbar>
</#if>


<style type="text/css">
.ewc-dialog-el{height:100%;} 
.ewc-dialog-el .edit-table{width:98%;margin:0 auto;}
</style>
<script type="text/javascript">
	CUI.ns('X6Basic.timeRegion.timeRegion.setAlertEdit');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "X6Basic_timeRegion_timeRegion">
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
<#assign callbackName ="X6Basic.timeRegion.timeRegion.callBackInfo">
<@errorbar id="X6Basic_timeRegion_timeRegion_setAlertEdit_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="X6Basic_timeRegion_timeRegion_setAlertEdit_form" cssStyle="height:100%;" hiddenField="" onsubmitMethod="X6Basic.timeRegion.timeRegion.setAlertEdit.beforeSubmitMethod()" ecAction="/X6Basic/timeRegion/timeRegion/setAlertEdit/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="setAlertEdit">
	<input type="hidden" name="viewCode" value="X6Basic_1.0_timeRegion_setAlertEdit">
	<input type="hidden" name="datagridKey" value="X6Basic_timeRegion_timeRegion_setAlertEdit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="timeRegion.version" value="${(timeRegion.version)!0}" />
	<input type="hidden" name="timeRegion.extraCol" value='' />
	<div id="X6Basic_setAlertEdit_edit_div" style="height:100%">
		<div id="X6Basic_timeRegion_timeRegion_setAlertEdit_main_div" class="edit-content-dialog">
<script type="text/javascript">
var attcountid = "X6Basic_timeRegion_timeRegion_setAlertEdit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=X6Basic_1.0_timeRegion', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>			<div class="edit-panes" style="margin-top:0px;padding:0px;">
				<div>
				<div class="edit-panes-w">

<div class="edit-panes-s" style="width:98%;margin-left:10px;">
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td></tr>
		<tr class="dialog_tr">
				
							 					<#if !X6Basic_1_0_timeRegion_TimeRegion_createTime_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegion_createTime_permit = checkFieldPermission('timeRegion.createTime','X6Basic_1.0_timeRegion_TimeRegion','X6Basic_1.0_timeRegion_TimeRegion_createTime')>
					</#if>
					<td <#if X6Basic_1_0_timeRegion_TimeRegion_createTime_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_timeRegion_TimeRegion_createTime_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('BEAM.propertydisplayName.randon1440143880198')}" >${getText('BEAM.propertydisplayName.randon1440143880198')}</label>
				</td>
				
						<#assign timeRegion_createTime_defaultValue  = ''>
							 							<#assign timeRegion_createTime_defaultValue  = ''>
					<#if (timeRegion_createTime_defaultValue)?? &&(timeRegion_createTime_defaultValue)?has_content>
							<#assign timeRegion_createTime_defaultValue  = getDefaultDateTime(timeRegion_createTime_defaultValue!)?datetime>
					</#if>
					<#if !X6Basic_1_0_timeRegion_TimeRegion_createTime_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegion_createTime_permit = checkFieldPermission('timeRegion.createTime','X6Basic_1.0_timeRegion_TimeRegion','X6Basic_1.0_timeRegion_TimeRegion_createTime')>
					</#if>
					<td <#if X6Basic_1_0_timeRegion_TimeRegion_createTime_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-content" celltype="DATETIME"  align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_timeRegion_TimeRegion_createTime_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<#if newObj && !(timeRegion.createTime)?has_content>
								<#if X6Basic_1_0_timeRegion_TimeRegion_createTime_permit == 1>
								<@datepicker  property_type="DATETIME" cssClass="cui-noborder-input" name="timeRegion.createTime" value="${timeRegion_createTime_defaultValue!}" type="date"  id="timeRegion.createTime" view=true cssStyle=""  />
								<#else>
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="timeRegion.createTime" value="${timeRegion_createTime_defaultValue!}" type="date"  id="timeRegion.createTime"  cssStyle=""  />
								</#if>
							<#else>
							<#if (timeRegion.createTime)??>
								<#if X6Basic_1_0_timeRegion_TimeRegion_createTime_permit == 1>
								<@datepicker  property_type="DATETIME" cssClass="cui-noborder-input" name="timeRegion.createTime" value="${timeRegion.createTime?string('yyyy-MM-dd HH:mm:ss')}" type="date"  id="timeRegion.createTime" view=true cssStyle=""  />
								<#else>
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="timeRegion.createTime" value="${timeRegion.createTime?string('yyyy-MM-dd HH:mm:ss')}" type="date"  id="timeRegion.createTime"  cssStyle=""  />
								</#if>
							<#else>
								<#if X6Basic_1_0_timeRegion_TimeRegion_createTime_permit == 1>
								<@datepicker  property_type="DATETIME" cssClass="cui-noborder-input" name="timeRegion.createTime" value="" type="date" id="timeRegion.createTime" cssStyle="" view=true />
								<#else>
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="timeRegion.createTime" value="" type="date" id="timeRegion.createTime" cssStyle=""   />
								</#if>
							</#if>
							</#if>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_timeRegion_TimeRegion_recordNum_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegion_recordNum_permit = checkFieldPermission('timeRegion.recordNum','X6Basic_1.0_timeRegion_TimeRegion','X6Basic_1.0_timeRegion_TimeRegion_recordNum')>
					</#if>
					<td <#if X6Basic_1_0_timeRegion_TimeRegion_recordNum_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_timeRegion_TimeRegion_recordNum_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.randon1441851288390')}" >${getText('X6Basic.propertydisplayName.randon1441851288390')}</label>
				</td>
				
						<#assign timeRegion_recordNum_defaultValue  = ''>
							 							<#assign timeRegion_recordNum_defaultValue  = ''>
					<#if !X6Basic_1_0_timeRegion_TimeRegion_recordNum_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegion_recordNum_permit = checkFieldPermission('timeRegion.recordNum','X6Basic_1.0_timeRegion_TimeRegion','X6Basic_1.0_timeRegion_TimeRegion_recordNum')>
					</#if>
					<td <#if X6Basic_1_0_timeRegion_TimeRegion_recordNum_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_timeRegion_TimeRegion_recordNum_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if X6Basic_1_0_timeRegion_TimeRegion_recordNum_permit == 1>-readonly</#if>">
								<input property_type="INTEGER" name="timeRegion.recordNum" id="timeRegion_recordNum"  style=";" originalvalue="<#if !newObj || (timeRegion.recordNum)?has_content>${(timeRegion.recordNum?html)!}<#else>${timeRegion_recordNum_defaultValue!}</#if>" value="<#if !newObj || (timeRegion.recordNum)?has_content>${(timeRegion.recordNum?html)!}<#else>${timeRegion_recordNum_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField"<#if X6Basic_1_0_timeRegion_TimeRegion_recordNum_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
							 					<#if !X6Basic_1_0_timeRegion_TimeRegion_setyear_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegion_setyear_permit = checkFieldPermission('timeRegion.setyear','X6Basic_1.0_timeRegion_TimeRegion','X6Basic_1.0_timeRegion_TimeRegion_setyear')>
					</#if>
					<td <#if X6Basic_1_0_timeRegion_TimeRegion_setyear_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_timeRegion_TimeRegion_setyear_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.randon1441880564502')}" >${getText('X6Basic.propertydisplayName.randon1441880564502')}</label>
				</td>
				
						<#assign timeRegion_setyear_defaultValue  = ''>
							 							<#assign timeRegion_setyear_defaultValue  = ''>
					<#if !X6Basic_1_0_timeRegion_TimeRegion_setyear_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegion_setyear_permit = checkFieldPermission('timeRegion.setyear','X6Basic_1.0_timeRegion_TimeRegion','X6Basic_1.0_timeRegion_TimeRegion_setyear')>
					</#if>
					<td <#if X6Basic_1_0_timeRegion_TimeRegion_setyear_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if X6Basic_1_0_timeRegion_TimeRegion_setyear_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if X6Basic_1_0_timeRegion_TimeRegion_setyear_permit == 1>-readonly</#if>">
								<input property_type="INTEGER" name="timeRegion.setyear" id="timeRegion_setyear"  style=";" originalvalue="<#if !newObj || (timeRegion.setyear)?has_content>${(timeRegion.setyear?html)!}<#else>${timeRegion_setyear_defaultValue!}</#if>" value="<#if !newObj || (timeRegion.setyear)?has_content>${(timeRegion.setyear?html)!}<#else>${timeRegion_setyear_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField"<#if X6Basic_1_0_timeRegion_TimeRegion_setyear_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_timeRegion_TimeRegion_setMon_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegion_setMon_permit = checkFieldPermission('timeRegion.setMon','X6Basic_1.0_timeRegion_TimeRegion','X6Basic_1.0_timeRegion_TimeRegion_setMon')>
					</#if>
					<td <#if X6Basic_1_0_timeRegion_TimeRegion_setMon_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_timeRegion_TimeRegion_setMon_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.randon1441880636553')}" >${getText('X6Basic.propertydisplayName.randon1441880636553')}</label>
				</td>
				
						<#assign timeRegion_setMon_defaultValue  = ''>
							 							<#assign timeRegion_setMon_defaultValue  = ''>
					<#if !X6Basic_1_0_timeRegion_TimeRegion_setMon_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegion_setMon_permit = checkFieldPermission('timeRegion.setMon','X6Basic_1.0_timeRegion_TimeRegion','X6Basic_1.0_timeRegion_TimeRegion_setMon')>
					</#if>
					<td <#if X6Basic_1_0_timeRegion_TimeRegion_setMon_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if X6Basic_1_0_timeRegion_TimeRegion_setMon_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if X6Basic_1_0_timeRegion_TimeRegion_setMon_permit == 1>-readonly</#if>">
								<input property_type="INTEGER" name="timeRegion.setMon" id="timeRegion_setMon"  style=";" originalvalue="<#if !newObj || (timeRegion.setMon)?has_content>${(timeRegion.setMon?html)!}<#else>${timeRegion_setMon_defaultValue!}</#if>" value="<#if !newObj || (timeRegion.setMon)?has_content>${(timeRegion.setMon?html)!}<#else>${timeRegion_setMon_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField"<#if X6Basic_1_0_timeRegion_TimeRegion_setMon_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
		</tr>
	</table>
</div>				</div>	
				<div class="edit-datatable">	
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-EDIT-X6Basic_1.0_timeRegion_setAlertEdit,html,X6Basic_1.0_timeRegion_TimeRegion,X6Basic_1.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	X6Basic.timeRegion.timeRegion.setAlertEdit.beforeSaveProcess = function(){}
	X6Basic.timeRegion.timeRegion.setAlertEdit.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(X6Basic.timeRegion.timeRegion.setAlertEdit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#X6Basic_timeRegion_timeRegion_setAlertEdit_form').trigger('beforeSubmit');
		//timeRegion.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="timeRegion.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#X6Basic_timeRegion_timeRegion_setAlertEdit_form ul.edit-tabs").tabs("div.edit-panes > div");
		});
	})(jQuery);
	X6Basic.timeRegion.timeRegion.setAlertEdit.validate = function(){
		return true;
	}
	
	
	//打印
	X6Basic.timeRegion.timeRegion.setAlertEdit.print = function(url){
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
		
		X6Basic.timeRegion.timeRegion.setAlertEdit.saveSetting = function(){
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
		
		X6Basic.timeRegion.timeRegion.setAlertEdit.printSetting = function(){
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
			X6Basic.timeRegion.timeRegion.setAlertEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(X6Basic.timeRegion.timeRegion.setAlertEdit.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
				})
				X6Basic.timeRegion.timeRegion.setAlertEdit.settingDialog.show();
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
			X6Basic.timeRegion.timeRegion.setAlertEdit._customCallBack = customCallBack;
		}
		X6Basic.timeRegion.timeRegion.setAlertEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	
	//参照复制函数
	X6Basic.timeRegion.timeRegion.setAlertEdit.referenceCopy = function(objName,url, dialog){
		var callbackName ="X6Basic.timeRegion.timeRegion.setAlertEdit.referenceCopyBackInfo";
		X6Basic.timeRegion.timeRegion.setAlertEdit.dialog = dialog;
		X6Basic.timeRegion.timeRegion.setAlertEdit._dialog = foundation.common.select({
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
	
	X6Basic.timeRegion.timeRegion.setAlertEdit.referenceCopyBackInfo = function(obj){
		if(X6Basic.timeRegion.timeRegion.setAlertEdit._dialog){
			X6Basic.timeRegion.timeRegion.setAlertEdit._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,X6Basic.timeRegion.timeRegion.setAlertEdit.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('X6Basic_timeRegion_timeRegion_setAlertEdit_form','X6Basic_timeRegion_timeRegion_setAlertEdit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(X6Basic.timeRegion.timeRegion.setAlertEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(X6Basic.timeRegion.timeRegion.setAlertEdit.dialog._el).load('/X6Basic/timeRegion/timeRegion/setAlertEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( X6Basic.timeRegion.timeRegion.setAlertEdit.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + X6Basic.timeRegion.timeRegion.setAlertEdit.dialog._config.iframe, X6Basic.timeRegion.timeRegion.setAlertEdit.dialog._dialog ).prop( 'src', '/X6Basic/timeRegion/timeRegion/setAlertEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(X6Basic.timeRegion.timeRegion.setAlertEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(X6Basic.timeRegion.timeRegion.setAlertEdit.dialog._el).load('/X6Basic/timeRegion/timeRegion/setAlertEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	X6Basic.timeRegion.timeRegion.setAlertEdit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		X6Basic.timeRegion.timeRegion.setAlertEdit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		X6Basic.timeRegion.timeRegion.setAlertEdit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			X6Basic.timeRegion.timeRegion.setAlertEdit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	X6Basic.timeRegion.timeRegion.setAlertEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var frameName = 'X6Basic_timeRegion_timeRegion_setAlertEdit';
		var callbackName="";
		X6Basic.timeRegion.timeRegion.setAlertEdit._prefix = '';
		X6Basic.timeRegion.timeRegion.setAlertEdit._oGrid = oGrid;
		X6Basic.timeRegion.timeRegion.setAlertEdit._sUrl = url;
		if(customCallBack){
			X6Basic.timeRegion.timeRegion.setAlertEdit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			X6Basic.timeRegion.timeRegion.setAlertEdit.gridEventObj = gridEventObj;
			callbackName = "X6Basic.timeRegion.timeRegion.setAlertEdit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				X6Basic.timeRegion.timeRegion.setAlertEdit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "X6Basic.timeRegion.timeRegion.setAlertEdit.getMultiselectCallBackInfo_DG" : "X6Basic.timeRegion.timeRegion.setAlertEdit.getcallBackInfo_DG";
			X6Basic.timeRegion.timeRegion.setAlertEdit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				X6Basic.timeRegion.timeRegion.setAlertEdit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="X6Basic.timeRegion.timeRegion.setAlertEdit.getcallBackInfo";
		}
		if(X6Basic.timeRegion.timeRegion.setAlertEdit._prefix!=''){
			X6Basic.timeRegion.timeRegion.setAlertEdit._prefix = X6Basic.timeRegion.timeRegion.setAlertEdit._prefix.substring(1);
		}
		if(X6Basic.timeRegion.timeRegion.setAlertEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(X6Basic.timeRegion.timeRegion.setAlertEdit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof X6Basic.timeRegion.timeRegion.setAlertEdit._querycustomFuncN == "function") {
				refparam += X6Basic.timeRegion.timeRegion.setAlertEdit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		X6Basic.timeRegion.timeRegion.setAlertEdit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	X6Basic.timeRegion.timeRegion.setAlertEdit._querycustomFunc = function(obj) {
		var str = eval("typeof(X6Basic.timeRegion.timeRegion.setAlertEdit.query_"+obj+")!='undefined'") ? eval('X6Basic.timeRegion.timeRegion.setAlertEdit.query_'+obj+'()') : null;
		return str;
	
	};
	
	X6Basic.timeRegion.timeRegion.setAlertEdit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('X6Basic_timeRegion_timeRegion_setAlertEdit_form',obj[0], X6Basic.timeRegion.timeRegion.setAlertEdit._prefix, X6Basic.timeRegion.timeRegion.setAlertEdit._sUrl);
		CUI.commonFills('X6Basic_timeRegion_timeRegion_setAlertEdit_form',X6Basic.timeRegion.timeRegion.setAlertEdit._prefix,obj[0]);

		try{
			if(X6Basic.timeRegion.timeRegion.setAlertEdit._customCallBack) {
				eval(X6Basic.timeRegion.timeRegion.setAlertEdit._customCallBack);
				X6Basic.timeRegion.timeRegion.setAlertEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.timeRegion.timeRegion.setAlertEdit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	X6Basic.timeRegion.timeRegion.setAlertEdit.getcallBackInfo_DG_IE = function(obj){
		if(X6Basic.timeRegion.timeRegion.setAlertEdit._customBeforeCallBack) {
			var flag = eval(X6Basic.timeRegion.timeRegion.setAlertEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = X6Basic.timeRegion.timeRegion.setAlertEdit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,X6Basic.timeRegion.timeRegion.setAlertEdit._sUrl);
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
			if(X6Basic.timeRegion.timeRegion.setAlertEdit._customCallBack) {
				eval(X6Basic.timeRegion.timeRegion.setAlertEdit._customCallBack);
				X6Basic.timeRegion.timeRegion.setAlertEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.timeRegion.timeRegion.setAlertEdit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	X6Basic.timeRegion.timeRegion.setAlertEdit.getcallBackInfo_DG = function(obj){
		if(X6Basic.timeRegion.timeRegion.setAlertEdit._customBeforeCallBack) {
			var flag = eval(X6Basic.timeRegion.timeRegion.setAlertEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(X6Basic.timeRegion.timeRegion.setAlertEdit._currRow).next().length==0){
					X6Basic.timeRegion.timeRegion.setAlertEdit._oGrid.addNewRow();
				}	
				X6Basic.timeRegion.timeRegion.setAlertEdit._currRow = $(X6Basic.timeRegion.timeRegion.setAlertEdit._currRow).next();
				$(X6Basic.timeRegion.timeRegion.setAlertEdit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(X6Basic.timeRegion.timeRegion.setAlertEdit._currRow,obj[i],X6Basic.timeRegion.timeRegion.setAlertEdit._prefix,X6Basic.timeRegion.timeRegion.setAlertEdit._sUrl);
			eval("CUI.commonFills_DG(X6Basic.timeRegion.timeRegion.setAlertEdit._currRow,X6Basic.timeRegion.timeRegion.setAlertEdit._prefix,obj[i],X6Basic.timeRegion.timeRegion.setAlertEdit._oGrid)");
		}
		try{
			if(X6Basic.timeRegion.timeRegion.setAlertEdit._customCallBack) {
				eval(X6Basic.timeRegion.timeRegion.setAlertEdit._customCallBack);
				X6Basic.timeRegion.timeRegion.setAlertEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.timeRegion.timeRegion.setAlertEdit._dialog.close();
		} catch(e){}
	};
	
	X6Basic.timeRegion.timeRegion.setAlertEdit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(X6Basic.timeRegion.timeRegion.setAlertEdit._oGrid, X6Basic.timeRegion.timeRegion.setAlertEdit._currRow, X6Basic.timeRegion.timeRegion.setAlertEdit._key, X6Basic.timeRegion.timeRegion.setAlertEdit._displayFieldName, obj[i])
		}
		try{
			if(X6Basic.timeRegion.timeRegion.setAlertEdit._customCallBack) {
				eval(X6Basic.timeRegion.timeRegion.setAlertEdit._customCallBack);
				X6Basic.timeRegion.timeRegion.setAlertEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.timeRegion.timeRegion.setAlertEdit._dialog.close();
		} catch(e){}
	};
	
	X6Basic.timeRegion.timeRegion.setAlertEdit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			X6Basic.timeRegion.timeRegion.setAlertEdit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#X6Basic_timeRegion_timeRegion_setAlertEdit_form'));
        			}
        	   	}
        	}
      	});
	};
	(function($){
		$(function(){
			var rowLen=TimeRegionPar_dg1441882994270Widget.getRowLength();

//如果pt有数据
if(rowLen>=1){

 var startDate=TimeRegionPar_dg1441882994270Widget.getCellValue(rowLen-1,"startDate");
 var year=TimeRegionPar_dg1441882994270Widget.getCellValue(rowLen-1,"year");
 var month=TimeRegionPar_dg1441882994270Widget.getCellValue(rowLen-1,"month");
 
 if(startDate.length<1){
 alert("最后一行数据的开始时间不允许为空");
 }

 $('input[name="timeRegion.createTime"]').val(startDate);
 $('input[name="timeRegion.setyear"]').val(year);
 $('input[name="timeRegion.setMon"]').val(month);

 //开始时间赋值之后允许再修改
 $('input[name="timeRegion.createTime"]').attr("readonly","readonly");

}
		});
	})(jQuery);
	X6Basic.timeRegion.timeRegion.setAlertEdit.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	X6Basic.timeRegion.timeRegion.setAlertEdit.initCount = 0;
	X6Basic.timeRegion.timeRegion.setAlertEdit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#X6Basic_setAlertEdit_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('X6Basic_timeRegion_timeRegion_setAlertEdit_datagrids');	
		var	conHeight = h-$("#X6Basic_timeRegion_timeRegion_setAlertEdit_main_div .edit-tabs").height() - 6;
		panesHeight = conHeight*0.4;
		$("#X6Basic_timeRegion_timeRegion_setAlertEdit_main_div .edit-panes-s").each(function(index){
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
							if(X6Basic.timeRegion.timeRegion.setAlertEdit.initCount <= 2) {
								setTimeout(function(){X6Basic.timeRegion.timeRegion.setAlertEdit.initSize();}, 200);
								X6Basic.timeRegion.timeRegion.setAlertEdit.initCount++;
							}/* else {
								X6Basic.timeRegion.timeRegion.setAlertEdit.initCount = 0;
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
		X6Basic.timeRegion.timeRegion.setAlertEdit.initSize();
		$(window).bind("dialog.resize",function(){X6Basic.timeRegion.timeRegion.setAlertEdit.initSize();});
	});
</script>
<script type="text/javascript">
	


	/* CUSTOM CODE START(view-EDIT-X6Basic_1.0_timeRegion_setAlertEdit,js,X6Basic_1.0_timeRegion_TimeRegion,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>