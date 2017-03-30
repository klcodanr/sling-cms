package org.apache.sling.cms;

/**
 * Constants used throughout the application.
 */
public class CMSConstants {

	/**
	 * Private constructor to prevent instantiation of class.
	 */
	private CMSConstants() {
	}

	/**
	 * Content path.
	 */
	public static final String CONTENT_PATH = "/content";

	/**
	 * Admin path.
	 */
	public static final String ADMIN_PATH = "/admin";

	/**
	 * Admin path.
	 */
	public static final String ADMIN_SITES_PATH = ADMIN_PATH + "/sites";

	/**
	 * Assets path.
	 */
	public static final String ASSET_PATH = CONTENT_PATH + "/assets";

	/**
	 * Node type base.
	 */
	private static final String NODE_TYPE = "cms";

	/**
	 * Site node type.
	 */
	public static final String NODE_TYPE_SITE = NODE_TYPE + ":site";

	/**
	 * Asset node type.
	 */
	public static final String NODE_TYPE_ASSET = NODE_TYPE + ":asset";

	/**
	 * Page node type.
	 */
	public static final String NODE_TYPE_PAGE = NODE_TYPE + ":page";

	/**
	 * Template node type.
	 */
	public static final String NODE_TYPE_TEMPLATE = NODE_TYPE + ":template";

	/**
	 * Component node type.
	 */
	public static final String NODE_TYPE_COMPONENT = NODE_TYPE + ":component";

	/**
	 * Servlet admin path
	 */
	public static final String SERVLET_PATH_ADMIN = "/admin/bin";

	public static final String PARAM_RETURN = "return";
	public static final String PARAM_PATH = "path";
}