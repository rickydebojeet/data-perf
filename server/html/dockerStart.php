<html>
<body>
<?php
echo '<pre>';
        $url =  "//{$_SERVER['HTTP_HOST']}{$_SERVER['REQUEST_URI']}";
        $escaped_url = htmlspecialchars( $url, ENT_QUOTES, 'UTF-8' );
        $url_components = parse_url($url);
        parse_str($url_components['query'], $params);

        // Creating docker command based on the arguments passed in url
        $command = "sudo docker run --privileged -m {$params['memory']} --memory-swap {$params['swap']} --cpus={$params['cpus']} --device-write-bps /dev/sda:{$params['device-io']} --device-read-bps /dev/sda:{$params['device-io']} --name {$params['name']} -d -p {$params['port']}:80 cs681_server:1.0";
        system($command, $retval);
        if ($retval == "0") {
                echo 'Container is running with id shown above!!';
        } else if ($retval == "126") {
                echo 'Permission Error! Give sudo!';
        } else if ($retval == "125") {
                echo '
Container is still running or something went wrong
Check running status :  server-ip/server.php?size=800&cpuLoad=200
Or stop the container: ' . $_SERVER['HTTP_HOST'] . '/dockerStop/php';
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
