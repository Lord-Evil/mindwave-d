/*
 *
 *  BlueZ - Bluetooth protocol stack for Linux
 *
 *  Copyright (C) 2000-2001  Qualcomm Incorporated
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

enum HCI_MAX_DEV = 16;

enum HCI_MAX_ACL_SIZE = 1492 + 4;
enum HCI_MAX_SCO_SIZE = 255;
enum HCI_MAX_EVENT_SIZE = 260;
enum HCI_MAX_FRAME_SIZE = HCI_MAX_ACL_SIZE + 4;

/* HCI dev events */
enum HCI_DEV_REG = 1;
enum HCI_DEV_UNREG = 2;
enum HCI_DEV_UP = 3;
enum HCI_DEV_DOWN = 4;
enum HCI_DEV_SUSPEND = 5;
enum HCI_DEV_RESUME = 6;

/* HCI bus types */
enum HCI_VIRTUAL = 0;
enum HCI_USB = 1;
enum HCI_PCCARD = 2;
enum HCI_UART = 3;
enum HCI_RS232 = 4;
enum HCI_PCI = 5;
enum HCI_SDIO = 6;
enum HCI_SPI = 7;
enum HCI_I2C = 8;
enum HCI_SMD = 9;

/* HCI controller types */
enum HCI_PRIMARY = 0x00;
enum HCI_AMP = 0x01;
enum HCI_BREDR = HCI_PRIMARY;

/* HCI device flags */
enum
{
    HCI_UP = 0,
    HCI_INIT = 1,
    HCI_RUNNING = 2,

    HCI_PSCAN = 3,
    HCI_ISCAN = 4,
    HCI_AUTH = 5,
    HCI_ENCRYPT = 6,
    HCI_INQUIRY = 7,

    HCI_RAW = 8
}

/* LE address type */
enum
{
    LE_PUBLIC_ADDRESS = 0x00,
    LE_RANDOM_ADDRESS = 0x01
}

/* HCI ioctl defines */
enum HCIDEVUP = _IOW!int('H', 201);
enum HCIDEVDOWN = _IOW!int('H', 202);
enum HCIDEVRESET = _IOW!int('H', 203);
enum HCIDEVRESTAT = _IOW!int('H', 204);

enum HCIGETDEVLIST = _IOR!int('H', 210);
enum HCIGETDEVINFO = _IOR!int('H', 211);
enum HCIGETCONNLIST = _IOR!int('H', 212);
enum HCIGETCONNINFO = _IOR!int('H', 213);
enum HCIGETAUTHINFO = _IOR!int('H', 215);

enum HCISETRAW = _IOW!int('H', 220);
enum HCISETSCAN = _IOW!int('H', 221);
enum HCISETAUTH = _IOW!int('H', 222);
enum HCISETENCRYPT = _IOW!int('H', 223);
enum HCISETPTYPE = _IOW!int('H', 224);
enum HCISETLINKPOL = _IOW!int('H', 225);
enum HCISETLINKMODE = _IOW!int('H', 226);
enum HCISETACLMTU = _IOW!int('H', 227);
enum HCISETSCOMTU = _IOW!int('H', 228);

enum HCIBLOCKADDR = _IOW!int('H', 230);
enum HCIUNBLOCKADDR = _IOW!int('H', 231);

enum HCIINQUIRY = _IOR!int('H', 240);

/* HCI Packet types */
enum HCI_COMMAND_PKT = 0x01;
enum HCI_ACLDATA_PKT = 0x02;
enum HCI_SCODATA_PKT = 0x03;
enum HCI_EVENT_PKT = 0x04;
enum HCI_VENDOR_PKT = 0xff;

/* HCI Packet types */
enum HCI_2DH1 = 0x0002;
enum HCI_3DH1 = 0x0004;
enum HCI_DM1 = 0x0008;
enum HCI_DH1 = 0x0010;
enum HCI_2DH3 = 0x0100;
enum HCI_3DH3 = 0x0200;
enum HCI_DM3 = 0x0400;
enum HCI_DH3 = 0x0800;
enum HCI_2DH5 = 0x1000;
enum HCI_3DH5 = 0x2000;
enum HCI_DM5 = 0x4000;
enum HCI_DH5 = 0x8000;

enum HCI_HV1 = 0x0020;
enum HCI_HV2 = 0x0040;
enum HCI_HV3 = 0x0080;

enum HCI_EV3 = 0x0008;
enum HCI_EV4 = 0x0010;
enum HCI_EV5 = 0x0020;
enum HCI_2EV3 = 0x0040;
enum HCI_3EV3 = 0x0080;
enum HCI_2EV5 = 0x0100;
enum HCI_3EV5 = 0x0200;

enum SCO_PTYPE_MASK = HCI_HV1 | HCI_HV2 | HCI_HV3;
enum ACL_PTYPE_MASK = HCI_DM1 | HCI_DH1 | HCI_DM3 | HCI_DH3 | HCI_DM5 | HCI_DH5;

/* HCI Error codes */
enum HCI_UNKNOWN_COMMAND = 0x01;
enum HCI_NO_CONNECTION = 0x02;
enum HCI_HARDWARE_FAILURE = 0x03;
enum HCI_PAGE_TIMEOUT = 0x04;
enum HCI_AUTHENTICATION_FAILURE = 0x05;
enum HCI_PIN_OR_KEY_MISSING = 0x06;
enum HCI_MEMORY_FULL = 0x07;
enum HCI_CONNECTION_TIMEOUT = 0x08;
enum HCI_MAX_NUMBER_OF_CONNECTIONS = 0x09;
enum HCI_MAX_NUMBER_OF_SCO_CONNECTIONS = 0x0a;
enum HCI_ACL_CONNECTION_EXISTS = 0x0b;
enum HCI_COMMAND_DISALLOWED = 0x0c;
enum HCI_REJECTED_LIMITED_RESOURCES = 0x0d;
enum HCI_REJECTED_SECURITY = 0x0e;
enum HCI_REJECTED_PERSONAL = 0x0f;
enum HCI_HOST_TIMEOUT = 0x10;
enum HCI_UNSUPPORTED_FEATURE = 0x11;
enum HCI_INVALID_PARAMETERS = 0x12;
enum HCI_OE_USER_ENDED_CONNECTION = 0x13;
enum HCI_OE_LOW_RESOURCES = 0x14;
enum HCI_OE_POWER_OFF = 0x15;
enum HCI_CONNECTION_TERMINATED = 0x16;
enum HCI_REPEATED_ATTEMPTS = 0x17;
enum HCI_PAIRING_NOT_ALLOWED = 0x18;
enum HCI_UNKNOWN_LMP_PDU = 0x19;
enum HCI_UNSUPPORTED_REMOTE_FEATURE = 0x1a;
enum HCI_SCO_OFFSET_REJECTED = 0x1b;
enum HCI_SCO_INTERVAL_REJECTED = 0x1c;
enum HCI_AIR_MODE_REJECTED = 0x1d;
enum HCI_INVALID_LMP_PARAMETERS = 0x1e;
enum HCI_UNSPECIFIED_ERROR = 0x1f;
enum HCI_UNSUPPORTED_LMP_PARAMETER_VALUE = 0x20;
enum HCI_ROLE_CHANGE_NOT_ALLOWED = 0x21;
enum HCI_LMP_RESPONSE_TIMEOUT = 0x22;
enum HCI_LMP_ERROR_TRANSACTION_COLLISION = 0x23;
enum HCI_LMP_PDU_NOT_ALLOWED = 0x24;
enum HCI_ENCRYPTION_MODE_NOT_ACCEPTED = 0x25;
enum HCI_UNIT_LINK_KEY_USED = 0x26;
enum HCI_QOS_NOT_SUPPORTED = 0x27;
enum HCI_INSTANT_PASSED = 0x28;
enum HCI_PAIRING_NOT_SUPPORTED = 0x29;
enum HCI_TRANSACTION_COLLISION = 0x2a;
enum HCI_QOS_UNACCEPTABLE_PARAMETER = 0x2c;
enum HCI_QOS_REJECTED = 0x2d;
enum HCI_CLASSIFICATION_NOT_SUPPORTED = 0x2e;
enum HCI_INSUFFICIENT_SECURITY = 0x2f;
enum HCI_PARAMETER_OUT_OF_RANGE = 0x30;
enum HCI_ROLE_SWITCH_PENDING = 0x32;
enum HCI_SLOT_VIOLATION = 0x34;
enum HCI_ROLE_SWITCH_FAILED = 0x35;
enum HCI_EIR_TOO_LARGE = 0x36;
enum HCI_SIMPLE_PAIRING_NOT_SUPPORTED = 0x37;
enum HCI_HOST_BUSY_PAIRING = 0x38;

/* ACL flags */
enum ACL_START_NO_FLUSH = 0x00;
enum ACL_CONT = 0x01;
enum ACL_START = 0x02;
enum ACL_ACTIVE_BCAST = 0x04;
enum ACL_PICO_BCAST = 0x08;

/* Baseband links */
enum SCO_LINK = 0x00;
enum ACL_LINK = 0x01;
enum ESCO_LINK = 0x02;

/* LMP features */
enum LMP_3SLOT = 0x01;
enum LMP_5SLOT = 0x02;
enum LMP_ENCRYPT = 0x04;
enum LMP_SOFFSET = 0x08;
enum LMP_TACCURACY = 0x10;
enum LMP_RSWITCH = 0x20;
enum LMP_HOLD = 0x40;
enum LMP_SNIFF = 0x80;

enum LMP_PARK = 0x01;
enum LMP_RSSI = 0x02;
enum LMP_QUALITY = 0x04;
enum LMP_SCO = 0x08;
enum LMP_HV2 = 0x10;
enum LMP_HV3 = 0x20;
enum LMP_ULAW = 0x40;
enum LMP_ALAW = 0x80;

enum LMP_CVSD = 0x01;
enum LMP_PSCHEME = 0x02;
enum LMP_PCONTROL = 0x04;
enum LMP_TRSP_SCO = 0x08;
enum LMP_BCAST_ENC = 0x80;

enum LMP_EDR_ACL_2M = 0x02;
enum LMP_EDR_ACL_3M = 0x04;
enum LMP_ENH_ISCAN = 0x08;
enum LMP_ILACE_ISCAN = 0x10;
enum LMP_ILACE_PSCAN = 0x20;
enum LMP_RSSI_INQ = 0x40;
enum LMP_ESCO = 0x80;

enum LMP_EV4 = 0x01;
enum LMP_EV5 = 0x02;
enum LMP_AFH_CAP_SLV = 0x08;
enum LMP_AFH_CLS_SLV = 0x10;
enum LMP_NO_BREDR = 0x20;
enum LMP_LE = 0x40;
enum LMP_EDR_3SLOT = 0x80;

enum LMP_EDR_5SLOT = 0x01;
enum LMP_SNIFF_SUBR = 0x02;
enum LMP_PAUSE_ENC = 0x04;
enum LMP_AFH_CAP_MST = 0x08;
enum LMP_AFH_CLS_MST = 0x10;
enum LMP_EDR_ESCO_2M = 0x20;
enum LMP_EDR_ESCO_3M = 0x40;
enum LMP_EDR_3S_ESCO = 0x80;

