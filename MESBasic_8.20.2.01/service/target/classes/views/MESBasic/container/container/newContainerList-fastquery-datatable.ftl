	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1415252093775')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_container_container_newContainerList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_container_container_newContainerList_queryForm" exportUrl="/MESBasic/container/container/newContainerList-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="department" bak_value="department"/>
		<input type="hidden" id="MESBasic_1_tankModel_TankModel" value="model" bak_value="model"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1415252141275')}_${getText('MESBasic.viewtitle.randon1551700686050')}.xls" />
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
		<div id="ec_MESBasic_container_container_newContainerList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_container_container_newContainerList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_container_newContainerList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_container_newContainerList" formId="ec_MESBasic_container_container_newContainerList_queryForm" dataTableId="ec_MESBasic_container_container_newContainerList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_container_container_newContainerList_queryForm" isExpandAll=true formId="ec_MESBasic_container_container_newContainerList_queryForm" idprefix="ec_MESBasic_container_container_newContainerList" expandType="all"  fieldcodes="MESBasic_1_container_Container_code_code:MESBasic.propertydisplayName.radion141526835982911||MESBasic_1_product_Product_productName_product_productName:MESBasic.propertydisplayName.radion141577264483311" > 
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_container_container_newContainerList_queryForm" code="MESBasic_1_container_Container_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="MESBasic_1_container_Container_code_code" isCustomize=true style="" > 
										<#if (code_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_container_container_newContainerList_queryForm"  isPrecise=true value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="MESBasic.container.container.newContainerList._querycustomFunc('code')" name="code" id="ec_MESBasic_container_container_newContainerList_queryForm_code" displayFieldName="code" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/container/container/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.container.container.newContainerList.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_container_container_newContainerList_queryForm"  isPrecise=true  conditionfunc="MESBasic.container.container.newContainerList._querycustomFunc('code')" name="code" id="ec_MESBasic_container_container_newContainerList_queryForm_code" displayFieldName="code" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/container/container/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.container.container.newContainerList.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign product_productName_defaultValue  = ''>
									<#assign product_productName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_container_container_newContainerList_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=product_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_product_productName" isCustomize=true style="" > 
										<input type="hidden" id="product.id" name="product.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${product_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  conditionfunc="MESBasic.container.container.newContainerList._querycustomFunc('product_productName')" name="product.productName" id="ec_MESBasic_container_container_newContainerList_queryForm_product_productName" displayFieldName="productName" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/refProductLayout.action"   refViewCode="MESBasic_1_product_refProductLayout"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_container_container_newContainerList_queryForm" searchClick="MESBasic.container.container.newContainerList.commonQuery('query')"   />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_container_container_newContainerList_queryForm" type="adv" onclick="MESBasic.container.container.newContainerList.commonQuery('query')" onadvancedclick="advQuery('MESBasic.container.container.newContainerList.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_container_container_newContainerList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_container_container_newContainerList_quickquery_info={};
