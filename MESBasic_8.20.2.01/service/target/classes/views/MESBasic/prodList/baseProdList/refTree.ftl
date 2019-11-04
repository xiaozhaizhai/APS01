<#if Parameters?? && (Parameters.pageType?? && Parameters.pageType == 'ref')>
<#assign selectedMultiEnable=true>
<#assign checkboxEnable=true>
<#assign callback="{}">
<#else>
<#assign callback="{onDrop:function(event, treeId, treeNodes, targetNode, moveType, isCop){MESBasic_prodList_baseProdList_refTree_drop(event, treeId, treeNodes, targetNode, moveType, isCop);}, onDrag:function(event, treeId, treeNodes){MESBasic_prodList_baseProdList_refTree_drag(event, treeId, treeNodes);}, beforeDragOpen:function(treeId, treeNode){return false;}, beforeDrag:function(treeId, treeNodes){return false;}, onClick:function(event,treeId,node){MESBasic_prodList_baseProdList_refTree_treeOnclick(event,treeId,node);}, onDblClick:function(event,treeId,node){MESBasic_prodList_baseProdList_refTree_treeDbOnclick(event,treeId,node);}}">
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
<div id="refTree_div" style="overflow:scroll;">
</#if>
<@tree movUrl="/MESBasic/prodList/baseProdList/refTreeDrag.action?${getPowerCode('${layoutViewCode!}refTree_move_MESBasic_1_prodList_refTree')}" id="MESBasic_prodList_baseProdList_refTree_tree" dataUrl="/MESBasic/prodList/baseProdList/refTreeData.action?${layoutParams}" rootName="${getText('MESBasic.entityname.randon1450077412035')}" nameCol="prodListName"
			 callback="${callback}" selectedMultiEnable=selectedMultiEnable checkboxEnable=checkboxEnable  canMemory=false />
