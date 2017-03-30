package org.apache.sling.cms.core.models;

import java.util.ArrayList;
import java.util.List;

import org.apache.jackrabbit.JcrConstants;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.cms.CMSConstants;
import org.apache.sling.models.annotations.Model;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Model(adaptables = Resource.class)
public class SiteList {
	
	private static final Logger log = LoggerFactory.getLogger(SiteList.class);

	private Resource resource;

	public SiteList(Resource resource) {
		this.resource = resource;
	}

	public List<Site> getSites() {
		log.trace("getSites");
		List<Site> sites = new ArrayList<Site>();
		for (Resource siteResource : resource.getChildren()) {
			log.debug("Checking for site {}",siteResource);
			if (CMSConstants.NODE_TYPE_SITE
					.equals(siteResource.getValueMap().get(JcrConstants.JCR_PRIMARYTYPE, String.class))) {
				log.debug("Found site {}",siteResource);
				sites.add(siteResource.adaptTo(Site.class));
			}
		}
		return sites;
	}

}
