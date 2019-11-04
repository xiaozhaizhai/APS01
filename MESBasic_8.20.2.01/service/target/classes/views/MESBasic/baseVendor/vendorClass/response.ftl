<@head />
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
		var url = "/MESBasic/baseVendor/vendorClass/downLoad.action?datagridCode=${datagridCode}&orgName=" + encodeURIComponent('${orgName}') + "&time=${time}";
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
		})();
		
		$(window.parent.document.getElementById('ok')).show();
		$(window.parent.document.getElementById('tback')).hide();
		$(window.parent.document.getElementById('close')).hide();
	</#if>
	
</script>


<div align="left" style="height:260px;width:390px;border-style:solid;border-width:1pt;border-color:black;overflow-y:auto;word-wrap:break-word;">
	<#if xlsResult?contains("success") || xlsResult?contains("exception")>
	${xlsResult?split("|")[1]}
	<#else>
	${xlsResult}
	</#if>
</div>
	<#if xlsResult?? && !xlsResult?contains("success") && !xlsResult?contains("exception")>
	<div style="width:380px;" align="right">
	${getHtmlText('ec.module.click')}<span style="cursor:pointer;" onClick="download()"><b>${getHtmlText('ec.module.responseDownload')}</b></span>${getHtmlText('ec.module.exceptionFile')}！
	</div>
	</#if>
