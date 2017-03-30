<%@include file="/libs/cms/global.jsp"%>
<sling:call script="head.jsp" />
<body>
  <sling:include path="jcr:content/container" />

  <sling:call script="scripts.jsp" />
</body>