package org.apache.sling.cms.core.models;

import java.util.Date;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.commons.lang.StringUtils;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ValueMap;
import org.apache.sling.models.annotations.Optional;

public abstract class AbstractContentModel {

	@Inject
	@Optional
	@Named("jcr:content")
	private Resource contentResource;

	@Inject
	@Optional
	@Named("jcr:content/jcr:created")
	private Date created;

	@Inject
	@Optional
	@Named("jcr:content/jcr:createdBy")
	private String createdBy;

	@Inject
	@Optional
	@Named("jcr:content/jcr:lastModified")
	private Date lastModified;

	@Inject
	@Optional
	@Named("jcr:content/jcr:lastModifiedBy")
	private String lastModifiedBy;

	protected Resource resource;

	@Inject
	@Named("jcr:content/jcr:title")
	@Optional
	private String title;

	@Inject
	@Named("jcr:primaryType")
	private String type;

	public Resource getContentResource() {
		return contentResource;
	}

	public Date getCreated() {
		return created;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public Date getLastModified() {
		return lastModified != null ? lastModified : created;
	}

	public String getLastModifiedBy() {
		return lastModifiedBy != null ? lastModifiedBy : createdBy;
	}

	public String getName() {
		return resource.getName();
	}

	public Resource getParent() {
		return resource.getParent();
	}

	public String getPath() {
		return resource.getPath();
	}

	public ValueMap getProperties() {
		return getContentResource().getValueMap();
	}

	public abstract Boolean getPublished();

	public Resource getResource() {
		return resource;
	}

	public String getTitle() {
		if (StringUtils.isNotEmpty(title)) {
			return title;
		} else {
			return resource.getName();
		}
	}

	public String getType() {
		return type;
	}
}
