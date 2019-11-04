	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1423967167580')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_equipManage_equipment_ref2_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_equipManage_equipment_ref2_queryForm" exportUrl="/MESBasic/equipManage/equipment/ref2-query.action">
		<input type="hidden" id="MESBasic_1_eamType_EamType" value="eamType" bak_value="eamType"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="eamUseDeptId" bak_value="eamUseDeptId"/>
		<input type="hidden" id="MESBasic_1_area_Area" value="installPlace" bak_value="installPlace"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" id="MESBasic_1_factoryModel_FactoryModel" value="workcenter" bak_value="workcenter"/>
		<input type="hidden" reset="false" name="MESBasic_equipManage_equipment_ref2_condition" id="MESBasic_equipManage_equipment_ref2_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1423967194871')}_${getText('MESBasic.viewtitle.randon1425382383850')}.xls" />
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
		<div id="ec_MESBasic_equipManage_equipment_ref2_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_equipManage_equipment_ref2_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_equipManage_ref2')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_equipManage_ref2" formId="ec_MESBasic_equipManage_equipment_ref2_queryForm" dataTableId="ec_MESBasic_equipManage_equipment_ref2_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_equipManage_equipment_ref2_queryForm" isExpandAll=true formId="ec_MESBasic_equipManage_equipment_ref2_queryForm" idprefix="ec_MESBasic_equipManage_equipment_ref2" expandType="single"  fieldcodes="MESBasic_1_equipManage_Equipment_code_code:MESBasic.propertydisplayName.randon1423967256308||MESBasic_1_equipManage_Equipment_name_name:MESBasic.propertydisplayName.randon1423967231438||MESBasic_1_equipManage_Equipment_demo_demo:MESBasic.propertydisplayName.randon1423967391978||MESBasic_1_equipManage_Equipment_eamBuyTime_eamBuyTime:MESBasic.propertydisplayName.randon1460957425645||MESBasic_1_equipManage_Equipment_eamProduceFirm_eamProduceFirm:MESBasic.propertydisplayName.randon1426566652807||MESBasic_1_equipManage_Equipment_eamVendorName_eamVendorName:MESBasic.propertydisplayName.randon1426566956024" > 
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_equipManage_equipment_ref2_queryForm" code="MESBasic_1_equipManage_Equipment_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="MESBasic_1_equipManage_Equipment_code_code" isCustomize=true style="" > 
										<#if (code_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_equipManage_equipment_ref2_queryForm" isCrossCompany=isCrossCompany isPrecise=true value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="MESBasic.equipManage.equipment.ref2._querycustomFunc('code')" name="code" id="ec_MESBasic_equipManage_equipment_ref2_queryForm_code" displayFieldName="code" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/equipManage/equipment/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.equipManage.equipment.ref2.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_equipManage_equipment_ref2_queryForm" isCrossCompany=isCrossCompany isPrecise=true  conditionfunc="MESBasic.equipManage.equipment.ref2._querycustomFunc('code')" name="code" id="ec_MESBasic_equipManage_equipment_ref2_queryForm_code" displayFieldName="code" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/equipManage/equipment/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.equipManage.equipment.ref2.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_equipManage_equipment_ref2_queryForm" code="MESBasic_1_equipManage_Equipment_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="MESBasic_1_equipManage_Equipment_name_name" isCustomize=true style="" > 
										<#if (name_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_equipManage_equipment_ref2_queryForm" isCrossCompany=isCrossCompany isPrecise=true value="${name_defaultValue!}" deValue="${name_defaultValue!}"   conditionfunc="MESBasic.equipManage.equipment.ref2._querycustomFunc('name')" name="name" id="ec_MESBasic_equipManage_equipment_ref2_queryForm_name" displayFieldName="name" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/equipManage/equipment/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.equipManage.equipment.ref2.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_equipManage_equipment_ref2_queryForm" isCrossCompany=isCrossCompany isPrecise=true  conditionfunc="MESBasic.equipManage.equipment.ref2._querycustomFunc('name')" name="name" id="ec_MESBasic_equipManage_equipment_ref2_queryForm_name" displayFieldName="name" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/equipManage/equipment/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.equipManage.equipment.ref2.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign demo_defaultValue  = ''>
									<#assign demo_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_equipManage_equipment_ref2_queryForm" code="MESBasic_1_equipManage_Equipment_demo" showFormat="TEXT" defaultValue=demo_defaultValue  divCode="MESBasic_1_equipManage_Equipment_demo_demo" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="demo" id="demo" value="${demo_defaultValue!}" deValue="${demo_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign eamBuyTime_defaultValue  = ''>
									<#assign eamBuyTime_defaultValue  = ''>
								<#if (eamBuyTime_defaultValue)?? &&(eamBuyTime_defaultValue)?has_content>
									<#assign eamBuyTime_defaultValue  = getDefaultDateTime(eamBuyTime_defaultValue!)?date>
								</#if>
							<@queryfield formId="ec_MESBasic_equipManage_equipment_ref2_queryForm" code="MESBasic_1_equipManage_Equipment_eamBuyTime" showFormat="YMD" defaultValue=eamBuyTime_defaultValue  divCode="MESBasic_1_equipManage_Equipment_eamBuyTime_eamBuyTime" isCustomize=true style="" > 
								<div>
							  	 	<div style="float:left;width:45%">
									<@datepicker yearChangeMonthLink="01" cssClass="cui-noborder-input" type="date" name="eamBuyTime_start" id="eamBuyTime_start" exp="gequal"   formid="ec_MESBasic_equipManage_equipment_ref2_queryForm" />
									</div>
									<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
							  	 	<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker yearChangeMonthLink="12" cssClass="cui-noborder-input" type="date" name="eamBuyTime_end" id="eamBuyTime_end" exp="lequal"   formid="ec_MESBasic_equipManage_equipment_ref2_queryForm" />
							  		</div>
						  		</div>
							</@queryfield>
							<#assign eamProduceFirm_defaultValue  = ''>
									<#assign eamProduceFirm_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_equipManage_equipment_ref2_queryForm" code="MESBasic_1_equipManage_Equipment_eamProduceFirm" showFormat="TEXT" defaultValue=eamProduceFirm_defaultValue  divCode="MESBasic_1_equipManage_Equipment_eamProduceFirm_eamProduceFirm" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="eamProduceFirm" id="eamProduceFirm" value="${eamProduceFirm_defaultValue!}" deValue="${eamProduceFirm_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign eamVendorName_defaultValue  = ''>
									<#assign eamVendorName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_equipManage_equipment_ref2_queryForm" code="MESBasic_1_equipManage_Equipment_eamVendorName" showFormat="TEXT" defaultValue=eamVendorName_defaultValue  divCode="MESBasic_1_equipManage_Equipment_eamVendorName_eamVendorName" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="eamVendorName" id="eamVendorName" value="${eamVendorName_defaultValue!}" deValue="${eamVendorName_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_equipManage_equipment_ref2_queryForm" type="adv" onclick="MESBasic.equipManage.equipment.ref2.commonQuery('query')" onadvancedclick="advQuery('MESBasic.equipManage.equipment.ref2.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_equipManage_equipment_ref2_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_equipManage_equipment_ref2_quickquery_info={};
