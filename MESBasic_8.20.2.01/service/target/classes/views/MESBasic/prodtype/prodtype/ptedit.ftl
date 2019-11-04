<style type="text/css">.ewc-dialog-el{height:100%;}.edit-table{width:98%;margin:0 auto;}</style>
<script type="text/javascript">
	CUI.ns('MESBasic.prodtype.prodtype.ptedit');
</script>
<link href="/bap/struts/ec/style.css" rel="stylesheet" type="text/css" charset="utf-8"/>
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "MESBasic_prodtype_prodtype">
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
<@errorbar id="MESBasic_prodtype_prodtype_ptedit_formDialogErrorBar" />
<@s.form id="MESBasic_prodtype_prodtype_ptedit_form" cssStyle="height:100%;" hiddenField="" onsubmitMethod="MESBasic.prodtype.prodtype.ptedit.beforeSubmitMethod()" ecAction="/MESBasic/prodtype/prodtype/ptedit/submit.action?__pc__=${(Parameters.__pc__)!}" callback="MESBasic.prodtype.prodtype.callBackInfo" ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="ptedit">
	<input type="hidden" name="viewCode" value="MESBasic_1_prodtype_ptedit">
	<input type="hidden" name="datagridKey" value="MESBasic_prodtype_prodtype_ptedit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="prodtype.version" value="${(prodtype.version)!0}" />
	<input type="hidden" name="prodtype.extraCol" value='' />
	<div id="MESBasic_ptedit_edit_div" style="height:100%">
		<div id="MESBasic_prodtype_prodtype_ptedit_main_div" class="edit-content-dialog">
