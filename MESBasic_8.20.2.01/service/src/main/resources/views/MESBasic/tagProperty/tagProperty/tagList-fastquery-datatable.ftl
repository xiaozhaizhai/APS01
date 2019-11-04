	<#if businessCenterCode?? >
	<div style="position:relative;z-index:1;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1414982116629')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_tagProperty_tagProperty_tagList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_tagProperty_tagProperty_tagList_queryForm" exportUrl="/MESBasic/tagProperty/tagProperty/tagList-query.action">
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1414982248486')}_${getText('MESBasic.viewtitle.radion1414992768949')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<div id="ec_MESBasic_tagProperty_tagProperty_tagList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_tagProperty_tagProperty_tagList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_tagProperty_tagList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_tagProperty_tagList" style="margin-left:5px;" formId="ec_MESBasic_tagProperty_tagProperty_tagList_queryForm" dataTableId="ec_MESBasic_tagProperty_tagProperty_tagList_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_tagProperty_tagProperty_tagList_queryForm" formId="ec_MESBasic_tagProperty_tagProperty_tagList_queryForm" idprefix="ec_MESBasic_tagProperty_tagProperty_tagList" expandType="all" divStyle="margin:6px 0px 5px 0px;float:left;" fieldcodes="MESBasic_1_tagProperty_TagProperty_code_code:MESBasic.propertydisplayName.radion1414982530204||MESBasic_1_tagProperty_TagProperty_name_name:MESBasic.propertydisplayName.radion1414982612133||MESBasic_1_tagProperty_TagProperty_tag_tag:MESBasic.propertydisplayName.radion1414982298834||MESBasic_1_tagProperty_TagProperty_tagType_tagType:MESBasic.propertydisplayName.radion1414983335664||MESBasic_1_tagProperty_TagProperty_tattribute_tattribute:MESBasic.propertydisplayName.radion1414983155412||MESBasic_1_tagProperty_TagProperty_virtualTag_virtualTag:MESBasic.propertydisplayName.radion1414984111107||MESBasic_1_tagProperty_TagProperty_active_active:MESBasic.propertydisplayName.radion1414984279070" > 
							<@queryfield formId="ec_MESBasic_tagProperty_tagProperty_tagList_queryForm" code="MESBasic_1_tagProperty_TagProperty_code" showFormat="TEXT" divCode="MESBasic_1_tagProperty_TagProperty_code_code" isCustomize=true > 
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
										<#if (code_defaultValue)?has_content>
											<@mneclient formId="ec_MESBasic_tagProperty_tagProperty_tagList_queryForm"  isPrecise=true value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="MESBasic.tagProperty.tagProperty.tagList._querycustomFunc('code')" name="code" id="ec_MESBasic_tagProperty_tagProperty_tagList_queryForm_code" displayFieldName="code" exp="like" classStyle="cui-noborder-input"  url="/MESBasic/tagProperty/tagProperty/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.tagProperty.tagProperty.tagList.commonQuery('query')" />
										<#else>
											<@mneclient formId="ec_MESBasic_tagProperty_tagProperty_tagList_queryForm"  isPrecise=true  conditionfunc="MESBasic.tagProperty.tagProperty.tagList._querycustomFunc('code')" name="code" id="ec_MESBasic_tagProperty_tagProperty_tagList_queryForm_code" displayFieldName="code" exp="like" classStyle="cui-noborder-input"  url="/MESBasic/tagProperty/tagProperty/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.tagProperty.tagProperty.tagList.commonQuery('query')" />
										</#if>
							</@queryfield>
							<@queryfield formId="ec_MESBasic_tagProperty_tagProperty_tagList_queryForm" code="MESBasic_1_tagProperty_TagProperty_name" showFormat="TEXT" divCode="MESBasic_1_tagProperty_TagProperty_name_name" isCustomize=true > 
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
										<#if (name_defaultValue)?has_content>
											<@mneclient formId="ec_MESBasic_tagProperty_tagProperty_tagList_queryForm"  isPrecise=true value="${name_defaultValue!}" deValue="${name_defaultValue!}"   conditionfunc="MESBasic.tagProperty.tagProperty.tagList._querycustomFunc('name')" name="name" id="ec_MESBasic_tagProperty_tagProperty_tagList_queryForm_name" displayFieldName="name" exp="like" classStyle="cui-noborder-input"  url="/MESBasic/tagProperty/tagProperty/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.tagProperty.tagProperty.tagList.commonQuery('query')" />
										<#else>
											<@mneclient formId="ec_MESBasic_tagProperty_tagProperty_tagList_queryForm"  isPrecise=true  conditionfunc="MESBasic.tagProperty.tagProperty.tagList._querycustomFunc('name')" name="name" id="ec_MESBasic_tagProperty_tagProperty_tagList_queryForm_name" displayFieldName="name" exp="like" classStyle="cui-noborder-input"  url="/MESBasic/tagProperty/tagProperty/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.tagProperty.tagProperty.tagList.commonQuery('query')" />
										</#if>
							</@queryfield>
							<@queryfield formId="ec_MESBasic_tagProperty_tagProperty_tagList_queryForm" code="MESBasic_1_tagProperty_TagProperty_tag" showFormat="TEXT" divCode="MESBasic_1_tagProperty_TagProperty_tag_tag" isCustomize=true > 
							<#assign tag_defaultValue  = ''>
									<#assign tag_defaultValue  = ''>
										<#if (tag_defaultValue)?has_content>
											<@mneclient formId="ec_MESBasic_tagProperty_tagProperty_tagList_queryForm"  isPrecise=true value="${tag_defaultValue!}" deValue="${tag_defaultValue!}"   conditionfunc="MESBasic.tagProperty.tagProperty.tagList._querycustomFunc('tag')" name="tag" id="ec_MESBasic_tagProperty_tagProperty_tagList_queryForm_tag" displayFieldName="tag" exp="like" classStyle="cui-noborder-input"  url="/MESBasic/tagProperty/tagProperty/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.tagProperty.tagProperty.tagList.commonQuery('query')" />
										<#else>
											<@mneclient formId="ec_MESBasic_tagProperty_tagProperty_tagList_queryForm"  isPrecise=true  conditionfunc="MESBasic.tagProperty.tagProperty.tagList._querycustomFunc('tag')" name="tag" id="ec_MESBasic_tagProperty_tagProperty_tagList_queryForm_tag" displayFieldName="tag" exp="like" classStyle="cui-noborder-input"  url="/MESBasic/tagProperty/tagProperty/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.tagProperty.tagProperty.tagList.commonQuery('query')" />
										</#if>
							</@queryfield>
							<@queryfield formId="ec_MESBasic_tagProperty_tagProperty_tagList_queryForm" code="MESBasic_1_tagProperty_TagProperty_tagType" showFormat="SELECTCOMP" divCode="MESBasic_1_tagProperty_TagProperty_tagType_tagType" isCustomize=true > 
							<#assign tagType_defaultValue  = ''>
									<#assign tagType_defaultValue  = ''>
										<@systemcode  onchange="" ecFlag=true multable=false deValue="${tagType_defaultValue}"   name="tagType" code="TAG_TYPE" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<@queryfield formId="ec_MESBasic_tagProperty_tagProperty_tagList_queryForm" code="MESBasic_1_tagProperty_TagProperty_tattribute" showFormat="RADIO" divCode="MESBasic_1_tagProperty_TagProperty_tattribute_tattribute" isCustomize=true > 
							<#assign tattribute_defaultValue  = ''>
									<#assign tattribute_defaultValue  = ''>
										<@systemcode  onchange="" ecFlag=true multable=false deValue="${tattribute_defaultValue}"   name="tattribute" code="TAG_ATTRIBUTE" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<@queryfield formId="ec_MESBasic_tagProperty_tagProperty_tagList_queryForm" code="MESBasic_1_tagProperty_TagProperty_virtualTag" showFormat="SELECT" divCode="MESBasic_1_tagProperty_TagProperty_virtualTag_virtualTag" isCustomize=true > 
							<#assign virtualTag_defaultValue  = ''>
									<#assign virtualTag_defaultValue  = ''>
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${virtualTag_defaultValue!}" name="virtualTag" id="virtualTag" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (virtualTag_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (virtualTag_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<@queryfield formId="ec_MESBasic_tagProperty_tagProperty_tagList_queryForm" code="MESBasic_1_tagProperty_TagProperty_active" showFormat="SELECT" divCode="MESBasic_1_tagProperty_TagProperty_active_active" isCustomize=true > 
							<#assign active_defaultValue  = 'true'>
									<#assign active_defaultValue  = 'true'>
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${active_defaultValue!}" name="active" id="active" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (active_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (active_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_tagProperty_tagProperty_tagList_queryForm" type="adv" onclick="MESBasic.tagProperty.tagProperty.tagList.commonQuery('query')" onadvancedclick="advQuery()" /> 
						 		<@querybutton formId="ec_MESBasic_tagProperty_tagProperty_tagList_queryForm" type="clear"  />
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
<#assign datatable_queryFunc = "MESBasic.tagProperty.tagProperty.tagList.query('query')">
<#assign datatable_dataUrl = "/MESBasic/tagProperty/tagProperty/tagList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable   id="ec_MESBasic_tagProperty_tagProperty_tagList_query" renderOverEvent="ec_MESBasic_tagProperty_tagProperty_tagList_RenderOverEvent" pageInitMethod="ec_MESBasic_tagProperty_tagProperty_tagList_PageInitMethod" modelCode="MESBasic_1_tagProperty_TagProperty" noPermissionKeys="createTime,code,name,tag,tagType,tattribute,active,crtValue,updateTime,virtualTag" hidekeyPrefix="ec_MESBasic_tagProperty_tagProperty_tagList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_tagProperty_tagProperty_tagList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true dblclick="MESBasic.tagProperty.tagProperty.tagList.dbmodifytagList" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','tagType.id','tattribute.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.tagProperty.tagProperty.tagList.showErrorMsg">
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}tagList_tagNew_add_MESBasic_1_tagProperty_tagList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1414981357407')}||iconcls:add||useInMore:false||onclick:
				MESBasic.tagProperty.tagProperty.tagList.addtagList()
		" 
		resultType="json" />
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}tagList_tagEdit_modify_MESBasic_1_tagProperty_tagList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1414981425678')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.tagProperty.tagProperty.tagList.modifytagList()
		" 
		resultType="json" />
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}tagList_tagDel_del_MESBasic_1_tagProperty_tagList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1414981388059')}||iconcls:del||useInMore:false||onclick:
				MESBasic.tagProperty.tagProperty.tagList.deltagList()
		" 
		resultType="json" />
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}tagList_tagImport_import_MESBasic_1_tagProperty_tagList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1414993052972')}||iconcls:import||useInMore:false||onclick:
				MESBasic.tagProperty.tagProperty.tagList.importtagList()||subButtons:[{text:'${getText('import.file.downloadtemplate')}',handler:function(){MESBasic.tagProperty.tagProperty.tagList.downloadTemplatetagList()},useInMore:'false'}]
		" 
		resultType="json" />
					<#if flowBulkFlag?? && flowBulkFlag==true>
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign createTime_displayDefaultType  = ''>
			<@datacolumn columnName="CREATE_TIME"    showFormat="YMD_HMS" defaultDisplay="${createTime_displayDefaultType!}"  key="createTime"   label="${getText('ec.common.createTime')}" textalign="center"  width=100   type="datetime"    showFormatFunc=""/>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('MESBasic.propertydisplayName.radion1414982530204')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('MESBasic.propertydisplayName.radion1414982612133')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign tag_displayDefaultType  = ''>
			<@datacolumn columnName="TAG"    showFormat="TEXT" defaultDisplay="${tag_displayDefaultType!}"  key="tag"   label="${getText('MESBasic.propertydisplayName.radion1414982298834')}" textalign="center"  width=100   type="textarea"    showFormatFunc=""/>
			<#assign tagType_displayDefaultType  = ''>
			<@datacolumn columnName="TAG_TYPE"    showFormat="SELECTCOMP" defaultDisplay="${tagType_displayDefaultType!}"  key="tagType.value"   label="${getText('MESBasic.propertydisplayName.radion1414983335664')}" textalign="center"  width=100   type="systemcode"    showFormatFunc=""/>
			<#assign tattribute_displayDefaultType  = ''>
			<@datacolumn columnName="TATTRIBUTE"    showFormat="RADIO" defaultDisplay="${tattribute_displayDefaultType!}"  key="tattribute.value"   label="${getText('MESBasic.propertydisplayName.radion1414983155412')}" textalign="center"  width=100   type="systemcode"    showFormatFunc=""/>
			<#assign active_displayDefaultType  = ''>
			<@datacolumn columnName="ACTIVE"    showFormat="CHECKBOX" defaultDisplay="${active_displayDefaultType!}"  key="active"   label="${getText('MESBasic.propertydisplayName.radion1414984279070')}" textalign="center"  width=100   type="boolean"    showFormatFunc=""/>
			<#assign crtValue_displayDefaultType  = ''>
			<@datacolumn columnName="CRT_VALUE"    showFormat="TEXT" defaultDisplay="${crtValue_displayDefaultType!}"  key="crtValue"   label="${getText('MESBasic.propertydisplayName.radion1414983438506')}" textalign="right" decimal="4" width=100   type="decimal"    showFormatFunc=""/>
			<#assign updateTime_displayDefaultType  = ''>
			<@datacolumn columnName="UPDATE_TIME"    showFormat="YMD_HMS" defaultDisplay="${updateTime_displayDefaultType!}"  key="updateTime"   label="${getText('MESBasic.propertydisplayName.radion1414983576366')}" textalign="center"  width=100   type="datetime"    showFormatFunc=""/>
			<#assign virtualTag_displayDefaultType  = ''>
			<@datacolumn columnName="VIRTUAL_TAG"    showFormat="CHECKBOX" defaultDisplay="${virtualTag_displayDefaultType!}"  key="virtualTag"   label="${getText('MESBasic.propertydisplayName.radion1414984111107')}" textalign="center"  width=100   type="boolean"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_tagProperty_tagProperty_tagList_RenderOverEvent(){
}
function ec_MESBasic_tagProperty_tagProperty_tagList_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
</script>