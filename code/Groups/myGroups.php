<?php

class myGroups extends DataObject  {
	
	static $api_access = true;
   function canView() { return true; }
   
   
  static $db = array(
      'Name' => 'Varchar',
	  
	  'Day' => 'Int', 
	  'Month' =>  'Int',
	  'Year' => 'Int',
	  
	  	 'Information' => 'Text',

	
   );

	static $has_one = array(
	  'Location' => 'Loc',
	  'Source' => 'Sources', 
	  'SourceFile' => 'File',
   );
	
	
	static $many_many = array(
		'People'=>'Person',
	    'InformationPage' => 'InformationPage',

	);
	

  	
	static $belongs_many_many = array(
		 'Events' => 'Events',
	);
	
	static $searchable_fields = array(
	  'Name' ,'ID',
   );
   

    static $summary_fields = array(
	   'Name','ID',

   );
	
	
	public function getCMSFields_forPopup()
	{
	}
	
	   function getCMSFields() {
		   
			 /*
			 BUG - FUTURE this is a work around to get stuff work with 
			 */
			 
			 $fields = parent::getCMSFields();
		 
		   $fields->removeByName('Events');

			  $fields->removeByName('People');
		 
			  $peopleTablefield = new ManyManyDataObjectManager(
				 $this,
				 'People',
				 'Person',
				 array(
				'Name' => 'Name'
				 )
			  );
			 
			// $peopleTablefield->setAddTitle( 'A Module' );
		 
			  $fields->addFieldToTab("Root.People in this group", $peopleTablefield);
			
		
			
			$locs= DataObject::get('Loc');
		 	$locs->sort("Name", "ASC");
		 	$map = $locs->toDropDownMap('ID', 'Name');
		 	$dropdownfield = new DropdownField("LocationID", "Location", $map);
		    $fields-> addFieldToTab('Root.Main', $dropdownfield, 'SourceID' );
		 
		 		$fields->removeByName('Information Page');

			$infoOnTablefield = new ManyManyDataObjectManager(
				 $this,
				'InformationPage',
				'InformationPage',
				 array(
					'Summary' => 'Summary'
				 )
			  );
			
				
		   $fields->addFieldToTab("Root.Info", $infoOnTablefield);
		 
		 
			  return $fields;
   }
 
 
      
	public function populateDefaults(){
    	parent::populateDefaults();
				
		
		//$this->CountryID = $countries->First()->ID;


		
    	//$this->LastPaid = date("Y-m-d H:i:s");
	
		/*($parent_object = $this->getParent();
		if (is_object($parent_object))
			{
				$this->State = $parent_object->getField('Abbreviation');	
			}*/
			
			
	}
	

	
}



?>
