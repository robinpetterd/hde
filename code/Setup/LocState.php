<?php 

class LocState extends Loc  {
 
    
   static $db = array(
		  'Name' => 'Varchar',

	  );

	
  
   static $searchable_fields = array(
   'Name' );
   
  
      static $summary_fields = array(
   'Name' ,'ID'
   );
   
 
};

?>
