DROP TABLE IF EXISTS country;

CREATE TABLE country (
    country_id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    capital VARCHAR(100) NOT NULL,
    population INT NOT NULL,
    languages VARCHAR(100) NOT NULL,
    fun_fact VARCHAR(255),
    map_image_url VARCHAR(255),
    PRIMARY KEY (country_id)
);

INSERT INTO country 
    (name, capital, population, languages, fun_fact, map_image_url)
VALUES 
    ('Brazil', 'Brasília', 212559417, 'Portuguese', 'Brazil is the fifth largest country in the world by both land area and population.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/1200px-Flag_of_Brazil.svg.png'),
    ('Mexico', 'Mexico City', 127575529, 'Spanish', 'Mexico is home to the world''s largest pyramid, the Great Pyramid of Cholula.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Flag_of_Mexico.svg/1200px-Flag_of_Mexico.svg.png'),
    ('United States', 'Washington, D.C.', 329064917, 'English', 'The United States has the largest economy in the world.', 'https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/1200px-Flag_of_the_United_States.svg.png'),
    ('India', 'New Delhi', 1353000000, 'Hindi, English', 'India is the world''s largest democracy.', 'https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png'),
    ('China', 'Beijing', 1409517397, 'Mandarin', 'China has the world''s largest population.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Flag_of_the_People%27s_Republic_of_China.svg/1200px-Flag_of_the_People%27s_Republic_of_China.svg.png'),
    ('Russia', 'Moscow', 145934462, 'Russian', 'Russia is the largest country in the world by land area.', 'https://upload.wikimedia.org/wikipedia/en/thumb/f/f3/Flag_of_Russia.svg/1200px-Flag_of_Russia.svg.png'),
    ('Japan', 'Tokyo', 126860301, 'Japanese', 'Japan is home to the world''s largest fish market, Tsukiji Market.', 'https://upload.wikimedia.org/wikipedia/en/thumb/9/9e/Flag_of_Japan.svg/1200px-Flag_of_Japan.svg.png'),
    ('South Africa', 'Pretoria', 57779622, 'Afrikaans, English, Zulu, Xhosa, and others', 'South Africa has 11 official languages.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Flag_of_South_Africa.svg/1200px-Flag_of_South_Africa.svg.png'),
    ('Australia', 'Canberra', 24982688, 'English', 'Australia is the only country that is also a continent.', 'https://upload.wikimedia.org/wikipedia/en/thumb/8/88/Flag_of_Australia.svg/1200px-Flag_of_Australia.svg.png');
