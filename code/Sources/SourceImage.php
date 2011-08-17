<?php

class SourceImage extends DataObject  {
	
		static $api_access = true;
   function canView() { return true; }
   
   
	static $db = array(
	 'Keywords' => 'Text',
	 'Transcript' => 'HTMLText'

	);
	
	static $has_one = array(
		 'Image' => 'File',
		  'mySource' => 'SourceImages'

							  
	);
	
	  
    static $searchable_fields  = array(
		'Transcript'
	);
	
	
	static $summary_fields = array(
		'mySource.Name','Image.Filename'
	);
		
		
		
public function getCustomSearchContext() {
		
		$fields = $this->scaffoldSearchFields(array(
			'restrictFields' => array('Transcript')
		));
		
		
		$filters = array(
			//'mySource.Name' => new PartialMatchFilter('mySource.Name'),
			'Transcript' => new PartialMatchFilter('Transcript'),
		);
		return new SearchContext(
			$this->class, 
			$fields, 
			$filters
		);
	}
	
	
	
	public function getCMSFields_forPopup()
	
		
	{
		
		 $fields = parent::getCMSFields();
		$fields->removeByName('Transcription');

	  	//$fields->removeByName('Transcript'); 


		 //$field->add = new SimpleHTMLEditorField('Transcript','Enter some content', array ());
		//$fields = new FieldSet();
		//$fields->push(new TextareaField('Keywords'));
		//$fields->push(new ImageField('Image'));
		
		return $fields;
		
			
	}
	
	
	
}



?>
