	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('RM.entityname.randon1487075671473')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_RM_formula_formula_formulaRefNofit_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_RM_formula_formula_formulaRefNofit_queryForm" exportUrl="/RM/formula/formula/formulaRefNofit-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="createDepartment" bak_value="createDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="createPosition" bak_value="createPosition"/>
		<input type="hidden" id="RM_7_5_0_0_formulaType_FormulaType" value="formulaType" bak_value="formulaType"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" id="RM_7_5_0_0_pickSite_PickSite" value="pickSite" bak_value="pickSite"/>
		<input type="hidden" reset="false" name="RM_formula_formula_formulaRefNofit_condition" id="RM_formula_formula_formulaRefNofit_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('RM.modelname.randon1487075762209')}_${getText('RM.viewtitle.randon1531119448211')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="fastQueryCond" name="fastQueryCond" />
		<input type="hidden" id="excelQueryCond" name="exportFastQueryCond" />
		<input type="hidden" class="nodeInfo" />
		<input type="hidden" id="treeNodeSelected" name="treeNodeSelected" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<input type="hidden" id="currentSqlType"  value="5" />
		<div id="ec_RM_formula_formula_formulaRefNofit_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_RM_formula_formula_formulaRefNofit_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('RM_7.5.0.0_formula_formulaRefNofit')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="RM_7.5.0.0_formula_formulaRefNofit" formId="ec_RM_formula_formula_formulaRefNofit_queryForm" dataTableId="ec_RM_formula_formula_formulaRefNofit_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_RM_formula_formula_formulaRefNofit_queryForm" isExpandAll=true formId="ec_RM_formula_formula_formulaRefNofit_queryForm" idprefix="ec_RM_formula_formula_formulaRefNofit" expandType="all"  fieldcodes="RM_7.5.0.0_formula_Formula_code_code:RM.propertydisplayName.randon1488246312092||RM_7.5.0.0_formula_Formula_name_name:RM.propertydisplayName.randon1487075823790||RM_7.5.0.0_formula_Formula_edition_edition:RM.propertydisplayName.randon1487139592239||MESBasic_1_product_Product_productCode_product_productCode:RM.propertydisplayName.radion1415772644833234||RM_7.5.0.0_formula_Formula_usedFor_usedFor:RM.propertydisplayName.randon1487076506987||RM_7.5.0.0_formula_Formula_state_state:RM.propertydisplayName.randon1487076473255||RM_7.5.0.0_formula_Formula_startTime_startTime:RM.propertydisplayName.randon1487076643939||RM_7.5.0.0_formula_Formula_endTime_endTime:RM.propertydisplayName.randon1487076706699||RM_7.5.0.0_formula_Formula_produceType_produceType:RM.propertydisplayName.randon1487076555894" > 
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
							<@queryfield formId="ec_RM_formula_formula_formulaRefNofit_queryForm" code="RM_7.5.0.0_formula_Formula_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="RM_7.5.0.0_formula_Formula_code_code" isCustomize=true style="" > 
										<#if (code_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_RM_formula_formula_formulaRefNofit_queryForm" isCrossCompany=isCrossCompany isPrecise=true value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="RM.formula.formula.formulaRefNofit._querycustomFunc('code')" name="code" id="ec_RM_formula_formula_formulaRefNofit_queryForm_code" displayFieldName="code" exp="equal" caseSensitive="false" classStyle="cui-noborder-input"  url="/RM/formula/formula/mneClient.action" multiple=false mnewidth=260 searchClick="RM.formula.formula.formulaRefNofit.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_RM_formula_formula_formulaRefNofit_queryForm" isCrossCompany=isCrossCompany isPrecise=true  conditionfunc="RM.formula.formula.formulaRefNofit._querycustomFunc('code')" name="code" id="ec_RM_formula_formula_formulaRefNofit_queryForm_code" displayFieldName="code" exp="equal" caseSensitive="false" classStyle="cui-noborder-input"  url="/RM/formula/formula/mneClient.action" multiple=false mnewidth=260 searchClick="RM.formula.formula.formulaRefNofit.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<@queryfield formId="ec_RM_formula_formula_formulaRefNofit_queryForm" code="RM_7.5.0.0_formula_Formula_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="RM_7.5.0.0_formula_Formula_name_name" isCustomize=true style="" > 
										<#if (name_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_RM_formula_formula_formulaRefNofit_queryForm" isCrossCompany=isCrossCompany isPrecise=true value="${name_defaultValue!}" deValue="${name_defaultValue!}"   conditionfunc="RM.formula.formula.formulaRefNofit._querycustomFunc('name')" name="name" id="ec_RM_formula_formula_formulaRefNofit_queryForm_name" displayFieldName="name" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/RM/formula/formula/mneClient.action" multiple=false mnewidth=260 searchClick="RM.formula.formula.formulaRefNofit.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_RM_formula_formula_formulaRefNofit_queryForm" isCrossCompany=isCrossCompany isPrecise=true  conditionfunc="RM.formula.formula.formulaRefNofit._querycustomFunc('name')" name="name" id="ec_RM_formula_formula_formulaRefNofit_queryForm_name" displayFieldName="name" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/RM/formula/formula/mneClient.action" multiple=false mnewidth=260 searchClick="RM.formula.formula.formulaRefNofit.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign edition_defaultValue  = ''>
									<#assign edition_defaultValue  = ''>
							<@queryfield formId="ec_RM_formula_formula_formulaRefNofit_queryForm" code="RM_7.5.0.0_formula_Formula_edition" showFormat="TEXT" defaultValue=edition_defaultValue  divCode="RM_7.5.0.0_formula_Formula_edition_edition" isCustomize=true style="" > 
										<div>
									  	 	<div style="float:left;width:45%">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" showformat="TEXT" class="cui-noborder-input" style="*padding-right:0px;" name="edition_start" id="edition_start" value="${edition_defaultValue!}" deValue="${edition_defaultValue!}"   exp="equal"/>
											</div></div>
											</div>
											<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
											<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" showformat="TEXT" class="cui-noborder-input" style="*padding-right:0px;" name="edition_end" id="edition_end" value="${edition_defaultValue!}" deValue="${edition_defaultValue!}"   exp="equal"/>
									  		</div></div>
									  		</div>
								  		</div>								  		
							</@queryfield>
							<#assign product_productCode_defaultValue  = ''>
									<#assign product_productCode_defaultValue  = ''>
							<@queryfield formId="ec_RM_formula_formula_formulaRefNofit_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=product_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_product_productCode" isCustomize=true style="" > 
										<input type="hidden" id="product.id" name="product.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${product_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="RM.formula.formula.formulaRefNofit._querycustomFunc('product_productCode')" name="product.productCode" id="ec_RM_formula_formula_formulaRefNofit_queryForm_product_productCode" displayFieldName="productCode" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/productRefNew.action"   refViewCode="MESBasic_1_product_productRefNew"  clicked=true multiple=false mnewidth=260 formId="ec_RM_formula_formula_formulaRefNofit_queryForm" searchClick="RM.formula.formula.formulaRefNofit.commonQuery('query')"   />
							</@queryfield>
							<#assign usedFor_defaultValue  = ''>
									<#assign usedFor_defaultValue  = ''>
							<@queryfield formId="ec_RM_formula_formula_formulaRefNofit_queryForm" code="RM_7.5.0.0_formula_Formula_usedFor" showFormat="SELECTCOMP" defaultValue=usedFor_defaultValue  divCode="RM_7.5.0.0_formula_Formula_usedFor_usedFor" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${usedFor_defaultValue}"   name="usedFor" code="usedFor" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<#assign state_defaultValue  = ''>
									<#assign state_defaultValue  = ''>
							<@queryfield formId="ec_RM_formula_formula_formulaRefNofit_queryForm" code="RM_7.5.0.0_formula_Formula_state" showFormat="SELECTCOMP" defaultValue=state_defaultValue  divCode="RM_7.5.0.0_formula_Formula_state_state" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${state_defaultValue}"   name="state" code="RMstate" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<#assign startTime_defaultValue  = ''>
									<#assign startTime_defaultValue  = ''>
								<#if (startTime_defaultValue)?? &&(startTime_defaultValue)?has_content>
									<#assign startTime_defaultValue  = getDefaultDateTime(startTime_defaultValue!)?datetime>
								</#if>
							<@queryfield formId="ec_RM_formula_formula_formulaRefNofit_queryForm" code="RM_7.5.0.0_formula_Formula_startTime" showFormat="YMD_HM" defaultValue=startTime_defaultValue  divCode="RM_7.5.0.0_formula_Formula_startTime_startTime" isCustomize=true style="" > 
								<div>
							  	 	<div style="float:left;width:45%">
									<@datepicker type="dateTimeMin" cssClass="cui-noborder-input" name="startTime_start" id="startTime_start" exp="gequal"   formid="ec_RM_formula_formula_formulaRefNofit_queryForm" />
									</div>
									<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
							  	 	<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTimeMin" cssClass="cui-noborder-input" name="startTime_end" id="startTime_end" exp="lequal"   formid="ec_RM_formula_formula_formulaRefNofit_queryForm" />
							  		</div>
						  		</div>
							</@queryfield>
							<#assign endTime_defaultValue  = ''>
									<#assign endTime_defaultValue  = ''>
								<#if (endTime_defaultValue)?? &&(endTime_defaultValue)?has_content>
									<#assign endTime_defaultValue  = getDefaultDateTime(endTime_defaultValue!)?datetime>
								</#if>
							<@queryfield formId="ec_RM_formula_formula_formulaRefNofit_queryForm" code="RM_7.5.0.0_formula_Formula_endTime" showFormat="YMD_HM" defaultValue=endTime_defaultValue  divCode="RM_7.5.0.0_formula_Formula_endTime_endTime" isCustomize=true style="" > 
								<div>
							  	 	<div style="float:left;width:45%">
									<@datepicker type="dateTimeMin" cssClass="cui-noborder-input" name="endTime_start" id="endTime_start" exp="gequal"   formid="ec_RM_formula_formula_formulaRefNofit_queryForm" />
									</div>
									<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
							  	 	<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTimeMin" cssClass="cui-noborder-input" name="endTime_end" id="endTime_end" exp="lequal"   formid="ec_RM_formula_formula_formulaRefNofit_queryForm" />
							  		</div>
						  		</div>
							</@queryfield>
							<#assign produceType_defaultValue  = ''>
									<#assign produceType_defaultValue  = ''>
							<@queryfield formId="ec_RM_formula_formula_formulaRefNofit_queryForm" code="RM_7.5.0.0_formula_Formula_produceType" showFormat="SELECTCOMP" defaultValue=produceType_defaultValue  divCode="RM_7.5.0.0_formula_Formula_produceType_produceType" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${produceType_defaultValue}"   name="produceType" code="produceType" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_RM_formula_formula_formulaRefNofit_queryForm" type="adv" onclick="RM.formula.formula.formulaRefNofit.commonQuery('query')" onadvancedclick="advQuery('RM.formula.formula.formulaRefNofit.advquery')" /> 
						 		<@querybutton formId="ec_RM_formula_formula_formulaRefNofit_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_RM_formula_formula_formulaRefNofit_quickquery_info={};
