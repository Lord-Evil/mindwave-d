import std.stdio;
import bluez;
import bluetooth;

void main(){
	auto reader = new MindwaveMobileRawReader();
	reader.connectToMindWaveMobile();

}

class MindwaveMobileRawReader
{
private:
	char[] _buffer;
	int _bufferPos = 0;
	bool _isConnected = false;
	string _mindwaveMobileAddress;
	Bluez bt;
	BluetoothSocket bsock;

	string _findMindwaveMobileAddress(){
		auto devices = bt.discover_devices();
		foreach(RemoteDevice device; devices){
			if(device.name == "MindWave Mobile")
				return device.address;
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
			writeln("Unable to connect");
		}
	}
	void _printErrorDiscoveryMessage(){
		writeln("Could not discover Mindwave Mobile. Please make sure the\nMindwave Mobile device is in pairing mode and your computer\nhas bluetooth enabled.");
	}
	void _readMoreBytesIntoBuffer(int size){}
	void _readBytesFromMindwaveMobile(int size){}
	void _ensureMoreBytesCanBeRead(int size){}
	char _getNextByte(){
		return 'a';
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
	int* mindwaveMobileSocket;
	this(){
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