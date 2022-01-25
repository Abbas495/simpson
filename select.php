<?php

include 'db.php';
$sql='SELECT f_firstName as first_name, 
        h_name as h_name
        FROM familie_hobbies
        INNER JOIN familie ON familie.f_id = familie_hobbies.f_id
        INNER JOIN hobbies ON hobbies.h_id = familie_hobbies.h_id';

foreach ($db->query($sql) as $row) {
print $row['first_name'] . "\t";
print $row['h_name'] . "\n";
}