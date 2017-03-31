package org.apache.sling.cms.core.models;

import org.apache.jackrabbit.JcrConstants;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.cms.CMSConstants;
import org.apache.sling.models.annotations.Model;

@Model(adaptables = Resource.class)
public class PageManager {

	private final Page page;

	public PageManager(Resource containingResource) {
		Resource pageResource = findPageResource(containingResource);
		if (pageResource != null) {
			page = pageResource.adaptTo(Page.class);
		} else {
			page = null;
		}
	}

	private Resource findPageResource(Resource resource) {
		if (resource != null) {
			if (CMSConstants.NODE_TYPE_PAGE
					.equals(resource.getValueMap().get(JcrConstants.JCR_PRIMARYTYPE, String.class))) {
				return resource;
			} else {
				return findPageResource(resource.getParent());
			}
		}
		return null;
	}

	public Page getPage() {
		return page;
	}
}
