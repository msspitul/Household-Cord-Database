-----------------------Put in Drop Statements so Code Can be Continually Run
DROP TABLE IF EXISTS f_Cable
DROP TABLE IF EXISTS f_CableType
DROP TABLE IF EXISTS f_Storage
DROP TABLE IF EXISTS f_StorageSpaces
DROP TABLE IF EXISTS f_Room
DROP TABLE IF EXISTS f_FloorOfHouse


----------------------- Start of Table Creation

-- Creating the FloorOfHouse table
CREATE TABLE  f_FloorOfHouse (
	-- Column for FloorOfHouse
	FloorName varchar(20) not null
	-- Contraint on FloorOfHouse Table
	CONSTRAINT PK_f_FloorOfHouse PRIMARY KEY (FloorName)
)
-- End of FloorOfHouse Creation

-- Creating the Room table
CREATE TABLE f_Room (
	-- Columns for Room table
	RoomID int identity,
	RoomName varchar(30) not null,
	RoomType varchar(20) not null,
	FloorName varchar(20)
	-- Constraints
	CONSTRAINT PK_f_Room PRIMARY KEY (RoomID),
	CONSTRAINT U1_f_Room UNIQUE(RoomName),
	CONSTRAINT FK1_f_Room FOREIGN KEY (FloorName) REFERENCES f_FloorOfHouse (FloorName)
)
-- End of Room Table creation

-- Creating StorageSpaces Table
CREATE TABLE f_StorageSpaces (
	-- Columns for StorageSpaces
	StorageSpacesID int identity,
	StorageSpaceType varchar(50) not null
	-- Constraints for StorageSpaces
	CONSTRAINT PK_StorageSpaces PRIMARY KEY (StorageSpacesID)
)
-- End StorageSpaces Creation

-- Creating Storage table
CREATE TABLE f_Storage (
	-- Columns for Storage table
	StorageID int identity,
	StorageType varchar(30) not null,
	RoomID int not null,
	StorageSpacesID int
	-- Constraints on Storage Table
	CONSTRAINT PK_Storage PRIMARY KEY (StorageID),
	CONSTRAINT FK1_Storage FOREIGN KEY (RoomID) REFERENCES f_Room(RoomID),
	CONSTRAINT FK2_Storage FOREIGN KEY (StorageSpacesID) REFERENCES f_StorageSpaces(StorageSpacesID)
)
-- End Storage table creation


-- Creating the CableType table
CREATE TABLE f_CableType (
	-- Columns for CableType
	CableTypeID int identity,
	CableType varchar(20) not null
	-- Constraints on CableType table
	CONSTRAINT PK_f_CableType PRIMARY KEY (CableTypeID)
)
-- Ene CableType Table Creation

-- Creating the Cable table
CREATE TABLE f_Cable (
	-- Columns for Cable table
	CableID int identity,
	CableName varchar(50) not null,
	CableEnd1 varchar(50) not null,
	CableEnd2 varchar(50) not null,
	CableLength decimal(6,2) not null,
	Quantity int not null,
	InUse varchar(5),
	Color varchar(30),
	CableDescription varchar(500),
	StorageID int not null,
	CableTypeID int not null
	-- Constraints for Cable table
	CONSTRAINT PK_f_Cable PRIMARY KEY (CableID),
	CONSTRAINT FK1_f_Cable FOREIGN KEY (StorageID) REFERENCES f_Storage(StorageID),
	CONSTRAINT FK2_f_Cable FOREIGN KEY (CableTypeID) REFERENCES f_CableType(CableTypeID)
)
-- End of Cable table creation

-----------------------Start of Data Creation

-- Insert data for FloorOfHouse
INSERT INTO f_FloorOfHouse(FloorName)
	VALUES
		('No Floor'),
		('Garage'),
		('Basement'),
		('1st Floor'),
		('2nd Floor'),
		('3rd Floor'),
		('Attic')

-- Check data in FloorOfHouse
SELECT * FROM f_FloorOfHouse

