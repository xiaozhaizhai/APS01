	<#if businessCenterCode?? >
	<div>
	<div class="edit-menubar"><span class="title-bar">${getText('X6Basic.entityname.radion1368671300636')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_X6Basic_product_product_list_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_X6Basic_product_product_list_queryForm" exportUrl="/X6Basic/product/product/list-query.action">
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="ownerStaff" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="effectStaff" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="modifyStaff" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="createStaff" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="deleteStaff" />
		<input type="hidden" id="sysbase_1_0_staff_base_staff" value="creator" />
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('X6Basic.entityname.radion1368671300636')}_${getText('X6Basic.viewtitle.radion1368682273179')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<#assign advFlag = getAdvClassific('X6Basic_1.0_product_list')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="X6Basic_1.0_product_list" formId="ec_X6Basic_product_product_list_queryForm" dataTableId="ec_X6Basic_product_product_list_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_X6Basic_product_product_list_queryForm" formId="ec_X6Basic_product_product_list_queryForm"  fieldcodes="X6Basic_1.0_product_Product_code_code:X6Basic.propertydisplayName.radion1368681604500||X6Basic_1.0_product_Product_name_name:X6Basic.propertydisplayName.radion1368681673024||X6Basic_1.0_product_Product_specific_specific:X6Basic.propertydisplayName.radion1368681879062||X6Basic_1.0_product_Product_model_model:X6Basic.propertydisplayName.radion1368681895029||X6Basic_1.0_product_Product_createDate_createDate:X6Basic.propertydisplayName.radion1368682378525||base_staff_name_creator_name:X6Basic.propertydisplayName.radion1368682044237||X6Basic_1.0_product_Product_unit_unit:X6Basic.propertydisplayName.radion1368681711641" > 
							<@queryfield formId="ec_X6Basic_product_product_list_queryForm" code="X6Basic_1.0_product_Product_code" showFormat="TEXT" divCode="X6Basic_1.0_product_Product_code_code" isCustomize=true > 
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
										<#if (code_defaultValue)?has_content>
											<@mneclient formId="ec_X6Basic_product_product_list_queryForm" value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="X6Basic.product.product.list._querycustomFunc('code')" name="code" id="ec_X6Basic_product_product_list_queryForm_code" displayFieldName="code" exp="like" classStyle="cui-noborder-input"  url="/X6Basic/product/product/mneClient.action" multiple=false mnewidth=260 searchClick="X6Basic.product.product.list.query('query')" />
										<#else>
											<@mneclient formId="ec_X6Basic_product_product_list_queryForm"  conditionfunc="X6Basic.product.product.list._querycustomFunc('code')" name="code" id="ec_X6Basic_product_product_list_queryForm_code" displayFieldName="code" exp="like" classStyle="cui-noborder-input"  url="/X6Basic/product/product/mneClient.action" multiple=false mnewidth=260 searchClick="X6Basic.product.product.list.query('query')" />
										</#if>
							</@queryfield>
							<@queryfield formId="ec_X6Basic_product_product_list_queryForm" code="X6Basic_1.0_product_Product_name" showFormat="TEXT" divCode="X6Basic_1.0_product_Product_name_name" isCustomize=true > 
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
										<#if (name_defaultValue)?has_content>
											<@mneclient formId="ec_X6Basic_product_product_list_queryForm" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   conditionfunc="X6Basic.product.product.list._querycustomFunc('name')" name="name" id="ec_X6Basic_product_product_list_queryForm_name" displayFieldName="name" exp="like" classStyle="cui-noborder-input"  url="/X6Basic/product/product/mneClient.action" multiple=false mnewidth=260 searchClick="X6Basic.product.product.list.query('query')" />
										<#else>
											<@mneclient formId="ec_X6Basic_product_product_list_queryForm"  conditionfunc="X6Basic.product.product.list._querycustomFunc('name')" name="name" id="ec_X6Basic_product_product_list_queryForm_name" displayFieldName="name" exp="like" classStyle="cui-noborder-input"  url="/X6Basic/product/product/mneClient.action" multiple=false mnewidth=260 searchClick="X6Basic.product.product.list.query('query')" />
										</#if>
							</@queryfield>
							<@queryfield formId="ec_X6Basic_product_product_list_queryForm" code="X6Basic_1.0_product_Product_specific" showFormat="TEXT" divCode="X6Basic_1.0_product_Product_specific_specific" isCustomize=true > 
							<#assign specific_defaultValue  = ''>
									<#assign specific_defaultValue  = ''>
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="specific" id="specific" value="${specific_defaultValue!}" deValue="${specific_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<@queryfield formId="ec_X6Basic_product_product_list_queryForm" code="X6Basic_1.0_product_Product_model" showFormat="TEXT" divCode="X6Basic_1.0_product_Product_model_model" isCustomize=true > 
							<#assign model_defaultValue  = ''>
									<#assign model_defaultValue  = ''>
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="model" id="model" value="${model_defaultValue!}" deValue="${model_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
							<@queryfield formId="ec_X6Basic_product_product_list_queryForm" code="X6Basic_1.0_product_Product_createDate" showFormat="YMD" divCode="X6Basic_1.0_product_Product_createDate_createDate" isCustomize=true > 
							<#assign createDate_defaultValue  = ''>
									<#assign createDate_defaultValue  = ''>
								<#if (createDate_defaultValue)?? &&(createDate_defaultValue)?has_content>
									<#assign createDate_defaultValue  = getDefaultDateTime(createDate_defaultValue!)?date>
								</#if>
								<div>
							  	 	<div style="float:left;width:45%">
									<@datepicker cssClass="cui-noborder-input" type="date" value="${createDate_defaultValue!}" deValue="${createDate_defaultValue!}"  name="createDate_start" id="createDate_start" exp="gequal"   formid="ec_X6Basic_product_product_list_queryForm" />
									</div>
									<div style="float:left;margin:1px 3px 0px;*margin-top:3px;"> ${getText('common.date.split')}</div>
							  	 	<div style="float:left;width:45%">
									<@datepicker cssClass="cui-noborder-input" type="date" value="${createDate_defaultValue!}" deValue="${createDate_defaultValue!}"  name="createDate_end" id="createDate_end" exp="lequal"   formid="ec_X6Basic_product_product_list_queryForm" />
							  		</div>
						  		</div>
							</@queryfield>
							<@queryfield formId="ec_X6Basic_product_product_list_queryForm" code="base_staff_name" showFormat="SELECTCOMP" divCode="base_staff_name_creator_name" isCustomize=true > 
							<#assign creator_name_defaultValue  = ''>
									<#assign creator_name_defaultValue  = ''>
										<input type="hidden" id="creator.id" name="creator.id" value="" />
												<#if (creator_name_defaultValue)=='currentUser'>
													<@mneclient  value="${Session.staff.name}" deValue="currentUser" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="X6Basic.product.product.list._querycustomFunc('creator_name')" name="creator.name" id="ec_X6Basic_product_product_list_queryForm_creator_name" displayFieldName="name" type="Staff" exp="like" classStyle="cui-noborder-input" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="ec_X6Basic_product_product_list_queryForm" searchClick="X6Basic.product.product.list.query('query')" />
													<script type="text/javascript">
													(function($){
														$(function(){
															CUI('#creator.id').val('${Session.staff.id}');
														});
													})(jQuery);
													</script>
												<#else>
													<@mneclient  reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="X6Basic.product.product.list._querycustomFunc('creator_name')" name="creator.name" id="ec_X6Basic_product_product_list_queryForm_creator_name" displayFieldName="name" type="Staff" exp="like" classStyle="cui-noborder-input" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="ec_X6Basic_product_product_list_queryForm" searchClick="X6Basic.product.product.list.query('query')" />
												</#if>
							</@queryfield>
							<@queryfield formId="ec_X6Basic_product_product_list_queryForm" code="X6Basic_1.0_product_Product_unit" showFormat="TEXT" divCode="X6Basic_1.0_product_Product_unit_unit" isCustomize=true > 
							<#assign unit_defaultValue  = ''>
									<#assign unit_defaultValue  = ''>
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="unit" id="unit" value="${unit_defaultValue!}" deValue="${unit_defaultValue!}"   exp="like"/>
											</div>
							</@queryfield>
					       	<@querybutton formId="ec_X6Basic_product_product_list_queryForm" type="adv" onclick="if(typeof X6Basic.product.product.list.cancelSelectedNode == 'function') {X6Basic.product.product.list.cancelSelectedNode();}X6Basic.product.product.list.query('query')" onadvancedclick="advQuery()" /> 
					 		<@querybutton formId="ec_X6Basic_product_product_list_queryForm" type="clear"  /> 
					     </@quickquery>
	</form>
</div><#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "X6Basic.product.product.list.query('query')">
<#assign datatable_dataUrl = "/X6Basic/product/product/list-query.action">
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_X6Basic_product_product_list_query" modelCode="X6Basic_1.0_product_Product" noPermissionKeys="code,name,specific,model,unit,currQuantity,creator.name,createDate" hidekeyPrefix="ec_X6Basic_product_product_list_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_X6Basic_product_product_list_queryForm" firstLoad=datatable_firstLoad  exportExcel=true dblclick="X6Basic.product.product.list.dbmodifylist" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','creator.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&permissionCode =${permissionCode!''}'">
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:list_add_add_X6Basic_1.0_product_list||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1368685397748')}||iconcls:add||useInMore:false||onclick:
				X6Basic.product.product.list.addlist()
		" 
		resultType="json" />
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:list_modify_modify_X6Basic_1.0_product_list||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1368685419394')}||iconcls:modify||useInMore:false||onclick:
				X6Basic.product.product.list.modifylist()
		" 
		resultType="json" />
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:list_delete_del_X6Basic_1.0_product_list||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1368685441090')}||iconcls:del||useInMore:false||onclick:
				X6Basic.product.product.list.dellist()
		" 
		resultType="json" />
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		</#if>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"  label="${getText('X6Basic.propertydisplayName.radion1368681604500')}" textalign="center"  width=100  type="textfield"    />
			<#assign name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"  label="${getText('X6Basic.propertydisplayName.radion1368681673024')}" textalign="center"  width=100  type="textfield"    />
			<#assign specific_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${specific_displayDefaultType!}"  key="specific"  label="${getText('X6Basic.propertydisplayName.radion1368681879062')}" textalign="center"  width=100  type="textfield"    />
			<#assign model_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${model_displayDefaultType!}"  key="model"  label="${getText('X6Basic.propertydisplayName.radion1368681895029')}" textalign="center"  width=100  type="textfield"    />
			<#assign unit_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${unit_displayDefaultType!}"  key="unit"  label="${getText('X6Basic.propertydisplayName.radion1368681711641')}" textalign="center"  width=100  type="textfield"    />
			<#assign currQuantity_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${currQuantity_displayDefaultType!}"  key="currQuantity"  label="${getText('X6Basic.propertydisplayName.radion1368847653211')}" textalign="right" decimal="2" width=100  type="decimal"    />
			<#assign creator_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${creator_name_displayDefaultType!}"  key="creator.name"  label="${getText('X6Basic.propertydisplayName.radion1368682044237')}" textalign="center"  width=100  type="textfield"    />
			<#assign createDate_displayDefaultType  = ''>
			<@datacolumn   showFormat="YMD" defaultDisplay="${createDate_displayDefaultType!}"  key="createDate"  label="${getText('X6Basic.propertydisplayName.radion1368682378525')}" textalign="center"  width=100  type="date"    />
</@datatable>