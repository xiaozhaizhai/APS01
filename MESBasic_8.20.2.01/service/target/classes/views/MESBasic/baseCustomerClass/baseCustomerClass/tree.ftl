<#if Parameters?? && (Parameters.pageType?? && Parameters.pageType == 'ref')>
<#assign selectedMultiEnable=true>
<#assign checkboxEnable=true>
<#assign callback="{}">
<#else>
<#assign callback="{onDrop:function(event, treeId, treeNodes, targetNode, moveType, isCop){MESBasic_baseCustomerClass_baseCustomerClass_tree_drop(event, treeId, treeNodes, targetNode, moveType, isCop);}, onDrag:function(event, treeId, treeNodes){MESBasic_baseCustomerClass_baseCustomerClass_tree_drag(event, treeId, treeNodes);}, beforeDragOpen:function(treeId, treeNode){return false;}, beforeDrag:function(treeId, treeNodes){return false;}, onClick:function(event,treeId,node){MESBasic_baseCustomerClass_baseCustomerClass_tree_treeOnclick(event,treeId,node);}, onDblClick:function(event,treeId,node){MESBasic_baseCustomerClass_baseCustomerClass_tree_treeDbOnclick(event,treeId,node);}}">
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
<div id="tree_div" style="overflow:scroll;">
</#if>
<@tree movUrl="/MESBasic/baseCustomerClass/baseCustomerClass/treeDrag.action?${getPowerCode('${layoutViewCode!}tree_move_MESBasic_1_baseCustomerClass_tree')}" id="MESBasic_baseCustomerClass_baseCustomerClass_tree_tree" dataUrl="/MESBasic/baseCustomerClass/baseCustomerClass/treeData.action?${layoutParams}" rootName="${getText('MESBasic.menuInfoname.radion1436783575793')}" nameCol="ccNAME"
			 callback="${callback}" selectedMultiEnable=selectedMultiEnable checkboxEnable=checkboxEnable />
