<!-- RM_7.5.0.0/formula/easyFormulaList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1491547681106')}</title>
<@maincss/>
<@mainjs/>
	<!-- CUSTOM CODE START(view-LIST-RM_7.5.0.0_formula_easyFormulaList,head,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
</head>

<body id="dialog_page" class="view-list">
<@loadpanel></@loadpanel>
</#if>
  
<script type="text/javascript">
	CUI.ns("RM.formula.formula","RM.formula.formula.easyFormulaList");
</script>	
<@errorbar id="workbenchErrorBar" offsetY=0 /><@loadpanel/>
<@frameset id="ec_RM_formula_formula_easyFormulaList_container" border=0>
	<@frame id="ec_RM_formula_formula_easyFormulaList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "easyFormulaList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<!-- CUSTOM CODE START(view-LIST-RM_7.5.0.0_formula_easyFormulaList,html,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) -->
<!-- 自定义代码 -->
<style type="text/css">
	.cui-btn-bgyt {
    	background: url('/bap/static/RM/img/icon_bgyt.png') no-repeat;
	}
    .cui-btn-ckbgrz {
    	background: url('/bap/static/RM/img/icon_ckbgrz.png') no-repeat;
	}
	.cui-btn-sb {
    	background: url('/bap/static/RM/img/icon_sb.png') no-repeat;
	}
	.cui-btn-szmr {
    	background: url('/bap/static/RM/img/icon_szmr.png') no-repeat;
	}
	.cui-btn-disable{
		background: url('/bap/struts/css/buttons.png') no-repeat 0px -49px;
	}
	.cui-btn-enable {
		background: url(/bap/struts/css/buttons.png) no-repeat 0px -22px;
	}

</style>
<!-- CUSTOM CODE END -->
<script type="text/javascript">
	function ec_RM_formula_formula_easyFormulaList_openWork(url){
		if(url.indexOf('?') > 0) url+='&';
		else url += '?';
		url +='entityCode=RM_7.5.0.0_formula';
		openFullScreen(url);
	};
	
	RM.formula.formula.easyFormulaList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		RM.formula.formula.easyFormulaList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				RM.formula.formula.easyFormulaList._prefix += '.';
			}
			RM.formula.formula.easyFormulaList._prefix += arr[i];
		}
		RM.formula.formula.easyFormulaList._suffix = arr[arr.length -1];
		if(RM.formula.formula.easyFormulaList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.formula.formula.easyFormulaList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		RM.formula.formula.easyFormulaList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'RM.formula.formula.easyFormulaList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	RM.formula.formula.easyFormulaList.getcallBackInfo = function(obj){
		CUI('#ec_RM_formula_formula_easyFormulaList_queryForm *[name="'+RM.formula.formula.easyFormulaList._prefix + '.' + RM.formula.formula.easyFormulaList._suffix +'"]').val(obj[0][RM.formula.formula.easyFormulaList._suffix]);
		CUI('#ec_RM_formula_formula_easyFormulaList_queryForm *[name="'+RM.formula.formula.easyFormulaList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_RM_formula_formula_easyFormulaList_queryForm *[name^="'+RM.formula.formula.easyFormulaList._prefix + '."]').unbind("change");
		CUI('#ec_RM_formula_formula_easyFormulaList_queryForm *[name="'+RM.formula.formula.easyFormulaList._prefix + '.' + RM.formula.formula.easyFormulaList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_RM_formula_formula_easyFormulaList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(RM.formula.formula.easyFormulaList._dialog) {
			RM.formula.formula.easyFormulaList._dialog.close();
		}
	};
	
	RM.formula.formula.easyFormulaList._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.formula.formula.easyFormulaList.query_"+obj+")!='undefined'") ? eval('RM.formula.formula.easyFormulaList.query_'+obj+'()') : null;
		return str;
	
	};
	
RM.formula.formula.easyFormulaList.rowDblClick = function(event,row){
		var url = '';
		var url = "/foundation/user/open-pending.action?tableInfoId=" + row.tableInfoId + "&id=" + row.id + "&entityCode=RM_7.5.0.0_formula&__pc__=${(Parameters.__pc__)!}";
		if(row.pending != null && ${userId!-1} == row.pending.userId && row.status == 88) url += "&pendingId=" + row.pending.id;
	openFullScreen(url);
	};
	
	RM.formula.formula.easyFormulaList.rowDblClickQuery = function(event,row){
		RM.formula.formula.easyFormulaList.rowDblClick(event,row);
	};
	
	
//自定义点击事件
RM_formula_formula_easyFormulaList_refresh = function(node){
RM.formula.formula.easyFormulaList.node = node;
	//保存树状节点的参数，导出时用
	if(node!=null && node.layRec){
		$("#treeNodeSelected").attr("value", node.layRec);
	}else if(node!=null && node.id == -1){
		$("#treeNodeSelected").removeAttr("value");
	}
	
	if(node!=null && node.layRec){
		$(".nodeInfo").attr("id", node.modelName+".layRec");
		$(".nodeInfo").attr("name", node.modelName+".layRec");
		$(".nodeInfo").attr("value", node.layRec);
	}else if(node!=null && node.id == -1){	
		$(".nodeInfo").removeAttr("id");
		$(".nodeInfo").removeAttr("value");
		$(".nodeInfo").removeAttr("name");
	}
	RM.formula.formula.easyFormulaList.query("query");
}

RM_formula_formula_easyFormulaList_getList = function() {
	return "RM.formula.formula.easyFormulaList";
}
RM.formula.formula.easyFormulaList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.RM_formula_formula_easyFormulaListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

