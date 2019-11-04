	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1489976457717')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_queryForm" exportUrl="/WOM/prepareMaterial/prepareMaterial/prepareMaterialList-pending.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="createDepartment" bak_value="createDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="createPosition" bak_value="createPosition"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1489976508917')}_${getText('WOM.viewtitle.randon1489977705571')}.xls" />
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
		<div id="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_prepareMaterial_prepareMaterialList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_prepareMaterial_prepareMaterialList" formId="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_queryForm" dataTableId="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_queryForm" isExpandAll=true formId="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_queryForm" idprefix="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList" expandType="all"  fieldcodes="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_tableNo_tableNo:ec.common.tableNo||MESBasic_1_wareMan_Ware_wareName_wareID_wareName:WOM.propertydisplayName.randon1484031316281||base_staff_name_applyStaff_name:WOM.propertydisplayName.randon1492392014124||WOM_7.5.0.0_prepareMaterial_PrepareMaterial_applyDate_applyDate:WOM.propertydisplayName.randon1492392059136" > 
							<#assign tableNo_defaultValue  = ''>
									<#assign tableNo_defaultValue  = ''>
							<@queryfield formId="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_queryForm" code="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_tableNo" showFormat="TEXT" defaultValue=tableNo_defaultValue  divCode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_tableNo_tableNo" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="tableNo" id="tableNo" value="${tableNo_defaultValue!}" deValue="${tableNo_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign wareID_wareName_defaultValue  = ''>
									<#assign wareID_wareName_defaultValue  = ''>
							<@queryfield formId="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_queryForm" code="MESBasic_1_wareMan_Ware_wareName" showFormat="SELECTCOMP" defaultValue=wareID_wareName_defaultValue  divCode="MESBasic_1_wareMan_Ware_wareName_wareID_wareName" isCustomize=true style="" > 
										<input type="hidden" id="wareID.id" name="wareID.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${wareID_wareName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  conditionfunc="WOM.prepareMaterial.prepareMaterial.prepareMaterialList._querycustomFunc('wareID_wareName')" name="wareID.wareName" id="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_queryForm_wareID_wareName" displayFieldName="wareName" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/wareMan/ware/wareRef.action"   refViewCode="MESBasic_1_wareMan_wareRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_queryForm" searchClick="WOM.prepareMaterial.prepareMaterial.prepareMaterialList.commonQuery('query')"   />
							</@queryfield>
							<#assign applyStaff_name_defaultValue  = ''>
									<#assign applyStaff_name_defaultValue  = ''>
							<@queryfield formId="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_queryForm" code="base_staff_name" showFormat="SELECTCOMP" defaultValue=applyStaff_name_defaultValue  divCode="base_staff_name_applyStaff_name" isCustomize=true style="" > 
										<input type="hidden" id="applyStaff.id" name="applyStaff.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${applyStaff_name_defaultValue!}" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.prepareMaterial.prepareMaterial.prepareMaterialList._querycustomFunc('applyStaff_name')" name="applyStaff.name" id="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_queryForm_applyStaff_name" displayFieldName="name" type="Staff" exp="like" classStyle="cui-noborder-input" url="/foundation/staff/common/staffListFrameset.action"   refViewCode="sysbase_1.0_staff_ref"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_queryForm" searchClick="WOM.prepareMaterial.prepareMaterial.prepareMaterialList.commonQuery('query')"   />
							</@queryfield>
							<#assign applyDate_defaultValue  = ''>
									<#assign applyDate_defaultValue  = ''>
								<#if (applyDate_defaultValue)?? &&(applyDate_defaultValue)?has_content>
									<#assign applyDate_defaultValue  = getDefaultDateTime(applyDate_defaultValue!)?datetime>
								</#if>
							<@queryfield formId="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_queryForm" code="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_applyDate" showFormat="YMD_HMS" defaultValue=applyDate_defaultValue  divCode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_applyDate_applyDate" isCustomize=true style="" > 
								<div>
							  	 	<div style="float:left;width:45%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="applyDate_start" id="applyDate_start" exp="gequal"   formid="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_queryForm" />
									</div>
									<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
							  	 	<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="applyDate_end" id="applyDate_end" exp="lequal"   formid="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_queryForm" />
							  		</div>
						  		</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_queryForm" type="adv" onclick="WOM.prepareMaterial.prepareMaterial.prepareMaterialList.commonQuery('query')" onadvancedclick="advQuery('WOM.prepareMaterial.prepareMaterial.prepareMaterialList.advquery')" /> 
						       							       	<@querybutton formId="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_queryForm" type="pending" onclick="WOM.prepareMaterial.prepareMaterial.prepareMaterialList.commonQuery('pending')" />
						 		<@querybutton formId="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_quickquery_info={};
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_quickquery_info["MainTableName"]="WOM_PREPARE_MATERIALS";
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_quickquery_info["tableNo"]={};
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_quickquery_info["tableNo"].dbColumnType="TEXT";
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_quickquery_info["tableNo"].layRec="tableNo";
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_quickquery_info["tableNo"].columnName="TABLE_NO";
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_quickquery_info["wareID.wareName"]={};
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_quickquery_info["wareID.wareName"].dbColumnType="TEXT";
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_quickquery_info["wareID.wareName"].layRec="MATERIAL_WARES,ID,WOM_PREPARE_MATERIALS,WAREID-wareName";
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_quickquery_info["wareID.wareName"].columnName="WARE_NAME";
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_quickquery_info["wareID.id"]={};
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_quickquery_info["wareID.id"].dbColumnType="LONG";
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_quickquery_info["wareID.id"].layRec="MATERIAL_WARES,ID,WOM_PREPARE_MATERIALS,WAREID-wareName";
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_quickquery_info["wareID.id"].columnName="ID";
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_quickquery_info["applyStaff.name"]={};
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_quickquery_info["applyStaff.name"].dbColumnType="TEXT";
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_quickquery_info["applyStaff.name"].layRec="base_staff,ID,WOM_PREPARE_MATERIALS,APPLY_STAFF-name";
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_quickquery_info["applyStaff.name"].columnName="NAME";
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_quickquery_info["applyStaff.id"]={};
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_quickquery_info["applyStaff.id"].dbColumnType="LONG";
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_quickquery_info["applyStaff.id"].layRec="base_staff,ID,WOM_PREPARE_MATERIALS,APPLY_STAFF-name";
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_quickquery_info["applyStaff.id"].columnName="ID";
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_quickquery_info["applyDate"]={};
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_quickquery_info["applyDate"].dbColumnType="DATETIME";
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_quickquery_info["applyDate"].layRec="applyDate";
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_quickquery_info["applyDate"].columnName="APPLY_DATE";
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
 	var advRemainDialog = $('[id="WOM.prepareMaterial.prepareMaterial.prepareMaterialList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.prepareMaterial.prepareMaterial.prepareMaterialList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_adv_queryForm" exportUrl="/WOM/prepareMaterial/prepareMaterial/prepareMaterialList-pending.action">
							<#assign tableNo_defaultValue  = ''>
									<#assign tableNo_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_adv_queryForm" code="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_tableNo" showFormat="TEXT" defaultValue=tableNo_defaultValue  divCode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_tableNo_tableNo" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial" layRec="tableNo" columnname="TABLE_NO" columntype="TEXT" name="tableNo" fieldType="TEXTFIELD" tableName="WOM_PREPARE_MATERIALS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										单据编号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="tableNo" id="adv_tableNo" value="${tableNo_defaultValue!}" deValue="${tableNo_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign wareID_wareName_defaultValue  = ''>
									<#assign wareID_wareName_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_adv_queryForm" code="MESBasic_1_wareMan_Ware_wareName" showFormat="SELECTCOMP" defaultValue=wareID_wareName_defaultValue  divCode="MESBasic_1_wareMan_Ware_wareName_wareID_wareName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_wareMan_Ware" layRec="MATERIAL_WARES,ID,WOM_PREPARE_MATERIALS,WAREID-wareName" columnname="WARE_NAME" columntype="TEXT" name="wareID.wareName" fieldType="SELECTCOMP" tableName="MATERIAL_WARES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										仓库
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_wareMan_Ware" />
										<input type="hidden" id="adv_wareID.id" name="wareID.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_wareID.id"  isPrecise=true deValue="${wareID_wareName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  conditionfunc="WOM.prepareMaterial.prepareMaterial.prepareMaterialList._querycustomFunc('wareID_wareName')" name="wareID.wareName" id="adv_ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_queryForm_wareID_wareName" displayFieldName="wareName" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/wareMan/ware/wareRef.action"   refViewCode="MESBasic_1_wareMan_wareRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_adv_queryForm"   />
								
                                	
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
			viewCode: 'WOM_7.5.0.0_prepareMaterial_prepareMaterialList',
			modelCode: 'WOM_7.5.0.0_prepareMaterial_PrepareMaterial',
			modelName: 'PrepareMaterial',
			formId: 'ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_queryForm',
			olddiv: 'WOM.prepareMaterial.prepareMaterial.prepareMaterialList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.prepareMaterial.prepareMaterial.prepareMaterialList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_prepareMaterial_prepareMaterialList'+"&entity.code="+'WOM_7.5.0.0_prepareMaterial';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.prepareMaterial.prepareMaterial.prepareMaterialList.advquery'] #customquContent").html(html);
		 	$("[id='WOM.prepareMaterial.prepareMaterial.prepareMaterialList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.prepareMaterial.prepareMaterial.prepareMaterialList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_prepareMaterial_prepareMaterialList'+"&entity.code="+'WOM_7.5.0.0_prepareMaterial';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.prepareMaterial.prepareMaterial.prepareMaterialList.advquery'] #customquContent").html(html);
			 $("[id='WOM.prepareMaterial.prepareMaterial.prepareMaterialList.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.prepareMaterial.prepareMaterial.prepareMaterialList.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.prepareMaterial.prepareMaterial.prepareMaterialList.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.prepareMaterial.prepareMaterial.prepareMaterialList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.prepareMaterial.prepareMaterial.prepareMaterialList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.prepareMaterial.prepareMaterial.prepareMaterialList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.prepareMaterial.prepareMaterial.prepareMaterialList.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.prepareMaterial.prepareMaterial.prepareMaterialList.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.prepareMaterial.prepareMaterial.prepareMaterialList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.prepareMaterial.prepareMaterial.prepareMaterialList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.prepareMaterial.prepareMaterial.prepareMaterialList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.prepareMaterial.prepareMaterial.prepareMaterialList.query('goList')">
<#assign datatable_dataUrl = "/WOM/prepareMaterial/prepareMaterial/prepareMaterialList-pending.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.prepareMaterial.prepareMaterial.prepareMaterialList.query('query')">
<#assign datatable_dataUrl = "/WOM/prepareMaterial/prepareMaterial/prepareMaterialList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_query" renderOverEvent="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_RenderOverEvent" pageInitMethod="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_PageInitMethod" modelCode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial" noPermissionKeys="tableNo,applyStaff.name,applyDate,wareID.wareCode,wareID.wareName,remark" hidekeyPrefix="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="WOM.prepareMaterial.prepareMaterial.prepareMaterialList.rowDblClick" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','pending.id','pending.deploymentId','pending.activityName','pending.bulkDealFlag','pending.processDescription','pending.processKey','pending.processVersion','pending.activityType','pending.processId','pending.openUrl','pending.userId','tableInfoId','status','applyStaff.id','wareID.id']" postData="&pending-beginDate=${pendingBeginDate!''}&pending-endDate=${pendingEndDate!''}&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="WOM.prepareMaterial.prepareMaterial.prepareMaterialList.showErrorMsg"   >
		<#if isContainsWorkflow('WOM_7.5.0.0_prepareMaterial_prepareMaterialList')==true>
			<@operatebar operateType="FLOW" menuCode="${workFlowMenuCode!}" entityCode="WOM_7.5.0.0_prepareMaterial" businessParam="${businessParam!}" resultType="JSON" >
			</@operatebar>
		</#if>
		<#if flowBulkFlag?? && flowBulkFlag==true>
			<@operatebar operateType="noPower" menuCode="approval" operates="
			code:${buttonPerfix!}WOM_7.5.0.0_prepareMaterial_approval||name:${getText('ec.list.batchApproval')}||iconcls:modify||useInMore:false||onclick:
				WOM.prepareMaterial.prepareMaterial.prepareMaterialList.approval()
    			"  resultType="json"></@operatebar>
    	</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}prepareMaterialList_mod_modify_WOM_7.5.0.0_prepareMaterial_prepareMaterialList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.randon1564041638879.flag')}||iconcls:modify||useInMore:false||onclick:
				WOM.prepareMaterial.prepareMaterial.prepareMaterialList.modifyprepareMaterialList()
		" 
		resultType="json" 
		buttonCode="WOM_7.5.0.0_prepareMaterial_prepareMaterialList_BUTTON_mod"
		buttonType="MODIFY" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}prepareMaterialList_mod_modify_WOM_7.5.0.0_prepareMaterial_prepareMaterialList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.randon1564041638879.flag')}||iconcls:modify||useInMore:false||onclick:
				WOM.prepareMaterial.prepareMaterial.prepareMaterialList.modifyprepareMaterialList()
		" 
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${tableNo_displayDefaultType!}"  key="tableNo"   label="${getText('ec.common.tableNo')}" textalign="left"  width=200   type="textfield"  click="function(cell){WOM.prepareMaterial.prepareMaterial.prepareMaterialList.rowDblClick(null,cell);}"   showFormatFunc="" cssstyle="" />
			<#assign applyStaff_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${applyStaff_name_displayDefaultType!}"  key="applyStaff.name"   label="${getText('WOM.propertydisplayName.randon1492392014124')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign applyDate_displayDefaultType  = ''>
			<@datacolumn columnName="APPLY_DATE"    showFormat="YMD_HMS" defaultDisplay="${applyDate_displayDefaultType!}"  key="applyDate"   label="${getText('WOM.propertydisplayName.randon1492392059136')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign wareID_wareCode_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_CODE"    showFormat="TEXT" defaultDisplay="${wareID_wareCode_displayDefaultType!}"  key="wareID.wareCode"   label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" textalign="left"  width=120   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign wareID_wareName_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_NAME"    showFormat="TEXT" defaultDisplay="${wareID_wareName_displayDefaultType!}"  key="wareID.wareName"   label="${getText('MESBasic.propertydisplayName.randon1484031316281')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign remark_displayDefaultType  = ''>
			<@datacolumn columnName="REMARK"    showFormat="TEXT" defaultDisplay="${remark_displayDefaultType!}"  key="remark"   label="${getText('WOM.propertydisplayName.randon1489976758306')}" textalign="left"  width=200   type="textfield"    showFormatFunc="" cssstyle="" />
		<@datacolumn key="pending.taskDescription" sortable=false label="${getText('ec.list.taskDescription')}"  width=120/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_RenderOverEvent(){
}
function ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialList_PageInitMethod(){
}
	
	
	
	
	
	
</script>