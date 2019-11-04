	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1415258377559')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_itemManage_itemSetup_itemList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_itemManage_itemSetup_itemList_queryForm" exportUrl="/MESBasic/itemManage/itemSetup/itemList-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="department" bak_value="department"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1415258423663')}_${getText('MESBasic.viewtitle.radion1415259833707')}.xls" />
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
		<div id="ec_MESBasic_itemManage_itemSetup_itemList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_itemManage_itemSetup_itemList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_itemManage_itemList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_itemManage_itemList" formId="ec_MESBasic_itemManage_itemSetup_itemList_queryForm" dataTableId="ec_MESBasic_itemManage_itemSetup_itemList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_itemManage_itemSetup_itemList_queryForm" isExpandAll=true formId="ec_MESBasic_itemManage_itemSetup_itemList_queryForm" idprefix="ec_MESBasic_itemManage_itemSetup_itemList" expandType="all"  fieldcodes="MESBasic_1_itemManage_ItemSetup_itemName_itemName:MESBasic.propertydisplayName.radion1415258813793||MESBasic_1_itemManage_ItemSetup_itemNumber_itemNumber:MESBasic.propertydisplayName.radion1415258842136||MESBasic_1_itemManage_ItemSetup_code_code:MESBasic.propertydisplayName.radion1415261315358||MESBasic_1_itemManage_ItemSetup_virtualTag_virtualTag:MESBasic.propertydisplayName.radion1415261562719||MESBasic_1_itemManage_ItemSetup_itemClass_itemClass:MESBasic.propertydisplayName.radion1416380194525||MESBasic_1_itemManage_ItemSetup_tagType_tagType:MESBasic.propertydisplayName.radion1415260997658" > 
							<#assign itemName_defaultValue  = ''>
									<#assign itemName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_itemManage_itemSetup_itemList_queryForm" code="MESBasic_1_itemManage_ItemSetup_itemName" showFormat="TEXT" defaultValue=itemName_defaultValue  divCode="MESBasic_1_itemManage_ItemSetup_itemName_itemName" isCustomize=true style="" > 
										<#if (itemName_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_itemManage_itemSetup_itemList_queryForm"  isPrecise=true value="${itemName_defaultValue!}" deValue="${itemName_defaultValue!}"   conditionfunc="MESBasic.itemManage.itemSetup.itemList._querycustomFunc('itemName')" name="itemName" id="ec_MESBasic_itemManage_itemSetup_itemList_queryForm_itemName" displayFieldName="itemName" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/itemManage/itemSetup/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.itemManage.itemSetup.itemList.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_itemManage_itemSetup_itemList_queryForm"  isPrecise=true  conditionfunc="MESBasic.itemManage.itemSetup.itemList._querycustomFunc('itemName')" name="itemName" id="ec_MESBasic_itemManage_itemSetup_itemList_queryForm_itemName" displayFieldName="itemName" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/itemManage/itemSetup/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.itemManage.itemSetup.itemList.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign itemNumber_defaultValue  = ''>
									<#assign itemNumber_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_itemManage_itemSetup_itemList_queryForm" code="MESBasic_1_itemManage_ItemSetup_itemNumber" showFormat="TEXT" defaultValue=itemNumber_defaultValue  divCode="MESBasic_1_itemManage_ItemSetup_itemNumber_itemNumber" isCustomize=true style="" > 
										<#if (itemNumber_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_itemManage_itemSetup_itemList_queryForm"  isPrecise=true value="${itemNumber_defaultValue!}" deValue="${itemNumber_defaultValue!}"   conditionfunc="MESBasic.itemManage.itemSetup.itemList._querycustomFunc('itemNumber')" name="itemNumber" id="ec_MESBasic_itemManage_itemSetup_itemList_queryForm_itemNumber" displayFieldName="itemNumber" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/itemManage/itemSetup/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.itemManage.itemSetup.itemList.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_itemManage_itemSetup_itemList_queryForm"  isPrecise=true  conditionfunc="MESBasic.itemManage.itemSetup.itemList._querycustomFunc('itemNumber')" name="itemNumber" id="ec_MESBasic_itemManage_itemSetup_itemList_queryForm_itemNumber" displayFieldName="itemNumber" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/itemManage/itemSetup/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.itemManage.itemSetup.itemList.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_itemManage_itemSetup_itemList_queryForm" code="MESBasic_1_itemManage_ItemSetup_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="MESBasic_1_itemManage_ItemSetup_code_code" isCustomize=true style="" > 
										<#if (code_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_itemManage_itemSetup_itemList_queryForm"  isPrecise=true value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="MESBasic.itemManage.itemSetup.itemList._querycustomFunc('code')" name="code" id="ec_MESBasic_itemManage_itemSetup_itemList_queryForm_code" displayFieldName="code" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/itemManage/itemSetup/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.itemManage.itemSetup.itemList.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_itemManage_itemSetup_itemList_queryForm"  isPrecise=true  conditionfunc="MESBasic.itemManage.itemSetup.itemList._querycustomFunc('code')" name="code" id="ec_MESBasic_itemManage_itemSetup_itemList_queryForm_code" displayFieldName="code" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/itemManage/itemSetup/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.itemManage.itemSetup.itemList.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign virtualTag_defaultValue  = ''>
									<#assign virtualTag_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_itemManage_itemSetup_itemList_queryForm" code="MESBasic_1_itemManage_ItemSetup_virtualTag" showFormat="SELECT" defaultValue=virtualTag_defaultValue  divCode="MESBasic_1_itemManage_ItemSetup_virtualTag_virtualTag" isCustomize=true style="" > 
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${virtualTag_defaultValue!}" name="virtualTag" id="virtualTag" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (virtualTag_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (virtualTag_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<#assign itemClass_defaultValue  = ''>
									<#assign itemClass_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_itemManage_itemSetup_itemList_queryForm" code="MESBasic_1_itemManage_ItemSetup_itemClass" showFormat="SELECTCOMP" defaultValue=itemClass_defaultValue  divCode="MESBasic_1_itemManage_ItemSetup_itemClass_itemClass" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${itemClass_defaultValue}"   name="itemClass" code="ITEM_PROPERTY" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<#assign tagType_defaultValue  = ''>
									<#assign tagType_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_itemManage_itemSetup_itemList_queryForm" code="MESBasic_1_itemManage_ItemSetup_tagType" showFormat="SELECTCOMP" defaultValue=tagType_defaultValue  divCode="MESBasic_1_itemManage_ItemSetup_tagType_tagType" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${tagType_defaultValue}"   name="tagType" code="TAG_TYPE" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_itemManage_itemSetup_itemList_queryForm" type="adv" onclick="MESBasic.itemManage.itemSetup.itemList.commonQuery('query')" onadvancedclick="advQuery('MESBasic.itemManage.itemSetup.itemList.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_itemManage_itemSetup_itemList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_itemManage_itemSetup_itemList_quickquery_info={};
