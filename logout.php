<?php
session_start();
if($_SESSION['usertype'] == 'shop'){
    session_destroy();
    unset($_SESSION['userid']);
    header('location:./../customer/index.php');
}else{
    session_destroy();
    unset($_SESSION['userid']);
    header('location:./../customer/index.php');
}
?>