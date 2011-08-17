<?php 

class ListSierraLeone extends EventData {
 
   
    static $db = array(
      
	  'Name' => 'Varchar', 
  	  'Age' => 'Float', 
	  
	  'NumberOfChildren' =>'Text', 
	  'AgeOfEldest' => 'Text', 
	  
	  'Occupation' => 'Text',
	  
	  'Property' => 'Text',  

	  'Narrative' => 'Text',  

   );


   static $has_one = array(
	 	  'WhereTheyWhereBorn' => 'Loc', 
   );
   	
 
  
  
	static $many_many = array(

		);



  static $searchable_fields = array(
	   'Name'

   );
 
   

									
    static $summary_fields = array(
	 'KnownAs.Name','Name'

   );
	
	

  
	public function populateDefaults(){
			
			parent::populateDefaults();
			//$this->EventID = 8;
  		     
			 $where = 'Name = "List of those wishing to go to Sierra Leone"';
			
			$ThisEvent = DataObject::get_one('Events', $where );
		  //  Debug::show($ThisEvent);
			
		  	//Debug::show($ThisEvent->ID);
		   $this->EventID = $ThisEvent->ID;

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

			  
			 $fields->addFieldToTab("Root.Main",new HeaderField (
 					   
					'List of those wishing to go to Sierra Leone. ' .  $title = $this->Name , $headingLevel = "1","Name"
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

				 
			 $fields->removeByName('Name');
			 $fields->removeByName('Age'); 
			 $fields->removeByName('WhereTheyWhereBorn'); 
			 $fields->removeByName('NumberOfChildren'); 
			 $fields->removeByName('AgeOfEldest'); 
			 $fields->removeByName('Occupation'); 
			 $fields->removeByName('Property'); 
	    				

			 $fields->addFieldToTab("Root.Main", new TextField(
				   $name = 'Name',
				   $title = "Name",
				   $value = ""
			  ));
					
				$fields->addFieldToTab("Root.Main", new TextField(
				   $name = 'Age',
				   $title = "Age",
				   $value = ""
			  ));
			  
			$fields->removeByName('Where They Where Born');

		$fields->addFieldToTab("Root.Main",new HeaderField (
 					   $title = "Where where they born",
    					$headingLevel = "3"
			));
			 
			  	$WhereBorn = new HasOneDataObjectManager(
				 $this,
				'WhereTheyWhereBorn',
				'Loc',
				 array(
				'Name' => 'Name'
				 ),'CMSFields_forPopup'
			  );
			
			
		    $fields->addFieldToTab("Root.Main", $WhereBorn);
			  				 
				$fields->addFieldToTab("Root.Main", new NumericField(
				   $name = 'NumberOfChildren',
				   $title = "Number of Children",
				   $value = ""
			  ));
				
		  				 
				$fields->addFieldToTab("Root.Main", new TextField(
				   $name = 'AgeOfEldest',
				   $title = "Age Of Eldest ",
				   $value = ""
			  ));
				
				
			 $fields->addFieldToTab("Root.Main", new TextField(
				   $name = 'Occupation',
				   $title = "Occupation",
				   $value = ''
			  ));
				
				
		 $fields->addFieldToTab("Root.Main", new TextField(
				   $name = 'Property',
				   $title = "Property",
				   $value = ''
			  ));
			  
			  

			 $fields->removeByName('Narrative');

			$fields->addFieldToTab("Root.Main",new HeaderField (
 					   $title = "------- Notes and Assumptions------- ",
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
