<?php

require_once('functions.php');
$page_content = compile_template('index.php',
    ['arr' => $arr,
        'advertisement' => $advertisement]);

$layout_content = compile_template( 'layout.php',
    ['page_title'   => 'Главная страница', 'is_auth' => $is_auth,
        'user_avatar' => $user_avatar, 'user_name' => $user_name,
        'page_content'  => $page_content,
        'arr' => $arr
    ]);

print($layout_content);
?>

