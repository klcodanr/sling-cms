package org.apache.sling.cms.core.models;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.models.annotations.Model;

@Model(adaptables = Resource.class)
public class Page extends AbstractContentModel {

	@Inject
	@Named("jcr:content/published")
	private Boolean published;

	public Page(Resource resource) {
		this.resource = resource;
	}

	public Boolean getPublished() {
		return published;
	}
}
