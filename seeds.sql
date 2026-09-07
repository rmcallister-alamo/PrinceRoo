/* =========================================================
   SAMPLE COOPS
   ========================================================= */

INSERT INTO Coop
    (StructureName, Location, Capacity, OperableStatus)
VALUES
    ('Main Coop', 'Back Yard', 15, 'Operational'),
    ('Junior Coop', 'Side Yard', 10, 'Operational');


/* =========================================================
   SAMPLE HUMANS
   ========================================================= */

INSERT INTO Human
    (Category, FirstName, LastName, EmailAddress)
VALUES
    ('Family', 'Ruthanne', 'Kiefer', NULL),
    ('Family', 'Eric', 'Kiefer', NULL),
    ('Donatee', 'Neighbor', 'One', NULL);


/* =========================================================
   FIRST ADD THE PARENT CHICKENS
   ========================================================= */

INSERT INTO Chicken
    (ChickenName, Breed, Sex, CoopID)
VALUES
    ('Proddy', 'Barnyard Mix', 'Rooster', 1),
    ('Robby', 'Barnyard Mix', 'Rooster', 1),
    ('Momma', 'Chocolate Orpington', 'Hen', 1);


/* =========================================================
   NOW ADD THEIR OFFSPRING

   Based on the IDs created above:
   Proddy = 1
   Robby  = 2
   Momma  = 3
   ========================================================= */

INSERT INTO Chicken
    (ChickenName, Breed, Sex, CoopID, FatherChickenID)
VALUES
    ('Prince Roo', 'Barnyard Mix', 'Rooster', 2, 1);


INSERT INTO Chicken
    (ChickenName, Breed, Sex, CoopID,
     FatherChickenID, MotherChickenID)
VALUES
    ('Mocha Latte', 'Barnyard Mix', 'Hen', 1, 2, 3);


INSERT INTO Chicken
    (ChickenName, Breed, Sex, CoopID, FatherChickenID)
VALUES
    ('Peanut', 'Barnyard Mix', 'Hen', 1, 1);
