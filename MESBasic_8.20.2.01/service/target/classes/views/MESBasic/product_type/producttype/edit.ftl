<style type="text/css">.ewc-dialog-el{height:100%;}.edit-table{width:98%;margin:0 auto;}</style>
<script type="text/javascript">
	CUI.ns('MESBasic.product_type.producttype.edit');
</script>
<link href="/bap/struts/ec/style.css" rel="stylesheet" type="text/css" charset="utf-8"/>
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "MESBasic_product_type_producttype">
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
<@errorbar id="MESBasic_product_type_producttype_edit_formDialogErrorBar" />
<@s.form id="MESBasic_product_type_producttype_edit_form" cssStyle="height:100%;" hiddenField="" onsubmitMethod="MESBasic.product_type.producttype.edit.beforeSubmitMethod()" ecAction="/MESBasic/product_type/producttype/edit/submit.action?__pc__=${(Parameters.__pc__)!}" callback="MESBasic.product_type.producttype.callBackInfo" ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="edit">
	<input type="hidden" name="viewCode" value="MESBasic_1_product_type_edit">
	<input type="hidden" name="datagridKey" value="MESBasic_product_type_producttype_edit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="producttype.version" value="${(producttype.version)!0}" />
	<input type="hidden" name="producttype.extraCol" value='' />
	<div id="MESBasic_edit_edit_div" style="height:100%">
		<div id="MESBasic_product_type_producttype_edit_main_div" class="edit-content-dialog">
<script type="text/javascript">
var attcountid = "MESBasic_product_type_producttype_edit_form"+"_attcount";
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
					CUI('#'+attcountid).html('(' + fileCount + ')');
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=MESBasic_1_product_type', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>			<div class="edit-panes" style="margin-top:0px;padding:0px;">
				<div>
				<div class="edit-panes-w">