enum LMP_EXT_INQ = 0x01;
enum LMP_LE_BREDR = 0x02;
enum LMP_SIMPLE_PAIR = 0x08;
enum LMP_ENCAPS_PDU = 0x10;
enum LMP_ERR_DAT_REP = 0x20;
enum LMP_NFLUSH_PKTS = 0x40;

enum LMP_LSTO = 0x01;
enum LMP_INQ_TX_PWR = 0x02;
enum LMP_EPC = 0x04;
enum LMP_EXT_FEAT = 0x80;

/* Extended LMP features */
enum LMP_HOST_SSP = 0x01;
enum LMP_HOST_LE = 0x02;
enum LMP_HOST_LE_BREDR = 0x04;

/* Link policies */
enum HCI_LP_RSWITCH = 0x0001;
enum HCI_LP_HOLD = 0x0002;
enum HCI_LP_SNIFF = 0x0004;
enum HCI_LP_PARK = 0x0008;

/* Link mode */
enum HCI_LM_ACCEPT = 0x8000;
enum HCI_LM_MASTER = 0x0001;
enum HCI_LM_AUTH = 0x0002;
enum HCI_LM_ENCRYPT = 0x0004;
enum HCI_LM_TRUSTED = 0x0008;
enum HCI_LM_RELIABLE = 0x0010;
enum HCI_LM_SECURE = 0x0020;

/* Link Key types */
enum HCI_LK_COMBINATION = 0x00;
enum HCI_LK_LOCAL_UNIT = 0x01;
enum HCI_LK_REMOTE_UNIT = 0x02;
enum HCI_LK_DEBUG_COMBINATION = 0x03;
enum HCI_LK_UNAUTH_COMBINATION = 0x04;
enum HCI_LK_AUTH_COMBINATION = 0x05;
enum HCI_LK_CHANGED_COMBINATION = 0x06;
enum HCI_LK_INVALID = 0xFF;

/* -----  HCI Commands ----- */

/* Link Control */
enum OGF_LINK_CTL = 0x01;

enum OCF_INQUIRY = 0x0001;

struct inquiry_cp
{
    align (1):

    ubyte[3] lap;
    ubyte length; /* 1.28s units */
    ubyte num_rsp;
}

enum INQUIRY_CP_SIZE = 5;

struct status_bdaddr_rp
{
    align (1):

    ubyte status;
    bdaddr_t bdaddr;
}

enum STATUS_BDADDR_RP_SIZE = 7;

enum OCF_INQUIRY_CANCEL = 0x0002;

enum OCF_PERIODIC_INQUIRY = 0x0003;

struct periodic_inquiry_cp
{
    align (1):

    ushort max_period; /* 1.28s units */
    ushort min_period; /* 1.28s units */
    ubyte[3] lap;
    ubyte length; /* 1.28s units */
    ubyte num_rsp;
}

enum PERIODIC_INQUIRY_CP_SIZE = 9;

enum OCF_EXIT_PERIODIC_INQUIRY = 0x0004;

enum OCF_CREATE_CONN = 0x0005;

struct create_conn_cp
{
    align (1):

    bdaddr_t bdaddr;
    ushort pkt_type;
    ubyte pscan_rep_mode;
    ubyte pscan_mode;
    ushort clock_offset;
    ubyte role_switch;
}

enum CREATE_CONN_CP_SIZE = 13;

enum OCF_DISCONNECT = 0x0006;

struct disconnect_cp
{
    align (1):

    ushort handle;
    ubyte reason;
}

enum DISCONNECT_CP_SIZE = 3;

enum OCF_ADD_SCO = 0x0007;

struct add_sco_cp
{
    align (1):

    ushort handle;
    ushort pkt_type;
}

enum ADD_SCO_CP_SIZE = 4;

enum OCF_CREATE_CONN_CANCEL = 0x0008;

struct create_conn_cancel_cp
{
    align (1):

    bdaddr_t bdaddr;
}

enum CREATE_CONN_CANCEL_CP_SIZE = 6;

enum OCF_ACCEPT_CONN_REQ = 0x0009;

struct accept_conn_req_cp
{
    align (1):

    bdaddr_t bdaddr;
    ubyte role;
}

enum ACCEPT_CONN_REQ_CP_SIZE = 7;

enum OCF_REJECT_CONN_REQ = 0x000A;

struct reject_conn_req_cp
{
    align (1):

    bdaddr_t bdaddr;
    ubyte reason;
}

enum REJECT_CONN_REQ_CP_SIZE = 7;

enum OCF_LINK_KEY_REPLY = 0x000B;

struct link_key_reply_cp
{
    align (1):

    bdaddr_t bdaddr;
    ubyte[16] link_key;
}

enum LINK_KEY_REPLY_CP_SIZE = 22;

enum OCF_LINK_KEY_NEG_REPLY = 0x000C;

enum OCF_PIN_CODE_REPLY = 0x000D;

struct pin_code_reply_cp
{
    align (1):

    bdaddr_t bdaddr;
    ubyte pin_len;
    ubyte[16] pin_code;
}

enum PIN_CODE_REPLY_CP_SIZE = 23;

enum OCF_PIN_CODE_NEG_REPLY = 0x000E;

enum OCF_SET_CONN_PTYPE = 0x000F;

struct set_conn_ptype_cp
{
    align (1):

    ushort handle;
    ushort pkt_type;
}

enum SET_CONN_PTYPE_CP_SIZE = 4;

enum OCF_AUTH_REQUESTED = 0x0011;

struct auth_requested_cp
{
    align (1):

    ushort handle;
}

enum AUTH_REQUESTED_CP_SIZE = 2;

enum OCF_SET_CONN_ENCRYPT = 0x0013;

struct set_conn_encrypt_cp
{
    align (1):

    ushort handle;
    ubyte encrypt;
}

enum SET_CONN_ENCRYPT_CP_SIZE = 3;

enum OCF_CHANGE_CONN_LINK_KEY = 0x0015;

struct change_conn_link_key_cp
{
    align (1):

    ushort handle;
}

enum CHANGE_CONN_LINK_KEY_CP_SIZE = 2;

enum OCF_MASTER_LINK_KEY = 0x0017;

struct master_link_key_cp
{
    align (1):

    ubyte key_flag;
}

enum MASTER_LINK_KEY_CP_SIZE = 1;

enum OCF_REMOTE_NAME_REQ = 0x0019;

struct remote_name_req_cp
{
    align (1):

    bdaddr_t bdaddr;
    ubyte pscan_rep_mode;
    ubyte pscan_mode;
    ushort clock_offset;
}

enum REMOTE_NAME_REQ_CP_SIZE = 10;

enum OCF_REMOTE_NAME_REQ_CANCEL = 0x001A;

struct remote_name_req_cancel_cp
{
    align (1):

    bdaddr_t bdaddr;
}

enum REMOTE_NAME_REQ_CANCEL_CP_SIZE = 6;

enum OCF_READ_REMOTE_FEATURES = 0x001B;

struct read_remote_features_cp
{
    align (1):

    ushort handle;
}

enum READ_REMOTE_FEATURES_CP_SIZE = 2;

enum OCF_READ_REMOTE_EXT_FEATURES = 0x001C;

struct read_remote_ext_features_cp
{
    align (1):

    ushort handle;
    ubyte page_num;
}

enum READ_REMOTE_EXT_FEATURES_CP_SIZE = 3;

enum OCF_READ_REMOTE_VERSION = 0x001D;

struct read_remote_version_cp
{
    align (1):

    ushort handle;
}

enum READ_REMOTE_VERSION_CP_SIZE = 2;

enum OCF_READ_CLOCK_OFFSET = 0x001F;

struct read_clock_offset_cp
{
    align (1):

    ushort handle;
}

enum READ_CLOCK_OFFSET_CP_SIZE = 2;

enum OCF_READ_LMP_HANDLE = 0x0020;

enum OCF_SETUP_SYNC_CONN = 0x0028;

struct setup_sync_conn_cp
{
    align (1):

    ushort handle;
    uint tx_bandwith;
    uint rx_bandwith;
    ushort max_latency;
    ushort voice_setting;
    ubyte retrans_effort;
    ushort pkt_type;
}

enum SETUP_SYNC_CONN_CP_SIZE = 17;

enum OCF_ACCEPT_SYNC_CONN_REQ = 0x0029;

struct accept_sync_conn_req_cp
{
    align (1):

    bdaddr_t bdaddr;
    uint tx_bandwith;
    uint rx_bandwith;
    ushort max_latency;
    ushort voice_setting;
    ubyte retrans_effort;
    ushort pkt_type;
}

enum ACCEPT_SYNC_CONN_REQ_CP_SIZE = 21;

enum OCF_REJECT_SYNC_CONN_REQ = 0x002A;

struct reject_sync_conn_req_cp
{
    align (1):

    bdaddr_t bdaddr;
    ubyte reason;
}

enum REJECT_SYNC_CONN_REQ_CP_SIZE = 7;

enum OCF_IO_CAPABILITY_REPLY = 0x002B;

struct io_capability_reply_cp
{
    align (1):

    bdaddr_t bdaddr;
    ubyte capability;
    ubyte oob_data;
    ubyte authentication;
}

enum IO_CAPABILITY_REPLY_CP_SIZE = 9;

enum OCF_USER_CONFIRM_REPLY = 0x002C;

struct user_confirm_reply_cp
{
    align (1):

    bdaddr_t bdaddr;
}

enum USER_CONFIRM_REPLY_CP_SIZE = 6;

enum OCF_USER_CONFIRM_NEG_REPLY = 0x002D;

enum OCF_USER_PASSKEY_REPLY = 0x002E;

struct user_passkey_reply_cp
{
    align (1):

    bdaddr_t bdaddr;
    uint passkey;
}

enum USER_PASSKEY_REPLY_CP_SIZE = 10;

enum OCF_USER_PASSKEY_NEG_REPLY = 0x002F;

enum OCF_REMOTE_OOB_DATA_REPLY = 0x0030;

struct remote_oob_data_reply_cp
{
    align (1):

    bdaddr_t bdaddr;
    ubyte[16] hash;
    ubyte[16] randomizer;
}

enum REMOTE_OOB_DATA_REPLY_CP_SIZE = 38;

enum OCF_REMOTE_OOB_DATA_NEG_REPLY = 0x0033;

enum OCF_IO_CAPABILITY_NEG_REPLY = 0x0034;

struct io_capability_neg_reply_cp
{
    align (1):

    bdaddr_t bdaddr;
    ubyte reason;
}

enum IO_CAPABILITY_NEG_REPLY_CP_SIZE = 7;

enum OCF_CREATE_PHYSICAL_LINK = 0x0035;

struct create_physical_link_cp
{
    align (1):

    ubyte handle;
    ubyte key_length;
    ubyte key_type;
    ubyte[32] key;
}

enum CREATE_PHYSICAL_LINK_CP_SIZE = 35;

enum OCF_ACCEPT_PHYSICAL_LINK = 0x0036;

struct accept_physical_link_cp
{
    align (1):

    ubyte handle;
    ubyte key_length;
    ubyte key_type;
    ubyte[32] key;
}

enum ACCEPT_PHYSICAL_LINK_CP_SIZE = 35;

enum OCF_DISCONNECT_PHYSICAL_LINK = 0x0037;

struct disconnect_physical_link_cp
{
    align (1):

    ubyte handle;
    ubyte reason;
}

enum DISCONNECT_PHYSICAL_LINK_CP_SIZE = 2;

