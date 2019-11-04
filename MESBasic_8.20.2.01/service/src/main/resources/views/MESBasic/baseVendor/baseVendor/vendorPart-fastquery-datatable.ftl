	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1449536347672')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_baseVendor_baseVendor_vendorPart_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm" exportUrl="/MESBasic/baseVendor/baseVendor/vendorPart-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="vendorDepartID" bak_value="vendorDepartID"/>
		<input type="hidden" id="MESBasic_1_baseVenderClass_BaseVendorClass" value="vendorVCCode" bak_value="vendorVCCode"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1449536448032')}_${getText('MESBasic.viewtitle.randon1449542655240')}.xls" />
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
		<div id="ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_baseVendor_vendorPart')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_baseVendor_vendorPart" formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm" dataTableId="ec_MESBasic_baseVendor_baseVendor_vendorPart_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm" isExpandAll=true formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm" idprefix="ec_MESBasic_baseVendor_baseVendor_vendorPart" expandType="all"  fieldcodes="MESBasic_1_baseVendor_BaseVendor_vendorCode_vendorCode:MESBasic.propertydisplayName.randon1449537304035||MESBasic_1_baseVendor_BaseVendor_vendorName_vendorName:MESBasic.propertydisplayName.randon1449540299342" > 
							<#assign vendorCode_defaultValue  = ''>
									<#assign vendorCode_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm" code="MESBasic_1_baseVendor_BaseVendor_vendorCode" showFormat="TEXT" defaultValue=vendorCode_defaultValue  divCode="MESBasic_1_baseVendor_BaseVendor_vendorCode_vendorCode" isCustomize=true style="" > 
										<#if (vendorCode_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm"  isPrecise=true value="${vendorCode_defaultValue!}" deValue="${vendorCode_defaultValue!}"   conditionfunc="MESBasic.baseVendor.baseVendor.vendorPart._querycustomFunc('vendorCode')" name="vendorCode" id="ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm_vendorCode" displayFieldName="vendorCode" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseVendor.baseVendor.vendorPart.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm"  isPrecise=true  conditionfunc="MESBasic.baseVendor.baseVendor.vendorPart._querycustomFunc('vendorCode')" name="vendorCode" id="ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm_vendorCode" displayFieldName="vendorCode" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseVendor.baseVendor.vendorPart.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign vendorName_defaultValue  = ''>
									<#assign vendorName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm" code="MESBasic_1_baseVendor_BaseVendor_vendorName" showFormat="TEXT" defaultValue=vendorName_defaultValue  divCode="MESBasic_1_baseVendor_BaseVendor_vendorName_vendorName" isCustomize=true style="" > 
										<#if (vendorName_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm"  isPrecise=true value="${vendorName_defaultValue!}" deValue="${vendorName_defaultValue!}"   conditionfunc="MESBasic.baseVendor.baseVendor.vendorPart._querycustomFunc('vendorName')" name="vendorName" id="ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm_vendorName" displayFieldName="vendorName" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseVendor.baseVendor.vendorPart.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm"  isPrecise=true  conditionfunc="MESBasic.baseVendor.baseVendor.vendorPart._querycustomFunc('vendorName')" name="vendorName" id="ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm_vendorName" displayFieldName="vendorName" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseVendor.baseVendor.vendorPart.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm" type="adv" onclick="MESBasic.baseVendor.baseVendor.vendorPart.commonQuery('query')" onadvancedclick="advQuery('MESBasic.baseVendor.baseVendor.vendorPart.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_baseVendor_baseVendor_vendorPart_quickquery_info={};
