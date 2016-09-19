SELECT name, utc_offset
FROM pg_timezone_names
WHERE name IN ('Europe/Moscow', 'Asia/Omsk', 'US/Pacific');