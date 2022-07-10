<?php include 'includes/session.php'; ?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <?php include 'includes/navbar.php'; ?>
  <?php include 'includes/menubar.php'; ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Election Results
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Results</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">
      <?php
        if(isset($_SESSION['error'])){
          echo "
            <div class='alert alert-danger alert-dismissible'>
              <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
              <h4><i class='icon fa fa-warning'></i> Error!</h4>
              ".$_SESSION['error']."
            </div>
          ";
          unset($_SESSION['error']);
        }
        if(isset($_SESSION['success'])){
          echo "
            <div class='alert alert-success alert-dismissible'>
              <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
              <h4><i class='icon fa fa-check'></i> Success!</h4>
              ".$_SESSION['success']."
            </div>
          ";
          unset($_SESSION['success']);
        }
      ?>
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-body">
              <table id="example1" class="table table-bordered">
                <thead>
                  <th class="hidden"></th>
                  <th>logo</th>
                  <th>Party</th>
                  <th>Total votes count</th>
                </thead>
                <tbody>
                  <?php
                    
                    //$sql = "select parties.name, parties.logo, parties.id as partyid, candidates.id as canid, candidates.votes, candidates.parties_id from candidates inner join parties on parties.id = candidates.parties_id";
                    $sql = "SELECT parties.id, parties.name, parties.logo FROM parties";
                    $query = $conn->query($sql);
                    while($row = $query->fetch_assoc()){
                    $image = (!empty($row['logo'])) ? '../images/parties/'.$row['logo'] : '../images/favicon.png';        
                    
                    $vsql = "SELECT SUM(votes) AS value_sum FROM candidates WHERE candidates.parties_id = '".$row['id']."'";
                    $vquery = $conn->query($vsql);            	
                    $count = $vquery->fetch_assoc();
                    
                      echo "
                        <tr>
                          <td class='hidden'></td>
                          <td>
                            <img src='".$image."' width='70px' height='70px'>
                          </td>
                          <td>".$row['name']."</td>
                          <td>".$count['value_sum']." </td>            
                        </tr>
                      ";
                    }
                  ?>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </section>   
  </div>
    
  <?php include 'includes/footer.php'; ?>
</div>
<?php include 'includes/scripts.php'; ?>
</body>
</html>