ec_MESBasic_baseVendor_baseVendor_vendorPart_quickquery_info["MainTableName"]="S2BASE_VENDOR";
ec_MESBasic_baseVendor_baseVendor_vendorPart_quickquery_info["vendorCode"]={};
ec_MESBasic_baseVendor_baseVendor_vendorPart_quickquery_info["vendorCode"].dbColumnType="TEXT";
ec_MESBasic_baseVendor_baseVendor_vendorPart_quickquery_info["vendorCode"].layRec="vendorCode";
ec_MESBasic_baseVendor_baseVendor_vendorPart_quickquery_info["vendorCode"].columnName="VENDOR_CODE";
ec_MESBasic_baseVendor_baseVendor_vendorPart_quickquery_info["vendorName"]={};
ec_MESBasic_baseVendor_baseVendor_vendorPart_quickquery_info["vendorName"].dbColumnType="TEXT";
ec_MESBasic_baseVendor_baseVendor_vendorPart_quickquery_info["vendorName"].layRec="vendorName";
ec_MESBasic_baseVendor_baseVendor_vendorPart_quickquery_info["vendorName"].columnName="VENDOR_NAME";
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
 	var advRemainDialog = $('[id="MESBasic.baseVendor.baseVendor.vendorPart.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.baseVendor.baseVendor.vendorPart.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_baseVendor_baseVendor_vendorPart_adv_queryForm" exportUrl="/MESBasic/baseVendor/baseVendor/vendorPart-query.action">
							<#assign vendorCode_defaultValue  = ''>
									<#assign vendorCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_adv_queryForm" code="MESBasic_1_baseVendor_BaseVendor_vendorCode" showFormat="TEXT" defaultValue=vendorCode_defaultValue  divCode="MESBasic_1_baseVendor_BaseVendor_vendorCode_vendorCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseVendor_BaseVendor" layRec="vendorCode" columnname="VENDOR_CODE" columntype="TEXT" name="vendorCode" fieldType="TEXTFIELD" tableName="S2BASE_VENDOR"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										供应商编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseVendor_BaseVendor" />
										<#if (vendorCode_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_adv_queryForm"  isPrecise=true value="${vendorCode_defaultValue!}" deValue="${vendorCode_defaultValue!}"   conditionfunc="MESBasic.baseVendor.baseVendor.vendorPart._querycustomFunc('vendorCode')" name="vendorCode" id="adv_ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm_vendorCode" displayFieldName="vendorCode" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_baseVendor_vendorPart"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_adv_queryForm"  isPrecise=true  conditionfunc="MESBasic.baseVendor.baseVendor.vendorPart._querycustomFunc('vendorCode')" name="vendorCode" id="adv_ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm_vendorCode" displayFieldName="vendorCode" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_baseVendor_vendorPart"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign vendorName_defaultValue  = ''>
									<#assign vendorName_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_adv_queryForm" code="MESBasic_1_baseVendor_BaseVendor_vendorName" showFormat="TEXT" defaultValue=vendorName_defaultValue  divCode="MESBasic_1_baseVendor_BaseVendor_vendorName_vendorName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseVendor_BaseVendor" layRec="vendorName" columnname="VENDOR_NAME" columntype="TEXT" name="vendorName" fieldType="TEXTFIELD" tableName="S2BASE_VENDOR"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										供应商名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseVendor_BaseVendor" />
										<#if (vendorName_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_adv_queryForm"  isPrecise=true value="${vendorName_defaultValue!}" deValue="${vendorName_defaultValue!}"   conditionfunc="MESBasic.baseVendor.baseVendor.vendorPart._querycustomFunc('vendorName')" name="vendorName" id="adv_ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm_vendorName" displayFieldName="vendorName" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_baseVendor_vendorPart"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_adv_queryForm"  isPrecise=true  conditionfunc="MESBasic.baseVendor.baseVendor.vendorPart._querycustomFunc('vendorName')" name="vendorName" id="adv_ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm_vendorName" displayFieldName="vendorName" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_baseVendor_vendorPart"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign vendorShortName_defaultValue  = ''>
									<#assign vendorShortName_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_adv_queryForm" code="MESBasic_1_baseVendor_BaseVendor_vendorShortName" showFormat="TEXT" defaultValue=vendorShortName_defaultValue  divCode="MESBasic_1_baseVendor_BaseVendor_vendorShortName_vendorShortName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseVendor_BaseVendor" layRec="vendorShortName" columnname="VENDOR_SHORTNAME" columntype="TEXT" name="vendorShortName" fieldType="TEXTFIELD" tableName="S2BASE_VENDOR"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										供应商简称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseVendor_BaseVendor" />
										<#if (vendorShortName_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_adv_queryForm"  isPrecise=true value="${vendorShortName_defaultValue!}" deValue="${vendorShortName_defaultValue!}"   conditionfunc="MESBasic.baseVendor.baseVendor.vendorPart._querycustomFunc('vendorShortName')" name="vendorShortName" id="adv_ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm_vendorShortName" displayFieldName="vendorShortName" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_baseVendor_vendorPart"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_adv_queryForm"  isPrecise=true  conditionfunc="MESBasic.baseVendor.baseVendor.vendorPart._querycustomFunc('vendorShortName')" name="vendorShortName" id="adv_ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm_vendorShortName" displayFieldName="vendorShortName" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_baseVendor_vendorPart"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign vendorDegreeCode_defaultValue  = ''>
									<#assign vendorDegreeCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_adv_queryForm" code="MESBasic_1_baseVendor_BaseVendor_vendorDegreeCode" showFormat="SELECTCOMP" defaultValue=vendorDegreeCode_defaultValue  divCode="MESBasic_1_baseVendor_BaseVendor_vendorDegreeCode_vendorDegreeCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseVendor_BaseVendor" layRec="vendorDegreeCode" columnname="VENDOR_DEGREECODE" columntype="SYSTEMCODE" name="vendorDegreeCode" fieldType="SELECTCOMP" tableName="S2BASE_VENDOR"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										供应商等级
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseVendor_BaseVendor" />
										<@systemcode seniorSystemCode=true advquery=true onchange="" ecFlag=true deValue="${vendorDegreeCode_defaultValue}"   name="vendorDegreeCode" code="1007" classStyle="cui-noborder-input" value="" />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign vendorFax_defaultValue  = ''>
									<#assign vendorFax_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_adv_queryForm" code="MESBasic_1_baseVendor_BaseVendor_vendorFax" showFormat="TEXT" defaultValue=vendorFax_defaultValue  divCode="MESBasic_1_baseVendor_BaseVendor_vendorFax_vendorFax" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseVendor_BaseVendor" layRec="vendorFax" columnname="VENDOR_FAX" columntype="TEXT" name="vendorFax" fieldType="TEXTFIELD" tableName="S2BASE_VENDOR"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										传真
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseVendor_BaseVendor" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="vendorFax" id="adv_vendorFax" value="${vendorFax_defaultValue!}" deValue="${vendorFax_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign vendorPhone_defaultValue  = ''>
									<#assign vendorPhone_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_adv_queryForm" code="MESBasic_1_baseVendor_BaseVendor_vendorPhone" showFormat="TEXT" defaultValue=vendorPhone_defaultValue  divCode="MESBasic_1_baseVendor_BaseVendor_vendorPhone_vendorPhone" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseVendor_BaseVendor" layRec="vendorPhone" columnname="VENDOR_PHONE" columntype="TEXT" name="vendorPhone" fieldType="TEXTFIELD" tableName="S2BASE_VENDOR"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										电话
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseVendor_BaseVendor" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="vendorPhone" id="adv_vendorPhone" value="${vendorPhone_defaultValue!}" deValue="${vendorPhone_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign vendorAccount_defaultValue  = ''>
									<#assign vendorAccount_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_adv_queryForm" code="MESBasic_1_baseVendor_BaseVendor_vendorAccount" showFormat="TEXT" defaultValue=vendorAccount_defaultValue  divCode="MESBasic_1_baseVendor_BaseVendor_vendorAccount_vendorAccount" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseVendor_BaseVendor" layRec="vendorAccount" columnname="VENDOR_ACCOUNT" columntype="TEXT" name="vendorAccount" fieldType="TEXTFIELD" tableName="S2BASE_VENDOR"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										银行账号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseVendor_BaseVendor" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="vendorAccount" id="adv_vendorAccount" value="${vendorAccount_defaultValue!}" deValue="${vendorAccount_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign vendorPostCode_defaultValue  = ''>
									<#assign vendorPostCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_adv_queryForm" code="MESBasic_1_baseVendor_BaseVendor_vendorPostCode" showFormat="TEXT" defaultValue=vendorPostCode_defaultValue  divCode="MESBasic_1_baseVendor_BaseVendor_vendorPostCode_vendorPostCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseVendor_BaseVendor" layRec="vendorPostCode" columnname="VENDOR_POSTCODE" columntype="TEXT" name="vendorPostCode" fieldType="TEXTFIELD" tableName="S2BASE_VENDOR"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										邮编
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseVendor_BaseVendor" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="vendorPostCode" id="adv_vendorPostCode" value="${vendorPostCode_defaultValue!}" deValue="${vendorPostCode_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign vendorDCCode_defaultValue  = ''>
									<#assign vendorDCCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_adv_queryForm" code="MESBasic_1_baseVendor_BaseVendor_vendorDCCode" showFormat="SELECTCOMP" defaultValue=vendorDCCode_defaultValue  divCode="MESBasic_1_baseVendor_BaseVendor_vendorDCCode_vendorDCCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseVendor_BaseVendor" layRec="vendorDCCode" columnname="VENDOR_DCCODE" columntype="SYSTEMCODE" name="vendorDCCode" fieldType="SELECTCOMP" tableName="S2BASE_VENDOR"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										地区
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseVendor_BaseVendor" />
										<@systemcode seniorSystemCode=true advquery=true onchange="" ecFlag=true deValue="${vendorDCCode_defaultValue}"   name="vendorDCCode" code="1003" classStyle="cui-noborder-input" value="" />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign vendorTradeCode_defaultValue  = ''>
									<#assign vendorTradeCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_adv_queryForm" code="MESBasic_1_baseVendor_BaseVendor_vendorTradeCode" showFormat="TEXT" defaultValue=vendorTradeCode_defaultValue  divCode="MESBasic_1_baseVendor_BaseVendor_vendorTradeCode_vendorTradeCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseVendor_BaseVendor" layRec="vendorTradeCode" columnname="VENDOR_TRADECODE" columntype="TEXT" name="vendorTradeCode" fieldType="TEXTFIELD" tableName="S2BASE_VENDOR"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										工商登记号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseVendor_BaseVendor" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="vendorTradeCode" id="adv_vendorTradeCode" value="${vendorTradeCode_defaultValue!}" deValue="${vendorTradeCode_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign vendorTaxCode_defaultValue  = ''>
									<#assign vendorTaxCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_adv_queryForm" code="MESBasic_1_baseVendor_BaseVendor_vendorTaxCode" showFormat="TEXT" defaultValue=vendorTaxCode_defaultValue  divCode="MESBasic_1_baseVendor_BaseVendor_vendorTaxCode_vendorTaxCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseVendor_BaseVendor" layRec="vendorTaxCode" columnname="VENDOR_TAXCODE" columntype="TEXT" name="vendorTaxCode" fieldType="TEXTFIELD" tableName="S2BASE_VENDOR"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										税务登记号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseVendor_BaseVendor" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="vendorTaxCode" id="adv_vendorTaxCode" value="${vendorTaxCode_defaultValue!}" deValue="${vendorTaxCode_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign vendorState_defaultValue  = '2'>
									<#assign vendorState_defaultValue  = '2'>
								<@advsqueryfield formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_adv_queryForm" code="MESBasic_1_baseVendor_BaseVendor_vendorState" showFormat="SELECTCOMP" defaultValue=vendorState_defaultValue  divCode="MESBasic_1_baseVendor_BaseVendor_vendorState_vendorState" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseVendor_BaseVendor" layRec="vendorState" columnname="VENDOR_STATE" columntype="SYSTEMCODE" name="vendorState" fieldType="SELECTCOMP" tableName="S2BASE_VENDOR"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										启用状态
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseVendor_BaseVendor" />
										<@systemcode seniorSystemCode=true advquery=true onchange="" ecFlag=true deValue="${vendorState_defaultValue}"   name="vendorState" code="BaseState" classStyle="cui-noborder-input" value="" />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign vendorBank_defaultValue  = ''>
									<#assign vendorBank_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_adv_queryForm" code="MESBasic_1_baseVendor_BaseVendor_vendorBank" showFormat="TEXT" defaultValue=vendorBank_defaultValue  divCode="MESBasic_1_baseVendor_BaseVendor_vendorBank_vendorBank" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseVendor_BaseVendor" layRec="vendorBank" columnname="VENDOR_BANK" columntype="TEXT" name="vendorBank" fieldType="TEXTFIELD" tableName="S2BASE_VENDOR"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										开户银行
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseVendor_BaseVendor" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="vendorBank" id="adv_vendorBank" value="${vendorBank_defaultValue!}" deValue="${vendorBank_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign vendorVocation_defaultValue  = ''>
									<#assign vendorVocation_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_adv_queryForm" code="MESBasic_1_baseVendor_BaseVendor_vendorVocation" showFormat="SELECTCOMP" defaultValue=vendorVocation_defaultValue  divCode="MESBasic_1_baseVendor_BaseVendor_vendorVocation_vendorVocation" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseVendor_BaseVendor" layRec="vendorVocation" columnname="VENDOR_VOCATION" columntype="SYSTEMCODE" name="vendorVocation" fieldType="SELECTCOMP" tableName="S2BASE_VENDOR"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										行业
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseVendor_BaseVendor" />
										<@systemcode seniorSystemCode=true advquery=true onchange="" ecFlag=true deValue="${vendorVocation_defaultValue}"   name="vendorVocation" code="1004" classStyle="cui-noborder-input" value="" />
								
                                	
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
			viewCode: 'MESBasic_1_baseVendor_vendorPart',
			modelCode: 'MESBasic_1_baseVendor_BaseVendor',
			modelName: 'BaseVendor',
			formId: 'ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm',
			olddiv: 'MESBasic.baseVendor.baseVendor.vendorPart.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.baseVendor.baseVendor.vendorPart.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_baseVendor_vendorPart'+"&entity.code="+'MESBasic_1_baseVendor';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.baseVendor.baseVendor.vendorPart.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.baseVendor.baseVendor.vendorPart.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.baseVendor.baseVendor.vendorPart.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_baseVendor_vendorPart'+"&entity.code="+'MESBasic_1_baseVendor';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.baseVendor.baseVendor.vendorPart.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.baseVendor.baseVendor.vendorPart.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.baseVendor.baseVendor.vendorPart.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.baseVendor.baseVendor.vendorPart.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.baseVendor.baseVendor.vendorPart.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.baseVendor.baseVendor.vendorPart.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.baseVendor.baseVendor.vendorPart.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.baseVendor.baseVendor.vendorPart.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.baseVendor.baseVendor.vendorPart.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.baseVendor.baseVendor.vendorPart.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.baseVendor.baseVendor.vendorPart.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.baseVendor.baseVendor.vendorPart.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.baseVendor.baseVendor.vendorPart.query('query')">
<#assign datatable_dataUrl = "/MESBasic/baseVendor/baseVendor/vendorPart-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_MESBasic_baseVendor_baseVendor_vendorPart_query" renderOverEvent="ec_MESBasic_baseVendor_baseVendor_vendorPart_RenderOverEvent" pageInitMethod="ec_MESBasic_baseVendor_baseVendor_vendorPart_PageInitMethod" modelCode="MESBasic_1_baseVendor_BaseVendor" noPermissionKeys="vendorCode,vendorShortName,vendorName,vendorDegreeCode,vendorVCCode.name,vendorState" hidekeyPrefix="ec_MESBasic_baseVendor_baseVendor_vendorPart_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_baseVendor_baseVendor_vendorPart_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="MESBasic.baseVendor.baseVendor.vendorPart.dbmodifyvendorPart" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','vendorDegreeCode','vendorState','vendorVCCode.id','vendorVCCode.code']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.baseVendor.baseVendor.vendorPart.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}vendorPart_add_add_MESBasic_1_baseVendor_vendorPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1449543123489')}||iconcls:add||useInMore:false||onclick:
					doAdd()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_baseVendor_vendorPart_BUTTON_add"
		buttonType="CUSTOM" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}vendorPart_add_add_MESBasic_1_baseVendor_vendorPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1449543123489')}||iconcls:add||useInMore:false||onclick:
					doAdd()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}vendorPart_edit_modify_MESBasic_1_baseVendor_vendorPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1449545445703')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.baseVendor.baseVendor.vendorPart.modifyvendorPart()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_baseVendor_vendorPart_BUTTON_edit"
		buttonType="MODIFY" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}vendorPart_edit_modify_MESBasic_1_baseVendor_vendorPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1449545445703')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.baseVendor.baseVendor.vendorPart.modifyvendorPart()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}vendorPart_del_del_MESBasic_1_baseVendor_vendorPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1449545493543')}||iconcls:del||useInMore:false||onclick:
				MESBasic.baseVendor.baseVendor.vendorPart.delvendorPart()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_baseVendor_vendorPart_BUTTON_del"
		buttonType="DELETE" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}vendorPart_del_del_MESBasic_1_baseVendor_vendorPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1449545493543')}||iconcls:del||useInMore:false||onclick:
				MESBasic.baseVendor.baseVendor.vendorPart.delvendorPart()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}vendorPart_doEnableVendor_none_MESBasic_1_baseVendor_vendorPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1450242882723')}||iconcls:none||useInMore:false||onclick:
					doEnableVendor()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_baseVendor_vendorPart_BUTTON_doEnableVendor"
		buttonType="CUSTOM" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}vendorPart_doEnableVendor_none_MESBasic_1_baseVendor_vendorPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1450242882723')}||iconcls:none||useInMore:false||onclick:
					doEnableVendor()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}vendorPart_doDisableVendor_none_MESBasic_1_baseVendor_vendorPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1450242970020')}||iconcls:none||useInMore:false||onclick:
					doDisableVendor()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_baseVendor_vendorPart_BUTTON_doDisableVendor"
		buttonType="CUSTOM" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}vendorPart_doDisableVendor_none_MESBasic_1_baseVendor_vendorPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1450242970020')}||iconcls:none||useInMore:false||onclick:
					doDisableVendor()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}vendorPart_inportVendor_import_MESBasic_1_baseVendor_vendorPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1486792150407')}||iconcls:import||useInMore:false||onclick:
				MESBasic.baseVendor.baseVendor.vendorPart.importvendorPart()||subButtons:[{text:'${getText('import.file.downloadtemplate')}',handler:function(){MESBasic.baseVendor.baseVendor.vendorPart.downloadTemplatevendorPart()},useInMore:'false'}]
		" 
		resultType="json" 
		buttonCode="MESBasic_1_baseVendor_vendorPart_BUTTON_inportVendor"
		buttonType="IMPORT" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}vendorPart_inportVendor_import_MESBasic_1_baseVendor_vendorPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1486792150407')}||iconcls:import||useInMore:false||onclick:
				MESBasic.baseVendor.baseVendor.vendorPart.importvendorPart()||subButtons:[{text:'${getText('import.file.downloadtemplate')}',handler:function(){MESBasic.baseVendor.baseVendor.vendorPart.downloadTemplatevendorPart()},useInMore:'false'}]
		" 
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign vendorCode_displayDefaultType  = ''>
			<@datacolumn columnName="VENDOR_CODE"    showFormat="TEXT" defaultDisplay="${vendorCode_displayDefaultType!}"  key="vendorCode"   label="${getText('MESBasic.propertydisplayName.randon1449537304035')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign vendorShortName_displayDefaultType  = ''>
			<@datacolumn columnName="VENDOR_SHORTNAME"    showFormat="TEXT" defaultDisplay="${vendorShortName_displayDefaultType!}"  key="vendorShortName"   label="${getText('MESBasic.propertydisplayName.randon1449540785278')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign vendorName_displayDefaultType  = ''>
			<@datacolumn columnName="VENDOR_NAME"    showFormat="TEXT" defaultDisplay="${vendorName_displayDefaultType!}"  key="vendorName"   label="${getText('MESBasic.propertydisplayName.randon1449540299342')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign vendorDegreeCode_displayDefaultType  = ''>
			<@datacolumn columnName="VENDOR_DEGREECODE"    showFormat="SELECTCOMP" defaultDisplay="${vendorDegreeCode_displayDefaultType!}"  key="vendorDegreeCodeForDisplay" order=false  label="${getText('MESBasic.propertydisplayName.randon1449538619738')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign vendorVCCode_name_displayDefaultType  = ''>
			<@datacolumn columnName="VC_NAME"    showFormat="TEXT" defaultDisplay="${vendorVCCode_name_displayDefaultType!}"  key="vendorVCCode.name"   label="${getText('MESBasic.propertydisplayName.randon1449472903805.vendor1')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign vendorState_displayDefaultType  = ''>
			<@datacolumn columnName="VENDOR_STATE"    showFormat="SELECTCOMP" defaultDisplay="${vendorState_displayDefaultType!}"  key="vendorStateForDisplay" order=false  label="${getText('MESBasic.propertydisplayName.randon1450243165523')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_baseVendor_baseVendor_vendorPart_RenderOverEvent(){
}
function ec_MESBasic_baseVendor_baseVendor_vendorPart_PageInitMethod(){
}
	
	
	
	
	
	
</script>