DROP TABLE IF EXISTS trips;
DROP TABLE IF EXISTS riders;
DROP TABLE IF EXISTS riders2;
DROP TABLE IF EXISTS cars;

--
CREATE TABLE trips (
    id INTEGER PRIMARY KEY,
    date TEXT,
    pickup TEXT,
    dropoff TEXT,
    rider_id INTEGER,
    car_id INTEGER,
    type TEXT,
    cost REAL
);

INSERT INTO trips (id, date, pickup, dropoff, rider_id, car_id, type, cost) VALUES
(1001, '2017-12-05', '06:45', '07:10', 102, 1, 'X',    28.66),
(1002, '2017-12-05', '08:00', '08:15', 101, 3, 'POOL',  9.11),
(1003, '2017-12-05', '09:30', '09:50', 104, 4, 'X',    24.98),
(1004, '2017-12-05', '13:40', '14:05', 105, 1, 'X',    31.27),
(1005, '2017-12-05', '15:15', '16:00', 103, 2, 'POOL', 18.95),
(1006, '2017-12-05', '18:20', '18:55', 101, 3, 'XL',   78.52);


--
CREATE TABLE riders (
    id INTEGER PRIMARY KEY,
    first TEXT,
    last TEXT,
    username TEXT,
    rating INTEGER,
    total_trips INTEGER,
    referred INTEGER
);

INSERT INTO riders (id, first, last, username, rating, total_trips, referred) VALUES
(101, 'Sonny', 'Li', '@sli',        4.66, 352, NULL),
(102, 'Laura', 'Lee', '@llee',      4.92, 687, 101),
(103, 'Ben',   'Smith', '@bsmith',  4.83, 423, 102),
(104, 'Ava',   'Brown', '@abrown',  4.74, 128, 101);

--
CREATE TABLE riders2 (
    id INTEGER PRIMARY KEY,
    first TEXT,
    last TEXT,
    username TEXT,
    rating REAL,
    total_trips INTEGER,
    referred INTEGER
);


INSERT INTO riders2 (id, first, last, username, rating, total_trips, referred) VALUES
(105, 'Zach',  'Sims',  '@zsims',       4.85, 787, NULL),
(106, 'Eric',  'Vaught','@posturelol',  4.96, 54,  101),
(107, 'Jilly', 'Beans', '@jillkuzmin',  4.7,  32,  101);


CREATE TABLE cars (
    id INTEGER PRIMARY KEY,
    model TEXT,
    OS TEXT,
    status TEXT,
    trips_completed INTEGER
);

-- 
INSERT INTO cars (id, model, OS, status, trips_completed) VALUES
(1, 'Ada',       'Ryzac', 'active',       82),
(2, 'Ada',       'Ryzac', 'active',       30),
(3, 'Turing XL', 'Ryzac', 'active',      164),
(4, 'Akira',     'Finux', 'maintenance',  22);

