<#if Parameters?? && (Parameters.pageType?? && Parameters.pageType == 'ref')>
<#assign selectedMultiEnable=true>
<#assign checkboxEnable=true>
<#assign callback="{}">
<#else>
<#assign callback="{onDrop:function(event, treeId, treeNodes, targetNode, moveType, isCop){MESBasic_factoryWare_factoryWare_factoryWareTree_drop(event, treeId, treeNodes, targetNode, moveType, isCop);}, onDrag:function(event, treeId, treeNodes){MESBasic_factoryWare_factoryWare_factoryWareTree_drag(event, treeId, treeNodes);}, beforeDragOpen:function(treeId, treeNode){return false;}, beforeDrag:function(treeId, treeNodes){return false;}, onClick:function(event,treeId,node){MESBasic_factoryWare_factoryWare_factoryWareTree_treeOnclick(event,treeId,node);}, onDblClick:function(event,treeId,node){MESBasic_factoryWare_factoryWare_factoryWareTree_treeDbOnclick(event,treeId,node);}}">
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
<div id="factoryWareTree_div" style="overflow:scroll;">
</#if>
<@tree movUrl="/MESBasic/factoryWare/factoryWare/factoryWareTreeDrag.action?${getPowerCode('${layoutViewCode!}factoryWareTree_move_MESBasic_1_factoryWare_factoryWareTree')}" id="MESBasic_factoryWare_factoryWare_factoryWareTree_tree" dataUrl="/MESBasic/factoryWare/factoryWare/factoryWareTreeData.action?${layoutParams}" rootName="${getText('MESBasic_1_factoryWare_factoryWareTree.treeRootName232')}" nameCol="name"
			 callback="${callback}" selectedMultiEnable=selectedMultiEnable checkboxEnable=checkboxEnable  canMemory=false />
