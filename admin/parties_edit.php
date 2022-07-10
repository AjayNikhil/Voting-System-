<?php
	include 'includes/session.php';

	if(isset($_POST['edit'])){
		$id = $_POST['id'];
		$partyname = $_POST['partyname'];
		$leader = $_POST['leader'];

		$sql = "UPDATE parties SET name = '$partyname', leader = '$leader' WHERE id = '$id'";
		if($conn->query($sql)){
			$_SESSION['success'] = 'Party updated successfully';
		}
		else{
			$_SESSION['error'] = $conn->error;
		}
	}
	else{
		$_SESSION['error'] = 'Fill up edit form first';
	}

	header('location: parties.php');

?>
