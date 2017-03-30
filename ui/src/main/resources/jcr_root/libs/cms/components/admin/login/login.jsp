<%@include file="/libs/cms/global.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">CMS Login</h3>
                </div>
                <div class="panel-body">
                    <form role="form" method="POST" action="/j_security_check">
                        <fieldset>
                        	<c:if test="${param['j_reason'] != null}">
	                            <div class="alert alert-danger alert-dismissable">
	                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
	                                Failed to login, please check username and password.
	                            </div>
                            </c:if>
                            <div class="form-group">
                                <input class="form-control" placeholder="Username" name="j_username" type="text" autofocus>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Password" name="j_password" type="password">
                            </div>
                            <input type="hidden" name="_charset_" value="UTF-8">
                            <input type="hidden" name="sling.auth.redirect" value="/admin/home.html">
                            <button type="submit" class="btn btn-lg btn-primary btn-block">Login</button>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>