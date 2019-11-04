<@errorbar id="workbenchErrorBar" offsetY=108 /><@loadpanel/>
	<div id="layout1">
		<div id="treePart_buttonbar" style="position:absolute;bottom:0px;z-index:550;">
		</div>
				<div id="west1" region="west" resize="true"  width="200"  style="overflow-y:auto;overflow-x:hidden;position:relative;">
				</div>
				<div id="center1" region="center" resize="true"  expand="true" offsetH="4" >
				</div>
	</div>
<script type="text/javascript">
	 var MESBasic_factoryModel_factoryModel_factoryTreeReference_layout = {};
	 
	 MESBasic_factoryModel_factoryModel_factoryTreeReference_layout.refresh = function(node){
	 	MESBasic_factoryModel_factoryModel_factoryTreeReference_layout.node = node;
	 	node.modelName = "factoryModel";
	 	MESBasic_factoryModel_factoryModel_factoryListPart_refresh(node);
	 }
	 
	 MESBasic_factoryModel_factoryModel_factoryTreeReference_layout.getNode = function(){
	 	var nodearray = MESBasic_factoryModel_factoryModel_treePart_getNode();
	 	if(nodearray.length>0){
	 		nodearray[0].modelCode = "MESBasic_1_factoryModel_FactoryModel";
	 		return nodearray[0];
	 	}else{
	 		return null;
	 	}
	 }
	 
	 MESBasic_factoryModel_factoryModel_factoryTreeReference_layout.refreshTree = function(nodeId){
	 	MESBasic_factoryModel_factoryModel_treePart_refresh(nodeId);
	 }
	 
	  MESBasic_factoryModel_factoryModel_factoryTreeReference_layout.refreshNodeId = function(node, operate){
	 	return MESBasic_factoryModel_factoryModel_treePart_refreshNodeId(node, operate);
	 }
	 
	 MESBasic_factoryModel_factoryModel_factoryTreeReference_layout.getList = function(){
	 	MESBasic_factoryModel_factoryModel_factoryListPart_getList();
	 }
	 
	 new CUI.Layout("layout1", {});
			setTimeout(function(){
				$("#west1").load("/MESBasic/factoryModel/factoryModel/treePart.action?layoutViewCode=MESBasic_1_factoryModel_factoryTreeReference&${getPowerCode('MESBasic_1_factoryModel_treePart_self')}",null,function(){
					$("#west1").height($("#west1").height() - $('#treePart_buttonbar').height());
				},false,'centerFrame');
			},100);
			 setTimeout(function(){
				$("#center1").load("/MESBasic/factoryModel/factoryModel/factoryListPart.action?${getPowerCode('MESBasic_1_factoryModel_factoryListPart_self')}&permissionCode=MESBasic_1_factoryModel_factoryTreeReference",null,null,false,'centerFrame');
			},200);
		
	MESBasic_factoryModel_factoryModel_treePart_getLayout = function(){
		return MESBasic_factoryModel_factoryModel_factoryTreeReference_layout;
	}
	
	MESBasic_factoryModel_factoryModel_factoryListPart_getLayout = function(){
		return MESBasic_factoryModel_factoryModel_factoryTreeReference_layout;
	}
	
	MESBasic_factoryModel_factoryModel_factoryListPart_cancelSelectedNode = function(){
		return MESBasic_factoryModel_factoryModel_treePart_cancelSelectedNode();
	}
	
</script>