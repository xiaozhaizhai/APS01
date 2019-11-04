	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1415772266801')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_product_prodSecUnit_refProdSecUnit_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_product_prodSecUnit_refProdSecUnit_queryForm" exportUrl="/MESBasic/product/prodSecUnit/refProdSecUnit-query.action">
		<input type="hidden" reset="false" name="MESBasic_product_prodSecUnit_refProdSecUnit_condition" id="MESBasic_product_prodSecUnit_refProdSecUnit_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1530515212961')}_${getText('MESBasic.viewtitle.randon1531130446189')}.xls" />
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
		<div id="ec_MESBasic_product_prodSecUnit_refProdSecUnit_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_product_prodSecUnit_refProdSecUnit_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_product_refProdSecUnit')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_product_refProdSecUnit" formId="ec_MESBasic_product_prodSecUnit_refProdSecUnit_queryForm" dataTableId="ec_MESBasic_product_prodSecUnit_refProdSecUnit_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_product_prodSecUnit_refProdSecUnit_queryForm" isExpandAll=true formId="ec_MESBasic_product_prodSecUnit_refProdSecUnit_queryForm" idprefix="ec_MESBasic_product_prodSecUnit_refProdSecUnit" expandType="all"  fieldcodes="X6Basic_1.0_unitGroup_BaseUnit_name_baseUnit_name:MESBasic.propertydisplayName.radion139823564048301||MESBasic_1_product_Product_productCode_product_productCode:MESBasic.propertydisplayName.radion1415772644833" > 
							<#assign baseUnit_name_defaultValue  = ''>
									<#assign baseUnit_name_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_product_prodSecUnit_refProdSecUnit_queryForm" code="X6Basic_1.0_unitGroup_BaseUnit_name" showFormat="SELECTCOMP" defaultValue=baseUnit_name_defaultValue  divCode="X6Basic_1.0_unitGroup_BaseUnit_name_baseUnit_name" isCustomize=true style="" > 
										<input type="hidden" id="baseUnit.id" name="baseUnit.id" value="" />
												<@mneclient iframe=true mneenable=false isCrossCompany=isCrossCompany isPrecise=true deValue="${baseUnit_name_defaultValue!}" reftitle="${getText('X6Basic.viewtitle.radion1398240433147')}"  conditionfunc="MESBasic.product.prodSecUnit.refProdSecUnit._querycustomFunc('baseUnit_name')" name="baseUnit.name" id="ec_MESBasic_product_prodSecUnit_refProdSecUnit_queryForm_baseUnit_name" displayFieldName="name" type="other" exp="like" classStyle="cui-noborder-input" url="/X6Basic/unitGroup/baseUnit/unitRef.action"   refViewCode="X6Basic_1.0_unitGroup_unitRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_product_prodSecUnit_refProdSecUnit_queryForm" searchClick="MESBasic.product.prodSecUnit.refProdSecUnit.commonQuery('query')"   />
							</@queryfield>
							<#assign product_productCode_defaultValue  = ''>
									<#assign product_productCode_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_product_prodSecUnit_refProdSecUnit_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=product_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_product_productCode" isCustomize=true style="" > 
										<input type="hidden" id="product.id" name="product.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${product_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="MESBasic.product.prodSecUnit.refProdSecUnit._querycustomFunc('product_productCode')" name="product.productCode" id="ec_MESBasic_product_prodSecUnit_refProdSecUnit_queryForm_product_productCode" displayFieldName="productCode" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/productRefNew.action"   refViewCode="MESBasic_1_product_productRefNew"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_product_prodSecUnit_refProdSecUnit_queryForm" searchClick="MESBasic.product.prodSecUnit.refProdSecUnit.commonQuery('query')"   />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_product_prodSecUnit_refProdSecUnit_queryForm" type="adv" onclick="MESBasic.product.prodSecUnit.refProdSecUnit.commonQuery('query')" onadvancedclick="advQuery('MESBasic.product.prodSecUnit.refProdSecUnit.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_product_prodSecUnit_refProdSecUnit_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_product_prodSecUnit_refProdSecUnit_quickquery_info={};
