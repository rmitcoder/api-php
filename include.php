<?php
header("content-type:text/html;charset=utf-8");
date_default_timezone_get("Australia/Melbourne");
define("ROOT",dirname(__FILE__));

require_once ROOT."/configs/dbconfig.php";

require_once ROOT."/functions/route.func.php";

require_once ROOT."/functions/mysql.func.php";

