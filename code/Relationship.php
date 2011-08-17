<?php 

//Our Relationship type 

class Relationship extends DataObject { 

	static $api_access = true;
   function canView() { return true; }
   
   
	static $has_one = array(
	       'Type' => 'RelationshipTypes',
	  		'SourceFile' => 'File',
	  		'Source' => 'Sources',

			//'Relative' => 'Person' //for use on our eventdata when 
   );
	
	static $has_many = array(
							 

	);
		
		
	static $many_many = array(
    	'Relatives' => 'Person',
		'AssumedType' => 'AssumedTypes',

  	);
	   
    static $db = array(
	  'Assumed' => 'Boolean',
	   'Narrative' => 'Text'

   );
	
   static $searchable_fields = array(
    'ID','Type.Name',);
   
   static $summary_fields = array(
	 'ID' , 'Type.Name',
   );
	
 function getRelative(){
	 
	 $currentPerson = Session::get('CurrentPerson');
	 
		//Debug::show($this->Relatives());


	 foreach ($this->Relatives() as $Relative) {
		// debug::Show($currentPerson);

		 if($Relative->ID != $currentPerson){
			// debug::Show($Relative);
	 		return $Relative;
		 }
	 }
 }
 
	function getCMSFields() {
		   
			 /*
			 BUG - FUTURE this is a work around to get stuff work with 
			 */
			 
			 $fields = parent::getCMSFields();
		 
			  //Remove all the old bits. 
			  $fields->removeByName('Type');
			  $fields->removeByName('Relative');

			  $fields->removeByName('Assumed');
			  $fields->removeByName('Source File');
			  $fields->removeByName('Source');
			 
			 $fields->removeByName('Relatives');
			 
			 
			 $fields->removeByName('Narrative');
			 
			$fields->removeByName('AssumedType');






  
			   
			   
		 $fields->addFieldToTab("Root.Main",new HeaderField (
 					   $title = "Choose the relatives from table below",
    					$headingLevel = "3"
			));
			
		 
		   $peopleTablefield = new  ManyManyDataObjectManager(
				 $this,
				 'Relatives',
				 'Person',
				 array(
				'Name' => 'Name'
				 )
			  );
			 
			 $peopleTablefield->setFilter(
				   'Name', // The field we're filtering
				   'Filter by possible names', // The label for the filter field
				   array(
					 '',
					
					   
				   ) // The dropdown map of values => display text. The values will be matched against the Author field.
				);
						
						
					
		    $fields->addFieldToTab("Root.Main", $peopleTablefield);




			//Build the tupe Drop Down for the.  	
			 $types = new TypeDropdown('TypeID', 'What Type of relationship is this ', 'RelationshipTypes');
		     $fields->addFieldToTab("Root.Main",  $types);
			 
			 //Make our person Two Heading
			
			
			
			 $fields->addFieldToTab("Root.Main", new CheckboxField(
				   $name = "Assumed",
				   $title = "Has this relationship been assumed"
				   )
				);	
			 
			 
			 			 $aTypes= DataObject::get('AssumedTypes');


									
					$fields->addFieldToTab("Root.Main",new CheckboxSetField(
							   $name = "AssumedType",
							   $title = "Tupes of Assumptions",
							   $source =  $aTypes,
							   $value = "1"
							)
					);
				
			
			 
					
		   $fields->addFieldToTab("Root.Main", new TextField(
				   $name = 'Narrative',
				   $title = 'Relationship[Narrative]',
				   $value = ''
			  ));
				
			
				
			 
			 // now for the source file 
			 
			  $myimage  = new FileIFrameField('SourceFile','Choose the source file'); 
  			  $fields->addFieldToTab("Root.Main",  $myimage);
			  
			
			// now for the sources  
								
			$source = DataObject::get('Sources');
			
			$map = $source->toDropDownMap('ID', 'Name');
			
			 $dropdownfield = new DropdownField("SourceID", "What is the source", $map);
			 $fields->addFieldToTab("Root.Main",   $dropdownfield);
			 
			 
			 
				

			
			  return $fields;
   }
   
	public function populateDefaults(){
    	parent::populateDefaults();

			
	}
   
  
   
 
};

?>
