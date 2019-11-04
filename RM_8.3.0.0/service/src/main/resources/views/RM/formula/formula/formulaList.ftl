<!-- RM_7.5.0.0/formula/formulaList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1487139715425')}</title>
<@maincss/>
<@mainjs/>
	<!-- CUSTOM CODE START(view-LIST-RM_7.5.0.0_formula_formulaList,head,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
</head>

<body id="dialog_page" class="view-list">
<@loadpanel></@loadpanel>
</#if>
  
<script type="text/javascript">
	CUI.ns("RM.formula.formula","RM.formula.formula.formulaList");
</script>	
<@errorbar id="workbenchErrorBar" offsetY=0 /><@loadpanel/>
<@frameset id="ec_RM_formula_formula_formulaList_container" border=0>
	<@frame id="ec_RM_formula_formula_formulaList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "formulaList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<!-- CUSTOM CODE START(view-LIST-RM_7.5.0.0_formula_formulaList,html,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) -->
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
	.cui-btn-enable {
		background: url(/bap/struts/css/buttons.png) no-repeat 0px -22px;
	}
	.cui-btn-cdsz {
    	background: url('/bap/static/RM/img/icon_cdsz.png') no-repeat;
	}
	.cui-btn-copy {
    	background: url('/bap/static/RM/img/icon_copy.png') no-repeat;
	}
	.cui-btn-end {
    	background: url('/bap/static/RM/img/icon_end.png') no-repeat;
	}
	.cui-btn-gdtpl {
    	background: url('/bap/static/RM/img/icon_gdtpl.png') no-repeat;
	}
	.cui-btn-hdsz {
    	background: url('/bap/static/RM/img/icon_hdsz.png') no-repeat;
	}
	.cui-btn-jxps {
    	background: url('/bap/static/RM/img/icon_jxps.png') no-repeat;
	}
	.cui-btn-plwc {
    	background: url('/bap/static/RM/img/icon_plwc.png') no-repeat;
	}
	.cui-btn-print {
    	background: url('/bap/static/RM/img/icon_print.png') no-repeat;
	}
	.cui-btn-sgtpl {
    	background: url('/bap/static/RM/img/icon_sgtpl.png') no-repeat;
	}
	.cui-btn-wlszyck {
    	background: url('/bap/static/RM/img/icon_wlszyck.png') no-repeat;
	}
	.cui-btn-xtdbd {
    	background: url('/bap/static/RM/img/icon_xtdbd.png') no-repeat;
	}
	.cui-btn-zdsc {
    	background: url('/bap/static/RM/img/icon_zdsc.png') no-repeat;
	}
	.cui-btn-disable{
		background: url('/bap/struts/css/buttons.png') no-repeat 0px -49px;
	}

</style>
<!-- CUSTOM CODE END -->
<script type="text/javascript">
	function ec_RM_formula_formula_formulaList_openWork(url){
		if(url.indexOf('?') > 0) url+='&';
		else url += '?';
		url +='entityCode=RM_7.5.0.0_formula';
		openFullScreen(url);
	};
	
	RM.formula.formula.formulaList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		RM.formula.formula.formulaList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				RM.formula.formula.formulaList._prefix += '.';
			}
			RM.formula.formula.formulaList._prefix += arr[i];
		}
		RM.formula.formula.formulaList._suffix = arr[arr.length -1];
		if(RM.formula.formula.formulaList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.formula.formula.formulaList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		RM.formula.formula.formulaList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'RM.formula.formula.formulaList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	RM.formula.formula.formulaList.getcallBackInfo = function(obj){
		CUI('#ec_RM_formula_formula_formulaList_queryForm *[name="'+RM.formula.formula.formulaList._prefix + '.' + RM.formula.formula.formulaList._suffix +'"]').val(obj[0][RM.formula.formula.formulaList._suffix]);
		CUI('#ec_RM_formula_formula_formulaList_queryForm *[name="'+RM.formula.formula.formulaList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_RM_formula_formula_formulaList_queryForm *[name^="'+RM.formula.formula.formulaList._prefix + '."]').unbind("change");
		CUI('#ec_RM_formula_formula_formulaList_queryForm *[name="'+RM.formula.formula.formulaList._prefix + '.' + RM.formula.formula.formulaList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_RM_formula_formula_formulaList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(RM.formula.formula.formulaList._dialog) {
			RM.formula.formula.formulaList._dialog.close();
		}
	};
	
	RM.formula.formula.formulaList._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.formula.formula.formulaList.query_"+obj+")!='undefined'") ? eval('RM.formula.formula.formulaList.query_'+obj+'()') : null;
		return str;
	
	};
	
RM.formula.formula.formulaList.rowDblClick = function(event,row){
		var url = '';
		var url = "/foundation/user/open-pending.action?tableInfoId=" + row.tableInfoId + "&id=" + row.id + "&entityCode=RM_7.5.0.0_formula&__pc__=${(Parameters.__pc__)!}";
		if(row.pending != null && ${userId!-1} == row.pending.userId && row.status == 88) url += "&pendingId=" + row.pending.id;
	openFullScreen(url);
	};
	
	RM.formula.formula.formulaList.rowDblClickQuery = function(event,row){
		RM.formula.formula.formulaList.rowDblClick(event,row);
	};
	
	
//自定义点击事件
RM_formula_formula_formulaList_refresh = function(node){
RM.formula.formula.formulaList.node = node;
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
	RM.formula.formula.formulaList.query("query");
}

RM_formula_formula_formulaList_getList = function() {
	return "RM.formula.formula.formulaList";
}
RM.formula.formula.formulaList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.RM_formula_formula_formulaListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

