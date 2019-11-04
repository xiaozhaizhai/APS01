	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1489657790851')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_produceTask_materialBatchNums_batchNumRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_produceTask_materialBatchNums_batchNumRef_queryForm" exportUrl="/WOM/produceTask/materialBatchNums/batchNumRef-query.action">
		<input type="hidden" id="MESBasic_1_factoryModel_FactoryModel" value="factoryId" />
		<input type="hidden" reset="false" name="WOM_produceTask_materialBatchNums_batchNumRef_condition" id="WOM_produceTask_materialBatchNums_batchNumRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1490066410355')}_${getText('WOM.viewtitle.randon1490617459650')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<input type="hidden" id="currentSqlType"  value="5" />
		<div id="ec_WOM_produceTask_materialBatchNums_batchNumRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_produceTask_materialBatchNums_batchNumRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_produceTask_batchNumRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_produceTask_batchNumRef" formId="ec_WOM_produceTask_materialBatchNums_batchNumRef_queryForm" dataTableId="ec_WOM_produceTask_materialBatchNums_batchNumRef_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_produceTask_materialBatchNums_batchNumRef_queryForm" isExpandAll=true formId="ec_WOM_produceTask_materialBatchNums_batchNumRef_queryForm" idprefix="ec_WOM_produceTask_materialBatchNums_batchNumRef" expandType="all"  fieldcodes="MESBasic_1_product_Product_productCode_productId_productCode:WOM.propertydisplayName.radion14157726448331||WOM_7.5.0.0_produceTask_MaterialBatchNums_proNum_proNum:WOM.propertydisplayName.randon1490617192684" > 
							<#assign productId_productCode_defaultValue  = ''>
									<#assign productId_productCode_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_materialBatchNums_batchNumRef_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=productId_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_productId_productCode" isCustomize=true > 
										<input type="hidden" id="productId.id" name="productId.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${productId_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="WOM.produceTask.materialBatchNums.batchNumRef._querycustomFunc('productId_productCode')" name="productId.productCode" id="ec_WOM_produceTask_materialBatchNums_batchNumRef_queryForm_productId_productCode" displayFieldName="productCode" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/productRefNew.action"   refViewCode="MESBasic_1_product_productRefNew"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_produceTask_materialBatchNums_batchNumRef_queryForm" searchClick="WOM.produceTask.materialBatchNums.batchNumRef.commonQuery('query')"  />
							</@queryfield>
							<#assign proNum_defaultValue  = ''>
									<#assign proNum_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_materialBatchNums_batchNumRef_queryForm" code="WOM_7.5.0.0_produceTask_MaterialBatchNums_proNum" showFormat="TEXT" defaultValue=proNum_defaultValue  divCode="WOM_7.5.0.0_produceTask_MaterialBatchNums_proNum_proNum" isCustomize=true > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="proNum" id="proNum" value="${proNum_defaultValue!}" deValue="${proNum_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_produceTask_materialBatchNums_batchNumRef_queryForm" type="search" onclick="WOM.produceTask.materialBatchNums.batchNumRef.commonQuery('query')" /> 
						 		<@querybutton formId="ec_WOM_produceTask_materialBatchNums_batchNumRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_produceTask_materialBatchNums_batchNumRef_quickquery_info={};
