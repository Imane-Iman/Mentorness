
-- 1. Total number of reservations in the dataset
SELECT COUNT(*) as number_of_reservations FROM `hotel reservation dataset`;

 -- 2. The most popular meal plan among guests
 SELECT type_of_meal_plan, 
   COUNT(type_of_meal_plan) as popular_meal_plan
 FROM `hotel reservation dataset`
 GROUP BY type_of_meal_plan
 ORDER BY popular_meal_plan desc
 LIMIT 1;
 
 -- 3. The average price per room for reservations involving children
 SELECT no_of_children, avg_price_per_room
 FROM `hotel reservation dataset`
 WHERE no_of_children >0;
 
 -- 4. The number of reservations were made for the year 2018
 SELECT  COUNT(*) as number_of_reservations_for_2018
 FROM `hotel reservation dataset`
 WHERE SUBSTRING(arrival_date, 7, 4) ='2018';
 
 -- 5. The most commonly booked room type
 SELECT  room_type_reserved, 
   COUNT(Booking_ID) as number_of_reservations
 FROM `hotel reservation dataset`
 GROUP BY room_type_reserved
 ORDER BY COUNT(Booking_ID) desc
 LIMIT 1;
 
 -- 6. Number of reservations that fall  on a weekend (no_of_weekend_nights > 0)
SELECT COUNT(Booking_ID) as Weekend_Reservations
 FROM `hotel reservation dataset`
 WHERE no_of_weekend_nights > 0;
 
 -- 7. The highest and lowest lead time for reservations
 SELECT MAX(lead_time) as 'Highest lead time', MIN(lead_time) as 'Lowest lead time'
 FROM `hotel reservation dataset`;
 
 -- 8. The most common market segment type for reservations
 SELECT market_segment_type, 
	COUNT(market_segment_type)  as number_market_segment
  FROM `hotel reservation dataset`
  GROUP BY market_segment_type
  ORDER BY COUNT(market_segment_type) desc
  LIMIT 1;
  
  -- 9. The number of reservations that have a booking status of 'Confirmed'
  SELECT COUNT(Booking_ID) as 'Number of reservations confirmed'
  FROM `hotel reservation dataset`
  WHERE booking_status = 'Not_Canceled';
  
  -- 10. The total number of adults and children across all reservations
  SELECT SUM(no_of_adults) as 'Total number of adults',SUM(no_of_children) as 'Total number of children' 
  FROM `hotel reservation dataset`;
 
 -- 11. The average number of weekend nights for reservations involving children
 SELECT AVG(no_of_weekend_nights) as Avg_children_weekend_nights
  FROM `hotel reservation dataset`
  WHERE no_of_children>0;
  
  -- 12. The number of reservations made in each month of the year
SELECT SUBSTRING(arrival_date,4,2) as Month , 
	SUBSTRING(arrival_date,7,4) as Year, 
	COUNT(Booking_ID) as 'Number of reservations'
FROM `hotel reservation dataset`
GROUP BY  Month, Year
ORDER BY Year, Month;

 -- 13. The  average number of nights (both weekend and weekday) spent by guests for each room  type
SELECT room_type_reserved, 
   AVG(no_of_weekend_nights + no_of_week_nights) as average_number_of_nights
FROM `hotel reservation dataset`
GROUP BY room_type_reserved;

 -- 14. . For reservations involving children, what is the most common room type, and what is the average price for that room type
 SELECT room_type_reserved, COUNT(Booking_ID) as children_reservations , 
 AVG(avg_price_per_room) as Avg_price_room_type
 FROM `hotel reservation dataset`
 WHERE no_of_children > 0
 GROUP BY room_type_reserved 
 ORDER BY children_reservations desc
 LIMIT 1;
 
  -- 15. The market segment type that generates the highest average price per room
  SELECT market_segment_type, 
	MAX(avg_price_per_room) as Highest_avg_price_per_room
  FROM `hotel reservation dataset`
  GROUP BY market_segment_type
  ORDER BY MAX(avg_price_per_room) desc
  LIMIT 1; 
 