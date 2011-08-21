<?php



class  NetworkVis_Controller extends Controller {


function relationshiptypes() {
			
			
			$RelationshipTypes = DataObject::get("RelationshipTypes","","","",""); // Get all the event relationships


			//Debug::show($RelationshipTypes);
			
			//header("Content-type: text/xml");	
			return $this->customise(array('Relationships' => $RelationshipTypes))->renderWith('relationshiptypes');
			
						  
 	    }
  
  
  
	
function people() {
			
			$people= DataObject::get("Person","StatusID = 1","","",""); // Get all the people 
			
			$eventRelationships= DataObject::get("EventRelationship","","","",""); // Get all the event relationships

			$relationships= DataObject::get("Relationship","","","",""); // Get all the relationships
			
			//Debug::show($relationships);

			$eventData = DataObject::get("EventData","Person.StatusID = 1","","LEFT JOIN Person ON KnownAsID",""); // Get all the Event Data and only get the people that have been published. 



			//Debug::show($people);
			
			header("Content-type: text/xml");	
			return $this->customise(
			array('People' => $people,'EventRelationships' => $eventRelationships,'Relationships' => $relationships,'EventData' => $eventData))
			->renderWith('Network');
			//return $people;
						  
 	    }
  
 
 function build() {
			
			//echo 'starting to build the network file this could take awhile';
			//if(self::$static_base_url) Director::setBaseURL(self::$static_base_url);
			
			Requirements::clear();
			$response = Director::test('network/people');
			Requirements::clear();
			
			//echo $response;
			
			if(is_object($response)) $content = $response->getBody();
			else $content = $response . '';
			
			$outFile = Director::baseFolder() . '/assets/network.xml';
			$fh = fopen("$outFile", "w");
			fwrite($fh, $content);
			fclose($fh);
				
			
		  	//Debug::show( $content);


 	    }
  
  

}


?>
