<style type="text/css">.ewc-dialog-el{height:100%;}</style>

<style type="text/css">
.app_edit{
	//background-color: #F7F7F7;
    border-top: 0px solid #C6C3C6;
    left: 5px;
    position: absolute;
    right: 0;
    width: auto;
    z-index: 9;
}
</style>
<@errorbar id="dialogErrorBar" />
<@s.form id="WOM_putInMaterialException_putMaterialException_approval_form" cssStyle="height:100%;"  ecform="true">
	<input type="hidden" name="pendingIds" value="${pendingIds}"/>
	<input type="hidden" name="deploymentId" value="${deploymentId}"/>
	<input type="hidden" name="ids" value="${ids}"/>
	<input type="hidden" name="activityType" value="${activityType}"/>
	<input type="hidden" name="activityName" value="${activityName}"/>
	<input type="hidden" name="processId" value="${processId}"/>
	<input type="hidden" name="des" value="${des}"/>
	<div style="padding-left:15px;height:260px; overflow:auto">
		<div style="padding-right:15px;padding-top:5px">
			<table width="100%">
				<tr>
					<td width="55px"  >
						<label style="width:100%;" value="${getHtmlText('ec.workflow.activity.name')}" >${getHtmlText('ec.workflow.activity.name')}</label>
					</td>
					<td >
						<label style="width:100%;;" value="${activityName})}" >${des}</label>
					</td>
					<td></td>
				</tr>
		
		<#if transitions?has_content>
			<#assign rowlen = 1 + transitions?size>
			<#list transitions as t>
				<#if t.cancel??&&t.cancel==1>
					<#assign rowlen = rowlen-1>
				</#if>
			</#list>
			<#if pending?? &&pending.loop??&&pending.loop gt 0>
				<#assign rowlen = rowlen+1>
			</#if>
		<#elseif (pending?? && pending.activityType == 'notification')||activityType=='notification'>
			<#assign rowlen = 1>
			<#assign rowlen = rowlen+1>
		</#if>
					<tr>
						<td width="55" rowspan=${rowlen}  class="edit_symbol" style="vertical-align:top;padding-top:10px;">${getText('ec.view.dealeffort')}
							<input type="hidden" id="__workflow_outcomeDes" name="workFlowVar.outcomeDes" value="" />
							<input type="hidden" id="__workflow_outcomeMap" name="workFlowVar.outcomeMapJson" value="" />
							<input type="hidden" id="__workflow_assignUser_people" name="workFlowVar.additionalUsersStr" />
						</td>
					</tr>
							
							
							<#assign assignUser=0 /><#assign existsZuofei = false />
							<#if transitions?has_content>
							<#list transitions as t>
								<#if t.cancel??&&t.cancel==1>
									<#assign existsZuofei = true />
								</#if>
							</#list>
							<#list transitions as t>
								<#if t.cancel??&&t.cancel==1>
										
								<#else>
								<tr><td>
								<div class="deal-result">
									<#if t.notificationType??&&t.notificationType==1>
										<input class="ec_check" style="vertical-align:middle;" <#if !(t.reject?? && t.reject gt 0) || !(graduallyReject?? && graduallyReject)><#if t.selectPeople??&&t.selectPeople gt 0> onclick="showAssign_nodification_${t.name}(this)" <#if t.requiredStaff??&&t.requiredStaff gt 0 > checkNull="true" </#if></#if></#if> type="checkbox" dec="${getText(t.description!t.name!)}" name="workFlowVar_nodification_outcome" id="__workflow_outcome_nodification_${t.name}" value="${t.name}" activityType="notification"/>
									<#else>
										<input class="ec_radio" rejectFlag="${t.reject}" style="vertical-align:middle;" <#if t.requiredStaff??&&t.requiredStaff gt 0 >checkNull="true" </#if>  onclick="showAssign_${t.name}(this)" type="radio" dec="${getText(t.description!t.name!)}" name="workFlowVar.outcome" id="__workflow_outcome_${t.name}" value="${t.name}"<#if (!(pending?? && pending.loop?? && pending.loop gt 0)&&transitions?size == 1) || (existsZuofei?? && existsZuofei && transitions?size == 2) > checked="checked"</#if> />
										<#if t.reject??&&t.reject gt 0>
         									<input class="wfcancel"  type="hidden" name="workFlowVarStatus" />
        								</#if>
									</#if>
									<label for="__workflow_outcome_${t.name}" class="ec_radio">${getHtmlText(t.description!t.name!)}</label>
								</div>
								<#if !(t.reject?? && t.reject gt 0) || !(graduallyReject?? && graduallyReject)>
								<#if t.selectPeople??&&t.selectPeople gt 0>
				
										<div style="<#if !((transitions?size == 1) || (existsZuofei?? && existsZuofei && transitions?size == 2)) >display:none;</#if>float:left;width:60%;padding-right:5px;" <#if t.notificationType??&&t.notificationType==1>id="nodification_assignStaff_${t.name}"<#else>id="assignStaff_${t.name}"</#if> >
										
										<#if t.selectPeople==1>
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.putInMaterialException.putMaterialException._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
										<#elseif t.selectPeople==2>
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.putInMaterialException.putMaterialException._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="crossCompanyFlag=true&unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
										<#elseif t.selectPeople==3>
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.putInMaterialException.putMaterialException._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/userListGroupFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true selectPeople="${t.selectPeople}" outcome="${t.name}"/>
										<#elseif t.selectPeople==4>
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.putInMaterialException.putMaterialException._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/userListGroupFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true selectPeople="${t.selectPeople}" outcome="${t.name}"/>
										<#elseif t.selectPeople==5>
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.putInMaterialException.putMaterialException._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/groupUserList.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}" selectPeople="${t.selectPeople}" outcome="${t.name}"/>
										</#if>
										<#-- 
										<#if t.selectPeople==1>
										<#if t.userRangeFalg?? && t.userRangeFalg==1>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.putInMaterialException.putMaterialException._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/userListFramesetRange.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}"/>
										<#else>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.putInMaterialException.putMaterialException._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
										</#if>
										<#elseif t.selectPeople==2>
										<#if t.userRangeFalg?? && t.userRangeFalg==1>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.putInMaterialException.putMaterialException._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/userListFramesetRange.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}"/>
										<#else>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.putInMaterialException.putMaterialException._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="crossCompanyFlag=true&unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
										</#if>
										<#else>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.putInMaterialException.putMaterialException._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="crossCompanyFlag=true&unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
										</#if>
										-->
										</div>
								</#if>
								</#if>
								</#if>
								</td></tr>
							</#list>
							<#if pending?? && pending.loop??&& pending.loop gt 0>
								<tr><td>
								<div class="deal-result" style="margin-top:3px;">
									<input class="ec_check" style="vertical-align:middle;"  onclick="showAssign_countersign(this)"  type="checkbox" dec="${getText('ec.edit.countersignSelect')}" name="workFlowVar_countersign_outcome" id="__workflow_outcome_countersign" value=""/>
									<label for="__workflow_outcome_countersign" class="ec_radio">${getHtmlText('ec.edit.countersignSelect')}</label>
								</div>
								<div style="float:left;width:60%;padding-right:5px;display:none;" id="countersign_assignStaff">
									<input type="hidden" id="__workflow_countersign_people" name="workFlowVar.countersignUsers" />
									<input type="hidden" id="__workflow_countersign_main_people" name="workFlowVar.mainCountersigner" />
									<#if pending.loop==1>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.putInMaterialException.putMaterialException._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
									<#elseif pending.loop==2>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.putInMaterialException.putMaterialException._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="crossCompanyFlag=true&unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
									<#elseif pending.loop==3>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.putInMaterialException.putMaterialException._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="userRange" url="/foundation/user/common/userListGroupFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true selectPeople="${pending.loop}"/>
									<#elseif pending.loop==4>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.putInMaterialException.putMaterialException._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="userRange" url="/foundation/user/common/userListGroupFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true selectPeople="${pending.loop}"/>
									<#elseif pending.loop==5>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.putInMaterialException.putMaterialException._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="userRange" url="/foundation/user/common/groupUserList.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}" outcome="${pending.activityName}" selectPeople="${pending.loop}"/>
									</#if>
									<!--
									<#if pending.loop==2>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.putInMaterialException.putMaterialException._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="User" url="/foundation/user/common/userListFrameset.action" funcparam="crossCompanyFlag=true&unassignUserSupport=true&multiSelect=true" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" clicked=true multiple=true mnewidth=260 isEdit=true />
										
									<#else>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.putInMaterialException.putMaterialException._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" clicked=true multiple=true mnewidth=260 isEdit=true />
									</#if>
									-->
								</div>
								<#if pending?? && pending.mainLoop!false>
									<div class="deal-result">
										<input class="ec_check" style="vertical-align:middle;"  type="checkbox" value="true" name="workFlowVar.endCountersignFlag" id="endCountersign"  />
										<label for="endCountersign_label" class="ec_radio">${getHtmlText('ec.workflow.consign.close')}</label>
									</div>
								</#if>
								</td></tr>
							</#if>
							<#elseif (pending?? && pending.activityType == 'notification')||(activityType??&&activityType=='notification')>
							<tr><td>
							<div class="deal-result">
							<input class="ec_radio" style="vertical-align:middle;" type="radio" des="${getText('calendar.common.check')}" name="workFlowVar.outcome" id="__workflow_outcome_ok" value="${getText('calendar.common.check')}" checked="checked" />
							<label for="__workflow_outcome_ok" class="ec_radio">${getHtmlText('calendar.common.check')}</label>
							</div>
							</td></tr>
							</#if>
							
					
					<#if !(dealSet??&&dealSet==2)>			
					<tr>
						<td valign="top">${getText('ec.view.advice.write')}</td>
						<td colspan="2">
							<textarea id="workflow_comments" name="workFlowVar.comment" rows="5" style="height:100px"></textarea>
						</td>
						<td></td>
					</tr>
					</#if>
		
	<script type="text/javascript">	
		showAssign_countersign=function(obj){
			if($(obj).prop("checked")==true){
				$("#countersign_assignStaff").show();
			}else{
				$("#countersign_assignStaff").hide();
			}
		}
		<#if (pendingId?? || editNew) && transitions??>
		<#list transitions as t>
			<#if t.notificationType==1>
				
				showAssign_nodification_${t.name}=function(obj){
					
					if($(obj).prop("checked")==true){
						$("#nodification_assignStaff_${t.name}").show();
					}else{
						$("#nodification_assignStaff_${t.name}").hide();
					}
				}
			<#else>
				showAssign_${t.name}=function(obj){
					var radioObj = $(obj);
					var rejectFlag = radioObj.attr('rejectFlag');
					if(rejectFlag && rejectFlag == '1') {
						$('input[name="workFlowVarStatus"]').val('reject');
					} else {
						$('input[name="workFlowVarStatus"]').val('');
					}
					$("div[id^='assignStaff_']").each(function(){
						$(this).hide();
					});
					if($(obj).prop("checked")==true){
						$("#assignStaff_${t.name}").show();
						// 重新计算是否需要显示更多"..."
						try{
							assignStaffSelect_${t.name}CalWidth();
						}catch(e){}
					}
					$("#endCountersignDiv").show();
				}
			
			</#if>
		</#list>
		</#if>
		</script>			</table>
		</div>
	</div>	
