<!-- MESBasic_1/equipManage/mainView -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1423967574364')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-VIEW-MESBasic_1_equipManage_mainView,head,MESBasic_1_equipManage_Equipment,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->

</head>

<body id="dialog_page">
<@loadpanel></@loadpanel>
<@errorbar id="workbenchErrorBar" offsetY=0></@errorbar>
</#if>


<style type="text/css">
.ewc-dialog-el{height:100%;} 
.ewc-dialog-el .edit-table{width:98%;margin:0 auto;}
.edit-content-dialog-fullwidth .edit-tabs {width: 100%;margin-left: 0;}
</style>
<script type="text/javascript">
	CUI.ns('MESBasic.equipManage.equipment.mainView');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "MESBasic_equipManage_equipment">
	<#assign fileuploadLinkId = id!>
<#assign viewType = "create">
<#assign newObj = editNew!true >
<#if newObj>
<#assign viewType = "create">
<#else>
<#assign viewType = "edit">
</#if>
<#if refId?? && (refId>0)>
	<#assign newObj = false >
</#if>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<#assign viewType = "readonly">
<#assign callbackName ="MESBasic.equipManage.equipment.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="MESBasic_equipManage_equipment_mainView_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="MESBasic_equipManage_equipment_mainView_form" cssStyle="height:100%;" hiddenField="equipment.relateContainer.id,equipment.installPlace.id,equipment.eamType.id,equipment.workcenter.id,equipment.eamUseDeptId.id,equipment.eamDutyStaffId.id," onsubmitMethod="MESBasic.equipManage.equipment.mainView.beforeSubmitMethod()" ecAction="/MESBasic/equipManage/equipment/mainView/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="mainView">
	<input type="hidden" name="viewCode" value="MESBasic_1_equipManage_mainView">
	<input type="hidden" name="datagridKey" value="MESBasic_equipManage_equipment_mainView_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="equipment.version" value="${(equipment.version)!0}" />
	<input type="hidden" name="equipment.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
		<input type="hidden" name="equipment.relateContainer.id" value="${(equipment.relateContainer.id)!""}"/>
		<input type="hidden" name="equipment.installPlace.id" value="${(equipment.installPlace.id)!""}"/>
		<input type="hidden" name="equipment.eamType.id" value="${(equipment.eamType.id)!""}"/>
		<input type="hidden" name="equipment.workcenter.id" value="${(equipment.workcenter.id)!""}"/>
		<input type="hidden" name="equipment.eamUseDeptId.id" value="${(equipment.eamUseDeptId.id)!""}"/>
		<input type="hidden" name="equipment.eamDutyStaffId.id" value="${(equipment.eamDutyStaffId.id)!""}"/>
	<div id="MESBasic_mainView_edit_div" style="height:100%">
		<div id="MESBasic_equipManage_equipment_mainView_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "MESBasic_equipManage_equipment_mainView_form"+"_attcount";
