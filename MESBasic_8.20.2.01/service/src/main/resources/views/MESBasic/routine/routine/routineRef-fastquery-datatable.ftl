	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1415336450425')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_routine_routine_routineRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_routine_routine_routineRef_queryForm" exportUrl="/MESBasic/routine/routine/routineRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" name="MESBasic_routine_routine_routineRef_condition" id="MESBasic_routine_routine_routineRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1415336555124')}_${getText('MESBasic.viewtitle.radion1415338782604')}.xls" />
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
		<div id="ec_MESBasic_routine_routine_routineRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_routine_routine_routineRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_routine_routineRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_routine_routineRef" formId="ec_MESBasic_routine_routine_routineRef_queryForm" dataTableId="ec_MESBasic_routine_routine_routineRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_routine_routine_routineRef_queryForm" isExpandAll=true formId="ec_MESBasic_routine_routine_routineRef_queryForm" idprefix="ec_MESBasic_routine_routine_routineRef" expandType="all"  fieldcodes="MESBasic_1_routine_Routine_code_code:MESBasic.propertydisplayName.radion1415336575756||MESBasic_1_routine_Routine_name_name:MESBasic.propertydisplayName.radion1415336597801||MESBasic_1_equipManage_Equipment_name_srouceEqp_name:MESBasic.propertydisplayName.randon1427442213645||MESBasic_1_equipManage_Equipment_name_destEqp_name:MESBasic.propertydisplayName.randon1427442234442||MESBasic_1_product_Product_productName_product_productName:MESBasic.propertydisplayName.radion1415772740737" > 
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_routine_routine_routineRef_queryForm" code="MESBasic_1_routine_Routine_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="MESBasic_1_routine_Routine_code_code" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="code" id="code" value="${code_defaultValue!}" deValue="${code_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_routine_routine_routineRef_queryForm" code="MESBasic_1_routine_Routine_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="MESBasic_1_routine_Routine_name_name" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign srouceEqp_name_defaultValue  = ''>
									<#assign srouceEqp_name_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_routine_routine_routineRef_queryForm" code="MESBasic_1_equipManage_Equipment_name" showFormat="SELECTCOMP" defaultValue=srouceEqp_name_defaultValue  divCode="MESBasic_1_equipManage_Equipment_name_srouceEqp_name" isCustomize=true style="" > 
										<input type="hidden" id="srouceEqp.id" name="srouceEqp.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${srouceEqp_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1423967959681')}"  conditionfunc="MESBasic.routine.routine.routineRef._querycustomFunc('srouceEqp_name')" name="srouceEqp.name" id="ec_MESBasic_routine_routine_routineRef_queryForm_srouceEqp_name" displayFieldName="name" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/equipManage/equipment/ref.action"   refViewCode="MESBasic_1_equipManage_ref"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_routine_routine_routineRef_queryForm" searchClick="MESBasic.routine.routine.routineRef.commonQuery('query')"   />
							</@queryfield>
							<#assign destEqp_name_defaultValue  = ''>
									<#assign destEqp_name_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_routine_routine_routineRef_queryForm" code="MESBasic_1_equipManage_Equipment_name" showFormat="SELECTCOMP" defaultValue=destEqp_name_defaultValue  divCode="MESBasic_1_equipManage_Equipment_name_destEqp_name" isCustomize=true style="" > 
										<input type="hidden" id="destEqp.id" name="destEqp.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${destEqp_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1423967959681')}"  conditionfunc="MESBasic.routine.routine.routineRef._querycustomFunc('destEqp_name')" name="destEqp.name" id="ec_MESBasic_routine_routine_routineRef_queryForm_destEqp_name" displayFieldName="name" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/equipManage/equipment/ref.action"   refViewCode="MESBasic_1_equipManage_ref"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_routine_routine_routineRef_queryForm" searchClick="MESBasic.routine.routine.routineRef.commonQuery('query')"   />
							</@queryfield>
							<#assign product_productName_defaultValue  = ''>
									<#assign product_productName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_routine_routine_routineRef_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=product_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_product_productName" isCustomize=true style="" > 
										<input type="hidden" id="product.id" name="product.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${product_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  conditionfunc="MESBasic.routine.routine.routineRef._querycustomFunc('product_productName')" name="product.productName" id="ec_MESBasic_routine_routine_routineRef_queryForm_product_productName" displayFieldName="productName" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/refProductLayout.action"   refViewCode="MESBasic_1_product_refProductLayout"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_routine_routine_routineRef_queryForm" searchClick="MESBasic.routine.routine.routineRef.commonQuery('query')"   />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_routine_routine_routineRef_queryForm" type="adv" onclick="MESBasic.routine.routine.routineRef.commonQuery('query')" onadvancedclick="advQuery('MESBasic.routine.routine.routineRef.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_routine_routine_routineRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_routine_routine_routineRef_quickquery_info={};
