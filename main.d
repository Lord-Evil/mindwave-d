import std.stdio;
import bluez;
import bluetooth;
import std.file;
import std.conv;
import core.exception;
void main(){
	/*
	auto reader = new MindwaveMobileRawReader("00:81:F9:12:B0:95");
	reader.connectToMindWaveMobile();
	char[] bytes = reader.getBytes(100000);
	std.file.write("bytes",bytes);
	
	*/
	char[] bytes = new char[100000];
	bytes = cast(char[])std.file.read("bytes",100000);
	string data=bytes.to!string;
	auto parser = new MindwavePacketPayloadParser(data);
	writeln(parser.parseDataPoints);

}

class MindwaveDataPointReader
{
private:
	MindwaveMobileRawReader rawReader;
public:
	this(string address=null){
		rawReader = new MindwaveMobileRawReader(address);

	}
}

abstract class DataPoint
{
private:
	string _dataValueBytes;
}


class MindwavePacketPayloadParser{
	char EXTENDED_CODE_BYTE = 0x55;
	int _payloadIndex;
	string _payloadBytes;
public:
	this(string payloadBytes){
		this._payloadBytes=payloadBytes;
		this._payloadIndex=0;
	}
	string[] parseDataPoints(){
		string[] dataPoints;
		while(!this._atEndOfPayloadBytes){
			try{
				string dataPoint = this._parseOneDataPoint();
				dataPoints~=dataPoint;
			}catch(core.exception.RangeError){
				break;
			}
		}
		return dataPoints;
	}
	bool _atEndOfPayloadBytes(){
		return this._payloadIndex == this._payloadBytes.length;
	}
	string _parseOneDataPoint(){
		char dataRowCode = this._extractDataRowCode();
        string dataRowValueBytes = this._extractDataRowValueBytes(dataRowCode);
        return this._createDataPoint(dataRowCode, dataRowValueBytes);
	}
	char _extractDataRowCode(){
        return this._ignoreExtendedCodeBytesAndGetRowCode();
	}
        
    char _ignoreExtendedCodeBytesAndGetRowCode(){
        //# EXTENDED_CODE_BYTES seem not to be used according to 
        //# http://wearcam.org/ece516/mindset_communications_protocol.pdf
        //# (August 2012)
        //# so we ignore them
        char b = this._getNextByte();
        while (b == EXTENDED_CODE_BYTE)
            b = this._getNextByte();
        return b;
    }
       
    char _getNextByte(){
        char nextByte = this._payloadBytes[this._payloadIndex];
        this._payloadIndex++;
        return nextByte;
    }

    string _getNextBytes(uint amountOfBytes){
    	writeln(amountOfBytes);
        string nextBytes = this._payloadBytes[this._payloadIndex..(this._payloadIndex + amountOfBytes)];
        this._payloadIndex += amountOfBytes;
        return nextBytes;
    }
    
    string _extractDataRowValueBytes(char dataRowCode){
        uint lengthOfValueBytes = this._extractLengthOfValueBytes(dataRowCode);
        string dataRowValueBytes = this._getNextBytes(lengthOfValueBytes);
        return dataRowValueBytes;
    }
       
    uint _extractLengthOfValueBytes(char dataRowCode){
        //# If code is one of the mysterious initial code values
        //# return before the extended code check
        if(dataRowCode == '\xBA' || dataRowCode == '\xBC')
            return 1;

        bool dataRowHasLengthByte = dataRowCode > '\x7f';
        if (dataRowHasLengthByte)
            return this._getNextByte();
        else
            return 1;
    }
        
    string _createDataPoint(char dataRowCode, string dataRowValueBytes){
    	switch(dataRowCode){
    		case '\x02':
    			return "PoorSignalLevelDataPoint";
    		case '\x04':
            	return "AttentionDataPoint";
    		case '\x05':
            	return "MeditationDataPoint";
    		case '\x16':
            	return "BlinkDataPoint";
    		case '\x80':
            	return "RawDataPoint";
    		case '\x83':
            	return "EEGPowersDataPoint";
    		case '\xba':
    		case '\xbc':
            	return "UnknownDataPoint";
    		default:
    			return ""~dataRowCode;
    	}
	}
}

class MindwaveMobileRawReader
{
private:
	char[] _buffer;
	int _bufferPos = 0;
	int _bufferPosition = 0;
	bool _isConnected = false;
	string _mindwaveMobileAddress;
	Bluez bt;
	BluetoothSocket bsock;

	string _findMindwaveMobileAddress(){
		auto devices = bt.discover_devices();
		foreach(RemoteDevice device; devices){
			if(device.name == "MindWave Mobile"){
				writeln("Found device: ",device.address);
				return device.address;
			}
		}
		return null;
	}
	void _connectToAddress(string address=""){
		bsock = new BluetoothSocket();
		if(address.length==0)
			address=this._mindwaveMobileAddress;
		int status = bsock.bconnect(address);
		if(status>-1){
			this._isConnected=true;
			writeln("Connected");
		}else{
			throw new Exception("Unable to connect");
		}
	}
	void _printErrorDiscoveryMessage(){
		writeln("Could not discover Mindwave Mobile. Please make sure the\nMindwave Mobile device is in pairing mode and your computer\nhas bluetooth enabled.");
	}
	void _readMoreBytesIntoBuffer(int size){
		string newBytes = this._readBytesFromMindwaveMobile(size);
        this._buffer ~= newBytes;
	}
	string _readBytesFromMindwaveMobile(ulong size){
		ulong missingBytes=size;
		string receivedBytes;
		while(missingBytes>0){
			receivedBytes ~= bsock.brecv(missingBytes);
			//writeln("rec ",receivedBytes.length);
            missingBytes = size - receivedBytes.length;
		}
		return receivedBytes;
	}
	void _ensureMoreBytesCanBeRead(int size){
		if (this._bufferSize() <= this._bufferPosition + size){
    	    this._readMoreBytesIntoBuffer(size);
		}
	}
	char _getNextByte(){
		//char nextByte = ord(this._buffer[this._bufferPosition]);
		char nextByte = this._buffer[this._bufferPosition];
        this._bufferPosition++;
        return nextByte;
	}
	char[] _getNextBytes(int size){
		char[] bytes = this._buffer[this._bufferPosition..size];
		this._bufferPosition+=size;
		return bytes;
	}
	ulong _bufferSize(){
		return this._buffer.length;
	}
public:
	char START_OF_PACKET_BYTE = 0xaa;
	this(string address=null){
		if(address!=null)
			this._mindwaveMobileAddress=address;
	}
	void connectToMindWaveMobile(){
		bt = new Bluez();
        if (this._mindwaveMobileAddress==null)
    		this._mindwaveMobileAddress = this._findMindwaveMobileAddress();
		if (this._mindwaveMobileAddress!=null)
    		writeln("Discovered Mindwave Mobile...");
    		this._connectToAddress();
	}
	@property
	bool isConnected(){
		return _isConnected;
	}
/*	char peekByte(){
		this._ensureMoreBytesCanBeRead();
        return this._buffer[this._bufferPosition];
	}*/
	char getByte(){
		this._ensureMoreBytesCanBeRead(100);
		return this._getNextByte();
	}
	char[] getBytes(int size){//done
		this._ensureMoreBytesCanBeRead(size);
		return this._getNextBytes(size);
	}
	void clearAlreadyReadBuffer(){
		_buffer=_buffer[_bufferPosition..$];
		_bufferPosition=0;
	}
}