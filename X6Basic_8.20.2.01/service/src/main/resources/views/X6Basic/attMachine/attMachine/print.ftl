	<#assign  fileuploadType = "X6Basic_attMachine_attMachine">
	<#assign fileuploadLinkId = id!>
<#assign viewType = "readonly">
<#assign newObj = false >
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>${getText('X6Basic.viewtitle.radion1367140362120')}</title>
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
		<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="X6Basic_attMachine_attMachine_edit_main_div">
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
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr>
				
							 					<#if !X6Basic_1_0_attMachine_AttMachine_code_permit??>
					<#assign X6Basic_1_0_attMachine_AttMachine_code_permit = checkFieldPermission('attMachine.code','X6Basic_1.0_attMachine_AttMachine','X6Basic_1.0_attMachine_AttMachine_code')>
					</#if>
					<td <#if X6Basic_1_0_attMachine_AttMachine_code_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"  width="13%" align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_attMachine_AttMachine_code_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367138903063')}" >${getText('X6Basic.propertydisplayName.radion1367138903063')}</label>
				</td>
				
							 					<#if !X6Basic_1_0_attMachine_AttMachine_code_permit??>
					<#assign X6Basic_1_0_attMachine_AttMachine_code_permit = checkFieldPermission('attMachine.code','X6Basic_1.0_attMachine_AttMachine','X6Basic_1.0_attMachine_AttMachine_code')>
					</#if>
					<td <#if X6Basic_1_0_attMachine_AttMachine_code_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"  width="20%" style="text-align: left;;" >
							<#if X6Basic_1_0_attMachine_AttMachine_code_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input name="attMachine.code" id="attMachine_code"  style=";"  value="${(attMachine.code?html)!}" type="text" class="cui-noborder-input " readonly="readonly"/>
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_attMachine_AttMachine_name_permit??>
					<#assign X6Basic_1_0_attMachine_AttMachine_name_permit = checkFieldPermission('attMachine.name','X6Basic_1.0_attMachine_AttMachine','X6Basic_1.0_attMachine_AttMachine_name')>
					</#if>
					<td <#if X6Basic_1_0_attMachine_AttMachine_name_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"  width="13%" align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_attMachine_AttMachine_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367138883847')}" >${getText('X6Basic.propertydisplayName.radion1367138883847')}</label>
				</td>
				
							 					<#if !X6Basic_1_0_attMachine_AttMachine_name_permit??>
					<#assign X6Basic_1_0_attMachine_AttMachine_name_permit = checkFieldPermission('attMachine.name','X6Basic_1.0_attMachine_AttMachine','X6Basic_1.0_attMachine_AttMachine_name')>
					</#if>
					<td <#if X6Basic_1_0_attMachine_AttMachine_name_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"  width="20%" style="text-align: left;;" >
							<#if X6Basic_1_0_attMachine_AttMachine_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input name="attMachine.name" id="attMachine_name"  style=";"  value="${(attMachine.name?html)!}" type="text" class="cui-noborder-input " readonly="readonly"/>
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_attMachine_AttMachine_attType_permit??>
					<#assign X6Basic_1_0_attMachine_AttMachine_attType_permit = checkFieldPermission('attMachine.attType','X6Basic_1.0_attMachine_AttMachine','X6Basic_1.0_attMachine_AttMachine_attType')>
					</#if>
					<td <#if X6Basic_1_0_attMachine_AttMachine_attType_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"  width="13%" align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_attMachine_AttMachine_attType_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367139789420')}" >${getText('X6Basic.propertydisplayName.radion1367139789420')}</label>
				</td>
				
							 					<#if !X6Basic_1_0_attMachine_AttMachine_attType_permit??>
					<#assign X6Basic_1_0_attMachine_AttMachine_attType_permit = checkFieldPermission('attMachine.attType','X6Basic_1.0_attMachine_AttMachine','X6Basic_1.0_attMachine_AttMachine_attType')>
					</#if>
					<td <#if X6Basic_1_0_attMachine_AttMachine_attType_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"  width="20%" style="text-align: left;;" >
							<#if X6Basic_1_0_attMachine_AttMachine_attType_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<@systemcode onchange=""  viewType="readonly"  formId="X6Basic_attMachine_attMachine_edit_form" classStyle="cui-noborder-input" view=true cssStyle="" name="attMachine.attType.id" code="attType" value="${(attMachine.attType.id)!}" />
							</#if>
				</td>
				</tr><tr>
							 					<#if !X6Basic_1_0_attMachine_AttMachine_ifatt_permit??>
					<#assign X6Basic_1_0_attMachine_AttMachine_ifatt_permit = checkFieldPermission('attMachine.ifatt','X6Basic_1.0_attMachine_AttMachine','X6Basic_1.0_attMachine_AttMachine_ifatt')>
					</#if>
					<td <#if X6Basic_1_0_attMachine_AttMachine_ifatt_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_attMachine_AttMachine_ifatt_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367138009522')}" >${getText('X6Basic.propertydisplayName.radion1367138009522')}</label>
				</td>
				
							 					<#if !X6Basic_1_0_attMachine_AttMachine_ifatt_permit??>
					<#assign X6Basic_1_0_attMachine_AttMachine_ifatt_permit = checkFieldPermission('attMachine.ifatt','X6Basic_1.0_attMachine_AttMachine','X6Basic_1.0_attMachine_AttMachine_ifatt')>
					</#if>
					<td <#if X6Basic_1_0_attMachine_AttMachine_ifatt_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_attMachine_AttMachine_ifatt_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if X6Basic_1_0_attMachine_AttMachine_ifatt_permit == 0>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
								<#else>
								<input type="checkbox" style=";" class="ec_radio" name="attMachine.ifatt_check"  value="${(attMachine.ifatt!false)?string('true','false')}"  disabled=true/>
								</#if>
								<input type="hidden" name="attMachine.ifatt"  value="<#if (attMachine.ifatt)?? &&  attMachine.ifatt>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="attMachine.ifatt_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
										}catch(e){}	
									});
								</script>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_attMachine_AttMachine_ifconsume_permit??>
					<#assign X6Basic_1_0_attMachine_AttMachine_ifconsume_permit = checkFieldPermission('attMachine.ifconsume','X6Basic_1.0_attMachine_AttMachine','X6Basic_1.0_attMachine_AttMachine_ifconsume')>
					</#if>
					<td <#if X6Basic_1_0_attMachine_AttMachine_ifconsume_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_attMachine_AttMachine_ifconsume_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367138822787')}" >${getText('X6Basic.propertydisplayName.radion1367138822787')}</label>
				</td>
				
							 					<#if !X6Basic_1_0_attMachine_AttMachine_ifconsume_permit??>
					<#assign X6Basic_1_0_attMachine_AttMachine_ifconsume_permit = checkFieldPermission('attMachine.ifconsume','X6Basic_1.0_attMachine_AttMachine','X6Basic_1.0_attMachine_AttMachine_ifconsume')>
					</#if>
					<td <#if X6Basic_1_0_attMachine_AttMachine_ifconsume_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_attMachine_AttMachine_ifconsume_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if X6Basic_1_0_attMachine_AttMachine_ifconsume_permit == 0>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
								<#else>
								<input type="checkbox" style=";" class="ec_radio" name="attMachine.ifconsume_check"  value="${(attMachine.ifconsume!false)?string('true','false')}"  disabled=true/>
								</#if>
								<input type="hidden" name="attMachine.ifconsume"  value="<#if (attMachine.ifconsume)?? &&  attMachine.ifconsume>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="attMachine.ifconsume_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
										}catch(e){}	
									});
								</script>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_attMachine_AttMachine_ifMeeting_permit??>
					<#assign X6Basic_1_0_attMachine_AttMachine_ifMeeting_permit = checkFieldPermission('attMachine.ifMeeting','X6Basic_1.0_attMachine_AttMachine','X6Basic_1.0_attMachine_AttMachine_ifMeeting')>
					</#if>
					<td <#if X6Basic_1_0_attMachine_AttMachine_ifMeeting_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_attMachine_AttMachine_ifMeeting_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367138856827')}" >${getText('X6Basic.propertydisplayName.radion1367138856827')}</label>
				</td>
				
							 					<#if !X6Basic_1_0_attMachine_AttMachine_ifMeeting_permit??>
					<#assign X6Basic_1_0_attMachine_AttMachine_ifMeeting_permit = checkFieldPermission('attMachine.ifMeeting','X6Basic_1.0_attMachine_AttMachine','X6Basic_1.0_attMachine_AttMachine_ifMeeting')>
					</#if>
					<td <#if X6Basic_1_0_attMachine_AttMachine_ifMeeting_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_attMachine_AttMachine_ifMeeting_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if X6Basic_1_0_attMachine_AttMachine_ifMeeting_permit == 0>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
								<#else>
								<input type="checkbox" style=";" class="ec_radio" name="attMachine.ifMeeting_check"  value="${(attMachine.ifMeeting!false)?string('true','false')}"  disabled=true/>
								</#if>
								<input type="hidden" name="attMachine.ifMeeting"  value="<#if (attMachine.ifMeeting)?? &&  attMachine.ifMeeting>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="attMachine.ifMeeting_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
										}catch(e){}	
									});
								</script>
							</#if>
				</td>
				</tr><tr>
							 					<#if !X6Basic_1_0_attMachine_AttMachine_databaseName_permit??>
					<#assign X6Basic_1_0_attMachine_AttMachine_databaseName_permit = checkFieldPermission('attMachine.databaseName','X6Basic_1.0_attMachine_AttMachine','X6Basic_1.0_attMachine_AttMachine_databaseName')>
					</#if>
					<td <#if X6Basic_1_0_attMachine_AttMachine_databaseName_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_attMachine_AttMachine_databaseName_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367137956975')}" >${getText('X6Basic.propertydisplayName.radion1367137956975')}</label>
				</td>
				
							 					<#if !X6Basic_1_0_attMachine_AttMachine_databaseName_permit??>
					<#assign X6Basic_1_0_attMachine_AttMachine_databaseName_permit = checkFieldPermission('attMachine.databaseName','X6Basic_1.0_attMachine_AttMachine','X6Basic_1.0_attMachine_AttMachine_databaseName')>
					</#if>
					<td <#if X6Basic_1_0_attMachine_AttMachine_databaseName_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   style="text-align: left;;" >
							<#if X6Basic_1_0_attMachine_AttMachine_databaseName_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input name="attMachine.databaseName" id="attMachine_databaseName"  style=";"  value="${(attMachine.databaseName?html)!}" type="text" class="cui-noborder-input " readonly="readonly"/>
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_attMachine_AttMachine_userName_permit??>
					<#assign X6Basic_1_0_attMachine_AttMachine_userName_permit = checkFieldPermission('attMachine.userName','X6Basic_1.0_attMachine_AttMachine','X6Basic_1.0_attMachine_AttMachine_userName')>
					</#if>
					<td <#if X6Basic_1_0_attMachine_AttMachine_userName_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_attMachine_AttMachine_userName_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367139879978')}" >${getText('X6Basic.propertydisplayName.radion1367139879978')}</label>
				</td>
				
							 					<#if !X6Basic_1_0_attMachine_AttMachine_userName_permit??>
					<#assign X6Basic_1_0_attMachine_AttMachine_userName_permit = checkFieldPermission('attMachine.userName','X6Basic_1.0_attMachine_AttMachine','X6Basic_1.0_attMachine_AttMachine_userName')>
					</#if>
					<td <#if X6Basic_1_0_attMachine_AttMachine_userName_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   style="text-align: left;;" >
							<#if X6Basic_1_0_attMachine_AttMachine_userName_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input name="attMachine.userName" id="attMachine_userName"  style=";"  value="${(attMachine.userName?html)!}" type="text" class="cui-noborder-input " readonly="readonly"/>
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !X6Basic_1_0_attMachine_AttMachine_pwd_permit??>
					<#assign X6Basic_1_0_attMachine_AttMachine_pwd_permit = checkFieldPermission('attMachine.pwd','X6Basic_1.0_attMachine_AttMachine','X6Basic_1.0_attMachine_AttMachine_pwd')>
					</#if>
					<td <#if X6Basic_1_0_attMachine_AttMachine_pwd_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_attMachine_AttMachine_pwd_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367138937267')}" >${getText('X6Basic.propertydisplayName.radion1367138937267')}</label>
				</td>
				
							 					<#if !X6Basic_1_0_attMachine_AttMachine_pwd_permit??>
					<#assign X6Basic_1_0_attMachine_AttMachine_pwd_permit = checkFieldPermission('attMachine.pwd','X6Basic_1.0_attMachine_AttMachine','X6Basic_1.0_attMachine_AttMachine_pwd')>
					</#if>
					<td <#if X6Basic_1_0_attMachine_AttMachine_pwd_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   style="text-align: left;;" >
							<#if X6Basic_1_0_attMachine_AttMachine_pwd_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input name="attMachine.pwd" id="attMachine_pwd"  style=";"  value="${(attMachine.pwd?html)!}" type="text" class="cui-noborder-input " readonly="readonly"/>
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr>
							 					<#if !X6Basic_1_0_attMachine_AttMachine_url_permit??>
					<#assign X6Basic_1_0_attMachine_AttMachine_url_permit = checkFieldPermission('attMachine.url','X6Basic_1.0_attMachine_AttMachine','X6Basic_1.0_attMachine_AttMachine_url')>
					</#if>
					<td <#if X6Basic_1_0_attMachine_AttMachine_url_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_attMachine_AttMachine_url_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367139816743')}" >${getText('X6Basic.propertydisplayName.radion1367139816743')}</label>
				</td>
				
							 					<#if !X6Basic_1_0_attMachine_AttMachine_url_permit??>
					<#assign X6Basic_1_0_attMachine_AttMachine_url_permit = checkFieldPermission('attMachine.url','X6Basic_1.0_attMachine_AttMachine','X6Basic_1.0_attMachine_AttMachine_url')>
					</#if>
					<td <#if X6Basic_1_0_attMachine_AttMachine_url_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   colspan="5" style="text-align: left;;" >
							<#if X6Basic_1_0_attMachine_AttMachine_url_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input name="attMachine.url" id="attMachine_url"  style=";"  value="${(attMachine.url?html)!}" type="text" class="cui-noborder-input " readonly="readonly"/>
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr>
							 					<#if !X6Basic_1_0_attMachine_AttMachine_instructions_permit??>
					<#assign X6Basic_1_0_attMachine_AttMachine_instructions_permit = checkFieldPermission('attMachine.instructions','X6Basic_1.0_attMachine_AttMachine','X6Basic_1.0_attMachine_AttMachine_instructions')>
					</#if>
					<td <#if X6Basic_1_0_attMachine_AttMachine_instructions_permit != 3>nofieldPermission="true"</#if>  class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if X6Basic_1_0_attMachine_AttMachine_instructions_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1367137982091')}" >${getText('X6Basic.propertydisplayName.radion1367137982091')}</label>
				</td>
				
							 					<#if !X6Basic_1_0_attMachine_AttMachine_instructions_permit??>
					<#assign X6Basic_1_0_attMachine_AttMachine_instructions_permit = checkFieldPermission('attMachine.instructions','X6Basic_1.0_attMachine_AttMachine','X6Basic_1.0_attMachine_AttMachine_instructions')>
					</#if>
					<td <#if X6Basic_1_0_attMachine_AttMachine_instructions_permit != 3>nofieldPermission="true"</#if>  class="edit-table-content"   colspan="5" align="left" style="text-align: left;;" >
							<#if X6Basic_1_0_attMachine_AttMachine_instructions_permit == 0>
							<div class="fix-input-readonly fix-ie7-textarea"><textarea id="attMachine_instructions" class="cui-noborder-textarea nopermit cui-textarea-wh" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"></textarea></div>
							<#else>
							<div class="fix-input-readonly fix-ie7-textarea"><textarea id="attMachine_instructions"  name="attMachine.instructions" class="cui-noborder-textarea cui-textarea-wh" readonly="readonly" style="height:160px;" >${(attMachine.instructions)!}</textarea></div>
							</#if>
							<script type="text/javascript">
								$(function(){
									CUI["attMachine_instructionscompleteFlag"] = "first";
									autoTextarea("attMachine_instructions");
									//有业务中心的时候,非ie浏览器需要手动再延迟触发一次
									if(YAHOO.env.ua.ie == 0){
										setTimeout(function(){autoTextarea("attMachine_instructions")},200);
									}
								})
							</script>
				</td>
				</tr><tr>
				
				
				
				
				
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
		
		<!-- CUSTOM CODE START(view-EDIT-X6Basic_1.0_attMachine_edit,html,X6Basic_1.0_attMachine_AttMachine,X6Basic_1.0) -->
<!-- 自定义代码 -->
<!-- CUSTOM CODE END -->		
		<script type="text/javascript">
		(function($){
			if(CUI("#fileAttachmentDiv")){
				CUI("#fileAttachmentDiv").load("/ec/print/fileupload-print.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}");
			}
			if(CUI("#dealInfoContain")){
				CUI("#dealInfoContain").load("/ec/workflow/dealInfo.action?dlTableInfoId=${tableInfoId!}&preName=mainFrame&dealDataUrl=/X6Basic/attMachine/attMachine/dealInfo-list.action");
			}
			window.print();
		})(jQuery);
		</script>
	</body>
</html>