function fileCountSpan(fileuploadLinkId,fileuploadType){
	if(!fileuploadLinkId) {
		fileuploadLinkId = '${fileuploadLinkId!}'
	}
	if(!fileuploadType) {
		fileuploadType = '${fileuploadType!}'
	}
	CUI.ajax({
		type : "POST",
		url : '/foundation/workbench/upload-count.action?linkId=' + fileuploadLinkId + '&type=' + fileuploadType,
		success : function(msg){
			try{
				if(msg!=null) {
					var fileCount = parseInt(msg);
					$('.total').show();
					//去掉两边的括号字符
					CUI('#'+attcountid).html(fileCount);
				}
			} catch(e){}
		}
	});
};
$(function(){
	var fileuploadLinkId= '${fileuploadLinkId!}';
	if(fileuploadLinkId != '') {
		fileCountSpan(fileuploadLinkId, '${fileuploadType}');
	}
	<#if hasAttachment?? && hasAttachment && false>
	$('#attachmentLi').one('click', function(){
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=MESBasic_1_equipManage', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>			<div class="edit-panes" style="margin-top:0px;padding:0px;">
				<div>
				<div class="edit-panes-w">

<div class="edit-panes-s" style="width:98%;margin-left:10px;">
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td></tr>
		<tr class="dialog_tr">
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1423967256308')}" >${getText('MESBasic.propertydisplayName.randon1423967256308')}</label>
				</td>
				
						<#assign equipment_code_defaultValue  = ''>
							 							<#assign equipment_code_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="equipment.code" id="equipment_code"  style=";" originalvalue="<#if !newObj || (equipment.code)?has_content>${(equipment.code?html)!}<#else>${equipment_code_defaultValue!}</#if>" value="<#if !newObj || (equipment.code)?has_content>${(equipment.code?html)!}<#else>${equipment_code_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1423967231438')}" >${getText('MESBasic.propertydisplayName.randon1423967231438')}</label>
				</td>
				
						<#assign equipment_name_defaultValue  = ''>
							 							<#assign equipment_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="equipment.name" id="equipment_name"  style=";" originalvalue="<#if !newObj || (equipment.name)?has_content>${(equipment.name?html)!}<#else>${equipment_name_defaultValue!}</#if>" value="<#if !newObj || (equipment.name)?has_content>${(equipment.name?html)!}<#else>${equipment_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1419232393782')}" >${getText('MESBasic.propertydisplayName.radion1419232393782')}</label>
				</td>
				
						<#assign equipment_workcenter_name_defaultValue  = ''>
														<#assign equipment_workcenter_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.radion1419491307826')}" viewType="${viewType!}" deValue="${equipment_workcenter_name_defaultValue!}" conditionfunc="MESBasic.equipManage.equipment.mainView._querycustomFunc('equipment_workcenter_name')" view=true  value="${(equipment.workcenter.name)!}" displayFieldName="name" name="equipment.workcenter.name" id="equipment_workcenter_name" type="other" url="/MESBasic/factoryModel/factoryModel/factroyRef1.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_equipManage_equipment_mainView_form" editCustomCallback=";" refViewCode="MESBasic_1_factoryModel_factroyRef1" onkeyupfuncname=";_callback_equipment_workcenter_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(equipment.id)?? && (equipment.workcenter.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${equipment.workcenter.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_equipManage_equipment_mainView_form',obj, 'equipment.workcenter', '/MESBasic/factoryModel/factoryModel/factroyRef1.action');
												CUI.commonFills('MESBasic_equipManage_equipment_mainView_form', 'equipment.workcenter',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1460957425645')}" >${getText('MESBasic.propertydisplayName.randon1460957425645')}</label>
				</td>
				
						<#assign equipment_eamBuyTime_defaultValue  = ''>
							 							<#assign equipment_eamBuyTime_defaultValue  = ''>
					<#if (equipment_eamBuyTime_defaultValue)?? &&(equipment_eamBuyTime_defaultValue)?has_content>
							<#assign equipment_eamBuyTime_defaultValue  = getDefaultDateTime(equipment_eamBuyTime_defaultValue!)?date>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATE"  style="text-align: left;;" >
					
							
							<#if newObj && !(equipment.eamBuyTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATE" cssClass="cui-noborder-input" name="equipment.eamBuyTime" type="date" value="${equipment_eamBuyTime_defaultValue!}" id="equipment.eamBuyTime"  view=true  cssStyle=""  />
								
							<#else>
							<#if (equipment.eamBuyTime)??>
								
								<@datepicker  onchange="" property_type="DATE" cssClass="cui-noborder-input" name="equipment.eamBuyTime" type="date" value="${equipment.eamBuyTime?string('yyyy-MM-dd')}" id="equipment.eamBuyTime"  view=true  cssStyle="" />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATE" cssClass="cui-noborder-input" name="equipment.eamBuyTime" type="date" value="" id="equipment.eamBuyTime" cssStyle=""  view=true />
								
							</#if>
							</#if>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1426566652807')}" >${getText('MESBasic.propertydisplayName.randon1426566652807')}</label>
				</td>
				
						<#assign equipment_eamProduceFirm_defaultValue  = ''>
							 							<#assign equipment_eamProduceFirm_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="equipment.eamProduceFirm" id="equipment_eamProduceFirm"  style=";" originalvalue="<#if !newObj || (equipment.eamProduceFirm)?has_content>${(equipment.eamProduceFirm?html)!}<#else>${equipment_eamProduceFirm_defaultValue!}</#if>" value="<#if !newObj || (equipment.eamProduceFirm)?has_content>${(equipment.eamProduceFirm?html)!}<#else>${equipment_eamProduceFirm_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1426566956024')}" >${getText('MESBasic.propertydisplayName.randon1426566956024')}</label>
				</td>
				
						<#assign equipment_eamVendorName_defaultValue  = ''>
							 							<#assign equipment_eamVendorName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="equipment.eamVendorName" id="equipment_eamVendorName"  style=";" originalvalue="<#if !newObj || (equipment.eamVendorName)?has_content>${(equipment.eamVendorName?html)!}<#else>${equipment_eamVendorName_defaultValue!}</#if>" value="<#if !newObj || (equipment.eamVendorName)?has_content>${(equipment.eamVendorName?html)!}<#else>${equipment_eamVendorName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1426733003266')}" >${getText('MESBasic.propertydisplayName.randon1426733003266')}</label>
				</td>
				
						<#assign equipment_isRelateContainer_defaultValue  = ''>
							 							<#assign equipment_isRelateContainer_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="equipment.isRelateContainer_check" originalvalue="<#if !newObj><#if (equipment.isRelateContainer)??>${(equipment.isRelateContainer!false)?string('true','false')}<#else>false</#if><#elseif equipment_isRelateContainer_defaultValue?has_content>${(equipment_isRelateContainer_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (equipment.isRelateContainer)??>${(equipment.isRelateContainer!false)?string('true','false')}<#else>false</#if><#else>${(equipment_isRelateContainer_defaultValue!true)?string}</#if>"  disabled=true/>
								
								<input property_type="BOOLEAN" type="hidden" name="equipment.isRelateContainer" originalvalue="<#if ((equipment.isRelateContainer)?? &&  equipment.isRelateContainer)||(equipment_isRelateContainer_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((equipment.isRelateContainer)?? &&  equipment.isRelateContainer)||(equipment_isRelateContainer_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="equipment.isRelateContainer_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="equipment.isRelateContainer"]');
												CUI('input[name="equipment.isRelateContainer_check"]').each(function(){
													if(this.checked) {
														tempObj.val('true');
													} else {
														tempObj.val('false');
													}
												});
											});
										}catch(e){}	
									});
								</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1516068643374')}" >${getText('MESBasic.propertydisplayName.randon1516068643374')}</label>
				</td>
				
						<#assign equipment_eamType_name_defaultValue  = ''>
														<#assign equipment_eamType_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1524705400363')}" viewType="${viewType!}" deValue="${equipment_eamType_name_defaultValue!}" conditionfunc="MESBasic.equipManage.equipment.mainView._querycustomFunc('equipment_eamType_name')" view=true  value="${(equipment.eamType.name)!}" displayFieldName="name" name="equipment.eamType.name" id="equipment_eamType_name" type="other" url="/MESBasic/eamType/eamType/typeAttributerRef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_equipManage_equipment_mainView_form" editCustomCallback=";" refViewCode="MESBasic_1_eamType_typeAttributerRef" onkeyupfuncname=";_callback_equipment_eamType_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(equipment.id)?? && (equipment.eamType.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${equipment.eamType.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_equipManage_equipment_mainView_form',obj, 'equipment.eamType', '/MESBasic/eamType/eamType/typeAttributerRef.action');
												CUI.commonFills('MESBasic_equipManage_equipment_mainView_form', 'equipment.eamType',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415268393452')}" >${getText('MESBasic.propertydisplayName.radion1415268393452')}</label>
				</td>
				
						<#assign equipment_relateContainer_name_defaultValue  = ''>
														<#assign equipment_relateContainer_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('MESBasic.viewtitle.radion1418789997648')}" viewType="${viewType!}" deValue="${equipment_relateContainer_name_defaultValue!}" conditionfunc="MESBasic.equipManage.equipment.mainView._querycustomFunc('equipment_relateContainer_name')" view=true  value="${(equipment.relateContainer.name)!}" displayFieldName="name" name="equipment.relateContainer.name" id="equipment_relateContainer_name" type="other" url="/MESBasic/container/container/containerListAVRef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_equipManage_equipment_mainView_form" editCustomCallback=";" refViewCode="MESBasic_1_container_containerListAVRef"  onkeyupfuncname=";_callback_equipment_relateContainer_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(equipment.id)?? && (equipment.relateContainer.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${equipment.relateContainer.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_equipManage_equipment_mainView_form',obj, 'equipment.relateContainer', '/MESBasic/container/container/containerListAVRef.action');
												CUI.commonFills('MESBasic_equipManage_equipment_mainView_form', 'equipment.relateContainer',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1426647671975')}" >${getText('MESBasic.propertydisplayName.randon1426647671975')}</label>
				</td>
				
						<#assign equipment_autoCreateContainer_defaultValue  = ''>
							 							<#assign equipment_autoCreateContainer_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="equipment.autoCreateContainer_check" originalvalue="<#if !newObj><#if (equipment.autoCreateContainer)??>${(equipment.autoCreateContainer!false)?string('true','false')}<#else>false</#if><#elseif equipment_autoCreateContainer_defaultValue?has_content>${(equipment_autoCreateContainer_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (equipment.autoCreateContainer)??>${(equipment.autoCreateContainer!false)?string('true','false')}<#else>false</#if><#else>${(equipment_autoCreateContainer_defaultValue!true)?string}</#if>"  disabled=true/>
								
								<input property_type="BOOLEAN" type="hidden" name="equipment.autoCreateContainer" originalvalue="<#if ((equipment.autoCreateContainer)?? &&  equipment.autoCreateContainer)||(equipment_autoCreateContainer_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((equipment.autoCreateContainer)?? &&  equipment.autoCreateContainer)||(equipment_autoCreateContainer_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="equipment.autoCreateContainer_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="equipment.autoCreateContainer"]');
												CUI('input[name="equipment.autoCreateContainer_check"]').each(function(){
													if(this.checked) {
														tempObj.val('true');
													} else {
														tempObj.val('false');
													}
												});
											});
										}catch(e){}	
									});
								</script>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1524636521326')}" >${getText('MESBasic.propertydisplayName.randon1524636521326')}</label>
				</td>
				
						<#assign equipment_installPlace_name_defaultValue  = ''>
														<#assign equipment_installPlace_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1524637446337')}" viewType="${viewType!}" deValue="${equipment_installPlace_name_defaultValue!}" conditionfunc="MESBasic.equipManage.equipment.mainView._querycustomFunc('equipment_installPlace_name')" view=true  value="${(equipment.installPlace.name)!}" displayFieldName="name" name="equipment.installPlace.name" id="equipment_installPlace_name" type="other" url="/MESBasic/area/area/areaRefLayout.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_equipManage_equipment_mainView_form" editCustomCallback=";" refViewCode="MESBasic_1_area_areaRefLayout" onkeyupfuncname=";_callback_equipment_installPlace_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(equipment.id)?? && (equipment.installPlace.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${equipment.installPlace.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_equipManage_equipment_mainView_form',obj, 'equipment.installPlace', '/MESBasic/area/area/areaRefLayout.action');
												CUI.commonFills('MESBasic_equipManage_equipment_mainView_form', 'equipment.installPlace',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1426566901887')}" >${getText('MESBasic.propertydisplayName.randon1426566901887')}</label>
				</td>
				
						<#assign equipment_eamUseDeptId_name_defaultValue  = ''>
														<#assign equipment_eamUseDeptId_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.department.reference')}" viewType="${viewType!}" deValue="${equipment_eamUseDeptId_name_defaultValue!}" conditionfunc="MESBasic.equipManage.equipment.mainView._querycustomFunc('equipment_eamUseDeptId_name')" view=true  value="${(equipment.eamUseDeptId.name)!}" displayFieldName="name" name="equipment.eamUseDeptId.name" id="equipment_eamUseDeptId_name" type="Department" url="/foundation/department/common/departmentListFrame.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_equipManage_equipment_mainView_form" editCustomCallback=";" refViewCode="sysbase_1.0_department_deptref" onkeyupfuncname=";_callback_equipment_eamUseDeptId_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (equipment_eamUseDeptId_name_defaultValue)=='currentDepart'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.mainPosition.department.id}'};
											obj = foundation.common.getObject('MESBasic_equipManage_equipment_mainView_form',obj, 'equipment.eamUseDeptId', '/foundation/department/common/departmentListFrame.action');
											CUI.commonFills('MESBasic_equipManage_equipment_mainView_form', 'equipment.eamUseDeptId',obj,true);
											$('input:hidden[name="equipment.eamUseDeptId.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(equipment.id)?? && (equipment.eamUseDeptId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${equipment.eamUseDeptId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_equipManage_equipment_mainView_form',obj, 'equipment.eamUseDeptId', '/foundation/department/common/departmentListFrame.action');
												CUI.commonFills('MESBasic_equipManage_equipment_mainView_form', 'equipment.eamUseDeptId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1426552861601')}" >${getText('MESBasic.propertydisplayName.randon1426552861601')}</label>
				</td>
				
						<#assign equipment_eamDutyStaffId_name_defaultValue  = ''>
														<#assign equipment_eamDutyStaffId_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.view.reference')}" viewType="${viewType!}" deValue="${equipment_eamDutyStaffId_name_defaultValue!}" conditionfunc="MESBasic.equipManage.equipment.mainView._querycustomFunc('equipment_eamDutyStaffId_name')" view=true  value="${(equipment.eamDutyStaffId.name)!}" displayFieldName="name" name="equipment.eamDutyStaffId.name" id="equipment_eamDutyStaffId_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_equipManage_equipment_mainView_form" editCustomCallback=";" refViewCode="sysbase_1.0_staff_ref" onkeyupfuncname=";_callback_equipment_eamDutyStaffId_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (equipment_eamDutyStaffId_name_defaultValue)=='currentUser'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.id}'};
											obj = foundation.common.getObject('MESBasic_equipManage_equipment_mainView_form',obj, 'equipment.eamDutyStaffId', '/foundation/staff/common/staffListFrameset.action');
											CUI.commonFills('MESBasic_equipManage_equipment_mainView_form', 'equipment.eamDutyStaffId',obj,true);
											$('input:hidden[name="equipment.eamDutyStaffId.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(equipment.id)?? && (equipment.eamDutyStaffId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${equipment.eamDutyStaffId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_equipManage_equipment_mainView_form',obj, 'equipment.eamDutyStaffId', '/foundation/staff/common/staffListFrameset.action');
												CUI.commonFills('MESBasic_equipManage_equipment_mainView_form', 'equipment.eamDutyStaffId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1426566930503')}" >${getText('MESBasic.propertydisplayName.randon1426566930503')}</label>
				</td>
				
						<#assign equipment_eamUseYear_defaultValue  = ''>
							 							<#assign equipment_eamUseYear_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="equipment.eamUseYear" id="equipment_eamUseYear"  style=";" originalvalue="<#if newObj&& !(equipment.eamUseYear)?has_content>${equipment_eamUseYear_defaultValue!}<#elseif (equipment.eamUseYear)?has_content>#{(equipment.eamUseYear)!; m1M1}</#if>" value="<#if newObj&& !(equipment.eamUseYear)?has_content>${equipment_eamUseYear_defaultValue!}<#elseif (equipment.eamUseYear)?has_content>#{(equipment.eamUseYear)!; m1M1}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1426552820633')}" >${getText('MESBasic.propertydisplayName.randon1426552820633')}</label>
				</td>
				
						<#assign equipment_eamDesignFirm_defaultValue  = ''>
							 							<#assign equipment_eamDesignFirm_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="equipment.eamDesignFirm" id="equipment_eamDesignFirm"  style=";" originalvalue="<#if !newObj || (equipment.eamDesignFirm)?has_content>${(equipment.eamDesignFirm?html)!}<#else>${equipment_eamDesignFirm_defaultValue!}</#if>" value="<#if !newObj || (equipment.eamDesignFirm)?has_content>${(equipment.eamDesignFirm?html)!}<#else>${equipment_eamDesignFirm_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1426566255472')}" >${getText('MESBasic.propertydisplayName.randon1426566255472')}</label>
				</td>
				
						<#assign equipment_eamProduceCode_defaultValue  = ''>
							 							<#assign equipment_eamProduceCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="equipment.eamProduceCode" id="equipment_eamProduceCode"  style=";" originalvalue="<#if !newObj || (equipment.eamProduceCode)?has_content>${(equipment.eamProduceCode?html)!}<#else>${equipment_eamProduceCode_defaultValue!}</#if>" value="<#if !newObj || (equipment.eamProduceCode)?has_content>${(equipment.eamProduceCode?html)!}<#else>${equipment_eamProduceCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1426566599252')}" >${getText('MESBasic.propertydisplayName.randon1426566599252')}</label>
				</td>
				
						<#assign equipment_eamProduceDate_defaultValue  = ''>
							 							<#assign equipment_eamProduceDate_defaultValue  = ''>
					<#if (equipment_eamProduceDate_defaultValue)?? &&(equipment_eamProduceDate_defaultValue)?has_content>
							<#assign equipment_eamProduceDate_defaultValue  = getDefaultDateTime(equipment_eamProduceDate_defaultValue!)?date>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATE"  style="text-align: left;;" >
					
							
							<#if newObj && !(equipment.eamProduceDate)?has_content>
								
								<@datepicker  onchange="" property_type="DATE" cssClass="cui-noborder-input" name="equipment.eamProduceDate" type="date" value="${equipment_eamProduceDate_defaultValue!}" id="equipment.eamProduceDate"  view=true  cssStyle=""  />
								
							<#else>
							<#if (equipment.eamProduceDate)??>
								
								<@datepicker  onchange="" property_type="DATE" cssClass="cui-noborder-input" name="equipment.eamProduceDate" type="date" value="${equipment.eamProduceDate?string('yyyy-MM-dd')}" id="equipment.eamProduceDate"  view=true  cssStyle="" />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATE" cssClass="cui-noborder-input" name="equipment.eamProduceDate" type="date" value="" id="equipment.eamProduceDate" cssStyle=""  view=true />
								
							</#if>
							</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1524892727470')}" >${getText('MESBasic.propertydisplayName.randon1524892727470')}</label>
				</td>
				
						<#assign equipment_areaNum_defaultValue  = ''>
							 							<#assign equipment_areaNum_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="equipment.areaNum" id="equipment_areaNum"  style=";" originalvalue="<#if !newObj || (equipment.areaNum)?has_content>${(equipment.areaNum?html)!}<#else>${equipment_areaNum_defaultValue!}</#if>" value="<#if !newObj || (equipment.areaNum)?has_content>${(equipment.areaNum?html)!}<#else>${equipment_areaNum_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1423967391978')}" >${getText('MESBasic.propertydisplayName.randon1423967391978')}</label>
				</td>
				
						<#assign equipment_demo_defaultValue  = ''>
							 							<#assign equipment_demo_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="3" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly fix-ie7-textarea"><textarea property_type="TEXT" id="equipment_demo" originalvalue="<#if !newObj || (equipment.demo)?has_content>${(equipment.demo?html)!}<#else>${equipment_demo_defaultValue?html}</#if>"  name="equipment.demo" class="cui-noborder-textarea cui-textarea-auto" readonly="readonly" style="height:100px;;" ><#if !newObj || (equipment.demo)?has_content>${(equipment.demo)!}<#else>${equipment_demo_defaultValue}</#if></textarea></div>
							
				</td>
		</tr>
	</table>
