<?php 

class Vogage extends DataObject {
 
   static $api_access = true;
   function canView() { return true; }


            
    static $db = array(
            //"Sort" => "Int",
            
            'Name'=>'Text'
   );


   static $has_one = array(
   	
         // 'Vogage' => 'Vogage', // TODO - build this data type
	
   );
   
  static $has_many = array(
        
   );	  
   		
  static $many_many = array(	
       
        'WayPoints' => 'WayPoint'
   );
	
		
  static $searchable_fields = array(
       'Name'
  );
 
   
									
  static $summary_fields = array(
      'Name'
  );
	
	
 
 	
	


function onBeforeWrite() {
   		
	  
    	parent::onBeforeWrite();
}
  




	
 function getCMSFields() {
		   
			
			 $fields = parent::getCMSFields();
		 	
			  
			  return $fields;
   }
   
   
function removeFields( $fields) {
		  
			 
			 $fields = parent::getCMSFields();
		 
	 		//$fields->removeByName('Event'); //We remove this event at this stage because in actual data it's harded wired. 
			//$fields->removeByName('Relationships');
			//$fields->removeByName('Groups');
		        //$fields->removeByName('SourceFile');
				
			  return $fields;
   }
		

 
};

?>