enum OCF_CREATE_LOGICAL_LINK = 0x0038;

struct create_logical_link_cp
{
    align (1):

    ubyte handle;
    ubyte[16] tx_flow;
    ubyte[16] rx_flow;
}

enum CREATE_LOGICAL_LINK_CP_SIZE = 33;

enum OCF_ACCEPT_LOGICAL_LINK = 0x0039;

enum OCF_DISCONNECT_LOGICAL_LINK = 0x003A;

struct disconnect_logical_link_cp
{
    align (1):

    ushort handle;
}

enum DISCONNECT_LOGICAL_LINK_CP_SIZE = 2;

enum OCF_LOGICAL_LINK_CANCEL = 0x003B;

struct cancel_logical_link_cp
{
    align (1):

    ubyte handle;
    ubyte tx_flow_id;
}

enum LOGICAL_LINK_CANCEL_CP_SIZE = 2;

struct cancel_logical_link_rp
{
    align (1):

    ubyte status;
    ubyte handle;
    ubyte tx_flow_id;
}

enum LOGICAL_LINK_CANCEL_RP_SIZE = 3;

enum OCF_FLOW_SPEC_MODIFY = 0x003C;

/* Link Policy */
enum OGF_LINK_POLICY = 0x02;

enum OCF_HOLD_MODE = 0x0001;

struct hold_mode_cp
{
    align (1):

    ushort handle;
    ushort max_interval;
    ushort min_interval;
}

enum HOLD_MODE_CP_SIZE = 6;

enum OCF_SNIFF_MODE = 0x0003;

struct sniff_mode_cp
{
    align (1):

    ushort handle;
    ushort max_interval;
    ushort min_interval;
    ushort attempt;
    ushort timeout;
}

enum SNIFF_MODE_CP_SIZE = 10;

enum OCF_EXIT_SNIFF_MODE = 0x0004;

struct exit_sniff_mode_cp
{
    align (1):

    ushort handle;
}

enum EXIT_SNIFF_MODE_CP_SIZE = 2;

enum OCF_PARK_MODE = 0x0005;

struct park_mode_cp
{
    align (1):

    ushort handle;
    ushort max_interval;
    ushort min_interval;
}

enum PARK_MODE_CP_SIZE = 6;

enum OCF_EXIT_PARK_MODE = 0x0006;

struct exit_park_mode_cp
{
    align (1):

    ushort handle;
}

enum EXIT_PARK_MODE_CP_SIZE = 2;

enum OCF_QOS_SETUP = 0x0007;

struct hci_qos
{
    align (1):

    ubyte service_type; /* 1 = best effort */
    uint token_rate; /* Byte per seconds */
    uint peak_bandwidth; /* Byte per seconds */
    uint latency; /* Microseconds */
    uint delay_variation; /* Microseconds */
}

enum HCI_QOS_CP_SIZE = 17;

struct qos_setup_cp
{
    align (1):

    ushort handle;
    ubyte flags; /* Reserved */
    hci_qos qos;
}

enum QOS_SETUP_CP_SIZE = 3 + HCI_QOS_CP_SIZE;

enum OCF_ROLE_DISCOVERY = 0x0009;

struct role_discovery_cp
{
    align (1):

    ushort handle;
}

enum ROLE_DISCOVERY_CP_SIZE = 2;

struct role_discovery_rp
{
    align (1):

    ubyte status;
    ushort handle;
    ubyte role;
}

enum ROLE_DISCOVERY_RP_SIZE = 4;

enum OCF_SWITCH_ROLE = 0x000B;

struct switch_role_cp
{
    align (1):

    bdaddr_t bdaddr;
    ubyte role;
}

enum SWITCH_ROLE_CP_SIZE = 7;

enum OCF_READ_LINK_POLICY = 0x000C;

struct read_link_policy_cp
{
    align (1):

    ushort handle;
}

enum READ_LINK_POLICY_CP_SIZE = 2;

struct read_link_policy_rp
{
    align (1):

    ubyte status;
    ushort handle;
    ushort policy;
}

enum READ_LINK_POLICY_RP_SIZE = 5;

enum OCF_WRITE_LINK_POLICY = 0x000D;

struct write_link_policy_cp
{
    align (1):

    ushort handle;
    ushort policy;
}

enum WRITE_LINK_POLICY_CP_SIZE = 4;

struct write_link_policy_rp
{
    align (1):

    ubyte status;
    ushort handle;
}

enum WRITE_LINK_POLICY_RP_SIZE = 3;

enum OCF_READ_DEFAULT_LINK_POLICY = 0x000E;

enum OCF_WRITE_DEFAULT_LINK_POLICY = 0x000F;

enum OCF_FLOW_SPECIFICATION = 0x0010;

enum OCF_SNIFF_SUBRATING = 0x0011;

struct sniff_subrating_cp
{
    align (1):

    ushort handle;
    ushort max_latency;
    ushort min_remote_timeout;
    ushort min_local_timeout;
}

enum SNIFF_SUBRATING_CP_SIZE = 8;

/* Host Controller and Baseband */
enum OGF_HOST_CTL = 0x03;

enum OCF_SET_EVENT_MASK = 0x0001;

struct set_event_mask_cp
{
    align (1):

    ubyte[8] mask;
}

enum SET_EVENT_MASK_CP_SIZE = 8;

enum OCF_RESET = 0x0003;

enum OCF_SET_EVENT_FLT = 0x0005;

struct set_event_flt_cp
{
    align (1):

    ubyte flt_type;
    ubyte cond_type;
    ubyte[0] condition;
}

enum SET_EVENT_FLT_CP_SIZE = 2;

/* Filter types */
enum FLT_CLEAR_ALL = 0x00;
enum FLT_INQ_RESULT = 0x01;
enum FLT_CONN_SETUP = 0x02;
/* INQ_RESULT Condition types */
enum INQ_RESULT_RETURN_ALL = 0x00;
enum INQ_RESULT_RETURN_CLASS = 0x01;
enum INQ_RESULT_RETURN_BDADDR = 0x02;
/* CONN_SETUP Condition types */
enum CONN_SETUP_ALLOW_ALL = 0x00;
enum CONN_SETUP_ALLOW_CLASS = 0x01;
enum CONN_SETUP_ALLOW_BDADDR = 0x02;
/* CONN_SETUP Conditions */
enum CONN_SETUP_AUTO_OFF = 0x01;
enum CONN_SETUP_AUTO_ON = 0x02;

enum OCF_FLUSH = 0x0008;

enum OCF_READ_PIN_TYPE = 0x0009;

struct read_pin_type_rp
{
    align (1):

    ubyte status;
    ubyte pin_type;
}

enum READ_PIN_TYPE_RP_SIZE = 2;

enum OCF_WRITE_PIN_TYPE = 0x000A;

struct write_pin_type_cp
{
    align (1):

    ubyte pin_type;
}

enum WRITE_PIN_TYPE_CP_SIZE = 1;

enum OCF_CREATE_NEW_UNIT_KEY = 0x000B;

enum OCF_READ_STORED_LINK_KEY = 0x000D;

struct read_stored_link_key_cp
{
    align (1):

    bdaddr_t bdaddr;
    ubyte read_all;
}

enum READ_STORED_LINK_KEY_CP_SIZE = 7;

struct read_stored_link_key_rp
{
    align (1):

    ubyte status;
    ushort max_keys;
    ushort num_keys;
}

enum READ_STORED_LINK_KEY_RP_SIZE = 5;

enum OCF_WRITE_STORED_LINK_KEY = 0x0011;

struct write_stored_link_key_cp
{
    align (1):

    ubyte num_keys;
    /* variable length part */
}

enum WRITE_STORED_LINK_KEY_CP_SIZE = 1;

struct write_stored_link_key_rp
{
    align (1):

    ubyte status;
    ubyte num_keys;
}

enum READ_WRITE_LINK_KEY_RP_SIZE = 2;

enum OCF_DELETE_STORED_LINK_KEY = 0x0012;

struct delete_stored_link_key_cp
{
    align (1):

    bdaddr_t bdaddr;
    ubyte delete_all;
}

enum DELETE_STORED_LINK_KEY_CP_SIZE = 7;

struct delete_stored_link_key_rp
{
    align (1):

    ubyte status;
    ushort num_keys;
}

enum DELETE_STORED_LINK_KEY_RP_SIZE = 3;

enum HCI_MAX_NAME_LENGTH = 248;

enum OCF_CHANGE_LOCAL_NAME = 0x0013;

struct change_local_name_cp
{
    align (1):

    ubyte[HCI_MAX_NAME_LENGTH] name;
}

enum CHANGE_LOCAL_NAME_CP_SIZE = 248;

enum OCF_READ_LOCAL_NAME = 0x0014;

struct read_local_name_rp
{
    align (1):

    ubyte status;
    ubyte[HCI_MAX_NAME_LENGTH] name;
}

enum READ_LOCAL_NAME_RP_SIZE = 249;

enum OCF_READ_CONN_ACCEPT_TIMEOUT = 0x0015;

struct read_conn_accept_timeout_rp
{
    align (1):

    ubyte status;
    ushort timeout;
}

enum READ_CONN_ACCEPT_TIMEOUT_RP_SIZE = 3;

enum OCF_WRITE_CONN_ACCEPT_TIMEOUT = 0x0016;

struct write_conn_accept_timeout_cp
{
    align (1):

    ushort timeout;
}

enum WRITE_CONN_ACCEPT_TIMEOUT_CP_SIZE = 2;

enum OCF_READ_PAGE_TIMEOUT = 0x0017;

struct read_page_timeout_rp
{
    align (1):

    ubyte status;
    ushort timeout;
}

enum READ_PAGE_TIMEOUT_RP_SIZE = 3;

enum OCF_WRITE_PAGE_TIMEOUT = 0x0018;

struct write_page_timeout_cp
{
    align (1):

    ushort timeout;
}

enum WRITE_PAGE_TIMEOUT_CP_SIZE = 2;

enum OCF_READ_SCAN_ENABLE = 0x0019;

struct read_scan_enable_rp
{
    align (1):

    ubyte status;
    ubyte enable;
}

enum READ_SCAN_ENABLE_RP_SIZE = 2;

enum OCF_WRITE_SCAN_ENABLE = 0x001A;
enum SCAN_DISABLED = 0x00;
enum SCAN_INQUIRY = 0x01;
enum SCAN_PAGE = 0x02;

enum OCF_READ_PAGE_ACTIVITY = 0x001B;

struct read_page_activity_rp
{
    align (1):

    ubyte status;
    ushort interval;
    ushort window;
}

enum READ_PAGE_ACTIVITY_RP_SIZE = 5;

enum OCF_WRITE_PAGE_ACTIVITY = 0x001C;

struct write_page_activity_cp
{
    align (1):

    ushort interval;
    ushort window;
}

enum WRITE_PAGE_ACTIVITY_CP_SIZE = 4;

enum OCF_READ_INQ_ACTIVITY = 0x001D;

struct read_inq_activity_rp
{
    align (1):

    ubyte status;
    ushort interval;
    ushort window;
}

enum READ_INQ_ACTIVITY_RP_SIZE = 5;

enum OCF_WRITE_INQ_ACTIVITY = 0x001E;

struct write_inq_activity_cp
{
    align (1):

    ushort interval;
    ushort window;
}

enum WRITE_INQ_ACTIVITY_CP_SIZE = 4;

