<#if Parameters?? && (Parameters.pageType?? && Parameters.pageType == 'ref')>
<#assign selectedMultiEnable=true>
<#assign checkboxEnable=true>
<#assign callback="{}">
<#else>
<#assign callback="{onDrop:function(event, treeId, treeNodes, targetNode, moveType, isCop){MESBasic_factoryModel_factoryModel_treePart_drop(event, treeId, treeNodes, targetNode, moveType, isCop);}, onDrag:function(event, treeId, treeNodes){MESBasic_factoryModel_factoryModel_treePart_drag(event, treeId, treeNodes);}, beforeDragOpen:function(treeId, treeNode){return false;}, beforeDrag:function(treeId, treeNodes){return false;}, onClick:function(event,treeId,node){MESBasic_factoryModel_factoryModel_treePart_treeOnclick(event,treeId,node);}, onDblClick:function(event,treeId,node){MESBasic_factoryModel_factoryModel_treePart_treeDbOnclick(event,treeId,node);}}">
<#assign selectedMultiEnable=false>
<#assign checkboxEnable=false>
</#if>
<#assign layoutParams = "">
<#if Parameters??>
	<#assign keys = Parameters?keys>
	<#list keys as key>
	<#assign layoutParams = layoutParams + "&" + key + "=" + Parameters[key]>
	</#list>
	<#if Parameters.layoutViewCode?? && layoutViewCode?has_content && Parameters.layoutViewCode?has_content>
		<#assign layoutViewCode = Parameters.layoutViewCode + "_">
	</#if>
</#if>
<#if Parameters?? && (Parameters.pageType?? && Parameters.pageType == 'ref')>
<div id="treePart_div" style="overflow:scroll;">
</#if>
<@tree movUrl="/MESBasic/factoryModel/factoryModel/treePartDrag.action?${getPowerCode('${layoutViewCode!}treePart_move_MESBasic_1_factoryModel_treePart')}" id="MESBasic_factoryModel_factoryModel_treePart_tree" dataUrl="/MESBasic/factoryModel/factoryModel/treePartData.action?${layoutParams}" rootName="${getText('MESBasic.treeRootName.radion1419585531476')}" nameCol="name"
			 callback="${callback}" selectedMultiEnable=selectedMultiEnable checkboxEnable=checkboxEnable />
<#if Parameters?? && (Parameters.pageType?? && Parameters.pageType == 'ref')>
</div>
<script type="text/javascript">
	$(function(){
		var height = $('#treePart_div').parent().height();
		$('#treePart_div').css('height', height);
	});
