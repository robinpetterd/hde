<?php 

class BirchtownMusterImporter extends CsvBulkLoader {
   
   public $columnMap = array(
    'Event' => 'Event',
	'Order' => 'Order',
	
	'FamilyGroup' => 'FamilyGroup',
	'LastName' => 'LastName',	
	'FirstName' => 'FirstName',	
	'Age' => 'Age',	
	'Occupation' => 'Occupation',	


	
   );
   
  

}


?>
