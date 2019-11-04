	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1490604762072')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm" exportUrl="/WOM/putInMaterial/putInMaterialPart/putinRef-query.action">
		<input type="hidden" id="MESBasic_1_factoryModel_FactoryModel" value="factoryId" bak_value="factoryId"/>
		<input type="hidden" id="MESBasic_1_storeSet_StoreSet" value="storeID" bak_value="storeID"/>
		<input type="hidden" reset="false" name="WOM_putInMaterial_putInMaterialPart_putinRef_condition" id="WOM_putInMaterial_putInMaterialPart_putinRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1490604876056')}_${getText('WOM.viewtitle.randon1494828456715')}.xls" />
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
		<div id="ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_putInMaterial_putinRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_putInMaterial_putinRef" formId="ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm" dataTableId="ec_WOM_putInMaterial_putInMaterialPart_putinRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm" isExpandAll=true formId="ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm" idprefix="ec_WOM_putInMaterial_putInMaterialPart_putinRef" expandType="all"  fieldcodes="WOM_7.5.0.0_putInMaterial_PutInMaterial_tableNo_headId_tableNo:WOM.tableNo1122||MESBasic_1_product_Product_productCode_productId_productCode:MESBasic.propertydisplayName.radion1415772644833" > 
							<#assign headId_tableNo_defaultValue  = ''>
									<#assign headId_tableNo_defaultValue  = ''>
							<@queryfield formId="ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm" code="WOM_7.5.0.0_putInMaterial_PutInMaterial_tableNo" showFormat="SELECTCOMP" defaultValue=headId_tableNo_defaultValue  divCode="WOM_7.5.0.0_putInMaterial_PutInMaterial_tableNo_headId_tableNo" isCustomize=true style="" > 
										<input type="hidden" id="headId.id" name="headId.id" value="" />
												<div class="fix-input">
													<input type="text" class="cui-noborder-input" name="headId.tableNo" id="headId.tableNo" value="${headId_tableNo_defaultValue!}" deValue="${headId_tableNo_defaultValue!}"   exp="like"/>
												</div>
							</@queryfield>
							<#assign productId_productCode_defaultValue  = ''>
									<#assign productId_productCode_defaultValue  = ''>
							<@queryfield formId="ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=productId_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_productId_productCode" isCustomize=true style="" > 
										<input type="hidden" id="productId.id" name="productId.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${productId_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="WOM.putInMaterial.putInMaterialPart.putinRef._querycustomFunc('productId_productCode')" name="productId.productCode" id="ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm_productId_productCode" displayFieldName="productCode" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/productRefNew.action"   refViewCode="MESBasic_1_product_productRefNew"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm" searchClick="WOM.putInMaterial.putInMaterialPart.putinRef.commonQuery('query')"   />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm" type="adv" onclick="WOM.putInMaterial.putInMaterialPart.putinRef.commonQuery('query')" onadvancedclick="advQuery('WOM.putInMaterial.putInMaterialPart.putinRef.advquery')" /> 
						 		<@querybutton formId="ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info={};
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["MainTableName"]="WOM_PUT_IN_MATERIAL_PARTS";
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["headId.tableNo"]={};
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["headId.tableNo"].dbColumnType="TEXT";
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["headId.tableNo"].layRec="WOM_PUT_IN_MATERIALS,ID,WOM_PUT_IN_MATERIAL_PARTS,HEAD_ID-tableNo";
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["headId.tableNo"].columnName="TABLE_NO";
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["headId.id"]={};
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["headId.id"].dbColumnType="LONG";
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["headId.id"].layRec="WOM_PUT_IN_MATERIALS,ID,WOM_PUT_IN_MATERIAL_PARTS,HEAD_ID-tableNo";
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["headId.id"].columnName="ID";
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["productId.productCode"]={};
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["productId.productCode"].dbColumnType="TEXT";
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["productId.productCode"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_PUT_IN_MATERIAL_PARTS,PRODUCT_ID-productCode";
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["productId.productCode"].columnName="PRODUCT_CODE";
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["productId.id"]={};
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["productId.id"].dbColumnType="LONG";
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["productId.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_PUT_IN_MATERIAL_PARTS,PRODUCT_ID-productCode";
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["productId.id"].columnName="PRODUCT_ID";
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
 	var advRemainDialog = $('[id="WOM.putInMaterial.putInMaterialPart.putinRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.putInMaterial.putInMaterialPart.putinRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_putInMaterial_putInMaterialPart_putinRef_adv_queryForm" exportUrl="/WOM/putInMaterial/putInMaterialPart/putinRef-query.action">
							<#assign headId_tableNo_defaultValue  = ''>
									<#assign headId_tableNo_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_putInMaterial_putInMaterialPart_putinRef_adv_queryForm" code="WOM_7.5.0.0_putInMaterial_PutInMaterial_tableNo" showFormat="SELECTCOMP" defaultValue=headId_tableNo_defaultValue  divCode="WOM_7.5.0.0_putInMaterial_PutInMaterial_tableNo_headId_tableNo" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_putInMaterial_PutInMaterial" layRec="WOM_PUT_IN_MATERIALS,ID,WOM_PUT_IN_MATERIAL_PARTS,HEAD_ID-tableNo" columnname="TABLE_NO" columntype="TEXT" name="headId.tableNo" fieldType="SELECTCOMP" tableName="WOM_PUT_IN_MATERIALS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										投料单
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_putInMaterial_PutInMaterial" />
										<input type="hidden" id="adv_headId.id" name="headId.id" value="" />
												<div class="fix-input">
													<input type="text" class="cui-noborder-input" name="headId.tableNo" id="adv_headId.tableNo" value="${headId_tableNo_defaultValue!}" deValue="${headId_tableNo_defaultValue!}"   exp="like" />
												</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign productId_productCode_defaultValue  = ''>
									<#assign productId_productCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_putInMaterial_putInMaterialPart_putinRef_adv_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=productId_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_productId_productCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_PUT_IN_MATERIAL_PARTS,PRODUCT_ID-productCode" columnname="PRODUCT_CODE" columntype="TEXT" name="productId.productCode" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物品编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_productId.id" name="productId.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_productId.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${productId_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="WOM.putInMaterial.putInMaterialPart.putinRef._querycustomFunc('productId_productCode')" name="productId.productCode" id="adv_ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm_productId_productCode" displayFieldName="productCode" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/productRefNew.action"   refViewCode="MESBasic_1_product_productRefNew"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_putInMaterial_putInMaterialPart_putinRef_adv_queryForm"   />
								
                                	
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
			viewCode: 'WOM_7.5.0.0_putInMaterial_putinRef',
			modelCode: 'WOM_7.5.0.0_putInMaterial_PutInMaterialPart',
			modelName: 'PutInMaterialPart',
			formId: 'ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm',
			olddiv: 'WOM.putInMaterial.putInMaterialPart.putinRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.putInMaterial.putInMaterialPart.putinRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_putInMaterial_putinRef'+"&entity.code="+'WOM_7.5.0.0_putInMaterial';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.putInMaterial.putInMaterialPart.putinRef.advquery'] #customquContent").html(html);
		 	$("[id='WOM.putInMaterial.putInMaterialPart.putinRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.putInMaterial.putInMaterialPart.putinRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_putInMaterial_putinRef'+"&entity.code="+'WOM_7.5.0.0_putInMaterial';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.putInMaterial.putInMaterialPart.putinRef.advquery'] #customquContent").html(html);
			 $("[id='WOM.putInMaterial.putInMaterialPart.putinRef.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.putInMaterial.putInMaterialPart.putinRef.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.putInMaterial.putInMaterialPart.putinRef.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.putInMaterial.putInMaterialPart.putinRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.putInMaterial.putInMaterialPart.putinRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.putInMaterial.putInMaterialPart.putinRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.putInMaterial.putInMaterialPart.putinRef.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.putInMaterial.putInMaterialPart.putinRef.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.putInMaterial.putInMaterialPart.putinRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.putInMaterial.putInMaterialPart.putinRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.putInMaterial.putInMaterialPart.putinRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.putInMaterial.putInMaterialPart.putinRef.query('query')">
<#assign datatable_dataUrl = "/WOM/putInMaterial/putInMaterialPart/putinRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.putInMaterial.putInMaterialPart.putinRef.query('query')">
<#assign datatable_dataUrl = "/WOM/putInMaterial/putInMaterialPart/putinRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_WOM_putInMaterial_putInMaterialPart_putinRef_query" renderOverEvent="ec_WOM_putInMaterial_putInMaterialPart_putinRef_RenderOverEvent" pageInitMethod="ec_WOM_putInMaterial_putInMaterialPart_putinRef_PageInitMethod" modelCode="WOM_7.5.0.0_putInMaterial_PutInMaterialPart" noPermissionKeys="headId.tableNo,productId.productCode,productId.productName,batchNum,wareID.wareCode,wareID.wareName,storeID.placeSetCode,storeID.placeSetName,useNum,lossNum" hidekeyPrefix="ec_WOM_putInMaterial_putInMaterialPart_putinRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="WOM.putInMaterial.putInMaterialPart.putinRef.sendBackputinRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','headId.id','productId.id','wareID.id','storeID.id','id','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="WOM.putInMaterial.putInMaterialPart.putinRef.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign headId_tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${headId_tableNo_displayDefaultType!}"  key="headId.tableNo"   label="${getText('WOM.tableNo1122')}" textalign="center"  width=190   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productId_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${productId_productCode_displayDefaultType!}"  key="productId.productCode"   label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productId_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${productId_productName_displayDefaultType!}"  key="productId.productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign batchNum_displayDefaultType  = ''>
			<@datacolumn columnName="BATCH_NUM"    showFormat="TEXT" defaultDisplay="${batchNum_displayDefaultType!}"  key="batchNum"   label="${getText('WOM.propertydisplayName.randon1490605271044')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign wareID_wareCode_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_CODE"    showFormat="TEXT" defaultDisplay="${wareID_wareCode_displayDefaultType!}"  key="wareID.wareCode"   label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign wareID_wareName_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_NAME"    showFormat="TEXT" defaultDisplay="${wareID_wareName_displayDefaultType!}"  key="wareID.wareName"   label="${getText('MESBasic.propertydisplayName.randon1484031316281')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign storeID_placeSetCode_displayDefaultType  = ''>
			<@datacolumn columnName="PLACE_SET_CODE"    showFormat="TEXT" defaultDisplay="${storeID_placeSetCode_displayDefaultType!}"  key="storeID.placeSetCode"   label="${getText('MESBasic.propertydisplayName.randon1489731651449')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign storeID_placeSetName_displayDefaultType  = ''>
			<@datacolumn columnName="PLACE_SET_NAME"    showFormat="TEXT" defaultDisplay="${storeID_placeSetName_displayDefaultType!}"  key="storeID.placeSetName"   label="${getText('MESBasic.propertydisplayName.randon1489731677162')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign useNum_displayDefaultType  = ''>
			<@datacolumn columnName="USE_NUM"    showFormat="TEXT" defaultDisplay="${useNum_displayDefaultType!}"  key="useNum"   label="${getText('WOM.propertydisplayName.randon1490605292518')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign lossNum_displayDefaultType  = ''>
			<@datacolumn columnName="LOSS_NUM"    showFormat="TEXT" defaultDisplay="${lossNum_displayDefaultType!}"  key="lossNum"   label="${getText('WOM.propertydisplayName.randon1490605314992')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
				<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_putInMaterial_PutInMaterialPart", "WOM_7.5.0.0_putInMaterial_putinRef", "LIST", "putInMaterialPart")>
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
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_putInMaterial_putInMaterialPart_putinRef_RenderOverEvent(){
}
function ec_WOM_putInMaterial_putInMaterialPart_putinRef_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
	
</script>