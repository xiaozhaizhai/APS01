	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('RM.entityname.randon1487075671473')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_RM_formula_formulaProcessActive_processActiveRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_RM_formula_formulaProcessActive_processActiveRef_queryForm" exportUrl="/RM/formula/formulaProcessActive/processActiveRef-query.action">
		<input type="hidden" reset="false" name="RM_formula_formulaProcessActive_processActiveRef_condition" id="RM_formula_formulaProcessActive_processActiveRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('RM.modelname.randon1487330059541')}_${getText('RM.viewtitle.randon1488184710189')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<input type="hidden" id="currentSqlType"  value="5" />
		<div id="ec_RM_formula_formulaProcessActive_processActiveRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_RM_formula_formulaProcessActive_processActiveRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('RM_7.5.0.0_formula_processActiveRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="RM_7.5.0.0_formula_processActiveRef" formId="ec_RM_formula_formulaProcessActive_processActiveRef_queryForm" dataTableId="ec_RM_formula_formulaProcessActive_processActiveRef_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_RM_formula_formulaProcessActive_processActiveRef_queryForm" isExpandAll=true formId="ec_RM_formula_formulaProcessActive_processActiveRef_queryForm" idprefix="ec_RM_formula_formulaProcessActive_processActiveRef" expandType="all"  fieldcodes="RM_7.5.0.0_formula_FormulaProcessActive_name_name:RM.propertydisplayName.randon1487330156499||RM_7.5.0.0_formula_FormulaProcessActive_exeOrder_exeOrder:RM.propertydisplayName.randon1487330171009" > 
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<@queryfield formId="ec_RM_formula_formulaProcessActive_processActiveRef_queryForm" code="RM_7.5.0.0_formula_FormulaProcessActive_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="RM_7.5.0.0_formula_FormulaProcessActive_name_name" isCustomize=true > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign exeOrder_defaultValue  = ''>
									<#assign exeOrder_defaultValue  = ''>
							<@queryfield formId="ec_RM_formula_formulaProcessActive_processActiveRef_queryForm" code="RM_7.5.0.0_formula_FormulaProcessActive_exeOrder" showFormat="TEXT" defaultValue=exeOrder_defaultValue  divCode="RM_7.5.0.0_formula_FormulaProcessActive_exeOrder_exeOrder" isCustomize=true > 
										<div>
									  	 	<div style="float:left;width:45%">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" class="cui-noborder-input" style="*padding-right:0px;" name="exeOrder_start" id="exeOrder_start" value="${exeOrder_defaultValue!}" deValue="${exeOrder_defaultValue!}"   exp="equal"/>
											</div></div>
											</div>
											<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
											<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" class="cui-noborder-input" style="*padding-right:0px;" name="exeOrder_end" id="exeOrder_end" value="${exeOrder_defaultValue!}" deValue="${exeOrder_defaultValue!}"   exp="equal"/>
									  		</div></div>
									  		</div>
								  		</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_RM_formula_formulaProcessActive_processActiveRef_queryForm" type="search" onclick="RM.formula.formulaProcessActive.processActiveRef.commonQuery('query')" /> 
						 		<@querybutton formId="ec_RM_formula_formulaProcessActive_processActiveRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info={};
ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info["MainTableName"]="RM_FORMULA_PROCESS_ACTIVES";
ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info["name"]={};
ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info["name"].dbColumnType="TEXT";
ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info["name"].layRec="name";
ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info["name"].columnName="NAME";
ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info["exeOrder"]={};
ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info["exeOrder"].dbColumnType="INTEGER";
ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info["exeOrder"].layRec="exeOrder";
ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info["exeOrder"].columnName="EXE_ORDER";
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
<#assign datatable_queryFunc = "RM.formula.formulaProcessActive.processActiveRef.query('query')">
</#if>
<#assign datatable_dataUrl = "/RM/formula/formulaProcessActive/processActiveRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "RM.formula.formulaProcessActive.processActiveRef.query('query')">
<#assign datatable_dataUrl = "/RM/formula/formulaProcessActive/processActiveRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_RM_formula_formulaProcessActive_processActiveRef_query" renderOverEvent="ec_RM_formula_formulaProcessActive_processActiveRef_RenderOverEvent" pageInitMethod="ec_RM_formula_formulaProcessActive_processActiveRef_PageInitMethod" modelCode="RM_7.5.0.0_formula_FormulaProcessActive" noPermissionKeys="name,exeOrder,isReplace,auto" hidekeyPrefix="ec_RM_formula_formulaProcessActive_processActiveRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_RM_formula_formulaProcessActive_processActiveRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="RM.formula.formulaProcessActive.processActiveRef.sendBackprocessActiveRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','id','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="RM.formula.formulaProcessActive.processActiveRef.showErrorMsg">
					<#if flowBulkFlag?? && flowBulkFlag==true>
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('RM.propertydisplayName.randon1487330156499')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign exeOrder_displayDefaultType  = ''>
			<@datacolumn columnName="EXE_ORDER"    showFormat="TEXT" defaultDisplay="${exeOrder_displayDefaultType!}"  key="exeOrder"   label="${getText('RM.propertydisplayName.randon1487330171009')}" textalign="right"  width=100   type="integer"    showFormatFunc=""/>
			<#assign isReplace_displayDefaultType  = ''>
			<@datacolumn columnName="IS_REPLACE"    showFormat="SELECT" defaultDisplay="${isReplace_displayDefaultType!}"  key="isReplace"   label="${getText('RM.propertydisplayName.randon1487331060176')}" textalign="left"  width=100   type="boolean"    showFormatFunc=""/>
			<#assign auto_displayDefaultType  = ''>
			<@datacolumn columnName="AUTO"    showFormat="SELECT" defaultDisplay="${auto_displayDefaultType!}"  key="auto"   label="${getText('RM.propertydisplayName.randon1487331130107')}" textalign="left"  width=100   type="boolean"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_RM_formula_formulaProcessActive_processActiveRef_RenderOverEvent(){
}
function ec_RM_formula_formulaProcessActive_processActiveRef_PageInitMethod(){
}
	
	
	
	
</script>