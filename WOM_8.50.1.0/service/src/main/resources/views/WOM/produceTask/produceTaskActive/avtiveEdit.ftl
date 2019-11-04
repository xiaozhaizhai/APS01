<!-- WOM_7.5.0.0/produceTask/avtiveEdit -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1506664722041')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_produceTask_avtiveEdit,head,WOM_7.5.0.0_produceTask_ProduceTaskActive,WOM_7.5.0.0) -->
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
	CUI.ns('WOM.produceTask.produceTaskActive.avtiveEdit');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign fileuploadType = "Table">
	<#assign fileuploadLinkId = tableInfoId!>
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
<#assign callbackName ="WOM.produceTask.produceTaskActive.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="WOM_produceTask_produceTaskActive_avtiveEdit_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="WOM_produceTask_produceTaskActive_avtiveEdit_form" cssStyle="height:100%;" hiddenField="produceTaskActive.headID.id,produceTaskActive.id,produceTaskActive.productId.id,produceTaskActive.orderProcessId.id," onsubmitMethod="WOM.produceTask.produceTaskActive.avtiveEdit.beforeSubmitMethod()" ecAction="/WOM/produceTask/produceTaskActive/avtiveEdit/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="avtiveEdit">
	<input type="hidden" name="viewCode" value="WOM_7.5.0.0_produceTask_avtiveEdit">
	<input type="hidden" name="datagridKey" value="WOM_produceTask_produceTaskActive_avtiveEdit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="produceTaskActive.version" value="${(produceTaskActive.version)!0}" />
	<input type="hidden" name="produceTaskActive.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
		<input type="hidden" name="produceTaskActive.headID.id" value="${(produceTaskActive.headID.id)!""}"/>
		<input type="hidden" name="produceTaskActive.id" value="${(produceTaskActive.id)!""}"/>
		<input type="hidden" name="produceTaskActive.productId.id" value="${(produceTaskActive.productId.id)!""}"/>
		<input type="hidden" name="produceTaskActive.orderProcessId.id" value="${(produceTaskActive.orderProcessId.id)!""}"/>
	<div id="WOM_avtiveEdit_edit_div" style="height:100%">
		<div id="WOM_produceTask_produceTaskActive_avtiveEdit_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "WOM_produceTask_produceTaskActive_avtiveEdit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=WOM_7.5.0.0_produceTask', null, function(){
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
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1489720649125')}" >${getText('WOM.propertydisplayName.randon1489720649125')}</label>
				</td>
				
						<#assign produceTaskActive_orderProcessId_name_defaultValue  = ''>
														<#assign produceTaskActive_orderProcessId_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('WOM.viewtitle.randon1490685207348')}" viewType="readonly" deValue="${produceTaskActive_orderProcessId_name_defaultValue!}" conditionfunc="WOM.produceTask.produceTaskActive.avtiveEdit._querycustomFunc('produceTaskActive_orderProcessId_name')" view=true  value="${(produceTaskActive.orderProcessId.name)!}" displayFieldName="name" name="produceTaskActive.orderProcessId.name" id="produceTaskActive_orderProcessId_name" type="other" url="/WOM/produceTask/produceTaskProcess/taskProcessRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_produceTask_produceTaskActive_avtiveEdit_form" editCustomCallback=";" refViewCode="WOM_7.5.0.0_produceTask_taskProcessRef"  onkeyupfuncname=";_callback_produceTaskActive_orderProcessId_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(produceTaskActive.id)?? && (produceTaskActive.orderProcessId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${produceTaskActive.orderProcessId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_produceTask_produceTaskActive_avtiveEdit_form',obj, 'produceTaskActive.orderProcessId', '/WOM/produceTask/produceTaskProcess/taskProcessRef.action');
												CUI.commonFills('WOM_produceTask_produceTaskActive_avtiveEdit_form', 'produceTaskActive.orderProcessId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1490683872072')}" >${getText('WOM.propertydisplayName.randon1490683872072')}</label>
				</td>
				
						<#assign produceTaskActive_name_defaultValue  = ''>
							 							<#assign produceTaskActive_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="produceTaskActive.name" id="produceTaskActive_name"  style=";" originalvalue="<#if !newObj || (produceTaskActive.name)?has_content>${(produceTaskActive.name?html)!}<#else>${produceTaskActive_name_defaultValue!}</#if>" value="<#if !newObj || (produceTaskActive.name)?has_content>${(produceTaskActive.name?html)!}<#else>${produceTaskActive_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1489726359628')}" >${getText('WOM.propertydisplayName.randon1489726359628')}</label>
				</td>
				
						<#assign produceTaskActive_activeType_defaultValue  = 'activeType/activeType3'>
							 					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${produceTaskActive_activeType_defaultValue!}" formId="WOM_produceTask_produceTaskActive_avtiveEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="produceTaskActive.activeType.id" code="activeType" value="${(produceTaskActive.activeType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="WOM_produceTask_produceTaskActive_avtiveEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="produceTaskActive.activeType.id" code="activeType" value="${(produceTaskActive.activeType.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon15063045657471231223')}" >${getText('WOM.propertydisplayName.randon15063045657471231223')}</label>
				</td>
				
						<#assign produceTaskActive_isBackMix_defaultValue  = ''>
							 							<#assign produceTaskActive_isBackMix_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="produceTaskActive.isBackMix_check" originalvalue="<#if !newObj><#if (produceTaskActive.isBackMix)??>${(produceTaskActive.isBackMix!false)?string('true','false')}<#else>false</#if><#elseif produceTaskActive_isBackMix_defaultValue?has_content>${(produceTaskActive_isBackMix_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (produceTaskActive.isBackMix)??>${(produceTaskActive.isBackMix!false)?string('true','false')}<#else>false</#if><#else>${(produceTaskActive_isBackMix_defaultValue!true)?string}</#if>"  />
								
								<input property_type="BOOLEAN" type="hidden" name="produceTaskActive.isBackMix" originalvalue="<#if ((produceTaskActive.isBackMix)?? &&  produceTaskActive.isBackMix)||(produceTaskActive_isBackMix_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((produceTaskActive.isBackMix)?? &&  produceTaskActive.isBackMix)||(produceTaskActive_isBackMix_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="produceTaskActive.isBackMix_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="produceTaskActive.isBackMix"]');
												CUI('input[name="produceTaskActive.isBackMix_check"]').each(function(){
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415772644833')}" >${getText('MESBasic.propertydisplayName.radion1415772644833')}</label>
				</td>
				
						<#assign produceTaskActive_productId_productCode_defaultValue  = ''>
														<#assign produceTaskActive_productId_productCode_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}" viewType="${viewType!}" deValue="${produceTaskActive_productId_productCode_defaultValue!}" conditionfunc="WOM.produceTask.produceTaskActive.avtiveEdit._querycustomFunc('produceTaskActive_productId_productCode')"  value="${(produceTaskActive.productId.productCode)!}" displayFieldName="productCode" name="produceTaskActive.productId.productCode" id="produceTaskActive_productId_productCode" type="other" url="/MESBasic/product/product/productRefNew.action" clicked=true multiple=false mnewidth=260 formId="WOM_produceTask_produceTaskActive_avtiveEdit_form" editCustomCallback=";" refViewCode="MESBasic_1_product_productRefNew" onkeyupfuncname=";_callback_produceTaskActive_productId_productCode(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(produceTaskActive.id)?? && (produceTaskActive.productId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${produceTaskActive.productId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_produceTask_produceTaskActive_avtiveEdit_form',obj, 'produceTaskActive.productId', '/MESBasic/product/product/productRefNew.action');
												CUI.commonFills('WOM_produceTask_produceTaskActive_avtiveEdit_form', 'produceTaskActive.productId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415772740737')}" >${getText('MESBasic.propertydisplayName.radion1415772740737')}</label>
				</td>
				
						<#assign produceTaskActive_productId_productName_defaultValue  = ''>
														<#assign produceTaskActive_productId_productName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="produceTaskActive.productId.productName" id="produceTaskActive_productId_productName"  style=";" originalvalue="<#if !newObj || (produceTaskActive.productId.productName)?has_content>${(produceTaskActive.productId.productName?html)!}<#else>${produceTaskActive_productId_productName_defaultValue!}</#if>" value="<#if !newObj || (produceTaskActive.productId.productName)?has_content>${(produceTaskActive.productId.productName?html)!}<#else>${produceTaskActive_productId_productName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1489730174515')}" >${getText('WOM.propertydisplayName.randon1489730174515')}</label>
				</td>
				
						<#assign produceTaskActive_planNum_defaultValue  = ''>
							 							<#assign produceTaskActive_planNum_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="produceTaskActive.planNum" id="produceTaskActive_planNum"  style=";" originalvalue="<#if newObj&& !(produceTaskActive.planNum)?has_content>${produceTaskActive_planNum_defaultValue!}<#elseif (produceTaskActive.planNum)?has_content>#{(produceTaskActive.planNum)!; m2M2}</#if>" value="<#if newObj&& !(produceTaskActive.planNum)?has_content>${produceTaskActive_planNum_defaultValue!}<#elseif (produceTaskActive.planNum)?has_content>#{(produceTaskActive.planNum)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#produceTaskActive_planNum').unbind('blur').bind('blur',function(){
										var percision = 2;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("WOM.propertydisplayName.randon1489730174515")}')}");
											return;
										}
										if(parseInt(percision) > -1 && $(this).val()!=undefined && $(this).val()!='' && isDecimal($(this).val())){
											$(this).val(($(this).val() * 1).toFixed(percision));
										}
									});
								});
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1398235640483')}" >${getText('X6Basic.propertydisplayName.radion1398235640483')}</label>
				</td>
				
						<#assign produceTaskActive_productId_productBaseUnit_name_defaultValue  = ''>
														<#assign produceTaskActive_productId_productBaseUnit_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="produceTaskActive.productId.productBaseUnit.name" id="produceTaskActive_productId_productBaseUnit_name"  style=";" originalvalue="<#if !newObj || (produceTaskActive.productId.productBaseUnit.name)?has_content>${(produceTaskActive.productId.productBaseUnit.name?html)!}<#else>${produceTaskActive_productId_productBaseUnit_name_defaultValue!}</#if>" value="<#if !newObj || (produceTaskActive.productId.productBaseUnit.name)?has_content>${(produceTaskActive.productId.productBaseUnit.name?html)!}<#else>${produceTaskActive_productId_productBaseUnit_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1490923729119')}" >${getText('WOM.propertydisplayName.randon1490923729119')}</label>
				</td>
				
						<#assign produceTaskActive_exeSystem_defaultValue  = 'RMsystem/system2'>
							 					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${produceTaskActive_exeSystem_defaultValue!}" formId="WOM_produceTask_produceTaskActive_avtiveEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="produceTaskActive.exeSystem.id" code="RMsystem" value="${(produceTaskActive.exeSystem.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="WOM_produceTask_produceTaskActive_avtiveEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="produceTaskActive.exeSystem.id" code="RMsystem" value="${(produceTaskActive.exeSystem.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1497502665124')}" >${getText('WOM.propertydisplayName.randon1497502665124')}</label>
				</td>
				
						<#assign produceTaskActive_mobileTerminal_defaultValue  = ''>
							 							<#assign produceTaskActive_mobileTerminal_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="produceTaskActive.mobileTerminal_check" originalvalue="<#if !newObj><#if (produceTaskActive.mobileTerminal)??>${(produceTaskActive.mobileTerminal!false)?string('true','false')}<#else>false</#if><#elseif produceTaskActive_mobileTerminal_defaultValue?has_content>${(produceTaskActive_mobileTerminal_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (produceTaskActive.mobileTerminal)??>${(produceTaskActive.mobileTerminal!false)?string('true','false')}<#else>false</#if><#else>${(produceTaskActive_mobileTerminal_defaultValue!true)?string}</#if>"  />
								
								<input property_type="BOOLEAN" type="hidden" name="produceTaskActive.mobileTerminal" originalvalue="<#if ((produceTaskActive.mobileTerminal)?? &&  produceTaskActive.mobileTerminal)||(produceTaskActive_mobileTerminal_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((produceTaskActive.mobileTerminal)?? &&  produceTaskActive.mobileTerminal)||(produceTaskActive_mobileTerminal_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="produceTaskActive.mobileTerminal_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="produceTaskActive.mobileTerminal"]');
												CUI('input[name="produceTaskActive.mobileTerminal_check"]').each(function(){
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
		</tr>
	</table>
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="display:none;">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td></tr>
		<tr class="dialog_tr">
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1506493014226')}" >${getText('WOM.propertydisplayName.randon1506493014226')}</label>
				</td>
				
						<#assign produceTaskActive_activeSource_defaultValue  = 'womActiveSource/02'>
							 					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${produceTaskActive_activeSource_defaultValue!}" formId="WOM_produceTask_produceTaskActive_avtiveEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="produceTaskActive.activeSource.id" code="womActiveSource" value="${(produceTaskActive.activeSource.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="WOM_produceTask_produceTaskActive_avtiveEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="produceTaskActive.activeSource.id" code="womActiveSource" value="${(produceTaskActive.activeSource.id)!}"  />
									
								</#if>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.zldgxid1231231231233')}" >${getText('WOM.zldgxid1231231231233')}</label>
				</td>
				
						<#assign produceTaskActive_orderProcessId_id_defaultValue  = ''>
														<#assign produceTaskActive_orderProcessId_id_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="LONG" name="produceTaskActive.orderProcessId.id" id="produceTaskActive_orderProcessId_id"  style=";" originalvalue="<#if !newObj || (produceTaskActive.orderProcessId.id)?has_content>${(produceTaskActive.orderProcessId.id?html)!}<#else>${produceTaskActive_orderProcessId_id_defaultValue!}</#if>" value="<#if !newObj || (produceTaskActive.orderProcessId.id)?has_content>${(produceTaskActive.orderProcessId.id?html)!}<#else>${produceTaskActive_orderProcessId_id_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.biaotouID12345654321')}" >${getText('WOM.biaotouID12345654321')}</label>
				</td>
				
						<#assign produceTaskActive_headID_id_defaultValue  = ''>
														<#assign produceTaskActive_headID_id_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="LONG" mneenable=false reftitle="${getText('WOM.viewtitle.randon1489737198145')}" viewType="readonly" deValue="${produceTaskActive_headID_id_defaultValue!}" conditionfunc="WOM.produceTask.produceTaskActive.avtiveEdit._querycustomFunc('produceTaskActive_headID_id')" view=true  value="${(produceTaskActive.headID.id)!}" displayFieldName="id" name="produceTaskActive.headID.id" id="produceTaskActive_headID_id" type="other" url="/WOM/produceTask/produceTask/taskRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_produceTask_produceTaskActive_avtiveEdit_form" editCustomCallback=";" refViewCode="WOM_7.5.0.0_produceTask_taskRef"  onkeyupfuncname=";_callback_produceTaskActive_headID_id(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(produceTaskActive.id)?? && (produceTaskActive.headID.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${produceTaskActive.headID.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_produceTask_produceTaskActive_avtiveEdit_form',obj, 'produceTaskActive.headID', '/WOM/produceTask/produceTask/taskRef.action');
												CUI.commonFills('WOM_produceTask_produceTaskActive_avtiveEdit_form', 'produceTaskActive.headID',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1503996516434')}" >${getText('WOM.propertydisplayName.randon1503996516434')}</label>
				</td>
				
						<#assign produceTaskActive_property_defaultValue  = 'RMproperty/property1'>
							 					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${produceTaskActive_property_defaultValue!}" formId="WOM_produceTask_produceTaskActive_avtiveEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="produceTaskActive.property.id" code="RMproperty" value="${(produceTaskActive.property.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="WOM_produceTask_produceTaskActive_avtiveEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="produceTaskActive.property.id" code="RMproperty" value="${(produceTaskActive.property.id)!}"  />
									
								</#if>
							
				</td>
		</tr>
	</table>
</div>				</div>	
				<div class="edit-datatable">	

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_produceTask_avtiveEdit,html,WOM_7.5.0.0_produceTask_ProduceTaskActive,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	WOM.produceTask.produceTaskActive.avtiveEdit.beforeSaveProcess = function(){}
	WOM.produceTask.produceTaskActive.avtiveEdit.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(WOM.produceTask.produceTaskActive.avtiveEdit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#WOM_produceTask_produceTaskActive_avtiveEdit_form').trigger('beforeSubmit');
		//produceTaskActive.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="produceTaskActive.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#WOM_produceTask_produceTaskActive_avtiveEdit_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#WOM_produceTask_produceTaskActive_avtiveEdit_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	WOM.produceTask.produceTaskActive.avtiveEdit.validate = function(){
		return true;
	}
	
	
	//打印
	WOM.produceTask.produceTaskActive.avtiveEdit.print = function(url){
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
		
		WOM.produceTask.produceTaskActive.avtiveEdit.saveSetting = function(){
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
		WOM.produceTask.produceTaskActive.avtiveEdit.printSetting = function(){
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
			WOM.produceTask.produceTaskActive.avtiveEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(WOM.produceTask.produceTaskActive.avtiveEdit.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				WOM.produceTask.produceTaskActive.avtiveEdit.settingDialog.show();
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
			WOM.produceTask.produceTaskActive.avtiveEdit._customCallBack = customCallBack;
		}
		WOM.produceTask.produceTaskActive.avtiveEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#WOM_produceTask_produceTaskActive_avtiveEdit_fileupload').length == 0) {
				$('body').append('<div id="WOM_produceTask_produceTaskActive_avtiveEdit_fileupload"></div>');
			}
			WOM.produceTask.produceTaskActive.avtiveEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "WOM_produceTask_produceTaskActive_avtiveEdit_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#WOM_produceTask_produceTaskActive_avtiveEdit_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			WOM.produceTask.produceTaskActive.avtiveEdit.infoDialog.show();
			if($('#WOM_produceTask_produceTaskActive_avtiveEdit_fileupload').html() == '') {
				$('#WOM_produceTask_produceTaskActive_avtiveEdit_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=WOM_produceTask_produceTaskActive&entityCode=WOM_7.5.0.0_produceTask&dialogId="+dialogId);
			}
		}
	//参照复制函数
	WOM.produceTask.produceTaskActive.avtiveEdit.referenceCopy = function(objName,url, dialog){
		var callbackName ="WOM.produceTask.produceTaskActive.avtiveEdit.referenceCopyBackInfo";
		WOM.produceTask.produceTaskActive.avtiveEdit.dialog = dialog;
		WOM.produceTask.produceTaskActive.avtiveEdit._dialog = foundation.common.select({
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
	
	WOM.produceTask.produceTaskActive.avtiveEdit.referenceCopyBackInfo = function(obj){
		if(WOM.produceTask.produceTaskActive.avtiveEdit._dialog){
			WOM.produceTask.produceTaskActive.avtiveEdit._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,WOM.produceTask.produceTaskActive.avtiveEdit.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('WOM_produceTask_produceTaskActive_avtiveEdit_form','WOM_produceTask_produceTaskActive_avtiveEdit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(WOM.produceTask.produceTaskActive.avtiveEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(WOM.produceTask.produceTaskActive.avtiveEdit.dialog._el).load('/WOM/produceTask/produceTaskActive/avtiveEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( WOM.produceTask.produceTaskActive.avtiveEdit.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + WOM.produceTask.produceTaskActive.avtiveEdit.dialog._config.iframe, WOM.produceTask.produceTaskActive.avtiveEdit.dialog._dialog ).prop( 'src', '/WOM/produceTask/produceTaskActive/avtiveEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(WOM.produceTask.produceTaskActive.avtiveEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(WOM.produceTask.produceTaskActive.avtiveEdit.dialog._el).load('/WOM/produceTask/produceTaskActive/avtiveEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	WOM.produceTask.produceTaskActive.avtiveEdit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		WOM.produceTask.produceTaskActive.avtiveEdit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		WOM.produceTask.produceTaskActive.avtiveEdit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			WOM.produceTask.produceTaskActive.avtiveEdit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	WOM.produceTask.produceTaskActive.avtiveEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'WOM_produceTask_produceTaskActive_avtiveEdit' + '_' + extraFrameParam;
		var callbackName="";
		WOM.produceTask.produceTaskActive.avtiveEdit._prefix = '';
		WOM.produceTask.produceTaskActive.avtiveEdit._oGrid = oGrid;
		WOM.produceTask.produceTaskActive.avtiveEdit._sUrl = url;
		if(customCallBack){
			WOM.produceTask.produceTaskActive.avtiveEdit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			WOM.produceTask.produceTaskActive.avtiveEdit.gridEventObj = gridEventObj;
			callbackName = "WOM.produceTask.produceTaskActive.avtiveEdit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				WOM.produceTask.produceTaskActive.avtiveEdit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "WOM.produceTask.produceTaskActive.avtiveEdit.getMultiselectCallBackInfo_DG" : "WOM.produceTask.produceTaskActive.avtiveEdit.getcallBackInfo_DG";
			WOM.produceTask.produceTaskActive.avtiveEdit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				WOM.produceTask.produceTaskActive.avtiveEdit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="WOM.produceTask.produceTaskActive.avtiveEdit.getcallBackInfo";
		}
		if(WOM.produceTask.produceTaskActive.avtiveEdit._prefix!=''){
			WOM.produceTask.produceTaskActive.avtiveEdit._prefix = WOM.produceTask.produceTaskActive.avtiveEdit._prefix.substring(1);
		}
		if(WOM.produceTask.produceTaskActive.avtiveEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.produceTask.produceTaskActive.avtiveEdit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof WOM.produceTask.produceTaskActive.avtiveEdit._querycustomFuncN == "function") {
				refparam += WOM.produceTask.produceTaskActive.avtiveEdit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		WOM.produceTask.produceTaskActive.avtiveEdit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	WOM.produceTask.produceTaskActive.avtiveEdit._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.produceTask.produceTaskActive.avtiveEdit.query_"+obj+")!='undefined'") ? eval('WOM.produceTask.produceTaskActive.avtiveEdit.query_'+obj+'()') : null;
		return str;
	
	};
	
	WOM.produceTask.produceTaskActive.avtiveEdit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('WOM_produceTask_produceTaskActive_avtiveEdit_form',obj[0], WOM.produceTask.produceTaskActive.avtiveEdit._prefix, WOM.produceTask.produceTaskActive.avtiveEdit._sUrl);
		CUI.commonFills('WOM_produceTask_produceTaskActive_avtiveEdit_form',WOM.produceTask.produceTaskActive.avtiveEdit._prefix,obj[0]);

		try{
			if(WOM.produceTask.produceTaskActive.avtiveEdit._customCallBack) {
				eval(WOM.produceTask.produceTaskActive.avtiveEdit._customCallBack);
				WOM.produceTask.produceTaskActive.avtiveEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			WOM.produceTask.produceTaskActive.avtiveEdit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	WOM.produceTask.produceTaskActive.avtiveEdit.getcallBackInfo_DG_IE = function(obj){
		if(WOM.produceTask.produceTaskActive.avtiveEdit._customBeforeCallBack) {
			var flag = eval(WOM.produceTask.produceTaskActive.avtiveEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = WOM.produceTask.produceTaskActive.avtiveEdit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,WOM.produceTask.produceTaskActive.avtiveEdit._sUrl);
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
			if(WOM.produceTask.produceTaskActive.avtiveEdit._customCallBack) {
				eval(WOM.produceTask.produceTaskActive.avtiveEdit._customCallBack);
				WOM.produceTask.produceTaskActive.avtiveEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			WOM.produceTask.produceTaskActive.avtiveEdit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	WOM.produceTask.produceTaskActive.avtiveEdit.getcallBackInfo_DG = function(obj){
		if(WOM.produceTask.produceTaskActive.avtiveEdit._customBeforeCallBack) {
			var flag = eval(WOM.produceTask.produceTaskActive.avtiveEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(WOM.produceTask.produceTaskActive.avtiveEdit._currRow).next().length==0){
					WOM.produceTask.produceTaskActive.avtiveEdit._oGrid.addNewRow();
				}	
				WOM.produceTask.produceTaskActive.avtiveEdit._currRow = $(WOM.produceTask.produceTaskActive.avtiveEdit._currRow).next();
				$(WOM.produceTask.produceTaskActive.avtiveEdit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(WOM.produceTask.produceTaskActive.avtiveEdit._currRow,obj[i],WOM.produceTask.produceTaskActive.avtiveEdit._prefix,WOM.produceTask.produceTaskActive.avtiveEdit._sUrl);
			eval("CUI.commonFills_DG(WOM.produceTask.produceTaskActive.avtiveEdit._currRow,WOM.produceTask.produceTaskActive.avtiveEdit._prefix,obj[i],WOM.produceTask.produceTaskActive.avtiveEdit._oGrid)");
		}
		try{
			if(WOM.produceTask.produceTaskActive.avtiveEdit._customCallBack) {
				eval(WOM.produceTask.produceTaskActive.avtiveEdit._customCallBack);
				WOM.produceTask.produceTaskActive.avtiveEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			WOM.produceTask.produceTaskActive.avtiveEdit._dialog.close();
		} catch(e){}
	};
	
	WOM.produceTask.produceTaskActive.avtiveEdit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(WOM.produceTask.produceTaskActive.avtiveEdit._oGrid, WOM.produceTask.produceTaskActive.avtiveEdit._currRow, WOM.produceTask.produceTaskActive.avtiveEdit._key, WOM.produceTask.produceTaskActive.avtiveEdit._displayFieldName, obj[i])
		}
		try{
			if(WOM.produceTask.produceTaskActive.avtiveEdit._customCallBack) {
				eval(WOM.produceTask.produceTaskActive.avtiveEdit._customCallBack);
				WOM.produceTask.produceTaskActive.avtiveEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			WOM.produceTask.produceTaskActive.avtiveEdit._dialog.close();
		} catch(e){}
	};
	
	WOM.produceTask.produceTaskActive.avtiveEdit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			WOM.produceTask.produceTaskActive.avtiveEdit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#WOM_produceTask_produceTaskActive_avtiveEdit_form'));
        			}
        	   	}
        	}
      	});
	};
	(function($){
		$(function(){
			//新增活动赋值
var  zldgxid=ProduceTaskProcess_dg1489731937175Widget.getCellValue(ProduceTaskProcess_dg1489731937175Widget.getSelectedRow(),"id");
$("input[name='produceTaskActive.orderProcessId.id']").val(zldgxid);
var headId=$("#id").val(); 
$("input[name='produceTaskActive.headID.id']").val(headId);
var gxmc=ProduceTaskProcess_dg1489731937175Widget.getCellValue(ProduceTaskProcess_dg1489731937175Widget.getSelectedRow(),"name");
$("input[name='produceTaskActive.orderProcessId.name']").val(gxmc);
		});
	})(jQuery);
	WOM.produceTask.produceTaskActive.avtiveEdit.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	WOM.produceTask.produceTaskActive.avtiveEdit.initCount = 0;
	WOM.produceTask.produceTaskActive.avtiveEdit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#WOM_avtiveEdit_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('WOM_produceTask_produceTaskActive_avtiveEdit_datagrids');	
		var	conHeight = h-$("#WOM_produceTask_produceTaskActive_avtiveEdit_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#WOM_produceTask_produceTaskActive_avtiveEdit_main_div .edit-panes-s").each(function(index){
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
							
							dgwidget.setHeight(perHeight - 68);
							
						} else {
							if(WOM.produceTask.produceTaskActive.avtiveEdit.initCount <= 2) {
								setTimeout(function(){WOM.produceTask.produceTaskActive.avtiveEdit.initSize();}, 200);
								WOM.produceTask.produceTaskActive.avtiveEdit.initCount++;
							}/* else {
								WOM.produceTask.produceTaskActive.avtiveEdit.initCount = 0;
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
		WOM.produceTask.produceTaskActive.avtiveEdit.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    WOM.produceTask.produceTaskActive.avtiveEdit.initSize(index);
		});
		$(window).bind("dialog.resize",function(){WOM.produceTask.produceTaskActive.avtiveEdit.initSize();});
	});
</script>
<script type="text/javascript">
	

	/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_produceTask_avtiveEdit,js,WOM_7.5.0.0_produceTask_ProduceTaskActive,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>