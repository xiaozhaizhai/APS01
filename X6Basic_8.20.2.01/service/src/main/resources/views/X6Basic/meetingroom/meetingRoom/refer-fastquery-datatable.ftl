	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('X6Basic.entityname.radion1366792465295')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_X6Basic_meetingroom_meetingRoom_refer_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" exportUrl="/X6Basic/meetingroom/meetingRoom/refer-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" name="X6Basic_meetingroom_meetingRoom_refer_condition" id="X6Basic_meetingroom_meetingRoom_refer_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('X6Basic.modelname.radion1366792543468')}_${getText('X6Basic.viewtitle.radion1367733480893')}.xls" />
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
		<#assign advFlag = getAdvClassific('X6Basic_1.0_meetingroom_refer')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="X6Basic_1.0_meetingroom_refer" formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" dataTableId="ec_X6Basic_meetingroom_meetingRoom_refer_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_X6Basic_meetingroom_meetingRoom_refer_queryForm"  formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" idprefix="ec_X6Basic_meetingroom_meetingRoom_refer" expandType="single"  fieldcodes="X6Basic_1.0_meetingroom_MeetingRoom_name_name:X6Basic.propertydisplayName.radion1366792696971||X6Basic_1.0_meetingroom_MeetingRoom_roomSize_roomSize:X6Basic.propertydisplayName.radion1366793347089||X6Basic_1.0_meetingroom_MeetingRoom_camera_camera:X6Basic.propertydisplayName.radion1366792991306||X6Basic_1.0_meetingroom_MeetingRoom_network_network:X6Basic.propertydisplayName.radion1366792858041||X6Basic_1.0_meetingroom_MeetingRoom_whiteBoard_whiteBoard:X6Basic.propertydisplayName.radion1366793054934||X6Basic_1.0_meetingroom_MeetingRoom_projector_projector:X6Basic.propertydisplayName.radion1366793011250||X6Basic_1.0_meetingroom_MeetingRoom_audio_audio:X6Basic.propertydisplayName.radion1366792961138||X6Basic_1.0_meetingroom_MeetingRoom_useFlag_useFlag:X6Basic.propertydisplayName.radion1366793037919" > 
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<@queryfield formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="X6Basic_1.0_meetingroom_MeetingRoom_name_name" isCustomize=true style="" > 
										<#if (name_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" isCrossCompany=isCrossCompany isPrecise=true value="${name_defaultValue!}" deValue="${name_defaultValue!}"   conditionfunc="X6Basic.meetingroom.meetingRoom.refer._querycustomFunc('name')" name="name" id="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm_name" displayFieldName="name" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/X6Basic/meetingroom/meetingRoom/mneClient.action" multiple=false mnewidth=260 searchClick="X6Basic.meetingroom.meetingRoom.refer.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" isCrossCompany=isCrossCompany isPrecise=true  conditionfunc="X6Basic.meetingroom.meetingRoom.refer._querycustomFunc('name')" name="name" id="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm_name" displayFieldName="name" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/X6Basic/meetingroom/meetingRoom/mneClient.action" multiple=false mnewidth=260 searchClick="X6Basic.meetingroom.meetingRoom.refer.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign roomSize_defaultValue  = ''>
									<#assign roomSize_defaultValue  = ''>
							<@queryfield formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_roomSize" showFormat="SELECTCOMP" defaultValue=roomSize_defaultValue  divCode="X6Basic_1.0_meetingroom_MeetingRoom_roomSize_roomSize" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${roomSize_defaultValue}"   name="roomSize" code="meetingSize" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<#assign camera_defaultValue  = ''>
									<#assign camera_defaultValue  = ''>
							<@queryfield formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_camera" showFormat="SELECT" defaultValue=camera_defaultValue  divCode="X6Basic_1.0_meetingroom_MeetingRoom_camera_camera" isCustomize=true style="" > 
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${camera_defaultValue!}" name="camera" id="camera" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (camera_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (camera_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<#assign network_defaultValue  = ''>
									<#assign network_defaultValue  = ''>
							<@queryfield formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_network" showFormat="SELECT" defaultValue=network_defaultValue  divCode="X6Basic_1.0_meetingroom_MeetingRoom_network_network" isCustomize=true style="" > 
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${network_defaultValue!}" name="network" id="network" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (network_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (network_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<#assign whiteBoard_defaultValue  = ''>
									<#assign whiteBoard_defaultValue  = ''>
							<@queryfield formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_whiteBoard" showFormat="SELECT" defaultValue=whiteBoard_defaultValue  divCode="X6Basic_1.0_meetingroom_MeetingRoom_whiteBoard_whiteBoard" isCustomize=true style="" > 
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${whiteBoard_defaultValue!}" name="whiteBoard" id="whiteBoard" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (whiteBoard_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (whiteBoard_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<#assign projector_defaultValue  = ''>
									<#assign projector_defaultValue  = ''>
							<@queryfield formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_projector" showFormat="SELECT" defaultValue=projector_defaultValue  divCode="X6Basic_1.0_meetingroom_MeetingRoom_projector_projector" isCustomize=true style="" > 
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${projector_defaultValue!}" name="projector" id="projector" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (projector_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (projector_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<#assign audio_defaultValue  = ''>
									<#assign audio_defaultValue  = ''>
							<@queryfield formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_audio" showFormat="SELECT" defaultValue=audio_defaultValue  divCode="X6Basic_1.0_meetingroom_MeetingRoom_audio_audio" isCustomize=true style="" > 
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${audio_defaultValue!}" name="audio" id="audio" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (audio_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (audio_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<#assign useFlag_defaultValue  = ''>
									<#assign useFlag_defaultValue  = ''>
							<@queryfield formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_useFlag" showFormat="SELECT" defaultValue=useFlag_defaultValue  divCode="X6Basic_1.0_meetingroom_MeetingRoom_useFlag_useFlag" isCustomize=true style="" > 
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${useFlag_defaultValue!}" name="useFlag" id="useFlag" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (useFlag_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (useFlag_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" type="adv" onclick="X6Basic.meetingroom.meetingRoom.refer.commonQuery('query')" onadvancedclick="advQuery('X6Basic.meetingroom.meetingRoom.refer.advquery')" /> 
						 		<@querybutton formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info={};
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["MainTableName"]="X6BASIC_MEETING_ROOMS";
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["name"]={};
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["name"].dbColumnType="TEXT";
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["name"].layRec="name";
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["name"].columnName="NAME";
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["roomSize"]={};
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["roomSize"].dbColumnType="SYSTEMCODE";
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["roomSize"].layRec="roomSize";
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["roomSize"].columnName="ROOM_SIZE";
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["camera"]={};
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["camera"].dbColumnType="BOOLEAN";
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["camera"].layRec="camera";
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["camera"].columnName="CAMERA";
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["network"]={};
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["network"].dbColumnType="BOOLEAN";
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["network"].layRec="network";
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["network"].columnName="NETWORK";
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["whiteBoard"]={};
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["whiteBoard"].dbColumnType="BOOLEAN";
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["whiteBoard"].layRec="whiteBoard";
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["whiteBoard"].columnName="WHITE_BOARD";
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["projector"]={};
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["projector"].dbColumnType="BOOLEAN";
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["projector"].layRec="projector";
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["projector"].columnName="PROJECTOR";
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["audio"]={};
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["audio"].dbColumnType="BOOLEAN";
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["audio"].layRec="audio";
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["audio"].columnName="AUDIO";
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["useFlag"]={};
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["useFlag"].dbColumnType="BOOLEAN";
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["useFlag"].layRec="useFlag";
ec_X6Basic_meetingroom_meetingRoom_refer_quickquery_info["useFlag"].columnName="USE_FLAG";
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
 	var advRemainDialog = $('[id="X6Basic.meetingroom.meetingRoom.refer.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="X6Basic.meetingroom.meetingRoom.refer.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_X6Basic_meetingroom_meetingRoom_refer_adv_queryForm" exportUrl="/X6Basic/meetingroom/meetingRoom/refer-query.action">
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
								<@advsqueryfield formId="ec_X6Basic_meetingroom_meetingRoom_refer_adv_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="X6Basic_1.0_meetingroom_MeetingRoom_name_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="X6Basic_1.0_meetingroom_MeetingRoom" layRec="name" columnname="NAME" columntype="TEXT" name="name" fieldType="TEXTFIELD" tableName="X6BASIC_MEETING_ROOMS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										会议室名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="X6Basic_1.0_meetingroom_MeetingRoom" />
										<#if (name_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_X6Basic_meetingroom_meetingRoom_refer_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true value="${name_defaultValue!}" deValue="${name_defaultValue!}"   conditionfunc="X6Basic.meetingroom.meetingRoom.refer._querycustomFunc('name')" name="name" id="adv_ec_X6Basic_meetingroom_meetingRoom_refer_queryForm_name" displayFieldName="name" exp="like"  classStyle="cui-noborder-input"  url="/X6Basic/meetingroom/meetingRoom/mneClient.action" multiple=false mnewidth=260   currentViewCode="X6Basic_1.0_meetingroom_refer"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_X6Basic_meetingroom_meetingRoom_refer_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true  conditionfunc="X6Basic.meetingroom.meetingRoom.refer._querycustomFunc('name')" name="name" id="adv_ec_X6Basic_meetingroom_meetingRoom_refer_queryForm_name" displayFieldName="name" exp="like"  classStyle="cui-noborder-input"  url="/X6Basic/meetingroom/meetingRoom/mneClient.action" multiple=false mnewidth=260  currentViewCode="X6Basic_1.0_meetingroom_refer"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign roomSize_defaultValue  = ''>
									<#assign roomSize_defaultValue  = ''>
								<@advsqueryfield formId="ec_X6Basic_meetingroom_meetingRoom_refer_adv_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_roomSize" showFormat="SELECTCOMP" defaultValue=roomSize_defaultValue  divCode="X6Basic_1.0_meetingroom_MeetingRoom_roomSize_roomSize" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="X6Basic_1.0_meetingroom_MeetingRoom" layRec="roomSize" columnname="ROOM_SIZE" columntype="SYSTEMCODE" name="roomSize" fieldType="SELECTCOMP" tableName="X6BASIC_MEETING_ROOMS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										规模
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="X6Basic_1.0_meetingroom_MeetingRoom" />
										<@systemcode  advquery=true onchange="" ecFlag=true deValue="${roomSize_defaultValue}"   name="roomSize" code="meetingSize" classStyle="cui-noborder-input" value="" />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign camera_defaultValue  = ''>
									<#assign camera_defaultValue  = ''>
								<@advsqueryfield formId="ec_X6Basic_meetingroom_meetingRoom_refer_adv_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_camera" showFormat="SELECT" defaultValue=camera_defaultValue  divCode="X6Basic_1.0_meetingroom_MeetingRoom_camera_camera" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="X6Basic_1.0_meetingroom_MeetingRoom" layRec="camera" columnname="CAMERA" columntype="BOOLEAN" name="camera" fieldType="SELECT" tableName="X6BASIC_MEETING_ROOMS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										摄像机
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="X6Basic_1.0_meetingroom_MeetingRoom" />
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${camera_defaultValue!}" name="camera" id="adv_camera" exp="equal"   value=""> 
											<option value=""></option>
											<option value="1" <#if (camera_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (camera_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign network_defaultValue  = ''>
									<#assign network_defaultValue  = ''>
								<@advsqueryfield formId="ec_X6Basic_meetingroom_meetingRoom_refer_adv_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_network" showFormat="SELECT" defaultValue=network_defaultValue  divCode="X6Basic_1.0_meetingroom_MeetingRoom_network_network" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="X6Basic_1.0_meetingroom_MeetingRoom" layRec="network" columnname="NETWORK" columntype="BOOLEAN" name="network" fieldType="SELECT" tableName="X6BASIC_MEETING_ROOMS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										网络
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="X6Basic_1.0_meetingroom_MeetingRoom" />
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${network_defaultValue!}" name="network" id="adv_network" exp="equal"   value=""> 
											<option value=""></option>
											<option value="1" <#if (network_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (network_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign whiteBoard_defaultValue  = ''>
									<#assign whiteBoard_defaultValue  = ''>
								<@advsqueryfield formId="ec_X6Basic_meetingroom_meetingRoom_refer_adv_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_whiteBoard" showFormat="SELECT" defaultValue=whiteBoard_defaultValue  divCode="X6Basic_1.0_meetingroom_MeetingRoom_whiteBoard_whiteBoard" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="X6Basic_1.0_meetingroom_MeetingRoom" layRec="whiteBoard" columnname="WHITE_BOARD" columntype="BOOLEAN" name="whiteBoard" fieldType="SELECT" tableName="X6BASIC_MEETING_ROOMS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										白板
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="X6Basic_1.0_meetingroom_MeetingRoom" />
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${whiteBoard_defaultValue!}" name="whiteBoard" id="adv_whiteBoard" exp="equal"   value=""> 
											<option value=""></option>
											<option value="1" <#if (whiteBoard_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (whiteBoard_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign projector_defaultValue  = ''>
									<#assign projector_defaultValue  = ''>
								<@advsqueryfield formId="ec_X6Basic_meetingroom_meetingRoom_refer_adv_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_projector" showFormat="SELECT" defaultValue=projector_defaultValue  divCode="X6Basic_1.0_meetingroom_MeetingRoom_projector_projector" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="X6Basic_1.0_meetingroom_MeetingRoom" layRec="projector" columnname="PROJECTOR" columntype="BOOLEAN" name="projector" fieldType="SELECT" tableName="X6BASIC_MEETING_ROOMS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										投影仪
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="X6Basic_1.0_meetingroom_MeetingRoom" />
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${projector_defaultValue!}" name="projector" id="adv_projector" exp="equal"   value=""> 
											<option value=""></option>
											<option value="1" <#if (projector_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (projector_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign audio_defaultValue  = ''>
									<#assign audio_defaultValue  = ''>
								<@advsqueryfield formId="ec_X6Basic_meetingroom_meetingRoom_refer_adv_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_audio" showFormat="SELECT" defaultValue=audio_defaultValue  divCode="X6Basic_1.0_meetingroom_MeetingRoom_audio_audio" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="X6Basic_1.0_meetingroom_MeetingRoom" layRec="audio" columnname="AUDIO" columntype="BOOLEAN" name="audio" fieldType="SELECT" tableName="X6BASIC_MEETING_ROOMS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										音响设备
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="X6Basic_1.0_meetingroom_MeetingRoom" />
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${audio_defaultValue!}" name="audio" id="adv_audio" exp="equal"   value=""> 
											<option value=""></option>
											<option value="1" <#if (audio_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (audio_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign useFlag_defaultValue  = ''>
									<#assign useFlag_defaultValue  = ''>
								<@advsqueryfield formId="ec_X6Basic_meetingroom_meetingRoom_refer_adv_queryForm" code="X6Basic_1.0_meetingroom_MeetingRoom_useFlag" showFormat="SELECT" defaultValue=useFlag_defaultValue  divCode="X6Basic_1.0_meetingroom_MeetingRoom_useFlag_useFlag" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="X6Basic_1.0_meetingroom_MeetingRoom" layRec="useFlag" columnname="USE_FLAG" columntype="BOOLEAN" name="useFlag" fieldType="SELECT" tableName="X6BASIC_MEETING_ROOMS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										启用
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="X6Basic_1.0_meetingroom_MeetingRoom" />
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${useFlag_defaultValue!}" name="useFlag" id="adv_useFlag" exp="equal"   value=""> 
											<option value=""></option>
											<option value="1" <#if (useFlag_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (useFlag_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
								
                                	
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
			viewCode: 'X6Basic_1.0_meetingroom_refer',
			modelCode: 'X6Basic_1.0_meetingroom_MeetingRoom',
			modelName: 'MeetingRoom',
			formId: 'ec_X6Basic_meetingroom_meetingRoom_refer_queryForm',
			olddiv: 'X6Basic.meetingroom.meetingRoom.refer.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='X6Basic.meetingroom.meetingRoom.refer.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'X6Basic_1.0_meetingroom_refer'+"&entity.code="+'X6Basic_1.0_meetingroom';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='X6Basic.meetingroom.meetingRoom.refer.advquery'] #customquContent").html(html);
		 	$("[id='X6Basic.meetingroom.meetingRoom.refer.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='X6Basic.meetingroom.meetingRoom.refer.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'X6Basic_1.0_meetingroom_refer'+"&entity.code="+'X6Basic_1.0_meetingroom';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='X6Basic.meetingroom.meetingRoom.refer.advquery'] #customquContent").html(html);
			 $("[id='X6Basic.meetingroom.meetingRoom.refer.advquery'] #advQueryLoading").hide();
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
		$('[id="X6Basic.meetingroom.meetingRoom.refer.advquery"] div.customqu-content').css('display','none');
		$('[id="X6Basic.meetingroom.meetingRoom.refer.advquery"] div.move-grade').css('display','none');
		// $('[id="X6Basic.meetingroom.meetingRoom.refer.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="X6Basic.meetingroom.meetingRoom.refer.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="X6Basic.meetingroom.meetingRoom.refer.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="X6Basic.meetingroom.meetingRoom.refer.advquery"] div.customqu-content').css('display','block');
		$('[id="X6Basic.meetingroom.meetingRoom.refer.advquery"] div.move-grade').css('display','block');
		// $('[id="X6Basic.meetingroom.meetingRoom.refer.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="X6Basic.meetingroom.meetingRoom.refer.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="X6Basic.meetingroom.meetingRoom.refer.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "X6Basic.meetingroom.meetingRoom.refer.query('query')">
