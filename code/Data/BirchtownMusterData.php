<?php 

class BirchtownMusterData extends EventData {
 
   
    static $db = array(
      
	  'FirstName' => 'Varchar', //From the Muster 
	  'LastName' => 'Varchar', //From the Muster 
  	  'Age' => 'Float', //From the Muster
	  'Occupation' => 'Text', //From the Muster
	  
	  'Remarks' => 'Text', ////From the Muster
	  
	  'Order' =>'Int', //What order did they appear in 
	  'FamilyGroup' => 'Int', //What family group are they by number
	  
	  	  'Narrative' => 'Text',  //What the data entry person thought

   );


   static $has_one = array(
		 'CompanyTheyAreNowWith' => 'myGroups' //So we can show the current grouping of people 
   );
   	
 
  
  
	static $many_many = array(
			'TravelingWith'=>'Person',//So we can show the family grouping maybe this needs a relationships as well		
		    'Owner' => 'Owner', //This the same as the Owner in the BON I think. 
		    'CompaniesTheyBelongTo' => 'myGroups',  //This is the company they said that there where once part of

		);



  static $searchable_fields = array(
	   'FirstName', 'LastName'

   );
 
   

									
    static $summary_fields = array(
	 'KnownAs.Name','FirstName', 'LastName'

   );
	
	
	function getTraveling() {
	
	$resultDataObjectSet = new DataObjectSet();
 	
	//Fine which other BON enter have this person listed as 
	
	$eventDataSet = DataObject::get(
			 "BirchtownMusterData",
			 "BirchtownMusterData_TravelingWith.PersonID = {$this->KnownAs()->ID}",
			 "",
			 "LEFT JOIN BirchtownMusterData_TravelingWith ON BirchtownMusterData.ID =  BirchtownMusterData_TravelingWith.BirchtownMusterDataID",
			 ""
											
			);
	
	//Debug::show($eventDataSet);
		
		
	return $eventDataSet;

}

function getCorrectedAge() {
	
			$age = $this->Age ; 
			if(intval($age) - $age == 0) {
							$age = $this->Age ; 
				} else {
							//The number must be some like lik 1.5 so turn that in months.
							$age = $this->Ag ; 
			 			    
							//Debug::show("not a whole number");
			  			    //Debug::show($age);
			
			
							$age = round($this->Age * 12) ; 
							$age = $age . " months";
							  		//	    Debug::show($age);
			
				}

		return $age ;

}

	
	public function populateDefaults(){
			
			parent::populateDefaults();
			//$this->EventID = 8;
  		     
			 $where = 'Name = "Birchtown Muster"';
			
			$ThisEvent = DataObject::get_one('Events', $where );
		  //  Debug::show($ThisEvent);
			
		  	//Debug::show($ThisEvent->ID);
		   $this->EventID = $ThisEvent->ID;

   }


	
function onBeforeWrite() {
   		
	  
	   $WriteCookie = new Cookie;
	  
		 if ($this->FamiliesTheyLivedWith){
			 $WriteCookie->set('Owner', $this->Owner);
			 };

		  if ($this->SourceFileID){
		 			 $WriteCookie->set('SourceFileID', $this->SourceFileID);
		   }; 
	
			 if ($this->KnownAsID){
				 	$WriteCookie->set('KnownAsID', $this->KnownAsID);
		   }; 
		   
		


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

			
			
			$relTablefield = new  ManyManyComplexTableField(
				 $this,
			 	'Relationships',
				'EventRelationship',
				 array('myName'=>'Name', 'ID'=>'Relationship ID','Created'=>'Created'
				 )
			  );
			
				$relTablefield->setAddTitle( 'A Relative' );
				$relTablefield->setPageSize(1000);
			
			  $fields->addFieldToTab("Root.Relatives", $relTablefield);

		
			  $peopleTablefield = new  ManyManyDataObjectManager(
				 $this,
				 'TravelingWith',
				 'Person',
				 array(
				'Name' => 'Name',
				 )
			  );
			  
			  
			 $fields->addFieldToTab("Root.Main",new HeaderField (
 					   
					'Birchtown Muster ' .  $title = $this->FirstName . ' ' . $this->LastName ,
    					
						$headingLevel = "1","FirstName"
			));
			 
						$fields->removeByName('Order');
						$fields->removeByName('Family Group');

			 
				$fields->addFieldToTab("Root.Main", new NumericField(
				   $name = 'Order',
				   $title = "Order ",
				   $value = ""
			  ));
				
				$fields->addFieldToTab("Root.Main", new NumericField(
				   $name = 'FamilyGroup',
				   $title = "Family Group",
				   $value = ""
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
			 $fields->removeByName('Age'); 
			 $fields->removeByName('Occupation'); 


					

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
				 
				 
				$fields->addFieldToTab("Root.Main", new NumericField(
				   $name = 'Age',
				   $title = "Age",
				   $value = ""
			  ));
				
				
			 $fields->addFieldToTab("Root.Main", new TextField(
				   $name = 'Occupation',
				   $title = "Occupation",
				   $value = ''
			  ));
				
				
				
				
				    //----------- Families they lived with   -----------///

			 $fields->removeByName('Owner'); 

			$fields->addFieldToTab("Root.Main",new HeaderField (
 					   $title = "Families they lived with",
    					$headingLevel = "3"
			));
				
				
			 $FamiliesTablefield = new  ManyManyDataObjectManager(
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
			
			
			
			
			
			 $FamiliesTablefield->setFilter(
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
						
						
			$fields->addFieldToTab("Root.Main", $FamiliesTablefield);
			
			
	/*** --------- Now for companies stuff ----------*/ 		   
		$fields->removeByName('Companies They Belong To');


			$fields->addFieldToTab("Root.Main",new HeaderField (
 					   $title = "Companies They Belong To",
    					$headingLevel = "3"
			));
				
			
			$CompaniesOneTablefield = new ManyManyDataObjectManager(
				 $this,
				 'CompaniesTheyBelongTo',
				 'myGroups',
				 array(
				'Name' => 'Name'
				 )
			  );
			
		    $fields->addFieldToTab("Root.Main",$CompaniesOneTablefield);
			
			
				/*** --------- Now for the Remarks ----------*/ 		   

			
			 $fields->removeByName('Remarks'); 
			 
			 $fields->addFieldToTab("Root.Main", new TextField(
				   $name = 'Remarks',
				   $title = "Remarks",
				   $value = ""
			  ));
			 
			 
		
		
		/*** --------- Now for current  companies stuff ----------*/ 		   
				$fields->removeByName('Company They Are Now With');
		
		
					$fields->addFieldToTab("Root.Main",new HeaderField (
							   $title = "Company They Are Now With",
								$headingLevel = "3"
					));
						
					
					$CurrentCompaniesOneTablefield = new HasOneDataObjectManager(
						 $this,
						 'CompanyTheyAreNowWith',
						 'myGroups',
						 array(
						'Name' => 'Name'
						 )
					  );
					
					$fields->addFieldToTab("Root.Main",$CurrentCompaniesOneTablefield);
		
			
			
			
			/*** --------- Now for Traveliing Wit ----------*/ 		   
	
			  $TravelingWithTablefield = new  ManyManyDataObjectManager(
				 $this,
				 'TravelingWith',
				 'Person',
				 array(
				'Name' => 'Name'
				 )
			  );
			 
					
		    $fields->addFieldToTab("Root.TravelingWith", $TravelingWithTablefield);
			
			


			 $fields->removeByName('Narrative');

			$fields->addFieldToTab("Root.Main",new HeaderField (
 					   $title = "------- Our assumptions a ------- ",
    					$headingLevel = "3"
			));
				
			
					
				 $fields->addFieldToTab("Root.Main", new TextField(
				   $name = 'Narrative',
				   $title = '[Narrative]',
				   $value = ''
			  ));
				 
				 
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
