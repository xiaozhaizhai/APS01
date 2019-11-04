	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1415336450425')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_routine_routine_routineTankRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_routine_routine_routineTankRef_queryForm" exportUrl="/MESBasic/routine/routine/routineTankRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" name="MESBasic_routine_routine_routineTankRef_condition" id="MESBasic_routine_routine_routineTankRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1415336555124')}_${getText('MESBasic.viewtitle.randon1551747489828')}.xls" />
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
		<div id="ec_MESBasic_routine_routine_routineTankRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_routine_routine_routineTankRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_routine_routineTankRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_routine_routineTankRef" formId="ec_MESBasic_routine_routine_routineTankRef_queryForm" dataTableId="ec_MESBasic_routine_routine_routineTankRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_routine_routine_routineTankRef_queryForm" isExpandAll=true formId="ec_MESBasic_routine_routine_routineTankRef_queryForm" idprefix="ec_MESBasic_routine_routine_routineTankRef" expandType="all"  fieldcodes="MESBasic_1_routine_Routine_code_code:MESBasic.propertydisplayName.radion1415336575756||MESBasic_1_routine_Routine_name_name:MESBasic.propertydisplayName.radion1415336597801||MESBasic_1_routine_Routine_businessType_businessType:MESBasic.propertydisplayName.radion1415337186132||MESBasic_1_routine_Routine_rootineUse_rootineUse:MESBasic.propertydisplayName.randon1423898703640||MESBasic_1_container_Container_name_srcContainer_name:MESBasic.propertydisplayName.radion8415268393452||MESBasic_1_container_Container_name_desContainer_name:MESBasic.propertydisplayName.radion7415268393452" > 
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_routine_routine_routineTankRef_queryForm" code="MESBasic_1_routine_Routine_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="MESBasic_1_routine_Routine_code_code" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="code" id="code" value="${code_defaultValue!}" deValue="${code_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_routine_routine_routineTankRef_queryForm" code="MESBasic_1_routine_Routine_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="MESBasic_1_routine_Routine_name_name" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign businessType_defaultValue  = ''>
									<#assign businessType_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_routine_routine_routineTankRef_queryForm" code="MESBasic_1_routine_Routine_businessType" showFormat="SELECTCOMP" defaultValue=businessType_defaultValue  divCode="MESBasic_1_routine_Routine_businessType_businessType" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${businessType_defaultValue}"   name="businessType" code="ROUTINE_BUSINESS" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<#assign rootineUse_defaultValue  = ''>
									<#assign rootineUse_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_routine_routine_routineTankRef_queryForm" code="MESBasic_1_routine_Routine_rootineUse" showFormat="SELECTCOMP" defaultValue=rootineUse_defaultValue  divCode="MESBasic_1_routine_Routine_rootineUse_rootineUse" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${rootineUse_defaultValue}"   name="rootineUse" code="rootStatus" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<#assign srcContainer_name_defaultValue  = ''>
									<#assign srcContainer_name_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_routine_routine_routineTankRef_queryForm" code="MESBasic_1_container_Container_name" showFormat="SELECTCOMP" defaultValue=srcContainer_name_defaultValue  divCode="MESBasic_1_container_Container_name_srcContainer_name" isCustomize=true style="" > 
										<input type="hidden" id="srcContainer.id" name="srcContainer.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${srcContainer_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1418789997648')}"  conditionfunc="MESBasic.routine.routine.routineTankRef._querycustomFunc('srcContainer_name')" name="srcContainer.name" id="ec_MESBasic_routine_routine_routineTankRef_queryForm_srcContainer_name" displayFieldName="name" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/container/container/containerListAVRef.action"   refViewCode="MESBasic_1_container_containerListAVRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_routine_routine_routineTankRef_queryForm" searchClick="MESBasic.routine.routine.routineTankRef.commonQuery('query')"   />
							</@queryfield>
							<#assign desContainer_name_defaultValue  = ''>
									<#assign desContainer_name_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_routine_routine_routineTankRef_queryForm" code="MESBasic_1_container_Container_name" showFormat="SELECTCOMP" defaultValue=desContainer_name_defaultValue  divCode="MESBasic_1_container_Container_name_desContainer_name" isCustomize=true style="" > 
										<input type="hidden" id="desContainer.id" name="desContainer.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${desContainer_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1418789997648')}"  conditionfunc="MESBasic.routine.routine.routineTankRef._querycustomFunc('desContainer_name')" name="desContainer.name" id="ec_MESBasic_routine_routine_routineTankRef_queryForm_desContainer_name" displayFieldName="name" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/container/container/containerListAVRef.action"   refViewCode="MESBasic_1_container_containerListAVRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_routine_routine_routineTankRef_queryForm" searchClick="MESBasic.routine.routine.routineTankRef.commonQuery('query')"   />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_routine_routine_routineTankRef_queryForm" type="adv" onclick="MESBasic.routine.routine.routineTankRef.commonQuery('query')" onadvancedclick="advQuery('MESBasic.routine.routine.routineTankRef.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_routine_routine_routineTankRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_routine_routine_routineTankRef_quickquery_info={};
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["MainTableName"]="MESBASIC_ROUTINES";
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["code"]={};
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["code"].dbColumnType="TEXT";
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["code"].layRec="code";
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["code"].columnName="CODE";
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["name"]={};
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["name"].dbColumnType="TEXT";
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["name"].layRec="name";
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["name"].columnName="NAME";
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["businessType"]={};
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["businessType"].dbColumnType="SYSTEMCODE";
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["businessType"].layRec="businessType";
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["businessType"].columnName="BUSINESS_TYPE";
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["rootineUse"]={};
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["rootineUse"].dbColumnType="SYSTEMCODE";
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["rootineUse"].layRec="rootineUse";
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["rootineUse"].columnName="ROOTINE_USE";
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["srcContainer.name"]={};
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["srcContainer.name"].dbColumnType="TEXT";
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["srcContainer.name"].layRec="MESBASIC_CONTAINERS,ID,MESBASIC_ROUTINES,SRC_CONTAINER-name";
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["srcContainer.name"].columnName="NAME";
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["srcContainer.id"]={};
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["srcContainer.id"].dbColumnType="LONG";
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["srcContainer.id"].layRec="MESBASIC_CONTAINERS,ID,MESBASIC_ROUTINES,SRC_CONTAINER-name";
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["srcContainer.id"].columnName="ID";
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["desContainer.name"]={};
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["desContainer.name"].dbColumnType="TEXT";
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["desContainer.name"].layRec="MESBASIC_CONTAINERS,ID,MESBASIC_ROUTINES,DES_CONTAINER-name";
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["desContainer.name"].columnName="NAME";
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["desContainer.id"]={};
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["desContainer.id"].dbColumnType="LONG";
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["desContainer.id"].layRec="MESBASIC_CONTAINERS,ID,MESBASIC_ROUTINES,DES_CONTAINER-name";
ec_MESBasic_routine_routine_routineTankRef_quickquery_info["desContainer.id"].columnName="ID";
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
 	var advRemainDialog = $('[id="MESBasic.routine.routine.routineTankRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.routine.routine.routineTankRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_routine_routine_routineTankRef_adv_queryForm" exportUrl="/MESBasic/routine/routine/routineTankRef-query.action">
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_routine_routine_routineTankRef_adv_queryForm" code="MESBasic_1_routine_Routine_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="MESBasic_1_routine_Routine_code_code" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_routine_Routine" layRec="code" columnname="CODE" columntype="TEXT" name="code" fieldType="TEXTFIELD" tableName="MESBASIC_ROUTINES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										路径编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_routine_Routine" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="code" id="adv_code" value="${code_defaultValue!}" deValue="${code_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_routine_routine_routineTankRef_adv_queryForm" code="MESBasic_1_routine_Routine_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="MESBasic_1_routine_Routine_name_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_routine_Routine" layRec="name" columnname="NAME" columntype="TEXT" name="name" fieldType="TEXTFIELD" tableName="MESBASIC_ROUTINES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										路径名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_routine_Routine" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="adv_name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign businessType_defaultValue  = ''>
									<#assign businessType_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_routine_routine_routineTankRef_adv_queryForm" code="MESBasic_1_routine_Routine_businessType" showFormat="SELECTCOMP" defaultValue=businessType_defaultValue  divCode="MESBasic_1_routine_Routine_businessType_businessType" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_routine_Routine" layRec="businessType" columnname="BUSINESS_TYPE" columntype="SYSTEMCODE" name="businessType" fieldType="SELECTCOMP" tableName="MESBASIC_ROUTINES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										业务类型
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_routine_Routine" />
										<@systemcode  advquery=true onchange="" ecFlag=true deValue="${businessType_defaultValue}"   name="businessType" code="ROUTINE_BUSINESS" classStyle="cui-noborder-input" value="" />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign rootineUse_defaultValue  = ''>
									<#assign rootineUse_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_routine_routine_routineTankRef_adv_queryForm" code="MESBasic_1_routine_Routine_rootineUse" showFormat="SELECTCOMP" defaultValue=rootineUse_defaultValue  divCode="MESBasic_1_routine_Routine_rootineUse_rootineUse" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_routine_Routine" layRec="rootineUse" columnname="ROOTINE_USE" columntype="SYSTEMCODE" name="rootineUse" fieldType="SELECTCOMP" tableName="MESBASIC_ROUTINES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										路径状态
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_routine_Routine" />
										<@systemcode  advquery=true onchange="" ecFlag=true deValue="${rootineUse_defaultValue}"   name="rootineUse" code="rootStatus" classStyle="cui-noborder-input" value="" />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign srcContainer_name_defaultValue  = ''>
									<#assign srcContainer_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_routine_routine_routineTankRef_adv_queryForm" code="MESBasic_1_container_Container_name" showFormat="SELECTCOMP" defaultValue=srcContainer_name_defaultValue  divCode="MESBasic_1_container_Container_name_srcContainer_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_container_Container" layRec="MESBASIC_CONTAINERS,ID,MESBASIC_ROUTINES,SRC_CONTAINER-name" columnname="NAME" columntype="TEXT" name="srcContainer.name" fieldType="SELECTCOMP" tableName="MESBASIC_CONTAINERS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										源容器
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_container_Container" />
										<input type="hidden" id="adv_srcContainer.id" name="srcContainer.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_srcContainer.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${srcContainer_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1418789997648')}"  conditionfunc="MESBasic.routine.routine.routineTankRef._querycustomFunc('srcContainer_name')" name="srcContainer.name" id="adv_ec_MESBasic_routine_routine_routineTankRef_queryForm_srcContainer_name" displayFieldName="name" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/container/container/containerListAVRef.action"   refViewCode="MESBasic_1_container_containerListAVRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_routine_routine_routineTankRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign desContainer_name_defaultValue  = ''>
									<#assign desContainer_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_routine_routine_routineTankRef_adv_queryForm" code="MESBasic_1_container_Container_name" showFormat="SELECTCOMP" defaultValue=desContainer_name_defaultValue  divCode="MESBasic_1_container_Container_name_desContainer_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_container_Container" layRec="MESBASIC_CONTAINERS,ID,MESBASIC_ROUTINES,DES_CONTAINER-name" columnname="NAME" columntype="TEXT" name="desContainer.name" fieldType="SELECTCOMP" tableName="MESBASIC_CONTAINERS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										目的容器
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_container_Container" />
										<input type="hidden" id="adv_desContainer.id" name="desContainer.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_desContainer.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${desContainer_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1418789997648')}"  conditionfunc="MESBasic.routine.routine.routineTankRef._querycustomFunc('desContainer_name')" name="desContainer.name" id="adv_ec_MESBasic_routine_routine_routineTankRef_queryForm_desContainer_name" displayFieldName="name" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/container/container/containerListAVRef.action"   refViewCode="MESBasic_1_container_containerListAVRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_routine_routine_routineTankRef_adv_queryForm"   />
								
                                	
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
			viewCode: 'MESBasic_1_routine_routineTankRef',
			modelCode: 'MESBasic_1_routine_Routine',
			modelName: 'Routine',
			formId: 'ec_MESBasic_routine_routine_routineTankRef_queryForm',
			olddiv: 'MESBasic.routine.routine.routineTankRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.routine.routine.routineTankRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_routine_routineTankRef'+"&entity.code="+'MESBasic_1_routine';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.routine.routine.routineTankRef.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.routine.routine.routineTankRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.routine.routine.routineTankRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_routine_routineTankRef'+"&entity.code="+'MESBasic_1_routine';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.routine.routine.routineTankRef.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.routine.routine.routineTankRef.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.routine.routine.routineTankRef.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.routine.routine.routineTankRef.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.routine.routine.routineTankRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.routine.routine.routineTankRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.routine.routine.routineTankRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.routine.routine.routineTankRef.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.routine.routine.routineTankRef.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.routine.routine.routineTankRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.routine.routine.routineTankRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.routine.routine.routineTankRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.routine.routine.routineTankRef.query('query')">
<#assign datatable_dataUrl = "/MESBasic/routine/routine/routineTankRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_MESBasic_routine_routine_routineTankRef_query" renderOverEvent="ec_MESBasic_routine_routine_routineTankRef_RenderOverEvent" pageInitMethod="ec_MESBasic_routine_routine_routineTankRef_PageInitMethod" modelCode="MESBasic_1_routine_Routine" noPermissionKeys="code,name,routineStatus,rootineUse,srcContainer.name,sourceType,desContainer.name,desType,routineStrategy,product.productName,density,srouce,destination" hidekeyPrefix="ec_MESBasic_routine_routine_routineTankRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_routine_routine_routineTankRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="MESBasic.routine.routine.routineTankRef.sendBackroutineTankRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','routineStatus.id','rootineUse.id','sourceType.id','desType.id','routineStrategy.id','businessType.id','srcContainer.id','desContainer.id','product.id','code','name']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="MESBasic.routine.routine.routineTankRef.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}routineTankRef_routineNew_add_MESBasic_1_routine_routineTankRef||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1423730541699')}||iconcls:add||useInMore:false||onclick:
				MESBasic.routine.routine.routineTankRef.addroutineTankRef()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_routine_routineTankRef_BUTTON_routineNew"
		buttonType="ADD" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}routineTankRef_routineNew_add_MESBasic_1_routine_routineTankRef||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1423730541699')}||iconcls:add||useInMore:false||onclick:
				MESBasic.routine.routine.routineTankRef.addroutineTankRef()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}routineTankRef_routineEdit_modify_MESBasic_1_routine_routineTankRef||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1423705335643')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.routine.routine.routineTankRef.modifyroutineTankRef()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_routine_routineTankRef_BUTTON_routineEdit"
		buttonType="MODIFY" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}routineTankRef_routineEdit_modify_MESBasic_1_routine_routineTankRef||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1423705335643')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.routine.routine.routineTankRef.modifyroutineTankRef()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}routineTankRef_routineDel_del_MESBasic_1_routine_routineTankRef||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1415339022331')}||iconcls:del||useInMore:false||onclick:
				MESBasic.routine.routine.routineTankRef.delroutineTankRef()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_routine_routineTankRef_BUTTON_routineDel"
		buttonType="DELETE" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}routineTankRef_routineDel_del_MESBasic_1_routine_routineTankRef||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1415339022331')}||iconcls:del||useInMore:false||onclick:
				MESBasic.routine.routine.routineTankRef.delroutineTankRef()
		" 
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('MESBasic.propertydisplayName.radion1415336575756')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('MESBasic.propertydisplayName.radion1415336597801')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign routineStatus_displayDefaultType  = ''>
			<@datacolumn columnName="ROUTINE_STATUS"    showFormat="SELECTCOMP" defaultDisplay="${routineStatus_displayDefaultType!}"  key="routineStatus.value"   label="${getText('MESBasic.propertydisplayName.radion1415337256452')}" textalign="center"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign rootineUse_displayDefaultType  = ''>
			<@datacolumn columnName="ROOTINE_USE"    showFormat="SELECTCOMP" defaultDisplay="${rootineUse_displayDefaultType!}"  key="rootineUse.value"   label="${getText('MESBasic.propertydisplayName.randon1423898703640')}" textalign="center"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign srcContainer_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${srcContainer_name_displayDefaultType!}"  key="srcContainer.name"   label="${getText('MESBasic.propertydisplayName.radion8415268393452')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign sourceType_displayDefaultType  = ''>
			<@datacolumn columnName="SOURCE_TYPE"    showFormat="SELECTCOMP" defaultDisplay="${sourceType_displayDefaultType!}"  key="sourceType.value"   label="${getText('MESBasic.propertydisplayName.radion1415337129694')}" textalign="left"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign desContainer_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${desContainer_name_displayDefaultType!}"  key="desContainer.name"   label="${getText('MESBasic.propertydisplayName.radion7415268393452')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign desType_displayDefaultType  = ''>
			<@datacolumn columnName="DES_TYPE"    showFormat="SELECTCOMP" defaultDisplay="${desType_displayDefaultType!}"  key="desType.value"   label="${getText('MESBasic.propertydisplayName.radion1415337160653')}" textalign="left"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign routineStrategy_displayDefaultType  = ''>
			<@datacolumn columnName="ROUTINE_STRATEGY"    showFormat="SELECTCOMP" defaultDisplay="${routineStrategy_displayDefaultType!}"  key="routineStrategy.value"   label="${getText('MESBasic.propertydisplayName.radion1415337689809')}" textalign="center"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign product_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${product_productName_displayDefaultType!}"  key="product.productName"  hiddenCol=true label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="left"  width=120   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign density_displayDefaultType  = ''>
			<@datacolumn columnName="DENSITY"    showFormat="TEXT" defaultDisplay="${density_displayDefaultType!}"  key="density"  hiddenCol=true label="${getText('MESBasic.propertydisplayName.randon1423898372445')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign srouce_displayDefaultType  = ''>
			<@datacolumn columnName="SROUCE"    showFormat="TEXT" defaultDisplay="${srouce_displayDefaultType!}"  key="srouce"  hiddenCol=true label="${getText('MESBasic.propertydisplayName.radion1415336723895')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign destination_displayDefaultType  = ''>
			<@datacolumn columnName="DESTINATION"    showFormat="TEXT" defaultDisplay="${destination_displayDefaultType!}"  key="destination"  hiddenCol=true label="${getText('MESBasic.propertydisplayName.radion1415336862554')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_routine_routine_routineTankRef_RenderOverEvent(){
}
function ec_MESBasic_routine_routine_routineTankRef_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>