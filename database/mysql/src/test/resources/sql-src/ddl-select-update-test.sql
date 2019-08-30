CREATE TABLE IF NOT EXISTS SELECT_UPDATE_TEST_INTEGER_TYPES
(
    ID INT,
    BIT_VAL BIT(8),
    TINYINT_VAL TINYINT,
    SMALLINT_VAL SMALLINT,
    MEDIUMINT_VAL MEDIUMINT,
    INTEGER_VAL INT,
    BIGINT_VAL BIGINT
);
/
CREATE TABLE IF NOT EXISTS SELECT_UPDATE_TEST_FIXED_POINT_TYPES
(
    ID INT,
    DECIMAL_VAL DECIMAL(5,2),
    NUMERIC_VAL NUMERIC(7,3)
);
/
CREATE TABLE IF NOT EXISTS SELECT_UPDATE_TEST_FLOAT_TYPES
(
    ID INT,
    FLOAT_VAL FLOAT,
    DOUBLE_VAL DOUBLE
);
/
CREATE TABLE IF NOT EXISTS SELECT_UPDATE_TEST_STRING_TYPES
(
    ID INT,
    CHAR_VAL CHAR(20),
    VARCHAR_VAL VARCHAR(20),
    TINYTEXT_VAL TINYTEXT,
    TEXT_VAL TEXT,
    MEDIUMTEXT_VAL MEDIUMTEXT,
    LONGTEXT_VAL LONGTEXT,
    SET_VAL SET('A', 'B', 'C', 'D'),
    ENUM_VAL ENUM('X', 'Y', 'Z', 'W', 'V')
);
/
CREATE TABLE IF NOT EXISTS SELECT_UPDATE_TEST_COMPLEX_TYPES
(
    ID INT,
    BINARY_VAL BINARY(100),
    VARBINARY_VAL VARBINARY(100),
    TINYBLOB_VAL TINYBLOB,
    BLOB_VAL BLOB,
    MEDIUMBLOB_VAL MEDIUMBLOB,
    LONGBLOB_VAL LONGBLOB
);
/
CREATE TABLE IF NOT EXISTS SELECT_UPDATE_TEST_DATETIME_TYPES
(
    ID INT,
    DATE_VAL DATE,
    TIME_VAL TIME,
    DATETIME_VAL DATETIME(3),
    TIMESTAMP_VAL TIMESTAMP,
    YEAR_VAL YEAR
);
/
CREATE TABLE IF NOT EXISTS UPDATE_TEST_GENERATED_KEYS
(
    ID INT NOT NULL AUTO_INCREMENT,
    COL1  VARCHAR(20),
    COL2  INT,
    PRIMARY KEY (ID)
);
/
CREATE TABLE IF NOT EXISTS UPDATE_TEST_GENERATED_KEYS_NO_KEY
(
    ID INT,
    COL1  VARCHAR(20),
    COL2  INT
);
