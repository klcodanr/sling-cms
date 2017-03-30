<%@include file="/libs/cms/global.jsp"%>
<head>
  <title><c:out value="${properties.title}" default="${properties['jcr:title']}" /> | Sling CMS</title>
  <sling:call script="meta.jsp" />
  <sling:call script="links.jsp" />
</head>