-- Insert data for existing Rooms
INSERT INTO f_Room(RoomName, RoomType, FloorName)
	VALUES
		('Garage', 'Storage','Garage'),
		('Basement', 'Storage', 'Basement'),
		('Mud Room','Functional', '1st Floor'),
		('Kitchen', 'Functional', '1st Floor'),
		('Laundry', 'Functional', '1st Floor'),
		('Bathroom 1', 'Functional', '1st Floor'),
		('Den', 'Living', '1st Floor'),
		('Living Room', 'Living', '1st Floor'),
		('Dining Room', 'Living', '1st Floor'),
		('Sun Porch', 'Living', '1st Floor'),
		('Bathroom 2', 'Functional', '2nd Floor'),
		('Kid''s Room', 'Bed', '2nd Floor'),
		('Parent''s Room', 'Bed', '2nd Floor'),
		('Guest''s Room', 'Bed', '2nd Floor'),
		('Office', 'Functional', 'Attic'),
		('Man Cave', 'Living', 'Attic'),
		('Workout Area', 'Functional', 'Attic'),
		('No Room', 'None', 'No Floor')

-- Check data in Rooms
SELECT * FROM f_Room

-- Insert data for StorageSpaces
INSERT INTO f_StorageSpaces(StorageSpaceType)
	VALUES
		('Drawer'),
		('Shelf'),
		('Pocket'),
		('Trunk')

-- Check data in StorageSpace
SELECT * FROM f_StorageSpaces

-- Insert data for Storage
INSERT INTO f_Storage(StorageType, RoomID, StorageSpacesID)
	VALUES
		('None',1,NULL),
		('Car', 1, 4),
		('Shelving', 1, 2),
		('None',2,Null),
		('Tool Chest', 2, 1),
		('Tool Chest', 2, 2),
		('Cabinets', 2, 2),
		('None',3,NULL),
		('Rolling Island', 3, 1),
		('None',4,NULL),
		('Green Buffet', 4, 1),
		('Kitchen Cabinets', 4, 1),
		('None',5,NULL),
		('Cabinets', 5, 2),
		('None', 6, NULL),
		('Medicine Cabinet', 6, 2),
		('None',7, NULL),
		('TV Stand', 7, 1),
		('TV stand', 7, 2),
		('Storage Cabinet', 7, 1),
		('Storage Cabinet', 7, 2),
		('None', 8, NULL),
		('TV Stand', 8, 1),
		('TV Stand', 8, 2),
		('Side Table', 8, 1),
		('None', 9, NULL),
		('Buffet', 9, 1),
		('None', 10, NULL),
		('Metal Cabinet', 10, 1),
		('Desk Cabinet', 10, 1),
		('Desk Cabinet', 10, 2),
		('None', 11, NULL),
		('Medicine Cabinet', 11, 2),
		('None', 12, NULL),
		('Dresser', 12, 1),
		('None', 13, NULL),
		('Left Bedside Table', 13, 1),
		('Right Bedside Table', 13, 1),
		('Closet', 13, 2),
		('None', 14, NULL),
		('Media Cabinet', 14, 2),
		('Desk Cabinet', 14, 1),
		('Desk Cabinet', 14, 2),
		('Bedside Table', 14, 1),
		('Closet', 14, 2),
		('None', 15, NULL),
		('File Cabinet', 15, 1),
		('File Cabinet', 15, 2),
		('None', 16, NULL),
		('Storage Cabinet', 16, 1),
		('Storage Cabinet', 16, 2),
		('Bookshelf', 16, 2),
		('None', 17, NULL),
		('Storage Cabinet', 17, 1),
		('Storage Cabinet', 17, 2),
		('TV Stand', 17, 1),
		('None', 18, NULL),
		('Laptop Bag', 18, 3),
		('Backpack', 18, 3)
		
-- Check data in Storage
SELECT * FROM f_Storage

--Insert data for CableType
INSERT INTO f_CableType(CableType)
	VALUES
		('Power'),
		('Data Transfer'),
		('Audio'),
		('Video'),
		('Audio/Video'),
		('Networking'),
		('Maintenance')

-- Check data in CableType
SELECT * FROM f_CableType

-- Insert data in Cable
/*
	In order to get all of the cable data into the Cable table, I manually performed data entry in an excel sheet,
	then imported that data into a table named "ImportedCableData" using the "Import Flat File" option. I then
	copied the data from ImportedCableData to f_Cable
*/

-- Check data in ImportedCableData
SELECT * FROM ImportedCableData

