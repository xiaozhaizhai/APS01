<!-- RM_7.5.0.0/formula/processActiveEdit -->
<#assign isWorkflow = true> 
<#assign isAttachment = true> 
	<#assign fileuploadType = "Table">
	<#assign fileuploadLinkId = formulaProcess.tableInfoId!>
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
<#assign tableObj = formulaProcess>
<#-- 命名空间 -->
<#assign editPageNs = "RM.formula.formulaProcess.processActiveEdit">
<#-- 模型名称-->
<#assign modelName = "formulaProcess">
<#-- 视图编码-->
<#assign viewCode = "RM_7.5.0.0_formula_processActiveEdit">
<#-- 实体编码-->
<#assign entity_code = "RM_7.5.0.0_formula">
<#-- 视图名称-->
<#assign viewName = "processActiveEdit">
<#-- datagrid编码-->
<#assign datagridCode = "RM_formula_formulaProcess_processActiveEdit_datagrids">
<#-- 首字母大写的模型名称-->
<#assign upcaseModelName = "FormulaProcess">
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
<#assign editFormId = "RM_formula_formulaProcess_processActiveEdit_form">
<#-- 待办状态 -->
<#assign pendingstatus =( formulaProcess.pending.taskDescription)!>
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
        <#assign configTitle = getText('RM.viewtitle.randon1487554825350')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		
		#RM_formula_formulaProcess_processActiveEdit_form{float:left;width:100%;}
		
		
		</style>
		<script type="text/javascript">
			CUI.ns('RM.formula.formulaProcess.processActiveEdit');
			RM.formula.formulaProcess.processActiveEdit.currentUser = ${userJson};
			RM.formula.formulaProcess.processActiveEdit.currentStaff = ${staffJson};
			RM.formula.formulaProcess.processActiveEdit.currentDepartment = ${deptJson};
			RM.formula.formulaProcess.processActiveEdit.currentPosition = ${postJson};
			RM.formula.formulaProcess.processActiveEdit.currentCompany = ${compJson};
		</script>
		<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_processActiveEdit,head,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
    </head>
	<body class="view-edit ">
		<@loadpanel newType=true/>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="formulaProcess.formulaId.id," onsubmitMethod="RM.formula.formulaProcess.processActiveEdit.beforeSubmitMethod()" id="RM_formula_formulaProcess_processActiveEdit_form" namespace="/RM/formula/formulaProcess/processActiveEdit" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=RM_7.5.0.0_formula_FormulaProcess&_bapFieldPermissonModelName_=FormulaProcess" editPageNs="RM.formula.formulaProcess.processActiveEdit" callback="RM.formula.formulaProcess.processActiveEdit._callBackInfo" ecform="true">
			<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
			<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="RM_formula_formulaProcess_processActiveEdit_main_div">
			<div class="edit-head">
				<#include "../../../ec/tableInfo/operateheadbar_all.ftl" >
				<#include "../../../ec/tableInfo/creatorInfo.ftl" >
			</div>
    		<div class="edit-main" id="RM_formula_formulaProcess_processActiveEdit">
    			<div class="edit-content">
    	<#include "../../../ec/tableInfo/formparam.ftl" >				
					<input type="hidden" name="formulaProcess.formulaId.id" value="${(formulaProcess.formulaId.id)!""}" originalvalue="${(formulaProcess.formulaId.id)!""}"/>
		<div class="dash-line"></div>
