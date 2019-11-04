<script type="text/javascript" src="${base}/bap/struts/core/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="${base}/bap/struts/css/main_base.css" />
<style type="text/css">
	  body{
	  	overflow-y:auto;
	  }
	 .expDiv{
	 	height:230px;
	 	width:365px;
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
		var url = "/MESBasic/testMapping/testMappingSet/downLoad.action?viewCode=MESBasic_1_testMapping_list&orgName=MESBasic_1_testMapping_list-import-error.xls&downloadType=mainError&time=${time}";
		window.open(url,"","");
	}
	<#if xlsResult?contains("success")>
		(function(){
			//刷新列表
			var queryFunc = "${callBackFuncName}";
    		if(null != queryFunc && "" != queryFunc){
    			eval("parent." + queryFunc);
    		}
		})();
		
		$(window.parent.document.getElementById('ok')).show();
		$(window.parent.document.getElementById('tback')).hide();
		$(window.parent.document.getElementById('close')).hide();
		$(window.parent.document.getElementById('replaceAndImport')).hide();
		$(window.parent.document.getElementById('ignoreAndImport')).hide();
	</#if>
	
	<#if isReplace?? && isReplace>
		$(window.parent.document.getElementById('replaceAndImport')).show();
		$(window.parent.document.getElementById('ignoreAndImport')).show();
	<#else>
		$(window.parent.document.getElementById('replaceAndImport')).hide();
		$(window.parent.document.getElementById('ignoreAndImport')).hide();
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
