<?php

namespace app\controllers;

class Controller
{
    private $defaultLayouts = "index";
    
    public function renderLayouts($template, $params=[])
    {
        return $this->renderVeiws(LAYOUTS . $this->defaultLayouts, [
            'menu' => $this->renderVeiws('menu', $params),
            'content' => $this->renderVeiws($template, $params)
        ]);
    }

    public function renderVeiws($template, $params = [])
    {
        ob_start();
        extract($params);
        $templatePath = TEMPLATE . $template . '.php';
        if (file_exists($templatePath)) {
            include $templatePath;
        }
        return ob_get_clean();
    }
}