</@s.form>
<script type="text/javascript">
	//批量处理提交
	WOM.putInMaterialException.putMaterialException.approval=function(){
		CUI.Dialog.toggleAllButton();
		if(!WOM.putInMaterialException.putMaterialException.validate()){
			CUI.Dialog.toggleAllButton();
			return false;
		}
		var outcomeStr="";
		var aty=$("input[name='activityType']").val();
		if($('input[name="workFlowVar.outcome"]:checked').length>0){
			$('input[name="workFlowVar.outcome"]:checked').each(function(){
   	 			var id="#assignStaffSelect_"+$(this).val()+"MultiIDs"; 
    			if(outcomeStr!=""){
    				outcomeStr=outcomeStr+";";
    			}
    			outcomeStr = outcomeStr+aty+","+$(this).val()+","+$(this).attr("dec");
    			if($("#workflow_comments").val()==""){
    			outcomeStr=outcomeStr+", ";
    		}else{
    			outcomeStr=outcomeStr+","+$("#workflow_comments").val();
    		}
    			if(CUI(id).val()==undefined||CUI(id).val()==""){
    			outcomeStr+=",";
    			}else{
    				var ids=CUI(id).val();
    				if(ids!=""){
	    				ids=ids.substr(0,ids.length-1);
	    				var idstr =ids.replace(/\,/g,"@@");
	    				outcomeStr=outcomeStr+","+idstr;
    				}
    			}
   			});
   			if($('#__workflow_outcome_countersign').prop("checked")){
   				var ids=CUI("#countersignUsersMultiIDs").val();
				if(ids!=""){
					ids=ids.substr(0,ids.length-1);
				}
   				outcomeStr+=","+ids.replace(/\,/g,"@@");
   			}
   		}else if($('#__workflow_outcome_countersign').prop("checked")){
   			//activeType，outcome，dec，assignUser
   			if(outcomeStr!=""){
    			outcomeStr=outcomeStr+";";
    		}
    		var ids=CUI("#countersignUsersMultiIDs").val();
			if(ids!=""){
				ids=ids.substr(0,ids.length-1);
			}
   			outcomeStr="countersignAssign,countersignAssign,,,,"+ids.replace(/\,/g,"@@");
   		}
   		
   		
		$('input[id*="__workflow_outcome_nodification_"]:checked').each(function(){
   		 	var id="#assignStaffSelect_"+$(this).val()+"MultiIDs";
   		 	if(outcomeStr!=""){
    			outcomeStr=outcomeStr+";";
    		}
    		var tp="";
    		if($(this).attr("activitytype")!=null&&$(this).attr("activitytype")!=undefined){
    			tp = $(this).attr("activitytype");
    		}else{
    			tp = aty;
    		}
    		outcomeStr = outcomeStr+tp+","+$(this).val()+","+$(this).attr("dec");
    		if($("#workflow_comments").val()==""){
    			outcomeStr=outcomeStr+", ";
    		}else{
    			outcomeStr=outcomeStr+","+$("#workflow_comments").val();
    		}
    		if(CUI(id).val()==undefined||CUI(id).val()==""){
    			
    		}else{
    			var ids=CUI(id).val();
				if(ids!=""){
    				ids=ids.substr(0,ids.length-1);
    				var idstr =ids.replace(/\,/g,"@@");
    				outcomeStr=outcomeStr+","+idstr;
				}
    		}
   		});
   		var url="/WOM/putInMaterialException/putMaterialException/bulkSubmit.action";
   		CUI.ajax({
		type : "POST",
		url : url,
		data:{"outcomeStr":outcomeStr,"ids":$('input[name="ids"]').val(),"deploymentId":$('input[name="deploymentId"]').val(),"pendingIds":$('input[name="pendingIds"]').val()},
		success : function(msg){
			try{
				if(msg.dealSuccessFlag==true) {
					dialogErrorBarWidget.showMessage("${getHtmlText('foundation.common.saveandclosesuccessful')}","s");
					setTimeout(function(){
					try{WOM.putInMaterialException.putMaterialException.putinExceptionList.AppDlg.close();}catch(e1){}
						WOM.putInMaterialException.putMaterialException.putinExceptionList.query('pending');
					},1500);
					// 刷待办数量
					timeData();
				}else{
					CUI.showErrorInfos(CUI.parseJSON(msg.responseText),dialogErrorBarWidget);
					//dialogErrorBarWidget.showMessage("${getHtmlText('ec.common.unsuccessfully')}","s");
					CUI.Dialog.toggleAllButton();
				}
			} catch(e){}
		},
		error:function(msg){
			CUI.showErrorInfos(CUI.parseJSON(msg.responseText),dialogErrorBarWidget);
			//dialogErrorBarWidget.showMessage("${getHtmlText('ec.common.unsuccessfully')}");
			CUI.Dialog.toggleAllButton();
		}
	});
	}
	//页面加载完成后设置textarea高度
	$(function(){
			var dialogH = WOM.putInMaterialException.putMaterialException.putinExceptionList.AppDlg._config.height-60-${rowlen}*20;
			if(dialogH<100){
				$("#workflow_comments").css("height","100px");
			}else{
				$("#workflow_comments").css("height",dialogH-10);
			}
			
	});
	//验证
	WOM.putInMaterialException.putMaterialException.validate = function(){
		if(!($('#__workflow_outcome_countersign').prop("checked")||$('input[name="workFlowVar.outcome"]:checked').val())){
			dialogErrorBarWidget.showMessage("${getText('ec.flow.outcome.select')}");
			return false;
		}
		<#if dealSet??&&dealSet==1>	
		var comments=$.trim(CUI("#workflow_comments").val());
	 	if(comments!=null&&comments==""){
    		 dialogErrorBarWidget.showMessage("${getText('ec.property.dealinfo.isNotNull')}", 'f');
    		 return false;
		}  
		</#if>
		var requiredStaff=false;
		var outcomeDesc="";
		$('input[name="workFlowVar.outcome"]:checked').each(function(){
			outcomeDesc=$(this).attr("dec");
			var id="#assignStaffSelect_"+$(this).val()+"MultiIDs";
			var values=$(id).val();
			var checkNull=$(this).attr("checkNull");
			if(checkNull=='true'&&values==''){
				requiredStaff=true;
				return ;
			}
		})
		$('input[id*="__workflow_outcome_nodification_"]:checked').each(function(){
			if(outcomeDesc!=""){
				outcomeDesc+=","+$(this).attr("dec");
			}else{
				outcomeDesc=$(this).attr("dec");
			}
			var id="#assignStaffSelect_"+$(this).val()+"MultiIDs";
			var values1=CUI(id).val();
			var checkNull1=$(this).attr("checkNull");
			if(checkNull1=='true'&&values1==''){
				requiredStaff=true;
				return ;
			}
		})
		if(requiredStaff){
			dialogErrorBarWidget.showMessage(outcomeDesc+"${getText("ec.flow.outcome.assStaffNull")}");
			return false;
		}
		if($('#__workflow_outcome_countersign').prop("checked")){
			var countersignUsers=CUI('#countersignUsersMultiIDs').val();
			if(countersignUsers==''){
				dialogErrorBarWidget.showMessage("您勾选了转发，请指定转发人员！");
				return false;
			}
		}
		return true;
	}
</script>