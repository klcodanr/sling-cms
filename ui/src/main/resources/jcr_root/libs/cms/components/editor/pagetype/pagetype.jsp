<%@include file="/libs/cms/global.jsp"%>
<dl>
	<dt>
		Label
	</dt>
	<dd>
		<sling:encode value="${properties.label}" mode="HTML" />
	</dd>
	<dt>
		Description
	</dt>
	<dd>
		<sling:encode value="${properties.description}" mode="HTML" />
	</dd>
	<dt>
		Resource Type
	</dt>
	<dd>
		<sling:encode value="${properties.resourceType}" mode="HTML" />
	</dd>
</dl>
<h2>Available Resource Types</h2>
<c:set var="oldAvailableTypes" value="${availableTypes}" />
<c:set var="availableTypes" value="cms/components/editor/resourcetype" scope="request" />
<sling:include path="availabletypes" resourceType="fdn/components/container" />
<c:set var="availableTypes" value="${oldAvailableTypes}" scope="request" />
