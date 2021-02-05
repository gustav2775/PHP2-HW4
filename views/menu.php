<?php
$menu = [
    [
        'href' => '/',
        'name' => 'Главная',
    ],
    [
        'href' => '/?c=gallery',
        'name' => 'Галерея',
    ],
    [
        'href' => '/?c=catalog',
        'name' => 'Каталог',
    ],
    [
        'href' => '/?c=feedback',
        'name' => 'Отзывы',
    ],
    [
        'href' => '/?c=basket',
        'name' => 'Корзина count ',
    ]
];

//Костыль для вывода колличества товаров в корзине, не получается втавлять динамически данные колличесва.
// По какой то причине при отрисовке заментит переменную.
$menu[5]['name'] = str_replace("count", $quantity, $menu[5]['name']);

function renderMenu($menu)
{
    $html = '<ul>';
    foreach ($menu as $item) {
        $html .= '<li>';
        extract($item);
        $html .= '<a href="' . $item['href'] . '">' . $item['name'] . '</a>';
        if (isset($item['submenu'])) {
            $html .=  renderMenu($item['submenu']);
        }
        $html .= '</li>';
    }
    return $html .= '</ul>';
}

?>

<div class="container">
    <nav>
        
        <?= renderMenu($menu) ?>
    </nav>
</div>