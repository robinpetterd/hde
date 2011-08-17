<?php 

class TithablesData extends EventData {
 
   
    static $db = array(
      
	  'FirstName' => 'Varchar', //From the List
	  'LastName' => 'Varchar', //From the List
	  
	  'Narrative' => 'Text', //From the List
   );


   static $has_one = array(
		 'Owner' => 'Owner', //This the same as the Owner in the BON I think. 
   );
   	
 
  
  
	static $many_many = array(
		);



  static $searchable_fields = array(
	   'ID','FirstName', 'LastName',

   );
 
   

									
    static $summary_fields = array(
	 'KnownAs.Name','FirstName', 'LastName','ID'

   );
	
	
	public function populateDefaults(){
			
			parent::populateDefaults();
			//$this->EventID = 8;
  		     
			// $where = 'Name = "Birchtown Muster"';
			
			//$ThisEvent = DataObject::get_one('Events', $where );
		  //  Debug::show($ThisEvent);
			
		  	//Debug::show($ThisEvent->ID);
		   //$this->EventID = $ThisEvent->ID;

   }


	 function getSlaves() {
		 
		 	
			$dataSet = DataObject::get(
									"TithablesData",
									 "OwnerID = {$this->OwnerID} and EventID =  {$this->EventID} ",
									 "",
									 "",
									 ""
									 );
			
			return $dataSet; 
		 
	 }
	 
	 
	 
function onBeforeWrite() {
   		
	  
	   $WriteCookie = new Cookie;
	  
		/* if ($this->FamiliesTheyLivedWith){
			 $WriteCookie->set('FamiliesTheyLivedWithID', $this->FamiliesTheyLivedWith);
			 };

		  if ($this->SourceFileID){
		 			 $WriteCookie->set('SourceFileID', $this->SourceFileID);
		   }; 
	
			 if ($this->KnownAsID){
				 	$WriteCookie->set('KnownAsID', $this->KnownAsID);
		   }; 
		   */
		


    	parent::onBeforeWrite();
		
		
}
  
  
	
