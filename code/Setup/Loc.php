<?php 

class Loc extends DataObject {
 
 	static $api_access = true;
   function canView() { return true; }
   
    
   static $db = array(
      	'Name' => 'Varchar',
		'Latitude' => 'Float',
	    'Longitude' => 'Float',
		
		'Assummed' => 'Boolean',
		 'Information' => 'Text',




	  );
   
      static $has_many = array(
		 'Ship'=>'Ship',
		 'Events' => 'Events',
      );	  
   	

 
	
  
   static $searchable_fields = array(
   'Name');
   
  
      static $summary_fields = array(
   'Name' ,'ID'
   );
   
 
 	
 function getCMSFields() {
		   
		
			 
			 $fields = parent::getCMSFields();
		 

	 		$fields->removeByName('Ship'); //We remove this event at this stage because in actual data it's harded wired. 
		        $fields->removeByName('Events');
                        
                        
			  
					
			  return $fields;
   }
   
   

};

?>
