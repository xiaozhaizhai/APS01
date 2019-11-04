<!-- RM_7.5.0.0/formula/processActiveView -->
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
<#assign viewType = "readonly">
<#-- 实体对象 -->
<#assign tableObj = formulaProcess>
<#-- 命名空间 -->
<#assign editPageNs = "RM.formula.formulaProcess.processActiveView">
<#-- 模型名称-->
<#assign modelName = "formulaProcess">
<#-- 视图编码-->
<#assign viewCode = "RM_7.5.0.0_formula_processActiveView">
<#-- 实体编码-->
<#assign entity_code = "RM_7.5.0.0_formula">
<#-- 视图名称-->
<#assign viewName = "processActiveView">
<#-- datagrid编码-->
<#assign datagridCode = "RM_formula_formulaProcess_processActiveView_datagrids">
<#-- 首字母大写的模型名称-->
<#assign upcaseModelName = "FormulaProcess">
<#-- 页面打印按钮 -->
<#assign isPrint = false>
<#-- 控件打印按钮 -->
<#assign controlPrint = false>
<#-- 是否只读 -->
<#assign allReadOnly = true>
<#-- 是否是参照视图 -->
<#assign isReference =false>
<#-- 是否可弃审 -->
<#assign retrialFlag = false>
<#-- formid -->
<#assign editFormId = "RM_formula_formulaProcess_processActiveView_form">
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
        <#assign configTitle = getText('RM.viewtitle.randon1489392987522')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		
		#RM_formula_formulaProcess_processActiveView_form{float:left;width:100%;}
		
		
		</style>
		<script type="text/javascript">
			CUI.ns('RM.formula.formulaProcess.processActiveView');
			RM.formula.formulaProcess.processActiveView.currentUser = ${userJson};
			RM.formula.formulaProcess.processActiveView.currentStaff = ${staffJson};
			RM.formula.formulaProcess.processActiveView.currentDepartment = ${deptJson};
			RM.formula.formulaProcess.processActiveView.currentPosition = ${postJson};
			RM.formula.formulaProcess.processActiveView.currentCompany = ${compJson};
		</script>
		<!-- CUSTOM CODE START(view-VIEW-RM_7.5.0.0_formula_processActiveView,head,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) -->
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
    </head>
	<body class="view-edit ">
		<@loadpanel newType=true/>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="" onsubmitMethod="RM.formula.formulaProcess.processActiveView.beforeSubmitMethod()" id="RM_formula_formulaProcess_processActiveView_form" namespace="/RM/formula/formulaProcess/processActiveView" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=RM_7.5.0.0_formula_FormulaProcess&_bapFieldPermissonModelName_=FormulaProcess" editPageNs="RM.formula.formulaProcess.processActiveView" callback="RM.formula.formulaProcess.processActiveView._callBackInfo" ecform="true">
			<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
			<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="RM_formula_formulaProcess_processActiveView_main_div">
			<div class="edit-head">
				<#include "../../../ec/tableInfo/operateheadbar_all.ftl" >
				<#include "../../../ec/tableInfo/creatorInfo.ftl" >
			</div>
    		<div class="edit-main" id="RM_formula_formulaProcess_processActiveView">
    			<div class="edit-content">
    	<#include "../../../ec/tableInfo/formparam.ftl" >				
		<div class="dash-line"></div>
