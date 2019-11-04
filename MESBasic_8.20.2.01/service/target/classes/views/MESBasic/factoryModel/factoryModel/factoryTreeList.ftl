<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1422753173941')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_factoryModel_factoryTreeList,head,MESBasic_1_factoryModel_FactoryModel,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
</head>
<body id="dialog_page">
<@loadpanel></@loadpanel>
</#if>
<@errorbar id="workbenchErrorBar" offsetY=0 /><@loadpanel/>
	<div id="layout1">
		<div id="factoryTreePart_buttonbar" style="position:absolute;bottom:0px;z-index:550;">
		</div>
				<div id="west1" region="west" resize="true"  width="200"  style="overflow-y:auto;overflow-x:hidden;position:relative;">
				</div>
				<div id="center1" region="center" resize="true"  expand="true" offsetH="4" >
				</div>
	</div>
<script type="text/javascript">
	 var MESBasic_factoryModel_factoryModel_factoryTreeList_layout = {};
	 
	 MESBasic_factoryModel_factoryModel_factoryTreeList_layout.isRenderOver=false;
	 MESBasic_factoryModel_factoryModel_factoryTreeList_layout.refresh = function(node){
	 	var timer=null;
		if(!this.isRenderOver){
		 	timer=setInterval(function(){
		    	if($("#center1 .datagrid").length>0){
				    MESBasic_factoryModel_factoryModel_factoryTreeList_layout.node = node;
				 	node.modelName = "factoryModel";
				 	MESBasic_factoryModel_factoryModel_factoryListPart_refresh(node);
				    clearInterval(timer);
	    		}   
	    	},100);
	    	setTimeout(function(){
		   		if(timer&&timer!=null){
		   	   		clearInterval(timer);
			    }
	    	},5000);
	    }else{
    		MESBasic_factoryModel_factoryModel_factoryTreeList_layout.node = node;
			node.modelName = "factoryModel";
			MESBasic_factoryModel_factoryModel_factoryListPart_refresh(node);
   		}
	 }
	 
	 MESBasic_factoryModel_factoryModel_factoryTreeList_layout.getNode = function(){
	 	var nodearray = MESBasic_factoryModel_factoryModel_factoryTreePart_getNode();
	 	if(nodearray.length>0){
	 		nodearray[0].modelCode = "MESBasic_1_factoryModel_FactoryModel";
	 		return nodearray[0];
	 	}else{
	 		return null;
	 	}
	 }
	 
	 MESBasic_factoryModel_factoryModel_factoryTreeList_layout._refreshRootNode = function(){
	 	MESBasic_factoryModel_factoryModel_factoryTreePart_refreshRootNode();
	 }
	 
	 MESBasic_factoryModel_factoryModel_factoryTreeList_layout.refreshTree = function(nodeId){
	 	MESBasic_factoryModel_factoryModel_factoryTreePart_refresh(nodeId);
	 }
	 
	  MESBasic_factoryModel_factoryModel_factoryTreeList_layout.refreshNodeId = function(node, operate){
	 	return MESBasic_factoryModel_factoryModel_factoryTreePart_refreshNodeId(node, operate);
	 }
	 
	 MESBasic_factoryModel_factoryModel_factoryTreeList_layout.getList = function(){
	 	MESBasic_factoryModel_factoryModel_factoryListPart_getList();
	 }
	 
	 new CUI.Layout("layout1", {});
	 
		setTimeout(function(){
			$("#west1").load("/MESBasic/factoryModel/factoryModel/factoryTreePart.action?layoutViewCode=MESBasic_1_factoryModel_factoryTreeList&${getPowerCode('MESBasic_1_factoryModel_factoryTreePart_self')}",null,function(){
				$("#west1").height($("#west1").height() - $('#factoryTreePart_buttonbar').height());
			},false,'centerFrame');
		},100);
		 setTimeout(function(){
			$("#center1").load("/MESBasic/factoryModel/factoryModel/factoryListPart.action?${getPowerCode('MESBasic_1_factoryModel_factoryListPart_self')}&permissionCode=MESBasic_1_factoryModel_factoryTreeList",null,null,false,'centerFrame');
		},200);
		
	MESBasic_factoryModel_factoryModel_factoryTreePart_getLayout = function(){
		return MESBasic_factoryModel_factoryModel_factoryTreeList_layout;
	}
	
	MESBasic_factoryModel_factoryModel_factoryListPart_getLayout = function(){
		return MESBasic_factoryModel_factoryModel_factoryTreeList_layout;
	}
	
	MESBasic_factoryModel_factoryModel_factoryListPart_cancelSelectedNode = function(){
		return MESBasic_factoryModel_factoryModel_factoryTreePart_cancelSelectedNode();
	}
	
</script>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>