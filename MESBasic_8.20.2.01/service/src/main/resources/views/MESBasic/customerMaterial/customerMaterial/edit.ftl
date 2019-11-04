<!-- MESBasic_1/customerMaterial/edit -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1559177278641')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-EDIT-MESBasic_1_customerMaterial_edit,head,MESBasic_1_customerMaterial_CustomerMaterial,MESBasic_1) -->
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
	CUI.ns('MESBasic.customerMaterial.customerMaterial.edit');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "MESBasic_customerMaterial_customerMaterial">
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
<#assign callbackName ="MESBasic.customerMaterial.customerMaterial.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="MESBasic_customerMaterial_customerMaterial_edit_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="MESBasic_customerMaterial_customerMaterial_edit_form" cssStyle="height:100%;" hiddenField="customerMaterial.material.id,customerMaterial.customer.id," onsubmitMethod="MESBasic.customerMaterial.customerMaterial.edit.beforeSubmitMethod()" ecAction="/MESBasic/customerMaterial/customerMaterial/edit/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="edit">
	<input type="hidden" name="viewCode" value="MESBasic_1_customerMaterial_edit">
	<input type="hidden" name="datagridKey" value="MESBasic_customerMaterial_customerMaterial_edit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="customerMaterial.version" value="${(customerMaterial.version)!0}" />
	<input type="hidden" name="customerMaterial.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
		<input type="hidden" name="customerMaterial.material.id" value="${(customerMaterial.material.id)!""}"/>
		<input type="hidden" name="customerMaterial.customer.id" value="${(customerMaterial.customer.id)!""}"/>
	<div id="MESBasic_edit_edit_div" style="height:100%">
		<div id="MESBasic_customerMaterial_customerMaterial_edit_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
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
									$("#ec_MESBasic_customerMaterial_customerMaterial_edit_tabs-1").width(width);
									$("#ec_MESBasic_customerMaterial_customerMaterial_edit_tabs-1").height(height);
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
										$("#ec_MESBasic_customerMaterial_customerMaterial_edit_tabs-1").width(width);
										$("#ec_MESBasic_customerMaterial_customerMaterial_edit_tabs-1").height(height);
									});	
								});
								</script>
								<div id='ec_MESBasic_customerMaterial_customerMaterial_edit_tabs-1'>
				<script type="text/javascript">
			$(function(){
				$.extraLayout($("#ec_MESBasic_customerMaterial_customerMaterial_edit_row-2").parent(),{nums:1,method:"row",leftBlock:false,rightBlock:false,widths:[100],layoutType:'classic'});
			});
		</script>
				<div id="ec_MESBasic_customerMaterial_customerMaterial_edit_row-2" class='extra-layout row-fixed' style="border:none; ">
			
					
							<script>
								$(function(){
									$("[id='ec_MESBasic_customerMaterial_customerMaterial_edit_row-2']").css("overflow","auto");
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
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1559177178994')}" >${getText('MESBasic.propertydisplayName.randon1559177178994')}</label>
				</td>
				
						<#assign customerMaterial_code_defaultValue  = ''>
							 							<#assign customerMaterial_code_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="customerMaterial.code" id="customerMaterial_code"  style=";" originalvalue="<#if !newObj || (customerMaterial.code)?has_content>${(customerMaterial.code?html)!}<#else>${customerMaterial_code_defaultValue!}</#if>" value="<#if !newObj || (customerMaterial.code)?has_content>${(customerMaterial.code?html)!}<#else>${customerMaterial_code_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1559177261248')}" >${getText('MESBasic.propertydisplayName.randon1559177261248')}</label>
				</td>
				
						<#assign customerMaterial_name_defaultValue  = ''>
							 							<#assign customerMaterial_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="customerMaterial.name" id="customerMaterial_name"  style=";" originalvalue="<#if !newObj || (customerMaterial.name)?has_content>${(customerMaterial.name?html)!}<#else>${customerMaterial_name_defaultValue!}</#if>" value="<#if !newObj || (customerMaterial.name)?has_content>${(customerMaterial.name?html)!}<#else>${customerMaterial_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449640688865')}" >${getText('MESBasic.propertydisplayName.randon1449640688865')}</label>
				</td>
				
						<#assign customerMaterial_customer_customerCode_defaultValue  = ''>
														<#assign customerMaterial_customer_customerCode_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1449650950146')}" viewType="${viewType!}" deValue="${customerMaterial_customer_customerCode_defaultValue!}" conditionfunc="MESBasic.customerMaterial.customerMaterial.edit._querycustomFunc('customerMaterial_customer_customerCode')"  value="${(customerMaterial.customer.customerCode)!}" displayFieldName="customerCode" name="customerMaterial.customer.customerCode" id="customerMaterial_customer_customerCode" type="other" url="/MESBasic/baseCustomer/baseCustomer/refCustLayout.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_customerMaterial_customerMaterial_edit_form" editCustomCallback=";" refViewCode="MESBasic_1_baseCustomer_refCustLayout" onkeyupfuncname=";_callback_customerMaterial_customer_customerCode(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(customerMaterial.id)?? && (customerMaterial.customer.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${customerMaterial.customer.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_customerMaterial_customerMaterial_edit_form',obj, 'customerMaterial.customer', '/MESBasic/baseCustomer/baseCustomer/refCustLayout.action');
												CUI.commonFills('MESBasic_customerMaterial_customerMaterial_edit_form', 'customerMaterial.customer',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1449646749348')}" >${getText('MESBasic.propertydisplayName.randon1449646749348')}</label>
				</td>
				
						<#assign customerMaterial_customer_customerName_defaultValue  = ''>
														<#assign customerMaterial_customer_customerName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="customerMaterial.customer.customerName" id="customerMaterial_customer_customerName"  style=";" originalvalue="<#if !newObj || (customerMaterial.customer.customerName)?has_content>${(customerMaterial.customer.customerName?html)!}<#else>${customerMaterial_customer_customerName_defaultValue!}</#if>" value="<#if !newObj || (customerMaterial.customer.customerName)?has_content>${(customerMaterial.customer.customerName?html)!}<#else>${customerMaterial_customer_customerName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415772644833')}" >${getText('MESBasic.propertydisplayName.radion1415772644833')}</label>
				</td>
				
						<#assign customerMaterial_material_productCode_defaultValue  = ''>
														<#assign customerMaterial_material_productCode_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}" viewType="${viewType!}" deValue="${customerMaterial_material_productCode_defaultValue!}" conditionfunc="MESBasic.customerMaterial.customerMaterial.edit._querycustomFunc('customerMaterial_material_productCode')"  value="${(customerMaterial.material.productCode)!}" displayFieldName="productCode" name="customerMaterial.material.productCode" id="customerMaterial_material_productCode" type="other" url="/MESBasic/product/product/productRefNew.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_customerMaterial_customerMaterial_edit_form" editCustomCallback=";" refViewCode="MESBasic_1_product_productRefNew" onkeyupfuncname=";_callback_customerMaterial_material_productCode(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(customerMaterial.id)?? && (customerMaterial.material.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${customerMaterial.material.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_customerMaterial_customerMaterial_edit_form',obj, 'customerMaterial.material', '/MESBasic/product/product/productRefNew.action');
												CUI.commonFills('MESBasic_customerMaterial_customerMaterial_edit_form', 'customerMaterial.material',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415772740737')}" >${getText('MESBasic.propertydisplayName.radion1415772740737')}</label>
				</td>
				
						<#assign customerMaterial_material_productName_defaultValue  = ''>
														<#assign customerMaterial_material_productName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="customerMaterial.material.productName" id="customerMaterial_material_productName"  style=";" originalvalue="<#if !newObj || (customerMaterial.material.productName)?has_content>${(customerMaterial.material.productName?html)!}<#else>${customerMaterial_material_productName_defaultValue!}</#if>" value="<#if !newObj || (customerMaterial.material.productName)?has_content>${(customerMaterial.material.productName?html)!}<#else>${customerMaterial_material_productName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1559177212006')}" >${getText('MESBasic.propertydisplayName.randon1559177212006')}</label>
				</td>
				
						<#assign customerMaterial_customerMaterialMemo_defaultValue  = ''>
							 							<#assign customerMaterial_customerMaterialMemo_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="3" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="LONGTEXT" name="customerMaterial.customerMaterialMemo" id="customerMaterial_customerMaterialMemo"  style=";" originalvalue="<#if !newObj || (customerMaterial.customerMaterialMemo)?has_content>${(customerMaterial.customerMaterialMemo?html)!}<#else>${customerMaterial_customerMaterialMemo_defaultValue!}</#if>" value="<#if !newObj || (customerMaterial.customerMaterialMemo)?has_content>${(customerMaterial.customerMaterialMemo?html)!}<#else>${customerMaterial_customerMaterialMemo_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
		</tr>
	</table>
							</div>
							</div>
									</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-EDIT-MESBasic_1_customerMaterial_edit,html,MESBasic_1_customerMaterial_CustomerMaterial,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	MESBasic.customerMaterial.customerMaterial.edit.beforeSaveProcess = function(){}
	MESBasic.customerMaterial.customerMaterial.edit.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(MESBasic.customerMaterial.customerMaterial.edit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#MESBasic_customerMaterial_customerMaterial_edit_form').trigger('beforeSubmit');
		//customerMaterial.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="customerMaterial.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#MESBasic_customerMaterial_customerMaterial_edit_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#MESBasic_customerMaterial_customerMaterial_edit_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	MESBasic.customerMaterial.customerMaterial.edit.validate = function(){
		return true;
	}
	
	
	//打印
	MESBasic.customerMaterial.customerMaterial.edit.print = function(url){
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
		
		MESBasic.customerMaterial.customerMaterial.edit.saveSetting = function(){
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
		MESBasic.customerMaterial.customerMaterial.edit.printSetting = function(){
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
			MESBasic.customerMaterial.customerMaterial.edit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(MESBasic.customerMaterial.customerMaterial.edit.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				MESBasic.customerMaterial.customerMaterial.edit.settingDialog.show();
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
			MESBasic.customerMaterial.customerMaterial.edit._customCallBack = customCallBack;
		}
		MESBasic.customerMaterial.customerMaterial.edit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#MESBasic_customerMaterial_customerMaterial_edit_fileupload').length == 0) {
				$('body').append('<div id="MESBasic_customerMaterial_customerMaterial_edit_fileupload"></div>');
			}
			MESBasic.customerMaterial.customerMaterial.edit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "MESBasic_customerMaterial_customerMaterial_edit_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#MESBasic_customerMaterial_customerMaterial_edit_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			MESBasic.customerMaterial.customerMaterial.edit.infoDialog.show();
			if($('#MESBasic_customerMaterial_customerMaterial_edit_fileupload').html() == '') {
				$('#MESBasic_customerMaterial_customerMaterial_edit_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=MESBasic_customerMaterial_customerMaterial&entityCode=MESBasic_1_customerMaterial&dialogId="+dialogId);
			}
		}
	//参照复制函数
	MESBasic.customerMaterial.customerMaterial.edit.referenceCopy = function(objName,url, dialog){
		var callbackName ="MESBasic.customerMaterial.customerMaterial.edit.referenceCopyBackInfo";
		MESBasic.customerMaterial.customerMaterial.edit.dialog = dialog;
		MESBasic.customerMaterial.customerMaterial.edit._dialog = foundation.common.select({
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
	
	MESBasic.customerMaterial.customerMaterial.edit.referenceCopyBackInfo = function(obj){
		if(MESBasic.customerMaterial.customerMaterial.edit._dialog){
			MESBasic.customerMaterial.customerMaterial.edit._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,MESBasic.customerMaterial.customerMaterial.edit.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('MESBasic_customerMaterial_customerMaterial_edit_form','MESBasic_customerMaterial_customerMaterial_edit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(MESBasic.customerMaterial.customerMaterial.edit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(MESBasic.customerMaterial.customerMaterial.edit.dialog._el).load('/MESBasic/customerMaterial/customerMaterial/edit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( MESBasic.customerMaterial.customerMaterial.edit.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + MESBasic.customerMaterial.customerMaterial.edit.dialog._config.iframe, MESBasic.customerMaterial.customerMaterial.edit.dialog._dialog ).prop( 'src', '/MESBasic/customerMaterial/customerMaterial/edit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(MESBasic.customerMaterial.customerMaterial.edit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(MESBasic.customerMaterial.customerMaterial.edit.dialog._el).load('/MESBasic/customerMaterial/customerMaterial/edit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	MESBasic.customerMaterial.customerMaterial.edit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		MESBasic.customerMaterial.customerMaterial.edit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		MESBasic.customerMaterial.customerMaterial.edit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			MESBasic.customerMaterial.customerMaterial.edit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	MESBasic.customerMaterial.customerMaterial.edit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'MESBasic_customerMaterial_customerMaterial_edit' + '_' + extraFrameParam;
		var callbackName="";
		MESBasic.customerMaterial.customerMaterial.edit._prefix = '';
		MESBasic.customerMaterial.customerMaterial.edit._oGrid = oGrid;
		MESBasic.customerMaterial.customerMaterial.edit._sUrl = url;
		if(customCallBack){
			MESBasic.customerMaterial.customerMaterial.edit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			MESBasic.customerMaterial.customerMaterial.edit.gridEventObj = gridEventObj;
			callbackName = "MESBasic.customerMaterial.customerMaterial.edit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				MESBasic.customerMaterial.customerMaterial.edit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "MESBasic.customerMaterial.customerMaterial.edit.getMultiselectCallBackInfo_DG" : "MESBasic.customerMaterial.customerMaterial.edit.getcallBackInfo_DG";
			MESBasic.customerMaterial.customerMaterial.edit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				MESBasic.customerMaterial.customerMaterial.edit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="MESBasic.customerMaterial.customerMaterial.edit.getcallBackInfo";
		}
		if(MESBasic.customerMaterial.customerMaterial.edit._prefix!=''){
			MESBasic.customerMaterial.customerMaterial.edit._prefix = MESBasic.customerMaterial.customerMaterial.edit._prefix.substring(1);
		}
		if(MESBasic.customerMaterial.customerMaterial.edit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.customerMaterial.customerMaterial.edit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof MESBasic.customerMaterial.customerMaterial.edit._querycustomFuncN == "function") {
				refparam += MESBasic.customerMaterial.customerMaterial.edit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		MESBasic.customerMaterial.customerMaterial.edit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.customerMaterial.customerMaterial.edit._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.customerMaterial.customerMaterial.edit.query_"+obj+")!='undefined'") ? eval('MESBasic.customerMaterial.customerMaterial.edit.query_'+obj+'()') : null;
		return str;
	
	};
	
	MESBasic.customerMaterial.customerMaterial.edit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('MESBasic_customerMaterial_customerMaterial_edit_form',obj[0], MESBasic.customerMaterial.customerMaterial.edit._prefix, MESBasic.customerMaterial.customerMaterial.edit._sUrl);
		CUI.commonFills('MESBasic_customerMaterial_customerMaterial_edit_form',MESBasic.customerMaterial.customerMaterial.edit._prefix,obj[0]);

		try{
			if(MESBasic.customerMaterial.customerMaterial.edit._customCallBack) {
				eval(MESBasic.customerMaterial.customerMaterial.edit._customCallBack);
				MESBasic.customerMaterial.customerMaterial.edit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.customerMaterial.customerMaterial.edit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	MESBasic.customerMaterial.customerMaterial.edit.getcallBackInfo_DG_IE = function(obj){
		if(MESBasic.customerMaterial.customerMaterial.edit._customBeforeCallBack) {
			var flag = eval(MESBasic.customerMaterial.customerMaterial.edit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = MESBasic.customerMaterial.customerMaterial.edit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,MESBasic.customerMaterial.customerMaterial.edit._sUrl);
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
			if(MESBasic.customerMaterial.customerMaterial.edit._customCallBack) {
				eval(MESBasic.customerMaterial.customerMaterial.edit._customCallBack);
				MESBasic.customerMaterial.customerMaterial.edit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.customerMaterial.customerMaterial.edit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	MESBasic.customerMaterial.customerMaterial.edit.getcallBackInfo_DG = function(obj){
		if(MESBasic.customerMaterial.customerMaterial.edit._customBeforeCallBack) {
			var flag = eval(MESBasic.customerMaterial.customerMaterial.edit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(MESBasic.customerMaterial.customerMaterial.edit._currRow).next().length==0){
					MESBasic.customerMaterial.customerMaterial.edit._oGrid.addNewRow();
				}	
				MESBasic.customerMaterial.customerMaterial.edit._currRow = $(MESBasic.customerMaterial.customerMaterial.edit._currRow).next();
				$(MESBasic.customerMaterial.customerMaterial.edit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(MESBasic.customerMaterial.customerMaterial.edit._currRow,obj[i],MESBasic.customerMaterial.customerMaterial.edit._prefix,MESBasic.customerMaterial.customerMaterial.edit._sUrl);
			eval("CUI.commonFills_DG(MESBasic.customerMaterial.customerMaterial.edit._currRow,MESBasic.customerMaterial.customerMaterial.edit._prefix,obj[i],MESBasic.customerMaterial.customerMaterial.edit._oGrid)");
		}
		try{
			if(MESBasic.customerMaterial.customerMaterial.edit._customCallBack) {
				eval(MESBasic.customerMaterial.customerMaterial.edit._customCallBack);
				MESBasic.customerMaterial.customerMaterial.edit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.customerMaterial.customerMaterial.edit._dialog.close();
		} catch(e){}
	};
	
	MESBasic.customerMaterial.customerMaterial.edit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(MESBasic.customerMaterial.customerMaterial.edit._oGrid, MESBasic.customerMaterial.customerMaterial.edit._currRow, MESBasic.customerMaterial.customerMaterial.edit._key, MESBasic.customerMaterial.customerMaterial.edit._displayFieldName, obj[i])
		}
		try{
			if(MESBasic.customerMaterial.customerMaterial.edit._customCallBack) {
				eval(MESBasic.customerMaterial.customerMaterial.edit._customCallBack);
				MESBasic.customerMaterial.customerMaterial.edit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.customerMaterial.customerMaterial.edit._dialog.close();
		} catch(e){}
	};
	
	MESBasic.customerMaterial.customerMaterial.edit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			MESBasic.customerMaterial.customerMaterial.edit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#MESBasic_customerMaterial_customerMaterial_edit_form'));
        			}
        	   	}
        	}
      	});
	};
	MESBasic.customerMaterial.customerMaterial.edit.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	MESBasic.customerMaterial.customerMaterial.edit.initCount = 0;
	MESBasic.customerMaterial.customerMaterial.edit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#MESBasic_edit_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('MESBasic_customerMaterial_customerMaterial_edit_datagrids');	
		var	conHeight = h-$("#MESBasic_customerMaterial_customerMaterial_edit_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#MESBasic_customerMaterial_customerMaterial_edit_main_div .edit-panes-s").each(function(index){
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
							if(MESBasic.customerMaterial.customerMaterial.edit.initCount <= 2) {
								setTimeout(function(){MESBasic.customerMaterial.customerMaterial.edit.initSize();}, 200);
								MESBasic.customerMaterial.customerMaterial.edit.initCount++;
							}/* else {
								MESBasic.customerMaterial.customerMaterial.edit.initCount = 0;
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
		MESBasic.customerMaterial.customerMaterial.edit.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    MESBasic.customerMaterial.customerMaterial.edit.initSize(index);
		});
		$(window).bind("dialog.resize",function(){MESBasic.customerMaterial.customerMaterial.edit.initSize();});
	});
</script>
<script type="text/javascript">
	

	/* CUSTOM CODE START(view-EDIT-MESBasic_1_customerMaterial_edit,js,MESBasic_1_customerMaterial_CustomerMaterial,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>