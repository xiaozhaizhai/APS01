<#if Parameters?? && (Parameters.pageType?? && Parameters.pageType == 'ref')>
<#assign selectedMultiEnable=true>
<#assign checkboxEnable=true>
<#assign callback="{}">
<#else>
<#assign callback="{onDrop:function(event, treeId, treeNodes, targetNode, moveType, isCop){MESBasic_factoryModel_factoryModel_factoryTreePart_drop(event, treeId, treeNodes, targetNode, moveType, isCop);}, onDrag:function(event, treeId, treeNodes){MESBasic_factoryModel_factoryModel_factoryTreePart_drag(event, treeId, treeNodes);}, beforeDragOpen:function(treeId, treeNode){return false;}, beforeDrag:function(treeId, treeNodes){return false;}, onClick:function(event,treeId,node){MESBasic_factoryModel_factoryModel_factoryTreePart_treeOnclick(event,treeId,node);}, onDblClick:function(event,treeId,node){MESBasic_factoryModel_factoryModel_factoryTreePart_treeDbOnclick(event,treeId,node);}}">
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
<div id="factoryTreePart_div" style="overflow:scroll;">
</#if>
<@tree movUrl="/MESBasic/factoryModel/factoryModel/factoryTreePartDrag.action?${getPowerCode('${layoutViewCode!}factoryTreePart_move_MESBasic_1_factoryModel_factoryTreePart')}" id="MESBasic_factoryModel_factoryModel_factoryTreePart_tree" dataUrl="/MESBasic/factoryModel/factoryModel/factoryTreePartData.action?${layoutParams}" rootName="${getText('MESBasic.treeRootName.radion1420598208976')}" nameCol="name"
			 callback="${callback}" selectedMultiEnable=selectedMultiEnable checkboxEnable=checkboxEnable  canMemory=false />
