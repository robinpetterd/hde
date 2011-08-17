<?php

class SourceImages extends Sources {
	
	static $db = array(
	 'Archive' => 'Varchar',
	 'Code' => 'Varchar',
	 
	
	);
	
	static $has_many = array(
		'mySourceImages' => 'SourceImage'
							  
	);
	
	
	static $has_one = array(
		'AllAsZip' => 'File',

							  
	);
	
	
	static $searchable_fields = array(
       'Name'
   );
   
   
    static $summary_fields = array(
		'Name'
	);
	
	

	function IsThereTranscripts() {
		
	  $dataTranscripts = DataObject::get(
							"SourceImage",
							 "mySourceID  = {$this->ID} AND Transcript IS NOT NULL AND Transcript != '<p></p>' ",
							 "",
							 "",
							 ""
							 );

		//Debug::show($dataTranscripts);
		
		if (  $dataTranscripts ) { 
			$result = "yes";
		} else {
			$result = "no";
		}
 		
		
	 	return $result;	
	}
		
		
	
	function getCMSFields() {
		
		$fields = parent::getCMSFields();
		$fields->removeByName('mySourceImages');
		$fields->removeByName('Transcription');
		
		$imageManager = new  ImageDataObjectManager(
				$this,
				'mySourceImages',
				'SourceImage',
				'Image',
				array('Keywords' => 'Keywords','Transcript' => 'Transcript'), // Headings 
			'getCMSFields_forPopup' 
	  	);
		
			$imageManager->allowUploadFolderSelection();
			
		$fields->addFieldToTab("Root.Images", $imageManager);
		
		// Add a transcripts field 
	
		
		$fields->addFieldToTab("Root.Transcription", new  TextareaField(
   					"Transcription","Transciption",$rows = 40));

				
		return $fields;
	}
	
	
	
}



?>
