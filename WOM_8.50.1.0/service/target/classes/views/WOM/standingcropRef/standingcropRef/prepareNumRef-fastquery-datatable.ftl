	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1490063991944')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_queryForm" exportUrl="/WOM/standingcropRef/standingcropRef/prepareNumRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" id="MESBasic_1_storeSet_StoreSet" value="placeSet" bak_value="placeSet"/>
		<input type="hidden" reset="false" name="WOM_standingcropRef_standingcropRef_prepareNumRef_condition" id="WOM_standingcropRef_standingcropRef_prepareNumRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1490064355590')}_${getText('WOM.viewtitle.randon1566541491979')}.xls" />
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
		<div id="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_standingcropRef_prepareNumRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_standingcropRef_prepareNumRef" formId="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_queryForm" dataTableId="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_standingcropRef_standingcropRef_prepareNumRef_queryForm" isExpandAll=true formId="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_queryForm" idprefix="ec_WOM_standingcropRef_standingcropRef_prepareNumRef" expandType="all"  fieldcodes="WOM_7.5.0.0_standingcropRef_StandingcropRef_createTime_createTime:ec.common.createTime||MESBasic_1_product_Product_productCode_good_productCode:MESBasic.propertydisplayName.radion1415772644833||WOM_7.5.0.0_manulOrder_ManulOrderMain_manulOrderNum_manulOrder_manulOrderNum:WOM.propertydisplayName.randon1563193157341||base_staff_name_createStaff_name:WOM.formPropertyshowName.randon1567664273401.flag" > 
							<#assign createTime_defaultValue  = ''>
									<#assign createTime_defaultValue  = ''>
								<#if (createTime_defaultValue)?? &&(createTime_defaultValue)?has_content>
									<#assign createTime_defaultValue  = getDefaultDateTime(createTime_defaultValue!)?datetime>
								</#if>
							<@queryfield formId="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_queryForm" code="WOM_7.5.0.0_standingcropRef_StandingcropRef_createTime" showFormat="YMD_HMS" defaultValue=createTime_defaultValue  divCode="WOM_7.5.0.0_standingcropRef_StandingcropRef_createTime_createTime" isCustomize=true style="" > 
								<div>
							  	 	<div style="float:left;width:45%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="createTime_start" id="createTime_start" exp="gequal"   formid="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_queryForm" />
									</div>
									<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
							  	 	<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="createTime_end" id="createTime_end" exp="lequal"   formid="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_queryForm" />
							  		</div>
						  		</div>
							</@queryfield>
							<#assign good_productCode_defaultValue  = ''>
									<#assign good_productCode_defaultValue  = ''>
							<@queryfield formId="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=good_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_good_productCode" isCustomize=true style="" > 
										<input type="hidden" id="good.id" name="good.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${good_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  conditionfunc="WOM.standingcropRef.standingcropRef.prepareNumRef._querycustomFunc('good_productCode')" name="good.productCode" id="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_queryForm_good_productCode" displayFieldName="productCode" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/customRef.action"   refViewCode="MESBasic_1_product_customRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_queryForm" searchClick="WOM.standingcropRef.standingcropRef.prepareNumRef.commonQuery('query')"   />
							</@queryfield>
							<#assign manulOrder_manulOrderNum_defaultValue  = ''>
									<#assign manulOrder_manulOrderNum_defaultValue  = ''>
							<@queryfield formId="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_queryForm" code="WOM_7.5.0.0_manulOrder_ManulOrderMain_manulOrderNum" showFormat="SELECTCOMP" defaultValue=manulOrder_manulOrderNum_defaultValue  divCode="WOM_7.5.0.0_manulOrder_ManulOrderMain_manulOrderNum_manulOrder_manulOrderNum" isCustomize=true style="" > 
										<input type="hidden" id="manulOrder.id" name="manulOrder.id" value="" />
												<@mneclient iframe=true mneenable=false isCrossCompany=isCrossCompany isPrecise=true deValue="${manulOrder_manulOrderNum_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1563350015905')}"  conditionfunc="WOM.standingcropRef.standingcropRef.prepareNumRef._querycustomFunc('manulOrder_manulOrderNum')" name="manulOrder.manulOrderNum" id="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_queryForm_manulOrder_manulOrderNum" displayFieldName="manulOrderNum" type="other" exp="like" classStyle="cui-noborder-input" url="/WOM/manulOrder/manulOrderMain/manulOrdersRef.action"   refViewCode="WOM_7.5.0.0_manulOrder_manulOrdersRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_queryForm" searchClick="WOM.standingcropRef.standingcropRef.prepareNumRef.commonQuery('query')"   />
							</@queryfield>
							<#assign createStaff_name_defaultValue  = ''>
									<#assign createStaff_name_defaultValue  = ''>
							<@queryfield formId="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_queryForm" code="base_staff_name" showFormat="SELECTCOMP" defaultValue=createStaff_name_defaultValue  divCode="base_staff_name_createStaff_name" isCustomize=true style="" > 
										<input type="hidden" id="createStaff.id" name="createStaff.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${createStaff_name_defaultValue!}" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.standingcropRef.standingcropRef.prepareNumRef._querycustomFunc('createStaff_name')" name="createStaff.name" id="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_queryForm_createStaff_name" displayFieldName="name" type="Staff" exp="like" classStyle="cui-noborder-input" url="/foundation/staff/common/staffListFrameset.action"   refViewCode="sysbase_1.0_staff_ref"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_queryForm" searchClick="WOM.standingcropRef.standingcropRef.prepareNumRef.commonQuery('query')"   />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_queryForm" type="adv" onclick="WOM.standingcropRef.standingcropRef.prepareNumRef.commonQuery('query')" onadvancedclick="advQuery('WOM.standingcropRef.standingcropRef.prepareNumRef.advquery')" /> 
						 		<@querybutton formId="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info={};
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["MainTableName"]="MATERIAL_STANDINGCROPS";
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["createTime"]={};
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["createTime"].dbColumnType="DATETIME";
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["createTime"].layRec="createTime";
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["createTime"].columnName="CREATE_TIME";
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["good.productCode"]={};
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["good.productCode"].dbColumnType="TEXT";
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["good.productCode"].layRec="S2BASE_PRODUCT,PRODUCT_ID,MATERIAL_STANDINGCROPS,GOOD-productCode";
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["good.productCode"].columnName="PRODUCT_CODE";
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["good.id"]={};
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["good.id"].dbColumnType="LONG";
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["good.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,MATERIAL_STANDINGCROPS,GOOD-productCode";
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["good.id"].columnName="PRODUCT_ID";
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["manulOrder.manulOrderNum"]={};
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["manulOrder.manulOrderNum"].dbColumnType="TEXT";
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["manulOrder.manulOrderNum"].layRec="WOM_MENUL_ORDER_MAIN,ID,MATERIAL_STANDINGCROPS,MANUL_ORDER-manulOrderNum";
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["manulOrder.manulOrderNum"].columnName="MANUL_ORDER_NUM";
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["manulOrder.id"]={};
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["manulOrder.id"].dbColumnType="LONG";
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["manulOrder.id"].layRec="WOM_MENUL_ORDER_MAIN,ID,MATERIAL_STANDINGCROPS,MANUL_ORDER-manulOrderNum";
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["manulOrder.id"].columnName="ID";
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["createStaff.name"]={};
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["createStaff.name"].dbColumnType="TEXT";
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["createStaff.name"].layRec="base_staff,ID,MATERIAL_STANDINGCROPS,CREATE_STAFF_ID-name";
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["createStaff.name"].columnName="NAME";
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["createStaff.id"]={};
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["createStaff.id"].dbColumnType="LONG";
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["createStaff.id"].layRec="base_staff,ID,MATERIAL_STANDINGCROPS,CREATE_STAFF_ID-name";
ec_WOM_standingcropRef_standingcropRef_prepareNumRef_quickquery_info["createStaff.id"].columnName="ID";
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
 	var advRemainDialog = $('[id="WOM.standingcropRef.standingcropRef.prepareNumRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.standingcropRef.standingcropRef.prepareNumRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_adv_queryForm" exportUrl="/WOM/standingcropRef/standingcropRef/prepareNumRef-query.action">
							<#assign manulOrder_manulOrderNum_defaultValue  = ''>
									<#assign manulOrder_manulOrderNum_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_adv_queryForm" code="WOM_7.5.0.0_manulOrder_ManulOrderMain_manulOrderNum" showFormat="SELECTCOMP" defaultValue=manulOrder_manulOrderNum_defaultValue  divCode="WOM_7.5.0.0_manulOrder_ManulOrderMain_manulOrderNum_manulOrder_manulOrderNum" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_manulOrder_ManulOrderMain" layRec="WOM_MENUL_ORDER_MAIN,ID,MATERIAL_STANDINGCROPS,MANUL_ORDER-manulOrderNum" columnname="MANUL_ORDER_NUM" columntype="TEXT" name="manulOrder.manulOrderNum" fieldType="SELECTCOMP" tableName="WOM_MENUL_ORDER_MAIN"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										生产订单号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_manulOrder_ManulOrderMain" />
										<input type="hidden" id="adv_manulOrder.id" name="manulOrder.id" value="" />
												<@mneclient iframe=true mneenable=false advresume="adv_manulOrder.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${manulOrder_manulOrderNum_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1563350015905')}"  conditionfunc="WOM.standingcropRef.standingcropRef.prepareNumRef._querycustomFunc('manulOrder_manulOrderNum')" name="manulOrder.manulOrderNum" id="adv_ec_WOM_standingcropRef_standingcropRef_prepareNumRef_queryForm_manulOrder_manulOrderNum" displayFieldName="manulOrderNum" type="other" exp="like"  classStyle="cui-noborder-input" url="/WOM/manulOrder/manulOrderMain/manulOrdersRef.action"   refViewCode="WOM_7.5.0.0_manulOrder_manulOrdersRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign good_productCode_defaultValue  = ''>
									<#assign good_productCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_adv_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=good_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_good_productCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,MATERIAL_STANDINGCROPS,GOOD-productCode" columnname="PRODUCT_CODE" columntype="TEXT" name="good.productCode" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物品编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_good.id" name="good.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_good.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${good_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  conditionfunc="WOM.standingcropRef.standingcropRef.prepareNumRef._querycustomFunc('good_productCode')" name="good.productCode" id="adv_ec_WOM_standingcropRef_standingcropRef_prepareNumRef_queryForm_good_productCode" displayFieldName="productCode" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/customRef.action"   refViewCode="MESBasic_1_product_customRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign createTime_defaultValue  = ''>
									<#assign createTime_defaultValue  = ''>
								<#if (createTime_defaultValue)?? &&(createTime_defaultValue)?has_content>
									<#assign createTime_defaultValue  = getDefaultDateTime(createTime_defaultValue!)?datetime>
								</#if>
								<@advsqueryfield formId="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_adv_queryForm" code="WOM_7.5.0.0_standingcropRef_StandingcropRef_createTime" showFormat="YMD_HMS" defaultValue=createTime_defaultValue  divCode="WOM_7.5.0.0_standingcropRef_StandingcropRef_createTime_createTime" isCustomize=true > 
								
								<div class="quick_query_node" style="width:98%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_standingcropRef_StandingcropRef" layRec="createTime" columnname="CREATE_TIME" columntype="DATETIME" name="createTime" fieldType="DATETIME" showFormat="YMD_HMS" tableName="MATERIAL_STANDINGCROPS"/>
								<label class="quick_query_labeltime advQuery_label" style="text-align:right;float:left;width:14%;height:28px;line-height:28px">
								<span class="quick_query_text">
										创建时间
								</span>
								</label>
							<div class="quick_query_contenttime advQuery_content" style="float:left;width:86%">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_standingcropRef_StandingcropRef" />
								<div>
							  	 	<div style="float:left;width:41.8%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${createTime_defaultValue!}" deValue="${createTime_defaultValue!}"  name="createTime_start" id="adv_createTime_start" exp="gequal"    formid="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_adv_queryForm" />
									</div>
									<div style="float:left;width:16.3%;text-align:center;line-height: 26px;"> - - ${getText('common.date.split')} - - </div>
							  	 	<div style="float:left;width:41.8%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${createTime_defaultValue!}" deValue="${createTime_defaultValue!}"  name="createTime_end" id="adv_createTime_end" exp="lequal"    formid="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_adv_queryForm" />
							  		</div>
						  		</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign createStaff_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_adv_queryForm" code="base_staff_name" showFormat="SELECTCOMP" defaultValue=createStaff_name_defaultValue  divCode="base_staff_name_createStaff_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="sysbase_1.0_staff_base_staff" layRec="base_staff,ID,MATERIAL_STANDINGCROPS,CREATE_STAFF_ID-name" columnname="NAME" columntype="TEXT" name="createStaff.name" fieldType="SELECTCOMP" tableName="base_staff"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										创建人
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="sysbase_1.0_staff_base_staff" />
										<input type="hidden" id="adv_createStaff.id" name="createStaff.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_createStaff.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${createStaff_name_defaultValue!}" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.standingcropRef.standingcropRef.prepareNumRef._querycustomFunc('createStaff_name')" name="createStaff.name" id="adv_ec_WOM_standingcropRef_standingcropRef_prepareNumRef_queryForm_createStaff_name" displayFieldName="name" type="Staff" exp="like"  classStyle="cui-noborder-input" url="/foundation/staff/common/staffListFrameset.action"   refViewCode="sysbase_1.0_staff_ref"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_adv_queryForm"   />
								
                                	
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
			viewCode: 'WOM_7.5.0.0_standingcropRef_prepareNumRef',
			modelCode: 'WOM_7.5.0.0_standingcropRef_StandingcropRef',
			modelName: 'StandingcropRef',
			formId: 'ec_WOM_standingcropRef_standingcropRef_prepareNumRef_queryForm',
			olddiv: 'WOM.standingcropRef.standingcropRef.prepareNumRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.standingcropRef.standingcropRef.prepareNumRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_standingcropRef_prepareNumRef'+"&entity.code="+'WOM_7.5.0.0_standingcropRef';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.standingcropRef.standingcropRef.prepareNumRef.advquery'] #customquContent").html(html);
		 	$("[id='WOM.standingcropRef.standingcropRef.prepareNumRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.standingcropRef.standingcropRef.prepareNumRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_standingcropRef_prepareNumRef'+"&entity.code="+'WOM_7.5.0.0_standingcropRef';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.standingcropRef.standingcropRef.prepareNumRef.advquery'] #customquContent").html(html);
			 $("[id='WOM.standingcropRef.standingcropRef.prepareNumRef.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.standingcropRef.standingcropRef.prepareNumRef.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.standingcropRef.standingcropRef.prepareNumRef.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.standingcropRef.standingcropRef.prepareNumRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.standingcropRef.standingcropRef.prepareNumRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.standingcropRef.standingcropRef.prepareNumRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.standingcropRef.standingcropRef.prepareNumRef.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.standingcropRef.standingcropRef.prepareNumRef.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.standingcropRef.standingcropRef.prepareNumRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.standingcropRef.standingcropRef.prepareNumRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.standingcropRef.standingcropRef.prepareNumRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.standingcropRef.standingcropRef.prepareNumRef.query('query')">
<#assign datatable_dataUrl = "/WOM/standingcropRef/standingcropRef/prepareNumRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_query" renderOverEvent="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_RenderOverEvent" pageInitMethod="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_PageInitMethod" modelCode="WOM_7.5.0.0_standingcropRef_StandingcropRef" noPermissionKeys="good.productCode,good.productName,good.productBaseUnit.name,manulOrder.manulOrderNum,createTime,onhand,batchText,wareID.wareCode,wareID.wareName" hidekeyPrefix="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_standingcropRef_standingcropRef_prepareNumRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="WOM.standingcropRef.standingcropRef.prepareNumRef.sendBackprepareNumRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','good.id','good.productBaseUnit.id','manulOrder.id','wareID.id','id','batchText']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="WOM.standingcropRef.standingcropRef.prepareNumRef.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign good_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${good_productCode_displayDefaultType!}"  key="good.productCode"   label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign good_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${good_productName_displayDefaultType!}"  key="good.productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign good_productBaseUnit_name_displayDefaultType  = ''>
			<@datacolumn columnName="UNIT_NAME"    showFormat="TEXT" defaultDisplay="${good_productBaseUnit_name_displayDefaultType!}"  key="good.productBaseUnit.name"   label="${getText('X6Basic.propertydisplayName.radion1398235640483')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign manulOrder_manulOrderNum_displayDefaultType  = ''>
			<@datacolumn columnName="MANUL_ORDER_NUM"    showFormat="TEXT" defaultDisplay="${manulOrder_manulOrderNum_displayDefaultType!}"  key="manulOrder.manulOrderNum"   label="${getText('WOM.propertydisplayName.randon1563193157341')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign createTime_displayDefaultType  = ''>
			<@datacolumn columnName="CREATE_TIME"    showFormat="YMD_HMS" defaultDisplay="${createTime_displayDefaultType!}"  key="createTime"   label="${getText('ec.common.createTime')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign onhand_displayDefaultType  = ''>
			<@datacolumn columnName="ONHAND"    showFormat="TEXT" defaultDisplay="${onhand_displayDefaultType!}"  key="onhand"   label="${getText('WOM.propertyshowName.randon1566782448157.flag')}" textalign="right" decimal="6" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign batchText_displayDefaultType  = ''>
			<@datacolumn columnName="BATCH_TEXT"    showFormat="TEXT" defaultDisplay="${batchText_displayDefaultType!}"  key="batchText"   label="${getText('WOM.propertydisplayName.randon1490064501469')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign wareID_wareCode_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_CODE"    showFormat="TEXT" defaultDisplay="${wareID_wareCode_displayDefaultType!}"  key="wareID.wareCode"   label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign wareID_wareName_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_NAME"    showFormat="TEXT" defaultDisplay="${wareID_wareName_displayDefaultType!}"  key="wareID.wareName"   label="${getText('MESBasic.propertydisplayName.randon1484031316281')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_standingcropRef_standingcropRef_prepareNumRef_RenderOverEvent(){
}
function ec_WOM_standingcropRef_standingcropRef_prepareNumRef_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
</script>