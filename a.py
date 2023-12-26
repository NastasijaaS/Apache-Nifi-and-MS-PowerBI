from datetime import datetime, timedelta
from org.apache.commons.io import IOUtils
from java.nio.charset import StandardCharsets
from org.apache.nifi.processor.io import InputStreamCallback
import json
from java.lang import Object
from jarray import array


class PyInputStreamCallback(InputStreamCallback):
    def __init__(self):
        pass
    def process(self, inputStream):
        global loadedJsonObject
        text = IOUtils.toString(inputStream, StandardCharsets.UTF_8)
        loadedJsonObject = json.loads(text)
# end class

flowFile = session.get()
time = 0

# menjamo ovaj deo koda!
if(flowFile != None):

    DEPARTURE = flowFile.getAttribute('DEPARTURE_DATE_TIME')    # 
    ARRIVAL = flowFile.getAttribute('ARRIVAL_DATE_TIME')        # 

    #passedTime = (int)(abs((arrival - ref).total_seconds() / 60 - (departure - ref).total_seconds() / 60))
    passedTime = (int)(abs(datetime.strptime(ARRIVAL, '%d-%m-%Y %H:%M:%S') - datetime.strptime(DEPARTURE, '%d-%m-%Y %H:%M:%S')).total_seconds() / 60)

# /menjamo ovaj deo koda!

flowFile = session.putAttribute(flowFile, 'FLIGHT_LENGTH', str(passedTime))

session.transfer(flowFile, REL_SUCCESS)