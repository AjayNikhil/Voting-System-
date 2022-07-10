<?php
	include 'includes/session.php';

	if(isset($_POST['add'])){
		$partyname = $_POST['partyname'];
		$leader = $_POST['leader'];
		$filename = $_FILES['photo']['name'];
		if(!empty($filename)){
			move_uploaded_file($_FILES['photo']['tmp_name'], '../images/parties'.$filename);	
		}
		

		$sql = "SELECT * FROM parties ORDER BY name DESC LIMIT 1";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();
		
		$sql = "INSERT INTO parties (name, leader, logo) VALUES ('$partyname', '$leader', '$filename')";
		if($conn->query($sql)){
			$_SESSION['success'] = 'Party added successfully';
		}
		else{
			$_SESSION['error'] = $conn->error;
		}

	}
	else{
		$_SESSION['error'] = 'Fill up add form first';
	}

	header('location: parties.php');
?>
