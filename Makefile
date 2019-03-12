all:
	dmd -of=mindwave-d main.d bluez.d dlib/rfcomm.d dlib/bluetooth.d dlib/hci.d dlib/hci_lib.d -L-L/usr/lib -L-lbluetooth -g
