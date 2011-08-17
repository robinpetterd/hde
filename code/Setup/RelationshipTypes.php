<?php 

//A simple object that allow the relationship types to be controlled so new types can be added. 

class RelationshipTypes extends DataObject {
 
 	static $api_access = true;
   function canView() { return true; }
   
   
   static $db = array(
      'Name' => 'Varchar',
	  'thickness' => 'Varchar',
	  'color' => 'Varchar',
	  'alpha' => 'Varchar'

  
   );

	static $has_one = array(
   );
	 
  
   static $searchable_fields = array(
       'Name','ID'
   );
   
  
   
 
};

?>
