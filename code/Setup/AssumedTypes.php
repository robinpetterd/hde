<?php 


class AssumedTypes extends DataObject {
 
 	static $api_access = true;
   function canView() { return true; }
   
   static $db = array(
      'Name' => 'Text'
   );
 
 static $belongs_many_many = array(
			'EventRelationships' => 'EventRelationship',	
	);
 
 
   static $searchable_fields = array(
   'Name' );
   
  
      static $summary_fields = array(
   'Name','ID'
   );
   
   
   
	 
};

?>
