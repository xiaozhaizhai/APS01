	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1423967167580')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_equipManage_equipment_factoryModelref_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_equipManage_equipment_factoryModelref_queryForm" exportUrl="/MESBasic/equipManage/equipment/factoryModelref-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="eamUseDeptId" />
		<input type="hidden" id="MESBasic_1_factoryModel_FactoryModel" value="workcenter" />
		<input type="hidden" reset="false" name="MESBasic_equipManage_equipment_factoryModelref_condition" id="MESBasic_equipManage_equipment_factoryModelref_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1423967194871')}_${getText('MESBasic.viewtitle.randon1490254527099')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<input type="hidden" id="currentSqlType"  value="5" />
		<div id="ec_MESBasic_equipManage_equipment_factoryModelref_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_equipManage_equipment_factoryModelref_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_equipManage_factoryModelref')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_equipManage_factoryModelref" formId="ec_MESBasic_equipManage_equipment_factoryModelref_queryForm" dataTableId="ec_MESBasic_equipManage_equipment_factoryModelref_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_equipManage_equipment_factoryModelref_queryForm" isExpandAll=true formId="ec_MESBasic_equipManage_equipment_factoryModelref_queryForm" idprefix="ec_MESBasic_equipManage_equipment_factoryModelref" expandType="single"  fieldcodes="MESBasic_1_equipManage_Equipment_code_code:MESBasic.propertydisplayName.randon1423967256308||MESBasic_1_equipManage_Equipment_name_name:MESBasic.propertydisplayName.randon1423967231438||MESBasic_1_equipManage_Equipment_demo_demo:MESBasic.propertydisplayName.randon1423967391978||MESBasic_1_equipManage_Equipment_eamBuyTime_eamBuyTime:MESBasic.propertydisplayName.randon1460957425645||MESBasic_1_equipManage_Equipment_eamProduceFirm_eamProduceFirm:MESBasic.propertydisplayName.randon1426566652807||MESBasic_1_equipManage_Equipment_eamVendorName_eamVendorName:MESBasic.propertydisplayName.randon1426566956024" > 
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_equipManage_equipment_factoryModelref_queryForm" code="MESBasic_1_equipManage_Equipment_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="MESBasic_1_equipManage_Equipment_code_code" isCustomize=true > 
										<#if (code_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_equipManage_equipment_factoryModelref_queryForm" isCrossCompany=isCrossCompany       isPrecise=true value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="MESBasic.equipManage.equipment.factoryModelref._querycustomFunc('code')" name="code" id="ec_MESBasic_equipManage_equipment_factoryModelref_queryForm_code" displayFieldName="code" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/equipManage/equipment/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.equipManage.equipment.factoryModelref.commonQuery('query')"  currentViewCode="MESBasic_1_equipManage_factoryModelref"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_equipManage_equipment_factoryModelref_queryForm" isCrossCompany=isCrossCompany       isPrecise=true  conditionfunc="MESBasic.equipManage.equipment.factoryModelref._querycustomFunc('code')" name="code" id="ec_MESBasic_equipManage_equipment_factoryModelref_queryForm_code" displayFieldName="code" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/equipManage/equipment/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.equipManage.equipment.factoryModelref.commonQuery('query')" currentViewCode="MESBasic_1_equipManage_factoryModelref"  realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_equipManage_equipment_factoryModelref_queryForm" code="MESBasic_1_equipManage_Equipment_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="MESBasic_1_equipManage_Equipment_name_name" isCustomize=true > 
										<#if (name_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_equipManage_equipment_factoryModelref_queryForm" isCrossCompany=isCrossCompany       isPrecise=true value="${name_defaultValue!}" deValue="${name_defaultValue!}"   conditionfunc="MESBasic.equipManage.equipment.factoryModelref._querycustomFunc('name')" name="name" id="ec_MESBasic_equipManage_equipment_factoryModelref_queryForm_name" displayFieldName="name" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/equipManage/equipment/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.equipManage.equipment.factoryModelref.commonQuery('query')"  currentViewCode="MESBasic_1_equipManage_factoryModelref"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_equipManage_equipment_factoryModelref_queryForm" isCrossCompany=isCrossCompany       isPrecise=true  conditionfunc="MESBasic.equipManage.equipment.factoryModelref._querycustomFunc('name')" name="name" id="ec_MESBasic_equipManage_equipment_factoryModelref_queryForm_name" displayFieldName="name" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/equipManage/equipment/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.equipManage.equipment.factoryModelref.commonQuery('query')" currentViewCode="MESBasic_1_equipManage_factoryModelref"  realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign demo_defaultValue  = ''>
									<#assign demo_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_equipManage_equipment_factoryModelref_queryForm" code="MESBasic_1_equipManage_Equipment_demo" showFormat="TEXT" defaultValue=demo_defaultValue  divCode="MESBasic_1_equipManage_Equipment_demo_demo" isCustomize=true > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="demo" id="demo" value="${demo_defaultValue!}" deValue="${demo_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign eamBuyTime_defaultValue  = ''>
									<#assign eamBuyTime_defaultValue  = ''>
								<#if (eamBuyTime_defaultValue)?? &&(eamBuyTime_defaultValue)?has_content>
									<#assign eamBuyTime_defaultValue  = getDefaultDateTime(eamBuyTime_defaultValue!)?date>
								</#if>
							<@queryfield formId="ec_MESBasic_equipManage_equipment_factoryModelref_queryForm" code="MESBasic_1_equipManage_Equipment_eamBuyTime" showFormat="YMD" defaultValue=eamBuyTime_defaultValue  divCode="MESBasic_1_equipManage_Equipment_eamBuyTime_eamBuyTime" isCustomize=true > 
								<div>
							  	 	<div style="float:left;width:45%">
									<@datepicker cssClass="cui-noborder-input" type="date" value="${eamBuyTime_defaultValue!}" deValue="${eamBuyTime_defaultValue!}"  name="eamBuyTime_start" id="eamBuyTime_start" exp="gequal"   formid="ec_MESBasic_equipManage_equipment_factoryModelref_queryForm" />
									</div>
									<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
							  	 	<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker cssClass="cui-noborder-input" type="date" value="${eamBuyTime_defaultValue!}" deValue="${eamBuyTime_defaultValue!}"  name="eamBuyTime_end" id="eamBuyTime_end" exp="lequal"   formid="ec_MESBasic_equipManage_equipment_factoryModelref_queryForm" />
							  		</div>
						  		</div>
							</@queryfield>
							<#assign eamProduceFirm_defaultValue  = ''>
									<#assign eamProduceFirm_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_equipManage_equipment_factoryModelref_queryForm" code="MESBasic_1_equipManage_Equipment_eamProduceFirm" showFormat="TEXT" defaultValue=eamProduceFirm_defaultValue  divCode="MESBasic_1_equipManage_Equipment_eamProduceFirm_eamProduceFirm" isCustomize=true > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="eamProduceFirm" id="eamProduceFirm" value="${eamProduceFirm_defaultValue!}" deValue="${eamProduceFirm_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign eamVendorName_defaultValue  = ''>
									<#assign eamVendorName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_equipManage_equipment_factoryModelref_queryForm" code="MESBasic_1_equipManage_Equipment_eamVendorName" showFormat="TEXT" defaultValue=eamVendorName_defaultValue  divCode="MESBasic_1_equipManage_Equipment_eamVendorName_eamVendorName" isCustomize=true > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="eamVendorName" id="eamVendorName" value="${eamVendorName_defaultValue!}" deValue="${eamVendorName_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_equipManage_equipment_factoryModelref_queryForm" type="search" onclick="MESBasic.equipManage.equipment.factoryModelref.commonQuery('query')" /> 
						 		<@querybutton formId="ec_MESBasic_equipManage_equipment_factoryModelref_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info={};
ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info["MainTableName"]="EAM_BASEINFO";
ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info["code"]={};
ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info["code"].dbColumnType="TEXT";
ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info["code"].layRec="code";
ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info["code"].columnName="EAM_CODE";
ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info["name"]={};
ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info["name"].dbColumnType="TEXT";
ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info["name"].layRec="name";
ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info["name"].columnName="EAM_NAME";
ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info["demo"]={};
ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info["demo"].dbColumnType="TEXT";
ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info["demo"].layRec="demo";
ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info["demo"].columnName="EAM_MEMO";
ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info["eamBuyTime"]={};
ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info["eamBuyTime"].dbColumnType="DATE";
ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info["eamBuyTime"].layRec="eamBuyTime";
ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info["eamBuyTime"].columnName="EAM_BUY_TIME";
ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info["eamProduceFirm"]={};
ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info["eamProduceFirm"].dbColumnType="TEXT";
ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info["eamProduceFirm"].layRec="eamProduceFirm";
ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info["eamProduceFirm"].columnName="EAM_PRODUCEFIRM";
ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info["eamVendorName"]={};
ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info["eamVendorName"].dbColumnType="TEXT";
ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info["eamVendorName"].layRec="eamVendorName";
ec_MESBasic_equipManage_equipment_factoryModelref_quickquery_info["eamVendorName"].columnName="EAM_VENDORNAME";
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
<#assign datatable_queryFunc = "MESBasic.equipManage.equipment.factoryModelref.query('query')">
</#if>
<#assign datatable_dataUrl = "/MESBasic/equipManage/equipment/factoryModelref-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_MESBasic_equipManage_equipment_factoryModelref_query" renderOverEvent="ec_MESBasic_equipManage_equipment_factoryModelref_RenderOverEvent" pageInitMethod="ec_MESBasic_equipManage_equipment_factoryModelref_PageInitMethod" modelCode="MESBasic_1_equipManage_Equipment" noPermissionKeys="code,name,eamBuyTime,eamProduceFirm,eamVendorName,demo" hidekeyPrefix="ec_MESBasic_equipManage_equipment_factoryModelref_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_equipManage_equipment_factoryModelref_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="MESBasic.equipManage.equipment.factoryModelref.sendBackfactoryModelref" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','code','code','name']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="MESBasic.equipManage.equipment.factoryModelref.showErrorMsg">
					<#if flowBulkFlag?? && flowBulkFlag==true>
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn columnName="EAM_CODE"    showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('MESBasic.propertydisplayName.randon1423967256308')}" textalign="left"  width=160   type="textfield"    showFormatFunc=""/>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="EAM_NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('MESBasic.propertydisplayName.randon1423967231438')}" textalign="left"  width=160   type="textfield"    showFormatFunc=""/>
			<#assign eamBuyTime_displayDefaultType  = ''>
			<@datacolumn columnName="EAM_BUY_TIME"    showFormat="YMD" defaultDisplay="${eamBuyTime_displayDefaultType!}"  key="eamBuyTime"   label="${getText('MESBasic.propertydisplayName.randon1460957425645')}" textalign="center"  width=100   type="date"    showFormatFunc=""/>
			<#assign eamProduceFirm_displayDefaultType  = ''>
			<@datacolumn columnName="EAM_PRODUCEFIRM"    showFormat="TEXT" defaultDisplay="${eamProduceFirm_displayDefaultType!}"  key="eamProduceFirm"   label="${getText('MESBasic.propertydisplayName.randon1426566652807')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign eamVendorName_displayDefaultType  = ''>
			<@datacolumn columnName="EAM_VENDORNAME"    showFormat="TEXT" defaultDisplay="${eamVendorName_displayDefaultType!}"  key="eamVendorName"   label="${getText('MESBasic.propertydisplayName.randon1426566956024')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign demo_displayDefaultType  = ''>
			<@datacolumn columnName="EAM_MEMO"    showFormat="TEXT" defaultDisplay="${demo_displayDefaultType!}"  key="demo"   label="${getText('MESBasic.propertydisplayName.randon1423967391978')}" textalign="left"  width=200   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_equipManage_equipment_factoryModelref_RenderOverEvent(){
}
function ec_MESBasic_equipManage_equipment_factoryModelref_PageInitMethod(){
}
	
	
	
	
	
	
</script>