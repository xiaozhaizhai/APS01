	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1449638926683')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_baseCustomer_baseCustomer_custListPart_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_baseCustomer_baseCustomer_custListPart_queryForm" exportUrl="/MESBasic/baseCustomer/baseCustomer/custListPart-query.action">
		<input type="hidden" id="MESBasic_1_baseCustomerClass_BaseCustomerClass" value="customerCCCode" bak_value="customerCCCode"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="customerDepartID" bak_value="customerDepartID"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1449638984644')}_${getText('MESBasic.viewtitle.randon1449649828916')}.xls" />
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
		<div id="ec_MESBasic_baseCustomer_baseCustomer_custListPart_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_baseCustomer_baseCustomer_custListPart_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_baseCustomer_custListPart')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_baseCustomer_custListPart" formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_queryForm" dataTableId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_baseCustomer_baseCustomer_custListPart_queryForm" isExpandAll=true formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_queryForm" idprefix="ec_MESBasic_baseCustomer_baseCustomer_custListPart" expandType="all"  fieldcodes="MESBasic_1_baseCustomer_BaseCustomer_customerCode_customerCode:MESBasic.propertydisplayName.randon1449640688865||MESBasic_1_baseCustomer_BaseCustomer_customerShortName_customerShortName:MESBasic.propertydisplayName.randon1449647160005||MESBasic_1_baseCustomer_BaseCustomer_customerName_customerName:MESBasic.propertydisplayName.randon1449646749348" > 
							<#assign customerCode_defaultValue  = ''>
									<#assign customerCode_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_queryForm" code="MESBasic_1_baseCustomer_BaseCustomer_customerCode" showFormat="TEXT" defaultValue=customerCode_defaultValue  divCode="MESBasic_1_baseCustomer_BaseCustomer_customerCode_customerCode" isCustomize=true style="" > 
										<#if (customerCode_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_queryForm"  isPrecise=true value="${customerCode_defaultValue!}" deValue="${customerCode_defaultValue!}"   conditionfunc="MESBasic.baseCustomer.baseCustomer.custListPart._querycustomFunc('customerCode')" name="customerCode" id="ec_MESBasic_baseCustomer_baseCustomer_custListPart_queryForm_customerCode" displayFieldName="customerCode" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/baseCustomer/baseCustomer/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseCustomer.baseCustomer.custListPart.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_queryForm"  isPrecise=true  conditionfunc="MESBasic.baseCustomer.baseCustomer.custListPart._querycustomFunc('customerCode')" name="customerCode" id="ec_MESBasic_baseCustomer_baseCustomer_custListPart_queryForm_customerCode" displayFieldName="customerCode" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/baseCustomer/baseCustomer/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseCustomer.baseCustomer.custListPart.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign customerShortName_defaultValue  = ''>
									<#assign customerShortName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_queryForm" code="MESBasic_1_baseCustomer_BaseCustomer_customerShortName" showFormat="TEXT" defaultValue=customerShortName_defaultValue  divCode="MESBasic_1_baseCustomer_BaseCustomer_customerShortName_customerShortName" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="customerShortName" id="customerShortName" value="${customerShortName_defaultValue!}" deValue="${customerShortName_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign customerName_defaultValue  = ''>
									<#assign customerName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_queryForm" code="MESBasic_1_baseCustomer_BaseCustomer_customerName" showFormat="TEXT" defaultValue=customerName_defaultValue  divCode="MESBasic_1_baseCustomer_BaseCustomer_customerName_customerName" isCustomize=true style="" > 
										<#if (customerName_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_queryForm"  isPrecise=true value="${customerName_defaultValue!}" deValue="${customerName_defaultValue!}"   conditionfunc="MESBasic.baseCustomer.baseCustomer.custListPart._querycustomFunc('customerName')" name="customerName" id="ec_MESBasic_baseCustomer_baseCustomer_custListPart_queryForm_customerName" displayFieldName="customerName" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/baseCustomer/baseCustomer/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseCustomer.baseCustomer.custListPart.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_queryForm"  isPrecise=true  conditionfunc="MESBasic.baseCustomer.baseCustomer.custListPart._querycustomFunc('customerName')" name="customerName" id="ec_MESBasic_baseCustomer_baseCustomer_custListPart_queryForm_customerName" displayFieldName="customerName" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/baseCustomer/baseCustomer/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseCustomer.baseCustomer.custListPart.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_queryForm" type="adv" onclick="MESBasic.baseCustomer.baseCustomer.custListPart.commonQuery('query')" onadvancedclick="advQuery('MESBasic.baseCustomer.baseCustomer.custListPart.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_baseCustomer_baseCustomer_custListPart_quickquery_info={};
