<#assign isWorkflow = false> 
<#assign isAttachment = true> 
	<#assign  fileuploadType = "MESBasic_product_product">
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
<#assign viewType = "readonly">
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=8,9,10" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <#assign configTitle = getText('MESBasic.viewtitle.randon1470380585407')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		body{_width:100%;}
		.ewc-dialog-el{height:100%;}
		.flow-height{
			height:94%;
			height:91%\9;
		}
		#MESBasic_product_product_proddealinfoView_form{float:left;width:100%;}
		.pd-top{padding-top:0px}    /*紧贴头部，取消10px的空隙*/
		</style>
		<script type="text/javascript">
			CUI.ns('MESBasic.product.product.proddealinfoView');
			MESBasic.product.product.proddealinfoView.currentUser = ${userJson};
			MESBasic.product.product.proddealinfoView.currentStaff = ${staffJson};
			MESBasic.product.product.proddealinfoView.currentDepartment = ${deptJson};
			MESBasic.product.product.proddealinfoView.currentPosition = ${postJson};
			MESBasic.product.product.proddealinfoView.currentCompany = ${compJson};
		</script>
    </head>
	<body>
		<@loadpanel/>
		<div id="load_mask_first" class="load_mask_first"></div>
		<iframe id="load_iframe_ie_first" class="load_iframe_ie" style="z-index: 199; display: block;"></iframe>
		<div id="loading_wrap_first" class="loading_wrap_first">
			<div class="loading_process">
				<div class="loading_msg_first">${getText("foundation.common.data.waiting")}</div>
			</div>
		</div>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="" onsubmitMethod="MESBasic.product.product.proddealinfoView.beforeSubmitMethod()" id="MESBasic_product_product_proddealinfoView_form" namespace="/MESBasic/product/product/proddealinfoView" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=MESBasic_1_product_Product&_bapFieldPermissonModelName_=Product" callback="MESBasic.product.product.proddealinfoView._callBackInfo" ecform="true">
		<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
		<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="MESBasic_product_product_proddealinfoView_main_div">
    					<div class="edit-head">
    						<#if !((Parameters.mobileFlag)?? && Parameters.mobileFlag == 'true')>
    						<div class="edit-menubar">
								<div class="fl" id="top_buttonbar">
									<#if !((product.status)?? && product.status == 77)>
									<#if ((product.effectiveState)!0) == 0>
									<#if !(superEdit!false) && id??>
									</#if>
									</#if>
									
									<#if (superEdit!false) || pendingId??>
									<a class='cui-btn-new' id="edit-save-btn" onclick="MESBasic.product.product.proddealinfoView.save()"><span class="save"></span>${getHtmlText("ec.flow.save")}</a>
									<#if transitions?has_content>
									<#list transitions as t>
										<#if t.cancel??&&t.cancel==1>
											<#if id??>
								    <a class='cui-btn-new' id='edit-${t.name}-btn'><span class='edit-nullify'></span>${getHtmlText('ec.edit.remove')}</a>
									<script type="text/javascript">
										$(function(){
											$('#edit-${t.name}-btn').click(function(){
												if(!confirm("${getText('ec.view.confirm.remove')}"))return;
												$("input[type='radio'][name='workFlowVar.outcome']").prop("checked",false);
												if($("#workflow_outcomes .wfcancel").length == 0) {
													$("#workflow_outcomes").append('<input class="wfcancel" type="hidden" name="workFlowVar.outcome" id="__workflow_outcome_${t.name}" value="${t.name}" />');
													$("#workflow_outcomes").append('<input class="wfcancel"  type="hidden" name="workFlowVarStatus" value="cancel" />');
												}
												var wfcancelArr=new Array();
												var paramObj=new Object();
												paramObj.type='normal';
												paramObj.outcome='${t.name}';
												paramObj.dec='${t.description}';
												wfcancelArr.push(paramObj);
												$("#__workflow_outcomeMap").val(YAHOO.lang.JSON.stringify(wfcancelArr));
												MESBasic.product.product.proddealinfoView.submit(true);
											});
										});
									</script>
											</#if>
											<#break>
										</#if>
									</#list>
									</#if>

									</#if>
									
									</#if>
									
									<a class='cui-btn-new' id="edit-close-btn" onclick="window.close()"><span class="close"></span>${getHtmlText("foundation.common.closeWindow")}</a>
			
								</div>
								
								<div class="fr">
									<ul>
										<li id="fr_fileUpload" onMouseOver="this.style.color='#ffc001'" onMouseOut="this.style.color='#FFFFFF'"><a title='${getText("foundation.upload.attachment")}' onclick="MESBasic.product.product.proddealinfoView.showInfoDialog('fileUpload')">
										
										<span class='icon_file' ><i class='total'><em id="MESBasic_product_product_proddealinfoView_form_attcount"></em></i></span>
										</a></li>
									</ul>
								</div>
							</div>
							</#if>
							<div class="edit-title fix">
								<h1><span class="edit-title-icon"></span>${configTitle}</h1>
							</div>
    					</div>
    					
    					<div class="edit-main" id="MESBasic_product_product_proddealinfoView">
    						<div class="edit-content">
								<input type="hidden" id="dealInfoGroup" name="dealInfoGroup" value="">
								<input type="hidden" name="viewselect" value="proddealinfoView">
								<input type="hidden" name="datagridKey" value="MESBasic_product_product_proddealinfoView_datagrids">
								<input type="hidden" name="viewCode" value="MESBasic_1_product_proddealinfoView">
								<input type="hidden" name="modelName" value="Product">
								<input type="hidden" id="id" name="id" value="${id!}" />
								<input type="hidden" name="product.version" value="${(product.version)!0}" />
								<input type="hidden" name="product.extraCol" value='' />
								<input type="hidden" name="operateType" id="operateType" />
								<input type="hidden" name="uploadDocIds" value="${uploadDocIds!''}">

		<div class="dash-line"></div>
