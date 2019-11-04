<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1450081005848')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_prodList_prodListLayout,head,MESBasic_1_prodList_BaseProdList,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
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
	 var MESBasic_prodList_baseProdList_prodListLayout_layout = {};
	 
	 MESBasic_prodList_baseProdList_prodListLayout_layout.isRenderOver=false;
	 MESBasic_prodList_baseProdList_prodListLayout_layout.refresh = function(node){
	 	var timer=null;
		if(!this.isRenderOver){
		 	timer=setInterval(function(){
		    	if($("#center1 .datagrid").length>0){
				    MESBasic_prodList_baseProdList_prodListLayout_layout.node = node;
				 	node.modelName = "baseProdList";
				 	MESBasic_product_product_productPart_refresh(node);
				    clearInterval(timer);
	    		}   
	    	},100);
	    	setTimeout(function(){
		   		if(timer&&timer!=null){
		   	   		clearInterval(timer);
			    }
	    	},5000);
	    }else{
    		MESBasic_prodList_baseProdList_prodListLayout_layout.node = node;
			node.modelName = "baseProdList";
			MESBasic_product_product_productPart_refresh(node);
   		}
	 }
	 
	 MESBasic_prodList_baseProdList_prodListLayout_layout.getNode = function(){
	 	var nodearray = MESBasic_prodList_baseProdList_tree_getNode();
	 	if(nodearray.length>0){
	 		nodearray[0].modelCode = "MESBasic_1_prodList_BaseProdList";
	 		return nodearray[0];
	 	}else{
	 		return null;
	 	}
	 }
	 
	 MESBasic_prodList_baseProdList_prodListLayout_layout._refreshRootNode = function(){
	 	MESBasic_prodList_baseProdList_tree_refreshRootNode();
	 }
	 
	 MESBasic_prodList_baseProdList_prodListLayout_layout.refreshTree = function(nodeId){
	 	MESBasic_prodList_baseProdList_tree_refresh(nodeId);
	 }
	 
	  MESBasic_prodList_baseProdList_prodListLayout_layout.refreshNodeId = function(node, operate){
	 	return MESBasic_prodList_baseProdList_tree_refreshNodeId(node, operate);
	 }
	 
	 MESBasic_prodList_baseProdList_prodListLayout_layout.getList = function(){
	 	MESBasic_product_product_productPart_getList();
	 }
	 
	 new CUI.Layout("layout1", {});
	 
		setTimeout(function(){
			$("#west1").load("/MESBasic/prodList/baseProdList/tree.action?layoutViewCode=MESBasic_1_prodList_prodListLayout&${getPowerCode('MESBasic_1_prodList_tree_self')}",null,function(){
				$("#west1").height($("#west1").height() - $('#tree_buttonbar').height());
			},false,'centerFrame');
		},100);
		 setTimeout(function(){
			$("#center1").load("/MESBasic/product/product/productPart.action?${getPowerCode('MESBasic_1_product_productPart_self')}&permissionCode=MESBasic_1_prodList_prodListLayout",null,null,false,'centerFrame');
		},200);
		
	MESBasic_prodList_baseProdList_tree_getLayout = function(){
		return MESBasic_prodList_baseProdList_prodListLayout_layout;
	}
	
	MESBasic_product_product_productPart_getLayout = function(){
		return MESBasic_prodList_baseProdList_prodListLayout_layout;
	}
	
	MESBasic_product_product_productPart_cancelSelectedNode = function(){
		return MESBasic_prodList_baseProdList_tree_cancelSelectedNode();
	}
	
</script>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>