<?php
	include 'includes/session.php';
	include 'includes/slugify.php';

	if(isset($_POST['vote'])){
		if(count($_POST) == 1){
			$_SESSION['error'][] = 'Please vote one candidate';
		}
		else{
			$_SESSION['post'] = $_POST;
			$sql = "SELECT * FROM positions WHERE id= '".$voter['position_id']."' ";
			$query = $conn->query($sql);
			$row = $query->fetch_assoc();
			
			$position = slugify($row['wardname']);

                        if(isset($_POST[$position])){
                               $candidate = $_POST[$position];
				$sql = "UPDATE candidates SET votes = votes + 1 WHERE id= '".$candidate."' ";
				$query = $conn->query($sql);

                               $sql = "UPDATE voters SET voted = true WHERE id='".$voter['id']."'";
                               $query = $conn->query($sql);

			}
					
			unset($_SESSION['post']);
			$_SESSION['success'] = 'Ballot Submitted';
		}
	}
	
	else{
		$_SESSION['error'][] = 'Select a candidate to vote first';
	}

	header('location: home.php');

?>
