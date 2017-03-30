<%@include file="/libs/cms/global.jsp"%>
<body>
	<div class="container edit-page fragment-page">
		<sling:include path="jcr:content/container" />
	</div>
	<sling:call script="scripts.jsp" />
</body>