/*
 *
 *  BlueZ - Bluetooth protocol stack for Linux
 *
 *  Copyright (C) 2000-2001  Qualcomm Incorporated
 *  Copyright (C) 2002-2003  Maxim Krasnyansky <maxk@qualcomm.com>
 *  Copyright (C) 2002-2010  Marcel Holtmann <marcel@holtmann.org>
 *  Copyright (c) 2012       Code Aurora Forum. All rights reserved.
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

extern (C):

/* L2CAP defaults */
enum L2CAP_DEFAULT_MTU = 672;
enum L2CAP_DEFAULT_FLUSH_TO = 0xFFFF;

/* L2CAP socket address */
struct sockaddr_l2
{
    sa_family_t l2_family;
    ushort l2_psm;
    bdaddr_t l2_bdaddr;
    ushort l2_cid;
    ubyte l2_bdaddr_type;
}

/* L2CAP socket options */
enum L2CAP_OPTIONS = 0x01;

struct l2cap_options
{
    ushort omtu;
    ushort imtu;
    ushort flush_to;
    ubyte mode;
    ubyte fcs;
    ubyte max_tx;
    ushort txwin_size;
}

enum L2CAP_CONNINFO = 0x02;

struct l2cap_conninfo
{
    ushort hci_handle;
    ubyte[3] dev_class;
}

enum L2CAP_LM = 0x03;
enum L2CAP_LM_MASTER = 0x0001;
enum L2CAP_LM_AUTH = 0x0002;
enum L2CAP_LM_ENCRYPT = 0x0004;
enum L2CAP_LM_TRUSTED = 0x0008;
enum L2CAP_LM_RELIABLE = 0x0010;
enum L2CAP_LM_SECURE = 0x0020;

/* L2CAP command codes */
enum L2CAP_COMMAND_REJ = 0x01;
enum L2CAP_CONN_REQ = 0x02;
enum L2CAP_CONN_RSP = 0x03;
enum L2CAP_CONF_REQ = 0x04;
enum L2CAP_CONF_RSP = 0x05;
enum L2CAP_DISCONN_REQ = 0x06;
enum L2CAP_DISCONN_RSP = 0x07;
enum L2CAP_ECHO_REQ = 0x08;
enum L2CAP_ECHO_RSP = 0x09;
enum L2CAP_INFO_REQ = 0x0a;
enum L2CAP_INFO_RSP = 0x0b;
enum L2CAP_CREATE_REQ = 0x0c;
enum L2CAP_CREATE_RSP = 0x0d;
enum L2CAP_MOVE_REQ = 0x0e;
enum L2CAP_MOVE_RSP = 0x0f;
enum L2CAP_MOVE_CFM = 0x10;
enum L2CAP_MOVE_CFM_RSP = 0x11;

/* L2CAP extended feature mask */
enum L2CAP_FEAT_FLOWCTL = 0x00000001;
enum L2CAP_FEAT_RETRANS = 0x00000002;
enum L2CAP_FEAT_BIDIR_QOS = 0x00000004;
enum L2CAP_FEAT_ERTM = 0x00000008;
enum L2CAP_FEAT_STREAMING = 0x00000010;
enum L2CAP_FEAT_FCS = 0x00000020;
enum L2CAP_FEAT_EXT_FLOW = 0x00000040;
enum L2CAP_FEAT_FIXED_CHAN = 0x00000080;
enum L2CAP_FEAT_EXT_WINDOW = 0x00000100;
enum L2CAP_FEAT_UCD = 0x00000200;

/* L2CAP fixed channels */
enum L2CAP_FC_L2CAP = 0x02;
enum L2CAP_FC_CONNLESS = 0x04;
enum L2CAP_FC_A2MP = 0x08;

/* L2CAP structures */
struct l2cap_hdr
{
    align (1):

    ushort len;
    ushort cid;
}

enum L2CAP_HDR_SIZE = 4;

struct l2cap_cmd_hdr
{
    align (1):

    ubyte code;
    ubyte ident;
    ushort len;
}

enum L2CAP_CMD_HDR_SIZE = 4;

struct l2cap_cmd_rej
{
    align (1):

    ushort reason;
}

enum L2CAP_CMD_REJ_SIZE = 2;

struct l2cap_conn_req
{
    align (1):

    ushort psm;
    ushort scid;
}

enum L2CAP_CONN_REQ_SIZE = 4;

struct l2cap_conn_rsp
{
    align (1):

    ushort dcid;
    ushort scid;
    ushort result;
    ushort status;
}

enum L2CAP_CONN_RSP_SIZE = 8;

