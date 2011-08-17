<?php 


class WorkFlow extends DataObject {
 
 	static $api_access = true;
   function canView() { return true; }
   
   static $db = array(
      'Name' => 'Varchar'
   );
 
	
	static $has_one = array(
   );
	 
	 
 
 static $has_many = array(
			'People' => 'Person',
	);
	 
	 
	 
  
   static $searchable_fields = array(
       'Name'
   );
   
       static $summary_fields = array(
     'Name','ID'
   );
  
   
 
};

?>
