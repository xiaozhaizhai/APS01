<#if Parameters?? && (Parameters.pageType?? && Parameters.pageType == 'ref')>
<#assign selectedMultiEnable=true>
<#assign checkboxEnable=true>
<#assign callback="{}">
<#else>
<#assign callback="{onDrop:function(event, treeId, treeNodes, targetNode, moveType, isCop){RM_formulaType_formulaType_typeTree_drop(event, treeId, treeNodes, targetNode, moveType, isCop);}, onDrag:function(event, treeId, treeNodes){RM_formulaType_formulaType_typeTree_drag(event, treeId, treeNodes);}, beforeDragOpen:function(treeId, treeNode){return false;}, beforeDrag:function(treeId, treeNodes){return false;}, onClick:function(event,treeId,node){RM_formulaType_formulaType_typeTree_treeOnclick(event,treeId,node);}, onDblClick:function(event,treeId,node){RM_formulaType_formulaType_typeTree_treeDbOnclick(event,treeId,node);}}">
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
<@tree movUrl="/RM/formulaType/formulaType/typeTreeDrag.action?${getPowerCode('${layoutViewCode!}typeTree_move_RM_7.5.0.0_formulaType_typeTree')}" id="RM_formulaType_formulaType_typeTree_tree" dataUrl="/RM/formulaType/formulaType/typeTreeData.action?${layoutParams}" rootName="${getText('RM_7.5.0.0_formulaType_typeTree.treeRootName')}" nameCol="name"
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
		<div class="ec-list-btndiv"><div id="typeTree_first" class="ec-list-topbtn" onclick="RM.formulaType.formulaType.typeTree.firstRow()"></div></div>
		<div class="ec-list-btndiv"><div id="typeTree_up" class="ec-list-prevbtn" onclick="RM.formulaType.formulaType.typeTree.upRow()"></div></div>
		<div class="ec-list-btndiv"><div id="typeTree_down" class="ec-list-nextbtn" onclick="RM.formulaType.formulaType.typeTree.downRow()"></div></div>
		<div class="ec-list-btndiv"><div id="typeTree_last" class="ec-list-lastbtn" onclick="RM.formulaType.formulaType.typeTree.lastRow()"></div></div>
	</div>
</div>
<#if Parameters?? && !(Parameters.pageType?? && Parameters.pageType == 'ref')>
			<div id="typeTree_opratebar" class="opratebar">
			</div>
</#if>	


<script type="text/javascript">
CUI.ns("RM.formulaType.formulaType.typeTree");

	RM.formulaType.formulaType.typeTree.cancelSelectedNode = function(parentRes){
		var layout = RM_formulaType_formulaType_typeTree_getLayout();
		var ns = layout.getList();
		if(ns) {
			ns = eval(ns);
			ns.node = null;
		}
		RM_formulaType_formulaType_typeTree_tree.cancelSelectedNode();
	};
	
	RM_formulaType_formulaType_typeTree_cancelSelectedNode = function(parentRes){
		var layout = RM_formulaType_formulaType_typeTree_getLayout();
		var ns = layout.getList();
		if(ns) {
			ns = eval(ns);
			ns.node = null;
		}
		RM_formulaType_formulaType_typeTree_tree.cancelSelectedNode();
	};
	
