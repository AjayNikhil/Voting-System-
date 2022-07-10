<?php
	include 'includes/session.php';

	if(isset($_POST['add'])){
		$wardname = $_POST['wardname'];
		$dist_name = $_POST['dist_name'];

		$sql = "SELECT * FROM positions ORDER BY priority DESC LIMIT 1";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();

		$priority = $row['priority'] + 1;
		
		$sql = "INSERT INTO positions (wardname, dist_name, priority) VALUES ('$wardname', '$dist_name', '$priority')";
		if($conn->query($sql)){
			$_SESSION['success'] = 'Poll added successfully';
		}
		else{
			$_SESSION['error'] = $conn->error;
		}

	}
	else{
		$_SESSION['error'] = 'Fill up add form first';
	}

	header('location: positions.php');
?>
