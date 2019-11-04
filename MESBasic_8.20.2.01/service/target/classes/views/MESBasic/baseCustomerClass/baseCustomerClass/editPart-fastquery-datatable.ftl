	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1436773593006')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm" exportUrl="/MESBasic/baseCustomerClass/baseCustomerClass/editPart-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1436773722797')}_${getText('MESBasic.viewtitle.randon1436775112476')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<#assign advFlag = getAdvClassific('MESBasic_1_baseCustomerClass_editPart')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_baseCustomerClass_editPart" formId="ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm" dataTableId="ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm"  formId="ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm" idprefix="ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart" expandType="single"  fieldcodes="MESBasic_1_baseCustomerClass_BaseCustomerClass_ccCode_ccCode:MESBasic.propertydisplayName.randon1436773901012||MESBasic_1_baseCustomerClass_BaseCustomerClass_ccNAME_ccNAME:MESBasic.propertydisplayName.randon1436773836491" > 
							<#assign ccCode_defaultValue  = ''>
									<#assign ccCode_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm" code="MESBasic_1_baseCustomerClass_BaseCustomerClass_ccCode" showFormat="TEXT" defaultValue=ccCode_defaultValue  divCode="MESBasic_1_baseCustomerClass_BaseCustomerClass_ccCode_ccCode" isCustomize=true > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="ccCode" id="ccCode" value="${ccCode_defaultValue!}" deValue="${ccCode_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<#assign ccNAME_defaultValue  = ''>
									<#assign ccNAME_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm" code="MESBasic_1_baseCustomerClass_BaseCustomerClass_ccNAME" showFormat="TEXT" defaultValue=ccNAME_defaultValue  divCode="MESBasic_1_baseCustomerClass_BaseCustomerClass_ccNAME_ccNAME" isCustomize=true > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="ccNAME" id="ccNAME" value="${ccNAME_defaultValue!}" deValue="${ccNAME_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm" type="adv" onclick="MESBasic.baseCustomerClass.baseCustomerClass.editPart.commonQuery('query')" onadvancedclick="advQuery()" /> 
						 		<@querybutton formId="ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm" type="clear"  />
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
<#assign datatable_queryFunc = "MESBasic.baseCustomerClass.baseCustomerClass.editPart.query('query')">
<#assign datatable_dataUrl = "/MESBasic/baseCustomerClass/baseCustomerClass/editPart-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable   id="ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_query" renderOverEvent="ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_RenderOverEvent" pageInitMethod="ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_PageInitMethod" modelCode="MESBasic_1_baseCustomerClass_BaseCustomerClass" noPermissionKeys="ccCode,ccNAME,ccMemo" hidekeyPrefix="ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_queryForm" firstLoad=datatable_firstLoad  exportExcel=true dblclick="MESBasic.baseCustomerClass.baseCustomerClass.editPart.dbmodifyeditPart" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.baseCustomerClass.baseCustomerClass.editPart.showErrorMsg">
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}editPart_add_add_MESBasic_1_baseCustomerClass_editPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1436776352965')}||iconcls:add||useInMore:false||onclick:
					doAdd()
		" 
		 operateType="noPower"
		resultType="json" />
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}editPart_edit_modify_MESBasic_1_baseCustomerClass_editPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1418609006622')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.baseCustomerClass.baseCustomerClass.editPart.modifyeditPart()
		" 
		resultType="json" />
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}editPart_del_del_MESBasic_1_baseCustomerClass_editPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1414981388059')}||iconcls:del||useInMore:false||onclick:
					doDel()
		" 
		 operateType="noPower"
		resultType="json" />
					<#if flowBulkFlag?? && flowBulkFlag==true>
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign ccCode_displayDefaultType  = ''>
			<@datacolumn columnName="CC_CODE"    showFormat="TEXT" defaultDisplay="${ccCode_displayDefaultType!}"  key="ccCode"   label="${getText('MESBasic.propertydisplayName.randon1436773901012')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign ccNAME_displayDefaultType  = ''>
			<@datacolumn columnName="CC_NAME"    showFormat="TEXT" defaultDisplay="${ccNAME_displayDefaultType!}"  key="ccNAME"   label="${getText('MESBasic.propertydisplayName.randon1436773836491')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign ccMemo_displayDefaultType  = ''>
			<@datacolumn columnName="CC_MEMO"    showFormat="TEXT" defaultDisplay="${ccMemo_displayDefaultType!}"  key="ccMemo"   label="${getText('MESBasic.propertydisplayName.randon1436773942009')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_RenderOverEvent(){
}
function ec_MESBasic_baseCustomerClass_baseCustomerClass_editPart_PageInitMethod(){
}
	
	
	
</script>