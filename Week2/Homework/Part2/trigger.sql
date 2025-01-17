/* I want to get alerts when a country has >= 10 languages. E.g. If a country X has 9 languages in 
the CountryLanguage table, and a user INSERTs one more row in the CountryLanguage table, then I should 
get an alert. How can I achieve this? */

delimiter $$
CREATE TRIGGER language_trigger
BEFORE INSERT
ON countrylanguage
FOR EACH ROW
BEGIN
DECLARE message VARCHAR(100);
DECLARE language_num int
SET language_num=(SELECT count(language) FROM countrylanguage WHERE CountryCode =new.CountryCode);
IF language_num > 9
THEN
SET message= 'The country cannot have more than 9 languages!'
SET lc_messages= message;
SIGNAL SQLSTATE '45000';
END IF;
END $$
delimiter;

/* This would start the trigger:
 insert into countrylanguage values ('AGO', 'English', 'F', 2.1)*/