<#if Parameters?? && (Parameters.pageType?? && Parameters.pageType == 'ref')>
</div>
<script type="text/javascript">
	$(function(){
		var height = $('#refTree_div').parent().height();
		$('#refTree_div').css('height', height);
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
<div id="refTree_sort_div" style="display: none;"> 	
	<div style="position:absolute;left:0px;top:0px;overflow:auto;height:86.5%;;width:75%;display:inline-block;">
		<div id="refTree_scroll_div" style="margin-left:10px;margin-top:20px;overflow-y:auto;clear:both;height:82%">
		<table cellpadding="0" id="refTree_fastColTable" style="font-size:12px;width:96%;" cellspacing="0" align="center" class="infoTable">
			<tbody id="refTree_sort_table">
				
			</tbody>
		</table>
		</div>
	</div>
	<div id="refTree_fastContent" style="background-color:#f8f6f7;position:absolute;right:0px;top:0px;width:25%;border: 1px solid #efefef; height: 99%;">
		<div class="ec-list-btndiv"><div id="refTree_first" class="ec-list-topbtn" onclick="MESBasic.prodList.baseProdList.refTree.firstRow()"></div></div>
		<div class="ec-list-btndiv"><div id="refTree_up" class="ec-list-prevbtn" onclick="MESBasic.prodList.baseProdList.refTree.upRow()"></div></div>
		<div class="ec-list-btndiv"><div id="refTree_down" class="ec-list-nextbtn" onclick="MESBasic.prodList.baseProdList.refTree.downRow()"></div></div>
		<div class="ec-list-btndiv"><div id="refTree_last" class="ec-list-lastbtn" onclick="MESBasic.prodList.baseProdList.refTree.lastRow()"></div></div>
	</div>
</div>
<#if Parameters?? && !(Parameters.pageType?? && Parameters.pageType == 'ref')>
</#if>	


<script type="text/javascript">
CUI.ns("MESBasic.prodList.baseProdList.refTree");

	MESBasic.prodList.baseProdList.refTree.cancelSelectedNode = function(parentRes){
		var layout = MESBasic_prodList_baseProdList_refTree_getLayout();
		var ns = layout.getList();
		if(ns) {
			ns = eval(ns);
			ns.node = null;
		}
		MESBasic_prodList_baseProdList_refTree_tree.cancelSelectedNode();
	};
	
	MESBasic_prodList_baseProdList_refTree_cancelSelectedNode = function(parentRes){
		var layout = MESBasic_prodList_baseProdList_refTree_getLayout();
		var ns = layout.getList();
		if(ns) {
			ns = eval(ns);
			ns.node = null;
		}
		MESBasic_prodList_baseProdList_refTree_tree.cancelSelectedNode();
	};
	
<#if Parameters?? && !(Parameters.pageType?? && Parameters.pageType == 'ref')>
	
	MESBasic_prodList_baseProdList_refTree_treeOnclick = function(event,treeId,node){
		var layout = MESBasic_prodList_baseProdList_refTree_getLayout();
		layout.refresh(node);
	}
	
	MESBasic_prodList_baseProdList_refTree_treeDbOnclick = function(event,treeId,node){
	}
	
	MESBasic_prodList_baseProdList_refTree_treeBeforeDrag = function(treeId,node){
	}
	
	MESBasic_prodList_baseProdList_refTree_treeAfterDrop = function(treeId, treeNodes, targetNode, moveType, isCopy){
	}
	
	MESBasic_prodList_baseProdList_refTree_drag = function(event, treeId, treeNodes){
		
	}
	
	/*
	MESBasic_prodList_baseProdList_refTree_beforeDrop = function(treeId, treeNodes, targetNode, moveType, isCopy){
		
	}
	*/
	
	MESBasic_prodList_baseProdList_refTree_drop = function(event, treeId, treeNodes, targetNode, moveType, isCopy){
		
	}
	
	MESBasic_prodList_baseProdList_refTree_getNode = function(){
		return MESBasic_prodList_baseProdList_refTree_tree.getSelectedNodes();
	}
	
	MESBasic_prodList_baseProdList_refTree_refreshNodeId = function(node, operate){
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
	
	
	MESBasic_prodList_baseProdList_refTree_refreshRootNode = function(){
		var rootNode = MESBasic_prodList_baseProdList_refTree_tree.getNodeByParam( "id", -1 );
		MESBasic_prodList_baseProdList_refTree_tree.reAsyncChildNodes( rootNode, "refresh" );
		MESBasic_prodList_baseProdList_refTree_tree.selectNode( rootNode )
		$("#" + rootNode.tId + "_a").trigger('click');
	}
	
	MESBasic_prodList_baseProdList_refTree_refresh = function(nodeId, data){		
		var node = MESBasic_prodList_baseProdList_refTree_tree.getNodeByParam("id", nodeId ? nodeId : -1);
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
		MESBasic_prodList_baseProdList_refTree_tree.setting.callback.customOnAsyncSuccessMethod = function(event, treeId, treeNode, msg){
			if(treeNode && treeNode.children.length == 0) {
				treeNode.isParent = false;
				MESBasic_prodList_baseProdList_refTree_tree.updateNode(treeNode);
			}
			var layout = MESBasic_prodList_baseProdList_refTree_getLayout();
			var checkNode = layout.node;
			if(checkNode != null){
				checkNode = MESBasic_prodList_baseProdList_refTree_tree.getNodeByParam("id", checkNode.id);
				if (!checkNode) {// 删除情况，从根节点刷新
                    checkNode = MESBasic_prodList_baseProdList_refTree_tree.getNodeByParam("id", -1)                    				    
                }
				$("#" + checkNode.tId + "_a").trigger('click');
			} 
		}
		MESBasic_prodList_baseProdList_refTree_tree.reAsyncChildNodes(node,"refresh");
	}
	
				
	MESBasic.prodList.baseProdList.refTree.checkSelectedAny = function(){
		var nodes = MESBasic_prodList_baseProdList_refTree_tree.getSelectedNodes();
		if(nodes.length > 0){
			return true;
		}else{
			CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
			return false;
		}
	}
	
	MESBasic.prodList.baseProdList.refTree.checkTreeRoot = function(){
		var nodes = MESBasic_prodList_baseProdList_refTree_tree.getSelectedNodes();
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
	
	
	
	MESBasic.prodList.baseProdList.refTree.isTreeRoot = function(){
		var nodes = MESBasic_prodList_baseProdList_refTree_tree.getSelectedNodes();
		var node = nodes[0];
		if(node.level == 0){
			return true;
		} else {
			return false;
		}
		
	}
	
	MESBasic.prodList.baseProdList.refTree.showDialog = function(url,formId,title,dialogType,buttonCode) {
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
		MESBasic.prodList.baseProdList.refTree.Dlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			type : dialogType,
			//type : otherParams.dialogType,
			leaveConfirm : true,
			buttons:buttons
		});
		MESBasic.prodList.baseProdList.refTree.Dlg.show();
	};
	
	MESBasic.prodList.baseProdList.refTree.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('MESBasic_prodList_baseProdList_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.deleteandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{MESBasic.prodList.baseProdList.refTree.Dlg.close();closeLoadPanel();}catch(e){}
				var layout = MESBasic_prodList_baseProdList_refTree_getLayout();
				var node = layout.getNode();
				MESBasic_prodList_baseProdList_refTree_refresh(null == node ? -1 : node.id,  {operate: res.operate});
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	(function(){
		if($('#refTree_opratebar').length > 0){
			$('#refTree_buttonbar').append($('#refTree_opratebar'));
		}
		if($('#refTree_opratebar').children().length == 0){
			$('#refTree_opratebar').hide();
		}
	})();
	
<#else>
	MESBasic.prodList.baseProdList.refTree.getSelectedNodes = function(callBack){
		var nodes = MESBasic_prodList_baseProdList_refTree_tree.getCheckedNodes();
		eval(callBack+"(nodes)");
	}
</#if>

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.prodList.baseProdList.refTree.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_prodList_baseProdList_refTree_fileupload_button",
		handler:function(){
			if($('#MESBasic_prodList_baseProdList_refTree_fileupload').length == 0) {
				$('body').append('<div id="MESBasic_prodList_baseProdList_refTree_fileupload"></div>');
			}
			MESBasic.prodList.baseProdList.refTree.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "MESBasic_prodList_baseProdList_refTree_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#MESBasic_prodList_baseProdList_refTree_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			MESBasic.prodList.baseProdList.refTree.infoDialog.show();
			if($('#MESBasic_prodList_baseProdList_refTree_fileupload').html() == '') {
				$('#MESBasic_prodList_baseProdList_refTree_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=MESBasic_prodList_baseProdList&entityCode=MESBasic_1_prodList&dialogId="+dialogId);
			}
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.prodList.baseProdList.refTree.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_prodList_refTree.MESBasic.prodList.baseProdList." + params.viewName + ".referenceCopy");
			funcName('baseProdList', params.referenceUrl, this);
		}
	}
};
</script>
