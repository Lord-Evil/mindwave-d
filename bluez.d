module bluez;
import std.stdio;
import core.stdc.string;
import std.typecons;
import core.stdc.stdlib;
import std.format;
import std.conv: to;
import std.string;
import std.socket;
import core.sys.posix.unistd;
import core.stdc.errno;

import hci_lib;
import hci;
import bluetooth;
import rfcomm;

alias RemoteDevice=Tuple!(string, "address", string, "name");
class Bluez
{
	int sock;
	int deviceID;
	this(int _deviceID=-1){
		this.deviceID=_deviceID;
		if(deviceID==-1){
			deviceID = hci_get_route(null);
		}
		if (deviceID < 0) {
	    	throw new Exception("No Bluetooth Adapter Available");
		}
		//writeln(deviceID);
		sock = _gethcisock(deviceID);
		//writeln(sock);
		if (sock < 0) {
	    	throw new Exception("Error opening socket");
		}
	}
	~this(){
		hci_close_dev(deviceID);
		close(sock);
	}
	RemoteDevice[] discover_devices(int duration=8){
		RemoteDevice[] devices;

	    int max_rsp = 255;
	    int flags = IREQ_CACHE_FLUSH;
	    inquiry_info* ii = cast(inquiry_info*)malloc(max_rsp * inquiry_info.sizeof);

		int num_rsp = hci_inquiry(deviceID, duration, max_rsp, null, &ii, flags);
		if( num_rsp < 0 ){
			throw new Exception("Error hci_inquiry");
		}
		//writeln("Found ",num_rsp," devices");
		string addr;
	    char* name = cast(char*)malloc(248);
		for (int i = 0; i < num_rsp; i++) {
			addr=_ba2str(&(ii[i].bdaddr));
	        if (hci_read_remote_name(sock, &(ii[i].bdaddr), 248, name, 0) < 0)
	        	writeln("[unknown]");
	        else{
	        	//writeln(addr,"\t", to!string(name));
	        	devices~=RemoteDevice(addr,to!string(name));
	        }
	    }
	    free(ii);
	    free(name);
	    return devices;
	}
}

public class BluetoothSocket
{
private:
	int sock;
public:
	this()
	{
	}
	int bconnect(string address)
	{
		int res;
		this.sock = socket(AF_BLUETOOTH, SOCK_STREAM, BTPROTO_RFCOMM);

		sockaddr_rc addr;
		addr.rc_family = AF_BLUETOOTH;
		addr.rc_channel = 1;

		auto dest = toStringz(address);
		writeln("Connection to ",address);
		
		str2ba( dest, &addr.rc_bdaddr );
		res = connect(sock, cast(const(sockaddr*))&addr, cast(uint)addr.sizeof);
		return res;
	}
	string brecv(ulong size){
		char *resp = cast(char*)malloc(size);
		//writeln("Attempting to read ", size, " bytes");
		long i = recv(this.sock, cast(void*)resp, size, 0);
		//writeln(resp[0..i]);
		//writeln(to!string(resp[0..i]));
		//writeln("Got ", i, " bytes");
		if(i<0) {
			auto msg = "Can't read from socket; Error: "~strerror(errno).to!string;
			throw new Exception(msg);
		}
		return to!string(resp[0..i]);
	}
	~this(){
		close(sock);
	}
}
int _gethcisock(int device_id = -1)
{
    try
    {
        return hci_open_dev (device_id);
    }
    catch(Exception)
    {
        throw new Exception("error accessing bluetooth device");
    }
}
string _ba2str(const(bdaddr_t)* ba){
	return format("%2.2X:%2.2X:%2.2X:%2.2X:%2.2X:%2.2X",ba.b[5], ba.b[4], ba.b[3], ba.b[2], ba.b[1], ba.b[0]);
}