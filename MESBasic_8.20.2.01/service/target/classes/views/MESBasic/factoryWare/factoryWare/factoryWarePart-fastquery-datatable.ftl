	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1486984149095')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm" exportUrl="/MESBasic/factoryWare/factoryWare/factoryWarePart-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="MESBasic_1_storeSet_StoreSet" value="storeId" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" reset="false" name="MESBasic_factoryWare_factoryWare_factoryWarePart_condition" id="MESBasic_factoryWare_factoryWare_factoryWarePart_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1486989542445')}_${getText('MESBasic.viewtitle.randon1486990298359')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<input type="hidden" id="currentSqlType"  value="5" />
		<div id="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_factoryWare_factoryWarePart')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_factoryWare_factoryWarePart" formId="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm" dataTableId="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm" isExpandAll=true formId="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm" idprefix="ec_MESBasic_factoryWare_factoryWare_factoryWarePart" expandType="all"  fieldcodes="MESBasic_1_wareMan_Ware_wareCode_wareId_wareCode:MESBasic.propertydisplayName.randon1484031239866||MESBasic_1_storeSet_StoreSet_placeSetName_storeId_placeSetName:MESBasic.propertydisplayName.randon1486607374172" > 
							<#assign wareId_wareCode_defaultValue  = ''>
									<#assign wareId_wareCode_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm" code="MESBasic_1_wareMan_Ware_wareCode" showFormat="SELECTCOMP" defaultValue=wareId_wareCode_defaultValue  divCode="MESBasic_1_wareMan_Ware_wareCode_wareId_wareCode" isCustomize=true > 
										<input type="hidden" id="wareId.id" name="wareId.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${wareId_wareCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  conditionfunc="MESBasic.factoryWare.factoryWare.factoryWarePart._querycustomFunc('wareId_wareCode')" name="wareId.wareCode" id="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm_wareId_wareCode" displayFieldName="wareCode" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/wareMan/ware/wareRef.action"   refViewCode="MESBasic_1_wareMan_wareRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm" searchClick="MESBasic.factoryWare.factoryWare.factoryWarePart.commonQuery('query')"  />
							</@queryfield>
							<#assign storeId_placeSetName_defaultValue  = ''>
									<#assign storeId_placeSetName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm" code="MESBasic_1_storeSet_StoreSet_placeSetName" showFormat="SELECTCOMP" defaultValue=storeId_placeSetName_defaultValue  divCode="MESBasic_1_storeSet_StoreSet_placeSetName_storeId_placeSetName" isCustomize=true > 
										<input type="hidden" id="storeId.id" name="storeId.id" value="" />
												<@mneclient iframe=true mneenable=false isCrossCompany=isCrossCompany isPrecise=true deValue="${storeId_placeSetName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1486954640353')}"  conditionfunc="MESBasic.factoryWare.factoryWare.factoryWarePart._querycustomFunc('storeId_placeSetName')" name="storeId.placeSetName" id="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm_storeId_placeSetName" displayFieldName="placeSetName" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/storeSet/storeSet/storeRef.action"   refViewCode="MESBasic_1_storeSet_storeRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm" searchClick="MESBasic.factoryWare.factoryWare.factoryWarePart.commonQuery('query')"  />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm" type="search" onclick="MESBasic.factoryWare.factoryWare.factoryWarePart.commonQuery('query')" /> 
						 		<@querybutton formId="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info={};
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["MainTableName"]="factory_tbcompanystructure";
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["wareId.wareCode"]={};
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["wareId.wareCode"].dbColumnType="TEXT";
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["wareId.wareCode"].layRec="MATERIAL_WARES,ID,MESBASIC_FACTORY_WARES,WARE_ID-wareCode";
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["wareId.wareCode"].columnName="WARE_CODE";
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["wareId.id"]={};
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["wareId.id"].dbColumnType="LONG";
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["wareId.id"].layRec="MATERIAL_WARES,ID,MESBASIC_FACTORY_WARES,WARE_ID-wareCode";
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["wareId.id"].columnName="ID";
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["storeId.placeSetName"]={};
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["storeId.placeSetName"].dbColumnType="TEXT";
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["storeId.placeSetName"].layRec="MATERIAL_STORE_SETS,ID,MESBASIC_FACTORY_WARES,STORE_ID-placeSetName";
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["storeId.placeSetName"].columnName="PLACE_SET_NAME";
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["storeId.id"]={};
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["storeId.id"].dbColumnType="LONG";
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["storeId.id"].layRec="MATERIAL_STORE_SETS,ID,MESBASIC_FACTORY_WARES,STORE_ID-placeSetName";
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["storeId.id"].columnName="ID";
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
<#assign datatable_queryFunc = "MESBasic.factoryWare.factoryWare.factoryWarePart.query('query')">
</#if>
<#assign datatable_dataUrl = "/MESBasic/factoryWare/factoryWare/factoryWarePart-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_query" renderOverEvent="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_RenderOverEvent" pageInitMethod="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_PageInitMethod" modelCode="MESBasic_1_factoryWare_FactoryWare" noPermissionKeys="wareId.wareCode,wareId.wareName,storeId.placeSetCode,storeId.placeSetName,meno" hidekeyPrefix="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="MESBasic.factoryWare.factoryWare.factoryWarePart.sendBackfactoryWarePart" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','wareId.id','storeId.id','id','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="MESBasic.factoryWare.factoryWare.factoryWarePart.showErrorMsg">
					<#if flowBulkFlag?? && flowBulkFlag==true>
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign wareId_wareCode_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_CODE"    showFormat="TEXT" defaultDisplay="${wareId_wareCode_displayDefaultType!}"  key="wareId.wareCode"   label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign wareId_wareName_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_NAME"    showFormat="TEXT" defaultDisplay="${wareId_wareName_displayDefaultType!}"  key="wareId.wareName"   label="${getText('MESBasic.propertydisplayName.randon1484031316281')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign storeId_placeSetCode_displayDefaultType  = ''>
			<@datacolumn columnName="PLACE_SET_CODE"    showFormat="TEXT" defaultDisplay="${storeId_placeSetCode_displayDefaultType!}"  key="storeId.placeSetCode"   label="${getText('MESBasic.propertydisplayName.randon1486607342343')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign storeId_placeSetName_displayDefaultType  = ''>
			<@datacolumn columnName="PLACE_SET_NAME"    showFormat="TEXT" defaultDisplay="${storeId_placeSetName_displayDefaultType!}"  key="storeId.placeSetName"   label="${getText('MESBasic.propertydisplayName.randon1486607374172')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign meno_displayDefaultType  = ''>
			<@datacolumn columnName="MENO"    showFormat="TEXT" defaultDisplay="${meno_displayDefaultType!}"  key="meno"   label="${getText('MESBasic.propertydisplayName.randon1486989663449')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_factoryWare_factoryWare_factoryWarePart_RenderOverEvent(){
}
function ec_MESBasic_factoryWare_factoryWare_factoryWarePart_PageInitMethod(){
}
	
	
	
	
	
</script>