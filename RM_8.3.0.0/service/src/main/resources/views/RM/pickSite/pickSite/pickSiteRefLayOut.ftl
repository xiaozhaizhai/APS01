<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1503470970689')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_pickSite_pickSiteRefLayOut,head,RM_7.5.0.0_pickSite_PickSite,RM_7.5.0.0) -->
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
				<div id="west1_ref" region="west" resize="true"  width="200"  style="overflow-y:auto;overflow-x:hidden;position:relative;">
				</div>
				<div id="center1_ref" region="center" resize="true"  expand="true" offsetH="4" >
				</div>
	</div>
<script type="text/javascript">
	 var RM_pickSite_pickSite_pickSiteRefLayOut_layout = {};
	 
	 RM_pickSite_pickSite_pickSiteRefLayOut_layout.refresh = function(node){
	 	RM_pickSite_pickSite_pickSiteRefLayOut_layout.node = node;
	 	node.modelName = "pickSite";
	 	RM_pickSite_pickSite_pickSiteRef_refresh(node);
	 }
	 
	 RM_pickSite_pickSite_pickSiteRefLayOut_layout.getNode = function(){
	 	var nodearray = RM_pickSite_pickSite_pickSiteTreeRef_getNode();
	 	if(nodearray.length>0){
	 		nodearray[0].modelCode = "RM_7.5.0.0_pickSite_PickSite";
	 		return nodearray[0];
	 	}else{
	 		return null;
	 	}
	 }
	 
	 RM_pickSite_pickSite_pickSiteRefLayOut_layout.refreshTree = function(nodeId){
	 	RM_pickSite_pickSite_pickSiteTreeRef_refresh(nodeId);
	 }
	 
	  RM_pickSite_pickSite_pickSiteRefLayOut_layout.refreshNodeId = function(node, operate){
	 	return RM_pickSite_pickSite_pickSiteTreeRef_refreshNodeId(node, operate);
	 }
	 
	 RM_pickSite_pickSite_pickSiteRefLayOut_layout.getList = function(){
	 	RM_pickSite_pickSite_pickSiteRef_getList();
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
				$("#west1_ref").load("/RM/pickSite/pickSite/pickSiteTreeRef.action?${getPowerCode('RM_7.5.0.0_pickSite_pickSiteTreeRef_self')}&openType=${Parameters.openType!}&crossCompanyFlag=${Parameters.crossCompanyFlag!}"+layoutParams,null,null,false,'centerFrame');
			},100);
			setTimeout(function(){
				$("#center1_ref").load("/RM/pickSite/pickSite/pickSiteRef.action?${getPowerCode('RM_7.5.0.0_pickSite_pickSiteRef_self')}&openType=${Parameters.openType!}&crossCompanyFlag=${Parameters.crossCompanyFlag!}&refUrl=${requestUri!}&callBackFuncName=${callBackFuncName!}&permissionCode=RM_7.5.0.0_pickSite_pickSiteRefLayOut"+layoutParams,null,null,false,'centerFrame');
			},200);
		
	RM_pickSite_pickSite_pickSiteTreeRef_getLayout = function(){
		return RM_pickSite_pickSite_pickSiteRefLayOut_layout;
	}
	
	RM_pickSite_pickSite_pickSiteRef_getLayout = function(){
		return RM_pickSite_pickSite_pickSiteRefLayOut_layout;
	}
	
	RM_pickSite_pickSite_pickSiteRef_cancelSelectedNode = function(){
		return RM_pickSite_pickSite_pickSiteTreeRef_cancelSelectedNode();
	}
	
</script>
<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
</body>
</html>
</#if>