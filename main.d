import std.stdio;
import bluez;
import bluetooth;

void main(){
	auto reader = new MindwaveMobileRawReader("00:81:F9:12:B0:95");
	reader.connectToMindWaveMobile();
	writeln(reader.getBytes(100));
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
        this._bufferPosition += 1;
        return nextByte;
	}
	char[] _getNextBytes(int size){
		char[] bytes = new char[size];
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
	int peekByte(){
		return 1;
	}
	char getByte(){
		this._ensureMoreBytesCanBeRead(100);
		return this._getNextByte();
	}
	char[] getBytes(int size){//done
		this._ensureMoreBytesCanBeRead(size);
		return this._getNextBytes(size);
	}
	void clearAlreadyReadBuffer(){}
}