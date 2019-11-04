	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1419232311198')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_factoryModel_factoryModel_proLineRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_factoryModel_factoryModel_proLineRef_queryForm" exportUrl="/MESBasic/factoryModel/factoryModel/proLineRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" reset="false" name="MESBasic_factoryModel_factoryModel_proLineRef_condition" id="MESBasic_factoryModel_factoryModel_proLineRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1419232346350')}_${getText('MESBasic.viewtitle.randon1488190851436')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<input type="hidden" id="currentSqlType"  value="5" />
		<div id="ec_MESBasic_factoryModel_factoryModel_proLineRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_factoryModel_factoryModel_proLineRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_factoryModel_proLineRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_factoryModel_proLineRef" formId="ec_MESBasic_factoryModel_factoryModel_proLineRef_queryForm" dataTableId="ec_MESBasic_factoryModel_factoryModel_proLineRef_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_factoryModel_factoryModel_proLineRef_queryForm" isExpandAll=true formId="ec_MESBasic_factoryModel_factoryModel_proLineRef_queryForm" idprefix="ec_MESBasic_factoryModel_factoryModel_proLineRef" expandType="all"  fieldcodes="MESBasic_1_factoryModel_FactoryModel_code_code:MESBasic.propertydisplayName.radion1419233767027||MESBasic_1_factoryModel_FactoryModel_name_name:MESBasic.propertydisplayName.radion1419232393782||MESBasic_1_nodeType_NodeType_name_nodeType_name:MESBasic.entityname.randon1460947272892" > 
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_factoryModel_factoryModel_proLineRef_queryForm" code="MESBasic_1_factoryModel_FactoryModel_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="MESBasic_1_factoryModel_FactoryModel_code_code" isCustomize=true > 
										<#if (code_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_factoryModel_factoryModel_proLineRef_queryForm" isCrossCompany=isCrossCompany       isPrecise=true value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="MESBasic.factoryModel.factoryModel.proLineRef._querycustomFunc('code')" name="code" id="ec_MESBasic_factoryModel_factoryModel_proLineRef_queryForm_code" displayFieldName="code" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/factoryModel/factoryModel/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.factoryModel.factoryModel.proLineRef.commonQuery('query')"  currentViewCode="MESBasic_1_factoryModel_proLineRef"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_factoryModel_factoryModel_proLineRef_queryForm" isCrossCompany=isCrossCompany       isPrecise=true  conditionfunc="MESBasic.factoryModel.factoryModel.proLineRef._querycustomFunc('code')" name="code" id="ec_MESBasic_factoryModel_factoryModel_proLineRef_queryForm_code" displayFieldName="code" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/factoryModel/factoryModel/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.factoryModel.factoryModel.proLineRef.commonQuery('query')" currentViewCode="MESBasic_1_factoryModel_proLineRef"  realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_factoryModel_factoryModel_proLineRef_queryForm" code="MESBasic_1_factoryModel_FactoryModel_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="MESBasic_1_factoryModel_FactoryModel_name_name" isCustomize=true > 
										<#if (name_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_factoryModel_factoryModel_proLineRef_queryForm" isCrossCompany=isCrossCompany       isPrecise=true value="${name_defaultValue!}" deValue="${name_defaultValue!}"   conditionfunc="MESBasic.factoryModel.factoryModel.proLineRef._querycustomFunc('name')" name="name" id="ec_MESBasic_factoryModel_factoryModel_proLineRef_queryForm_name" displayFieldName="name" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/factoryModel/factoryModel/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.factoryModel.factoryModel.proLineRef.commonQuery('query')"  currentViewCode="MESBasic_1_factoryModel_proLineRef"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_factoryModel_factoryModel_proLineRef_queryForm" isCrossCompany=isCrossCompany       isPrecise=true  conditionfunc="MESBasic.factoryModel.factoryModel.proLineRef._querycustomFunc('name')" name="name" id="ec_MESBasic_factoryModel_factoryModel_proLineRef_queryForm_name" displayFieldName="name" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/factoryModel/factoryModel/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.factoryModel.factoryModel.proLineRef.commonQuery('query')" currentViewCode="MESBasic_1_factoryModel_proLineRef"  realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign nodeType_name_defaultValue  = ''>
									<#assign nodeType_name_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_factoryModel_factoryModel_proLineRef_queryForm" code="MESBasic_1_nodeType_NodeType_name" showFormat="SELECTCOMP" defaultValue=nodeType_name_defaultValue  divCode="MESBasic_1_nodeType_NodeType_name_nodeType_name" isCustomize=true > 
										<input type="hidden" id="nodeType.id" name="nodeType.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${nodeType_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1460947537367')}"  conditionfunc="MESBasic.factoryModel.factoryModel.proLineRef._querycustomFunc('nodeType_name')" name="nodeType.name" id="ec_MESBasic_factoryModel_factoryModel_proLineRef_queryForm_nodeType_name" displayFieldName="name" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/nodeType/nodeType/noderef.action"   refViewCode="MESBasic_1_nodeType_noderef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_factoryModel_factoryModel_proLineRef_queryForm" searchClick="MESBasic.factoryModel.factoryModel.proLineRef.commonQuery('query')"  />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_factoryModel_factoryModel_proLineRef_queryForm" type="search" onclick="MESBasic.factoryModel.factoryModel.proLineRef.commonQuery('query')" /> 
						 		<@querybutton formId="ec_MESBasic_factoryModel_factoryModel_proLineRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_factoryModel_factoryModel_proLineRef_quickquery_info={};
ec_MESBasic_factoryModel_factoryModel_proLineRef_quickquery_info["MainTableName"]="factory_tbcompanystructure";
ec_MESBasic_factoryModel_factoryModel_proLineRef_quickquery_info["code"]={};
ec_MESBasic_factoryModel_factoryModel_proLineRef_quickquery_info["code"].dbColumnType="TEXT";
ec_MESBasic_factoryModel_factoryModel_proLineRef_quickquery_info["code"].layRec="code";
ec_MESBasic_factoryModel_factoryModel_proLineRef_quickquery_info["code"].columnName="CODE";
ec_MESBasic_factoryModel_factoryModel_proLineRef_quickquery_info["name"]={};
ec_MESBasic_factoryModel_factoryModel_proLineRef_quickquery_info["name"].dbColumnType="TEXT";
ec_MESBasic_factoryModel_factoryModel_proLineRef_quickquery_info["name"].layRec="name";
ec_MESBasic_factoryModel_factoryModel_proLineRef_quickquery_info["name"].columnName="NODENAME";
ec_MESBasic_factoryModel_factoryModel_proLineRef_quickquery_info["nodeType.name"]={};
ec_MESBasic_factoryModel_factoryModel_proLineRef_quickquery_info["nodeType.name"].dbColumnType="TEXT";
ec_MESBasic_factoryModel_factoryModel_proLineRef_quickquery_info["nodeType.name"].layRec="factory_tbnodetype,ID,factory_tbcompanystructure,NODE_TYPE-name";
ec_MESBasic_factoryModel_factoryModel_proLineRef_quickquery_info["nodeType.name"].columnName="NAME";
ec_MESBasic_factoryModel_factoryModel_proLineRef_quickquery_info["nodeType.id"]={};
ec_MESBasic_factoryModel_factoryModel_proLineRef_quickquery_info["nodeType.id"].dbColumnType="LONG";
ec_MESBasic_factoryModel_factoryModel_proLineRef_quickquery_info["nodeType.id"].layRec="factory_tbnodetype,ID,factory_tbcompanystructure,NODE_TYPE-name";
ec_MESBasic_factoryModel_factoryModel_proLineRef_quickquery_info["nodeType.id"].columnName="ID";
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
<#assign datatable_queryFunc = "MESBasic.factoryModel.factoryModel.proLineRef.query('query')">
</#if>
<#assign datatable_dataUrl = "/MESBasic/factoryModel/factoryModel/proLineRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_MESBasic_factoryModel_factoryModel_proLineRef_query" renderOverEvent="ec_MESBasic_factoryModel_factoryModel_proLineRef_RenderOverEvent" pageInitMethod="ec_MESBasic_factoryModel_factoryModel_proLineRef_PageInitMethod" modelCode="MESBasic_1_factoryModel_FactoryModel" noPermissionKeys="code,name,nodeType.name,nodeType.nodeComment" hidekeyPrefix="ec_MESBasic_factoryModel_factoryModel_proLineRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_factoryModel_factoryModel_proLineRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="MESBasic.factoryModel.factoryModel.proLineRef.sendBackproLineRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','nodeType.id','code','name']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="MESBasic.factoryModel.factoryModel.proLineRef.showErrorMsg">
					<#if flowBulkFlag?? && flowBulkFlag==true>
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('MESBasic.propertydisplayName.radion1419233767027')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="NODENAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('MESBasic.propertydisplayName.radion1419232393782')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign nodeType_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${nodeType_name_displayDefaultType!}"  key="nodeType.name"   label="${getText('MESBasic.entityname.randon1460947272892')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign nodeType_nodeComment_displayDefaultType  = ''>
			<@datacolumn columnName="NODECOMMENT"    showFormat="TEXT" defaultDisplay="${nodeType_nodeComment_displayDefaultType!}"  key="nodeType.nodeComment"   label="${getText('MESBasic.propertydisplayName.randon1460947417565')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_factoryModel_factoryModel_proLineRef_RenderOverEvent(){
}
function ec_MESBasic_factoryModel_factoryModel_proLineRef_PageInitMethod(){
}
	
	
	
	
</script>