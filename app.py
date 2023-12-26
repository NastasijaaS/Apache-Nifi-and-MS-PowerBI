from random import randint
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

time = randint(0, 6) * 60 + 20

flowFile = session.putAttribute(flowFile, 'FLIGHT_LENGTH', str(time))

session.transfer(flowFile, REL_SUCCESS)
