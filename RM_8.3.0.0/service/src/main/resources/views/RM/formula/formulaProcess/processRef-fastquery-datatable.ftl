	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('RM.entityname.randon1487075671473')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_RM_formula_formulaProcess_processRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_RM_formula_formulaProcess_processRef_queryForm" exportUrl="/RM/formula/formulaProcess/processRef-query.action">
		<input type="hidden" reset="false" name="RM_formula_formulaProcess_processRef_condition" id="RM_formula_formulaProcess_processRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('RM.modelname.randon1487140927408')}_${getText('RM.viewtitle.randon1487307520161')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<input type="hidden" id="currentSqlType"  value="5" />
		<div id="ec_RM_formula_formulaProcess_processRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_RM_formula_formulaProcess_processRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('RM_7.5.0.0_formula_processRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="RM_7.5.0.0_formula_processRef" formId="ec_RM_formula_formulaProcess_processRef_queryForm" dataTableId="ec_RM_formula_formulaProcess_processRef_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_RM_formula_formulaProcess_processRef_queryForm" isExpandAll=true formId="ec_RM_formula_formulaProcess_processRef_queryForm" idprefix="ec_RM_formula_formulaProcess_processRef" expandType="all"  fieldcodes="RM_7.5.0.0_formula_FormulaProcess_name_name:RM.propertydisplayName.randon1487295011793||RM_7.5.0.0_formula_FormulaProcess_longTime_longTime:RM.propertydisplayName.randon1487292241411" > 
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<@queryfield formId="ec_RM_formula_formulaProcess_processRef_queryForm" code="RM_7.5.0.0_formula_FormulaProcess_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="RM_7.5.0.0_formula_FormulaProcess_name_name" isCustomize=true > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign longTime_defaultValue  = ''>
									<#assign longTime_defaultValue  = ''>
							<@queryfield formId="ec_RM_formula_formulaProcess_processRef_queryForm" code="RM_7.5.0.0_formula_FormulaProcess_longTime" showFormat="TEXT" defaultValue=longTime_defaultValue  divCode="RM_7.5.0.0_formula_FormulaProcess_longTime_longTime" isCustomize=true > 
										<div>
									  	 	<div style="float:left;width:45%">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" class="cui-noborder-input" style="*padding-right:0px;" name="longTime_start" id="longTime_start" value="${longTime_defaultValue!}" deValue="${longTime_defaultValue!}"   exp="equal"/>
											</div></div>
											</div>
											<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
											<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" class="cui-noborder-input" style="*padding-right:0px;" name="longTime_end" id="longTime_end" value="${longTime_defaultValue!}" deValue="${longTime_defaultValue!}"   exp="equal"/>
									  		</div></div>
									  		</div>
								  		</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_RM_formula_formulaProcess_processRef_queryForm" type="search" onclick="RM.formula.formulaProcess.processRef.commonQuery('query')" /> 
						 		<@querybutton formId="ec_RM_formula_formulaProcess_processRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_RM_formula_formulaProcess_processRef_quickquery_info={};
ec_RM_formula_formulaProcess_processRef_quickquery_info["MainTableName"]="RM_FORMULA_PROCESSES";
ec_RM_formula_formulaProcess_processRef_quickquery_info["name"]={};
ec_RM_formula_formulaProcess_processRef_quickquery_info["name"].dbColumnType="TEXT";
ec_RM_formula_formulaProcess_processRef_quickquery_info["name"].layRec="name";
ec_RM_formula_formulaProcess_processRef_quickquery_info["name"].columnName="NAME";
ec_RM_formula_formulaProcess_processRef_quickquery_info["longTime"]={};
ec_RM_formula_formulaProcess_processRef_quickquery_info["longTime"].dbColumnType="DECIMAL";
ec_RM_formula_formulaProcess_processRef_quickquery_info["longTime"].layRec="longTime";
ec_RM_formula_formulaProcess_processRef_quickquery_info["longTime"].columnName="LONG_TIME";
generateChainCond=function(cond,layarr,field){
	if(layarr.length>1){
		var subconds=cond.subconds;
		for(var i=0;i<subconds.length;i++){
			if(subconds[i].type=="2"&&subconds[i].joinInfo==layarr[0]){
				generateChainCond(subconds[i],layarr.splice(1),field);
				return;
			}
		}
		var chain={};
		chain.type="2";
		chain.joinInfo=layarr[0];
		chain.subconds=[];
		cond.subconds.push(chain);
		generateChainCond(chain,layarr.splice(1),field);
	}else{
		cond.subconds.push(field)
	}
}
</script>
<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
<#assign superChecked = false>
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
<#if view?? && view.type?? && view.type != "REFERENCE">
<#assign datatable_queryFunc = "RM.formula.formulaProcess.processRef.query('query')">
</#if>
<#assign datatable_dataUrl = "/RM/formula/formulaProcess/processRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "RM.formula.formulaProcess.processRef.query('query')">
<#assign datatable_dataUrl = "/RM/formula/formulaProcess/processRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_RM_formula_formulaProcess_processRef_query" renderOverEvent="ec_RM_formula_formulaProcess_processRef_RenderOverEvent" pageInitMethod="ec_RM_formula_formulaProcess_processRef_PageInitMethod" modelCode="RM_7.5.0.0_formula_FormulaProcess" noPermissionKeys="name,processType.name,longTime,meno" hidekeyPrefix="ec_RM_formula_formulaProcess_processRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_RM_formula_formulaProcess_processRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="RM.formula.formulaProcess.processRef.sendBackprocessRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','processType.id','name','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="RM.formula.formulaProcess.processRef.showErrorMsg">
				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30/>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('RM.propertydisplayName.randon1487295011793')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign processType_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${processType_name_displayDefaultType!}"  key="processType.name"   label="${getText('RM.propertydisplayName.randon1487074387497')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign longTime_displayDefaultType  = ''>
			<@datacolumn columnName="LONG_TIME"    showFormat="TEXT" defaultDisplay="${longTime_displayDefaultType!}"  key="longTime"   label="${getText('RM.propertydisplayName.randon1487292241411')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc=""/>
			<#assign meno_displayDefaultType  = ''>
			<@datacolumn columnName="MENO"    showFormat="TEXT" defaultDisplay="${meno_displayDefaultType!}"  key="meno"   label="${getText('RM.propertydisplayName.randon1487292273721')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_RM_formula_formulaProcess_processRef_RenderOverEvent(){
}
function ec_RM_formula_formulaProcess_processRef_PageInitMethod(){
}
	
	
	
	
</script>