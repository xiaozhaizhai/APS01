	<#if businessCenterCode?? >
	<div style="position:relative;z-index:1;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1415320970665')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_material_material_materialList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_material_material_materialList_queryForm" exportUrl="/MESBasic/material/material/materialList-query.action">
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1415321000682')}_${getText('MESBasic.viewtitle.radion1415321151720')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<div id="ec_MESBasic_material_material_materialList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_material_material_materialList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_material_materialList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_material_materialList" style="margin-left:5px;" formId="ec_MESBasic_material_material_materialList_queryForm" dataTableId="ec_MESBasic_material_material_materialList_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_material_material_materialList_queryForm" formId="ec_MESBasic_material_material_materialList_queryForm" idprefix="ec_MESBasic_material_material_materialList" expandType="all" divStyle="margin:6px 0px 5px 0px;float:left;" fieldcodes="MESBasic_1_material_Material_code_code:MESBasic.propertydisplayName.radion1415321030666||MESBasic_1_material_Material_name_name:MESBasic.propertydisplayName.radion1415321054576||MESBasic_1_material_Material_remark_remark:MESBasic.propertydisplayName.radion1415607380055" > 
							<@queryfield formId="ec_MESBasic_material_material_materialList_queryForm" code="MESBasic_1_material_Material_code" showFormat="TEXT" divCode="MESBasic_1_material_Material_code_code" isCustomize=true > 
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="code" id="code" value="${code_defaultValue!}" deValue="${code_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<@queryfield formId="ec_MESBasic_material_material_materialList_queryForm" code="MESBasic_1_material_Material_name" showFormat="TEXT" divCode="MESBasic_1_material_Material_name_name" isCustomize=true > 
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<@queryfield formId="ec_MESBasic_material_material_materialList_queryForm" code="MESBasic_1_material_Material_remark" showFormat="TEXT" divCode="MESBasic_1_material_Material_remark_remark" isCustomize=true > 
							<#assign remark_defaultValue  = ''>
									<#assign remark_defaultValue  = ''>
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="remark" id="remark" value="${remark_defaultValue!}" deValue="${remark_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_material_material_materialList_queryForm" type="adv" onclick="MESBasic.material.material.materialList.commonQuery('query')" onadvancedclick="advQuery()" /> 
						 		<@querybutton formId="ec_MESBasic_material_material_materialList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div><#assign superChecked = false>
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
<#assign datatable_queryFunc = "MESBasic.material.material.materialList.query('query')">
<#assign datatable_dataUrl = "/MESBasic/material/material/materialList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable   id="ec_MESBasic_material_material_materialList_query" renderOverEvent="ec_MESBasic_material_material_materialList_RenderOverEvent" pageInitMethod="ec_MESBasic_material_material_materialList_PageInitMethod" modelCode="MESBasic_1_material_Material" noPermissionKeys="code,name,remark" hidekeyPrefix="ec_MESBasic_material_material_materialList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_material_material_materialList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true dblclick="MESBasic.material.material.materialList.dbmodifymaterialList" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.material.material.materialList.showErrorMsg">
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}materialList_materialNew_add_MESBasic_1_material_materialList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1415321196048')}||iconcls:add||useInMore:false||onclick:
				MESBasic.material.material.materialList.addmaterialList()
		" 
		resultType="json" />
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}materialList_materialEdit_modify_MESBasic_1_material_materialList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1415321216801')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.material.material.materialList.modifymaterialList()
		" 
		resultType="json" />
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}materialList_materialDel_del_MESBasic_1_material_materialList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1415321232551')}||iconcls:del||useInMore:false||onclick:
				MESBasic.material.material.materialList.delmaterialList()
		" 
		resultType="json" />
					<#if flowBulkFlag?? && flowBulkFlag==true>
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('MESBasic.propertydisplayName.radion1415321030666')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('MESBasic.propertydisplayName.radion1415321054576')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign remark_displayDefaultType  = ''>
			<@datacolumn columnName="REMARK"    showFormat="TEXT" defaultDisplay="${remark_displayDefaultType!}"  key="remark"   label="${getText('MESBasic.propertydisplayName.radion1415607380055')}" textalign="center"  width=100   type="textarea"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_material_material_materialList_RenderOverEvent(){
}
function ec_MESBasic_material_material_materialList_PageInitMethod(){
}
	
	
	
</script>