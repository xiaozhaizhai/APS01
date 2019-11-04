/**
 * 截取URL获取参数,拿不到返回false
 * @param variable
 * @returns
 */
function getQueryVariable(variable)
{
       var query = window.location.search.substring(1);
       var vars = query.split("&");
       for (var i=0;i<vars.length;i++) {
               var pair = vars[i].split("=");
               if(pair[0] == variable){return pair[1];}
       }
       return(false);
}

/**
 请检单新增初始数据
 由生产操作打开请检单界面时调用
 */
function generalAdd(){
	var produceTaskId=getQueryVariable("produceTaskId");
	var generalManage=getQueryVariable("generalManage");
  	if(produceTaskId==false ||generalManage==false){
  		//没有获取参数跳出
  		return;  		
  	}else{
  		$("#manuInspectqmBusinessTypeid").val("QMbusiTypeManu/manu");
  		$("#manuInspect_qmBusinessType_id__jQSelect01 h4").html("产品检验");
  		//ManuInsppart_dg1490602014644Widget.addRow();
  		$.ajax({
  			url : "/WOM/generalManage/produceTaskManage/getCheckDetail.action",
  			type : 'post',
  			traditional: true,
  			async : false,
  			data:{"produceTaskId":produceTaskId},
  			success : function(res) {
  			
  				if(res.dealSuccessFlag==true){
  					//物品
  					if(res.productCode!=null && res.productCode!=undefined){
  						$('input[name="manuInspect.productID.productCode"]').val(res.productCode)
  						$('#manuInspect_productID_productCode_mneTipLabel').hide()
  					}
  					if(res.productName!=null && res.productName!=undefined){
  						$('input[name="manuInspect.productID.productName"]').val(res.productName)
  					}
  					if(res.productId!=null && res.productId!=undefined){
  						$('input[name="manuInspect.productID.id"]').val(res.productId)
  					}
  					//单位
  					if(res.produceUnit!=null && res.produceUnit!=undefined){
  						$('input[name="manuInspect.munit.name"]').val(res.produceUnit)
  						$('input[name="manuInspect.munit.id"]').val(res.produceUnitId)		
  					}
  					//批号
  					if(res.batchNum!=null && res.batchNum!=undefined){
  						$('input[name="manuInspect.partCode"]').val(res.batchNum)
  					}
  					//数量
  					if(res.productNum!=null && res.productNum!=undefined){
  						$('input[name="manuInspect.quantity"]').val(res.productNum)
  					}
  					//采样点
  					if(res.pickSiteName!=null && res.pickSiteName!=undefined){
  						$('input[name="manuInspect.psID.name"]').val(res.pickSiteName)
  						$('#manuInspect_psID_name_mneTipLabel').hide()
  					}
  					if(res.pickSiteId!=null && res.pickSiteId!=undefined){
  						$('input[name="manuInspect.psID.id"]').val(res.pickSiteId)
  					}			
  					if(res.standId!=null){
  						ManuInsppart_dg1490602014644Widget.addRow();
  						//质量标准
  						if(res.standName!=null && res.standName!=undefined){
  							ManuInsppart_dg1490602014644Widget.setCellValue(0,"standID.name",res.standName);
  						}
  						if(res.standId!=null && res.standId!=undefined){
  							ManuInsppart_dg1490602014644Widget.setCellValue(0,"standID.id",res.standId);
  						}
  						//？？
  						if(res.sampleProjName!=null && res.sampleProjName!=undefined){
  							ManuInsppart_dg1490602014644Widget.setCellValue(0,"spID.name",res.sampleProjName);
  						}
  						if(res.sampleProjId!=null && res.sampleProjId!=undefined){
  							ManuInsppart_dg1490602014644Widget.setCellValue(0,"spID.id",res.sampleProjId);
  						}
  						//测试项目
  						if(res.testProjName!=null && res.testProjName!=undefined){
  							ManuInsppart_dg1490602014644Widget.setCellValue(0,"testProjID.name",res.testProjName);
  						}
  						if(res.testProjId!=null && res.testProjId!=undefined){
  							ManuInsppart_dg1490602014644Widget.setCellValue(0,"testProjID.id",res.testProjId);
  						}

  					}
                  //length=0说明配方中没有设置质量标准测试方案-启用LIMS基础中设置的质量标准测试方案
  					var length = ManuInsppart_dg1490602014644Widget.getRowLength();
  					if(length == 0){
  						var nRow = length;
  						CUI.ajax({
  							type : 'POST',
  							url : '/LIMSBasic/qualityStandard/stand/getDefaultStand.action?productID=' +res.productId,
  							success : function(obj){
  								try{
  									if(obj.dealSuccessFlag==true) {
  										//质量标准赋值
  										ManuInsppart_dg1490602014644Widget._DT.addNewRow()
  										ManuInsppart_dg1490602014644Widget.setCellValue(nRow,"standID.id",obj.standID);
  										ManuInsppart_dg1490602014644Widget.setCellValue(nRow,"standID.name",obj.standName);
  										if(obj.testProjFlag==true&&($("input[name='manuInspect.needLabCheck']").val()==true||$("input[name='manuInspect.needLabCheck']").val()=='true')){
  											//测试方案赋值
  											ManuInsppart_dg1490602014644Widget.setCellValue(nRow,"testProjID.id",obj.testProjID);
  											ManuInsppart_dg1490602014644Widget.setCellValue(nRow,"testProjID.name",obj.testProjName);						
  										}else{
  											//清空测试方案
  											ManuInsppart_dg1490602014644Widget.setCellValue(nRow,"testProjID.id","");
  											ManuInsppart_dg1490602014644Widget.setCellValue(nRow,"testProjID.name","");	
  										}
  									}else{
  										ManuInsppart_dg1490602014644Widget._DT.delAllRows();
  									}
  								} catch(e){}
  							}
  						});
  					}
  					//上级表单类别-生产入库
  					$("#manuInspectupTableTypeid").setValue("QMupTableType/produceInSingle");
  				}
  				/*
  				if(res.dealSuccessFlag==true){
  					if(res.productCode!=null && res.productCode!=undefined){
  						ManuInsppart_dg1490602014644Widget.setCellValue(0,"productID.productCode",res.productCode);
  					}
  					if(res.productName!=null && res.productName!=undefined){
  						ManuInsppart_dg1490602014644Widget.setCellValue(0,"productID.productName",res.productName);
  					}
  					if(res.produceUnit!=null && res.produceUnit!=undefined){
  						ManuInsppart_dg1490602014644Widget.setCellValue(0,"munit.name",res.produceUnit);
  	                    ManuInsppart_dg1490602014644Widget.setCellValue(0,"munit.id",res.produceUnitId);
  					}
  					if(res.productId!=null && res.productId!=undefined){
  						ManuInsppart_dg1490602014644Widget.setCellValue(0,"productID.id",res.productId);
  					}
  					if(res.batchNum!=null && res.batchNum!=undefined){
  						ManuInsppart_dg1490602014644Widget.setCellValue(0,"partCode",res.batchNum);
  					}
  					if(res.testProjName!=null && res.testProjName!=undefined){
  						ManuInsppart_dg1490602014644Widget.setCellValue(0,"testProjID.name",res.testProjName);
  					}
  					if(res.testProjId!=null && res.testProjId!=undefined){
  						ManuInsppart_dg1490602014644Widget.setCellValue(0,"testProjID.id",res.testProjId);
  					}
  					if(res.sampleProjName!=null && res.sampleProjName!=undefined){
  						ManuInsppart_dg1490602014644Widget.setCellValue(0,"spID.name",res.sampleProjName);
  					}
  					if(res.sampleProjId!=null && res.sampleProjId!=undefined){
  						ManuInsppart_dg1490602014644Widget.setCellValue(0,"spID.id",res.sampleProjId);
  					}
  					if(res.standName!=null && res.standName!=undefined){
  						ManuInsppart_dg1490602014644Widget.setCellValue(0,"standID.name",res.standName);
  					}
  					if(res.standId!=null && res.standId!=undefined){
  						ManuInsppart_dg1490602014644Widget.setCellValue(0,"standID.id",res.standId);
  					}
  					if(res.pickSiteName!=null && res.pickSiteName!=undefined){
  						ManuInsppart_dg1490602014644Widget.setCellValue(0,"psID.name",res.pickSiteName);
  					}
  					if(res.pickSiteId!=null && res.pickSiteId!=undefined){
  						ManuInsppart_dg1490602014644Widget.setCellValue(0,"psID.id",res.pickSiteId);
  					}
  					if(res.productNum!=null && res.productNum!=undefined){
  						ManuInsppart_dg1490602014644Widget.setCellValue(0,"quantity",res.productNum);
  					}
  					//上级表单类别upTableType
  					ManuInsppart_dg1490602014644Widget.setCellValue(0,"upTableType.id","QMupTableType/produceInSingle");
  				}
  	            */
  				
  			}
  		});
  	}
}



