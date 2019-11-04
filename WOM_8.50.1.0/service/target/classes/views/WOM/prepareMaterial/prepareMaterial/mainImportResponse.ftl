<!DOCTYPE html>
<html lang="zh-cn" xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title> </title>


<script type="text/javascript" src="${base}/bap/struts/core/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="${base}/bap/struts/css/main_base.css" />

</head>
<body>

<style type="text/css">
	  body{
	  	
	  }
	 .expDiv{
	 	height:230px;
	 	width:355px;
	 	display:table;
	 	_position:relative;
	 	border-style:solid;
	 	border-width:1pt;
	 	border-color:#d8d8d8;
	 	overflow-y:auto;
	 	word-wrap:break-word;
	 	margin:10px;
	 	padding-left:10px;
	 	padding-top:10px;
	 	word-break:break-word;
	 }
	 .successDiv{
	 	height:240px;
	 	width:365px;
	 	display:table;
	 	_position:relative;
	 	overflow-y:auto;
	 	word-wrap:break-word;
	 	margin:10px;
	 	padding-left:10px;
	 }
	 div#subwrap {
	  vertical-align:middle;
	  display:table-cell;
	  _position:absolute;
	  _top:50%;
	 }
	 div#content { 
	  _position:relative;
	  _top:-50%;
	  text-align:center;
	 }
	 .datagrid-loading {
		padding-right: 3px;
		padding-left: 20px;
		height:16px;
		line-height:16px;
		width:80px;
		text-align:left;
		margin:0 7px 0 7px;
		display: inline-block;
		background:url("/bap/struts/datatable/assets/loading.gif") no-repeat;
		zoom:1;
	}
</style>
<script type="text/javascript">
	
	$(window.parent.document.getElementById('importResponse')).show();
	$(window.parent.document.getElementById('ImportForm')).hide();
	$(window.parent.document.getElementById('tback')).show();
	$(window.parent.document.getElementById('import')).hide();
	$(window.parent.document.getElementById('replaceAndImport')).hide();
	$(window.parent.document.getElementById('ignoreAndImport')).hide();

	window.parent.tback = function(){
		$(window.parent.document.getElementById('importResponse')).hide();
		$(window.parent.document.getElementById('ImportForm')).show();
		$(window.parent.document.getElementById('tback')).hide();
		$(window.parent.document.getElementById('import')).show();
		$(window.parent.document.getElementById('loading')).hide();
		$(window.parent.document.getElementById('replaceAndImport')).hide();
		$(window.parent.document.getElementById('ignoreAndImport')).hide();
	}	
	
	function download(){
		//var url = "/WOM/prepareMaterial/prepareMaterial/downLoad.action?viewCode=WOM_7.5.0.0_prepareMaterial_prepareMaterialList&orgName=WOM_7.5.0.0_prepareMaterial_prepareMaterialList-import-error.xls&downloadType=mainError&time=${time}";
		var url = "/WOM/prepareMaterial/prepareMaterial/downLoad.action?viewCode=" 
			+ $('#viewCode').val()
			+ "&orgName="
			+ $('#viewCode').val()
			+ "-import-error.xls&downloadType=mainError&time=${time}";
		window.open(url,"","");
	}
	<#if xlsResult?contains("success")>
		(function(){
			//刷新列表
			var queryFunc = "${callBackFuncName}";
    		if(null != queryFunc && "" != queryFunc){
    			eval("parent." + queryFunc);
    		}
			
			// ie浏览器可能会闪白,导致PT样式会错乱
			$(window.parent.document.body).hide().show();
			$(window.parent).trigger('resize');
			setTimeout( function(){
				$(window.parent.document.body).hide().show();
				$(window.parent).trigger('resize');
			}, 500)
			setTimeout( function(){
				$(window.parent.document.body).hide().show();
				$(window.parent).trigger('resize');
			}, 1000)
			
		})();
		
		$(window.parent.document.getElementById('ok')).show();
		$(window.parent.document.getElementById('tback')).hide();
		$(window.parent.document.getElementById('close')).hide();
		$(window.parent.document.getElementById('replaceAndImport')).hide();
		$(window.parent.document.getElementById('ignoreAndImport')).hide();
	</#if>
	
	<#if isReplace?? && isReplace>
		parent.CUI.Dialog.toggleAllButton();
		$(window.parent.document.getElementById('replaceAndImport')).show();
		$(window.parent.document.getElementById('ignoreAndImport')).show();
	<#else>
		<#if !xlsResult?contains("success")>
			parent.CUI.Dialog.toggleAllButton();
		</#if>
		$(window.parent.document.getElementById('replaceAndImport')).hide();
		$(window.parent.document.getElementById('ignoreAndImport')).hide();
	</#if>
	
</script>
<#if xlsResult?? && !xlsResult?contains("success") && !xlsResult?contains("exception")>
	<div style="width:365px;margin-left:10px;height:20px;padding-top:10px" align="left">
	<#if viewCode??>
		<input id="viewCode" value="${viewCode}"  type="hidden" />
	</#if>
	<button type="button" onclick="download()" >${getHtmlText('ec.module.responseDownload.exceptionFile')}</button>
	<span id="loading2"  style="display:none">
		<#if isReplace?? && isReplace>
				<label class="datagrid-loading"></label>
		</#if>
	</span>
	</div>
</#if>
<div align="left" id="divFrame" class="<#if xlsResult?contains("success")>successDiv<#else>expDiv</#if>">
	<#if xlsResult?contains("success")>
		<div id="subwrap">
			<div id="content"> 
			${xlsResult?split("|")[1]}
  			</div>
 		</div>
 	<#elseif xlsResult?contains("exception")>
 		${xlsResult?split("|")[1]}
 	<#else>
 		${xlsResult}
	</#if>
</div>



</body>

</html>
