	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1489731295689')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_storeSet_storeSet_pubStoreRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_storeSet_storeSet_pubStoreRef_queryForm" exportUrl="/MESBasic/storeSet/storeSet/pubStoreRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" name="MESBasic_storeSet_storeSet_pubStoreRef_condition" id="MESBasic_storeSet_storeSet_pubStoreRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1489731375532')}_${getText('MESBasic.viewtitle.randon1514434358343')}.xls" />
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
		<div id="ec_MESBasic_storeSet_storeSet_pubStoreRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_storeSet_storeSet_pubStoreRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_storeSet_pubStoreRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_storeSet_pubStoreRef" formId="ec_MESBasic_storeSet_storeSet_pubStoreRef_queryForm" dataTableId="ec_MESBasic_storeSet_storeSet_pubStoreRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_storeSet_storeSet_pubStoreRef_queryForm" isExpandAll=true formId="ec_MESBasic_storeSet_storeSet_pubStoreRef_queryForm" idprefix="ec_MESBasic_storeSet_storeSet_pubStoreRef" expandType="all"  fieldcodes="MESBasic_1_storeSet_StoreSet_placeSetCode_placeSetCode:MESBasic.propertydisplayName.randon1489731651449||MESBasic_1_storeSet_StoreSet_placeSetName_placeSetName:MESBasic.propertydisplayName.randon1489731677162||MESBasic_1_wareMan_Ware_wareCode_wareId_wareCode:MESBasic.propertydisplayName.randon1484031239866||MESBasic_1_wareMan_Ware_wareName_wareId_wareName:MESBasic.propertydisplayName.randon1484031316281" > 
							<#assign placeSetCode_defaultValue  = ''>
									<#assign placeSetCode_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_storeSet_storeSet_pubStoreRef_queryForm" code="MESBasic_1_storeSet_StoreSet_placeSetCode" showFormat="TEXT" defaultValue=placeSetCode_defaultValue  divCode="MESBasic_1_storeSet_StoreSet_placeSetCode_placeSetCode" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="placeSetCode" id="placeSetCode" value="${placeSetCode_defaultValue!}" deValue="${placeSetCode_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign placeSetName_defaultValue  = ''>
									<#assign placeSetName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_storeSet_storeSet_pubStoreRef_queryForm" code="MESBasic_1_storeSet_StoreSet_placeSetName" showFormat="TEXT" defaultValue=placeSetName_defaultValue  divCode="MESBasic_1_storeSet_StoreSet_placeSetName_placeSetName" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="placeSetName" id="placeSetName" value="${placeSetName_defaultValue!}" deValue="${placeSetName_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign wareId_wareCode_defaultValue  = ''>
									<#assign wareId_wareCode_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_storeSet_storeSet_pubStoreRef_queryForm" code="MESBasic_1_wareMan_Ware_wareCode" showFormat="SELECTCOMP" defaultValue=wareId_wareCode_defaultValue  divCode="MESBasic_1_wareMan_Ware_wareCode_wareId_wareCode" isCustomize=true style="" > 
										<input type="hidden" id="wareId.id" name="wareId.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${wareId_wareCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  conditionfunc="MESBasic.storeSet.storeSet.pubStoreRef._querycustomFunc('wareId_wareCode')" name="wareId.wareCode" id="ec_MESBasic_storeSet_storeSet_pubStoreRef_queryForm_wareId_wareCode" displayFieldName="wareCode" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/wareMan/ware/wareRef.action"   refViewCode="MESBasic_1_wareMan_wareRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_storeSet_storeSet_pubStoreRef_queryForm" searchClick="MESBasic.storeSet.storeSet.pubStoreRef.commonQuery('query')"   />
							</@queryfield>
							<#assign wareId_wareName_defaultValue  = ''>
									<#assign wareId_wareName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_storeSet_storeSet_pubStoreRef_queryForm" code="MESBasic_1_wareMan_Ware_wareName" showFormat="SELECTCOMP" defaultValue=wareId_wareName_defaultValue  divCode="MESBasic_1_wareMan_Ware_wareName_wareId_wareName" isCustomize=true style="" > 
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${wareId_wareName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  conditionfunc="MESBasic.storeSet.storeSet.pubStoreRef._querycustomFunc('wareId_wareName')" name="wareId.wareName" id="ec_MESBasic_storeSet_storeSet_pubStoreRef_queryForm_wareId_wareName" displayFieldName="wareName" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/wareMan/ware/wareRef.action"   refViewCode="MESBasic_1_wareMan_wareRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_storeSet_storeSet_pubStoreRef_queryForm" searchClick="MESBasic.storeSet.storeSet.pubStoreRef.commonQuery('query')"   />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_storeSet_storeSet_pubStoreRef_queryForm" type="adv" onclick="MESBasic.storeSet.storeSet.pubStoreRef.commonQuery('query')" onadvancedclick="advQuery('MESBasic.storeSet.storeSet.pubStoreRef.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_storeSet_storeSet_pubStoreRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_storeSet_storeSet_pubStoreRef_quickquery_info={};
ec_MESBasic_storeSet_storeSet_pubStoreRef_quickquery_info["MainTableName"]="MATERIAL_STORE_SETS";
ec_MESBasic_storeSet_storeSet_pubStoreRef_quickquery_info["placeSetCode"]={};
ec_MESBasic_storeSet_storeSet_pubStoreRef_quickquery_info["placeSetCode"].dbColumnType="TEXT";
ec_MESBasic_storeSet_storeSet_pubStoreRef_quickquery_info["placeSetCode"].layRec="placeSetCode";
ec_MESBasic_storeSet_storeSet_pubStoreRef_quickquery_info["placeSetCode"].columnName="PLACE_SET_CODE";
ec_MESBasic_storeSet_storeSet_pubStoreRef_quickquery_info["placeSetName"]={};
ec_MESBasic_storeSet_storeSet_pubStoreRef_quickquery_info["placeSetName"].dbColumnType="TEXT";
ec_MESBasic_storeSet_storeSet_pubStoreRef_quickquery_info["placeSetName"].layRec="placeSetName";
ec_MESBasic_storeSet_storeSet_pubStoreRef_quickquery_info["placeSetName"].columnName="PLACE_SET_NAME";
ec_MESBasic_storeSet_storeSet_pubStoreRef_quickquery_info["wareId.wareCode"]={};
ec_MESBasic_storeSet_storeSet_pubStoreRef_quickquery_info["wareId.wareCode"].dbColumnType="TEXT";
ec_MESBasic_storeSet_storeSet_pubStoreRef_quickquery_info["wareId.wareCode"].layRec="MATERIAL_WARES,ID,MATERIAL_STORE_SETS,WARE_ID-wareCode";
ec_MESBasic_storeSet_storeSet_pubStoreRef_quickquery_info["wareId.wareCode"].columnName="WARE_CODE";
ec_MESBasic_storeSet_storeSet_pubStoreRef_quickquery_info["wareId.id"]={};
ec_MESBasic_storeSet_storeSet_pubStoreRef_quickquery_info["wareId.id"].dbColumnType="LONG";
ec_MESBasic_storeSet_storeSet_pubStoreRef_quickquery_info["wareId.id"].layRec="MATERIAL_WARES,ID,MATERIAL_STORE_SETS,WARE_ID-wareCode";
ec_MESBasic_storeSet_storeSet_pubStoreRef_quickquery_info["wareId.id"].columnName="ID";
ec_MESBasic_storeSet_storeSet_pubStoreRef_quickquery_info["wareId.wareName"]={};
ec_MESBasic_storeSet_storeSet_pubStoreRef_quickquery_info["wareId.wareName"].dbColumnType="TEXT";
ec_MESBasic_storeSet_storeSet_pubStoreRef_quickquery_info["wareId.wareName"].layRec="MATERIAL_WARES,ID,MATERIAL_STORE_SETS,WARE_ID-wareName";
ec_MESBasic_storeSet_storeSet_pubStoreRef_quickquery_info["wareId.wareName"].columnName="WARE_NAME";
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
 	var advRemainDialog = $('[id="MESBasic.storeSet.storeSet.pubStoreRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.storeSet.storeSet.pubStoreRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_storeSet_storeSet_pubStoreRef_adv_queryForm" exportUrl="/MESBasic/storeSet/storeSet/pubStoreRef-query.action">
							<#assign placeSetCode_defaultValue  = ''>
									<#assign placeSetCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_storeSet_storeSet_pubStoreRef_adv_queryForm" code="MESBasic_1_storeSet_StoreSet_placeSetCode" showFormat="TEXT" defaultValue=placeSetCode_defaultValue  divCode="MESBasic_1_storeSet_StoreSet_placeSetCode_placeSetCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_storeSet_StoreSet" layRec="placeSetCode" columnname="PLACE_SET_CODE" columntype="TEXT" name="placeSetCode" fieldType="TEXTFIELD" tableName="MATERIAL_STORE_SETS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										货位编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_storeSet_StoreSet" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="placeSetCode" id="adv_placeSetCode" value="${placeSetCode_defaultValue!}" deValue="${placeSetCode_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign placeSetName_defaultValue  = ''>
									<#assign placeSetName_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_storeSet_storeSet_pubStoreRef_adv_queryForm" code="MESBasic_1_storeSet_StoreSet_placeSetName" showFormat="TEXT" defaultValue=placeSetName_defaultValue  divCode="MESBasic_1_storeSet_StoreSet_placeSetName_placeSetName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_storeSet_StoreSet" layRec="placeSetName" columnname="PLACE_SET_NAME" columntype="TEXT" name="placeSetName" fieldType="TEXTFIELD" tableName="MATERIAL_STORE_SETS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										货位名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_storeSet_StoreSet" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="placeSetName" id="adv_placeSetName" value="${placeSetName_defaultValue!}" deValue="${placeSetName_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign wareId_wareCode_defaultValue  = ''>
									<#assign wareId_wareCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_storeSet_storeSet_pubStoreRef_adv_queryForm" code="MESBasic_1_wareMan_Ware_wareCode" showFormat="SELECTCOMP" defaultValue=wareId_wareCode_defaultValue  divCode="MESBasic_1_wareMan_Ware_wareCode_wareId_wareCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_wareMan_Ware" layRec="MATERIAL_WARES,ID,MATERIAL_STORE_SETS,WARE_ID-wareCode" columnname="WARE_CODE" columntype="TEXT" name="wareId.wareCode" fieldType="SELECTCOMP" tableName="MATERIAL_WARES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										仓库编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_wareMan_Ware" />
										<input type="hidden" id="adv_wareId.id" name="wareId.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_wareId.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${wareId_wareCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  conditionfunc="MESBasic.storeSet.storeSet.pubStoreRef._querycustomFunc('wareId_wareCode')" name="wareId.wareCode" id="adv_ec_MESBasic_storeSet_storeSet_pubStoreRef_queryForm_wareId_wareCode" displayFieldName="wareCode" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/wareMan/ware/wareRef.action"   refViewCode="MESBasic_1_wareMan_wareRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_storeSet_storeSet_pubStoreRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign wareId_wareName_defaultValue  = ''>
									<#assign wareId_wareName_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_storeSet_storeSet_pubStoreRef_adv_queryForm" code="MESBasic_1_wareMan_Ware_wareName" showFormat="SELECTCOMP" defaultValue=wareId_wareName_defaultValue  divCode="MESBasic_1_wareMan_Ware_wareName_wareId_wareName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_wareMan_Ware" layRec="MATERIAL_WARES,ID,MATERIAL_STORE_SETS,WARE_ID-wareName" columnname="WARE_NAME" columntype="TEXT" name="wareId.wareName" fieldType="SELECTCOMP" tableName="MATERIAL_WARES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										仓库名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_wareMan_Ware" />
												<@mneclient iframe=true mneenable=true advresume="adv_wareId.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${wareId_wareName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  conditionfunc="MESBasic.storeSet.storeSet.pubStoreRef._querycustomFunc('wareId_wareName')" name="wareId.wareName" id="adv_ec_MESBasic_storeSet_storeSet_pubStoreRef_queryForm_wareId_wareName" displayFieldName="wareName" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/wareMan/ware/wareRef.action"   refViewCode="MESBasic_1_wareMan_wareRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_storeSet_storeSet_pubStoreRef_adv_queryForm"   />
								
                                	
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
			viewCode: 'MESBasic_1_storeSet_pubStoreRef',
			modelCode: 'MESBasic_1_storeSet_StoreSet',
			modelName: 'StoreSet',
			formId: 'ec_MESBasic_storeSet_storeSet_pubStoreRef_queryForm',
			olddiv: 'MESBasic.storeSet.storeSet.pubStoreRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.storeSet.storeSet.pubStoreRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_storeSet_pubStoreRef'+"&entity.code="+'MESBasic_1_storeSet';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.storeSet.storeSet.pubStoreRef.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.storeSet.storeSet.pubStoreRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.storeSet.storeSet.pubStoreRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_storeSet_pubStoreRef'+"&entity.code="+'MESBasic_1_storeSet';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.storeSet.storeSet.pubStoreRef.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.storeSet.storeSet.pubStoreRef.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.storeSet.storeSet.pubStoreRef.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.storeSet.storeSet.pubStoreRef.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.storeSet.storeSet.pubStoreRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.storeSet.storeSet.pubStoreRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.storeSet.storeSet.pubStoreRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.storeSet.storeSet.pubStoreRef.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.storeSet.storeSet.pubStoreRef.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.storeSet.storeSet.pubStoreRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.storeSet.storeSet.pubStoreRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.storeSet.storeSet.pubStoreRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.storeSet.storeSet.pubStoreRef.query('query')">
<#assign datatable_dataUrl = "/MESBasic/storeSet/storeSet/pubStoreRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_MESBasic_storeSet_storeSet_pubStoreRef_query" renderOverEvent="ec_MESBasic_storeSet_storeSet_pubStoreRef_RenderOverEvent" pageInitMethod="ec_MESBasic_storeSet_storeSet_pubStoreRef_PageInitMethod" modelCode="MESBasic_1_storeSet_StoreSet" noPermissionKeys="wareId.wareCode,wareId.wareName,placeSetCode,placeSetName,createStaff.name,inPriority,outPriority" hidekeyPrefix="ec_MESBasic_storeSet_storeSet_pubStoreRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_storeSet_storeSet_pubStoreRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="MESBasic.storeSet.storeSet.pubStoreRef.sendBackpubStoreRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','wareId.id','createStaff.id','placeSetCode','placeSetName']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="MESBasic.storeSet.storeSet.pubStoreRef.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign wareId_wareCode_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_CODE"    showFormat="TEXT" defaultDisplay="${wareId_wareCode_displayDefaultType!}"  key="wareId.wareCode"   label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" textalign="left"  width=70   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign wareId_wareName_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_NAME"    showFormat="TEXT" defaultDisplay="${wareId_wareName_displayDefaultType!}"  key="wareId.wareName"   label="${getText('MESBasic.propertydisplayName.randon1484031316281')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign placeSetCode_displayDefaultType  = ''>
			<@datacolumn columnName="PLACE_SET_CODE"    showFormat="TEXT" defaultDisplay="${placeSetCode_displayDefaultType!}"  key="placeSetCode"   label="${getText('MESBasic.propertydisplayName.randon1489731651449')}" textalign="left"  width=120   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign placeSetName_displayDefaultType  = ''>
			<@datacolumn columnName="PLACE_SET_NAME"    showFormat="TEXT" defaultDisplay="${placeSetName_displayDefaultType!}"  key="placeSetName"   label="${getText('MESBasic.propertydisplayName.randon148973167716212131')}" textalign="left"  width=150   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign createStaff_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${createStaff_name_displayDefaultType!}"  key="createStaff.name"   label="${getText('foundation.staff.dimissionStaff_xls.staffName')}" textalign="left"  width=80   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign inPriority_displayDefaultType  = ''>
			<@datacolumn columnName="IN_PRIORITY"    showFormat="TEXT" defaultDisplay="${inPriority_displayDefaultType!}"  key="inPriority"   label="${getText('MESBasic.propertydisplayName.randon1489731415748')}" textalign="left"  width=100   type="integer"    showFormatFunc="" cssstyle="" />
			<#assign outPriority_displayDefaultType  = ''>
			<@datacolumn columnName="OUT_PRIORITY"    showFormat="TEXT" defaultDisplay="${outPriority_displayDefaultType!}"  key="outPriority"   label="${getText('MESBasic.propertydisplayName.randon1489731582219')}" textalign="left"  width=100   type="integer"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_storeSet_storeSet_pubStoreRef_RenderOverEvent(){
}
function ec_MESBasic_storeSet_storeSet_pubStoreRef_PageInitMethod(){
}
	
	
	
	
	
	
	
</script>