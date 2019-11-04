<#if Parameters?? && (Parameters.pageType?? && Parameters.pageType == 'ref')>
<#assign selectedMultiEnable=true>
<#assign checkboxEnable=true>
<#assign callback="{}">
<#else>
<#assign callback="{onDrop:function(event, treeId, treeNodes, targetNode, moveType, isCop){MESBasic_area_area_areaTree_drop(event, treeId, treeNodes, targetNode, moveType, isCop);}, onDrag:function(event, treeId, treeNodes){MESBasic_area_area_areaTree_drag(event, treeId, treeNodes);}, beforeDragOpen:function(treeId, treeNode){return false;}, beforeDrag:function(treeId, treeNodes){return false;}, onClick:function(event,treeId,node){MESBasic_area_area_areaTree_treeOnclick(event,treeId,node);}, onDblClick:function(event,treeId,node){MESBasic_area_area_areaTree_treeDbOnclick(event,treeId,node);}}">
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
<div id="areaTree_div" style="overflow:scroll;">
</#if>
<@tree movUrl="/MESBasic/area/area/areaTreeDrag.action?${getPowerCode('${layoutViewCode!}areaTree_move_MESBasic_1_area_areaTree')}" id="MESBasic_area_area_areaTree_tree" dataUrl="/MESBasic/area/area/areaTreeData.action?${layoutParams}" rootName="${getText('MESBasic_1_area_areaTree.treeRootName')}" nameCol="name"
			 callback="${callback}" selectedMultiEnable=selectedMultiEnable checkboxEnable=checkboxEnable  canMemory=false />
