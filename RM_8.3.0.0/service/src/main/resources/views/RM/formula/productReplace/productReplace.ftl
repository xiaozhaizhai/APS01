<!-- RM_7.5.0.0/formula/productReplace -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1540369790056')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_productReplace,head,RM_7.5.0.0_formula_ProductReplace,RM_7.5.0.0) -->
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
	CUI.ns('RM.formula.productReplace.productReplace');
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
<#assign callbackName ="RM.formula.productReplace.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="RM_formula_productReplace_productReplace_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="RM_formula_productReplace_productReplace_form" cssStyle="height:100%;" hiddenField="productReplace.originProduct.id,productReplace.newProduct.id,productReplace.replaceUser.id," onsubmitMethod="RM.formula.productReplace.productReplace.beforeSubmitMethod()" ecAction="/RM/formula/productReplace/productReplace/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="productReplace">
	<input type="hidden" name="viewCode" value="RM_7.5.0.0_formula_productReplace">
	<input type="hidden" name="datagridKey" value="RM_formula_productReplace_productReplace_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="productReplace.version" value="${(productReplace.version)!0}" />
	<input type="hidden" name="productReplace.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
		<input type="hidden" name="productReplace.originProduct.id" value="${(productReplace.originProduct.id)!""}"/>
		<input type="hidden" name="productReplace.newProduct.id" value="${(productReplace.newProduct.id)!""}"/>
		<input type="hidden" name="productReplace.replaceUser.id" value="${(productReplace.replaceUser.id)!""}"/>
	<div id="RM_productReplace_edit_div" style="height:100%">
		<div id="RM_formula_productReplace_productReplace_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "RM_formula_productReplace_productReplace_form"+"_attcount";
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
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:30%'></td><td style='height:0px;border:none;width:37%'></td><td style='height:0px;border:none;width:30%'></td></tr>
		<tr class="dialog_tr">
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.radion201810241633001')}" >${getText('RM.propertydisplayName.radion201810241633001')}</label>
				</td>
				
						<#assign productReplace_originProduct_productName_defaultValue  = ''>
														<#assign productReplace_originProduct_productName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}" viewType="${viewType!}" deValue="${productReplace_originProduct_productName_defaultValue!}" conditionfunc="RM.formula.productReplace.productReplace._querycustomFunc('productReplace_originProduct_productName')"  value="${(productReplace.originProduct.productName)!}" displayFieldName="productName" name="productReplace.originProduct.productName" id="productReplace_originProduct_productName" type="other" url="/MESBasic/product/product/refProductLayout.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_productReplace_productReplace_form" editCustomCallback=";" refViewCode="MESBasic_1_product_refProductLayout" onkeyupfuncname=";_callback_productReplace_originProduct_productName(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(productReplace.id)?? && (productReplace.originProduct.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${productReplace.originProduct.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_productReplace_productReplace_form',obj, 'productReplace.originProduct', '/MESBasic/product/product/refProductLayout.action');
												CUI.commonFills('RM_formula_productReplace_productReplace_form', 'productReplace.originProduct',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.radion2018102433002')}" >${getText('RM.propertydisplayName.radion2018102433002')}</label>
				</td>
				
						<#assign productReplace_newProduct_productName_defaultValue  = ''>
														<#assign productReplace_newProduct_productName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}" viewType="${viewType!}" deValue="${productReplace_newProduct_productName_defaultValue!}" conditionfunc="RM.formula.productReplace.productReplace._querycustomFunc('productReplace_newProduct_productName')"  value="${(productReplace.newProduct.productName)!}" displayFieldName="productName" name="productReplace.newProduct.productName" id="productReplace_newProduct_productName" type="other" url="/MESBasic/product/product/refProductLayout.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_productReplace_productReplace_form" editCustomCallback=";" refViewCode="MESBasic_1_product_refProductLayout" onkeyupfuncname=";_callback_productReplace_newProduct_productName(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(productReplace.id)?? && (productReplace.newProduct.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${productReplace.newProduct.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_productReplace_productReplace_form',obj, 'productReplace.newProduct', '/MESBasic/product/product/refProductLayout.action');
												CUI.commonFills('RM_formula_productReplace_productReplace_form', 'productReplace.newProduct',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1540368099250')}" >${getText('RM.propertydisplayName.randon1540368099250')}</label>
				</td>
				
						<#assign productReplace_replaceTime_defaultValue  = 'currentTime'>
							 					<#if (productReplace_replaceTime_defaultValue)?? &&(productReplace_replaceTime_defaultValue)?has_content>
							<#assign productReplace_replaceTime_defaultValue  = getDefaultDateTime(productReplace_replaceTime_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  colspan="2" align="left" style="text-align: left;display:none;;" >
					
							
							<#if newObj && !(productReplace.replaceTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="productReplace.replaceTime" value="${productReplace_replaceTime_defaultValue!}" type="dateTime"  id="productReplace.replaceTime"  cssStyle=""   align="left"/>
								
							<#else>
							<#if (productReplace.replaceTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="productReplace.replaceTime" value="${productReplace.replaceTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="productReplace.replaceTime"  cssStyle="" align="left"  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="productReplace.replaceTime" value="" type="dateTime" id="productReplace.replaceTime" cssStyle=""  align="left"/>
								
							</#if>
							</#if>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
					
							<label style="width:100%;;" value="${getText('foundation.ec.entity.staff.code')}" >${getText('foundation.ec.entity.staff.code')}</label>
				</td>
				
						<#assign productReplace_replaceUser_code_defaultValue  = 'currentUser'>
												<td  nullable=true class="edit-table-content"   colspan="2" align="left" style="text-align: left;display:none;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.view.reference')}" viewType="${viewType!}" deValue="${productReplace_replaceUser_code_defaultValue!}" conditionfunc="RM.formula.productReplace.productReplace._querycustomFunc('productReplace_replaceUser_code')"  value="${(productReplace.replaceUser.code)!}" displayFieldName="code" name="productReplace.replaceUser.code" id="productReplace_replaceUser_code" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_productReplace_productReplace_form" editCustomCallback=";" refViewCode="sysbase_1.0_staff_ref" onkeyupfuncname=";_callback_productReplace_replaceUser_code(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (productReplace_replaceUser_code_defaultValue)=='currentUser'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.id}'};
											obj = foundation.common.getObject('RM_formula_productReplace_productReplace_form',obj, 'productReplace.replaceUser', '/foundation/staff/common/staffListFrameset.action');
											CUI.commonFills('RM_formula_productReplace_productReplace_form', 'productReplace.replaceUser',obj,true);
											$('input:hidden[name="productReplace.replaceUser.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(productReplace.id)?? && (productReplace.replaceUser.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${productReplace.replaceUser.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_productReplace_productReplace_form',obj, 'productReplace.replaceUser', '/foundation/staff/common/staffListFrameset.action');
												CUI.commonFills('RM_formula_productReplace_productReplace_form', 'productReplace.replaceUser',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1540368026295')}" >${getText('RM.propertydisplayName.randon1540368026295')}</label>
				</td>
				
						<#assign productReplace_formulaIds_defaultValue  = ''>
							 							<#assign productReplace_formulaIds_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="2" align="left" style="text-align: left;display:none;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="productReplace.formulaIds" id="productReplace_formulaIds"  style=";" originalvalue="<#if !newObj || (productReplace.formulaIds)?has_content>${(productReplace.formulaIds?html)!}<#else>${productReplace_formulaIds_defaultValue!}</#if>" value="<#if !newObj || (productReplace.formulaIds)?has_content>${(productReplace.formulaIds?html)!}<#else>${productReplace_formulaIds_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
		</tr>
	</table>
</div>				</div>	
				<div class="edit-datatable">	

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_productReplace,html,RM_7.5.0.0_formula_ProductReplace,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	RM.formula.productReplace.productReplace.beforeSaveProcess = function(){}
	RM.formula.productReplace.productReplace.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(RM.formula.productReplace.productReplace.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#RM_formula_productReplace_productReplace_form').trigger('beforeSubmit');
		//productReplace.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="productReplace.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#RM_formula_productReplace_productReplace_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#RM_formula_productReplace_productReplace_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	RM.formula.productReplace.productReplace.validate = function(){
		return true;
	}
	
	
	//打印
	RM.formula.productReplace.productReplace.print = function(url){
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
		
		RM.formula.productReplace.productReplace.saveSetting = function(){
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
		RM.formula.productReplace.productReplace.printSetting = function(){
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
			RM.formula.productReplace.productReplace.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(RM.formula.productReplace.productReplace.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				RM.formula.productReplace.productReplace.settingDialog.show();
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
			RM.formula.productReplace.productReplace._customCallBack = customCallBack;
		}
		RM.formula.productReplace.productReplace._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#RM_formula_productReplace_productReplace_fileupload').length == 0) {
				$('body').append('<div id="RM_formula_productReplace_productReplace_fileupload"></div>');
			}
			RM.formula.productReplace.productReplace.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "RM_formula_productReplace_productReplace_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#RM_formula_productReplace_productReplace_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			RM.formula.productReplace.productReplace.infoDialog.show();
			if($('#RM_formula_productReplace_productReplace_fileupload').html() == '') {
				$('#RM_formula_productReplace_productReplace_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=RM_formula_productReplace&entityCode=RM_7.5.0.0_formula&dialogId="+dialogId);
			}
		}
	//参照复制函数
	RM.formula.productReplace.productReplace.referenceCopy = function(objName,url, dialog){
		var callbackName ="RM.formula.productReplace.productReplace.referenceCopyBackInfo";
		RM.formula.productReplace.productReplace.dialog = dialog;
		RM.formula.productReplace.productReplace._dialog = foundation.common.select({
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
	
	RM.formula.productReplace.productReplace.referenceCopyBackInfo = function(obj){
		if(RM.formula.productReplace.productReplace._dialog){
			RM.formula.productReplace.productReplace._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,RM.formula.productReplace.productReplace.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('RM_formula_productReplace_productReplace_form','RM_formula_productReplace_productReplace_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(RM.formula.productReplace.productReplace.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(RM.formula.productReplace.productReplace.dialog._el).load('/RM/formula/productReplace/productReplace.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( RM.formula.productReplace.productReplace.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + RM.formula.productReplace.productReplace.dialog._config.iframe, RM.formula.productReplace.productReplace.dialog._dialog ).prop( 'src', '/RM/formula/productReplace/productReplace.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(RM.formula.productReplace.productReplace.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(RM.formula.productReplace.productReplace.dialog._el).load('/RM/formula/productReplace/productReplace.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	RM.formula.productReplace.productReplace.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		RM.formula.productReplace.productReplace.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		RM.formula.productReplace.productReplace._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			RM.formula.productReplace.productReplace._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	RM.formula.productReplace.productReplace._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'RM_formula_productReplace_productReplace' + '_' + extraFrameParam;
		var callbackName="";
		RM.formula.productReplace.productReplace._prefix = '';
		RM.formula.productReplace.productReplace._oGrid = oGrid;
		RM.formula.productReplace.productReplace._sUrl = url;
		if(customCallBack){
			RM.formula.productReplace.productReplace._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			RM.formula.productReplace.productReplace.gridEventObj = gridEventObj;
			callbackName = "RM.formula.productReplace.productReplace.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				RM.formula.productReplace.productReplace._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "RM.formula.productReplace.productReplace.getMultiselectCallBackInfo_DG" : "RM.formula.productReplace.productReplace.getcallBackInfo_DG";
			RM.formula.productReplace.productReplace._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				RM.formula.productReplace.productReplace._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="RM.formula.productReplace.productReplace.getcallBackInfo";
		}
		if(RM.formula.productReplace.productReplace._prefix!=''){
			RM.formula.productReplace.productReplace._prefix = RM.formula.productReplace.productReplace._prefix.substring(1);
		}
		if(RM.formula.productReplace.productReplace._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.formula.productReplace.productReplace._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof RM.formula.productReplace.productReplace._querycustomFuncN == "function") {
				refparam += RM.formula.productReplace.productReplace._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		RM.formula.productReplace.productReplace._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.formula.productReplace.productReplace._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.formula.productReplace.productReplace.query_"+obj+")!='undefined'") ? eval('RM.formula.productReplace.productReplace.query_'+obj+'()') : null;
		return str;
	
	};
	
	RM.formula.productReplace.productReplace.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('RM_formula_productReplace_productReplace_form',obj[0], RM.formula.productReplace.productReplace._prefix, RM.formula.productReplace.productReplace._sUrl);
		CUI.commonFills('RM_formula_productReplace_productReplace_form',RM.formula.productReplace.productReplace._prefix,obj[0]);

		try{
			if(RM.formula.productReplace.productReplace._customCallBack) {
				eval(RM.formula.productReplace.productReplace._customCallBack);
				RM.formula.productReplace.productReplace._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.productReplace.productReplace._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	RM.formula.productReplace.productReplace.getcallBackInfo_DG_IE = function(obj){
		if(RM.formula.productReplace.productReplace._customBeforeCallBack) {
			var flag = eval(RM.formula.productReplace.productReplace._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = RM.formula.productReplace.productReplace.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,RM.formula.productReplace.productReplace._sUrl);
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
			if(RM.formula.productReplace.productReplace._customCallBack) {
				eval(RM.formula.productReplace.productReplace._customCallBack);
				RM.formula.productReplace.productReplace._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.productReplace.productReplace._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	RM.formula.productReplace.productReplace.getcallBackInfo_DG = function(obj){
		if(RM.formula.productReplace.productReplace._customBeforeCallBack) {
			var flag = eval(RM.formula.productReplace.productReplace._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(RM.formula.productReplace.productReplace._currRow).next().length==0){
					RM.formula.productReplace.productReplace._oGrid.addNewRow();
				}	
				RM.formula.productReplace.productReplace._currRow = $(RM.formula.productReplace.productReplace._currRow).next();
				$(RM.formula.productReplace.productReplace._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(RM.formula.productReplace.productReplace._currRow,obj[i],RM.formula.productReplace.productReplace._prefix,RM.formula.productReplace.productReplace._sUrl);
			eval("CUI.commonFills_DG(RM.formula.productReplace.productReplace._currRow,RM.formula.productReplace.productReplace._prefix,obj[i],RM.formula.productReplace.productReplace._oGrid)");
		}
		try{
			if(RM.formula.productReplace.productReplace._customCallBack) {
				eval(RM.formula.productReplace.productReplace._customCallBack);
				RM.formula.productReplace.productReplace._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.productReplace.productReplace._dialog.close();
		} catch(e){}
	};
	
	RM.formula.productReplace.productReplace.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(RM.formula.productReplace.productReplace._oGrid, RM.formula.productReplace.productReplace._currRow, RM.formula.productReplace.productReplace._key, RM.formula.productReplace.productReplace._displayFieldName, obj[i])
		}
		try{
			if(RM.formula.productReplace.productReplace._customCallBack) {
				eval(RM.formula.productReplace.productReplace._customCallBack);
				RM.formula.productReplace.productReplace._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.productReplace.productReplace._dialog.close();
		} catch(e){}
	};
	
	RM.formula.productReplace.productReplace.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			RM.formula.productReplace.productReplace.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#RM_formula_productReplace_productReplace_form'));
        			}
        	   	}
        	}
      	});
	};
	(function($){
		$(function(){
			//配方Id为选中的配方拼接id获得
$('#productReplace_formulaIds').val('${Parameters.formulaIds}');

//如果有查询的物料，把物料带到原物料里去
var serachProduct = '${Parameters.productId}';
if(serachProduct != "" && serachProduct != undefined){
	var productName = '${Parameters.productName}';
	$('input[name="productReplace.originProduct.productName"]').val(productName);
	$('input[name="productReplace.originProduct.productName"]').attr("value",productName);
	$('input[name="productReplace.originProduct.productName"]').attr("valuebak",productName);
	$('input[name="productReplace.originProduct.id"]').val(serachProduct);
	$('#productReplace_originProduct_productName_mneTipLabel').attr("style","display: none;");
}
		});
	})(jQuery);
	RM.formula.productReplace.productReplace.beforeSubmitMethodSettingInPage = function(){
		var originProduct=$('input[name="productReplace.originProduct.id"]').val();
var newProduct=$('input[name="productReplace.newProduct.id"]').val();
if(originProduct==''){
	RM_formula_productReplace_productReplace_formDialogErrorBarWidget.showMessage("原物料不能为空！");
    return false;
}
if(newProduct==''){
	RM_formula_productReplace_productReplace_formDialogErrorBarWidget.showMessage("新物料不能为空！");
    return false;
}
if($('input[name="productReplace.originProduct.id"]').val() == $('input[name="productReplace.newProduct.id"]').val()){
    //workbenchErrorBarWidget.showMessage("原物料与新物料不能一致,请修改后重新保存！","f");
	RM_formula_productReplace_productReplace_formDialogErrorBarWidget.showMessage("原物料与新物料不能一致,请修改后重新保存！");
    return false;
}
RM_formula_productReplace_productReplace_formDialogErrorBarWidget.showMessage("${getText('calendar.common.saveandclosesuccessful')}","s");
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	RM.formula.productReplace.productReplace.initCount = 0;
	RM.formula.productReplace.productReplace.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#RM_productReplace_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('RM_formula_productReplace_productReplace_datagrids');	
		var	conHeight = h-$("#RM_formula_productReplace_productReplace_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#RM_formula_productReplace_productReplace_main_div .edit-panes-s").each(function(index){
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
							if(RM.formula.productReplace.productReplace.initCount <= 2) {
								setTimeout(function(){RM.formula.productReplace.productReplace.initSize();}, 200);
								RM.formula.productReplace.productReplace.initCount++;
							}/* else {
								RM.formula.productReplace.productReplace.initCount = 0;
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
		RM.formula.productReplace.productReplace.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    RM.formula.productReplace.productReplace.initSize(index);
		});
		$(window).bind("dialog.resize",function(){RM.formula.productReplace.productReplace.initSize();});
	});
</script>
<script type="text/javascript">
	

	/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_productReplace,js,RM_7.5.0.0_formula_ProductReplace,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>