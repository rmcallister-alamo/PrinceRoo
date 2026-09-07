/* =========================================================
   PRINCE ROO'S FLOCK DATABASE
   Module 3 Database Studio - Build It
   First Working Version
   ========================================================= */


/* ---------------------------------------------------------
   CREATE THE DATABASE
   --------------------------------------------------------- */

CREATE DATABASE PrinceRooDB;

USE PrinceRooDB;


/* =========================================================
   TABLE 1: COOP
   Create this table first because CHICKEN will reference it.
   ========================================================= */

CREATE TABLE Coop
(
    CoopID          INT PRIMARY KEY AUTO_INCREMENT,
    StructureName   VARCHAR(50) NOT NULL,
    Location        VARCHAR(100),
    Capacity        INT,
    OperableStatus  VARCHAR(20),
    CleanDate       DATE,
    ReplacementCost DECIMAL(8,2)
);


/* =========================================================
   TABLE 2: HUMAN
   Humans may include family members or egg donatees.
   ========================================================= */

CREATE TABLE Human
(
    HumanID       INT PRIMARY KEY AUTO_INCREMENT,
    Category      VARCHAR(30),
    FirstName     VARCHAR(50) NOT NULL,
    LastName      VARCHAR(50),
    EmailAddress  VARCHAR(100),
    Building      VARCHAR(50)
);


/* =========================================================
   TABLE 3: CHICKEN
   CoopID connects each chicken to a coop.

   FatherChickenID and MotherChickenID are interesting:
   They point back to another chicken in the SAME table.
   These are self-referencing foreign keys.
   ========================================================= */

CREATE TABLE Chicken
(
    ChickenID       INT PRIMARY KEY AUTO_INCREMENT,
    ChickenName     VARCHAR(50) NOT NULL,
    HatchDate       DATE,
    Breed           VARCHAR(75),
    Sex             VARCHAR(20),
    CoopID           INT,
    FatherChickenID  INT,
    MotherChickenID  INT,

    FOREIGN KEY (CoopID)
        REFERENCES Coop(CoopID),

    FOREIGN KEY (FatherChickenID)
        REFERENCES Chicken(ChickenID),

    FOREIGN KEY (MotherChickenID)
        REFERENCES Chicken(ChickenID)
);


/* =========================================================
   TABLE 4: DONATION
   A donation is associated with a human receiving eggs.
   ========================================================= */

CREATE TABLE Donation
(
    DonationID    INT PRIMARY KEY AUTO_INCREMENT,
    HumanID       INT NOT NULL,
    DateRequested DATE,
    DateProvided  DATE,

    FOREIGN KEY (HumanID)
        REFERENCES Human(HumanID)
);


/* =========================================================
   TABLE 5: EGG
   An egg may be connected to the hen that laid it.
   DonationID remains NULL unless that egg was donated.
   ========================================================= */

CREATE TABLE Egg
(
    EggID        INT PRIMARY KEY AUTO_INCREMENT,
    ChickenID    INT,
    DateLaid     DATE NOT NULL,
    EggColor     VARCHAR(30),
    EggSize      VARCHAR(20),
    DateEaten    DATE,
    DonationID   INT,

    FOREIGN KEY (ChickenID)
        REFERENCES Chicken(ChickenID),

    FOREIGN KEY (DonationID)
        REFERENCES Donation(DonationID)
);