RM.formula.formula.easyFormulaList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
RM.formula.formula.easyFormulaList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"RM_formula_formula_easyFormulaList_fileupload_button",
		handler:function(){
				list_operate_formula_easyFormulaList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
RM.formula.formula.easyFormulaList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_formula_easyFormulaList.RM.formula.formula." + params.viewName + ".referenceCopy");
			funcName('formula', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
RM.formula.formula.easyFormulaList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_formula_easyFormulaList.RM.formula.formula." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
RM.formula.formula.easyFormulaList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_formula_easyFormulaList.RM.formula.formula." + editViewName + ".printSetting");
			funcName();
		}
	}
}
				function upVersion(){ 
							
    if(RM.formula.formula.easyFormulaList.checkSelectedAny()){
		if(RM.formula.formula.easyFormulaList.checkSelectedMore()){
			if(ec_RM_formula_formula_easyFormulaList_queryWidget.getSelectedRow()[0].status!=99){
				CUI.Dialog.alert("${getText('RM.formula.randon1234567851')}");
			}
			else{
				var upVersionDialog=new CUI.Dialog({
				title:"${getText('RM.fomula.radon12345678901')}",
				formId:"RM_formula_formula_upVersionEdit_form",
				url:"/RM/formula/formula/upVersionEdit.action?entityCode=RM_7.5.0.0_formula&${getPowerCode('RM_7.5.0.0_formula_formulaList_self')}",
				modal:true,
				height:282,
				width:345,
				//type:3,
				buttons:[{
					name:"${getText('ec.customCode.save')}",
					handler:function(){
					var deploymentId="";  //流程部署id
					CUI.ajax({
						url: "/ec/workflow/getCurrentDeployment.action?processKey=easyFormulaFlow", //change为工作流key
						type: 'post',
						async: false,
		                success: function(msg) {
           					deploymentId = msg.deploymentId;
            			}
					});	   
					var editionName=$("input[name='formula.edition']").val();
					var formulaCode=$("input[name='formula.code']").val();
					var formulaName=$("input[name='formula.name']").val();
					var formulaId=ec_RM_formula_formula_easyFormulaList_queryWidget.getSelectedRow()[0].id;
					var oldEdition=$("input[name='formula.version']").val();
                    //alert(editionName);
					if(formulaName==""){
		                RM_formula_formula_upVersionEdit_formDialogErrorBarWidget.showMessage("${getText('RM.formula.randon12345678345')}");
	                    return false;
	                }
	                if(editionName==""){
		                RM_formula_formula_upVersionEdit_formDialogErrorBarWidget.showMessage("${getText('RM.formula.randon1234567834')}");
	                    return false;
	                }
					if(editionName==oldEdition){
						RM_formula_formula_upVersionEdit_formDialogErrorBarWidget.showMessage("${getText('RM.formula.randon1234562123')}");
						$("input[name='formula.edition']").val("");
	                    return false;
					}
					if(isNaN(editionName)){
		                RM_formula_formula_upVersionEdit_formDialogErrorBarWidget.showMessage("${getText('RM.formula.randon12478745689')}");
		                $("input[name='formula.edition']").val("");
	                    return false;
	                }
					$.ajax({
						type:"POST",
						url:"/RM/formula/formula/upFormulaVersion.action",
						data:{"editionName":editionName,"formulaId":formulaId,"deployId":deploymentId,"formulaCode":formulaCode,"formulaName":formulaName},
						traditional: true,
						async : false,
						success:function(msg){
								if(msg.result==true){
								    RM_formula_formula_upVersionEdit_formDialogErrorBarWidget.showMessage("${getText('calendar.common.saveandclosesuccessful')}","s");
								    setTimeout(function(){
     								    upVersionDialog.close();
								    },1000);
									RM.formula.formula.easyFormulaList.query('query');
									
							    }
								
						}
					});
				}
			},
			{
				name:"${getText('ec.common.cancel')}",
			    handler:function(){
				    this.close();
			    }
			}]
			    
		});
		upVersionDialog.show();
		}
		}
	    
	}

				};
				function start(){ 
							
	//var changeType="changeType/changeType1";//点击启用时变更类型是变更状态
	//必须要选中
	if(RM.formula.formula.easyFormulaList.checkSelectedAny()){
		//单据生效才能启用
		if(ec_RM_formula_formula_easyFormulaList_queryWidget.getSelectedRow()[0].status!=99){
			CUI.Dialog.alert("${getText('RM.formula.randon1234567881')}");
		}
		else{
			//判断是否启用配置项
			var url="/RM/formula/formula/getIsApprove.action";
            var isApprove="";
            $.ajax({
	            type:'POST',
	            url:url,
	            async : false,
	            success:function(msg){
		            if(msg!=null){
			            isApprove=msg.result;
		            }
	            }
            });
			//需要审批
            if(isApprove==true){
				//只能选择一行
			    if(RM.formula.formula.easyFormulaList.checkSelectedMore()){
			        var deploymentId="";  //流程部署id
                    var powerCode = "";   //权限code（_pc_）
                    CUI.ajax({
                        url: "/ec/workflow/getCurrentDeployment.action?processKey=stateChangeFlw", //配方状态变更工作流
                        type: 'post',
                        async: false,
                        success: function(msg) {
                            deploymentId = msg.deploymentId;
                        }
                    });
                    if(deploymentId==undefined || deploymentId===""){
                        CUI.Dialog.alert("工作流配置有问题，请联系管理员！");
                        return false;
                    }
                   CUI.ajax({
                        url: "/ec/workflow/getStartActivePowerCode.action?deploymentId="+deploymentId,
                        type: 'post',
                        async: false,
                        success: function(msg) {
                            powerCode = msg.powerCode;
                        }
                    });
	                var obj=ec_RM_formula_formula_easyFormulaList_queryWidget.getSelectedRow()[0];
		            var formulaId=obj.id;//配方id
	                var fomulaCode=obj.code;//配方编码
	                var name=obj.name;//配方标识
	                var edition=obj.edition;//配方版本
	                var stateId=obj.state.id;//配方状态id
	                var stateVal=obj.state.value;//配方状态值
					//将上述参数传入url
		            var url="/RM/fomulaChange/formulaChange/fomulaStateEdit.action?deploymentId="+deploymentId+"&entityCode=RM_7.5.0.0_fomulaChange&__pc__="+powerCode+"&fomulaCode="+fomulaCode+"&fomulaName="+name+"&edition="+edition+"&stateId="+stateId+"&stateVal="+stateVal+"&fomulaId="+formulaId+"&pid=1";
					//如果状态已启用则提示
		            if(stateId=="RMstate/state2"){
			            workbenchErrorBarWidget.showMessage("${getText('RM.fomula.radon1234567881')}");
		            }
		            else{
						//判断该配方是否在审批流程中
			            $.ajax({
			            type:'POST',
			            url:"/RM/fomulaChange/formulaChange/selectFormula.action?formulaId="+formulaId,//变更状态
			            success:function(msg){
				            if(msg.result==2){
								//不在审批流程中就打开新页面进入审批
					            openFullScreen(url);
				            }
				            else{
								//若在则提醒
					            workbenchErrorBarWidget.showMessage("${getText('RM.fomula.radon1234567891')}");
				            }
			            }
		            });	
                }
			}
			
        }
        else{
			//不需要审批,支持多行
			var rows=ec_RM_formula_formula_easyFormulaList_queryWidget.getSelectedRow();
		    var ids='';
		    for(var i=0;i<rows.length;i++){
				//如果选择的配方有未生效的则需要提示
				if(rows[i].status!=99){
					CUI.Dialog.alert("${getText('RM.formula.randon1234567881')}");
					return false;
				}
				else{
					ids+=','+rows[i].id;
				}
		    }
		    if(ids!=''){
			    ids=ids.substr(1);
		    }
		    //var startTime=ec_RM_formula_formula_easyFormulaList_queryWidget.getSelectedRow()[0].startTime;
		    CUI.ajax({
			    type:'POST',
			    url:'/RM/formula/formula/updateActive.action?state=RMstate/state2&ids='+ids,
			    success:function(msg){
				    try{
				        if(msg.result==true) {
					        workbenchErrorBarWidget.showMessage('${getText('ec.common.saveandclosesuccessful')}','s');
					        RM.formula.formula.easyFormulaList.query('query');
				        }
			        } catch(e){}
			    }
		    });
        }
		}
		
	}

				};
				function stop(){ 
							
	//var changeType="changeType/changeType1";//点击停用时变更类型是变更状态
	if(RM.formula.formula.easyFormulaList.checkSelectedAny()){
		if(ec_RM_formula_formula_easyFormulaList_queryWidget.getSelectedRow()[0].status!=99){
			CUI.Dialog.alert("${getText('RM.formula.randon1234567801')}");
		}
		else{
			var url="/RM/formula/formula/getIsApprove.action";
            var isApprove="";
            $.ajax({
	            type:'POST',
	            url:url,
	            async : false,
	            success:function(msg){
		            if(msg!=null){
			            isApprove=msg.result;
		            }
	            }
            });
		    if(isApprove==true){
				//需要审批不能选择多行
			    if(RM.formula.formula.easyFormulaList.checkSelectedMore()){
			        var deploymentId="";  //流程部署id
                    var powerCode = "";   //权限code（_pc_）
                    CUI.ajax({
                        url: "/ec/workflow/getCurrentDeployment.action?processKey=stateChangeFlw", //配方状态变更工作流
                        type: 'post',
                        async: false,
                        success: function(msg) {
                            deploymentId = msg.deploymentId;
                        }
                    });
                if(deploymentId==undefined || deploymentId===""){
                    CUI.Dialog.alert("工作流配置有问题，请联系管理员！");
                    return false;
                }
                CUI.ajax({
                    url: "/ec/workflow/getStartActivePowerCode.action?deploymentId="+deploymentId,
                    type: 'post',
                    async: false,
                    success: function(msg) {
                        powerCode = msg.powerCode;
                    }
                });
			    var obj=ec_RM_formula_formula_easyFormulaList_queryWidget.getSelectedRow()[0];
		        var formulaId=obj.id;//配方id
	            var fomulaCode=obj.code;//配方编码
	            var name=obj.name;//配方标识
	            var edition=obj.edition;//配方版本
	            var stateId=obj.state.id;//配方状态id
	            var stateVal=obj.state.value;//配方状态值
		        var url="/RM/fomulaChange/formulaChange/fomulaStateEdit.action?deploymentId="+deploymentId+"&entityCode=RM_7.5.0.0_fomulaChange&__pc__="+powerCode+"&fomulaCode="+fomulaCode+"&fomulaName="+name+"&edition="+edition+"&stateId="+stateId+"&stateVal="+stateVal+"&fomulaId="+formulaId+"&pid=2";
		        if(stateId=="RMstate/state3"){
			        workbenchErrorBarWidget.showMessage("${getText('RM.fomula.radon1234567811')}");
		        }
		        else{
					//判断该配方是否在审批流程中
			        $.ajax({
			            type:'POST',
			            url:"/RM/fomulaChange/formulaChange/selectFormula.action?formulaId="+formulaId,
			            success:function(msg){
				            if(msg.result==2){
					    //alert(msg.result);
						        //打开新页面
					            openFullScreen(url);
				            }
				            else{
					    //alert(1);
					            workbenchErrorBarWidget.showMessage("${getText('RM.fomula.radon1234567891')}");
				            }
			            },
		            });	
		        }
			}
		}
		else{
			//选择的行数
			var rows=ec_RM_formula_formula_easyFormulaList_queryWidget.getSelectedRow();
		    var ids='';
		    for(var i=0;i<rows.length;i++){
			    //如果选择的配方有未生效的则需要提示
				if(rows[i].status!=99){
					CUI.Dialog.alert("${getText('RM.formula.randon1234567801')}");
					return false;
				}
				else{
					ids+=','+rows[i].id;
				}
		    }
		    if(ids!=''){
			    ids=ids.substr(1);
		    }
		    //var endTime=ec_RM_formula_formula_easyFormulaList_queryWidget.getSelectedRow()[0].endTime;
		    CUI.ajax({
			    type:'POST',
			    url:'/RM/formula/formula/updateActive.action?state=RMstate/state3&ids='+ids,
			    success:function(msg){
				    try{
				        if(msg.result==true) {
					        workbenchErrorBarWidget.showMessage('${getText('ec.common.saveandclosesuccessful')}','s');
					        RM.formula.formula.easyFormulaList.query('query');
				        }
			        } catch(e){}
			    }
		    });
		}
		}
	}

				};
				function useChange(){ 
							
	//var changeType="changeType/changeType2";//变更用途
	//只能选择一个配方进行变更
	if(RM.formula.formula.easyFormulaList.checkSelectedAny()){
		if(RM.formula.formula.easyFormulaList.checkSelectedMore()){
			if(ec_RM_formula_formula_easyFormulaList_queryWidget.getSelectedRow()[0].status!=99){
			CUI.Dialog.alert("${getText('RM.formula.randon1234567871')}");
		    }
		    else{
				//判断是否启用配置项
			    var url="/RM/formula/formula/getUseChangeIsApprove.action";
                var useChangeIsApprove="";
                $.ajax({
	                type:'POST',
	                url:url,
	                async : false,
	                success:function(msg){
		                if(msg!=null){
			                useChangeIsApprove=msg.result;
		                }
	                }
                });
				//审批流程
		        if(useChangeIsApprove==true){
			        var deploymentId="";  //流程部署id
                    var powerCode = "";   //权限code（_pc_）
                    CUI.ajax({
                        url: "/ec/workflow/getCurrentDeployment.action?processKey=useChangeFlw", //配方用途变更工作流
                        type: 'post',
                        async: false,
                        success: function(msg) {
                            deploymentId = msg.deploymentId;
                            }
                        });
                    if(deploymentId==undefined || deploymentId===""){
                        CUI.Dialog.alert("工作流配置有问题，请联系管理员！");
                        return false;
                    }
                    CUI.ajax({
                        url: "/ec/workflow/getStartActivePowerCode.action?deploymentId="+deploymentId,
                        type: 'post',
                        async: false,
                        success: function(msg) {
                            powerCode = msg.powerCode;
                        }
                    });
			
		            var obj=ec_RM_formula_formula_easyFormulaList_queryWidget.getSelectedRow()[0];
		            var formulaId=obj.id;//配方id
	                var fomulaCode=obj.code;//配方编码
	                var name=obj.name;//配方标识
	                var edition=obj.edition;//配方版本
		            var val=obj.usedFor.value;//用于值
		            var usedForId=obj.usedFor.id;//用于id
		            var isForProduct=obj.isForProduct;//生产性质
		            var url="/RM/fomulaChange/formulaChange/fomulaUseEdit.action?deploymentId="+deploymentId+"&entityCode=RM_7.5.0.0_fomulaChange&__pc__="+powerCode+"&fomulaCode="+fomulaCode+"&fomulaName="+name+"&edition="+edition+"&usedForId="+usedForId+"&usedForValue="+val+"&isForProduct="+isForProduct+"&fomulaId="+formulaId;
			        $.ajax({
			            type:'POST',
			            url:"/RM/fomulaChange/formulaChange/selectFormula.action?formulaId="+formulaId,//变更状态
			            success:function(msg){
				            if(msg.result==2){
								//如果不在审批流程中则打开新页面
					            openFullScreen(url);
				            }
				            else{
					            workbenchErrorBarWidget.showMessage("${getText('RM.fomula.radon1234567891')}");
				            }
			            }
		            });
			
		        }
				//非审批则弹出小框
		        else{
			        var useChangeDialog=new CUI.Dialog({
			            title:"${getText('RM.fomula.radon1234567890')}",
			            formId:"RM_formula_formula_useChangeEdit_form",
			            url:"/RM/formula/formula/useChangeEdit.action?entityCode=RM_7.5.0.0_formula&${getPowerCode('RM_7.5.0.0_formula_formulaList_self')}",
			            modal:true,
			            height:282,
			            width:345,
			            buttons:[{
				            name:"${getText('ec.customCode.save')}",
				            handler:function(){
					//用于id
					            var usedFor=$("select[name='formula.usedFor.id']").val();
					//用于value值
					            var oldUseForVal=$("input[name='_complex_extraCol1']").val();
					            var useForVal=$("#formulausedForid").val();
					            var isForPro=$("input[name='formula.isForProduct_check']").prop("checked");
					            var fId=$("input[name='formula.id']").val();
					            var usedId=$("#usedId").val();
							//校验用于为空时提醒
					            if(useForVal==""){
						            RM_formula_formula_useChangeEdit_formDialogErrorBarWidget.showMessage("${getText('RM.formula.randon123456782')}","f");
						            return false;
					            }
							//新用途和老用途相同时校验提醒
					            if(useForVal==oldUseForVal){
						//alert(usedFor);
						//alert(usedId);
						            RM_formula_formula_useChangeEdit_formDialogErrorBarWidget.showMessage("${getText('RM.formula.randon123456789')}","f");
						            return false;
					            }
					            $.ajax({
						            type:"POST",
						            url:"/RM/formula/formula/updateUseChange.action",
						            data:{"usedForid":usedFor,"isForPro":isForPro,"id":fId},
						            traditional: true,
						            async : false,
						            success:function(msg){
							            try{
								            if(msg.result==true){
								                RM_formula_formula_useChangeEdit_formDialogErrorBarWidget.showMessage("${getText('calendar.common.saveandclosesuccessful')}","s");
								                setTimeout(function(){
     								            useChangeDialog.close();
								                },1000);
									            RM.formula.formula.easyFormulaList.query('query');
							                }
							            }catch(e){}		
						            },
						            error:function(){
							            alert("error");
						            }
					            });
					//CUI("#RM_fomulaChange_formulaChange_useChangeEdit_form").submit();
				            }
			            },
			        {
				        name:"${getText('ec.common.cancel')}",
			            handler:function(){
				        this.close();
			            }
			        }]
		            });
		            useChangeDialog.show();
		        }
		    }
		}
	}

				};
				function fDefault(event){ 
							
	//如果是灰色则点击无效
	if($($($(".paginatorbar-operatebar").children()[5]).children()).css("color")!="rgb(0, 0, 0)" && $($($(".paginatorbar-operatebar").children()[5]).children()).css("color")!="black"){
		//event.preventDefault();
	}
	else{
		if(RM.formula.formula.easyFormulaList.checkSelectedAny()){
			if(RM.formula.formula.easyFormulaList.checkSelectedMore()){
		        if(ec_RM_formula_formula_easyFormulaList_queryWidget.getSelectedRow()[0].status!=99){
			        CUI.Dialog.alert("${getText('RM.formula.randon1234567861')}");
		        }
		        else{
					var proSelected=ec_RM_formula_formula_easyFormulaList_queryWidget.getSelectedRow()[0].product.id;//选中的产品id
		            var proName=ec_RM_formula_formula_easyFormulaList_queryWidget.getSelectedRow()[0].product.productName;//选中的产品名称
		            var fName=ec_RM_formula_formula_easyFormulaList_queryWidget.getSelectedRow()[0].name;//选中的配方标识
		            var id=ec_RM_formula_formula_easyFormulaList_queryWidget.getSelectedRow()[0].id;//选中的配方id
					var fCode=ec_RM_formula_formula_easyFormulaList_queryWidget.getSelectedRow()[0].code;//选中的配方编码
		            var fDefault=ec_RM_formula_formula_easyFormulaList_queryWidget.getSelectedRow()[0].isDafault;//选中的配方默认
			        //var rows=ec_RM_formula_formula_easyFormulaList_queryWidget.getRowLength();
					//如果选中的配方时默认配方
					if(fDefault==false){
						CUI.ajax({
							type:"POST",
							url:"/RM/formula/formula/fomulaName.action?productId="+proSelected,
							success:function(msg){
								try{
									if(msg.result!="" && msg.result!=fName){
										//后台返回默认配方编码
										var formulaCode=msg.result;
										CUI.Dialog.confirm("产品"+proName+"已设置了默认清单"+formulaCode+",确认将产品"+proName+"的默认清单设置为"+fCode+"吗？",function(){
											CUI.ajax({
												type:'POST',
												url:"/RM/formula/formula/selectIsDefault.action?productId="+proSelected,
												success:function(msg){
													try{
														if(msg.result==true){
															//设置默认
															CUI.ajax({
			                                                    type:'POST',
			                                                    url:'/RM/formula/formula/updateDefault.action?isDefault=true&id='+id,
			                                                    success:function(msg){
				                                                    try{
				                                                       if(msg.result==true) {
					                                                        workbenchErrorBarWidget.showMessage('${getText('ec.common.saveandclosesuccessful')}','s');
					                                                        RM.formula.formula.easyFormulaList.query('query');
				                                                        }
			                                                        } catch(e){}
			                                                    }
		                                                    });
															//workbenchErrorBarWidget.showMessage('${getText('ec.common.saveandclosesuccessful')}','s');
					                                        //RM.formula.formula.easyFormulaList.query('query');
														}
													}catch(e){}
												}
											});
										})
									}
									else{
										//如果配方对应产品未设置其他默认配方
										CUI.ajax({
			                                type:'POST',
			                                url:'/RM/formula/formula/updateDefault.action?isDefault=true&id='+id,
			                                success:function(msg){
				                                try{
				                                    if(msg.result==true) {
					                                    workbenchErrorBarWidget.showMessage('${getText('ec.common.saveandclosesuccessful')}','s');
					                                    RM.formula.formula.easyFormulaList.query('query');
				                                    }
			                                    } catch(e){}
			                                }
		                                });
									}
								}catch(e){}
							}
						});
					}
		            else{
						//取消默认
						CUI.ajax({
			                type:'POST',
			                url:'/RM/formula/formula/updateDefault.action?isDefault=false&id='+id,
			                success:function(msg){
				                try{
				                    if(msg.result==true) {
					                    workbenchErrorBarWidget.showMessage('${getText('ec.common.saveandclosesuccessful')}','s');
					                    RM.formula.formula.easyFormulaList.query('query');
				                    }
			                    } catch(e){}
			                }
		                });
					}
		        }
	        }
		}		
	}

				};
				function openEasyChangeLog(){ 
							
		//是否已选  //所选obj对象id
		if(RM.formula.formula.easyFormulaList.checkSelectedAny()){
			if(RM.formula.formula.easyFormulaList.checkSelectedMore()){
				var formulaId=ec_RM_formula_formula_easyFormulaList_queryWidget.getSelectedRow()[0].id;	//配方id
				var url="/RM/fomulaChange/formulaChange/matialChangeListRef.action?formulaId="+formulaId;
				if(ec_RM_formula_formula_easyFormulaList_queryWidget.getSelectedRow()[0].status==99){
					var easyChangeDialog=new CUI.Dialog({//变更日志
						title:"${getText('RM.changelog123455')}",	
						url:url,
						formId:"changeLog_List",
						modal:true,
						width:window.screen.width*0.5,
						height:window.screen.height*0.5,
					});
					easyChangeDialog.show();
				}else{
					CUI.Dialog.alert("${getText('RM.formulastatusnot99exception111aa1313')}");
				}
			}
		}
	
				};
	
	/**
	 * 保存完毕回调
	 * @method RM.formula.formula.callBackInfo
	 */
	RM.formula.formula.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('RM_formula_formula_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
			}  else if(res.operateType == 'restore') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{RM.formula.formula.easyFormulaList.Dlg.close();closeLoadPanel();}catch(e){}
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	/**
	 * 获取待操作的记录ID，从树或者列表上获取
	 * @method RM.formula.formula.easyFormulaList.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	RM.formula.formula.easyFormulaList.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_RM_formula_formula_easyFormulaList_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_RM_formula_formula_easyFormulaList_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_RM_formula_formula_easyFormulaList_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method RM.formula.formula.easyFormulaList.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	RM.formula.formula.easyFormulaList.checkSelectedValid = function(type) {
		if(RM.formula.formula.easyFormulaList.checkSelectedAny()){
			for(var i=0;i<datatable_ec_RM_formula_formula_easyFormulaList_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_RM_formula_formula_easyFormulaList_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_RM_formula_formula_easyFormulaList_query.selectedRows[i].valid === false){
						CUI.Dialog.alert("${getText('ec.common.checkvalidfordelete')}");
						return false;
					}
				}
			}
		}else{
			return false;
		}
		return true;
	};
	
	/**
	 * 确认是否选中任何记录
	 * @method RM.formula.formula.easyFormulaList.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	RM.formula.formula.easyFormulaList.checkSelectedAny = function() {
		if(datatable_ec_RM_formula_formula_easyFormulaList_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method RM.formula.formula.easyFormulaList.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	RM.formula.formula.easyFormulaList.checkSelectedMore = function() {
		if(datatable_ec_RM_formula_formula_easyFormulaList_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	/**
	 * 显示增加对话框
	 * @method RM.formula.formula.easyFormulaList.showDialog
	 * @param {String} url
	 * @private
	 */
	RM.formula.formula.easyFormulaList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = RM.formula.formula.easyFormulaList.otherParams || {};
		if(otherParams && otherParams.referenceCopyBtn) {
			buttons.push(otherParams.referenceCopyBtn);
		}
		if(otherParams && otherParams.uploadBtn) {
			buttons.push(otherParams.uploadBtn);
		}
		if(otherParams && otherParams.printBtn) {
			buttons.push(otherParams.printBtn);
		}
		if(otherParams && otherParams.printSettingBtn) {
			buttons.push(otherParams.printSettingBtn);
		}
		if(otherParams && otherParams.viewShowType != 'VIEW') {
		}
		if(otherParams && otherParams.viewShowType == 'VIEW') {
			
			
			
					if(viewCode=='RM_7.5.0.0_formula_formulaView'||!viewCode){
					}
		}
		
		if(otherParams && otherParams.dialogType != 'OTHER') {
			width = null;
			height = null;
		}
		if(otherParams && otherParams.viewShowType != 'VIEW') {
			buttons.push({	
				name:"${getText('common.button.save')}",
				handler:function(){
					list_operate_formula_easyFormulaList.CUI('#'+formId).submit();
				}
			});
		}
		if(otherParams && otherParams.viewShowType == 'VIEW') {
			buttons.push({
				name:"${getText('foundation.common.closed')}",
				type:"cancel"
			});
		} else {
			buttons.push({
				name:"${getText('common.button.cancel')}",
				type:"cancel"
			});
		}
		
		if ( url.indexOf( "?" ) != -1 ) {
			url += "&openType=frame";
		} else {
			url += "?openType=frame";
		}	
		if ( RM.formula.formula.easyFormulaList.Dlg ) {
			RM.formula.formula.easyFormulaList.Dlg._config.url = url;
			RM.formula.formula.easyFormulaList.Dlg._config.formId = formId;
			RM.formula.formula.easyFormulaList.Dlg.setTitle( title )
			RM.formula.formula.easyFormulaList.Dlg.setButtonbar( buttons );
		}else{
			RM.formula.formula.easyFormulaList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_formula_easyFormulaList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		RM.formula.formula.easyFormulaList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		RM.formula.formula.easyFormulaList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'RM_formula_formula', element : $('#RM_formula_formula_easyFormulaList_fileupload_button a:eq(1)')});
		}
		RM.formula.formula.easyFormulaList.otherParams = {};
	};

	RM.formula.formula.easyFormulaList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof RM.formula.formula.easyFormulaList.beforeCommonQuery === 'function') {
	   		var ret = RM.formula.formula.easyFormulaList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof RM.formula.formula.easyFormulaList.cancelSelectedNode == 'function') {
	   RM.formula.formula.easyFormulaList.cancelSelectedNode();
	   RM.formula.formula.easyFormulaList.node = null;
	  }
	  if(typeof RM_formula_formula_easyFormulaList_cancelSelectedNode == 'function') {
	   RM_formula_formula_easyFormulaList_cancelSelectedNode();
	   RM.formula.formula.easyFormulaList.node = null;
	  }
	  RM.formula.formula.easyFormulaList.query(type);
	 };
	
	/**
	 * 查询
	 * @method RM.formula.formula.easyFormulaList.query
	 */
	RM.formula.formula.easyFormulaList.query = function(type,pageNo,sortFlag){
		var node = RM.formula.formula.easyFormulaList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//RM.formula.formula.easyFormulaList.node = null;
		if(!checkListValid("ec_RM_formula_formula_easyFormulaList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_RM_formula_formula_easyFormulaList_query._sortKey && datatable_ec_RM_formula_formula_easyFormulaList_query._sortMethod){
			CUI('#ec_RM_formula_formula_easyFormulaList_queryForm #dataTableSortColKey').val(datatable_ec_RM_formula_formula_easyFormulaList_query._sortKey);
			CUI('#ec_RM_formula_formula_easyFormulaList_queryForm #dataTableSortColName').val(datatable_ec_RM_formula_formula_easyFormulaList_query._sortColumnName);
			CUI('#ec_RM_formula_formula_easyFormulaList_queryForm #dataTableSortColOrder').val(datatable_ec_RM_formula_formula_easyFormulaList_query._sortMethod);
		}else{
			datatable_ec_RM_formula_formula_easyFormulaList_query._sortKey = '';
			CUI('#ec_RM_formula_formula_easyFormulaList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_RM_formula_formula_easyFormulaList_queryForm #dataTableSortColName').val('');
			CUI('#ec_RM_formula_formula_easyFormulaList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
		if(type && type == 'pending') {
			if(null != datatable_ec_RM_formula_formula_easyFormulaList_query.get('dblclick') && datatable_ec_RM_formula_formula_easyFormulaList_query.get('dblclick').length > 0) {
				datatable_ec_RM_formula_formula_easyFormulaList_query.setAttributeConfig('dblclick', {
		                writeOnce: true,
		                value: 'RM.formula.formula.easyFormulaList.rowDblClick'
		            });
			}
	        datatable_ec_RM_formula_formula_easyFormulaList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "RM.formula.formula.easyFormulaList.query('pending')"
            });    
	    } 
	    if(type && type == 'query') {
	    	if(null != datatable_ec_RM_formula_formula_easyFormulaList_query.get('dblclick') && datatable_ec_RM_formula_formula_easyFormulaList_query.get('dblclick').length > 0) {
		    	datatable_ec_RM_formula_formula_easyFormulaList_query.setAttributeConfig('dblclick', {
		                writeOnce: true,
		                value: 'RM.formula.formula.easyFormulaList.rowDblClickQuery'
		            });
		    }
	        datatable_ec_RM_formula_formula_easyFormulaList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "RM.formula.formula.easyFormulaList.query('query')"
            }); 
	    } 
	    if(type && type == 'adv') {
	    	datatable_ec_RM_formula_formula_easyFormulaList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "RM.formula.formula.easyFormulaList.query('adv')"
            });
	    }
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/RM/formula/formula/easyFormulaList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/RM/formula/formula/easyFormulaList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_RM_formula_formula_easyFormulaList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_RM_formula_formula_easyFormulaList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="RM_7.5.0.0_formula_easyFormulaList";
		condobj.modelAlias="formula";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_RM_formula_formula_easyFormulaList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_RM_formula_formula_easyFormulaList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_RM_formula_formula_easyFormulaList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_RM_formula_formula_easyFormulaList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_RM_formula_formula_easyFormulaList_quickquery_info[fieldName].dbColumnType;
						if(fastCol.endsWith('_start')) {
							var dateType = CUI(this).attr('dateType');
							if(dateType){
								if(dateType == 'date') {
									fastColValue += " 00:00:00";
								} else if(dateType == 'year') {
									fastColValue += "-01-01 00:00:00";
								} else if(dateType == 'yearMonth') {
									fastColValue += "-01 00:00:00";
								}
							}
							var showFormat = CUI(this).attr('showformat');
							if (showFormat === 'PERCENT'){
								fastColValue = parseFloat(fastColValue)/100 + '';
							}
							fieldObj.operator=">=";
							fieldObj.paramStr="?";
						}else if(fastCol.endsWith('_end')) {
							var dateType = CUI(this).attr('dateType');
							if(dateType){
								if(dateType == 'date') {
									fastColValue += " 23:59:59";
								} else if(dateType == 'year') {
									fastColValue += "-12-31 23:59:59";
								} else if(dateType == 'yearMonth') {
									var str = fastColValue.split("-");
									var lastDay = new Date(str[0],str[1],0).getDate();
									fastColValue += "-" + lastDay + " 23:59:59";
								}
							}
							var showFormat = CUI(this).attr('showformat');
							if (showFormat === 'PERCENT'){
								fastColValue = parseFloat(fastColValue)/100 + '';
							}
							fieldObj.operator="<=";
							fieldObj.paramStr="?";
						}else{
							if(ec_RM_formula_formula_easyFormulaList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_RM_formula_formula_easyFormulaList_queryForm *[name="'+ec_RM_formula_formula_easyFormulaList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_RM_formula_formula_easyFormulaList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_RM_formula_formula_easyFormulaList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_RM_formula_formula_easyFormulaList_quickquery_info["MainTableName"];
								}
								fieldObj.operator="=includeCustSub#"+tableName;
								fieldObj.paramStr="?";
							}else{
								var exp=CUI(this).attr('exp');
								var caseSensitive=CUI(this).attr('caseSensitive');
								if(exp=="equal"){
									fieldObj.operator="=";
									fieldObj.paramStr="?";
								}else if(exp=="unequal"){
									fieldObj.operator="<>";
									fieldObj.paramStr="?";
								}else if(exp=="llike"){
									fieldObj.operator="like";
									if(caseSensitive=='true'){
										fieldObj.operator+="caseSensitive";
									}
									fieldObj.paramStr="?%";
								}else if(exp=="rlike"){
									fieldObj.operator="like";
									if(caseSensitive=='true'){
										fieldObj.operator+="caseSensitive";
									}
									fieldObj.paramStr="%?";
								}else if(exp=="like"){
									fieldObj.operator="like";
									if(caseSensitive=='true'){
										fieldObj.operator+="caseSensitive";
									}
									fieldObj.paramStr="%?%";
								}else{
									fieldObj.operator="=";
									fieldObj.paramStr="?";
								}
							}
						}
						fieldObj.value=fastColValue;
						var layrec=ec_RM_formula_formula_easyFormulaList_quickquery_info[fieldName].layRec;
						if(layrec.indexOf("-")>1){
							generateChainCond(condobj,layrec.split("-"),fieldObj);						
						}else{
							condobj.subconds.push(fieldObj);
						}
					}else{
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(fastColValue));
					}
				}
			}
		});
		if(type != "adv") {
			dataPost += "&fastQueryCond="+encodeURIComponent(JSON.stringify(condobj));
			//把fastQueryCond的值赋到一个隐藏的对话框，导出的时候使用
			$('#excelQueryCond').val(JSON.stringify(condobj));
		}
		var pageSize=CUI('input[name="ec_RM_formula_formula_easyFormulaList_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
							dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
							dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
			<#if mainBusinessId??>
		 		dataPost += "&mainBusinessId=${mainBusinessId}";	
		 	</#if>
		 	<#if businessCenterCode??>
		 		dataPost += "&businessCenterCode=${businessCenterCode}";	
		 	</#if>
		 	<#if flowBulkFlag??>
		 		dataPost += "&flowBulkFlag=${flowBulkFlag?string('true','false')}";	
		 	</#if>
		 	<#if listCustomCondition?? && listCustomCondition != "">
		 		dataPost += "&${listCustomCondition}";	
		 	</#if>
		
		if(type && type == 'goList') {
			dataPost += "&pending-beginDate=${pendingBeginDate!''}";
			dataPost += "&pending-endDate=${pendingEndDate!''}";
			dataPost += "&activityName=${activityName!}";
			dataPost += "&processKey=${processKey!}";
		}
		if(nodeParam!=""){
			if(url.indexOf(".action?")<0){
				url += "?1=1";
			}
			url += nodeParam;
		}
		var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'RM_7.5.0.0_formula_easyFormulaList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_RM_formula_formula_easyFormulaList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_RM_formula_formula_easyFormulaList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	RM.formula.formula.easyFormulaList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=RM_7.5.0.0_formula";
		openExportFrame(url);
	}
