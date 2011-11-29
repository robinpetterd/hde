<?php 
class MediaAsset extends DataObject
{
	static $db = array (
	
		'Title' => 'Text',
		'Description' => 'Text',
		'URL' => 'Varchar(256)',
		'TextAlternative' => 'Text',
		'Length' => 'Varchar',
		'Tags' => 'Text'

	);
	
	static $has_one = array (
		'Media' => 'File',
		'Still' => 'Image',
	);
	
	static $belongs_many_many = array(
    		"InformationPages" => "InformationPage",
		
  	);
	
	public function getCMSFields_forPopup()
	{
		
		
		$fields = parent::getCMSFields();
	 	return $fields;

	
	}
	
		
	public function getCMSFields() {
		   

			
			 $fields = parent::getCMSFields();
			
		



 
			 return $fields;


			 
	 }
}
?>