ec_MESBasic_equipManage_equipment_ref2_quickquery_info["MainTableName"]="EAM_BASEINFO";
ec_MESBasic_equipManage_equipment_ref2_quickquery_info["code"]={};
ec_MESBasic_equipManage_equipment_ref2_quickquery_info["code"].dbColumnType="TEXT";
ec_MESBasic_equipManage_equipment_ref2_quickquery_info["code"].layRec="code";
ec_MESBasic_equipManage_equipment_ref2_quickquery_info["code"].columnName="EAM_CODE";
ec_MESBasic_equipManage_equipment_ref2_quickquery_info["name"]={};
ec_MESBasic_equipManage_equipment_ref2_quickquery_info["name"].dbColumnType="TEXT";
ec_MESBasic_equipManage_equipment_ref2_quickquery_info["name"].layRec="name";
ec_MESBasic_equipManage_equipment_ref2_quickquery_info["name"].columnName="EAM_NAME";
ec_MESBasic_equipManage_equipment_ref2_quickquery_info["demo"]={};
ec_MESBasic_equipManage_equipment_ref2_quickquery_info["demo"].dbColumnType="TEXT";
ec_MESBasic_equipManage_equipment_ref2_quickquery_info["demo"].layRec="demo";
ec_MESBasic_equipManage_equipment_ref2_quickquery_info["demo"].columnName="EAM_MEMO";
ec_MESBasic_equipManage_equipment_ref2_quickquery_info["eamBuyTime"]={};
ec_MESBasic_equipManage_equipment_ref2_quickquery_info["eamBuyTime"].dbColumnType="DATE";
ec_MESBasic_equipManage_equipment_ref2_quickquery_info["eamBuyTime"].layRec="eamBuyTime";
ec_MESBasic_equipManage_equipment_ref2_quickquery_info["eamBuyTime"].columnName="EAM_BUY_TIME";
ec_MESBasic_equipManage_equipment_ref2_quickquery_info["eamProduceFirm"]={};
ec_MESBasic_equipManage_equipment_ref2_quickquery_info["eamProduceFirm"].dbColumnType="TEXT";
ec_MESBasic_equipManage_equipment_ref2_quickquery_info["eamProduceFirm"].layRec="eamProduceFirm";
ec_MESBasic_equipManage_equipment_ref2_quickquery_info["eamProduceFirm"].columnName="EAM_PRODUCEFIRM";
ec_MESBasic_equipManage_equipment_ref2_quickquery_info["eamVendorName"]={};
ec_MESBasic_equipManage_equipment_ref2_quickquery_info["eamVendorName"].dbColumnType="TEXT";
ec_MESBasic_equipManage_equipment_ref2_quickquery_info["eamVendorName"].layRec="eamVendorName";
ec_MESBasic_equipManage_equipment_ref2_quickquery_info["eamVendorName"].columnName="EAM_VENDORNAME";
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
 	var advRemainDialog = $('[id="MESBasic.equipManage.equipment.ref2.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.equipManage.equipment.ref2.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_equipManage_equipment_ref2_adv_queryForm" exportUrl="/MESBasic/equipManage/equipment/ref2-query.action">
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_equipManage_equipment_ref2_adv_queryForm" code="MESBasic_1_equipManage_Equipment_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="MESBasic_1_equipManage_Equipment_code_code" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_equipManage_Equipment" layRec="code" columnname="EAM_CODE" columntype="TEXT" name="code" fieldType="TEXTFIELD" tableName="EAM_BASEINFO"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_equipManage_Equipment" />
										<#if (code_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_equipManage_equipment_ref2_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="MESBasic.equipManage.equipment.ref2._querycustomFunc('code')" name="code" id="adv_ec_MESBasic_equipManage_equipment_ref2_queryForm_code" displayFieldName="code" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/equipManage/equipment/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_equipManage_ref2"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_equipManage_equipment_ref2_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true  conditionfunc="MESBasic.equipManage.equipment.ref2._querycustomFunc('code')" name="code" id="adv_ec_MESBasic_equipManage_equipment_ref2_queryForm_code" displayFieldName="code" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/equipManage/equipment/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_equipManage_ref2"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_equipManage_equipment_ref2_adv_queryForm" code="MESBasic_1_equipManage_Equipment_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="MESBasic_1_equipManage_Equipment_name_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_equipManage_Equipment" layRec="name" columnname="EAM_NAME" columntype="TEXT" name="name" fieldType="TEXTFIELD" tableName="EAM_BASEINFO"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										设备名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_equipManage_Equipment" />
										<#if (name_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_equipManage_equipment_ref2_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true value="${name_defaultValue!}" deValue="${name_defaultValue!}"   conditionfunc="MESBasic.equipManage.equipment.ref2._querycustomFunc('name')" name="name" id="adv_ec_MESBasic_equipManage_equipment_ref2_queryForm_name" displayFieldName="name" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/equipManage/equipment/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_equipManage_ref2"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_equipManage_equipment_ref2_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true  conditionfunc="MESBasic.equipManage.equipment.ref2._querycustomFunc('name')" name="name" id="adv_ec_MESBasic_equipManage_equipment_ref2_queryForm_name" displayFieldName="name" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/equipManage/equipment/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_equipManage_ref2"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign demo_defaultValue  = ''>
									<#assign demo_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_equipManage_equipment_ref2_adv_queryForm" code="MESBasic_1_equipManage_Equipment_demo" showFormat="TEXT" defaultValue=demo_defaultValue  divCode="MESBasic_1_equipManage_Equipment_demo_demo" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_equipManage_Equipment" layRec="demo" columnname="EAM_MEMO" columntype="TEXT" name="demo" fieldType="TEXTFIELD" tableName="EAM_BASEINFO"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										备注
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_equipManage_Equipment" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="demo" id="adv_demo" value="${demo_defaultValue!}" deValue="${demo_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign eamBuyTime_defaultValue  = ''>
									<#assign eamBuyTime_defaultValue  = ''>
								<#if (eamBuyTime_defaultValue)?? &&(eamBuyTime_defaultValue)?has_content>
									<#assign eamBuyTime_defaultValue  = getDefaultDateTime(eamBuyTime_defaultValue!)?date>
								</#if>
								<@advsqueryfield formId="ec_MESBasic_equipManage_equipment_ref2_adv_queryForm" code="MESBasic_1_equipManage_Equipment_eamBuyTime" showFormat="YMD" defaultValue=eamBuyTime_defaultValue  divCode="MESBasic_1_equipManage_Equipment_eamBuyTime_eamBuyTime" isCustomize=true > 
								
								<div class="quick_query_node" style="width:98%;">
								<input type="hidden" class="adv_cond" modelcode="" layRec="eamBuyTime" columnname="EAM_BUY_TIME" columntype="DATE" name="eamBuyTime" fieldType="DATE" showFormat="YMD" tableName="EAM_BASEINFO"/>
								<label class="quick_query_labeltime advQuery_label" style="text-align:right;float:left;width:14%;height:28px;line-height:28px">
								<span class="quick_query_text">
										购入时间
								</span>
								</label>
							<div class="quick_query_contenttime advQuery_content" style="float:left;width:86%">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_equipManage_Equipment" />
								<div>
							  	 	<div style="float:left;width:41.8%">
									<@datepicker cssClass="cui-noborder-input" type="date" value="${eamBuyTime_defaultValue!}" deValue="${eamBuyTime_defaultValue!}"  name="eamBuyTime_start" id="adv_eamBuyTime_start" exp="gequal"    formid="ec_MESBasic_equipManage_equipment_ref2_adv_queryForm" />
									</div>
									<div style="float:left;width:16.3%;text-align:center;line-height: 26px;"> - - ${getText('common.date.split')} - - </div>
							  	 	<div style="float:left;width:41.8%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker cssClass="cui-noborder-input" type="date" value="${eamBuyTime_defaultValue!}" deValue="${eamBuyTime_defaultValue!}"  name="eamBuyTime_end" id="adv_eamBuyTime_end" exp="lequal"    formid="ec_MESBasic_equipManage_equipment_ref2_adv_queryForm" />
							  		</div>
						  		</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign eamProduceFirm_defaultValue  = ''>
									<#assign eamProduceFirm_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_equipManage_equipment_ref2_adv_queryForm" code="MESBasic_1_equipManage_Equipment_eamProduceFirm" showFormat="TEXT" defaultValue=eamProduceFirm_defaultValue  divCode="MESBasic_1_equipManage_Equipment_eamProduceFirm_eamProduceFirm" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="" layRec="eamProduceFirm" columnname="EAM_PRODUCEFIRM" columntype="TEXT" name="eamProduceFirm" fieldType="TEXTFIELD" tableName="EAM_BASEINFO"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										制造单位
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_equipManage_Equipment" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="eamProduceFirm" id="adv_eamProduceFirm" value="${eamProduceFirm_defaultValue!}" deValue="${eamProduceFirm_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign eamVendorName_defaultValue  = ''>
									<#assign eamVendorName_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_equipManage_equipment_ref2_adv_queryForm" code="MESBasic_1_equipManage_Equipment_eamVendorName" showFormat="TEXT" defaultValue=eamVendorName_defaultValue  divCode="MESBasic_1_equipManage_Equipment_eamVendorName_eamVendorName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="" layRec="eamVendorName" columnname="EAM_VENDORNAME" columntype="TEXT" name="eamVendorName" fieldType="TEXTFIELD" tableName="EAM_BASEINFO"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										供应商
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_equipManage_Equipment" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="eamVendorName" id="adv_eamVendorName" value="${eamVendorName_defaultValue!}" deValue="${eamVendorName_defaultValue!}"   exp="like" />
											</div>
								
                                	
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
			viewCode: 'MESBasic_1_equipManage_ref2',
			modelCode: 'MESBasic_1_equipManage_Equipment',
			modelName: 'Equipment',
			formId: 'ec_MESBasic_equipManage_equipment_ref2_queryForm',
			olddiv: 'MESBasic.equipManage.equipment.ref2.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.equipManage.equipment.ref2.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_equipManage_ref2'+"&entity.code="+'MESBasic_1_equipManage';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.equipManage.equipment.ref2.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.equipManage.equipment.ref2.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.equipManage.equipment.ref2.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_equipManage_ref2'+"&entity.code="+'MESBasic_1_equipManage';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.equipManage.equipment.ref2.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.equipManage.equipment.ref2.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.equipManage.equipment.ref2.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.equipManage.equipment.ref2.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.equipManage.equipment.ref2.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.equipManage.equipment.ref2.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.equipManage.equipment.ref2.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.equipManage.equipment.ref2.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.equipManage.equipment.ref2.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.equipManage.equipment.ref2.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.equipManage.equipment.ref2.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.equipManage.equipment.ref2.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.equipManage.equipment.ref2.query('query')">
<#assign datatable_dataUrl = "/MESBasic/equipManage/equipment/ref2-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_MESBasic_equipManage_equipment_ref2_query" renderOverEvent="ec_MESBasic_equipManage_equipment_ref2_RenderOverEvent" pageInitMethod="ec_MESBasic_equipManage_equipment_ref2_PageInitMethod" modelCode="MESBasic_1_equipManage_Equipment" noPermissionKeys="code,name,eamBuyTime,eamProduceFirm,eamVendorName,demo" hidekeyPrefix="ec_MESBasic_equipManage_equipment_ref2_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_equipManage_equipment_ref2_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="MESBasic.equipManage.equipment.ref2.sendBackref2" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','code','code','name']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="MESBasic.equipManage.equipment.ref2.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn columnName="EAM_CODE"    showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('MESBasic.propertydisplayName.randon1423967256308')}" textalign="left"  width=160   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="EAM_NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('MESBasic.propertydisplayName.randon1423967231438')}" textalign="left"  width=160   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign eamBuyTime_displayDefaultType  = ''>
			<@datacolumn columnName="EAM_BUY_TIME"    showFormat="YMD" defaultDisplay="${eamBuyTime_displayDefaultType!}"  key="eamBuyTime"   label="${getText('MESBasic.propertydisplayName.randon1460957425645')}" textalign="center"  width=100   type="date"    showFormatFunc="" cssstyle="" />
			<#assign eamProduceFirm_displayDefaultType  = ''>
			<@datacolumn columnName="EAM_PRODUCEFIRM"    showFormat="TEXT" defaultDisplay="${eamProduceFirm_displayDefaultType!}"  key="eamProduceFirm"   label="${getText('MESBasic.propertydisplayName.randon1426566652807')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign eamVendorName_displayDefaultType  = ''>
			<@datacolumn columnName="EAM_VENDORNAME"    showFormat="TEXT" defaultDisplay="${eamVendorName_displayDefaultType!}"  key="eamVendorName"   label="${getText('MESBasic.propertydisplayName.randon1426566956024')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign demo_displayDefaultType  = ''>
			<@datacolumn columnName="EAM_MEMO"    showFormat="TEXT" defaultDisplay="${demo_displayDefaultType!}"  key="demo"   label="${getText('MESBasic.propertydisplayName.randon1423967391978')}" textalign="left"  width=200   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_equipManage_equipment_ref2_RenderOverEvent(){
}
function ec_MESBasic_equipManage_equipment_ref2_PageInitMethod(){
}
	
	
	
	
	
	
</script>