 function getCMSFields() {
		   
			 /*
			 BUG - FUTURE this is a work around to get stuff work with 
			 */
			 
			 $fields = parent::getCMSFields();
		 	 		
			 
			 $fields = $this->removeFields($fields); 
			 /*---- Add a title to this page - because all of these pages will start to look that same */
			
			$fields->removeByName('Relationships');

			
			$relTablefield = new ManyManyDataObjectManager(
				 $this,
			 	'Relationships',
				'EventRelationship',
				 array('myName'=>'Name', 'ID'=>'Relationship ID'
				 )
			  );
				
			  $fields->addFieldToTab("Root.Relatives", $relTablefield);


			 $fields->addFieldToTab("Root.Main",new HeaderField (
 					   
					'Tithables ' .  $title = $this->FirstName . ' ' . $this->LastName ,
    					
						$headingLevel = "1","FirstName"
			));
			 
			$fields->removeByName('Known As');

		

			$fields->addFieldToTab("Root.Main",new HeaderField (
 					   $title = "Who is this person known as",
    					$headingLevel = "3"
			));
					
			
			$knowasOnTablefield = new HasOneDataObjectManager(
				 $this,
				'KnownAs',
				'Person',
				 array(
				'Name' => 'Name'
				 ),'CMSFields_forPopup'
			  );
			
			
			  $Cookie = new Cookie;
			 
			 if ($Cookie->get('LastPersonID')) { 
				$LastPerson =  $Cookie->get('LastPersonID');
				$LastPersonRecord = DataObject::get_by_id('Person', $LastPerson);
				$LastPersonName = $LastPersonRecord->Name;  
			 } else {
				 
				 $LastPerson = 0; 
				 $LastPersonName = 'no last person found'; 
				 
			 };
				
				
						
				$knowasOnTablefield->setFilter(
				   'Name', // The field we're filtering
				   'Filter by possible names', // The label for the filter field
				   array(
						 
					' '  =>  ' ',
					$LastPersonName => $LastPersonName,
					 $this->FirstName . ' ' . $this->LastName  => $this->FirstName . ' ' . $this->LastName ,
					  $this->FirstName   => $this->FirstName  ,
					  $this->LastName  =>  $this->LastName ,
  
				   ) // The dropdown map of values => display text. The values will be matched against the Author field.
				);
				
				
		    $fields->addFieldToTab("Root.Main", $knowasOnTablefield);



    //----------- First and Last name, description   -----------///

				 
			 $fields->removeByName('First Name');
			 $fields->removeByName('Last Name');


					

			 $fields->addFieldToTab("Root.Main", new TextField(
				   $name = 'FirstName',
				   $title = "First Name",
				   $value = ""
			  ));
			
			$fields->addFieldToTab("Root.Main", new TextField(
				   $name = 'LastName',
				   $title = "Last Name",
				   $value = ""
			  ));
				 
				
				
				
				    //----------- Families they lived with   -----------///

			 $fields->removeByName('Owner'); 

			$fields->addFieldToTab("Root.Main",new HeaderField (
 					   $title = "Owner",
    					$headingLevel = "3"
			));
				
				
			 $OwnerTablefield = new HasOneDataObjectManager(
				 $this,
				 'Owner',
				 'Owner',
				 array(
				'Name' => 'Name'
				 ),'CMSFields_forPopup'
			  );


	    	$Cookie = new Cookie;
		
			if ($Cookie ->get('FamiliesTheyLivedWithID'))	{
					$LastFamily= $Cookie ->get('FamiliesTheyLivedWithID'); 
					$LastFamilyRecord = DataObject::get_by_id('Owner', $LastFamily);
				   
					 if ($LastFamilyRecord) {
						 $LastFamilyName =  $LastFamilyRecord->Name; 
					} else { $LastFamilyName = 'no last family found';}  
				   
				} else {
					
					$LastFamily = 0; 
					$LastLastFamilyName = 'no last family found'; 
					
			};
		
		
		   	$Cookie = new Cookie;
		  	
			if ($Cookie ->get('LastOwnerID')) {
				
				
				$LastOwner =  $Cookie ->get('LastOwnerID');
				$LastOwnerRecord = DataObject::get_by_id('Owner',$LastOwner);
				
				if ($LastOwnerRecord) {
					$LastOwnerName =  $LastOwnerRecord->Name; 
				} else {$LastOwnerName ='';} 
				
				} else {
					$LastOwner = 0 ;
					$LastOwnerName =   'no last owner found ';
			 }; 
			
			
			
			
			
			 $OwnerTablefield->setFilter(
				   'Name', // The field we're filtering
				   'Filter by possible names', // The label for the filter field
				   array(
						' '  =>  ' ',
					 $LastOwnerName => $LastOwnerName,
					//  $LastFamilyName => $LastFamilyName,
					$this->FirstName . ' ' . $this->LastName  => $this->FirstName . ' ' . $this->LastName ,
					  $this->FirstName   => $this->FirstName  ,
					  $this->LastName  =>  $this->LastName 

					   
				   ) // The dropdown map of values => display text. The values will be matched against the Author field.
				);
						
						
			$fields->addFieldToTab("Root.Main", $OwnerTablefield);
			
		
			
				/*** --------- Now for the Remarks ----------*/ 		   

			
			 $fields->removeByName('Narrative'); 
			 
			 $fields->addFieldToTab("Root.Main", new TextField(
				   $name = 'Narrative',
				   $title = "Narrative",
				   $value = ""
			  ));
			 
			 
		
		//$fields->removeByName('Event');
		
		
		/*$work = DataObject::get('Events');
			
			$map = $work->toDropDownMap('ID', 'Name');
			
			
			 $dropdownfield = new DropdownField("EventID", "Which Event does this relate to", $map  );
			 $fields->addFieldToTab("Root.Main",   $dropdownfield);
			 
			 
			 */
	
	 $EventTablefield = new HasOneDataObjectManager(
				 $this,
				 'Event',
				 'Events',
				 array(
				'Name' => 'Name'
				 ),'CMSFields_forPopup'
			  );
						
						
			$fields->addFieldToTab("Root.Main", $EventTablefield);
			
			
			
			
        $fields->removeByName('Source');
			 
			 	$fields->addFieldToTab("Root.Main",new HeaderField (
 					   $title = "------- Source ------- ",
    					$headingLevel = "3"
			));
				
			 
			$Cookie = new Cookie;
		
			if ($Cookie ->get('SourceFileID'))	{
					
					$LastSource= $Cookie ->get('SourceFileID'); 
					//$this->SourceFile =  $LastSource; 
					
			} else {$LastSource=0;};
			
			
			 			 
			 $myimage  = new FileIFrameField('SourceFile','Choose the source file'); 
			
			  //$myimage->value = $LastSource; 

				// $myimage::setFolderName()  =  'bon'; 
  			 
			 $fields->addFieldToTab("Root.Main",  $myimage);
			  
			
		

			//$fields->changeFieldOrder('LastName','FirstName');
		
			  return $fields;
   }
   
   

		
			
	


 
};

?>
