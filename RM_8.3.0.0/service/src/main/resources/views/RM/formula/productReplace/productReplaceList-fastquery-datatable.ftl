	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('RM.entityname.randon1487075671473')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_RM_formula_productReplace_productReplaceList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_RM_formula_productReplace_productReplaceList_queryForm" exportUrl="/RM/formula/productReplace/productReplaceList-query.action">
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('RM.modelname.randon1540368005627')}_${getText('RM.viewtitle.randon1540369293539')}.xls" />
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
		<div id="ec_RM_formula_productReplace_productReplaceList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_RM_formula_productReplace_productReplaceList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('RM_7.5.0.0_formula_productReplaceList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="RM_7.5.0.0_formula_productReplaceList" formId="ec_RM_formula_productReplace_productReplaceList_queryForm" dataTableId="ec_RM_formula_productReplace_productReplaceList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_RM_formula_productReplace_productReplaceList_queryForm" isExpandAll=true formId="ec_RM_formula_productReplace_productReplaceList_queryForm" idprefix="ec_RM_formula_productReplace_productReplaceList" expandType="all"  fieldcodes="MESBasic_1_product_Product_productName_originProduct_productName:RM.propertydisplayName.radion201810241623001||MESBasic_1_product_Product_productName_newProduct_productName:RM.propertydisplayName.radion201810241623002||RM_7.5.0.0_formula_ProductReplace_replaceTime_replaceTime:RM.propertydisplayName.randon1540368099250||base_staff_name_replaceUser_name:RM.propertydisplayName.radion201810241623003" > 
							<#assign originProduct_productName_defaultValue  = ''>
									<#assign originProduct_productName_defaultValue  = ''>
							<@queryfield formId="ec_RM_formula_productReplace_productReplaceList_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=originProduct_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_originProduct_productName" isCustomize=true style="" > 
										<input type="hidden" id="originProduct.id" name="originProduct.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${originProduct_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  conditionfunc="RM.formula.productReplace.productReplaceList._querycustomFunc('originProduct_productName')" name="originProduct.productName" id="ec_RM_formula_productReplace_productReplaceList_queryForm_originProduct_productName" displayFieldName="productName" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/refProductLayout.action"   refViewCode="MESBasic_1_product_refProductLayout"  clicked=true multiple=false mnewidth=260 formId="ec_RM_formula_productReplace_productReplaceList_queryForm" searchClick="RM.formula.productReplace.productReplaceList.commonQuery('query')"   />
							</@queryfield>
							<#assign newProduct_productName_defaultValue  = ''>
									<#assign newProduct_productName_defaultValue  = ''>
							<@queryfield formId="ec_RM_formula_productReplace_productReplaceList_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=newProduct_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_newProduct_productName" isCustomize=true style="" > 
										<input type="hidden" id="newProduct.id" name="newProduct.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${newProduct_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  conditionfunc="RM.formula.productReplace.productReplaceList._querycustomFunc('newProduct_productName')" name="newProduct.productName" id="ec_RM_formula_productReplace_productReplaceList_queryForm_newProduct_productName" displayFieldName="productName" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/refProductLayout.action"   refViewCode="MESBasic_1_product_refProductLayout"  clicked=true multiple=false mnewidth=260 formId="ec_RM_formula_productReplace_productReplaceList_queryForm" searchClick="RM.formula.productReplace.productReplaceList.commonQuery('query')"   />
							</@queryfield>
							<#assign replaceTime_defaultValue  = ''>
									<#assign replaceTime_defaultValue  = ''>
								<#if (replaceTime_defaultValue)?? &&(replaceTime_defaultValue)?has_content>
									<#assign replaceTime_defaultValue  = getDefaultDateTime(replaceTime_defaultValue!)?datetime>
								</#if>
							<@queryfield formId="ec_RM_formula_productReplace_productReplaceList_queryForm" code="RM_7.5.0.0_formula_ProductReplace_replaceTime" showFormat="YMD_HMS" defaultValue=replaceTime_defaultValue  divCode="RM_7.5.0.0_formula_ProductReplace_replaceTime_replaceTime" isCustomize=true style="" > 
								<div>
							  	 	<div style="float:left;width:45%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="replaceTime_start" id="replaceTime_start" exp="gequal"   formid="ec_RM_formula_productReplace_productReplaceList_queryForm" />
									</div>
									<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
							  	 	<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="replaceTime_end" id="replaceTime_end" exp="lequal"   formid="ec_RM_formula_productReplace_productReplaceList_queryForm" />
							  		</div>
						  		</div>
							</@queryfield>
							<#assign replaceUser_name_defaultValue  = ''>
									<#assign replaceUser_name_defaultValue  = ''>
							<@queryfield formId="ec_RM_formula_productReplace_productReplaceList_queryForm" code="base_staff_name" showFormat="SELECTCOMP" defaultValue=replaceUser_name_defaultValue  divCode="base_staff_name_replaceUser_name" isCustomize=true style="" > 
										<input type="hidden" id="replaceUser.id" name="replaceUser.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${replaceUser_name_defaultValue!}" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="RM.formula.productReplace.productReplaceList._querycustomFunc('replaceUser_name')" name="replaceUser.name" id="ec_RM_formula_productReplace_productReplaceList_queryForm_replaceUser_name" displayFieldName="name" type="Staff" exp="like" classStyle="cui-noborder-input" url="/foundation/staff/common/staffListFrameset.action"   refViewCode="sysbase_1.0_staff_ref"  clicked=true multiple=false mnewidth=260 formId="ec_RM_formula_productReplace_productReplaceList_queryForm" searchClick="RM.formula.productReplace.productReplaceList.commonQuery('query')"   />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_RM_formula_productReplace_productReplaceList_queryForm" type="adv" onclick="RM.formula.productReplace.productReplaceList.commonQuery('query')" onadvancedclick="advQuery('RM.formula.productReplace.productReplaceList.advquery')" /> 
						 		<@querybutton formId="ec_RM_formula_productReplace_productReplaceList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_RM_formula_productReplace_productReplaceList_quickquery_info={};
