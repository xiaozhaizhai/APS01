	<#if businessCenterCode?? >
	<div style="position:relative;z-index:1;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1421287707449')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_prodtype_prodtype_ptlist_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_prodtype_prodtype_ptlist_queryForm" exportUrl="/MESBasic/prodtype/prodtype/ptlist-query.action">
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1421288154333')}_${getText('MESBasic.viewtitle.radion1421288407296')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<#assign advFlag = getAdvClassific('MESBasic_1_prodtype_ptlist')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_prodtype_ptlist"  formId="ec_MESBasic_prodtype_prodtype_ptlist_queryForm" dataTableId="ec_MESBasic_prodtype_prodtype_ptlist_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_prodtype_prodtype_ptlist_queryForm" formId="ec_MESBasic_prodtype_prodtype_ptlist_queryForm" idprefix="ec_MESBasic_prodtype_prodtype_ptlist" expandType="single"  fieldcodes="MESBasic_1_prodtype_Prodtype_ptid_ptid:MESBasic.propertydisplayName.radion1421288205380||MESBasic_1_prodtype_Prodtype_ptname_ptname:MESBasic.propertydisplayName.radion1421288241194||MESBasic_1_prodtype_Prodtype_notes_notes:MESBasic.propertydisplayName.radion1421288266808" > 
							<@queryfield formId="ec_MESBasic_prodtype_prodtype_ptlist_queryForm" code="MESBasic_1_prodtype_Prodtype_ptid" showFormat="TEXT" divCode="MESBasic_1_prodtype_Prodtype_ptid_ptid" isCustomize=true > 
							<#assign ptid_defaultValue  = ''>
									<#assign ptid_defaultValue  = ''>
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="ptid" id="ptid" value="${ptid_defaultValue!}" deValue="${ptid_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<@queryfield formId="ec_MESBasic_prodtype_prodtype_ptlist_queryForm" code="MESBasic_1_prodtype_Prodtype_ptname" showFormat="TEXT" divCode="MESBasic_1_prodtype_Prodtype_ptname_ptname" isCustomize=true > 
							<#assign ptname_defaultValue  = ''>
									<#assign ptname_defaultValue  = ''>
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="ptname" id="ptname" value="${ptname_defaultValue!}" deValue="${ptname_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<@queryfield formId="ec_MESBasic_prodtype_prodtype_ptlist_queryForm" code="MESBasic_1_prodtype_Prodtype_notes" showFormat="TEXT" divCode="MESBasic_1_prodtype_Prodtype_notes_notes" isCustomize=true > 
							<#assign notes_defaultValue  = ''>
									<#assign notes_defaultValue  = ''>
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="notes" id="notes" value="${notes_defaultValue!}" deValue="${notes_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_prodtype_prodtype_ptlist_queryForm" type="adv" onclick="MESBasic.prodtype.prodtype.ptlist.commonQuery('query')" onadvancedclick="advQuery()" /> 
						 		<@querybutton formId="ec_MESBasic_prodtype_prodtype_ptlist_queryForm" type="clear"  />
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
<#assign datatable_queryFunc = "MESBasic.prodtype.prodtype.ptlist.query('query')">
<#assign datatable_dataUrl = "/MESBasic/prodtype/prodtype/ptlist-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable   id="ec_MESBasic_prodtype_prodtype_ptlist_query" renderOverEvent="ec_MESBasic_prodtype_prodtype_ptlist_RenderOverEvent" pageInitMethod="ec_MESBasic_prodtype_prodtype_ptlist_PageInitMethod" modelCode="MESBasic_1_prodtype_Prodtype" noPermissionKeys="ptid,ptname,notes" hidekeyPrefix="ec_MESBasic_prodtype_prodtype_ptlist_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_prodtype_prodtype_ptlist_queryForm" firstLoad=datatable_firstLoad  exportExcel=true dblclick="MESBasic.prodtype.prodtype.ptlist.dbmodifyptlist" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.prodtype.prodtype.ptlist.showErrorMsg">
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}ptlist_btnadd_add_MESBasic_1_prodtype_ptlist||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1421288623057')}||iconcls:add||useInMore:false||onclick:
				MESBasic.prodtype.prodtype.ptlist.addptlist()
		" 
		resultType="json" />
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}ptlist_btnupdate_modify_MESBasic_1_prodtype_ptlist||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1421288640484')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.prodtype.prodtype.ptlist.modifyptlist()
		" 
		resultType="json" />
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}ptlist_btndelete_del_MESBasic_1_prodtype_ptlist||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1421288666666')}||iconcls:del||useInMore:false||onclick:
				MESBasic.prodtype.prodtype.ptlist.delptlist()
		" 
		resultType="json" />
					<#if flowBulkFlag?? && flowBulkFlag==true>
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign ptid_displayDefaultType  = ''>
			<@datacolumn columnName="PTID"    showFormat="TEXT" defaultDisplay="${ptid_displayDefaultType!}"  key="ptid"   label="${getText('MESBasic.propertydisplayName.radion1421288205380')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign ptname_displayDefaultType  = ''>
			<@datacolumn columnName="PTNAME"    showFormat="TEXT" defaultDisplay="${ptname_displayDefaultType!}"  key="ptname"   label="${getText('MESBasic.propertydisplayName.radion1421288241194')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign notes_displayDefaultType  = ''>
			<@datacolumn columnName="NOTES"    showFormat="TEXT" defaultDisplay="${notes_displayDefaultType!}"  key="notes"   label="${getText('MESBasic.propertydisplayName.radion1421288266808')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_prodtype_prodtype_ptlist_RenderOverEvent(){
}
function ec_MESBasic_prodtype_prodtype_ptlist_PageInitMethod(){
}
	
	
	
</script>