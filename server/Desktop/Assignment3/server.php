<html>
<body>
<?php
echo '<pre>';
    ini_set('memory_limit', '1024M');
    $time1 = microtime(true);
    $url =  "//{$_SERVER['HTTP_HOST']}{$_SERVER['REQUEST_URI']}";
    $escaped_url = htmlspecialchars( $url, ENT_QUOTES, 'UTF-8' );
    $url_components = parse_url($url);
    parse_str($url_components['query'], $params);

    // IO Operation
    $buffer=file_get_contents('../data/data.txt', FALSE, NULL, 0, 10485760);
    $myfile = fopen("../data/writeData.txt", "a") or die("Unable to open file!");
    $loopCount = $params['size']/10; 
    for($i=1;$i<=$loopCount;$i++)
    	fwrite($myfile, $buffer);

    // CPU Operation
    $val=$params['cpuLoad'];
    for($i=1;$i<=$val;$i++)
	    rand();
    
    $time2 = microtime(true);
    $time=$time2-$time1;

    // Output
    echo '
Time taken = ' . $time . 'sec
IO Loop Count = ' . $loopCount . '
</pre>';
?>
</body>
</html>
