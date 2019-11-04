<#if Parameters?? && (Parameters.pageType?? && Parameters.pageType == 'ref')>
<#assign selectedMultiEnable=true>
<#assign checkboxEnable=true>
<#assign callback="{}">
<#else>
<#assign callback="{onDrop:function(event, treeId, treeNodes, targetNode, moveType, isCop){MESBasic_prodList_baseProdList_tree_drop(event, treeId, treeNodes, targetNode, moveType, isCop);}, onDrag:function(event, treeId, treeNodes){MESBasic_prodList_baseProdList_tree_drag(event, treeId, treeNodes);}, beforeDragOpen:function(treeId, treeNode){return false;}, beforeDrag:function(treeId, treeNodes){return false;}, onClick:function(event,treeId,node){MESBasic_prodList_baseProdList_tree_treeOnclick(event,treeId,node);}, onDblClick:function(event,treeId,node){MESBasic_prodList_baseProdList_tree_treeDbOnclick(event,treeId,node);}}">
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
<@tree movUrl="/MESBasic/prodList/baseProdList/treeDrag.action?${getPowerCode('${layoutViewCode!}tree_move_MESBasic_1_prodList_tree')}" id="MESBasic_prodList_baseProdList_tree_tree" dataUrl="/MESBasic/prodList/baseProdList/treeData.action?${layoutParams}" rootName="${getText('MESBasic.treeRootName.443222')}" nameCol="prodListName"
			 callback="${callback}" selectedMultiEnable=selectedMultiEnable checkboxEnable=checkboxEnable   />
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
		<div class="ec-list-btndiv"><div id="tree_first" class="ec-list-topbtn" onclick="MESBasic.prodList.baseProdList.tree.firstRow()"></div></div>
		<div class="ec-list-btndiv"><div id="tree_up" class="ec-list-prevbtn" onclick="MESBasic.prodList.baseProdList.tree.upRow()"></div></div>
		<div class="ec-list-btndiv"><div id="tree_down" class="ec-list-nextbtn" onclick="MESBasic.prodList.baseProdList.tree.downRow()"></div></div>
		<div class="ec-list-btndiv"><div id="tree_last" class="ec-list-lastbtn" onclick="MESBasic.prodList.baseProdList.tree.lastRow()"></div></div>
	</div>
</div>
<#if Parameters?? && !(Parameters.pageType?? && Parameters.pageType == 'ref')>
			<div id="tree_opratebar" class="opratebar">
				<@operatebar menuCode="${workFlowMenuCode!}"  operates="
					code:${layoutViewCode!}tree_add_add_MESBasic_1_prodList_tree||name:${getText('MESBasic.buttonPropertyshowName.radion13450080942890')}||iconcls:add||useInMore:false||onclick:
						MESBasic.prodList.baseProdList.tree.addtree()
				" 
				resultType="html" />
				<@operatebar menuCode="${workFlowMenuCode!}"  operates="
					code:${layoutViewCode!}tree_modify_modify_MESBasic_1_prodList_tree||name:${getText('MESBasic.modify.buttonPropertyshowName.radion1462929740701')}||iconcls:modify||useInMore:false||onclick:
						MESBasic.prodList.baseProdList.tree.modifytree()
				" 
				resultType="html" />
				<@operatebar menuCode="${workFlowMenuCode!}"  operates="
					code:${layoutViewCode!}tree_del_del_MESBasic_1_prodList_tree||name:${getText('MESBasic.buttonPropertyshowName.radion14664725216861')}||iconcls:del||useInMore:false||onclick:
						MESBasic.prodList.baseProdList.tree.deletetree()
				" 
				resultType="html" />
			</div>
</#if>	


<script type="text/javascript">
CUI.ns("MESBasic.prodList.baseProdList.tree");

	MESBasic.prodList.baseProdList.tree.cancelSelectedNode = function(parentRes){
		var layout = MESBasic_prodList_baseProdList_tree_getLayout();
		var ns = layout.getList();
		if(ns) {
			ns = eval(ns);
			ns.node = null;
		}
		MESBasic_prodList_baseProdList_tree_tree.cancelSelectedNode();
	};
	
	MESBasic_prodList_baseProdList_tree_cancelSelectedNode = function(parentRes){
		var layout = MESBasic_prodList_baseProdList_tree_getLayout();
		var ns = layout.getList();
		if(ns) {
			ns = eval(ns);
			ns.node = null;
		}
		MESBasic_prodList_baseProdList_tree_tree.cancelSelectedNode();
	};
	
