	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1419232311198')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryForm" exportUrl="/MESBasic/factoryModel/factoryModel/workCenterRefPart-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1419232346350')}_${getText('MESBasic.viewtitle.randon1515639160321')}.xls" />
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
		<div id="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_factoryModel_workCenterRefPart')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_factoryModel_workCenterRefPart" formId="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryForm" dataTableId="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryForm" isExpandAll=true formId="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryForm" idprefix="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart" expandType="all"  fieldcodes="MESBasic_1_factoryModel_FactoryModel_code_code:MESBasic.propertydisplayName.radion1419233767027||MESBasic_1_factoryModel_FactoryModel_name_name:MESBasic.propertydisplayName.radion141923322393782||MESBasic_1_nodeType_NodeType_name_nodeType_name:MESBasic.propertydisplayName.randon1460947375824" > 
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryForm" code="MESBasic_1_factoryModel_FactoryModel_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="MESBasic_1_factoryModel_FactoryModel_code_code" isCustomize=true > 
										<#if (code_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryForm"  isPrecise=true value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="MESBasic.factoryModel.factoryModel.workCenterRefPart._querycustomFunc('code')" name="code" id="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryForm_code" displayFieldName="code" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/factoryModel/factoryModel/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.factoryModel.factoryModel.workCenterRefPart.commonQuery('query')"  currentViewCode="MESBasic_1_factoryModel_workCenterRefPart"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryForm"  isPrecise=true  conditionfunc="MESBasic.factoryModel.factoryModel.workCenterRefPart._querycustomFunc('code')" name="code" id="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryForm_code" displayFieldName="code" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/factoryModel/factoryModel/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.factoryModel.factoryModel.workCenterRefPart.commonQuery('query')" currentViewCode="MESBasic_1_factoryModel_workCenterRefPart"  realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryForm" code="MESBasic_1_factoryModel_FactoryModel_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="MESBasic_1_factoryModel_FactoryModel_name_name" isCustomize=true > 
										<#if (name_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryForm"  isPrecise=true value="${name_defaultValue!}" deValue="${name_defaultValue!}"   conditionfunc="MESBasic.factoryModel.factoryModel.workCenterRefPart._querycustomFunc('name')" name="name" id="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryForm_name" displayFieldName="name" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/factoryModel/factoryModel/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.factoryModel.factoryModel.workCenterRefPart.commonQuery('query')"  currentViewCode="MESBasic_1_factoryModel_workCenterRefPart"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryForm"  isPrecise=true  conditionfunc="MESBasic.factoryModel.factoryModel.workCenterRefPart._querycustomFunc('name')" name="name" id="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryForm_name" displayFieldName="name" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/factoryModel/factoryModel/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.factoryModel.factoryModel.workCenterRefPart.commonQuery('query')" currentViewCode="MESBasic_1_factoryModel_workCenterRefPart"  realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign nodeType_name_defaultValue  = ''>
									<#assign nodeType_name_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryForm" code="MESBasic_1_nodeType_NodeType_name" showFormat="SELECTCOMP" defaultValue=nodeType_name_defaultValue  divCode="MESBasic_1_nodeType_NodeType_name_nodeType_name" isCustomize=true > 
										<input type="hidden" id="nodeType.id" name="nodeType.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${nodeType_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1460947537367')}"  conditionfunc="MESBasic.factoryModel.factoryModel.workCenterRefPart._querycustomFunc('nodeType_name')" name="nodeType.name" id="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryForm_nodeType_name" displayFieldName="name" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/nodeType/nodeType/noderef.action"   refViewCode="MESBasic_1_nodeType_noderef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryForm" searchClick="MESBasic.factoryModel.factoryModel.workCenterRefPart.commonQuery('query')"   />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryForm" type="adv" onclick="MESBasic.factoryModel.factoryModel.workCenterRefPart.commonQuery('query')" onadvancedclick="advQuery('MESBasic.factoryModel.factoryModel.workCenterRefPart.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_quickquery_info={};
ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_quickquery_info["MainTableName"]="factory_tbcompanystructure";
ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_quickquery_info["code"]={};
ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_quickquery_info["code"].dbColumnType="TEXT";
ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_quickquery_info["code"].layRec="code";
ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_quickquery_info["code"].columnName="CODE";
ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_quickquery_info["name"]={};
ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_quickquery_info["name"].dbColumnType="TEXT";
ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_quickquery_info["name"].layRec="name";
ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_quickquery_info["name"].columnName="NODENAME";
ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_quickquery_info["nodeType.name"]={};
ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_quickquery_info["nodeType.name"].dbColumnType="TEXT";
ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_quickquery_info["nodeType.name"].layRec="factory_tbnodetype,ID,factory_tbcompanystructure,NODE_TYPE-name";
ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_quickquery_info["nodeType.name"].columnName="NAME";
ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_quickquery_info["nodeType.id"]={};
ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_quickquery_info["nodeType.id"].dbColumnType="LONG";
ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_quickquery_info["nodeType.id"].layRec="factory_tbnodetype,ID,factory_tbcompanystructure,NODE_TYPE-name";
ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_quickquery_info["nodeType.id"].columnName="ID";
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
<div style="position:relative;z-index:10;display:none" id="MESBasic.factoryModel.factoryModel.workCenterRefPart.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_adv_queryForm" exportUrl="/MESBasic/factoryModel/factoryModel/workCenterRefPart-query.action">
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_adv_queryForm" code="MESBasic_1_factoryModel_FactoryModel_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="MESBasic_1_factoryModel_FactoryModel_code_code" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_factoryModel_FactoryModel" layRec="code" columnname="CODE" columntype="TEXT" name="code" fieldType="TEXTFIELD" tableName="factory_tbcompanystructure"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										节点编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_factoryModel_FactoryModel" />
										<#if (code_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_adv_queryForm"  isPrecise=true value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="MESBasic.factoryModel.factoryModel.workCenterRefPart._querycustomFunc('code')" name="code" id="adv_ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryForm_code" displayFieldName="code" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/factoryModel/factoryModel/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_factoryModel_workCenterRefPart"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_adv_queryForm"  isPrecise=true  conditionfunc="MESBasic.factoryModel.factoryModel.workCenterRefPart._querycustomFunc('code')" name="code" id="adv_ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryForm_code" displayFieldName="code" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/factoryModel/factoryModel/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_factoryModel_workCenterRefPart"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_adv_queryForm" code="MESBasic_1_factoryModel_FactoryModel_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="MESBasic_1_factoryModel_FactoryModel_name_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_factoryModel_FactoryModel" layRec="name" columnname="NODENAME" columntype="TEXT" name="name" fieldType="TEXTFIELD" tableName="factory_tbcompanystructure"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										节点名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_factoryModel_FactoryModel" />
										<#if (name_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_adv_queryForm"  isPrecise=true value="${name_defaultValue!}" deValue="${name_defaultValue!}"   conditionfunc="MESBasic.factoryModel.factoryModel.workCenterRefPart._querycustomFunc('name')" name="name" id="adv_ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryForm_name" displayFieldName="name" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/factoryModel/factoryModel/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_factoryModel_workCenterRefPart"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_adv_queryForm"  isPrecise=true  conditionfunc="MESBasic.factoryModel.factoryModel.workCenterRefPart._querycustomFunc('name')" name="name" id="adv_ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryForm_name" displayFieldName="name" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/factoryModel/factoryModel/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_factoryModel_workCenterRefPart"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign nodeType_name_defaultValue  = ''>
									<#assign nodeType_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_adv_queryForm" code="MESBasic_1_nodeType_NodeType_name" showFormat="SELECTCOMP" defaultValue=nodeType_name_defaultValue  divCode="MESBasic_1_nodeType_NodeType_name_nodeType_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_nodeType_NodeType" layRec="factory_tbnodetype,ID,factory_tbcompanystructure,NODE_TYPE-name" columnname="NAME" columntype="TEXT" name="nodeType.name" fieldType="SELECTCOMP" tableName="factory_tbnodetype"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										类型名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_nodeType_NodeType" />
										<input type="hidden" id="adv_nodeType.id" name="nodeType.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_nodeType.id"  isPrecise=true deValue="${nodeType_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1460947537367')}"  conditionfunc="MESBasic.factoryModel.factoryModel.workCenterRefPart._querycustomFunc('nodeType_name')" name="nodeType.name" id="adv_ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryForm_nodeType_name" displayFieldName="name" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/nodeType/nodeType/noderef.action"   refViewCode="MESBasic_1_nodeType_noderef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							
					   
	</form>
	</div>
	<div style="border-top: 1px solid #E1E1E1;height:25px;">
		<div style="float:left;margin-top:5px;cursor: pointer;" onclick="changeCustomQuery();"><span style="margin-left:5px;font-weight:bold;color:#0f78bc;">自定义</span></div>
		<div class="move-grade" style="display:none;float:left;margin-top:5px;">
			<span class="custombtn downgrade" onclick="ec.advQuery.query._upgrade()">升级</span>
			<span class="custombtn upgrade" onclick="ec.advQuery.query._downgrade()">降级</span>
			<span class="custombtn upmove" onclick="ec.advQuery.query._moveUp()">上移</span>
			<span class="custombtn downmove" onclick="ec.advQuery.query._moveDown()">下移</span>
		</div>			
		<div style="float:right;margin-top:5px;"><span class="customQuery" onclick="changeCustomQuery();"></span></div>
	</div>
	<div style=""><table id="advQueryLoading" style="width:100%;height:240px;text-align:center;"><tr><td><label class="advQuery-loading">数据加载中...</label></td></tr></table></div>
	<div style="clear:both;display:none;" id="customquContent" class="customqu-content">		
	</div>	
