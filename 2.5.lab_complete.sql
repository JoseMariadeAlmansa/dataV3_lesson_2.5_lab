#---------------------------------1. Select all the actors with the first name ‘Scarlett’.-------------------------------#
USE sakila; # Use sakila data base
SELECT * FROM sakila.actor # Select tables from a DataBase
WHERE first_name = 'Scarlett';
#---------------------2. How many films (movies) are available for rent and how many films have been rented?------------------#
SELECT SUM(return_date IS NULL) AND (return_date = '') AS rented # It shows the number rentals that does not have a return date
FROM sakila.rental;
SELECT SUM(return_date IS NOT NULL) AS available # The number of rentals
FROM sakila.rental;
#--------------------3. What are the shortest and longest movie duration? Name the values `max_duration` and `min_duration`.------#
SELECT MAX(length) as 'max_duration',MIN(length) 'min_duration' FROM sakila.film; 
#--------------------4. What's the average movie duration expressed in format (hours, minutes)?------------------------------------#
SELECT CONVERT(AVG(length),time) AS 'average_duration' FROM sakila.film; 
#--------------------------5. How many distinct (different) actors' last names are there?------------------------------------------#
SELECT COUNT(DISTINCT last_name) FROM sakila.actor;
#--------------------------6. Since how many days has the company been operating (check DATEDIFF() function)?-----------------------#
# I convert the column into dates, and calculate the difference between the max and the min
SELECT DATEDIFF(MAX(CONVERT(rental_date,DATE)),MIN(CONVERT(rental_date,DATE))) AS opertaing_days FROM sakila.rental; 
#----------------------------7. Show rental info with additional columns month and weekday. Get 20 results.---------------------------#
SELECT DAYNAME(rental_date) AS weekday, MONTHNAME(rental_date) AS month FROM sakila.rental;
#---------8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.-----------#
SELECT rental_date,
CASE # Set the if conditions for the weekend days
WHEN DAYNAME(CONVERT(rental_date,DATE)) = 'Saturday' then 'weekend'
WHEN DAYNAME(CONVERT(rental_date,DATE)) = 'Sunday' then 'weekend'
ELSE 'workday' # Set the else conditions for the workdays
END AS 'day_type' 
FROM sakila.rental; 
#--------------------------------------9. Get release years.---------------------------------------------------------------------------#
SELECT release_year FROM sakila.film;
#----------------------------------10. Get all films with ARMAGEDDON in the title.-----------------------------------------------------#
SELECT title FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%'; #% acts as a match card. If I do %ARMAGEDDON%, it can be in any place in the character
#-----------------------------------11. Get all films which title ends with APOLLO.---------------------------------------------------#
SELECT title FROM sakila.film
WHERE title LIKE '%APOLLO'; #% acts as a match card. If I do %APOLLO, it can be at the end of the character the character
#-------------------------------------12. Get 10 the longest films.------------------------------------------------------------------#
SELECT length AS 'top10_max_duration' FROM sakila.film
ORDER BY length DESC #Descending order of film duration
LIMIT 10; # limit the query to 10 rows
#-------------------------------------13. How many films include **Behind the Scenes** content?*/------------------------------------#
SELECT special_features FROM sakila.film
WHERE special_features LIKE '%Behind the Scenes%'; #% acts as a match card.