<#if Parameters?? && !(Parameters.pageType?? && Parameters.pageType == 'ref')>
	
	MESBasic_prodList_baseProdList_tree_treeOnclick = function(event,treeId,node){
		var layout = MESBasic_prodList_baseProdList_tree_getLayout();
		layout.refresh(node);
		CUI.setCookie('nodeCookie_MESBasic_prodList_baseProdList_tree_tree',node.layRec,'d1');
	}
	
	MESBasic_prodList_baseProdList_tree_treeDbOnclick = function(event,treeId,node){
	}
	
	MESBasic_prodList_baseProdList_tree_treeBeforeDrag = function(treeId,node){
	}
	
	MESBasic_prodList_baseProdList_tree_treeAfterDrop = function(treeId, treeNodes, targetNode, moveType, isCopy){
	}
	
	MESBasic_prodList_baseProdList_tree_drag = function(event, treeId, treeNodes){
		
	}
	
	/*
	MESBasic_prodList_baseProdList_tree_beforeDrop = function(treeId, treeNodes, targetNode, moveType, isCopy){
		
	}
	*/
	
	MESBasic_prodList_baseProdList_tree_drop = function(event, treeId, treeNodes, targetNode, moveType, isCopy){
		
	}
	
	MESBasic_prodList_baseProdList_tree_getNode = function(){
		return MESBasic_prodList_baseProdList_tree_tree.getSelectedNodes();
	}
	
	MESBasic_prodList_baseProdList_tree_refreshNodeId = function(node, operate){
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
	
	
	MESBasic_prodList_baseProdList_tree_refreshRootNode = function(){
		var rootNode = MESBasic_prodList_baseProdList_tree_tree.getNodeByParam( "id", -1 );
		MESBasic_prodList_baseProdList_tree_tree.reAsyncChildNodes( rootNode, "refresh" );
		MESBasic_prodList_baseProdList_tree_tree.selectNode( rootNode )
		$("#" + rootNode.tId + "_a").trigger('click');
	}
	
	MESBasic_prodList_baseProdList_tree_refresh = function(nodeId, data){		
		var node = MESBasic_prodList_baseProdList_tree_tree.getNodeByParam("id", nodeId ? nodeId : -1);
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
		MESBasic_prodList_baseProdList_tree_tree.setting.callback.customOnAsyncSuccessMethod = function(event, treeId, treeNode, msg){
			if(treeNode && treeNode.children.length == 0) {
				treeNode.isParent = false;
				MESBasic_prodList_baseProdList_tree_tree.updateNode(treeNode);
			}
			var layout = MESBasic_prodList_baseProdList_tree_getLayout();
			var checkNode = layout.node;
			if(checkNode != null){
				checkNode = MESBasic_prodList_baseProdList_tree_tree.getNodeByParam("id", checkNode.id);
				if (!checkNode) {// 删除情况，从根节点刷新
                    checkNode = MESBasic_prodList_baseProdList_tree_tree.getNodeByParam("id", -1)                    				    
                }
				$("#" + checkNode.tId + "_a").trigger('click');
			} 
		}
		MESBasic_prodList_baseProdList_tree_tree.reAsyncChildNodes(node,"refresh");
	}
	
					<#assign editView = getViewByCode('MESBasic_1_prodList_editView')>
				MESBasic.prodList.baseProdList.tree.addtree = function() {
					var buttonCode='MESBasic_1_prodList_tree_BUTTON_add';
						var treeParam = "";
						var nodes = MESBasic_prodList_baseProdList_tree_tree.getSelectedNodes();
						if(nodes.length > 0){
							var node = nodes[0];
							if(node.cid!='${Session.company.id}'&&node.id!=-1){
								workbenchErrorBarWidget.showMessage("${getText('ec.edit.button.uncurrent.company')}",'f');
								return;
							}
							treeParam = '&baseProdList.parentId=' + node.id;
						}else{
							CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
							return false;
						}
						<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
							var otherParams = {};
							<#if editView.hasAttachment?? && editView.hasAttachment == true>
							otherParams.operateRecordId = -1;
							otherParams.uploadBtn = MESBasic.prodList.baseProdList.tree.createUploadBtn(otherParams);
							</#if>
							<#if editView.isReference?? && editView.isReference == true>
							otherParams.referenceCopyBtn = MESBasic.prodList.baseProdList.tree.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
							</#if>
							otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
							MESBasic.prodList.baseProdList.tree.otherParams = otherParams;
	
							var url='${editView.url}?callbackName=MESBasic.prodList.baseProdList.tree.callBackInfo&entityCode=MESBasic_1_prodList' + "&${getPowerCode('${layoutViewCode!}tree_add_add_MESBasic_1_prodList_tree')}";
								<#if businessParam??>
						 			url += "&${businessParam}";	
						 		</#if>
					 		if(treeParam!=""){
					 			url += treeParam;
					 		}
					 		url += '&buttonCode='+encodeURIComponent(buttonCode);
					 		MESBasic.prodList.baseProdList.tree.showDialog(url,'MESBasic_prodList_baseProdList_${editView.name}_form','${getText(editView.title!)}',otherParams.dialogType);
						<#else>
							var url='${editView.url}?entityCode=MESBasic_1_prodList' + "&${getPowerCode('${layoutViewCode!}tree_add_add_MESBasic_1_prodList_tree')}";
							if(treeParam!=""){
					 			url += treeParam;
					 		}
								<#if businessParam??>
						 			url += "&${businessParam}";	
						 		</#if>
				 				url += "&buttonCode="+encodeURIComponent(buttonCode);
							openFullScreen(url<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
						</#if>
				};
				
					<#assign editView = getViewByCode('MESBasic_1_prodList_editView')>
					MESBasic.prodList.baseProdList.tree.modifytree = function() {
						var buttonCode='MESBasic_1_prodList_tree_BUTTON_modify';
						if(MESBasic.prodList.baseProdList.tree.checkSelectedAny() ){
								var node = MESBasic_prodList_baseProdList_tree_tree.getSelectedNodes()[0];
								if(node.cid!='${Session.company.id}'&&node.id!=-1){
									workbenchErrorBarWidget.showMessage("${getText('ec.edit.button.uncurrent.company')}",'f');
									return;
								}
								//QC-8189:选中根节点后可以弹出修改根节点名称的界面，同时修改API接口
								if(MESBasic.prodList.baseProdList.tree.isTreeRoot()){
									MESBasic.prodList.baseProdList.tree.editTreeRootNameDialog=new CUI.Dialog({
								        title:"${getText('ec.view.tree.editTreeRootName')}",
								        modal:true,
										height:200,
										width: 500,
								        dragable:true,
								        url:"/foundation/international/editTreeRootName.action?key=MESBasic.treeRootName.443222",
								        buttons:[{name:"${getText('foundation.common.checked')}",
								                handler:function(){MESBasic.prodList.baseProdList.tree.treeRootEditSubmit();}
								                },
								               {name:"${getText('common.button.cancel')}",
								                handler:function(){this.close()}
								              }]
								      
								    });
							        MESBasic.prodList.baseProdList.tree.editTreeRootNameDialog.show();
								}else{
								<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
									var dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
									MESBasic.prodList.baseProdList.tree.showDialog('${editView.url}?callbackName=MESBasic.prodList.baseProdList.tree.callBackInfo&entityCode=MESBasic_1_prodList'+"&buttonCode="+encodeURIComponent(buttonCode)+'&id=' + node.id +"&${getPowerCode('${layoutViewCode!}tree_modify_modify_MESBasic_1_prodList_tree')}",'MESBasic_prodList_baseProdList_${editView.name}_form','${getText('${(editView.title)!}')}',dialogType);
								<#else>
								openFullScreen('${editView.url}?entityCode=MESBasic_1_prodList'+"&buttonCode="+encodeURIComponent(buttonCode)+'&id=' + node.id +"&${getPowerCode('${layoutViewCode!}tree_modify_modify_MESBasic_1_prodList_tree')}"<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
								</#if>
								}
						}
					};
				
				
					MESBasic.prodList.baseProdList.tree.treeRootEditSubmit=function(){
						var textValue=CUI("input[name='textValue']").val();
						var url="/foundation/international/editInternationalValue.action";
						CUI.ajax({
							      type:"POST",
							      url:url,
							      data:{textValue:textValue},
							      dataType: 'JSON',
							      success:function(res){
							       	if(res.dealSuccessFlag==true){
						       			international_edit_formDialogErrorBarWidget.showMessage("${getText('foundation.common.saveandclosesuccessful')}","s");
										
										setTimeout(function(){
											try{
												MESBasic.prodList.baseProdList.tree.editTreeRootNameDialog.close();
											}catch(e){}
										},500);
										
										setTimeout(function(){
											MESBasic.prodList.baseProdList.tree.refreshTree(res.currentRootName);
										},500);
		
									}
							      },
							      error:function(XMLHttpRequest, textStatus, errorThrown){
							      	var msg = CUI.parseJSON(XMLHttpRequest.responseText);
									CUI.showErrorInfos(msg,international_edit_formDialogErrorBarWidget);
							      }
							  });
					}
					
					MESBasic.prodList.baseProdList.tree.refreshTree=function(currentRootName){
						var root=MESBasic_prodList_baseProdList_tree_tree.getNodeByParam("id", -1);
						root.prodListName=currentRootName;
						MESBasic_prodList_baseProdList_tree_tree.updateNode(root);
						MESBasic_prodList_baseProdList_tree_tree.cancelSelectedNode();
					}
					
				
				MESBasic.prodList.baseProdList.tree.deletetree = function(){
					var buttonCode='MESBasic_1_prodList_tree_BUTTON_del';
					if(MESBasic.prodList.baseProdList.tree.checkSelectedAny() && MESBasic.prodList.baseProdList.tree.checkTreeRoot()){
						var nodeTemp=MESBasic_prodList_baseProdList_tree_tree.getSelectedNodes()[0];
						if(nodeTemp.cid!='${Session.company.id}'&&nodeTemp.id!=-1){
							workbenchErrorBarWidget.showMessage("${getText('ec.edit.button.uncurrent.company')}",'f');
							return;
						}
						CUI.Dialog.confirm("${getText('foundation.common.checkinvalidnew','删除')}", function(){	
						var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
						 	if(signatureInfo[0] != '') {
						 		signatureUtil.showSignatureDialog(signatureInfo[1],signatureInfo[0],buttonCode,'','delete',true);
						 	}else {
								var node = MESBasic_prodList_baseProdList_tree_tree.getSelectedNodes()[0];
								//MESBasic_prodList_baseProdList_tree_tree.removeNode(node, false);
								CUI.post("/MESBasic/prodList/baseProdList/delete.action?ids=" + node.id + "@" + node.version +"&${getPowerCode('${layoutViewCode!}tree_del_del_MESBasic_1_prodList_tree')}", MESBasic.prodList.baseProdList.tree.callBackInfo, "json");
								//MESBasic_prodList_baseProdList_tree_refresh(); //删除返回结果前不能刷新树
							}
						});
					}
				}
				/*
				*树视图删除回调
				*/
				tree_delete_callback=function(params){
					var node = MESBasic_prodList_baseProdList_tree_tree.getSelectedNodes()[0];
					var deleteUrl="/MESBasic/prodList/baseProdList/delete.action?ids=" + node.id + "@" + node.version +"&${getPowerCode('${layoutViewCode!}tree_del_del_MESBasic_1_prodList_tree')}";
					signatureDialog.close();
					CUI.post(deleteUrl,params,MESBasic.prodList.baseProdList.tree.callBackInfo, "json");
					MESBasic_prodList_baseProdList_tree_refresh();
				}
				
				
				
	MESBasic.prodList.baseProdList.tree.checkSelectedAny = function(){
		var nodes = MESBasic_prodList_baseProdList_tree_tree.getSelectedNodes();
		if(nodes.length > 0){
			return true;
		}else{
			CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
			return false;
		}
	}
	
	MESBasic.prodList.baseProdList.tree.checkTreeRoot = function(){
		var nodes = MESBasic_prodList_baseProdList_tree_tree.getSelectedNodes();
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
	
	
	
	MESBasic.prodList.baseProdList.tree.isTreeRoot = function(){
		var nodes = MESBasic_prodList_baseProdList_tree_tree.getSelectedNodes();
		var node = nodes[0];
		if(node.level == 0){
			return true;
		} else {
			return false;
		}
		
	}
	
	MESBasic.prodList.baseProdList.tree.showDialog = function(url,formId,title,dialogType,buttonCode) {
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
		MESBasic.prodList.baseProdList.tree.Dlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			type : dialogType,
			//type : otherParams.dialogType,
			leaveConfirm : true,
			buttons:buttons
		});
		MESBasic.prodList.baseProdList.tree.Dlg.show();
	};
	
	MESBasic.prodList.baseProdList.tree.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('MESBasic_prodList_baseProdList_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.deleteandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{MESBasic.prodList.baseProdList.tree.Dlg.close();closeLoadPanel();}catch(e){}
				var layout = MESBasic_prodList_baseProdList_tree_getLayout();
				var node = layout.getNode();
				MESBasic_prodList_baseProdList_tree_refresh(null == node ? -1 : node.id,  {operate: res.operate});
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
	MESBasic.prodList.baseProdList.tree.getSelectedNodes = function(callBack){
		var nodes = MESBasic_prodList_baseProdList_tree_tree.getCheckedNodes();
		eval(callBack+"(nodes)");
	}
</#if>

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.prodList.baseProdList.tree.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_prodList_baseProdList_tree_fileupload_button",
		handler:function(){
			if($('#MESBasic_prodList_baseProdList_tree_fileupload').length == 0) {
				$('body').append('<div id="MESBasic_prodList_baseProdList_tree_fileupload"></div>');
			}
			MESBasic.prodList.baseProdList.tree.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "MESBasic_prodList_baseProdList_tree_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#MESBasic_prodList_baseProdList_tree_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			MESBasic.prodList.baseProdList.tree.infoDialog.show();
			if($('#MESBasic_prodList_baseProdList_tree_fileupload').html() == '') {
				$('#MESBasic_prodList_baseProdList_tree_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=MESBasic_prodList_baseProdList&entityCode=MESBasic_1_prodList&dialogId="+dialogId);
			}
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.prodList.baseProdList.tree.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_prodList_tree.MESBasic.prodList.baseProdList." + params.viewName + ".referenceCopy");
			funcName('baseProdList', params.referenceUrl, this);
		}
	}
};
</script>
