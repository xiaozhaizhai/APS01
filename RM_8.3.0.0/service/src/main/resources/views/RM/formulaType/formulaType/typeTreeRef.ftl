<#if Parameters?? && (Parameters.pageType?? && Parameters.pageType == 'ref')>
<#assign selectedMultiEnable=true>
<#assign checkboxEnable=true>
<#assign callback="{}">
<#else>
<#assign callback="{onDrop:function(event, treeId, treeNodes, targetNode, moveType, isCop){RM_formulaType_formulaType_typeTreeRef_drop(event, treeId, treeNodes, targetNode, moveType, isCop);}, onDrag:function(event, treeId, treeNodes){RM_formulaType_formulaType_typeTreeRef_drag(event, treeId, treeNodes);}, beforeDragOpen:function(treeId, treeNode){return false;}, beforeDrag:function(treeId, treeNodes){return false;}, onClick:function(event,treeId,node){RM_formulaType_formulaType_typeTreeRef_treeOnclick(event,treeId,node);}, onDblClick:function(event,treeId,node){RM_formulaType_formulaType_typeTreeRef_treeDbOnclick(event,treeId,node);}}">
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
<div id="typeTreeRef_div" style="overflow:scroll;">
</#if>
<@tree movUrl="/RM/formulaType/formulaType/typeTreeRefDrag.action?${getPowerCode('${layoutViewCode!}typeTreeRef_move_RM_7.5.0.0_formulaType_typeTreeRef')}" id="RM_formulaType_formulaType_typeTreeRef_tree" dataUrl="/RM/formulaType/formulaType/typeTreeRefData.action?${layoutParams}" rootName="${getText('RM_7.5.0.0_formulaType_typeTree.treeRootName')}" nameCol="name"
			 callback="${callback}" selectedMultiEnable=selectedMultiEnable checkboxEnable=checkboxEnable  canMemory=false />
