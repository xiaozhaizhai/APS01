<!-- MESBasic_1/factoryModel/burdenWareEdit -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1490058868218')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-EDIT-MESBasic_1_factoryModel_burdenWareEdit,head,MESBasic_1_factoryModel_FactoryModel,MESBasic_1) -->
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
	CUI.ns('MESBasic.factoryModel.factoryModel.burdenWareEdit');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "MESBasic_factoryModel_factoryModel">
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
<#assign callbackName ="MESBasic.factoryModel.factoryModel.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="MESBasic_factoryModel_factoryModel_burdenWareEdit_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="MESBasic_factoryModel_factoryModel_burdenWareEdit_form" cssStyle="height:100%;" hiddenField="factoryModel.nodeType.id," onsubmitMethod="MESBasic.factoryModel.factoryModel.burdenWareEdit.beforeSubmitMethod()" ecAction="/MESBasic/factoryModel/factoryModel/burdenWareEdit/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="burdenWareEdit">
	<input type="hidden" name="viewCode" value="MESBasic_1_factoryModel_burdenWareEdit">
	<input type="hidden" name="datagridKey" value="MESBasic_factoryModel_factoryModel_burdenWareEdit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="factoryModel.version" value="${(factoryModel.version)!0}" />
	<input type="hidden" name="factoryModel.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
		<input type="hidden" name="factoryModel.nodeType.id" value="${(factoryModel.nodeType.id)!""}"/>
	<div id="MESBasic_burdenWareEdit_edit_div" style="height:100%">
		<div id="MESBasic_factoryModel_factoryModel_burdenWareEdit_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "MESBasic_factoryModel_factoryModel_burdenWareEdit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=MESBasic_1_factoryModel', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>			<div class="edit-panes" style="margin-top:0px;padding:0px;">
				<div>
				<div class="edit-panes-w">

