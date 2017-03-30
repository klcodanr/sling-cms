<%@include file="/libs/cms/global.jsp"%>
<c:if test="${slingRequest.requestPathInfo.suffix != null}">
	<sling:getResource path="${slingRequest.requestPathInfo.suffix}" var="editedResource" />
	<c:set var="editProperties" value="${sling:adaptTo(editedResource,'org.apache.sling.api.resource.ValueMap')}" scope="request"/>
</c:if>
<c:if test="${properties.required}">
	<c:set var="required" value="required='required'" scope="request" />
</c:if>
<c:if test="${properties.disabled}">
	<c:set var="disabled" value="disabled='disabled'" scope="request" />
</c:if>
<div class="row">
	<div class="col-md-12">
		<div class="form-group">
			<c:if test="${not empty properties.label}">
				<label for="${properties.name}">
					<sling:encode value="${properties.label}" mode="HTML" />
					<c:if test="${not empty required}"><span class="text-danger">*</span></c:if>
				</label>
			</c:if>
			<div class="input-group">
				<sling:call script="field.jsp" />
			</div>
		</div>
	</div>
</div>