<#if Parameters?? && (Parameters.pageType?? && Parameters.pageType == 'ref')>
</div>
<script type="text/javascript">
	$(function(){
		var height = $('#factoryWareTree_div').parent().height();
		$('#factoryWareTree_div').css('height', height);
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
<div id="factoryWareTree_sort_div" style="display: none;"> 	
	<div style="position:absolute;left:0px;top:0px;overflow:auto;height:86.5%;;width:75%;display:inline-block;">
		<div id="factoryWareTree_scroll_div" style="margin-left:10px;margin-top:20px;overflow-y:auto;clear:both;height:82%">
		<table cellpadding="0" id="factoryWareTree_fastColTable" style="font-size:12px;width:96%;" cellspacing="0" align="center" class="infoTable">
			<tbody id="factoryWareTree_sort_table">
				
			</tbody>
		</table>
		</div>
	</div>
	<div id="factoryWareTree_fastContent" style="background-color:#f8f6f7;position:absolute;right:0px;top:0px;width:25%;border: 1px solid #efefef; height: 99%;">
		<div class="ec-list-btndiv"><div id="factoryWareTree_first" class="ec-list-topbtn" onclick="MESBasic.factoryWare.factoryWare.factoryWareTree.firstRow()"></div></div>
		<div class="ec-list-btndiv"><div id="factoryWareTree_up" class="ec-list-prevbtn" onclick="MESBasic.factoryWare.factoryWare.factoryWareTree.upRow()"></div></div>
		<div class="ec-list-btndiv"><div id="factoryWareTree_down" class="ec-list-nextbtn" onclick="MESBasic.factoryWare.factoryWare.factoryWareTree.downRow()"></div></div>
		<div class="ec-list-btndiv"><div id="factoryWareTree_last" class="ec-list-lastbtn" onclick="MESBasic.factoryWare.factoryWare.factoryWareTree.lastRow()"></div></div>
	</div>
</div>
<#if Parameters?? && !(Parameters.pageType?? && Parameters.pageType == 'ref')>
			<div id="factoryWareTree_opratebar" class="opratebar">
			</div>
</#if>	


<script type="text/javascript">
CUI.ns("MESBasic.factoryWare.factoryWare.factoryWareTree");

	MESBasic.factoryWare.factoryWare.factoryWareTree.cancelSelectedNode = function(parentRes){
		var layout = MESBasic_factoryWare_factoryWare_factoryWareTree_getLayout();
		var ns = layout.getList();
		if(ns) {
			ns = eval(ns);
			ns.node = null;
		}
		MESBasic_factoryWare_factoryWare_factoryWareTree_tree.cancelSelectedNode();
	};
	
	MESBasic_factoryWare_factoryWare_factoryWareTree_cancelSelectedNode = function(parentRes){
		var layout = MESBasic_factoryWare_factoryWare_factoryWareTree_getLayout();
		var ns = layout.getList();
		if(ns) {
			ns = eval(ns);
			ns.node = null;
		}
		MESBasic_factoryWare_factoryWare_factoryWareTree_tree.cancelSelectedNode();
	};
	
<#if Parameters?? && !(Parameters.pageType?? && Parameters.pageType == 'ref')>
	
	MESBasic_factoryWare_factoryWare_factoryWareTree_treeOnclick = function(event,treeId,node){
		var layout = MESBasic_factoryWare_factoryWare_factoryWareTree_getLayout();
		layout.refresh(node);
	}
	
	MESBasic_factoryWare_factoryWare_factoryWareTree_treeDbOnclick = function(event,treeId,node){
	}
	
	MESBasic_factoryWare_factoryWare_factoryWareTree_treeBeforeDrag = function(treeId,node){
	}
	
	MESBasic_factoryWare_factoryWare_factoryWareTree_treeAfterDrop = function(treeId, treeNodes, targetNode, moveType, isCopy){
	}
	
	MESBasic_factoryWare_factoryWare_factoryWareTree_drag = function(event, treeId, treeNodes){
		
	}
	
	/*
	MESBasic_factoryWare_factoryWare_factoryWareTree_beforeDrop = function(treeId, treeNodes, targetNode, moveType, isCopy){
		
	}
	*/
	
	MESBasic_factoryWare_factoryWare_factoryWareTree_drop = function(event, treeId, treeNodes, targetNode, moveType, isCopy){
		
	}
	
	MESBasic_factoryWare_factoryWare_factoryWareTree_getNode = function(){
		return MESBasic_factoryWare_factoryWare_factoryWareTree_tree.getSelectedNodes();
	}
	
	MESBasic_factoryWare_factoryWare_factoryWareTree_refreshNodeId = function(node, operate){
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
	
	
	MESBasic_factoryWare_factoryWare_factoryWareTree_refreshRootNode = function(){
		var rootNode = MESBasic_factoryWare_factoryWare_factoryWareTree_tree.getNodeByParam( "id", -1 );
		MESBasic_factoryWare_factoryWare_factoryWareTree_tree.reAsyncChildNodes( rootNode, "refresh" );
		MESBasic_factoryWare_factoryWare_factoryWareTree_tree.selectNode( rootNode )
		$("#" + rootNode.tId + "_a").trigger('click');
	}
	
	MESBasic_factoryWare_factoryWare_factoryWareTree_refresh = function(nodeId){
		var node = MESBasic_factoryWare_factoryWare_factoryWareTree_tree.getNodeByParam("id", nodeId ? nodeId : -1);
		if(node && node.isParent == false) {
			node.isParent = true;
		}
		MESBasic_factoryWare_factoryWare_factoryWareTree_tree.setting.callback.customOnAsyncSuccessMethod = function(event, treeId, treeNode, msg){
			if(treeNode && treeNode.children.length == 0) {
				treeNode.isParent = false;
				MESBasic_factoryWare_factoryWare_factoryWareTree_tree.updateNode(treeNode);
			}
			var layout = MESBasic_factoryWare_factoryWare_factoryWareTree_getLayout();
			var checkNode = layout.node;
			if(checkNode != null){
				MESBasic_factoryWare_factoryWare_factoryWareTree_tree.selectNode(MESBasic_factoryWare_factoryWare_factoryWareTree_tree.getNodeByParam("id", checkNode.id));
				$("#" + checkNode.tId + "_a").trigger('click');
			} 
		}
		MESBasic_factoryWare_factoryWare_factoryWareTree_tree.reAsyncChildNodes(node,"refresh");
	}
	
				
	MESBasic.factoryWare.factoryWare.factoryWareTree.checkSelectedAny = function(){
		var nodes = MESBasic_factoryWare_factoryWare_factoryWareTree_tree.getSelectedNodes();
		if(nodes.length > 0){
			return true;
		}else{
			CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
			return false;
		}
	}
	
	MESBasic.factoryWare.factoryWare.factoryWareTree.checkTreeRoot = function(){
		var nodes = MESBasic_factoryWare_factoryWare_factoryWareTree_tree.getSelectedNodes();
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
	
	
	
	MESBasic.factoryWare.factoryWare.factoryWareTree.isTreeRoot = function(){
		var nodes = MESBasic_factoryWare_factoryWare_factoryWareTree_tree.getSelectedNodes();
		var node = nodes[0];
		if(node.level == 0){
			return true;
		} else {
			return false;
		}
		
	}
	
	MESBasic.factoryWare.factoryWare.factoryWareTree.showDialog = function(url,formId,title,dialogType) {
		var buttons = [];
		buttons.push({	
				name:"${getText('common.button.save')}",
				handler:function(){CUI('#'+formId).submit();}
			});
		buttons.push({
				name:"${getText('foundation.common.closed')}",
				type:"cancel"
			});
		MESBasic.factoryWare.factoryWare.factoryWareTree.Dlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			type : dialogType,
			//type : otherParams.dialogType,
			leaveConfirm : true,
			buttons:buttons
		});
		MESBasic.factoryWare.factoryWare.factoryWareTree.Dlg.show();
	};
	
	MESBasic.factoryWare.factoryWare.factoryWareTree.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('MESBasic_factoryWare_factoryWare_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.deleteandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{MESBasic.factoryWare.factoryWare.factoryWareTree.Dlg.close();closeLoadPanel();}catch(e){}
				var node = MESBasic_factoryWare_factoryWare_factoryWareTree_tree.getNodes()[0];
				MESBasic_factoryWare_factoryWare_factoryWareTree_tree.reAsyncChildNodes(node,"refresh");
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	(function(){
		if($('#factoryWareTree_opratebar').length > 0){
			$('#factoryWareTree_buttonbar').append($('#factoryWareTree_opratebar'));
		}
		if($('#factoryWareTree_opratebar').children().length == 0){
			$('#factoryWareTree_opratebar').hide();
		}
	})();
	
<#else>
	MESBasic.factoryWare.factoryWare.factoryWareTree.getSelectedNodes = function(callBack){
		var nodes = MESBasic_factoryWare_factoryWare_factoryWareTree_tree.getCheckedNodes();
		eval(callBack+"(nodes)");
	}
</#if>

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.factoryWare.factoryWare.factoryWareTree.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_factoryWare_factoryWare_factoryWareTree_fileupload_button",
		handler:function(){
			if($('#MESBasic_factoryWare_factoryWare_factoryWareTree_fileupload').length == 0) {
				$('body').append('<div id="MESBasic_factoryWare_factoryWare_factoryWareTree_fileupload"></div>');
			}
			MESBasic.factoryWare.factoryWare.factoryWareTree.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "MESBasic_factoryWare_factoryWare_factoryWareTree_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#MESBasic_factoryWare_factoryWare_factoryWareTree_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			MESBasic.factoryWare.factoryWare.factoryWareTree.infoDialog.show();
			if($('#MESBasic_factoryWare_factoryWare_factoryWareTree_fileupload').html() == '') {
				$('#MESBasic_factoryWare_factoryWare_factoryWareTree_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=MESBasic_factoryWare_factoryWare&entityCode=MESBasic_1_factoryWare&dialogId="+dialogId);
			}
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.factoryWare.factoryWare.factoryWareTree.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_factoryWare_factoryWareTree.MESBasic.factoryWare.factoryWare." + params.viewName + ".referenceCopy");
			funcName('factoryWare', params.referenceUrl, this);
		}
	}
};
</script>