ec_MESBasic_routine_routine_routineRef_quickquery_info["MainTableName"]="MESBASIC_ROUTINES";
ec_MESBasic_routine_routine_routineRef_quickquery_info["code"]={};
ec_MESBasic_routine_routine_routineRef_quickquery_info["code"].dbColumnType="TEXT";
ec_MESBasic_routine_routine_routineRef_quickquery_info["code"].layRec="code";
ec_MESBasic_routine_routine_routineRef_quickquery_info["code"].columnName="CODE";
ec_MESBasic_routine_routine_routineRef_quickquery_info["name"]={};
ec_MESBasic_routine_routine_routineRef_quickquery_info["name"].dbColumnType="TEXT";
ec_MESBasic_routine_routine_routineRef_quickquery_info["name"].layRec="name";
ec_MESBasic_routine_routine_routineRef_quickquery_info["name"].columnName="NAME";
ec_MESBasic_routine_routine_routineRef_quickquery_info["srouceEqp.name"]={};
ec_MESBasic_routine_routine_routineRef_quickquery_info["srouceEqp.name"].dbColumnType="TEXT";
ec_MESBasic_routine_routine_routineRef_quickquery_info["srouceEqp.name"].layRec="EAM_BASEINFO,EAM_ID,MESBASIC_ROUTINES,SROUCE_EQP-name";
ec_MESBasic_routine_routine_routineRef_quickquery_info["srouceEqp.name"].columnName="EAM_NAME";
ec_MESBasic_routine_routine_routineRef_quickquery_info["srouceEqp.id"]={};
ec_MESBasic_routine_routine_routineRef_quickquery_info["srouceEqp.id"].dbColumnType="LONG";
ec_MESBasic_routine_routine_routineRef_quickquery_info["srouceEqp.id"].layRec="EAM_BASEINFO,EAM_ID,MESBASIC_ROUTINES,SROUCE_EQP-name";
ec_MESBasic_routine_routine_routineRef_quickquery_info["srouceEqp.id"].columnName="EAM_ID";
ec_MESBasic_routine_routine_routineRef_quickquery_info["destEqp.name"]={};
ec_MESBasic_routine_routine_routineRef_quickquery_info["destEqp.name"].dbColumnType="TEXT";
ec_MESBasic_routine_routine_routineRef_quickquery_info["destEqp.name"].layRec="EAM_BASEINFO,EAM_ID,MESBASIC_ROUTINES,DEST_EQP-name";
ec_MESBasic_routine_routine_routineRef_quickquery_info["destEqp.name"].columnName="EAM_NAME";
ec_MESBasic_routine_routine_routineRef_quickquery_info["destEqp.id"]={};
ec_MESBasic_routine_routine_routineRef_quickquery_info["destEqp.id"].dbColumnType="LONG";
ec_MESBasic_routine_routine_routineRef_quickquery_info["destEqp.id"].layRec="EAM_BASEINFO,EAM_ID,MESBASIC_ROUTINES,DEST_EQP-name";
ec_MESBasic_routine_routine_routineRef_quickquery_info["destEqp.id"].columnName="EAM_ID";
ec_MESBasic_routine_routine_routineRef_quickquery_info["product.productName"]={};
ec_MESBasic_routine_routine_routineRef_quickquery_info["product.productName"].dbColumnType="TEXT";
ec_MESBasic_routine_routine_routineRef_quickquery_info["product.productName"].layRec="S2BASE_PRODUCT,PRODUCT_ID,MESBASIC_ROUTINES,PRODUCT-productName";
ec_MESBasic_routine_routine_routineRef_quickquery_info["product.productName"].columnName="PRODUCT_NAME";
ec_MESBasic_routine_routine_routineRef_quickquery_info["product.id"]={};
ec_MESBasic_routine_routine_routineRef_quickquery_info["product.id"].dbColumnType="LONG";
ec_MESBasic_routine_routine_routineRef_quickquery_info["product.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,MESBASIC_ROUTINES,PRODUCT-productName";
ec_MESBasic_routine_routine_routineRef_quickquery_info["product.id"].columnName="PRODUCT_ID";
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
 	var advRemainDialog = $('[id="MESBasic.routine.routine.routineRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.routine.routine.routineRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_routine_routine_routineRef_adv_queryForm" exportUrl="/MESBasic/routine/routine/routineRef-query.action">
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_routine_routine_routineRef_adv_queryForm" code="MESBasic_1_routine_Routine_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="MESBasic_1_routine_Routine_code_code" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_routine_Routine" layRec="code" columnname="CODE" columntype="TEXT" name="code" fieldType="TEXTFIELD" tableName="MESBASIC_ROUTINES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										路径编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_routine_Routine" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="code" id="adv_code" value="${code_defaultValue!}" deValue="${code_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_routine_routine_routineRef_adv_queryForm" code="MESBasic_1_routine_Routine_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="MESBasic_1_routine_Routine_name_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_routine_Routine" layRec="name" columnname="NAME" columntype="TEXT" name="name" fieldType="TEXTFIELD" tableName="MESBASIC_ROUTINES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										路径名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_routine_Routine" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="adv_name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign srouceEqp_name_defaultValue  = ''>
									<#assign srouceEqp_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_routine_routine_routineRef_adv_queryForm" code="MESBasic_1_equipManage_Equipment_name" showFormat="SELECTCOMP" defaultValue=srouceEqp_name_defaultValue  divCode="MESBasic_1_equipManage_Equipment_name_srouceEqp_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_equipManage_Equipment" layRec="EAM_BASEINFO,EAM_ID,MESBASIC_ROUTINES,SROUCE_EQP-name" columnname="EAM_NAME" columntype="TEXT" name="srouceEqp.name" fieldType="SELECTCOMP" tableName="EAM_BASEINFO"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										源设备
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_equipManage_Equipment" />
										<input type="hidden" id="adv_srouceEqp.id" name="srouceEqp.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_srouceEqp.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${srouceEqp_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1423967959681')}"  conditionfunc="MESBasic.routine.routine.routineRef._querycustomFunc('srouceEqp_name')" name="srouceEqp.name" id="adv_ec_MESBasic_routine_routine_routineRef_queryForm_srouceEqp_name" displayFieldName="name" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/equipManage/equipment/ref.action"   refViewCode="MESBasic_1_equipManage_ref"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_routine_routine_routineRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign destEqp_name_defaultValue  = ''>
									<#assign destEqp_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_routine_routine_routineRef_adv_queryForm" code="MESBasic_1_equipManage_Equipment_name" showFormat="SELECTCOMP" defaultValue=destEqp_name_defaultValue  divCode="MESBasic_1_equipManage_Equipment_name_destEqp_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_equipManage_Equipment" layRec="EAM_BASEINFO,EAM_ID,MESBASIC_ROUTINES,DEST_EQP-name" columnname="EAM_NAME" columntype="TEXT" name="destEqp.name" fieldType="SELECTCOMP" tableName="EAM_BASEINFO"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										目的设备
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_equipManage_Equipment" />
										<input type="hidden" id="adv_destEqp.id" name="destEqp.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_destEqp.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${destEqp_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1423967959681')}"  conditionfunc="MESBasic.routine.routine.routineRef._querycustomFunc('destEqp_name')" name="destEqp.name" id="adv_ec_MESBasic_routine_routine_routineRef_queryForm_destEqp_name" displayFieldName="name" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/equipManage/equipment/ref.action"   refViewCode="MESBasic_1_equipManage_ref"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_routine_routine_routineRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign product_productName_defaultValue  = ''>
									<#assign product_productName_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_routine_routine_routineRef_adv_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=product_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_product_productName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,MESBASIC_ROUTINES,PRODUCT-productName" columnname="PRODUCT_NAME" columntype="TEXT" name="product.productName" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物品名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_product.id" name="product.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_product.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${product_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  conditionfunc="MESBasic.routine.routine.routineRef._querycustomFunc('product_productName')" name="product.productName" id="adv_ec_MESBasic_routine_routine_routineRef_queryForm_product_productName" displayFieldName="productName" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/refProductLayout.action"   refViewCode="MESBasic_1_product_refProductLayout"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_routine_routine_routineRef_adv_queryForm"   />
								
                                	
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
			viewCode: 'MESBasic_1_routine_routineRef',
			modelCode: 'MESBasic_1_routine_Routine',
			modelName: 'Routine',
			formId: 'ec_MESBasic_routine_routine_routineRef_queryForm',
			olddiv: 'MESBasic.routine.routine.routineRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.routine.routine.routineRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_routine_routineRef'+"&entity.code="+'MESBasic_1_routine';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.routine.routine.routineRef.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.routine.routine.routineRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.routine.routine.routineRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_routine_routineRef'+"&entity.code="+'MESBasic_1_routine';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.routine.routine.routineRef.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.routine.routine.routineRef.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.routine.routine.routineRef.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.routine.routine.routineRef.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.routine.routine.routineRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.routine.routine.routineRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.routine.routine.routineRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.routine.routine.routineRef.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.routine.routine.routineRef.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.routine.routine.routineRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.routine.routine.routineRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.routine.routine.routineRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.routine.routine.routineRef.query('query')">
<#assign datatable_dataUrl = "/MESBasic/routine/routine/routineRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_MESBasic_routine_routine_routineRef_query" renderOverEvent="ec_MESBasic_routine_routine_routineRef_RenderOverEvent" pageInitMethod="ec_MESBasic_routine_routine_routineRef_PageInitMethod" modelCode="MESBasic_1_routine_Routine" noPermissionKeys="code,name,srouceEqp.name,srouceEqpObj.equipmentNum,destEqp.name,destEquObj.equipmentNum,product.productName,density,routineStrategy" hidekeyPrefix="ec_MESBasic_routine_routine_routineRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_routine_routine_routineRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="MESBasic.routine.routine.routineRef.sendBackroutineRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','routineStrategy.id','srouceEqp.id','srouceEqpObj.id','destEqp.id','destEquObj.id','product.id','code','name']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="MESBasic.routine.routine.routineRef.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}routineRef_routineNew_add_MESBasic_1_routine_routineRef||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1423730541699')}||iconcls:add||useInMore:false||onclick:
				MESBasic.routine.routine.routineRef.addroutineRef()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_routine_routineRef_BUTTON_routineNew"
		buttonType="ADD" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}routineRef_routineNew_add_MESBasic_1_routine_routineRef||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1423730541699')}||iconcls:add||useInMore:false||onclick:
				MESBasic.routine.routine.routineRef.addroutineRef()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}routineRef_routineEdit_modify_MESBasic_1_routine_routineRef||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1423705335643')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.routine.routine.routineRef.modifyroutineRef()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_routine_routineRef_BUTTON_routineEdit"
		buttonType="MODIFY" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}routineRef_routineEdit_modify_MESBasic_1_routine_routineRef||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1423705335643')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.routine.routine.routineRef.modifyroutineRef()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}routineRef_routineDel_del_MESBasic_1_routine_routineRef||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1415339022331')}||iconcls:del||useInMore:false||onclick:
				MESBasic.routine.routine.routineRef.delroutineRef()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_routine_routineRef_BUTTON_routineDel"
		buttonType="DELETE" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}routineRef_routineDel_del_MESBasic_1_routine_routineRef||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1415339022331')}||iconcls:del||useInMore:false||onclick:
				MESBasic.routine.routine.routineRef.delroutineRef()
		" 
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('MESBasic.propertydisplayName.radion1415336575756')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('MESBasic.propertydisplayName.radion1415336597801')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign srouceEqp_name_displayDefaultType  = ''>
			<@datacolumn columnName="EAM_NAME"    showFormat="TEXT" defaultDisplay="${srouceEqp_name_displayDefaultType!}"  key="srouceEqp.name"  hiddenCol=true label="${getText('MESBasic.propertydisplayName.randon1427442213645')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign srouceEqpObj_equipmentNum_displayDefaultType  = ''>
			<@datacolumn columnName="EQUIPMENT_NUM"    showFormat="TEXT" defaultDisplay="${srouceEqpObj_equipmentNum_displayDefaultType!}"  key="srouceEqpObj.equipmentNum"   label="${getText('MESBasic.201904081033001')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign destEqp_name_displayDefaultType  = ''>
			<@datacolumn columnName="EAM_NAME"    showFormat="TEXT" defaultDisplay="${destEqp_name_displayDefaultType!}"  key="destEqp.name"  hiddenCol=true label="${getText('MESBasic.propertydisplayName.randon1427442234442')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign destEquObj_equipmentNum_displayDefaultType  = ''>
			<@datacolumn columnName="EQUIPMENT_NUM"    showFormat="TEXT" defaultDisplay="${destEquObj_equipmentNum_displayDefaultType!}"  key="destEquObj.equipmentNum"   label="${getText('MESBasic.201904081033002')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign product_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${product_productName_displayDefaultType!}"  key="product.productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="left"  width=120   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign density_displayDefaultType  = ''>
			<@datacolumn columnName="DENSITY"    showFormat="TEXT" defaultDisplay="${density_displayDefaultType!}"  key="density"   label="${getText('MESBasic.propertydisplayName.randon1423898372445')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign routineStrategy_displayDefaultType  = ''>
			<@datacolumn columnName="ROUTINE_STRATEGY"    showFormat="SELECTCOMP" defaultDisplay="${routineStrategy_displayDefaultType!}"  key="routineStrategy.value"  hiddenCol=true label="${getText('MESBasic.propertydisplayName.radion1415337689809')}" textalign="left"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_routine_routine_routineRef_RenderOverEvent(){
}
function ec_MESBasic_routine_routine_routineRef_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
</script>