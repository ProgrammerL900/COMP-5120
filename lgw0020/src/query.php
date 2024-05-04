<?php
require "database.php";
$con = get_connection();
if (!$con) {
    report_error(mysqli_error($con));
    die();
}

function report_error($msg)
{
    echo '<div class="alert alert-danger">' . $msg . '</div>';
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Database Query Interface - Laura Wilson</title>
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

        <div>
            <h2>Enter Your Query</h2>
            <form method="POST" action="query.php">
                <textarea id="query" name="query" rows="5"><?= stripslashes($_POST["query"]) ?></textarea>
                <br />
                <input type="submit" class="btn" value="Execute" />
                <button type="button" class="btn" onclick="document.getElementById('query').value = ''">Clear</button>
            </form>
        </div>

        <div class="table-responsive mt-5">
            <?php
            if (isset($_POST["query"])) {
                $query = stripcslashes($_POST["query"]);
                $q = strtolower($query);
                $forbidden = array("drop", "delete", "update", "create", "alter");
                foreach ($forbidden as $key) {
                    if (strpos($q, $key) !== false) {
                        report_error("DROP, DELETE, UPDATE, CREATE and ALTER statements are disallowed.");
                        die();
                    }
                }

                if ($query !== "") {
                    $result = execute_query($con, $query);
                    if ($result == false) {
                        report_error(mysqli_error($con));
                        die();
                    }

                    ?>
                    <table class="table table-bordered table-striped elegant-table">
                        <thead>
                            <?php
                            $numFields = mysqli_num_fields($result);
                            echo "<tr>";
                            for ($i = 0; $i < $numFields; $i++) {
                                $field = mysqli_fetch_field_direct($result, $i);
                                echo "<th>" . $field->name . "</th>";
                            }
                            echo "</tr>";
                            ?>
                        </thead>

                        <?php
                        $rows = array();
                        while ($resultRow = mysqli_fetch_assoc($result)) {
                            $rows[] = $resultRow;
                        }
                        foreach ($rows as $row) {
                            echo "<tr>";
                            foreach ($row as $col) {
                                echo "<td>" . $col . "</td>";
                            }
                            echo "</tr>";
                        }

                        mysqli_free_result($result);
                }
                ?>
                </table>
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