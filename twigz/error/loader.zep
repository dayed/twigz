namespace TwigZ\Error;

/**
 * Exception thrown when an error occurs during template loading.
 *
 * Automatic template information guessing is always turned off as
 * if a template cannot be loaded, there is nothing to guess.
 * However, when a template is loaded from another one, then, we need
 * to find the current context and this is automatically done by
 * Twig_Template::displayWithErrorHandling().
 *
 * This strategy makes Twig_Environment::resolveTemplate() much faster.
 *
 * @author Fabien Potencier <fabien@symfony.com>
 */
class Loader extends TwigZ\Error
{
    public function __construct(message, lineno = -1, filename = null, <\Exception> previous = null)
    {
        parent::__construct(message, false, false, previous);
    }
}
