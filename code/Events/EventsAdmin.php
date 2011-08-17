<?php 

class EventsAdmin extends ModelAdmin {
   
  public static $managed_models = array(
      'Events'
   );
  
  static $url_segment = 'events'; // will be linked as /admin/products
  static $menu_title = 'Events';
 
}


?>