<script type="text/javascript">
var attcountid = "RM_formula_formulaProcess_processActiveEdit_form"+"_attcount";
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
	<table class="edit-table" style="display:none;">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487297610678')}" >${getText('RM.propertydisplayName.randon1487297610678')}</label>
				</td>
				
						<#assign formulaProcess_formulaHideId_defaultValue  = ''>
							 							<#assign formulaProcess_formulaHideId_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;display:none;;" >
					
							
							<div class="fix-input">
								<input property_type="LONG" name="formulaProcess.formulaHideId" id="formulaProcess_formulaHideId"  style=";" originalvalue="<#if !newObj || (formulaProcess.formulaHideId)?has_content>${(formulaProcess.formulaHideId?html)!}<#else>${formulaProcess_formulaHideId_defaultValue!}</#if>" value="<#if !newObj || (formulaProcess.formulaHideId)?has_content>${(formulaProcess.formulaHideId?html)!}<#else>${formulaProcess_formulaHideId_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487297416937')}" >${getText('RM.propertydisplayName.randon1487297416937')}</label>
				</td>
				
						<#assign formulaProcess_processTableId_defaultValue  = ''>
							 							<#assign formulaProcess_processTableId_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;display:none;;" >
					
							
							<div class="fix-input">
								<input property_type="LONG" name="formulaProcess.processTableId" id="formulaProcess_processTableId"  style=";" originalvalue="<#if !newObj || (formulaProcess.processTableId)?has_content>${(formulaProcess.processTableId?html)!}<#else>${formulaProcess_processTableId_defaultValue!}</#if>" value="<#if !newObj || (formulaProcess.processTableId)?has_content>${(formulaProcess.processTableId?html)!}<#else>${formulaProcess_processTableId_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487573457977')}" >${getText('RM.propertydisplayName.randon1487573457977')}</label>
				</td>
				
						<#assign formulaProcess_formId_defaultValue  = ''>
							 							<#assign formulaProcess_formId_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;display:none;;" >
					
							
							<div class="fix-input">
								<input property_type="LONG" name="formulaProcess.formId" id="formulaProcess_formId"  style=";" originalvalue="<#if !newObj || (formulaProcess.formId)?has_content>${(formulaProcess.formId?html)!}<#else>${formulaProcess_formId_defaultValue!}</#if>" value="<#if !newObj || (formulaProcess.formId)?has_content>${(formulaProcess.formId?html)!}<#else>${formulaProcess_formId_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1493729983867')}" >${getText('RM.propertydisplayName.randon1493729983867')}</label>
				</td>
				
						<#assign formulaProcess_batchUnitID_defaultValue  = ''>
							 							<#assign formulaProcess_batchUnitID_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;display:none;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="formulaProcess.batchUnitID" id="formulaProcess_batchUnitID"  style=";" originalvalue="<#if !newObj || (formulaProcess.batchUnitID)?has_content>${(formulaProcess.batchUnitID?html)!}<#else>${formulaProcess_batchUnitID_defaultValue!}</#if>" value="<#if !newObj || (formulaProcess.batchUnitID)?has_content>${(formulaProcess.batchUnitID?html)!}<#else>${formulaProcess_batchUnitID_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.randon201902270914001')}" >${getText('RM.randon201902270914001')}</label>
				</td>
				
						<#assign formulaProcess_formulaId_product_id_defaultValue  = ''>
														<#assign formulaProcess_formulaId_product_id_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="LONG" reftitle="${getText('RM.viewtitle.randon1514372721087')}" viewType="${viewType!}" deValue="${formulaProcess_formulaId_product_id_defaultValue!}" conditionfunc="RM.formula.formulaProcess.processActiveEdit._querycustomFunc('formulaProcess_formulaId_product_id')"  value="${(formulaProcess.formulaId.product.id)!}" displayFieldName="id" name="formulaProcess.formulaId.product.id" id="formulaProcess_formulaId_product_id" type="other" url="/RM/formula/formula/formulaForSuitLine.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formulaProcess_processActiveEdit_form" editCustomCallback=";" refViewCode="RM_7.5.0.0_formula_formulaForSuitLine" onkeyupfuncname=";_callback_formulaProcess_formulaId_product_id(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(formulaProcess.id)?? && (formulaProcess.formulaId.product.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formulaProcess.formulaId.product.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_formulaProcess_processActiveEdit_form',obj, 'formulaProcess.formulaId.product', '/RM/formula/formula/formulaForSuitLine.action');
												CUI.commonFills('RM_formula_formulaProcess_processActiveEdit_form', 'formulaProcess.formulaId.product',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.radion201902270915002')}" >${getText('RM.radion201902270915002')}</label>
				</td>
				
						<#assign formulaProcess_formulaId_product_productCode_defaultValue  = ''>
														<#assign formulaProcess_formulaId_product_productCode_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="formulaProcess.formulaId.product.productCode" id="formulaProcess_formulaId_product_productCode"  style=";" originalvalue="<#if !newObj || (formulaProcess.formulaId.product.productCode)?has_content>${(formulaProcess.formulaId.product.productCode?html)!}<#else>${formulaProcess_formulaId_product_productCode_defaultValue!}</#if>" value="<#if !newObj || (formulaProcess.formulaId.product.productCode)?has_content>${(formulaProcess.formulaId.product.productCode?html)!}<#else>${formulaProcess_formulaId_product_productCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.radion201902270914003')}" >${getText('RM.radion201902270914003')}</label>
				</td>
				
						<#assign formulaProcess_formulaId_product_productName_defaultValue  = ''>
														<#assign formulaProcess_formulaId_product_productName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="formulaProcess.formulaId.product.productName" id="formulaProcess_formulaId_product_productName"  style=";" originalvalue="<#if !newObj || (formulaProcess.formulaId.product.productName)?has_content>${(formulaProcess.formulaId.product.productName?html)!}<#else>${formulaProcess_formulaId_product_productName_defaultValue!}</#if>" value="<#if !newObj || (formulaProcess.formulaId.product.productName)?has_content>${(formulaProcess.formulaId.product.productName?html)!}<#else>${formulaProcess_formulaId_product_productName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1540368182412')}" >${getText('RM.propertydisplayName.randon1540368182412')}</label>
				</td>
				
						<#assign formulaProcess_formulaId_id_defaultValue  = ''>
														<#assign formulaProcess_formulaId_id_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="LONG" name="formulaProcess.formulaId.id" id="formulaProcess_formulaId_id"  style=";" originalvalue="<#if !newObj || (formulaProcess.formulaId.id)?has_content>${(formulaProcess.formulaId.id?html)!}<#else>${formulaProcess_formulaId_id_defaultValue!}</#if>" value="<#if !newObj || (formulaProcess.formulaId.id)?has_content>${(formulaProcess.formulaId.id?html)!}<#else>${formulaProcess_formulaId_id_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487076619868')}" >${getText('RM.propertydisplayName.randon1487076619868')}</label>
				</td>
				
						<#assign formulaProcess_formulaId_batchContral_defaultValue  = ''>
														<#assign formulaProcess_formulaId_batchContral_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="formulaProcess.formulaId.batchContral_check" originalvalue="<#if !newObj><#if (formulaProcess.formulaId.batchContral)??>${(formulaProcess.formulaId.batchContral!false)?string('true','false')}<#else>false</#if><#elseif formulaProcess_formulaId_batchContral_defaultValue?has_content>${(formulaProcess_formulaId_batchContral_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (formulaProcess.formulaId.batchContral)??>${(formulaProcess.formulaId.batchContral!false)?string('true','false')}<#else>false</#if><#else>${(formulaProcess_formulaId_batchContral_defaultValue!true)?string}</#if>"  disabled=true/>
								
								<input property_type="BOOLEAN" type="hidden" name="formulaProcess.formulaId.batchContral" originalvalue="<#if ((formulaProcess.formulaId.batchContral)?? &&  formulaProcess.formulaId.batchContral)||(formulaProcess_formulaId_batchContral_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((formulaProcess.formulaId.batchContral)?? &&  formulaProcess.formulaId.batchContral)||(formulaProcess_formulaId_batchContral_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="formulaProcess.formulaId.batchContral_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="formulaProcess.formulaId.batchContral"]');
												CUI('input[name="formulaProcess.formulaId.batchContral_check"]').each(function(){
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
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
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
								<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formula_FormulaProcessActive", "RM_7.5.0.0_formula_processActiveEditdg1487554913298", "DATAGRID", "formulaProcessActive")>
								<#list customPropViewMappings as cpvm>
									<#if cpvm.property.type == 'OBJECT' && cpObjHideKey?index_of(",'" +cpvm.propertyLayRec) lt 0>
										<#assign cpObjHideKey = cpObjHideKey + ",'" + cpvm.propertyLayRec + "'">
									</#if>
									<#if cpvm.propertyLayRec?index_of('.') lt 0 && cpvm.relatedKey?has_content>
										<#assign cpvmInfo = cpvmInfo + ',' + cpvm.relatedKey + "||" + cpvm.propertyLayRec>
										<#if cpvm.property.type == 'OBJECT'>
											<#assign cpvmInfo = cpvmInfo + "||" + cpvm.property.code>	
										</#if>
									</#if>
								</#list>
			
							<script type="text/javascript">
								function FormulaProcessActive_dg1487554913298_fomulaChannelActive(event)
																{
 var SelectedRow = FormulaProcessActive_dg1487554913298Widget.getSelectedRow();
     var activeType=FormulaProcessActive_dg1487554913298Widget.getCellValue(SelectedRow,'activeType.id');
     var activeId=FormulaProcessActive_dg1487554913298Widget.getCellValue(SelectedRow,'id');
            
                     fomulaActive=new CUI.Dialog({
                        title:"${getText('RM.formulaActive.radion141234234')}",
                    formId:"RM_formula_formulaProcessActive_channelActiveEdit_form",
                        type:5,
                        modal:true,
                        url:'/RM/formula/formulaProcessActive/channelActiveEdit.action?entityCode=RM_7.5.0.0_formula' + "&${getPowerCode('channelActiveEdit')}",
                        buttons:[{
                            name:"${getText('foundation.common.save')}",
                            handler:function(){
                            CUI('#RM_formula_formulaProcessActive_channelActiveEdit_form').submit();
              }
            },
            {
                   name:"${getText('foundation.common.closed')}",
                   handler:function(){this.close()}
             }]
       });
         fomulaActive.show();
            

}
							</script>
							<script type="text/javascript">
								function FormulaProcessActive_dg1487554913298_fomulaManualActive(event)
																{
 var SelectedRow = FormulaProcessActive_dg1487554913298Widget.getSelectedRow();
     var activeType=FormulaProcessActive_dg1487554913298Widget.getCellValue(SelectedRow,'activeType.id');
     var activeId=FormulaProcessActive_dg1487554913298Widget.getCellValue(SelectedRow,'id');
        
			
					 manualActive=new CUI.Dialog({
						title:"${getText('RM.formulaActive.radion1412123121')}",
				    formId:"RM_formula_formulaProcessActive_manualActiveEdit_form",
						type:5,
						modal:true,
						url:'/RM/formula/formulaProcessActive/manualActiveEdit.action?entityCode=RM_7.5.0.0_formula' + "&${getPowerCode('manualActiveEdit')}",
						buttons:[{
							name:"${getText('foundation.common.save')}",
							handler:function(){
							CUI('#RM_formula_formulaProcessActive_manualActiveEdit_form').submit();
			  }
		    },
		    {
			       name:"${getText('foundation.common.closed')}",
			       handler:function(){this.close()}
		     }]
       });
         manualActive.show();
			
			

}
							</script>
							<script type="text/javascript">
								function FormulaProcessActive_dg1487554913298_otherActiveSet(event)
																{
		 otherEdit = new CUI.Dialog({
					title:"更多活动",
  				formId: "RM_formula_formulaProcessActive_otherActiveEdit_form",
 				  type:5,
          modal:true,
     		  url:'/RM/formula/formulaProcessActive/otherActiveEdit.action?entityCode=RM_7.5.0.0_formula' + "&${getPowerCode('otherActiveEdit')}",
          buttons:[
            { name:"${getText("foundation.common.save")}",
                handler:function(){
                $('input[name="formula.saveFlag"]').val(false);
                CUI('#RM_formula_formulaProcessActive_otherActiveEdit_form').submit();
           }
           },
           { name:"${getText("foundation.common.closed")}",
                handler:function(){this.close()}
           }
           ]
           });
	
otherEdit.show();
			

 
}
							</script>
							<script type="text/javascript">
								function FormulaProcessActive_dg1487554913298_deleteRow(event)
																{
    if($($($(".paginatorbar-operatebar").children()[3]).children()).css("color")!="black" && $($($(".paginatorbar-operatebar").children()[3]).children()).css("color")!="rgb(0, 0, 0)"){
	    //alert(11);
	    return false;
	}else{
	    //alert(22);
		var selectRow=FormulaProcessActive_dg1487554913298Widget.getSelectedRow();
		//alert(selectRow);
		//如果没有选中的行
  		if(selectRow==undefined){
  			workbenchErrorBarWidget.showMessage('${getText("RM.processEditDel.randon14769606234234")}','f');
  			return false;
  		}
		
        if(selectRow!=undefined){
			//alert(selectRow);
		    var activeType=FormulaProcessActive_dg1487554913298Widget.getCellValue(selectRow,'activeType.id');
			
			//如果类型是常规、投料，将删除对应的工艺标准
			if(activeType=='activeType/activeType1'  || activeType=='activeType/activeType3'){
				PrecessStandards_dg1487555065561Widget._DT.delAllRows();
				//DT_FormulaProcessActive_dg1487554913298_deldatagrid();
				checkTrue=false;
				processActiveDelete();
			}else if(activeType=='activeType/activeType4'){
			
				//如果是投配料，进行提示，并进行删除配料和工艺标准
				//checkTrue为全局变量，初始值为'',在点击确定时赋值为false，点击取消时赋值为true
				CUI.Dialog.confirm(  
   					'${getText("RM.processEditDel.randon1476960622892")}',  // 提示消息  
   					function(){ 
           				checkTrue=false;  // 修改全局变量，下一次调用时不再进入confirm;
            			processActiveDelete();
   					},// 确定后事件  
                    function(){
						checkTrue=true;
					}, // 取消后事件  
                    '${getText("RM.processEditDel.randon147696062345354")}',  // 标题  
					70,  // 高度, 可选, 默认70  
					400  // 宽度, 可选, 默认400  
                ); 
				return false; 
			}else{
				//DT_FormulaProcessActive_dg1487554913298_deldatagrid();
				checkTrue=false;
				processActiveDelete();
			}
		}
	}

}
							</script>
							<script type="text/javascript">
								function FormulaProcessActive_dg1487554913298_changetype(event)
																{
 if($($($(".paginatorbar-operatebar").children()[4]).children()).css("color")!="black" && $($($(".paginatorbar-operatebar").children()[4]).children()).css("color")!="rgb(0, 0, 0)"){
		event.preventDefault();
	}else{
			var SelectedRow = FormulaProcessActive_dg1487554913298Widget.getSelectedRow();
			if(SelectedRow==undefined){
				workbenchErrorBarWidget.showMessage('${getText("RM.processEditDel.randon14769606234234")}','f');
				return false;
			}
			var activeId=FormulaProcessActive_dg1487554913298Widget.getCellValue(SelectedRow,'id');
			 manualActive=new CUI.Dialog({
									title:"${getText('活动类型设置')}",
								formId:"RM_formula_formulaProcessActive_activeTypeEdit_form",
									type:1,
									modal:true,
									url:'/RM/formula/formulaProcessActive/activeTypeEdit.action?entityCode=RM_7.5.0.0_formula&id='+activeId,
									buttons:[{
										name:"${getText('foundation.common.save')}",
										handler:function(){
					if($("#formulaProcessActiveactiveTypeForBatchid").val()=="activeforbatch/activeType01"){
							   $("#formulaProcessActiveactiveTypeid").val('activeType/activeType3');
							   $("#formulaProcessActive_qualityStandard_codediv").val('');
							   $("#formulaProcessActive_testProduct_namediv").val('');
							   $("#formulaProcessActivefromContainerid").val('');
							   $("#formulaProcessActive_container").val('');
					}else if($("#formulaProcessActiveactiveTypeForBatchid").val()=="activeforbatch/activeType02"){
							   $("#formulaProcessActiveactiveTypeid").val('activeType/activeType4');
							   $("[name='formulaProcessActive.channelOrManual']").val('true');
							   $("#formulaProcessActive_testProduct_namediv").val('');
							   $("#formulaProcessActive_testProduct_namediv").val('');
							   $("#formulaProcessActive_qualityStandard_codediv").val(''); 
							   $("[name='formulaProcessActive.isReplace']").val('');
							   $("[name='formulaProcessActive.isMixQuality']").val('');
							   $("#formulaProcessActive_maxQuality").val('');
							   $("#formulaProcessActive_minQuality").val('');
							   $("#formulaProcessActive_standardQuantity").val('');
							   $("#formulaProcessActivefromContainerid").val('fromContainer/fromContainer1');
					}else if($("#formulaProcessActiveactiveTypeForBatchid").val()=="activeforbatch/activeType03"){
							   $("#formulaProcessActiveactiveTypeid").val('activeType/activeType4');
							   $("[name='formulaProcessActive.channelOrManual']").val('false');
							   $("#formulaProcessActive_testProduct_namediv").val('');
							   $("#formulaProcessActive_qualityStandard_codediv").val(''); 
							   $("#formulaProcessActive_container").val('');
							   $("[name='formulaProcessActive.isReplace']").val('');
							   $("[name='formulaProcessActive.isMixQuality']").val('');
							   $("#formulaProcessActive_maxQuality").val('');
							   $("#formulaProcessActive_minQuality").val('');
							   $("#formulaProcessActive_standardQuantity").val('');
							   $("#formulaProcessActivefromContainerid").val('fromContainer/fromContainer2');
					}else if($("#formulaProcessActiveactiveTypeForBatchid").val()=="activeforbatch/activeType04"){
							   $("#formulaProcessActiveactiveTypeid").val('activeType/activeType1');
							   $("#formulaProcessActive_testProduct_namediv").val('');
							   $("#formulaProcessActive_qualityStandard_codediv").val('');
							   $("#formulaProcessActivefromContainerid").val('');
							   $("#formulaProcessActive_container").val('');
							   $("[name='formulaProcessActive.isReplace']").val('');
								 $('input[name="formulaProcessActive.product.productCode"]').val('');
							   $('input[name="formulaProcessActive.product.id"]').val('');
							   $("[name='formulaProcessActive.isMixQuality']").val('');
							   $("#formulaProcessActive_maxQuality").val('');
							   $("#formulaProcessActive_minQuality").val('');
							   $("#formulaProcessActive_standardQuantity").val('');
					}else if($("#formulaProcessActiveactiveTypeForBatchid").val()=="activeforbatch/activeType05"){
							   $("#formulaProcessActiveactiveTypeid").val('activeType/activeType5');
							   $("#formulaProcessActivefromContainerid").val('');
							   $("#formulaProcessActive_container").val('');
							   $("[name='formulaProcessActive.isReplace']").val('');
							   $('input[name="formulaProcessActive.product.productCode"]').val('');
							   $('input[name="formulaProcessActive.product.id"]').val('');
							   $("[name='formulaProcessActive.isMixQuality']").val('')
							   $("#formulaProcessActive_maxQuality").val('');
							   $("#formulaProcessActive_minQuality").val('');
							   $("#formulaProcessActive_standardQuantity").val('');
					}else if($("#formulaProcessActiveactiveTypeForBatchid").val()=="activeforbatch/activeType06"){
							   $("#formulaProcessActiveactiveTypeid").val('activeType/activeType6');
							   $("#formulaProcessActive_testProduct_namediv").val('');
							   $("#formulaProcessActive_qualityStandard_codediv").val('');
							   $("#formulaProcessActivefromContainerid").val('');
							   $("#formulaProcessActive_container").val('');
							   $("[name='formulaProcessActive.isReplace']").val('');
					}		   
				   if($("#deleteActiveFlag")==undefined||$("#deleteActiveFlag").length<1){
					$("#RM_formula_formulaProcessActive_activeTypeEdit_form").append("<input type='text' name ='deleteActiveFlag' id ='deleteActiveFlag' value='true' style='display:none'/>")
				   }else{
					$("#deleteActiveFlag").val('true');
				   }
					CUI('#RM_formula_formulaProcessActive_activeTypeEdit_form').submit();
				}
				},
				{
				   name:"${getText('foundation.common.closed')}",
				   handler:function(){this.close()}
				 }]
				   });
			   manualActive.show();
		}
	   window.opener.location.reload();
	}
							</script>
							<script type="text/javascript">
								function FormulaProcessActive_dg1487554913298_copyActive(event)
																{
   if($($($(".paginatorbar-operatebar").children()[5]).children()).css("color")!="black" && $($($(".paginatorbar-operatebar").children()[5]).children()).css("color")!="rgb(0, 0, 0)"){
		event.preventDefault();
	}else{
		var SelectedRow = FormulaProcessActive_dg1487554913298Widget.getSelectedRow();
		if(SelectedRow==undefined){
		workbenchErrorBarWidget.showMessage('${getText("RM.processEditDel.randon14769606234234")}','f');
									return false;
		}
		var activeId=FormulaProcessActive_dg1487554913298Widget.getCellValue(SelectedRow,'id');
		 
		 $.ajax({
							url : "/RM/formula/formulaProcessActive/copy.action",
							type : 'post',
							async : false,
							data:{"id":activeId},
							success : function(msg) {
								if(msg!=null&&msg.success==true){
									workbenchErrorBarWidget.showMessage('${getText("foundation.party.dealSuccess")}','s');
									RM.formula.formulaProcessActive.callBackInfo();							
								}else{
									workbenchErrorBarWidget.showMessage('${getText("foundation.infoSet.dealfailure")}','f');
									return false;
								}
							}
						});
		 
		 }
 }
							</script>
							<script type="text/javascript">
								function FormulaProcessActive_dg1487554913298_upMove(event)
																 {
    //选中的行
    var selectRow = FormulaProcessActive_dg1487554913298Widget.getSelectedRow();
    var length = FormulaProcessActive_dg1487554913298Widget.getRowLength() - 1;
    //上移的行
    var upRow = selectRow + 1;
    if (selectRow == undefined) {
        CUI.Dialog.alert("请选择需要上移的行！");
        return false;
    }
    if (selectRow == 0) {
        CUI.Dialog.alert("已处于顶端！");
        return false;
    }
    var currentExecSort = FormulaProcessActive_dg1487554913298Widget.getCellValue(selectRow,'execSort');
    //如果是主活动
    if (FormulaProcessActive_dg1487554913298Widget.getCellValue(selectRow,'mainActive')){
    	if (currentExecSort > 1){
    		FormulaProcessActive_dg1487554913298Widget.setCellValue(selectRow,'execSort',currentExecSort-1);
    		resortActive();
    	}
    }else{	//如果不是主活动，那么不能够移动出"主活动"的管辖范围
    	if (FormulaProcessActive_dg1487554913298Widget.getCellValue(selectRow - 1,'mainActive')){
    		return false;
    	}else{
    		/*
				获取当前行的执行顺序,比如:
					1-2，获取" - "后面的字符：2
				如果 这个字符不大于1，则不能继续上移，如果大于1，减1
    		*/
    		if (currentExecSort.split("-")[1] > 1){
    			FormulaProcessActive_dg1487554913298Widget.setCellValue(selectRow,'execSort',currentExecSort.split("-")[0] + "-" + (currentExecSort.split("-")[1]  - 1));
    			resortSubActive();
    		}else{
    			return false;
    		}
    	}

    }
        
}
							</script>
							<script type="text/javascript">
								function FormulaProcessActive_dg1487554913298_downMove(event)
																 {
    //选中的行
    var selectRow = FormulaProcessActive_dg1487554913298Widget.getSelectedRow();
    var length = FormulaProcessActive_dg1487554913298Widget.getRowLength() - 1;
    var mainActiveNum = 0;
    //计算父节点数量
    $.each(mapValue,function(){
    	mainActiveNum++;
    })
    if (selectRow == undefined) {
        CUI.Dialog.alert("请选择需要下移的行！");
        return false;
    }
    if (selectRow == length) {
        CUI.Dialog.alert("已处于底端！");
        return false;
    }
    var currentExecSort = FormulaProcessActive_dg1487554913298Widget.getCellValue(selectRow,'execSort');
    //如果是主活动
    if (FormulaProcessActive_dg1487554913298Widget.getCellValue(selectRow,'mainActive')){
    	if (currentExecSort < mainActiveNum){
    		FormulaProcessActive_dg1487554913298Widget.setCellValue(selectRow,'execSort',currentExecSort-1+2);
    		resortActive();
    	}else{
    		CUI.Dialog.alert("已处于底端！");
	        return false;
    	}
    }else{	//如果不是主活动，那么不能够移动出"主活动"的管辖范围
    	if (FormulaProcessActive_dg1487554913298Widget.getCellValue(selectRow - 1,'mainActive')){
    		return false;
    	}else{
    		/*
				获取当前行的执行顺序,比如:
					1-2，获取" - "后面的字符：2
				如果 这个字符不大于1，则不能继续上移，如果大于1，减1

				获取当前行的父 节点ID
    		*/
    		
    		var subActiveNum = mapValue[FormulaProcessActive_dg1487554913298Widget.getCellValue(selectRow,'activeHiddenId')].split("_")[1];
    		if (currentExecSort.split("-")[1] < subActiveNum){
    			FormulaProcessActive_dg1487554913298Widget.setCellValue(selectRow,'execSort',currentExecSort.split("-")[0] + "-" + (Number(currentExecSort.split("-")[1])  + 1));
    			resortSubActive();
    		}else{
    			CUI.Dialog.alert("已处于底端！");
	        	return false;
    		}
    	}

    }
        
}
							</script>
							<script type="text/javascript">
								function FormulaProcessActive_dg1487554913298_proItemSet(event)
																{
    var url = location.search; //获取url中含"?"符后的字串
    var theRequest = new Object();
    if (url.indexOf("?") != -1) {
         var str = url.substr(1);
          strs = str.split("&");
          for(var i = 0; i < strs.length; i ++) {
             theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
             theRequest.id;
          }
   }
   //工序活动中选中的活动id 和 映射类型为活动
     var tableData =   JSON.parse(FormulaProcessActive_dg1487554913298Widget.getAllRowData());
     var row = FormulaProcessActive_dg1487554913298Widget.getSelectedRow();
     if(row==undefined){
        workbenchErrorBarWidget.showMessage('请选择一条记录进行操作!', 'f');
        return false;
     }
     var activeId = tableData[row].id;
      /*if(tableData[row].batchPhaseName == undefined){
        workbenchErrorBarWidget.showMessage('配料活动不可设置工艺参数!', 'f');
        return false;
     }
     for(var i = 0;i<tableData.length;i++ ){
        if(i!= row &&tableData[i].batchPhaseID ==  tableData[row].batchPhaseID && tableData[i].isAnaly=='true'){
            workbenchErrorBarWidget.showMessage('已存在相同的活动配置工艺参数不能重复配置!', 'f');
            return false;
        }
     }*/
     if(tableData[row].activeType.id=="activeType/activeType4"){
     	workbenchErrorBarWidget.showMessage('活动类型为投配料不可设置工艺参数!', 'f');
        return false;
     }
     var mappingType = "processActiveType/active";
     if(activeId != '' ){
        var formulaId = theRequest.formulaId;
        var url='/processAnl/processModelSet/proAnalySet/processModelEdit.action?entityCode=processAnl_1.0.0_processModelSet&activeId='+activeId +"&mappingType="+mappingType+ "&__pc__=cHJvY2Vzc01vZGVsTGlzdF9hZGRQcm9BbmFseV9hZGRfcHJvY2Vzc0FubF8xLjAuMF9wcm9jZXNzTW9kZWxTZXRfcHJvY2Vzc01vZGVsTGlzdHw_";
        openFullScreen(url); 
    }
}
							</script>
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/RM/formula/formulaProcess/data-dg1487554913298.action?formulaProcess.id=${refId!-1}&refId=${refId!-1}&datagridCode=RM_7.5.0.0_formula_processActiveEditdg1487554913298">
			<#else>
				<#assign dUrl="/RM/formula/formulaProcess/data-dg1487554913298.action?formulaProcess.id=${(formulaProcess.id)!-1}&datagridCode=RM_7.5.0.0_formula_processActiveEditdg1487554913298">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('RM.buttonPropertyshowName.radion1488699548882233')}\",handler:function(event){FormulaProcessActive_dg1487554913298_fomulaChannelActive(event)},iconClass:\"cui-btn-edit\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1488782384283233')}\",handler:function(event){FormulaProcessActive_dg1487554913298_fomulaManualActive(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1488099571773231')}\",handler:function(event){FormulaProcessActive_dg1487554913298_otherActiveSet(event)},iconClass:\"cui-btn-edit\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion148825979180432')}\",handler:function(event){FormulaProcessActive_dg1487554913298_deleteRow(event)},iconClass:\"cui-btn-del\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1493289451239')}\",handler:function(event){FormulaProcessActive_dg1487554913298_changetype(event)},iconClass:\"cui-btn-edit\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1493796467708')}\",handler:function(event){FormulaProcessActive_dg1487554913298_copyActive(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1540973728348')}\",handler:function(event){FormulaProcessActive_dg1487554913298_upMove(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1540973748907')}\",handler:function(event){FormulaProcessActive_dg1487554913298_downMove(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1543455917847')}\",handler:function(event){FormulaProcessActive_dg1487554913298_proItemSet(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('RM.buttonPropertyshowName.radion1488699548882233')}\",handler:function(event){FormulaProcessActive_dg1487554913298_fomulaChannelActive(event)},iconClass:\"cui-btn-edit\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1488782384283233')}\",handler:function(event){FormulaProcessActive_dg1487554913298_fomulaManualActive(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1488099571773231')}\",handler:function(event){FormulaProcessActive_dg1487554913298_otherActiveSet(event)},iconClass:\"cui-btn-edit\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion148825979180432')}\",handler:function(event){FormulaProcessActive_dg1487554913298_deleteRow(event)},iconClass:\"cui-btn-del\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1493289451239')}\",handler:function(event){FormulaProcessActive_dg1487554913298_changetype(event)},iconClass:\"cui-btn-edit\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1493796467708')}\",handler:function(event){FormulaProcessActive_dg1487554913298_copyActive(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1540973728348')}\",handler:function(event){FormulaProcessActive_dg1487554913298_upMove(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1540973748907')}\",handler:function(event){FormulaProcessActive_dg1487554913298_downMove(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1543455917847')}\",handler:function(event){FormulaProcessActive_dg1487554913298_proItemSet(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_FormulaProcessActive_dg1487554913298" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1487554913298_id" value="FormulaProcessActive_dg1487554913298" />
			
			<input type="hidden" id="dg1487554913298_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('RM.modelname.randon1487330059541')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/RM/formula/formulaProcess/data-dg1487554913298.action?operateType=export&datagridCode=RM_7.5.0.0_formula_processActiveEditdg1487554913298"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="FormulaProcessActive_dg1487554913298" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="FormulaProcessActive_dg1487554913298" viewType="${viewType}" renderOverEvent="dg1487554913298RenderOverEvent" route="${routeFlag}" formId="RM_formula_formulaProcess_processActiveEdit_form" noPermissionKeys="name,batchPhaseName,occurTurn,activeType,fromContainer,container,product.productCode,product.productName,isAgile,isReplace,isMixQuality,standardQuantity,minQuality,maxQuality,lossRate,longTime,auto,actOrder,ingredientsOrder,execSort,batchSite,exeSystem,mobileTerminal,testProduct.code,qualityStandard.code,pickSite.name,isWatchActive,isAnaly,finalInspection,activeHiddenId,channelOrManual,meno,batchPhaseID,copy,subActiveNum,mainActive,hiddenSort" modelCode="RM_7.5.0.0_formula_FormulaProcessActive" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1487554913298" dtPage="dgPage"  hidekeyPrefix="dg1487554913298" hidekey="['id','version','product.id','product.productCode','product.id','product.productName','testProduct.id','testProduct.code','qualityStandard.id','qualityStandard.code','pickSite.id','pickSite.name'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1487554913298PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName dgTitle="${getText('RM.dataGriddataGridName.radion1488181675391')}" activexButton="RM.buttonPropertyshowName.radion1488699548882233,fomulaChannelActive,edit;RM.buttonPropertyshowName.radion1488782384283233,fomulaManualActive,add;RM.buttonPropertyshowName.radion1488099571773231,otherActiveSet,edit;RM.buttonPropertyshowName.radion148825979180432,deleteRow,del;RM.buttonPropertyshowName.radion1493289451239,changetype,edit;RM.buttonPropertyshowName.radion1493796467708,copyActive,add;RM.buttonPropertyshowName.radion1540973728348,upMove,add;RM.buttonPropertyshowName.radion1540973748907,downMove,add;RM.buttonPropertyshowName.radion1543455917847,proItemSet,add" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign name_displayDefaultType=''>
								<#assign name_defaultValue=''>
										<#assign name_defaultValue=''>
										  
									<@datacolumn key="name"        showFormat="TEXT" defaultValue="${(name_defaultValue!)?string}" defaultDisplay="${(name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487330156499')}" width=80 showFormatFunc=""  />
							<#assign batchPhaseName_displayDefaultType=''>
								<#assign batchPhaseName_defaultValue=''>
										<#assign batchPhaseName_defaultValue=''>
										  
									<@datacolumn key="batchPhaseName"        showFormat="TEXT" defaultValue="${(batchPhaseName_defaultValue!)?string}" defaultDisplay="${(batchPhaseName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1493276184676')}" width=100 showFormatFunc=""  />
							<#assign occurTurn_displayDefaultType=''>
								<#assign occurTurn_defaultValue=''>
										<#assign occurTurn_defaultValue=''>
										 									<@systemCodeColumn code="occurTurn" textalign="center" defaultValue="${(occurTurn_defaultValue!)?string}" key="occurTurn.id" editable=false type="selectcomp" notnull=false     label="${getText('RM.propertydisplayName.randon1487330199423')}" width=60   />
							<#assign activeType_displayDefaultType=''>
								<#assign activeType_defaultValue=''>
										<#assign activeType_defaultValue=''>
										 									<@systemCodeColumn code="activeType" textalign="left" defaultValue="${(activeType_defaultValue!)?string}" key="activeType.id" editable=false type="selectcomp" notnull=false     label="${getText('RM.propertydisplayName.randon1487330759313')}" width=50   />
							<#assign fromContainer_displayDefaultType=''>
								<#assign fromContainer_defaultValue=''>
										<#assign fromContainer_defaultValue=''>
										 									<@systemCodeColumn code="fromContainer" textalign="center" defaultValue="${(fromContainer_defaultValue!)?string}" key="fromContainer.id" editable=false type="selectcomp" notnull=false     label="${getText('RM.propertydisplayName.randon1488697524885')}" width=60   />
							<#assign container_displayDefaultType=''>
								<#assign container_defaultValue=''>
										<#assign container_defaultValue=''>
										  
									<@datacolumn key="container"        showFormat="TEXT" defaultValue="${(container_defaultValue!)?string}" defaultDisplay="${(container_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1488696547250')}" width=80 showFormatFunc=""  />
							<#assign product_productCode_displayDefaultType=''>
								<#assign product_productCode_defaultValue=''>
										<#assign product_productCode_defaultValue=''>
																	<#if (product_productCode_defaultValue!)?string=="currentUser">
								<#assign product_productCode_defaultValue='${staffJson!}'>
							<#elseif (product_productCode_defaultValue!)?string=="currentPost">
								<#assign product_productCode_defaultValue='${postJson!}'>
							<#elseif (product_productCode_defaultValue!)?string=="currentDepart">
								<#assign product_productCode_defaultValue='${deptJson!}'>
							<#elseif (product_productCode_defaultValue!)?string=="currentComp">
								<#assign product_productCode_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="product.productCode"        showFormat="SELECTCOMP" defaultValue="${(product_productCode_defaultValue!)?string}" defaultDisplay="${(product_productCode_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="RM.formula.formulaProcess.processActiveEdit"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" width=70 showFormatFunc=""  />
							<#assign product_productName_displayDefaultType=''>
								<#assign product_productName_defaultValue=''>
										<#assign product_productName_defaultValue=''>
																	<#if (product_productName_defaultValue!)?string=="currentUser">
								<#assign product_productName_defaultValue='${staffJson!}'>
							<#elseif (product_productName_defaultValue!)?string=="currentPost">
								<#assign product_productName_defaultValue='${postJson!}'>
							<#elseif (product_productName_defaultValue!)?string=="currentDepart">
								<#assign product_productName_defaultValue='${deptJson!}'>
							<#elseif (product_productName_defaultValue!)?string=="currentComp">
								<#assign product_productName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="product.productName"        showFormat="TEXT" defaultValue="${(product_productName_defaultValue!)?string}" defaultDisplay="${(product_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="RM.formula.formulaProcess.processActiveEdit"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" width=80 showFormatFunc=""  />
							<#assign isAgile_displayDefaultType=''>
								<#assign isAgile_defaultValue=''>
										<#assign isAgile_defaultValue=''>
										  
									<@datacolumn key="isAgile"        showFormat="CHECKBOX" defaultValue="${(isAgile_defaultValue!)?string}" defaultDisplay="${(isAgile_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon15035391802161121')}" width=50 showFormatFunc=""  />
							<#assign isReplace_displayDefaultType=''>
								<#assign isReplace_defaultValue=''>
										<#assign isReplace_defaultValue=''>
										  
									<@datacolumn key="isReplace"        showFormat="CHECKBOX" defaultValue="${(isReplace_defaultValue!)?string}" defaultDisplay="${(isReplace_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331060176')}" width=50 showFormatFunc=""  />
							<#assign isMixQuality_displayDefaultType=''>
								<#assign isMixQuality_defaultValue=''>
										<#assign isMixQuality_defaultValue=''>
										  
									<@datacolumn key="isMixQuality"        showFormat="CHECKBOX" defaultValue="${(isMixQuality_defaultValue!)?string}" defaultDisplay="${(isMixQuality_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1488696577648')}" width=60 showFormatFunc=""  />
							<#assign standardQuantity_displayDefaultType=''>
								<#assign standardQuantity_defaultValue=''>
										<#assign standardQuantity_defaultValue=''>
										  
									<@datacolumn key="standardQuantity"        showFormat="TEXT" defaultValue="${(standardQuantity_defaultValue!)?string}" defaultDisplay="${(standardQuantity_displayDefaultType!)?string}" decimal="6" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331086583')}" width=60 showFormatFunc=""  />
							<#assign minQuality_displayDefaultType=''>
								<#assign minQuality_defaultValue=''>
										<#assign minQuality_defaultValue=''>
										  
									<@datacolumn key="minQuality"        showFormat="TEXT" defaultValue="${(minQuality_defaultValue!)?string}" defaultDisplay="${(minQuality_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1488696602815')}" width=60 showFormatFunc=""  />
							<#assign maxQuality_displayDefaultType=''>
								<#assign maxQuality_defaultValue=''>
										<#assign maxQuality_defaultValue=''>
										  
									<@datacolumn key="maxQuality"        showFormat="TEXT" defaultValue="${(maxQuality_defaultValue!)?string}" defaultDisplay="${(maxQuality_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1488696624224')}" width=60 showFormatFunc=""  />
							<#assign lossRate_displayDefaultType=''>
								<#assign lossRate_defaultValue=''>
										<#assign lossRate_defaultValue=''>
										  
									<@datacolumn key="lossRate"        showFormat="TEXT" defaultValue="${(lossRate_defaultValue!)?string}" defaultDisplay="${(lossRate_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1495418354792')}" width=60 showFormatFunc=""  />
							<#assign longTime_displayDefaultType=''>
								<#assign longTime_defaultValue=''>
										<#assign longTime_defaultValue=''>
										  
									<@datacolumn key="longTime"        showFormat="TEXT" defaultValue="${(longTime_defaultValue!)?string}" defaultDisplay="${(longTime_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1490162289778')}" width=80 showFormatFunc=""  />
							<#assign auto_displayDefaultType=''>
								<#assign auto_defaultValue=''>
										<#assign auto_defaultValue=''>
										  
									<@datacolumn key="auto"        showFormat="CHECKBOX" defaultValue="${(auto_defaultValue!)?string}" defaultDisplay="${(auto_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331130107232')}" width=80 showFormatFunc=""  />
							<#assign actOrder_displayDefaultType=''>
								<#assign actOrder_defaultValue=''>
										<#assign actOrder_defaultValue=''>
										  
									<@datacolumn key="actOrder"        showFormat="TEXT" defaultValue="${(actOrder_defaultValue!)?string}" defaultDisplay="${(actOrder_displayDefaultType!)?string}" decimal="" editable=false type="INTEGER" showType="integer" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1489911238343')}" width=60 showFormatFunc=""  />
							<#assign ingredientsOrder_displayDefaultType=''>
								<#assign ingredientsOrder_defaultValue=''>
										<#assign ingredientsOrder_defaultValue=''>
										  
									<@datacolumn key="ingredientsOrder"        showFormat="TEXT" defaultValue="${(ingredientsOrder_defaultValue!)?string}" defaultDisplay="${(ingredientsOrder_displayDefaultType!)?string}" decimal="" editable=false type="INTEGER" showType="integer" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon148733111023223')}" width=60 showFormatFunc=""  />
							<#assign execSort_displayDefaultType=''>
								<#assign execSort_defaultValue=''>
										<#assign execSort_defaultValue=''>
										  
									<@datacolumn key="execSort"        showFormat="TEXT" defaultValue="${(execSort_defaultValue!)?string}" defaultDisplay="${(execSort_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1539917544374')}" width=60 showFormatFunc=""  />
							<#assign batchSite_displayDefaultType=''>
								<#assign batchSite_defaultValue=''>
										<#assign batchSite_defaultValue=''>
										 									<@systemCodeColumn code="batchSite" textalign="left" defaultValue="${(batchSite_defaultValue!)?string}" key="batchSite.id" editable=false type="selectcomp" notnull=false     label="${getText('RM.propertydisplayName.randon148733082974923')}" width=70   />
							<#assign exeSystem_displayDefaultType=''>
								<#assign exeSystem_defaultValue=''>
										<#assign exeSystem_defaultValue=''>
										 									<@systemCodeColumn code="RMsystem" textalign="left" defaultValue="${(exeSystem_defaultValue!)?string}" key="exeSystem.id" editable=false type="selectcomp" notnull=false     label="${getText('RM.propertydisplayName.randon1488696458643')}" width=80   />
							<#assign mobileTerminal_displayDefaultType=''>
								<#assign mobileTerminal_defaultValue=''>
										<#assign mobileTerminal_defaultValue=''>
										  
									<@datacolumn key="mobileTerminal"        showFormat="CHECKBOX" defaultValue="${(mobileTerminal_defaultValue!)?string}" defaultDisplay="${(mobileTerminal_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1497849359617')}" width=80 showFormatFunc=""  />
							<#assign testProduct_code_displayDefaultType=''>
								<#assign testProduct_code_defaultValue=''>
										<#assign testProduct_code_defaultValue=''>
																	<#if (testProduct_code_defaultValue!)?string=="currentUser">
								<#assign testProduct_code_defaultValue='${staffJson!}'>
							<#elseif (testProduct_code_defaultValue!)?string=="currentPost">
								<#assign testProduct_code_defaultValue='${postJson!}'>
							<#elseif (testProduct_code_defaultValue!)?string=="currentDepart">
								<#assign testProduct_code_defaultValue='${deptJson!}'>
							<#elseif (testProduct_code_defaultValue!)?string=="currentComp">
								<#assign testProduct_code_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="testProduct.code"        showFormat="SELECTCOMP" defaultValue="${(testProduct_code_defaultValue!)?string}" defaultDisplay="${(testProduct_code_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="RM.formula.formulaProcess.processActiveEdit"  textalign="left"  viewUrl="/RM/testProj/testProj/testProjSIRef.action" viewCode="RM_7.5.0.0_testProj_testProjSIRef" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1487596519107')}"  label="${getText('RM.viewtitle.randon1490318000877')}" width=80 showFormatFunc=""  />
							<#assign qualityStandard_code_displayDefaultType=''>
								<#assign qualityStandard_code_defaultValue=''>
										<#assign qualityStandard_code_defaultValue=''>
																	<#if (qualityStandard_code_defaultValue!)?string=="currentUser">
								<#assign qualityStandard_code_defaultValue='${staffJson!}'>
							<#elseif (qualityStandard_code_defaultValue!)?string=="currentPost">
								<#assign qualityStandard_code_defaultValue='${postJson!}'>
							<#elseif (qualityStandard_code_defaultValue!)?string=="currentDepart">
								<#assign qualityStandard_code_defaultValue='${deptJson!}'>
							<#elseif (qualityStandard_code_defaultValue!)?string=="currentComp">
								<#assign qualityStandard_code_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="qualityStandard.code"        showFormat="SELECTCOMP" defaultValue="${(qualityStandard_code_defaultValue!)?string}" defaultDisplay="${(qualityStandard_code_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="RM.formula.formulaProcess.processActiveEdit"  textalign="left"  viewUrl="/RM/qualityStandard/stand/standRef.action" viewCode="RM_7.5.0.0_qualityStandard_standRef" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1487596068024')}"  label="${getText('RM.propertydisplayName.randon148759542443623')}" width=80 showFormatFunc=""  />
							<#assign pickSite_name_displayDefaultType=''>
								<#assign pickSite_name_defaultValue=''>
										<#assign pickSite_name_defaultValue=''>
																	<#if (pickSite_name_defaultValue!)?string=="currentUser">
								<#assign pickSite_name_defaultValue='${staffJson!}'>
							<#elseif (pickSite_name_defaultValue!)?string=="currentPost">
								<#assign pickSite_name_defaultValue='${postJson!}'>
							<#elseif (pickSite_name_defaultValue!)?string=="currentDepart">
								<#assign pickSite_name_defaultValue='${deptJson!}'>
							<#elseif (pickSite_name_defaultValue!)?string=="currentComp">
								<#assign pickSite_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="pickSite.name"        showFormat="SELECTCOMP" defaultValue="${(pickSite_name_defaultValue!)?string}" defaultDisplay="${(pickSite_name_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false   selectCompName="RM.formula.formulaProcess.processActiveEdit"  textalign="left"  viewUrl="/RM/pickSite/pickSite/pickSiteRefLayOut.action" viewCode="RM_7.5.0.0_pickSite_pickSiteRefLayOut" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1503470970689')}"  label="${getText('RM.propertydisplayName.randon15034702500333')}" width=80 showFormatFunc=""  />
							<#assign isWatchActive_displayDefaultType=''>
								<#assign isWatchActive_defaultValue=''>
										<#assign isWatchActive_defaultValue=''>
										  
									<@datacolumn key="isWatchActive"        showFormat="CHECKBOX" defaultValue="${(isWatchActive_defaultValue!)?string}" defaultDisplay="${(isWatchActive_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon148869652642623')}" width=60 showFormatFunc=""  />
							<#assign isAnaly_displayDefaultType=''>
								<#assign isAnaly_defaultValue=''>
										<#assign isAnaly_defaultValue=''>
										  
									<@datacolumn key="isAnaly"        showFormat="CHECKBOX" defaultValue="${(isAnaly_defaultValue!)?string}" defaultDisplay="${(isAnaly_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1543394912389')}" width=100 showFormatFunc=""  />
							<#assign finalInspection_displayDefaultType=''>
								<#assign finalInspection_defaultValue=''>
										<#assign finalInspection_defaultValue=''>
										  
									<@datacolumn key="finalInspection"        showFormat="CHECKBOX" defaultValue="${(finalInspection_defaultValue!)?string}" defaultDisplay="${(finalInspection_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1497849337000')}" width=60 showFormatFunc=""  />
							<#assign activeHiddenId_displayDefaultType=''>
								<#assign activeHiddenId_defaultValue=''>
										<#assign activeHiddenId_defaultValue=''>
										  
									<@datacolumn key="activeHiddenId"        showFormat="TEXT" defaultValue="${(activeHiddenId_defaultValue!)?string}" defaultDisplay="${(activeHiddenId_displayDefaultType!)?string}" decimal="" editable=true type="long" showType="long" notnull=false     textalign="center" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1488158485925')}" width=100 showFormatFunc=""  />
							<#assign channelOrManual_displayDefaultType=''>
								<#assign channelOrManual_defaultValue=''>
										<#assign channelOrManual_defaultValue=''>
										  
									<@datacolumn key="channelOrManual"        showFormat="CHECKBOX" defaultValue="${(channelOrManual_defaultValue!)?string}" defaultDisplay="${(channelOrManual_displayDefaultType!)?string}" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1488776431957')}" width=100 showFormatFunc=""  />
							<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formula_FormulaProcessActive", "RM_7.5.0.0_formula_processActiveEditdg1487554913298", "DATAGRID", "formulaProcessActive")>
							<#-- 排布自定义字段 -->
							<#list customPropViewMappings as cpvm>
								<#assign cpvmColumnType = cpvm.property.type>
								<#assign cpvmKey = cpvm.propertyLayRec>
								<#assign cpvmType = cpvmColumnType?lower_case>
								
								<#assign cpEditable = true>
								<#if cpEditable && cpvmKey?index_of('.') gt -1>
									<#assign cpEditable = false>
								</#if>
								<#if cpvm.readonly!false>
									<#assign cpEditable = false>
								</#if>
								<#assign cpvmNotNull = false>
								<#if cpEditable && !(cpvm.nullable!true)>
									<#assign cpvmNotNull = true>
								</#if>
								<#assign cpDecimal = ''>
								<#if cpvm.property.type == 'DECIMAL'>
									<#assign cpDecimal = (cpvm.property.decimalNum!0)>
									<#if cpvm.precision??>
										<#assign cpDecimal =cpvm.precision!>
									</#if>
								</#if>
								<#assign cpvmWidth = 100>
								<#if cpvmColumnType == 'DATETIME'>
									<#assign cpvmWidth = 130>
								</#if>
								<#if cpvm.fieldType == 'TEXTAREA'>
									<#assign cpvmWidth = 200>
								</#if>
								
								<#if cpvmColumnType == 'TEXT'>
									<#assign cpvmType = 'textfield'>
								<#elseif cpvmColumnType == 'DATETIME' || cpvmColumnType == 'SYSTEMCODE' || cpvmColumnType == 'OBJECT'>
									<#assign cpvmType = cpvm.fieldType?lower_case>
								</#if>
								
								<#if cpvmColumnType == 'SYSTEMCODE'>
									<#assign cpvmSeniorSystemCode = false>
									<#if cpvm.property.seniorSystemCode?? && cpvm.property.seniorSystemCode>
										<#assign cpvmSeniorSystemCode = true>
									</#if>
									<#assign systemEntityCode = cpvm.property.fillcontentMap.fillContent>
									<#assign systemEntity = getSystemCode(systemEntityCode)>
									<#assign systemCodelistType = systemEntity.listType>
									<#if cpvm.property.multable?? && cpvm.property.multable && systemCodelistType?? && systemCodelistType == 'TREE'>
										<@systemCodeColumn width=cpvmWidth label="${getText('${cpvm.displayName}')}" code="${(cpvm.property.fillcontentMap.fillContent)!}" key=cpvmKey isCustom=true editable=cpEditable type=cpvmType notnull=cpvmNotNull seniorSystemCode=cpvmSeniorSystemCode isTree=true isMultTree=true systemEntityCode=systemEntityCode systemCodeUrl="/foundation/systemCode/multiCodeTree.action?systemEntityCode=${systemEntityCode}"/>
									<#elseif cpvm.property.multable?? && cpvm.property.multable>
										<@systemCodeColumn width=cpvmWidth label="${getText('${cpvm.displayName}')}" code="${(cpvm.property.fillcontentMap.fillContent)!}" key=cpvmKey isCustom=true editable=cpEditable type=cpvmType notnull=cpvmNotNull seniorSystemCode=cpvmSeniorSystemCode isMultable=true systemEntityCode=systemEntityCode systemCodeUrl="/foundation/systemCode/multiCodeList.action?systemEntityCode=${systemEntityCode}"/>
									<#elseif systemCodelistType?? && systemCodelistType == 'TREE'>
										<@systemCodeColumn width=cpvmWidth label="${getText('${cpvm.displayName}')}" code="${(cpvm.property.fillcontentMap.fillContent)!}" key=cpvmKey isCustom=true editable=cpEditable type=cpvmType notnull=cpvmNotNull seniorSystemCode=cpvmSeniorSystemCode isTree=true systemEntityCode=systemEntityCode systemCodeUrl="/foundation/systemCode/singleCodeTree.action?systemEntityCode=${systemEntityCode}"/>
									<#else>
										<@systemCodeColumn width=cpvmWidth label="${getText('${cpvm.displayName}')}" code="${(cpvm.property.fillcontentMap.fillContent)!}" key=cpvmKey isCustom=true editable=cpEditable type=cpvmType notnull=cpvmNotNull seniorSystemCode=cpvmSeniorSystemCode/>
									</#if>
								<#else>
									<#assign viewUrl = ''>
									<#assign viewTitle = ''>
									<#assign viewCode = ''>
									<#assign selectCompName = ''>
									<#assign isObjCustomProp = false>
									<#assign objCustomPropNames = ''>
									<#if cpvmColumnType == 'OBJECT'>
										<#if cpvm.refView??>
											<#assign viewUrl = (cpvm.refView.url)!''>
											<#assign viewTitle = (cpvm.refView.title)!''>
											<#assign viewCode = (cpvm.refView.code)!''>
											<#assign selectCompName = 'RM.formula.formulaProcess.processActiveEdit'>
										</#if>
										<#assign pkName = ''>
										<#assign mainDisplayName = ''>
										<#list cpvm.property.associatedProperty.model.properties as p>
											<#if !pkName?has_content && p.isPk?? && p.isPk>
												<#assign pkName = p.name>
											</#if>
											<#if !mainDisplayName?has_content && p.isMainDisplay?? && p.isMainDisplay>
												<#assign mainDisplayName = p.name>
											</#if>
										</#list>
										<#assign cpvmKey = cpvmKey + 'MainDisplay'>
										<#assign isObjCustomProp = true>
										<#assign objCustomPropNames = (mainDisplayName!'name') + ',' + (pkName!'id')> 
									</#if>
									
									<#if cpvm.align??>
										<#assign columnAlign = cpvm.align >						
									<#elseif (cpvm.property.type=='INTEGER' || cpvm.property.type=='DECIMAL')>
										<#assign columnAlign = 'right'>
									<#else>
										<#assign columnAlign = 'left' >
									</#if>
						
									<@datacolumn key=cpvmKey width=cpvmWidth showFormat="${cpvm.format!'TEXT'}" decimal="${cpDecimal}" editable=cpEditable type=cpvmType showType="${cpvm.fieldType}" notnull=cpvmNotNull callbackname="" selectCompName=selectCompName viewUrl="${viewUrl!}" viewCode="${viewCode!}" crossCompany=false viewTitle="${getText('${viewTitle!}')}" label="${getText('${cpvm.displayName}')}" isObjCustomProp=isObjCustomProp objCustomPropNames="${objCustomPropNames}" textalign="${columnAlign}" />
								</#if>
							</#list>
							<#assign meno_displayDefaultType=''>
								<#assign meno_defaultValue=''>
										<#assign meno_defaultValue=''>
										  
									<@datacolumn key="meno"        showFormat="TEXT" defaultValue="${(meno_defaultValue!)?string}" defaultDisplay="${(meno_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331194516')}" width=100 showFormatFunc=""  />
							<#assign batchPhaseID_displayDefaultType=''>
								<#assign batchPhaseID_defaultValue=''>
										<#assign batchPhaseID_defaultValue=''>
										  
									<@datacolumn key="batchPhaseID"        showFormat="TEXT" defaultValue="${(batchPhaseID_defaultValue!)?string}" defaultDisplay="${(batchPhaseID_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="center" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1493729738415')}" width=100 showFormatFunc=""  />
							<#assign copy_displayDefaultType=''>
								<#assign copy_defaultValue='false'>
										  
									<@datacolumn key="copy"        showFormat="CHECKBOX" defaultValue="${(copy_defaultValue!)?string}" defaultDisplay="${(copy_displayDefaultType!)?string}" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1509706675156')}" width=100 showFormatFunc=""  />
							<#assign subActiveNum_displayDefaultType=''>
								<#assign subActiveNum_defaultValue=''>
										<#assign subActiveNum_defaultValue=''>
										  
									<@datacolumn key="subActiveNum"        showFormat="TEXT" defaultValue="${(subActiveNum_defaultValue!)?string}" defaultDisplay="${(subActiveNum_displayDefaultType!)?string}" decimal="" editable=false type="INTEGER" showType="integer" notnull=false     textalign="right" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1540270275689')}" width=100 showFormatFunc=""  />
							<#assign mainActive_displayDefaultType=''>
								<#assign mainActive_defaultValue=''>
										<#assign mainActive_defaultValue=''>
										  
									<@datacolumn key="mainActive"        showFormat="CHECKBOX" defaultValue="${(mainActive_defaultValue!)?string}" defaultDisplay="${(mainActive_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1539919567050')}" width=100 showFormatFunc=""  />
							<#assign hiddenSort_displayDefaultType=''>
								<#assign hiddenSort_defaultValue=''>
										<#assign hiddenSort_defaultValue=''>
										  
									<@datacolumn key="hiddenSort"        showFormat="TEXT" defaultValue="${(hiddenSort_defaultValue!)?string}" defaultDisplay="${(hiddenSort_displayDefaultType!)?string}" decimal="6" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1539936079970')}" width=100 showFormatFunc=""  />
			
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
				function FormulaProcessActive_dg1487554913298_check_datagridvalid(){
					//
					var errorObj =FormulaProcessActive_dg1487554913298Widget._DT.testData();
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
				
				function savedg1487554913298DataGrid(){
					<#if  refId?? && (refId gt 0)>
					FormulaProcessActive_dg1487554913298Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('FormulaProcessActive_dg1487554913298Widget') > -1) {
						FormulaProcessActive_dg1487554913298Widget.setAllRowEdited();
					}
					var json = FormulaProcessActive_dg1487554913298Widget.parseEditedData();
					$('input[name="dg1487554913298ListJson"]').remove();
					$('input[name="dgLists[\'dg1487554913298\']"]').remove();
					$('input[name="dg1487554913298ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1487554913298\']">').val(json).appendTo($('#RM_formula_formulaProcess_processActiveEdit_form'));
					$('<input type="hidden" name="dg1487554913298ModelCode">').val('RM_7.5.0.0_formula_FormulaProcessActive').appendTo($('#RM_formula_formulaProcess_processActiveEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1487554913298ListJson">').val(json).appendTo($('#RM_formula_formulaProcess_processActiveEdit_form'));
				}
				function DT_FormulaProcessActive_dg1487554913298_deldatagrid(){
					var deleteRows = FormulaProcessActive_dg1487554913298Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','processId.id','formulaId.id','product.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1487554913298DeletedIds").length>0){
							$("#dg1487554913298DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1487554913298DeletedIds" name="dgDeletedIds[\'dg1487554913298\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_processActiveEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1487554913298DeletedIds['+CUI('input[name^="dg1487554913298DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_processActiveEdit_form'));
					});
					return deleteRows;
				}
				function DT_FormulaProcessActive_dg1487554913298_delTreeNodes(){
					var deleteRows = FormulaProcessActive_dg1487554913298Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','processId.id','formulaId.id','product.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1487554913298DeletedIds").length>0){
							$("#dg1487554913298DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1487554913298DeletedIds" name="dgDeletedIds[\'dg1487554913298\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_processActiveEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1487554913298DeletedIds['+CUI('input[name^="dg1487554913298DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_processActiveEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('RM_formula_formulaProcess_processActiveEdit_datagrids');
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
							if(datagrids[0][i] == 'FormulaProcessActive_dg1487554913298') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'FormulaProcessActive_dg1487554913298';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'FormulaProcessActive_dg1487554913298';
					}
					$('body').data('RM_formula_formulaProcess_processActiveEdit_datagrids', datagrids);
				});
				
				var FormulaProcessActive_dg1487554913298_importDialog = null;
				function FormulaProcessActive_dg1487554913298_showImportDialog(){
					try{
						if(FormulaProcessActive_dg1487554913298_importDialog!=null&&FormulaProcessActive_dg1487554913298_importDialog.isShow==1){
							return false;
						}
						var url = "/RM/formula/formulaProcess/initImport.action?datagridCode=RM_7.5.0.0_formula_processActiveEditdg1487554913298&tid=${id!}&datagridName=dg1487554913298";
							<#if canImportExcel>
								var buttonCode="RM_7.5.0.0_formula_processActiveEditdg1487554913298_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						FormulaProcessActive_dg1487554913298_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("FormulaProcessActive_dg1487554913298"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();FormulaProcessActive_dg1487554913298_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();FormulaProcessActive_dg1487554913298_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						FormulaProcessActive_dg1487554913298_importDialog.show();
					}catch(e){}
				}	
				
				function FormulaProcessActive_dg1487554913298_downLoadFile(){
					var url = "/RM/formula/formulaProcess/downLoad.action?datagridCode=RM_7.5.0.0_formula_processActiveEditdg1487554913298&templateRelatedModelCode=RM_7.5.0.0_formula_processActiveEditdg1487554913298&downloadType=template&fileName=dg1487554913298";
					window.open(url,"","");
				}
				function dg1487554913298RenderOverEvent(){
					FormulaProcessActive_dg1487554913298Widget._DT._sortSet(true,false);
$("#FormulaProcessActive_dg1487554913298_tbody tr td").not("td[key='execSort']").on("click",function(){
    var a=$(this).index();
    setIndexData(a);
})
//交换顺序
if($("#FormulaProcessActive_dg1487554913298 a:eq(0) span").text()!="管道投配料"){
    $("#FormulaProcessActive_dg1487554913298 a:eq(2)").insertAfter($('#FormulaProcessActive_dg1487554913298 a:eq(10)'));
    $("#FormulaProcessActive_dg1487554913298 a:eq(1)").insertAfter($('#FormulaProcessActive_dg1487554913298 a:eq(10)'));
    $("#FormulaProcessActive_dg1487554913298 a:eq(0)").insertAfter($('#FormulaProcessActive_dg1487554913298 a:eq(10)'));
}

//上下移样式修改
$("#FormulaProcessActive_dg1487554913298 a:eq(6) span").attr('class','buttonbar-button cui-btn-up');
$("#FormulaProcessActive_dg1487554913298 a:eq(7) span").attr('class','buttonbar-button cui-btn-down');

//隐藏上移、下移
// $("#FormulaProcessActive_dg1487554913298 a:eq(8) span").hide();
$("#FormulaProcessActive_dg1487554913298 a:eq(9) span").hide();
$("#FormulaProcessActive_dg1487554913298 a:eq(10) span").hide();

// annotated by oneway 20180830
/*$("#FormulaProcessActive_dg1487554913298 a:eq(6) span").attr('class','buttonbar-button cui-btn-up');
//下移样式修改
$("#FormulaProcessActive_dg1487554913298 a:eq(7) span").attr('class','buttonbar-button cui-btn-down');
//活动删除
$("#FormulaProcessActive_dg1487554913298 a:eq(3) span").attr('class','buttonbar-button cui-btn-del');
$("#FormulaProcessActive_dg1487554913298 .paginatorbar-operatebar span:eq(0)").attr('class','buttonbar-button cui-btn-gdtpl');
$("#FormulaProcessActive_dg1487554913298 .paginatorbar-operatebar span:eq(1)").attr('class','buttonbar-button cui-btn-sgtpl');
$("#FormulaProcessActive_dg1487554913298 .paginatorbar-operatebar span:eq(2)").attr('class','buttonbar-button cui-btn-hdsz');*/


//将投配料中的id赋值给隐藏的活动Id
//pt的长度
var length=FormulaProcessActive_dg1487554913298Widget.getRowLength();
for(var i=0;i<length;i++){
    //活动类型
    var activeType=FormulaProcessActive_dg1487554913298Widget.getCellValue(i,'activeType.id');
    //如果是投配料
    if(activeType=='activeType/activeType4'){
                $("#FormulaProcessActive_dg1487554913298_tbody tbody tr ").eq(i).attr('style','background:#cae6ff');

    }else if(activeType=='activeType/activeType2'){
                $("#FormulaProcessActive_dg1487554913298_tbody tbody tr ").eq(i).attr('style','background:#daf4d7');
    }
            
}



//添加双击事件
$("#FormulaProcessActive_dg1487554913298_tbody tr td").not("td[key='execSort']").dblclick(function(){
     var SelectedRow = FormulaProcessActive_dg1487554913298Widget.getSelectedRow();
     var activeType=FormulaProcessActive_dg1487554913298Widget.getCellValue(SelectedRow,'activeType.id')
     var activeId=FormulaProcessActive_dg1487554913298Widget.getCellValue(SelectedRow,'id');
     if(activeType=='activeType/activeType2'){
            activeId=FormulaProcessActive_dg1487554913298Widget.getCellValue(SelectedRow,'activeHiddenId');
     }
        var length=PrecessStandards_dg1487555065561Widget.getRowLength();
        var checkFlag='true';
    //如果当前选中的工序活动与之前选中的工序活动不一致进行提示
    if(bdforeRow!=SelectedRow){
            //alert(1);
            if(Number(length)>0){
            for(var i=0;i<length;i++){
               //指标
                    var quota=PrecessStandards_dg1487555065561Widget.getCellValue(i,'quota');
                    //标准值
                    var standValue= PrecessStandards_dg1487555065561Widget.getCellValue(i,'stValue');
                    var row=i+1;
                    var processName=FormulaProcessActive_dg1487554913298Widget.getCellValue(bdforeRow,'name');
                    if(quota==undefined  || quota==''){
                    checkFlag='false';
                    break;
                    }
                    if(standValue==undefined  || standValue==''){
                    checkFlag='false';
                    }
                    
                    
                    
            }
    
    }
    }
     
     if(checkFlag=='true'){
     
             if(activeType!='activeType/activeType4' && activeType!='activeType/activeType2'){
                otherEdit = new CUI.Dialog({
          title:"其他活动设置",
          formId: "RM_formula_formulaProcessActive_otherActiveEdit_form",
          type:5,
            modal:true,
                url:'/RM/formula/formulaProcessActive/otherActiveEdit.action?entityCode=RM_7.5.0.0_formula&id='+activeId + "&${getPowerCode('otherActiveEdit')}",
                buttons:[
                             { name:"${getText("foundation.common.save")}",
                                             handler:function(){
                                             CUI('#RM_formula_formulaProcessActive_otherActiveEdit_form').submit();
                     }
                     },
                                    { name:"${getText("foundation.common.closed")}",
                                    handler:function(){this.close()}
                                    }
                         ]
                                     });
                            otherEdit.show();
     }else{
                    var manualOrChannel=FormulaProcessActive_dg1487554913298Widget.getCellValue(SelectedRow,'channelOrManual');
                    if(manualOrChannel==true){
                    fomulaActive=new CUI.Dialog({
                        title:"${getText('RM.formulaActive.radion141234234')}",
                    formId:"RM_formula_formulaProcessActive_channelActiveEdit_form",
                        type:5,
                        modal:true,
                        url:'/RM/formula/formulaProcessActive/channelActiveEdit.action?entityCode=RM_7.5.0.0_formula&id='+activeId + "&${getPowerCode('channelActiveEdit')}",
                        buttons:[{
                            name:"${getText('foundation.common.save')}",
                            handler:function(){
                            CUI('#RM_formula_formulaProcessActive_channelActiveEdit_form').submit();
              }
            },
            {
                   name:"${getText('foundation.common.closed')}",
                   handler:function(){this.close()}
             }]
       });
         fomulaActive.show();
                    }else{
                    manualActive=new CUI.Dialog({
                        title:"${getText('RM.formulaActive.radion1412123121')}",
                    formId:"RM_formula_formulaProcessActive_manualActiveEdit_form",
                        type:5,
                        modal:true,
                        url:'/RM/formula/formulaProcessActive/manualActiveEdit.action?entityCode=RM_7.5.0.0_formula&id='+activeId + "&${getPowerCode('manualActiveEdit')}",
                        buttons:[{
                            name:"${getText('foundation.common.save')}",
                            handler:function(){
                            CUI('#RM_formula_formulaProcessActive_manualActiveEdit_form').submit();
              }
            },
            {
                   name:"${getText('foundation.common.closed')}",
                   handler:function(){this.close()}
             }]
       });
         manualActive.show();
                    }
                    
     }
     
     }
    
     
});
//取消活动变色
$("#FormulaProcessActive_dg1487554913298_tbody").children().children(".dg-bd-tr").click(function(){
    var phaselenght=0;
    var index=$(this).index();
    var batchPhaseID=FormulaProcessActive_dg1487554913298Widget.getCellValue(index,"batchPhaseID");
    var activeType=FormulaProcessActive_dg1487554913298Widget.getCellValue(index,"activeType.id");
    if(batchPhaseID!=''&&batchPhaseID!=undefined){
        if(activeType == "activeType/activeType4"){
            var checkIndex = FormulaProcessActive_dg1487554913298Widget.getRowLength();
            for(var i = 0 ; i < checkIndex ; i++ ){
                var batchPhaseID2=FormulaProcessActive_dg1487554913298Widget.getCellValue(i,"batchPhaseID");
                if(batchPhaseID2 == batchPhaseID && 
                    FormulaProcessActive_dg1487554913298Widget.getCellValue(i,"activeType.id") != "activeType/activeType2"){
                    phaselenght++;
                }               
            }           
        }else{//投配料活动必有配料活动一起使用同一phaseId，不能用下面的方法取数量
            phaselenght=$("td[truevalue="+batchPhaseID+"]",$("#FormulaProcessActive_dg1487554913298_tbody")).length;
        }   
    }
    //var row=FormulaProcessActive_dg1487554913298Widget.getSelectedRow();
    if(activeType=="activeType/activeType2"||phaselenght==1){//配料活动 或者 只有唯一活动对应批控，不允许删除配方
        $($($(".paginatorbar-operatebar").children()[3]).children()).css("color","grey");
    }
    else{
        $($($(".paginatorbar-operatebar").children()[3]).children()).css("color","black");
    }
    if(activeType=="activeType/activeType2"||FormulaProcessActive_dg1487554913298Widget.getCellValue(index,'batchPhaseID')==null){
        //配料活动 或者 不是批控建的活动，不允许修改活动类型不允许复制
        $($($(".paginatorbar-operatebar").children()[5]).children()).css("color","grey");
        $($($(".paginatorbar-operatebar").children()[4]).children()).css("color","grey");
    }else{
        $($($(".paginatorbar-operatebar").children()[4]).children()).css("color","black");
        //如果是自动投料，不允许复制
        if(FormulaProcessActive_dg1487554913298Widget.getCellValue(index,"auto")==true){
            $($($(".paginatorbar-operatebar").children()[5]).children()).css("color","grey");
        }else{
            $($($(".paginatorbar-operatebar").children()[5]).children()).css("color","black");
        }
        
        //只有手动投料和手动投配料才可以复制
        /*if(FormulaProcessActive_dg1487554913298Widget.getCellValue(index,"auto")==false && 
            (FormulaProcessActive_dg1487554913298Widget.getCellValue(index,"activeType.id")=="activeType/activeType3" || FormulaProcessActive_dg1487554913298Widget.getCellValue(index,"activeType.id")=="activeType/activeType4") ){
            $($($(".paginatorbar-operatebar").children()[5]).children()).css("color","black");
        }else{
            $($($(".paginatorbar-operatebar").children()[5]).children()).css("color","grey");
        }*/
    }
    //复制出来的配方不能改活动类型
    /*if(FormulaProcessActive_dg1487554913298Widget.getCellValue(index,"copy")==true){
        $($($(".paginatorbar-operatebar").children()[4]).children()).css("color","grey");
    }*/
})
var mainActiveLength = 0;
for (var i = 0; i < FormulaProcessActive_dg1487554913298Widget.getRowLength();i++){
    if (FormulaProcessActive_dg1487554913298Widget.getCellValue(i,'mainActive')){
        $("#FormulaProcessActive_dg1487554913298_tbody tr").eq(i).addClass("mainActive")
        //对应关系为 {父活动id : 父活动执行顺序 + "_" + 子活动数量}
        mapValue[FormulaProcessActive_dg1487554913298Widget.getCellValue(i,'id')] = FormulaProcessActive_dg1487554913298Widget.getCellValue(i,'execSort') + "_" + FormulaProcessActive_dg1487554913298Widget.getCellValue(i,'subActiveNum')
        mainActiveLength++;
    }else{
        $("#FormulaProcessActive_dg1487554913298_tbody tr").eq(i).addClass("subActive")
    }
}
if($("input[name='formulaProcess.formulaId.batchContral']").val() == 'false'){
$("#FormulaProcessActive_dg1487554913298_tbody tr.mainActive td[key='execSort']").click(function(event){
    var td = this
    var width=$(td).find("div").css("width")
    var selectedValue =  $(td).find("div").html()

    if (selectedValue.indexOf("<select")!=-1){
        return;
    }
    if(mainActiveLength){
        var options = "<option value =\"\"></option>";
        for (var i = 1; i <= mainActiveLength; i++) {
            if (selectedValue && selectedValue == i ) {
                options += "<option value =\"" + i + "\" selected>" + i + "</option>"
            }else{
                options += "<option value =\"" + i + "\">" + i + "</option>"
            }
        }

        $(td).html(
            "<div style=\"width:"+width+"\"><select class=\"td-select\" style=\"margin-top:-2px;margin-bottom:-2px;width:"+width+";border-width:0px;outline:0px;\">"+
              options+
            "</select></div>"
        )
        $(".td-select").focus()
        
        $(".td-select").click(function(event){
            return false;
        }).change(function(){
            FormulaProcessActive_dg1487554913298Widget.setCellValue(FormulaProcessActive_dg1487554913298Widget.getSelectedRow(),'execSort',$(this).find("option:selected").html())
            $("td[key='execSort'] div").css("text-align",'center')
            resortActive();
        }).blur(function(){
            FormulaProcessActive_dg1487554913298Widget.setCellValue(FormulaProcessActive_dg1487554913298Widget.getSelectedRow(),'execSort',$(this).find("option:selected").html())
            $("td[key='execSort'] div").css("text-align",'center')
        })
    }

})
}
tableSort(FormulaProcessActive_dg1487554913298Widget,'hiddenSort',"asc")

subActive(mapValue);
$.ajax({
    url : "/RM/formula/formula/getSynchronData.action",
    type : "get",
    dataType : "json",
    async : false,
    success : function(data){
        var IsOpen = JSON.stringify(data.result);
        if(IsOpen == 'false'){
            $(".paginatorbar-operatebar a").eq(8).hide();
            $( 'td[key="isAnaly"]').hide();
            FormulaProcessActive_dg1487554913298Widget._DT._resizeHeight = true;  
            FormulaProcessActive_dg1487554913298Widget._DT._initDomElements();
            FormulaProcessActive_dg1487554913298Widget._DT._resizeHeight = false; 
        }
    }

});
				}
				function dg1487554913298PageInitMethod(nTabIndex){
					RM.formula.formulaProcess.processActiveEdit.initSize(nTabIndex);
					if($("[name='formulaProcess.batchUnitID']").val()!=''&&$("[name='formulaProcess.batchUnitID']").val()!=undefined){
    //$('.cui-btn-add',$("#FormulaProcessActive_dg1487554913298")).eq(0).hide();
    //$('.cui-btn-add',$("#FormulaProcessActive_dg1487554913298")).eq(1).hide();
    //$('.cui-btn-add',$("#FormulaProcessActive_dg1487554913298")).eq(2).hide();
    
    $("#FormulaProcessActive_dg1487554913298 a:eq(0)").hide();
    $("#FormulaProcessActive_dg1487554913298 a:eq(1)").hide();
    $("#FormulaProcessActive_dg1487554913298 a:eq(2)").hide();
}else{
    //$('.cui-btn-add',$("#FormulaProcessActive_dg1487554913298")).eq(4).hide();
    //$('.cui-btn-add',$("#FormulaProcessActive_dg1487554913298")).eq(5).hide();
    
    $("#FormulaProcessActive_dg1487554913298 a:eq(4)").hide();
    $("#FormulaProcessActive_dg1487554913298 a:eq(5)").hide();
    //$("#FormulaProcessActive_dg1487554913298 a:eq(6)").hide();
    //$("#FormulaProcessActive_dg1487554913298 a:eq(7)").hide();
}

var heigh = $(window).height();
FormulaProcessActive_dg1487554913298Widget._DT.setHeight( heigh*0.8 );
//复制图标cui-btn-copy
$("#FormulaProcessActive_dg1487554913298 .paginatorbar-operatebar span:eq(5)").attr('class','buttonbar-button cui-btn-copy');
//工艺参数图标
$("#FormulaProcessActive_dg1487554913298 .paginatorbar-operatebar span:eq(8)").attr('class','buttonbar-button cui-btn-cdsz');
 $.ajax({
    url : "/RM/formula/formula/getSynchronData.action",
    type : "get",
    dataType : "json",
    async : false,
    success : function(data){
        var IsOpen = JSON.stringify(data.result);
        if(IsOpen == 'false'){
            $(".paginatorbar-operatebar a").eq(8).hide();
            $("#FormulaProcessActive_dg1487554913298 td[id*=-col-28]").hide();
            $("#FormulaProcessActive_dg1487554913298 td[name*='isAnaly']").hide();

        }
    }

});
$(".paginatorbar-operatebar>a").eq(0).hide();
$(".paginatorbar-operatebar>a").eq(1).hide();
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
								<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formula_PrecessStandards", "RM_7.5.0.0_formula_processActiveEditdg1487555065561", "DATAGRID", "precessStandards")>
								<#list customPropViewMappings as cpvm>
									<#if cpvm.property.type == 'OBJECT' && cpObjHideKey?index_of(",'" +cpvm.propertyLayRec) lt 0>
										<#assign cpObjHideKey = cpObjHideKey + ",'" + cpvm.propertyLayRec + "'">
									</#if>
									<#if cpvm.propertyLayRec?index_of('.') lt 0 && cpvm.relatedKey?has_content>
										<#assign cpvmInfo = cpvmInfo + ',' + cpvm.relatedKey + "||" + cpvm.propertyLayRec>
										<#if cpvm.property.type == 'OBJECT'>
											<#assign cpvmInfo = cpvmInfo + "||" + cpvm.property.code>	
										</#if>
									</#if>
								</#list>
			
							<script type="text/javascript">
								function PrecessStandards_dg1487555065561_addRow(event)
																{
		var selectRow=FormulaProcessActive_dg1487554913298Widget.getSelectedRow();
		if(selectRow==undefined){
					workbenchErrorBarWidget.showMessage('请先选择工序活动','f');
	  			return false;
		}else{
					var activeID=FormulaProcessActive_dg1487554913298Widget.getCellValue(selectRow,'id');
					PrecessStandards_dg1487555065561Widget._DT.addNewRow();
					var length=PrecessStandards_dg1487555065561Widget.getRowLength();
					PrecessStandards_dg1487555065561Widget.setCellValue(length-1,'activeId.id',activeID);
					//波动上限、波动下限不可填
					PrecessStandards_dg1487555065561Widget._DT.setCellProperty(length-1,'flucUpperLimit','readonly',true);
					PrecessStandards_dg1487555065561Widget._DT.setCellProperty(length-1,'flucLowerLimit','readonly',true);
					
					//扫描间隔、上限、上上限、下限、下下限不可编辑
					PrecessStandards_dg1487555065561Widget._DT.setCellProperty(length-1,'limitInter','readonly',true);
					PrecessStandards_dg1487555065561Widget._DT.setCellProperty(length-1,'upperLimit','readonly',true);
					PrecessStandards_dg1487555065561Widget._DT.setCellProperty(length-1,'lowerLimit','readonly',true);
					PrecessStandards_dg1487555065561Widget._DT.setCellProperty(length-1,'maxLimit','readonly',true);
					PrecessStandards_dg1487555065561Widget._DT.setCellProperty(length-1,'loweMxLimit','readonly',true);
		}
}
							</script>
							<script type="text/javascript">
								function PrecessStandards_dg1487555065561_deleteRow(event)
																{
DT_PrecessStandards_dg1487555065561_deldatagrid();
}
							</script>
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/RM/formula/formulaProcess/data-dg1487555065561.action?formulaProcess.id=${refId!-1}&refId=${refId!-1}&datagridCode=RM_7.5.0.0_formula_processActiveEditdg1487555065561">
			<#else>
				<#assign dUrl="/RM/formula/formulaProcess/data-dg1487555065561.action?formulaProcess.id=${(formulaProcess.id)!-1}&datagridCode=RM_7.5.0.0_formula_processActiveEditdg1487555065561">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('RM.buttonPropertyshowName.radion148834727177823')}\",handler:function(event){PrecessStandards_dg1487555065561_addRow(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.23')}\",handler:function(event){PrecessStandards_dg1487555065561_deleteRow(event)},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('RM.buttonPropertyshowName.radion148834727177823')}\",handler:function(event){PrecessStandards_dg1487555065561_addRow(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.23')}\",handler:function(event){PrecessStandards_dg1487555065561_deleteRow(event)},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_PrecessStandards_dg1487555065561" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1487555065561_id" value="PrecessStandards_dg1487555065561" />
			
			<input type="hidden" id="dg1487555065561_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('RM.modelname.randon1487331249205')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/RM/formula/formulaProcess/data-dg1487555065561.action?operateType=export&datagridCode=RM_7.5.0.0_formula_processActiveEditdg1487555065561"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="PrecessStandards_dg1487555065561" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="PrecessStandards_dg1487555065561" viewType="${viewType}" renderOverEvent="dg1487555065561RenderOverEvent" route="${routeFlag}" formId="RM_formula_formulaProcess_processActiveEdit_form" noPermissionKeys="quota,stValue,overrunFlag,limitInter,upperLimit,maxLimit,lowerLimit,loweMxLimit,fluctuateFlag,flucUpperLimit,flucLowerLimit,activeId.id,processId.id" modelCode="RM_7.5.0.0_formula_PrecessStandards" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1487555065561" dtPage="dgPage"  hidekeyPrefix="dg1487555065561" hidekey="['id','version','activeId.id','activeId.id','processId.id','processId.id'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1487555065561PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName dgTitle="${getText('RM.dataGriddataGridName.radion148818169604023')}" activexButton="RM.buttonPropertyshowName.radion148834727177823,addRow,add;RM.buttonPropertyshowName.23,deleteRow,del" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign quota_displayDefaultType=''>
								<#assign quota_defaultValue=''>
										<#assign quota_defaultValue=''>
										  
									<@datacolumn key="quota"        showFormat="TEXT" defaultValue="${(quota_defaultValue!)?string}" defaultDisplay="${(quota_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=true     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331350188')}" width=100 showFormatFunc=""  />
							<#assign stValue_displayDefaultType=''>
								<#assign stValue_defaultValue=''>
										<#assign stValue_defaultValue=''>
										  
									<@datacolumn key="stValue"        showFormat="TEXT" defaultValue="${(stValue_defaultValue!)?string}" defaultDisplay="${(stValue_displayDefaultType!)?string}" decimal="2" editable=true type="DECIMAL" showType="decimal" notnull=true     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331365964')}" width=100 showFormatFunc=""  />
							<#assign overrunFlag_displayDefaultType=''>
								<#assign overrunFlag_defaultValue=''>
										<#assign overrunFlag_defaultValue=''>
										 
										
										
										
										
										
 
									<@datacolumn key="overrunFlag"        showFormat="CHECKBOX" defaultValue="${(overrunFlag_defaultValue!)?string}" defaultDisplay="${(overrunFlag_displayDefaultType!)?string}" onchange="PrecessStandards_dg1487555065561Widget.evalCustomFunction(nRow,sFieldName,'overRunFlag(nRow,sFieldName)')" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331380816')}" width=100 showFormatFunc=""  />
							<#assign limitInter_displayDefaultType=''>
								<#assign limitInter_defaultValue=''>
										<#assign limitInter_defaultValue=''>
										  
									<@datacolumn key="limitInter"        showFormat="TEXT" defaultValue="${(limitInter_defaultValue!)?string}" defaultDisplay="${(limitInter_displayDefaultType!)?string}" decimal="" editable=true type="INTEGER" showType="integer" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331398438')}" width=100 showFormatFunc=""  />
							<#assign upperLimit_displayDefaultType=''>
								<#assign upperLimit_defaultValue=''>
										<#assign upperLimit_defaultValue=''>
										 
										
										
										
										
										
 
									<@datacolumn key="upperLimit"        showFormat="TEXT" defaultValue="${(upperLimit_defaultValue!)?string}" defaultDisplay="${(upperLimit_displayDefaultType!)?string}" onchange="PrecessStandards_dg1487555065561Widget.evalCustomFunction(nRow,sFieldName,'upChange()')" decimal="2" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331419739')}" width=100 showFormatFunc=""  />
							<#assign maxLimit_displayDefaultType=''>
								<#assign maxLimit_defaultValue=''>
										<#assign maxLimit_defaultValue=''>
										 
										
										
										
										
										
 
									<@datacolumn key="maxLimit"        showFormat="TEXT" defaultValue="${(maxLimit_defaultValue!)?string}" defaultDisplay="${(maxLimit_displayDefaultType!)?string}" onchange="PrecessStandards_dg1487555065561Widget.evalCustomFunction(nRow,sFieldName,'maxChange()')" decimal="2" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331435990')}" width=100 showFormatFunc=""  />
							<#assign lowerLimit_displayDefaultType=''>
								<#assign lowerLimit_defaultValue=''>
										<#assign lowerLimit_defaultValue=''>
										 
										
										
										
										
										
 
									<@datacolumn key="lowerLimit"        showFormat="TEXT" defaultValue="${(lowerLimit_defaultValue!)?string}" defaultDisplay="${(lowerLimit_displayDefaultType!)?string}" onchange="PrecessStandards_dg1487555065561Widget.evalCustomFunction(nRow,sFieldName,'lowChange()')" decimal="2" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331461257')}" width=100 showFormatFunc=""  />
							<#assign loweMxLimit_displayDefaultType=''>
								<#assign loweMxLimit_defaultValue=''>
										<#assign loweMxLimit_defaultValue=''>
										 
										
										
										
										
										
 
									<@datacolumn key="loweMxLimit"        showFormat="TEXT" defaultValue="${(loweMxLimit_defaultValue!)?string}" defaultDisplay="${(loweMxLimit_displayDefaultType!)?string}" onchange="PrecessStandards_dg1487555065561Widget.evalCustomFunction(nRow,sFieldName,'minChange()')" decimal="2" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331479070')}" width=100 showFormatFunc=""  />
							<#assign fluctuateFlag_displayDefaultType=''>
								<#assign fluctuateFlag_defaultValue=''>
										<#assign fluctuateFlag_defaultValue=''>
										 
										
										
										
										
										
 
									<@datacolumn key="fluctuateFlag"        showFormat="CHECKBOX" defaultValue="${(fluctuateFlag_defaultValue!)?string}" defaultDisplay="${(fluctuateFlag_displayDefaultType!)?string}" onchange="PrecessStandards_dg1487555065561Widget.evalCustomFunction(nRow,sFieldName,'fluctuateChange(nRow,sFieldName)')" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331497771')}" width=100 showFormatFunc=""  />
							<#assign flucUpperLimit_displayDefaultType=''>
								<#assign flucUpperLimit_defaultValue=''>
										<#assign flucUpperLimit_defaultValue=''>
										 
										
										
										
										
										
 
									<@datacolumn key="flucUpperLimit"        showFormat="TEXT" defaultValue="${(flucUpperLimit_defaultValue!)?string}" defaultDisplay="${(flucUpperLimit_displayDefaultType!)?string}" onchange="PrecessStandards_dg1487555065561Widget.evalCustomFunction(nRow,sFieldName,'UpperLimitChange(nRow,sFieldName)')" decimal="2" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331533263')}" width=100 showFormatFunc=""  />
							<#assign flucLowerLimit_displayDefaultType=''>
								<#assign flucLowerLimit_defaultValue=''>
										<#assign flucLowerLimit_defaultValue=''>
										 
										
										
										
										
										
 
									<@datacolumn key="flucLowerLimit"        showFormat="TEXT" defaultValue="${(flucLowerLimit_defaultValue!)?string}" defaultDisplay="${(flucLowerLimit_displayDefaultType!)?string}" onchange="PrecessStandards_dg1487555065561Widget.evalCustomFunction(nRow,sFieldName,'rowLimitChange()')" decimal="2" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331551106')}" width=100 showFormatFunc=""  />
							<#assign activeId_id_displayDefaultType=''>
								<#assign activeId_id_defaultValue=''>
										<#assign activeId_id_defaultValue=''>
																	<#if (activeId_id_defaultValue!)?string=="currentUser">
								<#assign activeId_id_defaultValue='${staffJson!}'>
							<#elseif (activeId_id_defaultValue!)?string=="currentPost">
								<#assign activeId_id_defaultValue='${postJson!}'>
							<#elseif (activeId_id_defaultValue!)?string=="currentDepart">
								<#assign activeId_id_defaultValue='${deptJson!}'>
							<#elseif (activeId_id_defaultValue!)?string=="currentComp">
								<#assign activeId_id_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="activeId.id"        showFormat="SELECTCOMP" defaultValue="${(activeId_id_defaultValue!)?string}" defaultDisplay="${(activeId_id_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false     textalign="center" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.common.ID')}" width=100 showFormatFunc=""  />
							<#assign processId_id_displayDefaultType=''>
								<#assign processId_id_defaultValue=''>
										<#assign processId_id_defaultValue=''>
																	<#if (processId_id_defaultValue!)?string=="currentUser">
								<#assign processId_id_defaultValue='${staffJson!}'>
							<#elseif (processId_id_defaultValue!)?string=="currentPost">
								<#assign processId_id_defaultValue='${postJson!}'>
							<#elseif (processId_id_defaultValue!)?string=="currentDepart">
								<#assign processId_id_defaultValue='${deptJson!}'>
							<#elseif (processId_id_defaultValue!)?string=="currentComp">
								<#assign processId_id_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="processId.id"     isCount=true   showFormat="SELECTCOMP" defaultValue="${(processId_id_defaultValue!)?string}" defaultDisplay="${(processId_id_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false     textalign="center" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.common.ID2324')}" width=100 showFormatFunc=""  />
							<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formula_PrecessStandards", "RM_7.5.0.0_formula_processActiveEditdg1487555065561", "DATAGRID", "precessStandards")>
							<#-- 排布自定义字段 -->
							<#list customPropViewMappings as cpvm>
								<#assign cpvmColumnType = cpvm.property.type>
								<#assign cpvmKey = cpvm.propertyLayRec>
								<#assign cpvmType = cpvmColumnType?lower_case>
								
								<#assign cpEditable = true>
								<#if cpEditable && cpvmKey?index_of('.') gt -1>
									<#assign cpEditable = false>
								</#if>
								<#if cpvm.readonly!false>
									<#assign cpEditable = false>
								</#if>
								<#assign cpvmNotNull = false>
								<#if cpEditable && !(cpvm.nullable!true)>
									<#assign cpvmNotNull = true>
								</#if>
								<#assign cpDecimal = ''>
								<#if cpvm.property.type == 'DECIMAL'>
									<#assign cpDecimal = (cpvm.property.decimalNum!0)>
									<#if cpvm.precision??>
										<#assign cpDecimal =cpvm.precision!>
									</#if>
								</#if>
								<#assign cpvmWidth = 100>
								<#if cpvmColumnType == 'DATETIME'>
									<#assign cpvmWidth = 130>
								</#if>
								<#if cpvm.fieldType == 'TEXTAREA'>
									<#assign cpvmWidth = 200>
								</#if>
								
								<#if cpvmColumnType == 'TEXT'>
									<#assign cpvmType = 'textfield'>
								<#elseif cpvmColumnType == 'DATETIME' || cpvmColumnType == 'SYSTEMCODE' || cpvmColumnType == 'OBJECT'>
									<#assign cpvmType = cpvm.fieldType?lower_case>
								</#if>
								
								<#if cpvmColumnType == 'SYSTEMCODE'>
									<#assign cpvmSeniorSystemCode = false>
									<#if cpvm.property.seniorSystemCode?? && cpvm.property.seniorSystemCode>
										<#assign cpvmSeniorSystemCode = true>
									</#if>
									<#assign systemEntityCode = cpvm.property.fillcontentMap.fillContent>
									<#assign systemEntity = getSystemCode(systemEntityCode)>
									<#assign systemCodelistType = systemEntity.listType>
									<#if cpvm.property.multable?? && cpvm.property.multable && systemCodelistType?? && systemCodelistType == 'TREE'>
										<@systemCodeColumn width=cpvmWidth label="${getText('${cpvm.displayName}')}" code="${(cpvm.property.fillcontentMap.fillContent)!}" key=cpvmKey isCustom=true editable=cpEditable type=cpvmType notnull=cpvmNotNull seniorSystemCode=cpvmSeniorSystemCode isTree=true isMultTree=true systemEntityCode=systemEntityCode systemCodeUrl="/foundation/systemCode/multiCodeTree.action?systemEntityCode=${systemEntityCode}"/>
									<#elseif cpvm.property.multable?? && cpvm.property.multable>
										<@systemCodeColumn width=cpvmWidth label="${getText('${cpvm.displayName}')}" code="${(cpvm.property.fillcontentMap.fillContent)!}" key=cpvmKey isCustom=true editable=cpEditable type=cpvmType notnull=cpvmNotNull seniorSystemCode=cpvmSeniorSystemCode isMultable=true systemEntityCode=systemEntityCode systemCodeUrl="/foundation/systemCode/multiCodeList.action?systemEntityCode=${systemEntityCode}"/>
									<#elseif systemCodelistType?? && systemCodelistType == 'TREE'>
										<@systemCodeColumn width=cpvmWidth label="${getText('${cpvm.displayName}')}" code="${(cpvm.property.fillcontentMap.fillContent)!}" key=cpvmKey isCustom=true editable=cpEditable type=cpvmType notnull=cpvmNotNull seniorSystemCode=cpvmSeniorSystemCode isTree=true systemEntityCode=systemEntityCode systemCodeUrl="/foundation/systemCode/singleCodeTree.action?systemEntityCode=${systemEntityCode}"/>
									<#else>
										<@systemCodeColumn width=cpvmWidth label="${getText('${cpvm.displayName}')}" code="${(cpvm.property.fillcontentMap.fillContent)!}" key=cpvmKey isCustom=true editable=cpEditable type=cpvmType notnull=cpvmNotNull seniorSystemCode=cpvmSeniorSystemCode/>
									</#if>
								<#else>
									<#assign viewUrl = ''>
									<#assign viewTitle = ''>
									<#assign viewCode = ''>
									<#assign selectCompName = ''>
									<#assign isObjCustomProp = false>
									<#assign objCustomPropNames = ''>
									<#if cpvmColumnType == 'OBJECT'>
										<#if cpvm.refView??>
											<#assign viewUrl = (cpvm.refView.url)!''>
											<#assign viewTitle = (cpvm.refView.title)!''>
											<#assign viewCode = (cpvm.refView.code)!''>
											<#assign selectCompName = 'RM.formula.formulaProcess.processActiveEdit'>
										</#if>
										<#assign pkName = ''>
										<#assign mainDisplayName = ''>
										<#list cpvm.property.associatedProperty.model.properties as p>
											<#if !pkName?has_content && p.isPk?? && p.isPk>
												<#assign pkName = p.name>
											</#if>
											<#if !mainDisplayName?has_content && p.isMainDisplay?? && p.isMainDisplay>
												<#assign mainDisplayName = p.name>
											</#if>
										</#list>
										<#assign cpvmKey = cpvmKey + 'MainDisplay'>
										<#assign isObjCustomProp = true>
										<#assign objCustomPropNames = (mainDisplayName!'name') + ',' + (pkName!'id')> 
									</#if>
									
									<#if cpvm.align??>
										<#assign columnAlign = cpvm.align >						
									<#elseif (cpvm.property.type=='INTEGER' || cpvm.property.type=='DECIMAL')>
										<#assign columnAlign = 'right'>
									<#else>
										<#assign columnAlign = 'left' >
									</#if>
						
									<@datacolumn key=cpvmKey width=cpvmWidth showFormat="${cpvm.format!'TEXT'}" decimal="${cpDecimal}" editable=cpEditable type=cpvmType showType="${cpvm.fieldType}" notnull=cpvmNotNull callbackname="" selectCompName=selectCompName viewUrl="${viewUrl!}" viewCode="${viewCode!}" crossCompany=false viewTitle="${getText('${viewTitle!}')}" label="${getText('${cpvm.displayName}')}" isObjCustomProp=isObjCustomProp objCustomPropNames="${objCustomPropNames}" textalign="${columnAlign}" />
								</#if>
							</#list>
			
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
				function PrecessStandards_dg1487555065561_check_datagridvalid(){
					//
					var errorObj =PrecessStandards_dg1487555065561Widget._DT.testData();
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
				
				function savedg1487555065561DataGrid(){
					<#if  refId?? && (refId gt 0)>
					PrecessStandards_dg1487555065561Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('PrecessStandards_dg1487555065561Widget') > -1) {
						PrecessStandards_dg1487555065561Widget.setAllRowEdited();
					}
					var json = PrecessStandards_dg1487555065561Widget.parseEditedData();
					$('input[name="dg1487555065561ListJson"]').remove();
					$('input[name="dgLists[\'dg1487555065561\']"]').remove();
					$('input[name="dg1487555065561ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1487555065561\']">').val(json).appendTo($('#RM_formula_formulaProcess_processActiveEdit_form'));
					$('<input type="hidden" name="dg1487555065561ModelCode">').val('RM_7.5.0.0_formula_PrecessStandards').appendTo($('#RM_formula_formulaProcess_processActiveEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1487555065561ListJson">').val(json).appendTo($('#RM_formula_formulaProcess_processActiveEdit_form'));
				}
				function DT_PrecessStandards_dg1487555065561_deldatagrid(){
					var deleteRows = PrecessStandards_dg1487555065561Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','processId.id','activeId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1487555065561DeletedIds").length>0){
							$("#dg1487555065561DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1487555065561DeletedIds" name="dgDeletedIds[\'dg1487555065561\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_processActiveEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1487555065561DeletedIds['+CUI('input[name^="dg1487555065561DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_processActiveEdit_form'));
					});
					return deleteRows;
				}
				function DT_PrecessStandards_dg1487555065561_delTreeNodes(){
					var deleteRows = PrecessStandards_dg1487555065561Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','processId.id','activeId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1487555065561DeletedIds").length>0){
							$("#dg1487555065561DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1487555065561DeletedIds" name="dgDeletedIds[\'dg1487555065561\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_processActiveEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1487555065561DeletedIds['+CUI('input[name^="dg1487555065561DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_processActiveEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('RM_formula_formulaProcess_processActiveEdit_datagrids');
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
							if(datagrids[0][i] == 'PrecessStandards_dg1487555065561') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'PrecessStandards_dg1487555065561';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'PrecessStandards_dg1487555065561';
					}
					$('body').data('RM_formula_formulaProcess_processActiveEdit_datagrids', datagrids);
				});
				
				var PrecessStandards_dg1487555065561_importDialog = null;
				function PrecessStandards_dg1487555065561_showImportDialog(){
					try{
						if(PrecessStandards_dg1487555065561_importDialog!=null&&PrecessStandards_dg1487555065561_importDialog.isShow==1){
							return false;
						}
						var url = "/RM/formula/formulaProcess/initImport.action?datagridCode=RM_7.5.0.0_formula_processActiveEditdg1487555065561&tid=${id!}&datagridName=dg1487555065561";
							<#if canImportExcel>
								var buttonCode="RM_7.5.0.0_formula_processActiveEditdg1487555065561_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						PrecessStandards_dg1487555065561_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("PrecessStandards_dg1487555065561"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();PrecessStandards_dg1487555065561_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();PrecessStandards_dg1487555065561_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						PrecessStandards_dg1487555065561_importDialog.show();
					}catch(e){}
				}	
				
				function PrecessStandards_dg1487555065561_downLoadFile(){
					var url = "/RM/formula/formulaProcess/downLoad.action?datagridCode=RM_7.5.0.0_formula_processActiveEditdg1487555065561&templateRelatedModelCode=RM_7.5.0.0_formula_processActiveEditdg1487555065561&downloadType=template&fileName=dg1487555065561";
					window.open(url,"","");
				}
				function dg1487555065561RenderOverEvent(){
					$(".dg-bd-tr").click(function(){
	//选中行数
	var row=$(this).index();
	//选中行的统计超限
	var isCheck=PrecessStandards_dg1487555065561Widget.getCellValue(row,"overrunFlag");
//选中行的统计波动
    var fluctuateFlag=PrecessStandards_dg1487555065561Widget.getCellValue(row,"fluctuateFlag");
//如果统计超限为false则上下限上上限下下限以及扫描间隔都不能填
//alert(isCheck);
    if(isCheck==false){
	//扫描间隔
	    PrecessStandards_dg1487555065561Widget._DT.setCellProperty(row,'limitInter','readonly',true);
	//上限
	    PrecessStandards_dg1487555065561Widget._DT.setCellProperty(row,"upperLimit","readonly",true);
	//上上限
	    PrecessStandards_dg1487555065561Widget._DT.setCellProperty(row,"maxLimit","readonly",true);
	//下限
	    PrecessStandards_dg1487555065561Widget._DT.setCellProperty(row,"lowerLimit","readonly",true);
	//下下限
	    PrecessStandards_dg1487555065561Widget._DT.setCellProperty(row,"loweMxLimit","readonly",true);
    }
    if(isCheck==true){
	//扫描间隔
	    PrecessStandards_dg1487555065561Widget._DT.setCellProperty(row,'limitInter','readonly',false);
	//上限
	    PrecessStandards_dg1487555065561Widget._DT.setCellProperty(row,"upperLimit","readonly",false);
	//上上限
	    PrecessStandards_dg1487555065561Widget._DT.setCellProperty(row,"maxLimit","readonly",false);
	//下限
	    PrecessStandards_dg1487555065561Widget._DT.setCellProperty(row,"lowerLimit","readonly",false);
	//下下限
	    PrecessStandards_dg1487555065561Widget._DT.setCellProperty(row,"loweMxLimit","readonly",false);
    }
//统计波动为false
    if(fluctuateFlag==false){
	
	//波动上限只读
	    PrecessStandards_dg1487555065561Widget._DT.setCellProperty(row,"flucUpperLimit","readonly",true);
	//波动下限只读
	    PrecessStandards_dg1487555065561Widget._DT.setCellProperty(row,"flucLowerLimit","readonly",true);
    }
    if(fluctuateFlag==true){
	//波动上限可填
	    PrecessStandards_dg1487555065561Widget._DT.setCellProperty(row,"flucUpperLimit","readonly","fasle");
	//波动下限可填
	    PrecessStandards_dg1487555065561Widget._DT.setCellProperty(row,"flucLowerLimit","readonly",false);
    }
})
//选中的行
var selectRow=FormulaProcessActive_dg1487554913298Widget.getSelectedRow();
if(selectRow!=undefined){
		var activeType=FormulaProcessActive_dg1487554913298Widget.getCellValue(selectRow,'isWatchActive');
		//如果监视工艺为是显示増行删行
		if(activeType==true){
				$('#PrecessStandards_dg1487555065561 a:eq(0) span').show();
				$('#PrecessStandards_dg1487555065561 a:eq(1) span').show();
		}else{
				$('#PrecessStandards_dg1487555065561 a:eq(0) span').hide();
				$('#PrecessStandards_dg1487555065561 a:eq(1) span').hide();
		}

}else{
  $('#PrecessStandards_dg1487555065561 a:eq(0) span').hide();
				$('#PrecessStandards_dg1487555065561 a:eq(1) span').hide();
}

$("#FormulaProcessActive_dg1487554913298 .paginatorbar-operatebar span:eq(0)").attr('class','buttonbar-button cui-btn-gdtpl');
$("#FormulaProcessActive_dg1487554913298 .paginatorbar-operatebar span:eq(1)").attr('class','buttonbar-button cui-btn-sgtpl');
$("#FormulaProcessActive_dg1487554913298 .paginatorbar-operatebar span:eq(2)").attr('class','buttonbar-button cui-btn-hdsz');
				}
				function dg1487555065561PageInitMethod(nTabIndex){
					RM.formula.formulaProcess.processActiveEdit.initSize(nTabIndex);
					var heigh = $(window).height();
PrecessStandards_dg1487555065561Widget._DT.setHeight( heigh*0.2 );
				}
			</script>
			
			
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
     	
		<div id="RM_formula_formulaProcess_processActiveEdit_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<#if !(superEdit!false)>
				<li id="flowHead" onclick="RM.formula.formulaProcess.processActiveEdit.showFlowInfo('flow')"><span class="icon_prograss"></span>${getText("ec.flow.flowImage")}</li>
				</#if>
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="RM.formula.formulaProcess.processActiveEdit.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
				<li id="dealInfoHead" class="bar" onclick="RM.formula.formulaProcess.processActiveEdit.showDealInfo('dealInfo')"><span class="icon_handle"></span>${getText("ec.view.dealadvice")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<#if !(superEdit!false)>
				<div class="flow-height wid" id="flowDiv"></div>
				</#if>
				<div id="fileUploadDiv" class="wid-hei"></div>
				<div style="padding:1px 0px 0px 0px;" id="dealInfoDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_processActiveEdit,html,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) -->
<!-- 自定义代码 -->
<style type="text/css">
	.cui-btn-putin {
    	background: url('/bap/static/RM/img/icon_jxtl.png') no-repeat;
	}
    .cui-btn-inspect {
    	background: url('/bap/static/RM/img/icon_fqqj.png') no-repeat;
	}
	.cui-btn-taskReport {
    	background: url('/bap/static/RM/img/icon_jxbg.png') no-repeat;
	}
	.cui-btn-cdsz {
    	background: url('/bap/static/RM/img/icon_cdsz.png') no-repeat;
	}
	.cui-btn-copy {
    	background: url('/bap/static/RM/img/icon_copy.png') no-repeat;
	}
	.cui-btn-end {
    	background: url('/bap/static/RM/img/icon_end.png') no-repeat;
	}
	.cui-btn-gdtpl {
    	background: url('/bap/static/RM/img/icon_gdtpl.png') no-repeat;
	}
	.cui-btn-hdsz {
    	background: url('/bap/static/RM/img/icon_hdsz.png') no-repeat;
	}
	.cui-btn-jxps {
    	background: url('/bap/static/RM/img/icon_jxps.png') no-repeat;
	}
	.cui-btn-plwc {
    	background: url('/bap/static/RM/img/icon_plwc.png') no-repeat;
	}
	.cui-btn-print {
    	background: url('/bap/static/RM/img/icon_print.png') no-repeat;
	}
	.cui-btn-sgtpl {
    	background: url('/bap/static/RM/img/icon_sgtpl.png') no-repeat;
	}
	.cui-btn-wlszyck {
    	background: url('/bap/static/RM/img/icon_wlszyck.png') no-repeat;
	}
	.cui-btn-xtdbd {
    	background: url('/bap/static/RM/img/icon_xtdbd.png') no-repeat;
	}
	.cui-btn-zdsc {
    	background: url('/bap/static/RM/img/icon_zdsc.png') no-repeat;
	}
	.cui-btn-disable{
		background: url('/bap/struts/css/buttons.png') no-repeat 0px -49px;
	}

</style>
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
						$("#RM_formula_formulaProcess_processActiveEdit_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#RM_formula_formulaProcess_processActiveEdit_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#RM_formula_formulaProcess_processActiveEdit_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#RM_formula_formulaProcess_processActiveEdit_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			RM.formula.formulaProcess.processActiveEdit.initCount = 0;
			RM.formula.formulaProcess.processActiveEdit.initSize = function(nTabIndex){
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
				var conHeight = h-$("#RM_formula_formulaProcess_processActiveEdit_main_div .edit-head").height()-$("#RM_formula_formulaProcess_processActiveEdit_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#RM_formula_formulaProcess_processActiveEdit_main_div .edit-workflow").height()</#if>;
				$("#RM_formula_formulaProcess_processActiveEdit_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('RM_formula_formulaProcess_processActiveEdit_datagrids');
				var padding_bottom=16;
				$("#RM_formula_formulaProcess_processActiveEdit_main_div .pd_bottom,#RM_formula_formulaProcess_processActiveEdit_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#RM_formula_formulaProcess_processActiveEdit_main_div .edit-panes-s").each(function(index){
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
									if(RM.formula.formulaProcess.processActiveEdit.initCount <= 2) {
										setTimeout(function(){RM.formula.formulaProcess.processActiveEdit.initSize();}, 200);
										RM.formula.formulaProcess.processActiveEdit.initCount++;
									}/* else {
										RM.formula.formulaProcess.processActiveEdit.initCount = 0;
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
							if(($("#RM_formula_formulaProcess_processActiveEdit_main_div .edit-workflow").length > 0) && ($("#RM_formula_formulaProcess_processActiveEdit_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				$('#RM_formula_formulaProcess_processActiveEdit_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				RM.formula.formulaProcess.processActiveEdit.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				RM.formula.formulaProcess.processActiveEdit.initSize();
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
						if(parseInt($("#RM_formula_formulaProcess_processActiveEdit_main_div").css("width"),10)==650){
							$("#RM_formula_formulaProcess_processActiveEdit_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//RM.formula.formulaProcess.processActiveEdit.resizeLayout();
						//RM.formula.formulaProcess.processActiveEdit.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#RM_formula_formulaProcess_processActiveEdit_main_div").css("width"),10)==800){
							$("#RM_formula_formulaProcess_processActiveEdit_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//RM.formula.formulaProcess.processActiveEdit.resizeLayout();
						//RM.formula.formulaProcess.processActiveEdit.initSize();
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
					RM.formula.formulaProcess.processActiveEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					RM.formula.formulaProcess.processActiveEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){RM.formula.formulaProcess.processActiveEdit.initSize();});
				/*
				RM.formula.formulaProcess.processActiveEdit.resizeLayout=function(){
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
			RM.formula.formulaProcess.processActiveEdit.setDepartment();
			<#else>
			CUI("#dealInfoContain").load("/ec/workflow/dealInfo.action?dlTableInfoId=${formulaProcess.tableInfoId!}&dealInfoGroup=byTime&preName=mainFrame&dealDataUrl=/RM/formula/formulaProcess/dealInfo-list.action&enableSimpleDealInfo=false");
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

		RM.formula.formulaProcess.processActiveEdit.validate = function(){
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
		RM.formula.formulaProcess.processActiveEdit.beforeSaveProcess = function(){
			try{eval("savedg1487555065561DataGrid()");}catch(e){}
			try{eval("savedg1487554913298DataGrid()");}catch(e){}

			var extraCol = '<extra-data>';
			$('#RM_formula_formulaProcess_processActiveEdit_form').trigger('beforeSubmit');
			//formulaProcess.extraCol
			$('*[name^="_complex_"]').each(function(index, item){
				if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
					if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
					var itemValue = CUI(item).val();
					extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
				}
			});
			extraCol += '</extra-data>';
			$('input[name="formulaProcess.extraCol"]').val(extraCol);
		}
		RM.formula.formulaProcess.processActiveEdit.processDataGrid = function(){
										<#if false && isIE>
										$('#RM_formula_formulaProcess_processActiveEdit_form').append(FormulaProcessActive_dg1487554913298Widget._DT.createInputs('dg1487554913298List'));
										</#if>
										<#if false && isIE>
										$('#RM_formula_formulaProcess_processActiveEdit_form').append(PrecessStandards_dg1487555065561Widget._DT.createInputs('dg1487555065561List'));
										</#if>
		};
		RM.formula.formulaProcess.processActiveEdit.save = function(){
			<#if !(superEdit!false)>
			$('#operateType').val("save");
			<#else>
			$('#operateType').val("submit");
			</#if>
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!RM.formula.formulaProcess.processActiveEdit.validate()){return;}
			//延迟到延迟提交中处理,解决onchange事件无法触发问题
			//RM.formula.formulaProcess.processActiveEdit.beforeSaveProcess();

			//RM.formula.formulaProcess.processActiveEdit.processDataGrid();
			$('#RM_formula_formulaProcess_processActiveEdit_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('RM_formula_formulaProcess_processActiveEdit_form','RM_formula_formulaProcess_processActiveEdit_datagrids')) {      
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
		RM.formula.formulaProcess.processActiveEdit.print = function(){
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
		
		RM.formula.formulaProcess.processActiveEdit.saveSetting = function(){
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
		
		RM.formula.formulaProcess.processActiveEdit.printSetting = function(){
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
				RM.formula.formulaProcess.processActiveEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(RM.formula.formulaProcess.processActiveEdit.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				RM.formula.formulaProcess.processActiveEdit.settingDialog.show();
			}
		}
		
		
		
		RM.formula.formulaProcess.processActiveEdit.reject = function(){
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
			RM.formula.formulaProcess.processActiveEdit.submit();
		}
		
		RM.formula.formulaProcess.processActiveEdit.submit = function(uncheck){
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
			if(!RM.formula.formulaProcess.processActiveEdit.validate()){return;}
			
			//$('#__workflow_outcomeDes').val($('input[name="workFlowVar.outcome"]:checked').attr('des'));
			
			RM.formula.formulaProcess.processActiveEdit.beforeSaveProcess();
			
			//RM.formula.formulaProcess.processActiveEdit.processDataGrid();
			
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
			$('#RM_formula_formulaProcess_processActiveEdit_form').submit();
			//$(".wfcancel").remove();
			
		}
		RM.formula.formulaProcess.processActiveEdit.recall = function(){
			CUI.Dialog.confirm("${getText('ec.recall.checkrecall')}", function(){
					$.ajax({
					url : "/RM/formula/formulaProcess/common/recall.action",
					type : 'post',
					async : false,
					data:{"tableInfoId": "${(formulaProcess.tableInfoId)?default('')}"},
					success : function(msg) {
						if(msg && msg.success){
							workbenchErrorBarWidget.showMessage("${getText('ec.recall.success')}", 's');
		 					var url = "/foundation/user/open-pending.action?pendingId=" + msg.data.id + "&tableInfoId=${(formulaProcess.tableInfoId)?default('')}&id=${(formulaProcess.id)?default('')}&entityCode=RM_7.5.0.0_formula";

			 				try{
								window.opener.refreshPortal('workflow');
								window.opener.timeData();
							}catch(e){
								try{
			 						window.opener.RM.formula.formulaProcess.editCallBackInfo(res); 						
								}catch(e2){
									try{
										<#if calltype??&&calltype=='ref'>
										window.opener.RM.formula.formulaProcess.callBackInfo(res);
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
		RM.formula.formulaProcess.processActiveEdit._callBackInfo = function(res){
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
 						window.opener.RM.formula.formulaProcess.editCallBackInfo(res); 						
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
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.RM.formula.formulaProcess.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
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
		RM.formula.formulaProcess.processActiveEdit.setDepartment = function(){
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
				RM.formula.formulaProcess.processActiveEdit._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				RM.formula.formulaProcess.processActiveEdit._isObjCustomProp_IE = isObjCustomProp;
			} else {
				RM.formula.formulaProcess.processActiveEdit._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				RM.formula.formulaProcess.processActiveEdit._objCustomPropNames_IE = objCustomPropNames;
			} else {
				RM.formula.formulaProcess.processActiveEdit._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				RM.formula.formulaProcess.processActiveEdit._refViewCode_IE = viewCode;
			} else {
				RM.formula.formulaProcess.processActiveEdit._refViewCode_IE = '';
			}
			RM.formula.formulaProcess.processActiveEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		RM.formula.formulaProcess.processActiveEdit.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			RM.formula.formulaProcess.processActiveEdit._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			RM.formula.formulaProcess.processActiveEdit._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			RM.formula.formulaProcess.processActiveEdit.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			RM.formula.formulaProcess.processActiveEdit._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				RM.formula.formulaProcess.processActiveEdit._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		RM.formula.formulaProcess.processActiveEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(RM.formula.formulaProcess.processActiveEdit._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(RM.formula.formulaProcess.processActiveEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				RM.formula.formulaProcess.processActiveEdit.gridEventObj = gridEventObj;
				callbackName = "RM.formula.formulaProcess.processActiveEdit.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "RM.formula.formulaProcess.processActiveEdit.getMultiselectCallBackInfo_DG" : "RM.formula.formulaProcess.processActiveEdit.getcallBackInfo_DG";
				RM.formula.formulaProcess.processActiveEdit._currRow = $(obj).closest('tr')[0];
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="RM.formula.formulaProcess.processActiveEdit.getcallBackInfo";
			}

			if(_prefix!=''){
				RM.formula.formulaProcess.processActiveEdit._prefix = _prefix.substring(1);
			}
			
			RM.formula.formulaProcess.processActiveEdit._oGrid = oGrid;
			RM.formula.formulaProcess.processActiveEdit._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					RM.formula.formulaProcess.processActiveEdit._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					RM.formula.formulaProcess.processActiveEdit._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					RM.formula.formulaProcess.processActiveEdit._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					RM.formula.formulaProcess.processActiveEdit._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					RM.formula.formulaProcess.processActiveEdit._refViewCode = oColumn.viewCode;
				} else {
					RM.formula.formulaProcess.processActiveEdit._refViewCode = '';
				}
			} else {
				RM.formula.formulaProcess.processActiveEdit._isObjCustomProp = false;
				RM.formula.formulaProcess.processActiveEdit._objCustomPropNames = '';
				RM.formula.formulaProcess.processActiveEdit._refViewCode = '';
			}
			if (RM.formula.formulaProcess.processActiveEdit._isObjCustomProp == true && RM.formula.formulaProcess.processActiveEdit._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				RM.formula.formulaProcess.processActiveEdit._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				RM.formula.formulaProcess.processActiveEdit._customCallBack = customCallBack;
			}
			if(RM.formula.formulaProcess.processActiveEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(RM.formula.formulaProcess.processActiveEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof RM.formula.formulaProcess.processActiveEdit._querycustomFuncN == "function") {
				refparam += RM.formula.formulaProcess.processActiveEdit._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			RM.formula.formulaProcess.processActiveEdit._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		RM.formula.formulaProcess.processActiveEdit._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(RM.formula.formulaProcess.processActiveEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(RM.formula.formulaProcess.processActiveEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			RM.formula.formulaProcess.processActiveEdit._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'RM.formula.formulaProcess.processActiveEdit.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		RM.formula.formulaProcess.processActiveEdit._querycustomFunc = function(obj) {
			var str = eval("typeof(RM.formula.formulaProcess.processActiveEdit.query_"+obj+")!='undefined'") ? eval('RM.formula.formulaProcess.processActiveEdit.query_'+obj+'()') : null;
			return str;
		};
		RM.formula.formulaProcess.processActiveEdit.getcallBackGroupInfo = function(obj){
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
			RM.formula.formulaProcess.processActiveEdit._dialog.close();
		}
		RM.formula.formulaProcess.processActiveEdit.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('RM_formula_formulaProcess_processActiveEdit_form',obj[0], RM.formula.formulaProcess.processActiveEdit._prefix, RM.formula.formulaProcess.processActiveEdit._sUrl);
			CUI.commonFills('RM_formula_formulaProcess_processActiveEdit_form',RM.formula.formulaProcess.processActiveEdit._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (RM.formula.formulaProcess.processActiveEdit._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(RM.formula.formulaProcess.processActiveEdit._customCallBack) {
					eval(RM.formula.formulaProcess.processActiveEdit._customCallBack);
					RM.formula.formulaProcess.processActiveEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.formula.formulaProcess.processActiveEdit._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		RM.formula.formulaProcess.processActiveEdit.getcallBackInfo_DG_IE = function(obj){
			if(RM.formula.formulaProcess.processActiveEdit._customBeforeCallBack) {
				var flag = eval(RM.formula.formulaProcess.processActiveEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = RM.formula.formulaProcess.processActiveEdit.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( RM.formula.formulaProcess.processActiveEdit._isObjCustomProp_IE == true && RM.formula.formulaProcess.processActiveEdit._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,RM.formula.formulaProcess.processActiveEdit._sUrl,RM.formula.formulaProcess.processActiveEdit._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,RM.formula.formulaProcess.processActiveEdit._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (RM.formula.formulaProcess.processActiveEdit._isObjCustomProp_IE == true && RM.formula.formulaProcess.processActiveEdit._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = RM.formula.formulaProcess.processActiveEdit._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = RM.formula.formulaProcess.processActiveEdit._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && RM.formula.formulaProcess.processActiveEdit._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + RM.formula.formulaProcess.processActiveEdit._refViewCode_IE + '&id=' + id,
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
				if(RM.formula.formulaProcess.processActiveEdit._customCallBack) {
					eval(RM.formula.formulaProcess.processActiveEdit._customCallBack);
					RM.formula.formulaProcess.processActiveEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.formula.formulaProcess.processActiveEdit._dialog.close();
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
		
		RM.formula.formulaProcess.processActiveEdit.getcallBackInfo_DG = function(obj){
			if(RM.formula.formulaProcess.processActiveEdit._customBeforeCallBack) {
				var flag = eval(RM.formula.formulaProcess.processActiveEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(RM.formula.formulaProcess.processActiveEdit._currRow).next().length==0){
						RM.formula.formulaProcess.processActiveEdit._oGrid.addNewRow();
					}	
					RM.formula.formulaProcess.processActiveEdit._currRow = $(RM.formula.formulaProcess.processActiveEdit._currRow).next();
					$(RM.formula.formulaProcess.processActiveEdit._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(RM.formula.formulaProcess.processActiveEdit._currRow,obj[i], RM.formula.formulaProcess.processActiveEdit._prefix, RM.formula.formulaProcess.processActiveEdit._sUrl);
				if (RM.formula.formulaProcess.processActiveEdit._isObjCustomProp == true && RM.formula.formulaProcess.processActiveEdit._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(RM.formula.formulaProcess.processActiveEdit._currRow,RM.formula.formulaProcess.processActiveEdit._prefix,obj[i],RM.formula.formulaProcess.processActiveEdit._oGrid,RM.formula.formulaProcess.processActiveEdit._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(RM.formula.formulaProcess.processActiveEdit._currRow,RM.formula.formulaProcess.processActiveEdit._prefix,obj[i],RM.formula.formulaProcess.processActiveEdit._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + RM.formula.formulaProcess.processActiveEdit._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + RM.formula.formulaProcess.processActiveEdit._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && RM.formula.formulaProcess.processActiveEdit._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + RM.formula.formulaProcess.processActiveEdit._refViewCode + '&id=' + id,
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
									name = RM.formula.formulaProcess.processActiveEdit._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(RM.formula.formulaProcess.processActiveEdit._currRow, objs, RM.formula.formulaProcess.processActiveEdit._oGrid);
							}
						}
					}
				}
			}
			try{
				if(RM.formula.formulaProcess.processActiveEdit._customCallBack) {
					eval(RM.formula.formulaProcess.processActiveEdit._customCallBack);
					RM.formula.formulaProcess.processActiveEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.formula.formulaProcess.processActiveEdit._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + RM.formula.formulaProcess.processActiveEdit._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		RM.formula.formulaProcess.processActiveEdit.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(RM.formula.formulaProcess.processActiveEdit._oGrid, RM.formula.formulaProcess.processActiveEdit._currRow, RM.formula.formulaProcess.processActiveEdit._key, RM.formula.formulaProcess.processActiveEdit._displayFieldName, obj[i])
			}
			try{
				if(RM.formula.formulaProcess.processActiveEdit._customCallBack) {
					eval(RM.formula.formulaProcess.processActiveEdit._customCallBack);
					RM.formula.formulaProcess.processActiveEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.formula.formulaProcess.processActiveEdit._dialog.close();
			} catch(e){}
		};
		
		RM.formula.formulaProcess.processActiveEdit.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						RM.formula.formulaProcess.processActiveEdit.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#RM_formula_formulaProcess_processActiveEdit_form'));
						}
					}
				}
			});
		};

		$(function(){
			RM.formula.formulaProcess.processActiveEdit.onloadForProduct();
			//隐藏流程图
$("#fr_flow").css("display","none");
//隐藏处理信息
$("#fr_dealInfo").css("display","none");
//隐藏提交按钮
$('#edit-submit-btn').hide();
//隐藏底部的保存、提交、填写意见
$('.edit-workflow').hide();
$('input[name="formulaProcess.formId"]').val(${id});
$($("#RM_formula_formulaProcess_processActiveEdit").children().children(".edit-panes.edit-panes-w.edit-container.clearfix").children(".cui-elements.pd-top.mix-content").children()).css("display","none");
$('#PrecessStandards_dg1487555065561').hide();
		});

		RM.formula.formulaProcess.processActiveEdit.beforeSubmitMethodSettingInPage = function(){
			RM.formula.formulaProcess.processActiveEdit.onsaveForProduct();
			var height=PrecessStandards_dg1487555065561Widget.getRowLength();
var quotaError='';
var stValueError='';
if(height>0){
	for(var i =0;i<height;i++){
		var quota=PrecessStandards_dg1487555065561Widget.getCellValue(i,'quota');//指标
		var stValue=PrecessStandards_dg1487555065561Widget.getCellValue(i,'stValue');//标准值
		if(quota=="" || quota ==null ||quota ==undefined){
			quotaError+=(i+1)+'、';
		}
		if(stValue=="" ||stValue==null || stValue==undefined){
			stValueError+=(i+1)+'、';
		}
	}
	if(quotaError!=''){
		workbenchErrorBarWidget.showMessage("${getText('RM.entityname.randon1487075671473001','"+quotaError.substring(0,quotaError.length-1)+"')}");
		return false;
	}
	if(stValueError!=''){
		workbenchErrorBarWidget.showMessage("${getText('RM.entityname.randon1487075671473002','"+stValueError.substring(0,stValueError.length-1)+"')}");
		return false;
	}
}
		};
		RM.formula.formulaProcess.processActiveEdit.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  RM.formula.formulaProcess.processActiveEdit.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		RM.formula.formulaProcess.processActiveEdit.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#RM_formula_formulaProcess_processActiveEdit_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#RM_formula_formulaProcess_processActiveEdit_main_div").hide();
				},100);
				//CUI("#RM_formula_formulaProcess_processActiveEdit_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		RM.formula.formulaProcess.processActiveEdit.showThis = function(){
			if(!CUI("#RM_formula_formulaProcess_processActiveEdit_main_div").is(':visible')) {
				CUI("#RM_formula_formulaProcess_processActiveEdit_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		RM.formula.formulaProcess.processActiveEdit.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			RM.formula.formulaProcess.processActiveEdit.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "RM_formula_formulaProcess_processActiveEdit_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=RM&modelName=RM_7.5.0.0_formula_FormulaProcess&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			RM.formula.formulaProcess.processActiveEdit.auditDialog.show();
			</#if>
		}
		
		
		RM.formula.formulaProcess.processActiveEdit.showInfoDialog=function(mode){
			
			RM.formula.formulaProcess.processActiveEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "RM_formula_formulaProcess_processActiveEdit_dealInfo",
				modal:true,
				height:500,
				width: 950,//适应国际化版
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			RM.formula.formulaProcess.processActiveEdit.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		RM.formula.formulaProcess.processActiveEdit.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=RM_7.5.0.0_formula");
			}
		}
		
		RM.formula.formulaProcess.processActiveEdit.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/RM/formula/formulaProcess/dealInfo-list.action&dlTableInfoId=${(formulaProcess.tableInfoId)?default('')}");
			}
		}
		RM.formula.formulaProcess.processActiveEdit.showFlowInfo=function(){
		     //IE8环境下使用旧版flash流程展现页面，其他情况使用html5流程展现页面
		    var browser=navigator.appName; 
			var b_version=navigator.appVersion; 
			var version=b_version.split(";"); 
			var trim_Version=version[1]&&version[1].replace(/[ ]/g,"");
			var isIE8=(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE8.0")||($.browser.msie&&(Number($.browser.version)<= 8));//IE8兼容视图模式下浏览器版本判断逻辑补充
			if(CUI.trim(CUI("#flowDiv").html())==""){
				if(isIE8){
				    CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=RM_7.5.0.0_formula_FormulaProcess&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(formulaProcess.tableInfoId)?default('')}");
				}else{
				    CUI("#flowDiv").load("/ec/workflow/flowViewH5.action?env=runtime&modelCode=RM_7.5.0.0_formula_FormulaProcess&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(formulaProcess.tableInfoId)?default('')}");
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
		RM.formula.formulaProcess.processActiveEdit.supervision=function(){
			RM.formula.formulaProcess.processActiveEdit.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(formulaProcess.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				RM.formula.formulaProcess.processActiveEdit.modifyOwnerStaffDialog.show();
		}
		




function overRunFlag(nRow,sFieldName){
		var selectRow=nRow;
		var overFlag=PrecessStandards_dg1487555065561Widget.getCellValue(selectRow,"overrunFlag");
		if(overFlag=='true'){
				//扫描间隔、上限、上上限、下限、下下限可填
					PrecessStandards_dg1487555065561Widget._DT.setCellProperty(selectRow,'limitInter','readonly',false);
					PrecessStandards_dg1487555065561Widget._DT.setCellProperty(selectRow,'upperLimit','readonly',false);
						PrecessStandards_dg1487555065561Widget._DT.setCellProperty(selectRow,'lowerLimit','readonly',false);
					PrecessStandards_dg1487555065561Widget._DT.setCellProperty(selectRow,'maxLimit','readonly',false);
						PrecessStandards_dg1487555065561Widget._DT.setCellProperty(selectRow,'loweMxLimit','readonly',false);
		}else{
					//扫描间隔、上限、上上限、下限、下下限不可填，且值为空
					PrecessStandards_dg1487555065561Widget._DT.setCellProperty(selectRow,'limitInter','readonly',true);
					PrecessStandards_dg1487555065561Widget._DT.setCellProperty(selectRow,'upperLimit','readonly',true);
						PrecessStandards_dg1487555065561Widget._DT.setCellProperty(selectRow,'lowerLimit','readonly',true);
					PrecessStandards_dg1487555065561Widget._DT.setCellProperty(selectRow,'maxLimit','readonly',true);
						PrecessStandards_dg1487555065561Widget._DT.setCellProperty(selectRow,'loweMxLimit','readonly',true);
					PrecessStandards_dg1487555065561Widget.setCellValue(selectRow,"limitInter","");
					PrecessStandards_dg1487555065561Widget.setCellValue(selectRow,"upperLimit","");
					PrecessStandards_dg1487555065561Widget.setCellValue(selectRow,"lowerLimit","");
					PrecessStandards_dg1487555065561Widget.setCellValue(selectRow,"maxLimit","");
					PrecessStandards_dg1487555065561Widget.setCellValue(selectRow,"loweMxLimit","");
		}
}
function upChange(){
	var row=PrecessStandards_dg1487555065561Widget.getSelectedRow();
    var upper=Number(PrecessStandards_dg1487555065561Widget.getCellValue(row,"upperLimit"));
    var max=Number(PrecessStandards_dg1487555065561Widget.getCellValue(row,"maxLimit"));
    var lower=Number(PrecessStandards_dg1487555065561Widget.getCellValue(row,"lowerLimit"));
    var min=Number(PrecessStandards_dg1487555065561Widget.getCellValue(row,"loweMxLimit"));
	if(max!="" || lower!="" || min!=""){
	    if(upper>max){
	        workbenchErrorBarWidget.showMessage("${getText('RM.formula.randon11111112')}");
	        PrecessStandards_dg1487555065561Widget.setCellValue(row,"upperLimit","");
        }
	    if(lower>upper || min>upper){
		    workbenchErrorBarWidget.showMessage("${getText('RM.formula.randon11111113')}");
	        PrecessStandards_dg1487555065561Widget.setCellValue(row,"upperLimit","");
	   }
    }
}
function maxChange(){
	var row=PrecessStandards_dg1487555065561Widget.getSelectedRow();
    var upper=Number(PrecessStandards_dg1487555065561Widget.getCellValue(row,"upperLimit"));
    var max=Number(PrecessStandards_dg1487555065561Widget.getCellValue(row,"maxLimit"));
    var lower=Number(PrecessStandards_dg1487555065561Widget.getCellValue(row,"lowerLimit"));
    var min=Number(PrecessStandards_dg1487555065561Widget.getCellValue(row,"loweMxLimit"));
	//alert(upper);//alert(max);
	if(upper!="" || lower!="" || min!=""){
	    if((max<upper) || (max<lower) || (max<min)){
			//alert(1);
		    workbenchErrorBarWidget.showMessage("${getText('RM.formula.randon11111111')}");
		    PrecessStandards_dg1487555065561Widget.setCellValue(row,"maxLimit","");
	    }
    }
}
function lowChange(){
	var row=PrecessStandards_dg1487555065561Widget.getSelectedRow();
    var upper=Number(PrecessStandards_dg1487555065561Widget.getCellValue(row,"upperLimit"));
    var mix=Number(PrecessStandards_dg1487555065561Widget.getCellValue(row,"maxLimit"));
    var lower=Number(PrecessStandards_dg1487555065561Widget.getCellValue(row,"lowerLimit"));
    var min=Number(PrecessStandards_dg1487555065561Widget.getCellValue(row,"loweMxLimit"));
	if(upper!="" || mix!="" || min!=""){
	    if((lower>upper) || (lower>mix)){
		    workbenchErrorBarWidget.showMessage("${getText('RM.formula.randon11111114')}");
		    PrecessStandards_dg1487555065561Widget.setCellValue(row,"lowerLimit","");
	    }
	    if(lower<min){
		    workbenchErrorBarWidget.showMessage("${getText('RM.formula.randon11111116')}");
		    PrecessStandards_dg1487555065561Widget.setCellValue(row,"lowerLimit","");
	    }
    }
}
function minChange(){
	var row=PrecessStandards_dg1487555065561Widget.getSelectedRow();
    var upper=Number(PrecessStandards_dg1487555065561Widget.getCellValue(row,"upperLimit"));
    var mix=Number(PrecessStandards_dg1487555065561Widget.getCellValue(row,"maxLimit"));
    var lower=Number(PrecessStandards_dg1487555065561Widget.getCellValue(row,"lowerLimit"));
    var min=Number(PrecessStandards_dg1487555065561Widget.getCellValue(row,"loweMxLimit"));
    if(upper!="" || mix!="" || lower!=""){
	    if((min>upper) || (min>mix) || (min>lower)){
		    workbenchErrorBarWidget.showMessage("${getText('RM.formula.randon11111115')}");
		    PrecessStandards_dg1487555065561Widget.setCellValue(row,"loweMxLimit","");
	    }
    }
}
function fluctuateChange(nRow,sFieldName){
		var selectRow=nRow;
		var fluctFlag=PrecessStandards_dg1487555065561Widget.getCellValue(selectRow,"fluctuateFlag");
		if(fluctFlag=='true'){
				//波动上限、波动下限可填
					PrecessStandards_dg1487555065561Widget._DT.setCellProperty(selectRow,'flucUpperLimit','readonly',false);
					PrecessStandards_dg1487555065561Widget._DT.setCellProperty(selectRow,'flucLowerLimit','readonly',false);
		}else{
					//波动上限、波动下限不可填
					PrecessStandards_dg1487555065561Widget._DT.setCellProperty(selectRow,'flucUpperLimit','readonly',true);
					PrecessStandards_dg1487555065561Widget._DT.setCellProperty(selectRow,'flucLowerLimit','readonly',true);
					PrecessStandards_dg1487555065561Widget.setCellValue(selectRow,"flucUpperLimit","");
					PrecessStandards_dg1487555065561Widget.setCellValue(selectRow,"flucLowerLimit","");
		}
}
function UpperLimitChange(nRow,sFieldName){
	var row=nRow;
    var upperLimit=PrecessStandards_dg1487555065561Widget.getCellValue(row,"flucUpperLimit");
    var mixLimit=PrecessStandards_dg1487555065561Widget.getCellValue(row,"flucLowerLimit");
  
	if(mixLimit!="" && mixLimit!=undefined &&  upperLimit!="" && upperLimit!=undefined){
	    if(Number(mixLimit)>Number(upperLimit)){
	        workbenchErrorBarWidget.showMessage("${getText('RM.formula.randon12342342')}");
	        PrecessStandards_dg1487555065561Widget.setCellValue(row,"flucUpperLimit","");
        }
	   
    }
}
function rowLimitChange(){
	var row=PrecessStandards_dg1487555065561Widget.getSelectedRow();
    var upperLimit=PrecessStandards_dg1487555065561Widget.getCellValue(row,"flucUpperLimit");
    var mixLimit=PrecessStandards_dg1487555065561Widget.getCellValue(row,"flucLowerLimit");
  
	if(upperLimit!="" && upperLimit!=undefined){
	    if(Number(mixLimit)>Number(upperLimit)){
	        workbenchErrorBarWidget.showMessage("${getText('RM.formula.randon12342342')}");
	        PrecessStandards_dg1487555065561Widget.setCellValue(row,"flucLowerLimit","");
        }
	   
    }
}

		/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_processActiveEdit,js,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) */
// 自定义代码
        var checkItemID = 0;//页面记录选择的工序活动id
        var checkTrue = true; // 定义全局变量，默认为true
 var bdforeRow=0;//页面记录选择前的行
    function processDelete(){
  		if(checkTrue==false){
  					var selectRow=FormulaProcessActive_dg1487554913298Widget.getSelectedRow();
  					var processId=FormulaProcessActive_dg1487554913298Widget.getCellValue(selectRow,'id');
  				var url = "/RM/formula/formulaProcess/processDelete.action?processId="+processId;
        $.ajax({
	        url : url,
	        type : 'get',
	        async : false,
	        success : function(msg) {
		     if(msg!=null){
			  var  value = msg.result;
			  if(value==true){
			  		//重新加载工序活动
			  		FormulaProcessActive_dg1487554913298Widget._DT.setRequestDataUrl(FormulaProcessActive_dg1487554913298Widget._DT.requestUrl);
			  		//重新加载工艺标准
			  		PrecessStandards_dg1487555065561Widget._DT.setRequestDataUrl(PrecessStandards_dg1487555065561Widget._DT.requestUrl);
			  }
		     }
	         }
            });
  		
  		}
  }
  		


//工序活动行点击事件
	function setIndexData(a){
	var length=PrecessStandards_dg1487555065561Widget.getRowLength();
	//当前工序活动选中的行
	//var processRow=FormulaProcessActive_dg1487554913298Widget.getSelectedRow();
      var processRow=a;
	//如果当前选中的工序活动与之前选中的工序活动不一致进行提示
	if(bdforeRow!=processRow){
            //alert(1);
			if(Number(length)>0){
			for(var i=0;i<length;i++){
			   //指标
					var quota=PrecessStandards_dg1487555065561Widget.getCellValue(i,'quota');
					//标准值
					var standValue= PrecessStandards_dg1487555065561Widget.getCellValue(i,'stValue');
					var row=i+1;
					var processName=FormulaProcessActive_dg1487554913298Widget.getCellValue(bdforeRow,'name');
					if(quota==undefined  || quota==''){
					//工艺标准中的指标不能为空
					workbenchErrorBarWidget.showMessage('工序活动['+processName+']对应的工艺指标中第['+row+']行的指标不允许为空','f');
					return false;
					}
					if(standValue==undefined  || standValue==''){
					//工艺标准中的指标不能为空
					workbenchErrorBarWidget.showMessage('工序活动['+processName+']对应的工艺指标中第['+row+']行的标准值不允许为空','f');
					return false;
					}
					//上限
					var upperLimit=PrecessStandards_dg1487555065561Widget.getCellValue(i,'upperLimit');
					//上上限
					var maxLimit=PrecessStandards_dg1487555065561Widget.getCellValue(i,'maxLimit');
					//下限
					var lowerLimit=PrecessStandards_dg1487555065561Widget.getCellValue(i,'lowerLimit');
					//下下限
					var loweMxLimit=PrecessStandards_dg1487555065561Widget.getCellValue(i,'lowerLimit');
					
					
					
			}
	
	}
	}
	
      
	//获取之前选中的行
	var itemID = checkItemID;
		if(itemID!=0){	//有选中的项目时
		//添加隐藏框用于存放json值
	    if($("#dg1487555065561ListJson_"+itemID).length==0){
				$("#PrecessStandards_dg1487555065561_tbody").append("<input type=\"hidden\" id=\"dg1487555065561ListJson_"+itemID+"\">");
			}
			//下面pt的长度
			var len  = PrecessStandards_dg1487555065561Widget._DT.getAllData().length;
			 var ItemIndexObj = $.extend(true,[],PrecessStandards_dg1487555065561Widget._DT.getAllData());
          	//替换id为字符串，防止后台转换json为obj时报错
			 for(var i=0;i<len;i++){
    var id = ItemIndexObj[i].id;
    if(id!=undefined){
     ItemIndexObj[i].id = ""+ id;
    }
    ItemIndexObj[i].rowHtmlObj=null;
   }
   var processJson=JSON.stringify(ItemIndexObj).replace(/null/g,"\"\"");
   $("#dg1487555065561ListJson_"+itemID).val(JSON.stringify(ItemIndexObj).replace(/null/g,"\"\""));
  } 
			
			
		setTimeout(function(){
			var selRow = FormulaProcessActive_dg1487554913298Widget.getSelectedRow();
			var selID = FormulaProcessActive_dg1487554913298Widget.getCellValue(selRow,"id");
		/*if(	checkItemID == selID){	//判断之前选中的测试项目是否与现在选中的一样
				return;
			}*/
			checkItemID = selID;
			bdforeRow=selRow;
			var jsonData = $("#dg1487555065561ListJson_"+selID).val();
			var processID = FormulaProcessActive_dg1487554913298Widget.getCellValue(selRow,"id");
			var id = $("#id").val();
			if(jsonData==undefined&&id!=undefined){
              	//编辑时，并且第一次点击
				PrecessStandards_dg1487555065561Widget._DT.setRequestDataUrl("/RM/formula/formulaProcess/data-dg1487555065561.action?formulaProcess.id="+id+"&rt=json&processID="+processID);
			} else{
              	if(jsonData==undefined) jsonData="";
              	jsonData = jsonData.replace(/\+/g,"%2b");
				PrecessStandards_dg1487555065561Widget._DT.setRequestDataUrl("/RM/formula/formulaProcess/ref-data-dg1487555065561.action?rt=json","dg1487555065561List_Json="+jsonData);	
			}
		},400);
	}

        //其他活动界面
		var otherEdit = new CUI.Dialog({
					title:"其他活动设置",
  				formId: "RM_formula_formulaProcessActive_otherActiveEdit_form",
 				  type:5,
          modal:true,
     		  url:'/RM/formula/formulaProcessActive/otherActiveEdit.action?entityCode=RM_7.5.0.0_formula',
          buttons:[
            { name:"${getText("foundation.common.save")}",
                handler:function(){
                $('input[name="formula.saveFlag"]').val(false);
                CUI('#RM_formula_formulaProcessActive_otherActiveEdit_form').submit();
           }
           },
           { name:"${getText("foundation.common.closed")}",
                handler:function(){this.close()}
           }
           ]
           });
 
 
 //投配料活动的界面
  
    var fomulaActive=new CUI.Dialog({
		title:"投配料活动设置",
	    formId:"RM_formula_formulaProcessActive_fomulaActiveEdit_form",
		type:5,
		modal:true,
		url:'/RM/formula/formulaProcessActive/fomulaActiveEdit.action?entityCode=RM_7.5.0.0_formula',
		buttons:[{
			name:"${getText('foundation.common.save')}",
			handler:function(){
				CUI('#RM_formula_formulaProcessActive_fomulaActiveEdit_form').submit();
			}
		},
		{
			name:"${getText('foundation.common.closed')}",
			handler:function(){this.close()}
		}]
  });

   //管道投配料
   var fomulaActive=new CUI.Dialog({
						title:"${getText('RM.formulaActive.radion141234234')}",
				    formId:"RM_formula_formulaProcessActive_channelActiveEdit_form",
						type:5,
						modal:true,
						url:'/RM/formula/formulaProcessActive/channelActiveEdit.action?entityCode=RM_7.5.0.0_formula',
						buttons:[{
							name:"${getText('foundation.common.save')}",
							handler:function(){
							CUI('#RM_formula_formulaProcessActive_channelActiveEdit_form').submit();
			  }
		    },
		    {
			       name:"${getText('foundation.common.closed')}",
			       handler:function(){this.close()}
		     }]
       });

  var  manualActive=new CUI.Dialog({
						title:"${getText('RM.formulaActive.radion1412123121')}",
				    formId:"RM_formula_formulaProcessActive_manualActiveEdit_form",
						type:5,
						modal:true,
						url:'/RM/formula/formulaProcessActive/manualActiveEdit.action?entityCode=RM_7.5.0.0_formula',
						buttons:[{
							name:"${getText('foundation.common.save')}",
							handler:function(){
							CUI('#RM_formula_formulaProcessActive_manualActiveEdit_form').submit();
			  }
		    },
		    {
			       name:"${getText('foundation.common.closed')}",
			       handler:function(){this.close()}
		     }]
       });

  	RM.formula.formulaProcessActive = RM.formula.formulaProcess.processActiveEdit;
     RM.formula.formulaProcessActive.callBackInfo=function(){   
             CUI.Dialog.toggleAllButton(); 
       //关闭其他活动
       otherEdit.close();
       //关闭投配料活动
           fomulaActive.close();
        //关闭管道投配料
           fomulaActive.close();
           manualActive.close();
       //页面重新加载
          FormulaProcessActive_dg1487554913298Widget._DT.setRequestDataUrl(FormulaProcessActive_dg1487554913298Widget._DT.requestUrl);
       //重新加载工艺标准
		  PrecessStandards_dg1487555065561Widget._DT.setRequestDataUrl(PrecessStandards_dg1487555065561Widget._DT.requestUrl);
            checkItemID = "";
       //自动刷新   
       var formulaId=$('[name="formulaProcess.formulaId.id"]').val();
          var url = "/RM/formula/formulaBom/autoProduce.action?formulaId="+formulaId;
          $.ajax({
            url : url,
            type : 'get',
            async : false,
            success : function(msg) {
              if(msg!=null){
                if(opener){
                 opener.FormulaBom_dg1503551511011Widget._DT.setRequestDataUrl(opener.FormulaBom_dg1503551511011Widget._DT.requestUrl);
                }
                FormulaProcessActive_dg1487554913298Widget._DT.setRequestDataUrl(FormulaProcessActive_dg1487554913298Widget._DT.requestUrl); 

              }
            }
          }); 
       
       
        }
     
           //重写工序活动的callback函数
        RM.formula.formulaProcess.processActiveEdit._callBackInfo = function(res){
			if(res.dealSuccessFlag){
					var showMsg ;
				if(res.operateType == 'save'){
					showMsg = "${getText("ec.common.savesuccessful")}";
				}else{
					showMsg = "${getText("ec.common.saveandclosesuccessful")}";
				}
           //提交成功时隐藏之前的错误信息
				workbenchErrorBarWidget.close();
					var tableId=$('input[name="formulaProcess.processTableId"]').val();
					var activeId=$('input[name="formulaProcess.formId"]').val();
              		var url1="/RM/formula/formulaProcess/processActiveEdit.action?entityCode=material_1.0_operateProdPlace&${getPowerCode('opeProList_add_add_material_1.0_operateProdPlace_opeProList')}&id="+activeId+"&tableInfoId="+tableId;
 				setTimeout(function(){
					window.opener.location.reload();
                  	location.replace("/RM/formula/formulaProcess/processActiveEdit.action?entityCode=material_1.0_operateProdPlace&${getPowerCode('opeProList_add_add_material_1.0_operateProdPlace_opeProList')}&id="+activeId+"&tableInfoId="+tableId);
				},500);
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.RM.formula.formulaProcess.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
			} else {
				CUI.showErrorInfos(res);
			}
		};

function processActiveDelete(){
  	if(checkTrue==false){
  		var selectRow=FormulaProcessActive_dg1487554913298Widget.getSelectedRow();
  		//如果没有选中的行
  		if(selectRow==undefined){
  			workbenchErrorBarWidget.showMessage('${getText("RM.processEditDel.randon14769606234234")}','f');
  			return false;
  		}
  		var processId=FormulaProcessActive_dg1487554913298Widget.getCellValue(selectRow,'id');
  		var url = "/RM/formula/formulaProcess/processActiveDelete.action?processId="+processId;
        $.ajax({
	        url : url,
	        type : 'get',
	        async : false,
	        success : function(msg) {
				if(msg!=null){
					var value = msg.result;
					if(value==true){
						//重新加载工序活动
						FormulaProcessActive_dg1487554913298Widget._DT.setRequestDataUrl(FormulaProcessActive_dg1487554913298Widget._DT.requestUrl);
						//重新加载工艺标准
						PrecessStandards_dg1487555065561Widget._DT.setRequestDataUrl(PrecessStandards_dg1487555065561Widget._DT.requestUrl);
					}
				}
	        }
        });
          
      	  var formulaId=$('[name="formulaProcess.formulaId.id"]').val();
          var url1 = "/RM/formula/formulaBom/autoProduce.action?formulaId="+formulaId;
          $.ajax({
            url : url1,
            type : 'get',
            async : false,
            success : function(msg) {
              if(msg!=null){
                if(opener!=null){
                 opener.FormulaBom_dg1503551511011Widget._DT.setRequestDataUrl(opener.FormulaBom_dg1503551511011Widget._DT.requestUrl);
                }
              }
            }
          }); 

  	}
}

function savedg1487555065561DataGrid(){
	var length = FormulaProcessActive_dg1487554913298Widget.getRowLength();
	var selRow = FormulaProcessActive_dg1487554913298Widget.getSelectedRow();
	if(selRow!=undefined){
		var selID = FormulaProcessActive_dg1487554913298Widget.getCellValue(selRow,"id");
		if($("#dg1487555065561ListJson_"+selID).length==0){
			$("#FormulaProcessActive_dg1487554913298_tbody tr:eq("+selRow+")").append("<input type=\"hidden\" id=\"dg1487555065561ListJson_"+selID+"\">");
		}
		var len  = PrecessStandards_dg1487555065561Widget._DT.getAllData().length;
		var ItemIndex = $.extend(true,[],PrecessStandards_dg1487555065561Widget._DT.getAllData());
		for(var i=0;i<len;i++){
			var id = ItemIndex[i].id;
			ItemIndex[i].rowHtmlObj=null;
			if(id!=undefined){
				ItemIndex[i].id = ""+ id;
			}
		}
		$("#dg1487555065561ListJson_"+selID).val(JSON.stringify(ItemIndex).replace(/null/g,"\"\""));
	}
	
	//多条检验指标项目下分析项目的json数组拼接
		var dg1487555065561ListJson = "[";
		for(var i=0;i<length;i++){
			var domid = "dg1487555065561ListJson_"+FormulaProcessActive_dg1487554913298Widget.getCellValue(i,"id");
			var jsonstr = $("#"+domid).val();
			if(jsonstr!=undefined&&jsonstr.length>2){
				dg1487555065561ListJson += jsonstr.substring(1,jsonstr.length-1)+ ",";
			}
		}
		if(dg1487555065561ListJson.length>1){
			dg1487555065561ListJson = dg1487555065561ListJson.substring(0,dg1487555065561ListJson.length-1)+"]";
		} else{
			dg1487555065561ListJson += "]";
		}	
	$('input[name="dg1487555065561List_Json"]').remove();
	$('<input type="hidden" name="dg1487555065561ModelCode">').val('RM_7.5.0.0_formula_PrecessStandards').appendTo($('#RM_formula_formulaProcess_processActiveEdit_form'));
	//兼容旧版本提交函数
	$('<input type="hidden" name="dg1487555065561List_Json">').val(dg1487555065561ListJson).appendTo($('#RM_formula_formulaProcess_processActiveEdit_form'));
}

RM.formula.formulaProcess.processActiveEdit.initSize = function(nTabIndex){
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
				var conHeight = h-$("#RM_formula_formulaProcess_processActiveEdit_main_div .edit-head").height()-$("#RM_formula_formulaProcess_processActiveEdit_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#RM_formula_formulaProcess_processActiveEdit_main_div .edit-workflow").height()</#if>;
				$("#RM_formula_formulaProcess_processActiveEdit_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('RM_formula_formulaProcess_processActiveEdit_datagrids');
				var padding_bottom=16;
				$("#RM_formula_formulaProcess_processActiveEdit_main_div .pd_bottom,#RM_formula_formulaProcess_processActiveEdit_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#RM_formula_formulaProcess_processActiveEdit_main_div .edit-panes-s").each(function(index){
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
                                        //  dgwidget.setHeight(perHeight - 78); 
										  if ( $('._DT_blank','#' + datagrids[index] + '_wrapper').length == 0 ) {
										     $('#' + datagrids[index] + '_wrapper').append('<div style="height:11px" class="_DT_blank" ></div>')  //当使用控件PT的时候，为底部增加10px的div，  xudihui  2015.01.27
										   } 
                                         }
									     else{
									     // dgwidget.setHeight(perHeight - 68);
									     }	
									}
								} else {
									if(RM.formula.formulaProcess.processActiveEdit.initCount <= 2) {
										setTimeout(function(){RM.formula.formulaProcess.processActiveEdit.initSize();}, 200);
										RM.formula.formulaProcess.processActiveEdit.initCount++;
									}/* else {
										RM.formula.formulaProcess.processActiveEdit.initCount = 0;
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
							if(($("#RM_formula_formulaProcess_processActiveEdit_main_div .edit-workflow").length > 0) && ($("#RM_formula_formulaProcess_processActiveEdit_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
	/*
 *table TD对象
 *key 
 *direct "asc" 或者 "desc"
 *	guding
 */
function tableSort(table,key,direct) {
	table = table._DT
	var oCell = $(table._hthead).find("td[key='" + key + "']")[0]
	var formObj=null;
	var isEditAble = table.configs.editable;
	
	if (table.get('formId')){
		formObj = CUI('#' + table.get('formId'));		
	}else{
		formObj = CUI('#QueryForm');			
	} 
    if (table._disableSortClickEvent ) {
        table._disableSortClickEvent = false;
        return false;
    }
    var lockCount;
	
	if( table.lockColumnCount ){
		lockCount = table.lockColumnCount;
		table.unlockColumn( table.lockColumnCount );	
	}
    table.fireEvent('thClick', oCell);
	
    if ( table.frontSortKey && table.frontSortKey === key ) {
    	
		if(direct == 'asc'){
    		table._frontSortArrow.className='dg-hd-td-sort-desc';
    		table._sortMethod = toUpperCase(direct);//同步后台排序数据
    		table._sortKey=key;
    		table.needSort=true;
    	}else{
    		table.requestsort=true;
        	table._frontSortArrow = null;
        	$('span[class^="dg-hd-td-sort-"]' , table._dtHeadEl).remove();
        	
			table._frontSortArrow = table._createElement('span', oCell.firstChild, 'dg-hd-td-sort-asc');
			oCell.firstChild.appendChild(table._frontSortArrow);
			table.frontSortKey = key;
			table._sortMethod = toUpperCase(direct);
			table._sortKey=key;
			table.needSort=true;
    	}

    	
    }
	
	var sortArray = [];
	for (var i = 0; i < table._bTbody.rows.length; i++) {
		var oTd = table._bTbody.rows[i].cells[oCell.cellIndex];
		
		while (oTd.hasChildNodes() && oTd.tagName != 'SELECT') {
			oTd = oTd.firstChild;
		}
		sortArray[i] = {};
		sortArray[i].o = table._bTbody.rows[i];
		sortArray[i].f = table._bTbody.rows[i];
		sortArray[i].v = oTd.nodeValue ? oTd.nodeValue : oTd.value ? oTd.value: '';
	}
	
	/* array sort */
	sortArray.sort(table._cp);
	
	if (direct == 'desc') {
		sortArray.reverse();
	} 

    var selectedRows = [];
    for (var i = 0; i < table.selectedRows.length; i++) {
    	selectedRows.push(table.selectedRows[i].rowHtmlObj);
        table._setUnSelected(table.selectedRows[i].rowHtmlObj);
        i--;
    }
    var rowsJsonObj = [];
    /* rowsJsonObj sort */
    for (var i = 0, l = sortArray.length; i < l; i++) {
        rowsJsonObj.push(table.rowsJsonObj[sortArray[i].o.rowIndex]);
    }
    table.rowsJsonObj = rowsJsonObj;
    /* row sort */
    for (var i = 0, l = sortArray.length; i < l; i++) {
        table._bTbody.appendChild(sortArray[i].o);
    }

    table.selectedRows = [];
    for (var i = 0; i < selectedRows.length; i++) {
        table._setSelected(selectedRows[i]);
    }
    table._setfbuttonBar();
    table.setOrderNumber();
    if( lockCount ){
		table.lockColumn( lockCount );
	}
}
	function resortSubActive(){
        var activeHiddenId = FormulaProcessActive_dg1487554913298Widget.getCellValue(FormulaProcessActive_dg1487554913298Widget.getSelectedRow(),'activeHiddenId')
        var currentId = FormulaProcessActive_dg1487554913298Widget.getCellValue(FormulaProcessActive_dg1487554913298Widget.getSelectedRow(),'id')
        var parentHiddenSort = 0;
        //找到父活动ID的隐藏顺序
        for (var i = 0; i < FormulaProcessActive_dg1487554913298Widget.getRowLength(); i++) {
            if (FormulaProcessActive_dg1487554913298Widget.getCellValue(i,'id') == activeHiddenId){
                  parentHiddenSort = FormulaProcessActive_dg1487554913298Widget.getCellValue(i,'hiddenSort');
            }
        }
        //遍历当前
        for (var i = 0; i < FormulaProcessActive_dg1487554913298Widget.getRowLength(); i++) {
            if (FormulaProcessActive_dg1487554913298Widget.getCellValue(i,'activeHiddenId') == activeHiddenId &&　FormulaProcessActive_dg1487554913298Widget.getCellValue(i,'execSort')){
                  FormulaProcessActive_dg1487554913298Widget.setCellValue(i,'hiddenSort',Number(Number(parentHiddenSort) + Number(0.000001) * Number(FormulaProcessActive_dg1487554913298Widget.getCellValue(i,'execSort').split("-")[1])).toFixed(6));
            }
        }
        tableSort(FormulaProcessActive_dg1487554913298Widget,'hiddenSort',"asc")
    }
	function subActive(mapValue){
    	var subActiveLength = 0;
        //子工序 顺序的处理
        $("#FormulaProcessActive_dg1487554913298_tbody tr.subActive td[key='execSort']").click(function(event){
			console.log(mapValue);
            var td = this
			console.log($(td).siblings("td[key='activeHiddenId']").attr('truevalue'));
            var sufString = mapValue[$(td).siblings("td[key='activeHiddenId']").attr('truevalue')].split("_")[0];
			console.log(sufString);
            subActiveLength = mapValue[$(td).siblings("td[key='activeHiddenId']").attr('truevalue')].split("_")[1];
			console.log(subActiveLength);
            var selectedValue =  $(td).find("div").html()
			console.log(selectedValue);
            if (selectedValue.indexOf("<select")!=-1){
                return;
            }
            if(subActiveLength){
                var options = "<option value =\"\"></option>";
                for (var i = 1; i <= subActiveLength; i++) {
                    if (selectedValue && selectedValue == sufString + "-" + i ) {
                        options += "<option value =\"" + i + "\" selected>" + sufString + "-" + i + "</option>"
                    }else{
                        options += "<option value =\"" + i + "\">" + sufString + "-" + i + "</option>"
                    }
                }

                $(td).html(
                    "<div style=\"width:60px;\"><select class=\"td-select\" style=\"margin-top:-2px;margin-bottom:-2px;width:60px;border-width:0px;outline:0px;\">"+
                      options+
                    "</select></div>"
                )
                $(".td-select").focus()

                $(".td-select").click(function(event){
                    return false;
                }).change(function(){
                    FormulaProcessActive_dg1487554913298Widget.setCellValue(FormulaProcessActive_dg1487554913298Widget.getSelectedRow(),'execSort',$(this).find("option:selected").html())
                    //如果修改了当前子活动的执行顺序，就要获取当前行的父活动id 以后期过滤用
                    resortSubActive();
                    $("td[key='execSort'] div").css("text-align",'center')
                }).blur(function(){
                    FormulaProcessActive_dg1487554913298Widget.setCellValue(FormulaProcessActive_dg1487554913298Widget.getSelectedRow(),'execSort',$(this).find("option:selected").html())
                    $("td[key='execSort'] div").css("text-align",'center')
                })
            }

        })
    }
	
	var mapValue = {};
	
	function resetExecuteSort(){	
        var length = FormulaProcessActive_dg1487554913298Widget.getRowLength();
        var executeSort = 1;
        var hiddenActiveSort = 1000001;
        var mapExe = new Map();
        var mapSubExe = new Map();
        var mapHiddenActive = new Map();
        //第一次遍历，处理非配料类型的执行顺序呢
        for (var i = 0; i < length; i ++) {
            var activeType =  FormulaProcessActive_dg1487554913298Widget.getCellValue(i, 'activeType.id');	
            if(activeType == 'activeType/activeType4'){
                var activeId =  FormulaProcessActive_dg1487554913298Widget.getCellValue(i, 'id');	
                mapExe.set(activeId, executeSort);
                mapSubExe.set(activeId, 1);
                mapHiddenActive.set(activeId, hiddenActiveSort+1);
            }	

            if (activeType != 'activeType/activeType2') {
                FormulaProcessActive_dg1487554913298Widget.setCellValue(i, 'hiddenSort', hiddenActiveSort/1000000 );
                FormulaProcessActive_dg1487554913298Widget.setCellValue(i, 'execSort', executeSort);
				
				mapValue[FormulaProcessActive_dg1487554913298Widget.getCellValue(i,'id')] = executeSort + "_" + FormulaProcessActive_dg1487554913298Widget.getCellValue(i,'subActiveNum');
				
                executeSort++;
                hiddenActiveSort = (hiddenActiveSort + 1000000);		
            }
        }	
        
        //第一次遍历，处理配料类型的执行顺序呢
        for (var i = 0; i < length; i ++) {
            var activeType =  FormulaProcessActive_dg1487554913298Widget.getCellValue(i, 'activeType.id');		
            if (activeType == 'activeType/activeType2') {
                var hiddenActive = FormulaProcessActive_dg1487554913298Widget.getCellValue(i, 'activeHiddenId');		
                
                var currentExeSort = mapExe.get(hiddenActive );
                var currentSubExeSort = mapSubExe.get(hiddenActive );
                var currentHiddenActive = mapHiddenActive.get(hiddenActive );
                
                FormulaProcessActive_dg1487554913298Widget.setCellValue(i, 'hiddenSort', currentHiddenActive/1000000 );
                FormulaProcessActive_dg1487554913298Widget.setCellValue(i, 'execSort', currentExeSort + '-' + currentSubExeSort);
                currentSubExeSort++;
                currentHiddenActive++;
                mapSubExe.set(hiddenActive, currentSubExeSort);
                mapHiddenActive.set(hiddenActive, currentHiddenActive);
            }
        }	
		console.log(mapValue);
		subActive(mapValue);
    }
	function resortActive(){
      var tempArr = new Array();
      for (var i = 0; i < FormulaProcessActive_dg1487554913298Widget.getRowLength();i++){
          if (FormulaProcessActive_dg1487554913298Widget.getSelectedRow() == i) continue;
          if (FormulaProcessActive_dg1487554913298Widget.getCellValue(i,'execSort') == FormulaProcessActive_dg1487554913298Widget.getCellValue(FormulaProcessActive_dg1487554913298Widget.getSelectedRow(),'execSort')){
                for (var j = 0; j < FormulaProcessActive_dg1487554913298Widget.getRowLength();j++){
                      if (FormulaProcessActive_dg1487554913298Widget.getCellValue(i,'execSort') - 1 < FormulaProcessActive_dg1487554913298Widget.getCellValue(j,'hiddenSort') && 
                          Number(FormulaProcessActive_dg1487554913298Widget.getCellValue(i,'execSort')) + 1 > FormulaProcessActive_dg1487554913298Widget.getCellValue(j,'hiddenSort')){
                          tempArr.push(FormulaProcessActive_dg1487554913298Widget.getCellValue(j,'hiddenSort'));
                      }
                }
                break;
          }
      }
      var subNum = 0;
      if (tempArr.length > 0) {
          tempArr.sort();
          FormulaProcessActive_dg1487554913298Widget.setCellValue(FormulaProcessActive_dg1487554913298Widget.getSelectedRow(),'hiddenSort',Number(Number(tempArr[tempArr.length - 1]) + 0.000101).toFixed(6))
      }else{
          FormulaProcessActive_dg1487554913298Widget.setCellValue(FormulaProcessActive_dg1487554913298Widget.getSelectedRow(),'hiddenSort',Number(Number(FormulaProcessActive_dg1487554913298Widget.getCellValue(FormulaProcessActive_dg1487554913298Widget.getSelectedRow(),'execSort')) + 0.000001).toFixed(6))
      }
      for (var i = 0; i < FormulaProcessActive_dg1487554913298Widget.getRowLength();i++){
          if (FormulaProcessActive_dg1487554913298Widget.getCellValue(i,'activeHiddenId') == FormulaProcessActive_dg1487554913298Widget.getCellValue(FormulaProcessActive_dg1487554913298Widget.getSelectedRow(),'id')){
              subNum++;
              FormulaProcessActive_dg1487554913298Widget.setCellValue(i,'execSort',FormulaProcessActive_dg1487554913298Widget.getCellValue(FormulaProcessActive_dg1487554913298Widget.getSelectedRow(),'execSort') + "-" + subNum)
              FormulaProcessActive_dg1487554913298Widget.setCellValue(i,'hiddenSort',Number(Number(FormulaProcessActive_dg1487554913298Widget.getCellValue(FormulaProcessActive_dg1487554913298Widget.getSelectedRow(),'hiddenSort')) + Number(subNum) / 1000000).toFixed(6));   
          }
      }
      for (var i = 0; i < FormulaProcessActive_dg1487554913298Widget.getRowLength();i++){
          if (FormulaProcessActive_dg1487554913298Widget.getCellValue(i,'mainActive')){
              //对应关系为 {父活动id : 父活动执行顺序 + "_" + 子活动数量}
              mapValue[FormulaProcessActive_dg1487554913298Widget.getCellValue(i,'id')] = FormulaProcessActive_dg1487554913298Widget.getCellValue(i,'execSort') + "_" + FormulaProcessActive_dg1487554913298Widget.getCellValue(i,'subActiveNum')
          }
      }
      subActive(mapValue);
      tableSort(FormulaProcessActive_dg1487554913298Widget,'hiddenSort',"asc")
  }
/* CUSTOM CODE END */
		RM.formula.formulaProcess.processActiveEdit.onloadForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_processActiveEdit,onloadForProduct,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		}

		RM.formula.formulaProcess.processActiveEdit.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_processActiveEdit,onsaveForProduct,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) */
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
				<div class="sidebar-top"><a href="#"  onclick="RM.formula.formulaProcess.processActiveEdit.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="RM.formula.formulaProcess.processActiveEdit.showBusinessList('${l.relatingModel.code.replace('.','')}',${(formulaProcess.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
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