<#if Parameters?? && (Parameters.pageType?? && Parameters.pageType == 'ref')>
<#assign selectedMultiEnable=true>
<#assign checkboxEnable=true>
<#assign callback="{}">
<#else>
<#assign callback="{onDrop:function(event, treeId, treeNodes, targetNode, moveType, isCop){MESBasic_prodAttribute_prodAttribute_prodAtrrTree_drop(event, treeId, treeNodes, targetNode, moveType, isCop);}, onDrag:function(event, treeId, treeNodes){MESBasic_prodAttribute_prodAttribute_prodAtrrTree_drag(event, treeId, treeNodes);}, beforeDragOpen:function(treeId, treeNode){return false;}, beforeDrag:function(treeId, treeNodes){return false;}, onClick:function(event,treeId,node){MESBasic_prodAttribute_prodAttribute_prodAtrrTree_treeOnclick(event,treeId,node);}, onDblClick:function(event,treeId,node){MESBasic_prodAttribute_prodAttribute_prodAtrrTree_treeDbOnclick(event,treeId,node);}}">
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
<div id="prodAtrrTree_div" style="overflow:scroll;">
</#if>
<@tree movUrl="/MESBasic/prodAttribute/prodAttribute/prodAtrrTreeDrag.action?${getPowerCode('${layoutViewCode!}prodAtrrTree_move_MESBasic_1_prodAttribute_prodAtrrTree')}" id="MESBasic_prodAttribute_prodAttribute_prodAtrrTree_tree" dataUrl="/MESBasic/prodAttribute/prodAttribute/prodAtrrTreeData.action?${layoutParams}" rootName="${getText('MESBasic_1_prodAttribute_prodAtrrTree.treeRootName')}" nameCol="name"
			 callback="${callback}" selectedMultiEnable=selectedMultiEnable checkboxEnable=checkboxEnable  canMemory=false />