ec_RM_formula_productReplace_productReplaceList_quickquery_info["MainTableName"]="RM_PRODUCT_REPLACES";
ec_RM_formula_productReplace_productReplaceList_quickquery_info["originProduct.productName"]={};
ec_RM_formula_productReplace_productReplaceList_quickquery_info["originProduct.productName"].dbColumnType="TEXT";
ec_RM_formula_productReplace_productReplaceList_quickquery_info["originProduct.productName"].layRec="S2BASE_PRODUCT,PRODUCT_ID,RM_PRODUCT_REPLACES,ORIGIN_PRODUCT-productName";
ec_RM_formula_productReplace_productReplaceList_quickquery_info["originProduct.productName"].columnName="PRODUCT_NAME";
ec_RM_formula_productReplace_productReplaceList_quickquery_info["originProduct.id"]={};
ec_RM_formula_productReplace_productReplaceList_quickquery_info["originProduct.id"].dbColumnType="LONG";
ec_RM_formula_productReplace_productReplaceList_quickquery_info["originProduct.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,RM_PRODUCT_REPLACES,ORIGIN_PRODUCT-productName";
ec_RM_formula_productReplace_productReplaceList_quickquery_info["originProduct.id"].columnName="PRODUCT_ID";
ec_RM_formula_productReplace_productReplaceList_quickquery_info["newProduct.productName"]={};
ec_RM_formula_productReplace_productReplaceList_quickquery_info["newProduct.productName"].dbColumnType="TEXT";
ec_RM_formula_productReplace_productReplaceList_quickquery_info["newProduct.productName"].layRec="S2BASE_PRODUCT,PRODUCT_ID,RM_PRODUCT_REPLACES,NEW_PRODUCT-productName";
ec_RM_formula_productReplace_productReplaceList_quickquery_info["newProduct.productName"].columnName="PRODUCT_NAME";
ec_RM_formula_productReplace_productReplaceList_quickquery_info["newProduct.id"]={};
ec_RM_formula_productReplace_productReplaceList_quickquery_info["newProduct.id"].dbColumnType="LONG";
ec_RM_formula_productReplace_productReplaceList_quickquery_info["newProduct.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,RM_PRODUCT_REPLACES,NEW_PRODUCT-productName";
ec_RM_formula_productReplace_productReplaceList_quickquery_info["newProduct.id"].columnName="PRODUCT_ID";
ec_RM_formula_productReplace_productReplaceList_quickquery_info["replaceTime"]={};
ec_RM_formula_productReplace_productReplaceList_quickquery_info["replaceTime"].dbColumnType="DATETIME";
ec_RM_formula_productReplace_productReplaceList_quickquery_info["replaceTime"].layRec="replaceTime";
ec_RM_formula_productReplace_productReplaceList_quickquery_info["replaceTime"].columnName="REPLACE_TIME";
ec_RM_formula_productReplace_productReplaceList_quickquery_info["replaceUser.name"]={};
ec_RM_formula_productReplace_productReplaceList_quickquery_info["replaceUser.name"].dbColumnType="TEXT";
ec_RM_formula_productReplace_productReplaceList_quickquery_info["replaceUser.name"].layRec="base_staff,ID,RM_PRODUCT_REPLACES,REPLACE_USER-name";
ec_RM_formula_productReplace_productReplaceList_quickquery_info["replaceUser.name"].columnName="NAME";
ec_RM_formula_productReplace_productReplaceList_quickquery_info["replaceUser.id"]={};
ec_RM_formula_productReplace_productReplaceList_quickquery_info["replaceUser.id"].dbColumnType="LONG";
ec_RM_formula_productReplace_productReplaceList_quickquery_info["replaceUser.id"].layRec="base_staff,ID,RM_PRODUCT_REPLACES,REPLACE_USER-name";
ec_RM_formula_productReplace_productReplaceList_quickquery_info["replaceUser.id"].columnName="ID";
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
 	var advRemainDialog = $('[id="RM.formula.productReplace.productReplaceList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="RM.formula.productReplace.productReplaceList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_RM_formula_productReplace_productReplaceList_adv_queryForm" exportUrl="/RM/formula/productReplace/productReplaceList-query.action">
							<#assign originProduct_productName_defaultValue  = ''>
									<#assign originProduct_productName_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_formula_productReplace_productReplaceList_adv_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=originProduct_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_originProduct_productName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,RM_PRODUCT_REPLACES,ORIGIN_PRODUCT-productName" columnname="PRODUCT_NAME" columntype="TEXT" name="originProduct.productName" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										原物料
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_originProduct.id" name="originProduct.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_originProduct.id"  isPrecise=true deValue="${originProduct_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  conditionfunc="RM.formula.productReplace.productReplaceList._querycustomFunc('originProduct_productName')" name="originProduct.productName" id="adv_ec_RM_formula_productReplace_productReplaceList_queryForm_originProduct_productName" displayFieldName="productName" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/customRef.action"   refViewCode="MESBasic_1_product_customRef"  clicked=true multiple=false mnewidth=260 formId="ec_RM_formula_productReplace_productReplaceList_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign newProduct_productName_defaultValue  = ''>
									<#assign newProduct_productName_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_formula_productReplace_productReplaceList_adv_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=newProduct_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_newProduct_productName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,RM_PRODUCT_REPLACES,NEW_PRODUCT-productName" columnname="PRODUCT_NAME" columntype="TEXT" name="newProduct.productName" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										新物料
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_newProduct.id" name="newProduct.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_newProduct.id"  isPrecise=true deValue="${newProduct_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  conditionfunc="RM.formula.productReplace.productReplaceList._querycustomFunc('newProduct_productName')" name="newProduct.productName" id="adv_ec_RM_formula_productReplace_productReplaceList_queryForm_newProduct_productName" displayFieldName="productName" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/customRef.action"   refViewCode="MESBasic_1_product_customRef"  clicked=true multiple=false mnewidth=260 formId="ec_RM_formula_productReplace_productReplaceList_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign replaceTime_defaultValue  = ''>
									<#assign replaceTime_defaultValue  = ''>
								<#if (replaceTime_defaultValue)?? &&(replaceTime_defaultValue)?has_content>
									<#assign replaceTime_defaultValue  = getDefaultDateTime(replaceTime_defaultValue!)?datetime>
								</#if>
								<@advsqueryfield formId="ec_RM_formula_productReplace_productReplaceList_adv_queryForm" code="RM_7.5.0.0_formula_ProductReplace_replaceTime" showFormat="YMD_HMS" defaultValue=replaceTime_defaultValue  divCode="RM_7.5.0.0_formula_ProductReplace_replaceTime_replaceTime" isCustomize=true > 
								
								<div class="quick_query_node" style="width:98%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_formula_ProductReplace" layRec="replaceTime" columnname="REPLACE_TIME" columntype="DATETIME" name="replaceTime" fieldType="DATETIME" showFormat="YMD_HMS" tableName="RM_PRODUCT_REPLACES"/>
								<label class="quick_query_labeltime advQuery_label" style="text-align:right;float:left;width:14%;height:28px;line-height:28px">
								<span class="quick_query_text">
										替换时间
								</span>
								</label>
							<div class="quick_query_contenttime advQuery_content" style="float:left;width:86%">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_formula_ProductReplace" />
								<div>
							  	 	<div style="float:left;width:41.8%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${replaceTime_defaultValue!}" deValue="${replaceTime_defaultValue!}"  name="replaceTime_start" id="adv_replaceTime_start" exp="gequal"    formid="ec_RM_formula_productReplace_productReplaceList_adv_queryForm" />
									</div>
									<div style="float:left;width:16.3%;text-align:center;line-height: 26px;"> - - ${getText('common.date.split')} - - </div>
							  	 	<div style="float:left;width:41.8%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${replaceTime_defaultValue!}" deValue="${replaceTime_defaultValue!}"  name="replaceTime_end" id="adv_replaceTime_end" exp="lequal"    formid="ec_RM_formula_productReplace_productReplaceList_adv_queryForm" />
							  		</div>
						  		</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign replaceUser_name_defaultValue  = ''>
									<#assign replaceUser_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_formula_productReplace_productReplaceList_adv_queryForm" code="base_staff_name" showFormat="SELECTCOMP" defaultValue=replaceUser_name_defaultValue  divCode="base_staff_name_replaceUser_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="sysbase_1.0_staff_base_staff" layRec="base_staff,ID,RM_PRODUCT_REPLACES,REPLACE_USER-name" columnname="NAME" columntype="TEXT" name="replaceUser.name" fieldType="SELECTCOMP" tableName="base_staff"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										替换人
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="sysbase_1.0_staff_base_staff" />
										<input type="hidden" id="adv_replaceUser.id" name="replaceUser.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_replaceUser.id"  isPrecise=true deValue="${replaceUser_name_defaultValue!}" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="RM.formula.productReplace.productReplaceList._querycustomFunc('replaceUser_name')" name="replaceUser.name" id="adv_ec_RM_formula_productReplace_productReplaceList_queryForm_replaceUser_name" displayFieldName="name" type="Staff" exp="like"  classStyle="cui-noborder-input" url="/foundation/staff/common/staffListFrameset.action"   refViewCode="sysbase_1.0_staff_ref"  clicked=true multiple=false mnewidth=260 formId="ec_RM_formula_productReplace_productReplaceList_adv_queryForm"   />
								
                                	
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
			viewCode: 'RM_7.5.0.0_formula_productReplaceList',
			modelCode: 'RM_7.5.0.0_formula_ProductReplace',
			modelName: 'ProductReplace',
			formId: 'ec_RM_formula_productReplace_productReplaceList_queryForm',
			olddiv: 'RM.formula.productReplace.productReplaceList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='RM.formula.productReplace.productReplaceList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'RM_7.5.0.0_formula_productReplaceList'+"&entity.code="+'RM_7.5.0.0_formula';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='RM.formula.productReplace.productReplaceList.advquery'] #customquContent").html(html);
		 	$("[id='RM.formula.productReplace.productReplaceList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='RM.formula.productReplace.productReplaceList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'RM_7.5.0.0_formula_productReplaceList'+"&entity.code="+'RM_7.5.0.0_formula';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='RM.formula.productReplace.productReplaceList.advquery'] #customquContent").html(html);
			 $("[id='RM.formula.productReplace.productReplaceList.advquery'] #advQueryLoading").hide();
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
		$('[id="RM.formula.productReplace.productReplaceList.advquery"] div.customqu-content').css('display','none');
		$('[id="RM.formula.productReplace.productReplaceList.advquery"] div.move-grade').css('display','none');
		// $('[id="RM.formula.productReplace.productReplaceList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="RM.formula.productReplace.productReplaceList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="RM.formula.productReplace.productReplaceList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="RM.formula.productReplace.productReplaceList.advquery"] div.customqu-content').css('display','block');
		$('[id="RM.formula.productReplace.productReplaceList.advquery"] div.move-grade').css('display','block');
		// $('[id="RM.formula.productReplace.productReplaceList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="RM.formula.productReplace.productReplaceList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="RM.formula.productReplace.productReplaceList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "RM.formula.productReplace.productReplaceList.query('query')">
<#assign datatable_dataUrl = "/RM/formula/productReplace/productReplaceList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "RM.formula.productReplace.productReplaceList.query('query')">
<#assign datatable_dataUrl = "/RM/formula/productReplace/productReplaceList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_RM_formula_productReplace_productReplaceList_query" renderOverEvent="ec_RM_formula_productReplace_productReplaceList_RenderOverEvent" pageInitMethod="ec_RM_formula_productReplace_productReplaceList_PageInitMethod" modelCode="RM_7.5.0.0_formula_ProductReplace" noPermissionKeys="originProduct.productName,newProduct.productName,replaceTime,replaceUser.name,formulaIds" hidekeyPrefix="ec_RM_formula_productReplace_productReplaceList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_RM_formula_productReplace_productReplaceList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="RM.formula.productReplace.productReplaceList.dbClickViewproductReplaceList" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','tableInfoId','originProduct.id','newProduct.id','replaceUser.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="RM.formula.productReplace.productReplaceList.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign originProduct_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${originProduct_productName_displayDefaultType!}"  key="originProduct.productName"   label="${getText('RM.propertydisplayName.radion201810241623001')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign newProduct_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${newProduct_productName_displayDefaultType!}"  key="newProduct.productName"   label="${getText('RM.propertydisplayName.radion201810241623002')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign replaceTime_displayDefaultType  = ''>
			<@datacolumn columnName="REPLACE_TIME"    showFormat="YMD_HMS" defaultDisplay="${replaceTime_displayDefaultType!}"  key="replaceTime"   label="${getText('RM.propertydisplayName.randon1540368099250')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign replaceUser_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${replaceUser_name_displayDefaultType!}"  key="replaceUser.name"   label="${getText('RM.propertydisplayName.radion201810241623003')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign formulaIds_displayDefaultType  = ''>
			<@datacolumn columnName="FORMULA_IDS"    showFormat="TEXT" defaultDisplay="${formulaIds_displayDefaultType!}"  key="formulaIds"   label="${getText('RM.propertydisplayName.randon1540368026295')}" textalign="left"  width=500   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_RM_formula_productReplace_productReplaceList_RenderOverEvent(){
}
function ec_RM_formula_productReplace_productReplaceList_PageInitMethod(){
}
	
	
	
	
	
</script>