RM.formula.formula.easyFormulaList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	RM.formula.formula.easyFormulaList.otherParams = {};
	RM.formula.formula.easyFormulaList.otherParams.dialogType = dialogType;
	RM.formula.formula.easyFormulaList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		RM.formula.formula.easyFormulaList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method RM.formula.formula.editCallBackInfo
 */
RM.formula.formula.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_RM_formula_formula_easyFormulaList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_RM_formula_formula_easyFormulaList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof RM_formula_formula_easyFormulaList_getLayout == "function"){
    		var layout = RM_formula_formula_easyFormulaList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.formula.formula.easyFormulaList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_formula_formula_easyFormulaList_queryWidget._sortKey && ec_RM_formula_formula_easyFormulaList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'RM_7.5.0.0_formula_Formula'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_formula_formula_easyFormulaList_queryWidget._sortKey && ec_RM_formula_formula_easyFormulaList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_RM_formula_formula_easyFormulaList_queryWidget._sortKey && ec_RM_formula_formula_easyFormulaList_queryWidget._sortMethod ? true : false;
		if(typeof RM_formula_formula_easyFormulaList_getLayout == "function"){
			var layout = RM_formula_formula_easyFormulaList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.formula.formula.easyFormulaList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.formula.formula.easyFormulaList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		RM.formula.formula.easyFormulaList.query('pending');
	    	}
			if(modelCode == 'RM_7.5.0.0_formula_Formula'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.formula.formula.easyFormulaList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		RM.formula.formula.easyFormulaList.query('pending');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId, errorbarWidget){errorbarWidget=errorbarWidget||workbenchErrorBarWidget;var edition_start = $('#' + formId + ' input[name^="edition_start"]').val();var edition_end = $('#' + formId + ' input[name^="edition_end"]').val();if(edition_start != null && edition_start != ''){if(!isDecimal(edition_start)){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487139592239')}${getText('ec.list.validate.decimal')}");return false;}}if(edition_end != null && edition_end != ''){if(!isDecimal(edition_end)){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487139592239')}${getText('ec.list.validate.decimal')}");return false;}}if($('#' + formId + ' input[name^="startTime_start"]').val()!= null && $('#' + formId + ' input[name^="startTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="startTime_start"]').val()+"")){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1489480645731')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="startTime_end"]').val()!= null && $('#' + formId + ' input[name^="startTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="startTime_end"]').val()+"")){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1489480645731')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="endTime_start"]').val()!= null && $('#' + formId + ' input[name^="endTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="endTime_start"]').val()+"")){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1489480749505')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="endTime_end"]').val()!= null && $('#' + formId + ' input[name^="endTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="endTime_end"]').val()+"")){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1489480749505')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name="startTime_start"]').val()!='' && $('#' + formId + ' input[name="startTime_end"]').val()!=''){if($('#' + formId + ' input[name="startTime_start"]').val() > $('#' + formId + ' input[name="startTime_end"]').val()){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1489480645731')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('RM.propertydisplayName.randon1489480645731')}${getText('ec.list.validate.start')}");return false;}}if($('#' + formId + ' input[name="edition_start"]').val()!='' && $('#' + formId + ' input[name="edition_end"]').val()!=''){if(parseInt($('#' + formId + ' input[name="edition_start"]').val()) > parseInt($('#' + formId + ' input[name="edition_end"]').val())){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487139592239')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('RM.propertydisplayName.randon1487139592239')}${getText('ec.list.validate.start')}");return false;}}if($('#' + formId + ' input[name="endTime_start"]').val()!='' && $('#' + formId + ' input[name="endTime_end"]').val()!=''){if($('#' + formId + ' input[name="endTime_start"]').val() > $('#' + formId + ' input[name="endTime_end"]').val()){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1489480749505')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('RM.propertydisplayName.randon1489480749505')}${getText('ec.list.validate.start')}");return false;}}return true;};