<#if Parameters?? && (Parameters.pageType?? && Parameters.pageType == 'ref')>
</div>
<script type="text/javascript">
	$(function(){
		var height = $('#prodAtrrTree_div').parent().height();
		$('#prodAtrrTree_div').css('height', height);
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
<div id="prodAtrrTree_sort_div" style="display: none;"> 	
	<div style="position:absolute;left:0px;top:0px;overflow:auto;height:86.5%;;width:75%;display:inline-block;">
		<div id="prodAtrrTree_scroll_div" style="margin-left:10px;margin-top:20px;overflow-y:auto;clear:both;height:82%">
		<table cellpadding="0" id="prodAtrrTree_fastColTable" style="font-size:12px;width:96%;" cellspacing="0" align="center" class="infoTable">
			<tbody id="prodAtrrTree_sort_table">
				
			</tbody>
		</table>
		</div>
	</div>
	<div id="prodAtrrTree_fastContent" style="background-color:#f8f6f7;position:absolute;right:0px;top:0px;width:25%;border: 1px solid #efefef; height: 99%;">
		<div class="ec-list-btndiv"><div id="prodAtrrTree_first" class="ec-list-topbtn" onclick="MESBasic.prodAttribute.prodAttribute.prodAtrrTree.firstRow()"></div></div>
		<div class="ec-list-btndiv"><div id="prodAtrrTree_up" class="ec-list-prevbtn" onclick="MESBasic.prodAttribute.prodAttribute.prodAtrrTree.upRow()"></div></div>
		<div class="ec-list-btndiv"><div id="prodAtrrTree_down" class="ec-list-nextbtn" onclick="MESBasic.prodAttribute.prodAttribute.prodAtrrTree.downRow()"></div></div>
		<div class="ec-list-btndiv"><div id="prodAtrrTree_last" class="ec-list-lastbtn" onclick="MESBasic.prodAttribute.prodAttribute.prodAtrrTree.lastRow()"></div></div>
	</div>
</div>
<#if Parameters?? && !(Parameters.pageType?? && Parameters.pageType == 'ref')>
</#if>	


<script type="text/javascript">
CUI.ns("MESBasic.prodAttribute.prodAttribute.prodAtrrTree");

	MESBasic.prodAttribute.prodAttribute.prodAtrrTree.cancelSelectedNode = function(parentRes){
		var layout = MESBasic_prodAttribute_prodAttribute_prodAtrrTree_getLayout();
		var ns = layout.getList();
		if(ns) {
			ns = eval(ns);
			ns.node = null;
		}
		MESBasic_prodAttribute_prodAttribute_prodAtrrTree_tree.cancelSelectedNode();
	};
	
	MESBasic_prodAttribute_prodAttribute_prodAtrrTree_cancelSelectedNode = function(parentRes){
		var layout = MESBasic_prodAttribute_prodAttribute_prodAtrrTree_getLayout();
		var ns = layout.getList();
		if(ns) {
			ns = eval(ns);
			ns.node = null;
		}
		MESBasic_prodAttribute_prodAttribute_prodAtrrTree_tree.cancelSelectedNode();
	};
	
<#if Parameters?? && !(Parameters.pageType?? && Parameters.pageType == 'ref')>
	
	MESBasic_prodAttribute_prodAttribute_prodAtrrTree_treeOnclick = function(event,treeId,node){
		var layout = MESBasic_prodAttribute_prodAttribute_prodAtrrTree_getLayout();
		layout.refresh(node);
	}
	
	MESBasic_prodAttribute_prodAttribute_prodAtrrTree_treeDbOnclick = function(event,treeId,node){
	}
	
	MESBasic_prodAttribute_prodAttribute_prodAtrrTree_treeBeforeDrag = function(treeId,node){
	}
	
	MESBasic_prodAttribute_prodAttribute_prodAtrrTree_treeAfterDrop = function(treeId, treeNodes, targetNode, moveType, isCopy){
	}
	
	MESBasic_prodAttribute_prodAttribute_prodAtrrTree_drag = function(event, treeId, treeNodes){
		
	}
	
	/*
	MESBasic_prodAttribute_prodAttribute_prodAtrrTree_beforeDrop = function(treeId, treeNodes, targetNode, moveType, isCopy){
		
	}
	*/
	
	MESBasic_prodAttribute_prodAttribute_prodAtrrTree_drop = function(event, treeId, treeNodes, targetNode, moveType, isCopy){
		
	}
	
	MESBasic_prodAttribute_prodAttribute_prodAtrrTree_getNode = function(){
		return MESBasic_prodAttribute_prodAttribute_prodAtrrTree_tree.getSelectedNodes();
	}
	
	MESBasic_prodAttribute_prodAttribute_prodAtrrTree_refreshNodeId = function(node, operate){
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
	
	
	MESBasic_prodAttribute_prodAttribute_prodAtrrTree_refreshRootNode = function(){
		var rootNode = MESBasic_prodAttribute_prodAttribute_prodAtrrTree_tree.getNodeByParam( "id", -1 );
		MESBasic_prodAttribute_prodAttribute_prodAtrrTree_tree.reAsyncChildNodes( rootNode, "refresh" );
		MESBasic_prodAttribute_prodAttribute_prodAtrrTree_tree.selectNode( rootNode )
		$("#" + rootNode.tId + "_a").trigger('click');
	}
	
	MESBasic_prodAttribute_prodAttribute_prodAtrrTree_refresh = function(nodeId, data){		
		var node = MESBasic_prodAttribute_prodAttribute_prodAtrrTree_tree.getNodeByParam("id", nodeId ? nodeId : -1);
		if (node.id !== -1) {
            if (typeof data === 'object') {
                if (data.operate == 'delete' || data.operate == 'edit') {
                    node = node.getParentNode();// 修改删除去父级元素
                }
            }
        }
		if(node && node.isParent == false) {
			node.isParent = true;
		}
		MESBasic_prodAttribute_prodAttribute_prodAtrrTree_tree.setting.callback.customOnAsyncSuccessMethod = function(event, treeId, treeNode, msg){
			if(treeNode && treeNode.children.length == 0) {
				treeNode.isParent = false;
				MESBasic_prodAttribute_prodAttribute_prodAtrrTree_tree.updateNode(treeNode);
			}
			var layout = MESBasic_prodAttribute_prodAttribute_prodAtrrTree_getLayout();
			var checkNode = layout.node;
			if(checkNode != null){
				checkNode = MESBasic_prodAttribute_prodAttribute_prodAtrrTree_tree.getNodeByParam("id", checkNode.id);
				if (!checkNode) {// 删除情况，从根节点刷新
                    checkNode = MESBasic_prodAttribute_prodAttribute_prodAtrrTree_tree.getNodeByParam("id", -1)                    				    
                }
				$("#" + checkNode.tId + "_a").trigger('click');
			} 
		}
		MESBasic_prodAttribute_prodAttribute_prodAtrrTree_tree.reAsyncChildNodes(node,"refresh");
	}
	
				
	MESBasic.prodAttribute.prodAttribute.prodAtrrTree.checkSelectedAny = function(){
		var nodes = MESBasic_prodAttribute_prodAttribute_prodAtrrTree_tree.getSelectedNodes();
		if(nodes.length > 0){
			return true;
		}else{
			CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
			return false;
		}
	}
	
	MESBasic.prodAttribute.prodAttribute.prodAtrrTree.checkTreeRoot = function(){
		var nodes = MESBasic_prodAttribute_prodAttribute_prodAtrrTree_tree.getSelectedNodes();
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
	
	
	
	MESBasic.prodAttribute.prodAttribute.prodAtrrTree.isTreeRoot = function(){
		var nodes = MESBasic_prodAttribute_prodAttribute_prodAtrrTree_tree.getSelectedNodes();
		var node = nodes[0];
		if(node.level == 0){
			return true;
		} else {
			return false;
		}
		
	}
	
	MESBasic.prodAttribute.prodAttribute.prodAtrrTree.showDialog = function(url,formId,title,dialogType,buttonCode) {
		var buttons = [];
		buttons.push({	
				name:"${getText('common.button.save')}",
				handler:function(){
					CUI('#'+formId).submit();
				}
			});
		buttons.push({
				name:"${getText('foundation.common.closed')}",
				type:"cancel"
			});
		MESBasic.prodAttribute.prodAttribute.prodAtrrTree.Dlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			type : dialogType,
			//type : otherParams.dialogType,
			leaveConfirm : true,
			buttons:buttons
		});
		MESBasic.prodAttribute.prodAttribute.prodAtrrTree.Dlg.show();
	};
	
	MESBasic.prodAttribute.prodAttribute.prodAtrrTree.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('MESBasic_prodAttribute_prodAttribute_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.deleteandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{MESBasic.prodAttribute.prodAttribute.prodAtrrTree.Dlg.close();closeLoadPanel();}catch(e){}
				var layout = MESBasic_prodAttribute_prodAttribute_prodAtrrTree_getLayout();
				var node = layout.getNode();
				MESBasic_prodAttribute_prodAttribute_prodAtrrTree_refresh(null == node ? -1 : node.id,  {operate: res.operate});
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	(function(){
		if($('#prodAtrrTree_opratebar').length > 0){
			$('#prodAtrrTree_buttonbar').append($('#prodAtrrTree_opratebar'));
		}
		if($('#prodAtrrTree_opratebar').children().length == 0){
			$('#prodAtrrTree_opratebar').hide();
		}
	})();
	
<#else>
	MESBasic.prodAttribute.prodAttribute.prodAtrrTree.getSelectedNodes = function(callBack){
		var nodes = MESBasic_prodAttribute_prodAttribute_prodAtrrTree_tree.getCheckedNodes();
		eval(callBack+"(nodes)");
	}
</#if>

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.prodAttribute.prodAttribute.prodAtrrTree.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_prodAttribute_prodAttribute_prodAtrrTree_fileupload_button",
		handler:function(){
			if($('#MESBasic_prodAttribute_prodAttribute_prodAtrrTree_fileupload').length == 0) {
				$('body').append('<div id="MESBasic_prodAttribute_prodAttribute_prodAtrrTree_fileupload"></div>');
			}
			MESBasic.prodAttribute.prodAttribute.prodAtrrTree.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "MESBasic_prodAttribute_prodAttribute_prodAtrrTree_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#MESBasic_prodAttribute_prodAttribute_prodAtrrTree_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			MESBasic.prodAttribute.prodAttribute.prodAtrrTree.infoDialog.show();
			if($('#MESBasic_prodAttribute_prodAttribute_prodAtrrTree_fileupload').html() == '') {
				$('#MESBasic_prodAttribute_prodAttribute_prodAtrrTree_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=MESBasic_prodAttribute_prodAttribute&entityCode=MESBasic_1_prodAttribute&dialogId="+dialogId);
			}
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.prodAttribute.prodAttribute.prodAtrrTree.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_prodAttribute_prodAtrrTree.MESBasic.prodAttribute.prodAttribute." + params.viewName + ".referenceCopy");
			funcName('prodAttribute', params.referenceUrl, this);
		}
	}
};
</script>