<script type="text/javascript">
var attcountid = "MESBasic_product_product_proddealinfoView_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=MESBasic_1_product', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>								<div class="edit-panes edit-panes-w edit-container clearfix">

										<div class="cui-elements pd-top">

<div class="edit-panes-s" style="width:98%;margin-left:10px;">
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
							 					<#if !MESBasic_1_product_Product_productCode_permit??>
					<#assign MESBasic_1_product_Product_productCode_permit = checkFieldPermission('product.productCode','MESBasic_1_product_Product','MESBasic_1_product_Product_productCode')>
					</#if>
					<td <#if MESBasic_1_product_Product_productCode_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if MESBasic_1_product_Product_productCode_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415772644833')}" >${getText('MESBasic.propertydisplayName.radion1415772644833')}</label>
				</td>
				
						<#assign product_productCode_defaultValue  = ''>
							 							<#assign product_productCode_defaultValue  = ''>
					<#if !MESBasic_1_product_Product_productCode_permit??>
					<#assign MESBasic_1_product_Product_productCode_permit = checkFieldPermission('product.productCode','MESBasic_1_product_Product','MESBasic_1_product_Product_productCode')>
					</#if>
					<td <#if MESBasic_1_product_Product_productCode_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-content"   style="text-align: left;;" >
							<#if MESBasic_1_product_Product_productCode_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="product.productCode" id="product_productCode"  style=";" originalvalue="<#if !newObj || (product.productCode)?has_content>${(product.productCode?html)!}<#else>${product_productCode_defaultValue!}</#if>" value="<#if !newObj || (product.productCode)?has_content>${(product.productCode?html)!}<#else>${product_productCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !MESBasic_1_product_Product_productName_permit??>
					<#assign MESBasic_1_product_Product_productName_permit = checkFieldPermission('product.productName','MESBasic_1_product_Product','MESBasic_1_product_Product_productName')>
					</#if>
					<td <#if MESBasic_1_product_Product_productName_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if MESBasic_1_product_Product_productName_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415772740737')}" >${getText('MESBasic.propertydisplayName.radion1415772740737')}</label>
				</td>
				
						<#assign product_productName_defaultValue  = ''>
							 							<#assign product_productName_defaultValue  = ''>
					<#if !MESBasic_1_product_Product_productName_permit??>
					<#assign MESBasic_1_product_Product_productName_permit = checkFieldPermission('product.productName','MESBasic_1_product_Product','MESBasic_1_product_Product_productName')>
					</#if>
					<td <#if MESBasic_1_product_Product_productName_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if MESBasic_1_product_Product_productName_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="product.productName" id="product_productName"  style=";" originalvalue="<#if !newObj || (product.productName)?has_content>${(product.productName?html)!}<#else>${product_productName_defaultValue!}</#if>" value="<#if !newObj || (product.productName)?has_content>${(product.productName?html)!}<#else>${product_productName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !MESBasic_1_product_Product_productModel_permit??>
					<#assign MESBasic_1_product_Product_productModel_permit = checkFieldPermission('product.productModel','MESBasic_1_product_Product','MESBasic_1_product_Product_productModel')>
					</#if>
					<td <#if MESBasic_1_product_Product_productModel_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if MESBasic_1_product_Product_productModel_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415772568665')}" >${getText('MESBasic.propertydisplayName.radion1415772568665')}</label>
				</td>
				
						<#assign product_productModel_defaultValue  = ''>
							 							<#assign product_productModel_defaultValue  = ''>
					<#if !MESBasic_1_product_Product_productModel_permit??>
					<#assign MESBasic_1_product_Product_productModel_permit = checkFieldPermission('product.productModel','MESBasic_1_product_Product','MESBasic_1_product_Product_productModel')>
					</#if>
					<td <#if MESBasic_1_product_Product_productModel_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if MESBasic_1_product_Product_productModel_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="product.productModel" id="product_productModel"  style=";" originalvalue="<#if !newObj || (product.productModel)?has_content>${(product.productModel?html)!}<#else>${product_productModel_defaultValue!}</#if>" value="<#if !newObj || (product.productModel)?has_content>${(product.productModel?html)!}<#else>${product_productModel_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
		</tr>
	</table>
