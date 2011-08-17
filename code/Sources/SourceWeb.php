<?php

class SourceWeb extends Sources {
	
	static $db = array(
		'URL' => 'Text',
		'DateLastVisited' => 'Date',
		
	);
	
	static $has_many = array(
	);
	
	function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->removeByName('Transcription');
		//$fields->addFieldToTab( 'Root.Content.Main', new TextField( 'URL', 'URL') ,'Content' );
		
		 //$fields->addFieldToTab('Root.Content.Main', new CalendarDateField('DatelastVisited','Date Last Visited '), 'Content');
				
		return $fields;
	}
	
	
	
}



?>