<#assign datatable_dataUrl = "/X6Basic/meetingroom/meetingRoom/refer-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_X6Basic_meetingroom_meetingRoom_refer_query" renderOverEvent="ec_X6Basic_meetingroom_meetingRoom_refer_RenderOverEvent" pageInitMethod="ec_X6Basic_meetingroom_meetingRoom_refer_PageInitMethod" modelCode="X6Basic_1.0_meetingroom_MeetingRoom" noPermissionKeys="name,roomSize,network,whiteBoard,audio,projector,camera" hidekeyPrefix="ec_X6Basic_meetingroom_meetingRoom_refer_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_X6Basic_meetingroom_meetingRoom_refer_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="X6Basic.meetingroom.meetingRoom.refer.sendBackrefer" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','roomSize.id','id','name']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="X6Basic.meetingroom.meetingRoom.refer.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('X6Basic.propertydisplayName.radion1366792696971')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign roomSize_displayDefaultType  = ''>
			<@datacolumn columnName="ROOM_SIZE"    showFormat="SELECTCOMP" defaultDisplay="${roomSize_displayDefaultType!}"  key="roomSize.value"   label="${getText('X6Basic.propertydisplayName.radion1366793347089')}" textalign="center"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign network_displayDefaultType  = ''>
			<@datacolumn columnName="NETWORK"    showFormat="CHECKBOX" defaultDisplay="${network_displayDefaultType!}"  key="network"   label="${getText('X6Basic.propertydisplayName.radion1366792858041')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign whiteBoard_displayDefaultType  = ''>
			<@datacolumn columnName="WHITE_BOARD"    showFormat="CHECKBOX" defaultDisplay="${whiteBoard_displayDefaultType!}"  key="whiteBoard"   label="${getText('X6Basic.propertydisplayName.radion1366793054934')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign audio_displayDefaultType  = ''>
			<@datacolumn columnName="AUDIO"    showFormat="CHECKBOX" defaultDisplay="${audio_displayDefaultType!}"  key="audio"   label="${getText('X6Basic.propertydisplayName.radion1366792961138')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign projector_displayDefaultType  = ''>
			<@datacolumn columnName="PROJECTOR"    showFormat="CHECKBOX" defaultDisplay="${projector_displayDefaultType!}"  key="projector"   label="${getText('X6Basic.propertydisplayName.radion1366793011250')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign camera_displayDefaultType  = ''>
			<@datacolumn columnName="CAMERA"    showFormat="CHECKBOX" defaultDisplay="${camera_displayDefaultType!}"  key="camera"   label="${getText('X6Basic.propertydisplayName.radion1366792991306')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_X6Basic_meetingroom_meetingRoom_refer_RenderOverEvent(){
}
function ec_X6Basic_meetingroom_meetingRoom_refer_PageInitMethod(){
}
	
	
	
	
	
	
	
	
</script>