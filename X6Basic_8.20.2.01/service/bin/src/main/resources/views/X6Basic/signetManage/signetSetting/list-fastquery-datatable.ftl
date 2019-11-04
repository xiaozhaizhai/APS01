	<#if businessCenterCode?? >
	<div>
	<div class="edit-menubar"><span class="title-bar">${getText('X6Basic.entityname.radion1367133380805')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_X6Basic_signetManage_signetSetting_list_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_X6Basic_signetManage_signetSetting_list_queryForm" exportUrl="/X6Basic/signetManage/signetSetting/list-query.action">
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="ownerStaff" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="effectStaff" />
		<input type="hidden" id="sysbase_1_0_user_base_user" value="userinfo" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="createStaff" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="modifyStaff" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="deleteStaff" />
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('X6Basic.modelname.radion1367133428061')}_${getText('X6Basic.viewtitle.radion1367133870220')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<#assign advFlag = getAdvClassific('X6Basic_1.0_signetManage_list')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="X6Basic_1.0_signetManage_list" formId="ec_X6Basic_signetManage_signetSetting_list_queryForm" dataTableId="ec_X6Basic_signetManage_signetSetting_list_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_X6Basic_signetManage_signetSetting_list_queryForm" formId="ec_X6Basic_signetManage_signetSetting_list_queryForm"  fieldcodes="X6Basic_1.0_signetManage_SignetSetting_name_name:X6Basic.propertydisplayName.radion1367133494680||base_user_name_userinfo_name:X6Basic.propertydisplayName.radion1367133528419" > 
							<@queryfield formId="ec_X6Basic_signetManage_signetSetting_list_queryForm" code="X6Basic_1.0_signetManage_SignetSetting_name" divCode="X6Basic_1.0_signetManage_SignetSetting_name_name" isCustomize=true > 
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<@queryfield formId="ec_X6Basic_signetManage_signetSetting_list_queryForm" code="base_user_name" divCode="base_user_name_userinfo_name" isCustomize=true > 
							<#assign userinfo_name_defaultValue  = ''>
									<#assign userinfo_name_defaultValue  = ''>
										<input type="hidden" id="userinfo.id" name="userinfo.id" value="" />
												<@mneclient  reftitle="${getText('foundation.viewtitle.radion1367482692266')}"  conditionfunc="X6Basic.signetManage.signetSetting.list._querycustomFunc('userinfo_name')" name="userinfo.name" id="ec_X6Basic_signetManage_signetSetting_list_queryForm_userinfo_name" displayFieldName="name" type="User" exp="like" classStyle="cui-noborder-input" url="/foundation/user/common/userListFrameset.action" clicked=true multiple=false mnewidth=260 formId="ec_X6Basic_signetManage_signetSetting_list_queryForm" searchClick="X6Basic.signetManage.signetSetting.list.query('query')" />
							</@queryfield>
					       	<@querybutton formId="ec_X6Basic_signetManage_signetSetting_list_queryForm" type="adv" onclick="X6Basic.signetManage.signetSetting.list.query('query')" onadvancedclick="advQuery()" /> 
					 		<@querybutton formId="ec_X6Basic_signetManage_signetSetting_list_queryForm" type="clear"  /> 
					     </@quickquery>
	</form>
</div><#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "X6Basic.signetManage.signetSetting.list.query('query')">
<#assign datatable_dataUrl = "/X6Basic/signetManage/signetSetting/list-query.action">
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_X6Basic_signetManage_signetSetting_list_query" modelCode="X6Basic_1.0_signetManage_SignetSetting" noPermissionKeys="name,userinfo.name" hidekeyPrefix="ec_X6Basic_signetManage_signetSetting_list_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_X6Basic_signetManage_signetSetting_list_queryForm" firstLoad=datatable_firstLoad  exportExcel=true dblclick="X6Basic.signetManage.signetSetting.list.dbmodifylist" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','userinfo.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}">
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:list_add_add_X6Basic_1.0_signetManage_list||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1367477890850')}||iconcls:add||useInMore:false||onclick:
				X6Basic.signetManage.signetSetting.list.addlist()
		" 
		resultType="json" />
		
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:list_delete_del_X6Basic_1.0_signetManage_list||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1367477948410')}||iconcls:del||useInMore:false||onclick:
				X6Basic.signetManage.signetSetting.list.dellist()
		" 
		resultType="json" />
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		</#if>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"  label="${getText('X6Basic.propertydisplayName.radion1367133494680')}" textalign="center"  width=100  type="textfield"    />
			<#assign singetType_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${singetType_displayDefaultType!}"  key="singetType.value"  label="${getText('X6Basic.propertydisplayName.radion1367495506000')}" textalign="center"  width=100  type="systemcode"    />
			<@datacolumn   showFormat="TEXT" defaultDisplay="${userinfo_name_displayDefaultType!}"  key="userinfo.name"  label="${getText('X6Basic.propertydisplayName.radion1367133528419')}" textalign="left"  width=100  type="textfield"    />
</@datatable>