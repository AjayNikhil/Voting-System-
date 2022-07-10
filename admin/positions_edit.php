<?php
	include 'includes/session.php';

	if(isset($_POST['edit'])){
		$id = $_POST['id'];
		$wardname = $_POST['wardname'];
		$dist_name = $_POST['dist_name'];

		$sql = "UPDATE positions SET wardname = '$wardname', dist_name = '$dist_name' WHERE id = '$id'";
		if($conn->query($sql)){
			$_SESSION['success'] = 'Poll updated successfully';
		}
		else{
			$_SESSION['error'] = $conn->error;
		}
	}
	else{
		$_SESSION['error'] = 'Fill up edit form first';
	}

	header('location: positions.php');

?>
