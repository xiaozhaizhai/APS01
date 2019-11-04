<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1497851445735')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_formulaType_typeRef,head,RM_7.5.0.0_formulaType_FormulaType,RM_7.5.0.0) -->
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
	 var RM_formulaType_formulaType_typeRef_layout = {};
	 
	 RM_formulaType_formulaType_typeRef_layout.refresh = function(node){
	 	RM_formulaType_formulaType_typeRef_layout.node = node;
	 	node.modelName = "formulaType";
	 	RM_formulaType_formulaType_typePartRef_refresh(node);
	 }
	 
	 RM_formulaType_formulaType_typeRef_layout.getNode = function(){
	 	var nodearray = RM_formulaType_formulaType_typeTreeRef_getNode();
	 	if(nodearray.length>0){
	 		nodearray[0].modelCode = "RM_7.5.0.0_formulaType_FormulaType";
	 		return nodearray[0];
	 	}else{
	 		return null;
	 	}
	 }
	 
	 RM_formulaType_formulaType_typeRef_layout.refreshTree = function(nodeId){
	 	RM_formulaType_formulaType_typeTreeRef_refresh(nodeId);
	 }
	 
	  RM_formulaType_formulaType_typeRef_layout.refreshNodeId = function(node, operate){
	 	return RM_formulaType_formulaType_typeTreeRef_refreshNodeId(node, operate);
	 }
	 
	 RM_formulaType_formulaType_typeRef_layout.getList = function(){
	 	RM_formulaType_formulaType_typePartRef_getList();
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
				$("#west1_ref").load("/RM/formulaType/formulaType/typeTreeRef.action?${getPowerCode('RM_7.5.0.0_formulaType_typeTreeRef_self')}&openType=${Parameters.openType!}&crossCompanyFlag=${Parameters.crossCompanyFlag!}"+layoutParams,null,null,false,'centerFrame');
			},100);
			setTimeout(function(){
				$("#center1_ref").load("/RM/formulaType/formulaType/typePartRef.action?${getPowerCode('RM_7.5.0.0_formulaType_typePartRef_self')}&openType=${Parameters.openType!}&crossCompanyFlag=${Parameters.crossCompanyFlag!}&refUrl=${requestUri!}&callBackFuncName=${callBackFuncName!}&permissionCode=RM_7.5.0.0_formulaType_typeRef"+layoutParams,null,null,false,'centerFrame');
			},200);
		
	RM_formulaType_formulaType_typeTreeRef_getLayout = function(){
		return RM_formulaType_formulaType_typeRef_layout;
	}
	
	RM_formulaType_formulaType_typePartRef_getLayout = function(){
		return RM_formulaType_formulaType_typeRef_layout;
	}
	
	RM_formulaType_formulaType_typePartRef_cancelSelectedNode = function(){
		return RM_formulaType_formulaType_typeTreeRef_cancelSelectedNode();
	}
	
</script>
<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
</body>
</html>
</#if>