<input type="hidden" name="factoryModel.parentId" value='${(factoryModel.parentId)!-1}' />
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1419233767027232')}" >${getText('MESBasic.propertydisplayName.radion1419233767027232')}</label>
				</td>
				
						<#assign factoryModel_code_defaultValue  = ''>
							 							<#assign factoryModel_code_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="factoryModel.code" id="factoryModel_code"  style=";" originalvalue="<#if !newObj || (factoryModel.code)?has_content>${(factoryModel.code?html)!}<#else>${factoryModel_code_defaultValue!}</#if>" value="<#if !newObj || (factoryModel.code)?has_content>${(factoryModel.code?html)!}<#else>${factoryModel_code_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1419232393782223')}" >${getText('MESBasic.propertydisplayName.radion1419232393782223')}</label>
				</td>
				
						<#assign factoryModel_name_defaultValue  = ''>
							 							<#assign factoryModel_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="factoryModel.name" id="factoryModel_name"  style=";" originalvalue="<#if !newObj || (factoryModel.name)?has_content>${(factoryModel.name?html)!}<#else>${factoryModel_name_defaultValue!}</#if>" value="<#if !newObj || (factoryModel.name)?has_content>${(factoryModel.name?html)!}<#else>${factoryModel_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1489653573977')}" >${getText('MESBasic.propertydisplayName.randon1489653573977')}</label>
				</td>
				
						<#assign factoryModel_isOnlyStore_defaultValue  = ''>
							 							<#assign factoryModel_isOnlyStore_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="factoryModel.isOnlyStore_check" originalvalue="<#if !newObj><#if (factoryModel.isOnlyStore)??>${(factoryModel.isOnlyStore!false)?string('true','false')}<#else>false</#if><#elseif factoryModel_isOnlyStore_defaultValue?has_content>${(factoryModel_isOnlyStore_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (factoryModel.isOnlyStore)??>${(factoryModel.isOnlyStore!false)?string('true','false')}<#else>false</#if><#else>${(factoryModel_isOnlyStore_defaultValue!true)?string}</#if>" onclick='onlyStoreChange()' />
								
								<input property_type="BOOLEAN" type="hidden" name="factoryModel.isOnlyStore" originalvalue="<#if ((factoryModel.isOnlyStore)?? &&  factoryModel.isOnlyStore)||(factoryModel_isOnlyStore_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((factoryModel.isOnlyStore)?? &&  factoryModel.isOnlyStore)||(factoryModel_isOnlyStore_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="factoryModel.isOnlyStore_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="factoryModel.isOnlyStore"]');
												CUI('input[name="factoryModel.isOnlyStore_check"]').each(function(){
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
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1460947375824')}" >${getText('MESBasic.propertydisplayName.randon1460947375824')}</label>
				</td>
				
						<#assign factoryModel_nodeType_name_defaultValue  = ''>
														<#assign factoryModel_nodeType_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1460947537367')}" viewType="readonly" deValue="${factoryModel_nodeType_name_defaultValue!}" conditionfunc="MESBasic.factoryModel.factoryModel.burdenWareEdit._querycustomFunc('factoryModel_nodeType_name')" view=true  value="${(factoryModel.nodeType.name)!}" displayFieldName="name" name="factoryModel.nodeType.name" id="factoryModel_nodeType_name" type="other" url="/MESBasic/nodeType/nodeType/noderef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_factoryModel_factoryModel_burdenWareEdit_form" editCustomCallback=";" refViewCode="MESBasic_1_nodeType_noderef" onkeyupfuncname=";_callback_factoryModel_nodeType_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(factoryModel.id)?? && (factoryModel.nodeType.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${factoryModel.nodeType.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_factoryModel_factoryModel_burdenWareEdit_form',obj, 'factoryModel.nodeType', '/MESBasic/nodeType/nodeType/noderef.action');
												CUI.commonFills('MESBasic_factoryModel_factoryModel_burdenWareEdit_form', 'factoryModel.nodeType',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
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
								function ObjWareStore_dg1490059032286_copyRow(event)
																{
		var selectRow=ObjWareStore_dg1490059032286Widget.getSelectedRow();
	if(selectRow==undefined){
			MESBasic_factoryModel_factoryModel_burdenWareEdit_formDialogErrorBarWidget.showMessage('请先选择需要复制的行','f')
			return false;
	}
	
	ObjWareStore_dg1490059032286Widget._DT.addNewRow();
	var length=ObjWareStore_dg1490059032286Widget.getRowLength()-1;
	var wareId1=$('#ObjWareStore_dg1490059032286_tbody tbody tr:eq('+selectRow+') input[name="dg1490059032286ware.id"]').val();
	var wareId2=ObjWareStore_dg1490059032286Widget.getCellValue(ObjWareStore_dg1490059032286Widget.getSelectedRow(),'ware.id');
	var wareId="";
	if(wareId1=='' || wareId1==null){
				wareId=wareId2;
	}else{
				wareId=wareId1;
	}
	//插入仓库
	ObjWareStore_dg1490059032286Widget.setCellValue(length,'ware.id',wareId);
	ObjWareStore_dg1490059032286Widget.setCellValue(length,'ware.wareCode',ObjWareStore_dg1490059032286Widget.getCellValue(selectRow,'ware.wareCode'));
	ObjWareStore_dg1490059032286Widget.setCellValue(length,'ware.wareName',ObjWareStore_dg1490059032286Widget.getCellValue(selectRow,'ware.wareName'));
	ObjWareStore_dg1490059032286Widget.setCellValue(length,'ware.cargoStatue.id',ObjWareStore_dg1490059032286Widget.getCellValue(selectRow,'ware.cargoStatue.id'));
	//插入物品
	var productId1=$('#ObjWareStore_dg1490059032286_tbody tbody tr:eq('+selectRow+') input[name="dg1490059032286product.id"]').val();
	var productId2=ObjWareStore_dg1490059032286Widget.getCellValue(selectRow,'product.id');
	var productId="";
	if(productId1=='' || productId1==null){
				productId=productId2;
	}else{
				productId=productId1;
	}
	ObjWareStore_dg1490059032286Widget.setCellValue(length,'product.id',productId);
	ObjWareStore_dg1490059032286Widget.setCellValue(length,'product.productCode',ObjWareStore_dg1490059032286Widget.getCellValue(selectRow,'product.productCode'));
	ObjWareStore_dg1490059032286Widget.setCellValue(length,'product.productName',ObjWareStore_dg1490059032286Widget.getCellValue(selectRow,'product.productName'));
	//插入货位
	var storeId1=$('#ObjWareStore_dg1490059032286_tbody tbody tr:eq('+selectRow+') input[name="dg1490059032286store.id"]').val();
	var storeId2=ObjWareStore_dg1490059032286Widget.getCellValue(selectRow,'store.id');
	var storeId="";
	if(storeId1=='' || storeId1==null){
				storeId=storeId2;
	}else{
				storeId=storeId1;
	}
	ObjWareStore_dg1490059032286Widget.setCellValue(length,'store.id',storeId);
	ObjWareStore_dg1490059032286Widget.setCellValue(length,'store.placeSetCode',ObjWareStore_dg1490059032286Widget.getCellValue(selectRow,'store.placeSetCode'));
	ObjWareStore_dg1490059032286Widget.setCellValue(length,'store.placeSetName',ObjWareStore_dg1490059032286Widget.getCellValue(selectRow,'store.placeSetName'));
	ObjWareStore_dg1490059032286Widget.setCellValue(length,'store.wareId.wareCode',ObjWareStore_dg1490059032286Widget.getCellValue(selectRow,'store.wareId.wareCode'));
	
	var storeSet=ObjWareStore_dg1490059032286Widget.getCellValue(selectRow,'ware.cargoStatue.id')
	//如果被复制的行的货位为不可编辑，则新的行也为不可编辑
	if(storeSet=='storageState/storageState1'){
	ObjWareStore_dg1490059032286Widget._DT.setCellProperty(length,'store.placeSetCode','readonly',false);
	}else{
	ObjWareStore_dg1490059032286Widget._DT.setCellProperty(length,'store.placeSetCode','readonly',true);
	}
	
	
	
		

}
							</script>
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/MESBasic/factoryModel/factoryModel/data-dg1490059032286.action?factoryModel.id=${refId!-1}&refId=${refId!-1}&datagridCode=MESBasic_1_factoryModel_burdenWareEditdg1490059032286">
			<#else>
				<#assign dUrl="/MESBasic/factoryModel/factoryModel/data-dg1490059032286.action?factoryModel.id=${(factoryModel.id)!-1}&datagridCode=MESBasic_1_factoryModel_burdenWareEditdg1490059032286">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_ObjWareStore_dg1490059032286_deldatagrid();}},{text:\"${getText('MESBasic.buttonPropertyshowName.radion149008978506623')}\",handler:function(event){ObjWareStore_dg1490059032286_copyRow(event)},iconClass:\"cui-btn-edit\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_ObjWareStore_dg1490059032286_deldatagrid();}},{text:\"${getText('MESBasic.buttonPropertyshowName.radion149008978506623')}\",handler:function(event){ObjWareStore_dg1490059032286_copyRow(event)},iconClass:\"cui-btn-edit\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_ObjWareStore_dg1490059032286" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1490059032286_id" value="ObjWareStore_dg1490059032286" />
			
			<input type="hidden" id="dg1490059032286_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('MESBasic.modelname.randon1490058575739')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/MESBasic/factoryModel/factoryModel/data-dg1490059032286.action?operateType=export&datagridCode=MESBasic_1_factoryModel_burdenWareEditdg1490059032286"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="ObjWareStore_dg1490059032286" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="ObjWareStore_dg1490059032286" viewType="${viewType}" renderOverEvent="dg1490059032286RenderOverEvent" route="${routeFlag}" formId="MESBasic_factoryModel_factoryModel_burdenWareEdit_form" noPermissionKeys="ware.wareCode,ware.wareName,store.placeSetCode,store.placeSetName,product.productCode,product.productName,ware.cargoStatue,store.wareId.wareCode" modelCode="MESBasic_1_factoryModel_ObjWareStore" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1490059032286" dtPage="dgPage"  hidekeyPrefix="dg1490059032286" hidekey="['id','version','ware.id','ware.wareCode','ware.id','ware.wareName','store.id','store.placeSetCode','store.id','store.placeSetName','product.id','product.productCode','product.id','product.productName','ware.id','ware.cargoStatue.id','store.id','store.wareId.wareCode'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1490059032286PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName  activexButton="MESBasic.buttonPropertyshowName.radion149008978506623,copyRow,edit" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
								<@datacolumn key="checkbox" textalign="center" label="" width="30" type="checkbox" checkall="true"/>
							<#assign ware_wareCode_displayDefaultType=''>
								<#assign ware_wareCode_defaultValue=''>
										<#assign ware_wareCode_defaultValue=''>
																	<#if (ware_wareCode_defaultValue!)?string=="currentUser">
								<#assign ware_wareCode_defaultValue='${staffJson!}'>
							<#elseif (ware_wareCode_defaultValue!)?string=="currentPost">
								<#assign ware_wareCode_defaultValue='${postJson!}'>
							<#elseif (ware_wareCode_defaultValue!)?string=="currentDepart">
								<#assign ware_wareCode_defaultValue='${deptJson!}'>
							<#elseif (ware_wareCode_defaultValue!)?string=="currentComp">
								<#assign ware_wareCode_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="ware.wareCode"        showFormat="SELECTCOMP" defaultValue="${(ware_wareCode_defaultValue!)?string}" defaultDisplay="${(ware_wareCode_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false  callbackname="operatecallback(obj)" selectCompName="MESBasic.factoryModel.factoryModel.burdenWareEdit"  textalign="left"  viewUrl="/MESBasic/wareMan/ware/wareRef.action" viewCode="MESBasic_1_wareMan_wareRef" mneenable=true crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" width=100 showFormatFunc=""  />
							<#assign ware_wareName_displayDefaultType=''>
								<#assign ware_wareName_defaultValue=''>
										<#assign ware_wareName_defaultValue=''>
																	<#if (ware_wareName_defaultValue!)?string=="currentUser">
								<#assign ware_wareName_defaultValue='${staffJson!}'>
							<#elseif (ware_wareName_defaultValue!)?string=="currentPost">
								<#assign ware_wareName_defaultValue='${postJson!}'>
							<#elseif (ware_wareName_defaultValue!)?string=="currentDepart">
								<#assign ware_wareName_defaultValue='${deptJson!}'>
							<#elseif (ware_wareName_defaultValue!)?string=="currentComp">
								<#assign ware_wareName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="ware.wareName"        showFormat="TEXT" defaultValue="${(ware_wareName_defaultValue!)?string}" defaultDisplay="${(ware_wareName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="MESBasic.factoryModel.factoryModel.burdenWareEdit"  textalign="left"  viewUrl="/MESBasic/wareMan/ware/wareRef.action" viewCode="MESBasic_1_wareMan_wareRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  label="${getText('MESBasic.propertydisplayName.randon1484031316281')}" width=100 showFormatFunc=""  />
							<#assign store_placeSetCode_displayDefaultType=''>
								<#assign store_placeSetCode_defaultValue=''>
										<#assign store_placeSetCode_defaultValue=''>
																	<#if (store_placeSetCode_defaultValue!)?string=="currentUser">
								<#assign store_placeSetCode_defaultValue='${staffJson!}'>
							<#elseif (store_placeSetCode_defaultValue!)?string=="currentPost">
								<#assign store_placeSetCode_defaultValue='${postJson!}'>
							<#elseif (store_placeSetCode_defaultValue!)?string=="currentDepart">
								<#assign store_placeSetCode_defaultValue='${deptJson!}'>
							<#elseif (store_placeSetCode_defaultValue!)?string=="currentComp">
								<#assign store_placeSetCode_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="store.placeSetCode"        showFormat="SELECTCOMP" defaultValue="${(store_placeSetCode_defaultValue!)?string}" defaultDisplay="${(store_placeSetCode_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false   selectCompName="MESBasic.factoryModel.factoryModel.burdenWareEdit"  textalign="left"  viewUrl="/MESBasic/storeSet/storeSet/storeRef.action" viewCode="MESBasic_1_storeSet_storeRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1489735291062')}"  label="${getText('MESBasic.propertydisplayName.randon1489731651449')}" width=150 showFormatFunc=""  />
							<#assign store_placeSetName_displayDefaultType=''>
								<#assign store_placeSetName_defaultValue=''>
										<#assign store_placeSetName_defaultValue=''>
																	<#if (store_placeSetName_defaultValue!)?string=="currentUser">
								<#assign store_placeSetName_defaultValue='${staffJson!}'>
							<#elseif (store_placeSetName_defaultValue!)?string=="currentPost">
								<#assign store_placeSetName_defaultValue='${postJson!}'>
							<#elseif (store_placeSetName_defaultValue!)?string=="currentDepart">
								<#assign store_placeSetName_defaultValue='${deptJson!}'>
							<#elseif (store_placeSetName_defaultValue!)?string=="currentComp">
								<#assign store_placeSetName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="store.placeSetName"        showFormat="TEXT" defaultValue="${(store_placeSetName_defaultValue!)?string}" defaultDisplay="${(store_placeSetName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="MESBasic.factoryModel.factoryModel.burdenWareEdit"  textalign="left"  viewUrl="/MESBasic/storeSet/storeSet/storeRef.action" viewCode="MESBasic_1_storeSet_storeRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1489735291062')}"  label="${getText('MESBasic.propertydisplayName.randon1489731677162232')}" width=150 showFormatFunc=""  />
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

									<@datacolumn key="product.productCode"        showFormat="SELECTCOMP" defaultValue="${(product_productCode_defaultValue!)?string}" defaultDisplay="${(product_productCode_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false   selectCompName="MESBasic.factoryModel.factoryModel.burdenWareEdit"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=true crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" width=100 showFormatFunc=""  />
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

									<@datacolumn key="product.productName"        showFormat="TEXT" defaultValue="${(product_productName_defaultValue!)?string}" defaultDisplay="${(product_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="MESBasic.factoryModel.factoryModel.burdenWareEdit"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" width=100 showFormatFunc=""  />
							<#assign ware_cargoStatue_displayDefaultType=''>
								<#assign ware_cargoStatue_defaultValue=''>
										<#assign ware_cargoStatue_defaultValue=''>
																	<#if (ware_cargoStatue_defaultValue!)?string=="currentUser">
								<#assign ware_cargoStatue_defaultValue='${staffJson!}'>
							<#elseif (ware_cargoStatue_defaultValue!)?string=="currentPost">
								<#assign ware_cargoStatue_defaultValue='${postJson!}'>
							<#elseif (ware_cargoStatue_defaultValue!)?string=="currentDepart">
								<#assign ware_cargoStatue_defaultValue='${deptJson!}'>
							<#elseif (ware_cargoStatue_defaultValue!)?string=="currentComp">
								<#assign ware_cargoStatue_defaultValue='${compJson!}'>
							</#if>
									<@systemCodeColumn code="storageState" textalign="left" defaultValue="${(ware_cargoStatue_defaultValue!)?string}" key="ware.cargoStatue.id" editable=false type="selectcomp" notnull=false     label="${getText('MESBasic.propertydisplayName.randon1484031944240')}" width=100 hiddenCol=true  />
							<#assign store_wareId_wareCode_displayDefaultType=''>
								<#assign store_wareId_wareCode_defaultValue=''>
										<#assign store_wareId_wareCode_defaultValue=''>
																	<#if (store_wareId_wareCode_defaultValue!)?string=="currentUser">
								<#assign store_wareId_wareCode_defaultValue='${staffJson!}'>
							<#elseif (store_wareId_wareCode_defaultValue!)?string=="currentPost">
								<#assign store_wareId_wareCode_defaultValue='${postJson!}'>
							<#elseif (store_wareId_wareCode_defaultValue!)?string=="currentDepart">
								<#assign store_wareId_wareCode_defaultValue='${deptJson!}'>
							<#elseif (store_wareId_wareCode_defaultValue!)?string=="currentComp">
								<#assign store_wareId_wareCode_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="store.wareId.wareCode"        showFormat="TEXT" defaultValue="${(store_wareId_wareCode_defaultValue!)?string}" defaultDisplay="${(store_wareId_wareCode_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="center" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" width=100 showFormatFunc=""  />
			
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
				function ObjWareStore_dg1490059032286_check_datagridvalid(){
					//
					var errorObj =ObjWareStore_dg1490059032286Widget._DT.testData();
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
				
				function savedg1490059032286DataGrid(){
					<#if  refId?? && (refId gt 0)>
					ObjWareStore_dg1490059032286Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('ObjWareStore_dg1490059032286Widget') > -1) {
						ObjWareStore_dg1490059032286Widget.setAllRowEdited();
					}
					var json = ObjWareStore_dg1490059032286Widget.parseEditedData();
					$('input[name="dg1490059032286ListJson"]').remove();
					$('input[name="dgLists[\'dg1490059032286\']"]').remove();
					$('input[name="dg1490059032286ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1490059032286\']">').val(json).appendTo($('#MESBasic_factoryModel_factoryModel_burdenWareEdit_form'));
					$('<input type="hidden" name="dg1490059032286ModelCode">').val('MESBasic_1_factoryModel_ObjWareStore').appendTo($('#MESBasic_factoryModel_factoryModel_burdenWareEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1490059032286ListJson">').val(json).appendTo($('#MESBasic_factoryModel_factoryModel_burdenWareEdit_form'));
				}
				function DT_ObjWareStore_dg1490059032286_deldatagrid(){
					var deleteRows = ObjWareStore_dg1490059032286Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','store.id','product.id','ware.id','objFactory.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1490059032286DeletedIds").length>0){
							$("#dg1490059032286DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1490059032286DeletedIds" name="dgDeletedIds[\'dg1490059032286\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_factoryModel_factoryModel_burdenWareEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1490059032286DeletedIds['+CUI('input[name^="dg1490059032286DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_factoryModel_factoryModel_burdenWareEdit_form'));
					});
					return deleteRows;
				}
				function DT_ObjWareStore_dg1490059032286_delTreeNodes(){
					var deleteRows = ObjWareStore_dg1490059032286Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','store.id','product.id','ware.id','objFactory.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1490059032286DeletedIds").length>0){
							$("#dg1490059032286DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1490059032286DeletedIds" name="dgDeletedIds[\'dg1490059032286\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_factoryModel_factoryModel_burdenWareEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1490059032286DeletedIds['+CUI('input[name^="dg1490059032286DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_factoryModel_factoryModel_burdenWareEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('MESBasic_factoryModel_factoryModel_burdenWareEdit_datagrids');
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
							if(datagrids[0][i] == 'ObjWareStore_dg1490059032286') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'ObjWareStore_dg1490059032286';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'ObjWareStore_dg1490059032286';
					}
					$('body').data('MESBasic_factoryModel_factoryModel_burdenWareEdit_datagrids', datagrids);
				});
				
				var ObjWareStore_dg1490059032286_importDialog = null;
				function ObjWareStore_dg1490059032286_showImportDialog(){
					try{
						if(ObjWareStore_dg1490059032286_importDialog!=null&&ObjWareStore_dg1490059032286_importDialog.isShow==1){
							return false;
						}
						var url = "/MESBasic/factoryModel/factoryModel/initImport.action?datagridCode=MESBasic_1_factoryModel_burdenWareEditdg1490059032286&tid=${id!}&datagridName=dg1490059032286";
							<#if canImportExcel>
								var buttonCode="MESBasic_1_factoryModel_burdenWareEditdg1490059032286_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						ObjWareStore_dg1490059032286_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("ObjWareStore_dg1490059032286"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();ObjWareStore_dg1490059032286_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();ObjWareStore_dg1490059032286_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						ObjWareStore_dg1490059032286_importDialog.show();
					}catch(e){}
				}	
				
				function ObjWareStore_dg1490059032286_downLoadFile(){
					var url = "/MESBasic/factoryModel/factoryModel/downLoad.action?datagridCode=MESBasic_1_factoryModel_burdenWareEditdg1490059032286&templateRelatedModelCode=MESBasic_1_factoryModel_burdenWareEditdg1490059032286&downloadType=template&fileName=dg1490059032286";
					window.open(url,"","");
				}
				function dg1490059032286RenderOverEvent(){
					var length=ObjWareStore_dg1490059032286Widget.getRowLength();
for(var i=0;i<length;i++){
			var storeSet=ObjWareStore_dg1490059032286Widget.getCellValue(i,'ware.cargoStatue.id')
	//如果仓库不启用货位，则不可编辑，如果启用则可编辑
	if(storeSet=='storageState/storageState1'){
	ObjWareStore_dg1490059032286Widget._DT.setCellProperty(i,'store.placeSetCode','readonly',false);
	}else{
	ObjWareStore_dg1490059032286Widget._DT.setCellProperty(i,'store.placeSetCode','readonly',true);
	}
}


var onlyStore=$('input[name="factoryModel.isOnlyStore_check"]').prop('checked');
if(onlyStore==true){
		 //操作按钮显示
		 $('#ObjWareStore_dg1490059032286 .paginatorbar-operatebar ').show();
		 ObjWareStore_dg1490059032286Widget._DT.setCellProperty(0,'product.productCode','readonly',false);
		ObjWareStore_dg1490059032286Widget._DT.setCellProperty(0,'product.productName','readonly',false);
		$( 'td[key="product.productCode"] div div:eq(0)').attr('style','width: 100px; color: rgb(179, 3, 3);');
		$( 'td[key="ware.wareCode"] div div:eq(0)').attr('style','width: 100px; color: rgb(179, 3, 3);');
}else{
			//隐藏删行、増行、复制按钮
			$('#ObjWareStore_dg1490059032286 .paginatorbar-operatebar ').hide();
			
			if(length==0){
					//新增一行
			ObjWareStore_dg1490059032286Widget._DT.addNewRow();
			ObjWareStore_dg1490059032286Widget._DT.setCellProperty(0,'store.placeSetCode','readonly',false);
			}

			ObjWareStore_dg1490059032286Widget._DT.setCellProperty(0,'product.productCode','readonly',true);
			ObjWareStore_dg1490059032286Widget._DT.setCellProperty(0,'product.productName','readonly',true);
			$( 'td[key="product.productCode"] div div:eq(0)').attr('style','width: 100px;');
			$( 'td[key="ware.wareCode"] div div:eq(0)').attr('style','width: 100px;');
			
}
				}
				function dg1490059032286PageInitMethod(nTabIndex){
					MESBasic.factoryModel.factoryModel.burdenWareEdit.initSize(nTabIndex);
				}
			</script>
			
			
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-EDIT-MESBasic_1_factoryModel_burdenWareEdit,html,MESBasic_1_factoryModel_FactoryModel,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	MESBasic.factoryModel.factoryModel.burdenWareEdit.beforeSaveProcess = function(){}
	MESBasic.factoryModel.factoryModel.burdenWareEdit.beforeSubmitMethod = function() {
		try{eval("savedg1490059032286DataGrid()");}catch(e){}
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(MESBasic.factoryModel.factoryModel.burdenWareEdit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#MESBasic_factoryModel_factoryModel_burdenWareEdit_form').trigger('beforeSubmit');
		//factoryModel.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="factoryModel.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#MESBasic_factoryModel_factoryModel_burdenWareEdit_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#MESBasic_factoryModel_factoryModel_burdenWareEdit_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	MESBasic.factoryModel.factoryModel.burdenWareEdit.validate = function(){
		return true;
	}
	
	
	//打印
	MESBasic.factoryModel.factoryModel.burdenWareEdit.print = function(url){
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
		
		MESBasic.factoryModel.factoryModel.burdenWareEdit.saveSetting = function(){
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
		MESBasic.factoryModel.factoryModel.burdenWareEdit.printSetting = function(){
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
			MESBasic.factoryModel.factoryModel.burdenWareEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(MESBasic.factoryModel.factoryModel.burdenWareEdit.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				MESBasic.factoryModel.factoryModel.burdenWareEdit.settingDialog.show();
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
			MESBasic.factoryModel.factoryModel.burdenWareEdit._customCallBack = customCallBack;
		}
		MESBasic.factoryModel.factoryModel.burdenWareEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#MESBasic_factoryModel_factoryModel_burdenWareEdit_fileupload').length == 0) {
				$('body').append('<div id="MESBasic_factoryModel_factoryModel_burdenWareEdit_fileupload"></div>');
			}
			MESBasic.factoryModel.factoryModel.burdenWareEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "MESBasic_factoryModel_factoryModel_burdenWareEdit_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#MESBasic_factoryModel_factoryModel_burdenWareEdit_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			MESBasic.factoryModel.factoryModel.burdenWareEdit.infoDialog.show();
			if($('#MESBasic_factoryModel_factoryModel_burdenWareEdit_fileupload').html() == '') {
				$('#MESBasic_factoryModel_factoryModel_burdenWareEdit_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=MESBasic_factoryModel_factoryModel&entityCode=MESBasic_1_factoryModel&dialogId="+dialogId);
			}
		}
	//参照复制函数
	MESBasic.factoryModel.factoryModel.burdenWareEdit.referenceCopy = function(objName,url, dialog){
		var callbackName ="MESBasic.factoryModel.factoryModel.burdenWareEdit.referenceCopyBackInfo";
		MESBasic.factoryModel.factoryModel.burdenWareEdit.dialog = dialog;
		MESBasic.factoryModel.factoryModel.burdenWareEdit._dialog = foundation.common.select({
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
	
	MESBasic.factoryModel.factoryModel.burdenWareEdit.referenceCopyBackInfo = function(obj){
		if(MESBasic.factoryModel.factoryModel.burdenWareEdit._dialog){
			MESBasic.factoryModel.factoryModel.burdenWareEdit._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,MESBasic.factoryModel.factoryModel.burdenWareEdit.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('MESBasic_factoryModel_factoryModel_burdenWareEdit_form','MESBasic_factoryModel_factoryModel_burdenWareEdit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(MESBasic.factoryModel.factoryModel.burdenWareEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(MESBasic.factoryModel.factoryModel.burdenWareEdit.dialog._el).load('/MESBasic/factoryModel/factoryModel/burdenWareEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( MESBasic.factoryModel.factoryModel.burdenWareEdit.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + MESBasic.factoryModel.factoryModel.burdenWareEdit.dialog._config.iframe, MESBasic.factoryModel.factoryModel.burdenWareEdit.dialog._dialog ).prop( 'src', '/MESBasic/factoryModel/factoryModel/burdenWareEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(MESBasic.factoryModel.factoryModel.burdenWareEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(MESBasic.factoryModel.factoryModel.burdenWareEdit.dialog._el).load('/MESBasic/factoryModel/factoryModel/burdenWareEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	MESBasic.factoryModel.factoryModel.burdenWareEdit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		MESBasic.factoryModel.factoryModel.burdenWareEdit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		MESBasic.factoryModel.factoryModel.burdenWareEdit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			MESBasic.factoryModel.factoryModel.burdenWareEdit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	MESBasic.factoryModel.factoryModel.burdenWareEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'MESBasic_factoryModel_factoryModel_burdenWareEdit' + '_' + extraFrameParam;
		var callbackName="";
		MESBasic.factoryModel.factoryModel.burdenWareEdit._prefix = '';
		MESBasic.factoryModel.factoryModel.burdenWareEdit._oGrid = oGrid;
		MESBasic.factoryModel.factoryModel.burdenWareEdit._sUrl = url;
		if(customCallBack){
			MESBasic.factoryModel.factoryModel.burdenWareEdit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			MESBasic.factoryModel.factoryModel.burdenWareEdit.gridEventObj = gridEventObj;
			callbackName = "MESBasic.factoryModel.factoryModel.burdenWareEdit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				MESBasic.factoryModel.factoryModel.burdenWareEdit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "MESBasic.factoryModel.factoryModel.burdenWareEdit.getMultiselectCallBackInfo_DG" : "MESBasic.factoryModel.factoryModel.burdenWareEdit.getcallBackInfo_DG";
			MESBasic.factoryModel.factoryModel.burdenWareEdit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				MESBasic.factoryModel.factoryModel.burdenWareEdit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="MESBasic.factoryModel.factoryModel.burdenWareEdit.getcallBackInfo";
		}
		if(MESBasic.factoryModel.factoryModel.burdenWareEdit._prefix!=''){
			MESBasic.factoryModel.factoryModel.burdenWareEdit._prefix = MESBasic.factoryModel.factoryModel.burdenWareEdit._prefix.substring(1);
		}
		if(MESBasic.factoryModel.factoryModel.burdenWareEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.factoryModel.factoryModel.burdenWareEdit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof MESBasic.factoryModel.factoryModel.burdenWareEdit._querycustomFuncN == "function") {
				refparam += MESBasic.factoryModel.factoryModel.burdenWareEdit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		MESBasic.factoryModel.factoryModel.burdenWareEdit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.factoryModel.factoryModel.burdenWareEdit._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.factoryModel.factoryModel.burdenWareEdit.query_"+obj+")!='undefined'") ? eval('MESBasic.factoryModel.factoryModel.burdenWareEdit.query_'+obj+'()') : null;
		return str;
	
	};
	
	MESBasic.factoryModel.factoryModel.burdenWareEdit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('MESBasic_factoryModel_factoryModel_burdenWareEdit_form',obj[0], MESBasic.factoryModel.factoryModel.burdenWareEdit._prefix, MESBasic.factoryModel.factoryModel.burdenWareEdit._sUrl);
		CUI.commonFills('MESBasic_factoryModel_factoryModel_burdenWareEdit_form',MESBasic.factoryModel.factoryModel.burdenWareEdit._prefix,obj[0]);

		try{
			if(MESBasic.factoryModel.factoryModel.burdenWareEdit._customCallBack) {
				eval(MESBasic.factoryModel.factoryModel.burdenWareEdit._customCallBack);
				MESBasic.factoryModel.factoryModel.burdenWareEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.factoryModel.factoryModel.burdenWareEdit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	MESBasic.factoryModel.factoryModel.burdenWareEdit.getcallBackInfo_DG_IE = function(obj){
		if(MESBasic.factoryModel.factoryModel.burdenWareEdit._customBeforeCallBack) {
			var flag = eval(MESBasic.factoryModel.factoryModel.burdenWareEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = MESBasic.factoryModel.factoryModel.burdenWareEdit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,MESBasic.factoryModel.factoryModel.burdenWareEdit._sUrl);
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
			if(MESBasic.factoryModel.factoryModel.burdenWareEdit._customCallBack) {
				eval(MESBasic.factoryModel.factoryModel.burdenWareEdit._customCallBack);
				MESBasic.factoryModel.factoryModel.burdenWareEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.factoryModel.factoryModel.burdenWareEdit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	MESBasic.factoryModel.factoryModel.burdenWareEdit.getcallBackInfo_DG = function(obj){
		if(MESBasic.factoryModel.factoryModel.burdenWareEdit._customBeforeCallBack) {
			var flag = eval(MESBasic.factoryModel.factoryModel.burdenWareEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(MESBasic.factoryModel.factoryModel.burdenWareEdit._currRow).next().length==0){
					MESBasic.factoryModel.factoryModel.burdenWareEdit._oGrid.addNewRow();
				}	
				MESBasic.factoryModel.factoryModel.burdenWareEdit._currRow = $(MESBasic.factoryModel.factoryModel.burdenWareEdit._currRow).next();
				$(MESBasic.factoryModel.factoryModel.burdenWareEdit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(MESBasic.factoryModel.factoryModel.burdenWareEdit._currRow,obj[i],MESBasic.factoryModel.factoryModel.burdenWareEdit._prefix,MESBasic.factoryModel.factoryModel.burdenWareEdit._sUrl);
			eval("CUI.commonFills_DG(MESBasic.factoryModel.factoryModel.burdenWareEdit._currRow,MESBasic.factoryModel.factoryModel.burdenWareEdit._prefix,obj[i],MESBasic.factoryModel.factoryModel.burdenWareEdit._oGrid)");
		}
		try{
			if(MESBasic.factoryModel.factoryModel.burdenWareEdit._customCallBack) {
				eval(MESBasic.factoryModel.factoryModel.burdenWareEdit._customCallBack);
				MESBasic.factoryModel.factoryModel.burdenWareEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.factoryModel.factoryModel.burdenWareEdit._dialog.close();
		} catch(e){}
	};
	
	MESBasic.factoryModel.factoryModel.burdenWareEdit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(MESBasic.factoryModel.factoryModel.burdenWareEdit._oGrid, MESBasic.factoryModel.factoryModel.burdenWareEdit._currRow, MESBasic.factoryModel.factoryModel.burdenWareEdit._key, MESBasic.factoryModel.factoryModel.burdenWareEdit._displayFieldName, obj[i])
		}
		try{
			if(MESBasic.factoryModel.factoryModel.burdenWareEdit._customCallBack) {
				eval(MESBasic.factoryModel.factoryModel.burdenWareEdit._customCallBack);
				MESBasic.factoryModel.factoryModel.burdenWareEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.factoryModel.factoryModel.burdenWareEdit._dialog.close();
		} catch(e){}
	};
	
	MESBasic.factoryModel.factoryModel.burdenWareEdit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			MESBasic.factoryModel.factoryModel.burdenWareEdit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#MESBasic_factoryModel_factoryModel_burdenWareEdit_form'));
        			}
        	   	}
        	}
      	});
	};
	MESBasic.factoryModel.factoryModel.burdenWareEdit.beforeSubmitMethodSettingInPage = function(){
		var length=ObjWareStore_dg1490059032286Widget.getRowLength();
	
	var onlyStore=$('input[name="factoryModel.isOnlyStore_check"]').prop('checked');
	if(onlyStore){
	
	if(length>0){
	//如果仓库启用货位，则货位不允许为空
	for(var a=0;a<length;a++){
			//仓库的货位启用状态
		var storeId=ObjWareStore_dg1490059032286Widget.getCellValue(a,'ware.cargoStatue.id');
		//货位编码
		var storeCode=ObjWareStore_dg1490059032286Widget.getCellValue(a,'store.placeSetCode');
		//仓库编码
		var WareCode=ObjWareStore_dg1490059032286Widget.getCellValue(a,'ware.wareCode');
		if(WareCode==null||WareCode==''){
			MESBasic_factoryModel_factoryModel_burdenWareEdit_formDialogErrorBarWidget.showMessage("${getText('MESBasic.factorymodel.randon1490058234234123','"+(a+1)+"')}");
			return false;
		}
		if(storeId=='storageState/storageState1' && (storeCode=='' || storeCode==undefined)){
		   MESBasic_factoryModel_factoryModel_burdenWareEdit_formDialogErrorBarWidget.showMessage("${getText('MESBasic.factorymodel.randon149005882342342','"+WareCode+"')}");
			return false;
		}
	}
	
		var productStr='';
		var productStatus='';
		var productCodeCount='';
		for(var i=0;i<length;i++){
			var productId=ObjWareStore_dg1490059032286Widget.getCellValue(i,'product.id');
			if(productId==null||productId ==''||productId == undefined){
				productStatus=productStatus+(i+1)+'、';
			}else{
				productStr=productStr+productId+"-";
			}		
		}
		if(productStatus!=''){
			MESBasic_factoryModel_factoryModel_burdenWareEdit_formDialogErrorBarWidget.showMessage("${getText('MESBasic.factorymodel.randon1490058234234124','"+productStatus.substring(0,productStatus.length-1)+"')}","f");
			return false;
		}
		if(length>1){
			var arr = new Array(length);
			for(var i=0;i<length;i++){
				var productCode=null;
				var productCode1=ObjWareStore_dg1490059032286Widget.getCellValue(i,"product.productCode");
				var productCode2=$('#ObjWareStore_dg1490059032286 tbody tr:eq('+i+') input[name="dg1490059032286product.productCode"]').val();
				if(productCode1!=null&&productCode1!=""){
					productCode=productCode1;
				}
				if(productCode2!=null&&productCode2!=""){
					productCode=productCode2;
				}
				arr[i]=productCode;
			}
			var productArr=new Array(length-1);
			for(var i=0;i<length-1;i++){
				for(var j=i+1;j<length;j++){
					if(arr[i]==arr[j]){
						if($.inArray(arr[i],productArr)==-1){
							productArr.push(arr[i]);
						}
					}
				}
			}
			for(var i=0;i<productArr.length;i++){
				if(productArr[i]!=null){
					productCodeCount=productCodeCount+productArr[i]+"、";
				}
			}
		}
		//如果物品编码的汇总不为空进行提示不能录入重复的物品编码的数据行不能录入重复的物品编码["+productCodeCount.substring(0,productCodeCount.length-1)+"]数据行
		if(productCodeCount!='' && productCodeCount!=undefined){
			//workbenchErrorBarWidget.showMessage("不能录入重复的物品编码["+productCodeCount.substring(0,productCodeCount.length-1)+"]数据行");
			MESBasic_factoryModel_factoryModel_burdenWareEdit_formDialogErrorBarWidget.showMessage("${getText('MESBasic.factorymodel.randon1490058234234','"+productCodeCount.substring(0,productCodeCount.length-1)+"')}","f");
				return false;
		}
		
		
		var factoryId=$("#id").val();
		var opeStatue='';
		$.ajax({
			   url : "/MESBasic/factoryModel/factoryModel/checkWareFactory.action",
			   type : 'post',
			   async : false,
			   data:{
				   "factoryId":factoryId,
				   "productArr":productStr
			   },
			success : function(msg) {
				   if(msg!=null){
					   opeStatue=msg.result;
				   }
			   }
		   });
		   //如果返回的值不为空进行提示，如果返回的值为空不提示opeStatue
		   if(opeStatue!=null && opeStatue!=''){
					MESBasic_factoryModel_factoryModel_burdenWareEdit_formDialogErrorBarWidget.showMessage("${getText('MESBasic.factorymodel.randon149005882324','"+opeStatue+"')}","f");
					return false;
		   }
	}
		       
    }
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	MESBasic.factoryModel.factoryModel.burdenWareEdit.initCount = 0;
	MESBasic.factoryModel.factoryModel.burdenWareEdit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#MESBasic_burdenWareEdit_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('MESBasic_factoryModel_factoryModel_burdenWareEdit_datagrids');	
		var	conHeight = h-$("#MESBasic_factoryModel_factoryModel_burdenWareEdit_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#MESBasic_factoryModel_factoryModel_burdenWareEdit_main_div .edit-panes-s").each(function(index){
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
							if(MESBasic.factoryModel.factoryModel.burdenWareEdit.initCount <= 2) {
								setTimeout(function(){MESBasic.factoryModel.factoryModel.burdenWareEdit.initSize();}, 200);
								MESBasic.factoryModel.factoryModel.burdenWareEdit.initCount++;
							}/* else {
								MESBasic.factoryModel.factoryModel.burdenWareEdit.initCount = 0;
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
		MESBasic.factoryModel.factoryModel.burdenWareEdit.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    MESBasic.factoryModel.factoryModel.burdenWareEdit.initSize(index);
		});
		$(window).bind("dialog.resize",function(){MESBasic.factoryModel.factoryModel.burdenWareEdit.initSize();});
	});
</script>
<script type="text/javascript">
	
function onlyStoreChange(){
		var onlyStore=$('input[name="factoryModel.isOnlyStore_check"]').prop('checked');
		if(onlyStore==true){
			 //操作按钮显示
			$('#ObjWareStore_dg1490059032286 .paginatorbar-operatebar ').show();
			
			ObjWareStore_dg1490059032286Widget._DT.setCellProperty(0,'product.productCode','readonly',false);
			ObjWareStore_dg1490059032286Widget._DT.setCellProperty(0,'product.productName','readonly',false);
			$( 'td[key="product.productCode"] div div:eq(0)').attr('style','width: 100px; color: rgb(179, 3, 3);');
			$( 'td[key="ware.wareCode"] div div:eq(0)').attr('style','width: 100px; color: rgb(179, 3, 3);');
		}else{
			//删除所有的记录
			ObjWareStore_dg1490059032286Widget._DT.delAllRows();
			//新增一行
			ObjWareStore_dg1490059032286Widget._DT.addNewRow();
			//隐藏删行、増行、复制按钮
			$('#ObjWareStore_dg1490059032286 .paginatorbar-operatebar ').hide();
			ObjWareStore_dg1490059032286Widget._DT.setCellProperty(0,'product.productCode','readonly',true);
			ObjWareStore_dg1490059032286Widget._DT.setCellProperty(0,'product.productName','readonly',true);
			$( 'td[key="product.productCode"] div div:eq(0)').attr('style','width: 100px;');
			$( 'td[key="ware.wareCode"] div div:eq(0)').attr('style','width: 100px;');
		}

}


function operatecallback(obj){
   var nRow=ObjWareStore_dg1490059032286Widget.getSelectedRow();
   var storeWare=ObjWareStore_dg1490059032286Widget.getCellValue(nRow,'store.wareId.wareCode');
   var wareCode=obj[0].wareCode;
   //如果第一次选的仓库和第二次选的仓库不一样，货位置设置为空
   if(storeWare!='' &&storeWare!=undefined  &&wareCode!='' &&wareCode!=undefined){
   if(wareCode!=storeWare){
   		 ObjWareStore_dg1490059032286Widget.setCellValue(nRow,'store.placeSetCode','');
       ObjWareStore_dg1490059032286Widget.setCellValue(nRow,'store.placeSetName','');
       ObjWareStore_dg1490059032286Widget.setCellValue(nRow,'store.id','');
   }
   }
  
   //仓库货位状态
   var stroeState=obj[0].cargoStatue.id;
   //如果启用货位，则货位编码和货位名称可填
   if(stroeState=='storageState/storageState1'){
   ObjWareStore_dg1490059032286Widget._DT.setCellProperty(nRow,'store.placeSetCode','readonly',false);
   }else{
   ObjWareStore_dg1490059032286Widget._DT.setCellProperty(nRow,'store.placeSetCode','readonly',true);
   }
}

	/* CUSTOM CODE START(view-EDIT-MESBasic_1_factoryModel_burdenWareEdit,js,MESBasic_1_factoryModel_FactoryModel,MESBasic_1) */
// 自定义代码
MESBasic.factoryModel.factoryModel.burdenWareEdit.query_dg1490059032286store_placeSetCode=function(){
        var wareId1=$('#ObjWareStore_dg1490059032286_tbody tbody tr:eq('+ObjWareStore_dg1490059032286Widget.getSelectedRow()+') input[name="dg1490059032286ware.id"]').val();
        var wareId2=ObjWareStore_dg1490059032286Widget.getCellValue(ObjWareStore_dg1490059032286Widget.getSelectedRow(),'ware.id');
        var wareId='';
        var wareCode=ObjWareStore_dg1490059032286Widget.getCellValue(ObjWareStore_dg1490059032286Widget.getSelectedRow(),'ware.wareCode');		 
  if(wareId1=='' || wareId1==undefined ){
        	wareId=wareId2;
           }else{
        	wareId=wareId1;
            }
  if(wareCode=='' || wareCode==undefined){
  wareId='';
  }
   		return "wareId="+wareId;
        }
/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>