enum OCF_READ_AUTH_ENABLE = 0x001F;

enum OCF_WRITE_AUTH_ENABLE = 0x0020;
enum AUTH_DISABLED = 0x00;
enum AUTH_ENABLED = 0x01;

enum OCF_READ_ENCRYPT_MODE = 0x0021;

enum OCF_WRITE_ENCRYPT_MODE = 0x0022;
enum ENCRYPT_DISABLED = 0x00;
enum ENCRYPT_P2P = 0x01;
enum ENCRYPT_BOTH = 0x02;

enum OCF_READ_CLASS_OF_DEV = 0x0023;

struct read_class_of_dev_rp
{
    align (1):

    ubyte status;
    ubyte[3] dev_class;
}

enum READ_CLASS_OF_DEV_RP_SIZE = 4;

enum OCF_WRITE_CLASS_OF_DEV = 0x0024;

struct write_class_of_dev_cp
{
    align (1):

    ubyte[3] dev_class;
}

enum WRITE_CLASS_OF_DEV_CP_SIZE = 3;

enum OCF_READ_VOICE_SETTING = 0x0025;

struct read_voice_setting_rp
{
    align (1):

    ubyte status;
    ushort voice_setting;
}

enum READ_VOICE_SETTING_RP_SIZE = 3;

enum OCF_WRITE_VOICE_SETTING = 0x0026;

struct write_voice_setting_cp
{
    align (1):

    ushort voice_setting;
}

enum WRITE_VOICE_SETTING_CP_SIZE = 2;

enum OCF_READ_AUTOMATIC_FLUSH_TIMEOUT = 0x0027;

enum OCF_WRITE_AUTOMATIC_FLUSH_TIMEOUT = 0x0028;

enum OCF_READ_NUM_BROADCAST_RETRANS = 0x0029;

enum OCF_WRITE_NUM_BROADCAST_RETRANS = 0x002A;

enum OCF_READ_HOLD_MODE_ACTIVITY = 0x002B;

enum OCF_WRITE_HOLD_MODE_ACTIVITY = 0x002C;

enum OCF_READ_TRANSMIT_POWER_LEVEL = 0x002D;

struct read_transmit_power_level_cp
{
    align (1):

    ushort handle;
    ubyte type;
}

enum READ_TRANSMIT_POWER_LEVEL_CP_SIZE = 3;

struct read_transmit_power_level_rp
{
    align (1):

    ubyte status;
    ushort handle;
    byte level;
}

enum READ_TRANSMIT_POWER_LEVEL_RP_SIZE = 4;

enum OCF_READ_SYNC_FLOW_ENABLE = 0x002E;

enum OCF_WRITE_SYNC_FLOW_ENABLE = 0x002F;

enum OCF_SET_CONTROLLER_TO_HOST_FC = 0x0031;

enum OCF_HOST_BUFFER_SIZE = 0x0033;

struct host_buffer_size_cp
{
    align (1):

    ushort acl_mtu;
    ubyte sco_mtu;
    ushort acl_max_pkt;
    ushort sco_max_pkt;
}

enum HOST_BUFFER_SIZE_CP_SIZE = 7;

enum OCF_HOST_NUM_COMP_PKTS = 0x0035;

struct host_num_comp_pkts_cp
{
    align (1):

    ubyte num_hndl;
    /* variable length part */
}

enum HOST_NUM_COMP_PKTS_CP_SIZE = 1;

enum OCF_READ_LINK_SUPERVISION_TIMEOUT = 0x0036;

struct read_link_supervision_timeout_rp
{
    align (1):

    ubyte status;
    ushort handle;
    ushort timeout;
}

enum READ_LINK_SUPERVISION_TIMEOUT_RP_SIZE = 5;

enum OCF_WRITE_LINK_SUPERVISION_TIMEOUT = 0x0037;

struct write_link_supervision_timeout_cp
{
    align (1):

    ushort handle;
    ushort timeout;
}

enum WRITE_LINK_SUPERVISION_TIMEOUT_CP_SIZE = 4;

struct write_link_supervision_timeout_rp
{
    align (1):

    ubyte status;
    ushort handle;
}

enum WRITE_LINK_SUPERVISION_TIMEOUT_RP_SIZE = 3;

enum OCF_READ_NUM_SUPPORTED_IAC = 0x0038;

enum MAX_IAC_LAP = 0x40;
enum OCF_READ_CURRENT_IAC_LAP = 0x0039;

struct read_current_iac_lap_rp
{
    align (1):

    ubyte status;
    ubyte num_current_iac;
    ubyte[3][MAX_IAC_LAP] lap;
}

enum READ_CURRENT_IAC_LAP_RP_SIZE = 2 + 3 * MAX_IAC_LAP;

enum OCF_WRITE_CURRENT_IAC_LAP = 0x003A;

struct write_current_iac_lap_cp
{
    align (1):

    ubyte num_current_iac;
    ubyte[3][MAX_IAC_LAP] lap;
}

enum WRITE_CURRENT_IAC_LAP_CP_SIZE = 1 + 3 * MAX_IAC_LAP;

enum OCF_READ_PAGE_SCAN_PERIOD_MODE = 0x003B;

enum OCF_WRITE_PAGE_SCAN_PERIOD_MODE = 0x003C;

enum OCF_READ_PAGE_SCAN_MODE = 0x003D;

enum OCF_WRITE_PAGE_SCAN_MODE = 0x003E;

enum OCF_SET_AFH_CLASSIFICATION = 0x003F;

struct set_afh_classification_cp
{
    align (1):

    ubyte[10] map;
}

enum SET_AFH_CLASSIFICATION_CP_SIZE = 10;

struct set_afh_classification_rp
{
    align (1):

    ubyte status;
}

enum SET_AFH_CLASSIFICATION_RP_SIZE = 1;

enum OCF_READ_INQUIRY_SCAN_TYPE = 0x0042;

struct read_inquiry_scan_type_rp
{
    align (1):

    ubyte status;
    ubyte type;
}

enum READ_INQUIRY_SCAN_TYPE_RP_SIZE = 2;

enum OCF_WRITE_INQUIRY_SCAN_TYPE = 0x0043;

struct write_inquiry_scan_type_cp
{
    align (1):

    ubyte type;
}

enum WRITE_INQUIRY_SCAN_TYPE_CP_SIZE = 1;

struct write_inquiry_scan_type_rp
{
    align (1):

    ubyte status;
}

enum WRITE_INQUIRY_SCAN_TYPE_RP_SIZE = 1;

enum OCF_READ_INQUIRY_MODE = 0x0044;

struct read_inquiry_mode_rp
{
    align (1):

    ubyte status;
    ubyte mode;
}

enum READ_INQUIRY_MODE_RP_SIZE = 2;

enum OCF_WRITE_INQUIRY_MODE = 0x0045;

struct write_inquiry_mode_cp
{
    align (1):

    ubyte mode;
}

enum WRITE_INQUIRY_MODE_CP_SIZE = 1;

struct write_inquiry_mode_rp
{
    align (1):

    ubyte status;
}

enum WRITE_INQUIRY_MODE_RP_SIZE = 1;

enum OCF_READ_PAGE_SCAN_TYPE = 0x0046;

enum OCF_WRITE_PAGE_SCAN_TYPE = 0x0047;
enum PAGE_SCAN_TYPE_STANDARD = 0x00;
enum PAGE_SCAN_TYPE_INTERLACED = 0x01;

enum OCF_READ_AFH_MODE = 0x0048;

struct read_afh_mode_rp
{
    align (1):

    ubyte status;
    ubyte mode;
}

enum READ_AFH_MODE_RP_SIZE = 2;

enum OCF_WRITE_AFH_MODE = 0x0049;

struct write_afh_mode_cp
{
    align (1):

    ubyte mode;
}

enum WRITE_AFH_MODE_CP_SIZE = 1;

struct write_afh_mode_rp
{
    align (1):

    ubyte status;
}

enum WRITE_AFH_MODE_RP_SIZE = 1;

enum HCI_MAX_EIR_LENGTH = 240;

enum OCF_READ_EXT_INQUIRY_RESPONSE = 0x0051;

struct read_ext_inquiry_response_rp
{
    align (1):

    ubyte status;
    ubyte fec;
    ubyte[HCI_MAX_EIR_LENGTH] data;
}

enum READ_EXT_INQUIRY_RESPONSE_RP_SIZE = 242;

enum OCF_WRITE_EXT_INQUIRY_RESPONSE = 0x0052;

struct write_ext_inquiry_response_cp
{
    align (1):

    ubyte fec;
    ubyte[HCI_MAX_EIR_LENGTH] data;
}

enum WRITE_EXT_INQUIRY_RESPONSE_CP_SIZE = 241;

struct write_ext_inquiry_response_rp
{
    align (1):

    ubyte status;
}

enum WRITE_EXT_INQUIRY_RESPONSE_RP_SIZE = 1;

enum OCF_REFRESH_ENCRYPTION_KEY = 0x0053;

struct refresh_encryption_key_cp
{
    align (1):

    ushort handle;
}

enum REFRESH_ENCRYPTION_KEY_CP_SIZE = 2;

struct refresh_encryption_key_rp
{
    align (1):

    ubyte status;
}

enum REFRESH_ENCRYPTION_KEY_RP_SIZE = 1;

enum OCF_READ_SIMPLE_PAIRING_MODE = 0x0055;

struct read_simple_pairing_mode_rp
{
    align (1):

    ubyte status;
    ubyte mode;
}

enum READ_SIMPLE_PAIRING_MODE_RP_SIZE = 2;

enum OCF_WRITE_SIMPLE_PAIRING_MODE = 0x0056;

struct write_simple_pairing_mode_cp
{
    align (1):

    ubyte mode;
}

enum WRITE_SIMPLE_PAIRING_MODE_CP_SIZE = 1;

struct write_simple_pairing_mode_rp
{
    align (1):

    ubyte status;
}

enum WRITE_SIMPLE_PAIRING_MODE_RP_SIZE = 1;

enum OCF_READ_LOCAL_OOB_DATA = 0x0057;

struct read_local_oob_data_rp
{
    align (1):

    ubyte status;
    ubyte[16] hash;
    ubyte[16] randomizer;
}

enum READ_LOCAL_OOB_DATA_RP_SIZE = 33;

enum OCF_READ_INQ_RESPONSE_TX_POWER_LEVEL = 0x0058;

struct read_inq_response_tx_power_level_rp
{
    align (1):

    ubyte status;
    byte level;
}

enum READ_INQ_RESPONSE_TX_POWER_LEVEL_RP_SIZE = 2;

enum OCF_READ_INQUIRY_TRANSMIT_POWER_LEVEL = 0x0058;

struct read_inquiry_transmit_power_level_rp
{
    align (1):

    ubyte status;
    byte level;
}

enum READ_INQUIRY_TRANSMIT_POWER_LEVEL_RP_SIZE = 2;

enum OCF_WRITE_INQUIRY_TRANSMIT_POWER_LEVEL = 0x0059;

struct write_inquiry_transmit_power_level_cp
{
    align (1):

    byte level;
}

enum WRITE_INQUIRY_TRANSMIT_POWER_LEVEL_CP_SIZE = 1;

struct write_inquiry_transmit_power_level_rp
{
    align (1):

    ubyte status;
}

enum WRITE_INQUIRY_TRANSMIT_POWER_LEVEL_RP_SIZE = 1;

