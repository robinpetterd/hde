<?php 

class ListSierraLeoneImporter extends CsvBulkLoader {
   
 //Where where they born,Source,

   public $columnMap = array(
 	
	'KnowAs' => 'KnownAs.Name',
//	'Wherewheretheyborn' => 'WhereTheyWhereBorn.Name',
	'Name' => 'Name', 
  	'Age' => 'Age', 
	'NoChildren' => 'NumberOfChildren', 
	'AgeEldest' => 'AgeOfEldest', 
	'Occupation' => 'Occupation',
	 'Property'=> 'Property',  
	 'Source' =>'SourceFile.Filename'

	
   );
   
   public $relationCallbacks = array(
      'KnownAs.Name' => array(
         'relationname' => 'KnownAs',
         'callback' => 'getKnowByName'
      ),
	   'WhereTheyWhereBorn.Name' => array(
         'relationname' => 'WhereTheyWhereBorn',
         'callback' => 'getLoc'
      ),
	  
	  'SourceFile.Filename' => array(
         'relationname' => 'SourceFile',
         'callback' => 'getSource'
      )
	  
	  
	  
   );
   
    static function getSource($obj, $val, $record) {
	//Debug::show($val);
      $SQL_val = Convert::raw2sql($val);
      return DataObject::get_one(
         'File', "Filename = '{$SQL_val}'"
     );
	}
	
	
    static function getKnowByName($obj, $val, $record) {
		//Debug::show($val);
      $SQL_val = Convert::raw2sql($val);
      return DataObject::get_one(
         'Person', "Name = '{$SQL_val}'"
     );
	}
	
	static function getLoc($obj, $val, $record) {
		
	//Debug::show($val);
	
      $SQL_val = Convert::raw2sql($val);
	 
	  $loc =  DataObject::get(
         'Loc', "Name = '{$SQL_val}'"
     );
	 
	 //Debug::show($loc);
     return $loc;
	 
	}
	
	
}

?>
