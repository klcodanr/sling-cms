package org.apache.sling.cms.core.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;

import org.apache.commons.lang.StringUtils;
import org.apache.felix.scr.annotations.sling.SlingServlet;
import org.apache.jackrabbit.JcrConstants;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.api.resource.ModifiableValueMap;
import org.apache.sling.api.resource.PersistenceException;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ResourceResolver;
import org.apache.sling.api.servlets.SlingAllMethodsServlet;
import org.apache.sling.cms.CMSConstants;
import org.apache.sling.cms.core.models.RedirectAttribute;
import org.apache.sling.cms.core.models.Site;
import org.apache.sling.jcr.resource.JcrResourceConstants;
import org.apache.sling.cms.core.models.RedirectAttribute.LEVEL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Servlet for editing sites
 * 
 * @author danklco
 */
@SlingServlet(paths = CMSConstants.SERVLET_PATH_ADMIN + "/siteedit")
public class EditSiteServlet extends SlingAllMethodsServlet {

	private static final long serialVersionUID = -5528294838383339934L;

	/**
	 * The logger.
	 */
	private static final Logger log = LoggerFactory.getLogger(EditSiteServlet.class);

	/**
	 * Updates a site
	 */
	@Override
	protected void doPost(SlingHttpServletRequest request, SlingHttpServletResponse response)
			throws ServletException, IOException {
		ResourceResolver resolver = request.getResourceResolver();

		String id = request.getParameter("id");
		final String name = request.getParameter("name");
		final String description = request.getParameter("description");

		if (StringUtils.isEmpty(id)) {
			id = name.toLowerCase().replaceAll("[^a-z\\d]", "-");
		}

		Resource site = resolver.getResource("/content/" + id);
		Resource contentRoot = resolver.getResource("/content");
		try {
			if (site == null) {
				log.debug("Creating site {}", id);
				Map<String, Object> siteProperties = new HashMap<String, Object>();
				siteProperties.put(JcrConstants.JCR_PRIMARYTYPE, CMSConstants.NODE_TYPE_SITE);
				siteProperties.put(Site.PN_NAME, name);
				siteProperties.put(Site.PN_DESCRIPTION, description);
				Resource siteResource = resolver.create(contentRoot, id, siteProperties);

				Resource configs = resolver.getResource("/etc/config");
				if (configs == null) {
					Resource etc = resolver.getResource("/etc");
					Map<String, Object> configsProperties = new HashMap<String, Object>();
					configsProperties.put(JcrConstants.JCR_PRIMARYTYPE, JcrConstants.NT_UNSTRUCTURED);
					configs = resolver.create(etc, "config", configsProperties);
				}

				Map<String, Object> siteConfigProperties = new HashMap<String, Object>();
				siteConfigProperties.put(JcrConstants.JCR_PRIMARYTYPE, JcrConstants.NT_UNSTRUCTURED);
				resolver.create(configs, id, siteConfigProperties);

				Resource fragments = resolver.getResource("/etc/fragments");
				if (fragments == null) {
					Resource etc = resolver.getResource("/etc");
					Map<String, Object> fragmentsProperties = new HashMap<String, Object>();
					fragmentsProperties.put(JcrConstants.JCR_PRIMARYTYPE, JcrConstants.NT_FOLDER);
					fragments = resolver.create(etc, "fragments", fragmentsProperties);
				}
				Map<String, Object> siteFragments = new HashMap<String, Object>();
				siteFragments.put(JcrConstants.JCR_PRIMARYTYPE, JcrResourceConstants.NT_SLING_ORDERED_FOLDER);
				resolver.create(fragments, id, siteFragments);

				Map<String, Object> assetsFolderProperties = new HashMap<String, Object>();
				assetsFolderProperties.put(JcrConstants.JCR_PRIMARYTYPE, JcrResourceConstants.NT_SLING_ORDERED_FOLDER);
				resolver.create(siteResource, "assets", assetsFolderProperties);

				RedirectAttribute.setMessage(request, LEVEL.success, "Site created successfully!");
			} else {
				log.debug("Updating site {}", id);

				ModifiableValueMap siteProperties = site.adaptTo(ModifiableValueMap.class);
				siteProperties.put(Site.PN_NAME, name);
				siteProperties.put(Site.PN_DESCRIPTION, description);

				RedirectAttribute.setMessage(request, LEVEL.success, "Site updated successfully!");
			}
			resolver.commit();
			resolver.close();

			response.sendRedirect(CMSConstants.ADMIN_PATH);
		} catch (PersistenceException e) {
			RedirectAttribute.setMessage(request, LEVEL.danger, "Failed to update site!");
			log.error("Could not edit site", e);
			response.sendRedirect(request.getHeader("referer"));
		}
	}
}