<div class="edit-panes-s" style="width:98%;margin-left:10px;">
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td></tr>
		<tr class="dialog_tr">
				
							 					<#if !MESBasic_1_product_type_Producttype_code_permit??>
					<#assign MESBasic_1_product_type_Producttype_code_permit = checkFieldPermission('producttype.code','MESBasic_1_product_type_Producttype','MESBasic_1_product_type_Producttype_code')>
					</#if>
					<td <#if MESBasic_1_product_type_Producttype_code_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if MESBasic_1_product_type_Producttype_code_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1419849767734')}" >${getText('MESBasic.propertydisplayName.radion1419849767734')}</label>
				</td>
				
						<#assign producttype_code_defaultValue  = ''>
							 							<#assign producttype_code_defaultValue  = ''>
					<#if !MESBasic_1_product_type_Producttype_code_permit??>
					<#assign MESBasic_1_product_type_Producttype_code_permit = checkFieldPermission('producttype.code','MESBasic_1_product_type_Producttype','MESBasic_1_product_type_Producttype_code')>
					</#if>
					<td <#if MESBasic_1_product_type_Producttype_code_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="3" style="text-align: left;;" >
							<#if MESBasic_1_product_type_Producttype_code_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if MESBasic_1_product_type_Producttype_code_permit == 1>-readonly</#if>">
								<input property_type="TEXT" name="producttype.code" id="producttype_code"  style=";" originalvalue="<#if !newObj || (producttype.code)?has_content>${(producttype.code?html)!}<#else>${producttype_code_defaultValue!}</#if>" value="<#if !newObj || (producttype.code)?has_content>${(producttype.code?html)!}<#else>${producttype_code_defaultValue!}</#if>" type="text" class="cui-noborder-input "<#if MESBasic_1_product_type_Producttype_code_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
							 					<#if !MESBasic_1_product_type_Producttype_protype_permit??>
					<#assign MESBasic_1_product_type_Producttype_protype_permit = checkFieldPermission('producttype.protype','MESBasic_1_product_type_Producttype','MESBasic_1_product_type_Producttype_protype')>
					</#if>
					<td <#if MESBasic_1_product_type_Producttype_protype_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if MESBasic_1_product_type_Producttype_protype_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1419849784820')}" >${getText('MESBasic.propertydisplayName.radion1419849784820')}</label>
				</td>
				
						<#assign producttype_protype_defaultValue  = ''>
							 							<#assign producttype_protype_defaultValue  = ''>
					<#if !MESBasic_1_product_type_Producttype_protype_permit??>
					<#assign MESBasic_1_product_type_Producttype_protype_permit = checkFieldPermission('producttype.protype','MESBasic_1_product_type_Producttype','MESBasic_1_product_type_Producttype_protype')>
					</#if>
					<td <#if MESBasic_1_product_type_Producttype_protype_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="3" style="text-align: left;;" >
							<#if MESBasic_1_product_type_Producttype_protype_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if MESBasic_1_product_type_Producttype_protype_permit == 1>-readonly</#if>">
								<input property_type="TEXT" name="producttype.protype" id="producttype_protype"  style=";" originalvalue="<#if !newObj || (producttype.protype)?has_content>${(producttype.protype?html)!}<#else>${producttype_protype_defaultValue!}</#if>" value="<#if !newObj || (producttype.protype)?has_content>${(producttype.protype?html)!}<#else>${producttype_protype_defaultValue!}</#if>" type="text" class="cui-noborder-input "<#if MESBasic_1_product_type_Producttype_protype_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
							 					<#if !MESBasic_1_product_type_Producttype_notes_permit??>
					<#assign MESBasic_1_product_type_Producttype_notes_permit = checkFieldPermission('producttype.notes','MESBasic_1_product_type_Producttype','MESBasic_1_product_type_Producttype_notes')>
					</#if>
					<td <#if MESBasic_1_product_type_Producttype_notes_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if MESBasic_1_product_type_Producttype_notes_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1419849814178')}" >${getText('MESBasic.propertydisplayName.radion1419849814178')}</label>
				</td>
				
						<#assign producttype_notes_defaultValue  = ''>
							 							<#assign producttype_notes_defaultValue  = ''>
					<#if !MESBasic_1_product_type_Producttype_notes_permit??>
					<#assign MESBasic_1_product_type_Producttype_notes_permit = checkFieldPermission('producttype.notes','MESBasic_1_product_type_Producttype','MESBasic_1_product_type_Producttype_notes')>
					</#if>
					<td <#if MESBasic_1_product_type_Producttype_notes_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="3" style="text-align: left;;" >
							<#if MESBasic_1_product_type_Producttype_notes_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if MESBasic_1_product_type_Producttype_notes_permit == 1>-readonly</#if>">
								<input property_type="TEXT" name="producttype.notes" id="producttype_notes"  style=";" originalvalue="<#if !newObj || (producttype.notes)?has_content>${(producttype.notes?html)!}<#else>${producttype_notes_defaultValue!}</#if>" value="<#if !newObj || (producttype.notes)?has_content>${(producttype.notes?html)!}<#else>${producttype_notes_defaultValue!}</#if>" type="text" class="cui-noborder-input "<#if MESBasic_1_product_type_Producttype_notes_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
		</tr>
	</table>
