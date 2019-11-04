<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1449632498482')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-MESBasic_1_baseCustomerClass_custClassLayout,head,MESBasic_1_baseCustomerClass_BaseCustomerClass,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
</head>
<body id="dialog_page">
<@loadpanel></@loadpanel>
</#if>
<@errorbar id="workbenchErrorBar" offsetY=0 /><@loadpanel/>
	<div id="layout1">
		<div id="treeCust_buttonbar" style="position:absolute;bottom:0px;z-index:550;">
		</div>
				<div id="west1" region="west" resize="true"  width="200"  style="overflow-y:auto;overflow-x:hidden;position:relative;">
				</div>
				<div id="center1" region="center" resize="true"  expand="true" offsetH="4" >
				</div>
	</div>
<script type="text/javascript">
	 var MESBasic_baseCustomerClass_baseCustomerClass_custClassLayout_layout = {};
	 
	 MESBasic_baseCustomerClass_baseCustomerClass_custClassLayout_layout.isRenderOver=false;
	 MESBasic_baseCustomerClass_baseCustomerClass_custClassLayout_layout.refresh = function(node){
	 	var timer=null;
		if(!this.isRenderOver){
		 	timer=setInterval(function(){
		    	if($("#center1 .datagrid").length>0){
				    MESBasic_baseCustomerClass_baseCustomerClass_custClassLayout_layout.node = node;
				 	node.modelName = "baseCustomerClass";
				 	MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_refresh(node);
				    clearInterval(timer);
	    		}   
	    	},100);
	    	setTimeout(function(){
		   		if(timer&&timer!=null){
		   	   		clearInterval(timer);
			    }
	    	},5000);
	    }else{
    		MESBasic_baseCustomerClass_baseCustomerClass_custClassLayout_layout.node = node;
			node.modelName = "baseCustomerClass";
			MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_refresh(node);
   		}
	 }
	 
	 MESBasic_baseCustomerClass_baseCustomerClass_custClassLayout_layout.getNode = function(){
	 	var nodearray = MESBasic_baseCustomerClass_baseCustomerClass_treeCust_getNode();
	 	if(nodearray.length>0){
	 		nodearray[0].modelCode = "MESBasic_1_baseCustomerClass_BaseCustomerClass";
	 		return nodearray[0];
	 	}else{
	 		return null;
	 	}
	 }
	 
	 MESBasic_baseCustomerClass_baseCustomerClass_custClassLayout_layout._refreshRootNode = function(){
	 	MESBasic_baseCustomerClass_baseCustomerClass_treeCust_refreshRootNode();
	 }
	 
	 MESBasic_baseCustomerClass_baseCustomerClass_custClassLayout_layout.refreshTree = function(nodeId){
	 	MESBasic_baseCustomerClass_baseCustomerClass_treeCust_refresh(nodeId);
	 }
	 
	  MESBasic_baseCustomerClass_baseCustomerClass_custClassLayout_layout.refreshNodeId = function(node, operate){
	 	return MESBasic_baseCustomerClass_baseCustomerClass_treeCust_refreshNodeId(node, operate);
	 }
	 
	 MESBasic_baseCustomerClass_baseCustomerClass_custClassLayout_layout.getList = function(){
	 	MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_getList();
	 }
	 
	 new CUI.Layout("layout1", {});
	 
		setTimeout(function(){
			$("#west1").load("/MESBasic/baseCustomerClass/baseCustomerClass/treeCust.action?layoutViewCode=MESBasic_1_baseCustomerClass_custClassLayout&${getPowerCode('MESBasic_1_baseCustomerClass_treeCust_self')}",null,function(){
				$("#west1").height($("#west1").height() - $('#treeCust_buttonbar').height());
			},false,'centerFrame');
		},100);
		 setTimeout(function(){
			$("#center1").load("/MESBasic/baseCustomerClass/baseCustomerClass/listCustPart.action?${getPowerCode('MESBasic_1_baseCustomerClass_listCustPart_self')}&permissionCode=MESBasic_1_baseCustomerClass_custClassLayout",null,null,false,'centerFrame');
		},200);
		
	MESBasic_baseCustomerClass_baseCustomerClass_treeCust_getLayout = function(){
		return MESBasic_baseCustomerClass_baseCustomerClass_custClassLayout_layout;
	}
	
	MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_getLayout = function(){
		return MESBasic_baseCustomerClass_baseCustomerClass_custClassLayout_layout;
	}
	
	MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_cancelSelectedNode = function(){
		return MESBasic_baseCustomerClass_baseCustomerClass_treeCust_cancelSelectedNode();
	}
	
</script>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>