<#if Parameters?? && (Parameters.pageType?? && Parameters.pageType == 'ref')>
</div>
<script type="text/javascript">
	$(function(){
		var height = $('#typeTreeRef_div').parent().height();
		$('#typeTreeRef_div').css('height', height);
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
<div id="typeTreeRef_sort_div" style="display: none;"> 	
	<div style="position:absolute;left:0px;top:0px;overflow:auto;height:86.5%;;width:75%;display:inline-block;">
		<div id="typeTreeRef_scroll_div" style="margin-left:10px;margin-top:20px;overflow-y:auto;clear:both;height:82%">
		<table cellpadding="0" id="typeTreeRef_fastColTable" style="font-size:12px;width:96%;" cellspacing="0" align="center" class="infoTable">
			<tbody id="typeTreeRef_sort_table">
				
			</tbody>
		</table>
		</div>
	</div>
	<div id="typeTreeRef_fastContent" style="background-color:#f8f6f7;position:absolute;right:0px;top:0px;width:25%;border: 1px solid #efefef; height: 99%;">
		<div class="ec-list-btndiv"><div id="typeTreeRef_first" class="ec-list-topbtn" onclick="RM.formulaType.formulaType.typeTreeRef.firstRow()"></div></div>
		<div class="ec-list-btndiv"><div id="typeTreeRef_up" class="ec-list-prevbtn" onclick="RM.formulaType.formulaType.typeTreeRef.upRow()"></div></div>
		<div class="ec-list-btndiv"><div id="typeTreeRef_down" class="ec-list-nextbtn" onclick="RM.formulaType.formulaType.typeTreeRef.downRow()"></div></div>
		<div class="ec-list-btndiv"><div id="typeTreeRef_last" class="ec-list-lastbtn" onclick="RM.formulaType.formulaType.typeTreeRef.lastRow()"></div></div>
	</div>
</div>
<#if Parameters?? && !(Parameters.pageType?? && Parameters.pageType == 'ref')>
</#if>	


<script type="text/javascript">
CUI.ns("RM.formulaType.formulaType.typeTreeRef");

	RM.formulaType.formulaType.typeTreeRef.cancelSelectedNode = function(parentRes){
		var layout = RM_formulaType_formulaType_typeTreeRef_getLayout();
		var ns = layout.getList();
		if(ns) {
			ns = eval(ns);
			ns.node = null;
		}
		RM_formulaType_formulaType_typeTreeRef_tree.cancelSelectedNode();
	};
	
	RM_formulaType_formulaType_typeTreeRef_cancelSelectedNode = function(parentRes){
		var layout = RM_formulaType_formulaType_typeTreeRef_getLayout();
		var ns = layout.getList();
		if(ns) {
			ns = eval(ns);
			ns.node = null;
		}
		RM_formulaType_formulaType_typeTreeRef_tree.cancelSelectedNode();
	};
	
<#if Parameters?? && !(Parameters.pageType?? && Parameters.pageType == 'ref')>
	
	RM_formulaType_formulaType_typeTreeRef_treeOnclick = function(event,treeId,node){
		var layout = RM_formulaType_formulaType_typeTreeRef_getLayout();
		layout.refresh(node);
	}
	
	RM_formulaType_formulaType_typeTreeRef_treeDbOnclick = function(event,treeId,node){
	}
	
	RM_formulaType_formulaType_typeTreeRef_treeBeforeDrag = function(treeId,node){
	}
	
	RM_formulaType_formulaType_typeTreeRef_treeAfterDrop = function(treeId, treeNodes, targetNode, moveType, isCopy){
	}
	
	RM_formulaType_formulaType_typeTreeRef_drag = function(event, treeId, treeNodes){
		
	}
	
	/*
	RM_formulaType_formulaType_typeTreeRef_beforeDrop = function(treeId, treeNodes, targetNode, moveType, isCopy){
		
	}
	*/
	
	RM_formulaType_formulaType_typeTreeRef_drop = function(event, treeId, treeNodes, targetNode, moveType, isCopy){
		
	}
	
	RM_formulaType_formulaType_typeTreeRef_getNode = function(){
		return RM_formulaType_formulaType_typeTreeRef_tree.getSelectedNodes();
	}
	
	RM_formulaType_formulaType_typeTreeRef_refreshNodeId = function(node, operate){
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
	
	
	RM_formulaType_formulaType_typeTreeRef_refreshRootNode = function(){
		var rootNode = RM_formulaType_formulaType_typeTreeRef_tree.getNodeByParam( "id", -1 );
		RM_formulaType_formulaType_typeTreeRef_tree.reAsyncChildNodes( rootNode, "refresh" );
		RM_formulaType_formulaType_typeTreeRef_tree.selectNode( rootNode )
		$("#" + rootNode.tId + "_a").trigger('click');
	}
	
	RM_formulaType_formulaType_typeTreeRef_refresh = function(nodeId, data){		
		var node = RM_formulaType_formulaType_typeTreeRef_tree.getNodeByParam("id", nodeId ? nodeId : -1);
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
		RM_formulaType_formulaType_typeTreeRef_tree.setting.callback.customOnAsyncSuccessMethod = function(event, treeId, treeNode, msg){
			if(treeNode && treeNode.children.length == 0) {
				treeNode.isParent = false;
				RM_formulaType_formulaType_typeTreeRef_tree.updateNode(treeNode);
			}
			var layout = RM_formulaType_formulaType_typeTreeRef_getLayout();
			var checkNode = layout.node;
			if(checkNode != null){
				checkNode = RM_formulaType_formulaType_typeTreeRef_tree.getNodeByParam("id", checkNode.id);
				if (!checkNode) {// 删除情况，从根节点刷新
                    checkNode = RM_formulaType_formulaType_typeTreeRef_tree.getNodeByParam("id", -1)                    				    
                }
				$("#" + checkNode.tId + "_a").trigger('click');
			} 
		}
		RM_formulaType_formulaType_typeTreeRef_tree.reAsyncChildNodes(node,"refresh");
	}
	
				
	RM.formulaType.formulaType.typeTreeRef.checkSelectedAny = function(){
		var nodes = RM_formulaType_formulaType_typeTreeRef_tree.getSelectedNodes();
		if(nodes.length > 0){
			return true;
		}else{
			CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
			return false;
		}
	}
	
	RM.formulaType.formulaType.typeTreeRef.checkTreeRoot = function(){
		var nodes = RM_formulaType_formulaType_typeTreeRef_tree.getSelectedNodes();
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
	
	
	
	RM.formulaType.formulaType.typeTreeRef.isTreeRoot = function(){
		var nodes = RM_formulaType_formulaType_typeTreeRef_tree.getSelectedNodes();
		var node = nodes[0];
		if(node.level == 0){
			return true;
		} else {
			return false;
		}
		
	}
	
	RM.formulaType.formulaType.typeTreeRef.showDialog = function(url,formId,title,dialogType,buttonCode) {
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
		RM.formulaType.formulaType.typeTreeRef.Dlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			type : dialogType,
			//type : otherParams.dialogType,
			leaveConfirm : true,
			buttons:buttons
		});
		RM.formulaType.formulaType.typeTreeRef.Dlg.show();
	};
	
	RM.formulaType.formulaType.typeTreeRef.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('RM_formulaType_formulaType_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.deleteandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{RM.formulaType.formulaType.typeTreeRef.Dlg.close();closeLoadPanel();}catch(e){}
				var layout = RM_formulaType_formulaType_typeTreeRef_getLayout();
				var node = layout.getNode();
				RM_formulaType_formulaType_typeTreeRef_refresh(null == node ? -1 : node.id,  {operate: res.operate});
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	(function(){
		if($('#typeTreeRef_opratebar').length > 0){
			$('#typeTreeRef_buttonbar').append($('#typeTreeRef_opratebar'));
		}
		if($('#typeTreeRef_opratebar').children().length == 0){
			$('#typeTreeRef_opratebar').hide();
		}
	})();
	
<#else>
	RM.formulaType.formulaType.typeTreeRef.getSelectedNodes = function(callBack){
		var nodes = RM_formulaType_formulaType_typeTreeRef_tree.getCheckedNodes();
		eval(callBack+"(nodes)");
	}
</#if>

/**
 * dialog创建附件上传按钮
 * @private
 */
RM.formulaType.formulaType.typeTreeRef.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"RM_formulaType_formulaType_typeTreeRef_fileupload_button",
		handler:function(){
			if($('#RM_formulaType_formulaType_typeTreeRef_fileupload').length == 0) {
				$('body').append('<div id="RM_formulaType_formulaType_typeTreeRef_fileupload"></div>');
			}
			RM.formulaType.formulaType.typeTreeRef.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "RM_formulaType_formulaType_typeTreeRef_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#RM_formulaType_formulaType_typeTreeRef_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			RM.formulaType.formulaType.typeTreeRef.infoDialog.show();
			if($('#RM_formulaType_formulaType_typeTreeRef_fileupload').html() == '') {
				$('#RM_formulaType_formulaType_typeTreeRef_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=RM_formulaType_formulaType&entityCode=RM_7.5.0.0_formulaType&dialogId="+dialogId);
			}
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
RM.formulaType.formulaType.typeTreeRef.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_formulaType_typeTreeRef.RM.formulaType.formulaType." + params.viewName + ".referenceCopy");
			funcName('formulaType', params.referenceUrl, this);
		}
	}
};
</script>
