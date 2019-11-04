	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1490063991944')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef_queryForm" exportUrl="/WOM/standingcropRef/standingcropRef/batchNumBatchRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="MESBasic_1_storeSet_StoreSet" value="placeSet" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" reset="false" name="WOM_standingcropRef_standingcropRef_batchNumBatchRef_condition" id="WOM_standingcropRef_standingcropRef_batchNumBatchRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1490064355590')}_${getText('WOM.viewtitle.randon1502605368422')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="fastQueryCond" name="fastQueryCond" />
		<input type="hidden" id="excelQueryCond" name="exportFastQueryCond" />
		<input type="hidden" id="treeNodeSelected" >
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<input type="hidden" id="currentSqlType"  value="5" />
		<div id="ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_standingcropRef_batchNumBatchRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_standingcropRef_batchNumBatchRef" formId="ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef_queryForm" dataTableId="ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef_queryForm" isExpandAll=true formId="ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef_queryForm" idprefix="ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef" expandType="all"  fieldcodes="WOM_7.5.0.0_standingcropRef_StandingcropRef_batchText_batchText:WOM.propertydisplayName.randon1490064501469" > 
							<#assign batchText_defaultValue  = ''>
									<#assign batchText_defaultValue  = ''>
							<@queryfield formId="ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef_queryForm" code="WOM_7.5.0.0_standingcropRef_StandingcropRef_batchText" showFormat="TEXT" defaultValue=batchText_defaultValue  divCode="WOM_7.5.0.0_standingcropRef_StandingcropRef_batchText_batchText" isCustomize=true > 
										<#if (batchText_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef_queryForm" isCrossCompany=isCrossCompany       isPrecise=true value="${batchText_defaultValue!}" deValue="${batchText_defaultValue!}"   conditionfunc="WOM.standingcropRef.standingcropRef.batchNumBatchRef._querycustomFunc('batchText')" name="batchText" id="ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef_queryForm_batchText" displayFieldName="batchText" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/WOM/standingcropRef/standingcropRef/mneClient.action" multiple=false mnewidth=260 searchClick="WOM.standingcropRef.standingcropRef.batchNumBatchRef.commonQuery('query')"  currentViewCode="WOM_7.5.0.0_standingcropRef_batchNumBatchRef"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef_queryForm" isCrossCompany=isCrossCompany       isPrecise=true  conditionfunc="WOM.standingcropRef.standingcropRef.batchNumBatchRef._querycustomFunc('batchText')" name="batchText" id="ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef_queryForm_batchText" displayFieldName="batchText" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/WOM/standingcropRef/standingcropRef/mneClient.action" multiple=false mnewidth=260 searchClick="WOM.standingcropRef.standingcropRef.batchNumBatchRef.commonQuery('query')" currentViewCode="WOM_7.5.0.0_standingcropRef_batchNumBatchRef"  realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef_queryForm" type="search" onclick="WOM.standingcropRef.standingcropRef.batchNumBatchRef.commonQuery('query')" /> 
						 		<@querybutton formId="ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef_quickquery_info={};
ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef_quickquery_info["MainTableName"]="MATERIAL_STANDINGCROPS";
ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef_quickquery_info["batchText"]={};
ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef_quickquery_info["batchText"].dbColumnType="TEXT";
ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef_quickquery_info["batchText"].layRec="batchText";
ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef_quickquery_info["batchText"].columnName="BATCH_TEXT";
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
<#assign datatable_queryFunc = "WOM.standingcropRef.standingcropRef.batchNumBatchRef.query('query')">
</#if>
<#assign datatable_dataUrl = "/WOM/standingcropRef/standingcropRef/batchNumBatchRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef_query" renderOverEvent="ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef_RenderOverEvent" pageInitMethod="ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef_PageInitMethod" modelCode="WOM_7.5.0.0_standingcropRef_StandingcropRef" noPermissionKeys="batchText,good.productCode,good.productName,wareID.wareCode,wareID.wareName,placeSet.placeSetCode,placeSet.placeSetName,onhand,frozenQuantity,availiQuantity" hidekeyPrefix="ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="WOM.standingcropRef.standingcropRef.batchNumBatchRef.sendBackbatchNumBatchRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','good.id','wareID.id','placeSet.id','id','batchText']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="WOM.standingcropRef.standingcropRef.batchNumBatchRef.showErrorMsg">
					<#if flowBulkFlag?? && flowBulkFlag==true>
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign batchText_displayDefaultType  = ''>
			<@datacolumn columnName="BATCH_TEXT"    showFormat="TEXT" defaultDisplay="${batchText_displayDefaultType!}"  key="batchText"   label="${getText('WOM.propertydisplayName.randon1490064501469')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign good_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${good_productCode_displayDefaultType!}"  key="good.productCode"   label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign good_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${good_productName_displayDefaultType!}"  key="good.productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign wareID_wareCode_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_CODE"    showFormat="TEXT" defaultDisplay="${wareID_wareCode_displayDefaultType!}"  key="wareID.wareCode"   label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign wareID_wareName_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_NAME"    showFormat="TEXT" defaultDisplay="${wareID_wareName_displayDefaultType!}"  key="wareID.wareName"   label="${getText('MESBasic.propertydisplayName.randon1484031316281')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign placeSet_placeSetCode_displayDefaultType  = ''>
			<@datacolumn columnName="PLACE_SET_CODE"    showFormat="TEXT" defaultDisplay="${placeSet_placeSetCode_displayDefaultType!}"  key="placeSet.placeSetCode"   label="${getText('MESBasic.propertydisplayName.randon1489731651449')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign placeSet_placeSetName_displayDefaultType  = ''>
			<@datacolumn columnName="PLACE_SET_NAME"    showFormat="TEXT" defaultDisplay="${placeSet_placeSetName_displayDefaultType!}"  key="placeSet.placeSetName"   label="${getText('MESBasic.propertydisplayName.randon1489731677162')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign onhand_displayDefaultType  = ''>
			<@datacolumn columnName="ONHAND"    showFormat="TEXT" defaultDisplay="${onhand_displayDefaultType!}"  key="onhand"   label="${getText('WOM.propertydisplayName.randon1490064713692')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc=""/>
			<#assign frozenQuantity_displayDefaultType  = ''>
			<@datacolumn columnName="FROZEN_QUANTITY"    showFormat="TEXT" defaultDisplay="${frozenQuantity_displayDefaultType!}"  key="frozenQuantity"   label="${getText('WOM.propertydisplayName.randon1490064544582')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc=""/>
			<#assign availiQuantity_displayDefaultType  = ''>
			<@datacolumn columnName="AVAILI_QUANTITY"    showFormat="TEXT" defaultDisplay="${availiQuantity_displayDefaultType!}"  key="availiQuantity"   label="${getText('WOM.propertydisplayName.randon1490064478475')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef_RenderOverEvent(){
var length=ec_WOM_standingcropRef_standingcropRef_batchNumOneRefExp_queryWidget.getRowLength();
for(var i=0;i<length;i++){
  //现存量
  var onhand=ec_WOM_standingcropRef_standingcropRef_batchNumOneRefExp_queryWidget.getCellValue(i,'onhand');
  //冻结量
  var frozenNum=ec_WOM_standingcropRef_standingcropRef_batchNumOneRefExp_queryWidget.getCellValue(i,'frozenQuantity');
  //可用量
  var availNum='';
  if(frozenNum=='' || frozenNum==null){
    availNum=Number(onhand);
  }else{
    availNum=Number(onhand)-Number(frozenNum);
  }
  ec_WOM_standingcropRef_standingcropRef_batchNumOneRefExp_queryWidget.setCellValue(i,'availiQuantity',availNum);
}
}
function ec_WOM_standingcropRef_standingcropRef_batchNumBatchRef_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
</script>