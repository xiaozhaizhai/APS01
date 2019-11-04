<script type="text/javascript" src="/struts/office/${lang!}/signPlugin.js"></script>
<style type="text/css">.ewc-dialog-el{height:100%;}.edit-table{width:98%;margin:0 auto;}</style>
<link href="/struts/ec/style.css" rel="stylesheet" type="text/css" charset="utf-8"/>
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "X6Basic_signetManage_signetSetting">
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
<@errorbar id="X6Basic_signetManage_signetSetting_edit_formDialogErrorBar" />
<@s.form id="X6Basic_signetManage_signetSetting_edit_form" cssStyle="height:100%;" onsubmitMethod="X6Basic.signetManage.signetSetting.edit.beforeSubmitMethod()" ecAction="/X6Basic/signetManage/signetSetting/edit/submit.action?__pc__=${(Parameters.__pc__)!}" callback="X6Basic.signetManage.signetSetting.callBackInfo" ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="edit">
	<input type="hidden" name="viewCode" value="X6Basic_1.0_signetManage_edit">
	<input type="hidden" name="datagridKey" value="X6Basic_signetManage_signetSetting_edit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="signetSetting.version" value="${(signetSetting.version)!0}" />
	<input type="hidden" name="signetSetting.extraCol" value='' />
		<input type="hidden" name="signetSetting.id" value="${(signetSetting.id)!""}"/>
		<input type="hidden" name="signetSetting.userinfo.id" value="${(signetSetting.userinfo.id)!""}"/>
	<div id="X6Basic_edit_edit_div" style="height:100%">
		<div id="X6Basic_signetManage_signetSetting_edit_main_div" class="edit-content-dialog">