<script type="text/javascript">
var attcountid = "MESBasic_prodtype_prodtype_ptedit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=MESBasic_1_prodtype', null, function(){
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
				
							 					<#if !MESBasic_1_prodtype_Prodtype_ptid_permit??>
					<#assign MESBasic_1_prodtype_Prodtype_ptid_permit = checkFieldPermission('prodtype.ptid','MESBasic_1_prodtype_Prodtype','MESBasic_1_prodtype_Prodtype_ptid')>
					</#if>
					<td <#if MESBasic_1_prodtype_Prodtype_ptid_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if MESBasic_1_prodtype_Prodtype_ptid_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1421288205380')}" >${getText('MESBasic.propertydisplayName.radion1421288205380')}</label>
				</td>
				
						<#assign prodtype_ptid_defaultValue  = ''>
							 							<#assign prodtype_ptid_defaultValue  = ''>
					<#if !MESBasic_1_prodtype_Prodtype_ptid_permit??>
					<#assign MESBasic_1_prodtype_Prodtype_ptid_permit = checkFieldPermission('prodtype.ptid','MESBasic_1_prodtype_Prodtype','MESBasic_1_prodtype_Prodtype_ptid')>
					</#if>
					<td <#if MESBasic_1_prodtype_Prodtype_ptid_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="3" style="text-align: left;;" >
							<#if MESBasic_1_prodtype_Prodtype_ptid_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if MESBasic_1_prodtype_Prodtype_ptid_permit == 1>-readonly</#if>">
								<input property_type="TEXT" name="prodtype.ptid" id="prodtype_ptid"  style=";" originalvalue="<#if !newObj || (prodtype.ptid)?has_content>${(prodtype.ptid?html)!}<#else>${prodtype_ptid_defaultValue!}</#if>" value="<#if !newObj || (prodtype.ptid)?has_content>${(prodtype.ptid?html)!}<#else>${prodtype_ptid_defaultValue!}</#if>" type="text" class="cui-noborder-input "<#if MESBasic_1_prodtype_Prodtype_ptid_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
							 					<#if !MESBasic_1_prodtype_Prodtype_ptname_permit??>
					<#assign MESBasic_1_prodtype_Prodtype_ptname_permit = checkFieldPermission('prodtype.ptname','MESBasic_1_prodtype_Prodtype','MESBasic_1_prodtype_Prodtype_ptname')>
					</#if>
					<td <#if MESBasic_1_prodtype_Prodtype_ptname_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if MESBasic_1_prodtype_Prodtype_ptname_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1421288241194')}" >${getText('MESBasic.propertydisplayName.radion1421288241194')}</label>
				</td>
				
						<#assign prodtype_ptname_defaultValue  = ''>
							 							<#assign prodtype_ptname_defaultValue  = ''>
					<#if !MESBasic_1_prodtype_Prodtype_ptname_permit??>
					<#assign MESBasic_1_prodtype_Prodtype_ptname_permit = checkFieldPermission('prodtype.ptname','MESBasic_1_prodtype_Prodtype','MESBasic_1_prodtype_Prodtype_ptname')>
					</#if>
					<td <#if MESBasic_1_prodtype_Prodtype_ptname_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="3" style="text-align: left;;" >
							<#if MESBasic_1_prodtype_Prodtype_ptname_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if MESBasic_1_prodtype_Prodtype_ptname_permit == 1>-readonly</#if>">
								<input property_type="TEXT" name="prodtype.ptname" id="prodtype_ptname"  style=";" originalvalue="<#if !newObj || (prodtype.ptname)?has_content>${(prodtype.ptname?html)!}<#else>${prodtype_ptname_defaultValue!}</#if>" value="<#if !newObj || (prodtype.ptname)?has_content>${(prodtype.ptname?html)!}<#else>${prodtype_ptname_defaultValue!}</#if>" type="text" class="cui-noborder-input "<#if MESBasic_1_prodtype_Prodtype_ptname_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
							 					<#if !MESBasic_1_prodtype_Prodtype_notes_permit??>
					<#assign MESBasic_1_prodtype_Prodtype_notes_permit = checkFieldPermission('prodtype.notes','MESBasic_1_prodtype_Prodtype','MESBasic_1_prodtype_Prodtype_notes')>
					</#if>
					<td <#if MESBasic_1_prodtype_Prodtype_notes_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if MESBasic_1_prodtype_Prodtype_notes_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1421288266808')}" >${getText('MESBasic.propertydisplayName.radion1421288266808')}</label>
				</td>
				
						<#assign prodtype_notes_defaultValue  = ''>
							 							<#assign prodtype_notes_defaultValue  = ''>
					<#if !MESBasic_1_prodtype_Prodtype_notes_permit??>
					<#assign MESBasic_1_prodtype_Prodtype_notes_permit = checkFieldPermission('prodtype.notes','MESBasic_1_prodtype_Prodtype','MESBasic_1_prodtype_Prodtype_notes')>
					</#if>
					<td <#if MESBasic_1_prodtype_Prodtype_notes_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="3" align="left" style="text-align: left;;" >
							<#if MESBasic_1_prodtype_Prodtype_notes_permit == 0>
							<div class="fix-input-readonly fix-ie7-textarea"><textarea property_type="TEXT" id="prodtype_notes" class="cui-noborder-textarea nopermit cui-textarea-auto" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"></textarea></div>
							<#else>
							<div class="fix-input<#if MESBasic_1_prodtype_Prodtype_notes_permit == 1>-readonly</#if> fix-ie7-textarea"><textarea property_type="TEXT" id="prodtype_notes" originalvalue="<#if !newObj || (prodtype.notes)?has_content>${(prodtype.notes?html)!}<#else>${prodtype_notes_defaultValue?html}</#if>"  name="prodtype.notes" class="cui-noborder-textarea cui-textarea-auto"<#if MESBasic_1_prodtype_Prodtype_notes_permit == 1> readonly=readonly</#if> style=";" ><#if !newObj || (prodtype.notes)?has_content>${(prodtype.notes)!}<#else>${prodtype_notes_defaultValue}</#if></textarea></div>
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
<!-- CUSTOM CODE START(view-EDIT-MESBasic_1_prodtype_ptedit,html,MESBasic_1_prodtype_Prodtype,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	MESBasic.prodtype.prodtype.ptedit.beforeSaveProcess = function(){}
	MESBasic.prodtype.prodtype.ptedit.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(MESBasic.prodtype.prodtype.ptedit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#MESBasic_prodtype_prodtype_ptedit_form').trigger('beforeSubmit');
		//prodtype.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="prodtype.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("ul.edit-tabs").tabs("div.edit-panes > div");
		});
	})(jQuery);
	MESBasic.prodtype.prodtype.ptedit.validate = function(){
		return true;
	}
	
	
	//打印
	MESBasic.prodtype.prodtype.ptedit.print = function(url){
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
		
		MESBasic.prodtype.prodtype.ptedit.saveSetting = function(){
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
		
		MESBasic.prodtype.prodtype.ptedit.printSetting = function(){
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
			MESBasic.prodtype.prodtype.ptedit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(MESBasic.prodtype.prodtype.ptedit.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
				})
				MESBasic.prodtype.prodtype.ptedit.settingDialog.show();
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
			MESBasic.prodtype.prodtype.ptedit._customCallBack = customCallBack;
		}
		MESBasic.prodtype.prodtype.ptedit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	
	//参照复制函数
	MESBasic.prodtype.prodtype.ptedit.referenceCopy = function(objName,url, dialog){
		var callbackName ="MESBasic.prodtype.prodtype.ptedit.referenceCopyBackInfo";
		MESBasic.prodtype.prodtype.ptedit.dialog = dialog;
		MESBasic.prodtype.prodtype.ptedit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			url : url,
			title : "${getText('ec.view.property.refview')}",
			params : null
		});
	}
	
	MESBasic.prodtype.prodtype.ptedit.referenceCopyBackInfo = function(obj){
		if(MESBasic.prodtype.prodtype.ptedit._dialog){
			MESBasic.prodtype.prodtype.ptedit._dialog.close();
		}
		createLoadPanel(false,MESBasic.prodtype.prodtype.ptedit.dialog._el);
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('MESBasic_prodtype_prodtype_ptedit_form','MESBasic_prodtype_prodtype_ptedit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(MESBasic.prodtype.prodtype.ptedit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(MESBasic.prodtype.prodtype.ptedit.dialog._el).load('/MESBasic/prodtype/prodtype/ptedit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			$(MESBasic.prodtype.prodtype.ptedit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(MESBasic.prodtype.prodtype.ptedit.dialog._el).load('/MESBasic/prodtype/prodtype/ptedit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	MESBasic.prodtype.prodtype.ptedit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		MESBasic.prodtype.prodtype.ptedit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		MESBasic.prodtype.prodtype.ptedit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			MESBasic.prodtype.prodtype.ptedit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	MESBasic.prodtype.prodtype.ptedit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var callbackName="";
		MESBasic.prodtype.prodtype.ptedit._prefix = '';
		MESBasic.prodtype.prodtype.ptedit._oGrid = oGrid;
		MESBasic.prodtype.prodtype.ptedit._sUrl = url;
		if(customCallBack){
			MESBasic.prodtype.prodtype.ptedit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			MESBasic.prodtype.prodtype.ptedit.gridEventObj = gridEventObj;
			callbackName = "MESBasic.prodtype.prodtype.ptedit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				MESBasic.prodtype.prodtype.ptedit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "MESBasic.prodtype.prodtype.ptedit.getMultiselectCallBackInfo_DG" : "MESBasic.prodtype.prodtype.ptedit.getcallBackInfo_DG";
			MESBasic.prodtype.prodtype.ptedit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				MESBasic.prodtype.prodtype.ptedit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="MESBasic.prodtype.prodtype.ptedit.getcallBackInfo";
		}
		if(MESBasic.prodtype.prodtype.ptedit._prefix!=''){
			MESBasic.prodtype.prodtype.ptedit._prefix = MESBasic.prodtype.prodtype.ptedit._prefix.substring(1);
		}
		if(MESBasic.prodtype.prodtype.ptedit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.prodtype.prodtype.ptedit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof MESBasic.prodtype.prodtype.ptedit._querycustomFuncN == "function") {
				refparam += MESBasic.prodtype.prodtype.ptedit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		MESBasic.prodtype.prodtype.ptedit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.prodtype.prodtype.ptedit._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.prodtype.prodtype.ptedit.query_"+obj+")!='undefined'") ? eval('MESBasic.prodtype.prodtype.ptedit.query_'+obj+'()') : null;
		return str;
	
	};
	
	MESBasic.prodtype.prodtype.ptedit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('MESBasic_prodtype_prodtype_ptedit_form',obj[0], MESBasic.prodtype.prodtype.ptedit._prefix, MESBasic.prodtype.prodtype.ptedit._sUrl);
		CUI.commonFills('MESBasic_prodtype_prodtype_ptedit_form',MESBasic.prodtype.prodtype.ptedit._prefix,obj[0]);

		try{
			if(MESBasic.prodtype.prodtype.ptedit._customCallBack) {
				eval(MESBasic.prodtype.prodtype.ptedit._customCallBack);
				MESBasic.prodtype.prodtype.ptedit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.prodtype.prodtype.ptedit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	MESBasic.prodtype.prodtype.ptedit.getcallBackInfo_DG_IE = function(obj){
		if(MESBasic.prodtype.prodtype.ptedit._customBeforeCallBack) {
			var flag = eval(MESBasic.prodtype.prodtype.ptedit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = MESBasic.prodtype.prodtype.ptedit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,MESBasic.prodtype.prodtype.ptedit._sUrl);
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
			if(MESBasic.prodtype.prodtype.ptedit._customCallBack) {
				eval(MESBasic.prodtype.prodtype.ptedit._customCallBack);
				MESBasic.prodtype.prodtype.ptedit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.prodtype.prodtype.ptedit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	MESBasic.prodtype.prodtype.ptedit.getcallBackInfo_DG = function(obj){
		if(MESBasic.prodtype.prodtype.ptedit._customBeforeCallBack) {
			var flag = eval(MESBasic.prodtype.prodtype.ptedit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(MESBasic.prodtype.prodtype.ptedit._currRow).next().length==0){
					MESBasic.prodtype.prodtype.ptedit._oGrid.addNewRow();
				}	
				MESBasic.prodtype.prodtype.ptedit._currRow = $(MESBasic.prodtype.prodtype.ptedit._currRow).next();
				$(MESBasic.prodtype.prodtype.ptedit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(MESBasic.prodtype.prodtype.ptedit._currRow,obj[i],MESBasic.prodtype.prodtype.ptedit._prefix,MESBasic.prodtype.prodtype.ptedit._sUrl);
			eval("CUI.commonFills_DG(MESBasic.prodtype.prodtype.ptedit._currRow,MESBasic.prodtype.prodtype.ptedit._prefix,obj[i],MESBasic.prodtype.prodtype.ptedit._oGrid)");
		}
		try{
			if(MESBasic.prodtype.prodtype.ptedit._customCallBack) {
				eval(MESBasic.prodtype.prodtype.ptedit._customCallBack);
				MESBasic.prodtype.prodtype.ptedit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.prodtype.prodtype.ptedit._dialog.close();
		} catch(e){}
	};
	
	MESBasic.prodtype.prodtype.ptedit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(MESBasic.prodtype.prodtype.ptedit._oGrid, MESBasic.prodtype.prodtype.ptedit._currRow, MESBasic.prodtype.prodtype.ptedit._key, MESBasic.prodtype.prodtype.ptedit._displayFieldName, obj[i])
		}
		try{
			if(MESBasic.prodtype.prodtype.ptedit._customCallBack) {
				eval(MESBasic.prodtype.prodtype.ptedit._customCallBack);
				MESBasic.prodtype.prodtype.ptedit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.prodtype.prodtype.ptedit._dialog.close();
		} catch(e){}
	};
	
	MESBasic.prodtype.prodtype.ptedit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			MESBasic.prodtype.prodtype.ptedit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#MESBasic_prodtype_prodtype_ptedit_form'));
        			}
        	   	}
        	}
      	});
	};
	MESBasic.prodtype.prodtype.ptedit.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	MESBasic.prodtype.prodtype.ptedit.initCount = 0;
	MESBasic.prodtype.prodtype.ptedit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		var h = $('#MESBasic_ptedit_edit_div').parents('div.content').first().height();
		var datagrids = $('body').data('MESBasic_prodtype_prodtype_ptedit_datagrids');
		var	conHeight = h-$("#MESBasic_prodtype_prodtype_ptedit_main_div .edit-tabs").height() - 6;
		panesHeight = conHeight*0.4;
		$("#MESBasic_prodtype_prodtype_ptedit_main_div .edit-panes-s").each(function(index){
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
							if(MESBasic.prodtype.prodtype.ptedit.initCount <= 2) {
								setTimeout(function(){MESBasic.prodtype.prodtype.ptedit.initSize();}, 200);
								MESBasic.prodtype.prodtype.ptedit.initCount++;
							}/* else {
								MESBasic.prodtype.prodtype.ptedit.initCount = 0;
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
		MESBasic.prodtype.prodtype.ptedit.initSize();
		$(window).bind("dialog.resize",function(){MESBasic.prodtype.prodtype.ptedit.initSize();});
	});
</script>
<script type="text/javascript">
	


	/* CUSTOM CODE START(view-EDIT-MESBasic_1_prodtype_ptedit,js,MESBasic_1_prodtype_Prodtype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
</script>