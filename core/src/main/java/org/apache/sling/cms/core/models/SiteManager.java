package org.apache.sling.cms.core.models;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.models.annotations.Model;

@Model(adaptables = Resource.class)
public class SiteManager {

	private final Site site;

	public SiteManager(Resource containingResource) {
		Resource siteResource = findSiteResource(containingResource);
		if (siteResource != null) {
			site = siteResource.adaptTo(Site.class);
		} else {
			site = null;
		}
	}

	private Resource findSiteResource(Resource resource) {
		if (resource != null) {
			String[] pathSegments = resource.getPath().split("\\/");
			String sitePath = null;
			if (resource.getPath().startsWith("/etc")) {
				sitePath = "/content/" + pathSegments[3];
			} else {
				sitePath = "/content/" + pathSegments[2];
			}
			return resource.getResourceResolver().getResource(sitePath);
		}
		return null;
	}

	public Site getSite() {
		return site;
	}
}
