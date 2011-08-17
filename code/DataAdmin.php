<?php 

class DataAdmin extends ModelAdmin {
   
  public static $managed_models = array(
      'BONData','BirchtownMusterData','TithablesData','SecondBirchtownMusterData','LoyalistClaims','ListSierraLeone','CustomEvent','EventData'
   );
  

  static $model_importers = array(
      'BirchtownMusterData' => 'BirchtownMusterImporter' ,
	  'ListSierraLeone' => 'ListSierraLeoneImporter'
   );
  
  
  
  static $url_segment = 'data'; // will be linked as /admin/data
  static $menu_title = 'Data';
 
}


?>
