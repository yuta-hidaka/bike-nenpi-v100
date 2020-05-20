<!DOCTYPE html>

    <?php
      $yearString = date("Y");
      $year = (int)$yearString;
      ?>
      
<select name="birthday_year">	
    
    <?php
for ($i = 0; $i >= -100; $i--) {          
     echo "<option value=";
     echo $year+$i;
     echo ">";
     echo $year+$i;
     echo "年</option>";
      }
    ?>
</select>  

          
<select name="birthday_month">	
    
    <?php
for ($i = 1; $i <= 12; $i++) {          
     echo "<option value=";
     echo $i;
     echo ">";
     echo $i;
     echo "月</option>";
      }
    ?>
</select>


<select name="birthday_day">	
    
    <?php
for ($i = 1; $i <= 31; $i++) {          
     echo "<option value=";
     echo $i;
     echo ">";
     echo $i;
     echo "日</option>";
      }
    ?>  
    
</select>