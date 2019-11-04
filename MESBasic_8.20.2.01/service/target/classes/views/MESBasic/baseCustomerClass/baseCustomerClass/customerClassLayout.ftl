<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1436775962757')}</title>
<@maincss/>
<@mainjs/>
</head>
<body id="dialog_page">
<@loadpanel></@loadpanel>
</#if>
<@errorbar id="workbenchErrorBar" offsetY=0 /><@loadpanel/>
	<div id="layout1">
		<div id="tree_buttonbar" style="position:absolute;bottom:0px;z-index:550;">
		</div>
				<div id="west1" region="west" resize="true"  width="200"  style="overflow-y:auto;overflow-x:hidden;position:relative;">
				</div>
				<div id="center1" region="center" resize="true"  expand="true" offsetH="4" >
				</div>
	</div>
<script type="text/javascript">
	 var MESBasic_baseCustomerClass_baseCustomerClass_customerClassLayout_layout = {};
	 
	 MESBasic_baseCustomerClass_baseCustomerClass_customerClassLayout_layout.refresh = function(node){
	 	MESBasic_baseCustomerClass_baseCustomerClass_customerClassLayout_layout.node = node;
	 	node.modelName = "baseCustomerClass";
	 	MESBasic_baseCustomerClass_baseCustomerClass_editPart_refresh(node);
	 }
	 
	 MESBasic_baseCustomerClass_baseCustomerClass_customerClassLayout_layout.getNode = function(){
	 	var nodearray = MESBasic_baseCustomerClass_baseCustomerClass_tree_getNode();
	 	if(nodearray.length>0){
	 		nodearray[0].modelCode = "MESBasic_1_baseCustomerClass_BaseCustomerClass";
	 		return nodearray[0];
	 	}else{
	 		return null;
	 	}
	 }
	 
	 MESBasic_baseCustomerClass_baseCustomerClass_customerClassLayout_layout.refreshTree = function(nodeId){
	 	MESBasic_baseCustomerClass_baseCustomerClass_tree_refresh(nodeId);
	 }
	 
	  MESBasic_baseCustomerClass_baseCustomerClass_customerClassLayout_layout.refreshNodeId = function(node, operate){
	 	return MESBasic_baseCustomerClass_baseCustomerClass_tree_refreshNodeId(node, operate);
	 }
	 
	 MESBasic_baseCustomerClass_baseCustomerClass_customerClassLayout_layout.getList = function(){
	 	MESBasic_baseCustomerClass_baseCustomerClass_editPart_getList();
	 }
	 
	 new CUI.Layout("layout1", {});
	 
		setTimeout(function(){
			$("#west1").load("/MESBasic/baseCustomerClass/baseCustomerClass/tree.action?layoutViewCode=MESBasic_1_baseCustomerClass_customerClassLayout&${getPowerCode('MESBasic_1_baseCustomerClass_tree_self')}",null,function(){
				$("#west1").height($("#west1").height() - $('#tree_buttonbar').height());
			},false,'centerFrame');
		},100);
		 setTimeout(function(){
			$("#center1").load("/MESBasic/baseCustomerClass/baseCustomerClass/editPart.action?${getPowerCode('MESBasic_1_baseCustomerClass_editPart_self')}&permissionCode=MESBasic_1_baseCustomerClass_customerClassLayout",null,null,false,'centerFrame');
		},200);
		
	MESBasic_baseCustomerClass_baseCustomerClass_tree_getLayout = function(){
		return MESBasic_baseCustomerClass_baseCustomerClass_customerClassLayout_layout;
	}
	
	MESBasic_baseCustomerClass_baseCustomerClass_editPart_getLayout = function(){
		return MESBasic_baseCustomerClass_baseCustomerClass_customerClassLayout_layout;
	}
	
	MESBasic_baseCustomerClass_baseCustomerClass_editPart_cancelSelectedNode = function(){
		return MESBasic_baseCustomerClass_baseCustomerClass_tree_cancelSelectedNode();
	}
	
</script>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>