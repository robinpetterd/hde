<?php 

class EventRelationship extends DataObject {
 
 	static $api_access = true;
   function canView() { return true; }
   
  static $db = array(
					 
		//'Name' => 'Varchar',

		 'Assumed' => 'Boolean',
		 'Narrative' => 'Text'
	 );
  
  
	static $has_one = array(
		
		'Relative' => 'Person',
	    'Type' => 'RelationshipTypes',

   );
	
   static $many_many = array(
			'AssumedType' => 'AssumedTypes',
   );

	static $belongs_many_many = array(
			'EventData' => 'EventData'				  
	);
	 
	 static $default_sort = "Created DESC";
	 
   	function getmyName() {
		
		$myName = $this->Type()->Name  . ' : ' . $this->Relative()->Name  ;
		 return $myName;
	}


   	

	 
	
	function getMyType() {
		$myType = $this->Type()->Name ;
		//Debug::show($myType);
		 return $myType;
	}
	
	
	function getMyEvents() {
		
		//Debug::show(Session::get("Current.Event"));
		
		$rel = new DataObjectSet();
		$types  =  new DataObjectSet();

		$CurrrentEvent =  Session::get("Current.Event"); 
		
		$myEvents = $this->EventData();
		
	 		foreach ($myEvents as $data) {
				
				//Debug::show($data); 
				//Debug::show($data->EventID); 
			
				if ($data->EventID ==  $CurrrentEvent ) {
					//Debug::show('found');
					//$rel->push($data);
					
					 $record = array(
      					'Type' => $this,
    				 	'Relative' => $data,
   					);
					 
					 $rel->push(new ArrayData($record));
					 
					 
					// $record->push($data);
				 	// $record->push($this);
    				 	
					//$rel->push($record);  
					
				}
	 		}
		
		return $rel;
	}
	
	

	
/*HACK This get the relationship for display in xml for the new viz.  It's is a bit of hack but it works !!! it would be better if the formatting was the template*/ 
   function getDisplayXML() {
				
				$eventDataSet = DataObject::get(
												 "EventData",
												 "EventData_Relationships.EventRelationshipID = {$this->ID}",
												 "",
												 "LEFT JOIN EventData_Relationships ON EventData.ID =  EventData_Relationships.EventDataID
												  ",
												 ""
											
										);
				
			   $theresult = ''; 
			  if($eventDataSet) {	
			  
			  foreach ($eventDataSet as $data) {
			 $theresult .= '<edge type="' . $this->Type()->Name . '" fromID="' . $this->Relative()->ID . '" toID="' . $data->KnownAs()->ID .'"  thickness="' . $this->Type()->thickness . '" color="' . $this->Type()->color .'" alpha="' . $this->Type()->alpha . '" > </edge>'; 
					   
			   	}
			  }


			
		//Debug::show($myType);
		 return  $theresult ;
	}
	
	
	




		
	function  getCMSFields() {
		  
			 $fields = parent::getCMSFields();			
			
			
			 $fields->removeByName('Type');
			  $fields->removeByName('Relative');
			  $fields->removeByName('Assumed');
			  
			  
			   $fields->removeByName('Narrative');


			 /* --- Just a simple pull down menu for the moment becaues the Data Object javascript isn't working --*/
			 
			 	 $locs= DataObject::get('Person');
				 $locs->sort("Name", "ASC");
				 $map = $locs->toDropDownMap('ID', 'Name');
				 $dropdownfield = new DropdownField("RelativeID", "Relative", $map);
				 $fields->addFieldToTab("Root.Main", $dropdownfield ); 
					
			
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
							   $title = "Types of Assumptions",
							   $source =  $aTypes,
							   $value = "1"
							)
					);
				
			
			 
					
		   $fields->addFieldToTab("Root.Main", new TextField(
				   $name = 'Narrative',
				   $title = '[Narrative]',
				   $value = ''
			  ));
				
				
				
				
			  return $fields;
   }
   
	public function populateDefaults(){
    	parent::populateDefaults();

			
	}
   
   function onBeforeWrite() {
   		
		//Debug::show($this->Relative);
	
		// $tmpName = DataObject::get_one('Person',"Name = $this->Relative.Name" );

		 //$this->Name = $tmpName->Name;
		
    	parent::onBeforeWrite();
}
  
  
   
 
};

?>