<#if Parameters?? && (Parameters.pageType?? && Parameters.pageType == 'ref')>
</div>
<script type="text/javascript">
	$(function(){
		var height = $('#factoryTreePart_div').parent().height();
		$('#factoryTreePart_div').css('height', height);
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
<div id="factoryTreePart_sort_div" style="display: none;"> 	
	<div style="position:absolute;left:0px;top:0px;overflow:auto;height:86.5%;;width:75%;display:inline-block;">
		<div id="factoryTreePart_scroll_div" style="margin-left:10px;margin-top:20px;overflow-y:auto;clear:both;height:82%">
		<table cellpadding="0" id="factoryTreePart_fastColTable" style="font-size:12px;width:96%;" cellspacing="0" align="center" class="infoTable">
			<tbody id="factoryTreePart_sort_table">
				
			</tbody>
		</table>
		</div>
	</div>
	<div id="factoryTreePart_fastContent" style="background-color:#f8f6f7;position:absolute;right:0px;top:0px;width:25%;border: 1px solid #efefef; height: 99%;">
		<div class="ec-list-btndiv"><div id="factoryTreePart_first" class="ec-list-topbtn" onclick="MESBasic.factoryModel.factoryModel.factoryTreePart.firstRow()"></div></div>
		<div class="ec-list-btndiv"><div id="factoryTreePart_up" class="ec-list-prevbtn" onclick="MESBasic.factoryModel.factoryModel.factoryTreePart.upRow()"></div></div>
		<div class="ec-list-btndiv"><div id="factoryTreePart_down" class="ec-list-nextbtn" onclick="MESBasic.factoryModel.factoryModel.factoryTreePart.downRow()"></div></div>
		<div class="ec-list-btndiv"><div id="factoryTreePart_last" class="ec-list-lastbtn" onclick="MESBasic.factoryModel.factoryModel.factoryTreePart.lastRow()"></div></div>
	</div>
</div>
<#if Parameters?? && !(Parameters.pageType?? && Parameters.pageType == 'ref')>
			<div id="factoryTreePart_opratebar" class="opratebar">
				<@operatebar menuCode="${workFlowMenuCode!}"  operates="
					code:${layoutViewCode!}factoryTreePart_sort_sort_MESBasic_1_factoryModel_factoryTreePart||name:${getText('MESBasic.buttonPropertyshowName.radion1422753834332')}||iconcls:sort||useInMore:false||onclick:
						MESBasic.factoryModel.factoryModel.factoryTreePart.sortfactoryTreePart();" 
				resultType="html" />
			</div>
</#if>	


<script type="text/javascript">
CUI.ns("MESBasic.factoryModel.factoryModel.factoryTreePart");

	MESBasic.factoryModel.factoryModel.factoryTreePart.cancelSelectedNode = function(parentRes){
		var layout = MESBasic_factoryModel_factoryModel_factoryTreePart_getLayout();
		var ns = layout.getList();
		if(ns) {
			ns = eval(ns);
			ns.node = null;
		}
		MESBasic_factoryModel_factoryModel_factoryTreePart_tree.cancelSelectedNode();
	};
	
	MESBasic_factoryModel_factoryModel_factoryTreePart_cancelSelectedNode = function(parentRes){
		var layout = MESBasic_factoryModel_factoryModel_factoryTreePart_getLayout();
		var ns = layout.getList();
		if(ns) {
			ns = eval(ns);
			ns.node = null;
		}
		MESBasic_factoryModel_factoryModel_factoryTreePart_tree.cancelSelectedNode();
	};
	
<#if Parameters?? && !(Parameters.pageType?? && Parameters.pageType == 'ref')>
	
	MESBasic_factoryModel_factoryModel_factoryTreePart_treeOnclick = function(event,treeId,node){
		var layout = MESBasic_factoryModel_factoryModel_factoryTreePart_getLayout();
		layout.refresh(node);
	}
	
	MESBasic_factoryModel_factoryModel_factoryTreePart_treeDbOnclick = function(event,treeId,node){
	}
	
	MESBasic_factoryModel_factoryModel_factoryTreePart_treeBeforeDrag = function(treeId,node){
	}
	
	MESBasic_factoryModel_factoryModel_factoryTreePart_treeAfterDrop = function(treeId, treeNodes, targetNode, moveType, isCopy){
	}
	
	MESBasic_factoryModel_factoryModel_factoryTreePart_drag = function(event, treeId, treeNodes){
		
	}
	
	/*
	MESBasic_factoryModel_factoryModel_factoryTreePart_beforeDrop = function(treeId, treeNodes, targetNode, moveType, isCopy){
		
	}
	*/
	
	MESBasic_factoryModel_factoryModel_factoryTreePart_drop = function(event, treeId, treeNodes, targetNode, moveType, isCopy){
		
	}
	
	MESBasic_factoryModel_factoryModel_factoryTreePart_getNode = function(){
		return MESBasic_factoryModel_factoryModel_factoryTreePart_tree.getSelectedNodes();
	}
	
	MESBasic_factoryModel_factoryModel_factoryTreePart_refreshNodeId = function(node, operate){
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
	
	
	MESBasic_factoryModel_factoryModel_factoryTreePart_refreshRootNode = function(){
		var rootNode = MESBasic_factoryModel_factoryModel_factoryTreePart_tree.getNodeByParam( "id", -1 );
		MESBasic_factoryModel_factoryModel_factoryTreePart_tree.reAsyncChildNodes( rootNode, "refresh" );
		MESBasic_factoryModel_factoryModel_factoryTreePart_tree.selectNode( rootNode )
		$("#" + rootNode.tId + "_a").trigger('click');
	}
	
	MESBasic_factoryModel_factoryModel_factoryTreePart_refresh = function(nodeId, data){		
		var node = MESBasic_factoryModel_factoryModel_factoryTreePart_tree.getNodeByParam("id", nodeId ? nodeId : -1);
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
		MESBasic_factoryModel_factoryModel_factoryTreePart_tree.setting.callback.customOnAsyncSuccessMethod = function(event, treeId, treeNode, msg){
			if(treeNode && treeNode.children.length == 0) {
				treeNode.isParent = false;
				MESBasic_factoryModel_factoryModel_factoryTreePart_tree.updateNode(treeNode);
			}
			var layout = MESBasic_factoryModel_factoryModel_factoryTreePart_getLayout();
			var checkNode = layout.node;
			if(checkNode != null){
				checkNode = MESBasic_factoryModel_factoryModel_factoryTreePart_tree.getNodeByParam("id", checkNode.id);
				if (!checkNode) {// 删除情况，从根节点刷新
                    checkNode = MESBasic_factoryModel_factoryModel_factoryTreePart_tree.getNodeByParam("id", -1)                    				    
                }
				$("#" + checkNode.tId + "_a").trigger('click');
			} 
		}
		MESBasic_factoryModel_factoryModel_factoryTreePart_tree.reAsyncChildNodes(node,"refresh");
	}
	
				MESBasic.factoryModel.factoryModel.factoryTreePart.sortfactoryTreePart = function(){
					if(MESBasic.factoryModel.factoryModel.factoryTreePart.checkSelectedAny()){
						var node = MESBasic_factoryModel_factoryModel_factoryTreePart_tree.getSelectedNodes()[0];
						$('#factoryTreePart_sort_table').empty();
						
						if(node.id != -1){
							var nodes = node.getParentNode().children;
							for(var i = 0; i < nodes.length; i++){
								if(i % 2 == 0){
									var tr = $('<tr double="true" id="' + nodes[i].id + '" class="even-num" onmousedown="MESBasic.factoryModel.factoryModel.factoryTreePart.selectRow(this);"><td align="center" style="width:90%;">' + nodes[i].name + '</td></tr>');
								}else{
									var tr = $('<tr double="false" id="' + nodes[i].id + '" onmousedown="MESBasic.factoryModel.factoryModel.factoryTreePart.selectRow(this);"><td align="center" style="width:90%;">' + nodes[i].name + '</td></tr>');
								}
								$('#factoryTreePart_sort_table').append(tr);
							}
							new CUI.Dialog({
								title : "${getText('foundation.common.sort')}",
								modal : true,
								//type:3,
								width:460,
								height:330,
								elementId: "factoryTreePart_sort_div",
								buttons:[
									{	
										name:"${getText('common.button.save')}",
										handler:function(){
											var trs = $('tr',$('#factoryTreePart_sort_div'));
											var result = "";
											for(var i = 0; i < trs.length; i++){
												result += $(trs[i]).attr('id') + ":" + i + ";"
											}
											var dialog = this;
											$.ajax({
												url : "/MESBasic/factoryModel/factoryModel/factoryTreePartSort.action",
												type : 'post',
												async : false,
												data:{"sortResult":result},
												success : function(msg) {
													CUI.Dialog.alert("设置成功");
													var root = MESBasic_factoryModel_factoryModel_factoryTreePart_tree.getNodeByParam('id', -1);
													MESBasic_factoryModel_factoryModel_factoryTreePart_tree.reAsyncChildNodes(root, "refresh");
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
				
				MESBasic.factoryModel.factoryModel.factoryTreePart.operateSortBtn = function(type) {
		          type = type || {};
		          var up = type.up,
		              down = type.down;
		
		          if (up === 1) { // 禁止
		            $("#factoryTreePart_first",'#factoryTreePart_sort_div').attr("class", "ec-list-dis-topbtn");
								$("#factoryTreePart_up",'#factoryTreePart_sort_div').attr("class", "ec-list-dis-prevbtn");
		          }
		
		          if (down === 1) {
		            $("#factoryTreePart_down",'#factoryTreePart_sort_div').attr("class", "ec-list-dis-nextbtn");
								$("#factoryTreePart_last",'#factoryTreePart_sort_div').attr("class", "ec-list-dis-lastbtn");
		          }
		
		          if (typeof up === "undefined" && typeof down === "undefined") {
		            $("#factoryTreePart_first",'#factoryTreePart_sort_div').attr("class", "ec-list-topbtn");
		            $("#factoryTreePart_up",'#factoryTreePart_sort_div').attr("class", "ec-list-prevbtn");
		            $("#factoryTreePart_down",'#factoryTreePart_sort_div').attr("class", "ec-list-nextbtn");
		            $("#factoryTreePart_last",'#factoryTreePart_sort_div').attr("class", "ec-list-lastbtn");
		          }
		
		        };
				
				MESBasic.factoryModel.factoryModel.factoryTreePart.selectRow = function(obj){
				    var $this = $(obj);
		            if ($this.hasClass('sort-selected')) return ;
		            $('.sort-selected').removeClass('sort-selected');
		            $this.addClass('sort-selected');
		
		            // 判断按钮
		            var prevIndex = $this.prev().index(),
		              nextIndex = $this.next().index();
		
		            MESBasic.factoryModel.factoryModel.factoryTreePart.operateSortBtn();
		
		            if (prevIndex == -1) {
		              MESBasic.factoryModel.factoryModel.factoryTreePart.operateSortBtn({up: 1});
		            }
		
		            if (nextIndex == -1) {
		              MESBasic.factoryModel.factoryModel.factoryTreePart.operateSortBtn({down: 1});
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
						$("#factoryTreePart_first",'#factoryTreePart_sort_div').removeClass("ec-list-topbtn").addClass("ec-list-dis-topbtn");
						$("#factoryTreePart_up",'#factoryTreePart_sort_div').removeClass("ec-list-prevbtn").addClass("ec-list-dis-prevbtn");
						$("#factoryTreePart_down",'#factoryTreePart_sort_div').removeClass("ec-list-dis-nextbtn").addClass("ec-list-nextbtn");
						$("#factoryTreePart_last",'#factoryTreePart_sort_div').removeClass("ec-list-dis-lastbtn").addClass("ec-list-lastbtn");
					}
					if($(obj).next().index() == -1){
						$("#factoryTreePart_down",'#factoryTreePart_sort_div').removeClass("ec-list-nextbtn").addClass("ec-list-dis-nextbtn");
						$("#factoryTreePart_last",'#factoryTreePart_sort_div').removeClass("ec-list-lastbtn").addClass("ec-list-dis-lastbtn");
						$("#factoryTreePart_first",'#factoryTreePart_sort_div').removeClass("ec-list-dis-topbtn").addClass("ec-list-topbtn");
						$("#factoryTreePart_up",'#factoryTreePart_sort_div').removeClass("ec-list-dis-prevbtn").addClass("ec-list-prevbtn");
					}*/
				};
				
				MESBasic.factoryModel.factoryModel.factoryTreePart.firstRow = function(){
					if($('.sort-selected').length==0){
						CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
						return;
					}
					var target = $('.sort-selected')[0];
					if (target.parentNode.childNodes.length === 1) return;
					if($('.sort-selected')[0] != $('tr',$('#factoryTreePart_sort_div')).first()[0]){
						var first = $('tr',$('#factoryTreePart_sort_div')).first()[0];
						$(first).before(target);
					}
					$('tr:even','#factoryTreePart_sort_div').addClass('even-num').attr('double',"true");
					$('tr:odd','#factoryTreePart_sort_div').removeClass('even-num').attr('double',"false");
					
					$("#factoryTreePart_first",'#factoryTreePart_sort_div').removeClass("ec-list-topbtn").addClass("ec-list-dis-topbtn");
					$("#factoryTreePart_up",'#factoryTreePart_sort_div').removeClass("ec-list-prevbtn").addClass("ec-list-dis-prevbtn");
					$("#factoryTreePart_down",'#factoryTreePart_sort_div').removeClass("ec-list-dis-nextbtn").addClass("ec-list-nextbtn");
					$("#factoryTreePart_last",'#factoryTreePart_sort_div').removeClass("ec-list-dis-lastbtn").addClass("ec-list-lastbtn");
					
					$("#factoryTreePart_scroll_div").scrollTop(0);
				};
				
				MESBasic.factoryModel.factoryModel.factoryTreePart.upRow = function(){
					if($('.sort-selected').length==0){
						CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
						return;
					}
					var target = $('.sort-selected')[0];
					if($(target).prev()){
						$(target).prev().before(target);
					}
					if($(target).index() == 0){
						$("#factoryTreePart_first",'#factoryTreePart_sort_div').removeClass("ec-list-topbtn").addClass("ec-list-dis-topbtn");
						$("#factoryTreePart_up",'#factoryTreePart_sort_div').removeClass("ec-list-prevbtn").addClass("ec-list-dis-prevbtn");
					}
					if($(target).next().index() != -1){
						$("#factoryTreePart_down",'#factoryTreePart_sort_div').removeClass("ec-list-dis-nextbtn").addClass("ec-list-nextbtn");
						$("#factoryTreePart_last",'#factoryTreePart_sort_div').removeClass("ec-list-dis-lastbtn").addClass("ec-list-lastbtn");
					}
					$('tr:even','#factoryTreePart_sort_div').addClass('even-num').attr('double',"true");
					$('tr:odd','#factoryTreePart_sort_div').removeClass('even-num').attr('double',"false");
					
					$("#factoryTreePart_scroll_div").scrollTop( $("#factoryTreePart_scroll_div").scrollTop() - 30);
				};
				
				MESBasic.factoryModel.factoryModel.factoryTreePart.downRow = function(){
					if($('.sort-selected').length==0){
						CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
						return;
					}
					var target = $('.sort-selected')[0];
					if($(target).next()){
						$(target).next().after(target);
					}
					if($(target).index() != 0){
						$("#factoryTreePart_first",'#factoryTreePart_sort_div').removeClass("ec-list-dis-topbtn").addClass("ec-list-topbtn");
						$("#factoryTreePart_up",'#factoryTreePart_sort_div').removeClass("ec-list-dis-prevbtn").addClass("ec-list-prevbtn");
					}
					if($(target).next().index() == -1){
						$("#factoryTreePart_down",'#factoryTreePart_sort_div').removeClass("ec-list-nextbtn").addClass("ec-list-dis-nextbtn");
							$("#factoryTreePart_last",'#factoryTreePart_sort_div').removeClass("ec-list-lastbtn").addClass("ec-list-dis-lastbtn");
					}
					$('tr:even','#factoryTreePart_sort_div').addClass('even-num').attr('double',"true");
					$('tr:odd','#factoryTreePart_sort_div').removeClass('even-num').attr('double',"false");
					
					$("#factoryTreePart_scroll_div").scrollTop( $("#factoryTreePart_scroll_div").scrollTop() + 30);
				};
				
				MESBasic.factoryModel.factoryModel.factoryTreePart.lastRow = function(){
					if($('.sort-selected').length==0){
						CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
						return;
					}
					var target = $('.sort-selected')[0];
					if (target.parentNode.childNodes.length === 1) return;
					if($('.sort-selected')[0] != $('tr',$('#factoryTreePart_sort_div')).last()[0]){
						var last = $('tr',$('#factoryTreePart_sort_div')).last()[0];
						$(last).after(target);
					}
					$('tr:even','#factoryTreePart_sort_div').addClass('even-num').attr('double',"true");
					$('tr:odd','#factoryTreePart_sort_div').removeClass('even-num').attr('double',"false");
					
					$("#factoryTreePart_first",'#factoryTreePart_sort_div').removeClass("ec-list-dis-topbtn").addClass("ec-list-topbtn");
					$("#factoryTreePart_up",'#factoryTreePart_sort_div').removeClass("ec-list-dis-prevbtn").addClass("ec-list-prevbtn");
					$("#factoryTreePart_down",'#factoryTreePart_sort_div').removeClass("ec-list-nextbtn").addClass("ec-list-dis-nextbtn");
					$("#factoryTreePart_last",'#factoryTreePart_sort_div').removeClass("ec-list-lastbtn").addClass("ec-list-dis-lastbtn");
					
					$("#factoryTreePart_scroll_div").scrollTop($("#factoryTreePart_scroll_div").height());
				};
				
				
				
	MESBasic.factoryModel.factoryModel.factoryTreePart.checkSelectedAny = function(){
		var nodes = MESBasic_factoryModel_factoryModel_factoryTreePart_tree.getSelectedNodes();
		if(nodes.length > 0){
			return true;
		}else{
			CUI.Dialog.alert("${getText('ec.view.treeNodeSelect')}");
			return false;
		}
	}
	
	MESBasic.factoryModel.factoryModel.factoryTreePart.checkTreeRoot = function(){
		var nodes = MESBasic_factoryModel_factoryModel_factoryTreePart_tree.getSelectedNodes();
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
	
	
	
	MESBasic.factoryModel.factoryModel.factoryTreePart.isTreeRoot = function(){
		var nodes = MESBasic_factoryModel_factoryModel_factoryTreePart_tree.getSelectedNodes();
		var node = nodes[0];
		if(node.level == 0){
			return true;
		} else {
			return false;
		}
		
	}
	
	MESBasic.factoryModel.factoryModel.factoryTreePart.showDialog = function(url,formId,title,dialogType,buttonCode) {
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
		MESBasic.factoryModel.factoryModel.factoryTreePart.Dlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			type : dialogType,
			//type : otherParams.dialogType,
			leaveConfirm : true,
			buttons:buttons
		});
		MESBasic.factoryModel.factoryModel.factoryTreePart.Dlg.show();
	};
	
	MESBasic.factoryModel.factoryModel.factoryTreePart.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('MESBasic_factoryModel_factoryModel_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.deleteandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{MESBasic.factoryModel.factoryModel.factoryTreePart.Dlg.close();closeLoadPanel();}catch(e){}
				var layout = MESBasic_factoryModel_factoryModel_factoryTreePart_getLayout();
				var node = layout.getNode();
				MESBasic_factoryModel_factoryModel_factoryTreePart_refresh(null == node ? -1 : node.id,  {operate: res.operate});
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	(function(){
		if($('#factoryTreePart_opratebar').length > 0){
			$('#factoryTreePart_buttonbar').append($('#factoryTreePart_opratebar'));
		}
		if($('#factoryTreePart_opratebar').children().length == 0){
			$('#factoryTreePart_opratebar').hide();
		}
	})();
	
<#else>
	MESBasic.factoryModel.factoryModel.factoryTreePart.getSelectedNodes = function(callBack){
		var nodes = MESBasic_factoryModel_factoryModel_factoryTreePart_tree.getCheckedNodes();
		eval(callBack+"(nodes)");
	}
</#if>

/**
 * dialog创建附件上传按钮
 * @private
 */
MESBasic.factoryModel.factoryModel.factoryTreePart.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"MESBasic_factoryModel_factoryModel_factoryTreePart_fileupload_button",
		handler:function(){
			if($('#MESBasic_factoryModel_factoryModel_factoryTreePart_fileupload').length == 0) {
				$('body').append('<div id="MESBasic_factoryModel_factoryModel_factoryTreePart_fileupload"></div>');
			}
			MESBasic.factoryModel.factoryModel.factoryTreePart.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "MESBasic_factoryModel_factoryModel_factoryTreePart_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#MESBasic_factoryModel_factoryModel_factoryTreePart_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			MESBasic.factoryModel.factoryModel.factoryTreePart.infoDialog.show();
			if($('#MESBasic_factoryModel_factoryModel_factoryTreePart_fileupload').html() == '') {
				$('#MESBasic_factoryModel_factoryModel_factoryTreePart_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=MESBasic_factoryModel_factoryModel&entityCode=MESBasic_1_factoryModel&dialogId="+dialogId);
			}
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
MESBasic.factoryModel.factoryModel.factoryTreePart.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_factoryModel_factoryTreePart.MESBasic.factoryModel.factoryModel." + params.viewName + ".referenceCopy");
			funcName('factoryModel', params.referenceUrl, this);
		}
	}
};
</script>
