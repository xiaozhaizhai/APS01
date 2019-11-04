<!-- MESBasic_1/factoryWare/departWareEdit -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1489733902513')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-EDIT-MESBasic_1_factoryWare_departWareEdit,head,MESBasic_1_factoryWare_DepartmentWare,MESBasic_1) -->
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
	CUI.ns('MESBasic.factoryWare.departmentWare.departWareEdit');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "MESBasic_factoryWare_departmentWare">
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
<#assign callbackName ="MESBasic.factoryWare.departmentWare.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="MESBasic_factoryWare_departmentWare_departWareEdit_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="MESBasic_factoryWare_departmentWare_departWareEdit_form" cssStyle="height:100%;" hiddenField="departmentWare.storeId.id,departmentWare.factoryId.id,departmentWare.wareId.id," onsubmitMethod="MESBasic.factoryWare.departmentWare.departWareEdit.beforeSubmitMethod()" ecAction="/MESBasic/factoryWare/departmentWare/departWareEdit/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="departWareEdit">
	<input type="hidden" name="viewCode" value="MESBasic_1_factoryWare_departWareEdit">
	<input type="hidden" name="datagridKey" value="MESBasic_factoryWare_departmentWare_departWareEdit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="departmentWare.version" value="${(departmentWare.version)!0}" />
	<input type="hidden" name="departmentWare.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
		<input type="hidden" name="departmentWare.storeId.id" value="${(departmentWare.storeId.id)!""}"/>
		<input type="hidden" name="departmentWare.factoryId.id" value="${(departmentWare.factoryId.id)!""}"/>
		<input type="hidden" name="departmentWare.wareId.id" value="${(departmentWare.wareId.id)!""}"/>
	<div id="MESBasic_departWareEdit_edit_div" style="height:100%">
		<div id="MESBasic_factoryWare_departmentWare_departWareEdit_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "MESBasic_factoryWare_departmentWare_departWareEdit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=MESBasic_1_factoryWare', null, function(){
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
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr class="dialog_tr">
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1419233767027')}" >${getText('MESBasic.propertydisplayName.radion1419233767027')}</label>
				</td>
				
						<#assign departmentWare_factoryId_code_defaultValue  = ''>
														<#assign departmentWare_factoryId_code_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.radion1419491307826')}" viewType="readonly" deValue="${departmentWare_factoryId_code_defaultValue!}" conditionfunc="MESBasic.factoryWare.departmentWare.departWareEdit._querycustomFunc('departmentWare_factoryId_code')" view=true  value="${(departmentWare.factoryId.code)!}" displayFieldName="code" name="departmentWare.factoryId.code" id="departmentWare_factoryId_code" type="other" url="/MESBasic/factoryModel/factoryModel/factroyRef1.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_factoryWare_departmentWare_departWareEdit_form" editCustomCallback=";" refViewCode="MESBasic_1_factoryModel_factroyRef1" onkeyupfuncname=";_callback_departmentWare_factoryId_code(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(departmentWare.id)?? && (departmentWare.factoryId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${departmentWare.factoryId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_factoryWare_departmentWare_departWareEdit_form',obj, 'departmentWare.factoryId', '/MESBasic/factoryModel/factoryModel/factroyRef1.action');
												CUI.commonFills('MESBasic_factoryWare_departmentWare_departWareEdit_form', 'departmentWare.factoryId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1419232393782')}" >${getText('MESBasic.propertydisplayName.radion1419232393782')}</label>
				</td>
				
						<#assign departmentWare_factoryId_name_defaultValue  = ''>
														<#assign departmentWare_factoryId_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="departmentWare.factoryId.name" id="departmentWare_factoryId_name"  style=";" originalvalue="<#if !newObj || (departmentWare.factoryId.name)?has_content>${(departmentWare.factoryId.name?html)!}<#else>${departmentWare_factoryId_name_defaultValue!}</#if>" value="<#if !newObj || (departmentWare.factoryId.name)?has_content>${(departmentWare.factoryId.name?html)!}<#else>${departmentWare_factoryId_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1484031239866')}" >${getText('MESBasic.propertydisplayName.randon1484031239866')}</label>
				</td>
				
						<#assign departmentWare_wareId_wareCode_defaultValue  = ''>
														<#assign departmentWare_wareId_wareCode_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}" viewType="${viewType!}" deValue="${departmentWare_wareId_wareCode_defaultValue!}" conditionfunc="MESBasic.factoryWare.departmentWare.departWareEdit._querycustomFunc('departmentWare_wareId_wareCode')"  value="${(departmentWare.wareId.wareCode)!}" displayFieldName="wareCode" name="departmentWare.wareId.wareCode" id="departmentWare_wareId_wareCode" type="other" url="/MESBasic/wareMan/ware/wareRef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_factoryWare_departmentWare_departWareEdit_form" editCustomCallback=";" refViewCode="MESBasic_1_wareMan_wareRef" onkeyupfuncname=";_callback_departmentWare_wareId_wareCode(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(departmentWare.id)?? && (departmentWare.wareId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${departmentWare.wareId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_factoryWare_departmentWare_departWareEdit_form',obj, 'departmentWare.wareId', '/MESBasic/wareMan/ware/wareRef.action');
												CUI.commonFills('MESBasic_factoryWare_departmentWare_departWareEdit_form', 'departmentWare.wareId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1484031316281')}" >${getText('MESBasic.propertydisplayName.randon1484031316281')}</label>
				</td>
				
						<#assign departmentWare_wareId_wareName_defaultValue  = ''>
														<#assign departmentWare_wareId_wareName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="departmentWare.wareId.wareName" id="departmentWare_wareId_wareName"  style=";" originalvalue="<#if !newObj || (departmentWare.wareId.wareName)?has_content>${(departmentWare.wareId.wareName?html)!}<#else>${departmentWare_wareId_wareName_defaultValue!}</#if>" value="<#if !newObj || (departmentWare.wareId.wareName)?has_content>${(departmentWare.wareId.wareName?html)!}<#else>${departmentWare_wareId_wareName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1489731651449')}" >${getText('MESBasic.propertydisplayName.randon1489731651449')}</label>
				</td>
				
						<#assign departmentWare_storeId_placeSetCode_defaultValue  = ''>
														<#assign departmentWare_storeId_placeSetCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('MESBasic.viewtitle.randon1489735291062')}" viewType="${viewType!}" deValue="${departmentWare_storeId_placeSetCode_defaultValue!}" conditionfunc="MESBasic.factoryWare.departmentWare.departWareEdit._querycustomFunc('departmentWare_storeId_placeSetCode')"  value="${(departmentWare.storeId.placeSetCode)!}" displayFieldName="placeSetCode" name="departmentWare.storeId.placeSetCode" id="departmentWare_storeId_placeSetCode" type="other" url="/MESBasic/storeSet/storeSet/storeRef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_factoryWare_departmentWare_departWareEdit_form" editCustomCallback=";" refViewCode="MESBasic_1_storeSet_storeRef"  onkeyupfuncname=";_callback_departmentWare_storeId_placeSetCode(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(departmentWare.id)?? && (departmentWare.storeId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${departmentWare.storeId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_factoryWare_departmentWare_departWareEdit_form',obj, 'departmentWare.storeId', '/MESBasic/storeSet/storeSet/storeRef.action');
												CUI.commonFills('MESBasic_factoryWare_departmentWare_departWareEdit_form', 'departmentWare.storeId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
									MESBasic.factoryWare.departmentWare.departWareEdit.query_departmentWare_storeId_placeSetCode = function() {
										var wareId=$('input[name="departmentWare.wareId.id"]').val();
return "wareId="+wareId
									}
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1489731677162')}" >${getText('MESBasic.propertydisplayName.randon1489731677162')}</label>
				</td>
				
						<#assign departmentWare_storeId_placeSetName_defaultValue  = ''>
														<#assign departmentWare_storeId_placeSetName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="departmentWare.storeId.placeSetName" id="departmentWare_storeId_placeSetName"  style=";" originalvalue="<#if !newObj || (departmentWare.storeId.placeSetName)?has_content>${(departmentWare.storeId.placeSetName?html)!}<#else>${departmentWare_storeId_placeSetName_defaultValue!}</#if>" value="<#if !newObj || (departmentWare.storeId.placeSetName)?has_content>${(departmentWare.storeId.placeSetName?html)!}<#else>${departmentWare_storeId_placeSetName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1489732291294')}" >${getText('MESBasic.propertydisplayName.randon1489732291294')}</label>
				</td>
				
						<#assign departmentWare_meno_defaultValue  = ''>
							 							<#assign departmentWare_meno_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input fix-ie7-textarea"><textarea property_type="TEXT" id="departmentWare_meno" originalvalue="<#if !newObj || (departmentWare.meno)?has_content>${(departmentWare.meno?html)!}<#else>${departmentWare_meno_defaultValue?html}</#if>"  name="departmentWare.meno" class="cui-noborder-textarea cui-textarea-auto" style=";" ><#if !newObj || (departmentWare.meno)?has_content>${(departmentWare.meno)!}<#else>${departmentWare_meno_defaultValue}</#if></textarea></div>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1484031944240')}" >${getText('MESBasic.propertydisplayName.randon1484031944240')}</label>
				</td>
				
						<#assign departmentWare_wareId_cargoStatue_defaultValue  = ''>
														<#assign departmentWare_wareId_cargoStatue_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;display:none;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${departmentWare_wareId_cargoStatue_defaultValue!}" formId="MESBasic_factoryWare_departmentWare_departWareEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="departmentWare.wareId.cargoStatue.id" code="storageState" value="${(departmentWare.wareId.cargoStatue.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_factoryWare_departmentWare_departWareEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="departmentWare.wareId.cargoStatue.id" code="storageState" value="${(departmentWare.wareId.cargoStatue.id)!}"  />
									
								</#if>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
		</tr>
	</table>
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
</div>				</div>	
				<div class="edit-datatable">	

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

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
			
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/MESBasic/factoryWare/departmentWare/data-dg1489738203672.action?departmentWare.id=${refId!-1}&refId=${refId!-1}&datagridCode=MESBasic_1_factoryWare_departWareEditdg1489738203672">
			<#else>
				<#assign dUrl="/MESBasic/factoryWare/departmentWare/data-dg1489738203672.action?departmentWare.id=${(departmentWare.id)!-1}&datagridCode=MESBasic_1_factoryWare_departWareEditdg1489738203672">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_FacWareMaterial_dg1489738203672_deldatagrid();}}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_FacWareMaterial_dg1489738203672_deldatagrid();}}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_FacWareMaterial_dg1489738203672" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1489738203672_id" value="FacWareMaterial_dg1489738203672" />
			
			<input type="hidden" id="dg1489738203672_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('MESBasic.modelname.randon1489732341394')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/MESBasic/factoryWare/departmentWare/data-dg1489738203672.action?operateType=export&datagridCode=MESBasic_1_factoryWare_departWareEditdg1489738203672"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="FacWareMaterial_dg1489738203672" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="FacWareMaterial_dg1489738203672" viewType="${viewType}" renderOverEvent="dg1489738203672RenderOverEvent" route="${routeFlag}" formId="MESBasic_factoryWare_departmentWare_departWareEdit_form" noPermissionKeys="productId.productCode,productId.productName,productId.productBaseUnit.name,productId.productModel,productId.productSpecif,meno" modelCode="MESBasic_1_factoryWare_FacWareMaterial" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1489738203672" dtPage="dgPage"  hidekeyPrefix="dg1489738203672" hidekey="['id','version','productId.id','productId.productCode','productId.id','productId.productName','productId.id','productId.productBaseUnit.name','productId.id','productId.productModel','productId.id','productId.productSpecif'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1489738203672PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName  activexButton="" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
								<@datacolumn key="checkbox" textalign="center" label="" width="30" type="checkbox" checkall="true"/>
							<#assign productId_productCode_displayDefaultType=''>
								<#assign productId_productCode_defaultValue=''>
										<#assign productId_productCode_defaultValue=''>
																	<#if (productId_productCode_defaultValue!)?string=="currentUser">
								<#assign productId_productCode_defaultValue='${staffJson!}'>
							<#elseif (productId_productCode_defaultValue!)?string=="currentPost">
								<#assign productId_productCode_defaultValue='${postJson!}'>
							<#elseif (productId_productCode_defaultValue!)?string=="currentDepart">
								<#assign productId_productCode_defaultValue='${deptJson!}'>
							<#elseif (productId_productCode_defaultValue!)?string=="currentComp">
								<#assign productId_productCode_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="productId.productCode"        showFormat="SELECTCOMP" defaultValue="${(productId_productCode_defaultValue!)?string}" defaultDisplay="${(productId_productCode_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false   selectCompName="MESBasic.factoryWare.departmentWare.departWareEdit"  textalign="left"  viewUrl="/MESBasic/product/product/refProductLayout_kc.action" viewCode="MESBasic_1_product_refProductLayout_kc" mneenable=true crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1478746948423')}"  label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" width=100 showFormatFunc=""  />
							<#assign productId_productName_displayDefaultType=''>
								<#assign productId_productName_defaultValue=''>
										<#assign productId_productName_defaultValue=''>
																	<#if (productId_productName_defaultValue!)?string=="currentUser">
								<#assign productId_productName_defaultValue='${staffJson!}'>
							<#elseif (productId_productName_defaultValue!)?string=="currentPost">
								<#assign productId_productName_defaultValue='${postJson!}'>
							<#elseif (productId_productName_defaultValue!)?string=="currentDepart">
								<#assign productId_productName_defaultValue='${deptJson!}'>
							<#elseif (productId_productName_defaultValue!)?string=="currentComp">
								<#assign productId_productName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="productId.productName"        showFormat="TEXT" defaultValue="${(productId_productName_defaultValue!)?string}" defaultDisplay="${(productId_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="MESBasic.factoryWare.departmentWare.departWareEdit"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" width=100 showFormatFunc=""  />
							<#assign productId_productBaseUnit_name_displayDefaultType=''>
								<#assign productId_productBaseUnit_name_defaultValue=''>
										<#assign productId_productBaseUnit_name_defaultValue=''>
																	<#if (productId_productBaseUnit_name_defaultValue!)?string=="currentUser">
								<#assign productId_productBaseUnit_name_defaultValue='${staffJson!}'>
							<#elseif (productId_productBaseUnit_name_defaultValue!)?string=="currentPost">
								<#assign productId_productBaseUnit_name_defaultValue='${postJson!}'>
							<#elseif (productId_productBaseUnit_name_defaultValue!)?string=="currentDepart">
								<#assign productId_productBaseUnit_name_defaultValue='${deptJson!}'>
							<#elseif (productId_productBaseUnit_name_defaultValue!)?string=="currentComp">
								<#assign productId_productBaseUnit_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="productId.productBaseUnit.name"        showFormat="TEXT" defaultValue="${(productId_productBaseUnit_name_defaultValue!)?string}" defaultDisplay="${(productId_productBaseUnit_name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="MESBasic.factoryWare.departmentWare.departWareEdit"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.radion13982356404832323')}" width=100 showFormatFunc=""  />
							<#assign productId_productModel_displayDefaultType=''>
								<#assign productId_productModel_defaultValue=''>
										<#assign productId_productModel_defaultValue=''>
																	<#if (productId_productModel_defaultValue!)?string=="currentUser">
								<#assign productId_productModel_defaultValue='${staffJson!}'>
							<#elseif (productId_productModel_defaultValue!)?string=="currentPost">
								<#assign productId_productModel_defaultValue='${postJson!}'>
							<#elseif (productId_productModel_defaultValue!)?string=="currentDepart">
								<#assign productId_productModel_defaultValue='${deptJson!}'>
							<#elseif (productId_productModel_defaultValue!)?string=="currentComp">
								<#assign productId_productModel_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="productId.productModel"        showFormat="TEXT" defaultValue="${(productId_productModel_defaultValue!)?string}" defaultDisplay="${(productId_productModel_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="MESBasic.factoryWare.departmentWare.departWareEdit"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.radion1415772568665')}" width=100 showFormatFunc=""  />
							<#assign productId_productSpecif_displayDefaultType=''>
								<#assign productId_productSpecif_defaultValue=''>
										<#assign productId_productSpecif_defaultValue=''>
																	<#if (productId_productSpecif_defaultValue!)?string=="currentUser">
								<#assign productId_productSpecif_defaultValue='${staffJson!}'>
							<#elseif (productId_productSpecif_defaultValue!)?string=="currentPost">
								<#assign productId_productSpecif_defaultValue='${postJson!}'>
							<#elseif (productId_productSpecif_defaultValue!)?string=="currentDepart">
								<#assign productId_productSpecif_defaultValue='${deptJson!}'>
							<#elseif (productId_productSpecif_defaultValue!)?string=="currentComp">
								<#assign productId_productSpecif_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="productId.productSpecif"        showFormat="TEXT" defaultValue="${(productId_productSpecif_defaultValue!)?string}" defaultDisplay="${(productId_productSpecif_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="MESBasic.factoryWare.departmentWare.departWareEdit"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.radion1415772620384')}" width=100 showFormatFunc=""  />
							<#assign meno_displayDefaultType=''>
								<#assign meno_defaultValue=''>
										<#assign meno_defaultValue=''>
										  
									<@datacolumn key="meno"  popView=true      showFormat="TEXT" defaultValue="${(meno_defaultValue!)?string}" defaultDisplay="${(meno_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1489732979037')}" width=150 showFormatFunc=""  />
			
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
					;
					//datagrid自定义参数方法
				</script>
			
			<script type="text/javascript">
				function FacWareMaterial_dg1489738203672_check_datagridvalid(){
					//
					var errorObj =FacWareMaterial_dg1489738203672Widget._DT.testData();
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
				
				function savedg1489738203672DataGrid(){
					<#if  refId?? && (refId gt 0)>
					FacWareMaterial_dg1489738203672Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('FacWareMaterial_dg1489738203672Widget') > -1) {
						FacWareMaterial_dg1489738203672Widget.setAllRowEdited();
					}
					var json = FacWareMaterial_dg1489738203672Widget.parseEditedData();
					$('input[name="dg1489738203672ListJson"]').remove();
					$('input[name="dgLists[\'dg1489738203672\']"]').remove();
					$('input[name="dg1489738203672ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1489738203672\']">').val(json).appendTo($('#MESBasic_factoryWare_departmentWare_departWareEdit_form'));
					$('<input type="hidden" name="dg1489738203672ModelCode">').val('MESBasic_1_factoryWare_FacWareMaterial').appendTo($('#MESBasic_factoryWare_departmentWare_departWareEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1489738203672ListJson">').val(json).appendTo($('#MESBasic_factoryWare_departmentWare_departWareEdit_form'));
				}
				function DT_FacWareMaterial_dg1489738203672_deldatagrid(){
					var deleteRows = FacWareMaterial_dg1489738203672Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','headID.id','factoryId.id','productId.id','storeId.id','wareId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1489738203672DeletedIds").length>0){
							$("#dg1489738203672DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1489738203672DeletedIds" name="dgDeletedIds[\'dg1489738203672\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_factoryWare_departmentWare_departWareEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1489738203672DeletedIds['+CUI('input[name^="dg1489738203672DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_factoryWare_departmentWare_departWareEdit_form'));
					});
					return deleteRows;
				}
				function DT_FacWareMaterial_dg1489738203672_delTreeNodes(){
					var deleteRows = FacWareMaterial_dg1489738203672Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','headID.id','factoryId.id','productId.id','storeId.id','wareId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1489738203672DeletedIds").length>0){
							$("#dg1489738203672DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1489738203672DeletedIds" name="dgDeletedIds[\'dg1489738203672\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_factoryWare_departmentWare_departWareEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1489738203672DeletedIds['+CUI('input[name^="dg1489738203672DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_factoryWare_departmentWare_departWareEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('MESBasic_factoryWare_departmentWare_departWareEdit_datagrids');
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
							if(datagrids[0][i] == 'FacWareMaterial_dg1489738203672') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'FacWareMaterial_dg1489738203672';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'FacWareMaterial_dg1489738203672';
					}
					$('body').data('MESBasic_factoryWare_departmentWare_departWareEdit_datagrids', datagrids);
				});
				
				var FacWareMaterial_dg1489738203672_importDialog = null;
				function FacWareMaterial_dg1489738203672_showImportDialog(){
					try{
						if(FacWareMaterial_dg1489738203672_importDialog!=null&&FacWareMaterial_dg1489738203672_importDialog.isShow==1){
							return false;
						}
						var url = "/MESBasic/factoryWare/departmentWare/initImport.action?datagridCode=MESBasic_1_factoryWare_departWareEditdg1489738203672&tid=${id!}&datagridName=dg1489738203672";
							<#if canImportExcel>
								var buttonCode="MESBasic_1_factoryWare_departWareEditdg1489738203672_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						FacWareMaterial_dg1489738203672_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("FacWareMaterial_dg1489738203672"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();FacWareMaterial_dg1489738203672_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();FacWareMaterial_dg1489738203672_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						FacWareMaterial_dg1489738203672_importDialog.show();
					}catch(e){}
				}	
				
				function FacWareMaterial_dg1489738203672_downLoadFile(){
					var url = "/MESBasic/factoryWare/departmentWare/downLoad.action?datagridCode=MESBasic_1_factoryWare_departWareEditdg1489738203672&templateRelatedModelCode=MESBasic_1_factoryWare_departWareEditdg1489738203672&downloadType=template&fileName=dg1489738203672";
					window.open(url,"","");
				}
				function dg1489738203672RenderOverEvent(){
				}
				function dg1489738203672PageInitMethod(nTabIndex){
					MESBasic.factoryWare.departmentWare.departWareEdit.initSize(nTabIndex);
				}
			</script>
			
			
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-EDIT-MESBasic_1_factoryWare_departWareEdit,html,MESBasic_1_factoryWare_DepartmentWare,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	MESBasic.factoryWare.departmentWare.departWareEdit.beforeSaveProcess = function(){}
	MESBasic.factoryWare.departmentWare.departWareEdit.beforeSubmitMethod = function() {
		try{eval("savedg1489738203672DataGrid()");}catch(e){}
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(MESBasic.factoryWare.departmentWare.departWareEdit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#MESBasic_factoryWare_departmentWare_departWareEdit_form').trigger('beforeSubmit');
		//departmentWare.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="departmentWare.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#MESBasic_factoryWare_departmentWare_departWareEdit_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#MESBasic_factoryWare_departmentWare_departWareEdit_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	MESBasic.factoryWare.departmentWare.departWareEdit.validate = function(){
		return true;
	}
	
	
	//打印
	MESBasic.factoryWare.departmentWare.departWareEdit.print = function(url){
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
		
		MESBasic.factoryWare.departmentWare.departWareEdit.saveSetting = function(){
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
		MESBasic.factoryWare.departmentWare.departWareEdit.printSetting = function(){
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
			MESBasic.factoryWare.departmentWare.departWareEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(MESBasic.factoryWare.departmentWare.departWareEdit.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				MESBasic.factoryWare.departmentWare.departWareEdit.settingDialog.show();
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
			MESBasic.factoryWare.departmentWare.departWareEdit._customCallBack = customCallBack;
		}
		MESBasic.factoryWare.departmentWare.departWareEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#MESBasic_factoryWare_departmentWare_departWareEdit_fileupload').length == 0) {
				$('body').append('<div id="MESBasic_factoryWare_departmentWare_departWareEdit_fileupload"></div>');
			}
			MESBasic.factoryWare.departmentWare.departWareEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "MESBasic_factoryWare_departmentWare_departWareEdit_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#MESBasic_factoryWare_departmentWare_departWareEdit_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			MESBasic.factoryWare.departmentWare.departWareEdit.infoDialog.show();
			if($('#MESBasic_factoryWare_departmentWare_departWareEdit_fileupload').html() == '') {
				$('#MESBasic_factoryWare_departmentWare_departWareEdit_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=MESBasic_factoryWare_departmentWare&entityCode=MESBasic_1_factoryWare&dialogId="+dialogId);
			}
		}
	//参照复制函数
	MESBasic.factoryWare.departmentWare.departWareEdit.referenceCopy = function(objName,url, dialog){
		var callbackName ="MESBasic.factoryWare.departmentWare.departWareEdit.referenceCopyBackInfo";
		MESBasic.factoryWare.departmentWare.departWareEdit.dialog = dialog;
		MESBasic.factoryWare.departmentWare.departWareEdit._dialog = foundation.common.select({
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
	
	MESBasic.factoryWare.departmentWare.departWareEdit.referenceCopyBackInfo = function(obj){
		if(MESBasic.factoryWare.departmentWare.departWareEdit._dialog){
			MESBasic.factoryWare.departmentWare.departWareEdit._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,MESBasic.factoryWare.departmentWare.departWareEdit.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('MESBasic_factoryWare_departmentWare_departWareEdit_form','MESBasic_factoryWare_departmentWare_departWareEdit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(MESBasic.factoryWare.departmentWare.departWareEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(MESBasic.factoryWare.departmentWare.departWareEdit.dialog._el).load('/MESBasic/factoryWare/departmentWare/departWareEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( MESBasic.factoryWare.departmentWare.departWareEdit.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + MESBasic.factoryWare.departmentWare.departWareEdit.dialog._config.iframe, MESBasic.factoryWare.departmentWare.departWareEdit.dialog._dialog ).prop( 'src', '/MESBasic/factoryWare/departmentWare/departWareEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(MESBasic.factoryWare.departmentWare.departWareEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(MESBasic.factoryWare.departmentWare.departWareEdit.dialog._el).load('/MESBasic/factoryWare/departmentWare/departWareEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	MESBasic.factoryWare.departmentWare.departWareEdit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		MESBasic.factoryWare.departmentWare.departWareEdit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		MESBasic.factoryWare.departmentWare.departWareEdit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			MESBasic.factoryWare.departmentWare.departWareEdit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	MESBasic.factoryWare.departmentWare.departWareEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'MESBasic_factoryWare_departmentWare_departWareEdit' + '_' + extraFrameParam;
		var callbackName="";
		MESBasic.factoryWare.departmentWare.departWareEdit._prefix = '';
		MESBasic.factoryWare.departmentWare.departWareEdit._oGrid = oGrid;
		MESBasic.factoryWare.departmentWare.departWareEdit._sUrl = url;
		if(customCallBack){
			MESBasic.factoryWare.departmentWare.departWareEdit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			MESBasic.factoryWare.departmentWare.departWareEdit.gridEventObj = gridEventObj;
			callbackName = "MESBasic.factoryWare.departmentWare.departWareEdit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				MESBasic.factoryWare.departmentWare.departWareEdit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "MESBasic.factoryWare.departmentWare.departWareEdit.getMultiselectCallBackInfo_DG" : "MESBasic.factoryWare.departmentWare.departWareEdit.getcallBackInfo_DG";
			MESBasic.factoryWare.departmentWare.departWareEdit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				MESBasic.factoryWare.departmentWare.departWareEdit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="MESBasic.factoryWare.departmentWare.departWareEdit.getcallBackInfo";
		}
		if(MESBasic.factoryWare.departmentWare.departWareEdit._prefix!=''){
			MESBasic.factoryWare.departmentWare.departWareEdit._prefix = MESBasic.factoryWare.departmentWare.departWareEdit._prefix.substring(1);
		}
		if(MESBasic.factoryWare.departmentWare.departWareEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.factoryWare.departmentWare.departWareEdit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof MESBasic.factoryWare.departmentWare.departWareEdit._querycustomFuncN == "function") {
				refparam += MESBasic.factoryWare.departmentWare.departWareEdit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		MESBasic.factoryWare.departmentWare.departWareEdit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.factoryWare.departmentWare.departWareEdit._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.factoryWare.departmentWare.departWareEdit.query_"+obj+")!='undefined'") ? eval('MESBasic.factoryWare.departmentWare.departWareEdit.query_'+obj+'()') : null;
		return str;
	
	};
	
	MESBasic.factoryWare.departmentWare.departWareEdit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('MESBasic_factoryWare_departmentWare_departWareEdit_form',obj[0], MESBasic.factoryWare.departmentWare.departWareEdit._prefix, MESBasic.factoryWare.departmentWare.departWareEdit._sUrl);
		CUI.commonFills('MESBasic_factoryWare_departmentWare_departWareEdit_form',MESBasic.factoryWare.departmentWare.departWareEdit._prefix,obj[0]);

		try{
			if(MESBasic.factoryWare.departmentWare.departWareEdit._customCallBack) {
				eval(MESBasic.factoryWare.departmentWare.departWareEdit._customCallBack);
				MESBasic.factoryWare.departmentWare.departWareEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.factoryWare.departmentWare.departWareEdit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	MESBasic.factoryWare.departmentWare.departWareEdit.getcallBackInfo_DG_IE = function(obj){
		if(MESBasic.factoryWare.departmentWare.departWareEdit._customBeforeCallBack) {
			var flag = eval(MESBasic.factoryWare.departmentWare.departWareEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = MESBasic.factoryWare.departmentWare.departWareEdit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,MESBasic.factoryWare.departmentWare.departWareEdit._sUrl);
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
			if(MESBasic.factoryWare.departmentWare.departWareEdit._customCallBack) {
				eval(MESBasic.factoryWare.departmentWare.departWareEdit._customCallBack);
				MESBasic.factoryWare.departmentWare.departWareEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.factoryWare.departmentWare.departWareEdit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	MESBasic.factoryWare.departmentWare.departWareEdit.getcallBackInfo_DG = function(obj){
		if(MESBasic.factoryWare.departmentWare.departWareEdit._customBeforeCallBack) {
			var flag = eval(MESBasic.factoryWare.departmentWare.departWareEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(MESBasic.factoryWare.departmentWare.departWareEdit._currRow).next().length==0){
					MESBasic.factoryWare.departmentWare.departWareEdit._oGrid.addNewRow();
				}	
				MESBasic.factoryWare.departmentWare.departWareEdit._currRow = $(MESBasic.factoryWare.departmentWare.departWareEdit._currRow).next();
				$(MESBasic.factoryWare.departmentWare.departWareEdit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(MESBasic.factoryWare.departmentWare.departWareEdit._currRow,obj[i],MESBasic.factoryWare.departmentWare.departWareEdit._prefix,MESBasic.factoryWare.departmentWare.departWareEdit._sUrl);
			eval("CUI.commonFills_DG(MESBasic.factoryWare.departmentWare.departWareEdit._currRow,MESBasic.factoryWare.departmentWare.departWareEdit._prefix,obj[i],MESBasic.factoryWare.departmentWare.departWareEdit._oGrid)");
		}
		try{
			if(MESBasic.factoryWare.departmentWare.departWareEdit._customCallBack) {
				eval(MESBasic.factoryWare.departmentWare.departWareEdit._customCallBack);
				MESBasic.factoryWare.departmentWare.departWareEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.factoryWare.departmentWare.departWareEdit._dialog.close();
		} catch(e){}
	};
	
	MESBasic.factoryWare.departmentWare.departWareEdit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(MESBasic.factoryWare.departmentWare.departWareEdit._oGrid, MESBasic.factoryWare.departmentWare.departWareEdit._currRow, MESBasic.factoryWare.departmentWare.departWareEdit._key, MESBasic.factoryWare.departmentWare.departWareEdit._displayFieldName, obj[i])
		}
		try{
			if(MESBasic.factoryWare.departmentWare.departWareEdit._customCallBack) {
				eval(MESBasic.factoryWare.departmentWare.departWareEdit._customCallBack);
				MESBasic.factoryWare.departmentWare.departWareEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.factoryWare.departmentWare.departWareEdit._dialog.close();
		} catch(e){}
	};
	
	MESBasic.factoryWare.departmentWare.departWareEdit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			MESBasic.factoryWare.departmentWare.departWareEdit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#MESBasic_factoryWare_departmentWare_departWareEdit_form'));
        			}
        	   	}
        	}
      	});
	};
	(function($){
		$(function(){
			/*
$('.edit-panes-w table tbody tr').eq(4).hide();
$('#departmentWare_storeId_placeSetCode_click_button').hide();
var wareId=$('#id').val();
if(wareId!=null && wareId!=""){
	$('#departmentWare_wareId_wareCode_click_button').hide();
	$('input[name="departmentWare.wareId.wareCode"]').attr("readonly",true);
	select_departmentWare_wareId_wareCode_clear=function(){};
	//货位不允许修改
	$('#departmentWare_storeId_placeSetCode_click_button').hide();
	select_departmentWare_storeId_placeSetCode_clear=function(){};
}
*/
		});
	})(jQuery);
	MESBasic.factoryWare.departmentWare.departWareEdit.beforeSubmitMethodSettingInPage = function(){
		/*
var wareId=$('#id').val();//获取仓库编码
if(wareId==null || wareId==""||wareId==undefined){//仓库编码不为空时，说明为修改，不校验货位编码
	var cargoStatue= $("input[name='departmentWare.wareId.cargoStatue.id']").val();
	if(cargoStatue=="storageState/storageState1"){
		var placeSetCode=$('input[name="departmentWare.storeId.placeSetCode"]').val();
		if(placeSetCode=='' || placeSetCode==null || placeSetCode==undefined){
			MESBasic_factoryWare_departmentWare_departWareEdit_formDialogErrorBarWidget.showMessage("${getText('MESBasic.propertydisplayName.randon1484031239866002')}");
			return false;
		}
	}
}
*/
//获取表体行数
var productHeight=FacWareMaterial_dg1489738203672Widget.getRowLength();
if(productHeight>1){//当行数大于1时判断物品是否重复
	var message='';
	var arr = new Array(productHeight);
	for(var i=0;i<productHeight;i++){

		var productCode=null;
		var productCode1=FacWareMaterial_dg1489738203672Widget.getCellValue(i,"productId.productCode");
		var productCode2=$('#FacWareMaterial_dg1489738203672 tbody tr:eq('+i+') input[name="productId.productCode"]').val();
		if(productCode1!=null&&productCode1!=""){
			productCode=productCode1;
		}
		if(productCode2!=null&&productCode2!=""){
			productCode=productCode2;
		}
		arr[i]=productCode;
		
	}
	for(var i=0;i<productHeight-1;i++){
		for(var j=i+1;j<productHeight;j++){
			if(arr[i]==arr[j]){
				if(arr[i]!=null){
					message=message+arr[i]+",";
				}
			}
				
		}
	}
	if(message!=''){
		message=message.substring(0,message.length-1);
		MESBasic_factoryWare_departmentWare_departWareEdit_formDialogErrorBarWidget.showMessage("${getText('MESBasic.factorymodel.randon149005882324003','"+message+"')}");
		return false;
	}
}
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	MESBasic.factoryWare.departmentWare.departWareEdit.initCount = 0;
	MESBasic.factoryWare.departmentWare.departWareEdit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#MESBasic_departWareEdit_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('MESBasic_factoryWare_departmentWare_departWareEdit_datagrids');	
		var	conHeight = h-$("#MESBasic_factoryWare_departmentWare_departWareEdit_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#MESBasic_factoryWare_departmentWare_departWareEdit_main_div .edit-panes-s").each(function(index){
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
							if(MESBasic.factoryWare.departmentWare.departWareEdit.initCount <= 2) {
								setTimeout(function(){MESBasic.factoryWare.departmentWare.departWareEdit.initSize();}, 200);
								MESBasic.factoryWare.departmentWare.departWareEdit.initCount++;
							}/* else {
								MESBasic.factoryWare.departmentWare.departWareEdit.initCount = 0;
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
		MESBasic.factoryWare.departmentWare.departWareEdit.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    MESBasic.factoryWare.departmentWare.departWareEdit.initSize(index);
		});
		$(window).bind("dialog.resize",function(){MESBasic.factoryWare.departmentWare.departWareEdit.initSize();});
	});
</script>
<script type="text/javascript">
	



	/* CUSTOM CODE START(view-EDIT-MESBasic_1_factoryWare_departWareEdit,js,MESBasic_1_factoryWare_DepartmentWare,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>