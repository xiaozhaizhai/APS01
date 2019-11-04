<#if Parameters?? && (Parameters.pageType?? && Parameters.pageType == 'ref')>
<#assign selectedMultiEnable=true>
<#assign checkboxEnable=true>
<#assign callback="{}">
<#else>
<#assign callback="{onDrop:function(event, treeId, treeNodes, targetNode, moveType, isCop){RM_pickSite_pickSite_pickSiteTree_drop(event, treeId, treeNodes, targetNode, moveType, isCop);}, onDrag:function(event, treeId, treeNodes){RM_pickSite_pickSite_pickSiteTree_drag(event, treeId, treeNodes);}, beforeDragOpen:function(treeId, treeNode){return false;}, beforeDrag:function(treeId, treeNodes){return false;}, onClick:function(event,treeId,node){RM_pickSite_pickSite_pickSiteTree_treeOnclick(event,treeId,node);}, onDblClick:function(event,treeId,node){RM_pickSite_pickSite_pickSiteTree_treeDbOnclick(event,treeId,node);}}">
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
<div id="pickSiteTree_div" style="overflow:scroll;">
</#if>
<@tree movUrl="/RM/pickSite/pickSite/pickSiteTreeDrag.action?${getPowerCode('${layoutViewCode!}pickSiteTree_move_RM_7.5.0.0_pickSite_pickSiteTree')}" id="RM_pickSite_pickSite_pickSiteTree_tree" dataUrl="/RM/pickSite/pickSite/pickSiteTreeData.action?${layoutParams}" rootName="${getText('RM_7.5.0.0_pickSite_pickSiteTree.treeRootName')}" nameCol="name"
			 callback="${callback}" selectedMultiEnable=selectedMultiEnable checkboxEnable=checkboxEnable  canMemory=false />