RM.formula.formula.formulaList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
RM.formula.formula.formulaList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"RM_formula_formula_formulaList_fileupload_button",
		handler:function(){
				list_operate_formula_formulaList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
RM.formula.formula.formulaList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_formula_formulaList.RM.formula.formula." + params.viewName + ".referenceCopy");
			funcName('formula', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
RM.formula.formula.formulaList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_formula_formulaList.RM.formula.formula." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
RM.formula.formula.formulaList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_formula_formulaList.RM.formula.formula." + editViewName + ".printSetting");
			funcName();
		}
	}
}
				function upVersion(){ 
							
    if(RM.formula.formula.formulaList.checkSelectedAny()){
		if(RM.formula.formula.formulaList.checkSelectedMore()){
			if(ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].status!=99){
			  CUI.Dialog.alert("${getText('RM.formula.randon123456785')}");
			  return false;
		    }
		else{
		
		    var batchContral=ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].batchContral;
			if(batchContral){
			  CUI.Dialog.alert("${getText('RM.formula.randon1234567834344575gg5')}");
			  return false;
			  //workbenchErrorBarWidget.showMessage("${getText('RM.formula.randon1234567834344575gg5')}",'f');
			}
		   
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
              url: "/ec/workflow/getCurrentDeployment.action?processKey=formulaEnableFlw", //change为工作流key
              type: 'post',
              async: false,
                success: function(msg) {
           deploymentId = msg.deploymentId;
            }
            });
				
				   
					var editionName=$("input[name='formula.edition']").val();
					var formulaCode=$("input[name='formula.code']").val();
					var formulaName=$("input[name='formula.name']").val();
					var formulaId=ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].id;
					var oldEdition=$("input[name='formula.version']").val();
                    //alert(editionName);
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
									RM.formula.formula.formulaList.query('query');
									
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
				function copyFormula(){ 
							
    if(RM.formula.formula.formulaList.checkSelectedAny()){
		if(RM.formula.formula.formulaList.checkSelectedMore()){
			var copyFormulaDialog=new CUI.Dialog({
				title:"${getText('RM.fomula.radon123456789011')}",
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
							url: "/ec/workflow/getCurrentDeployment.action?processKey=formulaEnableFlw", //change为工作流key
							type: 'post',
							async: false,
							success: function(msg) {
								deploymentId = msg.deploymentId;
							}
						});
					
					   
						var editionName=$("input[name='formula.editions']").val();
						var formulaCode=$("input[name='formula.code']").val();
						var formulaName=$("input[name='formula.name']").val();
						var formulaId=ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].id;
						var oldEdition=$("input[name='formula.version']").val();
						//alert(editionName);
						if(formulaName==""){
						//标识不能为空
							RM_formula_formula_upVersionEdit_formDialogErrorBarWidget.showMessage("${getText('RM.custom.randon1551869431765')}");
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
						/*if(isNaN(editionName)){
							RM_formula_formula_upVersionEdit_formDialogErrorBarWidget.showMessage("${getText('RM.formula.randon12478745689')}");
							$("input[name='formula.edition']").val("");
							return false;
						}*/
						$.ajax({
							type:"POST",
							url:"/RM/formula/formula/copyFormula.action",
							data:{"editionName":editionName,"formulaId":formulaId,"deployId":deploymentId,"formulaCode":formulaCode,"formulaName":formulaName},
							traditional: true,
							async : false,
							success:function(msg){
									if(msg.result==true){
										RM_formula_formula_upVersionEdit_formDialogErrorBarWidget.showMessage("${getText('calendar.common.saveandclosesuccessful')}","s");
										setTimeout(function(){
											copyFormulaDialog.close();
										},1000);
										RM.formula.formula.formulaList.query('query');
										
									}else{
										RM_formula_formula_upVersionEdit_formDialogErrorBarWidget.showMessage("版本不能与原配方版本相同！","f");
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
			
			copyFormulaDialog.show();
		}
	    
	}

				};
				function start(){ 
							
	//var changeType="changeType/changeType1";//点击启用时变更类型是变更状态
	//必须要选中
	if(RM.formula.formula.formulaList.checkSelectedAny()){
		//单据生效才能启用
		if(ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].status!=99){
			CUI.Dialog.alert("${getText('RM.formula.randon123456788')}");
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
			    if(RM.formula.formula.formulaList.checkSelectedMore()){
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
	                var obj=ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0];
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
			            workbenchErrorBarWidget.showMessage("${getText('RM.fomula.radon123456788')}");
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
					            workbenchErrorBarWidget.showMessage("${getText('RM.fomula.radon123456789')}");
				            }
			            }
		            });	
                }
			}
			
        }
        else{
			//不需要审批,支持多行
			var rows=ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow();
		    var ids='';
		    for(var i=0;i<rows.length;i++){
				//如果选择的配方有未生效的则需要提示
				if(rows[i].status!=99){
					CUI.Dialog.alert("${getText('RM.formula.randon123456788')}");
					return false;
				}
				else{
					ids+=','+rows[i].id;
				}
		    }
		    if(ids!=''){
			    ids=ids.substr(1);
		    }
		    //var startTime=ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].startTime;
		    CUI.ajax({
			    type:'POST',
			    url:'/RM/formula/formula/updateActive.action?state=RMstate/state2&ids='+ids,
			    success:function(msg){
				    try{
				        if(msg.result==true) {
					        workbenchErrorBarWidget.showMessage('${getText('ec.common.saveandclosesuccessful')}','s');
					        RM.formula.formula.formulaList.query('query');
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
	if(RM.formula.formula.formulaList.checkSelectedAny()){
		if(ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].status!=99){
			CUI.Dialog.alert("${getText('RM.formula.randon123456780')}");
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
			    if(RM.formula.formula.formulaList.checkSelectedMore()){
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
			    var obj=ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0];
		        var formulaId=obj.id;//配方id
	            var fomulaCode=obj.code;//配方编码
	            var name=obj.name;//配方标识
	            var edition=obj.edition;//配方版本
	            var stateId=obj.state.id;//配方状态id
	            var stateVal=obj.state.value;//配方状态值
		        var url="/RM/fomulaChange/formulaChange/fomulaStateEdit.action?deploymentId="+deploymentId+"&entityCode=RM_7.5.0.0_fomulaChange&__pc__="+powerCode+"&fomulaCode="+fomulaCode+"&fomulaName="+name+"&edition="+edition+"&stateId="+stateId+"&stateVal="+stateVal+"&fomulaId="+formulaId+"&pid=2";
		        if(stateId=="RMstate/state3"){
			        workbenchErrorBarWidget.showMessage("${getText('RM.fomula.radon123456781')}");
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
					            workbenchErrorBarWidget.showMessage("${getText('RM.fomula.radon123456789')}");
				            }
			            },
		            });	
		        }
			}
		}
		else{
			//选择的行数
			var rows=ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow();
		    var ids='';
		    for(var i=0;i<rows.length;i++){
			    //如果选择的配方有未生效的则需要提示
				if(rows[i].status!=99){
					CUI.Dialog.alert("${getText('RM.formula.randon123456780')}");
					return false;
				}
				else{
					ids+=','+rows[i].id;
				}
		    }
		    if(ids!=''){
			    ids=ids.substr(1);
		    }
		    //var endTime=ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].endTime;
		    CUI.ajax({
			    type:'POST',
			    url:'/RM/formula/formula/updateActive.action?state=RMstate/state3&ids='+ids,
			    success:function(msg){
				    try{
				        if(msg.result==true) {
					        workbenchErrorBarWidget.showMessage('${getText('ec.common.saveandclosesuccessful')}','s');
					        RM.formula.formula.formulaList.query('query');
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
	if(RM.formula.formula.formulaList.checkSelectedAny()){
		if(RM.formula.formula.formulaList.checkSelectedMore()){
			if(ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].status!=99){
			CUI.Dialog.alert("${getText('RM.formula.randon123456787')}");
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
			
		            var obj=ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0];
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
					            workbenchErrorBarWidget.showMessage("${getText('RM.fomula.radon123456789')}");
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
									            RM.formula.formula.formulaList.query('query');
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
		if(RM.formula.formula.formulaList.checkSelectedAny()){
			if(RM.formula.formula.formulaList.checkSelectedMore()){
		        if(ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].status!=99){
			        CUI.Dialog.alert("${getText('RM.formula.randon123456786')}");
		        }
		        else{
					var proSelected=ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].product.id;//选中的产品id
		            var proName=ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].product.productName;//选中的产品名称
		            var fName=ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].name;//选中的配方标识
		            var id=ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].id;//选中的配方id
					var fCode=ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].code;//选中的配方编码
		            var fDefault=ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].isDafault;//选中的配方默认
			        //var rows=ec_RM_formula_formula_formulaList_queryWidget.getRowLength();
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
										CUI.Dialog.confirm("产品"+proName+"已设置了默认配方"+formulaCode+",确认将产品"+proName+"的默认配方设置为配方"+fCode+"吗？",function(){
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
					                                                        RM.formula.formula.formulaList.query('query');
				                                                        }
			                                                        } catch(e){}
			                                                    }
		                                                    });
															//workbenchErrorBarWidget.showMessage('${getText('ec.common.saveandclosesuccessful')}','s');
					                                        //RM.formula.formula.formulaList.query('query');
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
					                                    RM.formula.formula.formulaList.query('query');
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
					                    RM.formula.formula.formulaList.query('query');
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
				function openDepartEdit(){ 
							  
	if(RM.formula.formula.formulaList.checkSelectedAny()){
		if(RM.formula.formula.formulaList.checkSelectedMore()){
			if(ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].status==99){
				var selectId = ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].id;
				var url = "/RM/formula/formula/checkDepartEdit.action";
				var selectDialog = new CUI.Dialog({
					title:"检验部门设置",
					url :url,
					formId: "formula_depart_form",
					iframe: 'depart_iframe',
					data:{"formulaId":selectId},
					modal:true,
					width:700,
					height: 450,
					buttons:[
					{ 
					  name:"${getHtmlText('common.button.save')}",
					  handler:function(){
						if(submitFormula()){
							setTimeout(function(){
								selectDialog.close();
							},1000);
						}
					  }
					},
					{ name:"${getHtmlText('common.button.cancel')}",
					  handler:function(){this.close()}
					}]
				});
				selectDialog.show();
			}else{
					CUI.Dialog.alert("${getText('RM.formulastatusnot99exception1111')}");
			}
		}
	}

				};
				function openChangeLog(){ 
							
        //是否已选  //所选obj对象id
        if(RM.formula.formula.formulaList.checkSelectedAny()){
            if(RM.formula.formula.formulaList.checkSelectedMore()){
                var formulaId=ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].id;
                var url="/RM/fomulaChange/formulaChange/fomulaChangeListRef.action?formulaId="+formulaId;
                if(ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].status==99){
                    var changeDialog=new CUI.Dialog({//变更日志
                        title:"${getText('RM.changelog123455')}",   
                        url:url,
                        formId:"changeLog_List",
                        modal:true,
                        width:window.screen.width*0.5,
                        height:window.screen.height*0.5,
                    });
                    changeDialog.show();    
                }else{
                    CUI.Dialog.alert("${getText('RM.formulastatusnot99exception111')}");
                }
            }
        }
    
				};
			<#assign editView = getViewByCode('RM_7.5.0.0_formula_arrSuitlineEdit')>
			/**
			 * 列表编辑
			 * @method RM.formula.formula.formulaList.modifyformulaList
			 * @return {string} 待操作的记录ID
			 * @private
			 */
			RM.formula.formula.formulaList.modifyformulaList = function() {
				var buttonCode='RM_7.5.0.0_formula_formulaList_BUTTON_arrSuitlineEdit';
				if(RM.formula.formula.formulaList.checkSelectedAny()){
					if(RM.formula.formula.formulaList.checkSelectedMore()) {
						var cid = ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].cid;
						if(cid!='${Session.company.id}'){
							workbenchErrorBarWidget.showMessage("${getText('ec.edit.button.uncurrent.company')}",'f');
							return;
						}
						<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
							var otherParams = {};
							<#if editView.hasAttachment?? && editView.hasAttachment == true>
							otherParams.operateRecordId = RM.formula.formula.formulaList.getOperateRecordId();
							otherParams.uploadBtn = RM.formula.formula.formulaList.createUploadBtn(otherParams);
							</#if>
							<#if editView.isReference?? && editView.isReference == true>
							otherParams.referenceCopyBtn = RM.formula.formula.formulaList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
							</#if>
							<#if editView.isPrint?? && editView.isPrint == true>
							otherParams.printBtn = RM.formula.formula.formulaList.createPrintBtn('${editView.name}','${editView.url}?entityCode=RM_7.5.0.0_formula&id=' + RM.formula.formula.formulaList.getOperateRecordId()+"&${getPowerCode('${buttonPerfix!}formulaList_arrSuitlineEdit_modify_RM_7.5.0.0_formula_formulaList')}");
							otherParams.printSettingBtn = RM.formula.formula.formulaList.createPrintSettingBtn('${editView.name}');
							</#if>
							otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
							RM.formula.formula.formulaList.otherParams = otherParams;

							RM.formula.formula.formulaList.showDialog('${editView.url}?entityCode=RM_7.5.0.0_formula&buttonCode='+encodeURIComponent(buttonCode)+'&namespace=list_operate_formula_formulaList'+'&id=' + RM.formula.formula.formulaList.getOperateRecordId() + "&superEdit=true&${getPowerCode('${buttonPerfix!}formulaList_arrSuitlineEdit_modify_RM_7.5.0.0_formula_formulaList')}",'RM_formula_formula_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
						<#else>
						   	var signatureStr='';
							var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
					 		if(signatureInfo[0] != '') {
					 			signatureStr = "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
					 		}
							openFullScreen('${editView.url}?entityCode=RM_7.5.0.0_formula'+signatureStr+'&id=' + RM.formula.formula.formulaList.getOperateRecordId() + "&superEdit=true&${getPowerCode('${buttonPerfix!}formulaList_arrSuitlineEdit_modify_RM_7.5.0.0_formula_formulaList')}"<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
						</#if>
					}
				}
			};
			/**
			 * 双击修改数据
			 * @method RM.formula.formula.formulaList.dbmodifyformulaList
			 */
			RM.formula.formula.formulaList.dbmodifyformulaList =function(event,oRow){
				var buttonCode='RM_7.5.0.0_formula_formulaList_BUTTON_arrSuitlineEdit';
					var url = "${editView.url}?entityCode=RM_7.5.0.0_formula&buttonCode="+encodeURIComponent(buttonCode)+'&namespace=list_operate_formula_formulaList'+"&id=" + oRow.id + "&${getPowerCode('${buttonPerfix!}formulaList_arrSuitlineEdit_modify_RM_7.5.0.0_formula_formulaList')}";
				<#if editView?? && editView.openType?? && editView.openType == 'dialog'>
					var otherParams = {};
					<#if editView.hasAttachment?? && editView.hasAttachment == true>
					otherParams.operateRecordId = RM.formula.formula.formulaList.getOperateRecordId();
					otherParams.uploadBtn = RM.formula.formula.formulaList.createUploadBtn(otherParams);
					</#if>
					<#if editView.isReference?? && editView.isReference == true>
					otherParams.referenceCopyBtn = RM.formula.formula.formulaList.createReferenceCopyBtn({viewName:'${editView.name}', referenceUrl:'${editView.reference.url}'});
					</#if>
					<#if editView.isPrint?? && editView.isPrint == true>
					otherParams.printBtn = RM.formula.formula.formulaList.createPrintBtn('${editView.name}',url);
					otherParams.printSettingBtn = RM.formula.formula.formulaList.createPrintSettingBtn('${editView.name}',url);
					</#if>
					otherParams.dialogType = '<#if (editView.dialogType)??>${editView.dialogType?substring(editView.dialogType?last_index_of('_') + 1)}<#else>OTHER</#if>';
					RM.formula.formula.formulaList.otherParams = otherParams;

					RM.formula.formula.formulaList.showDialog(url,'RM_formula_formula_${editView.name}_form','${getText(editView.title!)}',${(editView.width)!500},${(editView.height)!260},'${(editView.code)!}',buttonCode);
				<#else>
					var signatureInfo=signatureUtil.getSignatureInfo(false,buttonCode);
				 	if(signatureInfo[0] != '') {
				 		 url += "&buttonCode="+buttonCode+"&signatureType="+signatureInfo[0]+"&defaultReason="+encodeURIComponent(signatureInfo[1]);
				 	}
					openFullScreen(url<#if editView.width?? && editView.width?has_content>,${editView.width}</#if><#if editView.height?? && editView.height?has_content>,${editView.height}</#if>);
				</#if>
			};
			function editSuitLineBatch(){
	var selectRowLength = ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow().length;
	if(selectRowLength == 0 ){
		workbenchErrorBarWidget.showMessage("清先选中行！", 'f');
		return false;
	}	
	if(selectRowLength > 1 ){
		workbenchErrorBarWidget.showMessage("选中行数不能大于1！", 'f');
		return false;
	}	
	var stateId = ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].state.id;
	if(stateId != 'RMstate/state2'){
		workbenchErrorBarWidget.showMessage("配方状态不为已启用，不能编辑适用产线！", 'f');
		return false;
	}	

	openFullScreen('/RM/formula/formula/arrSuitlineEdit.action?entityCode=RM_7.5.0.0_formula&id=1034&superEdit=true&__pc__=Zm9ybXVsYUxpc3RfYXJyU3VpdGxpbmVFZGl0X21vZGlmeV9STV83LjUuMC4wX2Zvcm11bGFfZm9ybXVsYUxpc3R8');
};
				function proItemSet(){ 
							
var selectFormula = ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0];
if(selectFormula!="" && selectFormula!=undefined){
var formulaId = selectFormula.id;
var demo = selectFormula.edition;
//类型为配方
var mappingType = "processActiveType/formula";
var url='/processAnl/processModelSet/proAnalySet/processModelEdit.action?entityCode=processAnl_1.0.0_processModelSet&activeId='+formulaId +"&mappingType="+mappingType+"&demo="+demo +"&__pc__=cHJvY2Vzc01vZGVsTGlzdF9hZGRQcm9BbmFseV9hZGRfcHJvY2Vzc0FubF8xLjAuMF9wcm9jZXNzTW9kZWxTZXRfcHJvY2Vzc01vZGVsTGlzdHw_";
		openFullScreen(url); 

}else{
	workbenchErrorBarWidget.showMessage("请选择一条记录进行操作",'f');
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
				try{RM.formula.formula.formulaList.Dlg.close();closeLoadPanel();}catch(e){}
							if(res.operateType == 'save'||res.operateType == 'delete') {
								var queryFunc = datatable_ec_RM_formula_formula_formulaList_query.get('queryFunc');
								var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_RM_formula_formula_formulaList_queryWidget.dataTableId).val();
								if(null != queryFunc && "undefined" != queryFunc){
							    	if(typeof RM_formula_formula_formulaList_getLayout == "function"){
							    		var layout = RM_formula_formula_formulaList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	RM.formula.formula.formulaList.node = node	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_formula_formula_formulaList_queryWidget._sortKey && ec_RM_formula_formula_formulaList_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
										if(modelCode == 'RM_7.5.0.0_formula_Formula'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}else{
											layout.refreshTree(-1);
										}
							    	}else{
							    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
							    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_formula_formula_formulaList_queryWidget._sortKey && ec_RM_formula_formula_formulaList_queryWidget._sortMethod ? true : false) + ")");
								    	} else {
											eval(queryFunc);
								    	}
							    	}		
								} else {
									var needSort = ec_RM_formula_formula_formulaList_queryWidget._sortKey && ec_RM_formula_formula_formulaList_queryWidget._sortMethod ? true : false;
									if(typeof RM_formula_formula_formulaList_getLayout == "function"){
										var layout = RM_formula_formula_formulaList_getLayout();
										var node = layout.getNode();
										var modelCode = null;
										if(node!=null){
											modelCode = node.modelCode;
										}
								    	RM.formula.formula.formulaList.node = node;	
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		RM.formula.formula.formulaList.query('query',_Current_PageNo,needSort);
								    	} else {
								    		RM.formula.formula.formulaList.query('query');
								    	}
										if(modelCode == 'RM_7.5.0.0_formula_Formula'){
											var treeId = layout.refreshNodeId(node, res.operate);
											layout.refreshTree(treeId);
										}
									}else{
										if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
								    		RM.formula.formula.formulaList.query('query',_Current_PageNo,needSort);
								    	} else {
								    		RM.formula.formula.formulaList.query('query');
								    	}
									}
								}
							}
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	/**
	 * 获取待操作的记录ID，从树或者列表上获取
	 * @method RM.formula.formula.formulaList.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	RM.formula.formula.formulaList.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_RM_formula_formula_formulaList_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_RM_formula_formula_formulaList_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_RM_formula_formula_formulaList_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method RM.formula.formula.formulaList.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	RM.formula.formula.formulaList.checkSelectedValid = function(type) {
		if(RM.formula.formula.formulaList.checkSelectedAny()){
			for(var i=0;i<datatable_ec_RM_formula_formula_formulaList_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_RM_formula_formula_formulaList_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_RM_formula_formula_formulaList_query.selectedRows[i].valid === false){
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
	 * @method RM.formula.formula.formulaList.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	RM.formula.formula.formulaList.checkSelectedAny = function() {
		if(datatable_ec_RM_formula_formula_formulaList_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method RM.formula.formula.formulaList.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	RM.formula.formula.formulaList.checkSelectedMore = function() {
		if(datatable_ec_RM_formula_formula_formulaList_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	/**
	 * 显示增加对话框
	 * @method RM.formula.formula.formulaList.showDialog
	 * @param {String} url
	 * @private
	 */
	RM.formula.formula.formulaList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = RM.formula.formula.formulaList.otherParams || {};
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
				<#assign editView = getViewByCode('RM_7.5.0.0_formula_arrSuitlineEdit')>
				<#if editView.extraView?? && editView.extraView.configMap?? && editView.extraView.configMap.layout?? && editView.extraView.configMap.layout.sections??>
				if(viewCode=='${editView.code}'||!viewCode){
					<#list editView.extraView.configMap.layout.sections as buttonSection>
						<#if buttonSection.cells??>
							<#list (buttonSection.cells) as operateBtn>
								<#if operateBtn.id?? && (operateBtn.isHide)?string('true','false')=='false'>
									<#if !operateBtn.ispermission?? || (operateBtn.ispermission)?string('true','false')=='false' 
										|| checkUserPermisition('${editView.entity.code}_${operateBtn.permissionCode!}')>
										buttons.push({
											name:"${getText(operateBtn.namekey!)}",
											align:"${operateBtn.buttonAlign!'left'}",
											handler:function(){
												<#if operateBtn['funcname']?? && operateBtn['funcname']?has_content>
												<#assign funcname = (operateBtn['funcname'])?replace('\'','')>
												<#assign funcname = funcname?split('=')[1]>
												list_operate_formula_formulaList.${funcname};
												</#if>
											}
										});
									</#if>
								</#if>
							</#list>
						</#if>
					</#list>
					}
				</#if>
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
					list_operate_formula_formulaList.CUI('#'+formId).submit();
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
		if ( RM.formula.formula.formulaList.Dlg ) {
			RM.formula.formula.formulaList.Dlg._config.url = url;
			RM.formula.formula.formulaList.Dlg._config.formId = formId;
			RM.formula.formula.formulaList.Dlg.setTitle( title )
			RM.formula.formula.formulaList.Dlg.setButtonbar( buttons );
		}else{
			RM.formula.formula.formulaList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_formula_formulaList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		RM.formula.formula.formulaList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		RM.formula.formula.formulaList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'RM_formula_formula', element : $('#RM_formula_formula_formulaList_fileupload_button a:eq(1)')});
		}
		RM.formula.formula.formulaList.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method RM.formula.formula.formulaList.approvalDialog
	 * @param {String} url
	 * @private
	 */
	RM.formula.formula.formulaList.approvalDialog = function(url,formId,title,width,height) {
		RM.formula.formula.formulaList.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){try{RM.formula.formula.approval();}catch(e){}}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		RM.formula.formula.formulaList.AppDlg.show();
	};

	RM.formula.formula.formulaList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof RM.formula.formula.formulaList.beforeCommonQuery === 'function') {
	   		var ret = RM.formula.formula.formulaList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof RM.formula.formula.formulaList.cancelSelectedNode == 'function') {
	   RM.formula.formula.formulaList.cancelSelectedNode();
	   RM.formula.formula.formulaList.node = null;
	  }
	  if(typeof RM_formula_formula_formulaList_cancelSelectedNode == 'function') {
	   RM_formula_formula_formulaList_cancelSelectedNode();
	   RM.formula.formula.formulaList.node = null;
	  }
	  RM.formula.formula.formulaList.query(type);
	 };
	
	/**
	 * 查询
	 * @method RM.formula.formula.formulaList.query
	 */
	RM.formula.formula.formulaList.query = function(type,pageNo,sortFlag){
		var node = RM.formula.formula.formulaList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//RM.formula.formula.formulaList.node = null;
		if(!checkListValid("ec_RM_formula_formula_formulaList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_RM_formula_formula_formulaList_query._sortKey && datatable_ec_RM_formula_formula_formulaList_query._sortMethod){
			CUI('#ec_RM_formula_formula_formulaList_queryForm #dataTableSortColKey').val(datatable_ec_RM_formula_formula_formulaList_query._sortKey);
			CUI('#ec_RM_formula_formula_formulaList_queryForm #dataTableSortColName').val(datatable_ec_RM_formula_formula_formulaList_query._sortColumnName);
			CUI('#ec_RM_formula_formula_formulaList_queryForm #dataTableSortColOrder').val(datatable_ec_RM_formula_formula_formulaList_query._sortMethod);
		}else{
			datatable_ec_RM_formula_formula_formulaList_query._sortKey = '';
			CUI('#ec_RM_formula_formula_formulaList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_RM_formula_formula_formulaList_queryForm #dataTableSortColName').val('');
			CUI('#ec_RM_formula_formula_formulaList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
		if(type && type == 'pending') {
			if(null != datatable_ec_RM_formula_formula_formulaList_query.get('dblclick') && datatable_ec_RM_formula_formula_formulaList_query.get('dblclick').length > 0) {
				datatable_ec_RM_formula_formula_formulaList_query.setAttributeConfig('dblclick', {
		                writeOnce: true,
		                value: 'RM.formula.formula.formulaList.rowDblClick'
		            });
			}
	        datatable_ec_RM_formula_formula_formulaList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "RM.formula.formula.formulaList.query('pending')"
            });    
	    } 
	    if(type && type == 'query') {
	    	if(null != datatable_ec_RM_formula_formula_formulaList_query.get('dblclick') && datatable_ec_RM_formula_formula_formulaList_query.get('dblclick').length > 0) {
		    	datatable_ec_RM_formula_formula_formulaList_query.setAttributeConfig('dblclick', {
		                writeOnce: true,
		                value: 'RM.formula.formula.formulaList.rowDblClickQuery'
		            });
		    }
	        datatable_ec_RM_formula_formula_formulaList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "RM.formula.formula.formulaList.query('query')"
            }); 
	    } 
	    if(type && type == 'adv') {
	    	datatable_ec_RM_formula_formula_formulaList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "RM.formula.formula.formulaList.query('adv')"
            });
	    }
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/RM/formula/formula/formulaList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/RM/formula/formula/formulaList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_RM_formula_formula_formulaList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_RM_formula_formula_formulaList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="RM_7.5.0.0_formula_formulaList";
		condobj.modelAlias="formula";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_RM_formula_formula_formulaList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_RM_formula_formula_formulaList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_RM_formula_formula_formulaList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_RM_formula_formula_formulaList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_RM_formula_formula_formulaList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_RM_formula_formula_formulaList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_RM_formula_formula_formulaList_queryForm *[name="'+ec_RM_formula_formula_formulaList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_RM_formula_formula_formulaList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_RM_formula_formula_formulaList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_RM_formula_formula_formulaList_quickquery_info["MainTableName"];
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
						var layrec=ec_RM_formula_formula_formulaList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_RM_formula_formula_formulaList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'RM_7.5.0.0_formula_formulaList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_RM_formula_formula_formulaList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_RM_formula_formula_formulaList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	RM.formula.formula.formulaList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=RM_7.5.0.0_formula";
		openExportFrame(url);
	}
