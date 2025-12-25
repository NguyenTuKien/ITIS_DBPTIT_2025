SELECT
    T.username,
    T.dept,
    T.number
FROM
    Instructor AS I
JOIN
    Teaches AS T ON I.username = T.username
ORDER BY
    I.lname DESC
LIMIT 2;