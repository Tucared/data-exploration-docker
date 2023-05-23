-- Create table
CREATE TABLE AirbnbListings (
    City VARCHAR(255),
    Price FLOAT,
    Day VARCHAR(255),
    Room_Type VARCHAR(255),
    Shared_Room BOOLEAN,
    Private_Room BOOLEAN,
    Person_Capacity FLOAT,
    Superhost BOOLEAN,
    Multiple_Rooms INTEGER,
    Business INTEGER,
    Cleanliness_Rating FLOAT,
    Guest_Satisfaction FLOAT,
    Bedrooms INTEGER,
    City_Center_km FLOAT,
    Metro_Distance_km FLOAT,
    Attraction_Index FLOAT,
    Normalised_Attraction_Index FLOAT,
    Restaurant_Index FLOAT,
    Normalised_Restaurant_Index FLOAT
);

-- Copy values
COPY AirbnbListings (City, Price, Day, Room_Type, Shared_Room, Private_Room, Person_Capacity, Superhost, Multiple_Rooms, Business, Cleanliness_Rating, Guest_Satisfaction, Bedrooms, City_Center_km, Metro_Distance_km, Attraction_Index, Normalised_Attraction_Index, Restaurant_Index, Normalised_Restaurant_Index)
FROM '/docker-entrypoint-initdb.d/data/AirbnbListings.csv' DELIMITER ',' CSV HEADER;