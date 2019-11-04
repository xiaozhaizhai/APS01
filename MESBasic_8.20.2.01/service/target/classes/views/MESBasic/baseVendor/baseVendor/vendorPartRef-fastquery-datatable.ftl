	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1449536347672')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm" exportUrl="/MESBasic/baseVendor/baseVendor/vendorPartRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="vendorDepartID" bak_value="vendorDepartID"/>
		<input type="hidden" id="MESBasic_1_baseVenderClass_BaseVendorClass" value="vendorVCCode" bak_value="vendorVCCode"/>
		<input type="hidden" reset="false" name="MESBasic_baseVendor_baseVendor_vendorPartRef_condition" id="MESBasic_baseVendor_baseVendor_vendorPartRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1449536448032')}_${getText('MESBasic.viewtitle.randon1504601359572')}.xls" />
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
		<div id="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_baseVendor_vendorPartRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_baseVendor_vendorPartRef" formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm" dataTableId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm" isExpandAll=true formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm" idprefix="ec_MESBasic_baseVendor_baseVendor_vendorPartRef" expandType="all"  fieldcodes="MESBasic_1_baseVendor_BaseVendor_vendorCode_vendorCode:MESBasic.propertydisplayName.randon1449537304035||MESBasic_1_baseVendor_BaseVendor_vendorShortName_vendorShortName:MESBasic.propertydisplayName.randon1449540785278||MESBasic_1_baseVendor_BaseVendor_vendorName_vendorName:MESBasic.propertydisplayName.randon1449540299342" > 
							<#assign vendorCode_defaultValue  = ''>
									<#assign vendorCode_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm" code="MESBasic_1_baseVendor_BaseVendor_vendorCode" showFormat="TEXT" defaultValue=vendorCode_defaultValue  divCode="MESBasic_1_baseVendor_BaseVendor_vendorCode_vendorCode" isCustomize=true style="" > 
										<#if (vendorCode_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm" isCrossCompany=isCrossCompany isPrecise=true value="${vendorCode_defaultValue!}" deValue="${vendorCode_defaultValue!}"   conditionfunc="MESBasic.baseVendor.baseVendor.vendorPartRef._querycustomFunc('vendorCode')" name="vendorCode" id="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm_vendorCode" displayFieldName="vendorCode" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseVendor.baseVendor.vendorPartRef.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm" isCrossCompany=isCrossCompany isPrecise=true  conditionfunc="MESBasic.baseVendor.baseVendor.vendorPartRef._querycustomFunc('vendorCode')" name="vendorCode" id="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm_vendorCode" displayFieldName="vendorCode" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseVendor.baseVendor.vendorPartRef.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign vendorShortName_defaultValue  = ''>
									<#assign vendorShortName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm" code="MESBasic_1_baseVendor_BaseVendor_vendorShortName" showFormat="TEXT" defaultValue=vendorShortName_defaultValue  divCode="MESBasic_1_baseVendor_BaseVendor_vendorShortName_vendorShortName" isCustomize=true style="" > 
										<#if (vendorShortName_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm" isCrossCompany=isCrossCompany isPrecise=true value="${vendorShortName_defaultValue!}" deValue="${vendorShortName_defaultValue!}"   conditionfunc="MESBasic.baseVendor.baseVendor.vendorPartRef._querycustomFunc('vendorShortName')" name="vendorShortName" id="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm_vendorShortName" displayFieldName="vendorShortName" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseVendor.baseVendor.vendorPartRef.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm" isCrossCompany=isCrossCompany isPrecise=true  conditionfunc="MESBasic.baseVendor.baseVendor.vendorPartRef._querycustomFunc('vendorShortName')" name="vendorShortName" id="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm_vendorShortName" displayFieldName="vendorShortName" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseVendor.baseVendor.vendorPartRef.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign vendorName_defaultValue  = ''>
									<#assign vendorName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm" code="MESBasic_1_baseVendor_BaseVendor_vendorName" showFormat="TEXT" defaultValue=vendorName_defaultValue  divCode="MESBasic_1_baseVendor_BaseVendor_vendorName_vendorName" isCustomize=true style="" > 
										<#if (vendorName_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm" isCrossCompany=isCrossCompany isPrecise=true value="${vendorName_defaultValue!}" deValue="${vendorName_defaultValue!}"   conditionfunc="MESBasic.baseVendor.baseVendor.vendorPartRef._querycustomFunc('vendorName')" name="vendorName" id="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm_vendorName" displayFieldName="vendorName" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseVendor.baseVendor.vendorPartRef.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm" isCrossCompany=isCrossCompany isPrecise=true  conditionfunc="MESBasic.baseVendor.baseVendor.vendorPartRef._querycustomFunc('vendorName')" name="vendorName" id="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm_vendorName" displayFieldName="vendorName" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseVendor.baseVendor.vendorPartRef.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm" type="adv" onclick="MESBasic.baseVendor.baseVendor.vendorPartRef.commonQuery('query')" onadvancedclick="advQuery('MESBasic.baseVendor.baseVendor.vendorPartRef.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info={};
ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info["MainTableName"]="S2BASE_VENDOR";
ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info["vendorCode"]={};
ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info["vendorCode"].dbColumnType="TEXT";
ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info["vendorCode"].layRec="vendorCode";
ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info["vendorCode"].columnName="VENDOR_CODE";
ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info["vendorShortName"]={};
ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info["vendorShortName"].dbColumnType="TEXT";
ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info["vendorShortName"].layRec="vendorShortName";
ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info["vendorShortName"].columnName="VENDOR_SHORTNAME";
ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info["vendorName"]={};
ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info["vendorName"].dbColumnType="TEXT";
ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info["vendorName"].layRec="vendorName";
ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info["vendorName"].columnName="VENDOR_NAME";
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
 	var advRemainDialog = $('[id="MESBasic.baseVendor.baseVendor.vendorPartRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.baseVendor.baseVendor.vendorPartRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_adv_queryForm" exportUrl="/MESBasic/baseVendor/baseVendor/vendorPartRef-query.action">
							<#assign vendorCode_defaultValue  = ''>
									<#assign vendorCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_adv_queryForm" code="MESBasic_1_baseVendor_BaseVendor_vendorCode" showFormat="TEXT" defaultValue=vendorCode_defaultValue  divCode="MESBasic_1_baseVendor_BaseVendor_vendorCode_vendorCode" isCustomize=true > 
								
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
											<@mneclient iframe=true formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true value="${vendorCode_defaultValue!}" deValue="${vendorCode_defaultValue!}"   conditionfunc="MESBasic.baseVendor.baseVendor.vendorPartRef._querycustomFunc('vendorCode')" name="vendorCode" id="adv_ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm_vendorCode" displayFieldName="vendorCode" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_baseVendor_vendorPartRef"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true  conditionfunc="MESBasic.baseVendor.baseVendor.vendorPartRef._querycustomFunc('vendorCode')" name="vendorCode" id="adv_ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm_vendorCode" displayFieldName="vendorCode" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_baseVendor_vendorPartRef"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign vendorShortName_defaultValue  = ''>
									<#assign vendorShortName_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_adv_queryForm" code="MESBasic_1_baseVendor_BaseVendor_vendorShortName" showFormat="TEXT" defaultValue=vendorShortName_defaultValue  divCode="MESBasic_1_baseVendor_BaseVendor_vendorShortName_vendorShortName" isCustomize=true > 
								
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
											<@mneclient iframe=true formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true value="${vendorShortName_defaultValue!}" deValue="${vendorShortName_defaultValue!}"   conditionfunc="MESBasic.baseVendor.baseVendor.vendorPartRef._querycustomFunc('vendorShortName')" name="vendorShortName" id="adv_ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm_vendorShortName" displayFieldName="vendorShortName" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_baseVendor_vendorPartRef"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true  conditionfunc="MESBasic.baseVendor.baseVendor.vendorPartRef._querycustomFunc('vendorShortName')" name="vendorShortName" id="adv_ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm_vendorShortName" displayFieldName="vendorShortName" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_baseVendor_vendorPartRef"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign vendorName_defaultValue  = ''>
									<#assign vendorName_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_adv_queryForm" code="MESBasic_1_baseVendor_BaseVendor_vendorName" showFormat="TEXT" defaultValue=vendorName_defaultValue  divCode="MESBasic_1_baseVendor_BaseVendor_vendorName_vendorName" isCustomize=true > 
								
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
											<@mneclient iframe=true formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true value="${vendorName_defaultValue!}" deValue="${vendorName_defaultValue!}"   conditionfunc="MESBasic.baseVendor.baseVendor.vendorPartRef._querycustomFunc('vendorName')" name="vendorName" id="adv_ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm_vendorName" displayFieldName="vendorName" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_baseVendor_vendorPartRef"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true  conditionfunc="MESBasic.baseVendor.baseVendor.vendorPartRef._querycustomFunc('vendorName')" name="vendorName" id="adv_ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm_vendorName" displayFieldName="vendorName" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_baseVendor_vendorPartRef"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
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
			viewCode: 'MESBasic_1_baseVendor_vendorPartRef',
			modelCode: 'MESBasic_1_baseVendor_BaseVendor',
			modelName: 'BaseVendor',
			formId: 'ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm',
			olddiv: 'MESBasic.baseVendor.baseVendor.vendorPartRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.baseVendor.baseVendor.vendorPartRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_baseVendor_vendorPartRef'+"&entity.code="+'MESBasic_1_baseVendor';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.baseVendor.baseVendor.vendorPartRef.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.baseVendor.baseVendor.vendorPartRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.baseVendor.baseVendor.vendorPartRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_baseVendor_vendorPartRef'+"&entity.code="+'MESBasic_1_baseVendor';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.baseVendor.baseVendor.vendorPartRef.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.baseVendor.baseVendor.vendorPartRef.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.baseVendor.baseVendor.vendorPartRef.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.baseVendor.baseVendor.vendorPartRef.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.baseVendor.baseVendor.vendorPartRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.baseVendor.baseVendor.vendorPartRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.baseVendor.baseVendor.vendorPartRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.baseVendor.baseVendor.vendorPartRef.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.baseVendor.baseVendor.vendorPartRef.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.baseVendor.baseVendor.vendorPartRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.baseVendor.baseVendor.vendorPartRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.baseVendor.baseVendor.vendorPartRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.baseVendor.baseVendor.vendorPartRef.query('query')">
<#assign datatable_dataUrl = "/MESBasic/baseVendor/baseVendor/vendorPartRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_query" renderOverEvent="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_RenderOverEvent" pageInitMethod="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_PageInitMethod" modelCode="MESBasic_1_baseVendor_BaseVendor" noPermissionKeys="vendorCode,vendorShortName,vendorName,vendorDegreeCode,vendorVCCode.name" hidekeyPrefix="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="MESBasic.baseVendor.baseVendor.vendorPartRef.sendBackvendorPartRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','vendorDegreeCode','vendorVCCode.id','vendorVCCode.code','vendorCode','vendorName']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="MESBasic.baseVendor.baseVendor.vendorPartRef.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
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
			<@datacolumn columnName="VC_NAME"    showFormat="TEXT" defaultDisplay="${vendorVCCode_name_displayDefaultType!}"  key="vendorVCCode.name"   label="${getText('MESBasic.propertydisplayName.randon1449472903805.vendor1')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_baseVendor_baseVendor_vendorPartRef_RenderOverEvent(){
}
function ec_MESBasic_baseVendor_baseVendor_vendorPartRef_PageInitMethod(){
}
	
	
	
	
	
</script>