ec_MESBasic_container_container_newContainerList_quickquery_info["MainTableName"]="MESBASIC_CONTAINERS";
ec_MESBasic_container_container_newContainerList_quickquery_info["code"]={};
ec_MESBasic_container_container_newContainerList_quickquery_info["code"].dbColumnType="TEXT";
ec_MESBasic_container_container_newContainerList_quickquery_info["code"].layRec="code";
ec_MESBasic_container_container_newContainerList_quickquery_info["code"].columnName="CODE";
ec_MESBasic_container_container_newContainerList_quickquery_info["product.productName"]={};
ec_MESBasic_container_container_newContainerList_quickquery_info["product.productName"].dbColumnType="TEXT";
ec_MESBasic_container_container_newContainerList_quickquery_info["product.productName"].layRec="S2BASE_PRODUCT,PRODUCT_ID,MESBASIC_CONTAINERS,PRODUCT-productName";
ec_MESBasic_container_container_newContainerList_quickquery_info["product.productName"].columnName="PRODUCT_NAME";
ec_MESBasic_container_container_newContainerList_quickquery_info["product.id"]={};
ec_MESBasic_container_container_newContainerList_quickquery_info["product.id"].dbColumnType="LONG";
ec_MESBasic_container_container_newContainerList_quickquery_info["product.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,MESBASIC_CONTAINERS,PRODUCT-productName";
ec_MESBasic_container_container_newContainerList_quickquery_info["product.id"].columnName="PRODUCT_ID";
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
 	var advRemainDialog = $('[id="MESBasic.container.container.newContainerList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.container.container.newContainerList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_container_container_newContainerList_adv_queryForm" exportUrl="/MESBasic/container/container/newContainerList-query.action">
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_container_container_newContainerList_adv_queryForm" code="MESBasic_1_container_Container_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="MESBasic_1_container_Container_code_code" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_container_Container" layRec="code" columnname="CODE" columntype="TEXT" name="code" fieldType="TEXTFIELD" tableName="MESBASIC_CONTAINERS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										储罐编号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_container_Container" />
										<#if (code_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_container_container_newContainerList_adv_queryForm"  isPrecise=true value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="MESBasic.container.container.newContainerList._querycustomFunc('code')" name="code" id="adv_ec_MESBasic_container_container_newContainerList_queryForm_code" displayFieldName="code" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/container/container/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_container_newContainerList"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_container_container_newContainerList_adv_queryForm"  isPrecise=true  conditionfunc="MESBasic.container.container.newContainerList._querycustomFunc('code')" name="code" id="adv_ec_MESBasic_container_container_newContainerList_queryForm_code" displayFieldName="code" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/container/container/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_container_newContainerList"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign product_productName_defaultValue  = ''>
									<#assign product_productName_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_container_container_newContainerList_adv_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=product_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_product_productName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,MESBASIC_CONTAINERS,PRODUCT-productName" columnname="PRODUCT_NAME" columntype="TEXT" name="product.productName" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物料编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_product.id" name="product.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_product.id"  isPrecise=true deValue="${product_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  conditionfunc="MESBasic.container.container.newContainerList._querycustomFunc('product_productName')" name="product.productName" id="adv_ec_MESBasic_container_container_newContainerList_queryForm_product_productName" displayFieldName="productName" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/refProductLayout.action"   refViewCode="MESBasic_1_product_refProductLayout"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_container_container_newContainerList_adv_queryForm"   />
								
                                	
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
			viewCode: 'MESBasic_1_container_newContainerList',
			modelCode: 'MESBasic_1_container_Container',
			modelName: 'Container',
			formId: 'ec_MESBasic_container_container_newContainerList_queryForm',
			olddiv: 'MESBasic.container.container.newContainerList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.container.container.newContainerList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_container_newContainerList'+"&entity.code="+'MESBasic_1_container';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.container.container.newContainerList.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.container.container.newContainerList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.container.container.newContainerList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_container_newContainerList'+"&entity.code="+'MESBasic_1_container';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.container.container.newContainerList.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.container.container.newContainerList.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.container.container.newContainerList.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.container.container.newContainerList.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.container.container.newContainerList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.container.container.newContainerList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.container.container.newContainerList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.container.container.newContainerList.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.container.container.newContainerList.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.container.container.newContainerList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.container.container.newContainerList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.container.container.newContainerList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.container.container.newContainerList.query('query')">
<#assign datatable_dataUrl = "/MESBasic/container/container/newContainerList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_MESBasic_container_container_newContainerList_query" renderOverEvent="ec_MESBasic_container_container_newContainerList_RenderOverEvent" pageInitMethod="ec_MESBasic_container_container_newContainerList_PageInitMethod" modelCode="MESBasic_1_container_Container" noPermissionKeys="code,name,containerShape,containerStatus,product.productCode,product.productName,person.name,department.name" hidekeyPrefix="ec_MESBasic_container_container_newContainerList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_container_container_newContainerList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="MESBasic.container.container.newContainerList.dbmodifynewContainerList" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','containerShape.id','containerStatus.id','product.id','person.id','department.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.container.container.newContainerList.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}newContainerList_add_add_MESBasic_1_container_newContainerList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1551702578133')}||iconcls:add||useInMore:false||onclick:
				MESBasic.container.container.newContainerList.addnewContainerList()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_container_newContainerList_BUTTON_add"
		buttonType="ADD" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}newContainerList_add_add_MESBasic_1_container_newContainerList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1551702578133')}||iconcls:add||useInMore:false||onclick:
				MESBasic.container.container.newContainerList.addnewContainerList()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}newContainerList_delete_del_MESBasic_1_container_newContainerList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1551702606265')}||iconcls:del||useInMore:false||onclick:
				MESBasic.container.container.newContainerList.delnewContainerList()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_container_newContainerList_BUTTON_delete"
		buttonType="DELETE" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}newContainerList_delete_del_MESBasic_1_container_newContainerList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1551702606265')}||iconcls:del||useInMore:false||onclick:
				MESBasic.container.container.newContainerList.delnewContainerList()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}newContainerList_modify_modify_MESBasic_1_container_newContainerList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1551702626891')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.container.container.newContainerList.modifynewContainerList()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_container_newContainerList_BUTTON_modify"
		buttonType="MODIFY" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}newContainerList_modify_modify_MESBasic_1_container_newContainerList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1551702626891')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.container.container.newContainerList.modifynewContainerList()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}newContainerList_import_import_MESBasic_1_container_newContainerList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1555325284087')}||iconcls:import||useInMore:false||onclick:
				MESBasic.container.container.newContainerList.importnewContainerList()||subButtons:[{text:'${getText('import.file.downloadtemplate')}',handler:function(){MESBasic.container.container.newContainerList.downloadTemplatenewContainerList()},useInMore:'false'}]
		" 
		resultType="json" 
		buttonCode="MESBasic_1_container_newContainerList_BUTTON_import"
		buttonType="IMPORT" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}newContainerList_import_import_MESBasic_1_container_newContainerList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1555325284087')}||iconcls:import||useInMore:false||onclick:
				MESBasic.container.container.newContainerList.importnewContainerList()||subButtons:[{text:'${getText('import.file.downloadtemplate')}',handler:function(){MESBasic.container.container.newContainerList.downloadTemplatenewContainerList()},useInMore:'false'}]
		" 
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('MESBasic.propertydisplayName.radion141526835982911')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('MESBasic.propertydisplayName.radion141526839345211')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign containerShape_displayDefaultType  = ''>
			<@datacolumn columnName="CONTAINER_SHAPE"    showFormat="SELECTCOMP" defaultDisplay="${containerShape_displayDefaultType!}"  key="containerShape.value"   label="${getText('MESBasic.propertydisplayName.randon155170029519311')}" textalign="center"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign containerStatus_displayDefaultType  = ''>
			<@datacolumn columnName="CONTAINER_STATUS"    showFormat="SELECTCOMP" defaultDisplay="${containerStatus_displayDefaultType!}"  key="containerStatus.value"   label="${getText('MESBasic.propertydisplayName.radion141532202396811')}" textalign="center"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign product_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${product_productCode_displayDefaultType!}"  key="product.productCode"   label="${getText('MESBasic.propertydisplayName.radion141577264483311')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign product_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${product_productName_displayDefaultType!}"  key="product.productName"   label="${getText('MESBasic.propertydisplayName.radion141577274073711')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign person_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${person_name_displayDefaultType!}"  key="person.name"   label="${getText('MESBasic.propertydisplayName.radion141577274078811')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign department_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${department_name_displayDefaultType!}"  key="department.name"   label="${getText('MESBasic.propertydisplayName.radion141577274079911')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_container_container_newContainerList_RenderOverEvent(){
}
function ec_MESBasic_container_container_newContainerList_PageInitMethod(){
}
	
	
	
	
	
	
	
	
</script>