</script>
</#if>
<style>
	.even-num {
		background-color : #EDEDED;
	}
	.ec-list-btndiv{padding-top:25px;padding-left:30px;}
	.ec-list-prevbtn{
	 	background:url(/bap/static/foundation/infoset/order_prev.gif) no-repeat center left;
		 width: 35px;
		 height: 31px;
		 cursor: hand;
		 border-style: none;
	}
	.ec-list-nextbtn{
		 background-image:url(/bap/static/foundation/infoset/order_next.gif);
		 width: 35px;
		 height: 31px;
		 cursor: hand;
		 border-style: none;
	}
	.ec-list-topbtn{
		 background-image:url(/bap/static/foundation/infoset/order_top.gif);
		 width: 35px;
		 height: 31px;
		 cursor: hand;
		 border-style: none;
	}
	.ec-list-lastbtn{
		 background-image:url(/bap/static/foundation/infoset/order_last.gif);
		 width: 35px;
		 height: 31px;
		 cursor: hand;
		 border-style: none;
	}
	.ec-list-dis-prevbtn{
		 background-image:url(/static/foundation/infoset/order_disableprev.gif);
		 width: 35px;
		 height: 31px;
		 cursor: hand;
		 border-style: none;
	}
	.ec-list-dis-nextbtn{
		 background-image:url(/static/foundation/infoset/order_disablenext.gif);
		 width: 35px;
		 height: 31px;
		 cursor: hand;
		 border-style: none;
	}
	.ec-list-dis-topbtn{
		 background-image:url(/static/foundation/infoset/order_disabletop.gif);
		 width: 35px;
		 height: 31px;
		 cursor: hand;
		 border-style: none;
	}
	.ec-list-dis-lastbtn{
		 background-image:url(/static/foundation/infoset/order_disablelast.gif);
		 width: 35px;
		 height: 31px;
		 cursor: hand;
		 border-style: none;
	}
	.sort-selected{background : #A3E0FF}
</style>
<div id="treePart_sort_div" style="width:98%;background-color:white;float:left;height:96%;margin: 8px 5px 0 7px;display: none;"> 	
	<div style="position:absolute;height:89%;width:80%;">
		<div id="treePart_scroll_div" style="margin-left:10px;margin-top:20px;overflow-y:auto;clear:both;height:82%">
		<table cellpadding="0" id="treePart_fastColTable" style="font-size:12px;width:96%;" cellspacing="0" align="center" class="infoTable">
			<tbody id="treePart_sort_table">
				
			</tbody>
		</table>
		</div>
	</div>
	<div id="treePart_fastContent" style="background-color:#f8f6f7;position:absolute;right:15px;width:15%;height:60%">
		<div class="ec-list-btndiv"><div id="treePart_first" class="ec-list-topbtn" onclick="MESBasic.factoryModel.factoryModel.treePart.firstRow()"></div></div>
		<div class="ec-list-btndiv"><div id="treePart_up" class="ec-list-prevbtn" onclick="MESBasic.factoryModel.factoryModel.treePart.upRow()"></div></div>
		<div class="ec-list-btndiv"><div id="treePart_down" class="ec-list-nextbtn" onclick="MESBasic.factoryModel.factoryModel.treePart.downRow()"></div></div>
		<div class="ec-list-btndiv"><div id="treePart_last" class="ec-list-lastbtn" onclick="MESBasic.factoryModel.factoryModel.treePart.lastRow()"></div></div>
	</div>
</div>
<#if Parameters?? && !(Parameters.pageType?? && Parameters.pageType == 'ref')>
	<div id="treePart_opratebar" class="opratebar">
	</div>
</#if>		 
<script type="text/javascript">
CUI.ns("MESBasic.factoryModel.factoryModel.treePart");

	MESBasic.factoryModel.factoryModel.treePart.cancelSelectedNode = function(parentRes){
		var layout = MESBasic_factoryModel_factoryModel_treePart_getLayout();
		var ns = layout.getList();
		if(ns) {
			ns = eval(ns);
			ns.node = null;
		}
		MESBasic_factoryModel_factoryModel_treePart_tree.cancelSelectedNode();
	};
	
	MESBasic_factoryModel_factoryModel_treePart_cancelSelectedNode = function(parentRes){
		var layout = MESBasic_factoryModel_factoryModel_treePart_getLayout();
		var ns = layout.getList();
		if(ns) {
			ns = eval(ns);
			ns.node = null;
		}
		MESBasic_factoryModel_factoryModel_treePart_tree.cancelSelectedNode();
	};
	
<#if Parameters?? && !(Parameters.pageType?? && Parameters.pageType == 'ref')>
	
	MESBasic_factoryModel_factoryModel_treePart_treeOnclick = function(event,treeId,node){
		var layout = MESBasic_factoryModel_factoryModel_treePart_getLayout();
		layout.refresh(node);
	}
	
	MESBasic_factoryModel_factoryModel_treePart_treeDbOnclick = function(event,treeId,node){
	}
	
	MESBasic_factoryModel_factoryModel_treePart_treeBeforeDrag = function(treeId,node){
	}
	
	MESBasic_factoryModel_factoryModel_treePart_treeAfterDrop = function(treeId, treeNodes, targetNode, moveType, isCopy){
	}
	
	MESBasic_factoryModel_factoryModel_treePart_drag = function(event, treeId, treeNodes){
		
	}
	
	/*
	MESBasic_factoryModel_factoryModel_treePart_beforeDrop = function(treeId, treeNodes, targetNode, moveType, isCopy){
		
	}
	*/
	
	MESBasic_factoryModel_factoryModel_treePart_drop = function(event, treeId, treeNodes, targetNode, moveType, isCopy){
		
	}
	
	MESBasic_factoryModel_factoryModel_treePart_getNode = function(){
		return MESBasic_factoryModel_factoryModel_treePart_tree.getSelectedNodes();
	}
	
	MESBasic_factoryModel_factoryModel_treePart_refreshNodeId = function(node, operate){
		var refreshNodeId = -1;
		var nodeLayRec = node.layRec;
		if(nodeLayRec != undefined && nodeLayRec != null && nodeLayRec != ""){
			if(nodeLayRec.indexOf("-") > 0){
				var nodeIds = nodeLayRec.split("-");
				var l = nodeIds.length - 1;
				if(operate == 'edit' || operate == 'delete') {
					l -= 1;
				} 
				refreshNodeId = nodeIds[l];
			} else {
				if(operate == 'add') {
					refreshNodeId = nodeLayRec;
				}
			}
		}
		return refreshNodeId;
	}
	
	MESBasic_factoryModel_factoryModel_treePart_refresh = function(nodeId){
		var node = MESBasic_factoryModel_factoryModel_treePart_tree.getNodeByParam("id", nodeId ? nodeId : -1);
		if(node && node.isParent == false) {
			node.isParent = true;
		}
		MESBasic_factoryModel_factoryModel_treePart_tree.setting.callback.customOnAsyncSuccessMethod = function(event, treeId, treeNode, msg){
			if(treeNode && treeNode.children.length == 0) {
				treeNode.isParent = false;
				MESBasic_factoryModel_factoryModel_treePart_tree.updateNode(treeNode);
			}
			var layout = MESBasic_factoryModel_factoryModel_treePart_getLayout();
			var checkNode = layout.node;
			if(checkNode != null){
				MESBasic_factoryModel_factoryModel_treePart_tree.selectNode(MESBasic_factoryModel_factoryModel_treePart_tree.getNodeByParam("id", checkNode.id));
				$("#" + checkNode.tId + "_a").trigger('click');
			} 
		}
		MESBasic_factoryModel_factoryModel_treePart_tree.reAsyncChildNodes(node,"refresh");
	}
	
				
	MESBasic.factoryModel.factoryModel.treePart.checkSelectedAny = function(){
		var nodes = MESBasic_factoryModel_factoryModel_treePart_tree.getSelectedNodes();
		if(nodes.length > 0){
			return true;
		}else{
			CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
			return false;
		}
	}
	
	MESBasic.factoryModel.factoryModel.treePart.showDialog = function(url,formId,title,width,height) {
		var buttons = [];
		buttons.push({	
				name:"${getText('common.button.save')}",
				handler:function(){CUI('#'+formId).submit();}
			});
		buttons.push({
				name:"${getText('foundation.common.closed')}",
				type:"cancel"
			});
		MESBasic.factoryModel.factoryModel.treePart.Dlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 460,
			height: height || 330,
			//type : otherParams.dialogType,
			leaveConfirm : true,
			buttons:buttons
		});
		MESBasic.factoryModel.factoryModel.treePart.Dlg.show();
	};
	
	MESBasic.factoryModel.factoryModel.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('MESBasic_factoryModel_factoryModel_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.deleteandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{MESBasic.factoryModel.factoryModel.treePart.Dlg.close();closeLoadPanel();}catch(e){}
				var node = MESBasic_factoryModel_factoryModel_treePart_tree.getNodes()[0];
				MESBasic_factoryModel_factoryModel_treePart_tree.reAsyncChildNodes(node,"refresh");
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	(function(){
		if($('#treePart_opratebar').length > 0){
			$('#treePart_buttonbar').append($('#treePart_opratebar'));
		}
	})();
	
<#else>
	MESBasic.factoryModel.factoryModel.treePart.getSelectedNodes = function(callBack){
		var nodes = MESBasic_factoryModel_factoryModel_treePart_tree.getCheckedNodes();
		eval(callBack+"(nodes)");
	}
</#if>

</script>
