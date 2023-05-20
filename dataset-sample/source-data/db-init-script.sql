CREATE TABLE pollution_data (
    location varchar(255),
    indicator varchar(255),
    subject varchar(255),
    measure varchar(255),
    frequency varchar(1),
    year integer,
    value numeric,
    flag_codes varchar(255)
);

COPY pollution_data(location, indicator, subject, measure, frequency, year, value, flag_codes)
FROM '/docker-entrypoint-initdb.d/data/oecd_air_pollution_exposure.csv' DELIMITER ',' CSV HEADER;