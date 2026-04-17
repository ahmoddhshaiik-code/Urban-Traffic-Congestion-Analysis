create database traffic_congestion;
use traffic_congestion;

-- 1. What are peak traffic hours based on highest traffic volume?
SELECT HOUR(date_time) AS hour, AVG(traffic_volume) AS avg_traffic
FROM traffic_data
GROUP BY HOUR(date_time)
ORDER BY avg_traffic DESC;

-- 2. Which city zones experience the highest congestion?
SELECT city_zone, COUNT(*) AS total_records
FROM traffic_data
WHERE congestion_level = 'High'
GROUP BY city_zone
ORDER BY total_records DESC;

-- 3. How does weather affect average speed?
SELECT weather_condition, AVG(average_speed_kmph) AS avg_speed
FROM traffic_data
GROUP BY weather_condition
ORDER BY avg_speed ASC;

-- 4. Does accident occurrence increase travel time?
SELECT accident_reported, AVG(travel_time_minutes) AS avg_travel_time
FROM traffic_data
GROUP BY accident_reported;

-- 5. Which road type has highest traffic volume?
SELECT road_type, AVG(traffic_volume) AS avg_volume
FROM traffic_data
GROUP BY road_type
ORDER BY avg_volume DESC;

-- 6. What is the relationship between congestion level and travel time?
SELECT congestion_level, AVG(travel_time_minutes) AS avg_travel_time
FROM traffic_data
GROUP BY congestion_level
ORDER BY avg_travel_time DESC;

-- 7. Identify top 10 highest travel time records
SELECT *
FROM traffic_data
ORDER BY travel_time_minutes DESC
LIMIT 10;

-- 8. Compare traffic volume across city zones and road types
SELECT city_zone, road_type, AVG(traffic_volume) AS avg_volume
FROM traffic_data
GROUP BY city_zone, road_type
ORDER BY avg_volume DESC;

-- 9. Hourly congestion level distribution
SELECT HOUR(date_time) AS hour, congestion_level, COUNT(*) AS count
FROM traffic_data
GROUP BY HOUR(date_time), congestion_level
ORDER BY hour;