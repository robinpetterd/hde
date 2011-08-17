<?php

/**
 * A task to clean up unused columns in DB tables
 * 
 * @package sapphire
 * @subpackage dev
 */
class CleandbTask extends BuildTask {
	
	protected $enabled = true;
	protected $title = "Clean DB Task";
	protected $description = 'Cleans unused columns from the DB';
	
	function run($request) {
		$renderer = new DebugView();
		$renderer->writeHeader();
		$renderer->writeInfo("Clean DB Task", Director::absoluteBaseURL());
		echo "<div style=\"margin: 0 2em\">";

		// Build the database.  Most of the hard work is handled by DataObject
		$dataClasses = ClassInfo::subclassesFor('DataObject');
		array_shift($dataClasses);

		if(Director::is_cli()) echo "\nCHECKING FIELDS IN DATABASE TABLES\n\n";
		else echo "\n<p><b>Checking fields in database tables</b></p>\n\n";


		$conn = DB::getConn();
		$conn->beginSchemaUpdate();
		foreach($dataClasses as $dataClass) {
			// Check if class exists before trying to instantiate - this sidesteps any manifest weirdness
			if(class_exists($dataClass)) {
				$SNG = singleton($dataClass);

				if(Director::is_cli()) echo " * $dataClass\n";
				else echo "<li>$dataClass</li>\n";
				
				$tableList = DB::tableList();
				$table = $SNG->class;					
				if (isset($tableList[strtolower($table)])) {
					$classFields = $SNG->databaseFields();
					$dbFields = DB::fieldList($table);
					foreach ($dbFields as $field => $spec) {
						if (!isset($classFields[$field]) 
								&& $field != 'ID' && $field != 'Version'
								&& substr($field, 0, 9) != '_obsolete'
							) {
							$conn->dontRequireField($table, $field);
						}
					}
				}
			}
		}
		$conn->endSchemaUpdate();
		
		echo "</div>";
		$renderer->writeFooter();
	}
	
}

?>
