<?php 

//A simple object that let a buils a ship and ships journey.
class Ship extends DataObject {
 
 
   	static $api_access = true;
   function canView() { return true; }
   
   
   static $db = array(
      'Name' => 'Varchar',
	  'Captain' => 'Varchar',
	  
	  'Day' => 'Int', 
	  'Month' =>  'Int',
	  'Year' => 'Int', 
	  
	  
	  
   );

	static $has_one = array(
	  'LeavesFrom' => 'Loc',      
	  'Location' => 'Loc'
   );
	 
  
   static $searchable_fields = array(
       'Name','Month','Year','ID'
   );
   
      static $summary_fields = array(
			'Name','Month','Year','ID'
	);
   
    function getCMSFields() {
		   
			 $fields = parent::getCMSFields();
		 
			 
			$fields->addFieldToTab("Root.Main",new HeaderField (
						   $title = "Date",
							$headingLevel = "4"
				),'Day'
			);
							
					
			 /*$fields->removeByName('Day');
			 $fields->removeByName('Month');
			 $fields->removeByName('Year');

			 $multiColumnDate = new CompositeField(
				
			new NumericField(
				   $name = "Day",
				   $title = "Day"
				), 
			new NumericField(
				   $name = "Month",
				   $title = "Month"
				),
			new NumericField(
				   $name = "Year",
				   $title = "Year"
				)
			);
			
			$multiColumnDate->setColumnCount(4);
			 
			$fields-> addFieldToTab('Root.Main', $multiColumnDate );*/ 

			//$fields->addFieldToTab("Root.Main",$date); 
			   
			
			 $fields->removeByName('LeavesFromID');
			 //$fields->removeByName('Destination');

			

			$locs= DataObject::get('Loc');
		 	$locs->sort("Name", "ASC");
		 	$map = $locs->toDropDownMap('ID', 'Name');
		
			$leavesdropdownfield = new DropdownField("LeavesFromID", "Leaves From", $map, $this->LeavesFromID);
		    $fields-> addFieldToTab('Root.Main', $leavesdropdownfield );
			
		 
			$dropdownfield = new DropdownField("LocationID", "Destination", $map, $this->DestinationID);
		    $fields-> addFieldToTab('Root.Main', $dropdownfield );
			
			 	$fields->addFieldToTab("Root.Main",new HeaderField (
						   $title = "Ports",
							$headingLevel = "4"
				),'LeavesFromID'
			);
				
			 
			  return $fields;
   }
   
   public function populateDefaults(){
    	parent::populateDefaults();
		
		
		$this->LeavesFromID = 2; //TODO - get this what from being hardwired  
	
			
			
	}
	
	
   
   
 
};

?>
