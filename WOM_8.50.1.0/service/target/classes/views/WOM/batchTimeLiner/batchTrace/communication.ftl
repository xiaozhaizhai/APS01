<!-- WOM_7.5.0.0/batchTimeLiner/communication -->
<#assign isWorkflow = false> 
<#assign isAttachment = true> 
	<#assign  fileuploadType = "WOM_batchTimeLiner_batchTrace">
	<#assign fileuploadLinkId = id!>
<#assign viewType = "create">
<#assign newObj = editNew!true >
<#if newObj>
<#assign viewType = "create">
<#else>
<#assign viewType = "edit">
</#if>
<#if refId?? && (refId>0)>
	<#assign newObj = false >
</#if>
<#assign userJson= Session.user.toJSON()>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<#-- 实体对象 -->
<#assign tableObj = batchTrace>
<#-- 命名空间 -->
<#assign editPageNs = "WOM.batchTimeLiner.batchTrace.communication">
<#-- 模型名称-->
<#assign modelName = "batchTrace">
<#-- 视图编码-->
<#assign viewCode = "WOM_7.5.0.0_batchTimeLiner_communication">
<#-- 实体编码-->
<#assign entity_code = "WOM_7.5.0.0_batchTimeLiner">
<#-- 视图名称-->
<#assign viewName = "communication">
<#-- datagrid编码-->
<#assign datagridCode = "WOM_batchTimeLiner_batchTrace_communication_datagrids">
<#-- 首字母大写的模型名称-->
<#assign upcaseModelName = "BatchTrace">
<#-- 页面打印按钮 -->
<#assign isPrint = false>
<#-- 控件打印按钮 -->
<#assign controlPrint = false>
<#-- 是否只读 -->
<#assign allReadOnly = false>
<#-- 是否是参照视图 -->
<#assign isReference =false>
<#-- 是否可弃审 -->
<#assign retrialFlag = false>
<#-- formid -->
<#assign editFormId = "WOM_batchTimeLiner_batchTrace_communication_form">
<#-- 待办状态 -->
<#assign pendingstatus =( batchTrace.pending.taskDescription)!>
<#-- 打印控件名称 -->
<#assign controlName = "ec.print.controlPrint">
<#-- 批量？？ -->
<#assign isBatch = false>
<#assign payCloseAttention = false>
<#-- 自定义按钮 -->
<#assign operateButtons =[] >
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 聊天窗口</title>

    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="/bap/static/WOM/hAdmin/hAdmin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/bap/static/WOM/hAdmin/hAdmin/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="/bap/static/WOM/hAdmin/hAdmin/css/plugins/jsTree/style.min.css" rel="stylesheet">
    <link href="/bap/static/WOM/hAdmin/hAdmin/css/animate.css" rel="stylesheet">
    <link href="/bap/static/WOM/hAdmin/hAdmin/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content  animated fadeInRight">

    <div class="row">
        <div class="col-sm-12">

            <div class="ibox chat-view">

                <div class="ibox-title">
                    <small class="pull-right text-muted">最新消息：2015-02-02 18:39:23</small> 聊天窗口
                </div>


                <div class="ibox-content">

                    <div class="row">

                        <div class="col-md-9 ">
                            <div class="chat-discussion">

                                <div class="chat-message">
                                    <img class="message-avatar" src="/bap/static/WOM/hAdmin/hAdmin/img/a1.jpg" alt="">
                                    <div class="message">
                                        <a class="message-author" href="#"> 颜文字君</a>
                                        <span class="message-date"> 2015-02-02 18:39:23 </span>
                                        <span class="message-content">
											
                                            </span>
                                    </div>
                                </div>
                                <div class="chat-message">
                                    <img class="message-avatar" src="/bap/static/WOM/hAdmin/hAdmin/img/a4.jpg" alt="">
                                    <div class="message">
                                        <a class="message-author" href="#"> 林依晨Ariel </a>
                                        <span class="message-date">  2015-02-02 11:12:36 </span>
                                        <span class="message-content">
											jQuery表单验证插件 - 让表单验证变得更容易
                                            </span>
                                    </div>
                                </div>
                                <div class="chat-message">
                                    <img class="message-avatar" src="/bap/static/WOM/hAdmin/hAdmin/img/a2.jpg" alt="">
                                    <div class="message">
                                        <a class="message-author" href="#"> 谨斯里 </a>
                                        <span class="message-date">  2015-02-02 11:12:36 </span>
                                        <span class="message-content">
											验证日期格式(类似30/30/2008的格式,不验证日期准确性只验证格式
                                            </span>
                                    </div>
                                </div>
                                <div class="chat-message">
                                    <img class="message-avatar" src="/bap/static/WOM/hAdmin/hAdmin/img/a5.jpg" alt="">
                                    <div class="message">
                                        <a class="message-author" href="#"> 林依晨Ariel </a>
                                        <span class="message-date">  2015-02-02 - 11:12:36 </span>
                                        <span class="message-content">
											还有约79842492229个Bug需要修复
                                            </span>
                                    </div>
                                </div>
                                <div class="chat-message">
                                    <img class="message-avatar" src="/bap/static/WOM/hAdmin/hAdmin/img/a6.jpg" alt="">
                                    <div class="message">
                                        <a class="message-author" href="#"> 林依晨Ariel </a>
                                        <span class="message-date">  2015-02-02 11:12:36 </span>
                                        <span class="message-content">
											九部令人拍案叫绝的惊悚悬疑剧情佳作】如果你喜欢《迷雾》《致命ID》《电锯惊魂》《孤儿》《恐怖游轮》这些好片，那么接下来推荐的9部同类题材并同样出色的的电影，绝对不可错过哦~

                                            </span>
                                    </div>
                                </div>

                            </div>

                        </div>
                        <div class="col-md-3">
                            <div class="chat-users">


                                <div class="users-list">
                                    <div class="chat-user">
                                        <img class="chat-avatar" src="/bap/static/WOM/hAdmin/hAdmin/img/a4.jpg" alt="">
                                        <div class="chat-user-name">
                                            <a href="#">伤城Simple</a>
                                        </div>
                                    </div>
                                    <div class="chat-user">
                                        <img class="chat-avatar" src="/bap/static/WOM/hAdmin/hAdmin/img/a1.jpg" alt="">
                                        <div class="chat-user-name">
                                            <a href="#">从未出现过的风景__</a>
                                        </div>
                                    </div>
                                    <div class="chat-user">
                                        <span class="pull-right label label-primary">在线</span>
                                        <img class="chat-avatar" src="/bap/static/WOM/hAdmin/hAdmin/img/a2.jpg" alt="">
                                        <div class="chat-user-name">
                                            <a href="#">冬伴花暖</a>
                                        </div>
                                    </div>
                                    <div class="chat-user">
                                        <span class="pull-right label label-primary">在线</span>
                                        <img class="chat-avatar" src="/bap/static/WOM/hAdmin/hAdmin/img/a3.jpg" alt="">
                                        <div class="chat-user-name">
                                            <a href="#">ZM敏姑娘	</a>
                                        </div>
                                    </div>
                                    <div class="chat-user">
                                        <img class="chat-avatar" src="/bap/static/WOM/hAdmin/hAdmin/img/a5.jpg" alt="">
                                        <div class="chat-user-name">
                                            <a href="#">才越越</a>
                                        </div>
                                    </div>
                                    <div class="chat-user">
                                        <img class="chat-avatar" src="/bap/static/WOM/hAdmin/hAdmin/img/a6.jpg" alt="">
                                        <div class="chat-user-name">
                                            <a href="#">时光十年TENSHI</a>
                                        </div>
                                    </div>
                                    <div class="chat-user">
                                        <img class="chat-avatar" src="/bap/static/WOM/hAdmin/hAdmin/img/a2.jpg" alt="">
                                        <div class="chat-user-name">
                                            <a href="#">刘顰颖</a>
                                        </div>
                                    </div>
                                    <div class="chat-user">
                                        <span class="pull-right label label-primary">在线</span>
                                        <img class="chat-avatar" src="/bap/static/WOM/hAdmin/hAdmin/img/a3.jpg" alt="">
                                        <div class="chat-user-name">
                                            <a href="#">陈泳儿SccBaby</a>
                                        </div>
                                    </div>


                                </div>

                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="chat-message-form">

                                <div class="form-group">

                                    <textarea class="form-control message-input" name="message" placeholder="输入消息内容，按回车键发送"></textarea>
                                </div>

                            </div>
                        </div>
                    </div>


                </div>

            </div>
        </div>

    </div>


</div>


<!-- 全局js -->

<!-- 自定义js -->
<script src="/bap/static/WOM/hAdmin/hAdmin/js/content.js?v=1.0.0"></script>




</body>

</html>
