<!DOCTYPE html>
<html lang="zh-cn" xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title> </title>


<@head />

</head>
<body>
<style>
body{
	  	overflow-y:auto;
	  }
.expDiv{
	 	height:260px;
	 	width:365px;
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



</style>

<script type="text/javascript">
	
	$(window.parent.document.getElementById('importResponse')).show();
	$(window.parent.document.getElementById('ImportForm')).hide();
	$(window.parent.document.getElementById('tback')).show();
	$(window.parent.document.getElementById('import')).hide();
	

	window.parent.tback = function(){
		$(window.parent.document.getElementById('importResponse')).hide();
		$(window.parent.document.getElementById('ImportForm')).show();
		$(window.parent.document.getElementById('tback')).hide();
		$(window.parent.document.getElementById('import')).show();
		$(window.parent.document.getElementById('loading')).hide();
	}	
	
	function download(){
		var url = "/MESBasic/product/prodResetDaily/downLoad.action?datagridCode=${datagridCode}&orgName=" + encodeURIComponent('${orgName}') + "&time=${time}";
		window.open(url,"","");
	}
	<#if xlsResult?contains("success")>
		(function(){
			//var id = $(window.parent.document.getElementById('${datagridCode}'.substring('${datagridCode}'.indexOf('dg'), '${datagridCode}'.length) + '_id')).val();
			//var url = $(window.parent.document.getElementById('${datagridCode}'.substring('${datagridCode}'.indexOf('dg'), '${datagridCode}'.length) + '_url')).val();
			var id = $(window.parent.document.getElementById('${datagridName}' + '_id')).val();
			var url = $(window.parent.document.getElementById('${datagridName}' + '_url')).val();
			var datagrid = eval("window.parent." + id + "Widget");
			if(datagrid.isJS){
				datagrid._DT.bakData = null;
				datagrid._DT.setRequestDataUrl(url+"&rt=json");
			}else{
				datagrid.load(url);
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
	</#if>
	
</script>


<#if xlsResult?? && !xlsResult?contains("success") && !xlsResult?contains("exception")>
	<div style="width:365px;margin-left:10px;height:20px;padding-top:10px" align="left">
	<button type="button" onclick="download()" >${getHtmlText('ec.module.responseDownload.exceptionFile')}</button>
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