enum OCF_READ_DEFAULT_ERROR_DATA_REPORTING = 0x005A;

struct read_default_error_data_reporting_rp
{
    align (1):

    ubyte status;
    ubyte reporting;
}

enum READ_DEFAULT_ERROR_DATA_REPORTING_RP_SIZE = 2;

enum OCF_WRITE_DEFAULT_ERROR_DATA_REPORTING = 0x005B;

struct write_default_error_data_reporting_cp
{
    align (1):

    ubyte reporting;
}

enum WRITE_DEFAULT_ERROR_DATA_REPORTING_CP_SIZE = 1;

struct write_default_error_data_reporting_rp
{
    align (1):

    ubyte status;
}

enum WRITE_DEFAULT_ERROR_DATA_REPORTING_RP_SIZE = 1;

enum OCF_ENHANCED_FLUSH = 0x005F;

struct enhanced_flush_cp
{
    align (1):

    ushort handle;
    ubyte type;
}

enum ENHANCED_FLUSH_CP_SIZE = 3;

enum OCF_SEND_KEYPRESS_NOTIFY = 0x0060;

struct send_keypress_notify_cp
{
    align (1):

    bdaddr_t bdaddr;
    ubyte type;
}

enum SEND_KEYPRESS_NOTIFY_CP_SIZE = 7;

struct send_keypress_notify_rp
{
    align (1):

    ubyte status;
}

enum SEND_KEYPRESS_NOTIFY_RP_SIZE = 1;

enum OCF_READ_LOGICAL_LINK_ACCEPT_TIMEOUT = 0x0061;

struct read_log_link_accept_timeout_rp
{
    align (1):

    ubyte status;
    ushort timeout;
}

enum READ_LOGICAL_LINK_ACCEPT_TIMEOUT_RP_SIZE = 3;

enum OCF_WRITE_LOGICAL_LINK_ACCEPT_TIMEOUT = 0x0062;

struct write_log_link_accept_timeout_cp
{
    align (1):

    ushort timeout;
}

enum WRITE_LOGICAL_LINK_ACCEPT_TIMEOUT_CP_SIZE = 2;

enum OCF_SET_EVENT_MASK_PAGE_2 = 0x0063;

enum OCF_READ_LOCATION_DATA = 0x0064;

enum OCF_WRITE_LOCATION_DATA = 0x0065;

enum OCF_READ_FLOW_CONTROL_MODE = 0x0066;

enum OCF_WRITE_FLOW_CONTROL_MODE = 0x0067;

enum OCF_READ_ENHANCED_TRANSMIT_POWER_LEVEL = 0x0068;

struct read_enhanced_transmit_power_level_rp
{
    align (1):

    ubyte status;
    ushort handle;
    byte level_gfsk;
    byte level_dqpsk;
    byte level_8dpsk;
}

enum READ_ENHANCED_TRANSMIT_POWER_LEVEL_RP_SIZE = 6;

enum OCF_READ_BEST_EFFORT_FLUSH_TIMEOUT = 0x0069;

struct read_best_effort_flush_timeout_rp
{
    align (1):

    ubyte status;
    uint timeout;
}

enum READ_BEST_EFFORT_FLUSH_TIMEOUT_RP_SIZE = 5;

enum OCF_WRITE_BEST_EFFORT_FLUSH_TIMEOUT = 0x006A;

struct write_best_effort_flush_timeout_cp
{
    align (1):

    ushort handle;
    uint timeout;
}

enum WRITE_BEST_EFFORT_FLUSH_TIMEOUT_CP_SIZE = 6;

struct write_best_effort_flush_timeout_rp
{
    align (1):

    ubyte status;
}

enum WRITE_BEST_EFFORT_FLUSH_TIMEOUT_RP_SIZE = 1;

enum OCF_READ_LE_HOST_SUPPORTED = 0x006C;

struct read_le_host_supported_rp
{
    align (1):

    ubyte status;
    ubyte le;
    ubyte simul;
}

enum READ_LE_HOST_SUPPORTED_RP_SIZE = 3;

enum OCF_WRITE_LE_HOST_SUPPORTED = 0x006D;

struct write_le_host_supported_cp
{
    align (1):

    ubyte le;
    ubyte simul;
}

enum WRITE_LE_HOST_SUPPORTED_CP_SIZE = 2;

/* Informational Parameters */
enum OGF_INFO_PARAM = 0x04;

enum OCF_READ_LOCAL_VERSION = 0x0001;

struct read_local_version_rp
{
    align (1):

    ubyte status;
    ubyte hci_ver;
    ushort hci_rev;
    ubyte lmp_ver;
    ushort manufacturer;
    ushort lmp_subver;
}

enum READ_LOCAL_VERSION_RP_SIZE = 9;

enum OCF_READ_LOCAL_COMMANDS = 0x0002;

struct read_local_commands_rp
{
    align (1):

    ubyte status;
    ubyte[64] commands;
}

enum READ_LOCAL_COMMANDS_RP_SIZE = 65;

enum OCF_READ_LOCAL_FEATURES = 0x0003;

struct read_local_features_rp
{
    align (1):

    ubyte status;
    ubyte[8] features;
}

enum READ_LOCAL_FEATURES_RP_SIZE = 9;

enum OCF_READ_LOCAL_EXT_FEATURES = 0x0004;

struct read_local_ext_features_cp
{
    align (1):

    ubyte page_num;
}

enum READ_LOCAL_EXT_FEATURES_CP_SIZE = 1;

struct read_local_ext_features_rp
{
    align (1):

    ubyte status;
    ubyte page_num;
    ubyte max_page_num;
    ubyte[8] features;
}

enum READ_LOCAL_EXT_FEATURES_RP_SIZE = 11;

enum OCF_READ_BUFFER_SIZE = 0x0005;

struct read_buffer_size_rp
{
    align (1):

    ubyte status;
    ushort acl_mtu;
    ubyte sco_mtu;
    ushort acl_max_pkt;
    ushort sco_max_pkt;
}

enum READ_BUFFER_SIZE_RP_SIZE = 8;

enum OCF_READ_COUNTRY_CODE = 0x0007;

enum OCF_READ_BD_ADDR = 0x0009;

struct read_bd_addr_rp
{
    align (1):

    ubyte status;
    bdaddr_t bdaddr;
}

enum READ_BD_ADDR_RP_SIZE = 7;

enum OCF_READ_DATA_BLOCK_SIZE = 0x000A;

struct read_data_block_size_rp
{
    align (1):

    ubyte status;
    ushort max_acl_len;
    ushort data_block_len;
    ushort num_blocks;
}

/* Status params */
enum OGF_STATUS_PARAM = 0x05;

enum OCF_READ_FAILED_CONTACT_COUNTER = 0x0001;

struct read_failed_contact_counter_rp
{
    align (1):

    ubyte status;
    ushort handle;
    ubyte counter;
}

enum READ_FAILED_CONTACT_COUNTER_RP_SIZE = 4;

enum OCF_RESET_FAILED_CONTACT_COUNTER = 0x0002;

struct reset_failed_contact_counter_rp
{
    align (1):

    ubyte status;
    ushort handle;
}

enum RESET_FAILED_CONTACT_COUNTER_RP_SIZE = 3;

enum OCF_READ_LINK_QUALITY = 0x0003;

struct read_link_quality_rp
{
    align (1):

    ubyte status;
    ushort handle;
    ubyte link_quality;
}

enum READ_LINK_QUALITY_RP_SIZE = 4;

enum OCF_READ_RSSI = 0x0005;

struct read_rssi_rp
{
    align (1):

    ubyte status;
    ushort handle;
    byte rssi;
}

enum READ_RSSI_RP_SIZE = 4;

enum OCF_READ_AFH_MAP = 0x0006;

struct read_afh_map_rp
{
    align (1):

    ubyte status;
    ushort handle;
    ubyte mode;
    ubyte[10] map;
}

enum READ_AFH_MAP_RP_SIZE = 14;

enum OCF_READ_CLOCK = 0x0007;

struct read_clock_cp
{
    align (1):

    ushort handle;
    ubyte which_clock;
}

enum READ_CLOCK_CP_SIZE = 3;

struct read_clock_rp
{
    align (1):

    ubyte status;
    ushort handle;
    uint clock;
    ushort accuracy;
}

enum READ_CLOCK_RP_SIZE = 9;

enum OCF_READ_LOCAL_AMP_INFO = 0x0009;

struct read_local_amp_info_rp
{
    align (1):

    ubyte status;
    ubyte amp_status;
    uint total_bandwidth;
    uint max_guaranteed_bandwidth;
    uint min_latency;
    uint max_pdu_size;
    ubyte controller_type;
    ushort pal_caps;
    ushort max_amp_assoc_length;
    uint max_flush_timeout;
    uint best_effort_flush_timeout;
}

enum READ_LOCAL_AMP_INFO_RP_SIZE = 31;

enum OCF_READ_LOCAL_AMP_ASSOC = 0x000A;

struct read_local_amp_assoc_cp
{
    align (1):

    ubyte handle;
    ushort length_so_far;
    ushort assoc_length;
}

enum READ_LOCAL_AMP_ASSOC_CP_SIZE = 5;

struct read_local_amp_assoc_rp
{
    align (1):

    ubyte status;
    ubyte handle;
    ushort length;
    ubyte[HCI_MAX_NAME_LENGTH] fragment;
}

enum READ_LOCAL_AMP_ASSOC_RP_SIZE = 252;

enum OCF_WRITE_REMOTE_AMP_ASSOC = 0x000B;

struct write_remote_amp_assoc_cp
{
    align (1):

    ubyte handle;
    ushort length_so_far;
    ushort remaining_length;
    ubyte[HCI_MAX_NAME_LENGTH] fragment;
}

enum WRITE_REMOTE_AMP_ASSOC_CP_SIZE = 253;

struct write_remote_amp_assoc_rp
{
    align (1):

    ubyte status;
    ubyte handle;
}

enum WRITE_REMOTE_AMP_ASSOC_RP_SIZE = 2;

/* Testing commands */
enum OGF_TESTING_CMD = 0x3e;

enum OCF_READ_LOOPBACK_MODE = 0x0001;

enum OCF_WRITE_LOOPBACK_MODE = 0x0002;

enum OCF_ENABLE_DEVICE_UNDER_TEST_MODE = 0x0003;

enum OCF_WRITE_SIMPLE_PAIRING_DEBUG_MODE = 0x0004;

struct write_simple_pairing_debug_mode_cp
{
    align (1):

    ubyte mode;
}

enum WRITE_SIMPLE_PAIRING_DEBUG_MODE_CP_SIZE = 1;

struct write_simple_pairing_debug_mode_rp
{
    align (1):

    ubyte status;
}

enum WRITE_SIMPLE_PAIRING_DEBUG_MODE_RP_SIZE = 1;

/* LE commands */
enum OGF_LE_CTL = 0x08;

enum OCF_LE_SET_EVENT_MASK = 0x0001;

struct le_set_event_mask_cp
{
    align (1):

    ubyte[8] mask;
}

enum LE_SET_EVENT_MASK_CP_SIZE = 8;

enum OCF_LE_READ_BUFFER_SIZE = 0x0002;

struct le_read_buffer_size_rp
{
    align (1):

    ubyte status;
    ushort pkt_len;
    ubyte max_pkt;
}

