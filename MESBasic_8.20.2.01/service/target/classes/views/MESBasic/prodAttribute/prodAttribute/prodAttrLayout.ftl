<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1471570747293')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-REFERENCE-MESBasic_1_prodAttribute_prodAttrLayout,head,MESBasic_1_prodAttribute_ProdAttribute,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
</head>
<body id="dialog_page">
<@loadpanel></@loadpanel>
</#if>
<@errorbar id="workbenchErrorBar" offsetY=108 /><@loadpanel/>
<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
<#assign requestUri = requestUri?replace('/', '_', 'r')>
	<div id="layout1_ref">
				<div id="west1_ref" region="west" resize="true"  width="180"  style="overflow-y:auto;overflow-x:hidden;position:relative;">
				</div>
				<div id="center1_ref" region="center" resize="true"  expand="true" offsetH="4" >
				</div>
	</div>
<script type="text/javascript">
	 var MESBasic_prodAttribute_prodAttribute_prodAttrLayout_layout = {};
	 
	 MESBasic_prodAttribute_prodAttribute_prodAttrLayout_layout.refresh = function(node){
	 	MESBasic_prodAttribute_prodAttribute_prodAttrLayout_layout.node = node;
	 	node.modelName = "prodAttribute";
	 	MESBasic_prodAttribute_prodAttribute_prodAtrrRef_refresh(node);
	 }
	 
	 MESBasic_prodAttribute_prodAttribute_prodAttrLayout_layout.getNode = function(){
	 	var nodearray = MESBasic_prodAttribute_prodAttribute_prodAtrrTree_getNode();
	 	if(nodearray.length>0){
	 		nodearray[0].modelCode = "MESBasic_1_prodAttribute_ProdAttribute";
	 		return nodearray[0];
	 	}else{
	 		return null;
	 	}
	 }
	 
	 MESBasic_prodAttribute_prodAttribute_prodAttrLayout_layout.refreshTree = function(nodeId){
	 	MESBasic_prodAttribute_prodAttribute_prodAtrrTree_refresh(nodeId);
	 }
	 
	  MESBasic_prodAttribute_prodAttribute_prodAttrLayout_layout.refreshNodeId = function(node, operate){
	 	return MESBasic_prodAttribute_prodAttribute_prodAtrrTree_refreshNodeId(node, operate);
	 }
	 
	 MESBasic_prodAttribute_prodAttribute_prodAttrLayout_layout.getList = function(){
	 	MESBasic_prodAttribute_prodAttribute_prodAtrrRef_getList();
	 }
	 
	 new CUI.Layout("layout1_ref", {});
			var layoutParams = "";
			<#if Parameters??>
				<#assign keys = Parameters?keys>
				<#list keys as key>
				<#if key!='callBackFuncName' && key!='openType' && key!='__res_html' && key!='closePage'>
				<#if key=='condition'>
				layoutParams += "&condition="+encodeURIComponent('${Parameters[key]}');
				<#else>
				layoutParams += "&${key}=${Parameters[key]}";
				</#if>
				</#if>
				</#list>
			</#if>
			setTimeout(function(){
				$("#west1_ref").load("/MESBasic/prodAttribute/prodAttribute/prodAtrrTree.action?${getPowerCode('MESBasic_1_prodAttribute_prodAtrrTree_self')}&openType=${Parameters.openType!}&crossCompanyFlag=${Parameters.crossCompanyFlag!}"+layoutParams,null,null,false,'centerFrame');
			},100);
			setTimeout(function(){
				$("#center1_ref").load("/MESBasic/prodAttribute/prodAttribute/prodAtrrRef.action?${getPowerCode('MESBasic_1_prodAttribute_prodAtrrRef_self')}&openType=${Parameters.openType!}&crossCompanyFlag=${Parameters.crossCompanyFlag!}&refUrl=${requestUri!}&callBackFuncName=${callBackFuncName!}&permissionCode=MESBasic_1_prodAttribute_prodAttrLayout"+layoutParams,null,null,false,'centerFrame');
			},200);
		
	MESBasic_prodAttribute_prodAttribute_prodAtrrTree_getLayout = function(){
		return MESBasic_prodAttribute_prodAttribute_prodAttrLayout_layout;
	}
	
	MESBasic_prodAttribute_prodAttribute_prodAtrrRef_getLayout = function(){
		return MESBasic_prodAttribute_prodAttribute_prodAttrLayout_layout;
	}
	
	MESBasic_prodAttribute_prodAttribute_prodAtrrRef_cancelSelectedNode = function(){
		return MESBasic_prodAttribute_prodAttribute_prodAtrrTree_cancelSelectedNode();
	}
	
</script>
<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
</body>
</html>
</#if>