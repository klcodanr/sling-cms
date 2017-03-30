package org.apache.sling.cms.core.servlets;

import java.io.IOException;

import javax.servlet.ServletException;

import org.apache.felix.scr.annotations.Reference;
import org.apache.felix.scr.annotations.sling.SlingServlet;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.api.servlets.SlingAllMethodsServlet;
import org.apache.sling.cms.CMSConstants;
import org.apache.sling.cms.core.models.RedirectAttribute;
import org.apache.sling.cms.core.models.RedirectAttribute.LEVEL;
import org.apache.sling.cms.core.services.FileUploadService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Servlet to upload files. Uses the File Upload Service and sends back either a
 * 200 or 500 response.
 */
@SlingServlet(paths = CMSConstants.SERVLET_PATH_ADMIN + "/uploadfile")
public class FileUploadServlet extends SlingAllMethodsServlet {

	private static final Logger log = LoggerFactory.getLogger(FileUploadServlet.class);

	private static final long serialVersionUID = -3604511202133518674L;

	/**
	 * File Upload service to handle the upload.
	 */
	@Reference
	private FileUploadService fileUploadService;

	/**
	 * Handle POST request and send appropriate response after file is uploaded.
	 */
	@Override
	protected void doPost(SlingHttpServletRequest request, SlingHttpServletResponse response)
			throws ServletException, IOException {

		final String returnUrl = request.getParameter(CMSConstants.PARAM_RETURN);
		final String path = request.getParameter(CMSConstants.PARAM_PATH);

		try {
			fileUploadService.uploadFile(request, path);
			RedirectAttribute.setMessage(request, LEVEL.success, "Asset uploaded successfully!");
		} catch (Exception e) {
			log.warn("Exception uploading file", e);
			RedirectAttribute.setMessage(request, LEVEL.danger, "Asset upload failed!");
		}
		response.sendRedirect(returnUrl);
	}
}