ec_MESBasic_itemManage_itemSetup_itemList_quickquery_info["MainTableName"]="PELLET_ITEMSETUP";
ec_MESBasic_itemManage_itemSetup_itemList_quickquery_info["itemName"]={};
ec_MESBasic_itemManage_itemSetup_itemList_quickquery_info["itemName"].dbColumnType="TEXT";
ec_MESBasic_itemManage_itemSetup_itemList_quickquery_info["itemName"].layRec="itemName";
ec_MESBasic_itemManage_itemSetup_itemList_quickquery_info["itemName"].columnName="IS_ITEMNAME";
ec_MESBasic_itemManage_itemSetup_itemList_quickquery_info["itemNumber"]={};
ec_MESBasic_itemManage_itemSetup_itemList_quickquery_info["itemNumber"].dbColumnType="TEXT";
ec_MESBasic_itemManage_itemSetup_itemList_quickquery_info["itemNumber"].layRec="itemNumber";
ec_MESBasic_itemManage_itemSetup_itemList_quickquery_info["itemNumber"].columnName="IS_ITEMNUMBER";
ec_MESBasic_itemManage_itemSetup_itemList_quickquery_info["code"]={};
ec_MESBasic_itemManage_itemSetup_itemList_quickquery_info["code"].dbColumnType="TEXT";
ec_MESBasic_itemManage_itemSetup_itemList_quickquery_info["code"].layRec="code";
ec_MESBasic_itemManage_itemSetup_itemList_quickquery_info["code"].columnName="CODE";
ec_MESBasic_itemManage_itemSetup_itemList_quickquery_info["virtualTag"]={};
ec_MESBasic_itemManage_itemSetup_itemList_quickquery_info["virtualTag"].dbColumnType="BOOLEAN";
ec_MESBasic_itemManage_itemSetup_itemList_quickquery_info["virtualTag"].layRec="virtualTag";
ec_MESBasic_itemManage_itemSetup_itemList_quickquery_info["virtualTag"].columnName="VIRTUAL_TAG";
ec_MESBasic_itemManage_itemSetup_itemList_quickquery_info["itemClass"]={};
ec_MESBasic_itemManage_itemSetup_itemList_quickquery_info["itemClass"].dbColumnType="SYSTEMCODE";
ec_MESBasic_itemManage_itemSetup_itemList_quickquery_info["itemClass"].layRec="itemClass";
ec_MESBasic_itemManage_itemSetup_itemList_quickquery_info["itemClass"].columnName="MEASURE_CLASS";
ec_MESBasic_itemManage_itemSetup_itemList_quickquery_info["tagType"]={};
ec_MESBasic_itemManage_itemSetup_itemList_quickquery_info["tagType"].dbColumnType="SYSTEMCODE";
ec_MESBasic_itemManage_itemSetup_itemList_quickquery_info["tagType"].layRec="tagType";
ec_MESBasic_itemManage_itemSetup_itemList_quickquery_info["tagType"].columnName="TAG_TYPE";
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
 	var advRemainDialog = $('[id="MESBasic.itemManage.itemSetup.itemList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.itemManage.itemSetup.itemList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_itemManage_itemSetup_itemList_adv_queryForm" exportUrl="/MESBasic/itemManage/itemSetup/itemList-query.action">
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_itemManage_itemSetup_itemList_adv_queryForm" code="MESBasic_1_itemManage_ItemSetup_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="MESBasic_1_itemManage_ItemSetup_code_code" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_itemManage_ItemSetup" layRec="code" columnname="CODE" columntype="TEXT" name="code" fieldType="TEXTFIELD" tableName="PELLET_ITEMSETUP"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										测点编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_itemManage_ItemSetup" />
										<#if (code_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_itemManage_itemSetup_itemList_adv_queryForm"  isPrecise=true value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="MESBasic.itemManage.itemSetup.itemList._querycustomFunc('code')" name="code" id="adv_ec_MESBasic_itemManage_itemSetup_itemList_queryForm_code" displayFieldName="code" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/itemManage/itemSetup/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_itemManage_itemList"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_itemManage_itemSetup_itemList_adv_queryForm"  isPrecise=true  conditionfunc="MESBasic.itemManage.itemSetup.itemList._querycustomFunc('code')" name="code" id="adv_ec_MESBasic_itemManage_itemSetup_itemList_queryForm_code" displayFieldName="code" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/itemManage/itemSetup/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_itemManage_itemList"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign itemName_defaultValue  = ''>
									<#assign itemName_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_itemManage_itemSetup_itemList_adv_queryForm" code="MESBasic_1_itemManage_ItemSetup_itemName" showFormat="TEXT" defaultValue=itemName_defaultValue  divCode="MESBasic_1_itemManage_ItemSetup_itemName_itemName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_itemManage_ItemSetup" layRec="itemName" columnname="IS_ITEMNAME" columntype="TEXT" name="itemName" fieldType="TEXTFIELD" tableName="PELLET_ITEMSETUP"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										测点名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_itemManage_ItemSetup" />
										<#if (itemName_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_itemManage_itemSetup_itemList_adv_queryForm"  isPrecise=true value="${itemName_defaultValue!}" deValue="${itemName_defaultValue!}"   conditionfunc="MESBasic.itemManage.itemSetup.itemList._querycustomFunc('itemName')" name="itemName" id="adv_ec_MESBasic_itemManage_itemSetup_itemList_queryForm_itemName" displayFieldName="itemName" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/itemManage/itemSetup/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_itemManage_itemList"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_itemManage_itemSetup_itemList_adv_queryForm"  isPrecise=true  conditionfunc="MESBasic.itemManage.itemSetup.itemList._querycustomFunc('itemName')" name="itemName" id="adv_ec_MESBasic_itemManage_itemSetup_itemList_queryForm_itemName" displayFieldName="itemName" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/itemManage/itemSetup/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_itemManage_itemList"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign itemNumber_defaultValue  = ''>
									<#assign itemNumber_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_itemManage_itemSetup_itemList_adv_queryForm" code="MESBasic_1_itemManage_ItemSetup_itemNumber" showFormat="TEXT" defaultValue=itemNumber_defaultValue  divCode="MESBasic_1_itemManage_ItemSetup_itemNumber_itemNumber" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_itemManage_ItemSetup" layRec="itemNumber" columnname="IS_ITEMNUMBER" columntype="TEXT" name="itemNumber" fieldType="TEXTFIELD" tableName="PELLET_ITEMSETUP"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										生产位号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_itemManage_ItemSetup" />
										<#if (itemNumber_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_itemManage_itemSetup_itemList_adv_queryForm"  isPrecise=true value="${itemNumber_defaultValue!}" deValue="${itemNumber_defaultValue!}"   conditionfunc="MESBasic.itemManage.itemSetup.itemList._querycustomFunc('itemNumber')" name="itemNumber" id="adv_ec_MESBasic_itemManage_itemSetup_itemList_queryForm_itemNumber" displayFieldName="itemNumber" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/itemManage/itemSetup/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_itemManage_itemList"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_itemManage_itemSetup_itemList_adv_queryForm"  isPrecise=true  conditionfunc="MESBasic.itemManage.itemSetup.itemList._querycustomFunc('itemNumber')" name="itemNumber" id="adv_ec_MESBasic_itemManage_itemSetup_itemList_queryForm_itemNumber" displayFieldName="itemNumber" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/itemManage/itemSetup/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_itemManage_itemList"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign virtualTag_defaultValue  = ''>
									<#assign virtualTag_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_itemManage_itemSetup_itemList_adv_queryForm" code="MESBasic_1_itemManage_ItemSetup_virtualTag" showFormat="SELECT" defaultValue=virtualTag_defaultValue  divCode="MESBasic_1_itemManage_ItemSetup_virtualTag_virtualTag" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_itemManage_ItemSetup" layRec="virtualTag" columnname="VIRTUAL_TAG" columntype="BOOLEAN" name="virtualTag" fieldType="SELECT" tableName="PELLET_ITEMSETUP"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										虚拟位号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_itemManage_ItemSetup" />
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${virtualTag_defaultValue!}" name="virtualTag" id="adv_virtualTag" exp="equal"   value=""> 
											<option value=""></option>
											<option value="1" <#if (virtualTag_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (virtualTag_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign energyType_defaultValue  = ''>
									<#assign energyType_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_itemManage_itemSetup_itemList_adv_queryForm" code="MESBasic_1_itemManage_ItemSetup_energyType" showFormat="SELECTCOMP" defaultValue=energyType_defaultValue  divCode="MESBasic_1_itemManage_ItemSetup_energyType_energyType" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_itemManage_ItemSetup" layRec="energyType" columnname="IS_ITEMCLASS" columntype="SYSTEMCODE" name="energyType" fieldType="SELECTCOMP" tableName="PELLET_ITEMSETUP"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										能源类型
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_itemManage_ItemSetup" />
										<@systemcode  advquery=true onchange="" ecFlag=true deValue="${energyType_defaultValue}"   name="energyType" code="ItemClass" classStyle="cui-noborder-input" value="" />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign itemClass_defaultValue  = ''>
									<#assign itemClass_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_itemManage_itemSetup_itemList_adv_queryForm" code="MESBasic_1_itemManage_ItemSetup_itemClass" showFormat="SELECTCOMP" defaultValue=itemClass_defaultValue  divCode="MESBasic_1_itemManage_ItemSetup_itemClass_itemClass" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_itemManage_ItemSetup" layRec="itemClass" columnname="MEASURE_CLASS" columntype="SYSTEMCODE" name="itemClass" fieldType="SELECTCOMP" tableName="PELLET_ITEMSETUP"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										位号属性
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_itemManage_ItemSetup" />
										<@systemcode  advquery=true onchange="" ecFlag=true deValue="${itemClass_defaultValue}"   name="itemClass" code="ITEM_PROPERTY" classStyle="cui-noborder-input" value="" />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign machine_defaultValue  = ''>
									<#assign machine_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_itemManage_itemSetup_itemList_adv_queryForm" code="MESBasic_1_itemManage_ItemSetup_machine" showFormat="TEXT" defaultValue=machine_defaultValue  divCode="MESBasic_1_itemManage_ItemSetup_machine_machine" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_itemManage_ItemSetup" layRec="machine" columnname="IS_MACHINE" columntype="TEXT" name="machine" fieldType="TEXTFIELD" tableName="PELLET_ITEMSETUP"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										装置名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_itemManage_ItemSetup" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="machine" id="adv_machine" value="${machine_defaultValue!}" deValue="${machine_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign gatherLevel_defaultValue  = ''>
									<#assign gatherLevel_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_itemManage_itemSetup_itemList_adv_queryForm" code="MESBasic_1_itemManage_ItemSetup_gatherLevel" showFormat="SELECTCOMP" defaultValue=gatherLevel_defaultValue  divCode="MESBasic_1_itemManage_ItemSetup_gatherLevel_gatherLevel" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_itemManage_ItemSetup" layRec="gatherLevel" columnname="IS_GATHERLVL" columntype="SYSTEMCODE" name="gatherLevel" fieldType="SELECTCOMP" tableName="PELLET_ITEMSETUP"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										统计级别
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_itemManage_ItemSetup" />
										<@systemcode  advquery=true onchange="" ecFlag=true deValue="${gatherLevel_defaultValue}"   name="gatherLevel" code="GatherLvl" classStyle="cui-noborder-input" value="" />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign unit_code_defaultValue  = ''>
									<#assign unit_code_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_itemManage_itemSetup_itemList_adv_queryForm" code="X6Basic_1.0_unitGroup_BaseUnit_code" showFormat="SELECTCOMP" defaultValue=unit_code_defaultValue  divCode="X6Basic_1.0_unitGroup_BaseUnit_code_unit_code" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="X6Basic_1.0_unitGroup_BaseUnit" layRec="S2BASE_UNIT,UNIT_ID,PELLET_ITEMSETUP,UNIT-code" columnname="UNIT_CODE" columntype="TEXT" name="unit.code" fieldType="SELECTCOMP" tableName="S2BASE_UNIT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										单位代码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="X6Basic_1.0_unitGroup_BaseUnit" />
										<input type="hidden" id="adv_unit.id" name="unit.id" value="" />
												<@mneclient iframe=true mneenable=false advresume="adv_unit.id"  isPrecise=true deValue="${unit_code_defaultValue!}" reftitle="${getText('X6Basic.viewtitle.radion1398240433147')}"  conditionfunc="MESBasic.itemManage.itemSetup.itemList._querycustomFunc('unit_code')" name="unit.code" id="adv_ec_MESBasic_itemManage_itemSetup_itemList_queryForm_unit_code" displayFieldName="code" type="other" exp="like"  classStyle="cui-noborder-input" url="/X6Basic/unitGroup/baseUnit/unitRef.action"   refViewCode="X6Basic_1.0_unitGroup_unitRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_itemManage_itemSetup_itemList_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign unit_name_defaultValue  = ''>
									<#assign unit_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_itemManage_itemSetup_itemList_adv_queryForm" code="X6Basic_1.0_unitGroup_BaseUnit_name" showFormat="SELECTCOMP" defaultValue=unit_name_defaultValue  divCode="X6Basic_1.0_unitGroup_BaseUnit_name_unit_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="X6Basic_1.0_unitGroup_BaseUnit" layRec="S2BASE_UNIT,UNIT_ID,PELLET_ITEMSETUP,UNIT-name" columnname="UNIT_NAME" columntype="TEXT" name="unit.name" fieldType="SELECTCOMP" tableName="S2BASE_UNIT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										单位名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="X6Basic_1.0_unitGroup_BaseUnit" />
												<@mneclient iframe=true mneenable=false advresume="adv_unit.id"  isPrecise=true deValue="${unit_name_defaultValue!}" reftitle="${getText('X6Basic.viewtitle.radion1398240433147')}"  conditionfunc="MESBasic.itemManage.itemSetup.itemList._querycustomFunc('unit_name')" name="unit.name" id="adv_ec_MESBasic_itemManage_itemSetup_itemList_queryForm_unit_name" displayFieldName="name" type="other" exp="like"  classStyle="cui-noborder-input" url="/X6Basic/unitGroup/baseUnit/unitRef.action"   refViewCode="X6Basic_1.0_unitGroup_unitRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_itemManage_itemSetup_itemList_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign itemPlace_placeCode_defaultValue  = ''>
									<#assign itemPlace_placeCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_itemManage_itemSetup_itemList_adv_queryForm" code="MESBasic_1_placeManage_PlaceManage_placeCode" showFormat="SELECTCOMP" defaultValue=itemPlace_placeCode_defaultValue  divCode="MESBasic_1_placeManage_PlaceManage_placeCode_itemPlace_placeCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_placeManage_PlaceManage" layRec="MESBASIC_PLACE_MENAGE,ID,PELLET_ITEMSETUP,ITEM_PLACE-placeCode" columnname="PLACE_CODE" columntype="TEXT" name="itemPlace.placeCode" fieldType="SELECTCOMP" tableName="MESBASIC_PLACE_MENAGE"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										位置编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_placeManage_PlaceManage" />
										<input type="hidden" id="adv_itemPlace.id" name="itemPlace.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_itemPlace.id"  isPrecise=true deValue="${itemPlace_placeCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1418611854708')}"  conditionfunc="MESBasic.itemManage.itemSetup.itemList._querycustomFunc('itemPlace_placeCode')" name="itemPlace.placeCode" id="adv_ec_MESBasic_itemManage_itemSetup_itemList_queryForm_itemPlace_placeCode" displayFieldName="placeCode" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/placeManage/placeManage/refrence.action"   refViewCode="MESBasic_1_placeManage_refrence"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_itemManage_itemSetup_itemList_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign itemPlace_placeName_defaultValue  = ''>
									<#assign itemPlace_placeName_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_itemManage_itemSetup_itemList_adv_queryForm" code="MESBasic_1_placeManage_PlaceManage_placeName" showFormat="SELECTCOMP" defaultValue=itemPlace_placeName_defaultValue  divCode="MESBasic_1_placeManage_PlaceManage_placeName_itemPlace_placeName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_placeManage_PlaceManage" layRec="MESBASIC_PLACE_MENAGE,ID,PELLET_ITEMSETUP,ITEM_PLACE-placeName" columnname="PLACE_NAME" columntype="TEXT" name="itemPlace.placeName" fieldType="SELECTCOMP" tableName="MESBASIC_PLACE_MENAGE"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										位置名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_placeManage_PlaceManage" />
												<@mneclient iframe=true mneenable=true advresume="adv_itemPlace.id"  isPrecise=true deValue="${itemPlace_placeName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1418611854708')}"  conditionfunc="MESBasic.itemManage.itemSetup.itemList._querycustomFunc('itemPlace_placeName')" name="itemPlace.placeName" id="adv_ec_MESBasic_itemManage_itemSetup_itemList_queryForm_itemPlace_placeName" displayFieldName="placeName" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/placeManage/placeManage/refrence.action"   refViewCode="MESBasic_1_placeManage_refrence"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_itemManage_itemSetup_itemList_adv_queryForm"   />
								
                                	
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
			viewCode: 'MESBasic_1_itemManage_itemList',
			modelCode: 'MESBasic_1_itemManage_ItemSetup',
			modelName: 'ItemSetup',
			formId: 'ec_MESBasic_itemManage_itemSetup_itemList_queryForm',
			olddiv: 'MESBasic.itemManage.itemSetup.itemList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.itemManage.itemSetup.itemList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_itemManage_itemList'+"&entity.code="+'MESBasic_1_itemManage';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.itemManage.itemSetup.itemList.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.itemManage.itemSetup.itemList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.itemManage.itemSetup.itemList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_itemManage_itemList'+"&entity.code="+'MESBasic_1_itemManage';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.itemManage.itemSetup.itemList.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.itemManage.itemSetup.itemList.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.itemManage.itemSetup.itemList.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.itemManage.itemSetup.itemList.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.itemManage.itemSetup.itemList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.itemManage.itemSetup.itemList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.itemManage.itemSetup.itemList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.itemManage.itemSetup.itemList.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.itemManage.itemSetup.itemList.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.itemManage.itemSetup.itemList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.itemManage.itemSetup.itemList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.itemManage.itemSetup.itemList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.itemManage.itemSetup.itemList.query('query')">
<#assign datatable_dataUrl = "/MESBasic/itemManage/itemSetup/itemList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_MESBasic_itemManage_itemSetup_itemList_query" renderOverEvent="ec_MESBasic_itemManage_itemSetup_itemList_RenderOverEvent" pageInitMethod="ec_MESBasic_itemManage_itemSetup_itemList_PageInitMethod" modelCode="MESBasic_1_itemManage_ItemSetup" noPermissionKeys="code,itemNumber,itemName,tagType,itemClass,virtualTag,itemPlace.placeName,crtValue,updatTime" hidekeyPrefix="ec_MESBasic_itemManage_itemSetup_itemList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_itemManage_itemSetup_itemList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="MESBasic.itemManage.itemSetup.itemList.dbmodifyitemList" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','tagType.id','itemClass.id','itemPlace.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.itemManage.itemSetup.itemList.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}itemList_itemNew_add_MESBasic_1_itemManage_itemList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1423730541699')}||iconcls:add||useInMore:false||onclick:
				MESBasic.itemManage.itemSetup.itemList.additemList()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_itemManage_itemList_BUTTON_itemNew"
		buttonType="ADD" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}itemList_itemNew_add_MESBasic_1_itemManage_itemList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1423730541699')}||iconcls:add||useInMore:false||onclick:
				MESBasic.itemManage.itemSetup.itemList.additemList()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}itemList_itemEdit_modify_MESBasic_1_itemManage_itemList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1423705335643')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.itemManage.itemSetup.itemList.modifyitemList()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_itemManage_itemList_BUTTON_itemEdit"
		buttonType="MODIFY" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}itemList_itemEdit_modify_MESBasic_1_itemManage_itemList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1423705335643')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.itemManage.itemSetup.itemList.modifyitemList()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}itemList_itemDel_del_MESBasic_1_itemManage_itemList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1415259989679')}||iconcls:del||useInMore:false||onclick:
				MESBasic.itemManage.itemSetup.itemList.delitemList()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_itemManage_itemList_BUTTON_itemDel"
		buttonType="DELETE" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}itemList_itemDel_del_MESBasic_1_itemManage_itemList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1415259989679')}||iconcls:del||useInMore:false||onclick:
				MESBasic.itemManage.itemSetup.itemList.delitemList()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}itemList_import_import_MESBasic_1_itemManage_itemList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1421284850337')}||iconcls:import||useInMore:false||onclick:
				MESBasic.itemManage.itemSetup.itemList.importitemList()||subButtons:[{text:'${getText('import.file.downloadtemplate')}',handler:function(){MESBasic.itemManage.itemSetup.itemList.downloadTemplateitemList()},useInMore:'false'}]
		" 
		resultType="json" 
		buttonCode="MESBasic_1_itemManage_itemList_BUTTON_import"
		buttonType="IMPORT" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}itemList_import_import_MESBasic_1_itemManage_itemList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1421284850337')}||iconcls:import||useInMore:false||onclick:
				MESBasic.itemManage.itemSetup.itemList.importitemList()||subButtons:[{text:'${getText('import.file.downloadtemplate')}',handler:function(){MESBasic.itemManage.itemSetup.itemList.downloadTemplateitemList()},useInMore:'false'}]
		" 
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('MESBasic.propertydisplayName.radion1415261315358')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign itemNumber_displayDefaultType  = ''>
			<@datacolumn columnName="IS_ITEMNUMBER"    showFormat="TEXT" defaultDisplay="${itemNumber_displayDefaultType!}"  key="itemNumber"   label="${getText('MESBasic.propertydisplayName.radion1415258842136')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign itemName_displayDefaultType  = ''>
			<@datacolumn columnName="IS_ITEMNAME"    showFormat="TEXT" defaultDisplay="${itemName_displayDefaultType!}"  key="itemName"   label="${getText('MESBasic.propertydisplayName.radion1415258813793')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign tagType_displayDefaultType  = ''>
			<@datacolumn columnName="TAG_TYPE"    showFormat="SELECTCOMP" defaultDisplay="${tagType_displayDefaultType!}"  key="tagType.value"   label="${getText('MESBasic.propertydisplayName.radion1415260997658')}" textalign="left"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign itemClass_displayDefaultType  = ''>
			<@datacolumn columnName="MEASURE_CLASS"    showFormat="SELECTCOMP" defaultDisplay="${itemClass_displayDefaultType!}"  key="itemClass.value"   label="${getText('MESBasic.propertydisplayName.radion1416380194525')}" textalign="left"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign virtualTag_displayDefaultType  = ''>
			<@datacolumn columnName="VIRTUAL_TAG"    showFormat="SELECT" defaultDisplay="${virtualTag_displayDefaultType!}"  key="virtualTag"   label="${getText('MESBasic.propertydisplayName.radion1415261562719')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign itemPlace_placeName_displayDefaultType  = ''>
			<@datacolumn columnName="PLACE_NAME"    showFormat="TEXT" defaultDisplay="${itemPlace_placeName_displayDefaultType!}"  key="itemPlace.placeName"   label="${getText('MESBasic.propertydisplayName.radion1418607347494')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign crtValue_displayDefaultType  = ''>
			<@datacolumn columnName="CRT_VALUE"    showFormat="TEXT" defaultDisplay="${crtValue_displayDefaultType!}"  key="crtValue"   label="${getText('MESBasic.propertydisplayName.radion1415260736864')}" textalign="right" decimal="4" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign updatTime_displayDefaultType  = ''>
			<@datacolumn columnName="UPDAT_TIME"    showFormat="YMD_HMS" defaultDisplay="${updatTime_displayDefaultType!}"  key="updatTime"   label="${getText('MESBasic.propertydisplayName.radion1415260814187')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_itemManage_itemSetup_itemList_RenderOverEvent(){
}
function ec_MESBasic_itemManage_itemSetup_itemList_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
</script>