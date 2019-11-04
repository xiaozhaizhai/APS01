<!-- MESBasic_1/itemManage/itemEdit -->
<#assign isWorkflow = false> 
<#assign isAttachment = true> 
	<#assign  fileuploadType = "MESBasic_itemManage_itemSetup">
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
<#assign userJson= Session.user.toJSON()>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<#-- 实体对象 -->
<#assign tableObj = itemSetup>
<#-- 命名空间 -->
<#assign editPageNs = "MESBasic.itemManage.itemSetup.itemEdit">
<#-- 模型名称-->
<#assign modelName = "itemSetup">
<#-- 视图编码-->
<#assign viewCode = "MESBasic_1_itemManage_itemEdit">
<#-- 实体编码-->
<#assign entity_code = "MESBasic_1_itemManage">
<#-- 视图名称-->
<#assign viewName = "itemEdit">
<#-- datagrid编码-->
<#assign datagridCode = "MESBasic_itemManage_itemSetup_itemEdit_datagrids">
<#-- 首字母大写的模型名称-->
<#assign upcaseModelName = "ItemSetup">
<#-- 页面打印按钮 -->
<#assign isPrint = false>
<#-- 控件打印按钮 -->
<#assign controlPrint = false>
<#-- 是否只读 -->
<#assign allReadOnly = false>
<#-- 是否是参照视图 -->
<#assign isReference =true>
<#-- 是否可弃审 -->
<#assign retrialFlag = false>
<#-- formid -->
<#assign editFormId = "MESBasic_itemManage_itemSetup_itemEdit_form">
<#-- 待办状态 -->
<#assign pendingstatus =( itemSetup.pending.taskDescription)!>
<#-- 打印控件名称 -->
<#assign controlName = "ec.print.controlPrint">
<#-- 批量？？ -->
<#assign isBatch = false>
<#assign payCloseAttention = false>
<#-- 自定义按钮 -->
<#assign operateButtons =[] >
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
	
		
	
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <#assign configTitle = getText('MESBasic.viewtitle.radion1415259648544')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		
		#MESBasic_itemManage_itemSetup_itemEdit_form{float:left;width:100%;}
		
		
		</style>
		<script type="text/javascript">
			CUI.ns('MESBasic.itemManage.itemSetup.itemEdit');
			MESBasic.itemManage.itemSetup.itemEdit.currentUser = ${userJson};
			MESBasic.itemManage.itemSetup.itemEdit.currentStaff = ${staffJson};
			MESBasic.itemManage.itemSetup.itemEdit.currentDepartment = ${deptJson};
			MESBasic.itemManage.itemSetup.itemEdit.currentPosition = ${postJson};
			MESBasic.itemManage.itemSetup.itemEdit.currentCompany = ${compJson};
		</script>
		<!-- CUSTOM CODE START(view-EDIT-MESBasic_1_itemManage_itemEdit,head,MESBasic_1_itemManage_ItemSetup,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
    </head>
	<body class="view-edit mixed">
		<@loadpanel newType=true/>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="itemSetup.unit.id,itemSetup.itemPlace.id,itemSetup.id," onsubmitMethod="MESBasic.itemManage.itemSetup.itemEdit.beforeSubmitMethod()" id="MESBasic_itemManage_itemSetup_itemEdit_form" namespace="/MESBasic/itemManage/itemSetup/itemEdit" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=MESBasic_1_itemManage_ItemSetup&_bapFieldPermissonModelName_=ItemSetup" editPageNs="MESBasic.itemManage.itemSetup.itemEdit" callback="MESBasic.itemManage.itemSetup.itemEdit._callBackInfo" ecform="true">
			<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
			<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="MESBasic_itemManage_itemSetup_itemEdit_main_div">
			<div class="edit-head">
				<#include "../../../ec/tableInfo/operateheadbar_all.ftl" >
				<#include "../../../ec/tableInfo/creatorInfo.ftl" >
			</div>
    		<div class="edit-main" id="MESBasic_itemManage_itemSetup_itemEdit">
    			<div class="edit-content">
    	<#include "../../../ec/tableInfo/formparam.ftl" >				
					<input type="hidden" name="itemSetup.unit.id" value="${(itemSetup.unit.id)!""}" originalvalue="${(itemSetup.unit.id)!""}"/>
					<input type="hidden" name="itemSetup.itemPlace.id" value="${(itemSetup.itemPlace.id)!""}" originalvalue="${(itemSetup.itemPlace.id)!""}"/>
					<input type="hidden" name="itemSetup.id" value="${(itemSetup.id)!""}" originalvalue="${(itemSetup.id)!""}"/>
		<div class="dash-line"></div>
<script type="text/javascript">
var attcountid = "MESBasic_itemManage_itemSetup_itemEdit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=MESBasic_1_itemManage', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>				<div class="edit-panes edit-panes-w edit-container clearfix">

						<div class="cui-elements pd-top mix-content">
							<div class="edit-panes-s edit-panes-init" >
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415261315358')}" >${getText('MESBasic.propertydisplayName.radion1415261315358')}</label>
				</td>
				
						<#assign itemSetup_code_defaultValue  = ''>
							 							<#assign itemSetup_code_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="itemSetup.code" id="itemSetup_code"  style=";" originalvalue="<#if !newObj || (itemSetup.code)?has_content>${(itemSetup.code?html)!}<#else>${itemSetup_code_defaultValue!}</#if>" value="<#if !newObj || (itemSetup.code)?has_content>${(itemSetup.code?html)!}<#else>${itemSetup_code_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415258813793')}" >${getText('MESBasic.propertydisplayName.radion1415258813793')}</label>
				</td>
				
						<#assign itemSetup_itemName_defaultValue  = ''>
							 							<#assign itemSetup_itemName_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="itemSetup.itemName" id="itemSetup_itemName"  style=";" originalvalue="<#if !newObj || (itemSetup.itemName)?has_content>${(itemSetup.itemName?html)!}<#else>${itemSetup_itemName_defaultValue!}</#if>" value="<#if !newObj || (itemSetup.itemName)?has_content>${(itemSetup.itemName?html)!}<#else>${itemSetup_itemName_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1546065490164')}" >${getText('MESBasic.propertydisplayName.randon1546065490164')}</label>
				</td>
				
						<#assign itemSetup_purpose_defaultValue  = 'MESBasic001/01'>
							 					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange="changeStyle()"  viewType="${viewType!}" deValue="${itemSetup_purpose_defaultValue!}" formId="MESBasic_itemManage_itemSetup_itemEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="itemSetup.purpose.id" code="MESBasic001" value="${(itemSetup.purpose.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange="changeStyle()"  viewType="${viewType!}"  formId="MESBasic_itemManage_itemSetup_itemEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="itemSetup.purpose.id" code="MESBasic001" value="${(itemSetup.purpose.id)!}"  />
									
								</#if>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415261562719')}" >${getText('MESBasic.propertydisplayName.radion1415261562719')}</label>
				</td>
				
						<#assign itemSetup_virtualTag_defaultValue  = ''>
							 							<#assign itemSetup_virtualTag_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="itemSetup.virtualTag_check" originalvalue="<#if !newObj><#if (itemSetup.virtualTag)??>${(itemSetup.virtualTag!false)?string('true','false')}<#else>false</#if><#elseif itemSetup_virtualTag_defaultValue?has_content>${(itemSetup_virtualTag_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (itemSetup.virtualTag)??>${(itemSetup.virtualTag!false)?string('true','false')}<#else>false</#if><#else>${(itemSetup_virtualTag_defaultValue!true)?string}</#if>" onchange='changeVirtualTag()' />
								
								<input property_type="BOOLEAN" type="hidden" name="itemSetup.virtualTag" originalvalue="<#if ((itemSetup.virtualTag)?? &&  itemSetup.virtualTag)||(itemSetup_virtualTag_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((itemSetup.virtualTag)?? &&  itemSetup.virtualTag)||(itemSetup_virtualTag_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="itemSetup.virtualTag_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="itemSetup.virtualTag"]');
												CUI('input[name="itemSetup.virtualTag_check"]').each(function(){
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
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1417588204115')}" >${getText('MESBasic.propertydisplayName.radion1417588204115')}</label>
				</td>
				
						<#assign itemSetup_energyType_defaultValue  = ''>
							 							<#assign itemSetup_energyType_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${itemSetup_energyType_defaultValue!}" formId="MESBasic_itemManage_itemSetup_itemEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="itemSetup.energyType.id" code="ItemClass" value="${(itemSetup.energyType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_itemManage_itemSetup_itemEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="itemSetup.energyType.id" code="ItemClass" value="${(itemSetup.energyType.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1416380194525')}" >${getText('MESBasic.propertydisplayName.radion1416380194525')}</label>
				</td>
				
						<#assign itemSetup_itemClass_defaultValue  = ''>
							 							<#assign itemSetup_itemClass_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${itemSetup_itemClass_defaultValue!}" formId="MESBasic_itemManage_itemSetup_itemEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="itemSetup.itemClass.id" code="ITEM_PROPERTY" value="${(itemSetup.itemClass.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_itemManage_itemSetup_itemEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="itemSetup.itemClass.id" code="ITEM_PROPERTY" value="${(itemSetup.itemClass.id)!}"  />
									
								</#if>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1418024623062')}" >${getText('MESBasic.propertydisplayName.radion1418024623062')}</label>
				</td>
				
						<#assign itemSetup_frequency_defaultValue  = ''>
							 							<#assign itemSetup_frequency_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${itemSetup_frequency_defaultValue!}" formId="MESBasic_itemManage_itemSetup_itemEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="itemSetup.frequency.id" code="Frequency" value="${(itemSetup.frequency.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_itemManage_itemSetup_itemEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="itemSetup.frequency.id" code="Frequency" value="${(itemSetup.frequency.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415260997658')}" >${getText('MESBasic.propertydisplayName.radion1415260997658')}</label>
				</td>
				
						<#assign itemSetup_tagType_defaultValue  = ''>
							 							<#assign itemSetup_tagType_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange="changeTagType()"  viewType="${viewType!}" deValue="${itemSetup_tagType_defaultValue!}" formId="MESBasic_itemManage_itemSetup_itemEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="itemSetup.tagType.id" code="TAG_TYPE" value="${(itemSetup.tagType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange="changeTagType()"  viewType="${viewType!}"  formId="MESBasic_itemManage_itemSetup_itemEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="itemSetup.tagType.id" code="TAG_TYPE" value="${(itemSetup.tagType.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415258842136')}" >${getText('MESBasic.propertydisplayName.radion1415258842136')}</label>
				</td>
				
						<#assign itemSetup_itemNumber_defaultValue  = ''>
							 							<#assign itemSetup_itemNumber_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="itemSetup.itemNumber" id="itemSetup_itemNumber"  style=";" originalvalue="<#if !newObj || (itemSetup.itemNumber)?has_content>${(itemSetup.itemNumber?html)!}<#else>${itemSetup_itemNumber_defaultValue!}</#if>" value="<#if !newObj || (itemSetup.itemNumber)?has_content>${(itemSetup.itemNumber?html)!}<#else>${itemSetup_itemNumber_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1418607299231')}" >${getText('MESBasic.propertydisplayName.radion1418607299231')}</label>
				</td>
				
						<#assign itemSetup_itemPlace_placeCode_defaultValue  = ''>
														<#assign itemSetup_itemPlace_placeCode_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.radion1418611854708')}" viewType="${viewType!}" deValue="${itemSetup_itemPlace_placeCode_defaultValue!}" conditionfunc="MESBasic.itemManage.itemSetup.itemEdit._querycustomFunc('itemSetup_itemPlace_placeCode')"  value="${(itemSetup.itemPlace.placeCode)!}" displayFieldName="placeCode" name="itemSetup.itemPlace.placeCode" id="itemSetup_itemPlace_placeCode" type="other" url="/MESBasic/placeManage/placeManage/refrence.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_itemManage_itemSetup_itemEdit_form" editCustomCallback=";" refViewCode="MESBasic_1_placeManage_refrence" onkeyupfuncname=";_callback_itemSetup_itemPlace_placeCode(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(itemSetup.id)?? && (itemSetup.itemPlace.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${itemSetup.itemPlace.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_itemManage_itemSetup_itemEdit_form',obj, 'itemSetup.itemPlace', '/MESBasic/placeManage/placeManage/refrence.action');
												CUI.commonFills('MESBasic_itemManage_itemSetup_itemEdit_form', 'itemSetup.itemPlace',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1418607347494')}" >${getText('MESBasic.propertydisplayName.radion1418607347494')}</label>
				</td>
				
						<#assign itemSetup_itemPlace_placeName_defaultValue  = ''>
														<#assign itemSetup_itemPlace_placeName_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="itemSetup.itemPlace.placeName" id="itemSetup_itemPlace_placeName"  style=";" originalvalue="<#if !newObj || (itemSetup.itemPlace.placeName)?has_content>${(itemSetup.itemPlace.placeName?html)!}<#else>${itemSetup_itemPlace_placeName_defaultValue!}</#if>" value="<#if !newObj || (itemSetup.itemPlace.placeName)?has_content>${(itemSetup.itemPlace.placeName?html)!}<#else>${itemSetup_itemPlace_placeName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1417581113218')}" >${getText('MESBasic.propertydisplayName.radion1417581113218')}</label>
				</td>
				
						<#assign itemSetup_itemPlace_factoryNode_name_defaultValue  = ''>
														<#assign itemSetup_itemPlace_factoryNode_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="itemSetup.itemPlace.factoryNode.name" id="itemSetup_itemPlace_factoryNode_name"  style=";" originalvalue="<#if !newObj || (itemSetup.itemPlace.factoryNode.name)?has_content>${(itemSetup.itemPlace.factoryNode.name?html)!}<#else>${itemSetup_itemPlace_factoryNode_name_defaultValue!}</#if>" value="<#if !newObj || (itemSetup.itemPlace.factoryNode.name)?has_content>${(itemSetup.itemPlace.factoryNode.name?html)!}<#else>${itemSetup_itemPlace_factoryNode_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1417659861793')}" >${getText('MESBasic.propertydisplayName.radion1417659861793')}</label>
				</td>
				
						<#assign itemSetup_dataSouceType_defaultValue  = ''>
							 							<#assign itemSetup_dataSouceType_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${itemSetup_dataSouceType_defaultValue!}" formId="MESBasic_itemManage_itemSetup_itemEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="itemSetup.dataSouceType.id" code="ENERGY_DATA_SOUCE" value="${(itemSetup.dataSouceType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_itemManage_itemSetup_itemEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="itemSetup.dataSouceType.id" code="ENERGY_DATA_SOUCE" value="${(itemSetup.dataSouceType.id)!}"  />
									
								</#if>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1398235640483')}" >${getText('X6Basic.propertydisplayName.radion1398235640483')}</label>
				</td>
				
						<#assign itemSetup_unit_name_defaultValue  = ''>
														<#assign itemSetup_unit_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('X6Basic.viewtitle.radion1398240433147')}" viewType="${viewType!}" deValue="${itemSetup_unit_name_defaultValue!}" conditionfunc="MESBasic.itemManage.itemSetup.itemEdit._querycustomFunc('itemSetup_unit_name')"  value="${(itemSetup.unit.name)!}" displayFieldName="name" name="itemSetup.unit.name" id="itemSetup_unit_name" type="other" url="/X6Basic/unitGroup/baseUnit/unitRef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_itemManage_itemSetup_itemEdit_form" editCustomCallback=";" refViewCode="X6Basic_1.0_unitGroup_unitRef"  onkeyupfuncname=";_callback_itemSetup_unit_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(itemSetup.id)?? && (itemSetup.unit.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${itemSetup.unit.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_itemManage_itemSetup_itemEdit_form',obj, 'itemSetup.unit', '/X6Basic/unitGroup/baseUnit/unitRef.action');
												CUI.commonFills('MESBasic_itemManage_itemSetup_itemEdit_form', 'itemSetup.unit',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415260086763')}" >${getText('MESBasic.propertydisplayName.radion1415260086763')}</label>
				</td>
				
						<#assign itemSetup_active_defaultValue  = 'false'>
							 					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="itemSetup.active_check" originalvalue="<#if !newObj><#if (itemSetup.active)??>${(itemSetup.active!false)?string('true','false')}<#else>false</#if><#elseif itemSetup_active_defaultValue?has_content>${(itemSetup_active_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (itemSetup.active)??>${(itemSetup.active!false)?string('true','false')}<#else>false</#if><#else>${(itemSetup_active_defaultValue!true)?string}</#if>"  />
								
								<input property_type="BOOLEAN" type="hidden" name="itemSetup.active" originalvalue="<#if ((itemSetup.active)?? &&  itemSetup.active)||(itemSetup_active_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((itemSetup.active)?? &&  itemSetup.active)||(itemSetup_active_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="itemSetup.active_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="itemSetup.active"]');
												CUI('input[name="itemSetup.active_check"]').each(function(){
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
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1471831476670')}" >${getText('MESBasic.propertydisplayName.randon1471831476670')}</label>
				</td>
				
						<#assign itemSetup_range_defaultValue  = ''>
							 							<#assign itemSetup_range_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="itemSetup.range" id="itemSetup_range"  style=";" originalvalue="<#if newObj&& !(itemSetup.range)?has_content>${itemSetup_range_defaultValue!}<#elseif (itemSetup.range)?has_content>#{(itemSetup.range)!; m6M6}</#if>" value="<#if newObj&& !(itemSetup.range)?has_content>${itemSetup_range_defaultValue!}<#elseif (itemSetup.range)?has_content>#{(itemSetup.range)!; m6M6}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#itemSetup_range').unbind('blur').bind('blur',function(){
										var percision = 6;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("MESBasic.propertydisplayName.randon1471831476670")}')}");
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415260847531')}" >${getText('MESBasic.propertydisplayName.radion1415260847531')}</label>
				</td>
				
						<#assign itemSetup_delay_defaultValue  = '0'>
							 							<#assign itemSetup_delay_defaultValue  = '0'>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="INTEGER" name="itemSetup.delay" id="itemSetup_delay"  style=";" originalvalue="<#if !newObj || (itemSetup.delay)?has_content>${(itemSetup.delay?html)!}<#else>${itemSetup_delay_defaultValue!}</#if>" value="<#if !newObj || (itemSetup.delay)?has_content>${(itemSetup.delay?html)!}<#else>${itemSetup_delay_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1557734367421')}" >${getText('MESBasic.propertydisplayName.randon1557734367421')}</label>
				</td>
				
						<#assign itemSetup_manuallySet_defaultValue  = ''>
							 							<#assign itemSetup_manuallySet_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="itemSetup.manuallySet_check" originalvalue="<#if !newObj><#if (itemSetup.manuallySet)??>${(itemSetup.manuallySet!false)?string('true','false')}<#else>false</#if><#elseif itemSetup_manuallySet_defaultValue?has_content>${(itemSetup_manuallySet_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (itemSetup.manuallySet)??>${(itemSetup.manuallySet!false)?string('true','false')}<#else>false</#if><#else>${(itemSetup_manuallySet_defaultValue!true)?string}</#if>" onchange='manuallySetOnChange()' />
								
								<input property_type="BOOLEAN" type="hidden" name="itemSetup.manuallySet" originalvalue="<#if ((itemSetup.manuallySet)?? &&  itemSetup.manuallySet)||(itemSetup_manuallySet_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((itemSetup.manuallySet)?? &&  itemSetup.manuallySet)||(itemSetup_manuallySet_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="itemSetup.manuallySet_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="itemSetup.manuallySet"]');
												CUI('input[name="itemSetup.manuallySet_check"]').each(function(){
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
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1557734387533')}" >${getText('MESBasic.propertydisplayName.randon1557734387533')}</label>
				</td>
				
						<#assign itemSetup_compareTime_defaultValue  = ''>
							 							<#assign itemSetup_compareTime_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="itemSetup.compareTime" id="itemSetup_compareTime"  style=";" originalvalue="<#if newObj&& !(itemSetup.compareTime)?has_content>${itemSetup_compareTime_defaultValue!}<#elseif (itemSetup.compareTime)?has_content>#{(itemSetup.compareTime)!; m0M0}</#if>" value="<#if newObj&& !(itemSetup.compareTime)?has_content>${itemSetup_compareTime_defaultValue!}<#elseif (itemSetup.compareTime)?has_content>#{(itemSetup.compareTime)!; m0M0}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#itemSetup_compareTime').unbind('blur').bind('blur',function(){
										var percision = 0;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("MESBasic.propertydisplayName.randon1557734387533")}')}");
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1557734409841')}" >${getText('MESBasic.propertydisplayName.randon1557734409841')}</label>
				</td>
				
						<#assign itemSetup_compareNumber_defaultValue  = ''>
							 							<#assign itemSetup_compareNumber_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="itemSetup.compareNumber" id="itemSetup_compareNumber"  style=";" originalvalue="<#if newObj&& !(itemSetup.compareNumber)?has_content>${itemSetup_compareNumber_defaultValue!}<#elseif (itemSetup.compareNumber)?has_content>#{(itemSetup.compareNumber)!; m4M4}</#if>" value="<#if newObj&& !(itemSetup.compareNumber)?has_content>${itemSetup_compareNumber_defaultValue!}<#elseif (itemSetup.compareNumber)?has_content>#{(itemSetup.compareNumber)!; m4M4}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#itemSetup_compareNumber').unbind('blur').bind('blur',function(){
										var percision = 4;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("MESBasic.propertydisplayName.randon1557734409841")}')}");
											return;
										}
										if(parseInt(percision) > -1 && $(this).val()!=undefined && $(this).val()!='' && isDecimal($(this).val())){
											$(this).val(($(this).val() * 1).toFixed(percision));
										}
									});
								});
							</script>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415260908744')}" >${getText('MESBasic.propertydisplayName.radion1415260908744')}</label>
				</td>
				
						<#assign itemSetup_factor_defaultValue  = ''>
							 							<#assign itemSetup_factor_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="LONGTEXT" name="itemSetup.factor" id="itemSetup_factor"  style=";" originalvalue="<#if !newObj || (itemSetup.factor)?has_content>${(itemSetup.factor?html)!}<#else>${itemSetup_factor_defaultValue!}</#if>" value="<#if !newObj || (itemSetup.factor)?has_content>${(itemSetup.factor?html)!}<#else>${itemSetup_factor_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
				<td nullable=true class="edit-table-symbol"  align="right" style="text-align: right;;" >
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1420006627490')}" >${getText('MESBasic.propertydisplayName.radion1420006627490')}</label>
				</td>
				
				<td nullable=true class="edit-table-symbol"  colspan="5" align="left" style="text-align: left;;" >
							<label style="width:100%;padding-left:5px;;" value="${getText('MESBasic.propertydisplayName.radion1420006648062')}" >${getText('MESBasic.propertydisplayName.radion1420006648062')}</label>
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415258604506')}" >${getText('MESBasic.propertydisplayName.radion1415258604506')}</label>
				</td>
				
						<#assign itemSetup_formula_defaultValue  = ''>
							 							<#assign itemSetup_formula_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" style="text-align: left;;" >
					
							
							<div class="fix-input fix-ie7-textarea"><textarea property_type="LONGTEXT" id="itemSetup_formula" originalvalue="<#if !newObj || (itemSetup.formula)?has_content>${(itemSetup.formula?html)!}<#else>${itemSetup_formula_defaultValue?html}</#if>"  name="itemSetup.formula" class="cui-noborder-textarea cui-textarea-auto" style=";" ><#if !newObj || (itemSetup.formula)?has_content>${(itemSetup.formula)!}<#else>${itemSetup_formula_defaultValue}</#if></textarea></div>
							
				</td>
				</tr><tr >
				<td nullable=true class="edit-table-symbol"  align="right" style="text-align: right;;" >
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1418707675105')}" >${getText('MESBasic.propertydisplayName.radion1418707675105')}</label>
				</td>
				
				<td nullable=true class="edit-table-symbol"  colspan="5" align="left" style="text-align: left;;" >
							<label style="width:100%;padding-left:5px;;" value="${getText('MESBasic.propertydisplayName.radion1420007057163')}" >${getText('MESBasic.propertydisplayName.radion1420007057163')}</label>
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415258783594')}" >${getText('MESBasic.propertydisplayName.radion1415258783594')}</label>
				</td>
				
						<#assign itemSetup_itemMemo_defaultValue  = ''>
							 							<#assign itemSetup_itemMemo_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" style="text-align: left;;" >
					
							
							<div class="fix-input fix-ie7-textarea"><textarea property_type="LONGTEXT" id="itemSetup_itemMemo" originalvalue="<#if !newObj || (itemSetup.itemMemo)?has_content>${(itemSetup.itemMemo?html)!}<#else>${itemSetup_itemMemo_defaultValue?html}</#if>"  name="itemSetup.itemMemo" class="cui-noborder-textarea cui-textarea-auto" style=";" ><#if !newObj || (itemSetup.itemMemo)?has_content>${(itemSetup.itemMemo)!}<#else>${itemSetup_itemMemo_defaultValue}</#if></textarea></div>
							
				</td>
				</tr><tr >
						<#assign complex_datagrid_1458637676349_defaultValue  = ''>
				<td nullable=false class="edit-table-content"  colspan="6" style="text-align: left;;" >
				</td>
		</tr>
	</table>
							</div>
						</div>
						<div class="edit-datatable mix-content">

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
					
				
					<#if  refId?? && (refId > 0)>
						<#assign nodeExpanded = true>
					<#else>
						<#assign nodeExpanded = false>
					</#if>
					
				<#if newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign exportExcel=false>
				<#else>
				<#assign exportExcel=false>
				</#if>
			<#if false>
				<#assign routeFlag = "2">
			<#else>
				<#if false && isIE>
						<#assign routeFlag = "1">
				<#else>
						<#assign routeFlag = "0">
				</#if>
			</#if>

			<#assign cpObjHideKey = '' >
			<#assign cpvmInfo = ''>
			
							<script type="text/javascript">
								function ItemPart_dg1458633704446_itemSetupRef(event)
																{

	var widget = ItemPart_dg1458633704446Widget;
	if(widget.getRowLength() == 2){
		workbenchErrorBarWidget.showMessage("不允许关联超过两个以上的相关测点!", 'f');
    	return false;
	}
	
    var refparam = "crossCompanyFlag=false";
    itemSetup_dialog = foundation.common.select({
        pageType : 'other',
        closePage : false,
        multiSelect: true,
        callBackFuncName:'itemSetup_callback',
        url : '/MESBasic/itemManage/itemSetup/nonEnergyOnlyRef.action',
        title:'测点参照',
        params : refparam
    });
    itemSetup_dialog.show();
}
							</script>
								
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/MESBasic/itemManage/itemSetup/data-dg1458633704446.action?itemSetup.id=${refId!-1}&refId=${refId!-1}&datagridCode=MESBasic_1_itemManage_itemEditdg1458633704446">
			<#else>
				<#assign dUrl="/MESBasic/itemManage/itemSetup/data-dg1458633704446.action?itemSetup.id=${(itemSetup.id)!-1}&datagridCode=MESBasic_1_itemManage_itemEditdg1458633704446">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('MESBasic.buttonPropertyshowName.radion1557836184604')}\",handler:function(event){ItemPart_dg1458633704446_itemSetupRef(event)},iconClass:\"cui-btn-eighteen-dt-op-reference\",useInMore:\"false\"},{text:\"${getText('MESBasic.buttonPropertyshowName.radion1557734669586')}\",handler:function(event){DT_ItemPart_dg1458633704446_deldatagrid();},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('MESBasic.buttonPropertyshowName.radion1557836184604')}\",handler:function(event){ItemPart_dg1458633704446_itemSetupRef(event)},iconClass:\"cui-btn-eighteen-dt-op-reference\",useInMore:\"false\"},{text:\"${getText('MESBasic.buttonPropertyshowName.radion1557734669586')}\",handler:function(event){DT_ItemPart_dg1458633704446_deldatagrid();},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_ItemPart_dg1458633704446" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1458633704446_id" value="ItemPart_dg1458633704446" />
			
			<input type="hidden" id="dg1458633704446_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('MESBasic.modelname.radion1415259448384')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/MESBasic/itemManage/itemSetup/data-dg1458633704446.action?operateType=export&datagridCode=MESBasic_1_itemManage_itemEditdg1458633704446"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="ItemPart_dg1458633704446" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="ItemPart_dg1458633704446" viewType="${viewType}" renderOverEvent="dg1458633704446RenderOverEvent" route="${routeFlag}" formId="MESBasic_itemManage_itemSetup_itemEdit_form" noPermissionKeys="itemView.code,itemView.itemName,itemView.itemNumber,itemNumber,itemStatus" modelCode="MESBasic_1_itemManage_ItemPart" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1458633704446" dtPage="dgPage"  hidekeyPrefix="dg1458633704446" hidekey="['id','version','itemView.id','itemView.code','itemView.id','itemView.itemName','itemView.id','itemView.itemNumber'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1458633704446PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName  activexButton="MESBasic.buttonPropertyshowName.radion1557836184604,itemSetupRef,eighteen-dt-op-reference;MESBasic.buttonPropertyshowName.radion1557734669586,DELETEROW,del" exportExcel=exportExcel addNewRow=false  displayRowsCount=10  canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign itemView_code_displayDefaultType=''>
								<#assign itemView_code_defaultValue=''>
										<#assign itemView_code_defaultValue=''>
																	<#if (itemView_code_defaultValue!)?string=="currentUser">
								<#assign itemView_code_defaultValue='${staffJson!}'>
							<#elseif (itemView_code_defaultValue!)?string=="currentPost">
								<#assign itemView_code_defaultValue='${postJson!}'>
							<#elseif (itemView_code_defaultValue!)?string=="currentDepart">
								<#assign itemView_code_defaultValue='${deptJson!}'>
							<#elseif (itemView_code_defaultValue!)?string=="currentComp">
								<#assign itemView_code_defaultValue='${compJson!}'>
							</#if>

										
										
										
										
										

									<@datacolumn key="itemView.code"        showFormat="SELECTCOMP" defaultValue="${(itemView_code_defaultValue!)?string}" defaultDisplay="${(itemView_code_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false   selectCompName="MESBasic.itemManage.itemSetup.itemEdit"  textalign="left"  viewUrl="/MESBasic/itemManage/itemSetup/nonEnergyOnlyRef.action" viewCode="MESBasic_1_itemManage_nonEnergyOnlyRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1557734207522')}"  label="${getText('MESBasic.propertydisplayName.radion1415261315358')}" width=120 showFormatFunc="" beforecallback="itemSetupBeforeCallback(obj)"  />
							<#assign itemView_itemName_displayDefaultType=''>
								<#assign itemView_itemName_defaultValue=''>
										<#assign itemView_itemName_defaultValue=''>
																	<#if (itemView_itemName_defaultValue!)?string=="currentUser">
								<#assign itemView_itemName_defaultValue='${staffJson!}'>
							<#elseif (itemView_itemName_defaultValue!)?string=="currentPost">
								<#assign itemView_itemName_defaultValue='${postJson!}'>
							<#elseif (itemView_itemName_defaultValue!)?string=="currentDepart">
								<#assign itemView_itemName_defaultValue='${deptJson!}'>
							<#elseif (itemView_itemName_defaultValue!)?string=="currentComp">
								<#assign itemView_itemName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="itemView.itemName"        showFormat="TEXT" defaultValue="${(itemView_itemName_defaultValue!)?string}" defaultDisplay="${(itemView_itemName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="MESBasic.itemManage.itemSetup.itemEdit"  textalign="left"  viewUrl="/MESBasic/itemManage/itemSetup/itemRefForContainer.action" viewCode="MESBasic_1_itemManage_itemRefForContainer" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1422422463756')}"  label="${getText('MESBasic.propertydisplayName.radion1415258813793')}" width=100 showFormatFunc=""  />
							<#assign itemView_itemNumber_displayDefaultType=''>
								<#assign itemView_itemNumber_defaultValue=''>
										<#assign itemView_itemNumber_defaultValue=''>
																	<#if (itemView_itemNumber_defaultValue!)?string=="currentUser">
								<#assign itemView_itemNumber_defaultValue='${staffJson!}'>
							<#elseif (itemView_itemNumber_defaultValue!)?string=="currentPost">
								<#assign itemView_itemNumber_defaultValue='${postJson!}'>
							<#elseif (itemView_itemNumber_defaultValue!)?string=="currentDepart">
								<#assign itemView_itemNumber_defaultValue='${deptJson!}'>
							<#elseif (itemView_itemNumber_defaultValue!)?string=="currentComp">
								<#assign itemView_itemNumber_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="itemView.itemNumber"        showFormat="TEXT" defaultValue="${(itemView_itemNumber_defaultValue!)?string}" defaultDisplay="${(itemView_itemNumber_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="MESBasic.itemManage.itemSetup.itemEdit"  textalign="left"  viewUrl="/MESBasic/itemManage/itemSetup/itemRefForContainer.action" viewCode="MESBasic_1_itemManage_itemRefForContainer" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1422422463756')}"  label="${getText('MESBasic.propertydisplayName.radion1415258842136')}" width=120 showFormatFunc=""  />
							<#assign itemNumber_displayDefaultType=''>
								<#assign itemNumber_defaultValue=''>
										<#assign itemNumber_defaultValue=''>
										  
									<@datacolumn key="itemNumber"        showFormat="TEXT" defaultValue="${(itemNumber_defaultValue!)?string}" defaultDisplay="${(itemNumber_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.radion1415259532954')}" width=120 showFormatFunc=""  />
							<#assign itemStatus_displayDefaultType=''>
								<#assign itemStatus_defaultValue=''>
										<#assign itemStatus_defaultValue=''>
										 									<@systemCodeColumn code="MESBasic_referPointStatus" textalign="center" defaultValue="${(itemStatus_defaultValue!)?string}" key="itemStatus.id" editable=true type="selectcomp" notnull=false     label="${getText('MESBasic.propertydisplayName.randon1559183315388')}" width=100   />
			
			</@datagrid>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
			
			<script type="text/javascript">
				function ItemPart_dg1458633704446_check_datagridvalid(){
					//
					var errorObj =ItemPart_dg1458633704446Widget._DT.testData();
					var errorContent='';
					if(errorObj!=null){
					  for(var i=0;i<errorObj.length;i++){
						var obj1=errorObj[i];
						if(obj1.errorType=='date'){
						  errorContent+=obj1.label+'必须为日期类型！';
						  break;
						}else if(obj1.errorType=='integer'){
						  errorContent+=obj1.label+'必须为数字类型！';
						  break;
						}else if(obj1.errorType=='decimal'){
						  errorContent+=obj1.label+'必须为整数类型！';
						  break;
						}else if(obj1.errorType=='notnull'){
						   errorContent+=obj1.label+'不能为空';
						   break;
						}else if(obj1.errorType=='toolong'){
						   errorContent+=obj1.label+'字段长度不能超过'+obj1.length+'字节(注：英文字母占1个字节，中文字占3个字节)！';
						   break;
						}
					  }
					  if(errorContent!=""){
						hasErr = true;
					  }
					  if(hasErr){
						EditDialogErrorBarWidget.show(errorContent);
						return false;
					  }
					}
					return true;
				}
				
				function savedg1458633704446DataGrid(){
					<#if  refId?? && (refId gt 0)>
					ItemPart_dg1458633704446Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('ItemPart_dg1458633704446Widget') > -1) {
						ItemPart_dg1458633704446Widget.setAllRowEdited();
					}
					var json = ItemPart_dg1458633704446Widget.parseEditedData();
					$('input[name="dg1458633704446ListJson"]').remove();
					$('input[name="dgLists[\'dg1458633704446\']"]').remove();
					$('input[name="dg1458633704446ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1458633704446\']">').val(json).appendTo($('#MESBasic_itemManage_itemSetup_itemEdit_form'));
					$('<input type="hidden" name="dg1458633704446ModelCode">').val('MESBasic_1_itemManage_ItemPart').appendTo($('#MESBasic_itemManage_itemSetup_itemEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1458633704446ListJson">').val(json).appendTo($('#MESBasic_itemManage_itemSetup_itemEdit_form'));
				}
				function DT_ItemPart_dg1458633704446_deldatagrid(){
					var deleteRows = ItemPart_dg1458633704446Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','itemView.id','item.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1458633704446DeletedIds").length>0){
							$("#dg1458633704446DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1458633704446DeletedIds" name="dgDeletedIds[\'dg1458633704446\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_itemManage_itemSetup_itemEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1458633704446DeletedIds['+CUI('input[name^="dg1458633704446DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_itemManage_itemSetup_itemEdit_form'));
					});
					return deleteRows;
				}
				function DT_ItemPart_dg1458633704446_delTreeNodes(){
					var deleteRows = ItemPart_dg1458633704446Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','itemView.id','item.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1458633704446DeletedIds").length>0){
							$("#dg1458633704446DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1458633704446DeletedIds" name="dgDeletedIds[\'dg1458633704446\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_itemManage_itemSetup_itemEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1458633704446DeletedIds['+CUI('input[name^="dg1458633704446DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_itemManage_itemSetup_itemEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('MESBasic_itemManage_itemSetup_itemEdit_datagrids');
					if(!datagrids) {
						datagrids = [];
					}
					for(var i=0;i<1;i++) {
						if(!datagrids[i]) {
							datagrids[i] = [];
						}
					}
					if(datagrids[0].length>0) {
						for(var i=0;i<datagrids[0].length;i++) {
							if(datagrids[0][i] == 'ItemPart_dg1458633704446') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'ItemPart_dg1458633704446';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'ItemPart_dg1458633704446';
					}
					$('body').data('MESBasic_itemManage_itemSetup_itemEdit_datagrids', datagrids);
				});
				
				var ItemPart_dg1458633704446_importDialog = null;
				function ItemPart_dg1458633704446_showImportDialog(){
					try{
						if(ItemPart_dg1458633704446_importDialog!=null&&ItemPart_dg1458633704446_importDialog.isShow==1){
							return false;
						}
						var url = "/MESBasic/itemManage/itemSetup/initImport.action?datagridCode=MESBasic_1_itemManage_itemEditdg1458633704446&tid=${id!}&datagridName=dg1458633704446";
							<#if canImportExcel>
								var buttonCode="MESBasic_1_itemManage_itemEditdg1458633704446_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						ItemPart_dg1458633704446_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("ItemPart_dg1458633704446"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();ItemPart_dg1458633704446_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();ItemPart_dg1458633704446_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						ItemPart_dg1458633704446_importDialog.show();
					}catch(e){}
				}	
				
				function ItemPart_dg1458633704446_downLoadFile(){
					var url = "/MESBasic/itemManage/itemSetup/downLoad.action?datagridCode=MESBasic_1_itemManage_itemEditdg1458633704446&templateRelatedModelCode=MESBasic_1_itemManage_itemEditdg1458633704446&downloadType=template&fileName=dg1458633704446";
					window.open(url,"","");
				}
				function dg1458633704446RenderOverEvent(){
					// 勾选"手动设置相关测点"时
if($('input[type="checkbox"][name="itemSetup.manuallySet_check"]').prop('checked') != false){
    // 设置"状态"单元格label为红色 - added by ww 2019-05-30
    $("#ItemPart_dg1458633704446_hdbox thead [key='itemStatus.id'] .dg-hd-td-label").css("color", "rgb(179, 3, 3)");
} else {
    // 设置"状态"单元格label为黑色 - added by ww 2019-05-30
    $("#ItemPart_dg1458633704446_hdbox thead [key='itemStatus.id'] .dg-hd-td-label").css("color", "");
}
				}
				function dg1458633704446PageInitMethod(nTabIndex){
					MESBasic.itemManage.itemSetup.itemEdit.initSize(nTabIndex);
					if(undefined == $("[name='itemSetup.manuallySet_check']").attr("checked") || false == $("[name='itemSetup.manuallySet_check']").attr("checked")){
	// 取消选中时, 隐藏增删行按钮
	var widget = ItemPart_dg1458633704446Widget;
	$("#ItemPart_dg1458633704446 .paginatorbar-operatebar").hide();
	// 设置PT所有单元格只读
	for (var i = 0; i < widget.getRowLength(); i++) {
		widget.setCellProperty(i, 'itemView.code', 'readonly', 'true');
		widget.setCellProperty(i, 'itemStatus.id', 'readonly', 'true');
	}
}
				}
			</script>
			
			
						</div>
			</div>
		</div>
	</div>
			
			
</div>
		<#if businessCenterList??>
	     	<#list businessCenterList as l>
		<div style="float:none;width:auto;display:none;" class="edit-main grid-s5m0 col-main main-wrap" id="otherContentDiv_${l.relatingModel.code.replace('.','')}">
	     	</div>
	     	</#list>
     	</#if>
     	
		<div id="MESBasic_itemManage_itemSetup_itemEdit_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="MESBasic.itemManage.itemSetup.itemEdit.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<div id="fileUploadDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-EDIT-MESBasic_1_itemManage_itemEdit,html,MESBasic_1_itemManage_ItemSetup,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
		<@errorbar id="workbenchErrorBar" offsetY=42 />
		
		<script type="text/javascript">
		$(function(){
			//修复select下拉框不能跟随滚动条一起滚动的bug
			$(".cui-elements").bind("scroll", function(){ 
			    $(".edit-select-box").hide();
				$(".select-iframe").hide();     
			});
			$(window).resize(function(){
				//var isoldie = $.browser.msie&&($.browser.version == "6.0")&&!$.support.style;
				//var body = isoldie?(document.documentElement||document.body):document.body;
				var width = parseInt($('html').width(),10);
				var w1 = parseInt($(window).width(),10);
				if($("#edit_sidebar").css("display") == "block"){
					w1 = w1 - 150;
				}
				if (width <= 800) {
					if($("#edit_sidebar").length==0 || $("#edit_sidebar").css("display")=="none"){
						$("#MESBasic_itemManage_itemSetup_itemEdit_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#MESBasic_itemManage_itemSetup_itemEdit_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#MESBasic_itemManage_itemSetup_itemEdit_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#MESBasic_itemManage_itemSetup_itemEdit_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			MESBasic.itemManage.itemSetup.itemEdit.initCount = 0;
			MESBasic.itemManage.itemSetup.itemEdit.initSize = function(nTabIndex){
				var h = $(window).height();
				<#if businessCenterList??&&businessCenterList?size gt 0 >
				if($("#edit_sidebar").css("display") === "none"){
					$("div.edit-workflow").css("left",1);
				}else{
					$("div.edit-workflow").css("left",145);
				}
				$("#edit_sidebar").height(h);
				$("div.edit-sidebar-inner").height(h);
				$("#edit_side_btn").css("top",(h-50)/2);
				CUI('div[id^="otherContentDiv_"]').height( h );
				</#if>
				
				var editContainer = $( 'div.edit-container' );
				editContainer.height(  $(window).height() - editContainer.offset().top - $('div.edit-workflow').outerHeight() );
				if( $.browser.msie6 ){
					setTimeout(function(){
						editContainer.outerWidth( $(window).width()- editContainer.offset().left );
					},1000)	
				}
				var datagrids = $('body').data('MESBasic_itemManage_itemSetup_itemEdit_datagrids');
				$("#MESBasic_itemManage_itemSetup_itemEdit_main_div .edit-panes-s").each( function ( index ) {
					//多页签切换时只计算本页签下的PT高度
					if( nTabIndex != undefined && typeof(nTabIndex) == 'number' && index != nTabIndex ){
						return;
					}
					if( datagrids && datagrids.length > index && datagrids[index].length > 0) {
						for( var dg = 0; dg < datagrids[index].length; dg++ ) {							
							var dgwidget = eval( datagrids[index][dg] + 'Widget' );
							if( !dgwidget ){
								continue;
							}
							if( dgwidget._DT && dgwidget.isJS ) {
								dgwidget._DT.setHeight( dgwidget._DT.configs.height );
							} 
						}
					}
					
				});
			}
			$(function(){
				$('#MESBasic_itemManage_itemSetup_itemEdit_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				MESBasic.itemManage.itemSetup.itemEdit.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				MESBasic.itemManage.itemSetup.itemEdit.initSize();
				if(YAHOO.env.ua.ie == 6){
					$("#loading_wrap_first").css("display","block");
				}
				$("#load_mask_first").remove();
				$("#load_iframe_ie_first").remove();
				$("#loading_wrap_first").remove();
				<#if businessCenterList??&&businessCenterList?size gt 0 >
					$(window).resize(function(){
						for(var i=0; i<CUI.DataTable.Arrays.length; i++){
							if( CUI.DataTable.Arrays[i] && document.getElementById( CUI.DataTable.Arrays[i].dataTableId ) &&  $( CUI.DataTable.Arrays[i].container ).is(':visible') ){
								CUI.DataTable.Arrays[i]._initDomElements();
							}else if( CUI.DataTable.Arrays[i] && !document.getElementById( CUI.DataTable.Arrays[i].dataTableId ) ){
								CUI.DataTable.Arrays[i] = null;
								CUI.DataTable.Arrays.splice(i, 1);
							}
						}
					})
					$(".edit-workflow").css("left",145);
					$("#edit_side_btn").toggle(function(){
						if(parseInt($("#MESBasic_itemManage_itemSetup_itemEdit_main_div").css("width"),10)==650){
							$("#MESBasic_itemManage_itemSetup_itemEdit_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//MESBasic.itemManage.itemSetup.itemEdit.resizeLayout();
						//MESBasic.itemManage.itemSetup.itemEdit.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#MESBasic_itemManage_itemSetup_itemEdit_main_div").css("width"),10)==800){
							$("#MESBasic_itemManage_itemSetup_itemEdit_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//MESBasic.itemManage.itemSetup.itemEdit.resizeLayout();
						//MESBasic.itemManage.itemSetup.itemEdit.initSize();
						$('body').trigger('resize');
					});
				<#else>	
					$(".main-wrap").css("margin-left",0);
					$(".col-sub").width(0);
					$("#edit_side_btn").css("left",0);
					$(".edit-workflow").css("left",1);
					
				</#if>

				if($("ul.edit-tabs li").length > 0) {
			     	$("ul.edit-tabs").tabs("div.edit-panes > div");
			    }
				var datatableHeight;
				var bh = $(".edit-workflow tr:gt(0)").height();
				<#if pendingId?? || editNew>
				$("#workflow_toggle").toggle(function(){
					$(".edit-workflow tr:gt(0)").hide();
					MESBasic.itemManage.itemSetup.itemEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					MESBasic.itemManage.itemSetup.itemEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){MESBasic.itemManage.itemSetup.itemEdit.initSize();});
				/*
				MESBasic.itemManage.itemSetup.itemEdit.resizeLayout=function(){
					CUI("div[class='elm-layout-doc elm-layout-doc-in-wrap']").each(function(){
						var id=CUI(this).attr("id");
						var layoutObj=eval(id+"Widget");
						layoutObj.resize();
					})
				}
				*/
			});
		</script>
		<script type="text/javascript">
		
		$(function(){
			//解决合并单元格后，同行（tr）内的所有td跨行数（rowspan）相同时,组态期表现为tr占n行单元格，在运行期错乱的bug
			var editContainer = $( 'div.edit-container' );
		    var editTr=editContainer.find(".edit-table tr");
		    $.each(editTr,function(i,item){
		        var editTd=$(item).find("td");
		        var isSameRowSpan=true;//单元格跨行数是否相等
		        var rsTemp;//跨行数
		        var csTemp=0;//跨列数（需累加）
		        for(var k=0;k<editTd.length;k++){
		           var ele=editTd[k];
		           var rowspan=$(ele).attr("rowspan");
		           var colspan=$(ele).attr("colspan");
		           if(!rowspan||rowspan=="") rowspan=1;
		           if(!colspan||colspan=="") colspan=1;
		           csTemp+=Number(colspan);
		           if(!rsTemp){
		              rsTemp=Number(rowspan);
		           }else{
		              if(rsTemp!=rowspan){
		                 isSameRowSpan=false;
		              }
		           }  
		        }
		        //单元格跨行数相等且不为1的情况下，重组本行内容
		        if(isSameRowSpan&&rsTemp!=1){
		           recombineTr(item,rsTemp,csTemp);
		        }
		    });
		    //对满足条件的行进行跨行重组
		    function recombineTr(editTr,rsNum,csNum){
		        var editTd=$(editTr).find("td");
		        $.each(editTd,function(i,item){
		           $(item).attr({"rowspan":"1","data-row":rsNum});
		        });
		        var appendTr="";
		        for(var i=0;i<rsNum-1;i++){
		          appendTr+="<tr data-tag='appendrow'><td class='edit-table-symbol' colspan='"+csNum+"'>&nbsp;</td></tr>";
		        }
		        $(appendTr).insertAfter(editTr);
		    }
		});

		MESBasic.itemManage.itemSetup.itemEdit.validate = function(){
		    <#if dealSet?? && dealSet == 1>
			var cancelItem = $('input[name="workFlowVarStatus"]');
	        validateRequiredFlag = $('input[name="operateType"]').val()=='submit' && (!cancelItem || cancelItem.length == 0 || !(cancelItem.val()=='cancel'));
			if(validateRequiredFlag){
				var comments = $.trim(CUI("#workflow_comments").val());
			 	if(comments != null && comments == ""){
		        	workbenchErrorBarWidget.showMessage("${getText('ec.property.dealinfo.isNotNull')}", 'f');
		        	return false;
				}
			}
		    </#if>
		    return true;
		}
		MESBasic.itemManage.itemSetup.itemEdit.beforeSaveProcess = function(){
			try{eval("savedg1458633704446DataGrid()");}catch(e){}

			var extraCol = '<extra-data>';
			$('#MESBasic_itemManage_itemSetup_itemEdit_form').trigger('beforeSubmit');
			//itemSetup.extraCol
			$('*[name^="_complex_"]').each(function(index, item){
				if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
					if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
					var itemValue = CUI(item).val();
					extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
				}
			});
			extraCol += '</extra-data>';
			$('input[name="itemSetup.extraCol"]').val(extraCol);
		}
		MESBasic.itemManage.itemSetup.itemEdit.processDataGrid = function(){
										<#if false && isIE>
										$('#MESBasic_itemManage_itemSetup_itemEdit_form').append(ItemPart_dg1458633704446Widget._DT.createInputs('dg1458633704446List'));
										</#if>
		};
		MESBasic.itemManage.itemSetup.itemEdit.save = function(){
			$('#operateType').val("submit");
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!MESBasic.itemManage.itemSetup.itemEdit.validate()){return;}
			//延迟到延迟提交中处理,解决onchange事件无法触发问题
			//MESBasic.itemManage.itemSetup.itemEdit.beforeSaveProcess();

			//MESBasic.itemManage.itemSetup.itemEdit.processDataGrid();
			$('#MESBasic_itemManage_itemSetup_itemEdit_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('MESBasic_itemManage_itemSetup_itemEdit_form','MESBasic_itemManage_itemSetup_itemEdit_datagrids')) {      
		            return "${getText('ec.view.losedata')}";      
		        }else{
		        	 if($('#workflow_comments').length!=0){
			        	if($('#workflow_comments').val()!=null && $('#workflow_comments').val()!=""){
			        		return "${getText('ec.view.losedata')}";
			        	}
				     }  
		        }   
	    });
		<#else>
		$(window).bind('beforeunload',function(){
		        if($('#workflow_comments').length!=0){
		        	if($('#workflow_comments').val()!=null && $('#workflow_comments').val()!=""){
		        		return "${getText('ec.view.losedata')}";
		        	}
		        }  		  
		});		
		</#if>
		//打印
		MESBasic.itemManage.itemSetup.itemEdit.print = function(){
			var viewCode = $('input[name="viewCode"]').val();
			var value = "";
			var printId = 0;
			var printVersion = 0;
			if(viewCode!=undefined && viewCode!=null && viewCode!=''){
				$.ajax({
					url : "/ec/print/getAjaxSetting.action",
					type : 'post',
					async : false,
					data:{"printCookie.type":viewCode},
					success : function(msg) {
						if(msg!=null){
							value = msg.value;
							printId = msg.id;
							printVersion = msg.version;
						}
					}
				});
				$("#printCookie_id").val(printId);
				$("#printCookie_version").val(printVersion);
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
				data += "&dealInfoGroup=" + $('#dealInfoGroup').val();

				var url = document.location.href;
				// TODO 去掉url后的'#'，将来页面上有锚点时，在打印可能也会有问题
				while(url.endsWith('#')) {
					url = url.substring(0, url.length - 1);
				}
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
		
		MESBasic.itemManage.itemSetup.itemEdit.saveSetting = function(){
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
		
		MESBasic.itemManage.itemSetup.itemEdit.printSetting = function(){
			var viewCode = $('input[name="viewCode"]').val();
			var value = "";
			var printId = 0;
			var printVersion = 0;
			if(viewCode!=undefined && viewCode!=null && viewCode!=''){
				$.ajax({
					url : "/ec/print/getAjaxSetting.action",
					type : 'post',
					async : false,
					data:{"printCookie.type":viewCode},
					success : function(msg) {
						if(msg!=null){
							value = msg.value;
							printId = msg.id;
							printVersion = msg.version;
						}
					}
				});
				$("#printCookie_id").val(printId);
				$("#printCookie_version").val(printVersion);
				var values = {};
				if(value!=undefined && value!=null && value != ""){
					values = value.split(/\|/g);
				}
				if(values != null && values.length > 0){
					for(var i=0;i < values.length;i++){
						var item = values[i].split("=");
						if(item[1]=='true'){
							$('#' + item[0]).prop('checked',true);
						}else{
							$('#' + item[0]).prop('checked',false);
						}
					}
				}else{
					$('#mainContent').prop('checked',true);
					$('#dealInfo').prop('checked',true);
					$('#attachmentInfo').prop('checked',true);
				}
				<#if isWorkflow?? && isWorkflow>
				$('td[name="deal"]').show();
				<#else>
				$('td[name="deal"]').hide();
				$('#dealInfo').prop('checked',false);
				</#if>
				<#if isAttachment?? && isAttachment>
				$('td[name="att"]').show();
				<#else>
				$('td[name="att"]').hide();
				$('#attachmentInfo').prop('checked',false);
				</#if>
				MESBasic.itemManage.itemSetup.itemEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(MESBasic.itemManage.itemSetup.itemEdit.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				MESBasic.itemManage.itemSetup.itemEdit.settingDialog.show();
			}
		}
		
		
		MESBasic.itemManage.itemSetup.itemEdit.refcopy = function(){
			var callbackName ="MESBasic.itemManage.itemSetup.itemEdit.referenceCopyBackInfo";
			MESBasic.itemManage.itemSetup.itemEdit._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				callBackFuncName : callbackName,
				url : '/MESBasic/itemManage/itemSetup/itemRef.action',
				title : "${getText('ec.common.refcopyTitle')}",
				params : null
			});
		}
		MESBasic.itemManage.itemSetup.itemEdit.referenceCopyBackInfo = function(obj){
			if(MESBasic.itemManage.itemSetup.itemEdit._dialog) {
				MESBasic.itemManage.itemSetup.itemEdit._dialog.close();
			}
			var url = "/MESBasic/itemManage/itemSetup/itemEdit.action?entityCode=${entityCode}&pendingId=${pendingId?default('')}&&deploymentId=${deploymentId?default('')}&tableInfoId=${(itemSetup.tableInfoId)?default('')}&__pc__=${(Parameters.__pc__)!}&id="+document.getElementById("id").value+'&refId='+obj[0].id + "";
			
			window.location=url;
		};
		MESBasic.itemManage.itemSetup.itemEdit._callBackInfo = function(res){
			if(res.dealSuccessFlag){
					var showMsg ;
				if(res.operateType == 'save'){
					showMsg = "${getText("ec.common.savesuccessful")}";
				}else{
					showMsg = "${getText("ec.common.saveandclosesuccessful")}";
				}
				
				//提交成功时隐藏之前的错误信息
				workbenchErrorBarWidget.close();
				
				if(containerLoadPanelWidget && containerLoadPanelWidget.loading && YUD.get("loading_wrap")){
 					YUD.get("loading_wrap").innerHTML = "<div class='success-middle'></div>" ;
 				}

 				try{
					window.opener.refreshPortal('workflow');
					window.opener.timeData();
				}catch(e){
					try{
 						window.opener.MESBasic.itemManage.itemSetup.editCallBackInfo(res); 						
					}catch(e2){
						try{
							if(typeof window.opener.refViewRefresh == 'function'){
								window.opener.refViewRefresh()
							} else {
								window.opener.location.reload();
							}
						}catch(e3){}
					}
				};

 				setTimeout(function(){
					window.close();
				},1000);
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.MESBasic.itemManage.itemSetup.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
			} else {
				CUI.showErrorInfos(res);
			}
		};
		refViewRefresh = function(){
			if($("[name='refViewRefresh']").val() != undefined && "" != $("[name='refViewRefresh']").val()){
				eval($("[name='refViewRefresh']").val());
			}
		}
		
		//控件版PT选人查看按钮单击事件处理函数
		function dataGridBtnImgClick(sUrl,objNameCustomCondition,sTitle,sPTGridID,nRow,sFieldName,oGrid,customCallBack,crossCompany,isObjCustomProp,objCustomPropNames,viewCode){
			//保存当前单击事件的对象信息
			var obj = {
				"oGrid" : oGrid,
				"nRow" : nRow - 1,
				"sKey":	sFieldName
			}
			if(customCallBack){
				MESBasic.itemManage.itemSetup.itemEdit._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				MESBasic.itemManage.itemSetup.itemEdit._isObjCustomProp_IE = isObjCustomProp;
			} else {
				MESBasic.itemManage.itemSetup.itemEdit._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				MESBasic.itemManage.itemSetup.itemEdit._objCustomPropNames_IE = objCustomPropNames;
			} else {
				MESBasic.itemManage.itemSetup.itemEdit._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				MESBasic.itemManage.itemSetup.itemEdit._refViewCode_IE = viewCode;
			} else {
				MESBasic.itemManage.itemSetup.itemEdit._refViewCode_IE = '';
			}
			MESBasic.itemManage.itemSetup.itemEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		MESBasic.itemManage.itemSetup.itemEdit.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			MESBasic.itemManage.itemSetup.itemEdit._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			MESBasic.itemManage.itemSetup.itemEdit._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			MESBasic.itemManage.itemSetup.itemEdit.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			MESBasic.itemManage.itemSetup.itemEdit._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				MESBasic.itemManage.itemSetup.itemEdit._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		MESBasic.itemManage.itemSetup.itemEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(MESBasic.itemManage.itemSetup.itemEdit._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(MESBasic.itemManage.itemSetup.itemEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				MESBasic.itemManage.itemSetup.itemEdit.gridEventObj = gridEventObj;
				callbackName = "MESBasic.itemManage.itemSetup.itemEdit.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "MESBasic.itemManage.itemSetup.itemEdit.getMultiselectCallBackInfo_DG" : "MESBasic.itemManage.itemSetup.itemEdit.getcallBackInfo_DG";
				MESBasic.itemManage.itemSetup.itemEdit._currRow = $(obj).closest('tr')[0];
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="MESBasic.itemManage.itemSetup.itemEdit.getcallBackInfo";
			}

			if(_prefix!=''){
				MESBasic.itemManage.itemSetup.itemEdit._prefix = _prefix.substring(1);
			}
			
			MESBasic.itemManage.itemSetup.itemEdit._oGrid = oGrid;
			MESBasic.itemManage.itemSetup.itemEdit._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					MESBasic.itemManage.itemSetup.itemEdit._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					MESBasic.itemManage.itemSetup.itemEdit._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					MESBasic.itemManage.itemSetup.itemEdit._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					MESBasic.itemManage.itemSetup.itemEdit._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					MESBasic.itemManage.itemSetup.itemEdit._refViewCode = oColumn.viewCode;
				} else {
					MESBasic.itemManage.itemSetup.itemEdit._refViewCode = '';
				}
			} else {
				MESBasic.itemManage.itemSetup.itemEdit._isObjCustomProp = false;
				MESBasic.itemManage.itemSetup.itemEdit._objCustomPropNames = '';
				MESBasic.itemManage.itemSetup.itemEdit._refViewCode = '';
			}
			if (MESBasic.itemManage.itemSetup.itemEdit._isObjCustomProp == true && MESBasic.itemManage.itemSetup.itemEdit._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				MESBasic.itemManage.itemSetup.itemEdit._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				MESBasic.itemManage.itemSetup.itemEdit._customCallBack = customCallBack;
			}
			if(MESBasic.itemManage.itemSetup.itemEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(MESBasic.itemManage.itemSetup.itemEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof MESBasic.itemManage.itemSetup.itemEdit._querycustomFuncN == "function") {
				refparam += MESBasic.itemManage.itemSetup.itemEdit._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			MESBasic.itemManage.itemSetup.itemEdit._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		MESBasic.itemManage.itemSetup.itemEdit._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(MESBasic.itemManage.itemSetup.itemEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(MESBasic.itemManage.itemSetup.itemEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			MESBasic.itemManage.itemSetup.itemEdit._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'MESBasic.itemManage.itemSetup.itemEdit.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		MESBasic.itemManage.itemSetup.itemEdit._querycustomFunc = function(obj) {
			var str = eval("typeof(MESBasic.itemManage.itemSetup.itemEdit.query_"+obj+")!='undefined'") ? eval('MESBasic.itemManage.itemSetup.itemEdit.query_'+obj+'()') : null;
			return str;
		};
		MESBasic.itemManage.itemSetup.itemEdit.getcallBackGroupInfo = function(obj){
			var ids = "";
			var names = "";
			for(var i = 0 ; i < obj.length; i++){
				ids += "," + obj[i].id;
				names += "," + obj[i].name;
			}
			if(ids){ids = ids.substring(1);}
			if(names){names = names.substring(1);}
			$('#groupInfoIds').val(ids);
			$('#groupInfos').val(names);
			MESBasic.itemManage.itemSetup.itemEdit._dialog.close();
		}
		MESBasic.itemManage.itemSetup.itemEdit.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('MESBasic_itemManage_itemSetup_itemEdit_form',obj[0], MESBasic.itemManage.itemSetup.itemEdit._prefix, MESBasic.itemManage.itemSetup.itemEdit._sUrl);
			CUI.commonFills('MESBasic_itemManage_itemSetup_itemEdit_form',MESBasic.itemManage.itemSetup.itemEdit._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (MESBasic.itemManage.itemSetup.itemEdit._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(MESBasic.itemManage.itemSetup.itemEdit._customCallBack) {
					eval(MESBasic.itemManage.itemSetup.itemEdit._customCallBack);
					MESBasic.itemManage.itemSetup.itemEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.itemManage.itemSetup.itemEdit._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		MESBasic.itemManage.itemSetup.itemEdit.getcallBackInfo_DG_IE = function(obj){
			if(MESBasic.itemManage.itemSetup.itemEdit._customBeforeCallBack) {
				var flag = eval(MESBasic.itemManage.itemSetup.itemEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = MESBasic.itemManage.itemSetup.itemEdit.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( MESBasic.itemManage.itemSetup.itemEdit._isObjCustomProp_IE == true && MESBasic.itemManage.itemSetup.itemEdit._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,MESBasic.itemManage.itemSetup.itemEdit._sUrl,MESBasic.itemManage.itemSetup.itemEdit._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,MESBasic.itemManage.itemSetup.itemEdit._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (MESBasic.itemManage.itemSetup.itemEdit._isObjCustomProp_IE == true && MESBasic.itemManage.itemSetup.itemEdit._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = MESBasic.itemManage.itemSetup.itemEdit._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = MESBasic.itemManage.itemSetup.itemEdit._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
				for( var i = 0; i < xmlHead.children().length; i++ ){
					var tagName = xmlHead.children()[i].tagName;
					if ( tagName == (rootKey + 'MainDisplay') ) {
						try{
							var showVal = eval('jsonObj.' + showName);
						}catch(e){
							var showVal = eval('jsonObj["' + showName + '"]');
						}
						if (showVal != undefined ) {
							gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,showVal);
						} else {
							try {
								var trueVal = eval('jsonObj.' + trueName);
							} catch(e) {
								var trueVal = eval('jsonObj["' + trueName + '"]');
							}
							trueVal = ( trueVal != undefined ? trueVal : '' );
							gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,trueVal);
						}
					} else if ( tagName == rootKey ) {
						try{
							var trueVal = eval('jsonObj.' + trueName);
						}catch(e){
							var trueVal = eval('jsonObj["' + trueName + '"]');
						}
						trueVal = ( trueVal != undefined ? trueVal : '' );
						gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,trueVal);
					}
				}
			} else {
				for( var i = 0; i < xmlHead.children().length; i++ ){
					var tagName = xmlHead.children()[i].tagName;
					if( tagName.indexOf(rootKey) == 0 ){
						try{
							var value = eval('jsonObj.' + tagName.substring(rootKey.length+1));
						}catch(e){
							var value = eval('jsonObj["' + tagName.substring(rootKey.length+1)+'"]');
						}
						//判断符合条件的key是否存在
						value = ( value != undefined ? value : '' );
						gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,value);			
					}
				}
			}
			// 自定义字段参照回填
			if ( $('#dg_cp_info_' + gridEventObj.oGrid._DT.opts.id).length > 0 ) {
				var dg_cp_info = $('#dg_cp_info_' + gridEventObj.oGrid._DT.opts.id).val();
				var id = jsonObj.id;
				var relationMap;
				if (dg_cp_info && id && MESBasic.itemManage.itemSetup.itemEdit._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + MESBasic.itemManage.itemSetup.itemEdit._refViewCode_IE + '&id=' + id,
						success : function(res){
							if (res.dealSuccessFlag && res.relationMap) {
								relationMap = res.relationMap;
							}
						}
					});
					if (relationMap) {
						var objs = new Object();
						var infoArr = dg_cp_info.split(',');
						for (var n in infoArr) {
							var info = infoArr[n].split('||');
							var key = info[0];
							var name = info[1];
							var propCode = '';
							if (info.length > 2) {
								propCode = info[2];
							}
							var val = relationMap[key];
							if (val) {
								objs[name] = val;
								if (propCode) {
									$.ajax({
										async   : false,
										type    : 'POST',
										url     : '/foundation/customProp/getMainDisplayValue.action',
										data    : 'code=' + propCode + '&id=' + val,
										success : function(res){
											if (res.dealSuccessFlag && res.displayValue) {
												var displayName = name + 'MainDisplay';
												objs[displayName] = res.displayValue;
											}
										}
									});
								}
							}
						}
						// console.log(objs);
						if (objs) {
							for( var i = 0; i < xmlHead.children().length; i++ ){
								var tagName = xmlHead.children()[i].tagName;
								try{
									var value = eval('objs.' + tagName);
								}catch(e){
									var value = eval('objs["' + tagName + '"]');
								}
								if( value != undefined ){
									gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,value);
								}else if( objs.hasOwnProperty(  tagName  ) ){
									value = '';
									gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,value);
								}								
							}
						}
					}
				}
			}
			try{
				if(MESBasic.itemManage.itemSetup.itemEdit._customCallBack) {
					eval(MESBasic.itemManage.itemSetup.itemEdit._customCallBack);
					MESBasic.itemManage.itemSetup.itemEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.itemManage.itemSetup.itemEdit._dialog.close();
			} catch(e){}
			
			try{
				var errorMsg = ''
				for ( var item in  CUI.error_msg_DG_CP_map ){
					errorMsg += ( '<b>' + gridEventObj.oGrid._DT._oGrid.ColGetProperty(item,'caption') +  '</b>第<b>' + ( gridEventObj.nRow + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
				}
				if( errorMsg ){
					workbenchErrorBarWidget.showMessage( errorMsg );
				}	
			}catch(e){};
			
			gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
		}
		
		MESBasic.itemManage.itemSetup.itemEdit.getcallBackInfo_DG = function(obj){
			if(MESBasic.itemManage.itemSetup.itemEdit._customBeforeCallBack) {
				var flag = eval(MESBasic.itemManage.itemSetup.itemEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(MESBasic.itemManage.itemSetup.itemEdit._currRow).next().length==0){
						MESBasic.itemManage.itemSetup.itemEdit._oGrid.addNewRow();
					}	
					MESBasic.itemManage.itemSetup.itemEdit._currRow = $(MESBasic.itemManage.itemSetup.itemEdit._currRow).next();
					$(MESBasic.itemManage.itemSetup.itemEdit._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(MESBasic.itemManage.itemSetup.itemEdit._currRow,obj[i], MESBasic.itemManage.itemSetup.itemEdit._prefix, MESBasic.itemManage.itemSetup.itemEdit._sUrl);
				if (MESBasic.itemManage.itemSetup.itemEdit._isObjCustomProp == true && MESBasic.itemManage.itemSetup.itemEdit._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(MESBasic.itemManage.itemSetup.itemEdit._currRow,MESBasic.itemManage.itemSetup.itemEdit._prefix,obj[i],MESBasic.itemManage.itemSetup.itemEdit._oGrid,MESBasic.itemManage.itemSetup.itemEdit._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(MESBasic.itemManage.itemSetup.itemEdit._currRow,MESBasic.itemManage.itemSetup.itemEdit._prefix,obj[i],MESBasic.itemManage.itemSetup.itemEdit._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + MESBasic.itemManage.itemSetup.itemEdit._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + MESBasic.itemManage.itemSetup.itemEdit._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && MESBasic.itemManage.itemSetup.itemEdit._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + MESBasic.itemManage.itemSetup.itemEdit._refViewCode + '&id=' + id,
							success : function(res){
								if (res.dealSuccessFlag && res.relationMap) {
									relationMap = res.relationMap;
								}
							}
						});
						if (relationMap) {
							var objs = new Object();
							var infoArr = dg_cp_info.split(',');
							for (var n in infoArr) {
								var info = infoArr[n].split('||');
								var key = info[0];
								var name = info[1];
								var propCode = '';
								if (info.length > 2) {
									propCode = info[2];
								}
								var val = relationMap[key];
								if (val) {
									name = MESBasic.itemManage.itemSetup.itemEdit._oGrid.configs.hidekeyPrefix + name;
									objs[name] = val;
									if (propCode) {
										$.ajax({
											async   : false,
											type    : 'POST',
											url     : '/foundation/customProp/getMainDisplayValue.action',
											data    : 'code=' + propCode + '&id=' + val,
											success : function(res){
												if (res.dealSuccessFlag && res.displayValue) {
													var displayName = name + 'MainDisplay';
													objs[displayName] = res.displayValue;
												}
											}
										});
									}
								}
							}
							// console.log(objs);
							if (objs) {
								CUI.commonFills_DG_CP(MESBasic.itemManage.itemSetup.itemEdit._currRow, objs, MESBasic.itemManage.itemSetup.itemEdit._oGrid);
							}
						}
					}
				}
			}
			try{
				if(MESBasic.itemManage.itemSetup.itemEdit._customCallBack) {
					eval(MESBasic.itemManage.itemSetup.itemEdit._customCallBack);
					MESBasic.itemManage.itemSetup.itemEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.itemManage.itemSetup.itemEdit._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + MESBasic.itemManage.itemSetup.itemEdit._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		MESBasic.itemManage.itemSetup.itemEdit.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(MESBasic.itemManage.itemSetup.itemEdit._oGrid, MESBasic.itemManage.itemSetup.itemEdit._currRow, MESBasic.itemManage.itemSetup.itemEdit._key, MESBasic.itemManage.itemSetup.itemEdit._displayFieldName, obj[i])
			}
			try{
				if(MESBasic.itemManage.itemSetup.itemEdit._customCallBack) {
					eval(MESBasic.itemManage.itemSetup.itemEdit._customCallBack);
					MESBasic.itemManage.itemSetup.itemEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.itemManage.itemSetup.itemEdit._dialog.close();
			} catch(e){}
		};
		
		MESBasic.itemManage.itemSetup.itemEdit.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						MESBasic.itemManage.itemSetup.itemEdit.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#MESBasic_itemManage_itemSetup_itemEdit_form'));
						}
					}
				}
			});
		};

		$(function(){
			MESBasic.itemManage.itemSetup.itemEdit.onloadForProduct();
			// 勾选"虚拟测点"时
if($('input[type="checkbox"][name="itemSetup.virtualTag_check"]').prop('checked') != false){

  $('#itemSetup_itemNumber').attr('readonly','readonly');
  $('#itemSetup_itemNumber').css('background','#f2f2f2');
  $('#itemSetup_itemNumber').parent().css('background','#f2f2f2');
  
  $('#itemSetup_formula').removeAttr('readonly');
  $('#itemSetup_formula').css('background','white');
  $('#itemSetup_formula').parent().css('background','white');
  
  $('#itemSetup_factor').attr('readonly','readonly');
  $('#itemSetup_factor').css('background','#f2f2f2');
  $('#itemSetup_factor').parent().css('background','#f2f2f2');

  // "手动设置相关测点"可编辑 - added by ww 2019-05-10
  $("[name='itemSetup.manuallySet_check']").removeAttr("disabled");

  $('#ItemPart_dg1458633704446').show();
  MESBasic.itemManage.itemSetup.itemEdit.initSize();   
} else {
  $('#itemSetup_itemNumber').removeAttr('readonly');
  $('#itemSetup_itemNumber').css('background','white');
  $('#itemSetup_itemNumber').parent().css('background','white');

  $('#itemSetup_formula').attr('readonly','readonly');
  $('#itemSetup_formula').css('background','#f2f2f2');
  $('#itemSetup_formula').parent().css('background','#f2f2f2');

  $('#itemSetup_factor').removeAttr('readonly');
  $('#itemSetup_factor').css('background','white');
  $('#itemSetup_factor').parent().css('background','white');

  // "手动设置相关测点"只读 - added by ww 2019-05-10
  $("[name='itemSetup.manuallySet_check']").attr("disabled", true);
  
  $('#ItemPart_dg1458633704446').hide();
}

// 勾选"手动设置相关测点"时
if($('input[type="checkbox"][name="itemSetup.manuallySet_check"]').prop('checked') != false){
    // 计算公式只读
    $('#itemSetup_formula').attr('readonly','readonly');
    $('#itemSetup_formula').css('background','#f2f2f2');
    $('#itemSetup_formula').parent().css('background','#f2f2f2');
    
    // "比较时间"、"比较数值"可编辑 - added by ww 2019-05-10
    $('#itemSetup_compareTime').removeAttr('readonly');
    $('#itemSetup_compareTime').css('background','white');
    $('#itemSetup_compareTime').parent().css('background','white');
    $('#itemSetup_compareNumber').removeAttr('readonly');
    $('#itemSetup_compareNumber').css('background','white');
    $('#itemSetup_compareNumber').parent().css('background','white');

    $("[name='itemSetup.compareTime']").parent().parent().prev().css('color','rgb(179, 3, 3)');
    $("[name='itemSetup.compareNumber']").parent().parent().prev().css('color','rgb(179, 3, 3)');
} else {
	if ($("[name='itemSetup.manuallySet_check']").attr("disabled") != "disabled") {
		// 计算公式可编辑
	    $('#itemSetup_formula').removeAttr('readonly');
	    $('#itemSetup_formula').css('background','white');
	    $('#itemSetup_formula').parent().css('background','white');
	}

    // "比较时间"、"比较数值"只读 - added by ww 2019-05-10
    $('#itemSetup_compareTime').attr('readonly','readonly');
    $('#itemSetup_compareTime').css('background','#f2f2f2');
    $('#itemSetup_compareTime').parent().css('background','#f2f2f2');
    $('#itemSetup_compareNumber').attr('readonly','readonly');
    $('#itemSetup_compareNumber').css('background','#f2f2f2');
    $('#itemSetup_compareNumber').parent().css('background','#f2f2f2');
  	
  	$("[name='itemSetup.compareTime']").parent().parent().prev().css('color','');
    $("[name='itemSetup.compareNumber']").parent().parent().prev().css('color','');
}

var id = $('#id').val();
if(id != null && id != ""){
  $('#itemSetup_code').attr('readonly','readonly');
  $('#itemSetup_code').css('background','#f2f2f2');
  $('#itemSetup_code').parent().css('background','#f2f2f2');
}else{
  $('#itemSetup_code').removeAttr('readonly');
  $('#itemSetup_code').css('background','white');
  $('#itemSetup_code').parent().css('background','white');
  $('input[name="itemSetup.active_check"]').attr("checked",'checked');
  $('input[name="itemSetup.active"]').val(true);
}

var type = $("[name='itemSetup.tagType.id']").val();
var isVirtualTag = $("input[name='itemSetup.virtualTag']").val();
if(type!="TAG_TYPE/0" || isVirtualTag!='false'){
  $('#itemSetup_range').attr('value','');
  $('#itemSetup_range').css('background','#f2f2f2');
  $('#itemSetup_range').parent().css('background','#f2f2f2');
  $('#itemSetup_range').attr('readOnly',true);
}

var itemType = $("[name='itemSetup.purpose.id']").val();
if("MESBasic001/01" == itemType){
  $("label[value*='时延(s)']").css('color','rgb(179, 3, 3)');
  $("label[value*='位号属性']").css('color','rgb(179, 3, 3)');
  $("label[value*='能源类型']").css('color','rgb(179, 3, 3)');
  $("label[value*='单位名称']").css('color','rgb(179, 3, 3)');
  $("label[value*='数据频率']").css('color','rgb(179, 3, 3)');
}else{
  $("label[value*='时延(s)']").css('color','');
  $("label[value*='位号属性']").css('color','');
  $("label[value*='能源类型']").css('color','');
  $("label[value*='单位名称']").css('color','');
  $("label[value*='数据频率']").css('color','');
}
		});

		MESBasic.itemManage.itemSetup.itemEdit.beforeSubmitMethodSettingInPage = function(){
			MESBasic.itemManage.itemSetup.itemEdit.onsaveForProduct();
			var code = $("#itemSetup_code").val();
if(code.indexOf('[') != -1 || code.indexOf(']') != -1) {
    workbenchErrorBarWidget.showMessage("测点编码不允许包含'['或']'符号！");
    return false;
}

if(/.*[^\w]+.*/.test(code)) {
    workbenchErrorBarWidget.showMessage("测点编码只能为字母数字和下划线");
    return false;
}
//判断测点名称
var itemName = $("#itemSetup_itemName").val();
if(!/^[\w\u0391-\uFFE5]+$/.test(itemName)) {
    workbenchErrorBarWidget.showMessage("测点名称只能为字母、数字、中文或下划线");
    return false;
}
// 修正公式的代入变量
var fields = {
    'n': 1
};

var purpose = $("#itemSetuppurposeid").val();
var errMsg = "";
if("MESBasic001/01" == purpose) {
    var error = validateForm_MESBasic_itemManage_itemSetup_itemEdit_form_custom();
    if(!error) {
        return false;
    }
}
var formula = $("#itemSetup_formula").val();
var flag = true;

if(null == formula || formula.length == 0) {
    if($("[name='itemSetup.virtualTag_check']").attr('checked') == 'checked' && $("[name='itemSetup.manuallySet_check']").attr('checked') != 'checked') {
        workbenchErrorBarWidget.showMessage("勾选<b>虚拟位号</b>但未勾选<b>手动设置相关测点</b>时，计算公式不能为空");
        $("#itemSetup_formula").css("background-color", "#fcd6d6"); //input背景粉色
        $("#itemSetup_formula").parent("div").css("background-color", "#fcd6d6"); //div背景粉色
        $("#itemSetup_formula").parent("div").css("border", "1px solid red"); //边框红色 
        return false;
    }

} else {
    flag = fn(formula, fields, 0);
    if(!flag) {
        workbenchErrorBarWidget.showMessage("计算公式格式不正确，请按正确格式填写");
        return false;
    }
}

var factor = $("#itemSetup_factor").val();

if(null == factor || factor.length == 0) {

} else {

    // 提交到服务器端的字符串不应该包含空白符，或者应该禁止用户输入空白符
    flag = fn(factor, fields, 1);
    if(!flag) {
        workbenchErrorBarWidget.showMessage("修正公式填写错误！");
        return flag;
    }
}

function fn(string, obj, type) {
    // 剔除空白符
    string = string.replace(/\s/g, '');
    // 错误情况，空字符串
    if("" === string) {
        return false;
    }
    // 错误情况，运算符连续
    if(/[\+\-\*\/]{2,}/.test(string)) {
        return false;
    }
    // 空括号
    if(/\(\)/.test(string)) {
        return false;
    }
    // 错误情况，括号不配对
    var stack = [];
    for(var i = 0, item; i < string.length; i++) {
        item = string.charAt(i);
        if('(' === item) {
            stack.push('(');
        } else if(')' === item) {
            if(stack.length > 0) {
                stack.pop();
            } else {
                return false;
            }
        }
    }
    if(0 !== stack.length) {
        return false;
    }
    // 错误情况，(后面是运算符 
    if(/\([\+\-\*\/]/.test(string)) {
        return false;
    }
    // 错误情况，)前面是运算符
    if(/[\+\-\*\/]\)/.test(string)) {
        return false;
    }

    // 错误情况，(前面不是运算符
    if(/[^\+\-\*\/]\(/.test(string)) {
        return false;
    }
    // 错误情况，)后面不是运算符
    if(/\)[^\+\-\*\/]/.test(string)) {
        return false;
    }
    // 错误情况，[前面不是运算符
    if(/[^\+\-\*\/]\[/.test(string)) {
        return false;
    }
    // 错误情况，]后面不是运算符
    if(/\][^\+\-\*\/]/.test(string)) {
        return false;
    }
    //是否包含除0错误
    if(/\/0/.test(string)) {
        return false;
    }

    //是否包含[、]、{、}错误
    if(/{|}/.test(string)) {
        return false;
    }
    // 错误情况，变量没有来自“待选公式变量”
    if(type == 1) { //判断的是修正公式，才需要添加以下判断
        var tmpStr = string.replace(/[\(\)\+\-\*\/]{1,}/g, '`');
        var array = tmpStr.split('`');
        for(var i = 0, item; i < array.length; i++) {
            item = array[i];
            if(/[A-Z]/i.test(item) && 'undefined' === typeof(obj[item])) {
                return false;
            }
        }
    }

    return true;
}

var type = $('#itemSetuptagTypeid').val();
var range = $('#itemSetup_range').val();
var isVirtualTag = $("input[name='itemSetup.virtualTag']").val();
if(type == "TAG_TYPE/0" && isVirtualTag == 'false' && range == "") {
    workbenchErrorBarWidget.showMessage("测点类型为[累积量]时，量程不能为空!");
    return false;
}
if(type == "TAG_TYPE/0" && isVirtualTag == 'false' && range != "" && range <= 0) {
    workbenchErrorBarWidget.showMessage("测点类型为[累积量]时，量程必须为正数!");
    return false;
}

var widget = ItemPart_dg1458633704446Widget;
var manuallyChecked = $('input[type="checkbox"][name="itemSetup.manuallySet_check"]').attr('checked');
if(manuallyChecked == 'checked') {
    if(widget.getRowLength() > 2){
        workbenchErrorBarWidget.showMessage("不允许关联超过两个以上的相关测点!", 'f');
        return false;
    }
    var compareTime = $("[name='itemSetup.compareTime']").val();
    var compareNumber = $("[name='itemSetup.compareNumber']").val();
    if(compareTime == ""){
        workbenchErrorBarWidget.showMessage("勾选<b>手动设置相关测点</b>时, <b>比较时间</b>不能为空!", 'f');
        showErrorField($("input[name='itemSetup.compareTime']"));
        $("input[name='itemSetup.compareTime']").parent().css('background', 'rgb(252, 214, 214)');
        return false;
    }
    if(compareNumber == ""){
        workbenchErrorBarWidget.showMessage("勾选<b>手动设置相关测点</b>时, <b>比较数值</b>不能为空!", 'f');
        showErrorField($("input[name='itemSetup.compareNumber']"));
        $("input[name='itemSetup.compareNumber']").parent().css('background', 'rgb(252, 214, 214)');
        return false;
    }

    for (var i = 0; i < widget.getRowLength(); i++) {
    	var itemStatus = widget.getCellValue(i, 'itemStatus.id');
    	if (itemStatus == "") {
    		// 单元格填充红色
    		$("#ItemPart_dg1458633704446_tbody tr:eq(" + i + ") td[key='itemStatus.id']").attr("class", "validate-error")
    		workbenchErrorBarWidget.showMessage("勾选<b>手动设置相关测点</b>时, <b>状态</b>不能为空!", 'f');
    		return false;
    	}
    }
}
		};
		MESBasic.itemManage.itemSetup.itemEdit.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  MESBasic.itemManage.itemSetup.itemEdit.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		MESBasic.itemManage.itemSetup.itemEdit.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
			var id="#otherContentDiv_"+relatingModelCode;
			if(url.indexOf('?')==-1){
				url+="?mainBusinessId="+mainEntityId+"&businessCenterCode="+businessCenterCode;
			}else{
				url+="&mainBusinessId="+mainEntityId+"&businessCenterCode="+businessCenterCode;
			}
			if(showType == 'PART') {
				url += "&viewShowType=" + showType;
			}
			url += "&useInBusiness=yes";
			$('div[id^="otherContentDiv_"]').each(function(){
				CUI(this).hide();
			});
			CUI(id).show();
			if(CUI(id).html() == null || $.trim(CUI(id).html()) == ""){
				CUI(id).load(url);
				setTimeout(function(){
					CUI("#MESBasic_itemManage_itemSetup_itemEdit_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#MESBasic_itemManage_itemSetup_itemEdit_main_div").hide();
				},100);
				//CUI("#MESBasic_itemManage_itemSetup_itemEdit_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		MESBasic.itemManage.itemSetup.itemEdit.showThis = function(){
			if(!CUI("#MESBasic_itemManage_itemSetup_itemEdit_main_div").is(':visible')) {
				CUI("#MESBasic_itemManage_itemSetup_itemEdit_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		MESBasic.itemManage.itemSetup.itemEdit.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			MESBasic.itemManage.itemSetup.itemEdit.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "MESBasic_itemManage_itemSetup_itemEdit_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=MESBasic&modelName=MESBasic_1_itemManage_ItemSetup&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			MESBasic.itemManage.itemSetup.itemEdit.auditDialog.show();
			</#if>
		}
		
		
		MESBasic.itemManage.itemSetup.itemEdit.showInfoDialog=function(mode){
			
			MESBasic.itemManage.itemSetup.itemEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "MESBasic_itemManage_itemSetup_itemEdit_dealInfo",
				modal:true,
				height:500,
				width: 950,//适应国际化版
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			MESBasic.itemManage.itemSetup.itemEdit.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		MESBasic.itemManage.itemSetup.itemEdit.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=MESBasic_1_itemManage");
			}
		}
		
		MESBasic.itemManage.itemSetup.itemEdit.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/MESBasic/itemManage/itemSetup/dealInfo-list.action&dlTableInfoId=${(itemSetup.tableInfoId)?default('')}");
			}
		}
		MESBasic.itemManage.itemSetup.itemEdit.showFlowInfo=function(){
		     //IE8环境下使用旧版flash流程展现页面，其他情况使用html5流程展现页面
		    var browser=navigator.appName; 
			var b_version=navigator.appVersion; 
			var version=b_version.split(";"); 
			var trim_Version=version[1]&&version[1].replace(/[ ]/g,"");
			var isIE8=(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE8.0")||($.browser.msie&&(Number($.browser.version)<= 8));//IE8兼容视图模式下浏览器版本判断逻辑补充
			if(CUI.trim(CUI("#flowDiv").html())==""){
				if(isIE8){
				    CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=MESBasic_1_itemManage_ItemSetup&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(itemSetup.tableInfoId)?default('')}");
				}else{
				    CUI("#flowDiv").load("/ec/workflow/flowViewH5.action?env=runtime&modelCode=MESBasic_1_itemManage_ItemSetup&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(itemSetup.tableInfoId)?default('')}");
				}		
			}else{
			  if(!isIE8){
			    //h5展现的情况下需重新适应视图大小
			    setTimeout(function(){
			      $("#flowH5Frame").contents().find("#resetFitView").trigger("click");//视图自适应容器大小 
			    },100); 
			  } 
			}
		}
		MESBasic.itemManage.itemSetup.itemEdit.supervision=function(){
			MESBasic.itemManage.itemSetup.itemEdit.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(itemSetup.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				MESBasic.itemManage.itemSetup.itemEdit.modifyOwnerStaffDialog.show();
		}
		
function changeStyle(){
	var itemType = $("#itemSetuppurposeid").val();
	if("MESBasic001/01" == itemType){
		$("label[value*='时延(s)']").css('color','rgb(179, 3, 3)');
		$("label[value*='位号属性']").css('color','rgb(179, 3, 3)');
		$("label[value*='能源类型']").css('color','rgb(179, 3, 3)');
		$("label[value*='单位名称']").css('color','rgb(179, 3, 3)');
		$("label[value*='数据频率']").css('color','rgb(179, 3, 3)');
	}else{
		$("label[value*='时延(s)']").css('color','');
		$("label[value*='位号属性']").css('color','');
		$("label[value*='能源类型']").css('color','');
		$("label[value*='单位名称']").css('color','');
		$("label[value*='数据频率']").css('color','');
	}
}
function changeVirtualTag(){
  /*var type = $('#itemSetuptagTypeid').val();
    var isVirtualTag = $("input[name='itemSetup.virtualTag']").val();
    if(type=="TAG_TYPE/0" && isVirtualTag=='false'){
        $('#itemSetup_range').removeAttr('readOnly');
    }else{
        $('#itemSetup_range').val("");
        $('#itemSetup_range').attr('readOnly',true);
    }*/
    var type = $("[name='itemSetup.tagType.id']").val();
    var isChecked = $("[name='itemSetup.virtualTag_check']").attr('checked');
    if(isChecked == 'checked'){ //虚拟位号

        $('#itemSetup_itemNumber').attr('readonly','readonly');
        $('#itemSetup_itemNumber').css('background','#f2f2f2');
        $('#itemSetup_itemNumber').parent().css('background','#f2f2f2');
        
        $('#itemSetup_formula').removeAttr('readonly');
        $('#itemSetup_formula').css('background','white');
        $('#itemSetup_formula').parent().css('background','white');
        
        $('#itemSetup_factor').attr('readonly','readonly');
        $('#itemSetup_factor').css('background','#f2f2f2');
        $('#itemSetup_factor').parent().css('background','#f2f2f2');

        $('#ItemPart_dg1458633704446').show();
        MESBasic.itemManage.itemSetup.itemEdit.initSize();  

        $('#itemSetup_range').attr('value','');
        $('#itemSetup_range').css('background','#f2f2f2');
        $('#itemSetup_range').parent().css('background','#f2f2f2');
        $('#itemSetup_range').attr('readOnly',true);

        // "手动设置相关测点"可编辑 - added by ww 2019-05-10
        $("[name='itemSetup.manuallySet_check']").removeAttr("disabled");
        // 隐藏pt增删行按钮
        $("#ItemPart_dg1458633704446 .paginatorbar-operatebar").hide();

    } else { // 真实位号

        $('#itemSetup_itemNumber').removeAttr('readonly');
        $('#itemSetup_itemNumber').css('background','white');
        $('#itemSetup_itemNumber').parent().css('background','white');

        $('#itemSetup_formula').attr('readonly','readonly');
        $('#itemSetup_formula').css('background','#f2f2f2');
        $('#itemSetup_formula').parent().css('background','#f2f2f2');

        $('#itemSetup_factor').removeAttr('readonly');
        $('#itemSetup_factor').css('background','white');
        $('#itemSetup_factor').parent().css('background','white');

        // 清空计算公式
        $("[name='itemSetup.formula']").val('');
        // "手动设置相关测点"只读 - added by ww 2019-05-10
        $("[name='itemSetup.manuallySet']").val(false);
        $("[name='itemSetup.manuallySet_check']").removeAttr("checked");
        $("[name='itemSetup.manuallySet_check']").attr("disabled", true);
        // "比较时间"、"比较数值"只读 - added by ww 2019-05-10
        $('#itemSetup_compareTime').attr('readonly','readonly');
        $('#itemSetup_compareTime').css('background','#f2f2f2');
        $('#itemSetup_compareTime').parent().css('background','#f2f2f2');
        $('#itemSetup_compareNumber').attr('readonly','readonly');
        $('#itemSetup_compareNumber').css('background','#f2f2f2');
        $('#itemSetup_compareNumber').parent().css('background','#f2f2f2');
        $("[name='itemSetup.compareTime']").parent().parent().prev().css('color','');
        $("[name='itemSetup.compareNumber']").parent().parent().prev().css('color','');
        // 移除保存校验后产生的border color
        $("input[name='itemSetup.compareTime']").parent().attr('class', 'fix-input');
        $("input[name='itemSetup.compareNumber']").parent().attr('class', 'fix-input');

        $('#ItemPart_dg1458633704446').hide();

        // 取消勾选虚拟位号时, 清空表体
        datatable_ItemPart_dg1458633704446._DT.delAllRows();
        // 设置"状态"单元格label为黑色 - added by ww 2019-05-30
        $("#ItemPart_dg1458633704446_hdbox thead [key='itemStatus.id'] .dg-hd-td-label").css("color", "");

        // 能源测点必须填写量程
        if(type == "TAG_TYPE/0"){
            $('#itemSetup_range').removeAttr('readOnly');
            $('#itemSetup_range').css('background','white');
            $('#itemSetup_range').parent().css('background','white');
        } 
    }
}
function changeTagType(){
  var type = $('#itemSetuptagTypeid').val();
  var isVirtualTag = $("input[name='itemSetup.virtualTag']").val();
	if(type=="TAG_TYPE/0" && isVirtualTag=='false'){
		$('#itemSetup_range').removeAttr('readOnly');
		$('#itemSetup_range').css('background','white');
		$('#itemSetup_range').parent().css('background','white');
	}else{
		$('#itemSetup_range').attr('value','');
		$('#itemSetup_range').css('background','#f2f2f2');
		$('#itemSetup_range').parent().css('background','#f2f2f2');
		$('#itemSetup_range').attr('readOnly',true);
	}
};
function manuallySetOnChange(){
  var widget = ItemPart_dg1458633704446Widget;
  var isChecked = $("[name='itemSetup.manuallySet_check']").attr('checked');
  if(isChecked == 'checked'){
    // 清空计算公式
    $("[name='itemSetup.formula']").val('');
    // 计算公式只读
    $('#itemSetup_formula').attr('readonly','readonly');
    $('#itemSetup_formula').css('background','#f2f2f2');
    $('#itemSetup_formula').parent().css('background','#f2f2f2');

    // "比较时间"、"比较数值"可编辑 - added by ww 2019-05-10
    $('#itemSetup_compareTime').removeAttr('readonly');
    $('#itemSetup_compareTime').css('background','white');
    $('#itemSetup_compareTime').parent().css('background','white');
    $('#itemSetup_compareNumber').removeAttr('readonly');
    $('#itemSetup_compareNumber').css('background','white');
    $('#itemSetup_compareNumber').parent().css('background','white');
    // "比较时间"、"比较数值" label设置为红色
    $("[name='itemSetup.compareTime']").parent().parent().prev().css('color','rgb(179, 3, 3)');
    $("[name='itemSetup.compareNumber']").parent().parent().prev().css('color','rgb(179, 3, 3)');
    // 移除保存校验后产生的border color
    $("input[name='itemSetup.compareTime']").parent().attr('class', 'fix-input');
    $("input[name='itemSetup.compareNumber']").parent().attr('class', 'fix-input');

    // 设置"状态"单元格label为红色
    $("#ItemPart_dg1458633704446_hdbox thead [key='itemStatus.id'] .dg-hd-td-label").css("color", "rgb(179, 3, 3)");

    // 选中时, 显示增删行按钮
    $("#ItemPart_dg1458633704446 .paginatorbar-operatebar").show();
    // 设置PT所有单元格可编辑
    for (var i = 0; i < widget.getRowLength(); i++) {
      widget.setCellProperty(i, 'itemView.code', 'readonly', '');
      widget.setCellProperty(i, 'itemStatus.id', 'readonly', '');
    }

  } else {

    // 计算公式可编辑
    $('#itemSetup_formula').removeAttr('readonly');
    $('#itemSetup_formula').css('background','white');
    $('#itemSetup_formula').parent().css('background','white');
    // "比较时间"、"比较数值"只读 - added by ww 2019-05-10
    $('#itemSetup_compareTime').attr('readonly','readonly');
    $('#itemSetup_compareTime').css('background','#f2f2f2');
    $('#itemSetup_compareTime').parent().css('background','#f2f2f2');
    $('#itemSetup_compareNumber').attr('readonly','readonly');
    $('#itemSetup_compareNumber').css('background','#f2f2f2');
    $('#itemSetup_compareNumber').parent().css('background','#f2f2f2');

    $("[name='itemSetup.compareTime']").parent().parent().prev().css('color','');
    $("[name='itemSetup.compareNumber']").parent().parent().prev().css('color','');

    // 清空"比较时间"、"比较数值"
    $("[name='itemSetup.compareTime']").val('');
    $("[name='itemSetup.compareNumber']").val('');
    // 移除保存校验后产生的border color
    $("input[name='itemSetup.compareTime']").parent().attr('class', 'fix-input');
    $("input[name='itemSetup.compareNumber']").parent().attr('class', 'fix-input');

    // 设置"状态"单元格label为黑色
    $("#ItemPart_dg1458633704446_hdbox thead [key='itemStatus.id'] .dg-hd-td-label").css("color", "");

    // 取消选中时, 隐藏增删行按钮
    $("#ItemPart_dg1458633704446 .paginatorbar-operatebar").hide();
    // 设置PT所有单元格只读
    for (var i = 0; i < widget.getRowLength(); i++) {
      widget.setCellProperty(i, 'itemView.code', 'readonly', 'true');
      widget.setCellProperty(i, 'itemStatus.id', 'readonly', 'true');
    }

  }
}


function itemSetupBeforeCallback(obj){
	var errorMsg = "";
    var widget = ItemPart_dg1458633704446Widget;
    var currentLength = widget.getRowLength();
	if(currentLength + obj.length > 3){
		errorMsg += "只允许手动关联两个相关测点!";
    	MESBasic_itemManage_itemSetup_nonEnergyOnlyRefErrorbarWidget.close();
        MESBasic_itemManage_itemSetup_nonEnergyOnlyRefErrorbarWidget.showMessage(errorMsg,'f');
        return false;
	}
    
    // 校验表体中是否已存在相同的储罐
    for (var i = 0; i < obj.length; i++) {
        for (var j = 0; j < widget.getRowLength(); j++) {
            // 将参照视图中选中的记录与pt每一行的储罐编号进行比较
            var itemCode = widget.getCellValue(j, 'itemView.code');
            if(obj[i].code == itemCode){
                errorMsg += "测点编码[" + itemCode + "]已存在，不允许重复添加！</br>";
            }
        }
    }
    if(errorMsg != ""){
        // 提示错误信息
        MESBasic_itemManage_itemSetup_nonEnergyOnlyRefErrorbarWidget.close();
        MESBasic_itemManage_itemSetup_nonEnergyOnlyRefErrorbarWidget.showMessage(errorMsg,'f');
        return false;
    }
}

		/* CUSTOM CODE START(view-EDIT-MESBasic_1_itemManage_itemEdit,js,MESBasic_1_itemManage_ItemSetup,MESBasic_1) */
// 自定义代码
function validateForm_MESBasic_itemManage_itemSetup_itemEdit_form_custom() {
    	var oErrorWidget = null;
			oErrorWidget = workbenchErrorBarWidget;
		//每次提交时先隐藏上次报错信息
		try{
			oErrorWidget.close();
		}catch(e){
		
		}
    	
        var validateRequiredFlag = true;
		var cancelItem = $('input[name="workFlowVarStatus"]');
        validateRequiredFlag = $('input[name="operateType"]').val()=='submit' && (!cancelItem || cancelItem.length == 0 || !(cancelItem.val()=='cancel' || cancelItem.val()=='reject'));
        form = document.getElementById("MESBasic_itemManage_itemSetup_itemEdit_form");
        clearErrorMessages(form);
        clearErrorLabels(form);

        var errors = false;
        var field = null;
        var continueValidation = true;
        var errorFields = new Array();
        var errorMessages = new Array();
        var validateFields = {};
        // field name: itemSetup.code
        // validator name: requiredstring
        //console.log('requiredstring');
        if($('[name="itemSetup.code"]', form).length > 0) {
        	if(!validateFields['itemSetup.code|requiredstring']&& ($('*[name="itemSetup.code"][type!="hidden"]', CUI(form)).length>0 || $('textarea[name="itemSetup.code"]', form).length>0 || ($('input[name="itemSetup.code"]', form).length>0 && $('input[name="itemSetup.code"]', form).next('input').attr('name')=="itemSetup_code") || $('input[name="itemSetup.code"][#itemSetup.code-select-time]', form).length>0|| $('select[name="itemSetup.code"][name^="_complex_"]', form).length>0 || $('[name="itemSetup.code"][name$="EnumName"][name^="_complex_"]', form).length>0 || $('[name="itemSetup.code"][validateType="SystemCode"]', form).length>0 ||($('[name="itemSetup.code"][name$=".id"]', CUI(form)).length>0 || $('[name="itemSetup.code"][iscustom="true"]', form).length>0))) {
	        	validateFields['itemSetup.code|requiredstring']='itemSetup.code|requiredstring';
	       		field = $('*[name="itemSetup.code"][type!="hidden"]', CUI(form)).get(0);
	       		if(field == null) {
	       			field = $('textarea[name="itemSetup.code"]', CUI(form)).get(0);
	       			if(field == null) {
	       				field = $('[name="itemSetup.code"][name$=".id"]', CUI(form)).get(0);
	       				if(field == null) {
		       				field = $('[name="itemSetup.code"]', CUI(form)).get(0);
		       				if(field == null) {
			       				field = $('[name="itemSetup.code"][validateType="SystemCode"]', CUI(form)).get(0);
			       				if(field == null) {
			       					field = $('input[name="itemSetup.code"]', form).get(0);
			       				}
			       			}
		       			}
	       			}
	       		}
	            var error = "<b>测点编码<\/b>不允许为空！";
	           	var flag = false;
	            if(field.type == 'radio' && validateRequiredFlag) {
	            	$('input[name="' + field.name + '"]:radio').each(function(){
	            		if(this.checked) {
	            			flag = true;
	            		}
	            	});
	            	if(!flag){
	            		showErrorField($(field).parent());
	            		errorFields.push(field);
		                errorMessages.push(error);
		                errors = true;
		                
	            	}
	            } else if (continueValidation && validateRequiredFlag && field.value != null && (field.value == "" || field.value.replace(/^\s+|\s+$/g,"").length == 0)) {
	                if('itemSetup.code'.endsWith('.id')) {
	            		showErrorField(CUI("*[name^='itemSetup.co'][type!='hidden']", form).first());
	            	} else {
	            		if($(field).attr('validateType') == 'SystemCode') {
	            			showErrorField($('input[type="text"]',$(field).parent('div')));
	            		} else if($(field).css('display') == 'none') {
	            			showErrorField($(field).parent());
	            		} else {
		            		showErrorField(field);
	            		}
	            	}
	                errorFields.push(field);
	                errorMessages.push(error);
	                errors = true;
	                
	            }
	        }
        }

        // field name: itemSetup.itemName
        // validator name: requiredstring
        //console.log('requiredstring');
        if($('[name="itemSetup.itemName"]', form).length > 0) {
        	if(!validateFields['itemSetup.itemName|requiredstring']&& ($('*[name="itemSetup.itemName"][type!="hidden"]', CUI(form)).length>0 || $('textarea[name="itemSetup.itemName"]', form).length>0 || ($('input[name="itemSetup.itemName"]', form).length>0 && $('input[name="itemSetup.itemName"]', form).next('input').attr('name')=="itemSetup_itemName") || $('input[name="itemSetup.itemName"][#itemSetup.itemName-select-time]', form).length>0|| $('select[name="itemSetup.itemName"][name^="_complex_"]', form).length>0 || $('[name="itemSetup.itemName"][name$="EnumName"][name^="_complex_"]', form).length>0 || $('[name="itemSetup.itemName"][validateType="SystemCode"]', form).length>0 ||($('[name="itemSetup.itemName"][name$=".id"]', CUI(form)).length>0 || $('[name="itemSetup.itemName"][iscustom="true"]', form).length>0))) {
	        	validateFields['itemSetup.itemName|requiredstring']='itemSetup.itemName|requiredstring';
	       		field = $('*[name="itemSetup.itemName"][type!="hidden"]', CUI(form)).get(0);
	       		if(field == null) {
	       			field = $('textarea[name="itemSetup.itemName"]', CUI(form)).get(0);
	       			if(field == null) {
	       				field = $('[name="itemSetup.itemName"][name$=".id"]', CUI(form)).get(0);
	       				if(field == null) {
		       				field = $('[name="itemSetup.itemName"]', CUI(form)).get(0);
		       				if(field == null) {
			       				field = $('[name="itemSetup.itemName"][validateType="SystemCode"]', CUI(form)).get(0);
			       				if(field == null) {
			       					field = $('input[name="itemSetup.itemName"]', form).get(0);
			       				}
			       			}
		       			}
	       			}
	       		}
	            var error = "<b>测点名称<\/b>不允许为空！";
	           	var flag = false;
	            if(field.type == 'radio' && validateRequiredFlag) {
	            	$('input[name="' + field.name + '"]:radio').each(function(){
	            		if(this.checked) {
	            			flag = true;
	            		}
	            	});
	            	if(!flag){
	            		showErrorField($(field).parent());
	            		errorFields.push(field);
		                errorMessages.push(error);
		                errors = true;
		                
	            	}
	            } else if (continueValidation && validateRequiredFlag && field.value != null && (field.value == "" || field.value.replace(/^\s+|\s+$/g,"").length == 0)) {
	                if('itemSetup.itemName'.endsWith('.id')) {
	            		showErrorField(CUI("*[name^='itemSetup.itemNa'][type!='hidden']", form).first());
	            	} else {
	            		if($(field).attr('validateType') == 'SystemCode') {
	            			showErrorField($('input[type="text"]',$(field).parent('div')));
	            		} else if($(field).css('display') == 'none') {
	            			showErrorField($(field).parent());
	            		} else {
		            		showErrorField(field);
	            		}
	            	}
	                errorFields.push(field);
	                errorMessages.push(error);
	                errors = true;
	                
	            }
	        }
        }

        // field name: itemSetup.purpose.id
        // validator name: required
        //console.log('required');
        if($('[name="itemSetup.purpose.id"]', form).length > 0) {
        	if(!validateFields['itemSetup.purpose.id|required']&& ($('*[name="itemSetup.purpose.id"][type!="hidden"]', CUI(form)).length>0 || $('textarea[name="itemSetup.purpose.id"]', form).length>0 || ($('input[name="itemSetup.purpose.id"]', form).length>0 && $('input[name="itemSetup.purpose.id"]', form).next('input').attr('name')=="itemSetup_purpose_id") || $('input[name="itemSetup.purpose.id"][#itemSetup.purpose.id-select-time]', form).length>0|| $('select[name="itemSetup.purpose.id"][name^="_complex_"]', form).length>0 || $('[name="itemSetup.purpose.id"][name$="EnumName"][name^="_complex_"]', form).length>0 || $('[name="itemSetup.purpose.id"][validateType="SystemCode"]', form).length>0 ||($('[name="itemSetup.purpose.id"][name$=".id"]', CUI(form)).length>0 || $('[name="itemSetup.purpose.id"][iscustom="true"]', form).length>0))) {
	        	validateFields['itemSetup.purpose.id|required']='itemSetup.purpose.id|required';
	       		field = $('*[name="itemSetup.purpose.id"][type!="hidden"]', CUI(form)).get(0);
	       		if(field == null) {
	       			field = $('textarea[name="itemSetup.purpose.id"]', CUI(form)).get(0);
	       			if(field == null) {
	       				field = $('[name="itemSetup.purpose.id"][name$=".id"]', CUI(form)).get(0);
	       				if(field == null) {
		       				field = $('[name="itemSetup.purpose.id"]', CUI(form)).get(0);
		       				if(field == null) {
			       				field = $('[name="itemSetup.purpose.id"][validateType="SystemCode"]', CUI(form)).get(0);
			       				if(field == null) {
			       					field = $('input[name="itemSetup.purpose.id"]', form).get(0);
			       				}
			       			}
		       			}
	       			}
	       		}
	            var error = "<b>测点用途<\/b>不允许为空！";
	            if (field.value == "" && validateRequiredFlag) {
	            	if('itemSetup.purpose.id'.endsWith('.id') || $('[name="itemSetup.purpose.id"][iscustom="true"]', form).length>0) {
	            		if($(field).prop('tagName') == 'SELECT') {
	            			showErrorField($(field).parent());
	            		} else {
							if( $('[name="itemSetup.purpose.id"][iscustom="true"]', form).length>0 ){
								showErrorField( $( 'input[type="text"]', $('[name="itemSetup.purpose.id"][iscustom="true"]', form).parents('td')[0] ) );
							}else{
								$("*[name^='itemSetup.purpose.'][type!='hidden']", form).each(function(){
									if($(this).parents('td[nullable=false]').length > 0) {
										showErrorField($(this));
									}
								});
							}
	            		}
	            	} else {
	            		if($('input[name="itemSetup.purpose.id"]', form).length>0 && $('input[name="itemSetup.purpose.id"]', form).next('input').attr('name')=="itemSetup_purpose_id") {
	            			showErrorField($(field).next('input'));
	            		} else if($(field).css('display') == 'none') {
	            			showErrorField($(field).parent());
	            		} else {
		            		showErrorField(field);
	            		}
	            	}
	                errorFields.push(field);
	                errorMessages.push(error);
	                errors = true;
	                
	            }
	        }
        }
        // field name: itemSetup.energyType.id
        // validator name: required
        //console.log('required');
        if($('[name="itemSetup.energyType.id"]', form).length > 0) {
        	if(!validateFields['itemSetup.energyType.id|required']&& ($('*[name="itemSetup.energyType.id"][type!="hidden"]', CUI(form)).length>0 || $('textarea[name="itemSetup.energyType.id"]', form).length>0 || ($('input[name="itemSetup.energyType.id"]', form).length>0 && $('input[name="itemSetup.energyType.id"]', form).next('input').attr('name')=="itemSetup_energyType_id") || $('input[name="itemSetup.energyType.id"][#itemSetup.energyType.id-select-time]', form).length>0|| $('select[name="itemSetup.energyType.id"][name^="_complex_"]', form).length>0 || $('[name="itemSetup.energyType.id"][name$="EnumName"][name^="_complex_"]', form).length>0 || $('[name="itemSetup.energyType.id"][validateType="SystemCode"]', form).length>0 ||($('[name="itemSetup.energyType.id"][name$=".id"]', CUI(form)).length>0 || $('[name="itemSetup.energyType.id"][iscustom="true"]', form).length>0))) {
	        	validateFields['itemSetup.energyType.id|required']='itemSetup.energyType.id|required';
	       		field = $('*[name="itemSetup.energyType.id"][type!="hidden"]', CUI(form)).get(0);
	       		if(field == null) {
	       			field = $('textarea[name="itemSetup.energyType.id"]', CUI(form)).get(0);
	       			if(field == null) {
	       				field = $('[name="itemSetup.energyType.id"][name$=".id"]', CUI(form)).get(0);
	       				if(field == null) {
		       				field = $('[name="itemSetup.energyType.id"]', CUI(form)).get(0);
		       				if(field == null) {
			       				field = $('[name="itemSetup.energyType.id"][validateType="SystemCode"]', CUI(form)).get(0);
			       				if(field == null) {
			       					field = $('input[name="itemSetup.energyType.id"]', form).get(0);
			       				}
			       			}
		       			}
	       			}
	       		}
	            var error = "<b>能源类型<\/b>不允许为空！";
	            if (field.value == "" && validateRequiredFlag) {
	            	if('itemSetup.energyType.id'.endsWith('.id') || $('[name="itemSetup.energyType.id"][iscustom="true"]', form).length>0) {
	            		if($(field).prop('tagName') == 'SELECT') {
	            			showErrorField($(field).parent());
	            		} else {
							if( $('[name="itemSetup.energyType.id"][iscustom="true"]', form).length>0 ){
								showErrorField( $( 'input[type="text"]', $('[name="itemSetup.energyType.id"][iscustom="true"]', form).parents('td')[0] ) );
							}else{
								$("*[name^='itemSetup.energyType.'][type!='hidden']", form).each(function(){
									if($(this).parents('td[nullable=false]').length > 0) {
										showErrorField($(this));
									}
								});
							}
	            		}
	            	} else {
	            		if($('input[name="itemSetup.energyType.id"]', form).length>0 && $('input[name="itemSetup.energyType.id"]', form).next('input').attr('name')=="itemSetup_energyType_id") {
	            			showErrorField($(field).next('input'));
	            		} else if($(field).css('display') == 'none') {
	            			showErrorField($(field).parent());
	            		} else {
		            		showErrorField(field);
	            		}
	            	}
	                errorFields.push(field);
	                errorMessages.push(error);
	                errors = true;
	                
	            }
	        }
        }
        // field name: itemSetup.itemClass.id
        // validator name: required
        //console.log('required');
        if($('[name="itemSetup.itemClass.id"]', form).length > 0) {
        	if(!validateFields['itemSetup.itemClass.id|required']&& ($('*[name="itemSetup.itemClass.id"][type!="hidden"]', CUI(form)).length>0 || $('textarea[name="itemSetup.itemClass.id"]', form).length>0 || ($('input[name="itemSetup.itemClass.id"]', form).length>0 && $('input[name="itemSetup.itemClass.id"]', form).next('input').attr('name')=="itemSetup_itemClass_id") || $('input[name="itemSetup.itemClass.id"][#itemSetup.itemClass.id-select-time]', form).length>0|| $('select[name="itemSetup.itemClass.id"][name^="_complex_"]', form).length>0 || $('[name="itemSetup.itemClass.id"][name$="EnumName"][name^="_complex_"]', form).length>0 || $('[name="itemSetup.itemClass.id"][validateType="SystemCode"]', form).length>0 ||($('[name="itemSetup.itemClass.id"][name$=".id"]', CUI(form)).length>0 || $('[name="itemSetup.itemClass.id"][iscustom="true"]', form).length>0))) {
	        	validateFields['itemSetup.itemClass.id|required']='itemSetup.itemClass.id|required';
	       		field = $('*[name="itemSetup.itemClass.id"][type!="hidden"]', CUI(form)).get(0);
	       		if(field == null) {
	       			field = $('textarea[name="itemSetup.itemClass.id"]', CUI(form)).get(0);
	       			if(field == null) {
	       				field = $('[name="itemSetup.itemClass.id"][name$=".id"]', CUI(form)).get(0);
	       				if(field == null) {
		       				field = $('[name="itemSetup.itemClass.id"]', CUI(form)).get(0);
		       				if(field == null) {
			       				field = $('[name="itemSetup.itemClass.id"][validateType="SystemCode"]', CUI(form)).get(0);
			       				if(field == null) {
			       					field = $('input[name="itemSetup.itemClass.id"]', form).get(0);
			       				}
			       			}
		       			}
	       			}
	       		}
	            var error = "<b>位号属性<\/b>不允许为空！";
	            if (field.value == "" && validateRequiredFlag) {
	            	if('itemSetup.itemClass.id'.endsWith('.id') || $('[name="itemSetup.itemClass.id"][iscustom="true"]', form).length>0) {
	            		if($(field).prop('tagName') == 'SELECT') {
	            			showErrorField($(field).parent());
	            		} else {
							if( $('[name="itemSetup.itemClass.id"][iscustom="true"]', form).length>0 ){
								showErrorField( $( 'input[type="text"]', $('[name="itemSetup.itemClass.id"][iscustom="true"]', form).parents('td')[0] ) );
							}else{
								$("*[name^='itemSetup.itemClass.'][type!='hidden']", form).each(function(){
									if($(this).parents('td[nullable=false]').length > 0) {
										showErrorField($(this));
									}
								});
							}
	            		}
	            	} else {
	            		if($('input[name="itemSetup.itemClass.id"]', form).length>0 && $('input[name="itemSetup.itemClass.id"]', form).next('input').attr('name')=="itemSetup_itemClass_id") {
	            			showErrorField($(field).next('input'));
	            		} else if($(field).css('display') == 'none') {
	            			showErrorField($(field).parent());
	            		} else {
		            		showErrorField(field);
	            		}
	            	}
	                errorFields.push(field);
	                errorMessages.push(error);
	                errors = true;
	                
	            }
	        }
        }
        // field name: itemSetup.frequency.id
        // validator name: required
        //console.log('required');
        if($('[name="itemSetup.frequency.id"]', form).length > 0) {
        	if(!validateFields['itemSetup.frequency.id|required']&& ($('*[name="itemSetup.frequency.id"][type!="hidden"]', CUI(form)).length>0 || $('textarea[name="itemSetup.frequency.id"]', form).length>0 || ($('input[name="itemSetup.frequency.id"]', form).length>0 && $('input[name="itemSetup.frequency.id"]', form).next('input').attr('name')=="itemSetup_frequency_id") || $('input[name="itemSetup.frequency.id"][#itemSetup.frequency.id-select-time]', form).length>0|| $('select[name="itemSetup.frequency.id"][name^="_complex_"]', form).length>0 || $('[name="itemSetup.frequency.id"][name$="EnumName"][name^="_complex_"]', form).length>0 || $('[name="itemSetup.frequency.id"][validateType="SystemCode"]', form).length>0 ||($('[name="itemSetup.frequency.id"][name$=".id"]', CUI(form)).length>0 || $('[name="itemSetup.frequency.id"][iscustom="true"]', form).length>0))) {
	        	validateFields['itemSetup.frequency.id|required']='itemSetup.frequency.id|required';
	       		field = $('*[name="itemSetup.frequency.id"][type!="hidden"]', CUI(form)).get(0);
	       		if(field == null) {
	       			field = $('textarea[name="itemSetup.frequency.id"]', CUI(form)).get(0);
	       			if(field == null) {
	       				field = $('[name="itemSetup.frequency.id"][name$=".id"]', CUI(form)).get(0);
	       				if(field == null) {
		       				field = $('[name="itemSetup.frequency.id"]', CUI(form)).get(0);
		       				if(field == null) {
			       				field = $('[name="itemSetup.frequency.id"][validateType="SystemCode"]', CUI(form)).get(0);
			       				if(field == null) {
			       					field = $('input[name="itemSetup.frequency.id"]', form).get(0);
			       				}
			       			}
		       			}
	       			}
	       		}
	            var error = "<b>数据频率<\/b>不允许为空！";
	            if (field.value == "" && validateRequiredFlag) {
	            	if('itemSetup.frequency.id'.endsWith('.id') || $('[name="itemSetup.frequency.id"][iscustom="true"]', form).length>0) {
	            		if($(field).prop('tagName') == 'SELECT') {
	            			showErrorField($(field).parent());
	            		} else {
							if( $('[name="itemSetup.frequency.id"][iscustom="true"]', form).length>0 ){
								showErrorField( $( 'input[type="text"]', $('[name="itemSetup.frequency.id"][iscustom="true"]', form).parents('td')[0] ) );
							}else{
								$("*[name^='itemSetup.frequency.'][type!='hidden']", form).each(function(){
									if($(this).parents('td[nullable=false]').length > 0) {
										showErrorField($(this));
									}
								});
							}
	            		}
	            	} else {
	            		if($('input[name="itemSetup.frequency.id"]', form).length>0 && $('input[name="itemSetup.frequency.id"]', form).next('input').attr('name')=="itemSetup_frequency_id") {
	            			showErrorField($(field).next('input'));
	            		} else if($(field).css('display') == 'none') {
	            			showErrorField($(field).parent());
	            		} else {
		            		showErrorField(field);
	            		}
	            	}
	                errorFields.push(field);
	                errorMessages.push(error);
	                errors = true;
	                
	            }
	        }
        }
        // field name: itemSetup.tagType.id
        // validator name: required
        //console.log('required');
        if($('[name="itemSetup.tagType.id"]', form).length > 0) {
        	if(!validateFields['itemSetup.tagType.id|required']&& ($('*[name="itemSetup.tagType.id"][type!="hidden"]', CUI(form)).length>0 || $('textarea[name="itemSetup.tagType.id"]', form).length>0 || ($('input[name="itemSetup.tagType.id"]', form).length>0 && $('input[name="itemSetup.tagType.id"]', form).next('input').attr('name')=="itemSetup_tagType_id") || $('input[name="itemSetup.tagType.id"][#itemSetup.tagType.id-select-time]', form).length>0|| $('select[name="itemSetup.tagType.id"][name^="_complex_"]', form).length>0 || $('[name="itemSetup.tagType.id"][name$="EnumName"][name^="_complex_"]', form).length>0 || $('[name="itemSetup.tagType.id"][validateType="SystemCode"]', form).length>0 ||($('[name="itemSetup.tagType.id"][name$=".id"]', CUI(form)).length>0 || $('[name="itemSetup.tagType.id"][iscustom="true"]', form).length>0))) {
	        	validateFields['itemSetup.tagType.id|required']='itemSetup.tagType.id|required';
	       		field = $('*[name="itemSetup.tagType.id"][type!="hidden"]', CUI(form)).get(0);
	       		if(field == null) {
	       			field = $('textarea[name="itemSetup.tagType.id"]', CUI(form)).get(0);
	       			if(field == null) {
	       				field = $('[name="itemSetup.tagType.id"][name$=".id"]', CUI(form)).get(0);
	       				if(field == null) {
		       				field = $('[name="itemSetup.tagType.id"]', CUI(form)).get(0);
		       				if(field == null) {
			       				field = $('[name="itemSetup.tagType.id"][validateType="SystemCode"]', CUI(form)).get(0);
			       				if(field == null) {
			       					field = $('input[name="itemSetup.tagType.id"]', form).get(0);
			       				}
			       			}
		       			}
	       			}
	       		}
	            var error = "<b>类型<\/b>不允许为空！";
	            if (field.value == "" && validateRequiredFlag) {
	            	if('itemSetup.tagType.id'.endsWith('.id') || $('[name="itemSetup.tagType.id"][iscustom="true"]', form).length>0) {
	            		if($(field).prop('tagName') == 'SELECT') {
	            			showErrorField($(field).parent());
	            		} else {
							if( $('[name="itemSetup.tagType.id"][iscustom="true"]', form).length>0 ){
								showErrorField( $( 'input[type="text"]', $('[name="itemSetup.tagType.id"][iscustom="true"]', form).parents('td')[0] ) );
							}else{
								$("*[name^='itemSetup.tagType.'][type!='hidden']", form).each(function(){
									if($(this).parents('td[nullable=false]').length > 0) {
										showErrorField($(this));
									}
								});
							}
	            		}
	            	} else {
	            		if($('input[name="itemSetup.tagType.id"]', form).length>0 && $('input[name="itemSetup.tagType.id"]', form).next('input').attr('name')=="itemSetup_tagType_id") {
	            			showErrorField($(field).next('input'));
	            		} else if($(field).css('display') == 'none') {
	            			showErrorField($(field).parent());
	            		} else {
		            		showErrorField(field);
	            		}
	            	}
	                errorFields.push(field);
	                errorMessages.push(error);
	                errors = true;
	                
	            }
	        }
        }
		
		/*var virtualFlag = $("input[name='itemSetup.virtualTag']").val();
		if('true' != virtualFlag && true != virtualFlag){ 
			// field name: itemSetup.itemNumber
			// validator name: requiredstring
			//console.log('requiredstring');
			if($('[name="itemSetup.itemNumber"]', form).length > 0) {
				if(!validateFields['itemSetup.itemNumber|requiredstring']&& ($('*[name="itemSetup.itemNumber"][type!="hidden"]', CUI(form)).length>0 || $('textarea[name="itemSetup.itemNumber"]', form).length>0 || ($('input[name="itemSetup.itemNumber"]', form).length>0 && $('input[name="itemSetup.itemNumber"]', form).next('input').attr('name')=="itemSetup_itemNumber") || $('input[name="itemSetup.itemNumber"][#itemSetup.itemNumber-select-time]', form).length>0|| $('select[name="itemSetup.itemNumber"][name^="_complex_"]', form).length>0 || $('[name="itemSetup.itemNumber"][name$="EnumName"][name^="_complex_"]', form).length>0 || $('[name="itemSetup.itemNumber"][validateType="SystemCode"]', form).length>0 ||($('[name="itemSetup.itemNumber"][name$=".id"]', CUI(form)).length>0 || $('[name="itemSetup.itemNumber"][iscustom="true"]', form).length>0))) {
					validateFields['itemSetup.itemNumber|requiredstring']='itemSetup.itemNumber|requiredstring';
					field = $('*[name="itemSetup.itemNumber"][type!="hidden"]', CUI(form)).get(0);
					if(field == null) {
						field = $('textarea[name="itemSetup.itemNumber"]', CUI(form)).get(0);
						if(field == null) {
							field = $('[name="itemSetup.itemNumber"][name$=".id"]', CUI(form)).get(0);
							if(field == null) {
								field = $('[name="itemSetup.itemNumber"]', CUI(form)).get(0);
								if(field == null) {
									field = $('[name="itemSetup.itemNumber"][validateType="SystemCode"]', CUI(form)).get(0);
									if(field == null) {
										field = $('input[name="itemSetup.itemNumber"]', form).get(0);
									}
								}
							}
						}
					}
					var error = "<b>生产位号<\/b>不允许为空！";
					var flag = false;
					if(field.type == 'radio' && validateRequiredFlag) {
						$('input[name="' + field.name + '"]:radio').each(function(){
							if(this.checked) {
								flag = true;
							}
						});
						if(!flag){
							showErrorField($(field).parent());
							errorFields.push(field);
							errorMessages.push(error);
							errors = true;
							
						}
					} else if (continueValidation && validateRequiredFlag && field.value != null && (field.value == "" || field.value.replace(/^\s+|\s+$/g,"").length == 0)) {
						if('itemSetup.itemNumber'.endsWith('.id')) {
							showErrorField(CUI("*[name^='itemSetup.itemNumb'][type!='hidden']", form).first());
						} else {
							if($(field).attr('validateType') == 'SystemCode') {
								showErrorField($('input[type="text"]',$(field).parent('div')));
							} else if($(field).css('display') == 'none') {
								showErrorField($(field).parent());
							} else {
								showErrorField(field);
							}
						}
						errorFields.push(field);
						errorMessages.push(error);
						errors = true;
						
					}
				}
			}
		}*/
        // field name: itemSetup.itemPlace.id
        // validator name: required
        //console.log('required');
        if($('[name="itemSetup.itemPlace.id"]', form).length > 0) {
        	if(!validateFields['itemSetup.itemPlace.id|required']&& ($('*[name="itemSetup.itemPlace.id"][type!="hidden"]', CUI(form)).length>0 || $('textarea[name="itemSetup.itemPlace.id"]', form).length>0 || ($('input[name="itemSetup.itemPlace.id"]', form).length>0 && $('input[name="itemSetup.itemPlace.id"]', form).next('input').attr('name')=="itemSetup_itemPlace_id") || $('input[name="itemSetup.itemPlace.id"][#itemSetup.itemPlace.id-select-time]', form).length>0|| $('select[name="itemSetup.itemPlace.id"][name^="_complex_"]', form).length>0 || $('[name="itemSetup.itemPlace.id"][name$="EnumName"][name^="_complex_"]', form).length>0 || $('[name="itemSetup.itemPlace.id"][validateType="SystemCode"]', form).length>0 ||($('[name="itemSetup.itemPlace.id"][name$=".id"]', CUI(form)).length>0 || $('[name="itemSetup.itemPlace.id"][iscustom="true"]', form).length>0))) {
	        	validateFields['itemSetup.itemPlace.id|required']='itemSetup.itemPlace.id|required';
	       		field = $('*[name="itemSetup.itemPlace.id"][type!="hidden"]', CUI(form)).get(0);
	       		if(field == null) {
	       			field = $('textarea[name="itemSetup.itemPlace.id"]', CUI(form)).get(0);
	       			if(field == null) {
	       				field = $('[name="itemSetup.itemPlace.id"][name$=".id"]', CUI(form)).get(0);
	       				if(field == null) {
		       				field = $('[name="itemSetup.itemPlace.id"]', CUI(form)).get(0);
		       				if(field == null) {
			       				field = $('[name="itemSetup.itemPlace.id"][validateType="SystemCode"]', CUI(form)).get(0);
			       				if(field == null) {
			       					field = $('input[name="itemSetup.itemPlace.id"]', form).get(0);
			       				}
			       			}
		       			}
	       			}
	       		}
	            var error = "<b>位置编码<\/b>不允许为空！";
	            if (field.value == "" && validateRequiredFlag) {
	            	if('itemSetup.itemPlace.id'.endsWith('.id') || $('[name="itemSetup.itemPlace.id"][iscustom="true"]', form).length>0) {
	            		if($(field).prop('tagName') == 'SELECT') {
	            			showErrorField($(field).parent());
	            		} else {
							if( $('[name="itemSetup.itemPlace.id"][iscustom="true"]', form).length>0 ){
								showErrorField( $( 'input[type="text"]', $('[name="itemSetup.itemPlace.id"][iscustom="true"]', form).parents('td')[0] ) );
							}else{
								$("*[name^='itemSetup.itemPlace.'][type!='hidden']", form).each(function(){
									if($(this).parents('td[nullable=false]').length > 0) {
										showErrorField($(this));
									}
								});
							}
	            		}
	            	} else {
	            		if($('input[name="itemSetup.itemPlace.id"]', form).length>0 && $('input[name="itemSetup.itemPlace.id"]', form).next('input').attr('name')=="itemSetup_itemPlace_id") {
	            			showErrorField($(field).next('input'));
	            		} else if($(field).css('display') == 'none') {
	            			showErrorField($(field).parent());
	            		} else {
		            		showErrorField(field);
	            		}
	            	}
	                errorFields.push(field);
	                errorMessages.push(error);
	                errors = true;
	                
	            }
	        }
        }
		

        // field name: itemSetup.dataSouceType.id
        // validator name: required
        //console.log('required');
        if($('[name="itemSetup.dataSouceType.id"]', form).length > 0) {
        	if(!validateFields['itemSetup.dataSouceType.id|required']&& ($('*[name="itemSetup.dataSouceType.id"][type!="hidden"]', CUI(form)).length>0 || $('textarea[name="itemSetup.dataSouceType.id"]', form).length>0 || ($('input[name="itemSetup.dataSouceType.id"]', form).length>0 && $('input[name="itemSetup.dataSouceType.id"]', form).next('input').attr('name')=="itemSetup_dataSouceType_id") || $('input[name="itemSetup.dataSouceType.id"][#itemSetup.dataSouceType.id-select-time]', form).length>0|| $('select[name="itemSetup.dataSouceType.id"][name^="_complex_"]', form).length>0 || $('[name="itemSetup.dataSouceType.id"][name$="EnumName"][name^="_complex_"]', form).length>0 || $('[name="itemSetup.dataSouceType.id"][validateType="SystemCode"]', form).length>0 ||($('[name="itemSetup.dataSouceType.id"][name$=".id"]', CUI(form)).length>0 || $('[name="itemSetup.dataSouceType.id"][iscustom="true"]', form).length>0))) {
	        	validateFields['itemSetup.dataSouceType.id|required']='itemSetup.dataSouceType.id|required';
	       		field = $('*[name="itemSetup.dataSouceType.id"][type!="hidden"]', CUI(form)).get(0);
	       		if(field == null) {
	       			field = $('textarea[name="itemSetup.dataSouceType.id"]', CUI(form)).get(0);
	       			if(field == null) {
	       				field = $('[name="itemSetup.dataSouceType.id"][name$=".id"]', CUI(form)).get(0);
	       				if(field == null) {
		       				field = $('[name="itemSetup.dataSouceType.id"]', CUI(form)).get(0);
		       				if(field == null) {
			       				field = $('[name="itemSetup.dataSouceType.id"][validateType="SystemCode"]', CUI(form)).get(0);
			       				if(field == null) {
			       					field = $('input[name="itemSetup.dataSouceType.id"]', form).get(0);
			       				}
			       			}
		       			}
	       			}
	       		}
	            var error = "<b>数据来源<\/b>不允许为空！";
	            if (field.value == "" && validateRequiredFlag) {
	            	if('itemSetup.dataSouceType.id'.endsWith('.id') || $('[name="itemSetup.dataSouceType.id"][iscustom="true"]', form).length>0) {
	            		if($(field).prop('tagName') == 'SELECT') {
	            			showErrorField($(field).parent());
	            		} else {
							if( $('[name="itemSetup.dataSouceType.id"][iscustom="true"]', form).length>0 ){
								showErrorField( $( 'input[type="text"]', $('[name="itemSetup.dataSouceType.id"][iscustom="true"]', form).parents('td')[0] ) );
							}else{
								$("*[name^='itemSetup.dataSouceType.'][type!='hidden']", form).each(function(){
									if($(this).parents('td[nullable=false]').length > 0) {
										showErrorField($(this));
									}
								});
							}
	            		}
	            	} else {
	            		if($('input[name="itemSetup.dataSouceType.id"]', form).length>0 && $('input[name="itemSetup.dataSouceType.id"]', form).next('input').attr('name')=="itemSetup_dataSouceType_id") {
	            			showErrorField($(field).next('input'));
	            		} else if($(field).css('display') == 'none') {
	            			showErrorField($(field).parent());
	            		} else {
		            		showErrorField(field);
	            		}
	            	}
	                errorFields.push(field);
	                errorMessages.push(error);
	                errors = true;
	                
	            }
	        }
        }
        // field name: itemSetup.unit.id
        // validator name: required
        //console.log('required');
        if($('[name="itemSetup.unit.id"]', form).length > 0) {
        	if(!validateFields['itemSetup.unit.id|required']&& ($('*[name="itemSetup.unit.id"][type!="hidden"]', CUI(form)).length>0 || $('textarea[name="itemSetup.unit.id"]', form).length>0 || ($('input[name="itemSetup.unit.id"]', form).length>0 && $('input[name="itemSetup.unit.id"]', form).next('input').attr('name')=="itemSetup_unit_id") || $('input[name="itemSetup.unit.id"][#itemSetup.unit.id-select-time]', form).length>0|| $('select[name="itemSetup.unit.id"][name^="_complex_"]', form).length>0 || $('[name="itemSetup.unit.id"][name$="EnumName"][name^="_complex_"]', form).length>0 || $('[name="itemSetup.unit.id"][validateType="SystemCode"]', form).length>0 ||($('[name="itemSetup.unit.id"][name$=".id"]', CUI(form)).length>0 || $('[name="itemSetup.unit.id"][iscustom="true"]', form).length>0))) {
	        	validateFields['itemSetup.unit.id|required']='itemSetup.unit.id|required';
	       		field = $('*[name="itemSetup.unit.id"][type!="hidden"]', CUI(form)).get(0);
	       		if(field == null) {
	       			field = $('textarea[name="itemSetup.unit.id"]', CUI(form)).get(0);
	       			if(field == null) {
	       				field = $('[name="itemSetup.unit.id"][name$=".id"]', CUI(form)).get(0);
	       				if(field == null) {
		       				field = $('[name="itemSetup.unit.id"]', CUI(form)).get(0);
		       				if(field == null) {
			       				field = $('[name="itemSetup.unit.id"][validateType="SystemCode"]', CUI(form)).get(0);
			       				if(field == null) {
			       					field = $('input[name="itemSetup.unit.id"]', form).get(0);
			       				}
			       			}
		       			}
	       			}
	       		}
	            var error = "<b>单位名称<\/b>不允许为空！";
	            if (field.value == "" && validateRequiredFlag) {
	            	if('itemSetup.unit.id'.endsWith('.id') || $('[name="itemSetup.unit.id"][iscustom="true"]', form).length>0) {
	            		if($(field).prop('tagName') == 'SELECT') {
	            			showErrorField($(field).parent());
	            		} else {
							if( $('[name="itemSetup.unit.id"][iscustom="true"]', form).length>0 ){
								showErrorField( $( 'input[type="text"]', $('[name="itemSetup.unit.id"][iscustom="true"]', form).parents('td')[0] ) );
							}else{
								$("*[name^='itemSetup.unit.'][type!='hidden']", form).each(function(){
									if($(this).parents('td[nullable=false]').length > 0) {
										showErrorField($(this));
									}
								});
							}
	            		}
	            	} else {
	            		if($('input[name="itemSetup.unit.id"]', form).length>0 && $('input[name="itemSetup.unit.id"]', form).next('input').attr('name')=="itemSetup_unit_id") {
	            			showErrorField($(field).next('input'));
	            		} else if($(field).css('display') == 'none') {
	            			showErrorField($(field).parent());
	            		} else {
		            		showErrorField(field);
	            		}
	            	}
	                errorFields.push(field);
	                errorMessages.push(error);
	                errors = true;
	                
	            }
	        }
        }
        // field name: itemSetup.delay
        // validator name: required
        //console.log('required');
        if($('[name="itemSetup.delay"]', form).length > 0) {
        	if(!validateFields['itemSetup.delay|required']&& ($('*[name="itemSetup.delay"][type!="hidden"]', CUI(form)).length>0 || $('textarea[name="itemSetup.delay"]', form).length>0 || ($('input[name="itemSetup.delay"]', form).length>0 && $('input[name="itemSetup.delay"]', form).next('input').attr('name')=="itemSetup_delay") || $('input[name="itemSetup.delay"][#itemSetup.delay-select-time]', form).length>0|| $('select[name="itemSetup.delay"][name^="_complex_"]', form).length>0 || $('[name="itemSetup.delay"][name$="EnumName"][name^="_complex_"]', form).length>0 || $('[name="itemSetup.delay"][validateType="SystemCode"]', form).length>0 ||($('[name="itemSetup.delay"][name$=".id"]', CUI(form)).length>0 || $('[name="itemSetup.delay"][iscustom="true"]', form).length>0))) {
	        	validateFields['itemSetup.delay|required']='itemSetup.delay|required';
	       		field = $('*[name="itemSetup.delay"][type!="hidden"]', CUI(form)).get(0);
	       		if(field == null) {
	       			field = $('textarea[name="itemSetup.delay"]', CUI(form)).get(0);
	       			if(field == null) {
	       				field = $('[name="itemSetup.delay"][name$=".id"]', CUI(form)).get(0);
	       				if(field == null) {
		       				field = $('[name="itemSetup.delay"]', CUI(form)).get(0);
		       				if(field == null) {
			       				field = $('[name="itemSetup.delay"][validateType="SystemCode"]', CUI(form)).get(0);
			       				if(field == null) {
			       					field = $('input[name="itemSetup.delay"]', form).get(0);
			       				}
			       			}
		       			}
	       			}
	       		}
	            var error = "<b>时延(s)<\/b>不允许为空！";
	            if (field.value == "" && validateRequiredFlag) {
	            	if('itemSetup.delay'.endsWith('.id') || $('[name="itemSetup.delay"][iscustom="true"]', form).length>0) {
	            		if($(field).prop('tagName') == 'SELECT') {
	            			showErrorField($(field).parent());
	            		} else {
							if( $('[name="itemSetup.delay"][iscustom="true"]', form).length>0 ){
								showErrorField( $( 'input[type="text"]', $('[name="itemSetup.delay"][iscustom="true"]', form).parents('td')[0] ) );
							}else{
								$("*[name^='itemSetup.del'][type!='hidden']", form).each(function(){
									if($(this).parents('td[nullable=false]').length > 0) {
										showErrorField($(this));
									}
								});
							}
	            		}
	            	} else {
	            		if($('input[name="itemSetup.delay"]', form).length>0 && $('input[name="itemSetup.delay"]', form).next('input').attr('name')=="itemSetup_delay") {
	            			showErrorField($(field).next('input'));
	            		} else if($(field).css('display') == 'none') {
	            			showErrorField($(field).parent());
	            		} else {
		            		showErrorField(field);
	            		}
	            	}
	                errorFields.push(field);
	                errorMessages.push(error);
	                errors = true;
	                
	            }
	        }
        }

        // field name: _complex_complex_datagrid_1458637676349
        // validator name: requiredstring
        //console.log('requiredstring');
        if($('[name="_complex_complex_datagrid_1458637676349"]', form).length > 0) {
        	if(!validateFields['_complex_complex_datagrid_1458637676349|requiredstring']&& ($('*[name="_complex_complex_datagrid_1458637676349"][type!="hidden"]', CUI(form)).length>0 || $('textarea[name="_complex_complex_datagrid_1458637676349"]', form).length>0 || ($('input[name="_complex_complex_datagrid_1458637676349"]', form).length>0 && $('input[name="_complex_complex_datagrid_1458637676349"]', form).next('input').attr('name')=="_complex_complex_datagrid_1458637676349") || $('input[name="_complex_complex_datagrid_1458637676349"][#_complex_complex_datagrid_1458637676349-select-time]', form).length>0|| $('select[name="_complex_complex_datagrid_1458637676349"][name^="_complex_"]', form).length>0 || $('[name="_complex_complex_datagrid_1458637676349"][name$="EnumName"][name^="_complex_"]', form).length>0 || $('[name="_complex_complex_datagrid_1458637676349"][validateType="SystemCode"]', form).length>0 ||($('[name="_complex_complex_datagrid_1458637676349"][name$=".id"]', CUI(form)).length>0 || $('[name="_complex_complex_datagrid_1458637676349"][iscustom="true"]', form).length>0))) {
	        	validateFields['_complex_complex_datagrid_1458637676349|requiredstring']='_complex_complex_datagrid_1458637676349|requiredstring';
	       		field = $('*[name="_complex_complex_datagrid_1458637676349"][type!="hidden"]', CUI(form)).get(0);
	       		if(field == null) {
	       			field = $('textarea[name="_complex_complex_datagrid_1458637676349"]', CUI(form)).get(0);
	       			if(field == null) {
	       				field = $('[name="_complex_complex_datagrid_1458637676349"][name$=".id"]', CUI(form)).get(0);
	       				if(field == null) {
		       				field = $('[name="_complex_complex_datagrid_1458637676349"]', CUI(form)).get(0);
		       				if(field == null) {
			       				field = $('[name="_complex_complex_datagrid_1458637676349"][validateType="SystemCode"]', CUI(form)).get(0);
			       				if(field == null) {
			       					field = $('input[name="_complex_complex_datagrid_1458637676349"]', form).get(0);
			       				}
			       			}
		       			}
	       			}
	       		}
	            var error = "<b><\/b>不允许为空！";
	           	var flag = false;
	            if(field.type == 'radio' && validateRequiredFlag) {
	            	$('input[name="' + field.name + '"]:radio').each(function(){
	            		if(this.checked) {
	            			flag = true;
	            		}
	            	});
	            	if(!flag){
	            		showErrorField($(field).parent());
	            		errorFields.push(field);
		                errorMessages.push(error);
		                errors = true;
		                
	            	}
	            } else if (continueValidation && validateRequiredFlag && field.value != null && (field.value == "" || field.value.replace(/^\s+|\s+$/g,"").length == 0)) {
	                if('_complex_complex_datagrid_1458637676349'.endsWith('.id')) {
	            		showErrorField(CUI("*[name^='_complex_complex_datagrid_14586376763'][type!='hidden']", form).first());
	            	} else {
	            		if($(field).attr('validateType') == 'SystemCode') {
	            			showErrorField($('input[type="text"]',$(field).parent('div')));
	            		} else if($(field).css('display') == 'none') {
	            			showErrorField($(field).parent());
	            		} else {
		            		showErrorField(field);
	            		}
	            	}
	                errorFields.push(field);
	                errorMessages.push(error);
	                errors = true;
	                
	            }
	        }
        }


		if(errors){
			addError(form,oErrorWidget,errorFields,errorMessages);
		}
		
        return !errors;
    }

		// 参照之前的总行数
        var beforeRow;

		// 测点参照 beforeCallback
        function itemSetup_callback(arr){
            var widget = ItemPart_dg1458633704446Widget;
            var errorMsg = "";
            var currentLength = widget.getRowLength();
			if(currentLength + arr.length > 2){
				errorMsg += "只允许手动关联两个相关测点!";
                MESBasic_itemManage_itemSetup_nonEnergyOnlyRefErrorbarWidget.close();
                MESBasic_itemManage_itemSetup_nonEnergyOnlyRefErrorbarWidget.showMessage(errorMsg,'f');
                return false;
			}
            // 校验表体中是否已存在相同的储罐
            for (var i = 0; i < arr.length; i++) {
                for (var j = 0; j < widget.getRowLength(); j++) {
                    // 将参照视图中选中的记录与pt每一行的储罐编号进行比较
                    var itemCode = widget.getCellValue(j, 'itemView.code');
                    if(arr[i].code == itemCode){
                        errorMsg += "测点编码[" + itemCode + "]已存在，不允许重复添加！<br/>"
                    }
                }
            }
            if(errorMsg != ""){
                // 提示错误信息
                MESBasic_itemManage_itemSetup_nonEnergyOnlyRefErrorbarWidget.close();
                MESBasic_itemManage_itemSetup_nonEnergyOnlyRefErrorbarWidget.showMessage(errorMsg,'f');
                return false;
            }else{
                // 获取增行之前的总行数
                beforeRow = widget.getRowLength();
                /* 原代码start */
                var objName = 'dg1458633704446itemView.code';
                var objArr = objName.split('.');
                var _prefix = "";
                if(objArr.length > 2){
                    _prefix = '.'+ objArr[0] + '.'+ objArr[1];
                }else if(objArr.length <=2){
                    _prefix = '.'+ objArr[0];
                }
                if(_prefix != ''){
                    MESBasic.itemManage.itemSetup.itemEdit._prefix = _prefix.substring(1);
                }                           
                MESBasic.itemManage.itemSetup.itemEdit._oGrid = widget._DT;
                MESBasic.itemManage.itemSetup.itemEdit._sUrl = '/MESBasic/itemManage/itemSetup/nonEnergyOnlyRef.action';
                MESBasic.itemManage.itemSetup.itemEdit._currRow = widget._DT.addNewRow();
                MESBasic.itemManage.itemSetup.itemEdit.getcallBackInfo_DG(arr);
                ItemPart_dg1458633704446_backItemSetupRef(arr);
                itemSetup_dialog.close();
                /* 原代码end */
            }
        }

		// 测点参照 callback
        function ItemPart_dg1458633704446_backItemSetupRef(arr){

            var widget = ItemPart_dg1458633704446Widget;
            for (var i = 0; i < arr.length ; i++) {
                // 要回填的当前行号, beforeRow为参照之前的总行数
                var currentRow = beforeRow + i;
                widget.setCellValue(currentRow, 'itemView.code', arr[i].code);
                widget.setCellValue(currentRow, 'itemView.itemName', arr[i].itemName);
                widget.setCellValue(currentRow, 'itemView.itemNumber', arr[i].itemNumber);
                widget.setCellValue(currentRow, 'itemNumber', arr[i].itemNumber);

            }
        }
/* CUSTOM CODE END */
		MESBasic.itemManage.itemSetup.itemEdit.onloadForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-MESBasic_1_itemManage_itemEdit,onloadForProduct,MESBasic_1_itemManage_ItemSetup,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
		}

		MESBasic.itemManage.itemSetup.itemEdit.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-MESBasic_1_itemManage_itemEdit,onsaveForProduct,MESBasic_1_itemManage_ItemSetup,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */		
		}
		
		</script>
		<script type="text/javascript">
		
		var __last_click_item = null;
		$(".edit-tabs li").click(function(){
			var li = $(this);
			var ul=$("#flowHead").parent()[0];
			if(__last_click_item != null){
				$(ul).children().eq(__last_click_item).next().addClass("bar");
			}
			if(__last_click_item == null){
				__last_click_item = li.index();
			}
			__last_click_item = li.index();
			if(li.index() == ($(".edit-tabs li").length-1)){
			}else{
				li.next().removeClass("bar");
			}
			if(li.index() != 0){
				li.addClass("bar");
			}
			// 触发 resize 事件, 解决用户在其他页签下缩放窗口后，再切换回来时pt等元素宽度会对不上
			setTimeout( function(){
				$(window).trigger('resize');
			}, 100)
		})
		
		</script>
		<script type="text/javascript">
			$(function(){
				$(".edit-btn").hover(
				  function () {
					$(this).addClass("edit-btn-hover");
				  },
				  function () {
					$(this).removeClass("edit-btn-hover");
				  });
				  $(".edit-btn").mousedown(
				  function () {
					$(this).addClass("edit-btn-click");
				  });
				  $(".edit-btn").mouseup(
				  function () {
					$(this).removeClass("edit-btn-click");
				  });
			})
		</script>
		</@s.form>
		<#if businessCenterList??&&businessCenterList?size gt 0 >
		<script type="text/javascript">
			$(function(){
				$(".col-sub").css("display","block");
				$(".main-wrap").css("margin-left",145);
			})
		</script>
		<div class="col-sub">
			<div id="edit_side_btn" class="edit-side-btn"></div>
			<div class="edit-sidebar" id="edit_sidebar" style='height:1000px;'>
			<div class="edit-sidebar-inner" style='height:1000px;'>
				<div class="sidebar-top"><a href="#"  onclick="MESBasic.itemManage.itemSetup.itemEdit.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="MESBasic.itemManage.itemSetup.itemEdit.showBusinessList('${l.relatingModel.code.replace('.','')}',${(itemSetup.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
							</#if>
						</li>
					    </#list>
					</ul>
				</div>
			</div>
			</div>				
		</div>
		</#if>
		
	<div id="printSettingDiv" style="display:none;width:100%;height:100%;text-align:center">
		<input type="hidden" id="printCookie_id" />
		<input type="hidden" id="printCookie_version" />
		<table width="100%" height="100%" align="center" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td class="td_right">
					<input type="checkbox" name="mainContent" id="mainContent" checked="checked" />
				</td>
				<td class="td_left">
					<label>正文</label>
				</td>
				<td class="td_right" name="att">
					<input type="checkbox" name="attachmentInfo" id="attachmentInfo" checked="checked"/>
				</td>
				<td class="td_left" name="att">
					<label>附件信息</label>
				</td>
				<td class="td_right" name="deal">
					<input type="checkbox" name="dealInfo" id="dealInfo" checked="checked"/>
				</td>
				<td class="td_left" name="deal">
					<label>处理意见</label>
				</td>
			</tr>
		</table>
	</div>
		<!--[if IE 6]><div style="clear:both;"></div><![endif]-->
		<iframe style="display:none;" id="downloadFrame" src="about:blank"/>
	</body>
</html>