RM.formula.formula.formulaList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	RM.formula.formula.formulaList.otherParams = {};
	RM.formula.formula.formulaList.otherParams.dialogType = dialogType;
	RM.formula.formula.formulaList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		RM.formula.formula.formulaList.showDialog(url,formId,title,width,height,viewCode);
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
	var queryFunc = datatable_ec_RM_formula_formula_formulaList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_RM_formula_formula_formulaList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof RM_formula_formula_formulaList_getLayout == "function"){
    		var layout = RM_formula_formula_formulaList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.formula.formula.formulaList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_formula_formula_formulaList_queryWidget._sortKey && ec_RM_formula_formula_formulaList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'RM_7.5.0.0_formula_Formula'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_RM_formula_formula_formulaList_queryWidget._sortKey && ec_RM_formula_formula_formulaList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_RM_formula_formula_formulaList_queryWidget._sortKey && ec_RM_formula_formula_formulaList_queryWidget._sortMethod ? true : false;
		if(typeof RM_formula_formula_formulaList_getLayout == "function"){
			var layout = RM_formula_formula_formulaList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	RM.formula.formula.formulaList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.formula.formula.formulaList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		RM.formula.formula.formulaList.query('pending');
	    	}
			if(modelCode == 'RM_7.5.0.0_formula_Formula'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		RM.formula.formula.formulaList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		RM.formula.formula.formulaList.query('pending');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId, errorbarWidget){errorbarWidget=errorbarWidget||workbenchErrorBarWidget;var edition_start = $('#' + formId + ' input[name^="edition_start"]').val();var edition_end = $('#' + formId + ' input[name^="edition_end"]').val();if(edition_start != null && edition_start != ''){if(!isDecimal(edition_start)){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487139592239')}${getText('ec.list.validate.decimal')}");return false;}}if(edition_end != null && edition_end != ''){if(!isDecimal(edition_end)){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487139592239')}${getText('ec.list.validate.decimal')}");return false;}}if($('#' + formId + ' input[name^="startTime_start"]').val()!= null && $('#' + formId + ' input[name^="startTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="startTime_start"]').val()+"")){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487076643939')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="startTime_end"]').val()!= null && $('#' + formId + ' input[name^="startTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="startTime_end"]').val()+"")){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487076643939')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="endTime_start"]').val()!= null && $('#' + formId + ' input[name^="endTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="endTime_start"]').val()+"")){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487076706699')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="endTime_end"]').val()!= null && $('#' + formId + ' input[name^="endTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="endTime_end"]').val()+"")){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487076706699')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name="startTime_start"]').val()!='' && $('#' + formId + ' input[name="startTime_end"]').val()!=''){if($('#' + formId + ' input[name="startTime_start"]').val() > $('#' + formId + ' input[name="startTime_end"]').val()){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487076643939')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('RM.propertydisplayName.randon1487076643939')}${getText('ec.list.validate.start')}");return false;}}if($('#' + formId + ' input[name="edition_start"]').val()!='' && $('#' + formId + ' input[name="edition_end"]').val()!=''){if(parseInt($('#' + formId + ' input[name="edition_start"]').val()) > parseInt($('#' + formId + ' input[name="edition_end"]').val())){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487139592239')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('RM.propertydisplayName.randon1487139592239')}${getText('ec.list.validate.start')}");return false;}}if($('#' + formId + ' input[name="endTime_start"]').val()!='' && $('#' + formId + ' input[name="endTime_end"]').val()!=''){if($('#' + formId + ' input[name="endTime_start"]').val() > $('#' + formId + ' input[name="endTime_end"]').val()){errorbarWidget.showMessage("${getText('RM.propertydisplayName.randon1487076706699')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('RM.propertydisplayName.randon1487076706699')}${getText('ec.list.validate.start')}");return false;}}return true;};



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
/**
 * 批量处理事件
 * 
 */
