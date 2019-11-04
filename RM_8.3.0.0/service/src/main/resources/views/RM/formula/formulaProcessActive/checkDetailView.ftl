<!-- RM_7.5.0.0/formula/checkDetailView -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1558601719637')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-VIEW-RM_7.5.0.0_formula_checkDetailView,head,RM_7.5.0.0_formula_FormulaProcessActive,RM_7.5.0.0) -->
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
	CUI.ns('RM.formula.formulaProcessActive.checkDetailView');
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
<#assign viewType = "readonly">
<#assign callbackName ="RM.formula.formulaProcessActive.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="RM_formula_formulaProcessActive_checkDetailView_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="RM_formula_formulaProcessActive_checkDetailView_form" cssStyle="height:100%;" hiddenField="formulaProcessActive.formulaId.id,formulaProcessActive.id," onsubmitMethod="RM.formula.formulaProcessActive.checkDetailView.beforeSubmitMethod()" ecAction="/RM/formula/formulaProcessActive/checkDetailView/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="checkDetailView">
	<input type="hidden" name="viewCode" value="RM_7.5.0.0_formula_checkDetailView">
	<input type="hidden" name="datagridKey" value="RM_formula_formulaProcessActive_checkDetailView_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="formulaProcessActive.version" value="${(formulaProcessActive.version)!0}" />
	<input type="hidden" name="formulaProcessActive.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
		<input type="hidden" name="formulaProcessActive.formulaId.id" value="${(formulaProcessActive.formulaId.id)!""}"/>
		<input type="hidden" name="formulaProcessActive.id" value="${(formulaProcessActive.id)!""}"/>
	<div id="RM_checkDetailView_edit_div" style="height:100%">
		<div id="RM_formula_formulaProcessActive_checkDetailView_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "RM_formula_formulaProcessActive_checkDetailView_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=RM_7.5.0.0_formula', null, function(){
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
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487330156499')}" >${getText('RM.propertydisplayName.randon1487330156499')}</label>
				</td>
				
						<#assign formulaProcessActive_name_defaultValue  = ''>
							 							<#assign formulaProcessActive_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="formulaProcessActive.name" id="formulaProcessActive_name"  style=";" originalvalue="<#if !newObj || (formulaProcessActive.name)?has_content>${(formulaProcessActive.name?html)!}<#else>${formulaProcessActive_name_defaultValue!}</#if>" value="<#if !newObj || (formulaProcessActive.name)?has_content>${(formulaProcessActive.name?html)!}<#else>${formulaProcessActive_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487330759313')}" >${getText('RM.propertydisplayName.randon1487330759313')}</label>
				</td>
				
						<#assign formulaProcessActive_activeType_defaultValue  = 'activeType/activeType7'>
							 					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${formulaProcessActive_activeType_defaultValue!}" formId="RM_formula_formulaProcessActive_checkDetailView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formulaProcessActive.activeType.id" code="activeType" value="${(formulaProcessActive.activeType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formulaProcessActive_checkDetailView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formulaProcessActive.activeType.id" code="activeType" value="${(formulaProcessActive.activeType.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487330199423')}" >${getText('RM.propertydisplayName.randon1487330199423')}</label>
				</td>
				
						<#assign formulaProcessActive_occurTurn_defaultValue  = ''>
							 							<#assign formulaProcessActive_occurTurn_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${formulaProcessActive_occurTurn_defaultValue!}" formId="RM_formula_formulaProcessActive_checkDetailView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formulaProcessActive.occurTurn.id" code="occurTurn" value="${(formulaProcessActive.occurTurn.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formulaProcessActive_checkDetailView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formulaProcessActive.occurTurn.id" code="occurTurn" value="${(formulaProcessActive.occurTurn.id)!}"  />
									
								</#if>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1556083208452')}" >${getText('RM.propertydisplayName.randon1556083208452')}</label>
				</td>
				
						<#assign formulaProcessActive_chcekTip_defaultValue  = ''>
							 							<#assign formulaProcessActive_chcekTip_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="formulaProcessActive.chcekTip" id="formulaProcessActive_chcekTip"  style=";" originalvalue="<#if !newObj || (formulaProcessActive.chcekTip)?has_content>${(formulaProcessActive.chcekTip?html)!}<#else>${formulaProcessActive_chcekTip_defaultValue!}</#if>" value="<#if !newObj || (formulaProcessActive.chcekTip)?has_content>${(formulaProcessActive.chcekTip?html)!}<#else>${formulaProcessActive_chcekTip_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487331194516')}" >${getText('RM.propertydisplayName.randon1487331194516')}</label>
				</td>
				
						<#assign formulaProcessActive_meno_defaultValue  = ''>
							 							<#assign formulaProcessActive_meno_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="formulaProcessActive.meno" id="formulaProcessActive_meno"  style=";" originalvalue="<#if !newObj || (formulaProcessActive.meno)?has_content>${(formulaProcessActive.meno?html)!}<#else>${formulaProcessActive_meno_defaultValue!}</#if>" value="<#if !newObj || (formulaProcessActive.meno)?has_content>${(formulaProcessActive.meno?html)!}<#else>${formulaProcessActive_meno_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
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
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:22%'></td><td style='height:0px;border:none;width:29%'></td><td style='height:0px;border:none;width:22%'></td><td style='height:0px;border:none;width:29%'></td></tr>
		<tr class="dialog_tr">
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1488873040389')}" >${getText('RM.propertydisplayName.randon1488873040389')}</label>
				</td>
				
						<#assign formulaProcessActive_formulaHiddenId_defaultValue  = ''>
							 							<#assign formulaProcessActive_formulaHiddenId_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="LONG" name="formulaProcessActive.formulaHiddenId" id="formulaProcessActive_formulaHiddenId"  style=";" originalvalue="<#if !newObj || (formulaProcessActive.formulaHiddenId)?has_content>${(formulaProcessActive.formulaHiddenId?html)!}<#else>${formulaProcessActive_formulaHiddenId_defaultValue!}</#if>" value="<#if !newObj || (formulaProcessActive.formulaHiddenId)?has_content>${(formulaProcessActive.formulaHiddenId?html)!}<#else>${formulaProcessActive_formulaHiddenId_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('ec.common.ID')}" >${getText('ec.common.ID')}</label>
				</td>
				
						<#assign formulaProcessActive_formulaId_id_defaultValue  = ''>
														<#assign formulaProcessActive_formulaId_id_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="LONG" reftitle="${getText('RM.viewtitle.randon1514372721087')}" viewType="${viewType!}" deValue="${formulaProcessActive_formulaId_id_defaultValue!}" conditionfunc="RM.formula.formulaProcessActive.checkDetailView._querycustomFunc('formulaProcessActive_formulaId_id')" view=true  value="${(formulaProcessActive.formulaId.id)!}" displayFieldName="id" name="formulaProcessActive.formulaId.id" id="formulaProcessActive_formulaId_id" type="other" url="/RM/formula/formula/formulaForSuitLine.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formulaProcessActive_checkDetailView_form" editCustomCallback=";" refViewCode="RM_7.5.0.0_formula_formulaForSuitLine" onkeyupfuncname=";_callback_formulaProcessActive_formulaId_id(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(formulaProcessActive.id)?? && (formulaProcessActive.formulaId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formulaProcessActive.formulaId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_formulaProcessActive_checkDetailView_form',obj, 'formulaProcessActive.formulaId', '/RM/formula/formula/formulaForSuitLine.action');
												CUI.commonFills('RM_formula_formulaProcessActive_checkDetailView_form', 'formulaProcessActive.formulaId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487812534269')}" >${getText('RM.propertydisplayName.randon1487812534269')}</label>
				</td>
				
						<#assign formulaProcessActive_processHiddenId_defaultValue  = ''>
							 							<#assign formulaProcessActive_processHiddenId_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="LONG" name="formulaProcessActive.processHiddenId" id="formulaProcessActive_processHiddenId"  style=";" originalvalue="<#if !newObj || (formulaProcessActive.processHiddenId)?has_content>${(formulaProcessActive.processHiddenId?html)!}<#else>${formulaProcessActive_processHiddenId_defaultValue!}</#if>" value="<#if !newObj || (formulaProcessActive.processHiddenId)?has_content>${(formulaProcessActive.processHiddenId?html)!}<#else>${formulaProcessActive_processHiddenId_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487812507672')}" >${getText('RM.propertydisplayName.randon1487812507672')}</label>
				</td>
				
						<#assign formulaProcessActive_processTableId_defaultValue  = ''>
							 							<#assign formulaProcessActive_processTableId_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="LONG" name="formulaProcessActive.processTableId" id="formulaProcessActive_processTableId"  style=";" originalvalue="<#if !newObj || (formulaProcessActive.processTableId)?has_content>${(formulaProcessActive.processTableId?html)!}<#else>${formulaProcessActive_processTableId_defaultValue!}</#if>" value="<#if !newObj || (formulaProcessActive.processTableId)?has_content>${(formulaProcessActive.processTableId?html)!}<#else>${formulaProcessActive_processTableId_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
		</tr>
	</table>
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
				<#assign dUrl="/RM/formula/formulaProcessActive/data-dg1558601636586.action?formulaProcessActive.id=${refId!-1}&refId=${refId!-1}&datagridCode=RM_7.5.0.0_formula_checkDetailViewdg1558601636586">
			<#else>
				<#assign dUrl="/RM/formula/formulaProcessActive/data-dg1558601636586.action?formulaProcessActive.id=${(formulaProcessActive.id)!-1}&datagridCode=RM_7.5.0.0_formula_checkDetailViewdg1558601636586">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_CheckDetail_dg1558601636586" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1558601636586_id" value="CheckDetail_dg1558601636586" />
			
			<input type="hidden" id="dg1558601636586_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('RM.modelname.randon1555550512268')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/RM/formula/formulaProcessActive/data-dg1558601636586.action?operateType=export&datagridCode=RM_7.5.0.0_formula_checkDetailViewdg1558601636586"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="CheckDetail_dg1558601636586" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="CheckDetail_dg1558601636586" viewType="${viewType}" renderOverEvent="dg1558601636586RenderOverEvent" route="${routeFlag}" formId="RM_formula_formulaProcessActive_checkDetailView_form" noPermissionKeys="checkItems,standrad,itemClassNew" modelCode="RM_7.5.0.0_formula_CheckDetail" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1558601636586" dtPage="dgPage"  hidekeyPrefix="dg1558601636586" hidekey="['id','version'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=false  buttons="${buttons}" noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1558601636586PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=false cannotDeleteRow=true assModelDisplayName=assModelDisplayName  activexButton="" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign checkItems_displayDefaultType=''>
								<#assign checkItems_defaultValue=''>
										<#assign checkItems_defaultValue=''>
										 
									<@datacolumn key="checkItems"        showFormat="TEXT" defaultValue="${(checkItems_defaultValue!)?string}" defaultDisplay="${(checkItems_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1555552292724')}" width=100 showFormatFunc=""  />
							<#assign standrad_displayDefaultType=''>
								<#assign standrad_defaultValue=''>
										<#assign standrad_defaultValue=''>
										 
									<@datacolumn key="standrad"        showFormat="TEXT" defaultValue="${(standrad_defaultValue!)?string}" defaultDisplay="${(standrad_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1555552315202')}" width=100 showFormatFunc=""  />
							<#assign itemClassNew_displayDefaultType=''>
								<#assign itemClassNew_defaultValue=''>
										<#assign itemClassNew_defaultValue=''>
										 									<@systemCodeColumn code="ITEM_PROPERTY" textalign="center" defaultValue="${(itemClassNew_defaultValue!)?string}" key="itemClassNew.id" editable=false type="selectcomp" notnull=false     label="${getText('RM.propertydisplayName.randon1557298232785')}" width=100  isTree=true systemEntityCode="ITEM_PROPERTY" systemCodeUrl="/foundation/systemCode/singleCodeTree.action?systemEntityCode=ITEM_PROPERTY" />
			
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
				function CheckDetail_dg1558601636586_check_datagridvalid(){
					//
					var errorObj =CheckDetail_dg1558601636586Widget._DT.testData();
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
				
				function savedg1558601636586DataGrid(){
					<#if  refId?? && (refId gt 0)>
					CheckDetail_dg1558601636586Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('CheckDetail_dg1558601636586Widget') > -1) {
						CheckDetail_dg1558601636586Widget.setAllRowEdited();
					}
					var json = CheckDetail_dg1558601636586Widget.parseEditedData();
					$('input[name="dg1558601636586ListJson"]').remove();
					$('input[name="dgLists[\'dg1558601636586\']"]').remove();
					$('input[name="dg1558601636586ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1558601636586\']">').val(json).appendTo($('#RM_formula_formulaProcessActive_checkDetailView_form'));
					$('<input type="hidden" name="dg1558601636586ModelCode">').val('RM_7.5.0.0_formula_CheckDetail').appendTo($('#RM_formula_formulaProcessActive_checkDetailView_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1558601636586ListJson">').val(json).appendTo($('#RM_formula_formulaProcessActive_checkDetailView_form'));
				}
				function DT_CheckDetail_dg1558601636586_deldatagrid(){
					var deleteRows = CheckDetail_dg1558601636586Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','activeId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1558601636586DeletedIds").length>0){
							$("#dg1558601636586DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1558601636586DeletedIds" name="dgDeletedIds[\'dg1558601636586\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcessActive_checkDetailView_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1558601636586DeletedIds['+CUI('input[name^="dg1558601636586DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcessActive_checkDetailView_form'));
					});
					return deleteRows;
				}
				function DT_CheckDetail_dg1558601636586_delTreeNodes(){
					var deleteRows = CheckDetail_dg1558601636586Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','activeId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1558601636586DeletedIds").length>0){
							$("#dg1558601636586DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1558601636586DeletedIds" name="dgDeletedIds[\'dg1558601636586\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcessActive_checkDetailView_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1558601636586DeletedIds['+CUI('input[name^="dg1558601636586DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcessActive_checkDetailView_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('RM_formula_formulaProcessActive_checkDetailView_datagrids');
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
							if(datagrids[0][i] == 'CheckDetail_dg1558601636586') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'CheckDetail_dg1558601636586';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'CheckDetail_dg1558601636586';
					}
					$('body').data('RM_formula_formulaProcessActive_checkDetailView_datagrids', datagrids);
				});
				
				var CheckDetail_dg1558601636586_importDialog = null;
				function CheckDetail_dg1558601636586_showImportDialog(){
					try{
						if(CheckDetail_dg1558601636586_importDialog!=null&&CheckDetail_dg1558601636586_importDialog.isShow==1){
							return false;
						}
						var url = "/RM/formula/formulaProcessActive/initImport.action?datagridCode=RM_7.5.0.0_formula_checkDetailViewdg1558601636586&tid=${id!}&datagridName=dg1558601636586";
							<#if canImportExcel>
								var buttonCode="RM_7.5.0.0_formula_checkDetailViewdg1558601636586_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						CheckDetail_dg1558601636586_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("CheckDetail_dg1558601636586"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();CheckDetail_dg1558601636586_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();CheckDetail_dg1558601636586_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						CheckDetail_dg1558601636586_importDialog.show();
					}catch(e){}
				}	
				
				function CheckDetail_dg1558601636586_downLoadFile(){
					var url = "/RM/formula/formulaProcessActive/downLoad.action?datagridCode=RM_7.5.0.0_formula_checkDetailViewdg1558601636586&templateRelatedModelCode=RM_7.5.0.0_formula_checkDetailViewdg1558601636586&downloadType=template&fileName=dg1558601636586";
					window.open(url,"","");
				}
				function dg1558601636586RenderOverEvent(){
				}
				function dg1558601636586PageInitMethod(nTabIndex){
					RM.formula.formulaProcessActive.checkDetailView.initSize(nTabIndex);
				}
			</script>
			
			
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-VIEW-RM_7.5.0.0_formula_checkDetailView,html,RM_7.5.0.0_formula_FormulaProcessActive,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	RM.formula.formulaProcessActive.checkDetailView.beforeSaveProcess = function(){}
	RM.formula.formulaProcessActive.checkDetailView.beforeSubmitMethod = function() {
		try{eval("savedg1558601636586DataGrid()");}catch(e){}
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(RM.formula.formulaProcessActive.checkDetailView.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#RM_formula_formulaProcessActive_checkDetailView_form').trigger('beforeSubmit');
		//formulaProcessActive.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="formulaProcessActive.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#RM_formula_formulaProcessActive_checkDetailView_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#RM_formula_formulaProcessActive_checkDetailView_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	RM.formula.formulaProcessActive.checkDetailView.validate = function(){
		return true;
	}
	
	
	//打印
	RM.formula.formulaProcessActive.checkDetailView.print = function(url){
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
		
		RM.formula.formulaProcessActive.checkDetailView.saveSetting = function(){
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
		RM.formula.formulaProcessActive.checkDetailView.printSetting = function(){
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
			RM.formula.formulaProcessActive.checkDetailView.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(RM.formula.formulaProcessActive.checkDetailView.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				RM.formula.formulaProcessActive.checkDetailView.settingDialog.show();
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
			RM.formula.formulaProcessActive.checkDetailView._customCallBack = customCallBack;
		}
		RM.formula.formulaProcessActive.checkDetailView._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#RM_formula_formulaProcessActive_checkDetailView_fileupload').length == 0) {
				$('body').append('<div id="RM_formula_formulaProcessActive_checkDetailView_fileupload"></div>');
			}
			RM.formula.formulaProcessActive.checkDetailView.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "RM_formula_formulaProcessActive_checkDetailView_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#RM_formula_formulaProcessActive_checkDetailView_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			RM.formula.formulaProcessActive.checkDetailView.infoDialog.show();
			if($('#RM_formula_formulaProcessActive_checkDetailView_fileupload').html() == '') {
				$('#RM_formula_formulaProcessActive_checkDetailView_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=RM_formula_formulaProcessActive&entityCode=RM_7.5.0.0_formula&dialogId="+dialogId);
			}
		}
	//参照复制函数
	RM.formula.formulaProcessActive.checkDetailView.referenceCopy = function(objName,url, dialog){
		var callbackName ="RM.formula.formulaProcessActive.checkDetailView.referenceCopyBackInfo";
		RM.formula.formulaProcessActive.checkDetailView.dialog = dialog;
		RM.formula.formulaProcessActive.checkDetailView._dialog = foundation.common.select({
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
	
	RM.formula.formulaProcessActive.checkDetailView.referenceCopyBackInfo = function(obj){
		if(RM.formula.formulaProcessActive.checkDetailView._dialog){
			RM.formula.formulaProcessActive.checkDetailView._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,RM.formula.formulaProcessActive.checkDetailView.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('RM_formula_formulaProcessActive_checkDetailView_form','RM_formula_formulaProcessActive_checkDetailView_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(RM.formula.formulaProcessActive.checkDetailView.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(RM.formula.formulaProcessActive.checkDetailView.dialog._el).load('/RM/formula/formulaProcessActive/checkDetailView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( RM.formula.formulaProcessActive.checkDetailView.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + RM.formula.formulaProcessActive.checkDetailView.dialog._config.iframe, RM.formula.formulaProcessActive.checkDetailView.dialog._dialog ).prop( 'src', '/RM/formula/formulaProcessActive/checkDetailView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(RM.formula.formulaProcessActive.checkDetailView.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(RM.formula.formulaProcessActive.checkDetailView.dialog._el).load('/RM/formula/formulaProcessActive/checkDetailView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	RM.formula.formulaProcessActive.checkDetailView.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		RM.formula.formulaProcessActive.checkDetailView.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		RM.formula.formulaProcessActive.checkDetailView._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			RM.formula.formulaProcessActive.checkDetailView._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	RM.formula.formulaProcessActive.checkDetailView._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'RM_formula_formulaProcessActive_checkDetailView' + '_' + extraFrameParam;
		var callbackName="";
		RM.formula.formulaProcessActive.checkDetailView._prefix = '';
		RM.formula.formulaProcessActive.checkDetailView._oGrid = oGrid;
		RM.formula.formulaProcessActive.checkDetailView._sUrl = url;
		if(customCallBack){
			RM.formula.formulaProcessActive.checkDetailView._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			RM.formula.formulaProcessActive.checkDetailView.gridEventObj = gridEventObj;
			callbackName = "RM.formula.formulaProcessActive.checkDetailView.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				RM.formula.formulaProcessActive.checkDetailView._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "RM.formula.formulaProcessActive.checkDetailView.getMultiselectCallBackInfo_DG" : "RM.formula.formulaProcessActive.checkDetailView.getcallBackInfo_DG";
			RM.formula.formulaProcessActive.checkDetailView._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				RM.formula.formulaProcessActive.checkDetailView._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="RM.formula.formulaProcessActive.checkDetailView.getcallBackInfo";
		}
		if(RM.formula.formulaProcessActive.checkDetailView._prefix!=''){
			RM.formula.formulaProcessActive.checkDetailView._prefix = RM.formula.formulaProcessActive.checkDetailView._prefix.substring(1);
		}
		if(RM.formula.formulaProcessActive.checkDetailView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.formula.formulaProcessActive.checkDetailView._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof RM.formula.formulaProcessActive.checkDetailView._querycustomFuncN == "function") {
				refparam += RM.formula.formulaProcessActive.checkDetailView._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		RM.formula.formulaProcessActive.checkDetailView._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.formula.formulaProcessActive.checkDetailView._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.formula.formulaProcessActive.checkDetailView.query_"+obj+")!='undefined'") ? eval('RM.formula.formulaProcessActive.checkDetailView.query_'+obj+'()') : null;
		return str;
	
	};
	
	RM.formula.formulaProcessActive.checkDetailView.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('RM_formula_formulaProcessActive_checkDetailView_form',obj[0], RM.formula.formulaProcessActive.checkDetailView._prefix, RM.formula.formulaProcessActive.checkDetailView._sUrl);
		CUI.commonFills('RM_formula_formulaProcessActive_checkDetailView_form',RM.formula.formulaProcessActive.checkDetailView._prefix,obj[0]);

		try{
			if(RM.formula.formulaProcessActive.checkDetailView._customCallBack) {
				eval(RM.formula.formulaProcessActive.checkDetailView._customCallBack);
				RM.formula.formulaProcessActive.checkDetailView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcessActive.checkDetailView._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	RM.formula.formulaProcessActive.checkDetailView.getcallBackInfo_DG_IE = function(obj){
		if(RM.formula.formulaProcessActive.checkDetailView._customBeforeCallBack) {
			var flag = eval(RM.formula.formulaProcessActive.checkDetailView._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = RM.formula.formulaProcessActive.checkDetailView.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,RM.formula.formulaProcessActive.checkDetailView._sUrl);
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
			if(RM.formula.formulaProcessActive.checkDetailView._customCallBack) {
				eval(RM.formula.formulaProcessActive.checkDetailView._customCallBack);
				RM.formula.formulaProcessActive.checkDetailView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcessActive.checkDetailView._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	RM.formula.formulaProcessActive.checkDetailView.getcallBackInfo_DG = function(obj){
		if(RM.formula.formulaProcessActive.checkDetailView._customBeforeCallBack) {
			var flag = eval(RM.formula.formulaProcessActive.checkDetailView._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(RM.formula.formulaProcessActive.checkDetailView._currRow).next().length==0){
					RM.formula.formulaProcessActive.checkDetailView._oGrid.addNewRow();
				}	
				RM.formula.formulaProcessActive.checkDetailView._currRow = $(RM.formula.formulaProcessActive.checkDetailView._currRow).next();
				$(RM.formula.formulaProcessActive.checkDetailView._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(RM.formula.formulaProcessActive.checkDetailView._currRow,obj[i],RM.formula.formulaProcessActive.checkDetailView._prefix,RM.formula.formulaProcessActive.checkDetailView._sUrl);
			eval("CUI.commonFills_DG(RM.formula.formulaProcessActive.checkDetailView._currRow,RM.formula.formulaProcessActive.checkDetailView._prefix,obj[i],RM.formula.formulaProcessActive.checkDetailView._oGrid)");
		}
		try{
			if(RM.formula.formulaProcessActive.checkDetailView._customCallBack) {
				eval(RM.formula.formulaProcessActive.checkDetailView._customCallBack);
				RM.formula.formulaProcessActive.checkDetailView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcessActive.checkDetailView._dialog.close();
		} catch(e){}
	};
	
	RM.formula.formulaProcessActive.checkDetailView.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(RM.formula.formulaProcessActive.checkDetailView._oGrid, RM.formula.formulaProcessActive.checkDetailView._currRow, RM.formula.formulaProcessActive.checkDetailView._key, RM.formula.formulaProcessActive.checkDetailView._displayFieldName, obj[i])
		}
		try{
			if(RM.formula.formulaProcessActive.checkDetailView._customCallBack) {
				eval(RM.formula.formulaProcessActive.checkDetailView._customCallBack);
				RM.formula.formulaProcessActive.checkDetailView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcessActive.checkDetailView._dialog.close();
		} catch(e){}
	};
	
	RM.formula.formulaProcessActive.checkDetailView.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			RM.formula.formulaProcessActive.checkDetailView.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#RM_formula_formulaProcessActive_checkDetailView_form'));
        			}
        	   	}
        	}
      	});
	};
	(function($){
		$(function(){
			//插入隐藏的表单号
		$('input[name="formulaProcessActive.processTableId"]').val($("input[name='formulaProcess.processTableId']").val());
        //插入工序Id
        $('input[name="formulaProcessActive.processHiddenId"]').val($('#id').val());
		  //插入配方Id
        $('input[name="formulaProcessActive.formulaHiddenId"]').val($('input[name="formulaProcess.formulaId.id"]').val());
		$('input[name="formulaProcessActive.formulaId.id"]').val($('input[name="formulaProcess.formulaId.id"]').val());
		});
	})(jQuery);
	RM.formula.formulaProcessActive.checkDetailView.beforeSubmitMethodSettingInPage = function(){
		var pt = CheckDetail_dg1555572135834Widget;
for(var i = 0 ; i< pt._DT.rowsJsonObj.length ;i++){
//符合标准范围规范
	if(!/^([\(]|[\[])[0-9]*\,\w+([-.]\w+)*([)]|[\]])$/.test(pt._DT.rowsJsonObj[i].standrad) && pt._DT.rowsJsonObj[i].standrad!='' && pt._DT.rowsJsonObj[i].standrad!= undefined){
		RM_formula_formulaProcessActive_checkDetailNew_formDialogErrorBarWidget.showMessage('第'+i+'行数据：【'+pt._DT.rowsJsonObj[i].standrad+'】不符合规范,例:(100,200]');
		return false;
	}
	//测点属性不为空时标准不可为空
		console.log('shx:'+i+'次'+pt.getCellValue(i,'itemClassNew.id') +','+pt._DT.rowsJsonObj[i].standrad);
	
	if((pt._DT.rowsJsonObj[i].itemClassNew.id !='' && pt._DT.rowsJsonObj[i].itemClassNew.id!=undefined) && (pt._DT.rowsJsonObj[i].standrad==undefined || pt._DT.rowsJsonObj[i].standrad=='')){
		RM_formula_formulaProcessActive_checkDetailNew_formDialogErrorBarWidget.showMessage('第'+i+'行数据：选择位号属性后标准值不可为空');
		return false;
	}
}
if($('#formulaProcessActiveoccurTurnid').val() == ''|| $('#formulaProcessActiveoccurTurnid').val() == undefined){
 RM_formula_formulaProcessActive_checkDetailNew_formDialogErrorBarWidget.showMessage('【发生于】字段不可为空');
 
 return false;
}
FormulaProcessActive_dg1487554913298Widget._DT.setRequestDataUrl(FormulaProcessActive_dg1487554913298Widget._DT.requestUrl);
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	RM.formula.formulaProcessActive.checkDetailView.initCount = 0;
	RM.formula.formulaProcessActive.checkDetailView.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#RM_checkDetailView_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('RM_formula_formulaProcessActive_checkDetailView_datagrids');	
		var	conHeight = h-$("#RM_formula_formulaProcessActive_checkDetailView_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#RM_formula_formulaProcessActive_checkDetailView_main_div .edit-panes-s").each(function(index){
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
							if(RM.formula.formulaProcessActive.checkDetailView.initCount <= 2) {
								setTimeout(function(){RM.formula.formulaProcessActive.checkDetailView.initSize();}, 200);
								RM.formula.formulaProcessActive.checkDetailView.initCount++;
							}/* else {
								RM.formula.formulaProcessActive.checkDetailView.initCount = 0;
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
		RM.formula.formulaProcessActive.checkDetailView.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    RM.formula.formulaProcessActive.checkDetailView.initSize(index);
		});
		$(window).bind("dialog.resize",function(){RM.formula.formulaProcessActive.checkDetailView.initSize();});
	});
</script>
<script type="text/javascript">
	



	/* CUSTOM CODE START(view-VIEW-RM_7.5.0.0_formula_checkDetailView,js,RM_7.5.0.0_formula_FormulaProcessActive,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>