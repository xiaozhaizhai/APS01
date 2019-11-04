<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1524637571932')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_area_arealayout,head,MESBasic_1_area_Area,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
</head>
<body id="dialog_page">
<@loadpanel></@loadpanel>
</#if>
<@errorbar id="workbenchErrorBar" offsetY=0 /><@loadpanel/>
	<div id="layout1">
		<div id="areaTree_buttonbar" style="position:absolute;bottom:0px;z-index:550;">
		</div>
				<div id="west1" region="west" resize="true"  width="200"  style="overflow-y:auto;overflow-x:hidden;position:relative;">
				</div>
				<div id="center1" region="center" resize="true"  expand="true" offsetH="4" >
				</div>
	</div>
<script type="text/javascript">
	 var MESBasic_area_area_arealayout_layout = {};
	 
	 MESBasic_area_area_arealayout_layout.isRenderOver=false;
	 MESBasic_area_area_arealayout_layout.refresh = function(node){
	 	var timer=null;
		if(!this.isRenderOver){
		 	timer=setInterval(function(){
		    	if($("#center1 .datagrid").length>0){
				    MESBasic_area_area_arealayout_layout.node = node;
				 	node.modelName = "area";
				 	MESBasic_area_area_areaList_refresh(node);
				    clearInterval(timer);
	    		}   
	    	},100);
	    	setTimeout(function(){
		   		if(timer&&timer!=null){
		   	   		clearInterval(timer);
			    }
	    	},5000);
	    }else{
    		MESBasic_area_area_arealayout_layout.node = node;
			node.modelName = "area";
			MESBasic_area_area_areaList_refresh(node);
   		}
	 }
	 
	 MESBasic_area_area_arealayout_layout.getNode = function(){
	 	var nodearray = MESBasic_area_area_areaTree_getNode();
	 	if(nodearray.length>0){
	 		nodearray[0].modelCode = "MESBasic_1_area_Area";
	 		return nodearray[0];
	 	}else{
	 		return null;
	 	}
	 }
	 
	 MESBasic_area_area_arealayout_layout._refreshRootNode = function(){
	 	MESBasic_area_area_areaTree_refreshRootNode();
	 }
	 
	 MESBasic_area_area_arealayout_layout.refreshTree = function(nodeId){
	 	MESBasic_area_area_areaTree_refresh(nodeId);
	 }
	 
	  MESBasic_area_area_arealayout_layout.refreshNodeId = function(node, operate){
	 	return MESBasic_area_area_areaTree_refreshNodeId(node, operate);
	 }
	 
	 MESBasic_area_area_arealayout_layout.getList = function(){
	 	MESBasic_area_area_areaList_getList();
	 }
	 
	 new CUI.Layout("layout1", {});
	 
		setTimeout(function(){
			$("#west1").load("/MESBasic/area/area/areaTree.action?layoutViewCode=MESBasic_1_area_arealayout&${getPowerCode('MESBasic_1_area_areaTree_self')}",null,function(){
				$("#west1").height($("#west1").height() - $('#areaTree_buttonbar').height());
			},false,'centerFrame');
		},100);
		 setTimeout(function(){
			$("#center1").load("/MESBasic/area/area/areaList.action?${getPowerCode('MESBasic_1_area_areaList_self')}&permissionCode=MESBasic_1_area_arealayout",null,null,false,'centerFrame');
		},200);
		
	MESBasic_area_area_areaTree_getLayout = function(){
		return MESBasic_area_area_arealayout_layout;
	}
	
	MESBasic_area_area_areaList_getLayout = function(){
		return MESBasic_area_area_arealayout_layout;
	}
	
	MESBasic_area_area_areaList_cancelSelectedNode = function(){
		return MESBasic_area_area_areaTree_cancelSelectedNode();
	}
	
</script>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>