-- Copy the data from ImportedCableData to f_Cable
INSERT INTO f_cable SELECT * FROM ImportedCableData 

-- Check data in f_Cable
SELECT * FROM f_Cable

GO
--------------------------------------- Create the FloorRoom function, which allows user to input if they want to look at a specific floor or room, 
---------------------------------------then the specific floor or room, and then a cable type, and then returns how many of those types of cables in that floor or room they have.

-- Create the FloorRoom function.

CREATE OR ALTER FUNCTION dbo.f_FloorRoom(@FloorOrRoom varchar(30), @SpecificFloorRoom varchar(30), @CableType varchar(30))
RETURNS int AS
BEGIN
	
	DECLARE @CableTypeCount int

	/* 
	Create an IF statement within the function that determines if the FloorRoomDecided variable
	should be pulled from the Floor or Room table.
	*/
	
	IF (@FloorOrRoom = 'Floor')
		BEGIN
		SELECT @CableTypeCount = SUM(Quantity) FROM f_Cable 
LEFT JOIN f_Storage ON f_Storage.StorageID = f_Cable.StorageID
LEFT JOIN f_Room ON f_Room.RoomID = f_Storage.RoomID
LEFT JOIN f_FloorOfHouse ON f_FloorOfHouse.FloorName = f_Room.FloorName
LEFT JOIN f_CableType ON f_CableType.CableTypeID = f_Cable.CableTypeID
WHERE f_FloorOFHouse.FloorName = @SpecificFloorRoom AND CableType = @CableType
		END
		ELSE
		BEGIN
		SELECT @CableTypeCount = SUM(Quantity) FROM f_Cable 
LEFT JOIN f_Storage ON f_Storage.StorageID = f_Cable.StorageID
LEFT JOIN f_Room ON f_Room.RoomID = f_Storage.RoomID
LEFT JOIN f_FloorOfHouse ON f_FloorOfHouse.FloorName = f_Room.FloorName
LEFT JOIN f_CableType ON f_CableType.CableTypeID = f_Cable.CableTypeID
WHERE f_Room.RoomName = @SpecificFloorRoom AND CableType = @CableType
	END

	RETURN @CableTypeCount
END
GO

-- Run the function.
SELECT dbo.f_FloorRoom('Room', 'Den', 'Power')

-------------------------------------Create Views

-- Create a view to see the total count of cables in the house

CREATE OR ALTER VIEW TotalCableCount AS
SELECT SUM(Quantity) AS "Total # Of Cables In House" FROM f_Cable 
GO

-- Test TotalCableCount
SELECT * FROM TotalCableCount

-- Create view to see total cable count per floor
GO
CREATE OR ALTER VIEW CablesPerFloor AS
SELECT 
	f_FloorOfHouse.FloorName AS "Floor of House",
	SUM(f_Cable.Quantity) "# of Cables"
FROM f_Cable
JOIN f_Storage ON f_Storage.StorageID = f_Cable.StorageID
JOIN f_Room ON f_Room.RoomID = f_Storage.RoomID
JOIN f_FloorOfHouse ON f_FloorOfHouse.FloorName = f_Room.FloorName
GROUP BY f_FloorOfHouse.FloorName

-- Test Cables Per Floor
SELECT * FROM CablesPerFloor

-- Create view to see total cable type per floor
GO
CREATE OR ALTER VIEW CableTypesPerFloor AS
SELECT 
	f_FloorOfHouse.FloorName AS "Floor of House",
	f_CableType.CableType AS "Cable Type",
	SUM(f_Cable.Quantity) "# of Cables"
FROM f_Cable
JOIN f_Storage ON f_Storage.StorageID = f_Cable.StorageID
JOIN f_Room ON f_Room.RoomID = f_Storage.RoomID
JOIN f_FloorOfHouse ON f_FloorOfHouse.FloorName = f_Room.FloorName
JOIN f_CableType ON f_CableType.CableTypeID = f_Cable.CableTypeID
GROUP BY f_FloorOfHouse.FloorName, f_CableType.CableType

-- Test Cable Types Per Floor
SELECT * FROM CableTypesPerFloor ORDER BY "Floor of House"

