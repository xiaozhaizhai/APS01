	<#assign  fileuploadType = "X6Basic_signetManage_signetSetting">
	<#assign fileuploadLinkId = id!>
<#assign viewType = "readonly">
<#assign newObj = false >
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>${getText('X6Basic.viewtitle.radion1367133678500')}</title>
        <@editcss /><@editjstop /><@editjs />
        <script type="text/javascript" src="/static/ec/js/${lang!}/ec_print.js"></script>
		<style>
		body{_width:100%;height:100%;overflow:auto;}
		.pd-top{padding-top:10px}
		.edit-panes-s{width:98%;}
		.dg_table{
			border: 1px solid #000;
			border-bottom: none;
			border-left: none;
		}
		.dg_tr{
			height:20px;
		}
		.dg_tr th{
			border-left: 1px solid #000;
			border-bottom: 1px solid #000;
		}
		.dg_tr td{
			border-left: 1px solid #000;
			border-bottom: 1px solid #000;
		}
		.fileAttachmentDiv{
			border:1px solid #000;
			margin-left:10px;
			width:95%;
		}
		.dealInfoContain{
			width:96%;
		}
		</style>
    </head>
	<body>
		<input type="hidden" name="mainContent" value="false" />
		<input type="hidden" name="attachmentInfo" value="false" />
		<input type="hidden" name="dealInfo" value="false" />
		<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="X6Basic_signetManage_signetSetting_edit_main_div">
			<div class="edit-head">
				<div class="edit-title fix">								
					<span class="edit-title-view"></span>
				</div>
			</div>
			<div class="edit-main">
				<div class="edit-content">
					<div class="edit-panes edit-panes-w clearfix" style="padding:0px 18px 16px;margin-top:16px;width:96%;">
						<#if mainContent?? && (mainContent!false)?string=='true'>
							<div class="cui-elements pd-top">
									<div style="width:98%;text-align:left;">
										<h1>${getText('ec.view.commoninfo')}<h1>
										<hr />
									</div>
								<div class="edit-panes-s">
									
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:47%'></td><td style='height:0px;border:none;width:54%'></td></tr>
		<tr>
				
							 					<#if !X6Basic_1_0_signetManage_SignetSetting_name_permit??>
					<#assign X6Basic_1_0_signetManage_SignetSetting_name_permit = checkFieldPermission('signetSetting.name','X6Basic_1.0_signetManage_SignetSetting','X6Basic_1.0_signetManage_SignetSetting_name')>
					</#if>
					<td <#if X6Basic_1_0_signetManage_SignetSetting_name_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"  width="47%" align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_signetManage_SignetSetting_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367133494680')}" >${getText('X6Basic.propertydisplayName.radion1367133494680')}</label>
				</td>
				
							 					<#if !X6Basic_1_0_signetManage_SignetSetting_name_permit??>
					<#assign X6Basic_1_0_signetManage_SignetSetting_name_permit = checkFieldPermission('signetSetting.name','X6Basic_1.0_signetManage_SignetSetting','X6Basic_1.0_signetManage_SignetSetting_name')>
					</#if>
					<td <#if X6Basic_1_0_signetManage_SignetSetting_name_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"  width="54%" style="text-align: left;;" >
							<#if X6Basic_1_0_signetManage_SignetSetting_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input name="signetSetting.name" id="signetSetting_name"  style=";"  value="${(signetSetting.name?html)!}" type="text" class="cui-noborder-input " readonly="readonly"/>
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr>
							 					<#if !X6Basic_1_0_signetManage_SignetSetting_singetType_permit??>
					<#assign X6Basic_1_0_signetManage_SignetSetting_singetType_permit = checkFieldPermission('signetSetting.singetType','X6Basic_1.0_signetManage_SignetSetting','X6Basic_1.0_signetManage_SignetSetting_singetType')>
					</#if>
					<td <#if X6Basic_1_0_signetManage_SignetSetting_singetType_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_signetManage_SignetSetting_singetType_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367495506000')}" >${getText('X6Basic.propertydisplayName.radion1367495506000')}</label>
				</td>
				
							 					<#if !X6Basic_1_0_signetManage_SignetSetting_singetType_permit??>
					<#assign X6Basic_1_0_signetManage_SignetSetting_singetType_permit = checkFieldPermission('signetSetting.singetType','X6Basic_1.0_signetManage_SignetSetting','X6Basic_1.0_signetManage_SignetSetting_singetType')>
					</#if>
					<td <#if X6Basic_1_0_signetManage_SignetSetting_singetType_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_signetManage_SignetSetting_singetType_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<@systemcode onchange=""  viewType="readonly"  formId="X6Basic_signetManage_signetSetting_edit_form" classStyle="cui-noborder-input" view=true cssStyle="" name="signetSetting.singetType.id" code="signetType" value="${(signetSetting.singetType.id)!}" />
							</#if>
				</td>
				</tr><tr>
												<#if !X6Basic_1_0_signetManage_SignetSetting_userinfo_base_user_name_permit??>
					<#assign X6Basic_1_0_signetManage_SignetSetting_userinfo_base_user_name_permit = checkFieldPermission('signetSetting.userinfo.name','X6Basic_1.0_signetManage_SignetSetting','base_user_name')>
					</#if>
					<td <#if X6Basic_1_0_signetManage_SignetSetting_userinfo_base_user_name_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_signetManage_SignetSetting_userinfo_base_user_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('foundation.user.name')}" >${getText('foundation.user.name')}</label>
				</td>
				
												<#if !X6Basic_1_0_signetManage_SignetSetting_userinfo_base_user_name_permit??>
					<#assign X6Basic_1_0_signetManage_SignetSetting_userinfo_base_user_name_permit = checkFieldPermission('signetSetting.userinfo.name','X6Basic_1.0_signetManage_SignetSetting','base_user_name')>
					</#if>
					<td <#if X6Basic_1_0_signetManage_SignetSetting_userinfo_base_user_name_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_signetManage_SignetSetting_userinfo_base_user_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input" readonly="readonly" value="${(signetSetting.userinfo.name)!}" name="signetSetting.userinfo.name" id="signetSetting_userinfo_name" /></div>
							</#if>
				</td>
				</tr><tr>
							 					<#if !X6Basic_1_0_signetManage_SignetSetting_password_permit??>
					<#assign X6Basic_1_0_signetManage_SignetSetting_password_permit = checkFieldPermission('signetSetting.password','X6Basic_1.0_signetManage_SignetSetting','X6Basic_1.0_signetManage_SignetSetting_password')>
					</#if>
					<td <#if X6Basic_1_0_signetManage_SignetSetting_password_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_signetManage_SignetSetting_password_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367133572277')}" >${getText('X6Basic.propertydisplayName.radion1367133572277')}</label>
				</td>
				
							 					<#if !X6Basic_1_0_signetManage_SignetSetting_password_permit??>
					<#assign X6Basic_1_0_signetManage_SignetSetting_password_permit = checkFieldPermission('signetSetting.password','X6Basic_1.0_signetManage_SignetSetting','X6Basic_1.0_signetManage_SignetSetting_password')>
					</#if>
					<td <#if X6Basic_1_0_signetManage_SignetSetting_password_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_signetManage_SignetSetting_password_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="$getText('${getText('ec.view.nofieldpermission')}')"/></div>
							<#else>
							<div class="fix-input-readonly"><input name="signetSetting.password" style=";"  value="${(signetSetting.password)!}" type="password" class="cui-noborder-input" readonly="readonly"/></div>
							</#if>
				</td>
				</tr><tr>
							 					<#if !X6Basic_1_0_signetManage_SignetSetting_checkPassword_permit??>
					<#assign X6Basic_1_0_signetManage_SignetSetting_checkPassword_permit = checkFieldPermission('signetSetting.checkPassword','X6Basic_1.0_signetManage_SignetSetting','X6Basic_1.0_signetManage_SignetSetting_checkPassword')>
					</#if>
					<td <#if X6Basic_1_0_signetManage_SignetSetting_checkPassword_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_signetManage_SignetSetting_checkPassword_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367486744424')}" >${getText('X6Basic.propertydisplayName.radion1367486744424')}</label>
				</td>
				
							 					<#if !X6Basic_1_0_signetManage_SignetSetting_checkPassword_permit??>
					<#assign X6Basic_1_0_signetManage_SignetSetting_checkPassword_permit = checkFieldPermission('signetSetting.checkPassword','X6Basic_1.0_signetManage_SignetSetting','X6Basic_1.0_signetManage_SignetSetting_checkPassword')>
					</#if>
					<td <#if X6Basic_1_0_signetManage_SignetSetting_checkPassword_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_signetManage_SignetSetting_checkPassword_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="$getText('${getText('ec.view.nofieldpermission')}')"/></div>
							<#else>
							<div class="fix-input-readonly"><input name="signetSetting.checkPassword" style=";"  value="${(signetSetting.checkPassword)!}" type="password" class="cui-noborder-input" readonly="readonly"/></div>
							</#if>
				</td>
				</tr><tr>
							 					<#if !X6Basic_1_0_signetManage_SignetSetting_url_permit??>
					<#assign X6Basic_1_0_signetManage_SignetSetting_url_permit = checkFieldPermission('signetSetting.url','X6Basic_1.0_signetManage_SignetSetting','X6Basic_1.0_signetManage_SignetSetting_url')>
					</#if>
					<td <#if X6Basic_1_0_signetManage_SignetSetting_url_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_signetManage_SignetSetting_url_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367133802202')}" >${getText('X6Basic.propertydisplayName.radion1367133802202')}</label>
				</td>
				
							 					<#if !X6Basic_1_0_signetManage_SignetSetting_url_permit??>
					<#assign X6Basic_1_0_signetManage_SignetSetting_url_permit = checkFieldPermission('signetSetting.url','X6Basic_1.0_signetManage_SignetSetting','X6Basic_1.0_signetManage_SignetSetting_url')>
					</#if>
					<td <#if X6Basic_1_0_signetManage_SignetSetting_url_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   align="left" style="text-align: left;;" >
				</td>
		</tr>
	</table>
	<div style="height:20px;width:100%"></div>
								</div>									
							</div>
						</#if>
					</div>
				</div>
			</div>
		</div>	
		
		<!-- CUSTOM CODE START(view-EDIT-X6Basic_1.0_signetManage_edit,html,X6Basic_1.0_signetManage_SignetSetting,X6Basic_1.0) -->
<!-- 自定义代码 -->
<!-- CUSTOM CODE END -->		
		<script type="text/javascript">
		(function($){
			if(CUI("#fileAttachmentDiv")){
				CUI("#fileAttachmentDiv").load("/ec/print/fileupload-print.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}");
			}
			if(CUI("#dealInfoContain")){
				CUI("#dealInfoContain").load("/ec/workflow/dealInfo.action?dlTableInfoId=${tableInfoId!}&preName=mainFrame&dealDataUrl=/X6Basic/signetManage/signetSetting/dealInfo-list.action");
			}
			window.print();
		})(jQuery);
		</script>
	</body>
</html>