ec_MESBasic_product_prodSecUnit_refProdSecUnit_quickquery_info["MainTableName"]="MESBASIC_PROD_SEC_UNITS";
ec_MESBasic_product_prodSecUnit_refProdSecUnit_quickquery_info["baseUnit.name"]={};
ec_MESBasic_product_prodSecUnit_refProdSecUnit_quickquery_info["baseUnit.name"].dbColumnType="TEXT";
ec_MESBasic_product_prodSecUnit_refProdSecUnit_quickquery_info["baseUnit.name"].layRec="S2BASE_UNIT,UNIT_ID,MESBASIC_PROD_SEC_UNITS,BASE_UNIT-name";
ec_MESBasic_product_prodSecUnit_refProdSecUnit_quickquery_info["baseUnit.name"].columnName="UNIT_NAME";
ec_MESBasic_product_prodSecUnit_refProdSecUnit_quickquery_info["baseUnit.id"]={};
ec_MESBasic_product_prodSecUnit_refProdSecUnit_quickquery_info["baseUnit.id"].dbColumnType="LONG";
ec_MESBasic_product_prodSecUnit_refProdSecUnit_quickquery_info["baseUnit.id"].layRec="S2BASE_UNIT,UNIT_ID,MESBASIC_PROD_SEC_UNITS,BASE_UNIT-name";
ec_MESBasic_product_prodSecUnit_refProdSecUnit_quickquery_info["baseUnit.id"].columnName="UNIT_ID";
ec_MESBasic_product_prodSecUnit_refProdSecUnit_quickquery_info["product.productCode"]={};
ec_MESBasic_product_prodSecUnit_refProdSecUnit_quickquery_info["product.productCode"].dbColumnType="TEXT";
ec_MESBasic_product_prodSecUnit_refProdSecUnit_quickquery_info["product.productCode"].layRec="S2BASE_PRODUCT,PRODUCT_ID,MESBASIC_PROD_SEC_UNITS,PRODUCT-productCode";
ec_MESBasic_product_prodSecUnit_refProdSecUnit_quickquery_info["product.productCode"].columnName="PRODUCT_CODE";
ec_MESBasic_product_prodSecUnit_refProdSecUnit_quickquery_info["product.id"]={};
ec_MESBasic_product_prodSecUnit_refProdSecUnit_quickquery_info["product.id"].dbColumnType="LONG";
ec_MESBasic_product_prodSecUnit_refProdSecUnit_quickquery_info["product.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,MESBASIC_PROD_SEC_UNITS,PRODUCT-productCode";
ec_MESBasic_product_prodSecUnit_refProdSecUnit_quickquery_info["product.id"].columnName="PRODUCT_ID";
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
 	var advRemainDialog = $('[id="MESBasic.product.prodSecUnit.refProdSecUnit.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.product.prodSecUnit.refProdSecUnit.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_product_prodSecUnit_refProdSecUnit_adv_queryForm" exportUrl="/MESBasic/product/prodSecUnit/refProdSecUnit-query.action">
							<#assign baseUnit_name_defaultValue  = ''>
									<#assign baseUnit_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_product_prodSecUnit_refProdSecUnit_adv_queryForm" code="X6Basic_1.0_unitGroup_BaseUnit_name" showFormat="SELECTCOMP" defaultValue=baseUnit_name_defaultValue  divCode="X6Basic_1.0_unitGroup_BaseUnit_name_baseUnit_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="X6Basic_1.0_unitGroup_BaseUnit" layRec="S2BASE_UNIT,UNIT_ID,MESBASIC_PROD_SEC_UNITS,BASE_UNIT-name" columnname="UNIT_NAME" columntype="TEXT" name="baseUnit.name" fieldType="SELECTCOMP" tableName="S2BASE_UNIT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										主单位
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="X6Basic_1.0_unitGroup_BaseUnit" />
										<input type="hidden" id="adv_baseUnit.id" name="baseUnit.id" value="" />
												<@mneclient iframe=true mneenable=false advresume="adv_baseUnit.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${baseUnit_name_defaultValue!}" reftitle="${getText('X6Basic.viewtitle.radion1398240433147')}"  conditionfunc="MESBasic.product.prodSecUnit.refProdSecUnit._querycustomFunc('baseUnit_name')" name="baseUnit.name" id="adv_ec_MESBasic_product_prodSecUnit_refProdSecUnit_queryForm_baseUnit_name" displayFieldName="name" type="other" exp="like"  classStyle="cui-noborder-input" url="/X6Basic/unitGroup/baseUnit/unitRef.action"   refViewCode="X6Basic_1.0_unitGroup_unitRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_product_prodSecUnit_refProdSecUnit_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign product_productCode_defaultValue  = ''>
									<#assign product_productCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_product_prodSecUnit_refProdSecUnit_adv_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=product_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_product_productCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,MESBASIC_PROD_SEC_UNITS,PRODUCT-productCode" columnname="PRODUCT_CODE" columntype="TEXT" name="product.productCode" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物品编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_product.id" name="product.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_product.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${product_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="MESBasic.product.prodSecUnit.refProdSecUnit._querycustomFunc('product_productCode')" name="product.productCode" id="adv_ec_MESBasic_product_prodSecUnit_refProdSecUnit_queryForm_product_productCode" displayFieldName="productCode" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/productRefNew.action"   refViewCode="MESBasic_1_product_productRefNew"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_product_prodSecUnit_refProdSecUnit_adv_queryForm"   />
								
                                	
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
			viewCode: 'MESBasic_1_product_refProdSecUnit',
			modelCode: 'MESBasic_1_product_ProdSecUnit',
			modelName: 'ProdSecUnit',
			formId: 'ec_MESBasic_product_prodSecUnit_refProdSecUnit_queryForm',
			olddiv: 'MESBasic.product.prodSecUnit.refProdSecUnit.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.product.prodSecUnit.refProdSecUnit.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_product_refProdSecUnit'+"&entity.code="+'MESBasic_1_product';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.product.prodSecUnit.refProdSecUnit.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.product.prodSecUnit.refProdSecUnit.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.product.prodSecUnit.refProdSecUnit.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_product_refProdSecUnit'+"&entity.code="+'MESBasic_1_product';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.product.prodSecUnit.refProdSecUnit.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.product.prodSecUnit.refProdSecUnit.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.product.prodSecUnit.refProdSecUnit.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.product.prodSecUnit.refProdSecUnit.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.product.prodSecUnit.refProdSecUnit.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.product.prodSecUnit.refProdSecUnit.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.product.prodSecUnit.refProdSecUnit.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.product.prodSecUnit.refProdSecUnit.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.product.prodSecUnit.refProdSecUnit.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.product.prodSecUnit.refProdSecUnit.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.product.prodSecUnit.refProdSecUnit.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.product.prodSecUnit.refProdSecUnit.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.product.prodSecUnit.refProdSecUnit.query('query')">
<#assign datatable_dataUrl = "/MESBasic/product/prodSecUnit/refProdSecUnit-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_MESBasic_product_prodSecUnit_refProdSecUnit_query" renderOverEvent="ec_MESBasic_product_prodSecUnit_refProdSecUnit_RenderOverEvent" pageInitMethod="ec_MESBasic_product_prodSecUnit_refProdSecUnit_PageInitMethod" modelCode="MESBasic_1_product_ProdSecUnit" noPermissionKeys="product.productCode,product.productName,baseUnit.code,baseUnit.name,changeRate,secUnit.code,secUnit.name" hidekeyPrefix="ec_MESBasic_product_prodSecUnit_refProdSecUnit_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_product_prodSecUnit_refProdSecUnit_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="MESBasic.product.prodSecUnit.refProdSecUnit.sendBackrefProdSecUnit" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','product.id','baseUnit.id','secUnit.id','id','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="MESBasic.product.prodSecUnit.refProdSecUnit.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign product_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${product_productCode_displayDefaultType!}"  key="product.productCode"   label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign product_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${product_productName_displayDefaultType!}"  key="product.productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign baseUnit_code_displayDefaultType  = ''>
			<@datacolumn columnName="UNIT_CODE"    showFormat="TEXT" defaultDisplay="${baseUnit_code_displayDefaultType!}"  key="baseUnit.code"   label="${getText('MESBasic.propertydisplayName.randoncode1437382413209')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign baseUnit_name_displayDefaultType  = ''>
			<@datacolumn columnName="UNIT_NAME"    showFormat="TEXT" defaultDisplay="${baseUnit_name_displayDefaultType!}"  key="baseUnit.name"   label="${getText('MESBasic.propertydisplayName.radion139823564048301')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign changeRate_displayDefaultType  = ''>
			<@datacolumn columnName="CHANGE_RATE"    showFormat="TEXT" defaultDisplay="${changeRate_displayDefaultType!}"  key="changeRate"   label="${getText('MESBasic.propertydisplayName.randon1530515455954')}" textalign="right" decimal="6" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign secUnit_code_displayDefaultType  = ''>
			<@datacolumn columnName="UNIT_CODE"    showFormat="TEXT" defaultDisplay="${secUnit_code_displayDefaultType!}"  key="secUnit.code"   label="${getText('MESBasic.propertydisplayName.randoncode1530515393619')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign secUnit_name_displayDefaultType  = ''>
			<@datacolumn columnName="UNIT_NAME"    showFormat="TEXT" defaultDisplay="${secUnit_name_displayDefaultType!}"  key="secUnit.name"   label="${getText('MESBasic.propertydisplayName.randon1530515393619')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_product_prodSecUnit_refProdSecUnit_RenderOverEvent(){
}
function ec_MESBasic_product_prodSecUnit_refProdSecUnit_PageInitMethod(){
}
	
	
	
	
	
	
	
</script>