-- View Total Number of Cables based on Cable Name and Cable Ends
GO
CREATE OR ALTER VIEW TotalCableName AS
SELECT
	CableName,
	CableEnd1,
	CableEnd2,
	SUM(Quantity) AS "# of Cables"
FROM f_Cable
GROUP BY CableName, CableEnd1, CableEnd2

-- View total number of cables by cable name and ends.
SELECT * FROM TotalCableName

-- View Breakdown of Cables Being Used and Not Used
GO
CREATE OR ALTER VIEW CablesUsed AS
SELECT
	CableName,
	InUse,
	SUM(Quantity) AS Quantity
FROM f_Cable
GROUP BY InUse, CableName

-- Test CablesUsed
SELECT * FROM CablesUsed ORDER BY CableName

-- Breakdown of cables being used versus not used with cable Ends Included

CREATE OR ALTER VIEW CablesUsedEnds AS
SELECT
	CableName,
	InUse,
	CONCAT(CableEnd1,(' to '), CableEnd2) AS "Full Cable",
	SUM(Quantity) AS Quantity
FROM f_Cable
GROUP BY InUse, CableName, CableEnd1, CableEnd2

-- View how many cables are used and not used with cable ends included.
SELECT * FROM CablesUsedEnds


-- Create view that shows cables per storage item per room
GO
CREATE OR ALTER VIEW CablesPerStoragePerRoom AS
SELECT
	f_Room.RoomName AS Room,
	f_Storage.StorageType AS Storage,
	SUM(f_Cable.Quantity) AS "# Of Cables"
FROM f_Cable
JOIN f_Storage ON f_Storage.StorageID = f_Cable.StorageID
JOIN f_Room ON f_Room.RoomID = f_Storage.RoomID
GROUP BY f_Room.RoomName, f_Storage.StorageType

-- Test CablesPerStoragePerRoom
SELECT * FROM CablesPerStoragePerRoom ORDER BY "Room"

-- Create view to see Storage Spaces that are available

CREATE or ALTER VIEW AvailableStorageSpace AS
SELECT
	f_FloorOfHouse.FloorName AS "Floor",
	f_Room.RoomName AS Room,
	f_Storage.StorageType AS "Storage Space",
	f_StorageSpaces.StorageSpaceType AS "Available Space",
	SUM(f_Cable.Quantity) AS "Quantity of Cables"
FROM f_Storage
FULL JOIN f_Cable ON f_Cable.StorageID = f_Storage.StorageID
FULL JOIN f_Room ON f_Room.RoomID = f_Storage.RoomID
FULL JOIN f_FloorOfHouse ON f_FloorOfHouse.FloorName = f_Room.FloorName
FULL JOIN f_StorageSpaces ON f_Storage.StorageSpacesID = f_StorageSpaces.StorageSpacesID
GROUP BY RoomName,f_FloorOfHouse.FloorName,  StorageType, StorageSpaceType

-- Find storage spaces that have no cables
SELECT * FROM AvailableStorageSpace
SELECT * FROM AvailableStorageSpace WHERE "Quantity of Cables" IS NULL

/*
	Create a view to see how many total feet of cable length I have just in case I ever need
	to create a makeshift rope to save someone stuck in quicksand or pull off a 
	Mission Impossible-esque heist.
*/
GO
CREATE OR ALTER VIEW MakeshiftRope AS
SELECT SUM(Quantity*CableLength) AS "Total Feet of Cable In House" FROM f_Cable

-- Test MakeshiftRope
SELECT * FROM MakeshiftRope

-------------------------------------Create Procedures

-- Create Procedure for Adding StorageSpaces if New Storage is Purchased and has New Types of Storage Space
GO
CREATE OR ALTER PROCEDURE f_AddStorageSpace(@NewStorageSpaceType varchar(50)) AS
BEGIN
	INSERT INTO f_StorageSpaces(StorageSpaceType)
	VALUES (@NewStorageSpaceType)
END

-- Test the f_AddStorageSpace procedure.
EXEC f_AddStorageSpace 'SecretPassage'
-- Confrim the add worked.
SELECT * FROM f_StorageSpaces

-- Create Procedure for Deleting a StorageSpace line item
GO
CREATE OR ALTER PROCEDURE f_DelStorageSpace(@DelStorageSpaceID int) AS
BEGIN
	DELETE FROM f_StorageSpaces WHERE f_StorageSpaces.StorageSpacesID = @DelStorageSpaceID
