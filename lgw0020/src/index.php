<?php
require "database.php";
$con = get_connection();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Database Query Form - Laura Wilson</title>
    <link rel="stylesheet" href="style.css" type="text/css" media="all" />

</head>

<body>
    <div class="container">
        <div class="header">
            <h1 class="display-4 text-center">Database Query Interface</h1>
            <p class="lead text-center">Laura Wilson (lgw0020@auburn.edu)</p>

            <div class="text-center my-4">
                <a href="index.php" class="btn btn-dark">All Tables</a>
                <a href="query.php" class="btn btn-dark">Query Database</a>
            </div>
        </div>

        <div class="table-responsive">
            <h2 class="text-center mb-4">All Tables</h2>
            <?php
            foreach ($tables as $table_name) {
                ?>
                <h3 class="mt-4 left-align">
                    <?= $table_name ?>
                </h3>
                <table class="table table-bordered table-striped elegant-table">
                    <thead>
                        <?php
                        $query = "SELECT * FROM " . $table_name;
                        $result = execute_query($con, $query);
                        if (!$result) {
                            die("Query failed to execute: " . mysqli_error($con));
                        }
                        //$books = mysqli_fetch_assoc($result);
                        $num_fields = mysqli_num_fields($result);

                        echo "<tr>";
                        for ($i = 0; $i < $num_fields; $i++) {
                            $field = mysqli_fetch_field_direct($result, $i);
                            echo "<th>" . $field->name . "</th>";
                        }
                        echo "</tr>";


                        ?>
                    </thead>

                    <?php
                    $rows = array();
                    while ($result_row = mysqli_fetch_assoc($result)) {
                        $rows[] = $result_row;
                    }
                    foreach ($rows as $row) {
                        echo "<tr>";
                        foreach ($row as $col) {
                            echo "<td>" . $col . "</td>";
                        }
                        echo "</tr>";
                    }

                    mysqli_free_result($result);

                    ?>

                </table>

                <br><br>
                <?php

            }
            ?>
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
<?php mysqli_close($con); ?>