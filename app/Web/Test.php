<?php

/**
 * Sample controller for the main page.
 */

namespace App\Web;

use Springy\Controller;

class Test extends Controller
{
    public function __invoke()
    {
        dd('sadasd');
        $this->createTemplate();
        $this->template->display();
    }
}