<#if Parameters?? && !(Parameters.pageType?? && Parameters.pageType == 'ref')>
	
	RM_formulaType_formulaType_typeTree_treeOnclick = function(event,treeId,node){
		var layout = RM_formulaType_formulaType_typeTree_getLayout();
		layout.refresh(node);
	}
	
	RM_formulaType_formulaType_typeTree_treeDbOnclick = function(event,treeId,node){
	}
	
	RM_formulaType_formulaType_typeTree_treeBeforeDrag = function(treeId,node){
	}
	
	RM_formulaType_formulaType_typeTree_treeAfterDrop = function(treeId, treeNodes, targetNode, moveType, isCopy){
	}
	
	RM_formulaType_formulaType_typeTree_drag = function(event, treeId, treeNodes){
		
	}
	
	/*
	RM_formulaType_formulaType_typeTree_beforeDrop = function(treeId, treeNodes, targetNode, moveType, isCopy){
		
	}
	*/
	
	RM_formulaType_formulaType_typeTree_drop = function(event, treeId, treeNodes, targetNode, moveType, isCopy){
		
	}
	
	RM_formulaType_formulaType_typeTree_getNode = function(){
		return RM_formulaType_formulaType_typeTree_tree.getSelectedNodes();
	}
	
	RM_formulaType_formulaType_typeTree_refreshNodeId = function(node, operate){
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
	
	
	RM_formulaType_formulaType_typeTree_refreshRootNode = function(){
		var rootNode = RM_formulaType_formulaType_typeTree_tree.getNodeByParam( "id", -1 );
		RM_formulaType_formulaType_typeTree_tree.reAsyncChildNodes( rootNode, "refresh" );
		RM_formulaType_formulaType_typeTree_tree.selectNode( rootNode )
		$("#" + rootNode.tId + "_a").trigger('click');
	}
	
	RM_formulaType_formulaType_typeTree_refresh = function(nodeId, data){		
		var node = RM_formulaType_formulaType_typeTree_tree.getNodeByParam("id", nodeId ? nodeId : -1);
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
		RM_formulaType_formulaType_typeTree_tree.setting.callback.customOnAsyncSuccessMethod = function(event, treeId, treeNode, msg){
			if(treeNode && treeNode.children.length == 0) {
				treeNode.isParent = false;
				RM_formulaType_formulaType_typeTree_tree.updateNode(treeNode);
			}
			var layout = RM_formulaType_formulaType_typeTree_getLayout();
			var checkNode = layout.node;
			if(checkNode != null){
				checkNode = RM_formulaType_formulaType_typeTree_tree.getNodeByParam("id", checkNode.id);
				if (!checkNode) {// 删除情况，从根节点刷新
                    checkNode = RM_formulaType_formulaType_typeTree_tree.getNodeByParam("id", -1)                    				    
                }
				$("#" + checkNode.tId + "_a").trigger('click');
			} 
		}
		RM_formulaType_formulaType_typeTree_tree.reAsyncChildNodes(node,"refresh");
	}
	
				
	RM.formulaType.formulaType.typeTree.checkSelectedAny = function(){
		var nodes = RM_formulaType_formulaType_typeTree_tree.getSelectedNodes();
		if(nodes.length > 0){
			return true;
		}else{
			CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
			return false;
		}
	}
	
	RM.formulaType.formulaType.typeTree.checkTreeRoot = function(){
		var nodes = RM_formulaType_formulaType_typeTree_tree.getSelectedNodes();
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
	
	
	
	RM.formulaType.formulaType.typeTree.isTreeRoot = function(){
		var nodes = RM_formulaType_formulaType_typeTree_tree.getSelectedNodes();
		var node = nodes[0];
		if(node.level == 0){
			return true;
		} else {
			return false;
		}
		
	}
	
	RM.formulaType.formulaType.typeTree.showDialog = function(url,formId,title,dialogType,buttonCode) {
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
		RM.formulaType.formulaType.typeTree.Dlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			type : dialogType,
			//type : otherParams.dialogType,
			leaveConfirm : true,
			buttons:buttons
		});
		RM.formulaType.formulaType.typeTree.Dlg.show();
	};
	
	RM.formulaType.formulaType.typeTree.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('RM_formulaType_formulaType_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.deleteandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{RM.formulaType.formulaType.typeTree.Dlg.close();closeLoadPanel();}catch(e){}
				var layout = RM_formulaType_formulaType_typeTree_getLayout();
				var node = layout.getNode();
				RM_formulaType_formulaType_typeTree_refresh(null == node ? -1 : node.id,  {operate: res.operate});
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
	RM.formulaType.formulaType.typeTree.getSelectedNodes = function(callBack){
		var nodes = RM_formulaType_formulaType_typeTree_tree.getCheckedNodes();
		eval(callBack+"(nodes)");
	}
</#if>

/**
 * dialog创建附件上传按钮
 * @private
 */
RM.formulaType.formulaType.typeTree.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"RM_formulaType_formulaType_typeTree_fileupload_button",
		handler:function(){
			if($('#RM_formulaType_formulaType_typeTree_fileupload').length == 0) {
				$('body').append('<div id="RM_formulaType_formulaType_typeTree_fileupload"></div>');
			}
			RM.formulaType.formulaType.typeTree.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "RM_formulaType_formulaType_typeTree_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#RM_formulaType_formulaType_typeTree_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			RM.formulaType.formulaType.typeTree.infoDialog.show();
			if($('#RM_formulaType_formulaType_typeTree_fileupload').html() == '') {
				$('#RM_formulaType_formulaType_typeTree_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=RM_formulaType_formulaType&entityCode=RM_7.5.0.0_formulaType&dialogId="+dialogId);
			}
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
RM.formulaType.formulaType.typeTree.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_formulaType_typeTree.RM.formulaType.formulaType." + params.viewName + ".referenceCopy");
			funcName('formulaType', params.referenceUrl, this);
		}
	}
};
</script>
