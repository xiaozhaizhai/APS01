<!-- RM_7.5.0.0/formula/arrSuitlineEdit -->
<#assign isWorkflow = true> 
<#assign isAttachment = true> 
	<#assign fileuploadType = "Table">
	<#assign fileuploadLinkId = formula.tableInfoId!>
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
<#assign tableObj = formula>
<#-- 命名空间 -->
<#assign editPageNs = "RM.formula.formula.arrSuitlineEdit">
<#-- 模型名称-->
<#assign modelName = "formula">
<#-- 视图编码-->
<#assign viewCode = "RM_7.5.0.0_formula_arrSuitlineEdit">
<#-- 实体编码-->
<#assign entity_code = "RM_7.5.0.0_formula">
<#-- 视图名称-->
<#assign viewName = "arrSuitlineEdit">
<#-- datagrid编码-->
<#assign datagridCode = "RM_formula_formula_arrSuitlineEdit_datagrids">
<#-- 首字母大写的模型名称-->
<#assign upcaseModelName = "Formula">
<#-- 页面打印按钮 -->
<#assign isPrint = false>
<#-- 控件打印按钮 -->
<#assign controlPrint = false>
<#-- 是否只读 -->
<#assign allReadOnly = false>
<#-- 是否是参照视图 -->
<#assign isReference =false>
<#-- 是否可弃审 -->
<#assign retrialFlag = false>
<#-- formid -->
<#assign editFormId = "RM_formula_formula_arrSuitlineEdit_form">
<#-- 待办状态 -->
<#assign pendingstatus =( formula.pending.taskDescription)!>
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
        <#assign configTitle = getText('RM.viewtitle.randon1540451101299')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		
		#RM_formula_formula_arrSuitlineEdit_form{float:left;width:100%;}
		
		
		</style>
		<script type="text/javascript">
			CUI.ns('RM.formula.formula.arrSuitlineEdit');
			RM.formula.formula.arrSuitlineEdit.currentUser = ${userJson};
			RM.formula.formula.arrSuitlineEdit.currentStaff = ${staffJson};
			RM.formula.formula.arrSuitlineEdit.currentDepartment = ${deptJson};
			RM.formula.formula.arrSuitlineEdit.currentPosition = ${postJson};
			RM.formula.formula.arrSuitlineEdit.currentCompany = ${compJson};
		</script>
		<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_arrSuitlineEdit,head,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
    </head>
	<body class="view-edit ">
		<@loadpanel newType=true/>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="formula.id," onsubmitMethod="RM.formula.formula.arrSuitlineEdit.beforeSubmitMethod()" id="RM_formula_formula_arrSuitlineEdit_form" namespace="/RM/formula/formula/arrSuitlineEdit" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=RM_7.5.0.0_formula_Formula&_bapFieldPermissonModelName_=Formula&superEdit=${(superEdit!false)?string}" editPageNs="RM.formula.formula.arrSuitlineEdit" callback="RM.formula.formula.arrSuitlineEdit._callBackInfo" ecform="true">
			<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
			<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="RM_formula_formula_arrSuitlineEdit_main_div">
			<div class="edit-head">
				<#include "../../../ec/tableInfo/operateheadbar_all.ftl" >
				<#include "../../../ec/tableInfo/creatorInfo.ftl" >
			</div>
    		<div class="edit-main" id="RM_formula_formula_arrSuitlineEdit">
    			<div class="edit-content">
    	<#include "../../../ec/tableInfo/formparam.ftl" >				
					<input type="hidden" name="formula.id" value="${(formula.id)!""}" originalvalue="${(formula.id)!""}"/>
		<div class="dash-line"></div>
<script type="text/javascript">
var attcountid = "RM_formula_formula_arrSuitlineEdit_form"+"_attcount";
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
</script>				<div class="edit-panes edit-panes-w edit-container clearfix">
				<div class="cui-elements pd-top">