<#if Parameters?? && (Parameters.pageType?? && Parameters.pageType == 'ref')>
</div>
<script type="text/javascript">
	$(function(){
		var height = $('#tree_div').parent().height();
		$('#tree_div').css('height', height);
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
		 background-image:url(/bap/static/foundation/infoset/order_disableprev.gif);
		 width: 35px;
		 height: 31px;
		 cursor: hand;
		 border-style: none;
	}
	.ec-list-dis-nextbtn{
		 background-image:url(/bap/static/foundation/infoset/order_disablenext.gif);
		 width: 35px;
		 height: 31px;
		 cursor: hand;
		 border-style: none;
	}
	.ec-list-dis-topbtn{
		 background-image:url(/bap/static/foundation/infoset/order_disabletop.gif);
		 width: 35px;
		 height: 31px;
		 cursor: hand;
		 border-style: none;
	}
	.ec-list-dis-lastbtn{
		 background-image:url(/bap/static/foundation/infoset/order_disablelast.gif);
		 width: 35px;
		 height: 31px;
		 cursor: hand;
		 border-style: none;
	}
	.sort-selected{background : #A3E0FF}
</style>
<div id="tree_sort_div" style="display: none;"> 	
	<div style="position:absolute;left:0px;top:0px;overflow:auto;height:86.5%;;width:75%;display:inline-block;">
		<div id="tree_scroll_div" style="margin-left:10px;margin-top:20px;overflow-y:auto;clear:both;height:82%">
		<table cellpadding="0" id="tree_fastColTable" style="font-size:12px;width:96%;" cellspacing="0" align="center" class="infoTable">
			<tbody id="tree_sort_table">
				
			</tbody>
		</table>
		</div>
	</div>
	<div id="tree_fastContent" style="background-color:#f8f6f7;position:absolute;right:0px;top:0px;width:25%;border: 1px solid #efefef; height: 99%;">
		<div class="ec-list-btndiv"><div id="tree_first" class="ec-list-topbtn" onclick="MESBasic.baseCustomerClass.baseCustomerClass.tree.firstRow()"></div></div>
		<div class="ec-list-btndiv"><div id="tree_up" class="ec-list-prevbtn" onclick="MESBasic.baseCustomerClass.baseCustomerClass.tree.upRow()"></div></div>
		<div class="ec-list-btndiv"><div id="tree_down" class="ec-list-nextbtn" onclick="MESBasic.baseCustomerClass.baseCustomerClass.tree.downRow()"></div></div>
		<div class="ec-list-btndiv"><div id="tree_last" class="ec-list-lastbtn" onclick="MESBasic.baseCustomerClass.baseCustomerClass.tree.lastRow()"></div></div>
	</div>
</div>
<#if Parameters?? && !(Parameters.pageType?? && Parameters.pageType == 'ref')>
			<div id="tree_opratebar" class="opratebar">
			</div>
</#if>	


<script type="text/javascript">
CUI.ns("MESBasic.baseCustomerClass.baseCustomerClass.tree");

	MESBasic.baseCustomerClass.baseCustomerClass.tree.cancelSelectedNode = function(parentRes){
		var layout = MESBasic_baseCustomerClass_baseCustomerClass_tree_getLayout();
		var ns = layout.getList();
		if(ns) {
			ns = eval(ns);
			ns.node = null;
		}
		MESBasic_baseCustomerClass_baseCustomerClass_tree_tree.cancelSelectedNode();
	};
	
	MESBasic_baseCustomerClass_baseCustomerClass_tree_cancelSelectedNode = function(parentRes){
		var layout = MESBasic_baseCustomerClass_baseCustomerClass_tree_getLayout();
		var ns = layout.getList();
		if(ns) {
			ns = eval(ns);
			ns.node = null;
		}
		MESBasic_baseCustomerClass_baseCustomerClass_tree_tree.cancelSelectedNode();
	};
	
<#if Parameters?? && !(Parameters.pageType?? && Parameters.pageType == 'ref')>
	
	MESBasic_baseCustomerClass_baseCustomerClass_tree_treeOnclick = function(event,treeId,node){
		var layout = MESBasic_baseCustomerClass_baseCustomerClass_tree_getLayout();
		layout.refresh(node);
	}
	
	MESBasic_baseCustomerClass_baseCustomerClass_tree_treeDbOnclick = function(event,treeId,node){
	}
	
	MESBasic_baseCustomerClass_baseCustomerClass_tree_treeBeforeDrag = function(treeId,node){
	}
	
	MESBasic_baseCustomerClass_baseCustomerClass_tree_treeAfterDrop = function(treeId, treeNodes, targetNode, moveType, isCopy){
	}
	
	MESBasic_baseCustomerClass_baseCustomerClass_tree_drag = function(event, treeId, treeNodes){
		
	}
	
	/*
	MESBasic_baseCustomerClass_baseCustomerClass_tree_beforeDrop = function(treeId, treeNodes, targetNode, moveType, isCopy){
		
	}
	*/
	
	MESBasic_baseCustomerClass_baseCustomerClass_tree_drop = function(event, treeId, treeNodes, targetNode, moveType, isCopy){
		
	}
	
	MESBasic_baseCustomerClass_baseCustomerClass_tree_getNode = function(){
		return MESBasic_baseCustomerClass_baseCustomerClass_tree_tree.getSelectedNodes();
	}
	
	MESBasic_baseCustomerClass_baseCustomerClass_tree_refreshNodeId = function(node, operate){
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
	
	MESBasic_baseCustomerClass_baseCustomerClass_tree_refresh = function(nodeId){
		var node = MESBasic_baseCustomerClass_baseCustomerClass_tree_tree.getNodeByParam("id", nodeId ? nodeId : -1);
		if(node && node.isParent == false) {
			node.isParent = true;
		}
		MESBasic_baseCustomerClass_baseCustomerClass_tree_tree.setting.callback.customOnAsyncSuccessMethod = function(event, treeId, treeNode, msg){
			if(treeNode && treeNode.children.length == 0) {
				treeNode.isParent = false;
				MESBasic_baseCustomerClass_baseCustomerClass_tree_tree.updateNode(treeNode);
			}
			var layout = MESBasic_baseCustomerClass_baseCustomerClass_tree_getLayout();
			var checkNode = layout.node;
			if(checkNode != null){
				MESBasic_baseCustomerClass_baseCustomerClass_tree_tree.selectNode(MESBasic_baseCustomerClass_baseCustomerClass_tree_tree.getNodeByParam("id", checkNode.id));
				$("#" + checkNode.tId + "_a").trigger('click');
			} 
		}
		MESBasic_baseCustomerClass_baseCustomerClass_tree_tree.reAsyncChildNodes(node,"refresh");
	}
	
				
	MESBasic.baseCustomerClass.baseCustomerClass.tree.checkSelectedAny = function(){
		var nodes = MESBasic_baseCustomerClass_baseCustomerClass_tree_tree.getSelectedNodes();
		if(nodes.length > 0){
			return true;
		}else{
			CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
			return false;
		}
	}
	
	MESBasic.baseCustomerClass.baseCustomerClass.tree.checkTreeRoot = function(){
		var nodes = MESBasic_baseCustomerClass_baseCustomerClass_tree_tree.getSelectedNodes();
		if(nodes.length > 0){
			var node = nodes[0];
			if(node.level == 0){
				CUI.Dialog.alert("${getText('不能操作根节点')}");
				return false;
			} else {
				return true;
			}
		}else{
			CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
			return false;
		}
	}
	
	
	
	MESBasic.baseCustomerClass.baseCustomerClass.tree.isTreeRoot = function(){
		var nodes = MESBasic_baseCustomerClass_baseCustomerClass_tree_tree.getSelectedNodes();
		var node = nodes[0];
		if(node.level == 0){
			return true;
		} else {
			return false;
		}
		
	}
	
	MESBasic.baseCustomerClass.baseCustomerClass.tree.showDialog = function(url,formId,title,width,height) {
		var buttons = [];
		buttons.push({	
				name:"${getText('common.button.save')}",
				handler:function(){CUI('#'+formId).submit();}
			});
		buttons.push({
				name:"${getText('foundation.common.closed')}",
				type:"cancel"
			});
		MESBasic.baseCustomerClass.baseCustomerClass.tree.Dlg =	new CUI.Dialog({
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
		MESBasic.baseCustomerClass.baseCustomerClass.tree.Dlg.show();
	};
	
	MESBasic.baseCustomerClass.baseCustomerClass.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('MESBasic_baseCustomerClass_baseCustomerClass_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.deleteandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{MESBasic.baseCustomerClass.baseCustomerClass.tree.Dlg.close();closeLoadPanel();}catch(e){}
				var node = MESBasic_baseCustomerClass_baseCustomerClass_tree_tree.getNodes()[0];
				MESBasic_baseCustomerClass_baseCustomerClass_tree_tree.reAsyncChildNodes(node,"refresh");
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	(function(){
		if($('#tree_opratebar').length > 0){
			$('#tree_buttonbar').append($('#tree_opratebar'));
		}
		if($('#tree_opratebar').children().length == 0){
			$('#tree_opratebar').hide();
		}
	})();
	
<#else>
	MESBasic.baseCustomerClass.baseCustomerClass.tree.getSelectedNodes = function(callBack){
		var nodes = MESBasic_baseCustomerClass_baseCustomerClass_tree_tree.getCheckedNodes();
		eval(callBack+"(nodes)");
	}
</#if>

</script>
