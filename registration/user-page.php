<?php

require_once '../second_header_extern.php';
require_once '../config/db.php';

?>

</header>
<main>

<?php
session_start();

if(!isset($_SESSION['email'])){
$_SESSION['msg'] = "Du måste logga in först";
header("Location: login.php");
}


 if (isset($_SESSION['success'])) : ?>
    <div class="error success" >
        <h3>
        <?php 
            echo $_SESSION['success']; 
            unset($_SESSION['success']);
        ?>
        </h3>
    </div>
 <?php endif;

if(isset($_SESSION['email'])):
    $email = $_SESSION['email'];
    $sql = "SELECT * FROM webshop_customers WHERE  email='$email' ";
    $stmt = $db->prepare($sql);
    $stmt->execute();
    $user_info;
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        $name = $row['name'];
        $email = $row['email'];
        $phone = $row['phone'];
        $street = $row['street'];
        $zip = $row['zip'];
        $city = $row['city'];

        $user_info = "<ul class='user_info-list'>
        <li class='user_info-list-item'>NAMN: $name</li>
        <li class='user_info-list-item'>E-POST: $email</li>
        <li class='user_info-list-item'>TELEFON: $phone</li>
        <li class='user_info-list-item'>ADRESS: $street</li>
        <li class='user_info-list-item'>POSTNUMMER: $zip</li>
        <li class='user_info-list-item'>ORT: $city</li>
        </ul>
        ";
    }

    $query = "SELECT * FROM webshop_orders WHERE  email='$email' ";
    $statment = $db->prepare($query);
    $statment->execute();
    $productinfo = "";
    $output;
    if($statment->rowCount() > 0){

        $output = "<section class='table_container'>
        <table class='table_orders_user' id='table-user'>
            <tbody>
                <tr class='table_orders_user-row'>
                    <th class='table_orders_user-head'>Order Datum</th>
                    <th class='table_orders_user-head'>Produkter</th>
                    <th class='table_orders_user-head'>Totalpris</th>
                    <th class='table_orders_user-head'>status</th>
                    </tr>";

        while($row_orders = $statment->fetch(PDO::FETCH_ASSOC)){
            $date = date_format(date_create($row_orders['orderdate']), "yy-m-d");
            $products = json_decode($row_orders['products'], true);
            $totalPrice = $row_orders['totalprice'];
            $status = $row_orders['status'];

            if($status == 1){
                $status = "Ny";
            }
            if($status == 2){
                $status = "Behandlas";
            }
            

            
    foreach ($products as $key => $value) {
        $pOutlet="";
        $pPrice="";
        foreach ($value as $ky => $val) {
          if ($ky == "cartQty") {
            $productinfo .= $val . " st ";
          }
          if ($ky == "title") {
            $productinfo .= $val;
          }
          if ($ky == "outletprice") {
            $pOutlet = $val;
          }
          if ($ky == "price") {
            $pPrice = $val;
            if ($pOutlet != null) {
                $productinfo .= " pris " . $pOutlet . " kr (ord pris " . $pPrice . " kr)";
            }
            else {
                $productinfo .= " pris " . $pPrice . " kr";
            }
          }
        }
        $productinfo .= "<br>";
      }
      


     $output.=" <tr class='table_orders_user-row'>
     
     <td class='table_orders_user-cell'> $date</td>
     <td class='table_orders_user-cell'> $productinfo</td>
     <td class='table_orders_user-cell'> $totalPrice  kr </td>
     <td class='table_orders_user-cell'> $status </td>
     </tr>";
        }
        $output .= "</table>";


    }
    $orders_complete = "SELECT * FROM webshop_orderscomplete WHERE  email='$email' ";
    $statment_c = $db->prepare($orders_complete);
    $statment_c->execute();
    
    $productinfo_c ="";
    $show_complete_orders;
    if($statment_c->rowCount() > 0){
        $show_complete_orders = "<section class='table_container'>
        <table class='table_orders_user' id='table-user'>
            <tbody>
                <tr class='table_orders_user-row'>
                    <th class='table_orders_user-head'>Order Datum</th>
                    <th class='table_orders_user-head'>Produkter</th>
                    <th class='table_orders_user-head'>Totalpris</th>
                    <th class='table_orders_user-head'>status</th>
                    </tr>";

                    while($row_orders_complete = $statment_c->fetch(PDO::FETCH_ASSOC)){
                        $date_c = date_format(date_create($row_orders_complete['orderdate']), "yy-m-d");
                        $products_c = json_decode($row_orders_complete['products'], true);
                        $totalPrice_c = $row_orders_complete['totalprice'];
                        $status_c = $row_orders_complete['status'];

                        foreach ($products_c as $key_c => $value_c) {
                            $pOutlet_c="";
                            $pPrice_c="";
                            foreach ($value_c as $ky_c => $val_c) {
                              if ($ky_c == "cartQty") {
                                $productinfo_c .= $val_c . " st ";
                              }
                              if ($ky_c == "title") {
                                $productinfo_c .= $val_c;
                              }
                              if ($ky_c == "outletprice") {
                                $pOutlet_c = $val_c;
                              }
                              if ($ky_c == "price") {
                                $pPrice_c = $val_c;
                                if ($pOutlet_c != null) {
                                    $productinfo_c .= " pris " . $pOutlet_c . " kr (ord pris " . $pPrice_c . " kr)";
                                }
                                else {
                                    $productinfo_c .= " pris " . $pPrice_c . " kr";
                                }
                              }
                            }
                            $productinfo_c .= "<br>";



                    }
                    $show_complete_orders .= " <tr class='table_orders_user-row'>
     
     <td class='table_orders_user-cell'> $date_c</td>
     <td class='table_orders_user-cell'> $productinfo_c</td>
     <td class='table_orders_user-cell'> $totalPrice_c  kr </td>
     <td class='table_orders_user-cell'> Levererad </td>
     </tr>";
                }

    }else{
        $show_complete_orders = "";
    }
    $show_complete_orders .="</table>";



?>

<section class="user_page-container">
<h2 class="user_page-title">Välkommen  <?php echo $name;?>! </h2>
<h3>Dina uppgifter: </h3>
<?php echo $user_info; ?>
<h3 class="user_page-title">Pågående beställningar:</h3>
<?php echo $output; ?>
<h3 class="user_page-title">Slutförda beställningar:</h3>
<?php echo $show_complete_orders; ?>

<a href="logout.php">Logga ut</a>
</section>

<?php endif; ?>



<?php require_once "../footer.php"; ?>