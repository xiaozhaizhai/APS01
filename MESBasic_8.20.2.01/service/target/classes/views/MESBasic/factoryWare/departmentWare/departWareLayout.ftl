<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1487072126550')}</title>
<@maincss/>
<@mainjs/>
</head>
<body id="dialog_page">
<@loadpanel></@loadpanel>
</#if>
<@errorbar id="workbenchErrorBar" offsetY=0 /><@loadpanel/>
	<div id="layout1">
		<div id="factoryTreeVPart_buttonbar" style="position:absolute;bottom:0px;z-index:550;">
		</div>
				<div id="west1" region="west" resize="true"  width="200"  style="overflow-y:auto;overflow-x:hidden;position:relative;">
				</div>
				<div id="center1" region="center" resize="true"  expand="true" offsetH="4" >
				</div>
	</div>
<script type="text/javascript">
	 var MESBasic_factoryWare_departmentWare_departWareLayout_layout = {};
	 
	 MESBasic_factoryWare_departmentWare_departWareLayout_layout.isRenderOver=false;
	 MESBasic_factoryWare_departmentWare_departWareLayout_layout.refresh = function(node){
	 	var timer=null;
		if(!this.isRenderOver){
		 	timer=setInterval(function(){
		    	if($("#center1 .datagrid").length>0){
				    MESBasic_factoryWare_departmentWare_departWareLayout_layout.node = node;
				 	node.modelName = "factoryModel";
				 	MESBasic_factoryWare_departmentWare_departWarePart_refresh(node);
				    clearInterval(timer);
	    		}   
	    	},100);
	    	setTimeout(function(){
		   		if(timer&&timer!=null){
		   	   		clearInterval(timer);
			    }
	    	},5000);
	    }else{
    		MESBasic_factoryWare_departmentWare_departWareLayout_layout.node = node;
			node.modelName = "factoryModel";
			MESBasic_factoryWare_departmentWare_departWarePart_refresh(node);
   		}
	 }
	 
	 MESBasic_factoryWare_departmentWare_departWareLayout_layout.getNode = function(){
	 	var nodearray = MESBasic_factoryModel_factoryModel_factoryTreeVPart_getNode();
	 	if(nodearray.length>0){
	 		nodearray[0].modelCode = "MESBasic_1_factoryModel_FactoryModel";
	 		return nodearray[0];
	 	}else{
	 		return null;
	 	}
	 }
	 
	 MESBasic_factoryWare_departmentWare_departWareLayout_layout._refreshRootNode = function(){
	 	MESBasic_factoryModel_factoryModel_factoryTreeVPart_refreshRootNode();
	 }
	 
	 MESBasic_factoryWare_departmentWare_departWareLayout_layout.refreshTree = function(nodeId){
	 	MESBasic_factoryModel_factoryModel_factoryTreeVPart_refresh(nodeId);
	 }
	 
	  MESBasic_factoryWare_departmentWare_departWareLayout_layout.refreshNodeId = function(node, operate){
	 	return MESBasic_factoryModel_factoryModel_factoryTreeVPart_refreshNodeId(node, operate);
	 }
	 
	 MESBasic_factoryWare_departmentWare_departWareLayout_layout.getList = function(){
	 	MESBasic_factoryWare_departmentWare_departWarePart_getList();
	 }
	 
	 new CUI.Layout("layout1", {});
	 
		setTimeout(function(){
			$("#west1").load("/MESBasic/factoryModel/factoryModel/factoryTreeVPart.action?layoutViewCode=MESBasic_1_factoryWare_departWareLayout&${getPowerCode('MESBasic_1_factoryModel_factoryTreeVPart_self')}",null,function(){
				$("#west1").height($("#west1").height() - $('#factoryTreeVPart_buttonbar').height());
			},false,'centerFrame');
		},100);
		 setTimeout(function(){
			$("#center1").load("/MESBasic/factoryWare/departmentWare/departWarePart.action?${getPowerCode('MESBasic_1_factoryWare_departWarePart_self')}&permissionCode=MESBasic_1_factoryWare_departWareLayout",null,null,false,'centerFrame');
		},200);
		
	MESBasic_factoryModel_factoryModel_factoryTreeVPart_getLayout = function(){
		return MESBasic_factoryWare_departmentWare_departWareLayout_layout;
	}
	
	MESBasic_factoryWare_departmentWare_departWarePart_getLayout = function(){
		return MESBasic_factoryWare_departmentWare_departWareLayout_layout;
	}
	
	MESBasic_factoryWare_departmentWare_departWarePart_cancelSelectedNode = function(){
		return MESBasic_factoryModel_factoryModel_factoryTreeVPart_cancelSelectedNode();
	}
	
</script>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>