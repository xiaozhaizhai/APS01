	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1486984149095')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_factoryWare_factoryWare_factoryPart_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm" exportUrl="/MESBasic/factoryWare/factoryWare/factoryPart-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="MESBasic_1_factoryModel_FactoryModel" value="factoryId" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="MESBasic_1_storeSet_StoreSet" value="storeId" />
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1486984250311')}_${getText('MESBasic.viewtitle.randon1486985912661')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<input type="hidden" id="currentSqlType"  value="5" />
		<div id="ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_factoryWare_factoryPart')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_factoryWare_factoryPart" formId="ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm" dataTableId="ec_MESBasic_factoryWare_factoryWare_factoryPart_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm" isExpandAll=true formId="ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm" idprefix="ec_MESBasic_factoryWare_factoryWare_factoryPart" expandType="all"  fieldcodes="MESBasic_1_factoryModel_FactoryModel_code_factoryId_code:MESBasic.propertydisplayName.radion1419233767027||MESBasic_1_wareMan_Ware_wareCode_wareId_wareCode:MESBasic.propertydisplayName.randon1484031239866||MESBasic_1_storeSet_StoreSet_placeSetCode_storeId_placeSetCode:MESBasic.propertydisplayName.randon1486607342343" > 
							<#assign factoryId_code_defaultValue  = ''>
									<#assign factoryId_code_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm" code="MESBasic_1_factoryModel_FactoryModel_code" showFormat="SELECTCOMP" defaultValue=factoryId_code_defaultValue  divCode="MESBasic_1_factoryModel_FactoryModel_code_factoryId_code" isCustomize=true > 
										<input type="hidden" id="factoryId.id" name="factoryId.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${factoryId_code_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1419491307826')}"  conditionfunc="MESBasic.factoryWare.factoryWare.factoryPart._querycustomFunc('factoryId_code')" name="factoryId.code" id="ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm_factoryId_code" displayFieldName="code" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/factoryModel/factoryModel/factroyRef1.action"   refViewCode="MESBasic_1_factoryModel_factroyRef1"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm" searchClick="MESBasic.factoryWare.factoryWare.factoryPart.commonQuery('query')"  />
							</@queryfield>
							<#assign wareId_wareCode_defaultValue  = ''>
									<#assign wareId_wareCode_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm" code="MESBasic_1_wareMan_Ware_wareCode" showFormat="SELECTCOMP" defaultValue=wareId_wareCode_defaultValue  divCode="MESBasic_1_wareMan_Ware_wareCode_wareId_wareCode" isCustomize=true > 
										<input type="hidden" id="wareId.id" name="wareId.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${wareId_wareCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  conditionfunc="MESBasic.factoryWare.factoryWare.factoryPart._querycustomFunc('wareId_wareCode')" name="wareId.wareCode" id="ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm_wareId_wareCode" displayFieldName="wareCode" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/wareMan/ware/wareRef.action"   refViewCode="MESBasic_1_wareMan_wareRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm" searchClick="MESBasic.factoryWare.factoryWare.factoryPart.commonQuery('query')"  />
							</@queryfield>
							<#assign storeId_placeSetCode_defaultValue  = ''>
									<#assign storeId_placeSetCode_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm" code="MESBasic_1_storeSet_StoreSet_placeSetCode" showFormat="SELECTCOMP" defaultValue=storeId_placeSetCode_defaultValue  divCode="MESBasic_1_storeSet_StoreSet_placeSetCode_storeId_placeSetCode" isCustomize=true > 
										<input type="hidden" id="storeId.id" name="storeId.id" value="" />
												<@mneclient iframe=true mneenable=false  isPrecise=true deValue="${storeId_placeSetCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1486954640353')}"  conditionfunc="MESBasic.factoryWare.factoryWare.factoryPart._querycustomFunc('storeId_placeSetCode')" name="storeId.placeSetCode" id="ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm_storeId_placeSetCode" displayFieldName="placeSetCode" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/storeSet/storeSet/storeRef.action"   refViewCode="MESBasic_1_storeSet_storeRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm" searchClick="MESBasic.factoryWare.factoryWare.factoryPart.commonQuery('query')"  />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm" type="adv" onclick="MESBasic.factoryWare.factoryWare.factoryPart.commonQuery('query')" onadvancedclick="advQuery('MESBasic.factoryWare.factoryWare.factoryPart.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info={};
ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info["MainTableName"]="MESBASIC_FACTORY_WARES";
ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info["factoryId.code"]={};
ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info["factoryId.code"].dbColumnType="TEXT";
ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info["factoryId.code"].layRec="factory_tbcompanystructure,ID,MESBASIC_FACTORY_WARES,FACTORY_ID-code";
ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info["factoryId.code"].columnName="CODE";
ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info["factoryId.id"]={};
ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info["factoryId.id"].dbColumnType="LONG";
ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info["factoryId.id"].layRec="factory_tbcompanystructure,ID,MESBASIC_FACTORY_WARES,FACTORY_ID-code";
ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info["factoryId.id"].columnName="ID";
ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info["wareId.wareCode"]={};
ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info["wareId.wareCode"].dbColumnType="TEXT";
ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info["wareId.wareCode"].layRec="MATERIAL_WARES,ID,MESBASIC_FACTORY_WARES,WARE_ID-wareCode";
ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info["wareId.wareCode"].columnName="WARE_CODE";
ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info["wareId.id"]={};
ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info["wareId.id"].dbColumnType="LONG";
ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info["wareId.id"].layRec="MATERIAL_WARES,ID,MESBASIC_FACTORY_WARES,WARE_ID-wareCode";
ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info["wareId.id"].columnName="ID";
ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info["storeId.placeSetCode"]={};
ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info["storeId.placeSetCode"].dbColumnType="TEXT";
ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info["storeId.placeSetCode"].layRec="MATERIAL_STORE_SETS,ID,MESBASIC_FACTORY_WARES,STORE_ID-placeSetCode";
ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info["storeId.placeSetCode"].columnName="PLACE_SET_CODE";
ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info["storeId.id"]={};
ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info["storeId.id"].dbColumnType="LONG";
ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info["storeId.id"].layRec="MATERIAL_STORE_SETS,ID,MESBASIC_FACTORY_WARES,STORE_ID-placeSetCode";
ec_MESBasic_factoryWare_factoryWare_factoryPart_quickquery_info["storeId.id"].columnName="ID";
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
<div style="position:relative;z-index:10;display:none" id="MESBasic.factoryWare.factoryWare.factoryPart.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_factoryWare_factoryWare_factoryPart_adv_queryForm" exportUrl="/MESBasic/factoryWare/factoryWare/factoryPart-query.action">
							<#assign factoryId_code_defaultValue  = ''>
									<#assign factoryId_code_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_factoryWare_factoryWare_factoryPart_adv_queryForm" code="MESBasic_1_factoryModel_FactoryModel_code" showFormat="SELECTCOMP" defaultValue=factoryId_code_defaultValue  divCode="MESBasic_1_factoryModel_FactoryModel_code_factoryId_code" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_factoryModel_FactoryModel" layRec="factory_tbcompanystructure,ID,MESBASIC_FACTORY_WARES,FACTORY_ID-code" columnname="CODE" columntype="TEXT" name="factoryId.code" fieldType="SELECTCOMP" tableName="factory_tbcompanystructure"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										节点编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_factoryModel_FactoryModel" />
										<input type="hidden" id="adv_factoryId.id" name="factoryId.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_factoryId.id"  isPrecise=true deValue="${factoryId_code_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1419491307826')}"  conditionfunc="MESBasic.factoryWare.factoryWare.factoryPart._querycustomFunc('factoryId_code')" name="factoryId.code" id="adv_ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm_factoryId_code" displayFieldName="code" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/factoryModel/factoryModel/factroyRef1.action"   refViewCode="MESBasic_1_factoryModel_factroyRef1"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_factoryWare_factoryWare_factoryPart_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign wareId_wareCode_defaultValue  = ''>
									<#assign wareId_wareCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_factoryWare_factoryWare_factoryPart_adv_queryForm" code="MESBasic_1_wareMan_Ware_wareCode" showFormat="SELECTCOMP" defaultValue=wareId_wareCode_defaultValue  divCode="MESBasic_1_wareMan_Ware_wareCode_wareId_wareCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_wareMan_Ware" layRec="MATERIAL_WARES,ID,MESBASIC_FACTORY_WARES,WARE_ID-wareCode" columnname="WARE_CODE" columntype="TEXT" name="wareId.wareCode" fieldType="SELECTCOMP" tableName="MATERIAL_WARES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										仓库编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_wareMan_Ware" />
										<input type="hidden" id="adv_wareId.id" name="wareId.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_wareId.id"  isPrecise=true deValue="${wareId_wareCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  conditionfunc="MESBasic.factoryWare.factoryWare.factoryPart._querycustomFunc('wareId_wareCode')" name="wareId.wareCode" id="adv_ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm_wareId_wareCode" displayFieldName="wareCode" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/wareMan/ware/wareRef.action"   refViewCode="MESBasic_1_wareMan_wareRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_factoryWare_factoryWare_factoryPart_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign storeId_placeSetCode_defaultValue  = ''>
									<#assign storeId_placeSetCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_factoryWare_factoryWare_factoryPart_adv_queryForm" code="MESBasic_1_storeSet_StoreSet_placeSetCode" showFormat="SELECTCOMP" defaultValue=storeId_placeSetCode_defaultValue  divCode="MESBasic_1_storeSet_StoreSet_placeSetCode_storeId_placeSetCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_storeSet_StoreSet" layRec="MATERIAL_STORE_SETS,ID,MESBASIC_FACTORY_WARES,STORE_ID-placeSetCode" columnname="PLACE_SET_CODE" columntype="TEXT" name="storeId.placeSetCode" fieldType="SELECTCOMP" tableName="MATERIAL_STORE_SETS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										货位编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_storeSet_StoreSet" />
										<input type="hidden" id="adv_storeId.id" name="storeId.id" value="" />
												<@mneclient iframe=true mneenable=false advresume="adv_storeId.id"  isPrecise=true deValue="${storeId_placeSetCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1486954640353')}"  conditionfunc="MESBasic.factoryWare.factoryWare.factoryPart._querycustomFunc('storeId_placeSetCode')" name="storeId.placeSetCode" id="adv_ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm_storeId_placeSetCode" displayFieldName="placeSetCode" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/storeSet/storeSet/storeRef.action"   refViewCode="MESBasic_1_storeSet_storeRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_factoryWare_factoryWare_factoryPart_adv_queryForm"   />
								
                                	
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
			viewCode: 'MESBasic_1_factoryWare_factoryPart',
			modelCode: 'MESBasic_1_factoryWare_FactoryWare',
			modelName: 'FactoryWare',
			formId: 'ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm',
			olddiv: 'MESBasic.factoryWare.factoryWare.factoryPart.advquery',
			values: values
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$('#advQueryLoading').show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_factoryWare_factoryPart'+"&entity.code="+'MESBasic_1_factoryWare';
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
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_factoryWare_factoryPart'+"&entity.code="+'MESBasic_1_factoryWare';
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
<#if view?? && view.type?? && view.type != "REFERENCE">
<#assign datatable_queryFunc = "MESBasic.factoryWare.factoryWare.factoryPart.query('query')">
</#if>
<#assign datatable_dataUrl = "/MESBasic/factoryWare/factoryWare/factoryPart-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_MESBasic_factoryWare_factoryWare_factoryPart_query" renderOverEvent="ec_MESBasic_factoryWare_factoryWare_factoryPart_RenderOverEvent" pageInitMethod="ec_MESBasic_factoryWare_factoryWare_factoryPart_PageInitMethod" modelCode="MESBasic_1_factoryWare_FactoryWare" noPermissionKeys="factoryId.code,factoryId.name,wareId.wareCode,wareId.wareName,storeId.placeSetCode,storeId.placeSetName,meno" hidekeyPrefix="ec_MESBasic_factoryWare_factoryWare_factoryPart_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_factoryWare_factoryWare_factoryPart_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="MESBasic.factoryWare.factoryWare.factoryPart.dbClickViewfactoryPart" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','factoryId.id','wareId.id','storeId.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.factoryWare.factoryWare.factoryPart.showErrorMsg">
					<#if flowBulkFlag?? && flowBulkFlag==true>
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign factoryId_code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${factoryId_code_displayDefaultType!}"  key="factoryId.code"   label="${getText('MESBasic.propertydisplayName.radion1419233767027')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign factoryId_name_displayDefaultType  = ''>
			<@datacolumn columnName="NODENAME"    showFormat="TEXT" defaultDisplay="${factoryId_name_displayDefaultType!}"  key="factoryId.name"   label="${getText('MESBasic.propertydisplayName.radion1419232393782')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign wareId_wareCode_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_CODE"    showFormat="TEXT" defaultDisplay="${wareId_wareCode_displayDefaultType!}"  key="wareId.wareCode"   label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign wareId_wareName_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_NAME"    showFormat="TEXT" defaultDisplay="${wareId_wareName_displayDefaultType!}"  key="wareId.wareName"   label="${getText('MESBasic.propertydisplayName.randon1484031316281')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign storeId_placeSetCode_displayDefaultType  = ''>
			<@datacolumn columnName="PLACE_SET_CODE"    showFormat="TEXT" defaultDisplay="${storeId_placeSetCode_displayDefaultType!}"  key="storeId.placeSetCode"   label="${getText('MESBasic.propertydisplayName.randon1486607342343')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign storeId_placeSetName_displayDefaultType  = ''>
			<@datacolumn columnName="PLACE_SET_NAME"    showFormat="TEXT" defaultDisplay="${storeId_placeSetName_displayDefaultType!}"  key="storeId.placeSetName"   label="${getText('MESBasic.propertydisplayName.randon1486607374172')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign meno_displayDefaultType  = ''>
			<@datacolumn columnName="MENO"    showFormat="TEXT" defaultDisplay="${meno_displayDefaultType!}"  key="meno"   label="${getText('MESBasic.propertydisplayName.randon1486984471175')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_factoryWare_factoryWare_factoryPart_RenderOverEvent(){
}
function ec_MESBasic_factoryWare_factoryWare_factoryPart_PageInitMethod(){
}
	
	
	
	
	
	
	
</script>