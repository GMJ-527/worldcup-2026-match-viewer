DROP TABLE IF EXISTS Match CASCADE;
DROP TABLE IF EXISTS Team CASCADE;
DROP TABLE IF EXISTS Venue CASCADE;

CREATE TABLE Team (
    team_id SERIAL PRIMARY KEY,
    country_name VARCHAR(50) NOT NULL,
    country_code VARCHAR(3) NOT NULL,
    group_name VARCHAR(10) NOT NULL
);

CREATE TABLE Venue (
    venue_id SERIAL PRIMARY KEY,
    city_name VARCHAR(50) NOT NULL,
    region VARCHAR(50)
);

CREATE TABLE Match (
    match_id INTEGER PRIMARY KEY,
    match_date DATE NOT NULL,
    match_time TIME NOT NULL,
    stage VARCHAR(50) NOT NULL,
    home_score INTEGER,
    away_score INTEGER,
    home_team_id INTEGER NOT NULL REFERENCES Team(team_id),
    away_team_id INTEGER NOT NULL REFERENCES Team(team_id),
    venue_id INTEGER NOT NULL REFERENCES Venue(venue_id)
);