(function($){
	$(function(){
	});
})(jQuery);
function replace(str,symbol){
	var arr = str.split(symbol);
	var s1 = "";
	var len = arr.length;
	for(i=0;i<len;i++){
		if(i%2!=0){
			if(i==len-1){
				s1 = s1 +"&nbsp;&nbsp;"+ arr[i];
			}else{
				s1 = s1 +"&nbsp;&nbsp;"+ arr[i]+"</br>";
			}
		}else{
			if(i==len-1){
				s1 = s1 +"&nbsp;&nbsp;&nbsp;&nbsp;"+ arr[i];
			}else{
				s1 = s1 +"&nbsp;&nbsp;&nbsp;&nbsp;"+ arr[i]+symbol;
			}
		}
	}
	return s1;	
}
	/* CUSTOM CODE START(view-LIST-RM_7.5.0.0_formula_easyFormulaList,js,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码
	/**
	 * 确认是否选中任何记录
	 * @method RM.formula.formula.easyFormulaList.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	RM.formula.formula.easyFormulaList.checkSelectedAny = function() {
		if(datatable_ec_RM_formula_formula_easyFormulaList_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method RM.formula.formula.easyFormulaList.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	RM.formula.formula.easyFormulaList.checkSelectedMore = function() {
		if(datatable_ec_RM_formula_formula_easyFormulaList_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

RM.formula.formula.easyFormulaList.commonQuery = function(type) {
	if(typeof RM.formula.formula.easyFormulaList.cancelSelectedNode == 'function') {
         RM.formula.formula.easyFormulaList.cancelSelectedNode();
	   	RM.formula.formula.easyFormulaList.node = null;
	}
	if(typeof RM_formula_formula_easyFormulaList_cancelSelectedNode == 'function') {
		RM_formula_formula_easyFormulaList_cancelSelectedNode();
	   	RM.formula.formula.easyFormulaList.node = null;
	}
	RM.formula.formula.easyFormulaList.query(type);
	$($($(".paginatorbar-operatebar").children()[5]).children()).html("设置默认");
};
/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='RM_7.5.0.0_formula_easyFormulaList' idprefix='ec_RM_formula_formula_easyFormulaList' queryUrl='/RM/formula/formula/easyFormulaList-query.action' queryFunc="RM.formula.formula.easyFormulaList.query" ns="RM.formula.formula.easyFormulaList" />
<@exportexcel action="/RM/formula/formula/easyFormulaList-query.action"   getRequireDataAction="/RM/formula/formula/easyFormulaList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=RM_7.5.0.0_formula_Formula&&viewCode=RM_7.5.0.0_formula_easyFormulaList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('RM_7.5.0.0_formula_easyFormulaList')}" prefix="ec_RM_formula_formula_easyFormulaList_query" modelCode="RM_7.5.0.0_formula_Formula"  importFlag="false" viewCode="RM_7.5.0.0_formula_easyFormulaList" />
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
