<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1490322790398')}</title>
<@maincss/>
<@mainjs/>
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
	 var MESBasic_factoryModel_factoryModel_factoryChoiceRef_layout = {};
	 
	 MESBasic_factoryModel_factoryModel_factoryChoiceRef_layout.refresh = function(node){
	 	MESBasic_factoryModel_factoryModel_factoryChoiceRef_layout.node = node;
	 	node.modelName = "factoryModel";
	 	MESBasic_factoryModel_factoryModel_factoryMSelectRef_refresh(node);
	 }
	 
	 MESBasic_factoryModel_factoryModel_factoryChoiceRef_layout.getNode = function(){
	 	var nodearray = MESBasic_factoryModel_factoryModel_factoryChoiceTreeRef_getNode();
	 	if(nodearray.length>0){
	 		nodearray[0].modelCode = "MESBasic_1_factoryModel_FactoryModel";
	 		return nodearray[0];
	 	}else{
	 		return null;
	 	}
	 }
	 
	 MESBasic_factoryModel_factoryModel_factoryChoiceRef_layout.refreshTree = function(nodeId){
	 	MESBasic_factoryModel_factoryModel_factoryChoiceTreeRef_refresh(nodeId);
	 }
	 
	  MESBasic_factoryModel_factoryModel_factoryChoiceRef_layout.refreshNodeId = function(node, operate){
	 	return MESBasic_factoryModel_factoryModel_factoryChoiceTreeRef_refreshNodeId(node, operate);
	 }
	 
	 MESBasic_factoryModel_factoryModel_factoryChoiceRef_layout.getList = function(){
	 	MESBasic_factoryModel_factoryModel_factoryMSelectRef_getList();
	 }
	 
	 new CUI.Layout("layout1_ref", {});
			var layoutParams = "";
			<#if Parameters??>
				<#assign keys = Parameters?keys>
				<#list keys as key>
				<#if key!='callBackFuncName' && key!='openType' && key!='__res_html' && key!='closePage'>
			layoutParams += "&${key}=${Parameters[key]}";
				</#if>
				</#list>
			</#if>
			setTimeout(function(){
				$("#west1_ref").load("/MESBasic/factoryModel/factoryModel/factoryChoiceTreeRef.action?${getPowerCode('MESBasic_1_factoryModel_factoryChoiceTreeRef_self')}&openType=${Parameters.openType!}&crossCompanyFlag=${Parameters.crossCompanyFlag!}"+layoutParams,null,null,false,'centerFrame');
			},100);
			setTimeout(function(){
				$("#center1_ref").load("/MESBasic/factoryModel/factoryModel/factoryMSelectRef.action?${getPowerCode('MESBasic_1_factoryModel_factoryMSelectRef_self')}&openType=${Parameters.openType!}&crossCompanyFlag=${Parameters.crossCompanyFlag!}&refUrl=${requestUri!}&callBackFuncName=${callBackFuncName!}&permissionCode=MESBasic_1_factoryModel_factoryChoiceRef"+layoutParams,null,null,false,'centerFrame');
			},200);
		
	MESBasic_factoryModel_factoryModel_factoryChoiceTreeRef_getLayout = function(){
		return MESBasic_factoryModel_factoryModel_factoryChoiceRef_layout;
	}
	
	MESBasic_factoryModel_factoryModel_factoryMSelectRef_getLayout = function(){
		return MESBasic_factoryModel_factoryModel_factoryChoiceRef_layout;
	}
	
	MESBasic_factoryModel_factoryModel_factoryMSelectRef_cancelSelectedNode = function(){
		return MESBasic_factoryModel_factoryModel_factoryChoiceTreeRef_cancelSelectedNode();
	}
	
</script>
<#if (Parameters.openType)?? && (Parameters.openType) != 'dialog'>
</body>
</html>
</#if>