enum LE_READ_BUFFER_SIZE_RP_SIZE = 4;

enum OCF_LE_READ_LOCAL_SUPPORTED_FEATURES = 0x0003;

struct le_read_local_supported_features_rp
{
    align (1):

    ubyte status;
    ubyte[8] features;
}

enum LE_READ_LOCAL_SUPPORTED_FEATURES_RP_SIZE = 9;

enum OCF_LE_SET_RANDOM_ADDRESS = 0x0005;

struct le_set_random_address_cp
{
    align (1):

    bdaddr_t bdaddr;
}

enum LE_SET_RANDOM_ADDRESS_CP_SIZE = 6;

enum OCF_LE_SET_ADVERTISING_PARAMETERS = 0x0006;

struct le_set_advertising_parameters_cp
{
    align (1):

    ushort min_interval;
    ushort max_interval;
    ubyte advtype;
    ubyte own_bdaddr_type;
    ubyte direct_bdaddr_type;
    bdaddr_t direct_bdaddr;
    ubyte chan_map;
    ubyte filter;
}

enum LE_SET_ADVERTISING_PARAMETERS_CP_SIZE = 15;

enum OCF_LE_READ_ADVERTISING_CHANNEL_TX_POWER = 0x0007;

struct le_read_advertising_channel_tx_power_rp
{
    align (1):

    ubyte status;
    byte level;
}

enum LE_READ_ADVERTISING_CHANNEL_TX_POWER_RP_SIZE = 2;

enum OCF_LE_SET_ADVERTISING_DATA = 0x0008;

struct le_set_advertising_data_cp
{
    align (1):

    ubyte length;
    ubyte[31] data;
}

enum LE_SET_ADVERTISING_DATA_CP_SIZE = 32;

enum OCF_LE_SET_SCAN_RESPONSE_DATA = 0x0009;

struct le_set_scan_response_data_cp
{
    align (1):

    ubyte length;
    ubyte[31] data;
}

enum LE_SET_SCAN_RESPONSE_DATA_CP_SIZE = 32;

enum OCF_LE_SET_ADVERTISE_ENABLE = 0x000A;

struct le_set_advertise_enable_cp
{
    align (1):

    ubyte enable;
}

enum LE_SET_ADVERTISE_ENABLE_CP_SIZE = 1;

enum OCF_LE_SET_SCAN_PARAMETERS = 0x000B;

struct le_set_scan_parameters_cp
{
    align (1):

    ubyte type;
    ushort interval;
    ushort window;
    ubyte own_bdaddr_type;
    ubyte filter;
}

enum LE_SET_SCAN_PARAMETERS_CP_SIZE = 7;

enum OCF_LE_SET_SCAN_ENABLE = 0x000C;

struct le_set_scan_enable_cp
{
    align (1):

    ubyte enable;
    ubyte filter_dup;
}

enum LE_SET_SCAN_ENABLE_CP_SIZE = 2;

enum OCF_LE_CREATE_CONN = 0x000D;

struct le_create_connection_cp
{
    align (1):

    ushort interval;
    ushort window;
    ubyte initiator_filter;
    ubyte peer_bdaddr_type;
    bdaddr_t peer_bdaddr;
    ubyte own_bdaddr_type;
    ushort min_interval;
    ushort max_interval;
    ushort latency;
    ushort supervision_timeout;
    ushort min_ce_length;
    ushort max_ce_length;
}

enum LE_CREATE_CONN_CP_SIZE = 25;

enum OCF_LE_CREATE_CONN_CANCEL = 0x000E;

enum OCF_LE_READ_WHITE_LIST_SIZE = 0x000F;

struct le_read_white_list_size_rp
{
    align (1):

    ubyte status;
    ubyte size;
}

enum LE_READ_WHITE_LIST_SIZE_RP_SIZE = 2;

enum OCF_LE_CLEAR_WHITE_LIST = 0x0010;

enum OCF_LE_ADD_DEVICE_TO_WHITE_LIST = 0x0011;

struct le_add_device_to_white_list_cp
{
    align (1):

    ubyte bdaddr_type;
    bdaddr_t bdaddr;
}

enum LE_ADD_DEVICE_TO_WHITE_LIST_CP_SIZE = 7;

enum OCF_LE_REMOVE_DEVICE_FROM_WHITE_LIST = 0x0012;

struct le_remove_device_from_white_list_cp
{
    align (1):

    ubyte bdaddr_type;
    bdaddr_t bdaddr;
}

enum LE_REMOVE_DEVICE_FROM_WHITE_LIST_CP_SIZE = 7;

enum OCF_LE_CONN_UPDATE = 0x0013;

struct le_connection_update_cp
{
    align (1):

    ushort handle;
    ushort min_interval;
    ushort max_interval;
    ushort latency;
    ushort supervision_timeout;
    ushort min_ce_length;
    ushort max_ce_length;
}

enum LE_CONN_UPDATE_CP_SIZE = 14;

enum OCF_LE_SET_HOST_CHANNEL_CLASSIFICATION = 0x0014;

struct le_set_host_channel_classification_cp
{
    align (1):

    ubyte[5] map;
}

enum LE_SET_HOST_CHANNEL_CLASSIFICATION_CP_SIZE = 5;

enum OCF_LE_READ_CHANNEL_MAP = 0x0015;

struct le_read_channel_map_cp
{
    align (1):

    ushort handle;
}

enum LE_READ_CHANNEL_MAP_CP_SIZE = 2;

struct le_read_channel_map_rp
{
    align (1):

    ubyte status;
    ushort handle;
    ubyte[5] map;
}

enum LE_READ_CHANNEL_MAP_RP_SIZE = 8;

enum OCF_LE_READ_REMOTE_USED_FEATURES = 0x0016;

struct le_read_remote_used_features_cp
{
    align (1):

    ushort handle;
}

enum LE_READ_REMOTE_USED_FEATURES_CP_SIZE = 2;

enum OCF_LE_ENCRYPT = 0x0017;

struct le_encrypt_cp
{
    align (1):

    ubyte[16] key;
    ubyte[16] plaintext;
}

enum LE_ENCRYPT_CP_SIZE = 32;

struct le_encrypt_rp
{
    align (1):

    ubyte status;
    ubyte[16] data;
}

enum LE_ENCRYPT_RP_SIZE = 17;

enum OCF_LE_RAND = 0x0018;

struct le_rand_rp
{
    align (1):

    ubyte status;
    ulong random;
}

enum LE_RAND_RP_SIZE = 9;

enum OCF_LE_START_ENCRYPTION = 0x0019;

struct le_start_encryption_cp
{
    align (1):

    ushort handle;
    ulong random;
    ushort diversifier;
    ubyte[16] key;
}

enum LE_START_ENCRYPTION_CP_SIZE = 28;

enum OCF_LE_LTK_REPLY = 0x001A;

struct le_ltk_reply_cp
{
    align (1):

    ushort handle;
    ubyte[16] key;
}

enum LE_LTK_REPLY_CP_SIZE = 18;

struct le_ltk_reply_rp
{
    align (1):

    ubyte status;
    ushort handle;
}

enum LE_LTK_REPLY_RP_SIZE = 3;

enum OCF_LE_LTK_NEG_REPLY = 0x001B;

struct le_ltk_neg_reply_cp
{
    align (1):

    ushort handle;
}

enum LE_LTK_NEG_REPLY_CP_SIZE = 2;

struct le_ltk_neg_reply_rp
{
    align (1):

    ubyte status;
    ushort handle;
}

enum LE_LTK_NEG_REPLY_RP_SIZE = 3;

enum OCF_LE_READ_SUPPORTED_STATES = 0x001C;

struct le_read_supported_states_rp
{
    align (1):

    ubyte status;
    ulong states;
}

enum LE_READ_SUPPORTED_STATES_RP_SIZE = 9;

enum OCF_LE_RECEIVER_TEST = 0x001D;

struct le_receiver_test_cp
{
    align (1):

    ubyte frequency;
}

enum LE_RECEIVER_TEST_CP_SIZE = 1;

enum OCF_LE_TRANSMITTER_TEST = 0x001E;

struct le_transmitter_test_cp
{
    align (1):

    ubyte frequency;
    ubyte length;
    ubyte payload;
}

enum LE_TRANSMITTER_TEST_CP_SIZE = 3;

enum OCF_LE_TEST_END = 0x001F;

struct le_test_end_rp
{
    align (1):

    ubyte status;
    ushort num_pkts;
}

enum LE_TEST_END_RP_SIZE = 3;

enum OCF_LE_ADD_DEVICE_TO_RESOLV_LIST = 0x0027;

struct le_add_device_to_resolv_list_cp
{
    align (1):

    ubyte bdaddr_type;
    bdaddr_t bdaddr;
    ubyte[16] peer_irk;
    ubyte[16] local_irk;
}

enum LE_ADD_DEVICE_TO_RESOLV_LIST_CP_SIZE = 39;

enum OCF_LE_REMOVE_DEVICE_FROM_RESOLV_LIST = 0x0028;

struct le_remove_device_from_resolv_list_cp
{
    align (1):

    ubyte bdaddr_type;
    bdaddr_t bdaddr;
}

enum LE_REMOVE_DEVICE_FROM_RESOLV_LIST_CP_SIZE = 7;

enum OCF_LE_CLEAR_RESOLV_LIST = 0x0029;

enum OCF_LE_READ_RESOLV_LIST_SIZE = 0x002A;

struct le_read_resolv_list_size_rp
{
    align (1):

    ubyte status;
    ubyte size;
}

enum LE_READ_RESOLV_LIST_SIZE_RP_SIZE = 2;

enum OCF_LE_SET_ADDRESS_RESOLUTION_ENABLE = 0x002D;

struct le_set_address_resolution_enable_cp
{
    align (1):

    ubyte enable;
}

enum LE_SET_ADDRESS_RESOLUTION_ENABLE_CP_SIZE = 1;

/* Vendor specific commands */
enum OGF_VENDOR_CMD = 0x3f;

/* ---- HCI Events ---- */

enum EVT_INQUIRY_COMPLETE = 0x01;

enum EVT_INQUIRY_RESULT = 0x02;

struct inquiry_info
{
    align (1):

    bdaddr_t bdaddr;
    ubyte pscan_rep_mode;
    ubyte pscan_period_mode;
    ubyte pscan_mode;
    ubyte[3] dev_class;
    ushort clock_offset;
}

enum INQUIRY_INFO_SIZE = 14;

enum EVT_CONN_COMPLETE = 0x03;

struct evt_conn_complete
{
    align (1):

    ubyte status;
    ushort handle;
    bdaddr_t bdaddr;
    ubyte link_type;
    ubyte encr_mode;
}

enum EVT_CONN_COMPLETE_SIZE = 11;

enum EVT_CONN_REQUEST = 0x04;

struct evt_conn_request
{
    align (1):

    bdaddr_t bdaddr;
    ubyte[3] dev_class;
    ubyte link_type;
}

enum EVT_CONN_REQUEST_SIZE = 10;

enum EVT_DISCONN_COMPLETE = 0x05;

struct evt_disconn_complete
{
    align (1):

    ubyte status;
    ushort handle;
    ubyte reason;
}

enum EVT_DISCONN_COMPLETE_SIZE = 4;

enum EVT_AUTH_COMPLETE = 0x06;

struct evt_auth_complete
{
    align (1):

    ubyte status;
    ushort handle;
}

