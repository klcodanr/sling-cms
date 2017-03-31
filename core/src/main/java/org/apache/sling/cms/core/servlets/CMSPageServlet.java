package org.apache.sling.cms.core.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import org.apache.felix.scr.annotations.sling.SlingServlet;
import org.apache.jackrabbit.JcrConstants;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.servlets.HttpConstants;
import org.apache.sling.api.servlets.SlingSafeMethodsServlet;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SlingServlet(resourceTypes = { "cms:page" }, methods = { HttpConstants.METHOD_TRACE, HttpConstants.METHOD_GET,
		HttpConstants.METHOD_OPTIONS, HttpConstants.METHOD_HEAD })
public class CMSPageServlet extends SlingSafeMethodsServlet {
	
	private static final long serialVersionUID = -410942682163323725L;
	private static final Logger log = LoggerFactory.getLogger(CMSPageServlet.class);

	protected void doGet(SlingHttpServletRequest request, SlingHttpServletResponse response)
			throws ServletException, IOException {
		Resource contentResource = request.getResourceResolver().getResource(request.getResource(), JcrConstants.JCR_CONTENT);
		if (contentResource == null) {
			log.error("No countent for page {}", request.getResource());
			response.sendError(HttpServletResponse.SC_NOT_FOUND, "no content");
			return;
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(contentResource);
		if (requestDispatcher != null) {
			requestDispatcher.include(request, response);
			return;
		} else {
			log.error("Failed to get request dispatcher for content of {}", request.getResource());
			throw new ServletException("No Content");
		}
	}
}