/* connect result */
enum L2CAP_CR_SUCCESS = 0x0000;
enum L2CAP_CR_PEND = 0x0001;
enum L2CAP_CR_BAD_PSM = 0x0002;
enum L2CAP_CR_SEC_BLOCK = 0x0003;
enum L2CAP_CR_NO_MEM = 0x0004;

/* connect status */
enum L2CAP_CS_NO_INFO = 0x0000;
enum L2CAP_CS_AUTHEN_PEND = 0x0001;
enum L2CAP_CS_AUTHOR_PEND = 0x0002;

struct l2cap_conf_req
{
    align (1):

    ushort dcid;
    ushort flags;
    ubyte[0] data;
}

enum L2CAP_CONF_REQ_SIZE = 4;

struct l2cap_conf_rsp
{
    align (1):

    ushort scid;
    ushort flags;
    ushort result;
    ubyte[0] data;
}

enum L2CAP_CONF_RSP_SIZE = 6;

enum L2CAP_CONF_SUCCESS = 0x0000;
enum L2CAP_CONF_UNACCEPT = 0x0001;
enum L2CAP_CONF_REJECT = 0x0002;
enum L2CAP_CONF_UNKNOWN = 0x0003;
enum L2CAP_CONF_PENDING = 0x0004;
enum L2CAP_CONF_EFS_REJECT = 0x0005;

struct l2cap_conf_opt
{
    align (1):

    ubyte type;
    ubyte len;
    ubyte[0] val;
}

enum L2CAP_CONF_OPT_SIZE = 2;

enum L2CAP_CONF_MTU = 0x01;
enum L2CAP_CONF_FLUSH_TO = 0x02;
enum L2CAP_CONF_QOS = 0x03;
enum L2CAP_CONF_RFC = 0x04;
enum L2CAP_CONF_FCS = 0x05;
enum L2CAP_CONF_EFS = 0x06;
enum L2CAP_CONF_EWS = 0x07;

enum L2CAP_CONF_MAX_SIZE = 22;

enum L2CAP_MODE_BASIC = 0x00;
enum L2CAP_MODE_RETRANS = 0x01;
enum L2CAP_MODE_FLOWCTL = 0x02;
enum L2CAP_MODE_ERTM = 0x03;
enum L2CAP_MODE_STREAMING = 0x04;

enum L2CAP_SERVTYPE_NOTRAFFIC = 0x00;
enum L2CAP_SERVTYPE_BESTEFFORT = 0x01;
enum L2CAP_SERVTYPE_GUARANTEED = 0x02;

struct l2cap_disconn_req
{
    align (1):

    ushort dcid;
    ushort scid;
}

enum L2CAP_DISCONN_REQ_SIZE = 4;

struct l2cap_disconn_rsp
{
    align (1):

    ushort dcid;
    ushort scid;
}

enum L2CAP_DISCONN_RSP_SIZE = 4;

struct l2cap_info_req
{
    align (1):

    ushort type;
}

enum L2CAP_INFO_REQ_SIZE = 2;

struct l2cap_info_rsp
{
    align (1):

    ushort type;
    ushort result;
    ubyte[0] data;
}

enum L2CAP_INFO_RSP_SIZE = 4;

/* info type */
enum L2CAP_IT_CL_MTU = 0x0001;
enum L2CAP_IT_FEAT_MASK = 0x0002;

/* info result */
enum L2CAP_IR_SUCCESS = 0x0000;
enum L2CAP_IR_NOTSUPP = 0x0001;

struct l2cap_create_req
{
    align (1):

    ushort psm;
    ushort scid;
    ubyte id;
}

enum L2CAP_CREATE_REQ_SIZE = 5;

struct l2cap_create_rsp
{
    align (1):

    ushort dcid;
    ushort scid;
    ushort result;
    ushort status;
}

enum L2CAP_CREATE_RSP_SIZE = 8;

struct l2cap_move_req
{
    align (1):

    ushort icid;
    ubyte id;
}

enum L2CAP_MOVE_REQ_SIZE = 3;

struct l2cap_move_rsp
{
    align (1):

    ushort icid;
    ushort result;
}

enum L2CAP_MOVE_RSP_SIZE = 4;

struct l2cap_move_cfm
{
    align (1):

    ushort icid;
    ushort result;
}

enum L2CAP_MOVE_CFM_SIZE = 4;

struct l2cap_move_cfm_rsp
{
    align (1):

    ushort icid;
}

enum L2CAP_MOVE_CFM_RSP_SIZE = 2;

/* __L2CAP_H */
