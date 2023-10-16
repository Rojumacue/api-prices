DROP TABLE IF EXISTS BRAND;
DROP TABLE IF EXISTS PRICE_LIST;
DROP TABLE IF EXISTS PRODUCT;
DROP TABLE IF EXISTS PRICES;
-- Creación de la tabla BRAND
CREATE TABLE IF NOT EXISTS  BRAND (
                       ID SERIAL PRIMARY KEY,
                       NAME VARCHAR(100) NOT NULL
);

-- Creación de la tabla PRICE_LIST
CREATE TABLE IF NOT EXISTS  PRICE_LIST (
                            ID SERIAL PRIMARY KEY,
                            NAME VARCHAR(100) NOT NULL
);

-- Creación de la tabla PRODUCT
CREATE TABLE IF NOT EXISTS PRODUCT (
                         ID SERIAL PRIMARY KEY,
                         NAME VARCHAR(100) NOT NULL,
                         AMOUNT INTEGER NOT NULL,
                         BRAND_ID INT NOT NULL,
                         FOREIGN KEY (BRAND_ID) REFERENCES BRAND(ID)
);

-- Creación de la tabla PRICES
CREATE TABLE IF NOT EXISTS  PRICES (
                        ID SERIAL PRIMARY KEY,
                        BRAND_ID INTEGER NOT NULL,
                        START_DATE TIMESTAMP NOT NULL,
                        END_DATE TIMESTAMP NOT NULL,
                        PRICE_LIST INTEGER NOT NULL,
                        PRODUCT_ID INTEGER NOT NULL,
                        PRIORITY INTEGER NOT NULL,
                        PRICE DECIMAL(10, 2) NOT NULL,
                        CURRENCY VARCHAR(3) NOT NULL,
                        FOREIGN KEY (BRAND_ID) REFERENCES BRAND(ID),
                        FOREIGN KEY (PRICE_LIST) REFERENCES PRICE_LIST(ID),
                        FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(ID)
);

-- Inserción de datos

-- Insertamos la marca ZARA en BRAND
INSERT INTO BRAND (ID, NAME) VALUES (1, 'ZARA');

-- Insertamos un producto en PRODUCT
INSERT INTO PRODUCT (ID, NAME, AMOUNT,BRAND_ID) VALUES (35455, 'jacket',40, 1);



-- Insertamos valores de muestra en la tabla PRICE_LIST tarifa de precios aplicables
INSERT INTO PRICE_LIST (ID,NAME) VALUES (1,'Sample PriceList 1');
INSERT INTO PRICE_LIST (ID,NAME) VALUES (2,'Sample PriceList 2');
INSERT INTO PRICE_LIST (ID,NAME) VALUES (3,'Sample PriceList 3');
INSERT INTO PRICE_LIST (ID,NAME) VALUES (4,'Sample PriceList 4');


-- Inserción de datos en PRICES
INSERT INTO PRICES (BRAND_ID, START_DATE, END_DATE, PRICE_LIST, PRODUCT_ID, PRIORITY, PRICE, CURRENCY)
VALUES
    (1, '2020-06-14 00:00:00', '2020-12-31 23:59:59', 1, 35455, 0, 35.50, 'EUR'),
    (1, '2020-06-14 15:00:00', '2020-06-14 18:30:00', 2, 35455, 1, 25.45, 'EUR'),
    (1, '2020-06-15 00:00:00', '2020-06-15 11:00:00', 3, 35455, 1, 30.50, 'EUR'),
    (1, '2020-06-15 16:00:00', '2020-12-31 23:59:59', 4, 35455, 1, 38.95, 'EUR');
