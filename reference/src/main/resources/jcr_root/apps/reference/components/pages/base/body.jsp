<%@include file="/apps/reference/global.jsp"%>
<body>
	<sling:call script="/libs/cms/components/editor/scripts/init.jsp" />
	<sling:call script="content.jsp" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<sling:call script="/libs/cms/components/editor/scripts/finalize.jsp" />
</body>