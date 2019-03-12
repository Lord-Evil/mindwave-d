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

extern (C):

enum ETH_ALEN = 6; /* from <net/ethernet.h> */

/* BNEP UUIDs */
enum BNEP_BASE_UUID = 0x0000000000001000800000805F9B34FB;
enum BNEP_UUID16 = 0x02;
enum BNEP_UUID32 = 0x04;
enum BNEP_UUID128 = 0x16;

enum BNEP_SVC_PANU = 0x1115;
enum BNEP_SVC_NAP = 0x1116;
enum BNEP_SVC_GN = 0x1117;

/* BNEP packet types */
enum BNEP_GENERAL = 0x00;
enum BNEP_CONTROL = 0x01;
enum BNEP_COMPRESSED = 0x02;
enum BNEP_COMPRESSED_SRC_ONLY = 0x03;
enum BNEP_COMPRESSED_DST_ONLY = 0x04;

/* BNEP control types */
enum BNEP_CMD_NOT_UNDERSTOOD = 0x00;
enum BNEP_SETUP_CONN_REQ = 0x01;
enum BNEP_SETUP_CONN_RSP = 0x02;
enum BNEP_FILTER_NET_TYPE_SET = 0x03;
enum BNEP_FILTER_NET_TYPE_RSP = 0x04;
enum BNEP_FILTER_MULT_ADDR_SET = 0x05;
enum BNEP_FILTER_MULT_ADDR_RSP = 0x06;

/* BNEP response messages */
enum BNEP_SUCCESS = 0x00;

enum BNEP_CONN_INVALID_DST = 0x01;
enum BNEP_CONN_INVALID_SRC = 0x02;
enum BNEP_CONN_INVALID_SVC = 0x03;
enum BNEP_CONN_NOT_ALLOWED = 0x04;

enum BNEP_FILTER_UNSUPPORTED_REQ = 0x01;
enum BNEP_FILTER_INVALID_RANGE = 0x02;
enum BNEP_FILTER_INVALID_MCADDR = 0x02;
enum BNEP_FILTER_LIMIT_REACHED = 0x03;
enum BNEP_FILTER_DENIED_SECURITY = 0x04;

/* L2CAP settings */
enum BNEP_MTU = 1691;
enum BNEP_FLUSH_TO = 0xffff;
enum BNEP_CONNECT_TO = 15;
enum BNEP_FILTER_TO = 15;

enum BNEP_PSM = 0x0f;

/* BNEP headers */
enum BNEP_TYPE_MASK = 0x7f;
enum BNEP_EXT_HEADER = 0x80;

struct bnep_setup_conn_req
{
    align (1):

    ubyte type;
    ubyte ctrl;
    ubyte uuid_size;
    ubyte[0] service;
}

struct bnep_set_filter_req
{
    align (1):

    ubyte type;
    ubyte ctrl;
    ushort len;
    ubyte[0] list;
}

struct bnep_ctrl_cmd_not_understood_cmd
{
    align (1):

    ubyte type;
    ubyte ctrl;
    ubyte unkn_ctrl;
}

struct bnep_control_rsp
{
    align (1):

    ubyte type;
    ubyte ctrl;
    ushort resp;
}

struct bnep_ext_hdr
{
    align (1):

    ubyte type;
    ubyte len;
    ubyte[0] data;
}

/* BNEP ioctl defines */
enum BNEPCONNADD = _IOW('B', 200, int);
enum BNEPCONNDEL = _IOW('B', 201, int);
enum BNEPGETCONNLIST = _IOR('B', 210, int);
enum BNEPGETCONNINFO = _IOR('B', 211, int);
enum BNEPGETSUPPFEAT = _IOR('B', 212, int);

enum BNEP_SETUP_RESPONSE = 0;

struct bnep_connadd_req
{
    int sock; /* Connected socket */
    uint flags;
    ushort role;
    char[16] device; /* Name of the Ethernet device */
}

struct bnep_conndel_req
{
    uint flags;
    ubyte[ETH_ALEN] dst;
}

struct bnep_conninfo
{
    uint flags;
    ushort role;
    ushort state;
    ubyte[ETH_ALEN] dst;
    char[16] device;
}

struct bnep_connlist_req
{
    uint cnum;
    bnep_conninfo* ci;
}

/* __BNEP_H */
