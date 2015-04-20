namespace TwigZ;


/**
 * Stores the Twig configuration.
 *
 */
class Environment
{
	const VERSION = '1.18.1';

	protected charset;
	protected loader;
	protected debug;
	protected autoReload;
	protected cache;
	protected lexer;
	protected parser;
	protected compiler;
	protected baseTemplateClass;
	protected extensions;
	protected parsers;
	protected visitors;
	protected filters;
	protected tests;
	protected functions;
	protected globals;
	protected runtimeInitialized;
	protected extensionInitialized;
	protected loadedTemplates;
	protected strictVariables;
	protected unaryOperators;
	protected binaryOperators;
	protected templateClassPrefix = "__TwigTemplate_";
	protected functionCallbacks;
	protected filterCallbacks;
	protected staging;

		/**
	 * Constructor.
	 *
	 * Available options:
	 *
	 *  * debug: When set to true, it automatically set "auto_reload" to true as
	 *           well (default to false).
	 *
	 *  * charset: The charset used by the templates (default to UTF-8).
	 *
	 *  * base_template_class: The base template class to use for generated
	 *                         templates (default to Twig_Template).
	 *
	 *  * cache: An absolute path where to store the compiled templates, or
	 *           false to disable compilation cache (default).
	 *
	 *  * auto_reload: Whether to reload the template if the original source changed.
	 *                 If you don't provide the auto_reload option, it will be
	 *                 determined automatically based on the debug value.
	 *
	 *  * strict_variables: Whether to ignore invalid variables in templates
	 *                      (default to false).
	 *
	 *  * autoescape: Whether to enable auto-escaping (default to html):
	 *                  * false: disable auto-escaping
	 *                  * true: equivalent to html
	 *                  * html, js: set the autoescaping to one of the supported strategies
	 *                  * filename: set the autoescaping strategy based on the template filename extension
	 *                  * PHP callback: a PHP callback that returns an escaping strategy based on the template "filename"
	 *
	 *  * optimizations: A flag that indicates which optimizations to apply
	 *                   (default to -1 which means that all optimizations are enabled;
	 *                   set it to 0 to disable).
	 *
	 * @param Twig_LoaderInterface $loader  A Twig_LoaderInterface instance
	 * @param array                $options An array of options
	 */

	public function __construct(<\TwigZ\LoaderInterface> loader = null, options = [])
	{
		if (null !== loader) {
			this->setLoader(loader);
		}

		let options = array_merge(array[
			"debug"               => false,
			"charset"             => "UTF-8",
			"base_template_class" => "\\TwigZZ\\Template",
			"strict_variables"    => false,
			"autoescape"          => "html",
			"cache"               => false,
			"auto_reload"         => null,
			"optimizations"       => -1,
		], options);

		let this->debug              = (bool) options["debug"];
		let this->charset            = strtoupper(options["charset"]);
		let this->baseTemplateClass  = options["base_template_class"];
		let this->autoReload         = null === options["auto_reload"] ? this->debug : (bool) options["auto_reload"];
		let this->strictVariables    = (bool) options["strict_variables"];
		let this->runtimeInitialized = false;
		let this->setCache(options["cache"]);
		let this->functionCallbacks = array();
		let this->filterCallbacks = array();

		let this->addExtension(new \TwigZ\Extension\Core());
		let this->addExtension(new \TwigZ\Extension\Escaper(options["autoescape"]));
		let this->addExtension(new \TwigZ\Extension_Optimizer(options["optimizations"]));
		let this->extensionInitialized = false;
		let this->staging = new \TwigZ\Extension\Staging();
	}

	/**
	 * Gets the base template class for compiled templates.
	 *
	 * @return string The base template class name
	 */
	public function getBaseTemplateClass()
	{
		return this->baseTemplateClass;
	}

	/**
	 * Sets the base template class for compiled templates.
	 *
	 * @param string $class The base template class name
	 */
	public function setBaseTemplateClass(className)
	{
		let this->baseTemplateClass = className;
	}

	/**
	 * Enables debugging mode.
	 */
	public function enableDebug()
	{
		let this->debug = true;
	}

	/**
	 * Disables debugging mode.
	 */
	public function disableDebug()
	{
		let this->debug = true;
	}

	/**
	 * Checks if debug mode is enabled.
	 *
	 * @return bool true if debug mode is enabled, false otherwise
	 */
	public function isDebug()
	{
		return this->debug;
	}

	/**
	 * Enables the auto_reload option.
	 */
	public function enableAutoReload()
	{
		let this->autoReload = true;
	}
	
	/**
	 * Disables the auto_reload option.
	 */
	public function disableAutoReload()
	{
		let this->autoReload = false;
	}

	/**
	 * Checks if the auto_reload option is enabled.
	 *
	 * @return bool true if auto_reload is enabled, false otherwise
	 */
	public function isAutoReload()
	{
		return this->autoReload;
	}

	/**
	 * Enables the strict_variables option.
	 */
	public function enableStrictVariables()
	{
		let this->strictVariables = true;
	}

	/**
	 * Disables the strict_variables option.
	 */
	public function disableStrictVariables()
	{
		let this->strictVariables = false;
	}

	/**
	 * Checks if the strict_variables option is enabled.
	 *
	 * @return bool true if strict_variables is enabled, false otherwise
	 */
	public function isStrictVariables()
	{
		return this->strictVariables;
	}

	/**
	 * Gets the cache directory or false if cache is disabled.
	 *
	 * @return string|false
	 */
	public function getCache()
	{
		return this->cache;
	}

	/**
	 * Sets the cache directory or false if cache is disabled.
	 *
	 * @param string|false $cache The absolute path to the compiled templates,
	 *                            or false to disable cache
	 */
	public function setCache(cache)
	{
		let this->cache = cache ? cache : false;
	}

	/**
	 * Gets the cache filename for a given template.
	 *
	 * @param string $name The template name
	 *
	 * @return string|false The cache file name or false when caching is disabled
	 */
	public function getCacheFilename(name)
	{
		

	}
}