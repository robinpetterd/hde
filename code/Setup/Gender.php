<?php 


class Gender extends DataObject {
 
 	static $api_access = true;
   function canView() { return true; }
   
   
   static $db = array(
      'Name' => 'Varchar'
   );
 
   static $searchable_fields = array(
   'Name' );
   
  
      static $summary_fields = array(
   'Name','ID'
   );
   
   
   
	 
};

?>
