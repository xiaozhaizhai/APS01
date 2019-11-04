	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1419232311198')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm" exportUrl="/MESBasic/factoryModel/objProduct/factoryProdRefPart-query.action">
		<input type="hidden" id="MESBasic_1_factoryModel_FactoryModel" value="objFactory" bak_value="objFactory"/>
		<input type="hidden" reset="false" name="MESBasic_factoryModel_objProduct_factoryProdRefPart_condition" id="MESBasic_factoryModel_objProduct_factoryProdRefPart_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1460950716828')}_${getText('MESBasic.viewtitle.randon1460960787686')}.xls" />
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
		<div id="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_factoryModel_factoryProdRefPart')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_factoryModel_factoryProdRefPart" formId="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm" dataTableId="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm" isExpandAll=true formId="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm" idprefix="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart" expandType="all"  fieldcodes="MESBasic_1_factoryModel_FactoryModel_name_objFactory_name:MESBasic.propertydisplayName.radion1419232393782||MESBasic_1_product_Product_productName_objProduct_productName:MESBasic.propertydisplayName.radion1415772740737" > 
							<#assign objFactory_name_defaultValue  = ''>
									<#assign objFactory_name_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm" code="MESBasic_1_factoryModel_FactoryModel_name" showFormat="SELECTCOMP" defaultValue=objFactory_name_defaultValue  divCode="MESBasic_1_factoryModel_FactoryModel_name_objFactory_name" isCustomize=true style="" > 
										<input type="hidden" id="objFactory.id" name="objFactory.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${objFactory_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1419491307826')}"  conditionfunc="MESBasic.factoryModel.objProduct.factoryProdRefPart._querycustomFunc('objFactory_name')" name="objFactory.name" id="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm_objFactory_name" displayFieldName="name" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/factoryModel/factoryModel/factroyRef1.action"   refViewCode="MESBasic_1_factoryModel_factroyRef1"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm" searchClick="MESBasic.factoryModel.objProduct.factoryProdRefPart.commonQuery('query')"   />
							</@queryfield>
							<#assign objProduct_productName_defaultValue  = ''>
									<#assign objProduct_productName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=objProduct_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_objProduct_productName" isCustomize=true style="" > 
										<input type="hidden" id="objProduct.id" name="objProduct.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${objProduct_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1428027703233')}"  conditionfunc="MESBasic.factoryModel.objProduct.factoryProdRefPart._querycustomFunc('objProduct_productName')" name="objProduct.productName" id="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm_objProduct_productName" displayFieldName="productName" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/ref.action"   refViewCode="MESBasic_1_product_ref"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm" searchClick="MESBasic.factoryModel.objProduct.factoryProdRefPart.commonQuery('query')"   />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm" type="adv" onclick="MESBasic.factoryModel.objProduct.factoryProdRefPart.commonQuery('query')" onadvancedclick="advQuery('MESBasic.factoryModel.objProduct.factoryProdRefPart.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info={};
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["MainTableName"]="MESBASIC_OBJ_PRODUCTS";
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objFactory.name"]={};
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objFactory.name"].dbColumnType="TEXT";
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objFactory.name"].layRec="factory_tbcompanystructure,ID,MESBASIC_OBJ_PRODUCTS,OBJ_FACTORY-name";
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objFactory.name"].columnName="NODENAME";
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objFactory.id"]={};
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objFactory.id"].dbColumnType="LONG";
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objFactory.id"].layRec="factory_tbcompanystructure,ID,MESBASIC_OBJ_PRODUCTS,OBJ_FACTORY-name";
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objFactory.id"].columnName="ID";
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objProduct.productName"]={};
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objProduct.productName"].dbColumnType="TEXT";
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objProduct.productName"].layRec="S2BASE_PRODUCT,PRODUCT_ID,MESBASIC_OBJ_PRODUCTS,OBJ_PRODUCT-productName";
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objProduct.productName"].columnName="PRODUCT_NAME";
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objProduct.id"]={};
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objProduct.id"].dbColumnType="LONG";
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objProduct.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,MESBASIC_OBJ_PRODUCTS,OBJ_PRODUCT-productName";
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objProduct.id"].columnName="PRODUCT_ID";
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
 	var advRemainDialog = $('[id="MESBasic.factoryModel.objProduct.factoryProdRefPart.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.factoryModel.objProduct.factoryProdRefPart.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_adv_queryForm" exportUrl="/MESBasic/factoryModel/objProduct/factoryProdRefPart-query.action">
							<#assign objFactory_name_defaultValue  = ''>
									<#assign objFactory_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_adv_queryForm" code="MESBasic_1_factoryModel_FactoryModel_name" showFormat="SELECTCOMP" defaultValue=objFactory_name_defaultValue  divCode="MESBasic_1_factoryModel_FactoryModel_name_objFactory_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_factoryModel_FactoryModel" layRec="factory_tbcompanystructure,ID,MESBASIC_OBJ_PRODUCTS,OBJ_FACTORY-name" columnname="NODENAME" columntype="TEXT" name="objFactory.name" fieldType="SELECTCOMP" tableName="factory_tbcompanystructure"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										节点名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_factoryModel_FactoryModel" />
										<input type="hidden" id="adv_objFactory.id" name="objFactory.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_objFactory.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${objFactory_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1419491307826')}"  conditionfunc="MESBasic.factoryModel.objProduct.factoryProdRefPart._querycustomFunc('objFactory_name')" name="objFactory.name" id="adv_ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm_objFactory_name" displayFieldName="name" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/factoryModel/factoryModel/factroyRef1.action"   refViewCode="MESBasic_1_factoryModel_factroyRef1"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign objProduct_productName_defaultValue  = ''>
									<#assign objProduct_productName_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_adv_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=objProduct_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_objProduct_productName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,MESBASIC_OBJ_PRODUCTS,OBJ_PRODUCT-productName" columnname="PRODUCT_NAME" columntype="TEXT" name="objProduct.productName" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物品名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_objProduct.id" name="objProduct.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_objProduct.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${objProduct_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1428027703233')}"  conditionfunc="MESBasic.factoryModel.objProduct.factoryProdRefPart._querycustomFunc('objProduct_productName')" name="objProduct.productName" id="adv_ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm_objProduct_productName" displayFieldName="productName" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/ref.action"   refViewCode="MESBasic_1_product_ref"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_adv_queryForm"   />
								
                                	
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
			viewCode: 'MESBasic_1_factoryModel_factoryProdRefPart',
			modelCode: 'MESBasic_1_factoryModel_ObjProduct',
			modelName: 'ObjProduct',
			formId: 'ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm',
			olddiv: 'MESBasic.factoryModel.objProduct.factoryProdRefPart.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.factoryModel.objProduct.factoryProdRefPart.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_factoryModel_factoryProdRefPart'+"&entity.code="+'MESBasic_1_factoryModel';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.factoryModel.objProduct.factoryProdRefPart.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.factoryModel.objProduct.factoryProdRefPart.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.factoryModel.objProduct.factoryProdRefPart.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_factoryModel_factoryProdRefPart'+"&entity.code="+'MESBasic_1_factoryModel';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.factoryModel.objProduct.factoryProdRefPart.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.factoryModel.objProduct.factoryProdRefPart.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.factoryModel.objProduct.factoryProdRefPart.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.factoryModel.objProduct.factoryProdRefPart.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.factoryModel.objProduct.factoryProdRefPart.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.factoryModel.objProduct.factoryProdRefPart.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.factoryModel.objProduct.factoryProdRefPart.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.factoryModel.objProduct.factoryProdRefPart.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.factoryModel.objProduct.factoryProdRefPart.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.factoryModel.objProduct.factoryProdRefPart.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.factoryModel.objProduct.factoryProdRefPart.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.factoryModel.objProduct.factoryProdRefPart.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.factoryModel.objProduct.factoryProdRefPart.query('query')">
<#assign datatable_dataUrl = "/MESBasic/factoryModel/objProduct/factoryProdRefPart-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_query" renderOverEvent="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_RenderOverEvent" pageInitMethod="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_PageInitMethod" modelCode="MESBasic_1_factoryModel_ObjProduct" noPermissionKeys="objFactory.name,objProduct.productName,objProduct.productCode" hidekeyPrefix="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="MESBasic.factoryModel.objProduct.factoryProdRefPart.sendBackfactoryProdRefPart" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','objFactory.id','objProduct.id','id','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="MESBasic.factoryModel.objProduct.factoryProdRefPart.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign objFactory_name_displayDefaultType  = ''>
			<@datacolumn columnName="NODENAME"    showFormat="TEXT" defaultDisplay="${objFactory_name_displayDefaultType!}"  key="objFactory.name"   label="${getText('MESBasic.propertydisplayName.radion1419232393782')}" textalign="left"  width=140   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign objProduct_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${objProduct_productName_displayDefaultType!}"  key="objProduct.productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="left"  width=140   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign objProduct_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${objProduct_productCode_displayDefaultType!}"  key="objProduct.productCode"   label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" textalign="left"  width=140   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_RenderOverEvent(){
}
function ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_PageInitMethod(){
}
	
	
	
</script>