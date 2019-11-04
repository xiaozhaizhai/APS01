<script type="text/javascript" src="/bap/static/foundation/js/jquery.progressbar.js"></script>
<script type="text/javascript" language="javascript" charset="utf-8">
CUI.ns("foundation.importExcel");
foundation.importExcel.progressImport=function() {
	CUI.post("/foundation/workbench/progress.action", null, foundation.importExcel.callbackFunImport, "POST");
}
foundation.importExcel.clearSessionImport=function() {
	CUI.post("/foundation/workbench/clear.action", null, null, "POST");
}
foundation.importExcel.callbackSuccessImport=function(data) {
	window.setTimeout(function(){CUI.Dialog.alert("${getHtmlText('import.success')}");},800);
}
foundation.importExcel.submitImportForm=function(isReplace,isIgnore){
	if(null === isReplace || undefined === isReplace){
		isReplace = false;
	}
	var file = CUI('#dataFile').val();
	if(file == null || file == undefined || file == '') {
		CUI.Dialog.alert("${getHtmlText('import.selectfile')}");
		return false;
	}
	var fileName = file.substring(file.lastIndexOf('\\')+1,file.length);
	CUI('#fileName').val(fileName);
	var buttonCode = "${request.getParameter('buttonCode')!''}";
	var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
	if(signatureInfo[0] != '') {
		signatureUtil.showSignatureDialog(signatureInfo[1],signatureInfo[0],buttonCode,"","ImportForm",false,'',isReplace,isIgnore);
	}
	else {
		CUI.Dialog.toggleAllButton();
		if((isReplace!=null&&isReplace)||(isIgnore!=null&&isIgnore)) {
			var obj=document.getElementById("importResponse").contentWindow;
			var lodingObj=obj.document.getElementById("loading2");  
			$(lodingObj).css("display","");
		}
		CUI('input[name="isReplace"]').val(isReplace);
		CUI('input[name="isIgnore"]').val(isIgnore);
		$('#loading').show();
		//window.setTimeout(function(){foundation.importExcel.progressImport();},800);
		//$("#uploadprogressbarImport").progressBar(0);
		CUI('#ImportForm').submit();
	}
}
foundation.importExcel.submitForm=function(isReplace,isIgnore){
	CUI.Dialog.toggleAllButton();
	if((isReplace!=null&&isReplace)||(isIgnore!=null&&isIgnore)) {
		var obj=document.getElementById("importResponse").contentWindow;
		var lodingObj=obj.document.getElementById("loading2");  
		$(lodingObj).css("display","");
	}
	CUI('input[name="isReplace"]').val(isReplace);
	CUI('input[name="isIgnore"]').val(isIgnore);
	$('#loading').show();
	//window.setTimeout(function(){foundation.importExcel.progressImport();},800);
	//$("#uploadprogressbarImport").progressBar(0);
	CUI('#ImportForm').submit();
}
foundation.importExcel.callbackFunImport=function(data) {
	if(data){
		var retData = CUI.parseJSON(data);
		if(retData) {
			$("#uploadprogressbarImport").progressBar(retData.percent);
			if(retData.status!='done'&&retData.status!='error') {
				//window.setTimeout(function(){foundation.importExcel.progressImport()},800);
				return false;
			} else {
				//foundation.importExcel.clearSessionImport();
				return false;
			}
		} else {
			//window.setTimeout(function(){foundation.importExcel.progressImport()},800);
		}
	} else {
		//window.setTimeout(function(){foundation.importExcel.progressImport()},800);
	}
}
foundation.importExcel.checkType=function(_selfObj) {
	var name = CUI(_selfObj).val();
	if(!name) {
		return false;
	}
	name = name.toLowerCase();
	var  fileType=name.substring(name.lastIndexOf(".")+1,name.length);
	var types = 'xls,xlsx,xml';
	var displayName = name.substring(name.lastIndexOf("\\")+1,name.length);
	if(types!=null&&types!='') {
		var typeArr = types.split(',');
		for(var i=0;i<typeArr.length;i++) {
			if(fileType == typeArr[i]) {
				CUI('input[name="fileType"]').val(fileType);
				$("#filename").text(displayName);
				$("#filename").attr("title", displayName);
				return true;
			}
		}
	} else {
		return true;
	}
	CUI.Dialog.alert("${getHtmlText('import.error.fileFormat')}");
	CUI(_selfObj).val('');
	return false;
}
</script>
<style>
<!--
#uploadprogressbar { display: none; }
-->
</style>
<script type="text/javascript">
	var importExcelDialogErrorBarWidget = null;
	YAHOO.util.Event.onDOMReady(function() {
		importExcelDialogErrorBarWidget = new CUI.ErrorBar('importExcelDialogErrorBar',{});
	});
	var errorShow = function(msg){
		if(CUI.Dialog) CUI.Dialog.toggleAllButton();
		importExcelDialogErrorBarWidget.show(msg);
	}
	var successShow = function(msg){
		window.setTimeout(function(){CUI.Dialog.alert("${getHtmlText('import.success')}");importDialog.close();if(this.closeLoadPanel){this.closeLoadPanel();}},800);
	}
</script>
<div id="importExcelDialogErrorBar"></div>
<form action="/X6Basic/teamManage/teamInfo/importMainXls.action?callBackFuncName=${callBackFuncName!}" target="importResponse" onsubmit="javascript:void(0);" id="ImportForm" enctype="multipart/form-data" method="post">
	<input type="hidden" name="viewCode" value="${viewCode!''}">
	<input type="hidden" name="fileType" >
	<input type="hidden" name="isReplace" value="${isReplace?string('true','false')}">
	<input type="hidden" name="isIgnore" value="${isIgnore?string('true','false')}">
	<table cellpadding="0" cellspacing="0" border="0" align="left" width="100%">
		<tr>
			<td style="text-align: left;padding-top:35px;width: 100%;">
				<span class="fileaddress">${getHtmlText('import.file.address')}</span>
				<div class="surfacefilediv">
					<div class="surfacefile">选择文件
						<input type="file" name="dataFile" size="40" id="dataFile" onchange="javascript:foundation.importExcel.checkType(this);" />
					</div>
					<span id="filename" class="surfaceNo">未选择任何文件</span>
				</div>	
			</td>
		</tr>
		<tr id="loading" style="display:none">
			<td style="text-align: center;padding-top:35px;width: 100%;">
				<label class="datagrid-loading">${getHtmlText('import.file.importing')}</label>
			</td>
		</tr>
	</table>
</form>
<iframe name="importResponse" id="importResponse" frameborder="0" style="display: none;height:300px;width:400px;" src=""></iframe>