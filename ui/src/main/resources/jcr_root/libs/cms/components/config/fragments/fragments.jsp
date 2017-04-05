<%@include file="/libs/cms/global.jsp"%>
<form action="/etc/config/${site.id}/fragments" method="post" class="slingform" enctype="multipart/form-data">
	<div class="row">
		<div class="col-md-12">
			<div class="form-group">
				<label for="jcr:content/jcr:title">
					Fragment Resource Type <span class="text-danger">*</span>
				</label>
				<div class="input-group">
					<input type="text" class="form-control" name="resourceType" value="${properties.resourceType}" required="required" list="resourceTypes" />
					<datalist id="resourceTypes">
						<c:set var="query" value="SELECT * FROM [cms:component] WHERE [componentType]='Page'" />
						<c:forEach var="item" items="${sling:findResources(resourceResolver,query,'JCR-SQL2')}">
							<c:if test="${item.valueMap.resourceType != null and item.valueMap['jcr:title'] != null}">
								<option value="${sling:encode(item.valueMap.resourceType,'HTML_ATTR')}"><sling:encode value="${item.valueMap['jcr:title']}" mode="HTML" /></option>
							</c:if>
						</c:forEach>
					</datalist>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="form-group">
				<button type="submit" class="btn btn-success">
					Save
				</button>
			</div>
		</div>
	</div>
</form>