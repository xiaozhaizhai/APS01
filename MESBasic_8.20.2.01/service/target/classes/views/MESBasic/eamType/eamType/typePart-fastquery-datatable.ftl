	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1516068319335')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_eamType_eamType_typePart_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_eamType_eamType_typePart_queryForm" exportUrl="/MESBasic/eamType/eamType/typePart-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1516068385649')}_${getText('MESBasic.viewtitle.randon1516069324289')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="fastQueryCond" name="fastQueryCond" />
		<input type="hidden" id="excelQueryCond" name="exportFastQueryCond" />
		<input type="hidden" class="nodeInfo" />
		<input type="hidden" id="treeNodeSelected" name="treeNodeSelected" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<input type="hidden" id="currentSqlType"  value="5" />
		<div id="ec_MESBasic_eamType_eamType_typePart_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_eamType_eamType_typePart_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_eamType_typePart')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_eamType_typePart" formId="ec_MESBasic_eamType_eamType_typePart_queryForm" dataTableId="ec_MESBasic_eamType_eamType_typePart_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_eamType_eamType_typePart_queryForm" isExpandAll=true formId="ec_MESBasic_eamType_eamType_typePart_queryForm" idprefix="ec_MESBasic_eamType_eamType_typePart" expandType="all"  fieldcodes="MESBasic_1_eamType_EamType_code_code:MESBasic.propertydisplayName.randon1516068419324||MESBasic_1_eamType_EamType_name_name:MESBasic.propertydisplayName.randon1516068643374" > 
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_eamType_eamType_typePart_queryForm" code="MESBasic_1_eamType_EamType_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="MESBasic_1_eamType_EamType_code_code" isCustomize=true style="" > 
										<#if (code_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_eamType_eamType_typePart_queryForm"  isPrecise=true value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="MESBasic.eamType.eamType.typePart._querycustomFunc('code')" name="code" id="ec_MESBasic_eamType_eamType_typePart_queryForm_code" displayFieldName="code" exp="equal" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/eamType/eamType/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.eamType.eamType.typePart.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_eamType_eamType_typePart_queryForm"  isPrecise=true  conditionfunc="MESBasic.eamType.eamType.typePart._querycustomFunc('code')" name="code" id="ec_MESBasic_eamType_eamType_typePart_queryForm_code" displayFieldName="code" exp="equal" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/eamType/eamType/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.eamType.eamType.typePart.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_eamType_eamType_typePart_queryForm" code="MESBasic_1_eamType_EamType_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="MESBasic_1_eamType_EamType_name_name" isCustomize=true style="" > 
										<#if (name_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_eamType_eamType_typePart_queryForm"  isPrecise=true value="${name_defaultValue!}" deValue="${name_defaultValue!}"   conditionfunc="MESBasic.eamType.eamType.typePart._querycustomFunc('name')" name="name" id="ec_MESBasic_eamType_eamType_typePart_queryForm_name" displayFieldName="name" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/eamType/eamType/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.eamType.eamType.typePart.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_eamType_eamType_typePart_queryForm"  isPrecise=true  conditionfunc="MESBasic.eamType.eamType.typePart._querycustomFunc('name')" name="name" id="ec_MESBasic_eamType_eamType_typePart_queryForm_name" displayFieldName="name" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/eamType/eamType/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.eamType.eamType.typePart.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_eamType_eamType_typePart_queryForm" type="adv" onclick="MESBasic.eamType.eamType.typePart.commonQuery('query')" onadvancedclick="advQuery('MESBasic.eamType.eamType.typePart.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_eamType_eamType_typePart_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_eamType_eamType_typePart_quickquery_info={};
ec_MESBasic_eamType_eamType_typePart_quickquery_info["MainTableName"]="EAM_EAMTYPE";
ec_MESBasic_eamType_eamType_typePart_quickquery_info["code"]={};
ec_MESBasic_eamType_eamType_typePart_quickquery_info["code"].dbColumnType="BAPCODE";
ec_MESBasic_eamType_eamType_typePart_quickquery_info["code"].layRec="code";
ec_MESBasic_eamType_eamType_typePart_quickquery_info["code"].columnName="EAMTYPE_CODE";
ec_MESBasic_eamType_eamType_typePart_quickquery_info["name"]={};
ec_MESBasic_eamType_eamType_typePart_quickquery_info["name"].dbColumnType="TEXT";
ec_MESBasic_eamType_eamType_typePart_quickquery_info["name"].layRec="name";
ec_MESBasic_eamType_eamType_typePart_quickquery_info["name"].columnName="EAMTYPE_NAME";
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
<script>
 $(function(){
 	var advRemainDialog = $('[id="MESBasic.eamType.eamType.typePart.advquery"]');
 	advRemainDialog.length>1 && advRemainDialog.eq(0).remove();
 });
</script>
<style>
	.customQuery_down {
		background: url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat;
	}
	.customQuery_up {
		background: url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat;
	}
	.customQuery_preview_result_down {
		background: url("/bap/struts/css/icon_adv.png") 0 -185px no-repeat;
	}
	.customQuery_preview_result_up {
		background: url("/bap/struts/css/icon_adv.png") 0 -204px no-repeat;
	}
</style>
<div style="position:relative;z-index:10;display:none;" id="MESBasic.eamType.eamType.typePart.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_eamType_eamType_typePart_adv_queryForm" exportUrl="/MESBasic/eamType/eamType/typePart-query.action">
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_eamType_eamType_typePart_adv_queryForm" code="MESBasic_1_eamType_EamType_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="MESBasic_1_eamType_EamType_code_code" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_eamType_EamType" layRec="code" columnname="EAMTYPE_CODE" columntype="BAPCODE" name="code" fieldType="TEXTFIELD" tableName="EAM_EAMTYPE"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_eamType_EamType" />
										<#if (code_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_eamType_eamType_typePart_adv_queryForm"  isPrecise=true value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="MESBasic.eamType.eamType.typePart._querycustomFunc('code')" name="code" id="adv_ec_MESBasic_eamType_eamType_typePart_queryForm_code" displayFieldName="code" exp="equal"  classStyle="cui-noborder-input"  url="/MESBasic/eamType/eamType/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_eamType_typePart"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_eamType_eamType_typePart_adv_queryForm"  isPrecise=true  conditionfunc="MESBasic.eamType.eamType.typePart._querycustomFunc('code')" name="code" id="adv_ec_MESBasic_eamType_eamType_typePart_queryForm_code" displayFieldName="code" exp="equal"  classStyle="cui-noborder-input"  url="/MESBasic/eamType/eamType/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_eamType_typePart"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_eamType_eamType_typePart_adv_queryForm" code="MESBasic_1_eamType_EamType_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="MESBasic_1_eamType_EamType_name_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_eamType_EamType" layRec="name" columnname="EAMTYPE_NAME" columntype="TEXT" name="name" fieldType="TEXTFIELD" tableName="EAM_EAMTYPE"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										设备类型
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_eamType_EamType" />
										<#if (name_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_eamType_eamType_typePart_adv_queryForm"  isPrecise=true value="${name_defaultValue!}" deValue="${name_defaultValue!}"   conditionfunc="MESBasic.eamType.eamType.typePart._querycustomFunc('name')" name="name" id="adv_ec_MESBasic_eamType_eamType_typePart_queryForm_name" displayFieldName="name" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/eamType/eamType/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_eamType_typePart"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_eamType_eamType_typePart_adv_queryForm"  isPrecise=true  conditionfunc="MESBasic.eamType.eamType.typePart._querycustomFunc('name')" name="name" id="adv_ec_MESBasic_eamType_eamType_typePart_queryForm_name" displayFieldName="name" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/eamType/eamType/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_eamType_typePart"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign otherspecial_defaultValue  = ''>
									<#assign otherspecial_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_eamType_eamType_typePart_adv_queryForm" code="MESBasic_1_eamType_EamType_otherspecial" showFormat="SELECTCOMP" defaultValue=otherspecial_defaultValue  divCode="MESBasic_1_eamType_EamType_otherspecial_otherspecial" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_eamType_EamType" layRec="otherspecial" columnname="EAMTYPE_OTHERSPECIAL" columntype="SYSTEMCODE" name="otherspecial" fieldType="SELECTCOMP" tableName="EAM_EAMTYPE"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										其他特殊设备
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_eamType_EamType" />
										<@systemcode  advquery=true onchange="" ecFlag=true deValue="${otherspecial_defaultValue}"   name="otherspecial" code="1005" classStyle="cui-noborder-input" value="" />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign isspecial_defaultValue  = ''>
									<#assign isspecial_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_eamType_eamType_typePart_adv_queryForm" code="MESBasic_1_eamType_EamType_isspecial" showFormat="SELECT" defaultValue=isspecial_defaultValue  divCode="MESBasic_1_eamType_EamType_isspecial_isspecial" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_eamType_EamType" layRec="isspecial" columnname="EAMTYPE_ISSPECIAL" columntype="BOOLEAN" name="isspecial" fieldType="SELECT" tableName="EAM_EAMTYPE"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										特种设备
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_eamType_EamType" />
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${isspecial_defaultValue!}" name="isspecial" id="adv_isspecial" exp="equal"   value=""> 
											<option value=""></option>
											<option value="1" <#if (isspecial_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (isspecial_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign isMea_defaultValue  = ''>
									<#assign isMea_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_eamType_eamType_typePart_adv_queryForm" code="MESBasic_1_eamType_EamType_isMea" showFormat="SELECT" defaultValue=isMea_defaultValue  divCode="MESBasic_1_eamType_EamType_isMea_isMea" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_eamType_EamType" layRec="isMea" columnname="EAMTYPE_ISMEA" columntype="BOOLEAN" name="isMea" fieldType="SELECT" tableName="EAM_EAMTYPE"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										测量设备
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_eamType_EamType" />
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${isMea_defaultValue!}" name="isMea" id="adv_isMea" exp="equal"   value=""> 
											<option value=""></option>
											<option value="1" <#if (isMea_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (isMea_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign eamtypeAttribute_defaultValue  = ''>
									<#assign eamtypeAttribute_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_eamType_eamType_typePart_adv_queryForm" code="MESBasic_1_eamType_EamType_eamtypeAttribute" showFormat="SELECT" defaultValue=eamtypeAttribute_defaultValue  divCode="MESBasic_1_eamType_EamType_eamtypeAttribute_eamtypeAttribute" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_eamType_EamType" layRec="eamtypeAttribute" columnname="EAMTYPE_ATTRIBUTE" columntype="BOOLEAN" name="eamtypeAttribute" fieldType="SELECT" tableName="EAM_EAMTYPE"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										末级
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_eamType_EamType" />
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${eamtypeAttribute_defaultValue!}" name="eamtypeAttribute" id="adv_eamtypeAttribute" exp="equal"   value=""> 
											<option value=""></option>
											<option value="1" <#if (eamtypeAttribute_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (eamtypeAttribute_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							
					   
	</form>
	</div>
	<div class="view-custom" style="border-top: 1px solid #E1E1E1;height:25px;">
	<div class="view-custom-div" style="float:left;margin-top:5px;cursor: pointer;" onclick="changeCustomQuery();"><span class="view-custom-span" style="margin-left:5px;font-weight:bold;color:#0f78bc;">${getText('foundation.common.custom')}</span></div>
		<div class="move-grade" style="display:none;float:left;margin-top:5px;">
			<span class="custombtn downgrade" onclick="ec.advQuery.query._upgrade()"> ${getText('foundation.common.upgrade')}</span>
			<span class="custombtn upgrade" onclick="ec.advQuery.query._downgrade()">${getText('foundation.common.downgrade')}</span>
			<span class="custombtn upmove" onclick="ec.advQuery.query._moveUp()">${getText('foundation.common.up')}</span>
			<span class="custombtn downmove" onclick="ec.advQuery.query._moveDown()">${getText('foundation.common.down')}</span>
		</div>			
		<div style="float:right;margin-top:5px;"><span class="customQuery" onclick="changeCustomQuery();"></span></div>
	</div>
	<div style=""><table id="advQueryLoading" style="width:100%;height:240px;text-align:center;"><tr><td><label class="advQuery-loading">${getText('foundation.common.data.waiting')}</label></td></tr></table></div>
	<div style="clear:both;display:none;" id="customquContent" class="customqu-content">		
	</div>	
</div>
<script type="text/javascript" language="javascript">
CUI.ns("ec.view.newAdvQuery");
ec.view.newAdvQuery._initNewAdvQuery=function(values){
		ec.advQuery.query = new CUI.NewAdvQuery({
			elementId: 'advQueryContainer',
			env: 'runtime',
			viewCode: 'MESBasic_1_eamType_typePart',
			modelCode: 'MESBasic_1_eamType_EamType',
			modelName: 'EamType',
			formId: 'ec_MESBasic_eamType_eamType_typePart_queryForm',
			olddiv: 'MESBasic.eamType.eamType.typePart.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.eamType.eamType.typePart.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_eamType_typePart'+"&entity.code="+'MESBasic_1_eamType';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.eamType.eamType.typePart.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.eamType.eamType.typePart.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.eamType.eamType.typePart.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_eamType_typePart'+"&entity.code="+'MESBasic_1_eamType';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.eamType.eamType.typePart.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.eamType.eamType.typePart.advquery'] #advQueryLoading").hide();
		 }
	});
	ec.advQuery._renderOverFlag=true;
}
var showType = "down";
var onceOpen = false;		//标识自定义查询是否加载过，避免重复加载
var showType_result = "down";
//点击自定义查询按钮后，展示自定义 查询or隐藏自定义查询
function changeCustomQuery(){
	if(showType == "up"){
		$('[id="MESBasic.eamType.eamType.typePart.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.eamType.eamType.typePart.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.eamType.eamType.typePart.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.eamType.eamType.typePart.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.eamType.eamType.typePart.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.eamType.eamType.typePart.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.eamType.eamType.typePart.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.eamType.eamType.typePart.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.eamType.eamType.typePart.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.eamType.eamType.typePart.advquery"] div.advConContent').css('height','130px');
		if(!onceOpen){
			customQuery();
			onceOpen = true;
		}
		showType = "up";
	}
}
//点击预览方案按钮后，展示预览方案or隐藏预览方案
function changeCustomQueryResult(){
	if(showType_result == "down"){
		$('div.customquery_column').css('display','none');
		// $('span.customQuery_preview_result').css('background','url("/bap/struts/css/icon_adv.png") 0 -185px no-repeat');
		$('span.customQuery_preview_result').removeClass("customQuery_preview_result_up").addClass("customQuery_preview_result_down");
		$('div.customQuery_cond').css('display','block');
		ec.advQuery.query.getViewResult();
		showType_result = "up";
	}else{			
		$('div.customquery_column').css('display','block');
		$('div.customquery_column').css('height','240px');
		// $('span.customQuery_preview_result').css('background','url("/bap/struts/css/icon_adv.png") 0 -204px no-repeat');
		$('span.customQuery_preview_result').removeClass("customQuery_preview_result_down").addClass("customQuery_preview_result_up");				
		$('div.customQuery_cond').css('display','none');
		showType_result = "down";
	}
}
function changeObject(obj){		
	if($(obj).parent().next().css('display')=='block'){
		$(obj).css('background','url("/bap/struts/css/icon_adv.png") 0 -124px no-repeat');
		$(obj).parent().next().css('display','none');
	}else{
		$(obj).css('background','url("/bap/struts/css/icon_adv.png") 0 -40px no-repeat');
		$(obj).parent().next().css('display','block');
	}			
}
</script> <#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
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
<#if (Parameters.multiSelect)??>
<#assign multiSelect = (Parameters.multiSelect)>
</#if>

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "MESBasic.eamType.eamType.typePart.query('query')">
<#assign datatable_dataUrl = "/MESBasic/eamType/eamType/typePart-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_MESBasic_eamType_eamType_typePart_query" renderOverEvent="ec_MESBasic_eamType_eamType_typePart_RenderOverEvent" pageInitMethod="ec_MESBasic_eamType_eamType_typePart_PageInitMethod" modelCode="MESBasic_1_eamType_EamType" noPermissionKeys="code,name,typeMemo" hidekeyPrefix="ec_MESBasic_eamType_eamType_typePart_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_eamType_eamType_typePart_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="MESBasic.eamType.eamType.typePart.dbmodifytypePart" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.eamType.eamType.typePart.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}typePart_add5_add_MESBasic_1_eamType_typePart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1516069379504')}||iconcls:add||useInMore:false||onclick:
				MESBasic.eamType.eamType.typePart.addtypePart()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_eamType_typePart_BUTTON_add5"
		buttonType="ADD" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}typePart_add5_add_MESBasic_1_eamType_typePart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1516069379504')}||iconcls:add||useInMore:false||onclick:
				MESBasic.eamType.eamType.typePart.addtypePart()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}typePart_edit_modify_MESBasic_1_eamType_typePart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1516069398154')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.eamType.eamType.typePart.modifytypePart()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_eamType_typePart_BUTTON_edit"
		buttonType="MODIFY" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}typePart_edit_modify_MESBasic_1_eamType_typePart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1516069398154')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.eamType.eamType.typePart.modifytypePart()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}typePart_delete_del_MESBasic_1_eamType_typePart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1516069413506')}||iconcls:del||useInMore:false||onclick:
					deleteEamType()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_eamType_typePart_BUTTON_delete"
		buttonType="CUSTOM" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}typePart_delete_del_MESBasic_1_eamType_typePart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1516069413506')}||iconcls:del||useInMore:false||onclick:
					deleteEamType()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}typePart_import_import_MESBasic_1_eamType_typePart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1516069430888')}||iconcls:import||useInMore:false||onclick:
				MESBasic.eamType.eamType.typePart.importtypePart()||subButtons:[{text:'${getText('import.file.downloadtemplate')}',handler:function(){MESBasic.eamType.eamType.typePart.downloadTemplatetypePart()},useInMore:'false'}]
		" 
		resultType="json" 
		buttonCode="MESBasic_1_eamType_typePart_BUTTON_import"
		buttonType="IMPORT" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}typePart_import_import_MESBasic_1_eamType_typePart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1516069430888')}||iconcls:import||useInMore:false||onclick:
				MESBasic.eamType.eamType.typePart.importtypePart()||subButtons:[{text:'${getText('import.file.downloadtemplate')}',handler:function(){MESBasic.eamType.eamType.typePart.downloadTemplatetypePart()},useInMore:'false'}]
		" 
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn columnName="EAMTYPE_CODE"    showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('MESBasic.propertydisplayName.randon1516068419324')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="EAMTYPE_NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('MESBasic.propertydisplayName.randon1516068643374')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign typeMemo_displayDefaultType  = ''>
			<@datacolumn columnName="EAMTYPE_MEMO"    showFormat="TEXT" defaultDisplay="${typeMemo_displayDefaultType!}"  key="typeMemo" order=false  label="${getText('MESBasic.propertydisplayName.randon1516068698045')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_eamType_eamType_typePart_RenderOverEvent(){
}
function ec_MESBasic_eamType_eamType_typePart_PageInitMethod(){
}
	
	
	
</script>