<script type="text/javascript">
var attcountid = "X6Basic_signetManage_signetSetting_edit_form"+"_attcount";
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
					CUI('#'+attcountid).html('(' + fileCount + ')');
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>			<div class="edit-panes" style="margin-top:0px;padding:0px;">
				<div>
				<div class="edit-panes-w">
					<div class="edit-panes-s">
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:148px;'></td><td style='height:0px;border:none;width:490px;'></td></tr>
		<tr class="dialog_tr">
				
							 					<#if !X6Basic_1_0_signetManage_SignetSetting_name_permit??>
					<#assign X6Basic_1_0_signetManage_SignetSetting_name_permit = checkFieldPermission('signetSetting.name','X6Basic_1.0_signetManage_SignetSetting','X6Basic_1.0_signetManage_SignetSetting_name')>
					</#if>
					<td <#if X6Basic_1_0_signetManage_SignetSetting_name_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_signetManage_SignetSetting_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367133494680')}" >${getText('X6Basic.propertydisplayName.radion1367133494680')}</label>
				</td>
				
						<#assign signetSetting_name_defaultValue  = ''>
							 							<#assign signetSetting_name_defaultValue  = ''>
					<#if !X6Basic_1_0_signetManage_SignetSetting_name_permit??>
					<#assign X6Basic_1_0_signetManage_SignetSetting_name_permit = checkFieldPermission('signetSetting.name','X6Basic_1.0_signetManage_SignetSetting','X6Basic_1.0_signetManage_SignetSetting_name')>
					</#if>
					<td <#if X6Basic_1_0_signetManage_SignetSetting_name_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-content"   style="text-align: left;;" >
							<#if X6Basic_1_0_signetManage_SignetSetting_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if X6Basic_1_0_signetManage_SignetSetting_name_permit == 1>-readonly</#if>">
								<input name="signetSetting.name" id="signetSetting_name"  style=";" originalvalue="<#if !newObj || (signetSetting.name)?has_content>${(signetSetting.name?html)!}<#else>${signetSetting_name_defaultValue!}</#if>" value="<#if !newObj || (signetSetting.name)?has_content>${(signetSetting.name?html)!}<#else>${signetSetting_name_defaultValue!}</#if>" type="text" class="cui-noborder-input "<#if X6Basic_1_0_signetManage_SignetSetting_name_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr>
				<tr class="dialog_tr">
							 					<#if !X6Basic_1_0_signetManage_SignetSetting_singetType_permit??>
					<#assign X6Basic_1_0_signetManage_SignetSetting_singetType_permit = checkFieldPermission('signetSetting.singetType','X6Basic_1.0_signetManage_SignetSetting','X6Basic_1.0_signetManage_SignetSetting_singetType')>
					</#if>
					<td <#if X6Basic_1_0_signetManage_SignetSetting_singetType_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_signetManage_SignetSetting_singetType_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367495506000')}" >${getText('X6Basic.propertydisplayName.radion1367495506000')}</label>
				</td>
				
						<#assign signetSetting_singetType_defaultValue  = ''>
							 							<#assign signetSetting_singetType_defaultValue  = ''>
					<#if !X6Basic_1_0_signetManage_SignetSetting_singetType_permit??>
					<#assign X6Basic_1_0_signetManage_SignetSetting_singetType_permit = checkFieldPermission('signetSetting.singetType','X6Basic_1.0_signetManage_SignetSetting','X6Basic_1.0_signetManage_SignetSetting_singetType')>
					</#if>
					<td <#if X6Basic_1_0_signetManage_SignetSetting_singetType_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_signetManage_SignetSetting_singetType_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if newObj>
									<#if X6Basic_1_0_signetManage_SignetSetting_singetType_permit == 1>
									<@systemcode onchange="" viewType="${viewType!}" deValue="${signetSetting_singetType_defaultValue!}" formId="X6Basic_signetManage_signetSetting_edit_form" classStyle="cui-noborder-input" view=true cssStyle="" name="signetSetting.singetType.id" code="signetType" value="${(signetSetting.singetType.id)!}" />
									<#else>
									<@systemcode onchange=""  viewType="${viewType!}" deValue="${signetSetting_singetType_defaultValue!}" formId="X6Basic_signetManage_signetSetting_edit_form" classStyle="cui-noborder-input"  name="signetSetting.singetType.id" code="signetType" value="${(signetSetting.singetType.id)!}" />
									</#if>
								<#else>
									<#if X6Basic_1_0_signetManage_SignetSetting_singetType_permit == 1>
									<@systemcode onchange=""  viewType="${viewType!}"  formId="X6Basic_signetManage_signetSetting_edit_form" classStyle="cui-noborder-input" view=true cssStyle="" name="signetSetting.singetType.id" code="signetType" value="${(signetSetting.singetType.id)!}" />
									<#else>
									<@systemcode onchange=""  viewType="${viewType!}"  formId="X6Basic_signetManage_signetSetting_edit_form" classStyle="cui-noborder-input"  name="signetSetting.singetType.id" code="signetType" value="${(signetSetting.singetType.id)!}" />
									</#if>
								</#if>
							</#if>
				</td>
				</tr>
				<tr class="dialog_tr">
												<#if !X6Basic_1_0_signetManage_SignetSetting_userinfo_base_user_name_permit??>
					<#assign X6Basic_1_0_signetManage_SignetSetting_userinfo_base_user_name_permit = checkFieldPermission('signetSetting.userinfo.name','X6Basic_1.0_signetManage_SignetSetting','base_user_name')>
					</#if>
					<td <#if X6Basic_1_0_signetManage_SignetSetting_userinfo_base_user_name_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_signetManage_SignetSetting_userinfo_base_user_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('foundation.user.name')}" >${getText('foundation.user.name')}</label>
				</td>
				
						<#assign signetSetting_userinfo_name_defaultValue  = ''>
														<#assign signetSetting_userinfo_name_defaultValue  = ''>
					<#if !X6Basic_1_0_signetManage_SignetSetting_userinfo_base_user_name_permit??>
					<#assign X6Basic_1_0_signetManage_SignetSetting_userinfo_base_user_name_permit = checkFieldPermission('signetSetting.userinfo.name','X6Basic_1.0_signetManage_SignetSetting','base_user_name')>
					</#if>
					<td <#if X6Basic_1_0_signetManage_SignetSetting_userinfo_base_user_name_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_signetManage_SignetSetting_userinfo_base_user_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if X6Basic_1_0_signetManage_SignetSetting_userinfo_base_user_name_permit == 1>
									<@mneclient reftitle="${getText('foundation.viewtitle.radion1367482692266')}" conditionfunc="X6Basic.signetManage.signetSetting.edit._querycustomFunc('signetSetting_userinfo_name')" view=true value="${(signetSetting.userinfo.name)!}" displayFieldName="name" name="signetSetting.userinfo.name" id="signetSetting_userinfo_name" type="User" url="/foundation/user/common/userListFrameset.action" clicked=true multiple=false mnewidth=260 formId="X6Basic_signetManage_signetSetting_edit_form" editCustomCallback=";" onkeyupfuncname=";_callback_signetSetting_userinfo_name(obj);" cssStyle="" isEdit=true  />
								<#else>
									<@mneclient reftitle="${getText('foundation.viewtitle.radion1367482692266')}" viewType="${viewType!}" deValue="${signetSetting_userinfo_name_defaultValue!}" conditionfunc="X6Basic.signetManage.signetSetting.edit._querycustomFunc('signetSetting_userinfo_name')"  value="${(signetSetting.userinfo.name)!}" displayFieldName="name" name="signetSetting.userinfo.name" id="signetSetting_userinfo_name" type="User" url="/foundation/user/common/userListFrameset.action" clicked=true multiple=false mnewidth=260 formId="X6Basic_signetManage_signetSetting_edit_form" editCustomCallback=";" onkeyupfuncname=";_callback_signetSetting_userinfo_name(obj);" cssStyle="" isEdit=true  />
								</#if>
								
								<script type="text/javascript">
								<#if !(signetSetting.id)?? && (signetSetting.userinfo.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${signetSetting.userinfo.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('X6Basic_signetManage_signetSetting_edit_form',obj, 'signetSetting.userinfo', '/foundation/user/common/userListFrameset.action');
												CUI.commonFills('X6Basic_signetManage_signetSetting_edit_form', 'signetSetting.userinfo',obj);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
							 					<#if !X6Basic_1_0_signetManage_SignetSetting_password_permit??>
					<#assign X6Basic_1_0_signetManage_SignetSetting_password_permit = checkFieldPermission('signetSetting.password','X6Basic_1.0_signetManage_SignetSetting','X6Basic_1.0_signetManage_SignetSetting_password')>
					</#if>
					<td <#if X6Basic_1_0_signetManage_SignetSetting_password_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_signetManage_SignetSetting_password_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367133572277')}" >${getText('X6Basic.propertydisplayName.radion1367133572277')}</label>
				</td>
				
						<#assign signetSetting_password_defaultValue  = ''>
							 							<#assign signetSetting_password_defaultValue  = ''>
					<#if !X6Basic_1_0_signetManage_SignetSetting_password_permit??>
					<#assign X6Basic_1_0_signetManage_SignetSetting_password_permit = checkFieldPermission('signetSetting.password','X6Basic_1.0_signetManage_SignetSetting','X6Basic_1.0_signetManage_SignetSetting_password')>
					</#if>
					<td <#if X6Basic_1_0_signetManage_SignetSetting_password_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_signetManage_SignetSetting_password_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="$getText('${getText('ec.view.nofieldpermission')}')"/></div>
							<#else>
							<div class="fix-input<#if X6Basic_1_0_signetManage_SignetSetting_password_permit == 1>-readonly</#if>"><input name="signetSetting.password" style=";" originalvalue="${(signetSetting.password)!}" value="${(signetSetting.password)!}" type="password" class="cui-noborder-input"<#if X6Basic_1_0_signetManage_SignetSetting_password_permit == 1> readonly=readonly</#if> /></div>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
							 					<#if !X6Basic_1_0_signetManage_SignetSetting_checkPassword_permit??>
					<#assign X6Basic_1_0_signetManage_SignetSetting_checkPassword_permit = checkFieldPermission('signetSetting.checkPassword','X6Basic_1.0_signetManage_SignetSetting','X6Basic_1.0_signetManage_SignetSetting_checkPassword')>
					</#if>
					<td <#if X6Basic_1_0_signetManage_SignetSetting_checkPassword_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_signetManage_SignetSetting_checkPassword_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367486744424')}" >${getText('X6Basic.propertydisplayName.radion1367486744424')}</label>
				</td>
				
						<#assign signetSetting_checkPassword_defaultValue  = ''>
							 							<#assign signetSetting_checkPassword_defaultValue  = ''>
					<#if !X6Basic_1_0_signetManage_SignetSetting_checkPassword_permit??>
					<#assign X6Basic_1_0_signetManage_SignetSetting_checkPassword_permit = checkFieldPermission('signetSetting.checkPassword','X6Basic_1.0_signetManage_SignetSetting','X6Basic_1.0_signetManage_SignetSetting_checkPassword')>
					</#if>
					<td <#if X6Basic_1_0_signetManage_SignetSetting_checkPassword_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_signetManage_SignetSetting_checkPassword_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="$getText('${getText('ec.view.nofieldpermission')}')"/></div>
							<#else>
							<div class="fix-input<#if X6Basic_1_0_signetManage_SignetSetting_checkPassword_permit == 1>-readonly</#if>"><input name="signetSetting.checkPassword" style=";" originalvalue="${(signetSetting.checkPassword)!}" value="${(signetSetting.checkPassword)!}" type="password" class="cui-noborder-input"<#if X6Basic_1_0_signetManage_SignetSetting_checkPassword_permit == 1> readonly=readonly</#if> /></div>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
							 					<#if !X6Basic_1_0_signetManage_SignetSetting_url_permit??>
					<#assign X6Basic_1_0_signetManage_SignetSetting_url_permit = checkFieldPermission('signetSetting.url','X6Basic_1.0_signetManage_SignetSetting','X6Basic_1.0_signetManage_SignetSetting_url')>
					</#if>
					<td <#if X6Basic_1_0_signetManage_SignetSetting_url_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_signetManage_SignetSetting_url_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367133802202')}" >${getText('X6Basic.propertydisplayName.radion1367133802202')}</label>
				</td>
				
						<#assign signetSetting_url_defaultValue  = ''>
							 							<#assign signetSetting_url_defaultValue  = ''>
					<#if !X6Basic_1_0_signetManage_SignetSetting_url_permit??>
					<#assign X6Basic_1_0_signetManage_SignetSetting_url_permit = checkFieldPermission('signetSetting.url','X6Basic_1.0_signetManage_SignetSetting','X6Basic_1.0_signetManage_SignetSetting_url')>
					</#if>
					<td <#if X6Basic_1_0_signetManage_SignetSetting_url_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
							<div id="urlMultiIDsContainerDiv" class="fix-input-noborder" style="text-align:center;">
								<input type="file" compType="image" id="urlFile" name="urlFiles" onchange="javascript:urlSetImagePreview('urlFile', 'urlImg', 'urlImgDiv');">
								<input type="hidden" id="fileUrlInput"  name="fileUrlInput" value="/foundation/workbench/download.action?linkId=${(signetSetting.id)!}&type=X6Basic_signetManage_signetSetting&entityCode=X6Basic_1.0_signetManage&propertyCode=X6Basic_1.0_signetManage_SignetSetting_url" >
								<input type="hidden" name="urlFiles.type" value="X6Basic_signetManage_signetSetting"/>
								<div id="urlImgDiv" style="margin-right: auto;margin-left: auto;text-align:center;">
								</div>
								<script type="text/javascript">
									function urlSetImagePreview(docid, imgid, divid) {
                						$('#urlMultiIDsContainerDiv').append('<input id="urlCodeDiv" type="hidden" name="urlFiles.propertyCode" value="X6Basic_1.0_signetManage_SignetSetting_url">');
                						CUI("#fileUrlInput").val($("#urlFile").val());
                						X6Basic.signetManage.signetSetting.edit.initSize();
                						return true;
        							}
								</script>
							</div>							
				</td>
		</tr>
		<tr class="dialog_tr">
		<td  class="edit-table-symbol"   align="right" style="text-align: right;;"></td>
		<td  class="edit-table-content"   align="left" style="text-align: left;;">
		<@signJs id="signDiv" divStyle="width:475px;height:192px;overflow:auto;"  propertyCode="signetUrl" />

		
		</td>
		</tr>
	</table>
					</div>
				</div>	
				<div class="edit-datatable">	
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-EDIT-X6Basic_1.0_signetManage_edit,html,X6Basic_1.0_signetManage_SignetSetting,X6Basic_1.0) -->
<!-- 自定义代码 -->
<!-- CUSTOM CODE END -->
<script type="text/javascript">
	CUI.ns('X6Basic.signetManage.signetSetting.edit');
	X6Basic.signetManage.signetSetting.edit.beforeSaveProcess = function(){}
	X6Basic.signetManage.signetSetting.edit.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(X6Basic.signetManage.signetSetting.edit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#X6Basic_signetManage_signetSetting_edit_form').trigger('beforeSubmit');
		//signetSetting.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="signetSetting.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("ul.edit-tabs").tabs("div.edit-panes > div");
		});
	})(jQuery);
	X6Basic.signetManage.signetSetting.edit.validate = function(){
		return true;
	}
	
	
	//打印
	X6Basic.signetManage.signetSetting.edit.print = function(url){
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
		
		X6Basic.signetManage.signetSetting.edit.saveSetting = function(){
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
		
		X6Basic.signetManage.signetSetting.edit.printSetting = function(){
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
			X6Basic.signetManage.signetSetting.edit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(X6Basic.signetManage.signetSetting.edit.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
				})
				X6Basic.signetManage.signetSetting.edit.settingDialog.show();
		}
	
	//控件版PT选人查看按钮单击事件处理函数
	function dataGridBtnImgClick(sUrl,objNameCustomCondition,sTitle,sPTGridID,nRow,sFieldName,oGrid,customCallBack){
		//保存当前单击事件的对象信息
		var obj = {
			"oGrid" : oGrid,
			"nRow" : nRow - 1,
			"sKey":	sFieldName
		}
		if(customCallBack){
			X6Basic.signetManage.signetSetting.edit._customCallBack = customCallBack;
		}
		X6Basic.signetManage.signetSetting.edit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,null,obj);
	}
	
	//参照复制函数
	X6Basic.signetManage.signetSetting.edit.referenceCopy = function(objName,url, dialog){
		var callbackName ="X6Basic.signetManage.signetSetting.edit.referenceCopyBackInfo";
		X6Basic.signetManage.signetSetting.edit.dialog = dialog;
		X6Basic.signetManage.signetSetting.edit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			url : url,
			title : "${getText('ec.view.property.refview')}",
			params : null
		});
	}
	
	X6Basic.signetManage.signetSetting.edit.referenceCopyBackInfo = function(obj){
		if(X6Basic.signetManage.signetSetting.edit._dialog){
			X6Basic.signetManage.signetSetting.edit._dialog.close();
		}
		createLoadPanel(false,X6Basic.signetManage.signetSetting.edit.dialog._el);
		var value = document.getElementById("id").value;
		if(isFormChanged('X6Basic_signetManage_signetSetting_edit_form','X6Basic_signetManage_signetSetting_edit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(X6Basic.signetManage.signetSetting.edit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(X6Basic.signetManage.signetSetting.edit.dialog._el).load('/X6Basic/signetManage/signetSetting/edit.action?id=' + value +'&refId='+obj[0].id,null,function(){
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
			$(X6Basic.signetManage.signetSetting.edit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(X6Basic.signetManage.signetSetting.edit.dialog._el).load('/X6Basic/signetManage/signetSetting/edit.action?id=' + value +'&refId='+obj[0].id,null,function(){
					closeLoadPanel();
					try{
						StrutsUtilsOnLoad();
					}catch(e){}
					try{
						if(me._config.onload != undefined) eval(me._config.onload + "(me)");
					}catch(e){}
			});
		}
	};
	
	X6Basic.signetManage.signetSetting.edit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		X6Basic.signetManage.signetSetting.edit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		X6Basic.signetManage.signetSetting.edit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			X6Basic.signetManage.signetSetting.edit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	X6Basic.signetManage.signetSetting.edit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid){
		var callbackName="";
		X6Basic.signetManage.signetSetting.edit._prefix = '';
		X6Basic.signetManage.signetSetting.edit._oGrid = oGrid;
		X6Basic.signetManage.signetSetting.edit._sUrl = url;
		if(customCallBack){
			X6Basic.signetManage.signetSetting.edit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			X6Basic.signetManage.signetSetting.edit.gridEventObj = gridEventObj;
			callbackName = "X6Basic.signetManage.signetSetting.edit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				X6Basic.signetManage.signetSetting.edit._prefix = '.'+ arr[0];
			}
			callbackName = "X6Basic.signetManage.signetSetting.edit.getcallBackInfo_DG";
			X6Basic.signetManage.signetSetting.edit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				X6Basic.signetManage.signetSetting.edit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="X6Basic.signetManage.signetSetting.edit.getcallBackInfo";
		}
		if(X6Basic.signetManage.signetSetting.edit._prefix!=''){
			X6Basic.signetManage.signetSetting.edit._prefix = X6Basic.signetManage.signetSetting.edit._prefix.substring(1);
		}
		if(X6Basic.signetManage.signetSetting.edit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + X6Basic.signetManage.signetSetting.edit._querycustomFunc(objName.replace(/\./g, '_')).replace(/\s+/g,'@@space_quote@@').replace(/\"/g,'@@double_quote@@').replace(/\'/g,'@@single_quote@@').replace(/%/g,'@@wcard_quote@@').replace(/=/g,'@@equal_quote@@');
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		X6Basic.signetManage.signetSetting.edit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			url : url,
			title : title,
			params : refparam
		});
	};
	
	X6Basic.signetManage.signetSetting.edit._querycustomFunc = function(obj) {
		var str = eval("typeof(X6Basic.signetManage.signetSetting.edit.query_"+obj+")!='undefined'") ? eval('X6Basic.signetManage.signetSetting.edit.query_'+obj+'()') : null;
		return str;
	
	};
	
	X6Basic.signetManage.signetSetting.edit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('X6Basic_signetManage_signetSetting_edit_form',obj[0], X6Basic.signetManage.signetSetting.edit._prefix, X6Basic.signetManage.signetSetting.edit._sUrl);
		CUI.commonFills('X6Basic_signetManage_signetSetting_edit_form',X6Basic.signetManage.signetSetting.edit._prefix,obj[0]);

		try{
			if(X6Basic.signetManage.signetSetting.edit._customCallBack) {
				eval(X6Basic.signetManage.signetSetting.edit._customCallBack);
				X6Basic.signetManage.signetSetting.edit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.signetManage.signetSetting.edit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	X6Basic.signetManage.signetSetting.edit.getcallBackInfo_DG_IE = function(obj){
		var gridEventObj = X6Basic.signetManage.signetSetting.edit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,X6Basic.signetManage.signetSetting.edit._sUrl);
		var xmlHead = gridEventObj.oGrid._DT.opts.oXMLData.childNodes[0].childNodes[0];
		for( var i = 0; i < xmlHead.childNodes.length; i++ ){
			var tagName = xmlHead.childNodes[i].tagName;
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
			if(X6Basic.signetManage.signetSetting.edit._customCallBack) {
				eval(X6Basic.signetManage.signetSetting.edit._customCallBack);
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.signetManage.signetSetting.edit._dialog.close();
		} catch(e){}
	}
	
	X6Basic.signetManage.signetSetting.edit.getcallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(X6Basic.signetManage.signetSetting.edit._currRow).next().length==0){
					$('span',$('.paginatorbar-buttonbar','#DT__'))[2].click();
				}	
				X6Basic.signetManage.signetSetting.edit._currRow = $(X6Basic.signetManage.signetSetting.edit._currRow).next();
				$(X6Basic.signetManage.signetSetting.edit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(X6Basic.signetManage.signetSetting.edit._currRow,obj[i],X6Basic.signetManage.signetSetting.edit._prefix,X6Basic.signetManage.signetSetting.edit._sUrl);
			eval("CUI.commonFills_DG(X6Basic.signetManage.signetSetting.edit._currRow,X6Basic.signetManage.signetSetting.edit._prefix,obj[i],X6Basic.signetManage.signetSetting.edit._oGrid)");
		}
		try{
			if(X6Basic.signetManage.signetSetting.edit._customCallBack) {
				eval(X6Basic.signetManage.signetSetting.edit._customCallBack);
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			X6Basic.signetManage.signetSetting.edit._dialog.close();
		} catch(e){}
	};
	X6Basic.signetManage.signetSetting.edit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			X6Basic.signetManage.signetSetting.edit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#X6Basic_signetManage_signetSetting_edit_form'));
        			}
        	   	}
        	}
      	});
	};
	X6Basic.signetManage.signetSetting.edit.beforeSubmitMethodSettingInPage = function(){
	};
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	X6Basic.signetManage.signetSetting.edit.initCount = 0;
	X6Basic.signetManage.signetSetting.edit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		var h = $('#X6Basic_edit_edit_div').parents('div.content').first().height();
		var datagrids = $('body').data('X6Basic_signetManage_signetSetting_edit_datagrids');
		var	conHeight = h-$("#X6Basic_signetManage_signetSetting_edit_main_div .edit-tabs").height() - 6;
		panesHeight = conHeight*0.4;
		$("#X6Basic_signetManage_signetSetting_edit_main_div .edit-panes-s").each(function(index){
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
							if(X6Basic.signetManage.signetSetting.edit.initCount <= 2) {
								setTimeout(function(){X6Basic.signetManage.signetSetting.edit.initSize();}, 200);
								X6Basic.signetManage.signetSetting.edit.initCount++;
							}/* else {
								X6Basic.signetManage.signetSetting.edit.initCount = 0;
							}*/
						}
					}
				}
			} else {
				$(this).parent().height(conHeight-30);
				$(this).parent().css("overflow-y","auto");
			}
		});
	}

	$(function(){
		X6Basic.signetManage.signetSetting.edit.initSize();
		$(window).bind("dialog.resize",function(){X6Basic.signetManage.signetSetting.edit.initSize();});
		
		
		<#if signetSetting??&&signetSetting.id??>
			var u="/foundation/workbench/download.action?linkId=${(signetSetting.id)!}&type=${(signetSetting.name)!}&entityCode=X6Basic_1.0_signetManage&propertyCode=signetUrl";
			var p="${signetSetting.password}";
			setTimeout(function(){
				signDiv_SignControl.openSignFromUrl(u,p);
			}, 2000);
			CUI("#signetSetting_name").prop("disabled",true);
		</#if>
		
	});
</script>
<script type="text/javascript">
	


	/* CUSTOM CODE START(view-EDIT-X6Basic_1.0_signetManage_edit,js,X6Basic_1.0_signetManage_SignetSetting,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
</script>