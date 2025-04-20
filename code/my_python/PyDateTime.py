import datetime

print("\nGET -------------------------------------------------------------------------------------\n")

# yyyy-mm-dd hh:mm:ss.microseconds
date = datetime.datetime.now()
print(date) # 2024-02-17 13:17:06.550889

# get year
print(date.year) #2024
print(date.today()) # 2024-02-17 13:25:52.464331
print(date.day) # 17 day of this month
print(date.timetz()) # 13:25:52.464303

# format date
print(date.strftime("%d")) # 17 - Day of month 01-31
print(date.strftime("%m")) # 02 - Month as a number 01-12
print(date.strftime("%y")) # 24 - Year, short version, without century
print(date.strftime("%Y")) # 2024 - Year, full version

print(date.strftime("%H")) # 13 - Hour 00-23
print(date.strftime("%I")) # 01 - Hour 00-12
print(date.strftime("%p")) # PM - AM/PM
print(date.strftime("%M")) # 41 - Minute 00-59
print(date.strftime("%S")) # 32 - Second 00-59
print(date.strftime("%f")) # 794289 - Microsecond 000000-999999

print(date.strftime("%w")) # 6 - Weekday as a number 0-6, 0 is Sunday
print(date.strftime("%A")) # Saturday - Weekday, full version
print(date.strftime("%a")) # Sat - Weekday, short version
print(date.strftime("%b")) # Feb - Month name, short version
print(date.strftime("%B")) # February - Month name, full version

print(date.strftime("%j")) # 048 th day of year 2024 - Day number of year 001-366
print(date.strftime("%U")) # 06 th week of year 2024 - Week number of year, Sunday as the first day of week, 00-53
print(date.strftime("%W")) # 07 th week of year 2024 - Week number of year, Monday as the first day of week, 00-53
print(date.strftime("%c")) # Sat Feb 17 13:45:24 2024 - Local version of date and time
print(date.strftime("%C")) # 20 th Century
print(date.strftime("%x")) # 02/17/24 - Local version of date
print(date.strftime("%X")) # 13:46:33 - Local version of time
print(date.strftime("%%")) # % - A % character
print(date.strftime("%G")) # 2024 - ISO 8601 year
print(date.strftime("%u")) # 6 - ISO 8601 weekday (1-7)
print(date.strftime("%V")) # 07 - ISO 8601 weeknumber (01-53)
print(date.strftime("%z")) #  - UTC offset
print(date.strftime("%Z")) #  - Timezone

print("\nCREATE -------------------------------------------------------------------------------------\n")

todays_date = datetime.datetime(2024, 2, 17) # timezone is None
todays_time = datetime.datetime(2024, 2, 17, 13, 45, 16, 333, None)
print(todays_date) # 2024-02-17 00:00:00
print(todays_time) # 2024-02-17 13:45:16.000333


