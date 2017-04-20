package org.apache.sling.cms.core.models;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.cms.CMSConstants;
import org.apache.sling.cms.CMSUtils;
import org.apache.sling.models.annotations.Model;

@Model(adaptables = Resource.class)
public class PageManager {

	private final Page page;

	public PageManager(Resource containingResource) {
		Resource pageResource = CMSUtils.findParentResourceofType(containingResource, CMSConstants.NODE_TYPE_PAGE);
		if (pageResource != null) {
			page = pageResource.adaptTo(Page.class);
		} else {
			page = null;
		}
	}

	public Page getPage() {
		return page;
	}
}
