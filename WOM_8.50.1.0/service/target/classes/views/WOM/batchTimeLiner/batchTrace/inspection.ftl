<!-- WOM_7.5.0.0/batchTimeLiner/inspection -->
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
<#assign editPageNs = "WOM.batchTimeLiner.batchTrace.inspection">
<#-- 模型名称-->
<#assign modelName = "batchTrace">
<#-- 视图编码-->
<#assign viewCode = "WOM_7.5.0.0_batchTimeLiner_inspection">
<#-- 实体编码-->
<#assign entity_code = "WOM_7.5.0.0_batchTimeLiner">
<#-- 视图名称-->
<#assign viewName = "inspection">
<#-- datagrid编码-->
<#assign datagridCode = "WOM_batchTimeLiner_batchTrace_inspection_datagrids">
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
<#assign editFormId = "WOM_batchTimeLiner_batchTrace_inspection_form">
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


    <title> - FooTable</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="/bap/static/WOM/hAdmin/hAdmin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/bap/static/WOM/hAdmin/hAdmin/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <!-- Data Tables -->
    <link href="/bap/static/WOM/hAdmin/hAdmin/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
    <link href="/bap/static/WOM/hAdmin/hAdmin/css/animate.css" rel="stylesheet">
    <link href="/bap/static/WOM/hAdmin/hAdmin/css/style.css?v=4.1.0" rel="stylesheet">
    <style type="text/css">
        td.details-control {
            background-repeat: no-repeat;
            background-position: center;
                cursor: pointer;
        }
        tr.shown td.details-control {
            background-repeat: no-repeat;
            background-position: center;
        }
    </style>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>基本 <small>分类，查找</small></h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="table_data_tables.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="table_data_tables.html#">选项1</a>
                            </li>
                            <li><a href="table_data_tables.html#">选项2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">

                    <table id="example" class="display" cellspacing="0" width="100%">
                        <thead>
                        <tr>
                            <th></th>
                            <th>Name</th>
                            <th>Position</th>
                            <th>Office</th>
                            <th>Salary</th>
                        </tr>
                        </thead>

                        <tfoot>
                        <tr>
                            <th></th>
                            <th>Name</th>
                            <th>Position</th>
                            <th>Office</th>
                            <th>Salary</th>
                        </tr>
                        </tfoot>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- 全局js -->
<script src="/bap/static/WOM/hAdmin/hAdmin/js/plugins/dataTables/jquery.dataTables.js"></script>
<!-- 自定义js -->
<script src="/bap/static/WOM/hAdmin/hAdmin/js/content.js?v=1.0.0"></script>
<!-- Page-Level Scripts -->
<script>
    var data =  [{
        "name": "Tiger Nixon",
        "position": "System Architect",
        "salary": "$320,800",
        "office": "Edinburgh",
    },

        {
            "name": "Jackson Bradshaw",
            "position": "Director",
            "salary": "$645,750",
            "office": "New York",
        },
        {
            "name": "Olivia Liang",
            "position": "Support Engineer",
            "salary": "$234,500",
            "office": "Singapore",
        },
        {
            "name": "Bruno Nash",
            "position": "Software Engineer",
            "salary": "$163,500",
            "office": "London",
        },
        {
            "name": "Sakura Yamamoto",
            "position": "Support Engineer",
            "salary": "$139,575",
            "office": "Tokyo",
        },
        {
            "name": "Thor Walton",
            "position": "Developer",
            "salary": "$98,540",
            "office": "New York",
        },
        {
            "name": "Finn Camacho",
            "position": "Support Engineer",
            "salary": "$87,500",
            "office": "San Francisco",
        },
        {
            "name": "Serge Baldwin",
            "position": "Data Coordinator",
            "salary": "$138,575",
            "office": "Singapore",
        },
        {
            "name": "Zenaida Frank",
            "position": "Software Engineer",
            "salary": "$125,250",
            "office": "New York",
        },
        {
            "name": "Zorita Serrano",
            "position": "Software Engineer",
            "salary": "$115,000",
            "office": "San Francisco",
        },
        {
            "name": "Jennifer Acosta",
            "position": "Junior Javascript Developer",
            "salary": "$75,650",
            "office": "Edinburgh",
        },
        {
            "name": "Cara Stevens",
            "position": "Sales Assistant",
            "salary": "$145,600",
            "office": "New York",
        },
        {
            "name": "Hermione Butler",
            "position": "Regional Director",
            "salary": "$356,250",
            "office": "London",
        },
        {
            "name": "Lael Greer",
            "position": "Systems Administrator",
            "salary": "$103,500",
            "office": "London",
        },
        {
            "name": "Jonas Alexander",
            "position": "Developer",
            "salary": "$86,500",
            "office": "San Francisco",
        },
        {
            "name": "Shad Decker",
            "position": "Regional Director",
            "salary": "$183,000",
            "office": "Edinburgh",
        },
        {
            "name": "Michael Bruce",
            "position": "Javascript Developer",
            "salary": "$183,000",
            "office": "Singapore",
        },
        {
            "name": "Donna Snider",
            "position": "Customer Support",
            "salary": "$112,000",
            "office": "New York",
        }]


    /* Formatting function for row details - modify as you need */
    function format ( d ) {
        // `d` is the original data object for the row
        return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
                '<tr>'+
                '<td>Full name:</td>'+
                '<td>'+d.name+'</td>'+
                '</tr>'+
                '<tr>'+
                '<td>Extension number:</td>'+
                '<td>'+d.extn+'</td>'+
                '</tr>'+
                '<tr>'+
                '<td>Extra info:</td>'+
                '<td>And any further details here (images etc)...</td>'+
                '</tr>'+
                '</table>';
    }
    $(document).ready(function() {
        var table = $('#example').DataTable({
            data : data,
            "columns": [
                {
                    "class":          'details-control',
                    "orderable":      false,
                    "data":           null,
                    "defaultContent": ''
                },
                { "data": "name" },
                { "data": "position" },
                { "data": "office" },
                { "data": "salary" }
            ],
            "order": [[1, 'asc']]
        } );
        // Add event listener for opening and closing details
        $('#example tbody').on('click', 'td.details-control', function () {
            var tr = $(this).closest('tr');
            var row = table.row( tr );
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
    } );
</script>




</body>

</html>
