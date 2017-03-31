<%@include file="/libs/cms/global.jsp"%>
<c:if test="${editProperties[properties.name] != null}">
	<fmt:formatDate value="${editProperties[properties.name].time}" var="date" pattern="yyyy-MM-dd'T'HH:mm:ss" />
</c:if>
<input type="datetime-local" class="form-control" name="${properties.name}" value="${date}" ${required} ${disabled} />
<input type="hidden"  name="${properties.name}@TypeHint" value="Date" ${disabled} />