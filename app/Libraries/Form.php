<?php
namespace Libs;
use Collective\Html\FormBuilder;
use \RNCryptor\RNCryptor\Encryptor;
use \RNCryptor\RNCryptor\Decryptor;

use BadMethodCallException;
use DateTime;
use Illuminate\Contracts\Routing\UrlGenerator;
use Illuminate\Contracts\Session\Session;
use Illuminate\Contracts\View\Factory;
//use Illuminate\Foundation\Http\Middleware\ConvertEmptyStringsToNull;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\App;
use Illuminate\Support\HtmlString;
use Illuminate\Support\Traits\Macroable;

class Form extends FormBuilder
{
    /**
     * Create a new form builder instance.
     *
     * @param  \Collective\Html\HtmlBuilder               $html
     * @param  \Illuminate\Contracts\Routing\UrlGenerator $url
     * @param  \Illuminate\Contracts\View\Factory         $view
     * @param  string                                     $csrfToken
     */
    public function __construct(HtmlBuilder $html, UrlGenerator $url, Factory $view, $csrfToken, Request $request = null)
    {
        $this->url = $url;
        $this->html = $html;
        $this->view = $view;
        $this->csrfToken = $csrfToken;
        $this->request = $request;
    }
}