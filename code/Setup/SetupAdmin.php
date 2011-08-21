<?php 

class SetupAdmin extends ModelAdmin {
   
  public static $managed_models = array(
   'LocState','LocCounty','LocRegion','LocExact','Loc','Ship','AssumedTypes','RelationshipTypes','Gender','Role','WorkFlow'
   );
  
  static $url_segment = 'setup'; // will be linked as /admin/products
  static $menu_title = 'Setup';
 
}


?>