<#if Parameters?? && (Parameters.pageType?? && Parameters.pageType == 'ref')>
</div>
<script type="text/javascript">
	$(function(){
		var height = $('#pickSiteTree_div').parent().height();
		$('#pickSiteTree_div').css('height', height);
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
<div id="pickSiteTree_sort_div" style="display: none;"> 	
	<div style="position:absolute;left:0px;top:0px;overflow:auto;height:86.5%;;width:75%;display:inline-block;">
		<div id="pickSiteTree_scroll_div" style="margin-left:10px;margin-top:20px;overflow-y:auto;clear:both;height:82%">
		<table cellpadding="0" id="pickSiteTree_fastColTable" style="font-size:12px;width:96%;" cellspacing="0" align="center" class="infoTable">
			<tbody id="pickSiteTree_sort_table">
				
			</tbody>
		</table>
		</div>
	</div>
	<div id="pickSiteTree_fastContent" style="background-color:#f8f6f7;position:absolute;right:0px;top:0px;width:25%;border: 1px solid #efefef; height: 99%;">
		<div class="ec-list-btndiv"><div id="pickSiteTree_first" class="ec-list-topbtn" onclick="RM.pickSite.pickSite.pickSiteTree.firstRow()"></div></div>
		<div class="ec-list-btndiv"><div id="pickSiteTree_up" class="ec-list-prevbtn" onclick="RM.pickSite.pickSite.pickSiteTree.upRow()"></div></div>
		<div class="ec-list-btndiv"><div id="pickSiteTree_down" class="ec-list-nextbtn" onclick="RM.pickSite.pickSite.pickSiteTree.downRow()"></div></div>
		<div class="ec-list-btndiv"><div id="pickSiteTree_last" class="ec-list-lastbtn" onclick="RM.pickSite.pickSite.pickSiteTree.lastRow()"></div></div>
	</div>
</div>
<#if Parameters?? && !(Parameters.pageType?? && Parameters.pageType == 'ref')>
			<div id="pickSiteTree_opratebar" class="opratebar">
				<@operatebar menuCode="${workFlowMenuCode!}"  operates="
					code:${layoutViewCode!}pickSiteTree_setSort_sort_RM_7.5.0.0_pickSite_pickSiteTree||name:${getText('RM.buttonPropertyshowName.radion1503470874255')}||iconcls:sort||useInMore:false||onclick:
						RM.pickSite.pickSite.pickSiteTree.sortpickSiteTree();" 
				resultType="html" />
			</div>
</#if>	


<script type="text/javascript">
CUI.ns("RM.pickSite.pickSite.pickSiteTree");

	RM.pickSite.pickSite.pickSiteTree.cancelSelectedNode = function(parentRes){
		var layout = RM_pickSite_pickSite_pickSiteTree_getLayout();
		var ns = layout.getList();
		if(ns) {
			ns = eval(ns);
			ns.node = null;
		}
		RM_pickSite_pickSite_pickSiteTree_tree.cancelSelectedNode();
	};
	
	RM_pickSite_pickSite_pickSiteTree_cancelSelectedNode = function(parentRes){
		var layout = RM_pickSite_pickSite_pickSiteTree_getLayout();
		var ns = layout.getList();
		if(ns) {
			ns = eval(ns);
			ns.node = null;
		}
		RM_pickSite_pickSite_pickSiteTree_tree.cancelSelectedNode();
	};
	
<#if Parameters?? && !(Parameters.pageType?? && Parameters.pageType == 'ref')>
	
	RM_pickSite_pickSite_pickSiteTree_treeOnclick = function(event,treeId,node){
		var layout = RM_pickSite_pickSite_pickSiteTree_getLayout();
		layout.refresh(node);
	}
	
	RM_pickSite_pickSite_pickSiteTree_treeDbOnclick = function(event,treeId,node){
	}
	
	RM_pickSite_pickSite_pickSiteTree_treeBeforeDrag = function(treeId,node){
	}
	
	RM_pickSite_pickSite_pickSiteTree_treeAfterDrop = function(treeId, treeNodes, targetNode, moveType, isCopy){
	}
	
	RM_pickSite_pickSite_pickSiteTree_drag = function(event, treeId, treeNodes){
		
	}
	
	/*
	RM_pickSite_pickSite_pickSiteTree_beforeDrop = function(treeId, treeNodes, targetNode, moveType, isCopy){
		
	}
	*/
	
	RM_pickSite_pickSite_pickSiteTree_drop = function(event, treeId, treeNodes, targetNode, moveType, isCopy){
		
	}
	
	RM_pickSite_pickSite_pickSiteTree_getNode = function(){
		return RM_pickSite_pickSite_pickSiteTree_tree.getSelectedNodes();
	}
	
	RM_pickSite_pickSite_pickSiteTree_refreshNodeId = function(node, operate){
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
	
	
	RM_pickSite_pickSite_pickSiteTree_refreshRootNode = function(){
		var rootNode = RM_pickSite_pickSite_pickSiteTree_tree.getNodeByParam( "id", -1 );
		RM_pickSite_pickSite_pickSiteTree_tree.reAsyncChildNodes( rootNode, "refresh" );
		RM_pickSite_pickSite_pickSiteTree_tree.selectNode( rootNode )
		$("#" + rootNode.tId + "_a").trigger('click');
	}
	
	RM_pickSite_pickSite_pickSiteTree_refresh = function(nodeId, data){		
		var node = RM_pickSite_pickSite_pickSiteTree_tree.getNodeByParam("id", nodeId ? nodeId : -1);
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
		RM_pickSite_pickSite_pickSiteTree_tree.setting.callback.customOnAsyncSuccessMethod = function(event, treeId, treeNode, msg){
			if(treeNode && treeNode.children.length == 0) {
				treeNode.isParent = false;
				RM_pickSite_pickSite_pickSiteTree_tree.updateNode(treeNode);
			}
			var layout = RM_pickSite_pickSite_pickSiteTree_getLayout();
			var checkNode = layout.node;
			if(checkNode != null){
				checkNode = RM_pickSite_pickSite_pickSiteTree_tree.getNodeByParam("id", checkNode.id);
				if (!checkNode) {// 删除情况，从根节点刷新
                    checkNode = RM_pickSite_pickSite_pickSiteTree_tree.getNodeByParam("id", -1)                    				    
                }
				$("#" + checkNode.tId + "_a").trigger('click');
			} 
		}
		RM_pickSite_pickSite_pickSiteTree_tree.reAsyncChildNodes(node,"refresh");
	}
	
				
				RM.pickSite.pickSite.pickSiteTree.sortpickSiteTree = function(){
					if(RM.pickSite.pickSite.pickSiteTree.checkSelectedAny()){
						var node = RM_pickSite_pickSite_pickSiteTree_tree.getSelectedNodes()[0];
						$('#pickSiteTree_sort_table').empty();
						
						if(node.id != -1){
							var nodes = node.getParentNode().children;
							for(var i = 0; i < nodes.length; i++){
								if(i % 2 == 0){
									var tr = $('<tr double="true" id="' + nodes[i].id + '" class="even-num" onmousedown="RM.pickSite.pickSite.pickSiteTree.selectRow(this);"><td align="center" style="width:90%;">' + nodes[i].name + '</td></tr>');
								}else{
									var tr = $('<tr double="false" id="' + nodes[i].id + '" onmousedown="RM.pickSite.pickSite.pickSiteTree.selectRow(this);"><td align="center" style="width:90%;">' + nodes[i].name + '</td></tr>');
								}
								$('#pickSiteTree_sort_table').append(tr);
							}
							new CUI.Dialog({
								title : "${getText('foundation.common.sort')}",
								modal : true,
								//type:3,
								width:460,
								height:330,
								elementId: "pickSiteTree_sort_div",
								buttons:[
									{	
										name:"${getText('common.button.save')}",
										handler:function(){
											var trs = $('tr',$('#pickSiteTree_sort_div'));
											var result = "";
											for(var i = 0; i < trs.length; i++){
												result += $(trs[i]).attr('id') + ":" + i + ";"
											}
											var dialog = this;
											$.ajax({
												url : "/RM/pickSite/pickSite/pickSiteTreeSort.action",
												type : 'post',
												async : false,
												data:{"sortResult":result},
												success : function(msg) {
													CUI.Dialog.alert("设置成功");
													var root = RM_pickSite_pickSite_pickSiteTree_tree.getNodeByParam('id', -1);
													RM_pickSite_pickSite_pickSiteTree_tree.reAsyncChildNodes(root, "refresh");
													dialog.close();
												}
											});
										}
									},
									{
										name:"${getText('foundation.common.closed')}",
										type:"cancel"
									}
									]
							}).show();
						}
					}
				};	
				
				RM.pickSite.pickSite.pickSiteTree.operateSortBtn = function(type) {
		          type = type || {};
		          var up = type.up,
		              down = type.down;
		
		          if (up === 1) { // 禁止
		            $("#pickSiteTree_first",'#pickSiteTree_sort_div').attr("class", "ec-list-dis-topbtn");
								$("#pickSiteTree_up",'#pickSiteTree_sort_div').attr("class", "ec-list-dis-prevbtn");
		          }
		
		          if (down === 1) {
		            $("#pickSiteTree_down",'#pickSiteTree_sort_div').attr("class", "ec-list-dis-nextbtn");
								$("#pickSiteTree_last",'#pickSiteTree_sort_div').attr("class", "ec-list-dis-lastbtn");
		          }
		
		          if (typeof up === "undefined" && typeof down === "undefined") {
		            $("#pickSiteTree_first",'#pickSiteTree_sort_div').attr("class", "ec-list-topbtn");
		            $("#pickSiteTree_up",'#pickSiteTree_sort_div').attr("class", "ec-list-prevbtn");
		            $("#pickSiteTree_down",'#pickSiteTree_sort_div').attr("class", "ec-list-nextbtn");
		            $("#pickSiteTree_last",'#pickSiteTree_sort_div').attr("class", "ec-list-lastbtn");
		          }
		
		        };
				
				RM.pickSite.pickSite.pickSiteTree.selectRow = function(obj){
				    var $this = $(obj);
		            if ($this.hasClass('sort-selected')) return ;
		            $('.sort-selected').removeClass('sort-selected');
		            $this.addClass('sort-selected');
		
		            // 判断按钮
		            var prevIndex = $this.prev().index(),
		              nextIndex = $this.next().index();
		
		            RM.pickSite.pickSite.pickSiteTree.operateSortBtn();
		
		            if (prevIndex == -1) {
		              RM.pickSite.pickSite.pickSiteTree.operateSortBtn({up: 1});
		            }
		
		            if (nextIndex == -1) {
		              RM.pickSite.pickSite.pickSiteTree.operateSortBtn({down: 1});
		            }
          
          
					/*$('.sort-selected').each(function(){
						$(this).removeClass("sort-selected");
						if($(this).attr('double') == true) {
							$(this).addClass("even-num");
						}
					});
					if($(obj).attr('double') == true) {
						$(obj).removeClass("even-num");
					}
					$(obj).addClass("sort-selected");
					if($(obj).index() == 0){
						$("#pickSiteTree_first",'#pickSiteTree_sort_div').removeClass("ec-list-topbtn").addClass("ec-list-dis-topbtn");
						$("#pickSiteTree_up",'#pickSiteTree_sort_div').removeClass("ec-list-prevbtn").addClass("ec-list-dis-prevbtn");
						$("#pickSiteTree_down",'#pickSiteTree_sort_div').removeClass("ec-list-dis-nextbtn").addClass("ec-list-nextbtn");
						$("#pickSiteTree_last",'#pickSiteTree_sort_div').removeClass("ec-list-dis-lastbtn").addClass("ec-list-lastbtn");
					}
					if($(obj).next().index() == -1){
						$("#pickSiteTree_down",'#pickSiteTree_sort_div').removeClass("ec-list-nextbtn").addClass("ec-list-dis-nextbtn");
						$("#pickSiteTree_last",'#pickSiteTree_sort_div').removeClass("ec-list-lastbtn").addClass("ec-list-dis-lastbtn");
						$("#pickSiteTree_first",'#pickSiteTree_sort_div').removeClass("ec-list-dis-topbtn").addClass("ec-list-topbtn");
						$("#pickSiteTree_up",'#pickSiteTree_sort_div').removeClass("ec-list-dis-prevbtn").addClass("ec-list-prevbtn");
					}*/
				};
				
				RM.pickSite.pickSite.pickSiteTree.firstRow = function(){
					if($('.sort-selected').length==0){
						CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
						return;
					}
					var target = $('.sort-selected')[0];
					if (target.parentNode.childNodes.length === 1) return;
					if($('.sort-selected')[0] != $('tr',$('#pickSiteTree_sort_div')).first()[0]){
						var first = $('tr',$('#pickSiteTree_sort_div')).first()[0];
						$(first).before(target);
					}
					$('tr:even','#pickSiteTree_sort_div').addClass('even-num').attr('double',"true");
					$('tr:odd','#pickSiteTree_sort_div').removeClass('even-num').attr('double',"false");
					
					$("#pickSiteTree_first",'#pickSiteTree_sort_div').removeClass("ec-list-topbtn").addClass("ec-list-dis-topbtn");
					$("#pickSiteTree_up",'#pickSiteTree_sort_div').removeClass("ec-list-prevbtn").addClass("ec-list-dis-prevbtn");
					$("#pickSiteTree_down",'#pickSiteTree_sort_div').removeClass("ec-list-dis-nextbtn").addClass("ec-list-nextbtn");
					$("#pickSiteTree_last",'#pickSiteTree_sort_div').removeClass("ec-list-dis-lastbtn").addClass("ec-list-lastbtn");
					
					$("#pickSiteTree_scroll_div").scrollTop(0);
				};
				
				RM.pickSite.pickSite.pickSiteTree.upRow = function(){
					if($('.sort-selected').length==0){
						CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
						return;
					}
					var target = $('.sort-selected')[0];
					if($(target).prev()){
						$(target).prev().before(target);
					}
					if($(target).index() == 0){
						$("#pickSiteTree_first",'#pickSiteTree_sort_div').removeClass("ec-list-topbtn").addClass("ec-list-dis-topbtn");
						$("#pickSiteTree_up",'#pickSiteTree_sort_div').removeClass("ec-list-prevbtn").addClass("ec-list-dis-prevbtn");
					}
					if($(target).next().index() != -1){
						$("#pickSiteTree_down",'#pickSiteTree_sort_div').removeClass("ec-list-dis-nextbtn").addClass("ec-list-nextbtn");
						$("#pickSiteTree_last",'#pickSiteTree_sort_div').removeClass("ec-list-dis-lastbtn").addClass("ec-list-lastbtn");
					}
					$('tr:even','#pickSiteTree_sort_div').addClass('even-num').attr('double',"true");
					$('tr:odd','#pickSiteTree_sort_div').removeClass('even-num').attr('double',"false");
					
					$("#pickSiteTree_scroll_div").scrollTop( $("#pickSiteTree_scroll_div").scrollTop() - 30);
				};
				
				RM.pickSite.pickSite.pickSiteTree.downRow = function(){
					if($('.sort-selected').length==0){
						CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
						return;
					}
					var target = $('.sort-selected')[0];
					if($(target).next()){
						$(target).next().after(target);
					}
					if($(target).index() != 0){
						$("#pickSiteTree_first",'#pickSiteTree_sort_div').removeClass("ec-list-dis-topbtn").addClass("ec-list-topbtn");
						$("#pickSiteTree_up",'#pickSiteTree_sort_div').removeClass("ec-list-dis-prevbtn").addClass("ec-list-prevbtn");
					}
					if($(target).next().index() == -1){
						$("#pickSiteTree_down",'#pickSiteTree_sort_div').removeClass("ec-list-nextbtn").addClass("ec-list-dis-nextbtn");
							$("#pickSiteTree_last",'#pickSiteTree_sort_div').removeClass("ec-list-lastbtn").addClass("ec-list-dis-lastbtn");
					}
					$('tr:even','#pickSiteTree_sort_div').addClass('even-num').attr('double',"true");
					$('tr:odd','#pickSiteTree_sort_div').removeClass('even-num').attr('double',"false");
					
					$("#pickSiteTree_scroll_div").scrollTop( $("#pickSiteTree_scroll_div").scrollTop() + 30);
				};
				
				RM.pickSite.pickSite.pickSiteTree.lastRow = function(){
					if($('.sort-selected').length==0){
						CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
						return;
					}
					var target = $('.sort-selected')[0];
					if (target.parentNode.childNodes.length === 1) return;
					if($('.sort-selected')[0] != $('tr',$('#pickSiteTree_sort_div')).last()[0]){
						var last = $('tr',$('#pickSiteTree_sort_div')).last()[0];
						$(last).after(target);
					}
					$('tr:even','#pickSiteTree_sort_div').addClass('even-num').attr('double',"true");
					$('tr:odd','#pickSiteTree_sort_div').removeClass('even-num').attr('double',"false");
					
					$("#pickSiteTree_first",'#pickSiteTree_sort_div').removeClass("ec-list-dis-topbtn").addClass("ec-list-topbtn");
					$("#pickSiteTree_up",'#pickSiteTree_sort_div').removeClass("ec-list-dis-prevbtn").addClass("ec-list-prevbtn");
					$("#pickSiteTree_down",'#pickSiteTree_sort_div').removeClass("ec-list-nextbtn").addClass("ec-list-dis-nextbtn");
					$("#pickSiteTree_last",'#pickSiteTree_sort_div').removeClass("ec-list-lastbtn").addClass("ec-list-dis-lastbtn");
					
					$("#pickSiteTree_scroll_div").scrollTop($("#pickSiteTree_scroll_div").height());
				};
				
				
	RM.pickSite.pickSite.pickSiteTree.checkSelectedAny = function(){
		var nodes = RM_pickSite_pickSite_pickSiteTree_tree.getSelectedNodes();
		if(nodes.length > 0){
			return true;
		}else{
			CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
			return false;
		}
	}
	
	RM.pickSite.pickSite.pickSiteTree.checkTreeRoot = function(){
		var nodes = RM_pickSite_pickSite_pickSiteTree_tree.getSelectedNodes();
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
	
	
	
	RM.pickSite.pickSite.pickSiteTree.isTreeRoot = function(){
		var nodes = RM_pickSite_pickSite_pickSiteTree_tree.getSelectedNodes();
		var node = nodes[0];
		if(node.level == 0){
			return true;
		} else {
			return false;
		}
		
	}
	
	RM.pickSite.pickSite.pickSiteTree.showDialog = function(url,formId,title,dialogType,buttonCode) {
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
		RM.pickSite.pickSite.pickSiteTree.Dlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			type : dialogType,
			//type : otherParams.dialogType,
			leaveConfirm : true,
			buttons:buttons
		});
		RM.pickSite.pickSite.pickSiteTree.Dlg.show();
	};
	
	RM.pickSite.pickSite.pickSiteTree.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('RM_pickSite_pickSite_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.deleteandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{RM.pickSite.pickSite.pickSiteTree.Dlg.close();closeLoadPanel();}catch(e){}
				var layout = RM_pickSite_pickSite_pickSiteTree_getLayout();
				var node = layout.getNode();
				RM_pickSite_pickSite_pickSiteTree_refresh(null == node ? -1 : node.id,  {operate: res.operate});
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	(function(){
		if($('#pickSiteTree_opratebar').length > 0){
			$('#pickSiteTree_buttonbar').append($('#pickSiteTree_opratebar'));
		}
		if($('#pickSiteTree_opratebar').children().length == 0){
			$('#pickSiteTree_opratebar').hide();
		}
	})();
	
<#else>
	RM.pickSite.pickSite.pickSiteTree.getSelectedNodes = function(callBack){
		var nodes = RM_pickSite_pickSite_pickSiteTree_tree.getCheckedNodes();
		eval(callBack+"(nodes)");
	}
</#if>

/**
 * dialog创建附件上传按钮
 * @private
 */
RM.pickSite.pickSite.pickSiteTree.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"RM_pickSite_pickSite_pickSiteTree_fileupload_button",
		handler:function(){
			if($('#RM_pickSite_pickSite_pickSiteTree_fileupload').length == 0) {
				$('body').append('<div id="RM_pickSite_pickSite_pickSiteTree_fileupload"></div>');
			}
			RM.pickSite.pickSite.pickSiteTree.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "RM_pickSite_pickSite_pickSiteTree_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#RM_pickSite_pickSite_pickSiteTree_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			RM.pickSite.pickSite.pickSiteTree.infoDialog.show();
			if($('#RM_pickSite_pickSite_pickSiteTree_fileupload').html() == '') {
				$('#RM_pickSite_pickSite_pickSiteTree_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=RM_pickSite_pickSite&entityCode=RM_7.5.0.0_pickSite&dialogId="+dialogId);
			}
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
RM.pickSite.pickSite.pickSiteTree.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_pickSite_pickSiteTree.RM.pickSite.pickSite." + params.viewName + ".referenceCopy");
			funcName('pickSite', params.referenceUrl, this);
		}
	}
};
</script>