enum EVT_AUTH_COMPLETE_SIZE = 3;

enum EVT_REMOTE_NAME_REQ_COMPLETE = 0x07;

struct evt_remote_name_req_complete
{
    align (1):

    ubyte status;
    bdaddr_t bdaddr;
    ubyte[HCI_MAX_NAME_LENGTH] name;
}

enum EVT_REMOTE_NAME_REQ_COMPLETE_SIZE = 255;

enum EVT_ENCRYPT_CHANGE = 0x08;

struct evt_encrypt_change
{
    align (1):

    ubyte status;
    ushort handle;
    ubyte encrypt;
}

enum EVT_ENCRYPT_CHANGE_SIZE = 4;

enum EVT_CHANGE_CONN_LINK_KEY_COMPLETE = 0x09;

struct evt_change_conn_link_key_complete
{
    align (1):

    ubyte status;
    ushort handle;
}

enum EVT_CHANGE_CONN_LINK_KEY_COMPLETE_SIZE = 3;

enum EVT_MASTER_LINK_KEY_COMPLETE = 0x0A;

struct evt_master_link_key_complete
{
    align (1):

    ubyte status;
    ushort handle;
    ubyte key_flag;
}

enum EVT_MASTER_LINK_KEY_COMPLETE_SIZE = 4;

enum EVT_READ_REMOTE_FEATURES_COMPLETE = 0x0B;

struct evt_read_remote_features_complete
{
    align (1):

    ubyte status;
    ushort handle;
    ubyte[8] features;
}

enum EVT_READ_REMOTE_FEATURES_COMPLETE_SIZE = 11;

enum EVT_READ_REMOTE_VERSION_COMPLETE = 0x0C;

struct evt_read_remote_version_complete
{
    align (1):

    ubyte status;
    ushort handle;
    ubyte lmp_ver;
    ushort manufacturer;
    ushort lmp_subver;
}

enum EVT_READ_REMOTE_VERSION_COMPLETE_SIZE = 8;

enum EVT_QOS_SETUP_COMPLETE = 0x0D;

struct evt_qos_setup_complete
{
    align (1):

    ubyte status;
    ushort handle;
    ubyte flags; /* Reserved */
    hci_qos qos;
}

enum EVT_QOS_SETUP_COMPLETE_SIZE = 4 + HCI_QOS_CP_SIZE;

enum EVT_CMD_COMPLETE = 0x0E;

struct evt_cmd_complete
{
    align (1):

    ubyte ncmd;
    ushort opcode;
}

enum EVT_CMD_COMPLETE_SIZE = 3;

enum EVT_CMD_STATUS = 0x0F;

struct evt_cmd_status
{
    align (1):

    ubyte status;
    ubyte ncmd;
    ushort opcode;
}

enum EVT_CMD_STATUS_SIZE = 4;

enum EVT_HARDWARE_ERROR = 0x10;

struct evt_hardware_error
{
    align (1):

    ubyte code;
}

enum EVT_HARDWARE_ERROR_SIZE = 1;

enum EVT_FLUSH_OCCURRED = 0x11;

struct evt_flush_occured
{
    align (1):

    ushort handle;
}

enum EVT_FLUSH_OCCURRED_SIZE = 2;

enum EVT_ROLE_CHANGE = 0x12;

struct evt_role_change
{
    align (1):

    ubyte status;
    bdaddr_t bdaddr;
    ubyte role;
}

enum EVT_ROLE_CHANGE_SIZE = 8;

enum EVT_NUM_COMP_PKTS = 0x13;

struct evt_num_comp_pkts
{
    align (1):

    ubyte num_hndl;
    /* variable length part */
}

enum EVT_NUM_COMP_PKTS_SIZE = 1;

enum EVT_MODE_CHANGE = 0x14;

struct evt_mode_change
{
    align (1):

    ubyte status;
    ushort handle;
    ubyte mode;
    ushort interval;
}

enum EVT_MODE_CHANGE_SIZE = 6;

enum EVT_RETURN_LINK_KEYS = 0x15;

struct evt_return_link_keys
{
    align (1):

    ubyte num_keys;
    /* variable length part */
}

enum EVT_RETURN_LINK_KEYS_SIZE = 1;

enum EVT_PIN_CODE_REQ = 0x16;

struct evt_pin_code_req
{
    align (1):

    bdaddr_t bdaddr;
}

enum EVT_PIN_CODE_REQ_SIZE = 6;

enum EVT_LINK_KEY_REQ = 0x17;

struct evt_link_key_req
{
    align (1):

    bdaddr_t bdaddr;
}

enum EVT_LINK_KEY_REQ_SIZE = 6;

enum EVT_LINK_KEY_NOTIFY = 0x18;

struct evt_link_key_notify
{
    align (1):

    bdaddr_t bdaddr;
    ubyte[16] link_key;
    ubyte key_type;
}

enum EVT_LINK_KEY_NOTIFY_SIZE = 23;

enum EVT_LOOPBACK_COMMAND = 0x19;

enum EVT_DATA_BUFFER_OVERFLOW = 0x1A;

struct evt_data_buffer_overflow
{
    align (1):

    ubyte link_type;
}

enum EVT_DATA_BUFFER_OVERFLOW_SIZE = 1;

enum EVT_MAX_SLOTS_CHANGE = 0x1B;

struct evt_max_slots_change
{
    align (1):

    ushort handle;
    ubyte max_slots;
}

enum EVT_MAX_SLOTS_CHANGE_SIZE = 3;

enum EVT_READ_CLOCK_OFFSET_COMPLETE = 0x1C;

struct evt_read_clock_offset_complete
{
    align (1):

    ubyte status;
    ushort handle;
    ushort clock_offset;
}

enum EVT_READ_CLOCK_OFFSET_COMPLETE_SIZE = 5;

enum EVT_CONN_PTYPE_CHANGED = 0x1D;

struct evt_conn_ptype_changed
{
    align (1):

    ubyte status;
    ushort handle;
    ushort ptype;
}

enum EVT_CONN_PTYPE_CHANGED_SIZE = 5;

enum EVT_QOS_VIOLATION = 0x1E;

struct evt_qos_violation
{
    align (1):

    ushort handle;
}

enum EVT_QOS_VIOLATION_SIZE = 2;

enum EVT_PSCAN_REP_MODE_CHANGE = 0x20;

struct evt_pscan_rep_mode_change
{
    align (1):

    bdaddr_t bdaddr;
    ubyte pscan_rep_mode;
}

enum EVT_PSCAN_REP_MODE_CHANGE_SIZE = 7;

enum EVT_FLOW_SPEC_COMPLETE = 0x21;

struct evt_flow_spec_complete
{
    align (1):

    ubyte status;
    ushort handle;
    ubyte flags;
    ubyte direction;
    hci_qos qos;
}

enum EVT_FLOW_SPEC_COMPLETE_SIZE = 5 + HCI_QOS_CP_SIZE;

enum EVT_INQUIRY_RESULT_WITH_RSSI = 0x22;

struct inquiry_info_with_rssi
{
    align (1):

    bdaddr_t bdaddr;
    ubyte pscan_rep_mode;
    ubyte pscan_period_mode;
    ubyte[3] dev_class;
    ushort clock_offset;
    byte rssi;
}

enum INQUIRY_INFO_WITH_RSSI_SIZE = 14;

struct inquiry_info_with_rssi_and_pscan_mode
{
    align (1):

    bdaddr_t bdaddr;
    ubyte pscan_rep_mode;
    ubyte pscan_period_mode;
    ubyte pscan_mode;
    ubyte[3] dev_class;
    ushort clock_offset;
    byte rssi;
}

enum INQUIRY_INFO_WITH_RSSI_AND_PSCAN_MODE_SIZE = 15;

enum EVT_READ_REMOTE_EXT_FEATURES_COMPLETE = 0x23;

struct evt_read_remote_ext_features_complete
{
    align (1):

    ubyte status;
    ushort handle;
    ubyte page_num;
    ubyte max_page_num;
    ubyte[8] features;
}

enum EVT_READ_REMOTE_EXT_FEATURES_COMPLETE_SIZE = 13;

enum EVT_SYNC_CONN_COMPLETE = 0x2C;

struct evt_sync_conn_complete
{
    align (1):

    ubyte status;
    ushort handle;
    bdaddr_t bdaddr;
    ubyte link_type;
    ubyte trans_interval;
    ubyte retrans_window;
    ushort rx_pkt_len;
    ushort tx_pkt_len;
    ubyte air_mode;
}

enum EVT_SYNC_CONN_COMPLETE_SIZE = 17;

enum EVT_SYNC_CONN_CHANGED = 0x2D;

struct evt_sync_conn_changed
{
    align (1):

    ubyte status;
    ushort handle;
    ubyte trans_interval;
    ubyte retrans_window;
    ushort rx_pkt_len;
    ushort tx_pkt_len;
}

enum EVT_SYNC_CONN_CHANGED_SIZE = 9;

enum EVT_SNIFF_SUBRATING = 0x2E;

struct evt_sniff_subrating
{
    align (1):

    ubyte status;
    ushort handle;
    ushort max_tx_latency;
    ushort max_rx_latency;
    ushort min_remote_timeout;
    ushort min_local_timeout;
}

enum EVT_SNIFF_SUBRATING_SIZE = 11;

enum EVT_EXTENDED_INQUIRY_RESULT = 0x2F;

struct extended_inquiry_info
{
    align (1):

    bdaddr_t bdaddr;
    ubyte pscan_rep_mode;
    ubyte pscan_period_mode;
    ubyte[3] dev_class;
    ushort clock_offset;
    byte rssi;
    ubyte[HCI_MAX_EIR_LENGTH] data;
}

enum EXTENDED_INQUIRY_INFO_SIZE = 254;

enum EVT_ENCRYPTION_KEY_REFRESH_COMPLETE = 0x30;

struct evt_encryption_key_refresh_complete
{
    align (1):

    ubyte status;
    ushort handle;
}

enum EVT_ENCRYPTION_KEY_REFRESH_COMPLETE_SIZE = 3;

enum EVT_IO_CAPABILITY_REQUEST = 0x31;

struct evt_io_capability_request
{
    align (1):

    bdaddr_t bdaddr;
}

enum EVT_IO_CAPABILITY_REQUEST_SIZE = 6;

enum EVT_IO_CAPABILITY_RESPONSE = 0x32;

struct evt_io_capability_response
{
    align (1):

    bdaddr_t bdaddr;
    ubyte capability;
    ubyte oob_data;
    ubyte authentication;
}

enum EVT_IO_CAPABILITY_RESPONSE_SIZE = 9;

enum EVT_USER_CONFIRM_REQUEST = 0x33;

struct evt_user_confirm_request
{
    align (1):

    bdaddr_t bdaddr;
    uint passkey;
}

enum EVT_USER_CONFIRM_REQUEST_SIZE = 10;

enum EVT_USER_PASSKEY_REQUEST = 0x34;

struct evt_user_passkey_request
{
    align (1):

    bdaddr_t bdaddr;
}

enum EVT_USER_PASSKEY_REQUEST_SIZE = 6;

enum EVT_REMOTE_OOB_DATA_REQUEST = 0x35;

struct evt_remote_oob_data_request
{
    align (1):

    bdaddr_t bdaddr;
}

enum EVT_REMOTE_OOB_DATA_REQUEST_SIZE = 6;

