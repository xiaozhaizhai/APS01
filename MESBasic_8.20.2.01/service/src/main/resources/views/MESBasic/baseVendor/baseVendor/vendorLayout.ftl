<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1449545572416')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_baseVendor_vendorLayout,head,MESBasic_1_baseVendor_BaseVendor,MESBasic_1) -->
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
	 var MESBasic_baseVendor_baseVendor_vendorLayout_layout = {};
	 
	 MESBasic_baseVendor_baseVendor_vendorLayout_layout.isRenderOver=false;
	 MESBasic_baseVendor_baseVendor_vendorLayout_layout.refresh = function(node){
	 	var timer=null;
		if(!this.isRenderOver){
		 	timer=setInterval(function(){
		    	if($("#center1 .datagrid").length>0){
				    MESBasic_baseVendor_baseVendor_vendorLayout_layout.node = node;
				 	node.modelName = "baseVendorClass";
				 	MESBasic_baseVendor_baseVendor_vendorPart_refresh(node);
				    clearInterval(timer);
	    		}   
	    	},100);
	    	setTimeout(function(){
		   		if(timer&&timer!=null){
		   	   		clearInterval(timer);
			    }
	    	},5000);
	    }else{
    		MESBasic_baseVendor_baseVendor_vendorLayout_layout.node = node;
			node.modelName = "baseVendorClass";
			MESBasic_baseVendor_baseVendor_vendorPart_refresh(node);
   		}
	 }
	 
	 MESBasic_baseVendor_baseVendor_vendorLayout_layout.getNode = function(){
	 	var nodearray = MESBasic_baseVenderClass_baseVendorClass_tree_getNode();
	 	if(nodearray.length>0){
	 		nodearray[0].modelCode = "MESBasic_1_baseVenderClass_BaseVendorClass";
	 		return nodearray[0];
	 	}else{
	 		return null;
	 	}
	 }
	 
	 MESBasic_baseVendor_baseVendor_vendorLayout_layout._refreshRootNode = function(){
	 	MESBasic_baseVenderClass_baseVendorClass_tree_refreshRootNode();
	 }
	 
	 MESBasic_baseVendor_baseVendor_vendorLayout_layout.refreshTree = function(nodeId){
	 	MESBasic_baseVenderClass_baseVendorClass_tree_refresh(nodeId);
	 }
	 
	  MESBasic_baseVendor_baseVendor_vendorLayout_layout.refreshNodeId = function(node, operate){
	 	return MESBasic_baseVenderClass_baseVendorClass_tree_refreshNodeId(node, operate);
	 }
	 
	 MESBasic_baseVendor_baseVendor_vendorLayout_layout.getList = function(){
	 	MESBasic_baseVendor_baseVendor_vendorPart_getList();
	 }
	 
	 new CUI.Layout("layout1", {});
	 
		setTimeout(function(){
			$("#west1").load("/MESBasic/baseVenderClass/baseVendorClass/tree.action?layoutViewCode=MESBasic_1_baseVendor_vendorLayout&${getPowerCode('MESBasic_1_baseVenderClass_tree_self')}",null,function(){
				$("#west1").height($("#west1").height() - $('#tree_buttonbar').height());
			},false,'centerFrame');
		},100);
		 setTimeout(function(){
			$("#center1").load("/MESBasic/baseVendor/baseVendor/vendorPart.action?${getPowerCode('MESBasic_1_baseVendor_vendorPart_self')}&permissionCode=MESBasic_1_baseVendor_vendorLayout",null,null,false,'centerFrame');
		},200);
		
	MESBasic_baseVenderClass_baseVendorClass_tree_getLayout = function(){
		return MESBasic_baseVendor_baseVendor_vendorLayout_layout;
	}
	
	MESBasic_baseVendor_baseVendor_vendorPart_getLayout = function(){
		return MESBasic_baseVendor_baseVendor_vendorLayout_layout;
	}
	
	MESBasic_baseVendor_baseVendor_vendorPart_cancelSelectedNode = function(){
		return MESBasic_baseVenderClass_baseVendorClass_tree_cancelSelectedNode();
	}
	
</script>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>