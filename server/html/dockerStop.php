<html>
<body>
<?php
echo '<pre>';
        $url =  "//{$_SERVER['HTTP_HOST']}{$_SERVER['REQUEST_URI']}";
        $escaped_url = htmlspecialchars( $url, ENT_QUOTES, 'UTF-8' );
        $url_components = parse_url($url);
        parse_str($url_components['query'], $params);

        $command = "sudo docker stop {$params['name']} && sudo docker rm -f {$params['name']}";
        system ($command, $retval);
        if ($retval == "0") {
                echo 'Container is successfully stopped and removed!';
        } else if ($retval == "126") {
                echo 'Permission Error! Give sudo!';
        } else if ($retval == "1") {
                echo '
Container not found!
Run the container: ' . $_SERVER['HTTP_HOST'] . '/dockerStart.php?memory=500m&cpus=1&device-write=10mb';
        } else {
                echo 'Something went wrong, Debug Time!!';
        }
        echo '
        </pre>
        <hr />Command: '. $command . '
        <hr />Return value: ' . $retval;
?>
</html>
</body>