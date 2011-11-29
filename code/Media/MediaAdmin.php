<?php 

class MediaAdmin extends ModelAdmin {
   
  public static $managed_models = array(
      'MediaAsset'
   );
  
 
  
  static $url_segment = 'media'; // will be linked as /admin/data
  static $menu_title = 'Media';
 
}


?>