ec_MESBasic_baseCustomer_baseCustomer_custListPart_quickquery_info["MainTableName"]="S2BASE_CUSTOMER";
ec_MESBasic_baseCustomer_baseCustomer_custListPart_quickquery_info["customerCode"]={};
ec_MESBasic_baseCustomer_baseCustomer_custListPart_quickquery_info["customerCode"].dbColumnType="TEXT";
ec_MESBasic_baseCustomer_baseCustomer_custListPart_quickquery_info["customerCode"].layRec="customerCode";
ec_MESBasic_baseCustomer_baseCustomer_custListPart_quickquery_info["customerCode"].columnName="CUSTOMER_CODE";
ec_MESBasic_baseCustomer_baseCustomer_custListPart_quickquery_info["customerShortName"]={};
ec_MESBasic_baseCustomer_baseCustomer_custListPart_quickquery_info["customerShortName"].dbColumnType="TEXT";
ec_MESBasic_baseCustomer_baseCustomer_custListPart_quickquery_info["customerShortName"].layRec="customerShortName";
ec_MESBasic_baseCustomer_baseCustomer_custListPart_quickquery_info["customerShortName"].columnName="CUSTOMER_SHORTNAME";
ec_MESBasic_baseCustomer_baseCustomer_custListPart_quickquery_info["customerName"]={};
ec_MESBasic_baseCustomer_baseCustomer_custListPart_quickquery_info["customerName"].dbColumnType="TEXT";
ec_MESBasic_baseCustomer_baseCustomer_custListPart_quickquery_info["customerName"].layRec="customerName";
ec_MESBasic_baseCustomer_baseCustomer_custListPart_quickquery_info["customerName"].columnName="CUSTOMER_NAME";
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
 	var advRemainDialog = $('[id="MESBasic.baseCustomer.baseCustomer.custListPart.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.baseCustomer.baseCustomer.custListPart.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_baseCustomer_baseCustomer_custListPart_adv_queryForm" exportUrl="/MESBasic/baseCustomer/baseCustomer/custListPart-query.action">
							<#assign customerCode_defaultValue  = ''>
									<#assign customerCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_adv_queryForm" code="MESBasic_1_baseCustomer_BaseCustomer_customerCode" showFormat="TEXT" defaultValue=customerCode_defaultValue  divCode="MESBasic_1_baseCustomer_BaseCustomer_customerCode_customerCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseCustomer_BaseCustomer" layRec="customerCode" columnname="CUSTOMER_CODE" columntype="TEXT" name="customerCode" fieldType="TEXTFIELD" tableName="S2BASE_CUSTOMER"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										客户编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseCustomer_BaseCustomer" />
										<#if (customerCode_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_adv_queryForm"  isPrecise=true value="${customerCode_defaultValue!}" deValue="${customerCode_defaultValue!}"   conditionfunc="MESBasic.baseCustomer.baseCustomer.custListPart._querycustomFunc('customerCode')" name="customerCode" id="adv_ec_MESBasic_baseCustomer_baseCustomer_custListPart_queryForm_customerCode" displayFieldName="customerCode" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/baseCustomer/baseCustomer/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_baseCustomer_custListPart"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_adv_queryForm"  isPrecise=true  conditionfunc="MESBasic.baseCustomer.baseCustomer.custListPart._querycustomFunc('customerCode')" name="customerCode" id="adv_ec_MESBasic_baseCustomer_baseCustomer_custListPart_queryForm_customerCode" displayFieldName="customerCode" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/baseCustomer/baseCustomer/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_baseCustomer_custListPart"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign customerShortName_defaultValue  = ''>
									<#assign customerShortName_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_adv_queryForm" code="MESBasic_1_baseCustomer_BaseCustomer_customerShortName" showFormat="TEXT" defaultValue=customerShortName_defaultValue  divCode="MESBasic_1_baseCustomer_BaseCustomer_customerShortName_customerShortName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseCustomer_BaseCustomer" layRec="customerShortName" columnname="CUSTOMER_SHORTNAME" columntype="TEXT" name="customerShortName" fieldType="TEXTFIELD" tableName="S2BASE_CUSTOMER"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										客户简称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseCustomer_BaseCustomer" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="customerShortName" id="adv_customerShortName" value="${customerShortName_defaultValue!}" deValue="${customerShortName_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign customerName_defaultValue  = ''>
									<#assign customerName_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_adv_queryForm" code="MESBasic_1_baseCustomer_BaseCustomer_customerName" showFormat="TEXT" defaultValue=customerName_defaultValue  divCode="MESBasic_1_baseCustomer_BaseCustomer_customerName_customerName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseCustomer_BaseCustomer" layRec="customerName" columnname="CUSTOMER_NAME" columntype="TEXT" name="customerName" fieldType="TEXTFIELD" tableName="S2BASE_CUSTOMER"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										客户名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseCustomer_BaseCustomer" />
										<#if (customerName_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_adv_queryForm"  isPrecise=true value="${customerName_defaultValue!}" deValue="${customerName_defaultValue!}"   conditionfunc="MESBasic.baseCustomer.baseCustomer.custListPart._querycustomFunc('customerName')" name="customerName" id="adv_ec_MESBasic_baseCustomer_baseCustomer_custListPart_queryForm_customerName" displayFieldName="customerName" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/baseCustomer/baseCustomer/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_baseCustomer_custListPart"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_adv_queryForm"  isPrecise=true  conditionfunc="MESBasic.baseCustomer.baseCustomer.custListPart._querycustomFunc('customerName')" name="customerName" id="adv_ec_MESBasic_baseCustomer_baseCustomer_custListPart_queryForm_customerName" displayFieldName="customerName" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/baseCustomer/baseCustomer/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_baseCustomer_custListPart"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign customerType_defaultValue  = ''>
									<#assign customerType_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_adv_queryForm" code="MESBasic_1_baseCustomer_BaseCustomer_customerType" showFormat="SELECTCOMP" defaultValue=customerType_defaultValue  divCode="MESBasic_1_baseCustomer_BaseCustomer_customerType_customerType" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseCustomer_BaseCustomer" layRec="customerType" columnname="CUSTOMER_TYPE" columntype="SYSTEMCODE" name="customerType" fieldType="SELECTCOMP" tableName="S2BASE_CUSTOMER"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										客户类型
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseCustomer_BaseCustomer" />
										<@systemcode seniorSystemCode=true advquery=true onchange="" ecFlag=true deValue="${customerType_defaultValue}"   name="customerType" code="1010" classStyle="cui-noborder-input" value="" />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign customerProperty_defaultValue  = ''>
									<#assign customerProperty_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_adv_queryForm" code="MESBasic_1_baseCustomer_BaseCustomer_customerProperty" showFormat="SELECTCOMP" defaultValue=customerProperty_defaultValue  divCode="MESBasic_1_baseCustomer_BaseCustomer_customerProperty_customerProperty" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseCustomer_BaseCustomer" layRec="customerProperty" columnname="CUSTOMER_PROPERTY" columntype="SYSTEMCODE" name="customerProperty" fieldType="SELECTCOMP" tableName="S2BASE_CUSTOMER"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										企业性质
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseCustomer_BaseCustomer" />
										<@systemcode seniorSystemCode=true advquery=true onchange="" ecFlag=true deValue="${customerProperty_defaultValue}"   name="customerProperty" code="1005" classStyle="cui-noborder-input" value="" />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign customerState_defaultValue  = '2'>
									<#assign customerState_defaultValue  = '2'>
								<@advsqueryfield formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_adv_queryForm" code="MESBasic_1_baseCustomer_BaseCustomer_customerState" showFormat="SELECTCOMP" defaultValue=customerState_defaultValue  divCode="MESBasic_1_baseCustomer_BaseCustomer_customerState_customerState" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseCustomer_BaseCustomer" layRec="customerState" columnname="CUSTOMER_STATE" columntype="SYSTEMCODE" name="customerState" fieldType="SELECTCOMP" tableName="S2BASE_CUSTOMER"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										启用状态
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseCustomer_BaseCustomer" />
										<@systemcode seniorSystemCode=true advquery=true onchange="" ecFlag=true deValue="${customerState_defaultValue}"   name="customerState" code="BaseState" classStyle="cui-noborder-input" value="" />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign customerMobile_defaultValue  = ''>
									<#assign customerMobile_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_adv_queryForm" code="MESBasic_1_baseCustomer_BaseCustomer_customerMobile" showFormat="TEXT" defaultValue=customerMobile_defaultValue  divCode="MESBasic_1_baseCustomer_BaseCustomer_customerMobile_customerMobile" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseCustomer_BaseCustomer" layRec="customerMobile" columnname="CUSTOMER_MOBILE" columntype="TEXT" name="customerMobile" fieldType="TEXTFIELD" tableName="S2BASE_CUSTOMER"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										手机
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseCustomer_BaseCustomer" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="customerMobile" id="adv_customerMobile" value="${customerMobile_defaultValue!}" deValue="${customerMobile_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign customerBank_defaultValue  = ''>
									<#assign customerBank_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_adv_queryForm" code="MESBasic_1_baseCustomer_BaseCustomer_customerBank" showFormat="TEXT" defaultValue=customerBank_defaultValue  divCode="MESBasic_1_baseCustomer_BaseCustomer_customerBank_customerBank" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseCustomer_BaseCustomer" layRec="customerBank" columnname="CUSTOMER_BANK" columntype="TEXT" name="customerBank" fieldType="TEXTFIELD" tableName="S2BASE_CUSTOMER"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										开户行
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseCustomer_BaseCustomer" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="customerBank" id="adv_customerBank" value="${customerBank_defaultValue!}" deValue="${customerBank_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign customerTradeCode_defaultValue  = ''>
									<#assign customerTradeCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_adv_queryForm" code="MESBasic_1_baseCustomer_BaseCustomer_customerTradeCode" showFormat="TEXT" defaultValue=customerTradeCode_defaultValue  divCode="MESBasic_1_baseCustomer_BaseCustomer_customerTradeCode_customerTradeCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseCustomer_BaseCustomer" layRec="customerTradeCode" columnname="CUSTOMER_TRADECODE" columntype="TEXT" name="customerTradeCode" fieldType="TEXTFIELD" tableName="S2BASE_CUSTOMER"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										工商登记号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseCustomer_BaseCustomer" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="customerTradeCode" id="adv_customerTradeCode" value="${customerTradeCode_defaultValue!}" deValue="${customerTradeCode_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign customerTaxCode_defaultValue  = ''>
									<#assign customerTaxCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_adv_queryForm" code="MESBasic_1_baseCustomer_BaseCustomer_customerTaxCode" showFormat="TEXT" defaultValue=customerTaxCode_defaultValue  divCode="MESBasic_1_baseCustomer_BaseCustomer_customerTaxCode_customerTaxCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseCustomer_BaseCustomer" layRec="customerTaxCode" columnname="CUSTOMER_TAXCODE" columntype="TEXT" name="customerTaxCode" fieldType="TEXTFIELD" tableName="S2BASE_CUSTOMER"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										税务登记号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseCustomer_BaseCustomer" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="customerTaxCode" id="adv_customerTaxCode" value="${customerTaxCode_defaultValue!}" deValue="${customerTaxCode_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign customerPostCode_defaultValue  = ''>
									<#assign customerPostCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_adv_queryForm" code="MESBasic_1_baseCustomer_BaseCustomer_customerPostCode" showFormat="TEXT" defaultValue=customerPostCode_defaultValue  divCode="MESBasic_1_baseCustomer_BaseCustomer_customerPostCode_customerPostCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseCustomer_BaseCustomer" layRec="customerPostCode" columnname="CUSTOMER_POSTCODE" columntype="TEXT" name="customerPostCode" fieldType="TEXTFIELD" tableName="S2BASE_CUSTOMER"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										邮编
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseCustomer_BaseCustomer" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="customerPostCode" id="adv_customerPostCode" value="${customerPostCode_defaultValue!}" deValue="${customerPostCode_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign customerAddress_defaultValue  = ''>
									<#assign customerAddress_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_adv_queryForm" code="MESBasic_1_baseCustomer_BaseCustomer_customerAddress" showFormat="TEXT" defaultValue=customerAddress_defaultValue  divCode="MESBasic_1_baseCustomer_BaseCustomer_customerAddress_customerAddress" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseCustomer_BaseCustomer" layRec="customerAddress" columnname="CUSTOMER_ADDRESS" columntype="TEXT" name="customerAddress" fieldType="TEXTFIELD" tableName="S2BASE_CUSTOMER"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										地址
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseCustomer_BaseCustomer" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="customerAddress" id="adv_customerAddress" value="${customerAddress_defaultValue!}" deValue="${customerAddress_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign customerDCCode_defaultValue  = ''>
									<#assign customerDCCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_adv_queryForm" code="MESBasic_1_baseCustomer_BaseCustomer_customerDCCode" showFormat="SELECTCOMP" defaultValue=customerDCCode_defaultValue  divCode="MESBasic_1_baseCustomer_BaseCustomer_customerDCCode_customerDCCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseCustomer_BaseCustomer" layRec="customerDCCode" columnname="CUSTOMER_DCCODE" columntype="SYSTEMCODE" name="customerDCCode" fieldType="SELECTCOMP" tableName="S2BASE_CUSTOMER"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										地区
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseCustomer_BaseCustomer" />
										<@systemcode seniorSystemCode=true advquery=true onchange="" ecFlag=true deValue="${customerDCCode_defaultValue}"   name="customerDCCode" code="1003" classStyle="cui-noborder-input" value="" />
								
                                	
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
			viewCode: 'MESBasic_1_baseCustomer_custListPart',
			modelCode: 'MESBasic_1_baseCustomer_BaseCustomer',
			modelName: 'BaseCustomer',
			formId: 'ec_MESBasic_baseCustomer_baseCustomer_custListPart_queryForm',
			olddiv: 'MESBasic.baseCustomer.baseCustomer.custListPart.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.baseCustomer.baseCustomer.custListPart.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_baseCustomer_custListPart'+"&entity.code="+'MESBasic_1_baseCustomer';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.baseCustomer.baseCustomer.custListPart.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.baseCustomer.baseCustomer.custListPart.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.baseCustomer.baseCustomer.custListPart.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_baseCustomer_custListPart'+"&entity.code="+'MESBasic_1_baseCustomer';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.baseCustomer.baseCustomer.custListPart.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.baseCustomer.baseCustomer.custListPart.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.baseCustomer.baseCustomer.custListPart.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.baseCustomer.baseCustomer.custListPart.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.baseCustomer.baseCustomer.custListPart.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.baseCustomer.baseCustomer.custListPart.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.baseCustomer.baseCustomer.custListPart.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.baseCustomer.baseCustomer.custListPart.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.baseCustomer.baseCustomer.custListPart.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.baseCustomer.baseCustomer.custListPart.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.baseCustomer.baseCustomer.custListPart.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.baseCustomer.baseCustomer.custListPart.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.baseCustomer.baseCustomer.custListPart.query('query')">
<#assign datatable_dataUrl = "/MESBasic/baseCustomer/baseCustomer/custListPart-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_MESBasic_baseCustomer_baseCustomer_custListPart_query" renderOverEvent="ec_MESBasic_baseCustomer_baseCustomer_custListPart_RenderOverEvent" pageInitMethod="ec_MESBasic_baseCustomer_baseCustomer_custListPart_PageInitMethod" modelCode="MESBasic_1_baseCustomer_BaseCustomer" noPermissionKeys="customerCode,customerShortName,customerName,customerCCCode.ccName,customerVocation,customerDCCode,customerDegreeCode,customerProperty,ownerStaff.name" hidekeyPrefix="ec_MESBasic_baseCustomer_baseCustomer_custListPart_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_baseCustomer_baseCustomer_custListPart_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="MESBasic.baseCustomer.baseCustomer.custListPart.dbmodifycustListPart" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','customerVocation','customerDCCode','customerDegreeCode','customerProperty','customerCCCode.id','customerCCCode.ccCode','ownerStaff.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.baseCustomer.baseCustomer.custListPart.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}custListPart_add_add_MESBasic_1_baseCustomer_custListPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1449650377447')}||iconcls:add||useInMore:false||onclick:
					doAdd()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_baseCustomer_custListPart_BUTTON_add"
		buttonType="CUSTOM" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}custListPart_add_add_MESBasic_1_baseCustomer_custListPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1449650377447')}||iconcls:add||useInMore:false||onclick:
					doAdd()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}custListPart_edit_modify_MESBasic_1_baseCustomer_custListPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1449650391506')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.baseCustomer.baseCustomer.custListPart.modifycustListPart()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_baseCustomer_custListPart_BUTTON_edit"
		buttonType="MODIFY" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}custListPart_edit_modify_MESBasic_1_baseCustomer_custListPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1449650391506')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.baseCustomer.baseCustomer.custListPart.modifycustListPart()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}custListPart_del_del_MESBasic_1_baseCustomer_custListPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1449650409114')}||iconcls:del||useInMore:false||onclick:
				MESBasic.baseCustomer.baseCustomer.custListPart.delcustListPart()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_baseCustomer_custListPart_BUTTON_del"
		buttonType="DELETE" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}custListPart_del_del_MESBasic_1_baseCustomer_custListPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1449650409114')}||iconcls:del||useInMore:false||onclick:
				MESBasic.baseCustomer.baseCustomer.custListPart.delcustListPart()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}custListPart_importCustomer_import_MESBasic_1_baseCustomer_custListPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1486792034910')}||iconcls:import||useInMore:false||onclick:
				MESBasic.baseCustomer.baseCustomer.custListPart.importcustListPart()||subButtons:[{text:'${getText('import.file.downloadtemplate')}',handler:function(){MESBasic.baseCustomer.baseCustomer.custListPart.downloadTemplatecustListPart()},useInMore:'false'}]
		" 
		resultType="json" 
		buttonCode="MESBasic_1_baseCustomer_custListPart_BUTTON_importCustomer"
		buttonType="IMPORT" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}custListPart_importCustomer_import_MESBasic_1_baseCustomer_custListPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1486792034910')}||iconcls:import||useInMore:false||onclick:
				MESBasic.baseCustomer.baseCustomer.custListPart.importcustListPart()||subButtons:[{text:'${getText('import.file.downloadtemplate')}',handler:function(){MESBasic.baseCustomer.baseCustomer.custListPart.downloadTemplatecustListPart()},useInMore:'false'}]
		" 
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign customerCode_displayDefaultType  = ''>
			<@datacolumn columnName="CUSTOMER_CODE"    showFormat="TEXT" defaultDisplay="${customerCode_displayDefaultType!}"  key="customerCode"   label="${getText('MESBasic.propertydisplayName.randon1449640688865')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign customerShortName_displayDefaultType  = ''>
			<@datacolumn columnName="CUSTOMER_SHORTNAME"    showFormat="TEXT" defaultDisplay="${customerShortName_displayDefaultType!}"  key="customerShortName"   label="${getText('MESBasic.propertydisplayName.randon1449647160005')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign customerName_displayDefaultType  = ''>
			<@datacolumn columnName="CUSTOMER_NAME"    showFormat="TEXT" defaultDisplay="${customerName_displayDefaultType!}"  key="customerName"   label="${getText('MESBasic.propertydisplayName.randon1449646749348')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign customerCCCode_ccName_displayDefaultType  = ''>
			<@datacolumn columnName="CC_NAME"    showFormat="TEXT" defaultDisplay="${customerCCCode_ccName_displayDefaultType!}"  key="customerCCCode.ccName"   label="${getText('MESBasic.propertydisplayName.randon1449628587988.Cust1')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign customerVocation_displayDefaultType  = ''>
			<@datacolumn columnName="CUSTOMER_VOCATION"    showFormat="SELECTCOMP" defaultDisplay="${customerVocation_displayDefaultType!}"  key="customerVocationForDisplay" order=false  label="${getText('MESBasic.propertydisplayName.randon1449648077021')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign customerDCCode_displayDefaultType  = ''>
			<@datacolumn columnName="CUSTOMER_DCCODE"    showFormat="SELECTCOMP" defaultDisplay="${customerDCCode_displayDefaultType!}"  key="customerDCCodeForDisplay" order=false  label="${getText('MESBasic.propertydisplayName.randon1449640880459')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign customerDegreeCode_displayDefaultType  = ''>
			<@datacolumn columnName="CUSTOMER_DEGREECODE"    showFormat="SELECTCOMP" defaultDisplay="${customerDegreeCode_displayDefaultType!}"  key="customerDegreeCodeForDisplay" order=false  label="${getText('MESBasic.propertydisplayName.randon1449641128193')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign customerProperty_displayDefaultType  = ''>
			<@datacolumn columnName="CUSTOMER_PROPERTY"    showFormat="SELECTCOMP" defaultDisplay="${customerProperty_displayDefaultType!}"  key="customerPropertyForDisplay" order=false  label="${getText('MESBasic.propertydisplayName.randon1449647028584')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign ownerStaff_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${ownerStaff_name_displayDefaultType!}"  key="ownerStaff.name"   label="${getText('MESBasic.foundation.staff.dimissionStaff_xls.staffName.Cust1')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_baseCustomer_baseCustomer_custListPart_RenderOverEvent(){
}
function ec_MESBasic_baseCustomer_baseCustomer_custListPart_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
</script>