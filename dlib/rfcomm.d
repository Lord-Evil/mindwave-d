/*
 *
 *  BlueZ - Bluetooth protocol stack for Linux
 *
 *  Copyright (C) 2002-2003  Maxim Krasnyansky <maxk@qualcomm.com>
 *  Copyright (C) 2002-2010  Marcel Holtmann <marcel@holtmann.org>
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

import core.sys.posix.netinet.in_;
import core.sys.posix.sys.ioctl;
import bluetooth;

extern (C):

/* RFCOMM defaults */
enum RFCOMM_DEFAULT_MTU = 127;

enum RFCOMM_PSM = 3;

/* RFCOMM socket address */
struct sockaddr_rc
{
    sa_family_t rc_family;
    bdaddr_t rc_bdaddr;
    ubyte rc_channel;
}

/* RFCOMM socket options */
enum RFCOMM_CONNINFO = 0x02;

struct rfcomm_conninfo
{
    ushort hci_handle;
    ubyte[3] dev_class;
}

enum RFCOMM_LM = 0x03;
enum RFCOMM_LM_MASTER = 0x0001;
enum RFCOMM_LM_AUTH = 0x0002;
enum RFCOMM_LM_ENCRYPT = 0x0004;
enum RFCOMM_LM_TRUSTED = 0x0008;
enum RFCOMM_LM_RELIABLE = 0x0010;
enum RFCOMM_LM_SECURE = 0x0020;

/* RFCOMM TTY support */
enum RFCOMM_MAX_DEV = 256;

enum RFCOMMCREATEDEV = _IOW!int('R', 200);
enum RFCOMMRELEASEDEV = _IOW!int('R', 201);
enum RFCOMMGETDEVLIST = _IOR!int('R', 210);
enum RFCOMMGETDEVINFO = _IOR!int('R', 211);

struct rfcomm_dev_req
{
    short dev_id;
    uint flags;
    bdaddr_t src;
    bdaddr_t dst;
    ubyte channel;
}

enum RFCOMM_REUSE_DLC = 0;
enum RFCOMM_RELEASE_ONHUP = 1;
enum RFCOMM_HANGUP_NOW = 2;
enum RFCOMM_TTY_ATTACHED = 3;

struct rfcomm_dev_info
{
    short id;
    uint flags;
    ushort state;
    bdaddr_t src;
    bdaddr_t dst;
    ubyte channel;
}

struct rfcomm_dev_list_req
{
    ushort dev_num;
    rfcomm_dev_info[0] dev_info;
}

/* __RFCOMM_H */
