	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1486607161637')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_storeSet_storeSet_operateRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_storeSet_storeSet_operateRef_queryForm" exportUrl="/MESBasic/storeSet/storeSet/operateRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" reset="false" name="MESBasic_storeSet_storeSet_operateRef_condition" id="MESBasic_storeSet_storeSet_operateRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1486607220162')}_${getText('MESBasic.viewtitle.randon1487132025914')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<input type="hidden" id="currentSqlType"  value="5" />
		<div id="ec_MESBasic_storeSet_storeSet_operateRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_storeSet_storeSet_operateRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_storeSet_operateRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_storeSet_operateRef" formId="ec_MESBasic_storeSet_storeSet_operateRef_queryForm" dataTableId="ec_MESBasic_storeSet_storeSet_operateRef_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_storeSet_storeSet_operateRef_queryForm" isExpandAll=true formId="ec_MESBasic_storeSet_storeSet_operateRef_queryForm" idprefix="ec_MESBasic_storeSet_storeSet_operateRef" expandType="all"  fieldcodes="MESBasic_1_wareMan_Ware_wareCode_wareId_wareCode:MESBasic.propertydisplayName.randon1484031239866||MESBasic_1_wareMan_Ware_wareName_wareId_wareName:MESBasic.propertydisplayName.randon1484031316281||MESBasic_1_storeSet_StoreSet_placeSetCode_placeSetCode:MESBasic.propertydisplayName.randon1486607342343||MESBasic_1_storeSet_StoreSet_placeSetName_placeSetName:MESBasic.propertydisplayName.randon1486607374172" > 
							<#assign wareId_wareCode_defaultValue  = ''>
									<#assign wareId_wareCode_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_storeSet_storeSet_operateRef_queryForm" code="MESBasic_1_wareMan_Ware_wareCode" showFormat="SELECTCOMP" defaultValue=wareId_wareCode_defaultValue  divCode="MESBasic_1_wareMan_Ware_wareCode_wareId_wareCode" isCustomize=true > 
										<input type="hidden" id="wareId.id" name="wareId.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${wareId_wareCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  conditionfunc="MESBasic.storeSet.storeSet.operateRef._querycustomFunc('wareId_wareCode')" name="wareId.wareCode" id="ec_MESBasic_storeSet_storeSet_operateRef_queryForm_wareId_wareCode" displayFieldName="wareCode" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/wareMan/ware/wareRef.action"   refViewCode="MESBasic_1_wareMan_wareRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_storeSet_storeSet_operateRef_queryForm" searchClick="MESBasic.storeSet.storeSet.operateRef.commonQuery('query')"  />
							</@queryfield>
							<#assign wareId_wareName_defaultValue  = ''>
									<#assign wareId_wareName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_storeSet_storeSet_operateRef_queryForm" code="MESBasic_1_wareMan_Ware_wareName" showFormat="SELECTCOMP" defaultValue=wareId_wareName_defaultValue  divCode="MESBasic_1_wareMan_Ware_wareName_wareId_wareName" isCustomize=true > 
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${wareId_wareName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  conditionfunc="MESBasic.storeSet.storeSet.operateRef._querycustomFunc('wareId_wareName')" name="wareId.wareName" id="ec_MESBasic_storeSet_storeSet_operateRef_queryForm_wareId_wareName" displayFieldName="wareName" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/wareMan/ware/wareRef.action"   refViewCode="MESBasic_1_wareMan_wareRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_storeSet_storeSet_operateRef_queryForm" searchClick="MESBasic.storeSet.storeSet.operateRef.commonQuery('query')"  />
							</@queryfield>
							<#assign placeSetCode_defaultValue  = ''>
									<#assign placeSetCode_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_storeSet_storeSet_operateRef_queryForm" code="MESBasic_1_storeSet_StoreSet_placeSetCode" showFormat="TEXT" defaultValue=placeSetCode_defaultValue  divCode="MESBasic_1_storeSet_StoreSet_placeSetCode_placeSetCode" isCustomize=true > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="placeSetCode" id="placeSetCode" value="${placeSetCode_defaultValue!}" deValue="${placeSetCode_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign placeSetName_defaultValue  = ''>
									<#assign placeSetName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_storeSet_storeSet_operateRef_queryForm" code="MESBasic_1_storeSet_StoreSet_placeSetName" showFormat="TEXT" defaultValue=placeSetName_defaultValue  divCode="MESBasic_1_storeSet_StoreSet_placeSetName_placeSetName" isCustomize=true > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="placeSetName" id="placeSetName" value="${placeSetName_defaultValue!}" deValue="${placeSetName_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_storeSet_storeSet_operateRef_queryForm" type="search" onclick="MESBasic.storeSet.storeSet.operateRef.commonQuery('query')" /> 
						 		<@querybutton formId="ec_MESBasic_storeSet_storeSet_operateRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info={};
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["MainTableName"]="MATERIAL_STORE_SETS";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["wareId.wareCode"]={};
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["wareId.wareCode"].dbColumnType="TEXT";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["wareId.wareCode"].layRec="MATERIAL_WARES,ID,MATERIAL_STORE_SETS,WARE_ID-wareCode";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["wareId.wareCode"].columnName="WARE_CODE";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["wareId.id"]={};
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["wareId.id"].dbColumnType="LONG";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["wareId.id"].layRec="MATERIAL_WARES,ID,MATERIAL_STORE_SETS,WARE_ID-wareCode";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["wareId.id"].columnName="ID";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["wareId.wareName"]={};
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["wareId.wareName"].dbColumnType="TEXT";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["wareId.wareName"].layRec="MATERIAL_WARES,ID,MATERIAL_STORE_SETS,WARE_ID-wareName";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["wareId.wareName"].columnName="WARE_NAME";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["placeSetCode"]={};
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["placeSetCode"].dbColumnType="TEXT";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["placeSetCode"].layRec="placeSetCode";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["placeSetCode"].columnName="PLACE_SET_CODE";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["placeSetName"]={};
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["placeSetName"].dbColumnType="TEXT";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["placeSetName"].layRec="placeSetName";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["placeSetName"].columnName="PLACE_SET_NAME";
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
<#assign datatable_queryFunc = "MESBasic.storeSet.storeSet.operateRef.query('query')">
</#if>
<#assign datatable_dataUrl = "/MESBasic/storeSet/storeSet/operateRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_MESBasic_storeSet_storeSet_operateRef_query" renderOverEvent="ec_MESBasic_storeSet_storeSet_operateRef_RenderOverEvent" pageInitMethod="ec_MESBasic_storeSet_storeSet_operateRef_PageInitMethod" modelCode="MESBasic_1_storeSet_StoreSet" noPermissionKeys="wareId.wareCode,wareId.wareName,placeSetCode,placeSetName,owner.name,inPriority,outPriority" hidekeyPrefix="ec_MESBasic_storeSet_storeSet_operateRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_storeSet_storeSet_operateRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="MESBasic.storeSet.storeSet.operateRef.sendBackoperateRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','wareId.id','owner.id','id','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="MESBasic.storeSet.storeSet.operateRef.showErrorMsg">
					<#if flowBulkFlag?? && flowBulkFlag==true>
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign wareId_wareCode_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_CODE"    showFormat="TEXT" defaultDisplay="${wareId_wareCode_displayDefaultType!}"  key="wareId.wareCode"   label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign wareId_wareName_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_NAME"    showFormat="TEXT" defaultDisplay="${wareId_wareName_displayDefaultType!}"  key="wareId.wareName"   label="${getText('MESBasic.propertydisplayName.randon1484031316281')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign placeSetCode_displayDefaultType  = ''>
			<@datacolumn columnName="PLACE_SET_CODE"    showFormat="TEXT" defaultDisplay="${placeSetCode_displayDefaultType!}"  key="placeSetCode"   label="${getText('MESBasic.propertydisplayName.randon1486607342343')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign placeSetName_displayDefaultType  = ''>
			<@datacolumn columnName="PLACE_SET_NAME"    showFormat="TEXT" defaultDisplay="${placeSetName_displayDefaultType!}"  key="placeSetName"   label="${getText('MESBasic.propertydisplayName.randon1486607374172')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign owner_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${owner_name_displayDefaultType!}"  key="owner.name"   label="${getText('foundation.staff.dimissionStaff_xls.staffName')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign inPriority_displayDefaultType  = ''>
			<@datacolumn columnName="IN_PRIORITY"    showFormat="TEXT" defaultDisplay="${inPriority_displayDefaultType!}"  key="inPriority"   label="${getText('MESBasic.propertydisplayName.randon1486607396188')}" textalign="right"  width=100   type="integer"    showFormatFunc=""/>
			<#assign outPriority_displayDefaultType  = ''>
			<@datacolumn columnName="OUT_PRIORITY"    showFormat="TEXT" defaultDisplay="${outPriority_displayDefaultType!}"  key="outPriority"   label="${getText('MESBasic.propertydisplayName.randon1486616796931')}" textalign="right"  width=100   type="integer"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_storeSet_storeSet_operateRef_RenderOverEvent(){
}
function ec_MESBasic_storeSet_storeSet_operateRef_PageInitMethod(){
}
	
	
	
	
	
	
	
</script>