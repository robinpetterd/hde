<?php 

class SourcesAdmin extends ModelAdmin {
   
  public static $managed_models = array(
      'SourceImages','SourceImage','SourceWeb','Reference'
	  );
  
  static $url_segment = 'sources'; // will be linked as /admin/products
  static $menu_title = 'Sources';
 
}


?>
