<!DOCTYPE html>

    <?php
      $yearString = date("Y");
      $year = (int)$yearString;
      echo $year;
      ?>
      
      <select name="list_year">	
    
    <?php
for ($i = 0; $i >= -100; $i--) {          
     echo "<option value=";
     echo $year+$i;
     echo ">";
     echo $year+$i;
     echo "年</option>";
      }
    ?>
