package org.apache.sling.cms.core.services;

import java.io.IOException;

import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.request.RequestParameter;
import org.apache.sling.api.resource.ResourceResolver;

/**
 * Provides the API for service that allows file uploads. Files are mostly
 * images uploaded by the author but could be any file type.
 */
public interface FileUploadService {

	/**
	 * Upload the file(s) from the request and save as a node in the JCR.
	 *
	 * @param request
	 *            The request in order to get the resource resolver.
	 * @param path
	 *            The path of the parent node to save the file under.
	 * @return The path of new file in the JCR.
	 * @throws IOException
	 */
	void uploadFile(SlingHttpServletRequest request, String path) throws IOException;

	/**
	 * Upload the file and save it as a node in the JCR.
	 * 
	 * @param resolver
	 *            the resource resolver to use for the upload
	 * @param param
	 *            the request parameter containing the file
	 * @param path
	 *            The path of the parent node to save the file under.
	 */
	void uploadFile(RequestParameter param, ResourceResolver resolver, String path) throws IOException;
}