</div>
<script type="text/javascript" language="javascript">
CUI.ns("ec.view.newAdvQuery");
ec.view.newAdvQuery._initNewAdvQuery=function(values){
		ec.advQuery.query = new CUI.NewAdvQuery({
			elementId: 'advQueryContainer',
			env: 'runtime',
			viewCode: 'MESBasic_1_factoryModel_workCenterRefPart',
			modelCode: 'MESBasic_1_factoryModel_FactoryModel',
			modelName: 'FactoryModel',
			formId: 'ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryForm',
			olddiv: 'MESBasic.factoryModel.factoryModel.workCenterRefPart.advquery',
			values: values
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$('#advQueryLoading').show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_factoryModel_workCenterRefPart'+"&entity.code="+'MESBasic_1_factoryModel';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("#customquContent").html(html);
		 	$('#advQueryLoading').hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$('#advQueryLoading').show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_factoryModel_workCenterRefPart'+"&entity.code="+'MESBasic_1_factoryModel';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
		 	$("#customquContent").html(html);
		 	$('#advQueryLoading').hide();
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
		$('div.customqu-content').css('display','none');
		$('div.move-grade').css('display','none');
		$('span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('div.customqu-content').css('display','block');
		$('div.move-grade').css('display','block');
		$('span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('div.advConContent').css('height','130px');
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
		$('span.customQuery_preview_result').css('background','url("/bap/struts/css/icon_adv.png") 0 -185px no-repeat');
		$('div.customQuery_cond').css('display','block');
		ec.advQuery.query.getViewResult();
		showType_result = "up";
	}else{			
		$('div.customquery_column').css('display','block');
		$('div.customquery_column').css('height','240px');
		$('span.customQuery_preview_result').css('background','url("/bap/struts/css/icon_adv.png") 0 -204px no-repeat');				
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
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "MESBasic.factoryModel.factoryModel.workCenterRefPart.query('query')">
<#assign datatable_dataUrl = "/MESBasic/factoryModel/factoryModel/workCenterRefPart-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_query" renderOverEvent="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_RenderOverEvent" pageInitMethod="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_PageInitMethod" modelCode="MESBasic_1_factoryModel_FactoryModel" noPermissionKeys="name,code,nodeType.name,area,description" hidekeyPrefix="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="MESBasic.factoryModel.factoryModel.workCenterRefPart.dbClickViewworkCenterRefPart" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','area.id','nodeType.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.factoryModel.factoryModel.workCenterRefPart.showErrorMsg">
				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30/>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="NODENAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('MESBasic.propertydisplayName.radion141923322393782')}" textalign="left"  width=140   type="textfield"    showFormatFunc=""/>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('MESBasic.propertydisplayName.radion1419233767027')}" textalign="left"  width=120   type="textfield"    showFormatFunc=""/>
			<#assign nodeType_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${nodeType_name_displayDefaultType!}"  key="nodeType.name"   label="${getText('MESBasic.propertydisplayName.randon1460947375824')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign area_displayDefaultType  = ''>
			<@datacolumn columnName="AREA"    showFormat="SELECTCOMP" defaultDisplay="${area_displayDefaultType!}"  key="area.value"   label="${getText('MESBasic.propertydisplayName.randon1489991460442')}" textalign="left"  width=100   type="systemcode"    showFormatFunc=""/>
			<#assign description_displayDefaultType  = ''>
			<@datacolumn columnName="NODEDESC"    showFormat="TEXT" defaultDisplay="${description_displayDefaultType!}"  key="description"   label="${getText('MESBasic.propertydisplayName.radion1419233695132')}" textalign="left"  width=140   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_RenderOverEvent(){
}
function ec_MESBasic_factoryModel_factoryModel_workCenterRefPart_PageInitMethod(){
}
	
	
	
	
	
</script>