END

-- Test the delete storage space procedure.
EXEC f_DelStorageSpace 5
-- Confirm the delete worked.
SELECT * FROM f_StorageSpaces


-- Create Procedure for Adding a new Type of Storage
GO
CREATE OR ALTER PROCEDURE f_AddStorageType(@NewStorageSpaceType varchar(50), @InputRoomID int, @InputStorageSpacesID int) AS
BEGIN
	INSERT INTO f_Storage(StorageType, RoomID, StorageSpacesID)
	VALUES (@NewStorageSpaceType, @InputRoomID, @InputStorageSpacesID)
END

-- Test the add storage type procedure.
EXEC f_AddStorageType BottomLessChest,15, 1
-- Confirm it worked.
SELECT * FROM f_Storage

-- Create Procedure for Deleting a Storage type line item
GO
CREATE OR ALTER PROCEDURE f_DelStorageType(@DelStorageID int) AS
BEGIN
	DELETE FROM f_Storage WHERE f_Storage.StorageID = @DelStorageID
END

-- Test that the delete storage ID procedure works.
EXEC f_DelStorageType 60
-- Confirm that it worked.
SELECT * FROM f_Storage

-- Create Procedure for Adding a New Cable Type
GO
CREATE OR ALTER PROCEDURE f_AddCableType(@NewCableType varchar(50)) AS
BEGIN
	INSERT INTO f_CableType(CableType)
	VALUES (@NewCableType)
END

-- Test that add cable type procedure works
EXEC f_AddCableType VirtualRealityCable
-- Confirm that it worked.
SELECT * FROM f_CableType

-- Create Procedure for Deleting a Cable Type
GO
CREATE OR ALTER PROCEDURE f_DelCableType(@DelCableTypeID int) AS
BEGIN
	DELETE FROM f_CableType WHERE CableTypeID = @DelCableTypeID
END

-- Test that delete cable type procedure works.
EXEC f_DelCableType 8
-- Confirm that it worked.
SELECT * FROM f_CableType

-- Create Procedure for Adding a New Cable
GO
CREATE OR ALTER PROCEDURE f_AddCable(
@NewCable varchar(50), 
@NewCableEnd1 varchar(50), 
@NewCableEnd2 varchar(50),
@NewCableLength decimal(6,3),
@NewCableQuantity int,
@NewCableInUse varchar(5),
@NewCableColor varchar(30),
@NewCableDescription varchar(500),
@NewStorageID int,
@NewCableTypeID int)
AS
BEGIN
INSERT INTO f_Cable(CableName, 
						CableEnd1, 
						CableEnd2, 
						CableLength, 
						Quantity, 
						InUse, 
						Color, 
						CableDescription, 
						StorageID, 
						CableTypeID)
VALUES (@NewCable, 
			@NewCableEnd1,
			@NewCableEnd2,
			@NewCableLength,
			@NewCableQuantity,
			@NewCableInUse,
		    @NewCableColor,
			@NewCableDescription,
		    @NewStorageID,
			@NewCableTypeID)
END

-- Test add new cable procedure.
EXEC f_AddCable 'Extension Cord', '3-prong plug', '3-prong receptacle', 30, 1, 'no', 'orange', null, 3, 1
-- Confirm it worked
SELECT * FROM f_Cable

-- Create Procedure for Deleting a Cable
GO
CREATE OR ALTER PROCEDURE f_DelCable(@DelCableID int) AS
BEGIN
	DELETE FROM f_Cable WHERE CableID = @DelCableID
END

-- Test delete cable procedure.
EXEC f_DelCable 234
-- Confirm it worked.
SELECT * FROM f_Cable

-- Create procedure for updating cable quantity in the cable table if cables are added or removed.
CREATE OR ALTER PROCEDURE f_UpdateCableQuantity(@CableID int, @UpdateCableQuantity int) AS
BEGIN
	UPDATE f_Cable SET Quantity = @UpdateCableQuantity
	WHERE f_Cable.CableID = @CableID
END

--Test that updating the cable quantity works.
SELECT * FROM f_Cable
EXEC f_UpdateCableQuantity 1,3