UPDATE Policyholder
SET Address = '321 Maple St'
WHERE PolicyholderID IN (
    SELECT PolicyholderID 
    FROM Policy 
    WHERE Product = 'Home'
);