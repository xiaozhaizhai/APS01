	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1415336450425')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_routine_config_rootref_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_routine_config_rootref_queryForm" exportUrl="/MESBasic/routine/config/rootref-query.action">
		<input type="hidden" reset="false" name="MESBasic_routine_config_rootref_condition" id="MESBasic_routine_config_rootref_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1415337833221')}_${getText('MESBasic.viewtitle.randon1428478760096')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<#assign advFlag = getAdvClassific('MESBasic_1_routine_rootref')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_routine_rootref" formId="ec_MESBasic_routine_config_rootref_queryForm" dataTableId="ec_MESBasic_routine_config_rootref_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_routine_config_rootref_queryForm"  formId="ec_MESBasic_routine_config_rootref_queryForm" idprefix="ec_MESBasic_routine_config_rootref" expandType="single"  fieldcodes="MESBasic_1_routine_Config_formula_formula:MESBasic.propertydisplayName.randon1426644791679||MESBasic_1_routine_Config_isDefault_isDefault:MESBasic.propertydisplayName.radion1416558214312||MESBasic_1_routine_Config_maxAggValue_maxAggValue:MESBasic.propertydisplayName.radion1415338029833||MESBasic_1_routine_Config_name_name:MESBasic.propertydisplayName.radion1416558524615" > 
							<@queryfield formId="ec_MESBasic_routine_config_rootref_queryForm" code="MESBasic_1_routine_Config_formula" showFormat="TEXT" divCode="MESBasic_1_routine_Config_formula_formula" isCustomize=true > 
							<#assign formula_defaultValue  = ''>
									<#assign formula_defaultValue  = ''>
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="formula" id="formula" value="${formula_defaultValue!}" deValue="${formula_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<@queryfield formId="ec_MESBasic_routine_config_rootref_queryForm" code="MESBasic_1_routine_Config_isDefault" showFormat="SELECT" divCode="MESBasic_1_routine_Config_isDefault_isDefault" isCustomize=true > 
							<#assign isDefault_defaultValue  = 'true'>
									<#assign isDefault_defaultValue  = 'true'>
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${isDefault_defaultValue!}" name="isDefault" id="isDefault" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (isDefault_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (isDefault_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<@queryfield formId="ec_MESBasic_routine_config_rootref_queryForm" code="MESBasic_1_routine_Config_maxAggValue" showFormat="TEXT" divCode="MESBasic_1_routine_Config_maxAggValue_maxAggValue" isCustomize=true > 
							<#assign maxAggValue_defaultValue  = ''>
									<#assign maxAggValue_defaultValue  = ''>
										<div>
									  	 	<div style="float:left;width:45%">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" class="cui-noborder-input" style="*padding-right:0px;" name="maxAggValue_start" id="maxAggValue_start" value="${maxAggValue_defaultValue!}" deValue="${maxAggValue_defaultValue!}"   exp="equal"/>
											</div></div>
											</div>
											<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
											<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" class="cui-noborder-input" style="*padding-right:0px;" name="maxAggValue_end" id="maxAggValue_end" value="${maxAggValue_defaultValue!}" deValue="${maxAggValue_defaultValue!}"   exp="equal"/>
									  		</div></div>
									  		</div>
								  		</div>
							</@queryfield>
							<@queryfield formId="ec_MESBasic_routine_config_rootref_queryForm" code="MESBasic_1_routine_Config_name" showFormat="TEXT" divCode="MESBasic_1_routine_Config_name_name" isCustomize=true > 
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_routine_config_rootref_queryForm" type="search" onclick="MESBasic.routine.config.rootref.commonQuery('query')" /> 
						 		<@querybutton formId="ec_MESBasic_routine_config_rootref_queryForm" type="clear"  />
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
<#assign datatable_queryFunc = "MESBasic.routine.config.rootref.query('query')">
<#assign datatable_dataUrl = "/MESBasic/routine/config/rootref-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_MESBasic_routine_config_rootref_query" renderOverEvent="ec_MESBasic_routine_config_rootref_RenderOverEvent" pageInitMethod="ec_MESBasic_routine_config_rootref_PageInitMethod" modelCode="MESBasic_1_routine_Config" noPermissionKeys="name,isDefault,maxAggValue,pumpBelong,formula" hidekeyPrefix="ec_MESBasic_routine_config_rootref_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_routine_config_rootref_queryForm" firstLoad=datatable_firstLoad  exportExcel=true dblclick="MESBasic.routine.config.rootref.sendBackrootref" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','pumpBelong.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="MESBasic.routine.config.rootref.showErrorMsg">
					<#if flowBulkFlag?? && flowBulkFlag==true>
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('MESBasic.propertydisplayName.radion1416558524615')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign isDefault_displayDefaultType  = ''>
			<@datacolumn columnName="IS_DEFAULT"    showFormat="CHECKBOX" defaultDisplay="${isDefault_displayDefaultType!}"  key="isDefault"   label="${getText('MESBasic.propertydisplayName.radion1416558214312')}" textalign="center"  width=100   type="boolean"    showFormatFunc=""/>
			<#assign maxAggValue_displayDefaultType  = ''>
			<@datacolumn columnName="MAX_AGG_VALUE"    showFormat="TEXT" defaultDisplay="${maxAggValue_displayDefaultType!}"  key="maxAggValue"   label="${getText('MESBasic.propertydisplayName.radion1415338029833')}" textalign="right" decimal="4" width=100   type="decimal"    showFormatFunc=""/>
			<#assign pumpBelong_displayDefaultType  = ''>
			<@datacolumn columnName="PUMP_BELONG"    showFormat="SELECTCOMP" defaultDisplay="${pumpBelong_displayDefaultType!}"  key="pumpBelong.value"   label="${getText('MESBasic.propertydisplayName.radion1415338200540')}" textalign="center"  width=100   type="systemcode"    showFormatFunc=""/>
			<#assign formula_displayDefaultType  = ''>
			<@datacolumn columnName="FORMULA"    showFormat="TEXT" defaultDisplay="${formula_displayDefaultType!}"  key="formula"   label="${getText('MESBasic.propertydisplayName.randon1426644791679')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_routine_config_rootref_RenderOverEvent(){
}
function ec_MESBasic_routine_config_rootref_PageInitMethod(){
}
	
	
	
	
	
</script>