</div>				</div>	
				<div class="edit-datatable">	
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-EDIT-MESBasic_1_product_type_edit,html,MESBasic_1_product_type_Producttype,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	MESBasic.product_type.producttype.edit.beforeSaveProcess = function(){}
	MESBasic.product_type.producttype.edit.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(MESBasic.product_type.producttype.edit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#MESBasic_product_type_producttype_edit_form').trigger('beforeSubmit');
		//producttype.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="producttype.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("ul.edit-tabs").tabs("div.edit-panes > div");
		});
	})(jQuery);
	MESBasic.product_type.producttype.edit.validate = function(){
		return true;
	}
	
	
	//打印
	MESBasic.product_type.producttype.edit.print = function(url){
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
		
		MESBasic.product_type.producttype.edit.saveSetting = function(){
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
		
		MESBasic.product_type.producttype.edit.printSetting = function(){
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
			MESBasic.product_type.producttype.edit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(MESBasic.product_type.producttype.edit.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
				})
				MESBasic.product_type.producttype.edit.settingDialog.show();
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
			MESBasic.product_type.producttype.edit._customCallBack = customCallBack;
		}
		MESBasic.product_type.producttype.edit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	
	//参照复制函数
	MESBasic.product_type.producttype.edit.referenceCopy = function(objName,url, dialog){
		var callbackName ="MESBasic.product_type.producttype.edit.referenceCopyBackInfo";
		MESBasic.product_type.producttype.edit.dialog = dialog;
		MESBasic.product_type.producttype.edit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			url : url,
			title : "${getText('ec.view.property.refview')}",
			params : null
		});
	}
	
	MESBasic.product_type.producttype.edit.referenceCopyBackInfo = function(obj){
		if(MESBasic.product_type.producttype.edit._dialog){
			MESBasic.product_type.producttype.edit._dialog.close();
		}
		createLoadPanel(false,MESBasic.product_type.producttype.edit.dialog._el);
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('MESBasic_product_type_producttype_edit_form','MESBasic_product_type_producttype_edit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(MESBasic.product_type.producttype.edit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(MESBasic.product_type.producttype.edit.dialog._el).load('/MESBasic/product_type/producttype/edit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			$(MESBasic.product_type.producttype.edit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(MESBasic.product_type.producttype.edit.dialog._el).load('/MESBasic/product_type/producttype/edit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
					closeLoadPanel();
					try{
						StrutsUtilsOnLoad();
					}catch(e){}
					try{
						if(me._config.onload != undefined) eval(me._config.onload + "(me)");
					}catch(e){}
			});
		<#if viewType != "readonly">
		}
		</#if>
	};
	
	MESBasic.product_type.producttype.edit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		MESBasic.product_type.producttype.edit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		MESBasic.product_type.producttype.edit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			MESBasic.product_type.producttype.edit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	MESBasic.product_type.producttype.edit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var callbackName="";
		MESBasic.product_type.producttype.edit._prefix = '';
		MESBasic.product_type.producttype.edit._oGrid = oGrid;
		MESBasic.product_type.producttype.edit._sUrl = url;
		if(customCallBack){
			MESBasic.product_type.producttype.edit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			MESBasic.product_type.producttype.edit.gridEventObj = gridEventObj;
			callbackName = "MESBasic.product_type.producttype.edit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				MESBasic.product_type.producttype.edit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "MESBasic.product_type.producttype.edit.getMultiselectCallBackInfo_DG" : "MESBasic.product_type.producttype.edit.getcallBackInfo_DG";
			MESBasic.product_type.producttype.edit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				MESBasic.product_type.producttype.edit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="MESBasic.product_type.producttype.edit.getcallBackInfo";
		}
		if(MESBasic.product_type.producttype.edit._prefix!=''){
			MESBasic.product_type.producttype.edit._prefix = MESBasic.product_type.producttype.edit._prefix.substring(1);
		}
		if(MESBasic.product_type.producttype.edit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.product_type.producttype.edit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof MESBasic.product_type.producttype.edit._querycustomFuncN == "function") {
				refparam += MESBasic.product_type.producttype.edit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		MESBasic.product_type.producttype.edit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.product_type.producttype.edit._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.product_type.producttype.edit.query_"+obj+")!='undefined'") ? eval('MESBasic.product_type.producttype.edit.query_'+obj+'()') : null;
		return str;
	
	};
	
	MESBasic.product_type.producttype.edit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('MESBasic_product_type_producttype_edit_form',obj[0], MESBasic.product_type.producttype.edit._prefix, MESBasic.product_type.producttype.edit._sUrl);
		CUI.commonFills('MESBasic_product_type_producttype_edit_form',MESBasic.product_type.producttype.edit._prefix,obj[0]);

		try{
			if(MESBasic.product_type.producttype.edit._customCallBack) {
				eval(MESBasic.product_type.producttype.edit._customCallBack);
				MESBasic.product_type.producttype.edit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.product_type.producttype.edit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	MESBasic.product_type.producttype.edit.getcallBackInfo_DG_IE = function(obj){
		if(MESBasic.product_type.producttype.edit._customBeforeCallBack) {
			var flag = eval(MESBasic.product_type.producttype.edit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = MESBasic.product_type.producttype.edit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,MESBasic.product_type.producttype.edit._sUrl);
		var xmlHead = gridEventObj.oGrid._DT.opts.oXMLData.childNodes[0].childNodes[0];
		for( var i = 0; i < xmlHead.childNodes.length; i++ ){
			var tagName = xmlHead.childNodes[i].tagName;
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
			if(MESBasic.product_type.producttype.edit._customCallBack) {
				eval(MESBasic.product_type.producttype.edit._customCallBack);
				MESBasic.product_type.producttype.edit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.product_type.producttype.edit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	MESBasic.product_type.producttype.edit.getcallBackInfo_DG = function(obj){
		if(MESBasic.product_type.producttype.edit._customBeforeCallBack) {
			var flag = eval(MESBasic.product_type.producttype.edit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(MESBasic.product_type.producttype.edit._currRow).next().length==0){
					MESBasic.product_type.producttype.edit._oGrid.addNewRow();
				}	
				MESBasic.product_type.producttype.edit._currRow = $(MESBasic.product_type.producttype.edit._currRow).next();
				$(MESBasic.product_type.producttype.edit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(MESBasic.product_type.producttype.edit._currRow,obj[i],MESBasic.product_type.producttype.edit._prefix,MESBasic.product_type.producttype.edit._sUrl);
			eval("CUI.commonFills_DG(MESBasic.product_type.producttype.edit._currRow,MESBasic.product_type.producttype.edit._prefix,obj[i],MESBasic.product_type.producttype.edit._oGrid)");
		}
		try{
			if(MESBasic.product_type.producttype.edit._customCallBack) {
				eval(MESBasic.product_type.producttype.edit._customCallBack);
				MESBasic.product_type.producttype.edit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.product_type.producttype.edit._dialog.close();
		} catch(e){}
	};
	
	MESBasic.product_type.producttype.edit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(MESBasic.product_type.producttype.edit._oGrid, MESBasic.product_type.producttype.edit._currRow, MESBasic.product_type.producttype.edit._key, MESBasic.product_type.producttype.edit._displayFieldName, obj[i])
		}
		try{
			if(MESBasic.product_type.producttype.edit._customCallBack) {
				eval(MESBasic.product_type.producttype.edit._customCallBack);
				MESBasic.product_type.producttype.edit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.product_type.producttype.edit._dialog.close();
		} catch(e){}
	};
	
	MESBasic.product_type.producttype.edit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			MESBasic.product_type.producttype.edit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#MESBasic_product_type_producttype_edit_form'));
        			}
        	   	}
        	}
      	});
	};
	MESBasic.product_type.producttype.edit.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	MESBasic.product_type.producttype.edit.initCount = 0;
	MESBasic.product_type.producttype.edit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		var h = $('#MESBasic_edit_edit_div').parents('div.content').first().height();
		var datagrids = $('body').data('MESBasic_product_type_producttype_edit_datagrids');
		var	conHeight = h-$("#MESBasic_product_type_producttype_edit_main_div .edit-tabs").height() - 6;
		panesHeight = conHeight*0.4;
		$("#MESBasic_product_type_producttype_edit_main_div .edit-panes-s").each(function(index){
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
							if(MESBasic.product_type.producttype.edit.initCount <= 2) {
								setTimeout(function(){MESBasic.product_type.producttype.edit.initSize();}, 200);
								MESBasic.product_type.producttype.edit.initCount++;
							}/* else {
								MESBasic.product_type.producttype.edit.initCount = 0;
							}*/
						}
					}
				}
			} else {
				$(this).parent().height(conHeight-30);
				$(this).parent().css("overflow-y","auto");
			}
		});
	}

	$(function(){
		MESBasic.product_type.producttype.edit.initSize();
		$(window).bind("dialog.resize",function(){MESBasic.product_type.producttype.edit.initSize();});
	});
</script>
<script type="text/javascript">
	


	/* CUSTOM CODE START(view-EDIT-MESBasic_1_product_type_edit,js,MESBasic_1_product_type_Producttype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
</script>