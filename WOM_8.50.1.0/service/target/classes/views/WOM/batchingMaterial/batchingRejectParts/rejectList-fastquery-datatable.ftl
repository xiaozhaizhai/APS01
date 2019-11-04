	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1491789700218')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm" exportUrl="/WOM/batchingMaterial/batchingRejectParts/rejectList-query.action">
		<input type="hidden" id="MESBasic_1_storeSet_StoreSet" value="store" bak_value="store"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1543236237180')}_${getText('WOM.viewtitle.randon1543469074398')}.xls" />
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
		<div id="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_batchingMaterial_rejectList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_batchingMaterial_rejectList" formId="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm" dataTableId="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm" isExpandAll=true formId="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm" idprefix="ec_WOM_batchingMaterial_batchingRejectParts_rejectList" expandType="all"  fieldcodes="MESBasic_1_product_Product_productName_rejectProduct_productName:WOM.201811291342||WOM_7.5.0.0_batchingMaterial_BatchingRejectParts_batchNum_batchNum:WOM.propertydisplayName.randon1543236260606||WOM_7.5.0.0_batchingMaterial_BatchingRejectParts_productBatchNum_productBatchNum:WOM.propertydisplayName.randon1543236355408||base_staff_name_rejectExeStaff_name:WOM.201811291343001||WOM_7.5.0.0_materialReject_RejectReason_rejectReson_rejectReasonId_rejectReson:WOM.propertydisplayName.randon1543218783588||WOM_7.5.0.0_batchingMaterial_BatchingRejectParts_rejectTime_rejectTime:WOM.propertydisplayName.randon1543392762311||WOM_7.5.0.0_batchingMaterial_BatchingRejectParts_isReceived_isReceived:WOM.propertydisplayName.randon1543236313796" > 
							<#assign rejectProduct_productName_defaultValue  = ''>
									<#assign rejectProduct_productName_defaultValue  = ''>
							<@queryfield formId="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=rejectProduct_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_rejectProduct_productName" isCustomize=true style="" > 
										<input type="hidden" id="rejectProduct.id" name="rejectProduct.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${rejectProduct_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  conditionfunc="WOM.batchingMaterial.batchingRejectParts.rejectList._querycustomFunc('rejectProduct_productName')" name="rejectProduct.productName" id="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm_rejectProduct_productName" displayFieldName="productName" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/refProductLayout.action"   refViewCode="MESBasic_1_product_refProductLayout"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm" searchClick="WOM.batchingMaterial.batchingRejectParts.rejectList.commonQuery('query')"   />
							</@queryfield>
							<#assign batchNum_defaultValue  = ''>
									<#assign batchNum_defaultValue  = ''>
							<@queryfield formId="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm" code="WOM_7.5.0.0_batchingMaterial_BatchingRejectParts_batchNum" showFormat="TEXT" defaultValue=batchNum_defaultValue  divCode="WOM_7.5.0.0_batchingMaterial_BatchingRejectParts_batchNum_batchNum" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="batchNum" id="batchNum" value="${batchNum_defaultValue!}" deValue="${batchNum_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign productBatchNum_defaultValue  = ''>
									<#assign productBatchNum_defaultValue  = ''>
							<@queryfield formId="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm" code="WOM_7.5.0.0_batchingMaterial_BatchingRejectParts_productBatchNum" showFormat="TEXT" defaultValue=productBatchNum_defaultValue  divCode="WOM_7.5.0.0_batchingMaterial_BatchingRejectParts_productBatchNum_productBatchNum" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="productBatchNum" id="productBatchNum" value="${productBatchNum_defaultValue!}" deValue="${productBatchNum_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign rejectExeStaff_name_defaultValue  = ''>
									<#assign rejectExeStaff_name_defaultValue  = ''>
							<@queryfield formId="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm" code="base_staff_name" showFormat="SELECTCOMP" defaultValue=rejectExeStaff_name_defaultValue  divCode="base_staff_name_rejectExeStaff_name" isCustomize=true style="" > 
										<input type="hidden" id="rejectExeStaff.id" name="rejectExeStaff.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${rejectExeStaff_name_defaultValue!}" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.batchingMaterial.batchingRejectParts.rejectList._querycustomFunc('rejectExeStaff_name')" name="rejectExeStaff.name" id="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm_rejectExeStaff_name" displayFieldName="name" type="Staff" exp="like" classStyle="cui-noborder-input" url="/foundation/staff/common/staffListFrameset.action"   refViewCode="sysbase_1.0_staff_ref"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm" searchClick="WOM.batchingMaterial.batchingRejectParts.rejectList.commonQuery('query')"   />
							</@queryfield>
							<#assign rejectReasonId_rejectReson_defaultValue  = ''>
									<#assign rejectReasonId_rejectReson_defaultValue  = ''>
							<@queryfield formId="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm" code="WOM_7.5.0.0_materialReject_RejectReason_rejectReson" showFormat="SELECTCOMP" defaultValue=rejectReasonId_rejectReson_defaultValue  divCode="WOM_7.5.0.0_materialReject_RejectReason_rejectReson_rejectReasonId_rejectReson" isCustomize=true style="" > 
										<input type="hidden" id="rejectReasonId.id" name="rejectReasonId.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${rejectReasonId_rejectReson_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1543219942185')}"  conditionfunc="WOM.batchingMaterial.batchingRejectParts.rejectList._querycustomFunc('rejectReasonId_rejectReson')" name="rejectReasonId.rejectReson" id="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm_rejectReasonId_rejectReson" displayFieldName="rejectReson" type="other" exp="like" classStyle="cui-noborder-input" url="/WOM/materialReject/rejectReason/rejectReasonRef.action"   refViewCode="WOM_7.5.0.0_materialReject_rejectReasonRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm" searchClick="WOM.batchingMaterial.batchingRejectParts.rejectList.commonQuery('query')"   />
							</@queryfield>
							<#assign rejectTime_defaultValue  = ''>
									<#assign rejectTime_defaultValue  = ''>
								<#if (rejectTime_defaultValue)?? &&(rejectTime_defaultValue)?has_content>
									<#assign rejectTime_defaultValue  = getDefaultDateTime(rejectTime_defaultValue!)?datetime>
								</#if>
							<@queryfield formId="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm" code="WOM_7.5.0.0_batchingMaterial_BatchingRejectParts_rejectTime" showFormat="YMD_HMS" defaultValue=rejectTime_defaultValue  divCode="WOM_7.5.0.0_batchingMaterial_BatchingRejectParts_rejectTime_rejectTime" isCustomize=true style="" > 
								<div>
							  	 	<div style="float:left;width:45%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="rejectTime_start" id="rejectTime_start" exp="gequal"   formid="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm" />
									</div>
									<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
							  	 	<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="rejectTime_end" id="rejectTime_end" exp="lequal"   formid="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm" />
							  		</div>
						  		</div>
							</@queryfield>
							<#assign isReceived_defaultValue  = ''>
									<#assign isReceived_defaultValue  = ''>
							<@queryfield formId="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm" code="WOM_7.5.0.0_batchingMaterial_BatchingRejectParts_isReceived" showFormat="SELECT" defaultValue=isReceived_defaultValue  divCode="WOM_7.5.0.0_batchingMaterial_BatchingRejectParts_isReceived_isReceived" isCustomize=true style="" > 
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${isReceived_defaultValue!}" name="isReceived" id="isReceived" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (isReceived_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (isReceived_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm" type="adv" onclick="WOM.batchingMaterial.batchingRejectParts.rejectList.commonQuery('query')" onadvancedclick="advQuery('WOM.batchingMaterial.batchingRejectParts.rejectList.advquery')" /> 
						 		<@querybutton formId="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info={};
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["MainTableName"]="WOM_BATCHING_REJECT_PARTS";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["rejectProduct.productName"]={};
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["rejectProduct.productName"].dbColumnType="TEXT";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["rejectProduct.productName"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_BATCHING_REJECT_PARTS,REJECT_PRODUCT-productName";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["rejectProduct.productName"].columnName="PRODUCT_NAME";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["rejectProduct.id"]={};
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["rejectProduct.id"].dbColumnType="LONG";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["rejectProduct.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_BATCHING_REJECT_PARTS,REJECT_PRODUCT-productName";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["rejectProduct.id"].columnName="PRODUCT_ID";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["batchNum"]={};
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["batchNum"].dbColumnType="TEXT";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["batchNum"].layRec="batchNum";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["batchNum"].columnName="BATCH_NUM";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["productBatchNum"]={};
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["productBatchNum"].dbColumnType="TEXT";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["productBatchNum"].layRec="productBatchNum";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["productBatchNum"].columnName="PRODUCT_BATCH_NUM";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["rejectExeStaff.name"]={};
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["rejectExeStaff.name"].dbColumnType="TEXT";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["rejectExeStaff.name"].layRec="base_staff,ID,WOM_BATCHING_REJECT_PARTS,REJECT_EXE_STAFF-name";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["rejectExeStaff.name"].columnName="NAME";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["rejectExeStaff.id"]={};
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["rejectExeStaff.id"].dbColumnType="LONG";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["rejectExeStaff.id"].layRec="base_staff,ID,WOM_BATCHING_REJECT_PARTS,REJECT_EXE_STAFF-name";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["rejectExeStaff.id"].columnName="ID";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["rejectReasonId.rejectReson"]={};
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["rejectReasonId.rejectReson"].dbColumnType="TEXT";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["rejectReasonId.rejectReson"].layRec="WOM_REJECT_REASONS,ID,WOM_BATCHING_REJECT_PARTS,REJECT_REASON_ID-rejectReson";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["rejectReasonId.rejectReson"].columnName="REJECT_RESON";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["rejectReasonId.id"]={};
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["rejectReasonId.id"].dbColumnType="LONG";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["rejectReasonId.id"].layRec="WOM_REJECT_REASONS,ID,WOM_BATCHING_REJECT_PARTS,REJECT_REASON_ID-rejectReson";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["rejectReasonId.id"].columnName="ID";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["rejectTime"]={};
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["rejectTime"].dbColumnType="DATETIME";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["rejectTime"].layRec="rejectTime";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["rejectTime"].columnName="REJECT_TIME";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["isReceived"]={};
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["isReceived"].dbColumnType="BOOLEAN";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["isReceived"].layRec="isReceived";
ec_WOM_batchingMaterial_batchingRejectParts_rejectList_quickquery_info["isReceived"].columnName="IS_RECEIVED";
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
 	var advRemainDialog = $('[id="WOM.batchingMaterial.batchingRejectParts.rejectList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.batchingMaterial.batchingRejectParts.rejectList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_adv_queryForm" exportUrl="/WOM/batchingMaterial/batchingRejectParts/rejectList-query.action">
							<#assign rejectProduct_productName_defaultValue  = ''>
									<#assign rejectProduct_productName_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_adv_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=rejectProduct_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_rejectProduct_productName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_BATCHING_REJECT_PARTS,REJECT_PRODUCT-productName" columnname="PRODUCT_NAME" columntype="TEXT" name="rejectProduct.productName" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物品
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_rejectProduct.id" name="rejectProduct.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_rejectProduct.id"  isPrecise=true deValue="${rejectProduct_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  conditionfunc="WOM.batchingMaterial.batchingRejectParts.rejectList._querycustomFunc('rejectProduct_productName')" name="rejectProduct.productName" id="adv_ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm_rejectProduct_productName" displayFieldName="productName" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/refProductLayout.action"   refViewCode="MESBasic_1_product_refProductLayout"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign batchNum_defaultValue  = ''>
									<#assign batchNum_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_adv_queryForm" code="WOM_7.5.0.0_batchingMaterial_BatchingRejectParts_batchNum" showFormat="TEXT" defaultValue=batchNum_defaultValue  divCode="WOM_7.5.0.0_batchingMaterial_BatchingRejectParts_batchNum_batchNum" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_batchingMaterial_BatchingRejectParts" layRec="batchNum" columnname="BATCH_NUM" columntype="TEXT" name="batchNum" fieldType="TEXTFIELD" tableName="WOM_BATCHING_REJECT_PARTS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										生产批号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_batchingMaterial_BatchingRejectParts" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="batchNum" id="adv_batchNum" value="${batchNum_defaultValue!}" deValue="${batchNum_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign productBatchNum_defaultValue  = ''>
									<#assign productBatchNum_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_adv_queryForm" code="WOM_7.5.0.0_batchingMaterial_BatchingRejectParts_productBatchNum" showFormat="TEXT" defaultValue=productBatchNum_defaultValue  divCode="WOM_7.5.0.0_batchingMaterial_BatchingRejectParts_productBatchNum_productBatchNum" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_batchingMaterial_BatchingRejectParts" layRec="productBatchNum" columnname="PRODUCT_BATCH_NUM" columntype="TEXT" name="productBatchNum" fieldType="TEXTFIELD" tableName="WOM_BATCHING_REJECT_PARTS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物料批号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_batchingMaterial_BatchingRejectParts" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="productBatchNum" id="adv_productBatchNum" value="${productBatchNum_defaultValue!}" deValue="${productBatchNum_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign rejectExeStaff_name_defaultValue  = ''>
									<#assign rejectExeStaff_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_adv_queryForm" code="base_staff_name" showFormat="SELECTCOMP" defaultValue=rejectExeStaff_name_defaultValue  divCode="base_staff_name_rejectExeStaff_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="sysbase_1.0_staff_base_staff" layRec="base_staff,ID,WOM_BATCHING_REJECT_PARTS,REJECT_EXE_STAFF-name" columnname="NAME" columntype="TEXT" name="rejectExeStaff.name" fieldType="SELECTCOMP" tableName="base_staff"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										退料操作人
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="sysbase_1.0_staff_base_staff" />
										<input type="hidden" id="adv_rejectExeStaff.id" name="rejectExeStaff.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_rejectExeStaff.id"  isPrecise=true deValue="${rejectExeStaff_name_defaultValue!}" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.batchingMaterial.batchingRejectParts.rejectList._querycustomFunc('rejectExeStaff_name')" name="rejectExeStaff.name" id="adv_ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm_rejectExeStaff_name" displayFieldName="name" type="Staff" exp="like"  classStyle="cui-noborder-input" url="/foundation/staff/common/staffListFrameset.action"   refViewCode="sysbase_1.0_staff_ref"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign rejectReasonId_rejectReson_defaultValue  = ''>
									<#assign rejectReasonId_rejectReson_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_adv_queryForm" code="WOM_7.5.0.0_materialReject_RejectReason_rejectReson" showFormat="SELECTCOMP" defaultValue=rejectReasonId_rejectReson_defaultValue  divCode="WOM_7.5.0.0_materialReject_RejectReason_rejectReson_rejectReasonId_rejectReson" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_materialReject_RejectReason" layRec="WOM_REJECT_REASONS,ID,WOM_BATCHING_REJECT_PARTS,REJECT_REASON_ID-rejectReson" columnname="REJECT_RESON" columntype="TEXT" name="rejectReasonId.rejectReson" fieldType="SELECTCOMP" tableName="WOM_REJECT_REASONS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										退料原因
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_materialReject_RejectReason" />
										<input type="hidden" id="adv_rejectReasonId.id" name="rejectReasonId.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_rejectReasonId.id"  isPrecise=true deValue="${rejectReasonId_rejectReson_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1543219942185')}"  conditionfunc="WOM.batchingMaterial.batchingRejectParts.rejectList._querycustomFunc('rejectReasonId_rejectReson')" name="rejectReasonId.rejectReson" id="adv_ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm_rejectReasonId_rejectReson" displayFieldName="rejectReson" type="other" exp="like"  classStyle="cui-noborder-input" url="/WOM/materialReject/rejectReason/rejectReasonRef.action"   refViewCode="WOM_7.5.0.0_materialReject_rejectReasonRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign rejectTime_defaultValue  = ''>
									<#assign rejectTime_defaultValue  = ''>
								<#if (rejectTime_defaultValue)?? &&(rejectTime_defaultValue)?has_content>
									<#assign rejectTime_defaultValue  = getDefaultDateTime(rejectTime_defaultValue!)?datetime>
								</#if>
								<@advsqueryfield formId="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_adv_queryForm" code="WOM_7.5.0.0_batchingMaterial_BatchingRejectParts_rejectTime" showFormat="YMD_HMS" defaultValue=rejectTime_defaultValue  divCode="WOM_7.5.0.0_batchingMaterial_BatchingRejectParts_rejectTime_rejectTime" isCustomize=true > 
								
								<div class="quick_query_node" style="width:98%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_batchingMaterial_BatchingRejectParts" layRec="rejectTime" columnname="REJECT_TIME" columntype="DATETIME" name="rejectTime" fieldType="DATETIME" showFormat="YMD_HMS" tableName="WOM_BATCHING_REJECT_PARTS"/>
								<label class="quick_query_labeltime advQuery_label" style="text-align:right;float:left;width:14%;height:28px;line-height:28px">
								<span class="quick_query_text">
										退料时间
								</span>
								</label>
							<div class="quick_query_contenttime advQuery_content" style="float:left;width:86%">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_batchingMaterial_BatchingRejectParts" />
								<div>
							  	 	<div style="float:left;width:41.8%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${rejectTime_defaultValue!}" deValue="${rejectTime_defaultValue!}"  name="rejectTime_start" id="adv_rejectTime_start" exp="gequal"    formid="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_adv_queryForm" />
									</div>
									<div style="float:left;width:16.3%;text-align:center;line-height: 26px;"> - - ${getText('common.date.split')} - - </div>
							  	 	<div style="float:left;width:41.8%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${rejectTime_defaultValue!}" deValue="${rejectTime_defaultValue!}"  name="rejectTime_end" id="adv_rejectTime_end" exp="lequal"    formid="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_adv_queryForm" />
							  		</div>
						  		</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign isReceived_defaultValue  = ''>
									<#assign isReceived_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_adv_queryForm" code="WOM_7.5.0.0_batchingMaterial_BatchingRejectParts_isReceived" showFormat="SELECT" defaultValue=isReceived_defaultValue  divCode="WOM_7.5.0.0_batchingMaterial_BatchingRejectParts_isReceived_isReceived" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_batchingMaterial_BatchingRejectParts" layRec="isReceived" columnname="IS_RECEIVED" columntype="BOOLEAN" name="isReceived" fieldType="SELECT" tableName="WOM_BATCHING_REJECT_PARTS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										是否签收
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_batchingMaterial_BatchingRejectParts" />
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${isReceived_defaultValue!}" name="isReceived" id="adv_isReceived" exp="equal"   value=""> 
											<option value=""></option>
											<option value="1" <#if (isReceived_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (isReceived_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
								
                                	
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
			viewCode: 'WOM_7.5.0.0_batchingMaterial_rejectList',
			modelCode: 'WOM_7.5.0.0_batchingMaterial_BatchingRejectParts',
			modelName: 'BatchingRejectParts',
			formId: 'ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm',
			olddiv: 'WOM.batchingMaterial.batchingRejectParts.rejectList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.batchingMaterial.batchingRejectParts.rejectList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_batchingMaterial_rejectList'+"&entity.code="+'WOM_7.5.0.0_batchingMaterial';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.batchingMaterial.batchingRejectParts.rejectList.advquery'] #customquContent").html(html);
		 	$("[id='WOM.batchingMaterial.batchingRejectParts.rejectList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.batchingMaterial.batchingRejectParts.rejectList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_batchingMaterial_rejectList'+"&entity.code="+'WOM_7.5.0.0_batchingMaterial';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.batchingMaterial.batchingRejectParts.rejectList.advquery'] #customquContent").html(html);
			 $("[id='WOM.batchingMaterial.batchingRejectParts.rejectList.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.batchingMaterial.batchingRejectParts.rejectList.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.batchingMaterial.batchingRejectParts.rejectList.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.batchingMaterial.batchingRejectParts.rejectList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.batchingMaterial.batchingRejectParts.rejectList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.batchingMaterial.batchingRejectParts.rejectList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.batchingMaterial.batchingRejectParts.rejectList.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.batchingMaterial.batchingRejectParts.rejectList.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.batchingMaterial.batchingRejectParts.rejectList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.batchingMaterial.batchingRejectParts.rejectList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.batchingMaterial.batchingRejectParts.rejectList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.batchingMaterial.batchingRejectParts.rejectList.query('query')">
<#assign datatable_dataUrl = "/WOM/batchingMaterial/batchingRejectParts/rejectList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.batchingMaterial.batchingRejectParts.rejectList.query('query')">
<#assign datatable_dataUrl = "/WOM/batchingMaterial/batchingRejectParts/rejectList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_query" renderOverEvent="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_RenderOverEvent" pageInitMethod="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_PageInitMethod" modelCode="WOM_7.5.0.0_batchingMaterial_BatchingRejectParts" noPermissionKeys="batchingId.tableNo,produceTaskId.tableNo,batchNum,produceTaskId.factoryId.name,produceTaskId.productId.productName,rejectProduct.productCode,rejectProduct.productName,productBatchNum,rejectNum,rejectReasonId.rejectReson,ware.wareCode,ware.wareName,ware.cargoStatue,store.placeSetCode,store.placeSetName,rejectExeStaff.name,rejectTime,isReceived,rejectReceiveStaff.name,receiveDate,batchingPartId.state" hidekeyPrefix="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_batchingMaterial_batchingRejectParts_rejectList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="WOM.batchingMaterial.batchingRejectParts.rejectList.dbClickViewrejectList" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','tableInfoId','ware.cargoStatue.id','batchingPartId.state.id','batchingId.id','produceTaskId.id','produceTaskId.factoryId.id','produceTaskId.productId.id','rejectProduct.id','rejectReasonId.id','ware.id','store.id','rejectExeStaff.id','rejectReceiveStaff.id','batchingPartId.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="WOM.batchingMaterial.batchingRejectParts.rejectList.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}rejectList_rejectMaterialRecive_modify_WOM_7.5.0.0_batchingMaterial_rejectList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1543471782546')}||iconcls:modify||useInMore:false||onclick:
					openRejectRecordEdit()
		" 
		resultType="json" 
		buttonCode="WOM_7.5.0.0_batchingMaterial_rejectList_BUTTON_rejectMaterialRecive"
		buttonType="CUSTOM" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}rejectList_rejectMaterialRecive_modify_WOM_7.5.0.0_batchingMaterial_rejectList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1543471782546')}||iconcls:modify||useInMore:false||onclick:
					openRejectRecordEdit()
		" 
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign batchingId_tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${batchingId_tableNo_displayDefaultType!}"  key="batchingId.tableNo"   label="${getText('WOM.201811291406')}" textalign="left"  width=210   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign produceTaskId_tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${produceTaskId_tableNo_displayDefaultType!}"  key="produceTaskId.tableNo"   label="${getText('WOM.201811291328001')}" textalign="left"  width=210   type="textfield"    click="function(cell){WOM.batchingMaterial.batchingRejectParts.rejectList.showLinkView('/WOM/produceTask/produceTask/makeTaskView.action?${getPowerCode('','WOM_7.5.0.0_produceTask_makeTaskView')}','produceTaskId.id',cell)}" showFormatFunc="" cssstyle="" />
			<#assign batchNum_displayDefaultType  = ''>
			<@datacolumn columnName="BATCH_NUM"    showFormat="TEXT" defaultDisplay="${batchNum_displayDefaultType!}"  key="batchNum"   label="${getText('WOM.propertydisplayName.randon1543236260606')}" textalign="left"  width=160   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign produceTaskId_factoryId_name_displayDefaultType  = ''>
			<@datacolumn columnName="NODENAME"    showFormat="TEXT" defaultDisplay="${produceTaskId_factoryId_name_displayDefaultType!}"  key="produceTaskId.factoryId.name"   label="${getText('WOM.201811291328')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign produceTaskId_productId_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${produceTaskId_productId_productName_displayDefaultType!}"  key="produceTaskId.productId.productName"   label="${getText('WOM.201811291330')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign rejectProduct_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${rejectProduct_productCode_displayDefaultType!}"  key="rejectProduct.productCode"   label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign rejectProduct_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${rejectProduct_productName_displayDefaultType!}"  key="rejectProduct.productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productBatchNum_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_BATCH_NUM"    showFormat="TEXT" defaultDisplay="${productBatchNum_displayDefaultType!}"  key="productBatchNum"   label="${getText('WOM.propertydisplayName.randon1543236355408')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign rejectNum_displayDefaultType  = ''>
			<@datacolumn columnName="REJECT_NUM"    showFormat="TEXT" defaultDisplay="${rejectNum_displayDefaultType!}"  key="rejectNum"   label="${getText('WOM.propertydisplayName.randon1543236406431')}" textalign="right" decimal="6" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign rejectReasonId_rejectReson_displayDefaultType  = ''>
			<@datacolumn columnName="REJECT_RESON"    showFormat="TEXT" defaultDisplay="${rejectReasonId_rejectReson_displayDefaultType!}"  key="rejectReasonId.rejectReson"   label="${getText('WOM.propertydisplayName.randon1543218783588')}" textalign="left"  width=150   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign ware_wareCode_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_CODE"    showFormat="TEXT" defaultDisplay="${ware_wareCode_displayDefaultType!}"  key="ware.wareCode"   label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign ware_wareName_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_NAME"    showFormat="TEXT" defaultDisplay="${ware_wareName_displayDefaultType!}"  key="ware.wareName"   label="${getText('MESBasic.propertydisplayName.randon1484031316281')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign ware_cargoStatue_displayDefaultType  = ''>
			<@datacolumn columnName="CARGO_STATUE"    showFormat="SELECTCOMP" defaultDisplay="${ware_cargoStatue_displayDefaultType!}"  key="ware.cargoStatue.value"   label="${getText('MESBasic.propertydisplayName.randon1484031944240')}" textalign="center"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign store_placeSetCode_displayDefaultType  = ''>
			<@datacolumn columnName="PLACE_SET_CODE"    showFormat="TEXT" defaultDisplay="${store_placeSetCode_displayDefaultType!}"  key="store.placeSetCode"   label="${getText('MESBasic.propertydisplayName.randon1489731651449')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign store_placeSetName_displayDefaultType  = ''>
			<@datacolumn columnName="PLACE_SET_NAME"    showFormat="TEXT" defaultDisplay="${store_placeSetName_displayDefaultType!}"  key="store.placeSetName"   label="${getText('MESBasic.propertydisplayName.randon1489731677162')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign rejectExeStaff_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${rejectExeStaff_name_displayDefaultType!}"  key="rejectExeStaff.name"   label="${getText('WOM.201811291408')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign rejectTime_displayDefaultType  = ''>
			<@datacolumn columnName="REJECT_TIME"    showFormat="YMD_HMS" defaultDisplay="${rejectTime_displayDefaultType!}"  key="rejectTime"   label="${getText('WOM.propertydisplayName.randon1543392762311')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign isReceived_displayDefaultType  = ''>
			<@datacolumn columnName="IS_RECEIVED"    showFormat="SELECT" defaultDisplay="${isReceived_displayDefaultType!}"  key="isReceived"   label="${getText('WOM.propertydisplayName.randon1543236313796')}" textalign="center"  width=60   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign rejectReceiveStaff_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${rejectReceiveStaff_name_displayDefaultType!}"  key="rejectReceiveStaff.name"   label="${getText('WOM.201811291408')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign receiveDate_displayDefaultType  = ''>
			<@datacolumn columnName="RECEIVE_DATE"    showFormat="YMD_HMS" defaultDisplay="${receiveDate_displayDefaultType!}"  key="receiveDate"   label="${getText('WOM.propertydisplayName.randon1543236378702')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign batchingPartId_state_displayDefaultType  = ''>
			<@datacolumn columnName="STATE"    showFormat="SELECTCOMP" defaultDisplay="${batchingPartId_state_displayDefaultType!}"  key="batchingPartId.state.value"  hiddenCol=true label="${getText('WOM.propertydisplayName.randon1491790699395')}" textalign="center"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_batchingMaterial_batchingRejectParts_rejectList_RenderOverEvent(){
}
function ec_WOM_batchingMaterial_batchingRejectParts_rejectList_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>