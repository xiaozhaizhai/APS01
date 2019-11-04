<#if Parameters?? && (Parameters.pageType?? && Parameters.pageType == 'ref')>
<#assign selectedMultiEnable=true>
<#assign checkboxEnable=true>
<#assign callback="{}">
<#else>
<#assign callback="{onDrop:function(event, treeId, treeNodes, targetNode, moveType, isCop){MESBasic_eamType_eamType_typeTree_drop(event, treeId, treeNodes, targetNode, moveType, isCop);}, onDrag:function(event, treeId, treeNodes){MESBasic_eamType_eamType_typeTree_drag(event, treeId, treeNodes);}, beforeDragOpen:function(treeId, treeNode){return false;}, beforeDrag:function(treeId, treeNodes){return false;}, onClick:function(event,treeId,node){MESBasic_eamType_eamType_typeTree_treeOnclick(event,treeId,node);}, onDblClick:function(event,treeId,node){MESBasic_eamType_eamType_typeTree_treeDbOnclick(event,treeId,node);}}">
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
<div id="typeTree_div" style="overflow:scroll;">
</#if>
<@tree movUrl="/MESBasic/eamType/eamType/typeTreeDrag.action?${getPowerCode('${layoutViewCode!}typeTree_move_MESBasic_1_eamType_typeTree')}" id="MESBasic_eamType_eamType_typeTree_tree" dataUrl="/MESBasic/eamType/eamType/typeTreeData.action?${layoutParams}" rootName="${getText('MESBasic_1_eamType_typeTree.treeRootName')}" nameCol="name"
			 callback="${callback}" selectedMultiEnable=selectedMultiEnable checkboxEnable=checkboxEnable  canMemory=false />
