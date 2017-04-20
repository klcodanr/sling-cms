package org.apache.sling.cms.core.models;

import javax.inject.Inject;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.cms.CMSConstants;
import org.apache.sling.models.annotations.Default;
import org.apache.sling.models.annotations.Model;
import org.apache.sling.models.annotations.Optional;

/**
 * Sling Model for accessing the default blog configuration
 */
@Model(adaptables = Resource.class)
public interface BlogConfig {

	static BlogConfig getBlogConfig(Site site) {
		Resource blogConfigRsrc = site.getConfig().getChild(CMSConstants.BLOG_CONFIG_SUBPATH);
		if (blogConfigRsrc != null) {
			return blogConfigRsrc.adaptTo(BlogConfig.class);
		} else {
			return null;
		}
	}

	@Inject
	String getResourceType();

	@Inject
	String getPostPrefix();

	@Inject
	@Default(booleanValues = false)
	Boolean getGenerateTags();

	@Inject
	@Optional
	String getTagResourceType();
}