<#if Parameters?? && (Parameters.pageType?? && Parameters.pageType == 'ref')>
</div>
<script type="text/javascript">
	$(function(){
		var height = $('#areaTree_div').parent().height();
		$('#areaTree_div').css('height', height);
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
<div id="areaTree_sort_div" style="display: none;"> 	
	<div style="position:absolute;left:0px;top:0px;overflow:auto;height:86.5%;;width:75%;display:inline-block;">
		<div id="areaTree_scroll_div" style="margin-left:10px;margin-top:20px;overflow-y:auto;clear:both;height:82%">
		<table cellpadding="0" id="areaTree_fastColTable" style="font-size:12px;width:96%;" cellspacing="0" align="center" class="infoTable">
			<tbody id="areaTree_sort_table">
				
			</tbody>
		</table>
		</div>
	</div>
	<div id="areaTree_fastContent" style="background-color:#f8f6f7;position:absolute;right:0px;top:0px;width:25%;border: 1px solid #efefef; height: 99%;">
		<div class="ec-list-btndiv"><div id="areaTree_first" class="ec-list-topbtn" onclick="MESBasic.area.area.areaTree.firstRow()"></div></div>
		<div class="ec-list-btndiv"><div id="areaTree_up" class="ec-list-prevbtn" onclick="MESBasic.area.area.areaTree.upRow()"></div></div>
		<div class="ec-list-btndiv"><div id="areaTree_down" class="ec-list-nextbtn" onclick="MESBasic.area.area.areaTree.downRow()"></div></div>
		<div class="ec-list-btndiv"><div id="areaTree_last" class="ec-list-lastbtn" onclick="MESBasic.area.area.areaTree.lastRow()"></div></div>
	</div>
</div>
<#if Parameters?? && !(Parameters.pageType?? && Parameters.pageType == 'ref')>
			<div id="areaTree_opratebar" class="opratebar">
			</div>
</#if>	


<script type="text/javascript">
CUI.ns("MESBasic.area.area.areaTree");

	MESBasic.area.area.areaTree.cancelSelectedNode = function(parentRes){
		var layout = MESBasic_area_area_areaTree_getLayout();
		var ns = layout.getList();
		if(ns) {
			ns = eval(ns);
			ns.node = null;
		}
		MESBasic_area_area_areaTree_tree.cancelSelectedNode();
	};
	
	MESBasic_area_area_areaTree_cancelSelectedNode = function(parentRes){
		var layout = MESBasic_area_area_areaTree_getLayout();
		var ns = layout.getList();
		if(ns) {
			ns = eval(ns);
			ns.node = null;
		}
		MESBasic_area_area_areaTree_tree.cancelSelectedNode();
	};
	
<#if Parameters?? && !(Parameters.pageType?? && Parameters.pageType == 'ref')>
	
	MESBasic_area_area_areaTree_treeOnclick = function(event,treeId,node){
		var layout = MESBasic_area_area_areaTree_getLayout();
		layout.refresh(node);
	}
	
	MESBasic_area_area_areaTree_treeDbOnclick = function(event,treeId,node){
	}
	
	MESBasic_area_area_areaTree_treeBeforeDrag = function(treeId,node){
	}
	
	MESBasic_area_area_areaTree_treeAfterDrop = function(treeId, treeNodes, targetNode, moveType, isCopy){
	}
	
	MESBasic_area_area_areaTree_drag = function(event, treeId, treeNodes){
		
	}
	
	/*
	MESBasic_area_area_areaTree_beforeDrop = function(treeId, treeNodes, targetNode, moveType, isCopy){
		
	}
	*/
	
	MESBasic_area_area_areaTree_drop = function(event, treeId, treeNodes, targetNode, moveType, isCopy){
		
	}
	
	MESBasic_area_area_areaTree_getNode = function(){
		return MESBasic_area_area_areaTree_tree.getSelectedNodes();
	}
	
	MESBasic_area_area_areaTree_refreshNodeId = function(node, operate){
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
	
	
	MESBasic_area_area_areaTree_refreshRootNode = function(){
		var rootNode = MESBasic_area_area_areaTree_tree.getNodeByParam( "id", -1 );
		MESBasic_area_area_areaTree_tree.reAsyncChildNodes( rootNode, "refresh" );
		MESBasic_area_area_areaTree_tree.selectNode( rootNode )
		$("#" + rootNode.tId + "_a").trigger('click');
	}
	
	MESBasic_area_area_areaTree_refresh = function(nodeId, data){		
		var node = MESBasic_area_area_areaTree_tree.getNodeByParam("id", nodeId ? nodeId : -1);
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
		MESBasic_area_area_areaTree_tree.setting.callback.customOnAsyncSuccessMethod = function(event, treeId, treeNode, msg){
			if(treeNode && treeNode.children.length == 0) {
				treeNode.isParent = false;
				MESBasic_area_area_areaTree_tree.updateNode(treeNode);
			}
			var layout = MESBasic_area_area_areaTree_getLayout();
			var checkNode = layout.node;
			if(checkNode != null){
				checkNode = MESBasic_area_area_areaTree_tree.getNodeByParam("id", checkNode.id);
				if (!checkNode) {// 删除情况，从根节点刷新
                    checkNode = MESBasic_area_area_areaTree_tree.getNodeByParam("id", -1)                    				    
                }
				$("#" + checkNode.tId + "_a").trigger('click');
			} 
		}
		MESBasic_area_area_areaTree_tree.reAsyncChildNodes(node,"refresh");
	}
	
	MESBasic.area.area.areaTree.checkSelectedAny = function(){
		var nodes = MESBasic_area_area_areaTree_tree.getSelectedNodes();
		if(nodes.length > 0){
			return true;
		}else{
			CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
			return false;
		}
	}
	
	MESBasic.area.area.areaTree.checkTreeRoot = function(){
		var nodes = MESBasic_area_area_areaTree_tree.getSelectedNodes();
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
	
	
	
	MESBasic.area.area.areaTree.isTreeRoot = function(){
		var nodes = MESBasic_area_area_areaTree_tree.getSelectedNodes();
		var node = nodes[0];
		if(node.level == 0){
			return true;
		} else {
			return false;
		}
		
	}
	
	MESBasic.area.area.areaTree.showDialog = function(url,formId,title,dialogType,buttonCode) {
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
		MESBasic.area.area.areaTree.Dlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			type : dialogType,
			//type : otherParams.dialogType,
			leaveConfirm : true,
			buttons:buttons
		});
		MESBasic.area.area.areaTree.Dlg.show();
	};
	
	MESBasic.area.area.areaTree.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('MESBasic_area_area_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.deleteandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{MESBasic.area.area.areaTree.Dlg.close();closeLoadPanel();}catch(e){}
				var layout = MESBasic_area_area_areaTree_getLayout();
				var node = layout.getNode();
				MESBasic_area_area_areaTree_refresh(null == node ? -1 : node.id,  {operate: res.operate});
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	(function(){
		if($('#areaTree_opratebar').length > 0){
			$('#areaTree_buttonbar').append($('#areaTree_opratebar'));
		}
		if($('#areaTree_opratebar').children().length == 0){
			$('#areaTree_opratebar').hide();
		}
	})();
	
<#else>
	MESBasic.area.area.areaTree.getSelectedNodes = function(callBack){
		var nodes = MESBasic_area_area_areaTree_tree.getCheckedNodes();
		eval(callBack+"(nodes)");
	}
</#if>

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.area.area.areaTree.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_area_area_areaTree_fileupload_button",
		handler:function(){
			if($('#MESBasic_area_area_areaTree_fileupload').length == 0) {
				$('body').append('<div id="MESBasic_area_area_areaTree_fileupload"></div>');
			}
			MESBasic.area.area.areaTree.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "MESBasic_area_area_areaTree_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#MESBasic_area_area_areaTree_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			MESBasic.area.area.areaTree.infoDialog.show();
			if($('#MESBasic_area_area_areaTree_fileupload').html() == '') {
				$('#MESBasic_area_area_areaTree_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=MESBasic_area_area&entityCode=MESBasic_1_area&dialogId="+dialogId);
			}
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.area.area.areaTree.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_area_areaTree.MESBasic.area.area." + params.viewName + ".referenceCopy");
			funcName('area', params.referenceUrl, this);
		}
	}
};
</script>
