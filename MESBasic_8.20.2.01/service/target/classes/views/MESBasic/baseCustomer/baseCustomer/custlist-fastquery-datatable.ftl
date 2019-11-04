	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1436499337898')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_baseCustomer_baseCustomer_custlist_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm" exportUrl="/MESBasic/baseCustomer/baseCustomer/custlist-query.action">
		<input type="hidden" id="MESBasic_1_baseCustomerClass_BaseCustomerClass" value="customerCcCode" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1436499407799')}_${getText('MESBasic.viewtitle.randon1436842127173')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<#assign advFlag = getAdvClassific('MESBasic_1_baseCustomer_custlist')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_baseCustomer_custlist" formId="ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm" dataTableId="ec_MESBasic_baseCustomer_baseCustomer_custlist_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm"  formId="ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm" idprefix="ec_MESBasic_baseCustomer_baseCustomer_custlist" expandType="single"  fieldcodes="MESBasic_1_baseCustomer_BaseCustomer_customerCode_customerCode:MESBasic.propertydisplayName.randon1436499489164||MESBasic_1_baseCustomer_BaseCustomer_customerName_customerName:MESBasic.propertydisplayName.randon1436499520719||MESBasic_1_baseCustomer_BaseCustomer_customerShortName_customerShortName:MESBasic.propertydisplayName.randon1436499618182" > 
							<#assign customerCode_defaultValue  = ''>
									<#assign customerCode_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm" code="MESBasic_1_baseCustomer_BaseCustomer_customerCode" showFormat="TEXT" defaultValue=customerCode_defaultValue  divCode="MESBasic_1_baseCustomer_BaseCustomer_customerCode_customerCode" isCustomize=true > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="customerCode" id="customerCode" value="${customerCode_defaultValue!}" deValue="${customerCode_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<#assign customerName_defaultValue  = ''>
									<#assign customerName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm" code="MESBasic_1_baseCustomer_BaseCustomer_customerName" showFormat="TEXT" defaultValue=customerName_defaultValue  divCode="MESBasic_1_baseCustomer_BaseCustomer_customerName_customerName" isCustomize=true > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="customerName" id="customerName" value="${customerName_defaultValue!}" deValue="${customerName_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<#assign customerShortName_defaultValue  = ''>
									<#assign customerShortName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm" code="MESBasic_1_baseCustomer_BaseCustomer_customerShortName" showFormat="TEXT" defaultValue=customerShortName_defaultValue  divCode="MESBasic_1_baseCustomer_BaseCustomer_customerShortName_customerShortName" isCustomize=true > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="customerShortName" id="customerShortName" value="${customerShortName_defaultValue!}" deValue="${customerShortName_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm" type="adv" onclick="MESBasic.baseCustomer.baseCustomer.custlist.commonQuery('query')" onadvancedclick="advQuery()" /> 
						 		<@querybutton formId="ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div><#assign superChecked = false>
<#assign superCheckedName = "id">
<#assign superCheckedId = "id">
<#assign checkedRowsMap = "{}">
<#if (Parameters.superCheckedId)??>
<#assign superChecked = true>
<#assign superCheckedId = (Parameters.superCheckedId)>
</#if>
<#if (Parameters.superCheckedName)??>
<#assign superChecked = true>
<#assign superCheckedName = (Parameters.superCheckedName)>
</#if>
<#if (Parameters.checkedRowsMap)??>
<#assign checkedRowsMap = (Parameters.checkedRowsMap)>
</#if>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "MESBasic.baseCustomer.baseCustomer.custlist.query('query')">
<#assign datatable_dataUrl = "/MESBasic/baseCustomer/baseCustomer/custlist-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable   id="ec_MESBasic_baseCustomer_baseCustomer_custlist_query" renderOverEvent="ec_MESBasic_baseCustomer_baseCustomer_custlist_RenderOverEvent" pageInitMethod="ec_MESBasic_baseCustomer_baseCustomer_custlist_PageInitMethod" modelCode="MESBasic_1_baseCustomer_BaseCustomer" noPermissionKeys="customerCode,customerName,customerShortName,customerCcCode.ccNAME,customerState" hidekeyPrefix="ec_MESBasic_baseCustomer_baseCustomer_custlist_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_baseCustomer_baseCustomer_custlist_queryForm" firstLoad=datatable_firstLoad  exportExcel=true dblclick="MESBasic.baseCustomer.baseCustomer.custlist.dbmodifycustlist" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','customerState','customerCcCode.id','customerCcCode.ccCode']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.baseCustomer.baseCustomer.custlist.showErrorMsg">
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}custlist_add_add_MESBasic_1_baseCustomer_custlist||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1436776352965')}||iconcls:add||useInMore:false||onclick:
					doAdd()
		" 
		 operateType="noPower"
		resultType="json" />
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}custlist_modify_modify_MESBasic_1_baseCustomer_custlist||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1418609006622')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.baseCustomer.baseCustomer.custlist.modifycustlist()
		" 
		resultType="json" />
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}custlist_delete_del_MESBasic_1_baseCustomer_custlist||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1414981388059')}||iconcls:del||useInMore:false||onclick:
				MESBasic.baseCustomer.baseCustomer.custlist.delcustlist()
		" 
		resultType="json" />
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}custlist_doEnableCustomer_none_MESBasic_1_baseCustomer_custlist||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1417568057947')}||iconcls:none||useInMore:false||onclick:
					doEnableCustomer()
		" 
		 operateType="noPower"
		resultType="json" />
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}custlist_doDisableCustomer_none_MESBasic_1_baseCustomer_custlist||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1417568120879')}||iconcls:none||useInMore:false||onclick:
					doDisableCustomer()
		" 
		 operateType="noPower"
		resultType="json" />
					<#if flowBulkFlag?? && flowBulkFlag==true>
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign customerCode_displayDefaultType  = ''>
			<@datacolumn columnName="CUSTOMER_CODE"    showFormat="TEXT" defaultDisplay="${customerCode_displayDefaultType!}"  key="customerCode"   label="${getText('MESBasic.propertydisplayName.randon1436499489164')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign customerName_displayDefaultType  = ''>
			<@datacolumn columnName="CUSTOMER_NAME"    showFormat="TEXT" defaultDisplay="${customerName_displayDefaultType!}"  key="customerName"   label="${getText('MESBasic.propertydisplayName.randon1436499520719')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign customerShortName_displayDefaultType  = ''>
			<@datacolumn columnName="CUSTOMER_SHORTNAME"    showFormat="TEXT" defaultDisplay="${customerShortName_displayDefaultType!}"  key="customerShortName"   label="${getText('MESBasic.propertydisplayName.randon1436499618182')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign customerCcCode_ccNAME_displayDefaultType  = ''>
			<@datacolumn columnName="CC_NAME"    showFormat="TEXT" defaultDisplay="${customerCcCode_ccNAME_displayDefaultType!}"  key="customerCcCode.ccNAME"   label="${getText('MESBasic.propertydisplayName.randon1436773836491')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign customerState_displayDefaultType  = ''>
			<@datacolumn columnName="CUSTOMER_STATE"    showFormat="SELECTCOMP" defaultDisplay="${customerState_displayDefaultType!}"  key="customerStateForDisplay" order=false  label="${getText('MESBasic.propertydisplayName.randon1438138865907')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_baseCustomer_baseCustomer_custlist_RenderOverEvent(){
}
function ec_MESBasic_baseCustomer_baseCustomer_custlist_PageInitMethod(){
}
	
	
	
	
	
</script>