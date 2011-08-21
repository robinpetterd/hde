<?php 


class Role extends DataObject {
	
		static $api_access = true;
   function canView() { return true; }
   
 
   static $db = array(
      'Name' => 'Varchar'
   );
 
	
	static $has_one = array(
      'Image' => 'Image'
   );
	 
	 
	 static $has_many = array(
   );
	 
	 
	 
 
  
   static $searchable_fields = array(
       'Name'
   );
   
       static $summary_fields = array(
     'Name','ID'
   );
  
   
 
};

?>