enum EVT_SIMPLE_PAIRING_COMPLETE = 0x36;

struct evt_simple_pairing_complete
{
    align (1):

    ubyte status;
    bdaddr_t bdaddr;
}

enum EVT_SIMPLE_PAIRING_COMPLETE_SIZE = 7;

enum EVT_LINK_SUPERVISION_TIMEOUT_CHANGED = 0x38;

struct evt_link_supervision_timeout_changed
{
    align (1):

    ushort handle;
    ushort timeout;
}

enum EVT_LINK_SUPERVISION_TIMEOUT_CHANGED_SIZE = 4;

enum EVT_ENHANCED_FLUSH_COMPLETE = 0x39;

struct evt_enhanced_flush_complete
{
    align (1):

    ushort handle;
}

enum EVT_ENHANCED_FLUSH_COMPLETE_SIZE = 2;

enum EVT_USER_PASSKEY_NOTIFY = 0x3B;

struct evt_user_passkey_notify
{
    align (1):

    bdaddr_t bdaddr;
    uint passkey;
}

enum EVT_USER_PASSKEY_NOTIFY_SIZE = 10;

enum EVT_KEYPRESS_NOTIFY = 0x3C;

struct evt_keypress_notify
{
    align (1):

    bdaddr_t bdaddr;
    ubyte type;
}

enum EVT_KEYPRESS_NOTIFY_SIZE = 7;

enum EVT_REMOTE_HOST_FEATURES_NOTIFY = 0x3D;

struct evt_remote_host_features_notify
{
    align (1):

    bdaddr_t bdaddr;
    ubyte[8] features;
}

enum EVT_REMOTE_HOST_FEATURES_NOTIFY_SIZE = 14;

enum EVT_LE_META_EVENT = 0x3E;

struct evt_le_meta_event
{
    align (1):

    ubyte subevent;
    ubyte[0] data;
}

enum EVT_LE_META_EVENT_SIZE = 1;

enum EVT_LE_CONN_COMPLETE = 0x01;

struct evt_le_connection_complete
{
    align (1):

    ubyte status;
    ushort handle;
    ubyte role;
    ubyte peer_bdaddr_type;
    bdaddr_t peer_bdaddr;
    ushort interval;
    ushort latency;
    ushort supervision_timeout;
    ubyte master_clock_accuracy;
}

enum EVT_LE_CONN_COMPLETE_SIZE = 18;

enum EVT_LE_ADVERTISING_REPORT = 0x02;

struct le_advertising_info
{
    align (1):

    ubyte evt_type;
    ubyte bdaddr_type;
    bdaddr_t bdaddr;
    ubyte length;
    ubyte[0] data;
}

enum LE_ADVERTISING_INFO_SIZE = 9;

enum EVT_LE_CONN_UPDATE_COMPLETE = 0x03;

struct evt_le_connection_update_complete
{
    align (1):

    ubyte status;
    ushort handle;
    ushort interval;
    ushort latency;
    ushort supervision_timeout;
}

enum EVT_LE_CONN_UPDATE_COMPLETE_SIZE = 9;

enum EVT_LE_READ_REMOTE_USED_FEATURES_COMPLETE = 0x04;

struct evt_le_read_remote_used_features_complete
{
    align (1):

    ubyte status;
    ushort handle;
    ubyte[8] features;
}

enum EVT_LE_READ_REMOTE_USED_FEATURES_COMPLETE_SIZE = 11;

enum EVT_LE_LTK_REQUEST = 0x05;

struct evt_le_long_term_key_request
{
    align (1):

    ushort handle;
    ulong random;
    ushort diversifier;
}

enum EVT_LE_LTK_REQUEST_SIZE = 12;

enum EVT_PHYSICAL_LINK_COMPLETE = 0x40;

struct evt_physical_link_complete
{
    align (1):

    ubyte status;
    ubyte handle;
}

enum EVT_PHYSICAL_LINK_COMPLETE_SIZE = 2;

enum EVT_CHANNEL_SELECTED = 0x41;

enum EVT_DISCONNECT_PHYSICAL_LINK_COMPLETE = 0x42;

struct evt_disconn_physical_link_complete
{
    align (1):

    ubyte status;
    ubyte handle;
    ubyte reason;
}

enum EVT_DISCONNECT_PHYSICAL_LINK_COMPLETE_SIZE = 3;

enum EVT_PHYSICAL_LINK_LOSS_EARLY_WARNING = 0x43;

struct evt_physical_link_loss_warning
{
    align (1):

    ubyte handle;
    ubyte reason;
}

enum EVT_PHYSICAL_LINK_LOSS_WARNING_SIZE = 2;

enum EVT_PHYSICAL_LINK_RECOVERY = 0x44;

struct evt_physical_link_recovery
{
    align (1):

    ubyte handle;
}

enum EVT_PHYSICAL_LINK_RECOVERY_SIZE = 1;

enum EVT_LOGICAL_LINK_COMPLETE = 0x45;

struct evt_logical_link_complete
{
    align (1):

    ubyte status;
    ushort log_handle;
    ubyte handle;
    ubyte tx_flow_id;
}

enum EVT_LOGICAL_LINK_COMPLETE_SIZE = 5;

enum EVT_DISCONNECT_LOGICAL_LINK_COMPLETE = 0x46;

enum EVT_FLOW_SPEC_MODIFY_COMPLETE = 0x47;

struct evt_flow_spec_modify_complete
{
    align (1):

    ubyte status;
    ushort handle;
}

enum EVT_FLOW_SPEC_MODIFY_COMPLETE_SIZE = 3;

enum EVT_NUMBER_COMPLETED_BLOCKS = 0x48;

struct cmplt_handle
{
    align (1):

    ushort handle;
    ushort num_cmplt_pkts;
    ushort num_cmplt_blks;
}

struct evt_num_completed_blocks
{
    align (1):

    ushort total_num_blocks;
    ubyte num_handles;
    cmplt_handle[0] handles;
}

enum EVT_AMP_STATUS_CHANGE = 0x4D;

struct evt_amp_status_change
{
    align (1):

    ubyte status;
    ubyte amp_status;
}

enum EVT_AMP_STATUS_CHANGE_SIZE = 2;

enum EVT_TESTING = 0xFE;

enum EVT_VENDOR = 0xFF;

/* Internal events generated by BlueZ stack */
enum EVT_STACK_INTERNAL = 0xFD;

struct evt_stack_internal
{
    align (1):

    ushort type;
    ubyte[0] data;
}

enum EVT_STACK_INTERNAL_SIZE = 2;

enum EVT_SI_DEVICE = 0x01;

struct evt_si_device
{
    align (1):

    ushort event;
    ushort dev_id;
}

enum EVT_SI_DEVICE_SIZE = 4;

/* --------  HCI Packet structures  -------- */
enum HCI_TYPE_LEN = 1;

struct hci_command_hdr
{
    align (1):

    ushort opcode; /* OCF & OGF */
    ubyte plen;
}

enum HCI_COMMAND_HDR_SIZE = 3;

struct hci_event_hdr
{
    align (1):

    ubyte evt;
    ubyte plen;
}

enum HCI_EVENT_HDR_SIZE = 2;

struct hci_acl_hdr
{
    align (1):

    ushort handle; /* Handle & Flags(PB, BC) */
    ushort dlen;
}

enum HCI_ACL_HDR_SIZE = 4;

struct hci_sco_hdr
{
    align (1):

    ushort handle;
    ubyte dlen;
}

enum HCI_SCO_HDR_SIZE = 3;

struct hci_msg_hdr
{
    align (1):

    ushort device;
    ushort type;
    ushort plen;
}

enum HCI_MSG_HDR_SIZE = 6;

/* Command opcode pack/unpack */
extern (D) auto cmd_opcode_pack(T0, T1)(auto ref T0 ogf, auto ref T1 ocf)
{
    return cast(ushort) (ocf & 0x03ff) | (ogf << 10);
}

extern (D) auto cmd_opcode_ogf(T)(auto ref T op)
{
    return op >> 10;
}

extern (D) auto cmd_opcode_ocf(T)(auto ref T op)
{
    return op & 0x03ff;
}

/* ACL handle and flags pack/unpack */
extern (D) auto acl_handle_pack(T0, T1)(auto ref T0 h, auto ref T1 f)
{
    return cast(ushort) (h & 0x0fff) | (f << 12);
}

extern (D) auto acl_handle(T)(auto ref T h)
{
    return h & 0x0fff;
}

extern (D) auto acl_flags(T)(auto ref T h)
{
    return h >> 12;
}

/* _NO_HCI_DEFS */

/* HCI Socket options */
enum HCI_DATA_DIR = 1;
enum HCI_FILTER = 2;
enum HCI_TIME_STAMP = 3;

/* HCI CMSG flags */
enum HCI_CMSG_DIR = 0x0001;
enum HCI_CMSG_TSTAMP = 0x0002;

struct sockaddr_hci
{
    sa_family_t hci_family;
    ushort hci_dev;
    ushort hci_channel;
}

enum HCI_DEV_NONE = 0xffff;

enum HCI_CHANNEL_RAW = 0;
enum HCI_CHANNEL_USER = 1;
enum HCI_CHANNEL_MONITOR = 2;
enum HCI_CHANNEL_CONTROL = 3;
enum HCI_CHANNEL_LOGGING = 4;

struct hci_filter
{
    uint type_mask;
    uint[2] event_mask;
    ushort opcode;
}

enum HCI_FLT_TYPE_BITS = 31;
enum HCI_FLT_EVENT_BITS = 63;
enum HCI_FLT_OGF_BITS = 63;
enum HCI_FLT_OCF_BITS = 127;

/* Ioctl requests structures */
struct hci_dev_stats
{
    uint err_rx;
    uint err_tx;
    uint cmd_tx;
    uint evt_rx;
    uint acl_tx;
    uint acl_rx;
    uint sco_tx;
    uint sco_rx;
    uint byte_rx;
    uint byte_tx;
}

struct hci_dev_info
{
    ushort dev_id;
    char[8] name;

    bdaddr_t bdaddr;

    uint flags;
    ubyte type;

    ubyte[8] features;

    uint pkt_type;
    uint link_policy;
    uint link_mode;

    ushort acl_mtu;
    ushort acl_pkts;
    ushort sco_mtu;
    ushort sco_pkts;

    hci_dev_stats stat;
}

struct hci_conn_info
{
    ushort handle;
    bdaddr_t bdaddr;
    ubyte type;
    ubyte out_;
    ushort state;
    uint link_mode;
}

struct hci_dev_req
{
    ushort dev_id;
    uint dev_opt;
}

struct hci_dev_list_req
{
    ushort dev_num;
    hci_dev_req[0] dev_req; /* hci_dev_req structures */
}

struct hci_conn_list_req
{
    ushort dev_id;
    ushort conn_num;
    hci_conn_info[0] conn_info;
}

struct hci_conn_info_req
{
    bdaddr_t bdaddr;
    ubyte type;
    hci_conn_info[0] conn_info;
}

struct hci_auth_info_req
{
    bdaddr_t bdaddr;
    ubyte type;
}

struct hci_inquiry_req
{
    ushort dev_id;
    ushort flags;
    ubyte[3] lap;
    ubyte length;
    ubyte num_rsp;
}

enum IREQ_CACHE_FLUSH = 0x0001;

/* __HCI_H */
