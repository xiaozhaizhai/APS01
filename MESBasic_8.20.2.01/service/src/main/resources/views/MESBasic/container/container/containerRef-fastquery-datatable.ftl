	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1415252093775')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_container_container_containerRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_container_container_containerRef_queryForm" exportUrl="/MESBasic/container/container/containerRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="department" bak_value="department"/>
		<input type="hidden" id="MESBasic_1_tankModel_TankModel" value="model" bak_value="model"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" name="MESBasic_container_container_containerRef_condition" id="MESBasic_container_container_containerRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1415252141275')}_${getText('MESBasic.viewtitle.radion1415323292765')}.xls" />
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
		<div id="ec_MESBasic_container_container_containerRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_container_container_containerRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_container_containerRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_container_containerRef" formId="ec_MESBasic_container_container_containerRef_queryForm" dataTableId="ec_MESBasic_container_container_containerRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_container_container_containerRef_queryForm" isExpandAll=true formId="ec_MESBasic_container_container_containerRef_queryForm" idprefix="ec_MESBasic_container_container_containerRef" expandType="all"  fieldcodes="MESBasic_1_container_Container_code_code:MESBasic.propertydisplayName.radion1415268359829||MESBasic_1_container_Container_containerType_containerType:MESBasic.propertydisplayName.radion1415320693399||MESBasic_1_container_Container_name_name:MESBasic.propertydisplayName.radion1415268393452||MESBasic_1_container_Container_produceMgr_produceMgr:MESBasic.propertydisplayName.radion1415847889766||MESBasic_1_container_Container_tankMgr_tankMgr:MESBasic.propertydisplayName.radion1415847847462||MESBasic_1_equipManage_Equipment_name_equip_name:MESBasic.propertydisplayName.randon1423967231438" > 
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_container_container_containerRef_queryForm" code="MESBasic_1_container_Container_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="MESBasic_1_container_Container_code_code" isCustomize=true style="" > 
										<#if (code_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_container_container_containerRef_queryForm" isCrossCompany=isCrossCompany isPrecise=true value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="MESBasic.container.container.containerRef._querycustomFunc('code')" name="code" id="ec_MESBasic_container_container_containerRef_queryForm_code" displayFieldName="code" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/container/container/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.container.container.containerRef.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_container_container_containerRef_queryForm" isCrossCompany=isCrossCompany isPrecise=true  conditionfunc="MESBasic.container.container.containerRef._querycustomFunc('code')" name="code" id="ec_MESBasic_container_container_containerRef_queryForm_code" displayFieldName="code" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/container/container/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.container.container.containerRef.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign containerType_defaultValue  = ''>
									<#assign containerType_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_container_container_containerRef_queryForm" code="MESBasic_1_container_Container_containerType" showFormat="SELECTCOMP" defaultValue=containerType_defaultValue  divCode="MESBasic_1_container_Container_containerType_containerType" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${containerType_defaultValue}"   name="containerType" code="CONTAINER_TYPE" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_container_container_containerRef_queryForm" code="MESBasic_1_container_Container_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="MESBasic_1_container_Container_name_name" isCustomize=true style="" > 
										<#if (name_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_container_container_containerRef_queryForm" isCrossCompany=isCrossCompany isPrecise=true value="${name_defaultValue!}" deValue="${name_defaultValue!}"   conditionfunc="MESBasic.container.container.containerRef._querycustomFunc('name')" name="name" id="ec_MESBasic_container_container_containerRef_queryForm_name" displayFieldName="name" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/container/container/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.container.container.containerRef.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_container_container_containerRef_queryForm" isCrossCompany=isCrossCompany isPrecise=true  conditionfunc="MESBasic.container.container.containerRef._querycustomFunc('name')" name="name" id="ec_MESBasic_container_container_containerRef_queryForm_name" displayFieldName="name" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/container/container/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.container.container.containerRef.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign produceMgr_defaultValue  = ''>
									<#assign produceMgr_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_container_container_containerRef_queryForm" code="MESBasic_1_container_Container_produceMgr" showFormat="SELECT" defaultValue=produceMgr_defaultValue  divCode="MESBasic_1_container_Container_produceMgr_produceMgr" isCustomize=true style="" > 
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${produceMgr_defaultValue!}" name="produceMgr" id="produceMgr" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (produceMgr_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (produceMgr_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<#assign tankMgr_defaultValue  = ''>
									<#assign tankMgr_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_container_container_containerRef_queryForm" code="MESBasic_1_container_Container_tankMgr" showFormat="SELECT" defaultValue=tankMgr_defaultValue  divCode="MESBasic_1_container_Container_tankMgr_tankMgr" isCustomize=true style="" > 
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${tankMgr_defaultValue!}" name="tankMgr" id="tankMgr" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (tankMgr_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (tankMgr_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<#assign equip_name_defaultValue  = ''>
									<#assign equip_name_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_container_container_containerRef_queryForm" code="MESBasic_1_equipManage_Equipment_name" showFormat="SELECTCOMP" defaultValue=equip_name_defaultValue  divCode="MESBasic_1_equipManage_Equipment_name_equip_name" isCustomize=true style="" > 
										<input type="hidden" id="equip.id" name="equip.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${equip_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1423967959681')}"  conditionfunc="MESBasic.container.container.containerRef._querycustomFunc('equip_name')" name="equip.name" id="ec_MESBasic_container_container_containerRef_queryForm_equip_name" displayFieldName="name" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/equipManage/equipment/ref.action"   refViewCode="MESBasic_1_equipManage_ref"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_container_container_containerRef_queryForm" searchClick="MESBasic.container.container.containerRef.commonQuery('query')"   />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_container_container_containerRef_queryForm" type="adv" onclick="MESBasic.container.container.containerRef.commonQuery('query')" onadvancedclick="advQuery('MESBasic.container.container.containerRef.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_container_container_containerRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_container_container_containerRef_quickquery_info={};
ec_MESBasic_container_container_containerRef_quickquery_info["MainTableName"]="MESBASIC_CONTAINERS";
ec_MESBasic_container_container_containerRef_quickquery_info["code"]={};
ec_MESBasic_container_container_containerRef_quickquery_info["code"].dbColumnType="TEXT";
ec_MESBasic_container_container_containerRef_quickquery_info["code"].layRec="code";
ec_MESBasic_container_container_containerRef_quickquery_info["code"].columnName="CODE";
ec_MESBasic_container_container_containerRef_quickquery_info["containerType"]={};
ec_MESBasic_container_container_containerRef_quickquery_info["containerType"].dbColumnType="SYSTEMCODE";
ec_MESBasic_container_container_containerRef_quickquery_info["containerType"].layRec="containerType";
ec_MESBasic_container_container_containerRef_quickquery_info["containerType"].columnName="CONTAINER_TYPE";
ec_MESBasic_container_container_containerRef_quickquery_info["name"]={};
ec_MESBasic_container_container_containerRef_quickquery_info["name"].dbColumnType="TEXT";
ec_MESBasic_container_container_containerRef_quickquery_info["name"].layRec="name";
ec_MESBasic_container_container_containerRef_quickquery_info["name"].columnName="NAME";
ec_MESBasic_container_container_containerRef_quickquery_info["produceMgr"]={};
ec_MESBasic_container_container_containerRef_quickquery_info["produceMgr"].dbColumnType="BOOLEAN";
ec_MESBasic_container_container_containerRef_quickquery_info["produceMgr"].layRec="produceMgr";
ec_MESBasic_container_container_containerRef_quickquery_info["produceMgr"].columnName="PRODUCE_MGR";
ec_MESBasic_container_container_containerRef_quickquery_info["tankMgr"]={};
ec_MESBasic_container_container_containerRef_quickquery_info["tankMgr"].dbColumnType="BOOLEAN";
ec_MESBasic_container_container_containerRef_quickquery_info["tankMgr"].layRec="tankMgr";
ec_MESBasic_container_container_containerRef_quickquery_info["tankMgr"].columnName="TANK_MGR";
ec_MESBasic_container_container_containerRef_quickquery_info["equip.name"]={};
ec_MESBasic_container_container_containerRef_quickquery_info["equip.name"].dbColumnType="TEXT";
ec_MESBasic_container_container_containerRef_quickquery_info["equip.name"].layRec="EAM_BASEINFO,EAM_ID,MESBASIC_CONTAINERS,EQUIP-name";
ec_MESBasic_container_container_containerRef_quickquery_info["equip.name"].columnName="EAM_NAME";
ec_MESBasic_container_container_containerRef_quickquery_info["equip.id"]={};
ec_MESBasic_container_container_containerRef_quickquery_info["equip.id"].dbColumnType="LONG";
ec_MESBasic_container_container_containerRef_quickquery_info["equip.id"].layRec="EAM_BASEINFO,EAM_ID,MESBASIC_CONTAINERS,EQUIP-name";
ec_MESBasic_container_container_containerRef_quickquery_info["equip.id"].columnName="EAM_ID";
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
 	var advRemainDialog = $('[id="MESBasic.container.container.containerRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.container.container.containerRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_container_container_containerRef_adv_queryForm" exportUrl="/MESBasic/container/container/containerRef-query.action">
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_container_container_containerRef_adv_queryForm" code="MESBasic_1_container_Container_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="MESBasic_1_container_Container_code_code" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_container_Container" layRec="code" columnname="CODE" columntype="TEXT" name="code" fieldType="TEXTFIELD" tableName="MESBASIC_CONTAINERS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_container_Container" />
										<#if (code_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_container_container_containerRef_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="MESBasic.container.container.containerRef._querycustomFunc('code')" name="code" id="adv_ec_MESBasic_container_container_containerRef_queryForm_code" displayFieldName="code" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/container/container/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_container_containerRef"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_container_container_containerRef_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true  conditionfunc="MESBasic.container.container.containerRef._querycustomFunc('code')" name="code" id="adv_ec_MESBasic_container_container_containerRef_queryForm_code" displayFieldName="code" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/container/container/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_container_containerRef"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign containerType_defaultValue  = ''>
									<#assign containerType_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_container_container_containerRef_adv_queryForm" code="MESBasic_1_container_Container_containerType" showFormat="SELECTCOMP" defaultValue=containerType_defaultValue  divCode="MESBasic_1_container_Container_containerType_containerType" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_container_Container" layRec="containerType" columnname="CONTAINER_TYPE" columntype="SYSTEMCODE" name="containerType" fieldType="SELECTCOMP" tableName="MESBASIC_CONTAINERS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										容器类型
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_container_Container" />
										<@systemcode  advquery=true onchange="" ecFlag=true deValue="${containerType_defaultValue}"   name="containerType" code="CONTAINER_TYPE" classStyle="cui-noborder-input" value="" />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_container_container_containerRef_adv_queryForm" code="MESBasic_1_container_Container_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="MESBasic_1_container_Container_name_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_container_Container" layRec="name" columnname="NAME" columntype="TEXT" name="name" fieldType="TEXTFIELD" tableName="MESBASIC_CONTAINERS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										容器名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_container_Container" />
										<#if (name_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_container_container_containerRef_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true value="${name_defaultValue!}" deValue="${name_defaultValue!}"   conditionfunc="MESBasic.container.container.containerRef._querycustomFunc('name')" name="name" id="adv_ec_MESBasic_container_container_containerRef_queryForm_name" displayFieldName="name" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/container/container/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_container_containerRef"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_container_container_containerRef_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true  conditionfunc="MESBasic.container.container.containerRef._querycustomFunc('name')" name="name" id="adv_ec_MESBasic_container_container_containerRef_queryForm_name" displayFieldName="name" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/container/container/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_container_containerRef"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign produceMgr_defaultValue  = ''>
									<#assign produceMgr_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_container_container_containerRef_adv_queryForm" code="MESBasic_1_container_Container_produceMgr" showFormat="SELECT" defaultValue=produceMgr_defaultValue  divCode="MESBasic_1_container_Container_produceMgr_produceMgr" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_container_Container" layRec="produceMgr" columnname="PRODUCE_MGR" columntype="BOOLEAN" name="produceMgr" fieldType="SELECT" tableName="MESBASIC_CONTAINERS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										生产区容器
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_container_Container" />
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${produceMgr_defaultValue!}" name="produceMgr" id="adv_produceMgr" exp="equal"   value=""> 
											<option value=""></option>
											<option value="1" <#if (produceMgr_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (produceMgr_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign tankMgr_defaultValue  = ''>
									<#assign tankMgr_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_container_container_containerRef_adv_queryForm" code="MESBasic_1_container_Container_tankMgr" showFormat="SELECT" defaultValue=tankMgr_defaultValue  divCode="MESBasic_1_container_Container_tankMgr_tankMgr" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_container_Container" layRec="tankMgr" columnname="TANK_MGR" columntype="BOOLEAN" name="tankMgr" fieldType="SELECT" tableName="MESBASIC_CONTAINERS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										罐区容器
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_container_Container" />
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${tankMgr_defaultValue!}" name="tankMgr" id="adv_tankMgr" exp="equal"   value=""> 
											<option value=""></option>
											<option value="1" <#if (tankMgr_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (tankMgr_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign equip_name_defaultValue  = ''>
									<#assign equip_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_container_container_containerRef_adv_queryForm" code="MESBasic_1_equipManage_Equipment_name" showFormat="SELECTCOMP" defaultValue=equip_name_defaultValue  divCode="MESBasic_1_equipManage_Equipment_name_equip_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_equipManage_Equipment" layRec="EAM_BASEINFO,EAM_ID,MESBASIC_CONTAINERS,EQUIP-name" columnname="EAM_NAME" columntype="TEXT" name="equip.name" fieldType="SELECTCOMP" tableName="EAM_BASEINFO"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										设备名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_equipManage_Equipment" />
										<input type="hidden" id="adv_equip.id" name="equip.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_equip.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${equip_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1423967959681')}"  conditionfunc="MESBasic.container.container.containerRef._querycustomFunc('equip_name')" name="equip.name" id="adv_ec_MESBasic_container_container_containerRef_queryForm_equip_name" displayFieldName="name" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/equipManage/equipment/ref.action"   refViewCode="MESBasic_1_equipManage_ref"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_container_container_containerRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign containerStatus_defaultValue  = 'CONTAINER_STATUS/0'>
									<#assign containerStatus_defaultValue  = 'CONTAINER_STATUS/0'>
								<@advsqueryfield formId="ec_MESBasic_container_container_containerRef_adv_queryForm" code="MESBasic_1_container_Container_containerStatus" showFormat="SELECTCOMP" defaultValue=containerStatus_defaultValue  divCode="MESBasic_1_container_Container_containerStatus_containerStatus" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_container_Container" layRec="containerStatus" columnname="CONTAINER_STATUS" columntype="SYSTEMCODE" name="containerStatus" fieldType="SELECTCOMP" tableName="MESBASIC_CONTAINERS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										容器状态
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_container_Container" />
										<@systemcode  advquery=true onchange="" ecFlag=true deValue="${containerStatus_defaultValue}"   name="containerStatus" code="CONTAINER_STATUS" classStyle="cui-noborder-input" value="" />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign density_defaultValue  = ''>
									<#assign density_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_container_container_containerRef_adv_queryForm" code="MESBasic_1_container_Container_density" showFormat="TEXT" defaultValue=density_defaultValue  divCode="MESBasic_1_container_Container_density_density" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_container_Container" layRec="density" columnname="DENSITY" columntype="DECIMAL" name="density" fieldType="TEXTFIELD" tableName="MESBASIC_CONTAINERS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										储料密度
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_container_Container" />
										<div>
									  	 	<div style="float:left;width:45%">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" class="cui-noborder-input" style="*padding-right:0px;" name="density_start" id="adv_density_start" value="${density_defaultValue!}" deValue="${density_defaultValue!}"   exp="equal"   />
											</div></div>
											</div>
											<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
											<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" class="cui-noborder-input" style="*padding-right:0px;" name="density_end" id="adv_density_end" value="${density_defaultValue!}" deValue="${density_defaultValue!}"   exp="equal"  />
									  		</div></div>
									  		</div>
								  		</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign model_name_defaultValue  = ''>
									<#assign model_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_container_container_containerRef_adv_queryForm" code="MESBasic_1_tankModel_TankModel_name" showFormat="SELECTCOMP" defaultValue=model_name_defaultValue  divCode="MESBasic_1_tankModel_TankModel_name_model_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_tankModel_TankModel" layRec="MESBASIC_TANK_MODELS,ID,MESBASIC_CONTAINERS,MODEL-name" columnname="NAME" columntype="TEXT" name="model.name" fieldType="SELECTCOMP" tableName="MESBASIC_TANK_MODELS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										型号名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_tankModel_TankModel" />
										<input type="hidden" id="adv_model.id" name="model.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_model.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${model_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1415322322556')}"  conditionfunc="MESBasic.container.container.containerRef._querycustomFunc('model_name')" name="model.name" id="adv_ec_MESBasic_container_container_containerRef_queryForm_model_name" displayFieldName="name" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/tankModel/tankModel/modelRef.action"   refViewCode="MESBasic_1_tankModel_modelRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_container_container_containerRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign product_productCode_defaultValue  = ''>
									<#assign product_productCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_container_container_containerRef_adv_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=product_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_product_productCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,MESBASIC_CONTAINERS,PRODUCT-productCode" columnname="PRODUCT_CODE" columntype="TEXT" name="product.productCode" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物品编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_product.id" name="product.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_product.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${product_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="MESBasic.container.container.containerRef._querycustomFunc('product_productCode')" name="product.productCode" id="adv_ec_MESBasic_container_container_containerRef_queryForm_product_productCode" displayFieldName="productCode" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/productRefNew.action"   refViewCode="MESBasic_1_product_productRefNew"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_container_container_containerRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign product_productName_defaultValue  = ''>
									<#assign product_productName_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_container_container_containerRef_adv_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=product_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_product_productName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,MESBASIC_CONTAINERS,PRODUCT-productName" columnname="PRODUCT_NAME" columntype="TEXT" name="product.productName" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物品名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
												<@mneclient iframe=true mneenable=true advresume="adv_product.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${product_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="MESBasic.container.container.containerRef._querycustomFunc('product_productName')" name="product.productName" id="adv_ec_MESBasic_container_container_containerRef_queryForm_product_productName" displayFieldName="productName" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/productRefNew.action"   refViewCode="MESBasic_1_product_productRefNew"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_container_container_containerRef_adv_queryForm"   />
								
                                	
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
			viewCode: 'MESBasic_1_container_containerRef',
			modelCode: 'MESBasic_1_container_Container',
			modelName: 'Container',
			formId: 'ec_MESBasic_container_container_containerRef_queryForm',
			olddiv: 'MESBasic.container.container.containerRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.container.container.containerRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_container_containerRef'+"&entity.code="+'MESBasic_1_container';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.container.container.containerRef.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.container.container.containerRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.container.container.containerRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_container_containerRef'+"&entity.code="+'MESBasic_1_container';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.container.container.containerRef.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.container.container.containerRef.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.container.container.containerRef.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.container.container.containerRef.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.container.container.containerRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.container.container.containerRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.container.container.containerRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.container.container.containerRef.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.container.container.containerRef.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.container.container.containerRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.container.container.containerRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.container.container.containerRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.container.container.containerRef.query('query')">
<#assign datatable_dataUrl = "/MESBasic/container/container/containerRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_MESBasic_container_container_containerRef_query" renderOverEvent="ec_MESBasic_container_container_containerRef_RenderOverEvent" pageInitMethod="ec_MESBasic_container_container_containerRef_PageInitMethod" modelCode="MESBasic_1_container_Container" noPermissionKeys="code,name,containerType,equip.name,containerStatus,department.name,model.name,product.productName" hidekeyPrefix="ec_MESBasic_container_container_containerRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_container_container_containerRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="MESBasic.container.container.containerRef.sendBackcontainerRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','containerType.id','containerStatus.id','equip.id','department.id','model.id','product.id','code','name']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="MESBasic.container.container.containerRef.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}containerRef_containerNew_add_MESBasic_1_container_containerRef||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1420873765612')}||iconcls:add||useInMore:false||onclick:
				MESBasic.container.container.containerRef.addcontainerRef()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_container_containerRef_BUTTON_containerNew"
		buttonType="ADD" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}containerRef_containerNew_add_MESBasic_1_container_containerRef||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1420873765612')}||iconcls:add||useInMore:false||onclick:
				MESBasic.container.container.containerRef.addcontainerRef()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}containerRef_containerEdit_modify_MESBasic_1_container_containerRef||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1423705335643')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.container.container.containerRef.modifycontainerRef()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_container_containerRef_BUTTON_containerEdit"
		buttonType="MODIFY" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}containerRef_containerEdit_modify_MESBasic_1_container_containerRef||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1423705335643')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.container.container.containerRef.modifycontainerRef()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}containerRef_containerDel_del_MESBasic_1_container_containerRef||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1415323428616')}||iconcls:del||useInMore:false||onclick:
				MESBasic.container.container.containerRef.delcontainerRef()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_container_containerRef_BUTTON_containerDel"
		buttonType="DELETE" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}containerRef_containerDel_del_MESBasic_1_container_containerRef||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1415323428616')}||iconcls:del||useInMore:false||onclick:
				MESBasic.container.container.containerRef.delcontainerRef()
		" 
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('MESBasic.propertydisplayName.radion1415268359829')}" textalign="left"  width=120   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('MESBasic.propertydisplayName.radion1415268393452')}" textalign="left"  width=120   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign containerType_displayDefaultType  = ''>
			<@datacolumn columnName="CONTAINER_TYPE"    showFormat="SELECTCOMP" defaultDisplay="${containerType_displayDefaultType!}"  key="containerType.value"   label="${getText('MESBasic.propertydisplayName.radion1415320693399')}" textalign="left"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign equip_name_displayDefaultType  = ''>
			<@datacolumn columnName="EAM_NAME"    showFormat="TEXT" defaultDisplay="${equip_name_displayDefaultType!}"  key="equip.name"   label="${getText('MESBasic.propertydisplayName.randon1423967231438')}" textalign="left"  width=120   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign containerStatus_displayDefaultType  = ''>
			<@datacolumn columnName="CONTAINER_STATUS"    showFormat="SELECTCOMP" defaultDisplay="${containerStatus_displayDefaultType!}"  key="containerStatus.value"   label="${getText('MESBasic.propertydisplayName.radion1415322023968')}" textalign="left"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign department_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${department_name_displayDefaultType!}"  key="department.name"   label="${getText('part.fzwdy.xm.mainPositionId.department.name')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign model_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${model_name_displayDefaultType!}"  key="model.name"   label="${getText('MESBasic.propertydisplayName.radion1415150519135')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign product_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${product_productName_displayDefaultType!}"  key="product.productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="left"  width=120   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_container_container_containerRef_RenderOverEvent(){
}
function ec_MESBasic_container_container_containerRef_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
</script>