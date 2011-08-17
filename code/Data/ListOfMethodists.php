<?php 

class ListOfMethodists extends EventData {
 
   
    static $db = array(
      
	  'Name' => 'Varchar', 
	  'Tutor' => 'Boolean',
	  'WhereFrom' => 'Varchar',
	  'AdditionalPerson' => 'Varchar'

  	
   );


   static $has_one = array(
   
   	'AdditionalPersonLink' => 'Person', //Main linkage


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
  		     
			 $where = 'Name = "A List of the names of the people that call themselves Methodists, and the names of their tutors"';
			
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
					'A List of the names of the people that call themselves Methodists, and the names of their tutors ' .  $title = $this->Name , $headingLevel = "1","Name"
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
			
			

				
				
				
		    $fields->addFieldToTab("Root.Main", $knowasOnTablefield);



    //----------- Name   -----------///

				 
			 $fields->removeByName('Name');
			

			 $fields->addFieldToTab("Root.Main", new TextField(
				   $name = 'Name',
				   $title = "Name",
				   $value = ""
			  ));
			
		
			$fields->removeByName('AdditionalPerson');
			

			 $fields->addFieldToTab("Root.Main", new TextField(
				   $name = 'AdditionalPerson',
				   $title = "Additional Person",
				   $value = ""
			  ));

		$fields->removeByName('Additional Person Link');		

			$fields->addFieldToTab("Root.Main",new HeaderField (
 					   $title = "Who should this additional person be linked to",
    					$headingLevel = "3"
			));
					
			
			$linkedTablefield = new HasOneDataObjectManager(
				 $this,
				'AdditionalPersonLink',
				'Person',
				 array(
				'Name' => 'Name'
				 ),'CMSFields_forPopup'
			  );
		
			$fields->addFieldToTab("Root.Main", $linkedTablefield);
			
			 $fields->removeByName('WhereFrom'); 
			 
			   $fields->addFieldToTab("Root.Main", new TextField(
				   $name = 'WhereFrom',
				   $title = "Where From",
				   $value = ""
			  ));

			
			 
		$fields->removeByName('Tutor');

		$fields->addFieldToTab("Root.Main", new CheckboxField(
				   $name = "Tutor",
				   $title = "Tutor"
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
					
			} else {$LastSource=0;};
			
						 
			 $myimage  = new FileIFrameField('SourceFile','Choose the source file'); 
			
  			 
			 $fields->addFieldToTab("Root.Main",  $myimage);
			  			
			//$fields->changeFieldOrder('LastName','FirstName');
		
			  return $fields;
   }
   
   

		
			
	


 
};

?>
