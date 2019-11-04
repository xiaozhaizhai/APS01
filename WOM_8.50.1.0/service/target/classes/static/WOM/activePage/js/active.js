"use strict";
(function ($) {
    var processObj = {"processSteps": [
            {
                "activeHeaderId": null,
                "childStep": [
                    {
                        "activeHeaderId": 1139,
                        "childStep": null,
                        "id": 1391,
                        "name": "管道投料1:甲醛",
                        "parentId": 1390,
                        "processStep": "1",
                        "processType": "activeType/activeType2",
                        "status": "step-done",
                        "step": "1-1-1"
                    },
                    {
                        "activeHeaderId": 1139,
                        "childStep": null,
                        "id": 1392,
                        "name": "管道投料1:纯碱",
                        "parentId": 1390,
                        "processStep": "1",
                        "processType": "activeType/activeType2",
                        "status": "step-done",
                        "step": "1-1-1"
                    },
                    {
                        "activeHeaderId": 1139,
                        "childStep": null,
                        "id": 1393,
                        "name": "管道投料1:百草枯",
                        "parentId": 1390,
                        "processStep": "1",
                        "processType": "activeType/activeType2",
                        "status": "step-doing",
                        "step": "1-1-2"
                    },
                    {
                        "activeHeaderId": 1139,
                        "childStep": null,
                        "id": 1394,
                        "name": "管道投料1:湿海藻酸",
                        "parentId": 1390,
                        "processStep": "1",
                        "processType": "activeType/activeType2",
                        "status": "step-undone",
                        "step": "1-1-2"
                    },
                    {
                        "activeHeaderId": 1139,
                        "childStep": null,
                        "id": 1396,
                        "name": "手工投料1:甲醛",
                        "parentId": 1395,
                        "processStep": "1",
                        "processType": "activeType/activeType2",
                        "status": "step-doing",
                        "step": "1-2-1"
                    },
                    {
                        "activeHeaderId": 1139,
                        "childStep": null,
                        "id": 1396,
                        "name": "手工投料1:甲醛1",
                        "parentId": 1395,
                        "processStep": "1",
                        "processType": "activeType/activeType2",
                        "status": "step-doing",
                        "step": "1-2-1"
                    },
                    {
                        "activeHeaderId": 1139,
                        "childStep": null,
                        "id": 1397,
                        "name": "投料1",
                        "parentId": null,
                        "processStep": "1",
                        "processType": "activeType/activeType3",
                        "status": "step-done",
                        "step": "1-3-1"
                    },
                    {
                        "activeHeaderId": 1139,
                        "childStep": null,
                        "id": 1399,
                        "name": "管道投料2:甲醛",
                        "parentId": 1398,
                        "processStep": "1",
                        "processType": "activeType/activeType2",
                        "status": "step-undone",
                        "step": "2-1-1"
                    },
                    {
                        "activeHeaderId": 1139,
                        "childStep": null,
                        "id": 1400,
                        "name": "管道投料2:百草枯",
                        "parentId": 1398,
                        "processStep": "1",
                        "processType": "activeType/activeType2",
                        "status": "step-undone",
                        "step": "2-1-2"
                    },
                    {
                        "activeHeaderId": 1139,
                        "childStep": null,
                        "id": 1402,
                        "name": "手工投料2:纯碱",
                        "parentId": 1401,
                        "processStep": "1",
                        "processType": "activeType/activeType2",
                        "status": "step-undone",
                        "step": "2-2-1"
                    },
                    {
                        "activeHeaderId": 1139,
                        "childStep": null,
                        "id": 1404,
                        "name": "手工投料3:湿海藻酸",
                        "parentId": 1403,
                        "processStep": "1",
                        "processType": "activeType/activeType2",
                        "status": "step-undone",
                        "step": "2-3-1"
                    },
                    {
                        "activeHeaderId": 1139,
                        "childStep": null,
                        "id": 1405,
                        "name": "高温浸泡",
                        "parentId": null,
                        "processStep": "1",
                        "processType": "activeType/activeType1",
                        "status": "step-undone",
                        "step": "3-1-1"
                    },
                    {
                        "activeHeaderId": 1139,
                        "childStep": null,
                        "id": 1405,
                        "name": "高温灼烧",
                        "parentId": null,
                        "processStep": "1",
                        "processType": "activeType/activeType1",
                        "status": "step-undone",
                        "step": "3-2-1"
                    },
                    {
                        "activeHeaderId": 1139,
                        "childStep": null,
                        "id": 1405,
                        "name": "高温灼烧",
                        "parentId": null,
                        "processStep": "1",
                        "processType": "activeType/activeType1",
                        "status": "step-undone",
                        "step": "3-2-1"
                    },
                    {
                        "activeHeaderId": 1139,
                        "childStep": null,
                        "id": 1405,
                        "name": "高温灼烧",
                        "parentId": null,
                        "processStep": "1",
                        "processType": "activeType/activeType1",
                        "status": "step-undone",
                        "step": "3-2-2"
                    },
                    {
                        "activeHeaderId": 1139,
                        "childStep": null,
                        "id": 1406,
                        "name": "保温",
                        "parentId": null,
                        "processStep": "1",
                        "processType": "activeType/activeType1",
                        "status": "step-undone",
                        "step": "4"
                    },
                    {
                        "activeHeaderId": 1139,
                        "childStep": null,
                        "id": 1407,
                        "name": "百草枯检验",
                        "parentId": null,
                        "processStep": "1",
                        "processType": "activeType/activeType5",
                        "status": "step-undone",
                        "step": "5"
                    }
                ],
                "id": 1139,
                "name": "烷基化反应",
                "processStep": null,
                "processType": null,
                "status": "step-doing",
                "step": "1"
            },
            {
                "activeHeaderId": null,
                "childStep": [
                    {
                        "activeHeaderId": 1139,
                        "childStep": null,
                        "id": 1406,
                        "name": "保温 step > 1-1-1",
                        "parentId": null,
                        "processStep": "1",
                        "processType": "activeType/activeType1",
                        "status": "step-undone",
                        "step": "1-1-1"
                    },
                    {
                        "activeHeaderId": 1139,
                        "childStep": null,
                        "id": 1407,
                        "name": "百草枯检验step1-1-2",
                        "parentId": null,
                        "processStep": "1-1-2",
                        "processType": "activeType/activeType5",
                        "status": "step-undone",
                        "step": "1-1-2"
                    }
                ],
                "id": 1140,
                "name": "三塔精馏",
                "processStep": null,
                "processType": null,
                "status": "step-undone",
                "step": "3"
            },
            {
                "activeHeaderId": null,
                "childStep": [],
                "id": 1140,
                "name": "二塔精馏1",
                "processStep": null,
                "processType": null,
                "status": "step-undone",
                "step": "2"
            },
            {
                "activeHeaderId": null,
                "childStep": [],
                "id": 1140,
                "name": "二塔精馏2",
                "processStep": null,
                "processType": null,
                "status": "step-undone",
                "step": "2"
            },
            {
                "activeHeaderId": null,
                "childStep": [],
                "id": 1140,
                "name": "二塔精馏3",
                "processStep": null,
                "processType": null,
                "status": "step-undone",
                "step": "2"
            },
            {
                "activeHeaderId": null,
                "childStep": [],
                "id": 1141,
                "name": "深解析塔",
                "processStep": null,
                "processType": null,
                "status": "step-undone",
                "step": "1"
            },
            {
                "activeHeaderId": null,
                "childStep": [],
                "id": 1142,
                "name": "缩聚反应",
                "processStep": null,
                "processType": null,
                "status": "step-undone",
                "step": "4"
            },
            {
                "activeHeaderId": null,
                "childStep": [],
                "id": 1142,
                "name": "缩聚反应new",
                "processStep": null,
                "processType": null,
                "status": "step-undone",
                "step": "4"
            },
            {
                "activeHeaderId": null,
                "childStep": [],
                "id": 1142,
                "name": "化学反应new1",
                "processStep": null,
                "processType": null,
                "status": "step-undone",
                "step": "5"
            },
            {
                "activeHeaderId": null,
                "childStep": [],
                "id": 1142,
                "name": "化学反应new2",
                "processStep": null,
                "processType": null,
                "status": "step-undone",
                "step": "5"
            }
        ]};

    /**
     * 工序数组排序函数
     * @param key   要排序的key
     * @param desc  是否逆向排序
     * @returns {function(*, *): number}
     */
    function processSort(key,desc) {
        return function(a,b){
            return desc ? ((parseInt(a[key]) < parseInt(b[key]))?1:((parseInt(a[key]) > parseInt(b[key]))?-1:0)):((parseInt(a[key]) < parseInt(b[key]))?-1:((parseInt(a[key]) > parseInt(b[key]))?1:0))  //杠杠的，注意括号就是！
        }
    }

    /**
     * 根据某一位置进行分组 比如 1-1-2 ，如果给index 赋值2 那么就是根据第二个1进行分组
     * @param processObj
     * @param index
     * @returns {Array}
     */
    function formatArr(processObj,index) {
        var mapByStep = {}, stepArray = [];
        $.each(processObj, function () {
            if (!mapByStep[this.step.charAt(index)]) {
                mapByStep[this.step.charAt(index)] = [];
            }
            mapByStep[this.step.charAt(index)].push(this);
        })

        for (var key in mapByStep) {
            var tempObj = {}
            tempObj['step'] = key
            tempObj['arr'] = mapByStep[key]
            stepArray.push(tempObj)
        }
        stepArray.sort(processSort('step'))
        return stepArray;
    }

    //框框之间的间距
    const INTERVAL_X = 20,
        WINDOW_W = $(".activeMenu").width(),//浏览器窗口可见宽度
        WINDOW_H = 2000, //浏览器窗口可见高度
        RECT_W = WINDOW_W / 3,//矩形的宽
        RECT_H = 26,//矩形的高
        INTERVAL_Y = 50,
        INNERBOX = RECT_H + 20,
        RECT_R = RECT_W / 15,//矩形圆角
        RECT_MID = WINDOW_W / 2,//框的中心点
        BOXTOOUTBOX_UP = 40,//方框距离外边框的外边距（上方）
        BOXTOOUTBOX_DOWN = 0,//方框距离外边框的外边距（下方）
        BOXTOOUTBOX_LEFT = 30,//方框距离外边框的外边距（左方）
        BOXTOOUTBOX_RIGHT = 30,//方框距离外边框的外边距（右方）
        BOXTOLINE = 30//方框距离中间竖线的距离

    ;

    $('h1').fontFlex(10, 120, 40);//字体大小自适应
    console.log(Raphael.svg);//查看是否支持Raphael,true为支持

    Raphael.fn.arrow = function(path,attr){
        return this.path(path).attr(attr);
    }
    //创建一个画布
    var paper = new Raphael("paper",WINDOW_W,WINDOW_H);
    var activePaper = new Raphael("activePaper",WINDOW_W,WINDOW_H);
    var attr = {
        fill: "#70AD47",//填充
        stroke: "none",//边框
        "stroke-width": 1,
        "stroke-linejoin": "round"
    },attr1 = {
        fill: "#8492a6",//填充
        stroke: "none",//边框
        "stroke-width": 1,
        "stroke-linejoin": "round"
    };
    //给大工序排序
    processObj.processSteps.sort(processSort("step",false))

    //连线
    function lineBox(root,box1,box2){
        var x1 = Math.round($(box1.node).attr("x"));
        var y1 = Math.round($(box1.node).attr("y"));
        var w = Math.round($(box1.node).attr("width"));
        var h = Math.round($(box1.node).attr("height"));
        var x2,w2,y2;
        if (box2) {
            x2  = Math.round($(box2.node).attr("x"));
            w2 = Math.round($(box2.node).attr("width"));
            y2 = Math.round($(box2.node).attr("y"));
        }

        //连线的起点画圆圈
        root.circle(x1 + w * 0.5,
            y1 + h, 3)
            .attr({fill: "#485667"})
        //连线
        var line = "m" + (x1 + w * 0.5) + "," + (y1 + h) + "L" + (x2 + w2 * 0.5) + "," + y2;
        root.path(line).attr({
            "stroke-width" : 2,
            "stroke":"#485667",
            "arrow-end" : "classic-wide-long"
        })
    }



    //给矩形增加居中的文字
    function insertRectText(root,rectangle,str,data){
        var x = Math.round($(rectangle.node).attr("x"));
        var y = Math.round($(rectangle.node).attr("y"));
        var w = $(rectangle.node).attr("width");
        var h = $(rectangle.node).attr("height");
        var textStr = root.text(x + w / 2,y + h / 2,str).attr({fill:"#FFFFFF"});
        textStr.attr({
            "fill":"#FFFFFF",
            "font-size":"15px",
        });
        rectangle.data("data", data).click(function () {
            console.log(this.data("data"))
        }).click(function () {
            let d = this.data("data");
            if (d== undefined || d.childStep == undefined) return false;
            $('#paper').slideUp().fadeOut(300,function () {
                //清除画布
                activePaper.clear();
                stepArr = [];
                currentCord = {};
                //重新画图
                $.each(formatArr(d.childStep,0),function (index,arr) {
                    drawActive(activePaper,arr)
                })
                $.each(stepArr,function (index,element) {
                    if (index < stepArr.length - 1)
                        lineBox(activePaper,stepArr[index],stepArr[index + 1])
                })
                $("#activePaper").fadeIn(300);
            });
        });
        return textStr;
    }

    function drawRectToRect(root,set){
        let newSet = set.filter(function (element) {
            return element.type == "rect";
        })
        var x1 = newSet[0].attrs.x;
        var y1 = newSet[0].attrs.y;

        var x2 = x1 + BOXTOOUTBOX_LEFT + RECT_W + BOXTOLINE;
        var y2 = newSet[newSet.length - 1].attrs.y;
        var w2 = RECT_W;
        var h2 = RECT_H;
        x2 += w2;
        y2 += h2;
        return drawRect(root,x1,y1,x2,y2);
    }
    //在一个矩形外画矩形,传入左上角和右下角的位置
    function drawRect(root,x1,y1,x2,y2){
        var x = x1 - BOXTOOUTBOX_LEFT;
        var y = y1 - BOXTOOUTBOX_UP;
        var w = x2 - x1 + 2*BOXTOOUTBOX_RIGHT;
        var h = y2 - y1 + BOXTOOUTBOX_DOWN + BOXTOOUTBOX_UP + RECT_H;
        var rectbox = root.rect(x,y,w,h).attr({
            stroke: "#F4B183",
            fill : "rgba(0, 0, 0, 0)",
            "stroke-width": 1,
            "stroke-dasharray" : "--..",

        });
        currentCord["y"] = rectbox.attrs.y + h + INTERVAL_Y;
        stepArr.push(rectbox)
        return rectbox;
    }
    var currentCord = {},stepArr = [],activeStepArr = [];
    function drawActive(root,processArr){
        let x = RECT_MID - RECT_W / 2,
            y = currentCord.y == undefined ? RECT_H + INTERVAL_Y : currentCord.y + INTERVAL_Y,rect;
        //给分组过的工序进行画框
        if (processArr.arr.length > 1) {
            root.setStart();
            let n = 0;
            $.each(processArr.arr,function (index1,element1) {
                let r ;
                if (index1 % 2 == 0) {
                    r = root.rect(RECT_MID - BOXTOLINE - RECT_W,y + n * INNERBOX,RECT_W,RECT_H,RECT_R).attr(attr1);
                    insertRectText(root,r,element1.name,element1);
                    //先画一条 竖线分离开
                    root.path("M"+(RECT_MID) + "," + (y + n * INNERBOX) + "v" + (RECT_H)).attr({
                        "fill":"none",
                        "stroke":"#485667",
                        "stroke-width":2,
                    })
                    n++;
                }else {
                    r =root.rect(RECT_MID + BOXTOLINE ,y + (n - 1) * INNERBOX,RECT_W,RECT_H,RECT_R).attr(attr1)
                    insertRectText(root,r,element1.name,element1);
                }

            })
            let set = root.setFinish();
            drawRectToRect(root,set.items)
            $.each(set.items,function () {
                let rectTmp = this.clone();
                rectTmp.data("data",this.data("data"))
                rectTmp.data("data")
                rectTmp.click(function () {
                    let d = this.data("data");
                    if (d== undefined || d.childStep == undefined) return false;
                    $('#paper').slideUp().fadeOut(300,function () {
                        //清除画布
                        activePaper.clear();
                        stepArr = [];
                        currentCord = {};
                        //重新画图
                        $.each(formatArr(d.childStep,0),function (index,arr) {
                            drawActive(activePaper,arr)
                        })
                        $.each(stepArr,function (index,element) {
                            if (index < stepArr.length - 1)
                                lineBox(activePaper,stepArr[index],stepArr[index + 1])
                        })
                        $("#activePaper").fadeIn(300);
                    });
                });
                this.remove();
            })
        }else {
            rect = root.rect(x,y - INTERVAL_Y,RECT_W,RECT_H,RECT_R).attr(attr1);
            insertRectText(root,rect,processArr.arr[0].name,processArr.arr[0]);
            stepArr.push(rect)
            currentCord["y"] = y;
        }
    }

    function closeActive() {
        $('#activePaper').slideDown().fadeOut(300,function () {
            $("#paper").fadeIn(300);
        });
    }

    $(".closeActive").click(function () {
        closeActive();
    })

    function drawIntoIcon(){

    }

    $.each(formatArr(processObj.processSteps,0),function (index,arr) {
        drawActive(paper,arr)
    })

    $.each(stepArr,function (index,element) {
        if (index < stepArr.length - 1)
            lineBox(paper,stepArr[index],stepArr[index + 1])
    })
})(jQuery);