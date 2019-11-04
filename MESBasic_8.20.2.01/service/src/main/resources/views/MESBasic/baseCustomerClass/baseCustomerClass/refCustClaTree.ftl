<#if Parameters?? && (Parameters.pageType?? && Parameters.pageType == 'ref')>
<#assign selectedMultiEnable=true>
<#assign checkboxEnable=true>
<#assign callback="{}">
<#else>
<#assign callback="{onDrop:function(event, treeId, treeNodes, targetNode, moveType, isCop){MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_drop(event, treeId, treeNodes, targetNode, moveType, isCop);}, onDrag:function(event, treeId, treeNodes){MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_drag(event, treeId, treeNodes);}, beforeDragOpen:function(treeId, treeNode){return false;}, beforeDrag:function(treeId, treeNodes){return false;}, onClick:function(event,treeId,node){MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_treeOnclick(event,treeId,node);}, onDblClick:function(event,treeId,node){MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_treeDbOnclick(event,treeId,node);}}">
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
<div id="refCustClaTree_div" style="overflow:scroll;">
</#if>
<@tree movUrl="/MESBasic/baseCustomerClass/baseCustomerClass/refCustClaTreeDrag.action?${getPowerCode('${layoutViewCode!}refCustClaTree_move_MESBasic_1_baseCustomerClass_refCustClaTree')}" id="MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_tree" dataUrl="/MESBasic/baseCustomerClass/baseCustomerClass/refCustClaTreeData.action?${layoutParams}" rootName="${getText('MESBasic.baseCustomerClass_refCustClaTree.treeRootName')}" nameCol="ccName"
			 callback="${callback}" selectedMultiEnable=selectedMultiEnable checkboxEnable=checkboxEnable  canMemory=false />
