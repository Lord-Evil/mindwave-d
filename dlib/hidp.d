/*
 *
 *  BlueZ - Bluetooth protocol stack for Linux
 *
 *  Copyright (C) 2003-2010  Marcel Holtmann <marcel@holtmann.org>
 *
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */

extern (C):

/* HIDP defaults */
enum HIDP_MINIMUM_MTU = 48;
enum HIDP_DEFAULT_MTU = 48;

/* HIDP ioctl defines */
enum HIDPCONNADD = _IOW('H', 200, int);
enum HIDPCONNDEL = _IOW('H', 201, int);
enum HIDPGETCONNLIST = _IOR('H', 210, int);
enum HIDPGETCONNINFO = _IOR('H', 211, int);

enum HIDP_VIRTUAL_CABLE_UNPLUG = 0;
enum HIDP_BOOT_PROTOCOL_MODE = 1;
enum HIDP_BLUETOOTH_VENDOR_ID = 9;

struct hidp_connadd_req
{
    int ctrl_sock; /* Connected control socket */
    int intr_sock; /* Connected interrupt socket */
    ushort parser; /* Parser version */
    ushort rd_size; /* Report descriptor size */
    ubyte* rd_data; /* Report descriptor data */
    ubyte country;
    ubyte subclass;
    ushort vendor;
    ushort product;
    ushort version_;
    uint flags;
    uint idle_to;
    char[128] name; /* Device name */
}

struct hidp_conndel_req
{
    bdaddr_t bdaddr;
    uint flags;
}

struct hidp_conninfo
{
    bdaddr_t bdaddr;
    uint flags;
    ushort state;
    ushort vendor;
    ushort product;
    ushort version_;
    char[128] name;
}

struct hidp_connlist_req
{
    uint cnum;
    hidp_conninfo* ci;
}

/* __HIDP_H */
