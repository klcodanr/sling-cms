package org.apache.sling.cms.core.filters;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.felix.scr.annotations.sling.SlingFilter;
import org.apache.felix.scr.annotations.sling.SlingFilterScope;
import org.apache.jackrabbit.JcrConstants;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.cms.core.models.EditableResource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SlingFilter(order = 0, scope = SlingFilterScope.COMPONENT)
public class EditIncludeFilter implements Filter {

	private static final Logger log = LoggerFactory.getLogger(EditIncludeFilter.class);

	public static final String ENABLED_ATTR_NAME = "cmsEditEnabled";

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		Resource resource = ((SlingHttpServletRequest) request).getResource();
		boolean enabled = "true".equals(request.getAttribute(ENABLED_ATTR_NAME));
		String editPath = getEditPath(resource);
		PrintWriter writer = null;

		if (enabled && StringUtils.isNotEmpty(editPath)) {
			boolean last = false;
			boolean first = false;
			if (resource != null && resource.getParent() != null) {
				Iterator<Resource> children = resource.getParent().listChildren();
				if (!children.hasNext() || children.next().getPath().equals(resource.getPath())) {
					first = true;
				}
				if (children.hasNext()) {
					while (children.hasNext()) {
						if (children.next().getPath().equals(resource.getPath()) && !children.hasNext()) {
							last = true;
						}
					}
				} else {
					last = true;
				}
			}
			writer = response.getWriter();
			writer.write("<div class=\"cms--component\" data-cms-resource-path=\"" + resource.getPath()
					+ "\" data-cms-resource-type=\"" + resource.getResourceType() + "\" data-cms-edit=\"" + editPath
					+ "\">");
			writer.write("<div class=\"cms--edit-bar\">");
			writer.write("<button class=\"cms--edit-button\" data-cms-action=\"edit\" data-cms-path=\""
					+ resource.getPath() + "\" data-cms-edit=\"" + editPath + "\">Edit</button>");
			if (!first) {
				writer.write("<button class=\"cms--edit-button\" data-cms-action=\"moveup\" data-cms-path=\""
						+ resource.getPath() + "\">Move Up</button>");
			}
			if (!last) {
				writer.write("<button class=\"cms--edit-button\" data-cms-action=\"movedown\" data-cms-path=\""
						+ resource.getPath() + "\">Move Down</button>");
			}
			if (!resource.getName().equals(JcrConstants.JCR_CONTENT)) {
				writer.write("<button class=\"cms--edit-button\" data-cms-action=\"delete\" data-cms-path=\""
						+ resource.getPath() + "\">Delete</button>");
			}
			writer.write("</div>");
		}
		chain.doFilter(request, response);
		if (enabled && StringUtils.isNotEmpty(editPath)) {
			writer.write("</div>");
		}
	}

	private String getEditPath(Resource resource) {
		log.trace("getEditPage resource={}", resource);
		String editPath = null;
		if (resource != null) {
			EditableResource editResource = resource.adaptTo(EditableResource.class);
			if (editResource != null) {
				editPath = editResource.getEditPath();
			}
		}
		return editPath;
	}

	@Override
	public void destroy() {
	}

}
