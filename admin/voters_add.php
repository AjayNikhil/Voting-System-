<?php
	include 'includes/session.php';

	if(isset($_POST['add'])){
		$firstname = $_POST['firstname'];
		$lastname = $_POST['lastname'];
		$password = password_hash($_POST['password'], PASSWORD_DEFAULT);
		$position = $_POST['position'];
		$filename = $_FILES['photo']['name'];
		if(!empty($filename)){
			move_uploaded_file($_FILES['photo']['tmp_name'], '../images/'.$filename);	
		}
		//generate voters id
		$set1 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
		$set2 = '123456789';
		$voter = substr(str_shuffle($set1), 0, 3).substr(str_shuffle($set2), 0, 7);

		$sql = "INSERT INTO voters (voters_id, password, firstname, lastname, photo, position_id, voted) VALUES ('$voter', '$password', '$firstname', '$lastname', '$filename', $position, 0)";
		if($conn->query($sql)){
			$_SESSION['success'] = 'Voter added successfully';
		}
		else{
			$_SESSION['error'] = $conn->error;
		}

	}
	else{
		$_SESSION['error'] = 'Fill up add form first';
	}

	header('location: voters.php');
?>