ec_RM_formula_formula_formulaRefNofit_quickquery_info["MainTableName"]="RM_FORMULAS";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["code"]={};
ec_RM_formula_formula_formulaRefNofit_quickquery_info["code"].dbColumnType="BAPCODE";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["code"].layRec="code";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["code"].columnName="CODE";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["name"]={};
ec_RM_formula_formula_formulaRefNofit_quickquery_info["name"].dbColumnType="TEXT";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["name"].layRec="name";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["name"].columnName="NAME";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["edition"]={};
ec_RM_formula_formula_formulaRefNofit_quickquery_info["edition"].dbColumnType="DECIMAL";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["edition"].layRec="edition";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["edition"].columnName="EDITION";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["product.productCode"]={};
ec_RM_formula_formula_formulaRefNofit_quickquery_info["product.productCode"].dbColumnType="TEXT";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["product.productCode"].layRec="S2BASE_PRODUCT,PRODUCT_ID,RM_FORMULAS,PRODUCT-productCode";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["product.productCode"].columnName="PRODUCT_CODE";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["product.id"]={};
ec_RM_formula_formula_formulaRefNofit_quickquery_info["product.id"].dbColumnType="LONG";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["product.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,RM_FORMULAS,PRODUCT-productCode";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["product.id"].columnName="PRODUCT_ID";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["usedFor"]={};
ec_RM_formula_formula_formulaRefNofit_quickquery_info["usedFor"].dbColumnType="SYSTEMCODE";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["usedFor"].layRec="usedFor";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["usedFor"].columnName="USED_FOR";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["state"]={};
ec_RM_formula_formula_formulaRefNofit_quickquery_info["state"].dbColumnType="SYSTEMCODE";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["state"].layRec="state";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["state"].columnName="STATE";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["startTime"]={};
ec_RM_formula_formula_formulaRefNofit_quickquery_info["startTime"].dbColumnType="DATETIME";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["startTime"].layRec="startTime";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["startTime"].columnName="START_TIME";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["endTime"]={};
ec_RM_formula_formula_formulaRefNofit_quickquery_info["endTime"].dbColumnType="DATETIME";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["endTime"].layRec="endTime";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["endTime"].columnName="END_TIME";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["produceType"]={};
ec_RM_formula_formula_formulaRefNofit_quickquery_info["produceType"].dbColumnType="SYSTEMCODE";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["produceType"].layRec="produceType";
ec_RM_formula_formula_formulaRefNofit_quickquery_info["produceType"].columnName="PRODUCE_TYPE";
generateChainCond=function(cond,layarr,field){
	if(layarr.length>1){
		var subconds=cond.subconds;
		for(var i=0;i<subconds.length;i++){
			if(subconds[i].type=="2"&&subconds[i].joinInfo==layarr[0]){
				generateChainCond(subconds[i],layarr.slice(1),field);
				return;
			}
		}
		var chain={};
		chain.type="2";
		chain.joinInfo=layarr[0];
		chain.subconds=[];
		cond.subconds.push(chain);
		generateChainCond(chain,layarr.slice(1),field);
	}else{
		cond.subconds.push(field)
	}
}
</script>
<script>
 $(function(){
 	var advRemainDialog = $('[id="RM.formula.formula.formulaRefNofit.advquery"]');
 	advRemainDialog.length>1 && advRemainDialog.eq(0).remove();
 });
</script>
<style>
	.customQuery_down {
		background: url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat;
	}
	.customQuery_up {
		background: url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat;
	}
	.customQuery_preview_result_down {
		background: url("/bap/struts/css/icon_adv.png") 0 -185px no-repeat;
	}
	.customQuery_preview_result_up {
		background: url("/bap/struts/css/icon_adv.png") 0 -204px no-repeat;
	}
</style>
<div style="position:relative;z-index:10;display:none;" id="RM.formula.formula.formulaRefNofit.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_RM_formula_formula_formulaRefNofit_adv_queryForm" exportUrl="/RM/formula/formula/formulaRefNofit-query.action">
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_formula_formula_formulaRefNofit_adv_queryForm" code="RM_7.5.0.0_formula_Formula_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="RM_7.5.0.0_formula_Formula_code_code" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_formula_Formula" layRec="code" columnname="CODE" columntype="BAPCODE" name="code" fieldType="TEXTFIELD" tableName="RM_FORMULAS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										配方编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_formula_Formula" />
										<#if (code_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_RM_formula_formula_formulaRefNofit_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="RM.formula.formula.formulaRefNofit._querycustomFunc('code')" name="code" id="adv_ec_RM_formula_formula_formulaRefNofit_queryForm_code" displayFieldName="code" exp="equal"  classStyle="cui-noborder-input"  url="/RM/formula/formula/mneClient.action" multiple=false mnewidth=260   currentViewCode="RM_7.5.0.0_formula_formulaRefNofit"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_RM_formula_formula_formulaRefNofit_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true  conditionfunc="RM.formula.formula.formulaRefNofit._querycustomFunc('code')" name="code" id="adv_ec_RM_formula_formula_formulaRefNofit_queryForm_code" displayFieldName="code" exp="equal"  classStyle="cui-noborder-input"  url="/RM/formula/formula/mneClient.action" multiple=false mnewidth=260  currentViewCode="RM_7.5.0.0_formula_formulaRefNofit"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_formula_formula_formulaRefNofit_adv_queryForm" code="RM_7.5.0.0_formula_Formula_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="RM_7.5.0.0_formula_Formula_name_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_formula_Formula" layRec="name" columnname="NAME" columntype="TEXT" name="name" fieldType="TEXTFIELD" tableName="RM_FORMULAS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										标识
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_formula_Formula" />
										<#if (name_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_RM_formula_formula_formulaRefNofit_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true value="${name_defaultValue!}" deValue="${name_defaultValue!}"   conditionfunc="RM.formula.formula.formulaRefNofit._querycustomFunc('name')" name="name" id="adv_ec_RM_formula_formula_formulaRefNofit_queryForm_name" displayFieldName="name" exp="like"  classStyle="cui-noborder-input"  url="/RM/formula/formula/mneClient.action" multiple=false mnewidth=260   currentViewCode="RM_7.5.0.0_formula_formulaRefNofit"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_RM_formula_formula_formulaRefNofit_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true  conditionfunc="RM.formula.formula.formulaRefNofit._querycustomFunc('name')" name="name" id="adv_ec_RM_formula_formula_formulaRefNofit_queryForm_name" displayFieldName="name" exp="like"  classStyle="cui-noborder-input"  url="/RM/formula/formula/mneClient.action" multiple=false mnewidth=260  currentViewCode="RM_7.5.0.0_formula_formulaRefNofit"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign edition_defaultValue  = ''>
									<#assign edition_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_formula_formula_formulaRefNofit_adv_queryForm" code="RM_7.5.0.0_formula_Formula_edition" showFormat="TEXT" defaultValue=edition_defaultValue  divCode="RM_7.5.0.0_formula_Formula_edition_edition" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_formula_Formula" layRec="edition" columnname="EDITION" columntype="DECIMAL" name="edition" fieldType="TEXTFIELD" tableName="RM_FORMULAS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										版本
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_formula_Formula" />
										<div>
									  	 	<div style="float:left;width:45%">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" class="cui-noborder-input" style="*padding-right:0px;" name="edition_start" id="adv_edition_start" value="${edition_defaultValue!}" deValue="${edition_defaultValue!}"   exp="equal"   />
											</div></div>
											</div>
											<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
											<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" class="cui-noborder-input" style="*padding-right:0px;" name="edition_end" id="adv_edition_end" value="${edition_defaultValue!}" deValue="${edition_defaultValue!}"   exp="equal"  />
									  		</div></div>
									  		</div>
								  		</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign product_productCode_defaultValue  = ''>
									<#assign product_productCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_formula_formula_formulaRefNofit_adv_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=product_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_product_productCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,RM_FORMULAS,PRODUCT-productCode" columnname="PRODUCT_CODE" columntype="TEXT" name="product.productCode" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										产品
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_product.id" name="product.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_product.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${product_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="RM.formula.formula.formulaRefNofit._querycustomFunc('product_productCode')" name="product.productCode" id="adv_ec_RM_formula_formula_formulaRefNofit_queryForm_product_productCode" displayFieldName="productCode" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/productRefNew.action"   refViewCode="MESBasic_1_product_productRefNew"  clicked=true multiple=false mnewidth=260 formId="ec_RM_formula_formula_formulaRefNofit_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign usedFor_defaultValue  = ''>
									<#assign usedFor_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_formula_formula_formulaRefNofit_adv_queryForm" code="RM_7.5.0.0_formula_Formula_usedFor" showFormat="SELECTCOMP" defaultValue=usedFor_defaultValue  divCode="RM_7.5.0.0_formula_Formula_usedFor_usedFor" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_formula_Formula" layRec="usedFor" columnname="USED_FOR" columntype="SYSTEMCODE" name="usedFor" fieldType="SELECTCOMP" tableName="RM_FORMULAS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										用途
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_formula_Formula" />
										<@systemcode  advquery=true onchange="" ecFlag=true deValue="${usedFor_defaultValue}"   name="usedFor" code="usedFor" classStyle="cui-noborder-input" value="" />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign state_defaultValue  = ''>
									<#assign state_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_formula_formula_formulaRefNofit_adv_queryForm" code="RM_7.5.0.0_formula_Formula_state" showFormat="SELECTCOMP" defaultValue=state_defaultValue  divCode="RM_7.5.0.0_formula_Formula_state_state" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_formula_Formula" layRec="state" columnname="STATE" columntype="SYSTEMCODE" name="state" fieldType="SELECTCOMP" tableName="RM_FORMULAS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										状态
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_formula_Formula" />
										<@systemcode  advquery=true onchange="" ecFlag=true deValue="${state_defaultValue}"   name="state" code="RMstate" classStyle="cui-noborder-input" value="" />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign startTime_defaultValue  = ''>
									<#assign startTime_defaultValue  = ''>
								<#if (startTime_defaultValue)?? &&(startTime_defaultValue)?has_content>
									<#assign startTime_defaultValue  = getDefaultDateTime(startTime_defaultValue!)?datetime>
								</#if>
								<@advsqueryfield formId="ec_RM_formula_formula_formulaRefNofit_adv_queryForm" code="RM_7.5.0.0_formula_Formula_startTime" showFormat="YMD_HM" defaultValue=startTime_defaultValue  divCode="RM_7.5.0.0_formula_Formula_startTime_startTime" isCustomize=true > 
								
								<div class="quick_query_node" style="width:98%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_formula_Formula" layRec="startTime" columnname="START_TIME" columntype="DATETIME" name="startTime" fieldType="DATETIME" showFormat="YMD_HM" tableName="RM_FORMULAS"/>
								<label class="quick_query_labeltime advQuery_label" style="text-align:right;float:left;width:14%;height:28px;line-height:28px">
								<span class="quick_query_text">
										启用时间
								</span>
								</label>
							<div class="quick_query_contenttime advQuery_content" style="float:left;width:86%">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_formula_Formula" />
								<div>
							  	 	<div style="float:left;width:41.8%">
									<@datepicker type="dateTimeMin" cssClass="cui-noborder-input" value="${startTime_defaultValue!}" deValue="${startTime_defaultValue!}"  name="startTime_start" id="adv_startTime_start" exp="gequal"    formid="ec_RM_formula_formula_formulaRefNofit_adv_queryForm" />
									</div>
									<div style="float:left;width:16.3%;text-align:center;line-height: 26px;"> - - ${getText('common.date.split')} - - </div>
							  	 	<div style="float:left;width:41.8%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTimeMin" cssClass="cui-noborder-input" value="${startTime_defaultValue!}" deValue="${startTime_defaultValue!}"  name="startTime_end" id="adv_startTime_end" exp="lequal"    formid="ec_RM_formula_formula_formulaRefNofit_adv_queryForm" />
							  		</div>
						  		</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign endTime_defaultValue  = ''>
									<#assign endTime_defaultValue  = ''>
								<#if (endTime_defaultValue)?? &&(endTime_defaultValue)?has_content>
									<#assign endTime_defaultValue  = getDefaultDateTime(endTime_defaultValue!)?datetime>
								</#if>
								<@advsqueryfield formId="ec_RM_formula_formula_formulaRefNofit_adv_queryForm" code="RM_7.5.0.0_formula_Formula_endTime" showFormat="YMD_HM" defaultValue=endTime_defaultValue  divCode="RM_7.5.0.0_formula_Formula_endTime_endTime" isCustomize=true > 
								
								<div class="quick_query_node" style="width:98%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_formula_Formula" layRec="endTime" columnname="END_TIME" columntype="DATETIME" name="endTime" fieldType="DATETIME" showFormat="YMD_HM" tableName="RM_FORMULAS"/>
								<label class="quick_query_labeltime advQuery_label" style="text-align:right;float:left;width:14%;height:28px;line-height:28px">
								<span class="quick_query_text">
										停用时间
								</span>
								</label>
							<div class="quick_query_contenttime advQuery_content" style="float:left;width:86%">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_formula_Formula" />
								<div>
							  	 	<div style="float:left;width:41.8%">
									<@datepicker type="dateTimeMin" cssClass="cui-noborder-input" value="${endTime_defaultValue!}" deValue="${endTime_defaultValue!}"  name="endTime_start" id="adv_endTime_start" exp="gequal"    formid="ec_RM_formula_formula_formulaRefNofit_adv_queryForm" />
									</div>
									<div style="float:left;width:16.3%;text-align:center;line-height: 26px;"> - - ${getText('common.date.split')} - - </div>
							  	 	<div style="float:left;width:41.8%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTimeMin" cssClass="cui-noborder-input" value="${endTime_defaultValue!}" deValue="${endTime_defaultValue!}"  name="endTime_end" id="adv_endTime_end" exp="lequal"    formid="ec_RM_formula_formula_formulaRefNofit_adv_queryForm" />
							  		</div>
						  		</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign produceType_defaultValue  = ''>
									<#assign produceType_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_formula_formula_formulaRefNofit_adv_queryForm" code="RM_7.5.0.0_formula_Formula_produceType" showFormat="SELECTCOMP" defaultValue=produceType_defaultValue  divCode="RM_7.5.0.0_formula_Formula_produceType_produceType" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_formula_Formula" layRec="produceType" columnname="PRODUCE_TYPE" columntype="SYSTEMCODE" name="produceType" fieldType="SELECTCOMP" tableName="RM_FORMULAS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										生产性质
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_formula_Formula" />
										<@systemcode  advquery=true onchange="" ecFlag=true deValue="${produceType_defaultValue}"   name="produceType" code="produceType" classStyle="cui-noborder-input" value="" />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							
					   
	</form>
	</div>
	<div class="view-custom" style="border-top: 1px solid #E1E1E1;height:25px;">
	<div class="view-custom-div" style="float:left;margin-top:5px;cursor: pointer;" onclick="changeCustomQuery();"><span class="view-custom-span" style="margin-left:5px;font-weight:bold;color:#0f78bc;">${getText('foundation.common.custom')}</span></div>
		<div class="move-grade" style="display:none;float:left;margin-top:5px;">
			<span class="custombtn downgrade" onclick="ec.advQuery.query._upgrade()"> ${getText('foundation.common.upgrade')}</span>
			<span class="custombtn upgrade" onclick="ec.advQuery.query._downgrade()">${getText('foundation.common.downgrade')}</span>
			<span class="custombtn upmove" onclick="ec.advQuery.query._moveUp()">${getText('foundation.common.up')}</span>
			<span class="custombtn downmove" onclick="ec.advQuery.query._moveDown()">${getText('foundation.common.down')}</span>
		</div>			
		<div style="float:right;margin-top:5px;"><span class="customQuery" onclick="changeCustomQuery();"></span></div>
	</div>
	<div style=""><table id="advQueryLoading" style="width:100%;height:240px;text-align:center;"><tr><td><label class="advQuery-loading">${getText('foundation.common.data.waiting')}</label></td></tr></table></div>
	<div style="clear:both;display:none;" id="customquContent" class="customqu-content">		
	</div>	
</div>
<script type="text/javascript" language="javascript">
CUI.ns("ec.view.newAdvQuery");
ec.view.newAdvQuery._initNewAdvQuery=function(values){
		ec.advQuery.query = new CUI.NewAdvQuery({
			elementId: 'advQueryContainer',
			env: 'runtime',
			viewCode: 'RM_7.5.0.0_formula_formulaRefNofit',
			modelCode: 'RM_7.5.0.0_formula_Formula',
			modelName: 'Formula',
			formId: 'ec_RM_formula_formula_formulaRefNofit_queryForm',
			olddiv: 'RM.formula.formula.formulaRefNofit.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='RM.formula.formula.formulaRefNofit.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'RM_7.5.0.0_formula_formulaRefNofit'+"&entity.code="+'RM_7.5.0.0_formula';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='RM.formula.formula.formulaRefNofit.advquery'] #customquContent").html(html);
		 	$("[id='RM.formula.formula.formulaRefNofit.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='RM.formula.formula.formulaRefNofit.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'RM_7.5.0.0_formula_formulaRefNofit'+"&entity.code="+'RM_7.5.0.0_formula';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='RM.formula.formula.formulaRefNofit.advquery'] #customquContent").html(html);
			 $("[id='RM.formula.formula.formulaRefNofit.advquery'] #advQueryLoading").hide();
		 }
	});
	ec.advQuery._renderOverFlag=true;
}
var showType = "down";
var onceOpen = false;		//标识自定义查询是否加载过，避免重复加载
var showType_result = "down";
//点击自定义查询按钮后，展示自定义 查询or隐藏自定义查询
function changeCustomQuery(){
	if(showType == "up"){
		$('[id="RM.formula.formula.formulaRefNofit.advquery"] div.customqu-content').css('display','none');
		$('[id="RM.formula.formula.formulaRefNofit.advquery"] div.move-grade').css('display','none');
		// $('[id="RM.formula.formula.formulaRefNofit.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="RM.formula.formula.formulaRefNofit.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="RM.formula.formula.formulaRefNofit.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="RM.formula.formula.formulaRefNofit.advquery"] div.customqu-content').css('display','block');
		$('[id="RM.formula.formula.formulaRefNofit.advquery"] div.move-grade').css('display','block');
		// $('[id="RM.formula.formula.formulaRefNofit.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="RM.formula.formula.formulaRefNofit.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="RM.formula.formula.formulaRefNofit.advquery"] div.advConContent').css('height','130px');
		if(!onceOpen){
			customQuery();
			onceOpen = true;
		}
		showType = "up";
	}
}
//点击预览方案按钮后，展示预览方案or隐藏预览方案
function changeCustomQueryResult(){
	if(showType_result == "down"){
		$('div.customquery_column').css('display','none');
		// $('span.customQuery_preview_result').css('background','url("/bap/struts/css/icon_adv.png") 0 -185px no-repeat');
		$('span.customQuery_preview_result').removeClass("customQuery_preview_result_up").addClass("customQuery_preview_result_down");
		$('div.customQuery_cond').css('display','block');
		ec.advQuery.query.getViewResult();
		showType_result = "up";
	}else{			
		$('div.customquery_column').css('display','block');
		$('div.customquery_column').css('height','240px');
		// $('span.customQuery_preview_result').css('background','url("/bap/struts/css/icon_adv.png") 0 -204px no-repeat');
		$('span.customQuery_preview_result').removeClass("customQuery_preview_result_down").addClass("customQuery_preview_result_up");				
		$('div.customQuery_cond').css('display','none');
		showType_result = "down";
	}
}
function changeObject(obj){		
	if($(obj).parent().next().css('display')=='block'){
		$(obj).css('background','url("/bap/struts/css/icon_adv.png") 0 -124px no-repeat');
		$(obj).parent().next().css('display','none');
	}else{
		$(obj).css('background','url("/bap/struts/css/icon_adv.png") 0 -40px no-repeat');
		$(obj).parent().next().css('display','block');
	}			
}
</script> <#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
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
<#if (Parameters.multiSelect)??>
<#assign multiSelect = (Parameters.multiSelect)>
</#if>

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "RM.formula.formula.formulaRefNofit.query('query')">
<#assign datatable_dataUrl = "/RM/formula/formula/formulaRefNofit-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "RM.formula.formula.formulaRefNofit.query('query')">
<#assign datatable_dataUrl = "/RM/formula/formula/formulaRefNofit-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_RM_formula_formula_formulaRefNofit_query" renderOverEvent="ec_RM_formula_formula_formulaRefNofit_RenderOverEvent" pageInitMethod="ec_RM_formula_formula_formulaRefNofit_PageInitMethod" modelCode="RM_7.5.0.0_formula_Formula" noPermissionKeys="code,name,edition,product.productCode,product.productName,product.productSpecif,product.productModel,product.productBaseUnit.name,usedFor,isForProduct,state,supportEbr,startTime,endTime,description,setProcess" hidekeyPrefix="ec_RM_formula_formula_formulaRefNofit_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_RM_formula_formula_formulaRefNofit_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="RM.formula.formula.formulaRefNofit.sendBackformulaRefNofit" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','usedFor.id','state.id','setProcess.id','produceType.id','product.id','product.productBaseUnit.id','tableNo','tableNo','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="RM.formula.formula.formulaRefNofit.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('RM.propertydisplayName.randon1488246312092')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('RM.propertydisplayName.randon1487075823790')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign edition_displayDefaultType  = ''>
			<@datacolumn columnName="EDITION"    showFormat="TEXT" defaultDisplay="${edition_displayDefaultType!}"  key="edition"   label="${getText('RM.propertydisplayName.randon1487139592239')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign product_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${product_productCode_displayDefaultType!}"  key="product.productCode"   label="${getText('RM.propertydisplayName.radion141577264483332')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign product_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${product_productName_displayDefaultType!}"  key="product.productName"   label="${getText('RM.propertydisplayName.radion1415772740737')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign product_productSpecif_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_SPECIF"    showFormat="TEXT" defaultDisplay="${product_productSpecif_displayDefaultType!}"  key="product.productSpecif"  hiddenCol=true label="${getText('MESBasic.propertydisplayName.radion1415772620384')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign product_productModel_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_MODEL"    showFormat="TEXT" defaultDisplay="${product_productModel_displayDefaultType!}"  key="product.productModel"  hiddenCol=true label="${getText('MESBasic.propertydisplayName.radion1415772568665')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign product_productBaseUnit_name_displayDefaultType  = ''>
			<@datacolumn columnName="UNIT_NAME"    showFormat="TEXT" defaultDisplay="${product_productBaseUnit_name_displayDefaultType!}"  key="product.productBaseUnit.name"  hiddenCol=true label="${getText('X6Basic.propertydisplayName.radion1398235640483')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign usedFor_displayDefaultType  = ''>
			<@datacolumn columnName="USED_FOR"    showFormat="SELECTCOMP" defaultDisplay="${usedFor_displayDefaultType!}"  key="usedFor.value"   label="${getText('RM.propertydisplayName.randon1487076506987')}" textalign="center"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign isForProduct_displayDefaultType  = ''>
			<@datacolumn columnName="IS_FOR_PRODUCT"    showFormat="SELECT" defaultDisplay="${isForProduct_displayDefaultType!}"  key="isForProduct"   label="${getText('RM.propertydisplayName.randon1487076528539')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign state_displayDefaultType  = ''>
			<@datacolumn columnName="STATE"    showFormat="SELECTCOMP" defaultDisplay="${state_displayDefaultType!}"  key="state.value"   label="${getText('RM.propertydisplayName.randon1487076473255')}" textalign="center"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign supportEbr_displayDefaultType  = ''>
			<@datacolumn columnName="SUPPORT_EBR"    showFormat="CHECKBOX" defaultDisplay="${supportEbr_displayDefaultType!}"  key="supportEbr"   label="${getText('RM.propertydisplayName.randon1490150767011')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign startTime_displayDefaultType  = ''>
			<@datacolumn columnName="START_TIME"    showFormat="YMD_HM" defaultDisplay="${startTime_displayDefaultType!}"  key="startTime"   label="${getText('RM.propertydisplayName.randon1489480645731')}" textalign="center"  width=130   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign endTime_displayDefaultType  = ''>
			<@datacolumn columnName="END_TIME"    showFormat="YMD_HM" defaultDisplay="${endTime_displayDefaultType!}"  key="endTime"   label="${getText('RM.propertydisplayName.randon1489480749505')}" textalign="center"  width=130   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign description_displayDefaultType  = ''>
			<@datacolumn columnName="DESCRIPTION"    showFormat="TEXT" defaultDisplay="${description_displayDefaultType!}"  key="description"   label="${getText('RM.propertydisplayName.randon1487076858348')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign setProcess_displayDefaultType  = ''>
			<@datacolumn columnName="SET_PROCESS"    showFormat="SELECTCOMP" defaultDisplay="${setProcess_displayDefaultType!}"  key="setProcess.value"  hiddenCol=true label="${getText('RM.propertydisplayName.randon1490578864812')}" textalign="left"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_RM_formula_formula_formulaRefNofit_RenderOverEvent(){
}
function ec_RM_formula_formula_formulaRefNofit_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>