<#if Parameters?? && (Parameters.pageType?? && Parameters.pageType == 'ref')>
</div>
<script type="text/javascript">
	$(function(){
		var height = $('#refCustClaTree_div').parent().height();
		$('#refCustClaTree_div').css('height', height);
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
<div id="refCustClaTree_sort_div" style="display: none;"> 	
	<div style="position:absolute;left:0px;top:0px;overflow:auto;height:86.5%;;width:75%;display:inline-block;">
		<div id="refCustClaTree_scroll_div" style="margin-left:10px;margin-top:20px;overflow-y:auto;clear:both;height:82%">
		<table cellpadding="0" id="refCustClaTree_fastColTable" style="font-size:12px;width:96%;" cellspacing="0" align="center" class="infoTable">
			<tbody id="refCustClaTree_sort_table">
				
			</tbody>
		</table>
		</div>
	</div>
	<div id="refCustClaTree_fastContent" style="background-color:#f8f6f7;position:absolute;right:0px;top:0px;width:25%;border: 1px solid #efefef; height: 99%;">
		<div class="ec-list-btndiv"><div id="refCustClaTree_first" class="ec-list-topbtn" onclick="MESBasic.baseCustomerClass.baseCustomerClass.refCustClaTree.firstRow()"></div></div>
		<div class="ec-list-btndiv"><div id="refCustClaTree_up" class="ec-list-prevbtn" onclick="MESBasic.baseCustomerClass.baseCustomerClass.refCustClaTree.upRow()"></div></div>
		<div class="ec-list-btndiv"><div id="refCustClaTree_down" class="ec-list-nextbtn" onclick="MESBasic.baseCustomerClass.baseCustomerClass.refCustClaTree.downRow()"></div></div>
		<div class="ec-list-btndiv"><div id="refCustClaTree_last" class="ec-list-lastbtn" onclick="MESBasic.baseCustomerClass.baseCustomerClass.refCustClaTree.lastRow()"></div></div>
	</div>
</div>
<#if Parameters?? && !(Parameters.pageType?? && Parameters.pageType == 'ref')>
</#if>	


<script type="text/javascript">
CUI.ns("MESBasic.baseCustomerClass.baseCustomerClass.refCustClaTree");

	MESBasic.baseCustomerClass.baseCustomerClass.refCustClaTree.cancelSelectedNode = function(parentRes){
		var layout = MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_getLayout();
		var ns = layout.getList();
		if(ns) {
			ns = eval(ns);
			ns.node = null;
		}
		MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_tree.cancelSelectedNode();
	};
	
	MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_cancelSelectedNode = function(parentRes){
		var layout = MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_getLayout();
		var ns = layout.getList();
		if(ns) {
			ns = eval(ns);
			ns.node = null;
		}
		MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_tree.cancelSelectedNode();
	};
	
<#if Parameters?? && !(Parameters.pageType?? && Parameters.pageType == 'ref')>
	
	MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_treeOnclick = function(event,treeId,node){
		var layout = MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_getLayout();
		layout.refresh(node);
	}
	
	MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_treeDbOnclick = function(event,treeId,node){
	}
	
	MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_treeBeforeDrag = function(treeId,node){
	}
	
	MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_treeAfterDrop = function(treeId, treeNodes, targetNode, moveType, isCopy){
	}
	
	MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_drag = function(event, treeId, treeNodes){
		
	}
	
	/*
	MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_beforeDrop = function(treeId, treeNodes, targetNode, moveType, isCopy){
		
	}
	*/
	
	MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_drop = function(event, treeId, treeNodes, targetNode, moveType, isCopy){
		
	}
	
	MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_getNode = function(){
		return MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_tree.getSelectedNodes();
	}
	
	MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_refreshNodeId = function(node, operate){
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
	
	
	MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_refreshRootNode = function(){
		var rootNode = MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_tree.getNodeByParam( "id", -1 );
		MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_tree.reAsyncChildNodes( rootNode, "refresh" );
		MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_tree.selectNode( rootNode )
		$("#" + rootNode.tId + "_a").trigger('click');
	}
	
	MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_refresh = function(nodeId, data){		
		var node = MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_tree.getNodeByParam("id", nodeId ? nodeId : -1);
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
		MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_tree.setting.callback.customOnAsyncSuccessMethod = function(event, treeId, treeNode, msg){
			if(treeNode && treeNode.children.length == 0) {
				treeNode.isParent = false;
				MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_tree.updateNode(treeNode);
			}
			var layout = MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_getLayout();
			var checkNode = layout.node;
			if(checkNode != null){
				checkNode = MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_tree.getNodeByParam("id", checkNode.id);
				if (!checkNode) {// 删除情况，从根节点刷新
                    checkNode = MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_tree.getNodeByParam("id", -1)                    				    
                }
				$("#" + checkNode.tId + "_a").trigger('click');
			} 
		}
		MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_tree.reAsyncChildNodes(node,"refresh");
	}
	
				
	MESBasic.baseCustomerClass.baseCustomerClass.refCustClaTree.checkSelectedAny = function(){
		var nodes = MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_tree.getSelectedNodes();
		if(nodes.length > 0){
			return true;
		}else{
			CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
			return false;
		}
	}
	
	MESBasic.baseCustomerClass.baseCustomerClass.refCustClaTree.checkTreeRoot = function(){
		var nodes = MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_tree.getSelectedNodes();
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
	
	
	
	MESBasic.baseCustomerClass.baseCustomerClass.refCustClaTree.isTreeRoot = function(){
		var nodes = MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_tree.getSelectedNodes();
		var node = nodes[0];
		if(node.level == 0){
			return true;
		} else {
			return false;
		}
		
	}
	
	MESBasic.baseCustomerClass.baseCustomerClass.refCustClaTree.showDialog = function(url,formId,title,dialogType,buttonCode) {
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
		MESBasic.baseCustomerClass.baseCustomerClass.refCustClaTree.Dlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			type : dialogType,
			//type : otherParams.dialogType,
			leaveConfirm : true,
			buttons:buttons
		});
		MESBasic.baseCustomerClass.baseCustomerClass.refCustClaTree.Dlg.show();
	};
	
	MESBasic.baseCustomerClass.baseCustomerClass.refCustClaTree.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('MESBasic_baseCustomerClass_baseCustomerClass_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.deleteandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{MESBasic.baseCustomerClass.baseCustomerClass.refCustClaTree.Dlg.close();closeLoadPanel();}catch(e){}
				var layout = MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_getLayout();
				var node = layout.getNode();
				MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_refresh(null == node ? -1 : node.id,  {operate: res.operate});
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	(function(){
		if($('#refCustClaTree_opratebar').length > 0){
			$('#refCustClaTree_buttonbar').append($('#refCustClaTree_opratebar'));
		}
		if($('#refCustClaTree_opratebar').children().length == 0){
			$('#refCustClaTree_opratebar').hide();
		}
	})();
	
<#else>
	MESBasic.baseCustomerClass.baseCustomerClass.refCustClaTree.getSelectedNodes = function(callBack){
		var nodes = MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_tree.getCheckedNodes();
		eval(callBack+"(nodes)");
	}
</#if>

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.baseCustomerClass.baseCustomerClass.refCustClaTree.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_fileupload_button",
		handler:function(){
			if($('#MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_fileupload').length == 0) {
				$('body').append('<div id="MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_fileupload"></div>');
			}
			MESBasic.baseCustomerClass.baseCustomerClass.refCustClaTree.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			MESBasic.baseCustomerClass.baseCustomerClass.refCustClaTree.infoDialog.show();
			if($('#MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_fileupload').html() == '') {
				$('#MESBasic_baseCustomerClass_baseCustomerClass_refCustClaTree_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=MESBasic_baseCustomerClass_baseCustomerClass&entityCode=MESBasic_1_baseCustomerClass&dialogId="+dialogId);
			}
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.baseCustomerClass.baseCustomerClass.refCustClaTree.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_baseCustomerClass_refCustClaTree.MESBasic.baseCustomerClass.baseCustomerClass." + params.viewName + ".referenceCopy");
			funcName('baseCustomerClass', params.referenceUrl, this);
		}
	}
};
</script>
