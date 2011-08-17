<?php 

//A simple object stores our references  
class Reference extends Sources {
 
   static $db = array(
      'Name' => 'Text',
   );

	static $has_one = array(
   );
	 
	 static $belongs_many_many = array(
      'InformationPages' => 'InformationPage'
   );
		
		
  
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
	
	
	
	
 
};

?>
