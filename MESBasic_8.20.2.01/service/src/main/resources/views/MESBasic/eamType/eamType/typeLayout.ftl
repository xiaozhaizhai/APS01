<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1516069532762')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_eamType_typeLayout,head,MESBasic_1_eamType_EamType,MESBasic_1) -->
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
	 var MESBasic_eamType_eamType_typeLayout_layout = {};
	 
	 MESBasic_eamType_eamType_typeLayout_layout.isRenderOver=false;
	 MESBasic_eamType_eamType_typeLayout_layout.refresh = function(node){
	 	var timer=null;
		if(!this.isRenderOver){
		 	timer=setInterval(function(){
		    	if($("#center1 .datagrid").length>0){
				    MESBasic_eamType_eamType_typeLayout_layout.node = node;
				 	node.modelName = "eamType";
				 	MESBasic_eamType_eamType_typePart_refresh(node);
				    clearInterval(timer);
	    		}   
	    	},100);
	    	setTimeout(function(){
		   		if(timer&&timer!=null){
		   	   		clearInterval(timer);
			    }
	    	},5000);
	    }else{
    		MESBasic_eamType_eamType_typeLayout_layout.node = node;
			node.modelName = "eamType";
			MESBasic_eamType_eamType_typePart_refresh(node);
   		}
	 }
	 
	 MESBasic_eamType_eamType_typeLayout_layout.getNode = function(){
	 	var nodearray = MESBasic_eamType_eamType_typeTree_getNode();
	 	if(nodearray.length>0){
	 		nodearray[0].modelCode = "MESBasic_1_eamType_EamType";
	 		return nodearray[0];
	 	}else{
	 		return null;
	 	}
	 }
	 
	 MESBasic_eamType_eamType_typeLayout_layout._refreshRootNode = function(){
	 	MESBasic_eamType_eamType_typeTree_refreshRootNode();
	 }
	 
	 MESBasic_eamType_eamType_typeLayout_layout.refreshTree = function(nodeId){
	 	MESBasic_eamType_eamType_typeTree_refresh(nodeId);
	 }
	 
	  MESBasic_eamType_eamType_typeLayout_layout.refreshNodeId = function(node, operate){
	 	return MESBasic_eamType_eamType_typeTree_refreshNodeId(node, operate);
	 }
	 
	 MESBasic_eamType_eamType_typeLayout_layout.getList = function(){
	 	MESBasic_eamType_eamType_typePart_getList();
	 }
	 
	 new CUI.Layout("layout1", {});
	 
		setTimeout(function(){
			$("#west1").load("/MESBasic/eamType/eamType/typeTree.action?layoutViewCode=MESBasic_1_eamType_typeLayout&${getPowerCode('MESBasic_1_eamType_typeTree_self')}",null,function(){
				$("#west1").height($("#west1").height() - $('#typeTree_buttonbar').height());
			},false,'centerFrame');
		},100);
		 setTimeout(function(){
			$("#center1").load("/MESBasic/eamType/eamType/typePart.action?${getPowerCode('MESBasic_1_eamType_typePart_self')}&permissionCode=MESBasic_1_eamType_typeLayout",null,null,false,'centerFrame');
		},200);
		
	MESBasic_eamType_eamType_typeTree_getLayout = function(){
		return MESBasic_eamType_eamType_typeLayout_layout;
	}
	
	MESBasic_eamType_eamType_typePart_getLayout = function(){
		return MESBasic_eamType_eamType_typeLayout_layout;
	}
	
	MESBasic_eamType_eamType_typePart_cancelSelectedNode = function(){
		return MESBasic_eamType_eamType_typeTree_cancelSelectedNode();
	}
	
</script>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>