</div>				</div>	
				<div class="edit-datatable">	

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-VIEW-MESBasic_1_equipManage_mainView,html,MESBasic_1_equipManage_Equipment,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	MESBasic.equipManage.equipment.mainView.beforeSaveProcess = function(){}
	MESBasic.equipManage.equipment.mainView.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(MESBasic.equipManage.equipment.mainView.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#MESBasic_equipManage_equipment_mainView_form').trigger('beforeSubmit');
		//equipment.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="equipment.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#MESBasic_equipManage_equipment_mainView_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#MESBasic_equipManage_equipment_mainView_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	MESBasic.equipManage.equipment.mainView.validate = function(){
		return true;
	}
	
	
	//打印
	MESBasic.equipManage.equipment.mainView.print = function(url){
			var viewCode = $('input[name="viewCode"]').val();
			var value = "";
			if(viewCode!=undefined && viewCode!=null && viewCode!=''){
				$.ajax({
					url : "/ec/print/getAjaxSetting.action",
					type : 'post',
					async : false,
					data:{"printCookie.type":viewCode},
					success : function(msg) {
						if(msg!=null){
							value = msg.value;
						}
					}
				});
				var values = {};
				if(value!=undefined && value!=null && value != ""){
					values = value.split(/\|/g);
				}
				var data="";
				if(values != null && values.length > 0){
					for(var i=0;i < values.length;i++){
						var item = values[i];
						if(data!=""){
							data = data + "&" + item;
						}else{
							data = item;
						}
					}
				}else{
					data = "mainContent=true&attachmentInfo=true&dealInfo=true";
				}
				
				//var url = document.location.href;
				if(url!=undefined && url != null && url !=''){
					var index = url.indexOf(".action");
					var index0 = url.indexOf(".action?");
					if(index0 != -1){
						data = "&" + data;
					}else{
						data = "?" + data;
					}
					if(index != -1){
						var newUrl = url.substring(0,index) + "Print" + url.substring(index) + data;
						window.open(newUrl);
					}
				}
			}
		}
		
		MESBasic.equipManage.equipment.mainView.saveSetting = function(){
			var url = "/ec/print/saveSetting.action";
			var value = "mainContent="+$('#mainContent').prop('checked')+ "|attachmentInfo="+$('#attachmentInfo').prop('checked') +  "|dealInfo="+$('#dealInfo').prop('checked');
			var flag = false;
			$.ajax({
				url : url,
				type : 'post',
				async : false,
				data:{"printCookie.value": value, "printCookie.type":$('input[name="viewCode"]').val(),"printCookie.id":$('#printCookie_id').val(),"printCookie.version":$('#printCookie_version').val()},
				success : function(json) {flag = true;}
			});
			return flag;
		}
		
		var isPrintSettingDialogShow = false;//判断打印设置窗口是否打开，防止重复打开
		MESBasic.equipManage.equipment.mainView.printSetting = function(){
			if(typeof isPrintSettingDialogShow != 'undefined' && isPrintSettingDialogShow === true){
				return;
			}
			var url = "/ec/print/getSetting.action?printCookie.type=" + $('input[name="viewCode"]').val();
			<#if isWorkflow?? && isWorkflow>
			url = url + "&isWorkflow=true";
			<#else>
			url = url + "&isWorkflow=false";
			</#if>
			<#if isAttachment?? && isAttachment>
			url = url + "&isAttachment=true";
			<#else>
			url = url + "&isAttachment=false";
			</#if>
			MESBasic.equipManage.equipment.mainView.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(MESBasic.equipManage.equipment.mainView.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				MESBasic.equipManage.equipment.mainView.settingDialog.show();
				isPrintSettingDialogShow = true;
		}
	
	//控件版PT选人查看按钮单击事件处理函数
	function dataGridBtnImgClick(sUrl,objNameCustomCondition,sTitle,sPTGridID,nRow,sFieldName,oGrid,customCallBack,crossCompany){
		//保存当前单击事件的对象信息
		var obj = {
			"oGrid" : oGrid,
			"nRow" : nRow - 1,
			"sKey":	sFieldName
		}
		if(customCallBack){
			MESBasic.equipManage.equipment.mainView._customCallBack = customCallBack;
		}
		MESBasic.equipManage.equipment.mainView._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#MESBasic_equipManage_equipment_mainView_fileupload').length == 0) {
				$('body').append('<div id="MESBasic_equipManage_equipment_mainView_fileupload"></div>');
			}
			MESBasic.equipManage.equipment.mainView.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "MESBasic_equipManage_equipment_mainView_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#MESBasic_equipManage_equipment_mainView_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			MESBasic.equipManage.equipment.mainView.infoDialog.show();
			if($('#MESBasic_equipManage_equipment_mainView_fileupload').html() == '') {
				$('#MESBasic_equipManage_equipment_mainView_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=MESBasic_equipManage_equipment&entityCode=MESBasic_1_equipManage&dialogId="+dialogId);
			}
		}
	//参照复制函数
	MESBasic.equipManage.equipment.mainView.referenceCopy = function(objName,url, dialog){
		var callbackName ="MESBasic.equipManage.equipment.mainView.referenceCopyBackInfo";
		MESBasic.equipManage.equipment.mainView.dialog = dialog;
		MESBasic.equipManage.equipment.mainView._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
			iframe:'reference_copy_edit',
			</#if>
			
			url : url,
			title : "${getText('ec.view.property.refview')}",
			params : null
		});
	}
	
	MESBasic.equipManage.equipment.mainView.referenceCopyBackInfo = function(obj){
		if(MESBasic.equipManage.equipment.mainView._dialog){
			MESBasic.equipManage.equipment.mainView._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,MESBasic.equipManage.equipment.mainView.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('MESBasic_equipManage_equipment_mainView_form','MESBasic_equipManage_equipment_mainView_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(MESBasic.equipManage.equipment.mainView.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(MESBasic.equipManage.equipment.mainView.dialog._el).load('/MESBasic/equipManage/equipment/mainView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
						closeLoadPanel();
						try{
							StrutsUtilsOnLoad();
						}catch(e){}
						try{
							if(me._config.onload != undefined) eval(me._config.onload + "(me)");
						}catch(e){}
				});
			});
		}else{
		</#if>
			
			<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
			parent.$( MESBasic.equipManage.equipment.mainView.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + MESBasic.equipManage.equipment.mainView.dialog._config.iframe, MESBasic.equipManage.equipment.mainView.dialog._dialog ).prop( 'src', '/MESBasic/equipManage/equipment/mainView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(MESBasic.equipManage.equipment.mainView.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(MESBasic.equipManage.equipment.mainView.dialog._el).load('/MESBasic/equipManage/equipment/mainView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
					closeLoadPanel();
					try{
						StrutsUtilsOnLoad();
					}catch(e){}
					try{
						if(me._config.onload != undefined) eval(me._config.onload + "(me)");
					}catch(e){}
			});
			</#if>
				
			
		<#if viewType != "readonly">
		}
		</#if>
	};
	
	MESBasic.equipManage.equipment.mainView.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		MESBasic.equipManage.equipment.mainView.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		MESBasic.equipManage.equipment.mainView._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			MESBasic.equipManage.equipment.mainView._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	MESBasic.equipManage.equipment.mainView._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'MESBasic_equipManage_equipment_mainView' + '_' + extraFrameParam;
		var callbackName="";
		MESBasic.equipManage.equipment.mainView._prefix = '';
		MESBasic.equipManage.equipment.mainView._oGrid = oGrid;
		MESBasic.equipManage.equipment.mainView._sUrl = url;
		if(customCallBack){
			MESBasic.equipManage.equipment.mainView._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			MESBasic.equipManage.equipment.mainView.gridEventObj = gridEventObj;
			callbackName = "MESBasic.equipManage.equipment.mainView.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				MESBasic.equipManage.equipment.mainView._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "MESBasic.equipManage.equipment.mainView.getMultiselectCallBackInfo_DG" : "MESBasic.equipManage.equipment.mainView.getcallBackInfo_DG";
			MESBasic.equipManage.equipment.mainView._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				MESBasic.equipManage.equipment.mainView._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="MESBasic.equipManage.equipment.mainView.getcallBackInfo";
		}
		if(MESBasic.equipManage.equipment.mainView._prefix!=''){
			MESBasic.equipManage.equipment.mainView._prefix = MESBasic.equipManage.equipment.mainView._prefix.substring(1);
		}
		if(MESBasic.equipManage.equipment.mainView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.equipManage.equipment.mainView._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof MESBasic.equipManage.equipment.mainView._querycustomFuncN == "function") {
				refparam += MESBasic.equipManage.equipment.mainView._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		MESBasic.equipManage.equipment.mainView._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.equipManage.equipment.mainView._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.equipManage.equipment.mainView.query_"+obj+")!='undefined'") ? eval('MESBasic.equipManage.equipment.mainView.query_'+obj+'()') : null;
		return str;
	
	};
	
	MESBasic.equipManage.equipment.mainView.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('MESBasic_equipManage_equipment_mainView_form',obj[0], MESBasic.equipManage.equipment.mainView._prefix, MESBasic.equipManage.equipment.mainView._sUrl);
		CUI.commonFills('MESBasic_equipManage_equipment_mainView_form',MESBasic.equipManage.equipment.mainView._prefix,obj[0]);

		try{
			if(MESBasic.equipManage.equipment.mainView._customCallBack) {
				eval(MESBasic.equipManage.equipment.mainView._customCallBack);
				MESBasic.equipManage.equipment.mainView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.equipManage.equipment.mainView._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	MESBasic.equipManage.equipment.mainView.getcallBackInfo_DG_IE = function(obj){
		if(MESBasic.equipManage.equipment.mainView._customBeforeCallBack) {
			var flag = eval(MESBasic.equipManage.equipment.mainView._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = MESBasic.equipManage.equipment.mainView.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,MESBasic.equipManage.equipment.mainView._sUrl);
		var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
		for( var i = 0; i < xmlHead.children().length; i++ ){
			var tagName = xmlHead.children()[i].tagName;
			if( tagName.indexOf(rootKey) == 0 ){
				try{
					var value = eval('jsonObj.' + tagName.substring(rootKey.length+1));
				}catch(e){
					var value = eval('jsonObj["' + tagName.substring(rootKey.length+1)+'"]');
				}
				//判断符合条件的key是否存在
				if(value != undefined){
					gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,value);
				}	
			}
		}
		try{
			if(MESBasic.equipManage.equipment.mainView._customCallBack) {
				eval(MESBasic.equipManage.equipment.mainView._customCallBack);
				MESBasic.equipManage.equipment.mainView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.equipManage.equipment.mainView._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	MESBasic.equipManage.equipment.mainView.getcallBackInfo_DG = function(obj){
		if(MESBasic.equipManage.equipment.mainView._customBeforeCallBack) {
			var flag = eval(MESBasic.equipManage.equipment.mainView._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(MESBasic.equipManage.equipment.mainView._currRow).next().length==0){
					MESBasic.equipManage.equipment.mainView._oGrid.addNewRow();
				}	
				MESBasic.equipManage.equipment.mainView._currRow = $(MESBasic.equipManage.equipment.mainView._currRow).next();
				$(MESBasic.equipManage.equipment.mainView._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(MESBasic.equipManage.equipment.mainView._currRow,obj[i],MESBasic.equipManage.equipment.mainView._prefix,MESBasic.equipManage.equipment.mainView._sUrl);
			eval("CUI.commonFills_DG(MESBasic.equipManage.equipment.mainView._currRow,MESBasic.equipManage.equipment.mainView._prefix,obj[i],MESBasic.equipManage.equipment.mainView._oGrid)");
		}
		try{
			if(MESBasic.equipManage.equipment.mainView._customCallBack) {
				eval(MESBasic.equipManage.equipment.mainView._customCallBack);
				MESBasic.equipManage.equipment.mainView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.equipManage.equipment.mainView._dialog.close();
		} catch(e){}
	};
	
	MESBasic.equipManage.equipment.mainView.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(MESBasic.equipManage.equipment.mainView._oGrid, MESBasic.equipManage.equipment.mainView._currRow, MESBasic.equipManage.equipment.mainView._key, MESBasic.equipManage.equipment.mainView._displayFieldName, obj[i])
		}
		try{
			if(MESBasic.equipManage.equipment.mainView._customCallBack) {
				eval(MESBasic.equipManage.equipment.mainView._customCallBack);
				MESBasic.equipManage.equipment.mainView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.equipManage.equipment.mainView._dialog.close();
		} catch(e){}
	};
	
	MESBasic.equipManage.equipment.mainView.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			MESBasic.equipManage.equipment.mainView.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#MESBasic_equipManage_equipment_mainView_form'));
        			}
        	   	}
        	}
      	});
	};
	(function($){
		$(function(){
			isRelateLbl = $("[value='关联容器']");
 autoLbl = $("[value='自动生成容器']");
 cNameLbl = $("[value='容器名称']");	
 isRelateCheck = $("[name='equipment.isRelateContainer_check']");
 autoCheck = $("[name='equipment.autoCreateContainer_check']");
 container = $("#equipment_relateContainer_namediv").parent();

 var id = $('#id').val();
 if(id != null && id != ""){
	autoLbl.hide();
	autoCheck.hide();
}else{
	autoLbl.show();
	autoCheck.show();
}
function isRelateCheck_f(){
	if(isRelateCheck.prop('checked')==false){//不勾选关联容器，则隐藏自动生成容器和容器名称两项
		autoLbl.hide();
		autoCheck.hide();

		cNameLbl.hide();
		container.hide();
	}
	 else{
		if(id == null || id == ""){
			autoLbl.show();
			autoCheck.show();
			autoCheck.attr("checked",false);
		}
		cNameLbl.show();
		container.show();
	}
}
 isRelateCheck.bind('click',isRelateCheck_f)

 function autoCheck_f(){
	 if(autoCheck.prop('checked')==true){
		cNameLbl.hide();
		container.hide();
	}
	 else{
		cNameLbl.show();
		container.show();
	}
}
autoCheck.bind('click',autoCheck_f)

if(isRelateCheck.prop('checked')==false){//不勾选关联容器，则隐藏自动生成容器和容器名称两项
	autoLbl.hide();
	autoCheck.hide();

	cNameLbl.hide();
	container.hide();
}
 else{
	 if(id == null || id == ""){
		autoLbl.show();
		autoCheck.show();
	}
	cNameLbl.show();
	container.show();
}
		});
	})(jQuery);
	MESBasic.equipManage.equipment.mainView.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	MESBasic.equipManage.equipment.mainView.initCount = 0;
	MESBasic.equipManage.equipment.mainView.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#MESBasic_mainView_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('MESBasic_equipManage_equipment_mainView_datagrids');	
		var	conHeight = h-$("#MESBasic_equipManage_equipment_mainView_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#MESBasic_equipManage_equipment_mainView_main_div .edit-panes-s").each(function(index){
			//多页签切换时只计算本页签下的PT高度
			if(nTabIndex != undefined && typeof(nTabIndex) == 'number' && index != nTabIndex){
				return;
			}
			thisHeight = $(this).height();
			var datatableHeight = conHeight - panesHeight;
			if(datagrids&&datagrids.length>index&&datagrids[index].length>0) {
				if(thisHeight > panesHeight) {
					$(this).parent().height(panesHeight);
					$(this).parent().css("overflow-y","auto");
				} else {
					if(thisHeight && thisHeight > 0) {
						$(this).parent().height(thisHeight);
					}
					datatableHeight = conHeight - thisHeight;
				}
			} else {
				if(thisHeight > conHeight) {
					$(this).parent().height(conHeight);
					$(this).parent().css("overflow-y","auto");
				} else if(thisHeight && thisHeight > 0) {
					$(this).parent().height(thisHeight);
				}
			}
			if(datagrids && datagrids.length > 0) {
				if(datagrids[index].length > 0) {
					datatableHeight = datatableHeight - 15;
					var perHeight = datatableHeight/datagrids[index].length;
					for(var dg=0;dg<datagrids[index].length;dg++) {
						
						var dgwidget = eval(datagrids[index][dg]+'Widget');
						
						if(dgwidget) {
							
							dgwidget.setHeight(perHeight - 68 + 20);
							
						} else {
							if(MESBasic.equipManage.equipment.mainView.initCount <= 2) {
								setTimeout(function(){MESBasic.equipManage.equipment.mainView.initSize();}, 200);
								MESBasic.equipManage.equipment.mainView.initCount++;
							}/* else {
								MESBasic.equipManage.equipment.mainView.initCount = 0;
							}*/
						}
					}
				}
			} else {
				//$(this).parent().height(conHeight-30);
				$(this).parent().height(conHeight-7); //为什么减去7呢，因为要跟底部框保持一定的距离 by xudihui
				$(this).parent().css("overflow-y","auto");
			}
		});
	}

	$(function(){
		MESBasic.equipManage.equipment.mainView.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    MESBasic.equipManage.equipment.mainView.initSize(index);
		});
		$(window).bind("dialog.resize",function(){MESBasic.equipManage.equipment.mainView.initSize();});
	});
</script>
<script type="text/javascript">
	

	/* CUSTOM CODE START(view-VIEW-MESBasic_1_equipManage_mainView,js,MESBasic_1_equipManage_Equipment,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>