ec_WOM_produceTask_materialBatchNums_batchNumRef_quickquery_info["MainTableName"]="WOM_MATERIAL_BATCH_NUMS";
ec_WOM_produceTask_materialBatchNums_batchNumRef_quickquery_info["productId.productCode"]={};
ec_WOM_produceTask_materialBatchNums_batchNumRef_quickquery_info["productId.productCode"].dbColumnType="TEXT";
ec_WOM_produceTask_materialBatchNums_batchNumRef_quickquery_info["productId.productCode"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_MATERIAL_BATCH_NUMS,PRODUCT_ID-productCode";
ec_WOM_produceTask_materialBatchNums_batchNumRef_quickquery_info["productId.productCode"].columnName="PRODUCT_CODE";
ec_WOM_produceTask_materialBatchNums_batchNumRef_quickquery_info["productId.id"]={};
ec_WOM_produceTask_materialBatchNums_batchNumRef_quickquery_info["productId.id"].dbColumnType="LONG";
ec_WOM_produceTask_materialBatchNums_batchNumRef_quickquery_info["productId.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_MATERIAL_BATCH_NUMS,PRODUCT_ID-productCode";
ec_WOM_produceTask_materialBatchNums_batchNumRef_quickquery_info["productId.id"].columnName="PRODUCT_ID";
ec_WOM_produceTask_materialBatchNums_batchNumRef_quickquery_info["proNum"]={};
ec_WOM_produceTask_materialBatchNums_batchNumRef_quickquery_info["proNum"].dbColumnType="TEXT";
ec_WOM_produceTask_materialBatchNums_batchNumRef_quickquery_info["proNum"].layRec="proNum";
ec_WOM_produceTask_materialBatchNums_batchNumRef_quickquery_info["proNum"].columnName="PRO_NUM";
generateChainCond=function(cond,layarr,field){
	if(layarr.length>1){
		var subconds=cond.subconds;
		for(var i=0;i<subconds.length;i++){
			if(subconds[i].type=="2"&&subconds[i].joinInfo==layarr[0]){
				generateChainCond(subconds[i],layarr.splice(1),field);
				return;
			}
		}
		var chain={};
		chain.type="2";
		chain.joinInfo=layarr[0];
		chain.subconds=[];
		cond.subconds.push(chain);
		generateChainCond(chain,layarr.splice(1),field);
	}else{
		cond.subconds.push(field)
	}
}
</script>
<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
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
<#assign datatable_firstLoad = true>
<#if view?? && view.type?? && view.type != "REFERENCE">
<#assign datatable_queryFunc = "WOM.produceTask.materialBatchNums.batchNumRef.query('query')">
</#if>
<#assign datatable_dataUrl = "/WOM/produceTask/materialBatchNums/batchNumRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.produceTask.materialBatchNums.batchNumRef.query('query')">
<#assign datatable_dataUrl = "/WOM/produceTask/materialBatchNums/batchNumRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_WOM_produceTask_materialBatchNums_batchNumRef_query" renderOverEvent="ec_WOM_produceTask_materialBatchNums_batchNumRef_RenderOverEvent" pageInitMethod="ec_WOM_produceTask_materialBatchNums_batchNumRef_PageInitMethod" modelCode="WOM_7.5.0.0_produceTask_MaterialBatchNums" noPermissionKeys="productId.productCode,productId.productName,proNum,batchNum.batchText" hidekeyPrefix="ec_WOM_produceTask_materialBatchNums_batchNumRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_produceTask_materialBatchNums_batchNumRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="WOM.produceTask.materialBatchNums.batchNumRef.sendBackbatchNumRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','productId.id','batchNum.id','id','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="WOM.produceTask.materialBatchNums.batchNumRef.showErrorMsg">
					<#if flowBulkFlag?? && flowBulkFlag==true>
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign productId_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${productId_productCode_displayDefaultType!}"  key="productId.productCode"   label="${getText('WOM.propertydisplayName.radion14157726448331')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign productId_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${productId_productName_displayDefaultType!}"  key="productId.productName"   label="${getText('WOM.propertydisplayName.radion1415772740737334')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign proNum_displayDefaultType  = ''>
			<@datacolumn columnName="PRO_NUM"    showFormat="TEXT" defaultDisplay="${proNum_displayDefaultType!}"  key="proNum"  hiddenCol=true label="${getText('WOM.propertydisplayName.randon1490617192684')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign batchNum_batchText_displayDefaultType  = ''>
			<@datacolumn columnName="BATCH_TEXT"    showFormat="TEXT" defaultDisplay="${batchNum_batchText_displayDefaultType!}"  key="batchNum.batchText"   label="${getText('WOM.propertydisplayName.randon1490064501469')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_produceTask_materialBatchNums_batchNumRef_RenderOverEvent(){
}
function ec_WOM_produceTask_materialBatchNums_batchNumRef_PageInitMethod(){
}
	
	
	
	
</script>