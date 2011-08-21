<?php 

class DataAdmin extends ModelAdmin {
   
  public static $managed_models = array(
     'CustomEvent','EventData'
   );
  

  static $model_importers = array(

   );
  
  
  
  static $url_segment = 'data'; // will be linked as /admin/data
  static $menu_title = 'Data';
 
}


?>
