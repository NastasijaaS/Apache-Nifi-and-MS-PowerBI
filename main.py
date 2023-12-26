from datetime import datetime, timedelta

ref = datetime.strptime('01-01-1970 00:00:00', '%d-%m-%Y %H:%M:%S')

DEPARTURE = '08-10-2021 12:10:00'       # as str
ARRIVAL = '16-12-2019 12:12:00'         # as str

departure = datetime.strptime(DEPARTURE, '%d-%m-%Y %H:%M:%S')   # :datetime
arrival = datetime.strptime(ARRIVAL, '%d-%m-%Y %H:%M:%S')       # :datetime

timePassed = (int)(abs(departure - arrival).total_seconds() / 60)

print(timePassed)

# print(passedTime)
# /menjamo ovaj deo koda!