<div class="edit-panes-s" style="width:98%;margin-left:10px;">
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1488246312092')}" >${getText('RM.propertydisplayName.randon1488246312092')}</label>
				</td>
				
						<#assign formula_code_defaultValue  = ''>
							 							<#assign formula_code_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="BAPCODE" name="formula.code" id="formula_code"  style=";" originalvalue="<#if !newObj || (formula.code)?has_content>${(formula.code?html)!}<#else>${formula_code_defaultValue!}</#if>" value="<#if !newObj || (formula.code)?has_content>${(formula.code?html)!}<#else>${formula_code_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487075823790')}" >${getText('RM.propertydisplayName.randon1487075823790')}</label>
				</td>
				
						<#assign formula_name_defaultValue  = ''>
							 							<#assign formula_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="formula.name" id="formula_name"  style=";" originalvalue="<#if !newObj || (formula.name)?has_content>${(formula.name?html)!}<#else>${formula_name_defaultValue!}</#if>" value="<#if !newObj || (formula.name)?has_content>${(formula.name?html)!}<#else>${formula_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487139592239')}" >${getText('RM.propertydisplayName.randon1487139592239')}</label>
				</td>
				
						<#assign formula_edition_defaultValue  = ''>
							 							<#assign formula_edition_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="formula.edition" id="formula_edition"  style=";" originalvalue="<#if newObj&& !(formula.edition)?has_content>${formula_edition_defaultValue!}<#elseif (formula.edition)?has_content>#{(formula.edition)!; m2M2}</#if>" value="<#if newObj&& !(formula.edition)?has_content>${formula_edition_defaultValue!}<#elseif (formula.edition)?has_content>#{(formula.edition)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#formula_edition').unbind('blur').bind('blur',function(){
										var percision = 2;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("RM.propertydisplayName.randon1487139592239")}')}");
											return;
										}
										if(parseInt(percision) > -1 && $(this).val()!=undefined && $(this).val()!='' && isDecimal($(this).val())){
											$(this).val(($(this).val() * 1).toFixed(percision));
										}
									});
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
	<table class="edit-table" style="display:none;">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487076619868')}" >${getText('RM.propertydisplayName.randon1487076619868')}</label>
				</td>
				
						<#assign formula_batchContral_defaultValue  = ''>
							 							<#assign formula_batchContral_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="formula.batchContral_check" originalvalue="<#if !newObj><#if (formula.batchContral)??>${(formula.batchContral!false)?string('true','false')}<#else>false</#if><#elseif formula_batchContral_defaultValue?has_content>${(formula_batchContral_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (formula.batchContral)??>${(formula.batchContral!false)?string('true','false')}<#else>false</#if><#else>${(formula_batchContral_defaultValue!true)?string}</#if>"  />
								
								<input property_type="BOOLEAN" type="hidden" name="formula.batchContral" originalvalue="<#if ((formula.batchContral)?? &&  formula.batchContral)||(formula_batchContral_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((formula.batchContral)?? &&  formula.batchContral)||(formula_batchContral_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="formula.batchContral_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="formula.batchContral"]');
												CUI('input[name="formula.batchContral_check"]').each(function(){
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
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1539745697761')}" >${getText('RM.propertydisplayName.randon1539745697761')}</label>
				</td>
				
						<#assign formula_autoReportOnFinish_defaultValue  = ''>
							 							<#assign formula_autoReportOnFinish_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${formula_autoReportOnFinish_defaultValue!}" formId="RM_formula_formula_arrSuitlineEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formula.autoReportOnFinish.id" code="autoReportOnFinish" value="${(formula.autoReportOnFinish.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formula_arrSuitlineEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formula.autoReportOnFinish.id" code="autoReportOnFinish" value="${(formula.autoReportOnFinish.id)!}"  />
									
								</#if>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
		</tr>
	</table>
</div>				</div>
				<div class="edit-datatable">	

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
			
							<script type="text/javascript">
								function ForLineFormula_dg1540451901057_addLine(event)
																{
    openRefFactory();
}
							</script>
							<script type="text/javascript">
								function ForLineFormula_dg1540451901057_deleteLine(event)
																{
	DT_ForLineFormula_dg1540451901057_deldatagrid();
}
							</script>
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/RM/formula/formula/data-dg1540451901057.action?formula.id=${refId!-1}&refId=${refId!-1}&datagridCode=RM_7.5.0.0_formula_arrSuitlineEditdg1540451901057">
			<#else>
				<#assign dUrl="/RM/formula/formula/data-dg1540451901057.action?formula.id=${(formula.id)!-1}&datagridCode=RM_7.5.0.0_formula_arrSuitlineEditdg1540451901057">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('RM.buttonPropertyshowName.radion1540452047799')}\",handler:function(event){ForLineFormula_dg1540451901057_addLine(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1540452047767')}\",handler:function(event){ForLineFormula_dg1540451901057_deleteLine(event)},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('RM.buttonPropertyshowName.radion1540452047799')}\",handler:function(event){ForLineFormula_dg1540451901057_addLine(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1540452047767')}\",handler:function(event){ForLineFormula_dg1540451901057_deleteLine(event)},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_ForLineFormula_dg1540451901057" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1540451901057_id" value="ForLineFormula_dg1540451901057" />
			
			<input type="hidden" id="dg1540451901057_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('RM.modelname.randon1540448919693')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/RM/formula/formula/data-dg1540451901057.action?operateType=export&datagridCode=RM_7.5.0.0_formula_arrSuitlineEditdg1540451901057"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="ForLineFormula_dg1540451901057" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="ForLineFormula_dg1540451901057" viewType="${viewType}" renderOverEvent="dg1540451901057RenderOverEvent" route="${routeFlag}" formId="RM_formula_formula_arrSuitlineEdit_form" noPermissionKeys="lflineId.name,maxCapacity,longTime,theoreYield,autoReportOnFinish,meno,tempId,lflineId.id" modelCode="RM_7.5.0.0_formula_ForLineFormula" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1540451901057" dtPage="dgPage"  hidekeyPrefix="dg1540451901057" hidekey="['id','version','lflineId.id','lflineId.name','lflineId.id','lflineId.id'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1540451901057PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName  activexButton="RM.buttonPropertyshowName.radion1540452047799,addLine,add;RM.buttonPropertyshowName.radion1540452047767,deleteLine,del" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign lflineId_name_displayDefaultType=''>
								<#assign lflineId_name_defaultValue=''>
										<#assign lflineId_name_defaultValue=''>
																	<#if (lflineId_name_defaultValue!)?string=="currentUser">
								<#assign lflineId_name_defaultValue='${staffJson!}'>
							<#elseif (lflineId_name_defaultValue!)?string=="currentPost">
								<#assign lflineId_name_defaultValue='${postJson!}'>
							<#elseif (lflineId_name_defaultValue!)?string=="currentDepart">
								<#assign lflineId_name_defaultValue='${deptJson!}'>
							<#elseif (lflineId_name_defaultValue!)?string=="currentComp">
								<#assign lflineId_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="lflineId.name"        showFormat="SELECTCOMP" defaultValue="${(lflineId_name_defaultValue!)?string}" defaultDisplay="${(lflineId_name_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="RM.formula.formula.arrSuitlineEdit"  textalign="left"  viewUrl="/MESBasic/factoryModel/factoryModel/factoryProductRef.action" viewCode="MESBasic_1_factoryModel_factoryProductRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1490322427886')}"  label="${getText('RM.propertydisplayName.randon201810251522003')}" width=100 showFormatFunc=""  />
							<#assign maxCapacity_displayDefaultType=''>
								<#assign maxCapacity_defaultValue=''>
										<#assign maxCapacity_defaultValue=''>
										  
									<@datacolumn key="maxCapacity"        showFormat="TEXT" defaultValue="${(maxCapacity_defaultValue!)?string}" defaultDisplay="${(maxCapacity_displayDefaultType!)?string}" decimal="6" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1540450260677')}" width=100 showFormatFunc=""  />
							<#assign longTime_displayDefaultType=''>
								<#assign longTime_defaultValue=''>
										<#assign longTime_defaultValue=''>
										  
									<@datacolumn key="longTime"        showFormat="TEXT" defaultValue="${(longTime_defaultValue!)?string}" defaultDisplay="${(longTime_displayDefaultType!)?string}" decimal="6" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon201810251522002')}" width=100 showFormatFunc=""  />
							<#assign theoreYield_displayDefaultType=''>
								<#assign theoreYield_defaultValue=''>
										<#assign theoreYield_defaultValue=''>
										  
									<@datacolumn key="theoreYield"        showFormat="TEXT" defaultValue="${(theoreYield_defaultValue!)?string}" defaultDisplay="${(theoreYield_displayDefaultType!)?string}" decimal="6" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1540450331203')}" width=100 showFormatFunc=""  />
							<#assign autoReportOnFinish_displayDefaultType=''>
								<#assign autoReportOnFinish_defaultValue=''>
										<#assign autoReportOnFinish_defaultValue=''>
										 									<@systemCodeColumn code="autoReportOnFinish" textalign="center" defaultValue="${(autoReportOnFinish_defaultValue!)?string}" key="autoReportOnFinish.id" editable=true type="selectcomp" notnull=false     label="${getText('RM.propertydisplayName.randon1540448935204')}" width=100   />
							<#assign meno_displayDefaultType=''>
								<#assign meno_defaultValue=''>
										<#assign meno_defaultValue=''>
										  
									<@datacolumn key="meno"  popView=true      showFormat="TEXT" defaultValue="${(meno_defaultValue!)?string}" defaultDisplay="${(meno_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1540450285384')}" width=100 showFormatFunc=""  />
							<#assign tempId_displayDefaultType=''>
								<#assign tempId_defaultValue=''>
										<#assign tempId_defaultValue=''>
										  
									<@datacolumn key="tempId"        showFormat="TEXT" defaultValue="${(tempId_defaultValue!)?string}" defaultDisplay="${(tempId_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1540450321075')}" width=100 showFormatFunc=""  />
							<#assign lflineId_id_displayDefaultType=''>
								<#assign lflineId_id_defaultValue=''>
										<#assign lflineId_id_defaultValue=''>
																	<#if (lflineId_id_defaultValue!)?string=="currentUser">
								<#assign lflineId_id_defaultValue='${staffJson!}'>
							<#elseif (lflineId_id_defaultValue!)?string=="currentPost">
								<#assign lflineId_id_defaultValue='${postJson!}'>
							<#elseif (lflineId_id_defaultValue!)?string=="currentDepart">
								<#assign lflineId_id_defaultValue='${deptJson!}'>
							<#elseif (lflineId_id_defaultValue!)?string=="currentComp">
								<#assign lflineId_id_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="lflineId.id"        showFormat="TEXT" defaultValue="${(lflineId_id_defaultValue!)?string}" defaultDisplay="${(lflineId_id_displayDefaultType!)?string}" decimal="" editable=false type="long" showType="long" notnull=false   selectCompName="RM.formula.formula.arrSuitlineEdit"  textalign="center" hiddenCol=true viewUrl="/MESBasic/factoryModel/factoryModel/factoryChoiceRef.action" viewCode="MESBasic_1_factoryModel_factoryChoiceRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1490322790398')}"  label="${getText('ID')}" width=100 showFormatFunc=""  />
			
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
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
			
			<script type="text/javascript">
				function ForLineFormula_dg1540451901057_check_datagridvalid(){
					//
					var errorObj =ForLineFormula_dg1540451901057Widget._DT.testData();
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
				
				function savedg1540451901057DataGrid(){
					<#if  refId?? && (refId gt 0)>
					ForLineFormula_dg1540451901057Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('ForLineFormula_dg1540451901057Widget') > -1) {
						ForLineFormula_dg1540451901057Widget.setAllRowEdited();
					}
					var json = ForLineFormula_dg1540451901057Widget.parseEditedData();
					$('input[name="dg1540451901057ListJson"]').remove();
					$('input[name="dgLists[\'dg1540451901057\']"]').remove();
					$('input[name="dg1540451901057ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1540451901057\']">').val(json).appendTo($('#RM_formula_formula_arrSuitlineEdit_form'));
					$('<input type="hidden" name="dg1540451901057ModelCode">').val('RM_7.5.0.0_formula_ForLineFormula').appendTo($('#RM_formula_formula_arrSuitlineEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1540451901057ListJson">').val(json).appendTo($('#RM_formula_formula_arrSuitlineEdit_form'));
				}
				function DT_ForLineFormula_dg1540451901057_deldatagrid(){
					var deleteRows = ForLineFormula_dg1540451901057Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','lfformulaId.id','lflineId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1540451901057DeletedIds").length>0){
							$("#dg1540451901057DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1540451901057DeletedIds" name="dgDeletedIds[\'dg1540451901057\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_arrSuitlineEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1540451901057DeletedIds['+CUI('input[name^="dg1540451901057DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_arrSuitlineEdit_form'));
					});
					return deleteRows;
				}
				function DT_ForLineFormula_dg1540451901057_delTreeNodes(){
					var deleteRows = ForLineFormula_dg1540451901057Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','lfformulaId.id','lflineId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1540451901057DeletedIds").length>0){
							$("#dg1540451901057DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1540451901057DeletedIds" name="dgDeletedIds[\'dg1540451901057\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_arrSuitlineEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1540451901057DeletedIds['+CUI('input[name^="dg1540451901057DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_arrSuitlineEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('RM_formula_formula_arrSuitlineEdit_datagrids');
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
							if(datagrids[0][i] == 'ForLineFormula_dg1540451901057') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'ForLineFormula_dg1540451901057';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'ForLineFormula_dg1540451901057';
					}
					$('body').data('RM_formula_formula_arrSuitlineEdit_datagrids', datagrids);
				});
				
				var ForLineFormula_dg1540451901057_importDialog = null;
				function ForLineFormula_dg1540451901057_showImportDialog(){
					try{
						if(ForLineFormula_dg1540451901057_importDialog!=null&&ForLineFormula_dg1540451901057_importDialog.isShow==1){
							return false;
						}
						var url = "/RM/formula/formula/initImport.action?datagridCode=RM_7.5.0.0_formula_arrSuitlineEditdg1540451901057&tid=${id!}&datagridName=dg1540451901057";
							<#if canImportExcel>
								var buttonCode="RM_7.5.0.0_formula_arrSuitlineEditdg1540451901057_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						ForLineFormula_dg1540451901057_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("ForLineFormula_dg1540451901057"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();ForLineFormula_dg1540451901057_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();ForLineFormula_dg1540451901057_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						ForLineFormula_dg1540451901057_importDialog.show();
					}catch(e){}
				}	
				
				function ForLineFormula_dg1540451901057_downLoadFile(){
					var url = "/RM/formula/formula/downLoad.action?datagridCode=RM_7.5.0.0_formula_arrSuitlineEditdg1540451901057&templateRelatedModelCode=RM_7.5.0.0_formula_arrSuitlineEditdg1540451901057&downloadType=template&fileName=dg1540451901057";
					window.open(url,"","");
				}
				function dg1540451901057RenderOverEvent(){
					setTimeout(function(){
	$("#ForLineFormula_dg1540451901057_tbody tbody tr").bind("click",function(){
		$("#ForLineFormula_dg1540451901057_tbody tbody tr").removeAttr("clk");
		$(this).attr("clk","on");	
		var clickIndex;
		$("#ForLineFormula_dg1540451901057_tbody tbody tr").each(function(index){
			if($(this).attr("clk")=="on"){
				clickIndex = index;
			}
		});
		if( clickIndex != oldSelectRow){
			var bottomPtLength = ForProcessUnit_dg1540451909387Widget.getRowLength();
			var needContinue = true;
			
			var oldUpPtLineId = ForLineFormula_dg1540451901057Widget.getCellValue(oldSelectRow,"lflineId.id");
			var oldUpPtLineName = ForLineFormula_dg1540451901057Widget.getCellValue(oldSelectRow,"lflineId.name");
			//先检查工作单元是否为空，如果为空不允许换行
			for(var i = 0; i < bottomPtLength; i++){
				var bottomPtLineId = ForProcessUnit_dg1540451909387Widget.getCellValue(i,"lineId.id");
				var bottomPtProcessUnitIDUnitId = ForProcessUnit_dg1540451909387Widget.getCellValue(i,"processUnitIDUnitId");
				var bottomPtProcessName = ForProcessUnit_dg1540451909387Widget.getCellValue(i,"puprocessId.name");
				if(oldUpPtLineId == bottomPtLineId && (bottomPtProcessUnitIDUnitId == null || bottomPtProcessUnitIDUnitId == '') ){
				
					//原选中行保持选中状态
					var oRow=ForLineFormula_dg1540451901057Widget._DT._bTbody.getElementsByTagName("tr")[oldSelectRow];
					ForLineFormula_dg1540451901057Widget._DT._setSelected(oRow);
					$("#ForLineFormula_dg1540451901057_tbody tbody tr").removeAttr("clk");
					$("#ForLineFormula_dg1540451901057_tbody tbody tr").eq(oldSelectRow).attr("clk","on");	
					
					$("#ForLineFormula_dg1540451901057_tbody tbody tr").eq(clickIndex).attr("myslted",false);
					$("#ForLineFormula_dg1540451901057_tbody tbody tr").eq(clickIndex).attr("class","dg-bd-tr");
					$("#ForLineFormula_dg1540451901057_tbody tbody tr").eq(clickIndex).children("td").each(function(index){
						$("#ForLineFormula_dg1540451901057_tbody tbody tr").eq(clickIndex).children("td").eq(index).attr("style","border-top-color: rgb(231, 231, 231); border-bottom-color: rgb(231, 231, 231);");
					});
					
					
					workbenchErrorBarWidget.showMessage("生产线\""+oldUpPtLineName+"\"下工序\""+bottomPtProcessName+"\"工作单元未编辑", 'f');
					needContinue = false;
					break;
				}
			}
			
			if(needContinue){
				
				if(oldSelectRow != null){
					$("#ForLineFormula_dg1540451901057_tbody tbody tr").eq(oldSelectRow).attr("myslted",false);
					$("#ForLineFormula_dg1540451901057_tbody tbody tr").eq(oldSelectRow).attr("class","dg-bd-tr");
					$("#ForLineFormula_dg1540451901057_tbody tbody tr").eq(oldSelectRow).children("td").each(function(index){
						$("#ForLineFormula_dg1540451901057_tbody tbody tr").eq(oldSelectRow).children("td").eq(index).attr("style","border-top-color: rgb(231, 231, 231); border-bottom-color: rgb(231, 231, 231);");
					});
				}
				oldSelectRow = clickIndex;
				$("#ForLineFormula_dg1540451901057_tbody tbody tr").eq(clickIndex).children("td").each(function(index){
					$("#ForLineFormula_dg1540451901057_tbody tbody tr").eq(clickIndex).children("td").eq(index).attr("style","border-top-color: rgb(255, 192, 1); border-bottom-color: rgb(255, 192, 1);");
				});
				var upPtLineId = ForLineFormula_dg1540451901057Widget.getCellValue(oldSelectRow,"lflineId.id");
				//选中行对应的工序工作单元记录显示，其他的隐藏
				for(var j = 0; j < bottomPtLength; j++){
					var bottomPtLineId = ForProcessUnit_dg1540451909387Widget.getCellValue(j,"lineId.id");
					if(upPtLineId == bottomPtLineId){
						$("#ForProcessUnit_dg1540451909387_tbody tbody tr").eq(j).attr("style","display:block");
					}else{
						$("#ForProcessUnit_dg1540451909387_tbody tbody tr").eq(j).attr("style","display:none");
					}
				}
			}
			
			//清空下工序的序号列,根据工序数量，重新计算序号需要几个
			$('#ForProcessUnit_dg1540451909387 .datagrid-wrapper .datagrid .datagrid-fd table tbody').html("");
			var indexHtml = "";
			for(var datagridFdIndex = 1 ; datagridFdIndex <= processCount; datagridFdIndex++){
				indexHtml += '<tr><td class="order" style="width: 37px;">'+datagridFdIndex+'</td></tr>';
			}
			$('#ForProcessUnit_dg1540451909387 .datagrid-wrapper .datagrid .datagrid-fd table tbody').html(indexHtml);
		}	
	});
},100);
//初始化时第一行默认给选中参数
$("#ForLineFormula_dg1540451901057_tbody tbody tr").eq(0).attr("clk","on");

//删除按钮样式
$(".paginatorbar-operatebar").eq(0).children("a").eq(1).children("span").attr("class","buttonbar-button cui-btn-del");
				}
				function dg1540451901057PageInitMethod(nTabIndex){
					RM.formula.formula.arrSuitlineEdit.initSize(nTabIndex);
				}
			</script>
			
			

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
				<#assign dUrl="/RM/formula/formula/data-dg1540451909387.action?formula.id=${refId!-1}&refId=${refId!-1}&datagridCode=RM_7.5.0.0_formula_arrSuitlineEditdg1540451909387">
			<#else>
				<#assign dUrl="/RM/formula/formula/data-dg1540451909387.action?formula.id=${(formula.id)!-1}&datagridCode=RM_7.5.0.0_formula_arrSuitlineEditdg1540451909387">
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
					<input type="hidden" id="dg_cp_info_ForProcessUnit_dg1540451909387" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1540451909387_id" value="ForProcessUnit_dg1540451909387" />
			
			<input type="hidden" id="dg1540451909387_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('RM.modelname.randon1540450349782')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/RM/formula/formula/data-dg1540451909387.action?operateType=export&datagridCode=RM_7.5.0.0_formula_arrSuitlineEditdg1540451909387"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="ForProcessUnit_dg1540451909387" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="ForProcessUnit_dg1540451909387" viewType="${viewType}" renderOverEvent="dg1540451909387RenderOverEvent" route="${routeFlag}" formId="RM_formula_formula_arrSuitlineEdit_form" noPermissionKeys="puprocessId.name,processUnitIDUnitId,pmemo,headId.id,headTempId,lineId.id" modelCode="RM_7.5.0.0_formula_ForProcessUnit" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1540451909387" dtPage="dgPage"  hidekeyPrefix="dg1540451909387" hidekey="['id','version','puprocessId.id','puprocessId.name','headId.id','headId.id','lineId.id','lineId.id'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1540451909387PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName  activexButton="" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign puprocessId_name_displayDefaultType=''>
								<#assign puprocessId_name_defaultValue=''>
										<#assign puprocessId_name_defaultValue=''>
																	<#if (puprocessId_name_defaultValue!)?string=="currentUser">
								<#assign puprocessId_name_defaultValue='${staffJson!}'>
							<#elseif (puprocessId_name_defaultValue!)?string=="currentPost">
								<#assign puprocessId_name_defaultValue='${postJson!}'>
							<#elseif (puprocessId_name_defaultValue!)?string=="currentDepart">
								<#assign puprocessId_name_defaultValue='${deptJson!}'>
							<#elseif (puprocessId_name_defaultValue!)?string=="currentComp">
								<#assign puprocessId_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="puprocessId.name"        showFormat="SELECTCOMP" defaultValue="${(puprocessId_name_defaultValue!)?string}" defaultDisplay="${(puprocessId_name_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="RM.formula.formula.arrSuitlineEdit"  textalign="left"  viewUrl="/RM/formula/formulaProcess/processLineReference.action" viewCode="RM_7.5.0.0_formula_processLineReference" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1488977430659')}"  label="${getText('RM.propertydisplayName.randon201810251524')}" width=100 showFormatFunc=""  />
							<#assign processUnitIDUnitId_displayDefaultType=''>
								<#assign processUnitIDUnitId_defaultValue=''>
							<#if (processUnitIDUnitId_defaultValue!)?string=="currentUser">
								<#assign processUnitIDUnitId_defaultValue='${staffJson!}'>
							<#elseif (processUnitIDUnitId_defaultValue!)?string=="currentPost">
								<#assign processUnitIDUnitId_defaultValue='${postJson!}'>
							<#elseif (processUnitIDUnitId_defaultValue!)?string=="currentDepart">
								<#assign processUnitIDUnitId_defaultValue='${deptJson!}'>
							<#elseif (processUnitIDUnitId_defaultValue!)?string=="currentComp">
								<#assign processUnitIDUnitId_defaultValue='${compJson!}'>
							</#if>
									<@datacolumn key="processUnitIDUnitId"  multiselect=true displayFieldName="name"      showFormat="TEXT" defaultValue="${(processUnitIDUnitId_defaultValue!)?string}" defaultDisplay="${(processUnitIDUnitId_displayDefaultType!)?string}" decimal="" editable=true type="multselect" showType="multselect" notnull=true   selectCompName="RM.formula.formula.arrSuitlineEdit"  textalign="right"  viewUrl="/MESBasic/factoryModel/factoryModel/suitLineRef.action?multiSelect=true" viewCode="MESBasic_1_factoryModel_suitLineRef" mneenable=true crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1543316852447')}" mneenable=true  label="${getText('RM.propertydisplayName.randon1540450620913')}" width=200 showFormatFunc=""  />
							<#assign pmemo_displayDefaultType=''>
								<#assign pmemo_defaultValue=''>
										<#assign pmemo_defaultValue=''>
										  
									<@datacolumn key="pmemo"  popView=true      showFormat="TEXT" defaultValue="${(pmemo_defaultValue!)?string}" defaultDisplay="${(pmemo_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1540450885661')}" width=100 showFormatFunc=""  />
							<#assign headId_id_displayDefaultType=''>
								<#assign headId_id_defaultValue=''>
										<#assign headId_id_defaultValue=''>
																	<#if (headId_id_defaultValue!)?string=="currentUser">
								<#assign headId_id_defaultValue='${staffJson!}'>
							<#elseif (headId_id_defaultValue!)?string=="currentPost">
								<#assign headId_id_defaultValue='${postJson!}'>
							<#elseif (headId_id_defaultValue!)?string=="currentDepart">
								<#assign headId_id_defaultValue='${deptJson!}'>
							<#elseif (headId_id_defaultValue!)?string=="currentComp">
								<#assign headId_id_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="headId.id"        showFormat="SELECTCOMP" defaultValue="${(headId_id_defaultValue!)?string}" defaultDisplay="${(headId_id_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false     textalign="center" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.common.ID.201810251529001')}" width=100 showFormatFunc=""  />
							<#assign headTempId_displayDefaultType=''>
								<#assign headTempId_defaultValue=''>
										<#assign headTempId_defaultValue=''>
										  
									<@datacolumn key="headTempId"        showFormat="TEXT" defaultValue="${(headTempId_defaultValue!)?string}" defaultDisplay="${(headTempId_displayDefaultType!)?string}" decimal="" editable=false type="long" showType="long" notnull=false     textalign="center" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1540450847015')}" width=100 showFormatFunc=""  />
							<#assign lineId_id_displayDefaultType=''>
								<#assign lineId_id_defaultValue=''>
										<#assign lineId_id_defaultValue=''>
																	<#if (lineId_id_defaultValue!)?string=="currentUser">
								<#assign lineId_id_defaultValue='${staffJson!}'>
							<#elseif (lineId_id_defaultValue!)?string=="currentPost">
								<#assign lineId_id_defaultValue='${postJson!}'>
							<#elseif (lineId_id_defaultValue!)?string=="currentDepart">
								<#assign lineId_id_defaultValue='${deptJson!}'>
							<#elseif (lineId_id_defaultValue!)?string=="currentComp">
								<#assign lineId_id_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="lineId.id"        showFormat="SELECTCOMP" defaultValue="${(lineId_id_defaultValue!)?string}" defaultDisplay="${(lineId_id_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="RM.formula.formula.arrSuitlineEdit"  textalign="center" hiddenCol=true viewUrl="/MESBasic/factoryModel/factoryModel/factoryProductRef.action" viewCode="MESBasic_1_factoryModel_factoryProductRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1490322427886')}"  label="${getText('RM.ID.201810251030002')}" width=100 showFormatFunc=""  />
			
			</@datagrid>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
						RM.formula.formula.arrSuitlineEdit.query_dg1540451909387processUnitIDUnitId = function() {
							var clickIndex;
$("#ForLineFormula_dg1540451901057_tbody tbody tr").each(function(index){
	if($(this).attr("clk")=="on"){
		clickIndex = index;
	}
});
var lineId = ForLineFormula_dg1540451901057Widget.getCellValue(clickIndex,'lflineId.id');
return "parentId=" + lineId;
						}
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
				function ForProcessUnit_dg1540451909387_check_datagridvalid(){
					//
					var errorObj =ForProcessUnit_dg1540451909387Widget._DT.testData();
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
				
				function savedg1540451909387DataGrid(){
					<#if  refId?? && (refId gt 0)>
					ForProcessUnit_dg1540451909387Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('ForProcessUnit_dg1540451909387Widget') > -1) {
						ForProcessUnit_dg1540451909387Widget.setAllRowEdited();
					}
					var json = ForProcessUnit_dg1540451909387Widget.parseEditedData();
					$('input[name="dg1540451909387ListJson"]').remove();
					$('input[name="dgLists[\'dg1540451909387\']"]').remove();
					$('input[name="dg1540451909387ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1540451909387\']">').val(json).appendTo($('#RM_formula_formula_arrSuitlineEdit_form'));
					$('<input type="hidden" name="dg1540451909387ModelCode">').val('RM_7.5.0.0_formula_ForProcessUnit').appendTo($('#RM_formula_formula_arrSuitlineEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1540451909387ListJson">').val(json).appendTo($('#RM_formula_formula_arrSuitlineEdit_form'));
				}
				function DT_ForProcessUnit_dg1540451909387_deldatagrid(){
					var deleteRows = ForProcessUnit_dg1540451909387Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','puunitId.id','puformulaId.id','lineId.id','puprocessId.id','headId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1540451909387DeletedIds").length>0){
							$("#dg1540451909387DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1540451909387DeletedIds" name="dgDeletedIds[\'dg1540451909387\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_arrSuitlineEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1540451909387DeletedIds['+CUI('input[name^="dg1540451909387DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_arrSuitlineEdit_form'));
					});
					return deleteRows;
				}
				function DT_ForProcessUnit_dg1540451909387_delTreeNodes(){
					var deleteRows = ForProcessUnit_dg1540451909387Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','puunitId.id','puformulaId.id','lineId.id','puprocessId.id','headId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1540451909387DeletedIds").length>0){
							$("#dg1540451909387DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1540451909387DeletedIds" name="dgDeletedIds[\'dg1540451909387\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_arrSuitlineEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1540451909387DeletedIds['+CUI('input[name^="dg1540451909387DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_arrSuitlineEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('RM_formula_formula_arrSuitlineEdit_datagrids');
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
							if(datagrids[0][i] == 'ForProcessUnit_dg1540451909387') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'ForProcessUnit_dg1540451909387';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'ForProcessUnit_dg1540451909387';
					}
					$('body').data('RM_formula_formula_arrSuitlineEdit_datagrids', datagrids);
				});
				
				var ForProcessUnit_dg1540451909387_importDialog = null;
				function ForProcessUnit_dg1540451909387_showImportDialog(){
					try{
						if(ForProcessUnit_dg1540451909387_importDialog!=null&&ForProcessUnit_dg1540451909387_importDialog.isShow==1){
							return false;
						}
						var url = "/RM/formula/formula/initImport.action?datagridCode=RM_7.5.0.0_formula_arrSuitlineEditdg1540451909387&tid=${id!}&datagridName=dg1540451909387";
							<#if canImportExcel>
								var buttonCode="RM_7.5.0.0_formula_arrSuitlineEditdg1540451909387_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						ForProcessUnit_dg1540451909387_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("ForProcessUnit_dg1540451909387"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();ForProcessUnit_dg1540451909387_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();ForProcessUnit_dg1540451909387_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						ForProcessUnit_dg1540451909387_importDialog.show();
					}catch(e){}
				}	
				
				function ForProcessUnit_dg1540451909387_downLoadFile(){
					var url = "/RM/formula/formula/downLoad.action?datagridCode=RM_7.5.0.0_formula_arrSuitlineEditdg1540451909387&templateRelatedModelCode=RM_7.5.0.0_formula_arrSuitlineEditdg1540451909387&downloadType=template&fileName=dg1540451909387";
					window.open(url,"","");
				}
				function dg1540451909387RenderOverEvent(){
					setTimeout(function(){
	var formulaId=$('input[name="id"]').val();
	var url = "/RM/suitedLine/lineFormula/findFormulaProcess.action?formulaId="+formulaId;
	var paramResult;
	$.ajax({
		url : url,
		type : 'get',
		async : false,
		success : function(msg) {
			if(msg!=null){
				paramResult = msg;
			}
		}
	});

	arr = new Array();
	var count = 0;
	if(paramResult != null && paramResult[0] != undefined);{
		for(var param in paramResult){
			arr.push(count);
			count++;
		}
	}		
	processCount = count;
	
	
	var bottomPtRowLength = $('#ForProcessUnit_dg1540451909387 .datagrid-wrapper .datagrid .datagrid-fd table tbody tr').length;
	for(var i = 0; i < bottomPtRowLength; i++){//上pt第一行关联的数据隐藏
		if(arr.indexOf(i) != -1){
			$('#ForProcessUnit_dg1540451909387 .datagrid-wrapper .datagrid .datagrid-fd table tbody tr').eq(i).attr("style","display:block");
			$("#ForProcessUnit_dg1540451909387_tbody tbody tr").eq(i).attr("style","display:block");
		}else{
			$('#ForProcessUnit_dg1540451909387 .datagrid-wrapper .datagrid .datagrid-fd table tbody tr').eq(i).attr("style","display:none");
			$("#ForProcessUnit_dg1540451909387_tbody tbody tr").eq(i).attr("style","display:none");
		}
	}
	
	if(ForLineFormula_dg1540451901057Widget.getRowLength()>0){
		ForLineFormula_dg1540451901057Widget.selectRow(0);
	}
		
	
},100);
//下PT工作单元字段默认放大镜显示
$('#ForProcessUnit_dg1540451909387_tbody tbody tr').each(function(){
	$(this).children("td[name='dg1540451909387processUnitIDUnitId']").children("div").children("input").attr("style","display:block");
});
				}
				function dg1540451909387PageInitMethod(nTabIndex){
					RM.formula.formula.arrSuitlineEdit.initSize(nTabIndex);
				}
			</script>
			
			

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
			</div>
			</div>
		</div>
	</div>
	<#if (pendingId?? || editNew) && !(superEdit!false)>
	<#include "../../../ec/tableInfo/flowDealContainer_all.ftl">
	</#if>
			
			
</div>
		<#if businessCenterList??>
	     	<#list businessCenterList as l>
		<div style="float:none;width:auto;display:none;" class="edit-main grid-s5m0 col-main main-wrap" id="otherContentDiv_${l.relatingModel.code.replace('.','')}">
	     	</div>
	     	</#list>
     	</#if>
     	
		<div id="RM_formula_formula_arrSuitlineEdit_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<#if !(superEdit!false)>
				<li id="flowHead" onclick="RM.formula.formula.arrSuitlineEdit.showFlowInfo('flow')"><span class="icon_prograss"></span>${getText("ec.flow.flowImage")}</li>
				</#if>
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="RM.formula.formula.arrSuitlineEdit.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
				<li id="dealInfoHead" class="bar" onclick="RM.formula.formula.arrSuitlineEdit.showDealInfo('dealInfo')"><span class="icon_handle"></span>${getText("ec.view.dealadvice")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<#if !(superEdit!false)>
				<div class="flow-height wid" id="flowDiv"></div>
				</#if>
				<div id="fileUploadDiv" class="wid-hei"></div>
				<div style="padding:1px 0px 0px 0px;" id="dealInfoDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_arrSuitlineEdit,html,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) -->
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
						$("#RM_formula_formula_arrSuitlineEdit_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#RM_formula_formula_arrSuitlineEdit_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#RM_formula_formula_arrSuitlineEdit_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#RM_formula_formula_arrSuitlineEdit_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			RM.formula.formula.arrSuitlineEdit.initCount = 0;
			RM.formula.formula.arrSuitlineEdit.initSize = function(nTabIndex){
				var panesHeight;
				var thisHeight;
				var h = $(window).height();
			    var w = $(window).width();
			    var width_ = 0;
			    if($('#edit_side_btn').length > 0){
				 $('#edit_side_btn').hasClass('edit-side-btn-r') ? width_ = 0 : width_ = 145;			
				}
				<#if businessCenterList??&&businessCenterList?size gt 0 >
				if($("#edit_sidebar").css("display") === "none"){
					$("div.edit-workflow").css("left",1);
				}else{
					$("div.edit-workflow").css("left",145);
				}
				$("#edit_sidebar").height(h);
				$("div.edit-sidebar-inner").height(h);
				$("#edit_side_btn").css("top",(h-50)/2);
				CUI('div[id^="otherContentDiv_"]').height(h);
				</#if>
				var conHeight = h-$("#RM_formula_formula_arrSuitlineEdit_main_div .edit-head").height()-$("#RM_formula_formula_arrSuitlineEdit_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#RM_formula_formula_arrSuitlineEdit_main_div .edit-workflow").height()</#if>;
				$("#RM_formula_formula_arrSuitlineEdit_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('RM_formula_formula_arrSuitlineEdit_datagrids');
				var padding_bottom=16;
				$("#RM_formula_formula_arrSuitlineEdit_main_div .pd_bottom,#RM_formula_formula_arrSuitlineEdit_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#RM_formula_formula_arrSuitlineEdit_main_div .edit-panes-s").each(function(index){
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
							$(this).parent().height(thisHeight);			//解决存在存在pt的情况，当页面resize时，造成的高度设定不正确问题， BugID=27472			--fukun
							datatableHeight = conHeight - thisHeight;
						}
					} else {
						if(thisHeight > conHeight) {
							$(this).parent().height(conHeight);
							$(this).parent().css("overflow-y","auto");
						} else if(thisHeight && thisHeight > 0) {
							$(this).parent().height(conHeight);  //如果实际高度小于分配给它的高度，就使用分配给它的高度 BugID=18196     --xudihui
						}
					}
					if(datagrids && datagrids.length > 0) {
						if(datagrids[index].length > 0) {
							datatableHeight = datatableHeight; 
							var perHeight = datatableHeight/datagrids[index].length;
							for(var dg=0;dg<datagrids[index].length;dg++) {
								
								var dgwidget = eval(datagrids[index][dg]+'Widget');
								
								if(dgwidget) {
									var dg_container = dgwidget._DT ? ( dgwidget.isJS ? dgwidget._DT.container :  dgwidget._DT.oGridDiv ) : dgwidget.container;
									if ( $( dg_container ).is( ':visible' ) ) {
									   	 if( dgwidget._oGrid || dgwidget._DT._oGrid ){
                                          dgwidget.setHeight(perHeight - 78); 
										  if ( $('._DT_blank','#' + datagrids[index] + '_wrapper').length == 0 ) {
										     $('#' + datagrids[index] + '_wrapper').append('<div style="height:11px" class="_DT_blank" ></div>')  //当使用控件PT的时候，为底部增加10px的div，  xudihui  2015.01.27
										   } 
                                         }
									     else{
									      dgwidget.setHeight(perHeight - 68);
									     }	
									}
								} else {
									if(RM.formula.formula.arrSuitlineEdit.initCount <= 2) {
										setTimeout(function(){RM.formula.formula.arrSuitlineEdit.initSize();}, 200);
										RM.formula.formula.arrSuitlineEdit.initCount++;
									}/* else {
										RM.formula.formula.arrSuitlineEdit.initCount = 0;
									}*/
								}
							}
						}
					} else {
						if(thisHeight < conHeight){ //当此页签下面的实际内容高度小于分配给它的高度
						    $(this).parent().height(conHeight);
						}
						else{     //当此页签下面的实际内容高度大于分配给它的高度
							$(this).parent().height(conHeight);
							if(($("#RM_formula_formula_arrSuitlineEdit_main_div .edit-workflow").length > 0) && ($("#RM_formula_formula_arrSuitlineEdit_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
							 $(this).parent().height(conHeight-14); //有处理结果浮动层的时候，底部留白14像素
							}	
							$(this).parent().css("overflow-y","auto");
						}
					}
					/*
					// 文档申明换成更标准的之后,这个问题不会出现在真实的ie8及以上的浏览器中, 这里的算法会产生其他问题BugID=18197,先注释掉这段代码，后面如果有需要再调整这块代码 ———— lidong
					if($(this).parent().css("overflow-y")=="auto"){  //IE7 下面当内容出现滚动条的时候，不会主动去腾出滚动条的宽度，需要手动计算
						if(YAHOO.env.ua.ie < 8 ){
	                         var width = parseInt($(window).width());
							if($("#edit_side_btn").length>0){
							   $("#edit_side_btn").hasClass('edit-side-btn-r') ? width = width : width = width-145;
							}
							if($('.edit-tabs').length>0){
							   width = width*0.98; //IE7下面把总宽度的98%赋值给它的分配宽度，保持跟IE高版本一致
							}
							var style = ';width:' + (width-48) + 'px;';  //IE7下面把它的分配宽度再减去右侧滚动条的宽度
							$(this).attr('style',style);
							$(this).parent().parent().find('.edit-datatable').each(function(){ //IE7下面如果pt内容为空，直接隐藏，不然会有一个默认高度
								if($(this).html() ==''){$(this).css('display','none');}
							});
						}					
					}
					*/						
				});
			}
			$(function(){
				$('#RM_formula_formula_arrSuitlineEdit_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				RM.formula.formula.arrSuitlineEdit.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				RM.formula.formula.arrSuitlineEdit.initSize();
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
						if(parseInt($("#RM_formula_formula_arrSuitlineEdit_main_div").css("width"),10)==650){
							$("#RM_formula_formula_arrSuitlineEdit_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//RM.formula.formula.arrSuitlineEdit.resizeLayout();
						//RM.formula.formula.arrSuitlineEdit.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#RM_formula_formula_arrSuitlineEdit_main_div").css("width"),10)==800){
							$("#RM_formula_formula_arrSuitlineEdit_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//RM.formula.formula.arrSuitlineEdit.resizeLayout();
						//RM.formula.formula.arrSuitlineEdit.initSize();
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
					RM.formula.formula.arrSuitlineEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					RM.formula.formula.arrSuitlineEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){RM.formula.formula.arrSuitlineEdit.initSize();});
				/*
				RM.formula.formula.arrSuitlineEdit.resizeLayout=function(){
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
			<#if editNew>
			RM.formula.formula.arrSuitlineEdit.setDepartment();
			<#else>
			CUI("#dealInfoContain").load("/ec/workflow/dealInfo.action?dlTableInfoId=${formula.tableInfoId!}&dealInfoGroup=byTime&preName=mainFrame&dealDataUrl=/RM/formula/formula/dealInfo-list.action&enableSimpleDealInfo=false");
			</#if>
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

		RM.formula.formula.arrSuitlineEdit.validate = function(){
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
		RM.formula.formula.arrSuitlineEdit.beforeSaveProcess = function(){
			try{eval("savedg1540451909387DataGrid()");}catch(e){}
			try{eval("savedg1540451901057DataGrid()");}catch(e){}

			var extraCol = '<extra-data>';
			$('#RM_formula_formula_arrSuitlineEdit_form').trigger('beforeSubmit');
			//formula.extraCol
			$('*[name^="_complex_"]').each(function(index, item){
				if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
					if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
					var itemValue = CUI(item).val();
					extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
				}
			});
			extraCol += '</extra-data>';
			$('input[name="formula.extraCol"]').val(extraCol);
		}
		RM.formula.formula.arrSuitlineEdit.processDataGrid = function(){
										<#if false && isIE>
										$('#RM_formula_formula_arrSuitlineEdit_form').append(ForLineFormula_dg1540451901057Widget._DT.createInputs('dg1540451901057List'));
										</#if>
										<#if false && isIE>
										$('#RM_formula_formula_arrSuitlineEdit_form').append(ForProcessUnit_dg1540451909387Widget._DT.createInputs('dg1540451909387List'));
										</#if>
		};
		RM.formula.formula.arrSuitlineEdit.save = function(){
			<#if !(superEdit!false)>
			$('#operateType').val("save");
			<#else>
			$('#operateType').val("submit");
			</#if>
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!RM.formula.formula.arrSuitlineEdit.validate()){return;}
			//延迟到延迟提交中处理,解决onchange事件无法触发问题
			//RM.formula.formula.arrSuitlineEdit.beforeSaveProcess();

			//RM.formula.formula.arrSuitlineEdit.processDataGrid();
			$('#RM_formula_formula_arrSuitlineEdit_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('RM_formula_formula_arrSuitlineEdit_form','RM_formula_formula_arrSuitlineEdit_datagrids')) {      
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
		RM.formula.formula.arrSuitlineEdit.print = function(){
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
		
		RM.formula.formula.arrSuitlineEdit.saveSetting = function(){
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
		
		RM.formula.formula.arrSuitlineEdit.printSetting = function(){
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
				RM.formula.formula.arrSuitlineEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(RM.formula.formula.arrSuitlineEdit.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				RM.formula.formula.arrSuitlineEdit.settingDialog.show();
			}
		}
		
		
		
		RM.formula.formula.arrSuitlineEdit.reject = function(){
			var rejectDiv = $("div.deal-result[id^='reject_']");
			if(rejectDiv.length == 1 && $($('input[name="workFlowVar.outcome"][rejectFlag="1"]')[0]).prop('checked') == false){
				$($('input[name="workFlowVar.outcome"][rejectFlag="1"]')[0]).prop('checked',true);
				$($('input[name="workFlowVar.outcome"][rejectFlag="1"]')[0]).click();
			} else {
				if(undefined == $('input[name="workFlowVar.outcome"][rejectFlag="1"]:checked').val()){
					workbenchErrorBarWidget.showMessage("${getText('ec.flow.outcome.reject.select')}");
					return;
				}
			}
			$('#operateType').val("reject");
			RM.formula.formula.arrSuitlineEdit.submit();
		}
		
		RM.formula.formula.arrSuitlineEdit.submit = function(uncheck){
			if(uncheck){
			
			} else {
				var operateType = $('#operateType').val();
				if(operateType == "reject"){
					$('#operateType').val("submit");
				} else {
					var normalActives = $('input[name="workFlowVar.outcome"]').not('[rejectFlag="1"]');
					if(null != normalActives && undefined != normalActives && normalActives.length == 1 && $(normalActives[0]).prop('checked') == false){ //普通活动只有一个
						$(normalActives[0]).prop('checked',true);
						$(normalActives[0]).click();
					} else {//多个普通活动
						if(!($('#__workflow_outcome_countersign').prop("checked")||$('input[name="workFlowVar.outcome"]:checked').not('[rejectFlag="1"]').val())){
							workbenchErrorBarWidget.showMessage("${getText('ec.flow.outcome.select')}");
							return;
						}
					}
				}
			}
			$('#operateType').val("submit");
			if(!RM.formula.formula.arrSuitlineEdit.validate()){return;}
			
			//$('#__workflow_outcomeDes').val($('input[name="workFlowVar.outcome"]:checked').attr('des'));
			
			RM.formula.formula.arrSuitlineEdit.beforeSaveProcess();
			
			//RM.formula.formula.arrSuitlineEdit.processDataGrid();
			
			var array=new Array();
			
			var requiredStaff=false;
			var outcomeDesc="";
			$('input[name="workFlowVar.outcome"]:checked').each(function(){
				var checkNull=CUI(this).attr("checkNull");
				
				var paramObj=new Object();
				paramObj.type='normal';
				paramObj.outcome=$(this).val();
				paramObj.dec=$(this).attr("dec");
				outcomeDesc=$(this).attr("dec");
				var id="#assignStaffSelect_"+$(this).val()+"MultiIDs";
				var values=$(id).val();
				var checkNull=$(this).attr("checkNull");
				if(checkNull=='true'&&values==''){
					requiredStaff=true;
					return ;
				}
				paramObj.assignUser=values;
				array.push(paramObj);
			
			})
			
			
			$('input[id*="__workflow_outcome_nodification_"]:checked').each(function(){
				var paramObj1=new Object();
				paramObj1.type='notification';
				paramObj1.outcome=$(this).val();
				paramObj1.dec=$(this).attr("dec");
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
				paramObj1.assignUser=values1;
				array.push(paramObj1);
			
			})
			if(requiredStaff){
				workbenchErrorBarWidget.showMessage(outcomeDesc+"${getText("ec.flow.outcome.assStaffNull")}");
				return ;
			}
			if(array.length>0){
				$("#__workflow_outcomeMap").val(YAHOO.lang.JSON.stringify(array));
			}else if($('#__workflow_outcome_countersign').prop("checked")){
				var paramObj1=new Object();
				paramObj1.type='countersignAssign';
				paramObj1.outcome="countersignAssign";
				paramObj1.dec="countersignAssign";
				var countersignUsers=CUI('#countersignUsersMultiIDs').val();
				
				if(countersignUsers==''){
					workbenchErrorBarWidget.showMessage(outcomeDesc+"您勾选了转发，请指定转发人员！");
					return ;
				}
				
				array.push(paramObj1);
				$("#__workflow_outcomeMap").val(YAHOO.lang.JSON.stringify(array));
			}
			$('#RM_formula_formula_arrSuitlineEdit_form').submit();
			//$(".wfcancel").remove();
			
		}
		RM.formula.formula.arrSuitlineEdit.recall = function(){
			CUI.Dialog.confirm("${getText('ec.recall.checkrecall')}", function(){
					$.ajax({
					url : "/RM/formula/formula/common/recall.action",
					type : 'post',
					async : false,
					data:{"tableInfoId": "${(formula.tableInfoId)?default('')}"},
					success : function(msg) {
						if(msg && msg.success){
							workbenchErrorBarWidget.showMessage("${getText('ec.recall.success')}", 's');
		 					var url = "/foundation/user/open-pending.action?pendingId=" + msg.data.id + "&tableInfoId=${(formula.tableInfoId)?default('')}&id=${(formula.id)?default('')}&entityCode=RM_7.5.0.0_formula";

			 				try{
								window.opener.refreshPortal('workflow');
								window.opener.timeData();
							}catch(e){
								try{
			 						window.opener.RM.formula.formula.editCallBackInfo(res); 						
								}catch(e2){
									try{
										<#if calltype??&&calltype=='ref'>
										window.opener.RM.formula.formula.callBackInfo(res);
										<#else>
										window.opener.location.reload();
										</#if>
									}catch(e3){}
								}
							};

		 					setTimeout(function(){
		 						window.onbeforeunload = null;
								document.location.href=url;
		 					}, 1000);
						}
					}
				});
			});
		}
		RM.formula.formula.arrSuitlineEdit._callBackInfo = function(res){
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
 						window.opener.RM.formula.formula.editCallBackInfo(res); 						
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
				<#if !(superEdit!false)>
 				if(res.operateType == 'save'){
 					var url = "/foundation/user/open-pending.action?pendingId=" + res.pendingId + "&tableInfoId=" + res.tableInfoId + "&id=" + res.id + "&entityCode=RM_7.5.0.0_formula";
 					setTimeout(function(){
						document.location.href=url;
 					}, 1000);
					return;
 				}
 				</#if>

 				setTimeout(function(){
					window.close();
				},1000);
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.RM.formula.formula.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
			} else {
				CUI.showErrorInfos(res);
			}
		};
		refViewRefresh = function(){
			if($("[name='refViewRefresh']").val() != undefined && "" != $("[name='refViewRefresh']").val()){
				eval($("[name='refViewRefresh']").val());
			}
		}
		<#if editNew>
		RM.formula.formula.arrSuitlineEdit.setDepartment = function(){
			var o = $('#creatorPosition').find("option[selected]");
			if(o && o.length == 1) {
				$('#creatorDepartmentName').text(o.attr('departmentName'));
				$('#creatorDepartmentId').val(o.attr('departmentId'));
				$('#positionLayRec').val(o.attr('layRec'));
			}
		};
		</#if>
		
		//控件版PT选人查看按钮单击事件处理函数
		function dataGridBtnImgClick(sUrl,objNameCustomCondition,sTitle,sPTGridID,nRow,sFieldName,oGrid,customCallBack,crossCompany,isObjCustomProp,objCustomPropNames,viewCode){
			//保存当前单击事件的对象信息
			var obj = {
				"oGrid" : oGrid,
				"nRow" : nRow - 1,
				"sKey":	sFieldName
			}
			if(customCallBack){
				RM.formula.formula.arrSuitlineEdit._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				RM.formula.formula.arrSuitlineEdit._isObjCustomProp_IE = isObjCustomProp;
			} else {
				RM.formula.formula.arrSuitlineEdit._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				RM.formula.formula.arrSuitlineEdit._objCustomPropNames_IE = objCustomPropNames;
			} else {
				RM.formula.formula.arrSuitlineEdit._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				RM.formula.formula.arrSuitlineEdit._refViewCode_IE = viewCode;
			} else {
				RM.formula.formula.arrSuitlineEdit._refViewCode_IE = '';
			}
			RM.formula.formula.arrSuitlineEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		RM.formula.formula.arrSuitlineEdit.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			RM.formula.formula.arrSuitlineEdit._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			RM.formula.formula.arrSuitlineEdit._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			RM.formula.formula.arrSuitlineEdit.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			RM.formula.formula.arrSuitlineEdit._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				RM.formula.formula.arrSuitlineEdit._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		RM.formula.formula.arrSuitlineEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(RM.formula.formula.arrSuitlineEdit._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(RM.formula.formula.arrSuitlineEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				RM.formula.formula.arrSuitlineEdit.gridEventObj = gridEventObj;
				callbackName = "RM.formula.formula.arrSuitlineEdit.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "RM.formula.formula.arrSuitlineEdit.getMultiselectCallBackInfo_DG" : "RM.formula.formula.arrSuitlineEdit.getcallBackInfo_DG";
				RM.formula.formula.arrSuitlineEdit._currRow = $(obj).closest('tr')[0];
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="RM.formula.formula.arrSuitlineEdit.getcallBackInfo";
			}

			if(_prefix!=''){
				RM.formula.formula.arrSuitlineEdit._prefix = _prefix.substring(1);
			}
			
			RM.formula.formula.arrSuitlineEdit._oGrid = oGrid;
			RM.formula.formula.arrSuitlineEdit._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					RM.formula.formula.arrSuitlineEdit._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					RM.formula.formula.arrSuitlineEdit._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					RM.formula.formula.arrSuitlineEdit._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					RM.formula.formula.arrSuitlineEdit._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					RM.formula.formula.arrSuitlineEdit._refViewCode = oColumn.viewCode;
				} else {
					RM.formula.formula.arrSuitlineEdit._refViewCode = '';
				}
			} else {
				RM.formula.formula.arrSuitlineEdit._isObjCustomProp = false;
				RM.formula.formula.arrSuitlineEdit._objCustomPropNames = '';
				RM.formula.formula.arrSuitlineEdit._refViewCode = '';
			}
			if (RM.formula.formula.arrSuitlineEdit._isObjCustomProp == true && RM.formula.formula.arrSuitlineEdit._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				RM.formula.formula.arrSuitlineEdit._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				RM.formula.formula.arrSuitlineEdit._customCallBack = customCallBack;
			}
			if(RM.formula.formula.arrSuitlineEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(RM.formula.formula.arrSuitlineEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof RM.formula.formula.arrSuitlineEdit._querycustomFuncN == "function") {
				refparam += RM.formula.formula.arrSuitlineEdit._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			RM.formula.formula.arrSuitlineEdit._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		RM.formula.formula.arrSuitlineEdit._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(RM.formula.formula.arrSuitlineEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(RM.formula.formula.arrSuitlineEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			RM.formula.formula.arrSuitlineEdit._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'RM.formula.formula.arrSuitlineEdit.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		RM.formula.formula.arrSuitlineEdit._querycustomFunc = function(obj) {
			var str = eval("typeof(RM.formula.formula.arrSuitlineEdit.query_"+obj+")!='undefined'") ? eval('RM.formula.formula.arrSuitlineEdit.query_'+obj+'()') : null;
			return str;
		};
		RM.formula.formula.arrSuitlineEdit.getcallBackGroupInfo = function(obj){
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
			RM.formula.formula.arrSuitlineEdit._dialog.close();
		}
		RM.formula.formula.arrSuitlineEdit.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('RM_formula_formula_arrSuitlineEdit_form',obj[0], RM.formula.formula.arrSuitlineEdit._prefix, RM.formula.formula.arrSuitlineEdit._sUrl);
			CUI.commonFills('RM_formula_formula_arrSuitlineEdit_form',RM.formula.formula.arrSuitlineEdit._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (RM.formula.formula.arrSuitlineEdit._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(RM.formula.formula.arrSuitlineEdit._customCallBack) {
					eval(RM.formula.formula.arrSuitlineEdit._customCallBack);
					RM.formula.formula.arrSuitlineEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.formula.formula.arrSuitlineEdit._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		RM.formula.formula.arrSuitlineEdit.getcallBackInfo_DG_IE = function(obj){
			if(RM.formula.formula.arrSuitlineEdit._customBeforeCallBack) {
				var flag = eval(RM.formula.formula.arrSuitlineEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = RM.formula.formula.arrSuitlineEdit.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( RM.formula.formula.arrSuitlineEdit._isObjCustomProp_IE == true && RM.formula.formula.arrSuitlineEdit._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,RM.formula.formula.arrSuitlineEdit._sUrl,RM.formula.formula.arrSuitlineEdit._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,RM.formula.formula.arrSuitlineEdit._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (RM.formula.formula.arrSuitlineEdit._isObjCustomProp_IE == true && RM.formula.formula.arrSuitlineEdit._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = RM.formula.formula.arrSuitlineEdit._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = RM.formula.formula.arrSuitlineEdit._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && RM.formula.formula.arrSuitlineEdit._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + RM.formula.formula.arrSuitlineEdit._refViewCode_IE + '&id=' + id,
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
				if(RM.formula.formula.arrSuitlineEdit._customCallBack) {
					eval(RM.formula.formula.arrSuitlineEdit._customCallBack);
					RM.formula.formula.arrSuitlineEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.formula.formula.arrSuitlineEdit._dialog.close();
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
		
		RM.formula.formula.arrSuitlineEdit.getcallBackInfo_DG = function(obj){
			if(RM.formula.formula.arrSuitlineEdit._customBeforeCallBack) {
				var flag = eval(RM.formula.formula.arrSuitlineEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(RM.formula.formula.arrSuitlineEdit._currRow).next().length==0){
						RM.formula.formula.arrSuitlineEdit._oGrid.addNewRow();
					}	
					RM.formula.formula.arrSuitlineEdit._currRow = $(RM.formula.formula.arrSuitlineEdit._currRow).next();
					$(RM.formula.formula.arrSuitlineEdit._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(RM.formula.formula.arrSuitlineEdit._currRow,obj[i], RM.formula.formula.arrSuitlineEdit._prefix, RM.formula.formula.arrSuitlineEdit._sUrl);
				if (RM.formula.formula.arrSuitlineEdit._isObjCustomProp == true && RM.formula.formula.arrSuitlineEdit._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(RM.formula.formula.arrSuitlineEdit._currRow,RM.formula.formula.arrSuitlineEdit._prefix,obj[i],RM.formula.formula.arrSuitlineEdit._oGrid,RM.formula.formula.arrSuitlineEdit._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(RM.formula.formula.arrSuitlineEdit._currRow,RM.formula.formula.arrSuitlineEdit._prefix,obj[i],RM.formula.formula.arrSuitlineEdit._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + RM.formula.formula.arrSuitlineEdit._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + RM.formula.formula.arrSuitlineEdit._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && RM.formula.formula.arrSuitlineEdit._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + RM.formula.formula.arrSuitlineEdit._refViewCode + '&id=' + id,
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
									name = RM.formula.formula.arrSuitlineEdit._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(RM.formula.formula.arrSuitlineEdit._currRow, objs, RM.formula.formula.arrSuitlineEdit._oGrid);
							}
						}
					}
				}
			}
			try{
				if(RM.formula.formula.arrSuitlineEdit._customCallBack) {
					eval(RM.formula.formula.arrSuitlineEdit._customCallBack);
					RM.formula.formula.arrSuitlineEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.formula.formula.arrSuitlineEdit._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + RM.formula.formula.arrSuitlineEdit._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		RM.formula.formula.arrSuitlineEdit.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(RM.formula.formula.arrSuitlineEdit._oGrid, RM.formula.formula.arrSuitlineEdit._currRow, RM.formula.formula.arrSuitlineEdit._key, RM.formula.formula.arrSuitlineEdit._displayFieldName, obj[i])
			}
			try{
				if(RM.formula.formula.arrSuitlineEdit._customCallBack) {
					eval(RM.formula.formula.arrSuitlineEdit._customCallBack);
					RM.formula.formula.arrSuitlineEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.formula.formula.arrSuitlineEdit._dialog.close();
			} catch(e){}
		};
		
		RM.formula.formula.arrSuitlineEdit.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						RM.formula.formula.arrSuitlineEdit.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#RM_formula_formula_arrSuitlineEdit_form'));
						}
					}
				}
			});
		};

		$(function(){
			RM.formula.formula.arrSuitlineEdit.onloadForProduct();
			var custonAction = "/RM/formula/formula/arrSuitlineEdit/submitCustom.action?__pc__=Zm9ybXVsYUxpc3RfYXJyU3VpdGxpbmVFZGl0X21vZGlmeV9STV83LjUuMC4wX2Zvcm11bGFfZm9ybXVsYUxpc3R8&_bapFieldPermissonModelCode_=RM_7.5.0.0_formula_Formula&_bapFieldPermissonModelName_=Formula&superEdit=true";
$("#RM_formula_formula_arrSuitlineEdit_form").attr("action",custonAction);
		});

		RM.formula.formula.arrSuitlineEdit.beforeSubmitMethodSettingInPage = function(){
			RM.formula.formula.arrSuitlineEdit.onsaveForProduct();
			beforeSaveFunction();
		};
		RM.formula.formula.arrSuitlineEdit.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  RM.formula.formula.arrSuitlineEdit.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		RM.formula.formula.arrSuitlineEdit.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#RM_formula_formula_arrSuitlineEdit_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#RM_formula_formula_arrSuitlineEdit_main_div").hide();
				},100);
				//CUI("#RM_formula_formula_arrSuitlineEdit_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		RM.formula.formula.arrSuitlineEdit.showThis = function(){
			if(!CUI("#RM_formula_formula_arrSuitlineEdit_main_div").is(':visible')) {
				CUI("#RM_formula_formula_arrSuitlineEdit_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		RM.formula.formula.arrSuitlineEdit.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			RM.formula.formula.arrSuitlineEdit.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "RM_formula_formula_arrSuitlineEdit_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=RM&modelName=RM_7.5.0.0_formula_Formula&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			RM.formula.formula.arrSuitlineEdit.auditDialog.show();
			</#if>
		}
		
		
		RM.formula.formula.arrSuitlineEdit.showInfoDialog=function(mode){
			
			RM.formula.formula.arrSuitlineEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "RM_formula_formula_arrSuitlineEdit_dealInfo",
				modal:true,
				height:500,
				width: 950,//适应国际化版
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			RM.formula.formula.arrSuitlineEdit.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		RM.formula.formula.arrSuitlineEdit.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=RM_7.5.0.0_formula");
			}
		}
		
		RM.formula.formula.arrSuitlineEdit.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/RM/formula/formula/dealInfo-list.action&dlTableInfoId=${(formula.tableInfoId)?default('')}");
			}
		}
		RM.formula.formula.arrSuitlineEdit.showFlowInfo=function(){
		     //IE8环境下使用旧版flash流程展现页面，其他情况使用html5流程展现页面
		    var browser=navigator.appName; 
			var b_version=navigator.appVersion; 
			var version=b_version.split(";"); 
			var trim_Version=version[1]&&version[1].replace(/[ ]/g,"");
			var isIE8=(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE8.0")||($.browser.msie&&(Number($.browser.version)<= 8));//IE8兼容视图模式下浏览器版本判断逻辑补充
			if(CUI.trim(CUI("#flowDiv").html())==""){
				if(isIE8){
				    CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=RM_7.5.0.0_formula_Formula&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(formula.tableInfoId)?default('')}");
				}else{
				    CUI("#flowDiv").load("/ec/workflow/flowViewH5.action?env=runtime&modelCode=RM_7.5.0.0_formula_Formula&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(formula.tableInfoId)?default('')}");
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
		RM.formula.formula.arrSuitlineEdit.supervision=function(){
			RM.formula.formula.arrSuitlineEdit.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(formula.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				RM.formula.formula.arrSuitlineEdit.modifyOwnerStaffDialog.show();
		}
		





		/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_arrSuitlineEdit,js,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码
	//参照生产线
	function openRefFactory(){
        var refUrl = "/MESBasic/factoryModel/factoryModel/factoryProductRef.action?&closePage=true&callBackFuncName=RM.formula.formula.arrSuitlineEdit.getcallBackInfo_DG&null&crossCompanyFlag=false&openType=dialog&requstObjectType=dialog&__res_html=true";
		questionShow('other',refUrl,'工厂模型','');
    }
	
    var question_dialog;
	function questionShow(type,url,title,refparam){
		question_dialog = foundation.common.select({
			pageType : type,
			closePage : true,
			callBackFuncName : '_callback_Question',
			url : url,
			title : title,
			params : refparam
		});
	}
	
	function _callback_Question(obj){
		console.log(obj);
		//ForLineFormula_dg1540451901057Widget._DT.delAllRows();
		var firstAddRowNum = 0;//上pt第一条增加的行的id
		var needRowIndex = 0;//下pt需要几个行号
		//获取配方工序
		var formulaId=$('input[name="id"]').val();
		var url = "/RM/suitedLine/lineFormula/findFormulaProcess.action?formulaId="+formulaId;
		var paramResult;
		$.ajax({
			url : url,
			type : 'get',
			async : false,
			success : function(msg) {
				if(msg!=null){
					paramResult = msg;
				}
			}
		});
		
		var autoReportOnFinishId = $("input[name='formula.autoReportOnFinish.id']").val();
		var autoReportOnFinishValue = $("input[name='formula.autoReportOnFinish.value']").val();
		var isBatchControl = $("input[name='formula.batchContral']").val();
		
     	for(var i = 0 ; i < ec_MESBasic_factoryModel_factoryModel_factoryProductRef_queryWidget.selectedRows.length; i++) {//新增行插入流水线信息
			
			var factoryId = ec_MESBasic_factoryModel_factoryModel_factoryProductRef_queryWidget.getSelectedRow()[i].id;
			var factoryName = ec_MESBasic_factoryModel_factoryModel_factoryProductRef_queryWidget.getSelectedRow()[i].name;
			
			var idEq = false;
			var nowRowNum = ForLineFormula_dg1540451901057Widget.getRowLength();
			for(var j = 0 ; j < nowRowNum; j++){//过滤已有的数据
				var existFactoryId = ForLineFormula_dg1540451901057Widget._DT.getCellValue(j,'lflineId.id');
				if(existFactoryId != '' && factoryId != '' && existFactoryId == factoryId){
					idEq = true;
					break;
				}
			}
			if(idEq){
				continue;
			}
			if(i == 0){
				firstAddRowNum = nowRowNum;
			}
            ForLineFormula_dg1540451901057Widget._DT.addNewRow();
			
			//生产线名称
			ForLineFormula_dg1540451901057Widget._DT.setCellValue(nowRowNum,'lflineId.name',factoryName);
			//生产线id
			ForLineFormula_dg1540451901057Widget._DT.setCellValue(nowRowNum,'lflineId.id',factoryId);
			ForLineFormula_dg1540451901057Widget._DT.setCellValue(nowRowNum,'autoReportOnFinish.id',autoReportOnFinishId);
			
			//如果勾选批控，回填完成后自动报工
			ForLineFormula_dg1540451901057Widget._DT.setCellValue(nowRowNum,'autoReportOnFinish.id',autoReportOnFinishId);
			
			
			$("#ForLineFormula_dg1540451901057_tbody tbody tr").eq(ForLineFormula_dg1540451901057Widget.getRowLength()-1).bind("click",function(){
				$("#ForLineFormula_dg1540451901057_tbody tbody tr").removeAttr("clk");
				$(this).attr("clk","on");	
				var clickIndex;
				$("#ForLineFormula_dg1540451901057_tbody tbody tr").each(function(index){
					if($(this).attr("clk")=="on"){
						clickIndex = index;
					}
				});
				//console.log(clickIndex + ";" + oldSelectRow);
				if( clickIndex != oldSelectRow){
					var bottomPtLength = ForProcessUnit_dg1540451909387Widget.getRowLength();
					//var newSelectedRow = ForLineFormula_dg1540451901057Widget.getSelectedRow();
					var needContinue = true;
					
					var oldUpPtLineId = ForLineFormula_dg1540451901057Widget.getCellValue(oldSelectRow,"lflineId.id");
					var oldUpPtLineName = ForLineFormula_dg1540451901057Widget.getCellValue(oldSelectRow,"lflineId.name");
					//先检查工作单元是否为空，如果为空不允许换行
					for(var l = 0; l < bottomPtLength; l++){
						var bottomPtLineId = ForProcessUnit_dg1540451909387Widget.getCellValue(l,"lineId.id");
						var bottomPtProcessUnitIDUnitId = ForProcessUnit_dg1540451909387Widget.getCellValue(l,"processUnitIDUnitId");
						var bottomPtProcessName = ForProcessUnit_dg1540451909387Widget.getCellValue(l,"puprocessId.name");
						if(oldUpPtLineId == bottomPtLineId && (bottomPtProcessUnitIDUnitId == null || bottomPtProcessUnitIDUnitId == "")){
						
							//原选中行保持选中状态
							var oRow=ForLineFormula_dg1540451901057Widget._DT._bTbody.getElementsByTagName("tr")[oldSelectRow];
							ForLineFormula_dg1540451901057Widget._DT._setSelected(oRow);
							$("#ForLineFormula_dg1540451901057_tbody tbody tr").removeAttr("clk");
							$("#ForLineFormula_dg1540451901057_tbody tbody tr").eq(oldSelectRow).attr("clk","on");	
							
							$("#ForLineFormula_dg1540451901057_tbody tbody tr").eq(clickIndex).attr("myslted",false);
							$("#ForLineFormula_dg1540451901057_tbody tbody tr").eq(clickIndex).attr("class","dg-bd-tr");
							$("#ForLineFormula_dg1540451901057_tbody tbody tr").eq(clickIndex).children("td").each(function(index){
								$("#ForLineFormula_dg1540451901057_tbody tbody tr").eq(clickIndex).children("td").eq(index).attr("style","border-top-color: rgb(231, 231, 231); border-bottom-color: rgb(231, 231, 231);");
							});
							
							workbenchErrorBarWidget.showMessage("生产线\""+oldUpPtLineName+"\"下工序\""+bottomPtProcessName+"\"工作单元未编辑", 'f');
							
							needContinue = false;
							break;
						}
					}
					
					if(needContinue){
						
						if(oldSelectRow != null){
							$("#ForLineFormula_dg1540451901057_tbody tbody tr").eq(oldSelectRow).attr("myslted",false);
							$("#ForLineFormula_dg1540451901057_tbody tbody tr").eq(oldSelectRow).attr("class","dg-bd-tr");
							$("#ForLineFormula_dg1540451901057_tbody tbody tr").eq(oldSelectRow).children("td").each(function(index){
								$("#ForLineFormula_dg1540451901057_tbody tbody tr").eq(oldSelectRow).children("td").eq(index).attr("style","border-top-color: rgb(231, 231, 231); border-bottom-color: rgb(231, 231, 231);");
							});
						}
						
						oldSelectRow = clickIndex;
						$("#ForLineFormula_dg1540451901057_tbody tbody tr").eq(clickIndex).children("td").each(function(index){
							$("#ForLineFormula_dg1540451901057_tbody tbody tr").eq(clickIndex).children("td").eq(index).attr("style","border-top-color: rgb(255, 192, 1); border-bottom-color: rgb(255, 192, 1);");
						});
						var upPtLineId = ForLineFormula_dg1540451901057Widget.getCellValue(oldSelectRow,"lflineId.id");
						//选中行对应的工序工作单元记录显示，其他的隐藏
						for(var m = 0; m < bottomPtLength; m++){
							var bottomPtLineId = ForProcessUnit_dg1540451909387Widget.getCellValue(m,"lineId.id");
							if(upPtLineId == bottomPtLineId){
								$("#ForProcessUnit_dg1540451909387_tbody tbody tr").eq(m).attr("style","display:block");
							}else{
								$("#ForProcessUnit_dg1540451909387_tbody tbody tr").eq(m).attr("style","display:none");
							}
						}
					}
					//清空下工序的序号列,根据工序数量，重新计算序号需要几个
					$('#ForProcessUnit_dg1540451909387 .datagrid-wrapper .datagrid .datagrid-fd table tbody').html("");
					var indexHtml = "";
					for(var datagridFdIndex = 1 ; datagridFdIndex <= processCount; datagridFdIndex++){
						indexHtml += '<tr><td class="order" style="width: 37px;">'+datagridFdIndex+'</td></tr>';
					}
					$('#ForProcessUnit_dg1540451909387 .datagrid-wrapper .datagrid .datagrid-fd table tbody').html(indexHtml)
				}
			});
			
			
			
			//自动将该配方的所有工序填充到表体
			if(paramResult != null && paramResult[0] != undefined);{
				for(var param in paramResult){
					
					var processId = paramResult[param]['processId']==null?"":paramResult[param]['processId'];
					var processName= paramResult[param]['processName']==null?"":paramResult[param]['processName'];					
					
					ForProcessUnit_dg1540451909387Widget.addRow();
					var lastRow = ForProcessUnit_dg1540451909387Widget._DT.getAllRows().length - 1;
					
					ForProcessUnit_dg1540451909387Widget.setCellValue(lastRow,'puprocessId.id',processId);
					ForProcessUnit_dg1540451909387Widget.setCellValue(lastRow,'puprocessId.name',processName);
					ForProcessUnit_dg1540451909387Widget.setCellValue(lastRow,'lineId.id',factoryId);			
					
					var bottomPtRowLength = $('#ForProcessUnit_dg1540451909387 .datagrid-wrapper .datagrid .datagrid-fd table tbody tr').length;
					if(ForLineFormula_dg1540451901057Widget.getSelectedRow() == null){
						if(lastRow >= processCount){
							$("#ForProcessUnit_dg1540451909387_tbody tbody tr").eq(lastRow).attr("style","display:none");
						}
					}else{
						$("#ForProcessUnit_dg1540451909387_tbody tbody tr").eq(lastRow).attr("style","display:none");
					}			
				}
			}
        }
		
		//清空下工序的序号列,根据工序数量，重新计算序号需要几个
		$('#ForProcessUnit_dg1540451909387 .datagrid-wrapper .datagrid .datagrid-fd table tbody').html("");
		var indexHtml = "";
		for(var datagridFdIndex = 1 ; datagridFdIndex <= processCount; datagridFdIndex++){
			indexHtml += '<tr><td class="order" style="width: 37px;">'+datagridFdIndex+'</td></tr>';
		}
		$('#ForProcessUnit_dg1540451909387 .datagrid-wrapper .datagrid .datagrid-fd table tbody').append(indexHtml)
		
		//上pt没有选中行时，选中第一条增加的行，同时下pt的数据显示上pt选中行的数据
		if(ForLineFormula_dg1540451901057Widget.getSelectedRow() == null){
			ForLineFormula_dg1540451901057Widget.selectRow(firstAddRowNum);
			$("#ForLineFormula_dg1540451901057_tbody tbody tr").eq(firstAddRowNum).attr("clk","on");	
			oldSelectRow = firstAddRowNum;
			var upPtLineId = ForLineFormula_dg1540451901057Widget.getCellValue(firstAddRowNum,"lflineId.id");
			var bottomPtLength = ForProcessUnit_dg1540451909387Widget.getRowLength();
			//选中行对应的工序工作单元记录显示，其他的隐藏
			for(var j = 0; j < bottomPtLength; j++){
				var bottomPtLineId = ForProcessUnit_dg1540451909387Widget.getCellValue(j,"lineId.id");
				if(upPtLineId == bottomPtLineId){
					$("#ForProcessUnit_dg1540451909387_tbody tbody tr").eq(j).attr("style","display:block");
				}else{
					$("#ForProcessUnit_dg1540451909387_tbody tbody tr").eq(j).attr("style","display:none");
				}
			}
		}
		
		//下pt工作单元的放大镜放出来
		$('#ForProcessUnit_dg1540451909387_tbody tbody tr').each(function(){
			$(this).children("td[name='dg1540451909387processUnitIDUnitId']").children("div").children("input").attr("style","display:block");
									  
		});
		
        question_dialog.close();
  			
	};
	
	//删除上pt时，同时删除下pt关联的数据
	function DT_ForLineFormula_dg1540451901057_deldatagrid(){
		
		var selectRows = ForLineFormula_dg1540451901057Widget.getSelectedRow();
		if(selectRows == null || selectRows == undefined ) {
			CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
			return false;
		}
					
		var delIndexUp;
		$("#ForLineFormula_dg1540451901057_tbody tbody tr").each(function(index){
			if($(this).attr("clk")=="on"){
				delIndexUp = index;
			}
		});
		
		var headLineId = ForLineFormula_dg1540451901057Widget.getCellValue( delIndexUp,'lflineId.id');
		var deleteRows = ForLineFormula_dg1540451901057Widget._DT.delIndexRow((delIndexUp+1).toString());
		if(!deleteRows || deleteRows.length == 0) {
			CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
			return false;
		}
		var delproperty = "'id','version','modifyStaff.id','formulaId.id','effectStaff.id','ownerDepartment.id','lineId.id','ownerPosition.id','createStaff.id','deleteStaff.id','ownerStaff.id'";
		delproperty= delproperty.split(",")[0].substring(1).replace("'","");
		$.each(deleteRows, function(index, deleteRow){
			var tepID = eval("deleteRow."+delproperty);
			if(tepID==null || tepID == undefined || tepID == '') {
				return true;
			}
			if($("#dg1515461411247DeletedIds").length>0){
				$("#dg1515461411247DeletedIds")[0].value+=","+tepID;
			}else{
				CUI('<input type="hidden" id="dg1515461411247DeletedIds" name="dgDeletedIds[\'dg1515461411247\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_arrSuitlineEdit_form'));
			}
			//兼容旧版本提交函数
			CUI('<input type="hidden" name="dg1515461411247DeletedIds['+CUI('input[name^="dg1515461411247DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_arrSuitlineEdit_form'));
		});
		
		var count = 0;//下pt需要删除的行的数量
		var delIndexDown;//下pt需要删除的行的索引
		var dg1515465493030RowLength = ForProcessUnit_dg1540451909387Widget.getRowLength();
		for(var i = 0 ; i < dg1515465493030RowLength; i++){
			var headId = ForProcessUnit_dg1540451909387Widget.getCellValue(i,'lineId.id');
			if(headId == headLineId){
				if(delIndexDown == null){
					delIndexDown = i;
				}
				count++;
			}
		}
		oldSelectRow = null;
		if(delIndexDown != null && count>0){
			for(var j = 0 ; j < count; j++){
				ForProcessUnit_dg1540451909387Widget.selectRow(delIndexDown);
				var deleteRows = ForProcessUnit_dg1540451909387Widget.deleteRows();
				if(!deleteRows || deleteRows.length == 0) {
					CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
					return false;
				}
				var delproperty = "'id','version','processId.id','formulaId.id','lineId.id','headId.id','unitId.id'";
				delproperty= delproperty.split(",")[0].substring(1).replace("'","");
				$.each(deleteRows, function(index, deleteRow){
					var tepID = eval("deleteRow."+delproperty);
					if(tepID==null || tepID == undefined || tepID == '') {
						return true;
					}
					if($("#dg1515465493030DeletedIds").length>0){
						$("#dg1515465493030DeletedIds")[0].value+=","+tepID;
					}else{
						CUI('<input type="hidden" id="dg1515465493030DeletedIds" name="dgDeletedIds[\'dg1515465493030\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_arrSuitlineEdit_form'));
					}
					//兼容旧版本提交函数
					CUI('<input type="hidden" name="dg1515465493030DeletedIds['+CUI('input[name^="dg1515465493030DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_arrSuitlineEdit_form'));
				});
			}
		}
	}
	
	function beforeSaveFunction(){
		
		var mainId;//配方-产线表
		$.ajax({
			async   : false,
			type    : 'POST',
			url     : '/RM/formula/formula/arrSuitlineEdit/getFormulaLindNextId.action',
			success : function(res){
				if(res != null && res.nextId != null){
					mainId = res.nextId;
				}
			}
		});
			
		//把自增长的id查到对应字段中，建立两个表的关联关系
		for(var i = 0; i<ForLineFormula_dg1540451901057Widget.getRowLength(); i++){
			if(ForLineFormula_dg1540451901057Widget.getCellValue(i,'id') == null){
				console.log(mainId);
				ForLineFormula_dg1540451901057Widget._DT.setCellValue(i,'tempId',mainId);
				var headLineId = ForLineFormula_dg1540451901057Widget.getCellValue( i,'lflineId.id');
				for(var j = 0 ; j < ForProcessUnit_dg1540451909387Widget.getRowLength(); j++){
					var headId = ForProcessUnit_dg1540451909387Widget.getCellValue(j,'lineId.id');
					if(headId == headLineId){
						ForProcessUnit_dg1540451909387Widget.setCellValue(j,'headId.id',mainId);
					}
				}
				mainId++;
			}
		}	
	}
	
	RM.formula.formula.arrSuitlineEdit.save = function(){
		var bottomPtProcessUnitIDUnitIds = '';
		var processNames = '';
		//工作单元非空验证
		var bottomPtLength = ForProcessUnit_dg1540451909387Widget.getRowLength();
		var upPtLength = ForLineFormula_dg1540451901057Widget.getRowLength();
		//保存前验证工作单元是否有空数据
		for(var i = 0; i < bottomPtLength; i++){
			var bottomPtHeadId = ForProcessUnit_dg1540451909387Widget.getCellValue(i,"headId.id");
			var bottomPtProcessUnitIDUnitId = ForProcessUnit_dg1540451909387Widget.getCellValue(i,"processUnitIDUnitId");
			var bottomPtProcessName = ForProcessUnit_dg1540451909387Widget.getCellValue(i,"puprocessId.name");
			if(bottomPtProcessUnitIDUnitId == null || bottomPtProcessUnitIDUnitId == ""){
				var bottomPtLineId = ForProcessUnit_dg1540451909387Widget.getCellValue(i,"lineId.id");
				for(var j = 0; j < bottomPtLength; j++){
					var upPtLineId = ForLineFormula_dg1540451901057Widget.getCellValue(j,"lflineId.id");
					if(upPtLineId != null && bottomPtLineId == upPtLineId){
						var upPtLineName = ForLineFormula_dg1540451901057Widget.getCellValue(j,"lflineId.name");
						workbenchErrorBarWidget.showMessage("生产线\""+upPtLineName+"\"下工序\""+bottomPtProcessName+"\"工作单元未编辑", 'f');
						//var oRow=ForLineFormula_dg1540451901057Widget._DT._bTbody.getElementsByTagName("tr")[j];
						//ForLineFormula_dg1540451901057Widget._DT._setSelected(oRow);
                      return false;
					}
				
				}
              	//workbenchErrorBarWidget.showMessage("生产线\""+upPtLineName+"\"下工序\""+bottomPtProcessName+"\"工作单元未编辑", 'f');
				return false;
			}else{
				bottomPtProcessUnitIDUnitIds += bottomPtProcessUnitIDUnitId + ";";
				processNames += bottomPtProcessName + ";";
			}	
		}
		
		var flag = true;
		
		$.ajax({
			async   : false,
			type    : 'POST',
			url     : '/RM/formula/formula/arrSuitlineEdit/chcekProcessUnits.action?bottomPtProcessUnitIDUnitIds='+bottomPtProcessUnitIDUnitIds+"&processNames="+processNames,
			success : function(res){
				if(!res.result){
					workbenchErrorBarWidget.showMessage(res.message, 'f');
					flag = false;
				}
			}
		});
		//return false;
		if(flag){
			beforeSaveFunction();
			<#if !(superEdit!false)>
			$('#operateType').val("save");
			<#else>
			$('#operateType').val("submit");
			</#if>
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!RM.formula.formula.arrSuitlineEdit.validate()){return;}
			RM.formula.formula.arrSuitlineEdit.beforeSaveProcess();

			//RM.formula.formula.arrSuitlineEdit.processDataGrid();
			$('#RM_formula_formula_arrSuitlineEdit_form').submit();
		}
		
	}
		
	RM.formula.formula.arrSuitlineEdit._callBackInfo = function(res){
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
 					window.opener.RM.formula.formula.editCallBackInfo(res); 						
				}catch(e2){
					try{
						window.opener.location.reload();
					}catch(e3){}
				}
			};

			window.location.reload();
		} else {
			CUI.showErrorInfos(res);
		}
	};	
	
	//工作单元参照，根据生产线过滤
	/*RM.formula.formula.arrSuitlineEdit.query_dg1515465493030processUnitIDUnitId = function() {
		var clickIndex;
		$("#ForLineFormula_dg1540451901057_tbody tbody tr").each(function(index){
			if($(this).attr("clk")=="on"){
				clickIndex = index;
			}
		});
		
		var lineId = ForLineFormula_dg1540451901057Widget.getCellValue(clickIndex,'lineId.id');
		return "parentId="+lineId;
	}*/
	
	var oldSelectRow = 0;
	
	var arr = new Array();
	var processCount = 0;//配方包含的工序数
	
	//添加数组IndexOf方法for ie8
	if (!Array.prototype.indexOf){
	  Array.prototype.indexOf = function(elt /*, from*/){
		var len = this.length >>> 0;

		var from = Number(arguments[1]) || 0;
		from = (from < 0)
			 ? Math.ceil(from)
			 : Math.floor(from);
		if (from < 0)
		  from += len;

		for (; from < len; from++){
		  if (from in this && this[from] === elt)
			return from;
		}
		return -1;
	  };
	}
/* CUSTOM CODE END */
		RM.formula.formula.arrSuitlineEdit.onloadForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_arrSuitlineEdit,onloadForProduct,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		}

		RM.formula.formula.arrSuitlineEdit.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_arrSuitlineEdit,onsaveForProduct,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
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
				<div class="sidebar-top"><a href="#"  onclick="RM.formula.formula.arrSuitlineEdit.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="RM.formula.formula.arrSuitlineEdit.showBusinessList('${l.relatingModel.code.replace('.','')}',${(formula.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
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