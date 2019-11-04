<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1540342949836')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-REFERENCE-MESBasic_1_product_refProductLayout_sp,head,MESBasic_1_product_Product,MESBasic_1) -->
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
	 var MESBasic_product_product_refProductLayout_sp_layout = {};
	 
	 MESBasic_product_product_refProductLayout_sp_layout.refresh = function(node){
	 	MESBasic_product_product_refProductLayout_sp_layout.node = node;
	 	node.modelName = "baseProdList";
	 	MESBasic_product_product_refProduct_sp_refresh(node);
	 }
	 
	 MESBasic_product_product_refProductLayout_sp_layout.getNode = function(){
	 	var nodearray = MESBasic_prodList_baseProdList_refSparePartTree_getNode();
	 	if(nodearray.length>0){
	 		nodearray[0].modelCode = "MESBasic_1_prodList_BaseProdList";
	 		return nodearray[0];
	 	}else{
	 		return null;
	 	}
	 }
	 
	 MESBasic_product_product_refProductLayout_sp_layout.refreshTree = function(nodeId){
	 	MESBasic_prodList_baseProdList_refSparePartTree_refresh(nodeId);
	 }
	 
	  MESBasic_product_product_refProductLayout_sp_layout.refreshNodeId = function(node, operate){
	 	return MESBasic_prodList_baseProdList_refSparePartTree_refreshNodeId(node, operate);
	 }
	 
	 MESBasic_product_product_refProductLayout_sp_layout.getList = function(){
	 	MESBasic_product_product_refProduct_sp_getList();
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
				$("#west1_ref").load("/MESBasic/prodList/baseProdList/refSparePartTree.action?${getPowerCode('MESBasic_1_prodList_refSparePartTree_self')}&openType=${Parameters.openType!}&crossCompanyFlag=${Parameters.crossCompanyFlag!}"+layoutParams,null,null,false,'centerFrame');
			},100);
			setTimeout(function(){
				$("#center1_ref").load("/MESBasic/product/product/refProduct_sp.action?${getPowerCode('MESBasic_1_product_refProduct_sp_self')}&openType=${Parameters.openType!}&crossCompanyFlag=${Parameters.crossCompanyFlag!}&refUrl=${requestUri!}&callBackFuncName=${callBackFuncName!}&permissionCode=MESBasic_1_product_refProductLayout_sp"+layoutParams,null,null,false,'centerFrame');
			},200);
		
	MESBasic_prodList_baseProdList_refSparePartTree_getLayout = function(){
		return MESBasic_product_product_refProductLayout_sp_layout;
	}
	
	MESBasic_product_product_refProduct_sp_getLayout = function(){
		return MESBasic_product_product_refProductLayout_sp_layout;
	}
	
	MESBasic_product_product_refProduct_sp_cancelSelectedNode = function(){
		return MESBasic_prodList_baseProdList_refSparePartTree_cancelSelectedNode();
	}
	
</script>
<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
</body>
</html>
</#if>