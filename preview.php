<?php
	
	include 'includes/session.php';
	include 'includes/slugify.php';

	$output = array('error'=>false,'list'=>'');

	$sql = "SELECT * FROM positions WHERE id= '".$voter['position_id']."' ";
	$query = $conn->query($sql);
	$row = $query->fetch_assoc();
	
		$position = slugify($row['wardname']);
		$pos_id = $row['id'];
		if(isset($_POST[$position])){

				$candidate = $_POST[$position];
				$sql = "SELECT * FROM candidates WHERE id = '$candidate'";
				$csquery = $conn->query($sql);
				$csrow = $csquery->fetch_assoc();
				$output['list'] .= "
					<div class='row votelist'>
                      	<span class='col-sm-4'><span class='pull-right'><b>".$row['wardname']." :</b></span></span> 
                      	<span class='col-sm-8'>".$csrow['firstname']." ".$csrow['lastname']."</span>
                    </div>
				";
			

		}
		
	

	echo json_encode($output);


?>
