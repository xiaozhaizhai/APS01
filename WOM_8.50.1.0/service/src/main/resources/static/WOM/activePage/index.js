"use strict";
(function ($) {
    var processObj;

    var obj = GetRequest();
   	//先清空页面
	$("#divContent").html("")
    $.ajax({
        'url':'/WOM/produceTask/produceTask/getProcessesData.action',
        'data':{
            produceTaskId : obj["produceTaskId"]
        },
        'success':function(data){
            if (data) {
                processObj = data;
                //给大工序排序
                processObj.processSteps.sort(processSort("step", false));
                $.each(processObj.processSteps, function () {
                    menuItemArr[1].items[0].items.push({"id": this.id, "name": this.name});
                });
               // activeFormat(processObj['processSteps'][0].childStep);
              	var menuItem = `<li><a href="#" class="menuItem"><i></i><span class="nav-label"></span></a></li>`;
                var $menuItem = $(menuItem);
                var secondLevel = `<li><a href="#" class="menuItem"><i></i><span class="nav-label"></span></a><ul class="nav nav-second-level"></ul></li>`;
                var $secondLevel = $(secondLevel);
                var thirdLevel = `<li><a href="#" class="menuItem"><span class="nav-label"></span></a><ul class="nav nav-third-level"></ul></li>`;
                var $thirdLevel = $(thirdLevel);
                var arrow = `<span class="fa arrow"></span>`;
                for(var i=0;i<menuItemArr.length;i++){
                    if(menuItemArr[i].haschild){
                        $secondLevel.find('.nav-label').text(menuItemArr[i].name);
                        $secondLevel.find('.menuItem').attr({'id':menuItemArr[i].id,'url':menuItemArr[i].url});
                        $secondLevel.find('i').addClass(menuItemArr[i].icon);
                        $secondLevel.find('.menuItem').append($(arrow));
                        for(var j=0;j<menuItemArr[i].items.length;j++){
                            if(menuItemArr[i].items[j].haschild){
                                $thirdLevel.find('.nav-label').text(menuItemArr[i].items[j].name);
                                $thirdLevel.find('.menuItem').attr({'id':menuItemArr[i].items[j].id,'url':menuItemArr[i].items[j].url});
                                $thirdLevel.find('.menuItem').append($(arrow));
                                for(var k=0;k<menuItemArr[i].items[j].items.length;k++){
                                    $menuItem.find('.nav-label').text(menuItemArr[i].items[j].items[k].name);
                                    $menuItem.find('.menuItem').attr({'id':menuItemArr[i].items[j].items[k].id,'url':menuItemArr[i].items[j].items[k].url});
                                    $thirdLevel.find('.nav-third-level').append($menuItem);
                                    $menuItem = $(menuItem);
                                }
                                $secondLevel.find('.nav-second-level').append($thirdLevel);
                                $thirdLevel = $(thirdLevel);
                            }else {
                                $menuItem.find('.nav-label').text(menuItemArr[i].items[j].name);
                                $menuItem.find('.menuItem').attr({'id':menuItemArr[i].items[j].id,'url':menuItemArr[i].items[j].url});
                                $secondLevel.find('.nav-second-level').append($menuItem);
                                $menuItem = $(menuItem);
                            }
                        }
                        $('#side-menu').append($secondLevel);
                        $secondLevel = $(secondLevel);
                    }else {
                        $menuItem.find('.nav-label').text(menuItemArr[i].name);
                        $menuItem.find('.menuItem').attr({'id':menuItemArr[i].id,'url':menuItemArr[i].url});
                        $menuItem.find('i').addClass(menuItemArr[i].icon);
                        $('#side-menu').append($menuItem);
                        $menuItem = $(menuItem);
                    }
                }

                // MetsiMenu
                $('#side-menu').metisMenu();

                //固定菜单栏
                $(function () {
                    $('.sidebar-collapse').slimScroll({
                        height: '100%',
                        railOpacity: 0.9,
                        alwaysVisible: false
                    });
                });

                // 菜单点击
                $(".menuItem").on('click',function(){
                    if($(this).find('.arrow').length == 0){
                        $(".menuItem").removeClass('active');
                        $(this).addClass('active');
                        if($(this).attr('url')!=undefined){
                            $('#divContent').load($(this).attr('url'));
                        }else {
                            var id = $(this).attr('id');
                            var datas;
                            $.each(processObj.processSteps, function () {
                                if(this.id == id){
                                    datas = JSON.stringify(this);
                                }
                            });
                            if(datas!=undefined){
                                $('#divContent').load( "module/activeDev/activeDev.html",function () {
                                    redrawActive(datas);
                                });
                            }
                        }

                        var breadcrumbsArr = [`<li class="active"><span>${$(this).find('.nav-label').text()}</span></li>`];
                        $(this).parents('.active').each(function () {
                            breadcrumbsArr.unshift(`<li><span>${$(this).children('a').children('.nav-label').html()}</span></li>`);
                        });
                        var breadcrumbsHtml = '';
                        for (var i = 0; i < breadcrumbsArr.length; i++) {
                            breadcrumbsHtml += breadcrumbsArr[i];
                        }
                        $('#breadcrumbs').html(breadcrumbsHtml);
                    }
                });
              
              	  $("#side-menu>li:nth-child(1)>a").addClass("active");
                  $('#divContent').load(menuItemArr[0].url);
                  $('#breadcrumbs').html(`<li class="active"><span>${menuItemArr[0].name}</span></li>`);
            }else {
                //跳转页面
            }

        }
    });
	
    function GetRequest() {
        var url = location.search; //获取url中"?"符后的字串
        var theRequest = new Object();
        if (url.indexOf("?") != -1) {
            var str = url.substr(1);
            var strs = str.split("&");
            for(var i = 0; i < strs.length; i ++) {
                theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
            }
        }
        return theRequest;
    }

    /**
     * 工序数组排序函数
     * @param key   要排序的key
     * @param desc  是否逆向排序
     * @returns {function(*, *): number}
     */
    function processSort(key, desc) {
        return function (a, b) {
            return desc ? ((parseInt(a[key]) < parseInt(b[key])) ? 1 : ((parseInt(a[key]) > parseInt(b[key])) ? -1 : 0)) : ((parseInt(a[key]) < parseInt(b[key])) ? -1 : ((parseInt(a[key]) > parseInt(b[key])) ? 1 : 0))  //杠杠的，注意括号就是！
        }
    }

    // 构建菜单
    var menuItemArr = [{
        "id": "menu1",
        "name": "首页",
        "haschild": false,
        "url": "module/home/home.html",
        "icon": "fa fa-home",
        "items": []
    }, {
        "id": "menu2",
        "name": "批次分析",
        "haschild": true,
        "icon": "fa fa-edit",
        "items": [{
            "id": "menu2-1",
            "name": "工序分析",
            "haschild": true,
            "items": []
        }]
    }];

    //选中menu后重画活动执行记录
    function redrawActive(datas) {
        //先清除画布
        $(".output-image .railroad-diagram").remove();
        $(".output-image").append(`
                <div class="sk-spinner sk-spinner-three-bounce">
					<div class="sk-bounce1"></div>
					<div class="sk-bounce2"></div>
					<div class="sk-bounce3"></div>
				</div>`);
        setTimeout(function () {
            $(".sk-spinner").remove();
            let data = JSON.parse(datas);
            if (data.childStep.length > 0) {
                activeFormat(data.childStep)
            }
            //更改标题
            $(".page-title h5").html(`<h4><embed src="img/shengchanjiagong.svg" class = "icon_shengchan"/>${data.name}</h4>活动执行记录`)
        }, 500)
    }

    /**
     * 根据某一位置进行分组 比如 1-1-2 ，如果给index 赋值2 那么就是根据第二个1进行分组
     * @param processObj
     * @param index
     * @returns {Array}
     */
    function formatArr(processObj, index) {
        var mapByStep = {}, stepArray = [];
        $.each(processObj, function () {
            if (!mapByStep[this.step.charAt(index)]) {
                mapByStep[this.step.charAt(index)] = [];
            }
            mapByStep[this.step.charAt(index)].push(this);
        });

        for (var key in mapByStep) {
            var tempObj = {};
            tempObj['step'] = key;
            tempObj['arr'] = mapByStep[key];
            stepArray.push(tempObj);
        }
        stepArray.sort(processSort('step'));
        return stepArray;
    }

    // 工序内部活动的排序
    function activeFormat(activesInProcess) {
        var stepArray = formatArr(activesInProcess, 0),
            currentWidth = 0, diagramArr = []; //length = 5

        $.each(stepArray, function () {
            var choiceArray1 = [], choiceArray2 = [];
            if (this.arr.length > 1) {
                var activeStepArray = formatArr(this.arr, 2);   //length = 3

                if (activeStepArray.length > 1) {
                    $.each(activeStepArray, function () {
                        var choiceArray3 = [];
                        var activeInnerStepArray = formatArr(this.arr, 4);   //length = 2
                        $.each(activeInnerStepArray, function () {
                            var innerArr3 = [];
                            $.each(this.arr, function () {
                                innerArr3.push(new Terminal(this.name, {
                                    'href': 'javascript:void(0)',
                                    'data': JSON.stringify(this, ['id', 'name', 'status', 'step', 'processType']),
                                    'title': JSON.stringify(this, ['id', 'name', 'status', 'step'])
                                }))
                            })
                            choiceArray3.push(new Choice(Math.floor(innerArr3.length / 2), innerArr3))
                        })
                        choiceArray2.push(new Sequence(choiceArray3))
                    })
                } else {
                    choiceArray2.push(new Terminal(this.arr[0].name, {
                        'href': 'javascript:void(0)',
                        'data': JSON.stringify(this.arr[0], ['id', 'name', 'status', 'step', 'processType']),
                        'title': JSON.stringify(this.arr[0], ['id', 'name', 'status', 'step'])
                    }))
                }
                choiceArray1.push(new Choice(Math.floor(choiceArray2.length / 2), choiceArray2));
            } else {
                choiceArray1.push(new Terminal(this.arr[0].name, {
                    'href': 'javascript:void(0)',
                    'data': JSON.stringify(this.arr[0], ['id', 'name', 'status', 'step', 'processType']),
                    'title': JSON.stringify(this.arr[0], ['id', 'name', 'status', 'step'])
                }))
            }
            diagramArr.push(choiceArray1)
        });
        var tempArr = generateArr(diagramArr, currentWidth);

        ActiveDiagram(new Stack(tempArr)).addTo($(".output-image")[0]);
        //给按钮增加点击事件
        $(".terminal").on("click", function () {
            let data = JSON.parse($(this).find("a").attr("data"));
            if (data.processType == "activeType/activeType2" || data.processType == "activeType/activeType3") {     //投配料
                if ($(".widget-name").attr("type") == "putIn") {
                    if (data.id != $(".widget-name").attr("data-id")) {
                        //重新加载表格内容
                        gdTable.ajax.url("/WOM/produceTask/produceTask/getBatchingRecordByActive.action?activeId=" + data.id).load();
                        $(".widget-name").attr({"data-id":data.id});
                    }
                } else {
                    $('.widget-name').removeClass("bounceInLeft").removeClass("animated");
                    $(".widget-name").html(`<embed src="img/zuoyequ.svg" class="icon_shengchan">投料明细`).attr({"type":"putIn","data-id":data.id}).addClass("bounceInLeft").addClass('animated');
                    $(".table-overflow").html("");
                    initPutInTable(data.id);
                }
            } else if (data.processType == "activeType/activeType5") {   //质检
                if ($(".widget-name").attr("type") == "inspect") {
                    if (data.id != $(".widget-name").attr("data-id")) {
                        //重新加载表格内容
                        gdTable.ajax.url("/WOM/produceTask/produceTask/getInspectDetails.action?activeId="+data.id + "&activeType=active").load();
                        $(".widget-name").attr({"data-id":data.id});
                    }
                } else {
                    $('.widget-name').removeClass("bounceInLeft").removeClass("animated");
                    $(".widget-name").html(`<embed src="img/lailiaopinzhijianyan.svg" class="icon_shengchan">质检明细`).attr({"type": "inspect","data-id":data.id}).addClass("bounceInLeft").addClass('animated');
                    $(".table-overflow").html("");
                    initInspectTable(data.id);
                }

            } else { //产出
                if ($(".widget-name").attr("type") == "putOut") {
                    if (data.id != $(".widget-name").attr("data-id")) {
                        //重新加载表格内容
                        gdTable.ajax.url("/WOM/taskReporting/taskReporting/getProduceOutByTaskOrActive.action?activeId="+data.id+"&taskReportingType=1").load();
                        $(".widget-name").attr({"data-id":data.id});
                    }
                } else {
                    $('.widget-name').removeClass("bounceInLeft").removeClass("animated");
                    $(".widget-name").html(`<embed src="img/huowudui.svg" class="icon_shengchan">产出明细`).attr({"type": "putOut","data-id":data.id}).addClass("bounceInLeft").addClass('animated');
                    $(".table-overflow").html("");
                    initOutputTable(data.id);
                }
            }
        })
    }
	var gdTable;
    function initInspectTable(activeId) {
        $(".table-overflow").append(`
            <table id="gdInspectTable" class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <th>业务类型</th>
                        <th>请检部门</th>
                        <th>请检人</th>
                        <th>请检时间</th>
                        <th>采样点</th>
                        <th>物品编码</th>
                        <th>物品名称</th>
                        <th>生产批号</th>
						<th>请检批号</th>
                        <th>数量</th>
                        <th>计量单位</th>
                        <th>备注</th>
                    </tr>
                </thead>
            </table>
        `);

        gdTable = $('#gdInspectTable').DataTable({
            ajax : {
                type : "GET",
                url : "/WOM/produceTask/produceTask/getInspectDetails.action?activeId="+activeId + "&activeType=active",
                // url : "../ajax/data/objects.txt",
                cache : false,
                dataSrc : "inspects"
            },
            // ajax: "ajax/data/inspect.txt",
            pageLength: 3,
            info: false,
            ordering: true,
            retrieve: true,
            processing: true,
            autoWidth: true,
           // serverSide : true,
            searching: true,
            lengthChange: false,
            paging: true,
            columns: [
                {"data": "QM_BUSINESS_TYPE"},
                {"data": "DEPARTMENT_NAME"},
                {"data": "STAFF_NAME"},
                {"data": "INSPECT_DATE"},
                {"data": "SITE_NAME"},
                {"data": "PRODUCT_CODE"},
                {"data": "PRODUCT_NAME"},
                {"data": "BATCH_NUM"},
                {"data": "PART_CODE"},
                {"data": "QUANTITY"},
                {"data": "PRODUCT_UNIT"},
                {"data": "REMARK"}
            ],
            order: [[3, 'asc']],
            columnDefs: [{
                targets: 0,
                render: function (data, type, row, meta) {
                    if (data == "QMbusiTypeManu/process") {
                        return `<span class="inspectButtonHtml">过程检验</span>`;
                    }else if( data == "QMbusiTypeManu/manu" ){
                        return `<span class="inspectButtonHtml">产品检验</span>`;
                    }

                }
            }]
        });
        // Add event listener for opening and closing details
        $('#gdTable tbody').on('click', 'td.details-control', function () {
            var tr = $(this).closest('tr');
            var row = gdTable.row(tr);

            if (row.child.isShown()) {
                // This row is already open - close it
                row.child.hide();
                tr.removeClass('shown');
            }
            else {
                // Open this row
                row.child(format(row.data())).show();
                tr.addClass('shown');
            }
        });
    }

    function initPutInTable(activeId) {
        $(".table-overflow").append(`
            <table id="gdTable" class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <th>物品编码</th>
                    <th>物品名称</th>
                    <th>仓库编码</th>
                    <th>仓库名称</th>
                    <th>货位编码</th>
                    <th>货位名称</th>
                    <th>批号</th>
                    <th>实际投入量</th>
                    <th>实际投入时间</th>
                    <th>操作人员</th>
                    <th>备注</th>
                </tr>
                </thead>
            </table>
        `)

        gdTable = $('#gdTable').DataTable( {
            ajax : {
                type : "GET",
                url : "/WOM/produceTask/produceTask/getBatchingRecordByActive.action?activeId=" + activeId,
                // url : "../ajax/data/objects.txt",
                cache : false,
                dataSrc : "chargeDetails"
            },
            // ajax : "ajax/data/objects.txt",
            pageLength : 3,
            info : false,
            ordering: true,
            retrieve :  true,
            processing : true,
            autoWidth: true,
           // serverSide : true,
            searching: true,
            lengthChange : false,
            paging : true,
            columns: [
                {"data": "good.productCode" , "searchable":true},
                {"data": "good.productName"},
                {"data": "wareID.wareCode"},
                {"data": "wareID.wareName"},
                {"data": "placeSet.placeSetCode"},
                {"data": "placeSet.placeSetName"},
                {"data": "batch"},
                { "data": "actualUseNum"},
                { "data": "putinDate" },
                { "data": "putinStaff.name" },
                { "data": "remark" }
            ],
            "order": [[7, 'asc']],
            columnDefs : [
                {
                    targets:0,
                    render : function (data, type, row, meta) {

                        return '<td class="text-l"><a style="cursor:pointer" class="text-primary"' +
                            'onClick="openPageByGoodId(\'物品基础信息\', \'/MESBasic/product/product/prodEditnew.action?entityCode=MESBasic_1_product&buttonCode=MESBasic_1_product_productPart_BUTTON_modify&namespace=list_operate_product_productPart&__pc__=TUVTQmFzaWNfMV9wcm9kdWN0X3Byb2R1Y3RMYXlvdXRfcHJvZHVjdFBhcnRfbW9kaWZ5X21vZGlmeV9NRVNCYXNpY18xX3Byb2R1Y3RfcHJvZHVjdFBhcnR8&id=' + row.good.id + '\')" title="查看">' + data + '</a></td>';
                    }
                },
                {
                    targets:1,
                    render : function (data, type, row, meta) {
                        return '<td class="text-l"><a style="cursor:pointer" class="text-primary"' +
                            'onClick="openPageByGoodId(\'物品基础信息\', \'/MESBasic/product/product/prodEditnew.action?entityCode=MESBasic_1_product&buttonCode=MESBasic_1_product_productPart_BUTTON_modify&namespace=list_operate_product_productPart&__pc__=TUVTQmFzaWNfMV9wcm9kdWN0X3Byb2R1Y3RMYXlvdXRfcHJvZHVjdFBhcnRfbW9kaWZ5X21vZGlmeV9NRVNCYXNpY18xX3Byb2R1Y3RfcHJvZHVjdFBhcnR8&id=' + row.good.id + '\')" title="查看">' + data + '</a></td>';
                    }
                },
                {
                    targets:6,
                    render : function (data, type, row, meta) {
                        return '<td class="text-l"><a style="cursor:pointer" class="text-primary"' +
                            'onClick="openPage(\'批次 【' + data + '】 详情分析\', \'mainPage.html?batch=' + data + '\')" title="查看">' + data + '</a></td>';
                    }
                },
                {
                    targets:8,
                    render : function (data, type, row, meta) {
                        return new Date(data).toLocaleString().replace(/:\d{1,2}$/,' ');
                    }
                },

            ]
        } );
        // Add event listener for opening and closing details
        $('#gdTable tbody').on('click', 'td.details-control', function () {
            var tr = $(this).closest('tr');
            var row = gdTable.row( tr );

            if ( row.child.isShown() ) {
                // This row is already open - close it
                row.child.hide();
                tr.removeClass('shown');
            }
            else {
                // Open this row
                row.child( format(row.data()) ).show();
                tr.addClass('shown');
            }
        } );
    }

    function initOutputTable(activeId) {
        $(".table-overflow").append(`
            <table id="gdOutputTable" class="table table-striped table-bordered table-hover">
							<thead>
							<tr>
								<th></th>
								<th>物品编码</th>
								<th>物品名称</th>
								<th>仓库编码</th>
								<th>仓库名称</th>
								<th>仓库状态</th>
								<!--<th>备注</th>-->
							</tr>
							</thead>
						</table>
        `)
        gdTable = $('#gdOutputTable').DataTable({
            ajax : {
                type : "GET",
                url : "/WOM/taskReporting/taskReporting/getProduceOutByTaskOrActive.action?activeId="+activeId+"&taskReportingType=1",
                // url : "../ajax/data/objects.txt",
                cache : false,
                dataSrc : "produceRecords"
            },
            // ajax: "ajax/data/chanchu.txt",
            pageLength: 3,
            info: false,
            ordering: false,
            retrieve: true,
            processing: true,
            autoWidth: true,
           // serverSide : true,
            searching: true,
            lengthChange: false,
            paging: true,
            columns: [
                {"class": 'details-control', "orderable": false, "data": null, "defaultContent": ''},
                {"data": "productID.productCode", "searchable": true},
                {"data": "productID.productName"},
                {"data": "wareID.wareCode"},
                {"data": "wareID.wareName"},
                {"data": "wareID.cargoStatue.id"}
            ],
            columnDefs: [{
                targets: 5,
                render: function (data, type, row, meta) {
                    let buttonHtml;
                    if (data == "storageState/storageState1") {
                        buttonHtml = "启用";
                    } else {
                        buttonHtml = "不启用";
                    }
                    return `<span class="buttonHtml">${buttonHtml}</span>`;
                }
            }]
        });

        // Add event listener for opening and closing details
        $('#gdOutputTable tbody').on('click', 'td.details-control', function () {
            var tr = $(this).closest('tr');
            var row = gdTable.row(tr);

            if (row.child.isShown()) {
                // This row is already open - close it
                row.child.hide();
                tr.removeClass('shown');
            }
            else {
                // Open this row
                row.child(formatOutPutData(row.data())).show();
                tr.addClass('shown');
            }
        });
    }

    function formatOutPutData(data) {
        let bodyStr = "";
        $.each(data.taskReportingPartList, function () {
            bodyStr += `
                        <tr>
                            <td>${this.storeID.placeSetCode}</td>
                            <td>${this.storeID.placeSetName}</td>
                            <td>${this.batchNum}</td>
                            <td>${this.reportNum}</td>
                            <td>${data.productID.productSpecif || ""}</td>
                            <td>${new Date(this.reportDate).toLocaleString().replace(/:\d{1,2}$/, ' ')}</td>
                            <td>${this.reportStaff.name || ""}</td>
                            <td>${this.remark || ""}</td>
                       </tr>
                        `;
        })
        return `
            <table class = "outPutDetails">
							<thead>
							<tr>
								<th>货位编码</th>
								<th>货位名称</th>
								<th>批号</th>
								<th>实际数量</th>
								<th>规格</th>
								<th>报工日期</th>
								<th>报工人</th>
								<th>备注</th>
							</tr>
							</thead>
							<tbody>
							    ${bodyStr}
                            </tbody>
						</table>
        `;
    }

    function generateArr(diagramArr, currentWidth) {
        var tempArr = [];
        var currentIndex = 0;
        var tempMap = [];
        $.each(diagramArr, function (index, item) {
            //求出当前最大的宽
            currentWidth += item[0].width;
            if (currentWidth > $(".actions-wrapper")[0].clientWidth) {
                var tempSeq = [];
                currentIndex = index;
                currentWidth = item[0].width;
                for (var i = 0; i < tempMap.length; i++) {
                    tempSeq.push(tempMap[i]);
                }
                tempArr.push(new Sequence(tempSeq))
                tempMap = [];
            }
            tempMap.push(item[0])

        })
        var tempSeq = [];
        for (var i = 0; i < tempMap.length; i++) {
            tempSeq.push(tempMap[i]);
        }
        tempArr.push(new Sequence(tempSeq))
        return tempArr;
    }

   
})(jQuery);