<?php 

class CustomEvent extends EventData {
 
   
    static $db = array(
      
	 // 'Name' => 'Text',
	 'Transcript' => 'HTMLText', //// Just a general transcript field 
	 'Narrative' => 'Text',  //What the data entry person thought

   );


   static $has_one = array(
   ); 
  
  
	static $many_many = array(
		);



  static $searchable_fields = array(
									
		'Transcript',


   );
 
   

									
    static $summary_fields = array(
	'KnownAs.Name', 'Event.Name','Transcript',

   );
	
	
	
	
	
  
  
	
 function getCMSFields() {
		   
			 /*
			 BUG - FUTURE this is a work around to get stuff work with 
			 */
			 
			 $fields = parent::getCMSFields();
			 
			// $fields = $this->removeFields($fields); 
			
	
			 /*---- Add a title to this page - because all of these pages will start to look that same */
			
			$relTablefield = new ManyManyComplexTableField(
				 $this,
			 	'Relationships',
				'EventRelationship',
				 array('myName'=>'Name', 'ID'=>'Relationship ID','Created'=>'Created'
				),null// sourceFilter
			  );
				
				$relTablefield->setAddTitle( 'A Relative' );
				$relTablefield->setPageSize(20);
			
			
			  $fields->addFieldToTab("Root.Relatives", $relTablefield);


			
			$fields->removeByName('Known As');

		$fields->addFieldToTab("Root.Main",new HeaderField (
 					   $title = "Known As",
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

   
		
			

			
			 $fields->removeByName('Transcript'); 
			 
			 $fields->addFieldToTab("Root.Main", new TextareaField(
				   $name = 'Transcript',
				   $title = "Transcript - this a html field to make a line break use <br\> at the end of each line ",
				   $rows = 8,
   				   $cols = 3,
				   $value = ""
			  ));
			 
			 
			
		

			 $fields->removeByName('Narrative');

			$fields->addFieldToTab("Root.Main",new HeaderField (
 					   $title = "------- Our assumptions and notes and narrative  that appears with this------- ",
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
			 $fields->addFieldToTab("Root.Main",  $myimage);
			  
											
			 
			
			//$fields->changeFieldOrder('LastName','FirstName');
		
			  return $fields;
   }
   
   

		
			
	


 
};

?>
