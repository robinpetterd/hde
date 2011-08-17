<?php 

class myGroupsAdmin extends ModelAdmin {
   
  public static $managed_models = array(
	'myGroups'
	);
  
  static $url_segment = 'groups'; // will be linked as /admin/products
  static $menu_title = 'Groups';
 
}


?>
