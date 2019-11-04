<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1460961233475')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-REFERENCE-MESBasic_1_factoryModel_factoryRef2,head,MESBasic_1_factoryModel_ObjProduct,MESBasic_1) -->
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
	 var MESBasic_factoryModel_objProduct_factoryRef2_layout = {};
	 
	 MESBasic_factoryModel_objProduct_factoryRef2_layout.refresh = function(node){
	 	MESBasic_factoryModel_objProduct_factoryRef2_layout.node = node;
	 	node.modelName = "factoryModel";
	 	MESBasic_factoryModel_objProduct_factoryProdRefPart_refresh(node);
	 }
	 
	 MESBasic_factoryModel_objProduct_factoryRef2_layout.getNode = function(){
	 	var nodearray = MESBasic_factoryModel_factoryModel_factoryTreeRef_getNode();
	 	if(nodearray.length>0){
	 		nodearray[0].modelCode = "MESBasic_1_factoryModel_FactoryModel";
	 		return nodearray[0];
	 	}else{
	 		return null;
	 	}
	 }
	 
	 MESBasic_factoryModel_objProduct_factoryRef2_layout.refreshTree = function(nodeId){
	 	MESBasic_factoryModel_factoryModel_factoryTreeRef_refresh(nodeId);
	 }
	 
	  MESBasic_factoryModel_objProduct_factoryRef2_layout.refreshNodeId = function(node, operate){
	 	return MESBasic_factoryModel_factoryModel_factoryTreeRef_refreshNodeId(node, operate);
	 }
	 
	 MESBasic_factoryModel_objProduct_factoryRef2_layout.getList = function(){
	 	MESBasic_factoryModel_objProduct_factoryProdRefPart_getList();
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
				$("#west1_ref").load("/MESBasic/factoryModel/factoryModel/factoryTreeRef.action?${getPowerCode('MESBasic_1_factoryModel_factoryTreeRef_self')}&openType=${Parameters.openType!}&crossCompanyFlag=${Parameters.crossCompanyFlag!}"+layoutParams,null,null,false,'centerFrame');
			},100);
			setTimeout(function(){
				$("#center1_ref").load("/MESBasic/factoryModel/objProduct/factoryProdRefPart.action?${getPowerCode('MESBasic_1_factoryModel_factoryProdRefPart_self')}&openType=${Parameters.openType!}&crossCompanyFlag=${Parameters.crossCompanyFlag!}&refUrl=${requestUri!}&callBackFuncName=${callBackFuncName!}&permissionCode=MESBasic_1_factoryModel_factoryRef2"+layoutParams,null,null,false,'centerFrame');
			},200);
		
	MESBasic_factoryModel_factoryModel_factoryTreeRef_getLayout = function(){
		return MESBasic_factoryModel_objProduct_factoryRef2_layout;
	}
	
	MESBasic_factoryModel_objProduct_factoryProdRefPart_getLayout = function(){
		return MESBasic_factoryModel_objProduct_factoryRef2_layout;
	}
	
	MESBasic_factoryModel_objProduct_factoryProdRefPart_cancelSelectedNode = function(){
		return MESBasic_factoryModel_factoryModel_factoryTreeRef_cancelSelectedNode();
	}
	
</script>
<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
</body>
</html>
</#if>