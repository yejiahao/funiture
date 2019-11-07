<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>服务降级</title>
    <jsp:include page="../common/backend_common.jsp"/>
</head>
<body class="no-skin" youdao="bind" style="background: white">
<div class="main-content-inner">
    <div class="page-content">
        <!-- /.ace-settings-container -->

        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->

                <div class="error-container">
                    <div class="well">
                        <h1 class="grey lighter smaller">
                            <span class="blue bigger-125">
                                <i class="ace-icon fa fa-random"></i>
                                服务降级
                            </span>
                        </h1>

                        <hr>
                        <h3 class="lighter smaller">
                            系统现在有点处理不过来了, 请稍后再使用这个功能
                        </h3>

                        <div class="space"></div>
                        <div>
                            <h4 class="lighter smaller">可以尝试以下:</h4>
                            <ul class="list-unstyled spaced inline bigger-110 margin-15">
                                <li>
                                    <i class="ace-icon fa fa-hand-o-right blue"></i>
                                    阅读FAQ
                                </li>

                                <li>
                                    <i class="ace-icon fa fa-hand-o-right blue"></i>
                                    联系管理员
                                </li>
                            </ul>
                        </div>

                        <hr>
                        <div class="space"></div>

                        <div class="center">
                            <a href="javascript:history.back()" class="btn btn-grey">
                                <i class="ace-icon fa fa-arrow-left"></i>
                                上一页
                            </a>

                            <a href="#" class="btn btn-primary">
                                <i class="ace-icon fa fa-tachometer"></i>
                                Dashboard
                            </a>
                        </div>
                    </div>
                </div>
                <!-- PAGE CONTENT ENDS -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.page-content -->
</div>
</body>
</html>