RM.formula.formula.formulaList.approval=function(obj){
	var selectrows = datatable_ec_RM_formula_formula_formulaList_query.selectedRows;
	selectrows=selectrows.sort(sortLineInTabOrder);//按表单顺序重新排序
	var atn = "";
	var deploymentId = "";
	var processid="";
	var ids = ""; //application ID
	var pendingIds = ""; //待办ID
	var activityType = "";
	var des = "";
	var alertContent="<div style='margin-right:10px;padding:5px;height:245px;overflow:auto;line-height:20px'><p style='font-weight:bold'>${getHtmlText('ec.list.batch.failed')}</p>";//提示内容
	var nopending="";//无待办
	var noflag="";//未启用批量
	var others="";//其他
	var flag = true;
	var outcomeStr = "";//路由信息 ||activeType（活动类型），outcome（路由code），dec（路由描述），assignUser（指定人员的用户ids）;activeType，outcome，dec，assignUser||activeType，outcome，dec，assignUser;activeType，outcome，dec，assignUser
	var isHandOut = "";//挂起
	var isEffective = "";//生效
	var notSingleTask = false; // 单据状态不唯一
	if(selectrows!=null&&selectrows.length>0){
		var map={};
		processid=selectrows[0].pending.processId;
		var isdeploy = false;
		$.each(selectrows,function(i,st){
			var no = st.tableNo;
			var status = st.status;
			if(status=="77"){
				isHandOut = status;
				return false;
			}
			if(st.pending==null||st.pending==undefined||st.pending.id==null||st.pending.id==undefined||st.pending.bulkDealFlag==null||st.pending.bulkDealFlag==undefined){
				if(nopending==""){
					nopending=no;
				}else{
					nopending=nopending+"${getText('ec.list.batch.semicolon')}"+no;
				}
				flag = false;
			}
			if (st.pending.taskDescription) {
				var length = st.pending.taskDescription.split(",").length;
				if(length > 1){
					notSingleTask = true;
					return false;
				}
			}
			if(st.pending.bulkDealFlag==false){
				if(noflag==""){
					noflag=no;
				}else{
					noflag=noflag+"${getText('ec.list.batch.semicolon')}"+no;
				}
				flag = false;
			}
			if(deploymentId==""){
					deploymentId = st.pending.deploymentId;
					if(st.pending.processDescription!=null&&st.pending.processVersion!=null){
						if(map[st.pending.processDescription+"("+st.pending.processVersion+")"]==null||map[st.pending.processDescription+"("+st.pending.processVersion+")"]==""){
							map[st.pending.processDescription+"("+st.pending.processVersion+")"]=no;
						}else{
							map[st.pending.processDescription+"("+st.pending.processVersion+")"]=map[st.pending.processDescription+"("+st.pending.processVersion+")"]+"${getText('ec.list.batch.semicolon')}"+no;
						}
					}
			}
			if(atn==""){
				atn = st.pending.activityName;
				des = st.pending.taskDescription;
				des = encodeURI(des);
				des = encodeURI(des);
			}
			if(st.pending.deploymentId!=deploymentId){
				if(st.pending.processDescription!=null&&st.pending.processVersion!=null){
					if(map[st.pending.processDescription+"("+st.pending.processVersion+")"]==null||map[st.pending.processDescription+"("+st.pending.processVersion+")"]==""){
						map[st.pending.processDescription+"("+st.pending.processVersion+")"]=no;
					}else{
						map[st.pending.processDescription+"("+st.pending.processVersion+")"]=map[st.pending.processDescription+"("+st.pending.processVersion+")"]+"${getText('ec.list.batch.semicolon')}"+no;
					}
					isdeploy = true;
				}
				flag = false;
				isdeploy = true;
			}else if(st.pending.activityName!=atn){
				if(st.pending.processDescription!=null&&st.pending.processVersion!=null){
					if(map[st.pending.processDescription+"("+st.pending.processVersion+")"]==null||map[st.pending.processDescription+"("+st.pending.processVersion+")"]==""){
						map[st.pending.processDescription+"("+st.pending.processVersion+")"]=no;
					}else{
						map[st.pending.processDescription+"("+st.pending.processVersion+")"]=map[st.pending.processDescription+"("+st.pending.processVersion+")"]+"${getText('ec.list.batch.semicolon')}"+no;
					}
					isdeploy = true;
				}
				flag = false;
				
			}
			if(activityType==""){
				activityType = st.pending.activityType;
			}
			if(flag){
				if(ids==""){
					ids = st.id;
				}else{
					ids=ids+","+st.id;
				}
				if(pendingIds==""){
					pendingIds = st.pending.id;
				}else{
					pendingIds=pendingIds+","+st.pending.id;
				}
			}
		});
		if(isHandOut=="77"){
			CUI.Dialog.alert("所选记录中包含已被挂起的流程，无法处理！");
			return false;
		}
		if (notSingleTask) {
			CUI.Dialog.alert("${getHtmlText('ec.list.batch.notSingleTask')}");
			return false;
		}
		if(!flag){
			if(nopending!=""){
				alertContent=alertContent+"<p style='font-weight:bold'>1.${getHtmlText('ec.list.batch.billHasNoPending')}</p>"+replace(nopending,"${getHtmlText('ec.list.batch.semicolon')}");
				if(noflag!=""){
					alertContent=alertContent+"</br><p style='font-weight:bold'>2.${getHtmlText('ec.list.batch.batchEnabled')}</p>"+replace(noflag,"${getHtmlText('ec.list.batch.semicolon')}");
					if(isdeploy){
						alertContent=alertContent+"</br><p style='font-weight:bold'>3.${getHtmlText('ec.list.batch.inconsistent')}</p>";
						$.each(map,function(key,value){
							alertContent=alertContent+"<span style='font-weight:bold'>"+key+"：</span></br>"+replace(value,"${getHtmlText('ec.list.batch.semicolon')}")+"</br>"
						});
					}
				}else if(isdeploy){
					alertContent=alertContent+"</br><p style='font-weight:bold'>2.${getHtmlText('ec.list.batch.inconsistent')}</p>";
					$.each(map,function(key,value){
							alertContent=alertContent+"<span style='font-weight:bold'>"+key+"：</span></br>"+replace(value,"${getHtmlText('ec.list.batch.semicolon')}")+"</br>"
					});
				}
			}else if(noflag!=""){
				alertContent=alertContent+"<p style='font-weight:bold'>1.${getHtmlText('ec.list.batch.batchEnabled')}</p>"+replace(noflag,"${getHtmlText('ec.list.batch.semicolon')}");
					if(isdeploy){
						alertContent=alertContent+"</br><p style='font-weight:bold'>2.${getHtmlText('ec.list.batch.inconsistent')}</p>";
						$.each(map,function(key,value){
							alertContent=alertContent+"<span style='font-weight:bold'>"+key+"：</span></br>"+replace(value,"${getHtmlText('ec.list.batch.semicolon')}")+"</br>"
						});
					}
			}else if(isdeploy){
				alertContent=alertContent+"<p style='font-weight:bold'>1.${getHtmlText('ec.list.batch.inconsistent')}</p>";
				$.each(map,function(key,value){
					alertContent=alertContent+"<span style='font-weight:bold'>"+key+"：</span></br>"+replace(value,"${getHtmlText('ec.list.batch.semicolon')}")+"</br>"
				});
			}
			alertContent =alertContent+"</div>"
			CUI.Dialog.alert(alertContent, null, null,300,500);
			return false;
		}
	}else{
		CUI.Dialog.alert("${getHtmlText('ec.list.selectLeastOne')}");
		flag = false;
		return false;
	}
	if(flag){
		var url="/RM/formula/formula/approval.action?processId="+processid+"&activityName="+atn+"&pendingIds="+pendingIds+"&deploymentId="+deploymentId+"&ids="+ids+"&activityType="+activityType+"&des="+des+"";
		var formid="RM_formula_formula_approval_form";
		var title="${getText('ec.list.batchApproval')}";
		var width=500;
		var height=300;
		RM.formula.formula.formulaList.approvalDialog(url,formid,title,width,height);
	}
}
/*bug#496:重新对选择行进行排序，使选择的行顺序按照表单顺序，而非选择操作的顺序*/
function sortLineInTabOrder(a,b){
    var value1 = $(a.rowHtmlObj).index();
    var value2 = $(b.rowHtmlObj).index();
    return value1 - value2;
}
	/* CUSTOM CODE START(view-LIST-RM_7.5.0.0_formula_formulaList,js,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码
//检验部门提交
function submitFormula(){
	var len = window.frames["depart_iframe"].CheckDepartmentSet_dg1497589621829Widget.getRowLength();
    for (var i = 0 ; i < len ; i++){
        //验证检验活动是否为空
        if(window.frames["depart_iframe"].CheckDepartmentSet_dg1497589621829Widget.getCellValue(i,"activeID.processId.name")==""){
            window.frames["depart_iframe"].RM_formula_formula_checkDepartEdit_formDialogErrorBarWidget.show("${getText('RM.showMessage00000002')}","f");
            return false;
        }
        //验证工作中心是否为空
        if(window.frames["depart_iframe"].CheckDepartmentSet_dg1497589621829Widget.getCellValue(i,"factoryID.name")==""){
            window.frames["depart_iframe"].RM_formula_formula_checkDepartEdit_formDialogErrorBarWidget.show("${getText('RM.showMessage00000003')}","f");
            return false;
        }
        //验证申检部门是否为空
        if(window.frames["depart_iframe"].CheckDepartmentSet_dg1497589621829Widget.getCellValue(i,"applyCheckDept.name")==""){
            window.frames["depart_iframe"].RM_formula_formula_checkDepartEdit_formDialogErrorBarWidget.show("${getText('RM.showMessage00000004')}","f");
            return false;
        }
        //验证申检人是否为空
        if(window.frames["depart_iframe"].CheckDepartmentSet_dg1497589621829Widget.getCellValue(i,"applyCheckStaff.name")==""){
            window.frames["depart_iframe"].RM_formula_formula_checkDepartEdit_formDialogErrorBarWidget.show("${getText('RM.showMessage00000005')}","f");
            return false;
        }
        //验证检验部门是否为空
        if(window.frames["depart_iframe"].CheckDepartmentSet_dg1497589621829Widget.getCellValue(i,"exeCheckDept.name")==""){
            window.frames["depart_iframe"].RM_formula_formula_checkDepartEdit_formDialogErrorBarWidget.show("${getText('RM.showMessage00000006')}","f");
            return false;
        }
    }
  	//不允许出现检验活动与工作中心值一样的多条数据
    for (var i = 0 ; i < len ; i++){
        for (var j = i+1 ; j < len ; j++){
            if(window.frames["depart_iframe"].CheckDepartmentSet_dg1497589621829Widget.getCellValue(i,"activeID.id")==window.frames["depart_iframe"].CheckDepartmentSet_dg1497589621829Widget.getCellValue(j,"activeID.id") && window.frames["depart_iframe"].CheckDepartmentSet_dg1497589621829Widget.getCellValue(i,"factoryID.name")==window.frames["depart_iframe"].CheckDepartmentSet_dg1497589621829Widget.getCellValue(j,"factoryID.name")){
                window.frames["depart_iframe"].RM_formula_formula_checkDepartEdit_formDialogErrorBarWidget.show("${getText('RM.showMessage00000007')}","f");
                return false;
            }
        }
    }
  	//需要考虑工作单元的包含关系
    var jsonString =window.frames["depart_iframe"].CheckDepartmentSet_dg1497589621829Widget.getAllRowData();
    var formulaId = ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].id;
  	var checkDepartFactory = true;
    $.ajax({
        url : "/RM/formula/checkDepartmentSet/checkDepartFactory.action",
        type : 'post',
        traditional: true,
        async : false,
        data:{"jsonString":jsonString},
        success : function(res) {
            if(res.dealSuccessFlag==false){
                window.frames["depart_iframe"].RM_formula_formula_checkDepartEdit_formDialogErrorBarWidget.show("${getText('RM.showMessage00000008','"+(res.iValue+1)+"','"+(res.jValue+1)+"')}","f");
              	checkDepartFactory = false;
            }
        }
    });
    if(!checkDepartFactory){
		return false;
    }
	$.ajax({
		url : "/RM/formula/checkDepartmentSet/checkDepartEdit.action",
		type : 'post',
		traditional: true,
		async : false,
		data:{"jsonString":jsonString,"formulaId":formulaId},
		success : function(res) {
			if(res.dealSuccessFlag==true){
				window.frames["depart_iframe"].RM_formula_formula_checkDepartEdit_formDialogErrorBarWidget.show("保存","s");
			}
		}
	});
  	return true;
}
//日志添加callback按钮重写
	var change_Dialog;
	function   changeLogShow(type,url,title,refparam){
		change_Dialog=foundation.common.select({
		pageType:type,
		closePage:true,
		callBackFuncName:'_callback_changelogFunc',
		url:url,
		title : title,
		params : refparam
		});
	}
	
	function _callback_changelogFunc(objs){
	}


RM.formula.formula.formulaList.commonQuery = function(type) {
	if(typeof RM.formula.formula.formulaList.cancelSelectedNode == 'function') {
	   	RM.formula.formula.formulaList.cancelSelectedNode();
	   	RM.formula.formula.formulaList.node = null;
	}
	if(typeof RM_formula_formula_formulaList_cancelSelectedNode == 'function') {
	   	RM_formula_formula_formulaList_cancelSelectedNode();
	   	RM.formula.formula.formulaList.node = null;
	}
	RM.formula.formula.formulaList.query(type);
	//$($($(".paginatorbar-operatebar").children()[6]).children()).html("设置默认");
};
                  
    /**
	 * 列表编辑
	 * @method RM.formula.formula.formulaList.modifyformulaList
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	RM.formula.formula.formulaList.modifyformulaList = function() {
		if(RM.formula.formula.formulaList.checkSelectedAny()){
			if(RM.formula.formula.formulaList.checkSelectedMore()) {
				var selectRow = ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow();
				if(selectRow[0].state.value != null && selectRow[0].state.value != "已启用"){
					workbenchErrorBarWidget.showMessage("配方状态不是已启用，不能编辑适用产线","f");
					return false;
				}
				openFullScreen('/RM/formula/formula/arrSuitlineEdit.action?entityCode=RM_7.5.0.0_formula&id=' + RM.formula.formula.formulaList.getOperateRecordId() + "&superEdit=true&${getPowerCode('${buttonPerfix!}formulaList_arrSuitlineEdit_modify_RM_7.5.0.0_formula_formulaList')}");
			}
		}
	};
/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='RM_7.5.0.0_formula_formulaList' idprefix='ec_RM_formula_formula_formulaList' queryUrl='/RM/formula/formula/formulaList-query.action' queryFunc="RM.formula.formula.formulaList.query" ns="RM.formula.formula.formulaList" />
<@exportexcel action="/RM/formula/formula/formulaList-query.action"   getRequireDataAction="/RM/formula/formula/formulaList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=RM_7.5.0.0_formula_Formula&&viewCode=RM_7.5.0.0_formula_formulaList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('RM_7.5.0.0_formula_formulaList')}" prefix="ec_RM_formula_formula_formulaList_query" modelCode="RM_7.5.0.0_formula_Formula"  importFlag="false" viewCode="RM_7.5.0.0_formula_formulaList" />
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
