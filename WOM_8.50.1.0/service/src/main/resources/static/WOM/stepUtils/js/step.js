var endActive = new Function();
var startActive = new Function();
var activeDetailEdit = new Function();
var activeDetailView = new Function();
(function ($) {
    $.fn.extend({
        _f1: function () {
            $('.activeStep .step>span').hover(function (e) {
                $(this).find('.actionBtn').css({'width': $(this).width(), 'background': $(this).css('background')});
                $(this).find('.actionBtn').fadeIn();
                e.stopPropagation();
            }, function (e) {
                $('.actionBtn').fadeOut();
                e.stopPropagation();
            });
        },
        //初始化
        loadStep: function (params) {
            /*
              params.steps       所有工序JSON数组[]，steps[i]的值以字符串形式设置为该工序元素的自定义属性'data',
                     steps[i].step      必填，工序顺序(String,如'2','3-1')
                     steps[i].name      必填，工序名称(String)
                     steps[i].status    工序状态(已完成或正在进行:'step-done',未进行:'step-undone',正在进行:'step-doing',默认未进行)
                     steps[i].childStep 子活动数组
              params.activeStep  设置默认选中工序
              params.nowStep     若设置，steps.status将失效，进行到指定工序(数组[],若填'3-2','3-2''step-doing',第3工序前的工序'step-done',若填多个则必须是同一大工序中的工序)
              params.callback    返回默认选中的工序以及当前正在执行的工序( function (activeStepObj, nowStepArr) {console.log(activeStepObj, nowStepArr);})
            */

            // 基础框架
            var baseHtml = "<div><ul class='main-process' style='height: 210px;'></ul></div>";

            // 普通工序框架
            var stepHtml = "<li class='step step-undone'>" +
                "<span style='height: 15px;display: inline-block;'></span>" +
                "<p class='bar'><span class='arrow'></span></p><span class='spot'>" +
                "<span class='title'></span>" +
                "<span class='actionBtn'></span>" +
                "</span></li>";
            var startAction = "<a class='startAction '>开始</a>";
            var endAction = "<a class='endAction'>结束</a>";
            var workDetailEdit = "<a class='workDetailEdit'>报工</a>";
            var workDetailView = "<a class='workDetailView'>报工查看</a>";
            // 大工序框架
            var bigStepHtml = "<li class='big-step'><ul></ul></li>";
            // 含有混合框架的大工序框架
            var hasMixBigStepHtml = "<li class='big-step'><ul></ul></li>";
            // 混合工序框架
            var mixStepHtml = "<li class='mix-step big-step'><ul></ul></li>";

            //支持填充多个工序容器
            $(this).each(function (i, n) {
                var $baseHtml = $(baseHtml),
                    $stepHtml = $(stepHtml),
                    $containerSteps = $baseHtml.find(".main-process"),
                    $bigStepHtml = $(bigStepHtml),
                    $hasMixBigStepHtml = $(hasMixBigStepHtml),
                    $mixStepHtml = $(mixStepHtml),
                    $n = $(n),
                    max = 0,
                    i = 0;
                // 工序
                var arr = params.steps;
                // 工序分组排序
                var map = {},
                    dest = [];
                for (i = 0; i < arr.length; i++) {
                    var ai = arr[i];

                    // 进行到指定工序
                    if (params.nowStep) {
                        ai.status = 'step-undone';
                        for (var n = 0; n < params.nowStep.length; n++) {
                            if (ai.step == params.nowStep[n]) {
                                ai.status = 'step-doing';
                            } else if (ai.step.split('-')[0] - params.nowStep[n].split('-')[0] < 0) {
                                ai.status = 'step-done';
                            }
                        }
                    }

                    // 设置默认选中工序
                    if (params.activeStep && ai.step == params.activeStep) {
                        if (ai.status != undefined) {
                            ai.status = ai.status + ' active';
                        } else {
                            ai.status = 'step-undone active';
                        }
                    }

                    // 分组排序
                    if (!map[ai.step.split('-')[0]]) {
                        var obj = {step: ai.step.split('-')[0], data: [ai]};
                        if (ai.step.split('-')[2] != undefined) {
                            obj.hasMixstep = true
                        }
                        dest.push(obj);
                        map[ai.step.split('-')[0]] = ai;
                    } else {
                        for (var j = 0; j < dest.length; j++) {
                            var dj = dest[j];
                            if (dj.step == ai.step.split('-')[0]) {
                                dj.data.push(ai);
                                break;
                            }
                        }
                    }
                }

                dest.sort(function (x, y) {
                    return (x['step'] - y['step'])
                });

                for (var i = 0; i < dest.length; i++) {
                    if (dest[i].hasMixstep) {
                        if (!$containerSteps.hasClass('has-big-step')) {
                            $containerSteps.addClass('has-big-step');
                        }
                        var map1 = {},
                            dest1 = [];
                        for (var d1 = 0; d1 < dest[i].data.length; d1++) {
                            var num0 = dest[i].data[d1].step.split('-')[0];
                            var num1 = dest[i].data[d1].step.split('-')[1];
                            if (!map1[num0 + '-' + num1]) {
                                dest1.push({
                                    step: num0 + '-' + num1,
                                    data: [dest[i].data[d1]]
                                });
                                map1[num0 + '-' + num1] = dest[i].data[d1];
                            } else {
                                for (var j1 = 0; j1 < dest1.length; j1++) {
                                    if (dest1[j1].step == num0 + '-' + num1) {
                                        dest1[j1].data.push(dest[i].data[d1]);
                                        break;
                                    }
                                }
                            }
                        }

                        for (var i1 = 0; i1 < dest1.length; i1++) {
                            if (dest1[i1].data.length == 1) {
                                if (dest1[i1].data[0].status) {
                                    $stepHtml.attr('class', 'step ' + dest1[i1].data[0].status);
                                    if (dest1[i1].data[0].status.indexOf('step-undone') != -1) {
                                        $stepHtml.find('.actionBtn').append($(startAction));
                                    } else if (dest1[i1].data[0].status.indexOf('step-done') != -1) {
                                        $stepHtml.find('.actionBtn').append($(workDetailView));
                                    } else if (dest1[i1].data[0].status.indexOf('step-doing') != -1) {
                                        $stepHtml.find('.actionBtn').append($(endAction + workDetailEdit));
                                    }
                                } else {
                                    $stepHtml.find('.actionBtn').append($(startAction));
                                }

                                //构造普通工序html
                                $stepHtml.find('.title').text(dest1[i1].data[0].name);
                                $stepHtml.attr('data', JSON.stringify(dest1[i1].data[0]));
                                // 将普通工序插入到大工序中
                                $hasMixBigStepHtml.children('ul').append($stepHtml);
                                // 重置普通工序
                                $stepHtml = $(stepHtml);
                            } else {
                                var map2 = {},
                                    dest2 = [];
                                for (var d2 = 0; d2 < dest1[i1].data.length; d2++) {
                                    if (!map2[dest1[i1].data[d2].step]) {
                                        dest2.push({
                                            step: dest1[i1].data[d2].step,
                                            data: [dest1[i1].data[d2]]
                                        });
                                        map2[dest1[i1].data[d2].step] = dest1[i1].data[d2];
                                    } else {
                                        for (var j2 = 0; j2 < dest2.length; j2++) {
                                            if (dest2[j2].step == dest1[i1].data[d2].step) {
                                                dest2[j2].data.push(dest1[i1].data[d2]);
                                                break;
                                            }
                                        }
                                    }
                                }

                                for (var i2 = 0; i2 < dest2.length; i2++) {
                                    if (dest2[i2].data.length == 1) {
                                        if (dest2[i2].data[0].status) {
                                            $stepHtml.attr('class', 'step ' + dest2[i2].data[0].status);
                                            if (dest2[i2].data[0].status.indexOf('step-undone') != -1) {
                                                $stepHtml.find('.actionBtn').append($(startAction));
                                            } else if (dest2[i2].data[0].status.indexOf('step-done') != -1) {
                                                $stepHtml.find('.actionBtn').append($(workDetailView));
                                            } else if (dest2[i2].data[0].status.indexOf('step-doing') != -1) {
                                                $stepHtml.find('.actionBtn').append($(endAction + workDetailEdit));
                                            }
                                        } else {
                                            $stepHtml.find('.actionBtn').append($(startAction));
                                        }

                                        //构造普通工序html
                                        $stepHtml.find('.title').text(dest2[i2].data[0].name);
                                        $stepHtml.attr('data', JSON.stringify(dest2[i2].data[0]));
                                        // 将普通工序插入到大工序中
                                        $mixStepHtml.children('ul').append($stepHtml);
                                        // 重置普通工序
                                        $stepHtml = $(stepHtml);
                                    } else {
                                        for (var d3 = 0; d3 < dest2[i2].data.length; d3++) {
                                            if (dest2[i2].data[d3].status) {
                                                $stepHtml.attr('class', 'step ' + dest2[i2].data[d3].status);
                                                if (dest2[i2].data[d3].status.indexOf('step-done') != -1) {
                                                    $stepHtml.find('.actionBtn').append($(workDetailView));
                                                } else if (dest2[i2].data[d3].status.indexOf('step-doing') != -1) {
                                                    $bigStepHtml.addClass('step-start step-end');
                                                    $stepHtml.find('.actionBtn').append($(endAction + workDetailEdit));
                                                } else if (dest2[i2].data[d3].status.indexOf('step-undone') != -1) {
                                                    $stepHtml.find('.actionBtn').append($(startAction));
                                                }
                                            } else {
                                                $stepHtml.find('.actionBtn').append($(startAction));
                                            }

                                            // 构造普通工序html
                                            $stepHtml.find('.title').text(dest2[i2].data[d3].name);
                                            $stepHtml.attr('data', JSON.stringify(dest2[i2].data[d3]));
                                            // 将普通工序插入到大工序中
                                            $bigStepHtml.find('ul').append($stepHtml);
                                            // 重置普通工序
                                            $stepHtml = $(stepHtml);
                                        }
                                        //将大工序插入到工序列表中
                                        $mixStepHtml.children('ul').append($bigStepHtml);
                                        //重置大工序
                                        $bigStepHtml = $(bigStepHtml);
                                    }
                                }
                                $hasMixBigStepHtml.children('ul').append($mixStepHtml);
                                $mixStepHtml = $(mixStepHtml);
                            }
                        }
                        //将大工序插入到工序列表中
                        $containerSteps.append($hasMixBigStepHtml);
                        //重置大工序
                        $hasMixBigStepHtml = $(hasMixBigStepHtml);
                    } else {
                        if (dest[i].data.length == 1) {
                            if (dest[i].data[0].status) {
                                $stepHtml.attr('class', 'step ' + dest[i].data[0].status);
                                if (dest[i].data[0].status.indexOf('step-undone') != -1) {
                                    $stepHtml.find('.actionBtn').append($(startAction));
                                } else if (dest[i].data[0].status.indexOf('step-done') != -1) {
                                    $stepHtml.find('.actionBtn').append($(workDetailView));
                                } else if (dest[i].data[0].status.indexOf('step-doing') != -1) {
                                    $stepHtml.find('.actionBtn').append($(endAction + workDetailEdit));
                                }
                            } else {
                                $stepHtml.find('.actionBtn').append($(startAction));
                            }

                            //构造普通工序html
                            $stepHtml.find('.title').text(dest[i].data[0].name);
                            $stepHtml.attr('data', JSON.stringify(dest[i].data[0]));
                            //将普通工序插入到工序列表中
                            $containerSteps.append($stepHtml);
                            //重置普通工序
                            $stepHtml = $(stepHtml);
                        } else {   // 含有小工序的大工序
                            if (!$containerSteps.hasClass('has-big-step')) {
                                $containerSteps.addClass('has-big-step');
                            }
                            // 获取最大的大工序其小工序的数量
                            if (dest[i].data.length > max) {
                                max = dest[i].data.length;
                            }
                            for (var d = 0; d < dest[i].data.length; d++) {
                                if (dest[i].data[d].status) {
                                    $stepHtml.attr('class', 'step ' + dest[i].data[d].status);
                                    if (dest[i].data[d].status.indexOf('step-done') != -1) {
                                        $stepHtml.find('.actionBtn').append($(workDetailView));
                                    } else if (dest[i].data[d].status.indexOf('step-doing') != -1) {
                                        $bigStepHtml.addClass('step-start step-end');
                                        $stepHtml.find('.actionBtn').append($(endAction + workDetailEdit));
                                    } else if (dest[i].data[d].status.indexOf('step-undone') != -1) {
                                        $stepHtml.find('.actionBtn').append($(startAction));
                                    }
                                } else {
                                    $stepHtml.find('.actionBtn').append($(startAction));
                                }

                                // 构造普通工序html
                                $stepHtml.find('.title').text(dest[i].data[d].name);
                                $stepHtml.attr('data', JSON.stringify(dest[i].data[d]));
                                // 将普通工序插入到大工序中
                                $bigStepHtml.find('ul').append($stepHtml);
                                // 重置普通工序
                                $stepHtml = $(stepHtml);
                            }
                            //将大工序插入到工序列表中
                            $containerSteps.append($bigStepHtml);
                            //重置大工序
                            $bigStepHtml = $(bigStepHtml);
                        }
                    }
                }

                //插入到容器中
                $n.append($baseHtml);

                // 返回默认选中的工序以及当前正在执行的工序
                if (params.callback) {
                    var nowStepArr = [];
                    var activeStepObj = {};
                    for (i = 0; i < arr.length; i++) {
                        var ai = arr[i];
                        if (ai.status && ai.status.indexOf('step-doing') != -1) {
                            nowStepArr.push(ai);
                        }
                        if (ai.status && ai.status.indexOf('active') != -1) {
                            activeStepObj = ai;
                        }
                    }
                    params.callback(activeStepObj, nowStepArr);
                }
            });

            if (params.ifhover) {
                $('.startAction').click(function (e) {
                    startActive($(this).parents('.step').attr('data'));
                });
                $('.endAction').click(function () {
                    endActive($(this).parents('.step').attr('data'));
                });
                $('.workDetailEdit').click(function () {
                    activeDetailEdit($(this).parents('.step').attr('data'));
                });
                $('.workDetailView').click(function () {
                    activeDetailView($(this).parents('.step').attr('data'));
                });
                this._f1();
            }

            $('.main-process').each(function () {
                if ($(this).find('li').length == 1) {
                    $(this).find('p').css({'opacity': 0, 'filter': 'Alpha(opacity=0)'});
                }
            });

            $('.has-big-step ul').each(function () {
                $(this).parent('.big-step').css('height', 60 * ($(this).children('li').length - 1) + 'px');
                if ($(this).find('.step-done').length > 0 || $(this).find('.step-doing').length > 0) {
                    $(this).parent('.big-step').addClass('step-start step-end');
                }
                if ($(this).find('.step-undone').length > 0 || $(this).find('.step-doing').length > 0) {
                    $(this).parent('.big-step').removeClass('step-end');
                }
            });

            $('.has-big-step').each(function (index, stepBox) {
                var max = 0;
                $(stepBox).children('.big-step').each(function (i1, e1) {
                    var innerSubLengthSum = 0;
                    if ($(e1).children('ul').children('.mix-step').length == 0) {
                        innerSubLengthSum = $(e1).children('ul').children('li').length;
                    } else {
                        $(e1).children('ul').children('.mix-step').each(function (i2, e2) {
                            var maxLiWidth = 0;
                            var maxWidthEl;
                            var sumWidth = 0;
                            $(e2).children('ul').children('li').each(function () {
                                if ($(this).width() > maxLiWidth) {
                                    maxLiWidth = $(this).width();
                                    maxWidthEl = $(this);
                                }
                                sumWidth += $(this).width();
                            });
                            $(maxWidthEl).width(maxLiWidth + $(e2).width() - sumWidth);

                            var maxSubRowLength = 0;
                            if ($(e2).children('ul').children('.big-step').length == 0) {
                                maxSubRowLength = 1;
                            } else {
                                $(e2).children('ul').children('.big-step').each(function (i3, e3) {
                                    if (i2 == 0) {
                                        $(e2).parents('.big-step').css('margin-top', ($(e3).find('li').length - 1) * 30 + 'px');
                                    } else {
                                        $(e2).css('margin-top', ($(e3).find('li').length - 1) * 30 + 'px');
                                    }
                                    $(e3).css('margin-top', '-' + ($(e3).find('li').length - 1) * 30 + 'px');
                                    if ($(e3).find('li').length > maxSubRowLength) {
                                        maxSubRowLength = $(e3).find('li').length;
                                    }
                                });
                            }
                            $(e2).height((maxSubRowLength + 1) * 30);
                            $(e2).attr('maxSubRowLength', maxSubRowLength);
                            // $(e2).parents('.big-step').css('margin-top',(maxSubRowLength-1)*30+'px');
                            innerSubLengthSum += maxSubRowLength;
                        });
                        innerSubLengthSum += $(e1).children('ul').children('.step').length;
                    }
                    $(e1).attr('rowNum', innerSubLengthSum);
                    if (innerSubLengthSum > max) {
                        max = innerSubLengthSum;
                    }
                });
                // 设置工序容器ul高度、宽度
                var containerStepsWidth = 0;
                $(this).children('li').each(function () {
                    containerStepsWidth = containerStepsWidth + $(this).width();
                });
                $(this).children('.big-step').each(function () {
                    containerStepsWidth = containerStepsWidth + 50;
                });
                $(this).css({'width': containerStepsWidth + 50 + 'px', height: max * 60 + 'px'});

                $(this).children('li').each(function () {
                    if (!$(this).hasClass('big-step')) {    //普通工序
                        $(this).css('margin-top', 60 * (max - 1) / 2 + 'px');
                    } else {                                //大工序
                        if ($(this).find('.big-step').length == 0) {    // 普通大工序
                            $(this).css({'margin-top': 60 * (max - $(this).attr('rowNum')) / 2 + 'px'});
                        } else {                                        // 含有混合工序的大工序
                            if ($(this).attr('rownum') != max) {
                                if($(this).find('.mix-step .big-step').length == 0){    // 含有混合工序的大工序的混合工序里都没有大工序
                                    $(this).css({'margin-top': 60 * (max - $(this).attr('rowNum')) / 2 + 'px'});
                                } else {
                                    $(this).css({'margin-top': 30 * (max + 1 - $(this).attr('rowNum')) + 'px'});

                                    // var appendStr = "<style>:before{margin-top:" + (30 * (max + 1 - $(this).attr('rowNum')))/2 + 'px' + "}</style>";
                                    // $(this).append(appendStr);
                                }
                            }
                            if($(this).find('.mix-step .big-step').length > 0){
                                $(this).css({'height': 60 * (Number($(this).attr('rowNum')) - 1) - parseFloat($(this).css('margin-top')) + 'px'});
                            }
                        }
                    }
                });
            });
        }
    });
})(jQuery);