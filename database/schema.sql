CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;

CREATE TABLE customer_shopping_behaviour(
    customer_id INT NOT NULL,
    age INT NOT NULL,
    gender VARCHAR(10) NOT NULL,
    item_purchased VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    purchase_amount INT NOT NULL,
    location VARCHAR(50) NOT NULL,
    size VARCHAR(10) NOT NULL,
    color VARCHAR(30) NOT NULL,
    season VARCHAR(20) NOT NULL,
    review_rating DECIMAL(3,2) NOT NULL,
    subscription_status VARCHAR(20) NOT NULL,
    shipping_type VARCHAR(30) NOT NULL,
    discount_applied VARCHAR(10) NOT NULL,
    promo_code_used VARCHAR(10) NOT NULL,
    previous_purchases INT NOT NULL,
    payment_method VARCHAR(30) NOT NULL,
    frequency_of_purchases VARCHAR(30) NOT NULL,
    age_group VARCHAR(20) NOT NULL,
    purchase_frequency_days INT NOT NULL,

    PRIMARY KEY (customer_id)
);

CREATE INDEX idx_category ON customer_shopping_behaviour(category);
CREATE INDEX idx_location ON customer_shopping_behaviour(location);
CREATE INDEX idx_age_group ON customer_shopping_behaviour(age_group);
CREATE INDEX idx_purchase_frequency_days ON customer_shopping_behaviour(purchase_frequency_days);