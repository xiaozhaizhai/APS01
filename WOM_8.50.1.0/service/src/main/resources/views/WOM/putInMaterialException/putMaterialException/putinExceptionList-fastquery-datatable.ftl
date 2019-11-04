	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1494811888680')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm" exportUrl="/WOM/putInMaterialException/putMaterialException/putinExceptionList-pending.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="createDepartment" bak_value="createDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="createPosition" bak_value="createPosition"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1494811951269')}_${getText('WOM.viewtitle.randon1494815188320')}.xls" />
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
		<div id="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_putInMaterialException_putinExceptionList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_putInMaterialException_putinExceptionList" formId="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm" dataTableId="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm" isExpandAll=true formId="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm" idprefix="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList" expandType="all"  fieldcodes="WOM_7.5.0.0_putInMaterial_PutInMaterial_tableNo_putinID_tableNo:WOM.tableNo1122||MESBasic_1_product_Product_productCode_putinPartID_productId_productCode:WOM.propertydisplayName.randon1502677102798" > 
							<#assign putinID_tableNo_defaultValue  = ''>
									<#assign putinID_tableNo_defaultValue  = ''>
							<@queryfield formId="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm" code="WOM_7.5.0.0_putInMaterial_PutInMaterial_tableNo" showFormat="SELECTCOMP" defaultValue=putinID_tableNo_defaultValue  divCode="WOM_7.5.0.0_putInMaterial_PutInMaterial_tableNo_putinID_tableNo" isCustomize=true style="" > 
										<input type="hidden" id="putinID.id" name="putinID.id" value="" />
												<@mneclient iframe=true mneenable=false  isPrecise=true deValue="${putinID_tableNo_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1494843227308')}"  conditionfunc="WOM.putInMaterialException.putMaterialException.putinExceptionList._querycustomFunc('putinID_tableNo')" name="putinID.tableNo" id="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm_putinID_tableNo" displayFieldName="tableNo" type="other" exp="like" classStyle="cui-noborder-input" url="/WOM/putInMaterial/putInMaterial/putinRefList.action"   refViewCode="WOM_7.5.0.0_putInMaterial_putinRefList"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm" searchClick="WOM.putInMaterialException.putMaterialException.putinExceptionList.commonQuery('query')"   />
							</@queryfield>
							<#assign putinPartID_productId_productCode_defaultValue  = ''>
									<#assign putinPartID_productId_productCode_defaultValue  = ''>
							<@queryfield formId="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=putinPartID_productId_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_putinPartID_productId_productCode" isCustomize=true style="" > 
										<input type="hidden" id="putinPartID.productId.id" name="putinPartID.productId.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${putinPartID_productId_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="WOM.putInMaterialException.putMaterialException.putinExceptionList._querycustomFunc('putinPartID_productId_productCode')" name="putinPartID.productId.productCode" id="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm_putinPartID_productId_productCode" displayFieldName="productCode" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/productRefNew.action"   refViewCode="MESBasic_1_product_productRefNew"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm" searchClick="WOM.putInMaterialException.putMaterialException.putinExceptionList.commonQuery('query')"   />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm" type="adv" onclick="WOM.putInMaterialException.putMaterialException.putinExceptionList.commonQuery('query')" onadvancedclick="advQuery('WOM.putInMaterialException.putMaterialException.putinExceptionList.advquery')" /> 
						       							       	<@querybutton formId="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm" type="pending" onclick="WOM.putInMaterialException.putMaterialException.putinExceptionList.commonQuery('pending')" />
						 		<@querybutton formId="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_quickquery_info={};
ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_quickquery_info["MainTableName"]="WOM_PUT_MATERIAL_EXCEPTIONS";
ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_quickquery_info["putinID.tableNo"]={};
ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_quickquery_info["putinID.tableNo"].dbColumnType="TEXT";
ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_quickquery_info["putinID.tableNo"].layRec="WOM_PUT_IN_MATERIALS,ID,WOM_PUT_MATERIAL_EXCEPTIONS,PUTINID-tableNo";
ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_quickquery_info["putinID.tableNo"].columnName="TABLE_NO";
ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_quickquery_info["putinID.id"]={};
ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_quickquery_info["putinID.id"].dbColumnType="LONG";
ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_quickquery_info["putinID.id"].layRec="WOM_PUT_IN_MATERIALS,ID,WOM_PUT_MATERIAL_EXCEPTIONS,PUTINID-tableNo";
ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_quickquery_info["putinID.id"].columnName="ID";
ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_quickquery_info["putinPartID.productId.productCode"]={};
ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_quickquery_info["putinPartID.productId.productCode"].dbColumnType="TEXT";
ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_quickquery_info["putinPartID.productId.productCode"].layRec="WOM_PUT_IN_MATERIAL_PARTS,ID,WOM_PUT_MATERIAL_EXCEPTIONS,PUTIN_PARTID-S2BASE_PRODUCT,PRODUCT_ID,WOM_PUT_IN_MATERIAL_PARTS,PRODUCT_ID-productCode";
ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_quickquery_info["putinPartID.productId.productCode"].columnName="PRODUCT_CODE";
ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_quickquery_info["putinPartID.productId.id"]={};
ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_quickquery_info["putinPartID.productId.id"].dbColumnType="LONG";
ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_quickquery_info["putinPartID.productId.id"].layRec="WOM_PUT_IN_MATERIAL_PARTS,ID,WOM_PUT_MATERIAL_EXCEPTIONS,PUTIN_PARTID-S2BASE_PRODUCT,PRODUCT_ID,WOM_PUT_IN_MATERIAL_PARTS,PRODUCT_ID-productCode";
ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_quickquery_info["putinPartID.productId.id"].columnName="PRODUCT_ID";
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
 	var advRemainDialog = $('[id="WOM.putInMaterialException.putMaterialException.putinExceptionList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.putInMaterialException.putMaterialException.putinExceptionList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_adv_queryForm" exportUrl="/WOM/putInMaterialException/putMaterialException/putinExceptionList-pending.action">
							<#assign putinID_tableNo_defaultValue  = ''>
									<#assign putinID_tableNo_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_adv_queryForm" code="WOM_7.5.0.0_putInMaterial_PutInMaterial_tableNo" showFormat="SELECTCOMP" defaultValue=putinID_tableNo_defaultValue  divCode="WOM_7.5.0.0_putInMaterial_PutInMaterial_tableNo_putinID_tableNo" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_putInMaterial_PutInMaterial" layRec="WOM_PUT_IN_MATERIALS,ID,WOM_PUT_MATERIAL_EXCEPTIONS,PUTINID-tableNo" columnname="TABLE_NO" columntype="TEXT" name="putinID.tableNo" fieldType="SELECTCOMP" tableName="WOM_PUT_IN_MATERIALS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										投料单
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_putInMaterial_PutInMaterial" />
										<input type="hidden" id="adv_putinID.id" name="putinID.id" value="" />
												<div class="fix-input">
													<input type="text" class="cui-noborder-input" name="putinID.tableNo" id="adv_putinID.tableNo" value="${putinID_tableNo_defaultValue!}" deValue="${putinID_tableNo_defaultValue!}"   exp="like" />
												</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign putinPartID_productId_productCode_defaultValue  = ''>
									<#assign putinPartID_productId_productCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_adv_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=putinPartID_productId_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_putinPartID_productId_productCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="WOM_PUT_IN_MATERIAL_PARTS,ID,WOM_PUT_MATERIAL_EXCEPTIONS,PUTIN_PARTID-S2BASE_PRODUCT,PRODUCT_ID,WOM_PUT_IN_MATERIAL_PARTS,PRODUCT_ID-productCode" columnname="PRODUCT_CODE" columntype="TEXT" name="putinPartID.productId.productCode" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物料编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_putinPartID.productId.id" name="putinPartID.productId.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_putinPartID.productId.id"  isPrecise=true deValue="${putinPartID_productId_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="WOM.putInMaterialException.putMaterialException.putinExceptionList._querycustomFunc('putinPartID_productId_productCode')" name="putinPartID.productId.productCode" id="adv_ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm_putinPartID_productId_productCode" displayFieldName="productCode" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/productRefNew.action"   refViewCode="MESBasic_1_product_productRefNew"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_adv_queryForm"   />
								
                                	
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
			viewCode: 'WOM_7.5.0.0_putInMaterialException_putinExceptionList',
			modelCode: 'WOM_7.5.0.0_putInMaterialException_PutMaterialException',
			modelName: 'PutMaterialException',
			formId: 'ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm',
			olddiv: 'WOM.putInMaterialException.putMaterialException.putinExceptionList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.putInMaterialException.putMaterialException.putinExceptionList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_putInMaterialException_putinExceptionList'+"&entity.code="+'WOM_7.5.0.0_putInMaterialException';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.putInMaterialException.putMaterialException.putinExceptionList.advquery'] #customquContent").html(html);
		 	$("[id='WOM.putInMaterialException.putMaterialException.putinExceptionList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.putInMaterialException.putMaterialException.putinExceptionList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_putInMaterialException_putinExceptionList'+"&entity.code="+'WOM_7.5.0.0_putInMaterialException';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.putInMaterialException.putMaterialException.putinExceptionList.advquery'] #customquContent").html(html);
			 $("[id='WOM.putInMaterialException.putMaterialException.putinExceptionList.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.putInMaterialException.putMaterialException.putinExceptionList.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.putInMaterialException.putMaterialException.putinExceptionList.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.putInMaterialException.putMaterialException.putinExceptionList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.putInMaterialException.putMaterialException.putinExceptionList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.putInMaterialException.putMaterialException.putinExceptionList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.putInMaterialException.putMaterialException.putinExceptionList.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.putInMaterialException.putMaterialException.putinExceptionList.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.putInMaterialException.putMaterialException.putinExceptionList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.putInMaterialException.putMaterialException.putinExceptionList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.putInMaterialException.putMaterialException.putinExceptionList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.putInMaterialException.putMaterialException.putinExceptionList.query('goList')">
<#assign datatable_dataUrl = "/WOM/putInMaterialException/putMaterialException/putinExceptionList-pending.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.putInMaterialException.putMaterialException.putinExceptionList.query('query')">
<#assign datatable_dataUrl = "/WOM/putInMaterialException/putMaterialException/putinExceptionList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_query" renderOverEvent="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_RenderOverEvent" pageInitMethod="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_PageInitMethod" modelCode="WOM_7.5.0.0_putInMaterialException_PutMaterialException" noPermissionKeys="tableNo,putinID.tableNo,putinPartID.productId.productCode,putinPartID.productId.productName,oldBatchNumStr,batchNumStr,oldUseNum,useNum,oldLossNum,lossNum,createTime,remark" hidekeyPrefix="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="WOM.putInMaterialException.putMaterialException.putinExceptionList.rowDblClick" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','pending.id','pending.deploymentId','pending.activityName','pending.bulkDealFlag','pending.processDescription','pending.processKey','pending.processVersion','pending.activityType','pending.processId','pending.openUrl','pending.userId','tableInfoId','status','putinID.id','putinPartID.productId.id']" postData="&pending-beginDate=${pendingBeginDate!''}&pending-endDate=${pendingEndDate!''}&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="WOM.putInMaterialException.putMaterialException.putinExceptionList.showErrorMsg"   >
		<#if isContainsWorkflow('WOM_7.5.0.0_putInMaterialException_putinExceptionList')==true>
			<@operatebar operateType="FLOW" menuCode="${workFlowMenuCode!}" entityCode="WOM_7.5.0.0_putInMaterialException" businessParam="${businessParam!}" resultType="JSON" >
			</@operatebar>
		</#if>
		<#if flowBulkFlag?? && flowBulkFlag==true>
			<@operatebar operateType="noPower" menuCode="approval" operates="
			code:${buttonPerfix!}WOM_7.5.0.0_putInMaterialException_approval||name:${getText('ec.list.batchApproval')}||iconcls:modify||useInMore:false||onclick:
				WOM.putInMaterialException.putMaterialException.putinExceptionList.approval()
    			"  resultType="json"></@operatebar>
    	</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${tableNo_displayDefaultType!}"  key="tableNo"   label="${getText('WOM.tlyctableNo')}" textalign="left"  width=200   type="textfield"  click="function(cell){WOM.putInMaterialException.putMaterialException.putinExceptionList.rowDblClick(null,cell);}"   showFormatFunc="" cssstyle="" />
			<#assign putinID_tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${putinID_tableNo_displayDefaultType!}"  key="putinID.tableNo"   label="${getText('WOM.tableNo1122')}" textalign="left"  width=200   type="textfield"    click="function(cell){WOM.putInMaterialException.putMaterialException.putinExceptionList.showLinkView('/WOM/putInMaterial/putInMaterial/putinView.action?${getPowerCode('','WOM_7.5.0.0_putInMaterial_putinView')}','putinID.id',cell)}" showFormatFunc="" cssstyle="" />
			<#assign putinPartID_productId_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${putinPartID_productId_productCode_displayDefaultType!}"  key="putinPartID.productId.productCode"   label="${getText('WOM.propertydisplayName.randon1502677102798')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign putinPartID_productId_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${putinPartID_productId_productName_displayDefaultType!}"  key="putinPartID.productId.productName"   label="${getText('WOM.propertydisplayName.radion1415772740737455')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign oldBatchNumStr_displayDefaultType  = ''>
			<@datacolumn columnName="OLD_BATCH_NUM_STR"    showFormat="TEXT" defaultDisplay="${oldBatchNumStr_displayDefaultType!}"  key="oldBatchNumStr"   label="${getText('WOM.propertydisplayName.randon1495524777954')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign batchNumStr_displayDefaultType  = ''>
			<@datacolumn columnName="BATCH_NUM_STR"    showFormat="TEXT" defaultDisplay="${batchNumStr_displayDefaultType!}"  key="batchNumStr"   label="${getText('WOM.propertydisplayName.randon1494896691508')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign oldUseNum_displayDefaultType  = ''>
			<@datacolumn columnName="OLD_USE_NUM"    showFormat="TEXT" defaultDisplay="${oldUseNum_displayDefaultType!}"  key="oldUseNum"   label="${getText('WOM.propertydisplayName.randon1495524215377')}" textalign="right"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign useNum_displayDefaultType  = ''>
			<@datacolumn columnName="USE_NUM"    showFormat="TEXT" defaultDisplay="${useNum_displayDefaultType!}"  key="useNum"   label="${getText('WOM.propertydisplayName.randon1494818656207')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign oldLossNum_displayDefaultType  = ''>
			<@datacolumn columnName="OLD_LOSS_NUM"    showFormat="TEXT" defaultDisplay="${oldLossNum_displayDefaultType!}"  key="oldLossNum"   label="${getText('WOM.propertydisplayName.randon1495524277382')}" textalign="right"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign lossNum_displayDefaultType  = ''>
			<@datacolumn columnName="LOSS_NUM"    showFormat="TEXT" defaultDisplay="${lossNum_displayDefaultType!}"  key="lossNum"   label="${getText('WOM.propertydisplayName.randon1494818693335')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign createTime_displayDefaultType  = ''>
			<@datacolumn columnName="CREATE_TIME"    showFormat="YMD_HMS" defaultDisplay="${createTime_displayDefaultType!}"  key="createTime"   label="${getText('ec.common.createTime')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
				<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_putInMaterialException_PutMaterialException", "WOM_7.5.0.0_putInMaterialException_putinExceptionList", "LIST", "putMaterialException")>
				<#-- 排布自定义字段 -->
				<#if customPropList?? && customPropList?has_content>
					<#list customPropList as c>
						<#assign cpWidth = 100>
						<#if c.property.type == 'DATETIME'>
							<#assign cpWidth = 130>
						</#if>
						<#if c.fieldType == 'TEXTAREA'>
							<#assign cpWidth = 200>
						</#if>
						<#assign cpOrder = true>
						<#assign cpMultable = false>
						<#if (c.property.type == 'SYSTEMCODE' && ((c.property.multable!false) || (c.property.seniorSystemCode!false))) || c.property.type == 'LONGTEXT'>
							<#assign cpOrder = false>
						</#if>
						<#if c.property.type == 'SYSTEMCODE' && (c.property.multable!false)>
							<#assign cpMultable = true>
						</#if>
						<#assign cpType = ''>
						<#if c.property.type == 'SYSTEMCODE'>
							<#if (c.property.seniorSystemCode!false)>
								<#assign cpType = 'textfield'>
							<#else>
								<#assign cpType = 'systemcode'>
							</#if>
						<#elseif c.property.type == 'TEXT' || c.property.type == 'OBJECT'>
							<#assign cpType = 'textfield'>
						<#else>
							<#assign cpType = c.property.type?lower_case>
						</#if>
						<#assign cpDecimal = ''>
						<#if c.property.type == 'DECIMAL'>
							<#assign cpDecimal = (c.property.decimalNum!0)>
							<#if c.precision??>
								<#assign cpDecimal =c.precision!>
							</#if>
						</#if>
						<#assign fsIndex = c.propertyLayRec?index_of(".")+1>
						<#assign keyname = c.propertyLayRec?substring(fsIndex)?trim>
						
						<#if c.align??>
							<#assign columnAlign = c.align >						
						<#elseif (c.property.type=='INTEGER' || c.property.type=='DECIMAL')>
							<#assign columnAlign = 'right'>
						<#elseif (c.property.type=='DATETIME') >					
							<#assign columnAlign = 'center'>
						<#else>
							<#assign columnAlign = 'left' >
						</#if>				
												
						<@datacolumn columnName=c.property.columnName width=cpWidth key=c.propertyLayRec showFormat=c.format order=cpOrder label="${getText('${c.displayName}')}" decimal="${cpDecimal}" multable=cpMultable type="${cpType}" textalign="${columnAlign}" />
					</#list>
				</#if>
			<#assign remark_displayDefaultType  = ''>
			<@datacolumn columnName="REMARK"    showFormat="TEXT" defaultDisplay="${remark_displayDefaultType!}"  key="remark"   label="${getText('WOM.propertydisplayName.randon1494814438997')}" textalign="left"  width=150   type="textfield"    showFormatFunc="" cssstyle="" />
		<@datacolumn key="pending.taskDescription" sortable=false label="${getText('ec.list.taskDescription')}"  width=120/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_RenderOverEvent(){
}
function ec_WOM_putInMaterialException_putMaterialException_putinExceptionList_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>