<script type="text/javascript">
var attcountid = "RM_formula_formulaProcess_processActiveView_form"+"_attcount";
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
					
							
							<div class="fix-input-readonly">
								<input property_type="LONG" name="formulaProcess.formulaHideId" id="formulaProcess_formulaHideId"  style=";" originalvalue="<#if !newObj || (formulaProcess.formulaHideId)?has_content>${(formulaProcess.formulaHideId?html)!}<#else>${formulaProcess_formulaHideId_defaultValue!}</#if>" value="<#if !newObj || (formulaProcess.formulaHideId)?has_content>${(formulaProcess.formulaHideId?html)!}<#else>${formulaProcess_formulaHideId_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
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
					
							
							<div class="fix-input-readonly">
								<input property_type="LONG" name="formulaProcess.processTableId" id="formulaProcess_processTableId"  style=";" originalvalue="<#if !newObj || (formulaProcess.processTableId)?has_content>${(formulaProcess.processTableId?html)!}<#else>${formulaProcess_processTableId_defaultValue!}</#if>" value="<#if !newObj || (formulaProcess.processTableId)?has_content>${(formulaProcess.processTableId?html)!}<#else>${formulaProcess_processTableId_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
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
					
							
							<div class="fix-input-readonly">
								<input property_type="LONG" name="formulaProcess.formId" id="formulaProcess_formId"  style=";" originalvalue="<#if !newObj || (formulaProcess.formId)?has_content>${(formulaProcess.formId?html)!}<#else>${formulaProcess_formId_defaultValue!}</#if>" value="<#if !newObj || (formulaProcess.formId)?has_content>${(formulaProcess.formId?html)!}<#else>${formulaProcess_formId_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
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
								<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formula_FormulaProcessActive", "RM_7.5.0.0_formula_processActiveViewdg1489393020282", "DATAGRID", "formulaProcessActive")>
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
									function FormulaProcessActive_dg1489393020282_proItemSet(event)
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
	 var tableData =   JSON.parse(FormulaProcessActive_dg1489393020282Widget.getAllRowData());
	 var row = FormulaProcessActive_dg1489393020282Widget.getSelectedRow();
	 if(row==undefined){
	 	workbenchErrorBarWidget.showMessage('请选择一条记录进行操作!', 'f');
		return false;
	 }
	 if(tableData[row].activeType.id=="activeType/activeType4"){
     	workbenchErrorBarWidget.showMessage('活动类型为投配料不可设置工艺参数!', 'f');
        return false;
     }
	 var activeId = tableData[row].id;
	 /*if(tableData[row].batchPhaseName == undefined){
	 	workbenchErrorBarWidget.showMessage('已存在相同活动配置工艺参数不能重复配置!', 'f');
		return false;
	 }*/
	 var mappingType = "processActiveType/active";
	 if(activeId != '' ){
		var formulaId = theRequest.formulaId;
		var url='/processAnl/processModelSet/proAnalySet/processModelEdit.action?entityCode=processAnl_1.0.0_processModelSet&activeId='+activeId +"&mappingType="+mappingType+ "&__pc__=cHJvY2Vzc01vZGVsTGlzdF9hZGRQcm9BbmFseV9hZGRfcHJvY2Vzc0FubF8xLjAuMF9wcm9jZXNzTW9kZWxTZXRfcHJvY2Vzc01vZGVsTGlzdHw_";
		openFullScreen(url); 
	}
}
								</script>
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/RM/formula/formulaProcess/data-dg1489393020282.action?formulaProcess.id=${refId!-1}&refId=${refId!-1}&datagridCode=RM_7.5.0.0_formula_processActiveViewdg1489393020282">
			<#else>
				<#assign dUrl="/RM/formula/formulaProcess/data-dg1489393020282.action?formulaProcess.id=${(formulaProcess.id)!-1}&datagridCode=RM_7.5.0.0_formula_processActiveViewdg1489393020282">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('RM.buttonPropertyshowName.radion1543460479951')}\",handler:function(event){FormulaProcessActive_dg1489393020282_proItemSet(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('RM.buttonPropertyshowName.radion1543460479951')}\",handler:function(event){FormulaProcessActive_dg1489393020282_proItemSet(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_FormulaProcessActive_dg1489393020282" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1489393020282_id" value="FormulaProcessActive_dg1489393020282" />
			
			<input type="hidden" id="dg1489393020282_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('RM.modelname.randon1487330059541')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/RM/formula/formulaProcess/data-dg1489393020282.action?operateType=export&datagridCode=RM_7.5.0.0_formula_processActiveViewdg1489393020282"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="FormulaProcessActive_dg1489393020282" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="FormulaProcessActive_dg1489393020282" viewType="${viewType}" renderOverEvent="dg1489393020282RenderOverEvent" route="${routeFlag}" formId="RM_formula_formulaProcess_processActiveView_form" noPermissionKeys="name,batchPhaseName,occurTurn,activeType,fromContainer,container,product.productCode,product.productName,isAgile,isReplace,isMixQuality,standardQuantity,minQuality,maxQuality,lossRate,longTime,auto,actOrder,ingredientsOrder,execSort,batchSite,exeSystem,mobileTerminal,testProduct.code,qualityStandard.code,isWatchActive,isAnaly,finalInspection,meno,hiddenSort,channelOrManual,activeHiddenId" modelCode="RM_7.5.0.0_formula_FormulaProcessActive" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1489393020282" dtPage="dgPage"  hidekeyPrefix="dg1489393020282" hidekey="['id','version','product.id','product.productCode','product.id','product.productName','testProduct.id','testProduct.code','qualityStandard.id','qualityStandard.code'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=false  buttons="${buttons}" noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1489393020282PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=false cannotDeleteRow=true assModelDisplayName=assModelDisplayName dgTitle="${getText('RM.dataGriddataGridName.radion1488181675391')}" activexButton="RM.buttonPropertyshowName.radion1543460479951,proItemSet,add" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign name_displayDefaultType=''>
								<#assign name_defaultValue=''>
										<#assign name_defaultValue=''>
										 
									<@datacolumn key="name"        showFormat="TEXT" defaultValue="${(name_defaultValue!)?string}" defaultDisplay="${(name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487330156499')}" width=100 showFormatFunc=""  />
							<#assign batchPhaseName_displayDefaultType=''>
								<#assign batchPhaseName_defaultValue=''>
										<#assign batchPhaseName_defaultValue=''>
										 
									<@datacolumn key="batchPhaseName"        showFormat="TEXT" defaultValue="${(batchPhaseName_defaultValue!)?string}" defaultDisplay="${(batchPhaseName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1493276184676')}" width=100 showFormatFunc=""  />
							<#assign occurTurn_displayDefaultType=''>
								<#assign occurTurn_defaultValue=''>
										<#assign occurTurn_defaultValue=''>
										 									<@systemCodeColumn code="occurTurn" textalign="center" defaultValue="${(occurTurn_defaultValue!)?string}" key="occurTurn.id" editable=false type="selectcomp" notnull=false     label="${getText('RM.propertydisplayName.randon1487330199423')}" width=70   />
							<#assign activeType_displayDefaultType=''>
								<#assign activeType_defaultValue=''>
										<#assign activeType_defaultValue=''>
										 									<@systemCodeColumn code="activeType" textalign="left" defaultValue="${(activeType_defaultValue!)?string}" key="activeType.id" editable=false type="selectcomp" notnull=false     label="${getText('RM.propertydisplayName.randon1487330759313')}" width=80   />
							<#assign fromContainer_displayDefaultType=''>
								<#assign fromContainer_defaultValue=''>
										<#assign fromContainer_defaultValue=''>
										 									<@systemCodeColumn code="fromContainer" textalign="center" defaultValue="${(fromContainer_defaultValue!)?string}" key="fromContainer.id" editable=false type="selectcomp" notnull=false     label="${getText('RM.propertydisplayName.randon1488697524885')}" width=70   />
							<#assign container_displayDefaultType=''>
								<#assign container_defaultValue=''>
										<#assign container_defaultValue=''>
										 
									<@datacolumn key="container"        showFormat="TEXT" defaultValue="${(container_defaultValue!)?string}" defaultDisplay="${(container_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1488696547250')}" width=100 showFormatFunc=""  />
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

									<@datacolumn key="product.productCode"        showFormat="SELECTCOMP" defaultValue="${(product_productCode_defaultValue!)?string}" defaultDisplay="${(product_productCode_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="RM.formula.formulaProcess.processActiveView"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" width=80 showFormatFunc=""  />
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

									<@datacolumn key="product.productName"        showFormat="TEXT" defaultValue="${(product_productName_defaultValue!)?string}" defaultDisplay="${(product_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="RM.formula.formulaProcess.processActiveView"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" width=80 showFormatFunc=""  />
							<#assign isAgile_displayDefaultType=''>
								<#assign isAgile_defaultValue=''>
										<#assign isAgile_defaultValue=''>
										 
									<@datacolumn key="isAgile"        showFormat="CHECKBOX" defaultValue="${(isAgile_defaultValue!)?string}" defaultDisplay="${(isAgile_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon15035391802161122')}" width=60 showFormatFunc=""  />
							<#assign isReplace_displayDefaultType=''>
								<#assign isReplace_defaultValue=''>
										<#assign isReplace_defaultValue=''>
										 
									<@datacolumn key="isReplace"        showFormat="CHECKBOX" defaultValue="${(isReplace_defaultValue!)?string}" defaultDisplay="${(isReplace_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331060176')}" width=60 showFormatFunc=""  />
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
										 
									<@datacolumn key="minQuality"        showFormat="TEXT" defaultValue="${(minQuality_defaultValue!)?string}" defaultDisplay="${(minQuality_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1488696602815')}" width=100 showFormatFunc=""  />
							<#assign maxQuality_displayDefaultType=''>
								<#assign maxQuality_defaultValue=''>
										<#assign maxQuality_defaultValue=''>
										 
									<@datacolumn key="maxQuality"        showFormat="TEXT" defaultValue="${(maxQuality_defaultValue!)?string}" defaultDisplay="${(maxQuality_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1488696624224')}" width=100 showFormatFunc=""  />
							<#assign lossRate_displayDefaultType=''>
								<#assign lossRate_defaultValue=''>
										<#assign lossRate_defaultValue=''>
										 
									<@datacolumn key="lossRate"        showFormat="TEXT" defaultValue="${(lossRate_defaultValue!)?string}" defaultDisplay="${(lossRate_displayDefaultType!)?string}" decimal="6" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1495418354792')}" width=100 showFormatFunc=""  />
							<#assign longTime_displayDefaultType=''>
								<#assign longTime_defaultValue=''>
										<#assign longTime_defaultValue=''>
										 
									<@datacolumn key="longTime"        showFormat="TEXT" defaultValue="${(longTime_defaultValue!)?string}" defaultDisplay="${(longTime_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1490162289778')}" width=100 showFormatFunc=""  />
							<#assign auto_displayDefaultType=''>
								<#assign auto_defaultValue=''>
										<#assign auto_defaultValue=''>
										 
									<@datacolumn key="auto"        showFormat="CHECKBOX" defaultValue="${(auto_defaultValue!)?string}" defaultDisplay="${(auto_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331130107')}" width=80 showFormatFunc=""  />
							<#assign actOrder_displayDefaultType=''>
								<#assign actOrder_defaultValue=''>
										<#assign actOrder_defaultValue=''>
										 
									<@datacolumn key="actOrder"        showFormat="TEXT" defaultValue="${(actOrder_defaultValue!)?string}" defaultDisplay="${(actOrder_displayDefaultType!)?string}" decimal="" editable=false type="INTEGER" showType="integer" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1489911238343')}" width=100 showFormatFunc=""  />
							<#assign ingredientsOrder_displayDefaultType=''>
								<#assign ingredientsOrder_defaultValue=''>
										<#assign ingredientsOrder_defaultValue=''>
										 
									<@datacolumn key="ingredientsOrder"        showFormat="TEXT" defaultValue="${(ingredientsOrder_defaultValue!)?string}" defaultDisplay="${(ingredientsOrder_displayDefaultType!)?string}" decimal="" editable=false type="INTEGER" showType="integer" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331110232')}" width=80 showFormatFunc=""  />
							<#assign execSort_displayDefaultType=''>
								<#assign execSort_defaultValue=''>
										<#assign execSort_defaultValue=''>
										 
									<@datacolumn key="execSort"        showFormat="TEXT" defaultValue="${(execSort_defaultValue!)?string}" defaultDisplay="${(execSort_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1539917544374')}" width=60 showFormatFunc=""  />
							<#assign batchSite_displayDefaultType=''>
								<#assign batchSite_defaultValue=''>
										<#assign batchSite_defaultValue=''>
										 									<@systemCodeColumn code="batchSite" textalign="left" defaultValue="${(batchSite_defaultValue!)?string}" key="batchSite.id" editable=false type="selectcomp" notnull=false     label="${getText('RM.propertydisplayName.randon1487330829749')}" width=80   />
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

									<@datacolumn key="testProduct.code"        showFormat="SELECTCOMP" defaultValue="${(testProduct_code_defaultValue!)?string}" defaultDisplay="${(testProduct_code_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="RM.formula.formulaProcess.processActiveView"  textalign="left"  viewUrl="/RM/testProj/testProj/testProjSIRef.action" viewCode="RM_7.5.0.0_testProj_testProjSIRef" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1487596519107')}"  label="${getText('RM.propertydisplayName.randon148759638486223')}" width=80 showFormatFunc=""  />
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

									<@datacolumn key="qualityStandard.code"        showFormat="SELECTCOMP" defaultValue="${(qualityStandard_code_defaultValue!)?string}" defaultDisplay="${(qualityStandard_code_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="RM.formula.formulaProcess.processActiveView"  textalign="left"  viewUrl="/RM/qualityStandard/stand/standRef.action" viewCode="RM_7.5.0.0_qualityStandard_standRef" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1487596068024')}"  label="${getText('RM.propertydisplayName.randon148759542443623')}" width=80 showFormatFunc=""  />
							<#assign isWatchActive_displayDefaultType=''>
								<#assign isWatchActive_defaultValue=''>
										<#assign isWatchActive_defaultValue=''>
										 
									<@datacolumn key="isWatchActive"        showFormat="CHECKBOX" defaultValue="${(isWatchActive_defaultValue!)?string}" defaultDisplay="${(isWatchActive_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon148869652642623')}" width=70 showFormatFunc=""  />
							<#assign isAnaly_displayDefaultType=''>
								<#assign isAnaly_defaultValue=''>
										<#assign isAnaly_defaultValue=''>
										 
									<@datacolumn key="isAnaly"        showFormat="CHECKBOX" defaultValue="${(isAnaly_defaultValue!)?string}" defaultDisplay="${(isAnaly_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1543394912389')}" width=100 showFormatFunc=""  />
							<#assign finalInspection_displayDefaultType=''>
								<#assign finalInspection_defaultValue=''>
										<#assign finalInspection_defaultValue=''>
										 
									<@datacolumn key="finalInspection"        showFormat="CHECKBOX" defaultValue="${(finalInspection_defaultValue!)?string}" defaultDisplay="${(finalInspection_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1497849337000')}" width=100 showFormatFunc=""  />
							<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formula_FormulaProcessActive", "RM_7.5.0.0_formula_processActiveViewdg1489393020282", "DATAGRID", "formulaProcessActive")>
							<#-- 排布自定义字段 -->
							<#list customPropViewMappings as cpvm>
								<#assign cpvmColumnType = cpvm.property.type>
								<#assign cpvmKey = cpvm.propertyLayRec>
								<#assign cpvmType = cpvmColumnType?lower_case>
								
								<#assign cpEditable = false>
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
											<#assign selectCompName = 'RM.formula.formulaProcess.processActiveView'>
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
										 
									<@datacolumn key="meno"        showFormat="TEXT" defaultValue="${(meno_defaultValue!)?string}" defaultDisplay="${(meno_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331194516')}" width=100 showFormatFunc=""  />
							<#assign hiddenSort_displayDefaultType=''>
								<#assign hiddenSort_defaultValue=''>
										<#assign hiddenSort_defaultValue=''>
										 
									<@datacolumn key="hiddenSort"        showFormat="TEXT" defaultValue="${(hiddenSort_defaultValue!)?string}" defaultDisplay="${(hiddenSort_displayDefaultType!)?string}" decimal="6" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1539936079970')}" width=100 showFormatFunc=""  />
							<#assign channelOrManual_displayDefaultType=''>
								<#assign channelOrManual_defaultValue=''>
										<#assign channelOrManual_defaultValue=''>
										 
									<@datacolumn key="channelOrManual"        showFormat="CHECKBOX" defaultValue="${(channelOrManual_defaultValue!)?string}" defaultDisplay="${(channelOrManual_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1488776431957')}" width=100 showFormatFunc=""  />
							<#assign activeHiddenId_displayDefaultType=''>
								<#assign activeHiddenId_defaultValue=''>
										<#assign activeHiddenId_defaultValue=''>
										 
									<@datacolumn key="activeHiddenId"        showFormat="TEXT" defaultValue="${(activeHiddenId_defaultValue!)?string}" defaultDisplay="${(activeHiddenId_displayDefaultType!)?string}" decimal="" editable=false type="long" showType="long" notnull=false     textalign="center" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1488158485925')}" width=100 showFormatFunc=""  />
			
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
				function FormulaProcessActive_dg1489393020282_check_datagridvalid(){
					//
					var errorObj =FormulaProcessActive_dg1489393020282Widget._DT.testData();
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
				
				function savedg1489393020282DataGrid(){
					<#if  refId?? && (refId gt 0)>
					FormulaProcessActive_dg1489393020282Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('FormulaProcessActive_dg1489393020282Widget') > -1) {
						FormulaProcessActive_dg1489393020282Widget.setAllRowEdited();
					}
					var json = FormulaProcessActive_dg1489393020282Widget.parseEditedData();
					$('input[name="dg1489393020282ListJson"]').remove();
					$('input[name="dgLists[\'dg1489393020282\']"]').remove();
					$('input[name="dg1489393020282ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1489393020282\']">').val(json).appendTo($('#RM_formula_formulaProcess_processActiveView_form'));
					$('<input type="hidden" name="dg1489393020282ModelCode">').val('RM_7.5.0.0_formula_FormulaProcessActive').appendTo($('#RM_formula_formulaProcess_processActiveView_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1489393020282ListJson">').val(json).appendTo($('#RM_formula_formulaProcess_processActiveView_form'));
				}
				function DT_FormulaProcessActive_dg1489393020282_deldatagrid(){
					var deleteRows = FormulaProcessActive_dg1489393020282Widget.deleteRows();
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
						if($("#dg1489393020282DeletedIds").length>0){
							$("#dg1489393020282DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1489393020282DeletedIds" name="dgDeletedIds[\'dg1489393020282\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_processActiveView_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1489393020282DeletedIds['+CUI('input[name^="dg1489393020282DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_processActiveView_form'));
					});
					return deleteRows;
				}
				function DT_FormulaProcessActive_dg1489393020282_delTreeNodes(){
					var deleteRows = FormulaProcessActive_dg1489393020282Widget._DT.removeTreeNode();
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
						if($("#dg1489393020282DeletedIds").length>0){
							$("#dg1489393020282DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1489393020282DeletedIds" name="dgDeletedIds[\'dg1489393020282\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_processActiveView_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1489393020282DeletedIds['+CUI('input[name^="dg1489393020282DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_processActiveView_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('RM_formula_formulaProcess_processActiveView_datagrids');
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
							if(datagrids[0][i] == 'FormulaProcessActive_dg1489393020282') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'FormulaProcessActive_dg1489393020282';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'FormulaProcessActive_dg1489393020282';
					}
					$('body').data('RM_formula_formulaProcess_processActiveView_datagrids', datagrids);
				});
				
				var FormulaProcessActive_dg1489393020282_importDialog = null;
				function FormulaProcessActive_dg1489393020282_showImportDialog(){
					try{
						if(FormulaProcessActive_dg1489393020282_importDialog!=null&&FormulaProcessActive_dg1489393020282_importDialog.isShow==1){
							return false;
						}
						var url = "/RM/formula/formulaProcess/initImport.action?datagridCode=RM_7.5.0.0_formula_processActiveViewdg1489393020282&tid=${id!}&datagridName=dg1489393020282";
							<#if canImportExcel>
								var buttonCode="RM_7.5.0.0_formula_processActiveViewdg1489393020282_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						FormulaProcessActive_dg1489393020282_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("FormulaProcessActive_dg1489393020282"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();FormulaProcessActive_dg1489393020282_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();FormulaProcessActive_dg1489393020282_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						FormulaProcessActive_dg1489393020282_importDialog.show();
					}catch(e){}
				}	
				
				function FormulaProcessActive_dg1489393020282_downLoadFile(){
					var url = "/RM/formula/formulaProcess/downLoad.action?datagridCode=RM_7.5.0.0_formula_processActiveViewdg1489393020282&templateRelatedModelCode=RM_7.5.0.0_formula_processActiveViewdg1489393020282&downloadType=template&fileName=dg1489393020282";
					window.open(url,"","");
				}
				function dg1489393020282RenderOverEvent(){
					var tableObj = document.getElementById("FormulaProcessActive_dg1489393020282_tbody");
    for (var i = 0; i < tableObj.rows.length; i++) {    //遍历Table的所有Row 
        tableObj.rows[i].onclick=function(){  };                        
    }
$("#FormulaProcessActive_dg1489393020282").css("height","480px");
$("#FormulaProcessActive_dg1489393020282").children().children(".datagrid").children(".datagrid-bd").css("height","407px");
$("#FormulaProcessActive_dg1489393020282").children().children(".datagrid").children(".datagrid-fd").css("height","390px");
$("#FormulaProcessActive_dg1489393020282").children().children(".datagrid").children(".datagrid-bd").children().css("height","387px");
$("#FormulaProcessActive_dg1489393020282").children().children(".datagrid").css("height","437px");


var length=FormulaProcessActive_dg1489393020282Widget.getRowLength();
for(var i=0;i<length;i++){
            //活动类型
            var activeType=FormulaProcessActive_dg1489393020282Widget.getCellValue(i,'activeType.id');
            //如果是投配料
            if(activeType=='activeType/activeType4'){
                        $("#FormulaProcessActive_dg1489393020282_tbody tbody tr ").eq(i).attr('style','background:#cae6ff');
            }else if(activeType=='activeType/activeType2'){
                        $("#FormulaProcessActive_dg1489393020282_tbody tbody tr ").eq(i).attr('style','background:#daf4d7');
            }
            
}

//添加双击事件
$("#FormulaProcessActive_dg1489393020282_tbody tr").dblclick(function () {
    var SelectedRow = FormulaProcessActive_dg1489393020282Widget.getSelectedRow();
    var activeType = FormulaProcessActive_dg1489393020282Widget.getCellValue(SelectedRow, 'activeType.id')
    var activeId = FormulaProcessActive_dg1489393020282Widget.getCellValue(SelectedRow, 'id');
    if (activeType == 'activeType/activeType2') {
        activeId = FormulaProcessActive_dg1489393020282Widget.getCellValue(SelectedRow, 'activeHiddenId');
    }
    var length = PrecessStandards_dg1489393020445Widget.getRowLength();
    var checkFlag = 'true';
    //如果当前选中的工序活动与之前选中的工序活动不一致进行提示
    // if (bdforeRow != SelectedRow) {
    //     //alert(1);
    //     if (Number(length) > 0) {
    //         for (var i = 0; i< length; i++) {
    //             //指标
    //             var quota = PrecessStandards_dg1489393020445Widget.getCellValue(i, 'quota');
    //             //标准值
    //             var standValue = PrecessStandards_dg1489393020445Widget.getCellValue(i, 'stValue');
    //             var row = i + 1;
    //             var processName = FormulaProcessActive_dg1489393020282Widget.getCellValue(bdforeRow, 'name');
    //             if (quota == undefined || quota == '') {
    //                 checkFlag = 'false';
    //                 break;
    //             }
    //             if (standValue == undefined || standValue == '') {
    //                 checkFlag = 'false';
    //             }
    //         }
    //     }
    // }

    if (checkFlag == 'true') {

        if (activeType != 'activeType/activeType4' && activeType != 'activeType/activeType2') {
            otherEdit = new CUI.Dialog({
                title: "其他活动设置",
                type: 5,
                modal: true,
                url: '/RM/formula/formulaProcessActive/otherActiveView.action?entityCode=RM_7.5.0.0_formula&id=' + activeId + "&${getPowerCode('otherActiveEdit')}",
                buttons: [
            {
                name:"关闭",
                handler: function () {
                    this.close()
                }
            }
        ]
        });
            otherEdit.show();
        } else {
            var manualOrChannel = FormulaProcessActive_dg1489393020282Widget.getCellValue(SelectedRow, 'channelOrManual');
            if (manualOrChannel == true) {
                fomulaActive = new CUI.Dialog({
                    title: "${getText('RM.formulaActive.radion141234234')}",
                    type: 5,
                    modal: true,
                    url: '/RM/formula/formulaProcessActive/channelActiveView.action?entityCode=RM_7.5.0.0_formula&id=' + activeId + "&${getPowerCode('channelActiveEdit')}",
                    buttons: [
                        {
                            name: "关闭",
                            handler: function () {
                                this.close()
                            }
                        }]
                });
                fomulaActive.show();
            } else {
                manualActive = new CUI.Dialog({
                    title: "${getText('RM.formulaActive.radion1412123121')}",
                    type: 5,
                    modal: true,
                    url: '/RM/formula/formulaProcessActive/manualActiveView.action?entityCode=RM_7.5.0.0_formula&id=' + activeId + "&${getPowerCode('manualActiveEdit')}",
                    buttons: [
                        {
                            name: "关闭",
                            handler: function () {
                                this.close()
                            }
                        }]
                });
                manualActive.show();
            }
        }
    }

});
var heigh = $(window).height();
FormulaProcessActive_dg1489393020282Widget._DT.setHeight( heigh*0.8 );
$.ajax({
    url : "/RM/formula/formula/getSynchronData.action",
    type : "get",
    dataType : "json",
    async : false,
    success : function(data){
        var IsOpen = JSON.stringify(data.result);
        if(IsOpen == 'false'){
            $(".paginatorbar-operatebar a").eq(0).hide();
            $( 'td[key="isAnaly"]').hide();
            FormulaProcessActive_dg1489393020282Widget._DT._resizeHeight = true;  
            FormulaProcessActive_dg1489393020282Widget._DT._initDomElements();
            FormulaProcessActive_dg1489393020282Widget._DT._resizeHeight = false;  
        }
    }

});
				}
				function dg1489393020282PageInitMethod(nTabIndex){
					RM.formula.formulaProcess.processActiveView.initSize(nTabIndex);
					var heigh = $(window).height();
FormulaProcessActive_dg1489393020282Widget._DT.setHeight( heigh*0.8 );
//隐藏提交按钮
$('#edit-submit-btn').hide();
//隐藏底部的保存、提交、填写意见
$('.edit-workflow').hide();
$('input[name="formulaProcess.formId"]').val(${id});
$.ajax({
    url : "/RM/formula/formula/getSynchronData.action",
    type : "get",
    dataType : "json",
    async : false,
    success : function(data){
       
        var IsOpen = JSON.stringify(data.result);
        if(IsOpen == 'false'){
            $(".paginatorbar-operatebar a").eq(0).hide();
        }
    }
});
$(".paginatorbar-operatebar a:eq(0) span").attr('class','buttonbar-button cui-btn-cdsz');
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
								<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formula_PrecessStandards", "RM_7.5.0.0_formula_processActiveViewdg1489393020445", "DATAGRID", "precessStandards")>
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
			
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/RM/formula/formulaProcess/data-dg1489393020445.action?formulaProcess.id=${refId!-1}&refId=${refId!-1}&datagridCode=RM_7.5.0.0_formula_processActiveViewdg1489393020445">
			<#else>
				<#assign dUrl="/RM/formula/formulaProcess/data-dg1489393020445.action?formulaProcess.id=${(formulaProcess.id)!-1}&datagridCode=RM_7.5.0.0_formula_processActiveViewdg1489393020445">
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
					<input type="hidden" id="dg_cp_info_PrecessStandards_dg1489393020445" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1489393020445_id" value="PrecessStandards_dg1489393020445" />
			
			<input type="hidden" id="dg1489393020445_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('RM.modelname.randon1487331249205')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/RM/formula/formulaProcess/data-dg1489393020445.action?operateType=export&datagridCode=RM_7.5.0.0_formula_processActiveViewdg1489393020445"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="PrecessStandards_dg1489393020445" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="PrecessStandards_dg1489393020445" viewType="${viewType}" renderOverEvent="dg1489393020445RenderOverEvent" route="${routeFlag}" formId="RM_formula_formulaProcess_processActiveView_form" noPermissionKeys="quota,stValue,overrunFlag,limitInter,upperLimit,maxLimit,lowerLimit,loweMxLimit,fluctuateFlag,flucUpperLimit,flucLowerLimit" modelCode="RM_7.5.0.0_formula_PrecessStandards" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1489393020445" dtPage="dgPage"  hidekeyPrefix="dg1489393020445" hidekey="['id','version'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=false  buttons="${buttons}" noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1489393020445PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=false cannotDeleteRow=true assModelDisplayName=assModelDisplayName dgTitle="${getText('RM.dataGriddataGridName.radion148818169604023')}" activexButton="" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign quota_displayDefaultType=''>
								<#assign quota_defaultValue=''>
										<#assign quota_defaultValue=''>
										 
									<@datacolumn key="quota"        showFormat="TEXT" defaultValue="${(quota_defaultValue!)?string}" defaultDisplay="${(quota_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331350188')}" width=100 showFormatFunc=""  />
							<#assign stValue_displayDefaultType=''>
								<#assign stValue_defaultValue=''>
										<#assign stValue_defaultValue=''>
										 
									<@datacolumn key="stValue"        showFormat="TEXT" defaultValue="${(stValue_defaultValue!)?string}" defaultDisplay="${(stValue_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331365964')}" width=100 showFormatFunc=""  />
							<#assign overrunFlag_displayDefaultType=''>
								<#assign overrunFlag_defaultValue=''>
										<#assign overrunFlag_defaultValue=''>
										 
									<@datacolumn key="overrunFlag"        showFormat="CHECKBOX" defaultValue="${(overrunFlag_defaultValue!)?string}" defaultDisplay="${(overrunFlag_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331380816')}" width=100 showFormatFunc=""  />
							<#assign limitInter_displayDefaultType=''>
								<#assign limitInter_defaultValue=''>
										<#assign limitInter_defaultValue=''>
										 
									<@datacolumn key="limitInter"        showFormat="TEXT" defaultValue="${(limitInter_defaultValue!)?string}" defaultDisplay="${(limitInter_displayDefaultType!)?string}" decimal="" editable=false type="INTEGER" showType="integer" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331398438')}" width=100 showFormatFunc=""  />
							<#assign upperLimit_displayDefaultType=''>
								<#assign upperLimit_defaultValue=''>
										<#assign upperLimit_defaultValue=''>
										 
										
										
										
										
										

									<@datacolumn key="upperLimit"        showFormat="TEXT" defaultValue="${(upperLimit_defaultValue!)?string}" defaultDisplay="${(upperLimit_displayDefaultType!)?string}" onchange="PrecessStandards_dg1489393020445Widget.evalCustomFunction(nRow,sFieldName,'upChange()')" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331419739')}" width=100 showFormatFunc=""  />
							<#assign maxLimit_displayDefaultType=''>
								<#assign maxLimit_defaultValue=''>
										<#assign maxLimit_defaultValue=''>
										 
										
										
										
										
										

									<@datacolumn key="maxLimit"        showFormat="TEXT" defaultValue="${(maxLimit_defaultValue!)?string}" defaultDisplay="${(maxLimit_displayDefaultType!)?string}" onchange="PrecessStandards_dg1489393020445Widget.evalCustomFunction(nRow,sFieldName,'mixChange()')" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331435990')}" width=100 showFormatFunc=""  />
							<#assign lowerLimit_displayDefaultType=''>
								<#assign lowerLimit_defaultValue=''>
										<#assign lowerLimit_defaultValue=''>
										 
										
										
										
										
										

									<@datacolumn key="lowerLimit"        showFormat="TEXT" defaultValue="${(lowerLimit_defaultValue!)?string}" defaultDisplay="${(lowerLimit_displayDefaultType!)?string}" onchange="PrecessStandards_dg1489393020445Widget.evalCustomFunction(nRow,sFieldName,'lowChange()')" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331461257')}" width=100 showFormatFunc=""  />
							<#assign loweMxLimit_displayDefaultType=''>
								<#assign loweMxLimit_defaultValue=''>
										<#assign loweMxLimit_defaultValue=''>
										 
										
										
										
										
										

									<@datacolumn key="loweMxLimit"        showFormat="TEXT" defaultValue="${(loweMxLimit_defaultValue!)?string}" defaultDisplay="${(loweMxLimit_displayDefaultType!)?string}" onchange="PrecessStandards_dg1489393020445Widget.evalCustomFunction(nRow,sFieldName,'minChange()')" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331479070')}" width=100 showFormatFunc=""  />
							<#assign fluctuateFlag_displayDefaultType=''>
								<#assign fluctuateFlag_defaultValue=''>
										<#assign fluctuateFlag_defaultValue=''>
										 
									<@datacolumn key="fluctuateFlag"        showFormat="CHECKBOX" defaultValue="${(fluctuateFlag_defaultValue!)?string}" defaultDisplay="${(fluctuateFlag_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331497771')}" width=100 showFormatFunc=""  />
							<#assign flucUpperLimit_displayDefaultType=''>
								<#assign flucUpperLimit_defaultValue=''>
										<#assign flucUpperLimit_defaultValue=''>
										 
									<@datacolumn key="flucUpperLimit"        showFormat="TEXT" defaultValue="${(flucUpperLimit_defaultValue!)?string}" defaultDisplay="${(flucUpperLimit_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331533263')}" width=100 showFormatFunc=""  />
							<#assign flucLowerLimit_displayDefaultType=''>
								<#assign flucLowerLimit_defaultValue=''>
										<#assign flucLowerLimit_defaultValue=''>
										 
									<@datacolumn key="flucLowerLimit"        showFormat="TEXT" defaultValue="${(flucLowerLimit_defaultValue!)?string}" defaultDisplay="${(flucLowerLimit_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331551106')}" width=100 showFormatFunc=""  />
							<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formula_PrecessStandards", "RM_7.5.0.0_formula_processActiveViewdg1489393020445", "DATAGRID", "precessStandards")>
							<#-- 排布自定义字段 -->
							<#list customPropViewMappings as cpvm>
								<#assign cpvmColumnType = cpvm.property.type>
								<#assign cpvmKey = cpvm.propertyLayRec>
								<#assign cpvmType = cpvmColumnType?lower_case>
								
								<#assign cpEditable = false>
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
											<#assign selectCompName = 'RM.formula.formulaProcess.processActiveView'>
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
				function PrecessStandards_dg1489393020445_check_datagridvalid(){
					//
					var errorObj =PrecessStandards_dg1489393020445Widget._DT.testData();
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
				
				function savedg1489393020445DataGrid(){
					<#if  refId?? && (refId gt 0)>
					PrecessStandards_dg1489393020445Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('PrecessStandards_dg1489393020445Widget') > -1) {
						PrecessStandards_dg1489393020445Widget.setAllRowEdited();
					}
					var json = PrecessStandards_dg1489393020445Widget.parseEditedData();
					$('input[name="dg1489393020445ListJson"]').remove();
					$('input[name="dgLists[\'dg1489393020445\']"]').remove();
					$('input[name="dg1489393020445ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1489393020445\']">').val(json).appendTo($('#RM_formula_formulaProcess_processActiveView_form'));
					$('<input type="hidden" name="dg1489393020445ModelCode">').val('RM_7.5.0.0_formula_PrecessStandards').appendTo($('#RM_formula_formulaProcess_processActiveView_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1489393020445ListJson">').val(json).appendTo($('#RM_formula_formulaProcess_processActiveView_form'));
				}
				function DT_PrecessStandards_dg1489393020445_deldatagrid(){
					var deleteRows = PrecessStandards_dg1489393020445Widget.deleteRows();
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
						if($("#dg1489393020445DeletedIds").length>0){
							$("#dg1489393020445DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1489393020445DeletedIds" name="dgDeletedIds[\'dg1489393020445\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_processActiveView_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1489393020445DeletedIds['+CUI('input[name^="dg1489393020445DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_processActiveView_form'));
					});
					return deleteRows;
				}
				function DT_PrecessStandards_dg1489393020445_delTreeNodes(){
					var deleteRows = PrecessStandards_dg1489393020445Widget._DT.removeTreeNode();
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
						if($("#dg1489393020445DeletedIds").length>0){
							$("#dg1489393020445DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1489393020445DeletedIds" name="dgDeletedIds[\'dg1489393020445\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_processActiveView_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1489393020445DeletedIds['+CUI('input[name^="dg1489393020445DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_processActiveView_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('RM_formula_formulaProcess_processActiveView_datagrids');
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
							if(datagrids[0][i] == 'PrecessStandards_dg1489393020445') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'PrecessStandards_dg1489393020445';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'PrecessStandards_dg1489393020445';
					}
					$('body').data('RM_formula_formulaProcess_processActiveView_datagrids', datagrids);
				});
				
				var PrecessStandards_dg1489393020445_importDialog = null;
				function PrecessStandards_dg1489393020445_showImportDialog(){
					try{
						if(PrecessStandards_dg1489393020445_importDialog!=null&&PrecessStandards_dg1489393020445_importDialog.isShow==1){
							return false;
						}
						var url = "/RM/formula/formulaProcess/initImport.action?datagridCode=RM_7.5.0.0_formula_processActiveViewdg1489393020445&tid=${id!}&datagridName=dg1489393020445";
							<#if canImportExcel>
								var buttonCode="RM_7.5.0.0_formula_processActiveViewdg1489393020445_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						PrecessStandards_dg1489393020445_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("PrecessStandards_dg1489393020445"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();PrecessStandards_dg1489393020445_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();PrecessStandards_dg1489393020445_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						PrecessStandards_dg1489393020445_importDialog.show();
					}catch(e){}
				}	
				
				function PrecessStandards_dg1489393020445_downLoadFile(){
					var url = "/RM/formula/formulaProcess/downLoad.action?datagridCode=RM_7.5.0.0_formula_processActiveViewdg1489393020445&templateRelatedModelCode=RM_7.5.0.0_formula_processActiveViewdg1489393020445&downloadType=template&fileName=dg1489393020445";
					window.open(url,"","");
				}
				function dg1489393020445RenderOverEvent(){
					$('#PrecessStandards_dg1489393020445').hide();
				}
				function dg1489393020445PageInitMethod(nTabIndex){
					RM.formula.formulaProcess.processActiveView.initSize(nTabIndex);
					var heigh = $(window).height();
/*PrecessStandards_dg1489393020445Widget._DT.setHeight( heigh*0.2 );*/
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
     	
		<div id="RM_formula_formulaProcess_processActiveView_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<#if ((formulaProcess.effectiveState)!0) == 0>
				<#if !(superEdit!false)>
				<li id="flowHead" onclick="RM.formula.formulaProcess.processActiveView.showFlowInfo('flow')"><span class="icon_prograss"></span>${getText("ec.flow.flowImage")}</li>
				</#if>
				</#if>
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="RM.formula.formulaProcess.processActiveView.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
				<li id="dealInfoHead" class="bar" onclick="RM.formula.formulaProcess.processActiveView.showDealInfo('dealInfo')"><span class="icon_handle"></span>${getText("ec.view.dealadvice")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<#if ((formulaProcess.effectiveState)!0) == 0>
				<#if !(superEdit!false)>
				<div class="flow-height wid" id="flowDiv"></div>
				</#if>
				</#if>
				<div id="fileUploadDiv" class="wid-hei"></div>
				<div style="padding:1px 0px 0px 0px;" id="dealInfoDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-VIEW-RM_7.5.0.0_formula_processActiveView,html,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) -->
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
						$("#RM_formula_formulaProcess_processActiveView_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#RM_formula_formulaProcess_processActiveView_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#RM_formula_formulaProcess_processActiveView_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#RM_formula_formulaProcess_processActiveView_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			RM.formula.formulaProcess.processActiveView.initCount = 0;
			RM.formula.formulaProcess.processActiveView.initSize = function(nTabIndex){
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
				var conHeight = h-$("#RM_formula_formulaProcess_processActiveView_main_div .edit-head").height()-$("#RM_formula_formulaProcess_processActiveView_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#RM_formula_formulaProcess_processActiveView_main_div .edit-workflow").height()</#if>;
				$("#RM_formula_formulaProcess_processActiveView_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('RM_formula_formulaProcess_processActiveView_datagrids');
				var padding_bottom=16;
				$("#RM_formula_formulaProcess_processActiveView_main_div .pd_bottom,#RM_formula_formulaProcess_processActiveView_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#RM_formula_formulaProcess_processActiveView_main_div .edit-panes-s").each(function(index){
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
									if(RM.formula.formulaProcess.processActiveView.initCount <= 2) {
										setTimeout(function(){RM.formula.formulaProcess.processActiveView.initSize();}, 200);
										RM.formula.formulaProcess.processActiveView.initCount++;
									}/* else {
										RM.formula.formulaProcess.processActiveView.initCount = 0;
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
							if(($("#RM_formula_formulaProcess_processActiveView_main_div .edit-workflow").length > 0) && ($("#RM_formula_formulaProcess_processActiveView_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				$('#RM_formula_formulaProcess_processActiveView_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				RM.formula.formulaProcess.processActiveView.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				RM.formula.formulaProcess.processActiveView.initSize();
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
						if(parseInt($("#RM_formula_formulaProcess_processActiveView_main_div").css("width"),10)==650){
							$("#RM_formula_formulaProcess_processActiveView_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//RM.formula.formulaProcess.processActiveView.resizeLayout();
						//RM.formula.formulaProcess.processActiveView.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#RM_formula_formulaProcess_processActiveView_main_div").css("width"),10)==800){
							$("#RM_formula_formulaProcess_processActiveView_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//RM.formula.formulaProcess.processActiveView.resizeLayout();
						//RM.formula.formulaProcess.processActiveView.initSize();
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
					RM.formula.formulaProcess.processActiveView.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					RM.formula.formulaProcess.processActiveView.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){RM.formula.formulaProcess.processActiveView.initSize();});
				/*
				RM.formula.formulaProcess.processActiveView.resizeLayout=function(){
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
			RM.formula.formulaProcess.processActiveView.setDepartment();
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

		RM.formula.formulaProcess.processActiveView.validate = function(){
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
		RM.formula.formulaProcess.processActiveView.beforeSaveProcess = function(){
			$('input[name="formulaProcess.extraCol"]').remove();
		}
		RM.formula.formulaProcess.processActiveView.processDataGrid = function(){
										<#if false && isIE>
										$('#RM_formula_formulaProcess_processActiveView_form').append(FormulaProcessActive_dg1489393020282Widget._DT.createInputs('dg1489393020282List'));
										</#if>
										<#if false && isIE>
										$('#RM_formula_formulaProcess_processActiveView_form').append(PrecessStandards_dg1489393020445Widget._DT.createInputs('dg1489393020445List'));
										</#if>
		};
		RM.formula.formulaProcess.processActiveView.save = function(){
			<#if !(superEdit!false)>
			$('#operateType').val("save");
			<#else>
			$('#operateType').val("submit");
			</#if>
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!RM.formula.formulaProcess.processActiveView.validate()){return;}
			//延迟到延迟提交中处理,解决onchange事件无法触发问题
			//RM.formula.formulaProcess.processActiveView.beforeSaveProcess();

			//RM.formula.formulaProcess.processActiveView.processDataGrid();
			$('#RM_formula_formulaProcess_processActiveView_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('RM_formula_formulaProcess_processActiveView_form','RM_formula_formulaProcess_processActiveView_datagrids')) {      
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
		RM.formula.formulaProcess.processActiveView.print = function(){
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
		
		RM.formula.formulaProcess.processActiveView.saveSetting = function(){
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
		
		RM.formula.formulaProcess.processActiveView.printSetting = function(){
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
				RM.formula.formulaProcess.processActiveView.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(RM.formula.formulaProcess.processActiveView.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				RM.formula.formulaProcess.processActiveView.settingDialog.show();
			}
		}
		
		
		
		RM.formula.formulaProcess.processActiveView.reject = function(){
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
			RM.formula.formulaProcess.processActiveView.submit();
		}
		
		RM.formula.formulaProcess.processActiveView.submit = function(uncheck){
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
			if(!RM.formula.formulaProcess.processActiveView.validate()){return;}
			
			//$('#__workflow_outcomeDes').val($('input[name="workFlowVar.outcome"]:checked').attr('des'));
			
			RM.formula.formulaProcess.processActiveView.beforeSaveProcess();
			
			//RM.formula.formulaProcess.processActiveView.processDataGrid();
			
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
			$('#RM_formula_formulaProcess_processActiveView_form').submit();
			//$(".wfcancel").remove();
			
		}
		RM.formula.formulaProcess.processActiveView.recall = function(){
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
		RM.formula.formulaProcess.processActiveView._callBackInfo = function(res){
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
		RM.formula.formulaProcess.processActiveView.setDepartment = function(){
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
				RM.formula.formulaProcess.processActiveView._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				RM.formula.formulaProcess.processActiveView._isObjCustomProp_IE = isObjCustomProp;
			} else {
				RM.formula.formulaProcess.processActiveView._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				RM.formula.formulaProcess.processActiveView._objCustomPropNames_IE = objCustomPropNames;
			} else {
				RM.formula.formulaProcess.processActiveView._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				RM.formula.formulaProcess.processActiveView._refViewCode_IE = viewCode;
			} else {
				RM.formula.formulaProcess.processActiveView._refViewCode_IE = '';
			}
			RM.formula.formulaProcess.processActiveView._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		RM.formula.formulaProcess.processActiveView.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			RM.formula.formulaProcess.processActiveView._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			RM.formula.formulaProcess.processActiveView._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			RM.formula.formulaProcess.processActiveView.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			RM.formula.formulaProcess.processActiveView._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				RM.formula.formulaProcess.processActiveView._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		RM.formula.formulaProcess.processActiveView._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(RM.formula.formulaProcess.processActiveView._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(RM.formula.formulaProcess.processActiveView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				RM.formula.formulaProcess.processActiveView.gridEventObj = gridEventObj;
				callbackName = "RM.formula.formulaProcess.processActiveView.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "RM.formula.formulaProcess.processActiveView.getMultiselectCallBackInfo_DG" : "RM.formula.formulaProcess.processActiveView.getcallBackInfo_DG";
				RM.formula.formulaProcess.processActiveView._currRow = $(obj).closest('tr')[0];
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="RM.formula.formulaProcess.processActiveView.getcallBackInfo";
			}

			if(_prefix!=''){
				RM.formula.formulaProcess.processActiveView._prefix = _prefix.substring(1);
			}
			
			RM.formula.formulaProcess.processActiveView._oGrid = oGrid;
			RM.formula.formulaProcess.processActiveView._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					RM.formula.formulaProcess.processActiveView._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					RM.formula.formulaProcess.processActiveView._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					RM.formula.formulaProcess.processActiveView._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					RM.formula.formulaProcess.processActiveView._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					RM.formula.formulaProcess.processActiveView._refViewCode = oColumn.viewCode;
				} else {
					RM.formula.formulaProcess.processActiveView._refViewCode = '';
				}
			} else {
				RM.formula.formulaProcess.processActiveView._isObjCustomProp = false;
				RM.formula.formulaProcess.processActiveView._objCustomPropNames = '';
				RM.formula.formulaProcess.processActiveView._refViewCode = '';
			}
			if (RM.formula.formulaProcess.processActiveView._isObjCustomProp == true && RM.formula.formulaProcess.processActiveView._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				RM.formula.formulaProcess.processActiveView._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				RM.formula.formulaProcess.processActiveView._customCallBack = customCallBack;
			}
			if(RM.formula.formulaProcess.processActiveView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(RM.formula.formulaProcess.processActiveView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof RM.formula.formulaProcess.processActiveView._querycustomFuncN == "function") {
				refparam += RM.formula.formulaProcess.processActiveView._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			RM.formula.formulaProcess.processActiveView._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		RM.formula.formulaProcess.processActiveView._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(RM.formula.formulaProcess.processActiveView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(RM.formula.formulaProcess.processActiveView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			RM.formula.formulaProcess.processActiveView._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'RM.formula.formulaProcess.processActiveView.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		RM.formula.formulaProcess.processActiveView._querycustomFunc = function(obj) {
			var str = eval("typeof(RM.formula.formulaProcess.processActiveView.query_"+obj+")!='undefined'") ? eval('RM.formula.formulaProcess.processActiveView.query_'+obj+'()') : null;
			return str;
		};
		RM.formula.formulaProcess.processActiveView.getcallBackGroupInfo = function(obj){
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
			RM.formula.formulaProcess.processActiveView._dialog.close();
		}
		RM.formula.formulaProcess.processActiveView.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('RM_formula_formulaProcess_processActiveView_form',obj[0], RM.formula.formulaProcess.processActiveView._prefix, RM.formula.formulaProcess.processActiveView._sUrl);
			CUI.commonFills('RM_formula_formulaProcess_processActiveView_form',RM.formula.formulaProcess.processActiveView._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (RM.formula.formulaProcess.processActiveView._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(RM.formula.formulaProcess.processActiveView._customCallBack) {
					eval(RM.formula.formulaProcess.processActiveView._customCallBack);
					RM.formula.formulaProcess.processActiveView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.formula.formulaProcess.processActiveView._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		RM.formula.formulaProcess.processActiveView.getcallBackInfo_DG_IE = function(obj){
			if(RM.formula.formulaProcess.processActiveView._customBeforeCallBack) {
				var flag = eval(RM.formula.formulaProcess.processActiveView._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = RM.formula.formulaProcess.processActiveView.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( RM.formula.formulaProcess.processActiveView._isObjCustomProp_IE == true && RM.formula.formulaProcess.processActiveView._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,RM.formula.formulaProcess.processActiveView._sUrl,RM.formula.formulaProcess.processActiveView._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,RM.formula.formulaProcess.processActiveView._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (RM.formula.formulaProcess.processActiveView._isObjCustomProp_IE == true && RM.formula.formulaProcess.processActiveView._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = RM.formula.formulaProcess.processActiveView._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = RM.formula.formulaProcess.processActiveView._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && RM.formula.formulaProcess.processActiveView._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + RM.formula.formulaProcess.processActiveView._refViewCode_IE + '&id=' + id,
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
				if(RM.formula.formulaProcess.processActiveView._customCallBack) {
					eval(RM.formula.formulaProcess.processActiveView._customCallBack);
					RM.formula.formulaProcess.processActiveView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.formula.formulaProcess.processActiveView._dialog.close();
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
		
		RM.formula.formulaProcess.processActiveView.getcallBackInfo_DG = function(obj){
			if(RM.formula.formulaProcess.processActiveView._customBeforeCallBack) {
				var flag = eval(RM.formula.formulaProcess.processActiveView._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(RM.formula.formulaProcess.processActiveView._currRow).next().length==0){
						RM.formula.formulaProcess.processActiveView._oGrid.addNewRow();
					}	
					RM.formula.formulaProcess.processActiveView._currRow = $(RM.formula.formulaProcess.processActiveView._currRow).next();
					$(RM.formula.formulaProcess.processActiveView._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(RM.formula.formulaProcess.processActiveView._currRow,obj[i], RM.formula.formulaProcess.processActiveView._prefix, RM.formula.formulaProcess.processActiveView._sUrl);
				if (RM.formula.formulaProcess.processActiveView._isObjCustomProp == true && RM.formula.formulaProcess.processActiveView._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(RM.formula.formulaProcess.processActiveView._currRow,RM.formula.formulaProcess.processActiveView._prefix,obj[i],RM.formula.formulaProcess.processActiveView._oGrid,RM.formula.formulaProcess.processActiveView._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(RM.formula.formulaProcess.processActiveView._currRow,RM.formula.formulaProcess.processActiveView._prefix,obj[i],RM.formula.formulaProcess.processActiveView._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + RM.formula.formulaProcess.processActiveView._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + RM.formula.formulaProcess.processActiveView._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && RM.formula.formulaProcess.processActiveView._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + RM.formula.formulaProcess.processActiveView._refViewCode + '&id=' + id,
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
									name = RM.formula.formulaProcess.processActiveView._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(RM.formula.formulaProcess.processActiveView._currRow, objs, RM.formula.formulaProcess.processActiveView._oGrid);
							}
						}
					}
				}
			}
			try{
				if(RM.formula.formulaProcess.processActiveView._customCallBack) {
					eval(RM.formula.formulaProcess.processActiveView._customCallBack);
					RM.formula.formulaProcess.processActiveView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.formula.formulaProcess.processActiveView._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + RM.formula.formulaProcess.processActiveView._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		RM.formula.formulaProcess.processActiveView.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(RM.formula.formulaProcess.processActiveView._oGrid, RM.formula.formulaProcess.processActiveView._currRow, RM.formula.formulaProcess.processActiveView._key, RM.formula.formulaProcess.processActiveView._displayFieldName, obj[i])
			}
			try{
				if(RM.formula.formulaProcess.processActiveView._customCallBack) {
					eval(RM.formula.formulaProcess.processActiveView._customCallBack);
					RM.formula.formulaProcess.processActiveView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.formula.formulaProcess.processActiveView._dialog.close();
			} catch(e){}
		};
		
		RM.formula.formulaProcess.processActiveView.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						RM.formula.formulaProcess.processActiveView.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#RM_formula_formulaProcess_processActiveView_form'));
						}
					}
				}
			});
		};

		$(function(){
			RM.formula.formulaProcess.processActiveView.onloadForProduct();
			//隐藏提交按钮
$('#edit-submit-btn').hide();
//隐藏底部的保存、提交、填写意见
$('.edit-workflow').hide();
$('input[name="formulaProcess.formId"]').val(${id});
		});

		RM.formula.formulaProcess.processActiveView.beforeSubmitMethodSettingInPage = function(){
			RM.formula.formulaProcess.processActiveView.onsaveForProduct();
		};
		RM.formula.formulaProcess.processActiveView.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  RM.formula.formulaProcess.processActiveView.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		RM.formula.formulaProcess.processActiveView.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#RM_formula_formulaProcess_processActiveView_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#RM_formula_formulaProcess_processActiveView_main_div").hide();
				},100);
				//CUI("#RM_formula_formulaProcess_processActiveView_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		RM.formula.formulaProcess.processActiveView.showThis = function(){
			if(!CUI("#RM_formula_formulaProcess_processActiveView_main_div").is(':visible')) {
				CUI("#RM_formula_formulaProcess_processActiveView_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		RM.formula.formulaProcess.processActiveView.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			RM.formula.formulaProcess.processActiveView.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "RM_formula_formulaProcess_processActiveView_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=RM&modelName=RM_7.5.0.0_formula_FormulaProcess&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			RM.formula.formulaProcess.processActiveView.auditDialog.show();
			</#if>
		}
		
		
		RM.formula.formulaProcess.processActiveView.showInfoDialog=function(mode){
			
			RM.formula.formulaProcess.processActiveView.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "RM_formula_formulaProcess_processActiveView_dealInfo",
				modal:true,
				height:500,
				width: 950,//适应国际化版
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			RM.formula.formulaProcess.processActiveView.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		RM.formula.formulaProcess.processActiveView.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			<#if pendingId??>
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=RM_7.5.0.0_formula");
			<#else>
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?readOnlyFlag=true&linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=RM_7.5.0.0_formula");
			</#if>
			}
		}
		
		RM.formula.formulaProcess.processActiveView.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/RM/formula/formulaProcess/dealInfo-list.action&dlTableInfoId=${(formulaProcess.tableInfoId)?default('')}");
			}
		}
		RM.formula.formulaProcess.processActiveView.showFlowInfo=function(){
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
		RM.formula.formulaProcess.processActiveView.supervision=function(){
			RM.formula.formulaProcess.processActiveView.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(formulaProcess.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				RM.formula.formulaProcess.processActiveView.modifyOwnerStaffDialog.show();
		}
		




function upChange(){
	var row=PrecessStandards_dg1487555065561Widget.getSelectedRow();
    var upper=PrecessStandards_dg1487555065561Widget.getCellValue(row,"upperLimit");
    var mix=PrecessStandards_dg1487555065561Widget.getCellValue(row,"maxLimit");
    var lower=PrecessStandards_dg1487555065561Widget.getCellValue(row,"lowerLimit");
    var min=PrecessStandards_dg1487555065561Widget.getCellValue(row,"loweMxLimit");
	if(mix!="" || lower!="" || min!=""){
	    if(upper>mix){
	        workbenchErrorBarWidget.showMessage("${getText('RM.formula.randon11111112')}");
	        PrecessStandards_dg1487555065561Widget.setCellValue(row,"upperLimit","");
        }
	    if(lower>upper || min>upper){
		    workbenchErrorBarWidget.showMessage("${getText('RM.formula.randon11111113')}");
	        PrecessStandards_dg1487555065561Widget.setCellValue(row,"upperLimit","");
	   }
    }
}
function mixChange(){
	var row=PrecessStandards_dg1487555065561Widget.getSelectedRow();
    var upper=PrecessStandards_dg1487555065561Widget.getCellValue(row,"upperLimit");
    var mix=PrecessStandards_dg1487555065561Widget.getCellValue(row,"maxLimit");
    var lower=PrecessStandards_dg1487555065561Widget.getCellValue(row,"lowerLimit");
    var min=PrecessStandards_dg1487555065561Widget.getCellValue(row,"loweMxLimit");
	if(upper!="" || lower!="" || min!=""){
	    if(mix<upper || mix<lower || mix<min){
		    workbenchErrorBarWidget.showMessage("${getText('RM.formula.randon11111111')}");
		    PrecessStandards_dg1487555065561Widget.setCellValue(row,"maxLimit","");
	    }
    }
}
function lowChange(){
	var row=PrecessStandards_dg1487555065561Widget.getSelectedRow();
    var upper=PrecessStandards_dg1487555065561Widget.getCellValue(row,"upperLimit");
    var mix=PrecessStandards_dg1487555065561Widget.getCellValue(row,"maxLimit");
    var lower=PrecessStandards_dg1487555065561Widget.getCellValue(row,"lowerLimit");
    var min=PrecessStandards_dg1487555065561Widget.getCellValue(row,"loweMxLimit");
	if(upper!="" || mix!="" || min!=""){
	    if(lower>upper || lower>mix){
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
    var upper=PrecessStandards_dg1487555065561Widget.getCellValue(row,"upperLimit");
    var mix=PrecessStandards_dg1487555065561Widget.getCellValue(row,"maxLimit");
    var lower=PrecessStandards_dg1487555065561Widget.getCellValue(row,"lowerLimit");
    var min=PrecessStandards_dg1487555065561Widget.getCellValue(row,"loweMxLimit");
    if(upper!="" || mix!="" || lower!=""){
	    if(min>upper || min>mix || min>lower){
		    workbenchErrorBarWidget.showMessage("${getText('RM.formula.randon11111115')}");
		    PrecessStandards_dg1487555065561Widget.setCellValue(row,"loweMxLimit","");
	    }
    }
}

		/* CUSTOM CODE START(view-VIEW-RM_7.5.0.0_formula_processActiveView,js,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) */
// 自定义代码
function setIndexData(){
		setTimeout(function(){
			var selRow = FormulaProcessActive_dg1489393020282Widget.getSelectedRow();
			var processID = FormulaProcessActive_dg1489393020282Widget.getCellValue(selRow,"id");
			var id = $("#id").val();
			PrecessStandards_dg1489393020445Widget._DT.setRequestDataUrl("/RM/formula/formulaProcess/data-dg1489393020445.action?formulaProcess.id="+id+"&rt=json&processID="+processID);
		},100);
	}

RM.formula.formulaProcess.processActiveView.initSize = function(nTabIndex){
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
				var conHeight = h-$("#RM_formula_formulaProcess_processActiveView_main_div .edit-head").height()-$("#RM_formula_formulaProcess_processActiveView_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#RM_formula_formulaProcess_processActiveView_main_div .edit-workflow").height()</#if>;
				$("#RM_formula_formulaProcess_processActiveView_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('RM_formula_formulaProcess_processActiveView_datagrids');
				var padding_bottom=16;
				$("#RM_formula_formulaProcess_processActiveView_main_div .pd_bottom,#RM_formula_formulaProcess_processActiveView_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#RM_formula_formulaProcess_processActiveView_main_div .edit-panes-s").each(function(index){
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
                                     //     dgwidget.setHeight(perHeight - 78); 
										  if ( $('._DT_blank','#' + datagrids[index] + '_wrapper').length == 0 ) {
										     $('#' + datagrids[index] + '_wrapper').append('<div style="height:11px" class="_DT_blank" ></div>')  //当使用控件PT的时候，为底部增加10px的div，  xudihui  2015.01.27
										   } 
                                         }
									     else{
									   //   dgwidget.setHeight(perHeight - 68);
									     }	
									}
								} else {
									if(RM.formula.formulaProcess.processActiveView.initCount <= 2) {
										setTimeout(function(){RM.formula.formulaProcess.processActiveView.initSize();}, 200);
										RM.formula.formulaProcess.processActiveView.initCount++;
									}/* else {
										RM.formula.formulaProcess.processActiveView.initCount = 0;
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
							if(($("#RM_formula_formulaProcess_processActiveView_main_div .edit-workflow").length > 0) && ($("#RM_formula_formulaProcess_processActiveView_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
/* CUSTOM CODE END */
		RM.formula.formulaProcess.processActiveView.onloadForProduct = function(){
		/* CUSTOM CODE START(view-VIEW-RM_7.5.0.0_formula_processActiveView,onloadForProduct,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		}

		RM.formula.formulaProcess.processActiveView.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-VIEW-RM_7.5.0.0_formula_processActiveView,onsaveForProduct,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) */
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
				<div class="sidebar-top"><a href="#"  onclick="RM.formula.formulaProcess.processActiveView.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="RM.formula.formulaProcess.processActiveView.showBusinessList('${l.relatingModel.code.replace('.','')}',${(formulaProcess.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
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