<#if Parameters?? && (Parameters.pageType?? && Parameters.pageType == 'ref')>
</div>
<script type="text/javascript">
	$(function(){
		var height = $('#typeTree_div').parent().height();
		$('#typeTree_div').css('height', height);
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
<div id="typeTree_sort_div" style="display: none;"> 	
	<div style="position:absolute;left:0px;top:0px;overflow:auto;height:86.5%;;width:75%;display:inline-block;">
		<div id="typeTree_scroll_div" style="margin-left:10px;margin-top:20px;overflow-y:auto;clear:both;height:82%">
		<table cellpadding="0" id="typeTree_fastColTable" style="font-size:12px;width:96%;" cellspacing="0" align="center" class="infoTable">
			<tbody id="typeTree_sort_table">
				
			</tbody>
		</table>
		</div>
	</div>
	<div id="typeTree_fastContent" style="background-color:#f8f6f7;position:absolute;right:0px;top:0px;width:25%;border: 1px solid #efefef; height: 99%;">
		<div class="ec-list-btndiv"><div id="typeTree_first" class="ec-list-topbtn" onclick="MESBasic.eamType.eamType.typeTree.firstRow()"></div></div>
		<div class="ec-list-btndiv"><div id="typeTree_up" class="ec-list-prevbtn" onclick="MESBasic.eamType.eamType.typeTree.upRow()"></div></div>
		<div class="ec-list-btndiv"><div id="typeTree_down" class="ec-list-nextbtn" onclick="MESBasic.eamType.eamType.typeTree.downRow()"></div></div>
		<div class="ec-list-btndiv"><div id="typeTree_last" class="ec-list-lastbtn" onclick="MESBasic.eamType.eamType.typeTree.lastRow()"></div></div>
	</div>
</div>
<#if Parameters?? && !(Parameters.pageType?? && Parameters.pageType == 'ref')>
			<div id="typeTree_opratebar" class="opratebar">
			</div>
</#if>	


<script type="text/javascript">
CUI.ns("MESBasic.eamType.eamType.typeTree");

	MESBasic.eamType.eamType.typeTree.cancelSelectedNode = function(parentRes){
		var layout = MESBasic_eamType_eamType_typeTree_getLayout();
		var ns = layout.getList();
		if(ns) {
			ns = eval(ns);
			ns.node = null;
		}
		MESBasic_eamType_eamType_typeTree_tree.cancelSelectedNode();
	};
	
	MESBasic_eamType_eamType_typeTree_cancelSelectedNode = function(parentRes){
		var layout = MESBasic_eamType_eamType_typeTree_getLayout();
		var ns = layout.getList();
		if(ns) {
			ns = eval(ns);
			ns.node = null;
		}
		MESBasic_eamType_eamType_typeTree_tree.cancelSelectedNode();
	};
	
<#if Parameters?? && !(Parameters.pageType?? && Parameters.pageType == 'ref')>
	
	MESBasic_eamType_eamType_typeTree_treeOnclick = function(event,treeId,node){
		var layout = MESBasic_eamType_eamType_typeTree_getLayout();
		layout.refresh(node);
	}
	
	MESBasic_eamType_eamType_typeTree_treeDbOnclick = function(event,treeId,node){
	}
	
	MESBasic_eamType_eamType_typeTree_treeBeforeDrag = function(treeId,node){
	}
	
	MESBasic_eamType_eamType_typeTree_treeAfterDrop = function(treeId, treeNodes, targetNode, moveType, isCopy){
	}
	
	MESBasic_eamType_eamType_typeTree_drag = function(event, treeId, treeNodes){
		
	}
	
	/*
	MESBasic_eamType_eamType_typeTree_beforeDrop = function(treeId, treeNodes, targetNode, moveType, isCopy){
		
	}
	*/
	
	MESBasic_eamType_eamType_typeTree_drop = function(event, treeId, treeNodes, targetNode, moveType, isCopy){
		
	}
	
	MESBasic_eamType_eamType_typeTree_getNode = function(){
		return MESBasic_eamType_eamType_typeTree_tree.getSelectedNodes();
	}
	
	MESBasic_eamType_eamType_typeTree_refreshNodeId = function(node, operate){
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
	
	
	MESBasic_eamType_eamType_typeTree_refreshRootNode = function(){
		var rootNode = MESBasic_eamType_eamType_typeTree_tree.getNodeByParam( "id", -1 );
		MESBasic_eamType_eamType_typeTree_tree.reAsyncChildNodes( rootNode, "refresh" );
		MESBasic_eamType_eamType_typeTree_tree.selectNode( rootNode )
		$("#" + rootNode.tId + "_a").trigger('click');
	}
	
	MESBasic_eamType_eamType_typeTree_refresh = function(nodeId, data){		
		var node = MESBasic_eamType_eamType_typeTree_tree.getNodeByParam("id", nodeId ? nodeId : -1);
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
		MESBasic_eamType_eamType_typeTree_tree.setting.callback.customOnAsyncSuccessMethod = function(event, treeId, treeNode, msg){
			if(treeNode && treeNode.children.length == 0) {
				treeNode.isParent = false;
				MESBasic_eamType_eamType_typeTree_tree.updateNode(treeNode);
			}
			var layout = MESBasic_eamType_eamType_typeTree_getLayout();
			var checkNode = layout.node;
			if(checkNode != null){
				checkNode = MESBasic_eamType_eamType_typeTree_tree.getNodeByParam("id", checkNode.id);
				if (!checkNode) {// 删除情况，从根节点刷新
                    checkNode = MESBasic_eamType_eamType_typeTree_tree.getNodeByParam("id", -1)                    				    
                }
				$("#" + checkNode.tId + "_a").trigger('click');
			} 
		}
		MESBasic_eamType_eamType_typeTree_tree.reAsyncChildNodes(node,"refresh");
	}
	
				
	MESBasic.eamType.eamType.typeTree.checkSelectedAny = function(){
		var nodes = MESBasic_eamType_eamType_typeTree_tree.getSelectedNodes();
		if(nodes.length > 0){
			return true;
		}else{
			CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
			return false;
		}
	}
	
	MESBasic.eamType.eamType.typeTree.checkTreeRoot = function(){
		var nodes = MESBasic_eamType_eamType_typeTree_tree.getSelectedNodes();
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
	
	
	
	MESBasic.eamType.eamType.typeTree.isTreeRoot = function(){
		var nodes = MESBasic_eamType_eamType_typeTree_tree.getSelectedNodes();
		var node = nodes[0];
		if(node.level == 0){
			return true;
		} else {
			return false;
		}
		
	}
	
	MESBasic.eamType.eamType.typeTree.showDialog = function(url,formId,title,dialogType,buttonCode) {
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
		MESBasic.eamType.eamType.typeTree.Dlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			type : dialogType,
			//type : otherParams.dialogType,
			leaveConfirm : true,
			buttons:buttons
		});
		MESBasic.eamType.eamType.typeTree.Dlg.show();
	};
	
	MESBasic.eamType.eamType.typeTree.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('MESBasic_eamType_eamType_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.deleteandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{MESBasic.eamType.eamType.typeTree.Dlg.close();closeLoadPanel();}catch(e){}
				var layout = MESBasic_eamType_eamType_typeTree_getLayout();
				var node = layout.getNode();
				MESBasic_eamType_eamType_typeTree_refresh(null == node ? -1 : node.id,  {operate: res.operate});
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	(function(){
		if($('#typeTree_opratebar').length > 0){
			$('#typeTree_buttonbar').append($('#typeTree_opratebar'));
		}
		if($('#typeTree_opratebar').children().length == 0){
			$('#typeTree_opratebar').hide();
		}
	})();
	
<#else>
	MESBasic.eamType.eamType.typeTree.getSelectedNodes = function(callBack){
		var nodes = MESBasic_eamType_eamType_typeTree_tree.getCheckedNodes();
		eval(callBack+"(nodes)");
	}
</#if>

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.eamType.eamType.typeTree.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_eamType_eamType_typeTree_fileupload_button",
		handler:function(){
			if($('#MESBasic_eamType_eamType_typeTree_fileupload').length == 0) {
				$('body').append('<div id="MESBasic_eamType_eamType_typeTree_fileupload"></div>');
			}
			MESBasic.eamType.eamType.typeTree.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "MESBasic_eamType_eamType_typeTree_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#MESBasic_eamType_eamType_typeTree_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			MESBasic.eamType.eamType.typeTree.infoDialog.show();
			if($('#MESBasic_eamType_eamType_typeTree_fileupload').html() == '') {
				$('#MESBasic_eamType_eamType_typeTree_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=MESBasic_eamType_eamType&entityCode=MESBasic_1_eamType&dialogId="+dialogId);
			}
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.eamType.eamType.typeTree.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_eamType_typeTree.MESBasic.eamType.eamType." + params.viewName + ".referenceCopy");
			funcName('eamType', params.referenceUrl, this);
		}
	}
};
</script>
