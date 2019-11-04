	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1489731859348')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_factoryWare_departmentWare_departWarePart_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_factoryWare_departmentWare_departWarePart_queryForm" exportUrl="/MESBasic/factoryWare/departmentWare/departWarePart-query.action">
		<input type="hidden" id="MESBasic_1_factoryModel_FactoryModel" value="factoryId" bak_value="factoryId"/>
		<input type="hidden" id="MESBasic_1_storeSet_StoreSet" value="storeId" bak_value="storeId"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1489731905451')}_${getText('MESBasic.viewtitle.randon1489733600277')}.xls" />
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
		<div id="ec_MESBasic_factoryWare_departmentWare_departWarePart_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_factoryWare_departmentWare_departWarePart_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_factoryWare_departWarePart')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_factoryWare_departWarePart" formId="ec_MESBasic_factoryWare_departmentWare_departWarePart_queryForm" dataTableId="ec_MESBasic_factoryWare_departmentWare_departWarePart_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_factoryWare_departmentWare_departWarePart_queryForm" isExpandAll=true formId="ec_MESBasic_factoryWare_departmentWare_departWarePart_queryForm" idprefix="ec_MESBasic_factoryWare_departmentWare_departWarePart" expandType="all"  fieldcodes="MESBasic_1_factoryModel_FactoryModel_code_factoryId_code:MESBasic.propertydisplayName.radion1419233767027||MESBasic_1_wareMan_Ware_wareName_wareId_wareName:MESBasic.propertydisplayName.randon1484031316281||MESBasic_1_storeSet_StoreSet_placeSetName_storeId_placeSetName:MESBasic.propertydisplayName.randon1489731677162" > 
							<#assign factoryId_code_defaultValue  = ''>
									<#assign factoryId_code_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_factoryWare_departmentWare_departWarePart_queryForm" code="MESBasic_1_factoryModel_FactoryModel_code" showFormat="SELECTCOMP" defaultValue=factoryId_code_defaultValue  divCode="MESBasic_1_factoryModel_FactoryModel_code_factoryId_code" isCustomize=true style="" > 
										<input type="hidden" id="factoryId.id" name="factoryId.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${factoryId_code_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1419491307826')}"  conditionfunc="MESBasic.factoryWare.departmentWare.departWarePart._querycustomFunc('factoryId_code')" name="factoryId.code" id="ec_MESBasic_factoryWare_departmentWare_departWarePart_queryForm_factoryId_code" displayFieldName="code" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/factoryModel/factoryModel/factroyRef1.action"   refViewCode="MESBasic_1_factoryModel_factroyRef1"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_factoryWare_departmentWare_departWarePart_queryForm" searchClick="MESBasic.factoryWare.departmentWare.departWarePart.commonQuery('query')"   />
							</@queryfield>
							<#assign wareId_wareName_defaultValue  = ''>
									<#assign wareId_wareName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_factoryWare_departmentWare_departWarePart_queryForm" code="MESBasic_1_wareMan_Ware_wareName" showFormat="SELECTCOMP" defaultValue=wareId_wareName_defaultValue  divCode="MESBasic_1_wareMan_Ware_wareName_wareId_wareName" isCustomize=true style="" > 
										<input type="hidden" id="wareId.id" name="wareId.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${wareId_wareName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  conditionfunc="MESBasic.factoryWare.departmentWare.departWarePart._querycustomFunc('wareId_wareName')" name="wareId.wareName" id="ec_MESBasic_factoryWare_departmentWare_departWarePart_queryForm_wareId_wareName" displayFieldName="wareName" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/wareMan/ware/wareRef.action"   refViewCode="MESBasic_1_wareMan_wareRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_factoryWare_departmentWare_departWarePart_queryForm" searchClick="MESBasic.factoryWare.departmentWare.departWarePart.commonQuery('query')"   />
							</@queryfield>
							<#assign storeId_placeSetName_defaultValue  = ''>
									<#assign storeId_placeSetName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_factoryWare_departmentWare_departWarePart_queryForm" code="MESBasic_1_storeSet_StoreSet_placeSetName" showFormat="SELECTCOMP" defaultValue=storeId_placeSetName_defaultValue  divCode="MESBasic_1_storeSet_StoreSet_placeSetName_storeId_placeSetName" isCustomize=true style="" > 
										<input type="hidden" id="storeId.id" name="storeId.id" value="" />
												<div class="fix-input">
													<input type="text" class="cui-noborder-input" name="storeId.placeSetName" id="storeId.placeSetName" value="${storeId_placeSetName_defaultValue!}" deValue="${storeId_placeSetName_defaultValue!}"   exp="like"/>
												</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_factoryWare_departmentWare_departWarePart_queryForm" type="adv" onclick="MESBasic.factoryWare.departmentWare.departWarePart.commonQuery('query')" onadvancedclick="advQuery('MESBasic.factoryWare.departmentWare.departWarePart.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_factoryWare_departmentWare_departWarePart_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_factoryWare_departmentWare_departWarePart_quickquery_info={};
ec_MESBasic_factoryWare_departmentWare_departWarePart_quickquery_info["MainTableName"]="MESBASIC_DEPARTMENT_WARES";
ec_MESBasic_factoryWare_departmentWare_departWarePart_quickquery_info["factoryId.code"]={};
ec_MESBasic_factoryWare_departmentWare_departWarePart_quickquery_info["factoryId.code"].dbColumnType="TEXT";
ec_MESBasic_factoryWare_departmentWare_departWarePart_quickquery_info["factoryId.code"].layRec="factory_tbcompanystructure,ID,MESBASIC_DEPARTMENT_WARES,FACTORY_ID-code";
ec_MESBasic_factoryWare_departmentWare_departWarePart_quickquery_info["factoryId.code"].columnName="CODE";
ec_MESBasic_factoryWare_departmentWare_departWarePart_quickquery_info["factoryId.id"]={};
ec_MESBasic_factoryWare_departmentWare_departWarePart_quickquery_info["factoryId.id"].dbColumnType="LONG";
ec_MESBasic_factoryWare_departmentWare_departWarePart_quickquery_info["factoryId.id"].layRec="factory_tbcompanystructure,ID,MESBASIC_DEPARTMENT_WARES,FACTORY_ID-code";
ec_MESBasic_factoryWare_departmentWare_departWarePart_quickquery_info["factoryId.id"].columnName="ID";
ec_MESBasic_factoryWare_departmentWare_departWarePart_quickquery_info["wareId.wareName"]={};
ec_MESBasic_factoryWare_departmentWare_departWarePart_quickquery_info["wareId.wareName"].dbColumnType="TEXT";
ec_MESBasic_factoryWare_departmentWare_departWarePart_quickquery_info["wareId.wareName"].layRec="MATERIAL_WARES,ID,MESBASIC_DEPARTMENT_WARES,WARE_ID-wareName";
ec_MESBasic_factoryWare_departmentWare_departWarePart_quickquery_info["wareId.wareName"].columnName="WARE_NAME";
ec_MESBasic_factoryWare_departmentWare_departWarePart_quickquery_info["wareId.id"]={};
ec_MESBasic_factoryWare_departmentWare_departWarePart_quickquery_info["wareId.id"].dbColumnType="LONG";
ec_MESBasic_factoryWare_departmentWare_departWarePart_quickquery_info["wareId.id"].layRec="MATERIAL_WARES,ID,MESBASIC_DEPARTMENT_WARES,WARE_ID-wareName";
ec_MESBasic_factoryWare_departmentWare_departWarePart_quickquery_info["wareId.id"].columnName="ID";
ec_MESBasic_factoryWare_departmentWare_departWarePart_quickquery_info["storeId.placeSetName"]={};
ec_MESBasic_factoryWare_departmentWare_departWarePart_quickquery_info["storeId.placeSetName"].dbColumnType="TEXT";
ec_MESBasic_factoryWare_departmentWare_departWarePart_quickquery_info["storeId.placeSetName"].layRec="MATERIAL_STORE_SETS,ID,MESBASIC_DEPARTMENT_WARES,STORE_ID-placeSetName";
ec_MESBasic_factoryWare_departmentWare_departWarePart_quickquery_info["storeId.placeSetName"].columnName="PLACE_SET_NAME";
ec_MESBasic_factoryWare_departmentWare_departWarePart_quickquery_info["storeId.id"]={};
ec_MESBasic_factoryWare_departmentWare_departWarePart_quickquery_info["storeId.id"].dbColumnType="LONG";
ec_MESBasic_factoryWare_departmentWare_departWarePart_quickquery_info["storeId.id"].layRec="MATERIAL_STORE_SETS,ID,MESBASIC_DEPARTMENT_WARES,STORE_ID-placeSetName";
ec_MESBasic_factoryWare_departmentWare_departWarePart_quickquery_info["storeId.id"].columnName="ID";
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
 	var advRemainDialog = $('[id="MESBasic.factoryWare.departmentWare.departWarePart.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.factoryWare.departmentWare.departWarePart.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_factoryWare_departmentWare_departWarePart_adv_queryForm" exportUrl="/MESBasic/factoryWare/departmentWare/departWarePart-query.action">
							<#assign wareId_wareCode_defaultValue  = ''>
									<#assign wareId_wareCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_factoryWare_departmentWare_departWarePart_adv_queryForm" code="MESBasic_1_wareMan_Ware_wareCode" showFormat="SELECTCOMP" defaultValue=wareId_wareCode_defaultValue  divCode="MESBasic_1_wareMan_Ware_wareCode_wareId_wareCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_wareMan_Ware" layRec="MATERIAL_WARES,ID,MESBASIC_DEPARTMENT_WARES,WARE_ID-wareCode" columnname="WARE_CODE" columntype="TEXT" name="wareId.wareCode" fieldType="SELECTCOMP" tableName="MATERIAL_WARES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										仓库编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_wareMan_Ware" />
										<input type="hidden" id="adv_wareId.id" name="wareId.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_wareId.id"  isPrecise=true deValue="${wareId_wareCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  conditionfunc="MESBasic.factoryWare.departmentWare.departWarePart._querycustomFunc('wareId_wareCode')" name="wareId.wareCode" id="adv_ec_MESBasic_factoryWare_departmentWare_departWarePart_queryForm_wareId_wareCode" displayFieldName="wareCode" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/wareMan/ware/wareRef.action"   refViewCode="MESBasic_1_wareMan_wareRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_factoryWare_departmentWare_departWarePart_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign factoryId_name_defaultValue  = ''>
									<#assign factoryId_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_factoryWare_departmentWare_departWarePart_adv_queryForm" code="MESBasic_1_factoryModel_FactoryModel_name" showFormat="SELECTCOMP" defaultValue=factoryId_name_defaultValue  divCode="MESBasic_1_factoryModel_FactoryModel_name_factoryId_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_factoryModel_FactoryModel" layRec="factory_tbcompanystructure,ID,MESBASIC_DEPARTMENT_WARES,FACTORY_ID-name" columnname="NODENAME" columntype="TEXT" name="factoryId.name" fieldType="SELECTCOMP" tableName="factory_tbcompanystructure"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										节点名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_factoryModel_FactoryModel" />
										<input type="hidden" id="adv_factoryId.id" name="factoryId.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_factoryId.id"  isPrecise=true deValue="${factoryId_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1419491307826')}"  conditionfunc="MESBasic.factoryWare.departmentWare.departWarePart._querycustomFunc('factoryId_name')" name="factoryId.name" id="adv_ec_MESBasic_factoryWare_departmentWare_departWarePart_queryForm_factoryId_name" displayFieldName="name" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/factoryModel/factoryModel/factroyRef1.action"   refViewCode="MESBasic_1_factoryModel_factroyRef1"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_factoryWare_departmentWare_departWarePart_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign storeId_placeSetName_defaultValue  = ''>
									<#assign storeId_placeSetName_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_factoryWare_departmentWare_departWarePart_adv_queryForm" code="MESBasic_1_storeSet_StoreSet_placeSetName" showFormat="SELECTCOMP" defaultValue=storeId_placeSetName_defaultValue  divCode="MESBasic_1_storeSet_StoreSet_placeSetName_storeId_placeSetName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_storeSet_StoreSet" layRec="MATERIAL_STORE_SETS,ID,MESBASIC_DEPARTMENT_WARES,STORE_ID-placeSetName" columnname="PLACE_SET_NAME" columntype="TEXT" name="storeId.placeSetName" fieldType="SELECTCOMP" tableName="MATERIAL_STORE_SETS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										货位名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_storeSet_StoreSet" />
										<input type="hidden" id="adv_storeId.id" name="storeId.id" value="" />
												<div class="fix-input">
													<input type="text" class="cui-noborder-input" name="storeId.placeSetName" id="adv_storeId.placeSetName" value="${storeId_placeSetName_defaultValue!}" deValue="${storeId_placeSetName_defaultValue!}"   exp="like" />
												</div>
								
                                	
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
			viewCode: 'MESBasic_1_factoryWare_departWarePart',
			modelCode: 'MESBasic_1_factoryWare_DepartmentWare',
			modelName: 'DepartmentWare',
			formId: 'ec_MESBasic_factoryWare_departmentWare_departWarePart_queryForm',
			olddiv: 'MESBasic.factoryWare.departmentWare.departWarePart.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.factoryWare.departmentWare.departWarePart.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_factoryWare_departWarePart'+"&entity.code="+'MESBasic_1_factoryWare';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.factoryWare.departmentWare.departWarePart.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.factoryWare.departmentWare.departWarePart.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.factoryWare.departmentWare.departWarePart.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_factoryWare_departWarePart'+"&entity.code="+'MESBasic_1_factoryWare';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.factoryWare.departmentWare.departWarePart.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.factoryWare.departmentWare.departWarePart.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.factoryWare.departmentWare.departWarePart.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.factoryWare.departmentWare.departWarePart.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.factoryWare.departmentWare.departWarePart.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.factoryWare.departmentWare.departWarePart.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.factoryWare.departmentWare.departWarePart.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.factoryWare.departmentWare.departWarePart.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.factoryWare.departmentWare.departWarePart.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.factoryWare.departmentWare.departWarePart.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.factoryWare.departmentWare.departWarePart.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.factoryWare.departmentWare.departWarePart.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.factoryWare.departmentWare.departWarePart.query('query')">
<#assign datatable_dataUrl = "/MESBasic/factoryWare/departmentWare/departWarePart-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_MESBasic_factoryWare_departmentWare_departWarePart_query" renderOverEvent="ec_MESBasic_factoryWare_departmentWare_departWarePart_RenderOverEvent" pageInitMethod="ec_MESBasic_factoryWare_departmentWare_departWarePart_PageInitMethod" modelCode="MESBasic_1_factoryWare_DepartmentWare" noPermissionKeys="factoryId.code,factoryId.name,wareId.wareCode,wareId.wareName,storeId.placeSetCode,storeId.placeSetName,meno" hidekeyPrefix="ec_MESBasic_factoryWare_departmentWare_departWarePart_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_factoryWare_departmentWare_departWarePart_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="MESBasic.factoryWare.departmentWare.departWarePart.dbmodifydepartWarePart" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','factoryId.id','wareId.id','storeId.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.factoryWare.departmentWare.departWarePart.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}departWarePart_add_add_MESBasic_1_factoryWare_departWarePart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion148705905507623')}||iconcls:add||useInMore:false||onclick:
				MESBasic.factoryWare.departmentWare.departWarePart.adddepartWarePart()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_factoryWare_departWarePart_BUTTON_add"
		buttonType="ADD" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}departWarePart_add_add_MESBasic_1_factoryWare_departWarePart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion148705905507623')}||iconcls:add||useInMore:false||onclick:
				MESBasic.factoryWare.departmentWare.departWarePart.adddepartWarePart()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}departWarePart_modify_modify_MESBasic_1_factoryWare_departWarePart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion149027251748123')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.factoryWare.departmentWare.departWarePart.modifydepartWarePart()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_factoryWare_departWarePart_BUTTON_modify"
		buttonType="MODIFY" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}departWarePart_modify_modify_MESBasic_1_factoryWare_departWarePart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion149027251748123')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.factoryWare.departmentWare.departWarePart.modifydepartWarePart()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}departWarePart_delete_del_MESBasic_1_factoryWare_departWarePart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1489734312016')}||iconcls:del||useInMore:false||onclick:
				MESBasic.factoryWare.departmentWare.departWarePart.deldepartWarePart()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_factoryWare_departWarePart_BUTTON_delete"
		buttonType="DELETE" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}departWarePart_delete_del_MESBasic_1_factoryWare_departWarePart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1489734312016')}||iconcls:del||useInMore:false||onclick:
				MESBasic.factoryWare.departmentWare.departWarePart.deldepartWarePart()
		" 
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign factoryId_code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${factoryId_code_displayDefaultType!}"  key="factoryId.code"   label="${getText('MESBasic.propertydisplayName.radion1419233767027')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign factoryId_name_displayDefaultType  = ''>
			<@datacolumn columnName="NODENAME"    showFormat="TEXT" defaultDisplay="${factoryId_name_displayDefaultType!}"  key="factoryId.name"   label="${getText('MESBasic.propertydisplayName.radion1419232393782')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign wareId_wareCode_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_CODE"    showFormat="TEXT" defaultDisplay="${wareId_wareCode_displayDefaultType!}"  key="wareId.wareCode"   label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign wareId_wareName_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_NAME"    showFormat="TEXT" defaultDisplay="${wareId_wareName_displayDefaultType!}"  key="wareId.wareName"   label="${getText('MESBasic.propertydisplayName.randon1484031316281')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign storeId_placeSetCode_displayDefaultType  = ''>
			<@datacolumn columnName="PLACE_SET_CODE"    showFormat="TEXT" defaultDisplay="${storeId_placeSetCode_displayDefaultType!}"  key="storeId.placeSetCode"   label="${getText('MESBasic.propertydisplayName.randon1489731651449')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign storeId_placeSetName_displayDefaultType  = ''>
			<@datacolumn columnName="PLACE_SET_NAME"    showFormat="TEXT" defaultDisplay="${storeId_placeSetName_displayDefaultType!}"  key="storeId.placeSetName"   label="${getText('MESBasic.propertydisplayName.randon1489731677162')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign meno_displayDefaultType  = ''>
			<@datacolumn columnName="MENO"    showFormat="TEXT" defaultDisplay="${meno_displayDefaultType!}"  key="meno"   label="${getText('MESBasic.propertydisplayName.randon1489732291294')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_factoryWare_departmentWare_departWarePart_RenderOverEvent(){
}
function ec_MESBasic_factoryWare_departmentWare_departWarePart_PageInitMethod(){
}
	
	
	
	
	
	
	
</script>