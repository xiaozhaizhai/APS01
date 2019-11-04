<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1497578541345')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-RM_7.5.0.0_formulaType_typeLayOut,head,RM_7.5.0.0_formulaType_FormulaType,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
</head>
<body id="dialog_page">
<@loadpanel></@loadpanel>
</#if>
<@errorbar id="workbenchErrorBar" offsetY=0 /><@loadpanel/>
	<div id="layout1">
		<div id="typeTree_buttonbar" style="position:absolute;bottom:0px;z-index:550;">
		</div>
				<div id="west1" region="west" resize="true"  width="200"  style="overflow-y:auto;overflow-x:hidden;position:relative;">
				</div>
				<div id="center1" region="center" resize="true"  expand="true" offsetH="4" >
				</div>
	</div>
<script type="text/javascript">
	 var RM_formulaType_formulaType_typeLayOut_layout = {};
	 
	 RM_formulaType_formulaType_typeLayOut_layout.isRenderOver=false;
	 RM_formulaType_formulaType_typeLayOut_layout.refresh = function(node){
	 	var timer=null;
		if(!this.isRenderOver){
		 	timer=setInterval(function(){
		    	if($("#center1 .datagrid").length>0){
				    RM_formulaType_formulaType_typeLayOut_layout.node = node;
				 	node.modelName = "formulaType";
				 	RM_formulaType_formulaType_typePart_refresh(node);
				    clearInterval(timer);
	    		}   
	    	},100);
	    	setTimeout(function(){
		   		if(timer&&timer!=null){
		   	   		clearInterval(timer);
			    }
	    	},5000);
	    }else{
    		RM_formulaType_formulaType_typeLayOut_layout.node = node;
			node.modelName = "formulaType";
			RM_formulaType_formulaType_typePart_refresh(node);
   		}
	 }
	 
	 RM_formulaType_formulaType_typeLayOut_layout.getNode = function(){
	 	var nodearray = RM_formulaType_formulaType_typeTree_getNode();
	 	if(nodearray.length>0){
	 		nodearray[0].modelCode = "RM_7.5.0.0_formulaType_FormulaType";
	 		return nodearray[0];
	 	}else{
	 		return null;
	 	}
	 }
	 
	 RM_formulaType_formulaType_typeLayOut_layout._refreshRootNode = function(){
	 	RM_formulaType_formulaType_typeTree_refreshRootNode();
	 }
	 
	 RM_formulaType_formulaType_typeLayOut_layout.refreshTree = function(nodeId){
	 	RM_formulaType_formulaType_typeTree_refresh(nodeId);
	 }
	 
	  RM_formulaType_formulaType_typeLayOut_layout.refreshNodeId = function(node, operate){
	 	return RM_formulaType_formulaType_typeTree_refreshNodeId(node, operate);
	 }
	 
	 RM_formulaType_formulaType_typeLayOut_layout.getList = function(){
	 	RM_formulaType_formulaType_typePart_getList();
	 }
	 
	 new CUI.Layout("layout1", {});
	 
		setTimeout(function(){
			$("#west1").load("/RM/formulaType/formulaType/typeTree.action?layoutViewCode=RM_7.5.0.0_formulaType_typeLayOut&${getPowerCode('RM_7.5.0.0_formulaType_typeTree_self')}",null,function(){
				$("#west1").height($("#west1").height() - $('#typeTree_buttonbar').height());
			},false,'centerFrame');
		},100);
		 setTimeout(function(){
			$("#center1").load("/RM/formulaType/formulaType/typePart.action?${getPowerCode('RM_7.5.0.0_formulaType_typePart_self')}&permissionCode=RM_7.5.0.0_formulaType_typeLayOut",null,null,false,'centerFrame');
		},200);
		
	RM_formulaType_formulaType_typeTree_getLayout = function(){
		return RM_formulaType_formulaType_typeLayOut_layout;
	}
	
	RM_formulaType_formulaType_typePart_getLayout = function(){
		return RM_formulaType_formulaType_typeLayOut_layout;
	}
	
	RM_formulaType_formulaType_typePart_cancelSelectedNode = function(){
		return RM_formulaType_formulaType_typeTree_cancelSelectedNode();
	}
	
</script>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>