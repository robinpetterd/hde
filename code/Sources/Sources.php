<?php
/**
 * Defines the Source type - so we can the call on this later.
 */
class Sources extends  DataObject {
	
		static $api_access = true;
 
 	  function canView() { return true; }
   
   
   static $db = array(
	      
		  'Name' => 'Text',	
		  'Featured' => 'Boolean',
		  
		 'Day' => 'Int', 
	  	 'Month' =>  'Int',
	  	 'Year' => 'Int', 
		 'YearEnded' => 'Int', 

		
		  'Explaination' => 'Text',
		 'Transcription' => 'HTMLText'



   );
   static $has_one = array(
						   	     'Icon' => 'Image'

   );
   
}
 
 static $searchable_fields = array(
       'Name'
   );
   
    static $summary_fields = array(
     'Name'
   );
  
  	function getCMSFields() {
		
		$fields = parent::getCMSFields();
		
		$fields->removeByName('Transcription');
			
			
		return $fields;
	}
	
	
  
  
 
?>