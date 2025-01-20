<?php 
  class  db{
    public $mysqli;
    public $query;

    function __construct(){
        $this->mysqli = new mysqli("localhost","pntc","C4xrLRvkiT!Qi)s!","pntc");
        mysqli_query($this->mysqli,"SET NAMES utf8");
        date_default_timezone_set("Asia/Bangkok");
    }
    function select($tables,$row = "*",$where = null){
        $sql =  $where != null ? "SELECT $row FROM $tables $where" : "SELECT $row FROM $tables";
        $result = $this->mysqli->query($sql);
        if(!$result){
            $this->mysqli->error;
        }else{
            return $result;
        }
    }
    function insert($table,$par = []){
        $key = implode(",",array_keys($par));
        $val = implode("','",$par);
        $sql = "INSERT INTO $table($key) VALUES ('$val') ";
        $this->query = $this->mysqli->query($sql);
        return;
    }
    function insertwhere($table,$par = [],$where){
        $key = implode(",",array_keys($sql));
        $val = implode("','",$par);
        $sql = "INSERT INTO $table($key) SELECT '$val' WHERE NOT EXISTS $where";
        $rowinsert = $this->mysqli->affected_rows;
        return $rowinsert;
    }
    function update($table,$par = [],$id){
        $args = [];
        foreach($par as $key => $val){
            $args[] = "$key = '$val'";
        }
        $sql = "UPDATE $table SET ".implode(",",$args)."WHERE $id";
        $this->query = $this->mysqli->query($sql);
        return;
    }
    function delete($table,$id){
        $sql = "DELETE $table WHERE $id";
        $this->query = $this->mysqli->query($sql);
        return;
    }
    function uploadfile($file){
        $e = explode(".",$file['name']);
        $ex = strtolower(end($e));
        $fileN = rand() . "." .  $ex;
        $fileP = "./../img/" . $fileN;
        move_uploaded_file($file['tmp_name'],$fileP);
        return $fileN;
    }
    function uploadfile2($file){
        $e = explode(".",$file['name']);
        $ex = strtolower(end($e));
        $fileN = rand() . "." .  $ex;
        $fileP = "./../img/" . $fileN;
        move_uploaded_file($file['tmp_name'],$fileP);
        return $fileN;
    }
    function geterror(){
        return $this->mysqli->error;
    }
    function checklogin(){
        if(!isset($_SESSION['userid'])){
            header("location:./../customer/index.php");
        }else{
            return;
        }
    }
    function checkshop(){
        if(!isset($_SESSION['userid'])){
            header("location:./../shop/index.php");
        }else{
            return;
        }
    }
    function setalert(){
        $_SESSION[$key] = "$val";
        echo "<script>window.location.href='".$_SERVER['REQUEST_URI']."'</script>";
    }
    function loadalert(){
        if(isset($_SESSION['success'])){ ?>
          <div class="alert alert-success alert-dismissible fade show">
             <?= $_SESSION['success']; unset($_SESSION['success']) ?>
             <button type="button" class="btn btn-close" data-bs-dismiss="alert"></button>
          </div>
        <?php }
        if(isset($_SESSION['error'])){ ?>
          <div class="alert alert-danger alert-dismissible fade show">
             <?= $_SESSION['error']; unset($_SESSION['error']) ?>
             <button type="button" class="btn btn-close" data-bs-dismiss="alert"></button>
          </div>
        <?php }
        if(isset($_SESSION['warning'])){ ?>
        <div class="alert alert-warning alert-dismissible fade show">
           <?= $_SESSION['warning']; unset($_SESSION['warning']) ?>
           <button type="button" class="btn btn-close" data-bs-dismiss="alert"></button>
        </div>
      <?php }
    }
  }
?>