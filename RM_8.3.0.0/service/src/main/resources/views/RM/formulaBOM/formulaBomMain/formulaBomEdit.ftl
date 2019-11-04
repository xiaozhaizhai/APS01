<!-- RM_7.5.0.0/formulaBOM/formulaBomEdit -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1555500010489')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formulaBOM_formulaBomEdit,head,RM_7.5.0.0_formulaBOM_FormulaBomMain,RM_7.5.0.0) -->
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
	CUI.ns('RM.formulaBOM.formulaBomMain.formulaBomEdit');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "RM_formulaBOM_formulaBomMain">
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
<#assign callbackName ="RM.formulaBOM.formulaBomMain.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="RM_formulaBOM_formulaBomMain_formulaBomEdit_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="RM_formulaBOM_formulaBomMain_formulaBomEdit_form" cssStyle="height:100%;" hiddenField="formulaBomMain.product.id," onsubmitMethod="RM.formulaBOM.formulaBomMain.formulaBomEdit.beforeSubmitMethod()" ecAction="/RM/formulaBOM/formulaBomMain/formulaBomEdit/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="formulaBomEdit">
	<input type="hidden" name="viewCode" value="RM_7.5.0.0_formulaBOM_formulaBomEdit">
	<input type="hidden" name="datagridKey" value="RM_formulaBOM_formulaBomMain_formulaBomEdit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="formulaBomMain.version" value="${(formulaBomMain.version)!0}" />
	<input type="hidden" name="formulaBomMain.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
		<input type="hidden" name="formulaBomMain.product.id" value="${(formulaBomMain.product.id)!""}"/>
	<div id="RM_formulaBomEdit_edit_div" style="height:100%">
		<div id="RM_formulaBOM_formulaBomMain_formulaBomEdit_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
			<div class="edit-panes" style="margin-top:0px;padding:0px;">
														<script>
								$(function(){
									var height=$(document).height() - 7;
									height=height - 7;
									if($(".edit-head")[0]){
										height = height - $(".edit-head")[0].offsetHeight;	//假如是编辑视图，需要减去head块
									}
									var width=$(document).width() - 7 ;
									width=width - 13;
									if($(".edit-sidebar")[0]){
										width = width - $(".edit-sidebar")[0].offsetWidth;
									}
									$("#ec_RM_formulaBOM_formulaBomMain_formulaBomEdit_tabs-1").width(width);
									$("#ec_RM_formulaBOM_formulaBomMain_formulaBomEdit_tabs-1").height(height);
									$(window).resize(function() {
										var height=$(document).height() - 7 ;
										height=height - 7;
										if($(".edit-head")[0]){
											height = height - $(".edit-head")[0].offsetHeight;	//假如是编辑视图，需要减去head块
										}
										var width=$(document).width()- 7;
										width=width - 13;
										if($(".edit-sidebar")[0]){
											width = width - $(".edit-sidebar")[0].offsetWidth;
										}
										$("#ec_RM_formulaBOM_formulaBomMain_formulaBomEdit_tabs-1").width(width);
										$("#ec_RM_formulaBOM_formulaBomMain_formulaBomEdit_tabs-1").height(height);
									});	
								});
								</script>
								<div id='ec_RM_formulaBOM_formulaBomMain_formulaBomEdit_tabs-1'>
				<script type="text/javascript">
			$(function(){
				$.extraLayout($("#ec_RM_formulaBOM_formulaBomMain_formulaBomEdit_column-3").parent(),{nums:2,method:"column",topBlock:false,bottomBlock:false,heights:[32,68],layoutType:'classic'});
			});
		</script>
				 <div id="ec_RM_formulaBOM_formulaBomMain_formulaBomEdit_column-2" class='extra-layout column-fixed' style="border:none; overflow:hidden;"> 
			
					
							<script>
								$(function(){
									$("[id='ec_RM_formulaBOM_formulaBomMain_formulaBomEdit_column-2']").css("overflow","auto");
								});
							</script>
							<div style="width:98%;margin-left:2%;">
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td></tr>
		<tr class="dialog_tr">
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1555499118719')}" >${getText('RM.propertydisplayName.randon1555499118719')}</label>
				</td>
				
						<#assign formulaBomMain_formulaBomCode_defaultValue  = '_'>
							 					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="formulaBomMain.formulaBomCode" id="formulaBomMain_formulaBomCode"  style=";" originalvalue="<#if !newObj || (formulaBomMain.formulaBomCode)?has_content>${(formulaBomMain.formulaBomCode?html)!}<#else>${formulaBomMain_formulaBomCode_defaultValue!}</#if>" value="<#if !newObj || (formulaBomMain.formulaBomCode)?has_content>${(formulaBomMain.formulaBomCode?html)!}<#else>${formulaBomMain_formulaBomCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415772644833')}" >${getText('MESBasic.propertydisplayName.radion1415772644833')}</label>
				</td>
				
						<#assign formulaBomMain_product_productCode_defaultValue  = ''>
														<#assign formulaBomMain_product_productCode_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}" viewType="${viewType!}" deValue="${formulaBomMain_product_productCode_defaultValue!}" conditionfunc="RM.formulaBOM.formulaBomMain.formulaBomEdit._querycustomFunc('formulaBomMain_product_productCode')"  value="${(formulaBomMain.product.productCode)!}" displayFieldName="productCode" name="formulaBomMain.product.productCode" id="formulaBomMain_product_productCode" type="other" url="/MESBasic/product/product/refProductLayout.action" clicked=true multiple=false mnewidth=260 formId="RM_formulaBOM_formulaBomMain_formulaBomEdit_form" editCustomCallback=";" refViewCode="MESBasic_1_product_refProductLayout"  onkeyupfuncname=";_callback_formulaBomMain_product_productCode(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(formulaBomMain.id)?? && (formulaBomMain.product.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formulaBomMain.product.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formulaBOM_formulaBomMain_formulaBomEdit_form',obj, 'formulaBomMain.product', '/MESBasic/product/product/refProductLayout.action');
												CUI.commonFills('RM_formulaBOM_formulaBomMain_formulaBomEdit_form', 'formulaBomMain.product',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415772740737')}" >${getText('MESBasic.propertydisplayName.radion1415772740737')}</label>
				</td>
				
						<#assign formulaBomMain_product_productName_defaultValue  = ''>
														<#assign formulaBomMain_product_productName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="formulaBomMain.product.productName" id="formulaBomMain_product_productName"  style=";" originalvalue="<#if !newObj || (formulaBomMain.product.productName)?has_content>${(formulaBomMain.product.productName?html)!}<#else>${formulaBomMain_product_productName_defaultValue!}</#if>" value="<#if !newObj || (formulaBomMain.product.productName)?has_content>${(formulaBomMain.product.productName?html)!}<#else>${formulaBomMain_product_productName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1555499319210')}" >${getText('RM.propertydisplayName.randon1555499319210')}</label>
				</td>
				
						<#assign formulaBomMain_edtion_defaultValue  = ''>
							 							<#assign formulaBomMain_edtion_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="formulaBomMain.edtion" id="formulaBomMain_edtion"  style=";" originalvalue="<#if !newObj || (formulaBomMain.edtion)?has_content>${(formulaBomMain.edtion?html)!}<#else>${formulaBomMain_edtion_defaultValue!}</#if>" value="<#if !newObj || (formulaBomMain.edtion)?has_content>${(formulaBomMain.edtion?html)!}<#else>${formulaBomMain_edtion_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1555499368535')}" >${getText('RM.propertydisplayName.randon1555499368535')}</label>
				</td>
				
						<#assign formulaBomMain_demo_defaultValue  = ''>
							 							<#assign formulaBomMain_demo_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="3" style="text-align: left;;" >
					
							
							<div class="fix-input fix-ie7-textarea"><textarea property_type="TEXT" id="formulaBomMain_demo" originalvalue="<#if !newObj || (formulaBomMain.demo)?has_content>${(formulaBomMain.demo?html)!}<#else>${formulaBomMain_demo_defaultValue?html}</#if>"  name="formulaBomMain.demo" class="cui-noborder-textarea cui-textarea-auto" style=";" ><#if !newObj || (formulaBomMain.demo)?has_content>${(formulaBomMain.demo)!}<#else>${formulaBomMain_demo_defaultValue}</#if></textarea></div>
							
				</td>
		</tr>
	</table>
							</div>
							 </div>
				 <div id="ec_RM_formulaBOM_formulaBomMain_formulaBomEdit_column-3" class='extra-layout column-fixed' style="border:none; "> 
			
					
			
		
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
	<#if false && isIE>
			<#assign routeFlag = "1">
	<#else>
			<#assign routeFlag = "0">
	</#if>	
	
	<#assign cpObjHideKey = '' >
	<#assign cpvmInfo = ''>
		<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
						<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formulaBOM_FormulaBomMaterial", "RM_7.5.0.0_formulaBOM_formulaBomEditdg1555500191344", "DATAGRID", "formulaBomMaterial")>
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
		<#assign dUrl="/RM/formulaBOM/formulaBomMain/data-dg1555500191344.action?formulaBomMain.id=${refId!-1}&refId=${refId!-1}&datagridCode=RM_7.5.0.0_formulaBOM_formulaBomEditdg1555500191344">
	<#else>
		<#assign dUrl="/RM/formulaBOM/formulaBomMain/data-dg1555500191344.action?formulaBomMain.id=${(formulaBomMain.id)!-1}&datagridCode=RM_7.5.0.0_formulaBOM_formulaBomEditdg1555500191344">
	</#if>
	<#assign firstLoad = true>
	<#if newObj?? && !newObj && !(refId?? && (refId > 0))>
		<#assign buttons="[{text:\"${getText('RM.buttonPropertyshowName.radion1555500209593')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1555500209284')}\",handler:function(event){DT_FormulaBomMaterial_dg1555500191344_deldatagrid();},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
		<#assign canImportExcel=false>
	<#else>
		<#assign buttons="[{text:\"${getText('RM.buttonPropertyshowName.radion1555500209593')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1555500209284')}\",handler:function(event){DT_FormulaBomMaterial_dg1555500191344_deldatagrid();},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
		<#assign canImportExcel=false>
	</#if>
	
		<#if cpvmInfo?? && cpvmInfo?length gt 0>
			<#assign cpvmInfo = cpvmInfo?substring(1)>
			<input type="hidden" id="dg_cp_info_FormulaBomMaterial_dg1555500191344" value="${cpvmInfo!}" />
		</#if>
	
	<input type="hidden" id="dg1555500191344_id" value="FormulaBomMaterial_dg1555500191344" />
	
	<input type="hidden" id="dg1555500191344_url" value="${dUrl}" />
	
	<#assign assModelDisplayName = getText('RM.modelname.randon1555498475247')!>
	<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
	<@exportexcel action="/RM/formulaBOM/formulaBomMain/data-dg1555500191344.action?operateType=export&datagridCode=RM_7.5.0.0_formulaBOM_formulaBomEditdg1555500191344"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="FormulaBomMaterial_dg1555500191344" />
	<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="FormulaBomMaterial_dg1555500191344" viewType="${viewType}" renderOverEvent="dg1555500191344RenderOverEvent" route="${routeFlag}" formId="RM_formulaBOM_formulaBomMain_formulaBomEdit_form" noPermissionKeys="material.productCode,material.productName,isMaxNum,preNum,minNum,maxNum,demo" modelCode="RM_7.5.0.0_formulaBOM_FormulaBomMaterial" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1555500191344" dtPage="dgPage"  hidekeyPrefix="dg1555500191344" hidekey="['id','version','material.id','material.productCode','material.id','material.productName'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0  ptRealTimeLoad=1 isExtra=true pageInitMethod="dg1555500191344PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName dgTitle="${getText('RM.dataGriddataGridName.randon1555501728743.flag')}" activexButton="RM.buttonPropertyshowName.radion1555500209593,ADDROW,add;RM.buttonPropertyshowName.radion1555500209284,DELETEROW,del" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false >
					<#assign material_productCode_displayDefaultType=''>
						<#assign material_productCode_defaultValue=''>
								<#assign material_productCode_defaultValue=''>
													<#if (material_productCode_defaultValue!)?string=="currentUser">
						<#assign material_productCode_defaultValue='${staffJson!}'>
					<#elseif (material_productCode_defaultValue!)?string=="currentPost">
						<#assign material_productCode_defaultValue='${postJson!}'>
					<#elseif (material_productCode_defaultValue!)?string=="currentDepart">
						<#assign material_productCode_defaultValue='${deptJson!}'>
					<#elseif (material_productCode_defaultValue!)?string=="currentComp">
						<#assign material_productCode_defaultValue='${compJson!}'>
					</#if>

							<@datacolumn key="material.productCode"        showFormat="SELECTCOMP" defaultValue="${(material_productCode_defaultValue!)?string}" defaultDisplay="${(material_productCode_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=true   selectCompName="RM.formulaBOM.formulaBomMain.formulaBomEdit"  textalign="left"  viewUrl="/MESBasic/product/product/refProductLayout.action" viewCode="MESBasic_1_product_refProductLayout" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  label="${getText('RM.propertyshowName.randon1555500336194.flag')}" width=100 showFormatFunc=""  />
					<#assign material_productName_displayDefaultType=''>
						<#assign material_productName_defaultValue=''>
								<#assign material_productName_defaultValue=''>
													<#if (material_productName_defaultValue!)?string=="currentUser">
						<#assign material_productName_defaultValue='${staffJson!}'>
					<#elseif (material_productName_defaultValue!)?string=="currentPost">
						<#assign material_productName_defaultValue='${postJson!}'>
					<#elseif (material_productName_defaultValue!)?string=="currentDepart">
						<#assign material_productName_defaultValue='${deptJson!}'>
					<#elseif (material_productName_defaultValue!)?string=="currentComp">
						<#assign material_productName_defaultValue='${compJson!}'>
					</#if>

							<@datacolumn key="material.productName"        showFormat="TEXT" defaultValue="${(material_productName_defaultValue!)?string}" defaultDisplay="${(material_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=true   selectCompName="RM.formulaBOM.formulaBomMain.formulaBomEdit"  textalign="left"  viewUrl="/MESBasic/product/product/customRef.action" viewCode="MESBasic_1_product_customRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  label="${getText('RM.propertyshowName.randon1555500342833.flag')}" width=100 showFormatFunc=""  />
					<#assign isMaxNum_displayDefaultType=''>
						<#assign isMaxNum_defaultValue=''>
								<#assign isMaxNum_defaultValue=''>
								  
							<@datacolumn key="isMaxNum"        showFormat="CHECKBOX" defaultValue="${(isMaxNum_defaultValue!)?string}" defaultDisplay="${(isMaxNum_displayDefaultType!)?string}" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1555499494815')}" width=100 showFormatFunc=""  />
					<#assign preNum_displayDefaultType=''>
						<#assign preNum_defaultValue=''>
								<#assign preNum_defaultValue=''>
								  
							<@datacolumn key="preNum"        showFormat="TEXT" defaultValue="${(preNum_defaultValue!)?string}" defaultDisplay="${(preNum_displayDefaultType!)?string}" decimal="3" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1555499568096')}" width=100 showFormatFunc=""  />
					<#assign minNum_displayDefaultType=''>
						<#assign minNum_defaultValue=''>
								<#assign minNum_defaultValue=''>
								  
							<@datacolumn key="minNum"        showFormat="TEXT" defaultValue="${(minNum_defaultValue!)?string}" defaultDisplay="${(minNum_displayDefaultType!)?string}" decimal="3" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1555499550251')}" width=100 showFormatFunc=""  />
					<#assign maxNum_displayDefaultType=''>
						<#assign maxNum_defaultValue=''>
								<#assign maxNum_defaultValue=''>
								  
							<@datacolumn key="maxNum"        showFormat="TEXT" defaultValue="${(maxNum_defaultValue!)?string}" defaultDisplay="${(maxNum_displayDefaultType!)?string}" decimal="3" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1555499520595')}" width=100 showFormatFunc=""  />
					<#assign demo_displayDefaultType=''>
						<#assign demo_defaultValue=''>
								<#assign demo_defaultValue=''>
								  
							<@datacolumn key="demo"        showFormat="TEXT" defaultValue="${(demo_defaultValue!)?string}" defaultDisplay="${(demo_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1555499580716')}" width=100 showFormatFunc=""  />
					<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formulaBOM_FormulaBomMaterial", "RM_7.5.0.0_formulaBOM_formulaBomEditdg1555500191344", "DATAGRID", "formulaBomMaterial")>
					<#-- 排布自定义字段 -->
					<#list customPropViewMappings as cpvm>
						<#assign cpvmColumnType = cpvm.property.type>
						<#assign cpvmKey = cpvm.propertyLayRec>
						<#assign cpvmType = cpvmColumnType?lower_case>
						
						<#assign cpEditable = true>
						<#if cpEditable && cpvmKey?index_of('.') gt -1>
							<#assign cpEditable = false>
						</#if>
						
						<#assign cpvmNotNull = false>
						<#if cpEditable && !(cpvm.nullable!true)>
							<#assign cpvmNotNull = true>
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
									<#assign selectCompName = 'RM.formulaBOM.formulaBomMain.formulaBomEdit'>
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
							<@datacolumn key=cpvmKey width=cpvmWidth showFormat="${cpvm.format!'TEXT'}" decimal="${cpvm.property.decimalNum!}" editable=cpEditable type=cpvmType showType="${cpvm.fieldType}" notnull=cpvmNotNull callbackname="" selectCompName=selectCompName viewUrl="${viewUrl!}" viewCode="${viewCode!}" crossCompany=false viewTitle="${getText('${viewTitle!}')}" label="${getText('${cpvm.displayName}')}" isObjCustomProp=isObjCustomProp objCustomPropNames="${objCustomPropNames}" />
						</#if>
					</#list>
	
	</@datagrid>
		<script type="text/javascript">
			
			//datagrid自定义参数方法
		</script>
		<script type="text/javascript">
			
			//datagrid自定义参数方法
		</script>
		<script type="text/javascript">
			
			//datagrid自定义参数方法
		</script>
		<script type="text/javascript">
			
			//datagrid自定义参数方法
		</script>
		<script type="text/javascript">
			
			//datagrid自定义参数方法
		</script>
		<script type="text/javascript">
			
			//datagrid自定义参数方法
		</script>
		<script type="text/javascript">
			
			//datagrid自定义参数方法
		</script>
		<script type="text/javascript">
			
			//datagrid自定义参数方法
		</script>
	
	<script type="text/javascript">
		function FormulaBomMaterial_dg1555500191344_check_datagridvalid(){
			//
			var errorObj =FormulaBomMaterial_dg1555500191344Widget._DT.testData();
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
		
		function savedg1555500191344DataGrid(){
			<#if  refId?? && (refId gt 0)>
			FormulaBomMaterial_dg1555500191344Widget.setAllRowEdited();
			</#if>
			// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
			var changed_pt_name = $('body').data('CHANGED_PT');
			if(changed_pt_name && changed_pt_name.indexOf('FormulaBomMaterial_dg1555500191344Widget') > -1) {
				FormulaBomMaterial_dg1555500191344Widget.setAllRowEdited();
			}
			var json = FormulaBomMaterial_dg1555500191344Widget.parseEditedData();
			$('input[name="dg1555500191344ListJson"]').remove();
			$('input[name="dgLists[\'dg1555500191344\']"]').remove();
			$('input[name="dg1555500191344ModelCode"]').remove();
			$('<input type="hidden" name="dgLists[\'dg1555500191344\']">').val(json).appendTo($('#RM_formulaBOM_formulaBomMain_formulaBomEdit_form'));
			$('<input type="hidden" name="dg1555500191344ModelCode">').val('RM_7.5.0.0_formulaBOM_FormulaBomMaterial').appendTo($('#RM_formulaBOM_formulaBomMain_formulaBomEdit_form'));
			//兼容旧版本提交函数
			$('<input type="hidden" name="dg1555500191344ListJson">').val(json).appendTo($('#RM_formulaBOM_formulaBomMain_formulaBomEdit_form'));
		}
		function DT_FormulaBomMaterial_dg1555500191344_deldatagrid(){
			var deleteRows = FormulaBomMaterial_dg1555500191344Widget.deleteRows();
			if(!deleteRows || deleteRows.length == 0) {
				CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
				return false;
			}
			var delproperty = "'id','version','formulaBom.id','material.id'";
			delproperty= delproperty.split(",")[0].substring(1).replace("'","");
			$.each(deleteRows, function(index, deleteRow){
				var tepID = eval("deleteRow."+delproperty);
				if(tepID==null || tepID == undefined || tepID == '') {
					return true;
				}
				if($("#dg1555500191344DeletedIds").length>0){
					$("#dg1555500191344DeletedIds")[0].value+=","+tepID;
				}else{
					CUI('<input type="hidden" id="dg1555500191344DeletedIds" name="dgDeletedIds[\'dg1555500191344\']" value="'+tepID+'">').appendTo(CUI('#RM_formulaBOM_formulaBomMain_formulaBomEdit_form'));
				} 
				//兼容旧版本提交函数
				CUI('<input type="hidden" name="dg1555500191344DeletedIds['+CUI('input[name^="dg1555500191344DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formulaBOM_formulaBomMain_formulaBomEdit_form'));
			});
			return deleteRows;
		}
		function DT_FormulaBomMaterial_dg1555500191344_delTreeNodes(){
			var deleteRows = FormulaBomMaterial_dg1555500191344Widget._DT.removeTreeNode();
			if(!deleteRows || deleteRows.length == 0) {
				return false;
			}
			var delproperty = "'id','version','formulaBom.id','material.id'";
			delproperty= delproperty.split(",")[0].substring(1).replace("'","");
			$.each(deleteRows, function(index, deleteRow){
				var tepID = eval("deleteRow."+delproperty);
				if(tepID==null || tepID == undefined || tepID == '') {
					return true;
				}
				if($("#dg1555500191344DeletedIds").length>0){
					$("#dg1555500191344DeletedIds")[0].value+=","+tepID;
				}else{
					CUI('<input type="hidden" id="dg1555500191344DeletedIds" name="dgDeletedIds[\'dg1555500191344\']" value="'+tepID+'">').appendTo(CUI('#RM_formulaBOM_formulaBomMain_formulaBomEdit_form'));
				}
				//兼容旧版本提交函数
				CUI('<input type="hidden" name="dg1555500191344DeletedIds['+CUI('input[name^="dg1555500191344DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formulaBOM_formulaBomMain_formulaBomEdit_form'));
			});
		}
		$(function($){
			var datagrids = $('body').data('RM_formulaBOM_formulaBomMain_formulaBomEdit_datagrids');
			var length  = 0;
			if(!datagrids) {
				datagrids = [];
			}else{
				length = datagrids.length;
			}
			datagrids[length]=[];
			datagrids[length][0] = 'FormulaBomMaterial_dg1555500191344';
			$('body').data('RM_formulaBOM_formulaBomMain_formulaBomEdit_datagrids', datagrids);
		});
		var FormulaBomMaterial_dg1555500191344_importDialog = null;
		function FormulaBomMaterial_dg1555500191344_showImportDialog(){
			try{
				if(FormulaBomMaterial_dg1555500191344_importDialog!=null&&FormulaBomMaterial_dg1555500191344_importDialog.isShow==1){
					return false;
				}
				var url = "/RM/formulaBOM/formulaBomMain/initImport.action?datagridCode=RM_7.5.0.0_formulaBOM_formulaBomEditdg1555500191344&tid=${id!}&datagridName=dg1555500191344";
					<#if canImportExcel>
						var buttonCode="RM_7.5.0.0_formulaBOM_formulaBomEditdg1555500191344_BUTTON_dgImport";
						url+="&buttonCode="+buttonCode;
					</#if>
				FormulaBomMaterial_dg1555500191344_importDialog = new CUI.Dialog({
					title: "${getHtmlText('common.button.import')}",
					url:url,
					modal:true,
					description:'',
					height:'330',
					width: '420',
					dragable:true,
					buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("FormulaBomMaterial_dg1555500191344"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();FormulaBomMaterial_dg1555500191344_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();FormulaBomMaterial_dg1555500191344_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
					beforeCloseEvent:function(){$('#importResponse').remove();}
				});
				FormulaBomMaterial_dg1555500191344_importDialog.show();
			}catch(e){}
		}	
		
		function FormulaBomMaterial_dg1555500191344_downLoadFile(){
			var url = "/RM/formulaBOM/formulaBomMain/downLoad.action?datagridCode=RM_7.5.0.0_formulaBOM_formulaBomEditdg1555500191344&templateRelatedModelCode=RM_7.5.0.0_formulaBOM_formulaBomEditdg1555500191344&downloadType=template&fileName=dg1555500191344";
			window.open(url,"","");
		}
		function dg1555500191344RenderOverEvent(){
		}
		function dg1555500191344PageInitMethod(nTabIndex){
			RM.formulaBOM.formulaBomMain.formulaBomEdit.initSize(nTabIndex);
		}
	</script>
							 </div>
		
									</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formulaBOM_formulaBomEdit,html,RM_7.5.0.0_formulaBOM_FormulaBomMain,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	RM.formulaBOM.formulaBomMain.formulaBomEdit.beforeSaveProcess = function(){}
	RM.formulaBOM.formulaBomMain.formulaBomEdit.beforeSubmitMethod = function() {
		try{eval("savedg1555500191344DataGrid()");}catch(e){}
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(RM.formulaBOM.formulaBomMain.formulaBomEdit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#RM_formulaBOM_formulaBomMain_formulaBomEdit_form').trigger('beforeSubmit');
		//formulaBomMain.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="formulaBomMain.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#RM_formulaBOM_formulaBomMain_formulaBomEdit_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#RM_formulaBOM_formulaBomMain_formulaBomEdit_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	RM.formulaBOM.formulaBomMain.formulaBomEdit.validate = function(){
		return true;
	}
	
	
	//打印
	RM.formulaBOM.formulaBomMain.formulaBomEdit.print = function(url){
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
		
		RM.formulaBOM.formulaBomMain.formulaBomEdit.saveSetting = function(){
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
		RM.formulaBOM.formulaBomMain.formulaBomEdit.printSetting = function(){
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
			RM.formulaBOM.formulaBomMain.formulaBomEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(RM.formulaBOM.formulaBomMain.formulaBomEdit.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				RM.formulaBOM.formulaBomMain.formulaBomEdit.settingDialog.show();
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
			RM.formulaBOM.formulaBomMain.formulaBomEdit._customCallBack = customCallBack;
		}
		RM.formulaBOM.formulaBomMain.formulaBomEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#RM_formulaBOM_formulaBomMain_formulaBomEdit_fileupload').length == 0) {
				$('body').append('<div id="RM_formulaBOM_formulaBomMain_formulaBomEdit_fileupload"></div>');
			}
			RM.formulaBOM.formulaBomMain.formulaBomEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "RM_formulaBOM_formulaBomMain_formulaBomEdit_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#RM_formulaBOM_formulaBomMain_formulaBomEdit_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			RM.formulaBOM.formulaBomMain.formulaBomEdit.infoDialog.show();
			if($('#RM_formulaBOM_formulaBomMain_formulaBomEdit_fileupload').html() == '') {
				$('#RM_formulaBOM_formulaBomMain_formulaBomEdit_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=RM_formulaBOM_formulaBomMain&entityCode=RM_7.5.0.0_formulaBOM&dialogId="+dialogId);
			}
		}
	//参照复制函数
	RM.formulaBOM.formulaBomMain.formulaBomEdit.referenceCopy = function(objName,url, dialog){
		var callbackName ="RM.formulaBOM.formulaBomMain.formulaBomEdit.referenceCopyBackInfo";
		RM.formulaBOM.formulaBomMain.formulaBomEdit.dialog = dialog;
		RM.formulaBOM.formulaBomMain.formulaBomEdit._dialog = foundation.common.select({
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
	
	RM.formulaBOM.formulaBomMain.formulaBomEdit.referenceCopyBackInfo = function(obj){
		if(RM.formulaBOM.formulaBomMain.formulaBomEdit._dialog){
			RM.formulaBOM.formulaBomMain.formulaBomEdit._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,RM.formulaBOM.formulaBomMain.formulaBomEdit.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('RM_formulaBOM_formulaBomMain_formulaBomEdit_form','RM_formulaBOM_formulaBomMain_formulaBomEdit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(RM.formulaBOM.formulaBomMain.formulaBomEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(RM.formulaBOM.formulaBomMain.formulaBomEdit.dialog._el).load('/RM/formulaBOM/formulaBomMain/formulaBomEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( RM.formulaBOM.formulaBomMain.formulaBomEdit.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + RM.formulaBOM.formulaBomMain.formulaBomEdit.dialog._config.iframe, RM.formulaBOM.formulaBomMain.formulaBomEdit.dialog._dialog ).prop( 'src', '/RM/formulaBOM/formulaBomMain/formulaBomEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(RM.formulaBOM.formulaBomMain.formulaBomEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(RM.formulaBOM.formulaBomMain.formulaBomEdit.dialog._el).load('/RM/formulaBOM/formulaBomMain/formulaBomEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	RM.formulaBOM.formulaBomMain.formulaBomEdit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		RM.formulaBOM.formulaBomMain.formulaBomEdit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		RM.formulaBOM.formulaBomMain.formulaBomEdit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			RM.formulaBOM.formulaBomMain.formulaBomEdit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	RM.formulaBOM.formulaBomMain.formulaBomEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'RM_formulaBOM_formulaBomMain_formulaBomEdit' + '_' + extraFrameParam;
		var callbackName="";
		RM.formulaBOM.formulaBomMain.formulaBomEdit._prefix = '';
		RM.formulaBOM.formulaBomMain.formulaBomEdit._oGrid = oGrid;
		RM.formulaBOM.formulaBomMain.formulaBomEdit._sUrl = url;
		if(customCallBack){
			RM.formulaBOM.formulaBomMain.formulaBomEdit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			RM.formulaBOM.formulaBomMain.formulaBomEdit.gridEventObj = gridEventObj;
			callbackName = "RM.formulaBOM.formulaBomMain.formulaBomEdit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				RM.formulaBOM.formulaBomMain.formulaBomEdit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "RM.formulaBOM.formulaBomMain.formulaBomEdit.getMultiselectCallBackInfo_DG" : "RM.formulaBOM.formulaBomMain.formulaBomEdit.getcallBackInfo_DG";
			RM.formulaBOM.formulaBomMain.formulaBomEdit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				RM.formulaBOM.formulaBomMain.formulaBomEdit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="RM.formulaBOM.formulaBomMain.formulaBomEdit.getcallBackInfo";
		}
		if(RM.formulaBOM.formulaBomMain.formulaBomEdit._prefix!=''){
			RM.formulaBOM.formulaBomMain.formulaBomEdit._prefix = RM.formulaBOM.formulaBomMain.formulaBomEdit._prefix.substring(1);
		}
		if(RM.formulaBOM.formulaBomMain.formulaBomEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.formulaBOM.formulaBomMain.formulaBomEdit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof RM.formulaBOM.formulaBomMain.formulaBomEdit._querycustomFuncN == "function") {
				refparam += RM.formulaBOM.formulaBomMain.formulaBomEdit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		RM.formulaBOM.formulaBomMain.formulaBomEdit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.formulaBOM.formulaBomMain.formulaBomEdit._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.formulaBOM.formulaBomMain.formulaBomEdit.query_"+obj+")!='undefined'") ? eval('RM.formulaBOM.formulaBomMain.formulaBomEdit.query_'+obj+'()') : null;
		return str;
	
	};
	
	RM.formulaBOM.formulaBomMain.formulaBomEdit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('RM_formulaBOM_formulaBomMain_formulaBomEdit_form',obj[0], RM.formulaBOM.formulaBomMain.formulaBomEdit._prefix, RM.formulaBOM.formulaBomMain.formulaBomEdit._sUrl);
		CUI.commonFills('RM_formulaBOM_formulaBomMain_formulaBomEdit_form',RM.formulaBOM.formulaBomMain.formulaBomEdit._prefix,obj[0]);

		try{
			if(RM.formulaBOM.formulaBomMain.formulaBomEdit._customCallBack) {
				eval(RM.formulaBOM.formulaBomMain.formulaBomEdit._customCallBack);
				RM.formulaBOM.formulaBomMain.formulaBomEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.formulaBOM.formulaBomMain.formulaBomEdit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	RM.formulaBOM.formulaBomMain.formulaBomEdit.getcallBackInfo_DG_IE = function(obj){
		if(RM.formulaBOM.formulaBomMain.formulaBomEdit._customBeforeCallBack) {
			var flag = eval(RM.formulaBOM.formulaBomMain.formulaBomEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = RM.formulaBOM.formulaBomMain.formulaBomEdit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,RM.formulaBOM.formulaBomMain.formulaBomEdit._sUrl);
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
			if(RM.formulaBOM.formulaBomMain.formulaBomEdit._customCallBack) {
				eval(RM.formulaBOM.formulaBomMain.formulaBomEdit._customCallBack);
				RM.formulaBOM.formulaBomMain.formulaBomEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.formulaBOM.formulaBomMain.formulaBomEdit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	RM.formulaBOM.formulaBomMain.formulaBomEdit.getcallBackInfo_DG = function(obj){
		if(RM.formulaBOM.formulaBomMain.formulaBomEdit._customBeforeCallBack) {
			var flag = eval(RM.formulaBOM.formulaBomMain.formulaBomEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(RM.formulaBOM.formulaBomMain.formulaBomEdit._currRow).next().length==0){
					RM.formulaBOM.formulaBomMain.formulaBomEdit._oGrid.addNewRow();
				}	
				RM.formulaBOM.formulaBomMain.formulaBomEdit._currRow = $(RM.formulaBOM.formulaBomMain.formulaBomEdit._currRow).next();
				$(RM.formulaBOM.formulaBomMain.formulaBomEdit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(RM.formulaBOM.formulaBomMain.formulaBomEdit._currRow,obj[i],RM.formulaBOM.formulaBomMain.formulaBomEdit._prefix,RM.formulaBOM.formulaBomMain.formulaBomEdit._sUrl);
			eval("CUI.commonFills_DG(RM.formulaBOM.formulaBomMain.formulaBomEdit._currRow,RM.formulaBOM.formulaBomMain.formulaBomEdit._prefix,obj[i],RM.formulaBOM.formulaBomMain.formulaBomEdit._oGrid)");
		}
		try{
			if(RM.formulaBOM.formulaBomMain.formulaBomEdit._customCallBack) {
				eval(RM.formulaBOM.formulaBomMain.formulaBomEdit._customCallBack);
				RM.formulaBOM.formulaBomMain.formulaBomEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.formulaBOM.formulaBomMain.formulaBomEdit._dialog.close();
		} catch(e){}
	};
	
	RM.formulaBOM.formulaBomMain.formulaBomEdit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(RM.formulaBOM.formulaBomMain.formulaBomEdit._oGrid, RM.formulaBOM.formulaBomMain.formulaBomEdit._currRow, RM.formulaBOM.formulaBomMain.formulaBomEdit._key, RM.formulaBOM.formulaBomMain.formulaBomEdit._displayFieldName, obj[i])
		}
		try{
			if(RM.formulaBOM.formulaBomMain.formulaBomEdit._customCallBack) {
				eval(RM.formulaBOM.formulaBomMain.formulaBomEdit._customCallBack);
				RM.formulaBOM.formulaBomMain.formulaBomEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.formulaBOM.formulaBomMain.formulaBomEdit._dialog.close();
		} catch(e){}
	};
	
	RM.formulaBOM.formulaBomMain.formulaBomEdit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			RM.formulaBOM.formulaBomMain.formulaBomEdit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#RM_formulaBOM_formulaBomMain_formulaBomEdit_form'));
        			}
        	   	}
        	}
      	});
	};
	(function($){
		$(function(){
			$('#ec_RM_formulaBOM_formulaBomMain_formulaBomEdit_column-2').css('margin-left','-5px');
		});
	})(jQuery);
	RM.formulaBOM.formulaBomMain.formulaBomEdit.beforeSubmitMethodSettingInPage = function(){
		var productCode = $("input[name='formulaBomMain.product.productCode']").val();
var edtion = $("input[name='formulaBomMain.edtion']").val();
var formulaBomCode = $("input[name='formulaBomMain.formulaBomCode']").val();
if(formulaBomCode == '_' || formulaBomCode ==''){
	var aa = productCode+'_'+edtion;
	$("input[name='formulaBomMain.formulaBomCode']").val(aa);
}
if(FormulaBomMaterial_dg1555500191344Widget._DT.rowsJsonObj.length ==0){
	RM_formulaBOM_formulaBomMain_formulaBomEdit_formDialogErrorBarWidget.showMessage('请确认表体中至少有一条数据');
	return false;
}
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	RM.formulaBOM.formulaBomMain.formulaBomEdit.initCount = 0;
	RM.formulaBOM.formulaBomMain.formulaBomEdit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#RM_formulaBomEdit_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('RM_formulaBOM_formulaBomMain_formulaBomEdit_datagrids');	
		var	conHeight = h-$("#RM_formulaBOM_formulaBomMain_formulaBomEdit_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#RM_formulaBOM_formulaBomMain_formulaBomEdit_main_div .edit-panes-s").each(function(index){
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
							if(RM.formulaBOM.formulaBomMain.formulaBomEdit.initCount <= 2) {
								setTimeout(function(){RM.formulaBOM.formulaBomMain.formulaBomEdit.initSize();}, 200);
								RM.formulaBOM.formulaBomMain.formulaBomEdit.initCount++;
							}/* else {
								RM.formulaBOM.formulaBomMain.formulaBomEdit.initCount = 0;
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
		RM.formulaBOM.formulaBomMain.formulaBomEdit.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    RM.formulaBOM.formulaBomMain.formulaBomEdit.initSize(index);
		});
		$(window).bind("dialog.resize",function(){RM.formulaBOM.formulaBomMain.formulaBomEdit.initSize();});
	});
</script>
<script type="text/javascript">
	



	/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formulaBOM_formulaBomEdit,js,RM_7.5.0.0_formulaBOM_FormulaBomMain,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>