</div>										</div>
										<div class="edit-datatable">	
				
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
			
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/MESBasic/product/product/data-dg1470380617774.action?product.id=${refId!-1}&refId=${refId!-1}">
			<#else>
				<#assign dUrl="/MESBasic/product/product/data-dg1470380617774.action?product.id=${(product.id)!-1}">
			</#if>
			<#assign firstLoad = true>
				
			<#if newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_ProdDealInfo_dg1470380617774_deldatagrid();}}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_ProdDealInfo_dg1470380617774_deldatagrid();}}]">
				<#assign canImportExcel=false>
			</#if>
			
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_ProdDealInfo_dg1470380617774" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1470380617774_id" value="ProdDealInfo_dg1470380617774" />
			
			<input type="hidden" id="dg1470380617774_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('MESBasic.modelname.randon1470380231866')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/MESBasic/product/product/data-dg1470380617774.action?operateType=export" settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dg1470380617774Page" prefix="ProdDealInfo_dg1470380617774" />
			<@datagrid withoutConfigTable=true id="ProdDealInfo_dg1470380617774" viewType="${viewType}" renderOverEvent="dg1470380617774RenderOverEvent" route="${routeFlag}" formId="MESBasic_product_product_proddealinfoView_form" noPermissionKeys="content,dealerID.name,dealTime" modelCode="MESBasic_1_product_ProdDealInfo" dataUrl="${dUrl}" postData="&dg1470380617774Page.pageSize=65536" dataGridName="dg1470380617774" dtPage="dg1470380617774Page"  hidekeyPrefix="dg1470380617774" hidekey="['id','version','dealerID.id','dealerID.name'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=false  noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1470380617774PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=false cannotDeleteRow=true assModelDisplayName=assModelDisplayName  activexButton="" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=false firstLoad=firstLoad >		
							<#assign content_displayDefaultType=''>
								<#assign content_defaultValue=''>
										<#assign content_defaultValue=''>
										 
									<@datacolumn key="content"        showFormat="TEXT" defaultValue="${(content_defaultValue!)?string}" defaultDisplay="${(content_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1470380337116')}" width=100 showFormatFunc=""/>
							<#assign dealerID_name_displayDefaultType=''>
								<#assign dealerID_name_defaultValue=''>
										<#assign dealerID_name_defaultValue=''>
																	<#if (dealerID_name_defaultValue!)?string=="currentUser">
								<#assign dealerID_name_defaultValue='${staffJson!}'>
							<#elseif (dealerID_name_defaultValue!)?string=="currentPost">
								<#assign dealerID_name_defaultValue='${postJson!}'>
							<#elseif (dealerID_name_defaultValue!)?string=="currentDepart">
								<#assign dealerID_name_defaultValue='${deptJson!}'>
							<#elseif (dealerID_name_defaultValue!)?string=="currentComp">
								<#assign dealerID_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="dealerID.name"        showFormat="SELECTCOMP" defaultValue="${(dealerID_name_defaultValue!)?string}" defaultDisplay="${(dealerID_name_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="MESBasic.product.product.proddealinfoView"  textalign="center"  viewUrl="/foundation/staff/common/staffListFrameset.action" viewCode="sysbase_1.0_staff_ref" mneenable=false crossCompany=false viewTitle="${getText('foundation.ec.entity.view.reference')}"  label="${getText('MESBasic.staff.dimissionStaff_xls.staffName06')}" width=100 showFormatFunc=""/>
							<#assign dealTime_displayDefaultType=''>
								<#assign dealTime_defaultValue=''>
										<#assign dealTime_defaultValue=''>
										 								<#if (dealTime_defaultValue)?? &&(dealTime_defaultValue)?has_content>
									<#assign dealTime_defaultValue  = getDefaultDateTime(dealTime_defaultValue!)?datetime>
								</#if>

									<@datacolumn key="dealTime"        showFormat="YMD_HMS" defaultValue="${(dealTime_defaultValue!)?string}" defaultDisplay="${(dealTime_displayDefaultType!)?string}" decimal="" editable=false type="datetime" showType="datetime" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1470380397891')}" width=100 showFormatFunc=""/>
			
			</@datagrid>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
			
			<script type="text/javascript">
				function ProdDealInfo_dg1470380617774_check_datagridvalid(){
					//
					var errorObj =ProdDealInfo_dg1470380617774Widget._DT.testData();
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
				
				function savedg1470380617774DataGrid(){
					<#if  refId?? && (refId gt 0)>
					ProdDealInfo_dg1470380617774Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('ProdDealInfo_dg1470380617774Widget') > -1) {
						ProdDealInfo_dg1470380617774Widget.setAllRowEdited();
					}
					var json = ProdDealInfo_dg1470380617774Widget.parseEditedData();
					$('input[name="dg1470380617774ListJson"]').remove();
					$('<input type="hidden" name="dg1470380617774ListJson">').val(json).appendTo($('#MESBasic_product_product_proddealinfoView_form'));
					$('<input type="hidden" name="dg1470380617774ModelCode">').val('MESBasic_1_product_ProdDealInfo').appendTo($('#MESBasic_product_product_proddealinfoView_form'));
				}
				function DT_ProdDealInfo_dg1470380617774_deldatagrid(){
					var deleteRows = ProdDealInfo_dg1470380617774Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','dealerID.id','assignID.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						CUI('<input type="hidden" name="dg1470380617774DeletedIds['+CUI('input[name^="dg1470380617774DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_product_product_proddealinfoView_form'));
					});
				}
				function DT_ProdDealInfo_dg1470380617774_delTreeNodes(){
					var deleteRows = ProdDealInfo_dg1470380617774Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','dealerID.id','assignID.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						CUI('<input type="hidden" name="dg1470380617774DeletedIds['+CUI('input[name^="dg1470380617774DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_product_product_proddealinfoView_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('MESBasic_product_product_proddealinfoView_datagrids');
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
							if(datagrids[0][i] == 'ProdDealInfo_dg1470380617774') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'ProdDealInfo_dg1470380617774';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'ProdDealInfo_dg1470380617774';
					}
					$('body').data('MESBasic_product_product_proddealinfoView_datagrids', datagrids);
				});
				
				var ProdDealInfo_dg1470380617774_importDialog = null;
				function ProdDealInfo_dg1470380617774_showImportDialog(){
					try{
						if(ProdDealInfo_dg1470380617774_importDialog!=null&&ProdDealInfo_dg1470380617774_importDialog.isShow==1){
							return false;
						}
						var url = "/MESBasic/product/product/initImport.action?datagridCode=MESBasic_1_product_proddealinfoViewdg1470380617774&tid=${id!}&datagridName=dg1470380617774";
						ProdDealInfo_dg1470380617774_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("ProdDealInfo_dg1470380617774"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();ProdDealInfo_dg1470380617774_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();ProdDealInfo_dg1470380617774_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						ProdDealInfo_dg1470380617774_importDialog.show();
					}catch(e){}
				}	
				
				function ProdDealInfo_dg1470380617774_downLoadFile(){
					var url = "/MESBasic/product/product/downLoad.action?datagridCode=MESBasic_1_product_proddealinfoViewdg1470380617774&downloadType=template&fileName=dg1470380617774";
					window.open(url,"","");
				}
				function dg1470380617774RenderOverEvent(){
				}
				function dg1470380617774PageInitMethod(nTabIndex){
					MESBasic.product.product.proddealinfoView.initSize(nTabIndex);
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
     	
		<div id="MESBasic_product_product_proddealinfoView_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="MESBasic.product.product.proddealinfoView.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<div id="fileUploadDiv" class="wid-hei"></div>
			</div>
		</div>
		
		<!-- CUSTOM CODE START(view-VIEW-MESBasic_1_product_proddealinfoView,html,MESBasic_1_product_Product,MESBasic_1) -->
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
						$("#MESBasic_product_product_proddealinfoView_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#MESBasic_product_product_proddealinfoView_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#MESBasic_product_product_proddealinfoView_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#MESBasic_product_product_proddealinfoView_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			MESBasic.product.product.proddealinfoView.initCount = 0;
			MESBasic.product.product.proddealinfoView.initSize = function(nTabIndex){
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
				var conHeight = h-$("#MESBasic_product_product_proddealinfoView_main_div .edit-head").height()-$("#MESBasic_product_product_proddealinfoView_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#MESBasic_product_product_proddealinfoView_main_div .edit-workflow").height()</#if>;
				$("#MESBasic_product_product_proddealinfoView_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('MESBasic_product_product_proddealinfoView_datagrids');
				var padding_bottom=16;
				$("#MESBasic_product_product_proddealinfoView_main_div .pd_bottom,#MESBasic_product_product_proddealinfoView_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#MESBasic_product_product_proddealinfoView_main_div .edit-panes-s").each(function(index){
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
									if(MESBasic.product.product.proddealinfoView.initCount <= 2) {
										setTimeout(function(){MESBasic.product.product.proddealinfoView.initSize();}, 200);
										MESBasic.product.product.proddealinfoView.initCount++;
									}/* else {
										MESBasic.product.product.proddealinfoView.initCount = 0;
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
							if(($("#MESBasic_product_product_proddealinfoView_main_div .edit-workflow").length > 0) && ($("#MESBasic_product_product_proddealinfoView_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				MESBasic.product.product.proddealinfoView.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				MESBasic.product.product.proddealinfoView.initSize();
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
							}
						}
					})
					$(".edit-workflow").css("left",145);
					$("#edit_side_btn").toggle(function(){
						if(parseInt($("#MESBasic_product_product_proddealinfoView_main_div").css("width"),10)==650){
							$("#MESBasic_product_product_proddealinfoView_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//MESBasic.product.product.proddealinfoView.resizeLayout();
						//MESBasic.product.product.proddealinfoView.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#MESBasic_product_product_proddealinfoView_main_div").css("width"),10)==800){
							$("#MESBasic_product_product_proddealinfoView_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//MESBasic.product.product.proddealinfoView.resizeLayout();
						//MESBasic.product.product.proddealinfoView.initSize();
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
					MESBasic.product.product.proddealinfoView.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					MESBasic.product.product.proddealinfoView.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){MESBasic.product.product.proddealinfoView.initSize();});
				/*
				MESBasic.product.product.proddealinfoView.resizeLayout=function(){
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
		});

		MESBasic.product.product.proddealinfoView.validate = function(){
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
		MESBasic.product.product.proddealinfoView.beforeSaveProcess = function(){
			$('input[name="product.extraCol"]').remove();
		}
		MESBasic.product.product.proddealinfoView.processDataGrid = function(){
										<#if false && isIE>
										$('#MESBasic_product_product_proddealinfoView_form').append(ProdDealInfo_dg1470380617774Widget._DT.createInputs('dg1470380617774List'));
										</#if>
		};
		MESBasic.product.product.proddealinfoView.save = function(){
			$('#operateType').val("submit");
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!MESBasic.product.product.proddealinfoView.validate()){return;}
			MESBasic.product.product.proddealinfoView.beforeSaveProcess();

			//MESBasic.product.product.proddealinfoView.processDataGrid();
			$('#MESBasic_product_product_proddealinfoView_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('MESBasic_product_product_proddealinfoView_form','MESBasic_product_product_proddealinfoView_datagrids')) {      
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
		MESBasic.product.product.proddealinfoView.print = function(){
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
		
		MESBasic.product.product.proddealinfoView.saveSetting = function(){
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
		
		MESBasic.product.product.proddealinfoView.printSetting = function(){
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
				MESBasic.product.product.proddealinfoView.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(MESBasic.product.product.proddealinfoView.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				MESBasic.product.product.proddealinfoView.settingDialog.show();
			}
		}
		
		
		MESBasic.product.product.proddealinfoView._callBackInfo = function(res){
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
 						window.opener.MESBasic.product.product.editCallBackInfo(res); 						
					}catch(e2){
						try{
							window.opener.location.reload();
						}catch(e3){}
					}
				};

 				setTimeout(function(){
					window.close();
				},1000);
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.MESBasic.product.product.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
			} else {
				CUI.showErrorInfos(res);
			}
		};
		
		//控件版PT选人查看按钮单击事件处理函数
		function dataGridBtnImgClick(sUrl,objNameCustomCondition,sTitle,sPTGridID,nRow,sFieldName,oGrid,customCallBack,crossCompany,isObjCustomProp,objCustomPropNames,viewCode){
			//保存当前单击事件的对象信息
			var obj = {
				"oGrid" : oGrid,
				"nRow" : nRow - 1,
				"sKey":	sFieldName
			}
			if(customCallBack){
				MESBasic.product.product.proddealinfoView._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				MESBasic.product.product.proddealinfoView._isObjCustomProp_IE = isObjCustomProp;
			} else {
				MESBasic.product.product.proddealinfoView._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				MESBasic.product.product.proddealinfoView._objCustomPropNames_IE = objCustomPropNames;
			} else {
				MESBasic.product.product.proddealinfoView._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				MESBasic.product.product.proddealinfoView._refViewCode_IE = viewCode;
			} else {
				MESBasic.product.product.proddealinfoView._refViewCode_IE = '';
			}
			MESBasic.product.product.proddealinfoView._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		MESBasic.product.product.proddealinfoView.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			MESBasic.product.product.proddealinfoView._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			MESBasic.product.product.proddealinfoView._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			MESBasic.product.product.proddealinfoView.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			MESBasic.product.product.proddealinfoView._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				MESBasic.product.product.proddealinfoView._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		MESBasic.product.product.proddealinfoView._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var _prefix= '';
			var arr = objName.split('.');
			if(gridEventObj) {
				MESBasic.product.product.proddealinfoView.gridEventObj = gridEventObj;
				callbackName = "MESBasic.product.product.proddealinfoView.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "MESBasic.product.product.proddealinfoView.getMultiselectCallBackInfo_DG" : "MESBasic.product.product.proddealinfoView.getcallBackInfo_DG";
				MESBasic.product.product.proddealinfoView._currRow = obj.parentNode.parentNode.parentNode;
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="MESBasic.product.product.proddealinfoView.getcallBackInfo";
			}

			if(_prefix!=''){
				MESBasic.product.product.proddealinfoView._prefix = _prefix.substring(1);
			}
			
			MESBasic.product.product.proddealinfoView._oGrid = oGrid;
			MESBasic.product.product.proddealinfoView._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					MESBasic.product.product.proddealinfoView._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					MESBasic.product.product.proddealinfoView._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					MESBasic.product.product.proddealinfoView._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					MESBasic.product.product.proddealinfoView._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					MESBasic.product.product.proddealinfoView._refViewCode = oColumn.viewCode;
				} else {
					MESBasic.product.product.proddealinfoView._refViewCode = '';
				}
			} else {
				MESBasic.product.product.proddealinfoView._isObjCustomProp = false;
				MESBasic.product.product.proddealinfoView._objCustomPropNames = '';
				MESBasic.product.product.proddealinfoView._refViewCode = '';
			}
			if (MESBasic.product.product.proddealinfoView._isObjCustomProp == true && MESBasic.product.product.proddealinfoView._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				MESBasic.product.product.proddealinfoView._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				MESBasic.product.product.proddealinfoView._customCallBack = customCallBack;
			}
			if(MESBasic.product.product.proddealinfoView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(MESBasic.product.product.proddealinfoView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof MESBasic.product.product.proddealinfoView._querycustomFuncN == "function") {
				refparam += MESBasic.product.product.proddealinfoView._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			MESBasic.product.product.proddealinfoView._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		MESBasic.product.product.proddealinfoView._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(MESBasic.product.product.proddealinfoView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(MESBasic.product.product.proddealinfoView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			MESBasic.product.product.proddealinfoView._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'MESBasic.product.product.proddealinfoView.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		MESBasic.product.product.proddealinfoView._querycustomFunc = function(obj) {
			var str = eval("typeof(MESBasic.product.product.proddealinfoView.query_"+obj+")!='undefined'") ? eval('MESBasic.product.product.proddealinfoView.query_'+obj+'()') : null;
			return str;
		};
		MESBasic.product.product.proddealinfoView.getcallBackGroupInfo = function(obj){
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
			MESBasic.product.product.proddealinfoView._dialog.close();
		}
		MESBasic.product.product.proddealinfoView.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('MESBasic_product_product_proddealinfoView_form',obj[0], MESBasic.product.product.proddealinfoView._prefix, MESBasic.product.product.proddealinfoView._sUrl);
			CUI.commonFills('MESBasic_product_product_proddealinfoView_form',MESBasic.product.product.proddealinfoView._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (MESBasic.product.product.proddealinfoView._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(MESBasic.product.product.proddealinfoView._customCallBack) {
					eval(MESBasic.product.product.proddealinfoView._customCallBack);
					MESBasic.product.product.proddealinfoView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.product.product.proddealinfoView._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		MESBasic.product.product.proddealinfoView.getcallBackInfo_DG_IE = function(obj){
			if(MESBasic.product.product.proddealinfoView._customBeforeCallBack) {
				var flag = eval(MESBasic.product.product.proddealinfoView._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = MESBasic.product.product.proddealinfoView.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( MESBasic.product.product.proddealinfoView._isObjCustomProp_IE == true && MESBasic.product.product.proddealinfoView._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,MESBasic.product.product.proddealinfoView._sUrl,MESBasic.product.product.proddealinfoView._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,MESBasic.product.product.proddealinfoView._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (MESBasic.product.product.proddealinfoView._isObjCustomProp_IE == true && MESBasic.product.product.proddealinfoView._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = MESBasic.product.product.proddealinfoView._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = MESBasic.product.product.proddealinfoView._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && MESBasic.product.product.proddealinfoView._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + MESBasic.product.product.proddealinfoView._refViewCode_IE + '&id=' + id,
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
				if(MESBasic.product.product.proddealinfoView._customCallBack) {
					eval(MESBasic.product.product.proddealinfoView._customCallBack);
					MESBasic.product.product.proddealinfoView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.product.product.proddealinfoView._dialog.close();
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
		
		MESBasic.product.product.proddealinfoView.getcallBackInfo_DG = function(obj){
			if(MESBasic.product.product.proddealinfoView._customBeforeCallBack) {
				var flag = eval(MESBasic.product.product.proddealinfoView._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(MESBasic.product.product.proddealinfoView._currRow).next().length==0){
						MESBasic.product.product.proddealinfoView._oGrid.addNewRow();
					}	
					MESBasic.product.product.proddealinfoView._currRow = $(MESBasic.product.product.proddealinfoView._currRow).next();
					$(MESBasic.product.product.proddealinfoView._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(MESBasic.product.product.proddealinfoView._currRow,obj[i], MESBasic.product.product.proddealinfoView._prefix, MESBasic.product.product.proddealinfoView._sUrl);
				if (MESBasic.product.product.proddealinfoView._isObjCustomProp == true && MESBasic.product.product.proddealinfoView._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(MESBasic.product.product.proddealinfoView._currRow,MESBasic.product.product.proddealinfoView._prefix,obj[i],MESBasic.product.product.proddealinfoView._oGrid,MESBasic.product.product.proddealinfoView._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(MESBasic.product.product.proddealinfoView._currRow,MESBasic.product.product.proddealinfoView._prefix,obj[i],MESBasic.product.product.proddealinfoView._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + MESBasic.product.product.proddealinfoView._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + MESBasic.product.product.proddealinfoView._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && MESBasic.product.product.proddealinfoView._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + MESBasic.product.product.proddealinfoView._refViewCode + '&id=' + id,
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
									name = MESBasic.product.product.proddealinfoView._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(MESBasic.product.product.proddealinfoView._currRow, objs, MESBasic.product.product.proddealinfoView._oGrid);
							}
						}
					}
				}
			}
			try{
				if(MESBasic.product.product.proddealinfoView._customCallBack) {
					eval(MESBasic.product.product.proddealinfoView._customCallBack);
					MESBasic.product.product.proddealinfoView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.product.product.proddealinfoView._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + MESBasic.product.product.proddealinfoView._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		MESBasic.product.product.proddealinfoView.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(MESBasic.product.product.proddealinfoView._oGrid, MESBasic.product.product.proddealinfoView._currRow, MESBasic.product.product.proddealinfoView._key, MESBasic.product.product.proddealinfoView._displayFieldName, obj[i])
			}
			try{
				if(MESBasic.product.product.proddealinfoView._customCallBack) {
					eval(MESBasic.product.product.proddealinfoView._customCallBack);
					MESBasic.product.product.proddealinfoView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.product.product.proddealinfoView._dialog.close();
			} catch(e){}
		};
		
		MESBasic.product.product.proddealinfoView.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						MESBasic.product.product.proddealinfoView.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#MESBasic_product_product_proddealinfoView_form'));
						}
					}
				}
			});
		};

		$(function(){
			MESBasic.product.product.proddealinfoView.onloadForProduct();
			
		});

		MESBasic.product.product.proddealinfoView.beforeSubmitMethodSettingInPage = function(){
			MESBasic.product.product.proddealinfoView.onsaveForProduct();
		};
		MESBasic.product.product.proddealinfoView.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  MESBasic.product.product.proddealinfoView.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		MESBasic.product.product.proddealinfoView.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#MESBasic_product_product_proddealinfoView_main_div").hide();
				},500);
			}else{
				CUI("#MESBasic_product_product_proddealinfoView_main_div").hide();
			  	$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		MESBasic.product.product.proddealinfoView.showThis = function(){
			if(!CUI("#MESBasic_product_product_proddealinfoView_main_div").is(':visible')) {
				CUI("#MESBasic_product_product_proddealinfoView_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		MESBasic.product.product.proddealinfoView.showInfoDialog=function(mode){
			
			MESBasic.product.product.proddealinfoView.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "MESBasic_product_product_proddealinfoView_dealInfo",
				modal:true,
				height:500,
				width: 850,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			MESBasic.product.product.proddealinfoView.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		MESBasic.product.product.proddealinfoView.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			<#if pendingId??>
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=MESBasic_1_product");
			<#else>
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?readOnlyFlag=true&linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=MESBasic_1_product");
			</#if>
			}
		}
		
		MESBasic.product.product.proddealinfoView.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/MESBasic/product/product/dealInfo-list.action&dlTableInfoId=${(product.tableInfoId)?default('')}");
			}
		}
		MESBasic.product.product.proddealinfoView.showFlowInfo=function(){
			if(CUI.trim(CUI("#flowDiv").html())==""){
				CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=MESBasic_1_product_Product&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(product.tableInfoId)?default('')}");
			}
		}
		MESBasic.product.product.proddealinfoView.supervision=function(){
			MESBasic.product.product.proddealinfoView.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(product.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				MESBasic.product.product.proddealinfoView.modifyOwnerStaffDialog.show();
		}
		




		/* CUSTOM CODE START(view-VIEW-MESBasic_1_product_proddealinfoView,js,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */

		MESBasic.product.product.proddealinfoView.onloadForProduct = function(){
		/* CUSTOM CODE START(view-VIEW-MESBasic_1_product_proddealinfoView,onloadForProduct,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
		}

		MESBasic.product.product.proddealinfoView.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-VIEW-MESBasic_1_product_proddealinfoView,onsaveForProduct,MESBasic_1_product_Product,MESBasic_1) */
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
				<div class="sidebar-top"><a href="#"  onclick="MESBasic.product.product.proddealinfoView.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
							 <li>
								<#if editNew>
								<a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.relatingModel.name)}">${getText(l.relatingModel.entity.name)}</a>
								<#else>
									<a href="#" onclick="MESBasic.product.product.proddealinfoView.showBusinessList('${l.relatingModel.code.replace('.','')}',${(product.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.relatingModel.entity.name)}(${(l.count)!})">${getText(l.relatingModel.entity.name)}(${(l.count)!})</a>
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