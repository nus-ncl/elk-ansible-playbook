<html>

<head>
    <meta charset="UTF-8">
    <title>easy_sql</title>
</head>

<body>
<h1>。</h1>
<!-- sqlmap is not panacea -->
<form method="get">
    input: <input type="text" name="inject" value="1">
    <input type="submit">
</form>

<pre>
<?php
function waf1($inject) {
    preg_match("/set|prepare|rename|alter|select|update|delete|drop|insert|where|\./i",$inject) && die('return preg_match("/set|prepare|rename|alter|select|update|delete|drop|insert|where|\./i",$inject);');
}

if(isset($_GET['inject'])) {
    $id = $_GET['inject'];
    waf1($id);
    $mysqli = new mysqli("127.0.0.1","easysqli1","PLACEHOLDER_EASYSQLI_PASSWORD","supersqli");
  
    $sql = "select * from `words` where id = '$id';";

    $res = $mysqli->multi_query($sql);

    if ($res){
      do{
        if ($rs = $mysqli->store_result()){
          while ($row = $rs->fetch_row()){
            var_dump($row);
            echo "<br>";
          }
          $rs->Close();
          if ($mysqli->more_results()){
            echo "<hr>";
          }
        }
      }while($mysqli->next_result());
    } else {
      echo "error ".$mysqli->errno." : ".$mysqli->error;
    }
    $mysqli->close(); 
}


?>
</pre>

</body>

</html>
