	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1418607087374')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_placeManage_placeManage_list_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_placeManage_placeManage_list_queryForm" exportUrl="/MESBasic/placeManage/placeManage/list-query.action">
		<input type="hidden" id="MESBasic_1_factoryModel_FactoryModel" value="factoryNode" bak_value="factoryNode"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1418607150650')}_${getText('MESBasic.viewtitle.radion1418607744206')}.xls" />
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
		<div id="ec_MESBasic_placeManage_placeManage_list_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_placeManage_placeManage_list_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_placeManage_list')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_placeManage_list" formId="ec_MESBasic_placeManage_placeManage_list_queryForm" dataTableId="ec_MESBasic_placeManage_placeManage_list_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_placeManage_placeManage_list_queryForm" isExpandAll=true formId="ec_MESBasic_placeManage_placeManage_list_queryForm" idprefix="ec_MESBasic_placeManage_placeManage_list" expandType="all"  fieldcodes="MESBasic_1_placeManage_PlaceManage_placeCode_placeCode:MESBasic.propertydisplayName.radion1418607299231||MESBasic_1_placeManage_PlaceManage_placeName_placeName:MESBasic.propertydisplayName.radion1418607347494||MESBasic_1_factoryModel_FactoryModel_name_factoryNode_name:MESBasic.propertydisplayName.radion1419232393782" > 
							<#assign placeCode_defaultValue  = ''>
									<#assign placeCode_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_placeManage_placeManage_list_queryForm" code="MESBasic_1_placeManage_PlaceManage_placeCode" showFormat="TEXT" defaultValue=placeCode_defaultValue  divCode="MESBasic_1_placeManage_PlaceManage_placeCode_placeCode" isCustomize=true style="" > 
										<#if (placeCode_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_placeManage_placeManage_list_queryForm"  isPrecise=true value="${placeCode_defaultValue!}" deValue="${placeCode_defaultValue!}"   conditionfunc="MESBasic.placeManage.placeManage.list._querycustomFunc('placeCode')" name="placeCode" id="ec_MESBasic_placeManage_placeManage_list_queryForm_placeCode" displayFieldName="placeCode" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/placeManage/placeManage/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.placeManage.placeManage.list.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_placeManage_placeManage_list_queryForm"  isPrecise=true  conditionfunc="MESBasic.placeManage.placeManage.list._querycustomFunc('placeCode')" name="placeCode" id="ec_MESBasic_placeManage_placeManage_list_queryForm_placeCode" displayFieldName="placeCode" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/placeManage/placeManage/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.placeManage.placeManage.list.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign placeName_defaultValue  = ''>
									<#assign placeName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_placeManage_placeManage_list_queryForm" code="MESBasic_1_placeManage_PlaceManage_placeName" showFormat="TEXT" defaultValue=placeName_defaultValue  divCode="MESBasic_1_placeManage_PlaceManage_placeName_placeName" isCustomize=true style="" > 
										<#if (placeName_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_placeManage_placeManage_list_queryForm"  isPrecise=true value="${placeName_defaultValue!}" deValue="${placeName_defaultValue!}"   conditionfunc="MESBasic.placeManage.placeManage.list._querycustomFunc('placeName')" name="placeName" id="ec_MESBasic_placeManage_placeManage_list_queryForm_placeName" displayFieldName="placeName" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/placeManage/placeManage/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.placeManage.placeManage.list.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_placeManage_placeManage_list_queryForm"  isPrecise=true  conditionfunc="MESBasic.placeManage.placeManage.list._querycustomFunc('placeName')" name="placeName" id="ec_MESBasic_placeManage_placeManage_list_queryForm_placeName" displayFieldName="placeName" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/placeManage/placeManage/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.placeManage.placeManage.list.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign factoryNode_name_defaultValue  = ''>
									<#assign factoryNode_name_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_placeManage_placeManage_list_queryForm" code="MESBasic_1_factoryModel_FactoryModel_name" showFormat="SELECTCOMP" defaultValue=factoryNode_name_defaultValue  divCode="MESBasic_1_factoryModel_FactoryModel_name_factoryNode_name" isCustomize=true style="" > 
										<input type="hidden" id="factoryNode.id" name="factoryNode.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${factoryNode_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1419491307826')}"  conditionfunc="MESBasic.placeManage.placeManage.list._querycustomFunc('factoryNode_name')" name="factoryNode.name" id="ec_MESBasic_placeManage_placeManage_list_queryForm_factoryNode_name" displayFieldName="name" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/factoryModel/factoryModel/factroyRef1.action"   refViewCode="MESBasic_1_factoryModel_factroyRef1"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_placeManage_placeManage_list_queryForm" searchClick="MESBasic.placeManage.placeManage.list.commonQuery('query')"   />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_placeManage_placeManage_list_queryForm" type="adv" onclick="MESBasic.placeManage.placeManage.list.commonQuery('query')" onadvancedclick="advQuery('MESBasic.placeManage.placeManage.list.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_placeManage_placeManage_list_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_placeManage_placeManage_list_quickquery_info={};
ec_MESBasic_placeManage_placeManage_list_quickquery_info["MainTableName"]="MESBASIC_PLACE_MENAGE";
ec_MESBasic_placeManage_placeManage_list_quickquery_info["placeCode"]={};
ec_MESBasic_placeManage_placeManage_list_quickquery_info["placeCode"].dbColumnType="TEXT";
ec_MESBasic_placeManage_placeManage_list_quickquery_info["placeCode"].layRec="placeCode";
ec_MESBasic_placeManage_placeManage_list_quickquery_info["placeCode"].columnName="PLACE_CODE";
ec_MESBasic_placeManage_placeManage_list_quickquery_info["placeName"]={};
ec_MESBasic_placeManage_placeManage_list_quickquery_info["placeName"].dbColumnType="TEXT";
ec_MESBasic_placeManage_placeManage_list_quickquery_info["placeName"].layRec="placeName";
ec_MESBasic_placeManage_placeManage_list_quickquery_info["placeName"].columnName="PLACE_NAME";
ec_MESBasic_placeManage_placeManage_list_quickquery_info["factoryNode.name"]={};
ec_MESBasic_placeManage_placeManage_list_quickquery_info["factoryNode.name"].dbColumnType="TEXT";
ec_MESBasic_placeManage_placeManage_list_quickquery_info["factoryNode.name"].layRec="factory_tbcompanystructure,ID,MESBASIC_PLACE_MENAGE,FACTORY_NODE-name";
ec_MESBasic_placeManage_placeManage_list_quickquery_info["factoryNode.name"].columnName="NODENAME";
ec_MESBasic_placeManage_placeManage_list_quickquery_info["factoryNode.id"]={};
ec_MESBasic_placeManage_placeManage_list_quickquery_info["factoryNode.id"].dbColumnType="LONG";
ec_MESBasic_placeManage_placeManage_list_quickquery_info["factoryNode.id"].layRec="factory_tbcompanystructure,ID,MESBASIC_PLACE_MENAGE,FACTORY_NODE-name";
ec_MESBasic_placeManage_placeManage_list_quickquery_info["factoryNode.id"].columnName="ID";
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
 	var advRemainDialog = $('[id="MESBasic.placeManage.placeManage.list.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.placeManage.placeManage.list.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_placeManage_placeManage_list_adv_queryForm" exportUrl="/MESBasic/placeManage/placeManage/list-query.action">
							<#assign placeCode_defaultValue  = ''>
									<#assign placeCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_placeManage_placeManage_list_adv_queryForm" code="MESBasic_1_placeManage_PlaceManage_placeCode" showFormat="TEXT" defaultValue=placeCode_defaultValue  divCode="MESBasic_1_placeManage_PlaceManage_placeCode_placeCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_placeManage_PlaceManage" layRec="placeCode" columnname="PLACE_CODE" columntype="TEXT" name="placeCode" fieldType="TEXTFIELD" tableName="MESBASIC_PLACE_MENAGE"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										位置编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_placeManage_PlaceManage" />
										<#if (placeCode_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_placeManage_placeManage_list_adv_queryForm"  isPrecise=true value="${placeCode_defaultValue!}" deValue="${placeCode_defaultValue!}"   conditionfunc="MESBasic.placeManage.placeManage.list._querycustomFunc('placeCode')" name="placeCode" id="adv_ec_MESBasic_placeManage_placeManage_list_queryForm_placeCode" displayFieldName="placeCode" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/placeManage/placeManage/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_placeManage_list"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_placeManage_placeManage_list_adv_queryForm"  isPrecise=true  conditionfunc="MESBasic.placeManage.placeManage.list._querycustomFunc('placeCode')" name="placeCode" id="adv_ec_MESBasic_placeManage_placeManage_list_queryForm_placeCode" displayFieldName="placeCode" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/placeManage/placeManage/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_placeManage_list"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign placeName_defaultValue  = ''>
									<#assign placeName_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_placeManage_placeManage_list_adv_queryForm" code="MESBasic_1_placeManage_PlaceManage_placeName" showFormat="TEXT" defaultValue=placeName_defaultValue  divCode="MESBasic_1_placeManage_PlaceManage_placeName_placeName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_placeManage_PlaceManage" layRec="placeName" columnname="PLACE_NAME" columntype="TEXT" name="placeName" fieldType="TEXTFIELD" tableName="MESBASIC_PLACE_MENAGE"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										位置名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_placeManage_PlaceManage" />
										<#if (placeName_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_placeManage_placeManage_list_adv_queryForm"  isPrecise=true value="${placeName_defaultValue!}" deValue="${placeName_defaultValue!}"   conditionfunc="MESBasic.placeManage.placeManage.list._querycustomFunc('placeName')" name="placeName" id="adv_ec_MESBasic_placeManage_placeManage_list_queryForm_placeName" displayFieldName="placeName" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/placeManage/placeManage/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_placeManage_list"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_placeManage_placeManage_list_adv_queryForm"  isPrecise=true  conditionfunc="MESBasic.placeManage.placeManage.list._querycustomFunc('placeName')" name="placeName" id="adv_ec_MESBasic_placeManage_placeManage_list_queryForm_placeName" displayFieldName="placeName" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/placeManage/placeManage/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_placeManage_list"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign isAll_defaultValue  = ''>
									<#assign isAll_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_placeManage_placeManage_list_adv_queryForm" code="MESBasic_1_placeManage_PlaceManage_isAll" showFormat="SELECT" defaultValue=isAll_defaultValue  divCode="MESBasic_1_placeManage_PlaceManage_isAll_isAll" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_placeManage_PlaceManage" layRec="isAll" columnname="IS_ALL" columntype="BOOLEAN" name="isAll" fieldType="SELECT" tableName="MESBASIC_PLACE_MENAGE"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										总表位置
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_placeManage_PlaceManage" />
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${isAll_defaultValue!}" name="isAll" id="adv_isAll" exp="equal"   value=""> 
											<option value=""></option>
											<option value="1" <#if (isAll_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (isAll_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign placeMemo_defaultValue  = ''>
									<#assign placeMemo_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_placeManage_placeManage_list_adv_queryForm" code="MESBasic_1_placeManage_PlaceManage_placeMemo" showFormat="TEXT" defaultValue=placeMemo_defaultValue  divCode="MESBasic_1_placeManage_PlaceManage_placeMemo_placeMemo" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_placeManage_PlaceManage" layRec="placeMemo" columnname="PLACE_MEMO" columntype="TEXT" name="placeMemo" fieldType="TEXTAREA" tableName="MESBASIC_PLACE_MENAGE"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										备注
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_placeManage_PlaceManage" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="placeMemo" id="adv_placeMemo" value="${placeMemo_defaultValue!}" deValue="${placeMemo_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign factoryNode_name_defaultValue  = ''>
									<#assign factoryNode_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_placeManage_placeManage_list_adv_queryForm" code="MESBasic_1_factoryModel_FactoryModel_name" showFormat="SELECTCOMP" defaultValue=factoryNode_name_defaultValue  divCode="MESBasic_1_factoryModel_FactoryModel_name_factoryNode_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_factoryModel_FactoryModel" layRec="factory_tbcompanystructure,ID,MESBASIC_PLACE_MENAGE,FACTORY_NODE-name" columnname="NODENAME" columntype="TEXT" name="factoryNode.name" fieldType="SELECTCOMP" tableName="factory_tbcompanystructure"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										节点名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_factoryModel_FactoryModel" />
										<input type="hidden" id="adv_factoryNode.id" name="factoryNode.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_factoryNode.id"  isPrecise=true deValue="${factoryNode_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1419491307826')}"  conditionfunc="MESBasic.placeManage.placeManage.list._querycustomFunc('factoryNode_name')" name="factoryNode.name" id="adv_ec_MESBasic_placeManage_placeManage_list_queryForm_factoryNode_name" displayFieldName="name" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/factoryModel/factoryModel/factroyRef1.action"   refViewCode="MESBasic_1_factoryModel_factroyRef1"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_placeManage_placeManage_list_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign factoryNode_code_defaultValue  = ''>
									<#assign factoryNode_code_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_placeManage_placeManage_list_adv_queryForm" code="MESBasic_1_factoryModel_FactoryModel_code" showFormat="SELECTCOMP" defaultValue=factoryNode_code_defaultValue  divCode="MESBasic_1_factoryModel_FactoryModel_code_factoryNode_code" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_factoryModel_FactoryModel" layRec="factory_tbcompanystructure,ID,MESBASIC_PLACE_MENAGE,FACTORY_NODE-code" columnname="CODE" columntype="TEXT" name="factoryNode.code" fieldType="SELECTCOMP" tableName="factory_tbcompanystructure"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										节点编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_factoryModel_FactoryModel" />
												<@mneclient iframe=true mneenable=true advresume="adv_factoryNode.id"  isPrecise=true deValue="${factoryNode_code_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1419491307826')}"  conditionfunc="MESBasic.placeManage.placeManage.list._querycustomFunc('factoryNode_code')" name="factoryNode.code" id="adv_ec_MESBasic_placeManage_placeManage_list_queryForm_factoryNode_code" displayFieldName="code" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/factoryModel/factoryModel/factroyRef1.action"   refViewCode="MESBasic_1_factoryModel_factroyRef1"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_placeManage_placeManage_list_adv_queryForm"   />
								
                                	
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
			viewCode: 'MESBasic_1_placeManage_list',
			modelCode: 'MESBasic_1_placeManage_PlaceManage',
			modelName: 'PlaceManage',
			formId: 'ec_MESBasic_placeManage_placeManage_list_queryForm',
			olddiv: 'MESBasic.placeManage.placeManage.list.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.placeManage.placeManage.list.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_placeManage_list'+"&entity.code="+'MESBasic_1_placeManage';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.placeManage.placeManage.list.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.placeManage.placeManage.list.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.placeManage.placeManage.list.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_placeManage_list'+"&entity.code="+'MESBasic_1_placeManage';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.placeManage.placeManage.list.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.placeManage.placeManage.list.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.placeManage.placeManage.list.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.placeManage.placeManage.list.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.placeManage.placeManage.list.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.placeManage.placeManage.list.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.placeManage.placeManage.list.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.placeManage.placeManage.list.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.placeManage.placeManage.list.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.placeManage.placeManage.list.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.placeManage.placeManage.list.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.placeManage.placeManage.list.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.placeManage.placeManage.list.query('query')">
<#assign datatable_dataUrl = "/MESBasic/placeManage/placeManage/list-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_MESBasic_placeManage_placeManage_list_query" renderOverEvent="ec_MESBasic_placeManage_placeManage_list_RenderOverEvent" pageInitMethod="ec_MESBasic_placeManage_placeManage_list_PageInitMethod" modelCode="MESBasic_1_placeManage_PlaceManage" noPermissionKeys="placeCode,placeName,placeManager.name" hidekeyPrefix="ec_MESBasic_placeManage_placeManage_list_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_placeManage_placeManage_list_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="MESBasic.placeManage.placeManage.list.dbmodifylist" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','placeManager.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.placeManage.placeManage.list.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}list_add_add_MESBasic_1_placeManage_list||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1418608969459')}||iconcls:add||useInMore:false||onclick:
				MESBasic.placeManage.placeManage.list.addlist()
		" 
		 operateType="noPower"
		resultType="json" 
		buttonCode="MESBasic_1_placeManage_list_BUTTON_add"
		buttonType="ADD" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}list_add_add_MESBasic_1_placeManage_list||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1418608969459')}||iconcls:add||useInMore:false||onclick:
				MESBasic.placeManage.placeManage.list.addlist()
		" 
		 operateType="noPower"
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}list_change_modify_MESBasic_1_placeManage_list||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1418609006622')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.placeManage.placeManage.list.modifylist()
		" 
		 operateType="noPower"
		resultType="json" 
		buttonCode="MESBasic_1_placeManage_list_BUTTON_change"
		buttonType="MODIFY" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}list_change_modify_MESBasic_1_placeManage_list||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1418609006622')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.placeManage.placeManage.list.modifylist()
		" 
		 operateType="noPower"
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}list_delete_del_MESBasic_1_placeManage_list||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1418609026518')}||iconcls:del||useInMore:false||onclick:
				MESBasic.placeManage.placeManage.list.dellist()
		" 
		 operateType="noPower"
		resultType="json" 
		buttonCode="MESBasic_1_placeManage_list_BUTTON_delete"
		buttonType="DELETE" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}list_delete_del_MESBasic_1_placeManage_list||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1418609026518')}||iconcls:del||useInMore:false||onclick:
				MESBasic.placeManage.placeManage.list.dellist()
		" 
		 operateType="noPower"
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}list_inportPlace_import_MESBasic_1_placeManage_list||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1486797972559')}||iconcls:import||useInMore:false||onclick:
				MESBasic.placeManage.placeManage.list.importlist()||subButtons:[{text:'${getText('import.file.downloadtemplate')}',handler:function(){MESBasic.placeManage.placeManage.list.downloadTemplatelist()},useInMore:'false'}]
		" 
		resultType="json" 
		buttonCode="MESBasic_1_placeManage_list_BUTTON_inportPlace"
		buttonType="IMPORT" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}list_inportPlace_import_MESBasic_1_placeManage_list||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1486797972559')}||iconcls:import||useInMore:false||onclick:
				MESBasic.placeManage.placeManage.list.importlist()||subButtons:[{text:'${getText('import.file.downloadtemplate')}',handler:function(){MESBasic.placeManage.placeManage.list.downloadTemplatelist()},useInMore:'false'}]
		" 
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign placeCode_displayDefaultType  = ''>
			<@datacolumn columnName="PLACE_CODE"    showFormat="TEXT" defaultDisplay="${placeCode_displayDefaultType!}"  key="placeCode"   label="${getText('MESBasic.propertydisplayName.radion1418607299231')}" textalign="left"  width=150   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign placeName_displayDefaultType  = ''>
			<@datacolumn columnName="PLACE_NAME"    showFormat="TEXT" defaultDisplay="${placeName_displayDefaultType!}"  key="placeName"   label="${getText('MESBasic.propertydisplayName.radion1418607347494')}" textalign="left"  width=200   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign placeManager_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${placeManager_name_displayDefaultType!}"  key="placeManager.name"   label="${getText('MESBasic.propertydisplayName.radion1418607441891')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_placeManage_placeManage_list_RenderOverEvent(){
}
function ec_MESBasic_placeManage_placeManage_list_PageInitMethod(){
}
	
	
	
	
</script>