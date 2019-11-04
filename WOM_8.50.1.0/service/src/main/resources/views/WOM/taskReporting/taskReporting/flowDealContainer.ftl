		
			
		<div class="edit-foot">
			<div class="edit-workflow">
				<table width="100%">
					<tr>
						<td height="40" class="edit_symbol">${getText('ec.view.dealeffort')}</td>
						<td id="workflow_outcomes">
							<input type="hidden" id="__workflow_outcomeDes" name="workFlowVar.outcomeDes" value="" />
							<input type="hidden" id="__workflow_outcomeMap" name="workFlowVar.outcomeMapJson" value="" />
							<input type="hidden" id="__workflow_assignUser_people" name="workFlowVar.additionalUsersStr" />
							
							<#assign assignUser=0 /><#assign existsZuofei = false />
							<#if transitions?has_content>
							<#list transitions as t>
								<#if t.cancel??&&t.cancel==1>
									<#assign existsZuofei = true />
								</#if>
							</#list>
							<#list transitions as t>
								<#if t.cancel??&&t.cancel==1>
									<#--作废按钮已经挪到view-edit.ftl中，这里什么也不做-->
								<#else>
								<div class="deal-result">
									<#if t.notificationType??&&t.notificationType==1>
										<input class="ec_check" style="vertical-align:middle;" <#if !(t.reject?? && t.reject gt 0) || !(graduallyReject?? && graduallyReject)><#if t.selectPeople??&&t.selectPeople gt 0> onclick="showAssign_nodification_${t.name}(this)" <#if t.requiredStaff??&&t.requiredStaff gt 0 > checkNull="true" </#if> </#if> </#if> type="checkbox" dec="${getText(t.description!t.name!)}" name="workFlowVar_nodification_outcome" id="__workflow_outcome_nodification_${t.name}" value="${t.name}" activityType="notification"/>
									<#else>
										<input class="ec_radio" rejectFlag="${t.reject}" style="vertical-align:middle;"  onclick="showAssign_${t.name}(this)" <#if t.requiredStaff??&&t.requiredStaff gt 0 >checkNull="true" </#if>  type="radio" dec="${getText(t.description!t.name!)}" name="workFlowVar.outcome" id="__workflow_outcome_${t.name}" value="${t.name}"<#if (!(pending??&&pending.loop?? && pending.loop gt 0)&&transitions?size == 1) || (existsZuofei?? && existsZuofei && transitions?size == 2) > checked="checked"</#if> />
										<#if t.reject??&&t.reject gt 0>
         									<input class="wfcancel"  type="hidden" name="workFlowVarStatus" />
        								</#if>
									</#if>
									<label for="__workflow_outcome_${t.name}" class="ec_radio">${getHtmlText(t.description!t.name!)}</label>
								</div>
								<#if !(t.reject?? && t.reject gt 0) || !(graduallyReject?? && graduallyReject)>
								<#if t.selectPeople??&&t.selectPeople gt 0>

										<#assign defaultSelectIds = ''>
										<#assign defaultSelectNames = ''>
										<#if t.defaultSelectStaff?? && t.defaultSelectStaff gt 0>
											<#assign defaultSelectIds = (lastAssignUserMap[t.name]['ids'])!>
											<#assign defaultSelectNames = (lastAssignUserMap[t.name]['names'])!>
										</#if>

										<div style="<#if !((transitions?size == 1) || (existsZuofei?? && existsZuofei && transitions?size == 2)) >display:none;</#if>float:left;width:20%;padding-right:5px;min-width:200px;" <#if t.notificationType??&&t.notificationType==1>id="nodification_assignStaff_${t.name}"<#else>id="assignStaff_${t.name}"</#if> >
										<#if t.selectPeople==1>
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.taskReporting.taskReporting._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids=defaultSelectIds names=defaultSelectNames  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
										<#elseif t.selectPeople==2>
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.taskReporting.taskReporting._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids=defaultSelectIds names=defaultSelectNames  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="crossCompanyFlag=true&unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
										<#elseif t.selectPeople==3>
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.taskReporting.taskReporting._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/userListGroupFrameset.action" displayFieldName="staffname"  ids=defaultSelectIds names=defaultSelectNames  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true&sourceStaff=${(pending.sourceStaff)!''}" sourceStaff="${(pending.sourceStaff)!''}" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}" selectPeople="${t.selectPeople}" outcome="${t.name}"/>
										<#elseif t.selectPeople==4>
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.taskReporting.taskReporting._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/userListGroupFrameset.action" displayFieldName="staffname"  ids=defaultSelectIds names=defaultSelectNames  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true&sourceStaff=${(pending.sourceStaff)!''}" sourceStaff="${(pending.sourceStaff)!''}" clicked=true multiple=true mnewidth=260 isEdit=true selectPeople="${t.selectPeople}" outcome="${t.name}"/>
										<#elseif t.selectPeople==5>
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.taskReporting.taskReporting._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/groupUserList.action" displayFieldName="staffname"  ids=defaultSelectIds names=defaultSelectNames  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}" selectPeople="${t.selectPeople}" outcome="${t.name}"/>
										</#if>
										<#if defaultSelectIds?has_content>
											<script type="text/javascript">
												$(function(){
													$('#assignStaffSelect_${t.name}AddIds').val('${defaultSelectIds}');
													setTimeout(function(){
														assignStaffSelect_${t.name}CalWidth();
													}, 500);
												});
											</script>
										</#if>
										<#--
										<#if t.selectPeople==1>
										<#if t.userRangeFalg?? && t.userRangeFalg==1>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.taskReporting.taskReporting._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/userListFramesetRange.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}"/>
										<#else>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.taskReporting.taskReporting._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
										</#if>
										<#elseif t.selectPeople==2>
										<#if t.userRangeFalg?? && t.userRangeFalg==1>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.taskReporting.taskReporting._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/userListFramesetRange.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}"/>
										<#else>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.taskReporting.taskReporting._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="crossCompanyFlag=true&unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
										</#if>
										<#else>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.taskReporting.taskReporting._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="crossCompanyFlag=true&unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
										</#if>
										-->
										</div>
									</#if>
								</#if>
								</#if>
							</#list>
							<#if pending?? && pending.loop??&& pending.loop gt 0>
								<div class="deal-result">
									<input class="ec_check" style="vertical-align:middle;"  onclick="showAssign_countersign(this)"  type="checkbox" dec="${getText('ec.edit.countersignSelect')}" name="workFlowVar_countersign_outcome" id="__workflow_outcome_countersign" value=""/>
									<label for="__workflow_outcome_countersign" class="ec_radio">${getHtmlText('ec.edit.countersignSelect')}</label>
								</div>
								<div style="float:left;width:27%;padding-right:5px;display:none;" id="countersign_assignStaff" >
									<input type="hidden" id="__workflow_countersign_people" name="workFlowVar.countersignUsers" />
									<input type="hidden" id="__workflow_countersign_main_people" name="workFlowVar.mainCountersigner" />
									<#if pending.loop==1>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.taskReporting.taskReporting._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
									<#elseif pending.loop==2>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.taskReporting.taskReporting._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="crossCompanyFlag=true&unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
									<#elseif pending.loop==3>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.taskReporting.taskReporting._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="userRange" url="/foundation/user/common/userListGroupFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true selectPeople="${pending.loop}"/>
									<#elseif pending.loop==4>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.taskReporting.taskReporting._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="userRange" url="/foundation/user/common/userListGroupFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true selectPeople="${pending.loop}"/>
									<#elseif pending.loop==5>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.taskReporting.taskReporting._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="userRange" url="/foundation/user/common/groupUserList.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}" outcome="${pending.activityName}" selectPeople="${pending.loop}"/>
									</#if>
								</div>
								<#if pending?? && pending.mainLoop!false>
									<div class="deal-result"  id="endCountersignDiv" style="display:none;">
										<input class="ec_check" style="vertical-align:middle;"  type="checkbox" value="true" name="workFlowVar.endCountersignFlag" id="endCountersign"  />
										<label for="endCountersign_label" class="ec_radio">${getHtmlText('ec.workflow.consign.close')}</label>
									</div>
								</#if>
							</#if>
							<#elseif (pending?? && pending.activityType == 'notification')||(activityType??&&activityType=='notification')>
							<div class="deal-result">
							<input class="ec_radio" style="vertical-align:middle;" type="radio" des="${getText('calendar.common.check')}" name="workFlowVar.outcome" id="__workflow_outcome_ok" value="${getText('calendar.common.check')}" checked="checked" />
							<label for="__workflow_outcome_ok" class="ec_radio">${getHtmlText('calendar.common.check')}</label>
							</div>
							</#if>
							<a class="cui-btn-blue" onclick="WOM.taskReporting.taskReporting.save()"><span class='btn_r'>${getText('ec.flow.save')}</span></a>
							<a class="cui-btn-green" onclick="WOM.taskReporting.taskReporting.submit()"><span class='btn_r'>${getText('ec.flow.submit')}</span></a>
						
						</td>
						<td align="right" width="20">
						<#if !(dealSet??&&dealSet==2)>	
							<span id="workflow_toggle" class="workflow-toggle-b"></span>
						</#if>	
						</td>
					</tr>
					<#if !(dealSet??&&dealSet==2)>	
					<tr>
						<td valign="top" class="edit_symbol">${getText('ec.view.advice.write')}</td>
						<td colspan="2">
							<textarea id="workflow_comments" name="workFlowVar.comment">${(workFlowVar.comment)!}</textarea>
						</td>
						<td></td>
					</tr>
					</#if>	
					
				</table>
			</div>
		</div>
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
		</script>