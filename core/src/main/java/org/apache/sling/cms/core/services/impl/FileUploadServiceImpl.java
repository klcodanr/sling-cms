
package org.apache.sling.cms.core.services.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

import javax.jcr.Node;
import javax.jcr.RepositoryException;

import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Service;
import org.apache.jackrabbit.commons.JcrUtils;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.request.RequestParameter;
import org.apache.sling.api.request.RequestParameterMap;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ResourceResolver;
import org.apache.sling.cms.core.services.FileUploadService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Service to handle file uploading.
 */
@Service(value = FileUploadService.class)
@Component(immediate = true)
public class FileUploadServiceImpl implements FileUploadService {

	/**
	 * The logger.
	 */
	private static final Logger log = LoggerFactory.getLogger(FileUploadServiceImpl.class);

	public void uploadFile(SlingHttpServletRequest request, String path) throws IOException {
		final RequestParameterMap params = request.getRequestParameterMap();
		ResourceResolver resolver = request.getResourceResolver();

		for (final Map.Entry<String, RequestParameter[]> pairs : params.entrySet()) {
			final RequestParameter[] pArr = pairs.getValue();
			final RequestParameter param = pArr[0];

			if(!param.isFormField()){
				uploadFile(param, resolver, path);
			}
		}
	}

	public void uploadFile(RequestParameter param, ResourceResolver resolver, String path) throws IOException {

		if (!param.isFormField()) {
			final String name = param.getFileName();
			final String mimeType = param.getContentType();

			try {
				final InputStream stream = param.getInputStream();

				Resource imagesParent = resolver.getResource(path);
				JcrUtils.putFile(imagesParent.adaptTo(Node.class), name, mimeType, stream);
				resolver.commit();

			} catch (RepositoryException e) {
				log.error("Could not save file to repository.", e);
				throw new IOException("Could not save image to repository.", e);
			}
		} else {
			throw new IOException("Parameter " + param.getName() + " is not a file");
		}
	}

}