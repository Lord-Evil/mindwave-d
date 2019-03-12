/*
 *
 *  BlueZ - Bluetooth protocol stack for Linux
 *
 *  Copyright (C) 2001-2002  Nokia Corporation
 *  Copyright (C) 2002-2003  Maxim Krasnyansky <maxk@qualcomm.com>
 *  Copyright (C) 2002-2010  Marcel Holtmann <marcel@holtmann.org>
 *  Copyright (C) 2002-2003  Stephen Crane <steve.crane@rococosoft.com>
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

enum SDP_UNIX_PATH = "/var/run/sdp";
enum SDP_RESPONSE_TIMEOUT = 20;
enum SDP_REQ_BUFFER_SIZE = 2048;
enum SDP_RSP_BUFFER_SIZE = 65535;
enum SDP_PDU_CHUNK_SIZE = 1024;

/*
 * All definitions are based on Bluetooth Assigned Numbers
 * of the Bluetooth Specification
 */
enum SDP_PSM = 0x0001;

/*
 * Protocol UUIDs
 */
enum SDP_UUID = 0x0001;
enum UDP_UUID = 0x0002;
enum RFCOMM_UUID = 0x0003;
enum TCP_UUID = 0x0004;
enum TCS_BIN_UUID = 0x0005;
enum TCS_AT_UUID = 0x0006;
enum ATT_UUID = 0x0007;
enum OBEX_UUID = 0x0008;
enum IP_UUID = 0x0009;
enum FTP_UUID = 0x000a;
enum HTTP_UUID = 0x000c;
enum WSP_UUID = 0x000e;
enum BNEP_UUID = 0x000f;
enum UPNP_UUID = 0x0010;
enum HIDP_UUID = 0x0011;
enum HCRP_CTRL_UUID = 0x0012;
enum HCRP_DATA_UUID = 0x0014;
enum HCRP_NOTE_UUID = 0x0016;
enum AVCTP_UUID = 0x0017;
enum AVDTP_UUID = 0x0019;
enum CMTP_UUID = 0x001b;
enum UDI_UUID = 0x001d;
enum MCAP_CTRL_UUID = 0x001e;
enum MCAP_DATA_UUID = 0x001f;
enum L2CAP_UUID = 0x0100;

/*
 * Service class identifiers of standard services and service groups
 */
enum SDP_SERVER_SVCLASS_ID = 0x1000;
enum BROWSE_GRP_DESC_SVCLASS_ID = 0x1001;
enum PUBLIC_BROWSE_GROUP = 0x1002;
enum SERIAL_PORT_SVCLASS_ID = 0x1101;
enum LAN_ACCESS_SVCLASS_ID = 0x1102;
enum DIALUP_NET_SVCLASS_ID = 0x1103;
enum IRMC_SYNC_SVCLASS_ID = 0x1104;
enum OBEX_OBJPUSH_SVCLASS_ID = 0x1105;
enum OBEX_FILETRANS_SVCLASS_ID = 0x1106;
enum IRMC_SYNC_CMD_SVCLASS_ID = 0x1107;
enum HEADSET_SVCLASS_ID = 0x1108;
enum CORDLESS_TELEPHONY_SVCLASS_ID = 0x1109;
enum AUDIO_SOURCE_SVCLASS_ID = 0x110a;
enum AUDIO_SINK_SVCLASS_ID = 0x110b;
enum AV_REMOTE_TARGET_SVCLASS_ID = 0x110c;
enum ADVANCED_AUDIO_SVCLASS_ID = 0x110d;
enum AV_REMOTE_SVCLASS_ID = 0x110e;
enum AV_REMOTE_CONTROLLER_SVCLASS_ID = 0x110f;
enum INTERCOM_SVCLASS_ID = 0x1110;
enum FAX_SVCLASS_ID = 0x1111;
enum HEADSET_AGW_SVCLASS_ID = 0x1112;
enum WAP_SVCLASS_ID = 0x1113;
enum WAP_CLIENT_SVCLASS_ID = 0x1114;
enum PANU_SVCLASS_ID = 0x1115;
enum NAP_SVCLASS_ID = 0x1116;
enum GN_SVCLASS_ID = 0x1117;
enum DIRECT_PRINTING_SVCLASS_ID = 0x1118;
enum REFERENCE_PRINTING_SVCLASS_ID = 0x1119;
enum IMAGING_SVCLASS_ID = 0x111a;
enum IMAGING_RESPONDER_SVCLASS_ID = 0x111b;
enum IMAGING_ARCHIVE_SVCLASS_ID = 0x111c;
enum IMAGING_REFOBJS_SVCLASS_ID = 0x111d;
enum HANDSFREE_SVCLASS_ID = 0x111e;
enum HANDSFREE_AGW_SVCLASS_ID = 0x111f;
enum DIRECT_PRT_REFOBJS_SVCLASS_ID = 0x1120;
enum REFLECTED_UI_SVCLASS_ID = 0x1121;
enum BASIC_PRINTING_SVCLASS_ID = 0x1122;
enum PRINTING_STATUS_SVCLASS_ID = 0x1123;
enum HID_SVCLASS_ID = 0x1124;
enum HCR_SVCLASS_ID = 0x1125;
enum HCR_PRINT_SVCLASS_ID = 0x1126;
enum HCR_SCAN_SVCLASS_ID = 0x1127;
enum CIP_SVCLASS_ID = 0x1128;
enum VIDEO_CONF_GW_SVCLASS_ID = 0x1129;
enum UDI_MT_SVCLASS_ID = 0x112a;
enum UDI_TA_SVCLASS_ID = 0x112b;
enum AV_SVCLASS_ID = 0x112c;
enum SAP_SVCLASS_ID = 0x112d;
enum PBAP_PCE_SVCLASS_ID = 0x112e;
enum PBAP_PSE_SVCLASS_ID = 0x112f;
enum PBAP_SVCLASS_ID = 0x1130;
enum MAP_MSE_SVCLASS_ID = 0x1132;
enum MAP_MCE_SVCLASS_ID = 0x1133;
enum MAP_SVCLASS_ID = 0x1134;
enum GNSS_SVCLASS_ID = 0x1135;
enum GNSS_SERVER_SVCLASS_ID = 0x1136;
enum MPS_SC_SVCLASS_ID = 0x113A;
enum MPS_SVCLASS_ID = 0x113B;
enum PNP_INFO_SVCLASS_ID = 0x1200;
enum GENERIC_NETWORKING_SVCLASS_ID = 0x1201;
enum GENERIC_FILETRANS_SVCLASS_ID = 0x1202;
enum GENERIC_AUDIO_SVCLASS_ID = 0x1203;
enum GENERIC_TELEPHONY_SVCLASS_ID = 0x1204;
enum UPNP_SVCLASS_ID = 0x1205;
enum UPNP_IP_SVCLASS_ID = 0x1206;
enum UPNP_PAN_SVCLASS_ID = 0x1300;
enum UPNP_LAP_SVCLASS_ID = 0x1301;
enum UPNP_L2CAP_SVCLASS_ID = 0x1302;
enum VIDEO_SOURCE_SVCLASS_ID = 0x1303;
enum VIDEO_SINK_SVCLASS_ID = 0x1304;
enum VIDEO_DISTRIBUTION_SVCLASS_ID = 0x1305;
enum HDP_SVCLASS_ID = 0x1400;
enum HDP_SOURCE_SVCLASS_ID = 0x1401;
enum HDP_SINK_SVCLASS_ID = 0x1402;
enum GENERIC_ACCESS_SVCLASS_ID = 0x1800;
enum GENERIC_ATTRIB_SVCLASS_ID = 0x1801;
enum APPLE_AGENT_SVCLASS_ID = 0x2112;

/*
 * Standard profile descriptor identifiers; note these
 * may be identical to some of the service classes defined above
 */
enum SDP_SERVER_PROFILE_ID = SDP_SERVER_SVCLASS_ID;
enum BROWSE_GRP_DESC_PROFILE_ID = BROWSE_GRP_DESC_SVCLASS_ID;
enum SERIAL_PORT_PROFILE_ID = SERIAL_PORT_SVCLASS_ID;
enum LAN_ACCESS_PROFILE_ID = LAN_ACCESS_SVCLASS_ID;
enum DIALUP_NET_PROFILE_ID = DIALUP_NET_SVCLASS_ID;
enum IRMC_SYNC_PROFILE_ID = IRMC_SYNC_SVCLASS_ID;
enum OBEX_OBJPUSH_PROFILE_ID = OBEX_OBJPUSH_SVCLASS_ID;
enum OBEX_FILETRANS_PROFILE_ID = OBEX_FILETRANS_SVCLASS_ID;
enum IRMC_SYNC_CMD_PROFILE_ID = IRMC_SYNC_CMD_SVCLASS_ID;
enum HEADSET_PROFILE_ID = HEADSET_SVCLASS_ID;
enum CORDLESS_TELEPHONY_PROFILE_ID = CORDLESS_TELEPHONY_SVCLASS_ID;
enum AUDIO_SOURCE_PROFILE_ID = AUDIO_SOURCE_SVCLASS_ID;
enum AUDIO_SINK_PROFILE_ID = AUDIO_SINK_SVCLASS_ID;
enum AV_REMOTE_TARGET_PROFILE_ID = AV_REMOTE_TARGET_SVCLASS_ID;
enum ADVANCED_AUDIO_PROFILE_ID = ADVANCED_AUDIO_SVCLASS_ID;
enum AV_REMOTE_PROFILE_ID = AV_REMOTE_SVCLASS_ID;
enum INTERCOM_PROFILE_ID = INTERCOM_SVCLASS_ID;
enum FAX_PROFILE_ID = FAX_SVCLASS_ID;
enum HEADSET_AGW_PROFILE_ID = HEADSET_AGW_SVCLASS_ID;
enum WAP_PROFILE_ID = WAP_SVCLASS_ID;
enum WAP_CLIENT_PROFILE_ID = WAP_CLIENT_SVCLASS_ID;
enum PANU_PROFILE_ID = PANU_SVCLASS_ID;
enum NAP_PROFILE_ID = NAP_SVCLASS_ID;
enum GN_PROFILE_ID = GN_SVCLASS_ID;
enum DIRECT_PRINTING_PROFILE_ID = DIRECT_PRINTING_SVCLASS_ID;
enum REFERENCE_PRINTING_PROFILE_ID = REFERENCE_PRINTING_SVCLASS_ID;
enum IMAGING_PROFILE_ID = IMAGING_SVCLASS_ID;
enum IMAGING_RESPONDER_PROFILE_ID = IMAGING_RESPONDER_SVCLASS_ID;
enum IMAGING_ARCHIVE_PROFILE_ID = IMAGING_ARCHIVE_SVCLASS_ID;
enum IMAGING_REFOBJS_PROFILE_ID = IMAGING_REFOBJS_SVCLASS_ID;
enum HANDSFREE_PROFILE_ID = HANDSFREE_SVCLASS_ID;
enum HANDSFREE_AGW_PROFILE_ID = HANDSFREE_AGW_SVCLASS_ID;
enum DIRECT_PRT_REFOBJS_PROFILE_ID = DIRECT_PRT_REFOBJS_SVCLASS_ID;
enum REFLECTED_UI_PROFILE_ID = REFLECTED_UI_SVCLASS_ID;
enum BASIC_PRINTING_PROFILE_ID = BASIC_PRINTING_SVCLASS_ID;
enum PRINTING_STATUS_PROFILE_ID = PRINTING_STATUS_SVCLASS_ID;
enum HID_PROFILE_ID = HID_SVCLASS_ID;
enum HCR_PROFILE_ID = HCR_SCAN_SVCLASS_ID;
enum HCR_PRINT_PROFILE_ID = HCR_PRINT_SVCLASS_ID;
enum HCR_SCAN_PROFILE_ID = HCR_SCAN_SVCLASS_ID;
enum CIP_PROFILE_ID = CIP_SVCLASS_ID;
enum VIDEO_CONF_GW_PROFILE_ID = VIDEO_CONF_GW_SVCLASS_ID;
enum UDI_MT_PROFILE_ID = UDI_MT_SVCLASS_ID;
enum UDI_TA_PROFILE_ID = UDI_TA_SVCLASS_ID;
enum AV_PROFILE_ID = AV_SVCLASS_ID;
enum SAP_PROFILE_ID = SAP_SVCLASS_ID;
enum PBAP_PCE_PROFILE_ID = PBAP_PCE_SVCLASS_ID;
enum PBAP_PSE_PROFILE_ID = PBAP_PSE_SVCLASS_ID;
enum PBAP_PROFILE_ID = PBAP_SVCLASS_ID;
enum MAP_PROFILE_ID = MAP_SVCLASS_ID;
enum PNP_INFO_PROFILE_ID = PNP_INFO_SVCLASS_ID;
enum GENERIC_NETWORKING_PROFILE_ID = GENERIC_NETWORKING_SVCLASS_ID;
enum GENERIC_FILETRANS_PROFILE_ID = GENERIC_FILETRANS_SVCLASS_ID;
enum GENERIC_AUDIO_PROFILE_ID = GENERIC_AUDIO_SVCLASS_ID;
enum GENERIC_TELEPHONY_PROFILE_ID = GENERIC_TELEPHONY_SVCLASS_ID;
enum UPNP_PROFILE_ID = UPNP_SVCLASS_ID;
enum UPNP_IP_PROFILE_ID = UPNP_IP_SVCLASS_ID;
enum UPNP_PAN_PROFILE_ID = UPNP_PAN_SVCLASS_ID;
enum UPNP_LAP_PROFILE_ID = UPNP_LAP_SVCLASS_ID;
enum UPNP_L2CAP_PROFILE_ID = UPNP_L2CAP_SVCLASS_ID;
enum VIDEO_SOURCE_PROFILE_ID = VIDEO_SOURCE_SVCLASS_ID;
enum VIDEO_SINK_PROFILE_ID = VIDEO_SINK_SVCLASS_ID;
enum VIDEO_DISTRIBUTION_PROFILE_ID = VIDEO_DISTRIBUTION_SVCLASS_ID;
enum HDP_PROFILE_ID = HDP_SVCLASS_ID;
enum HDP_SOURCE_PROFILE_ID = HDP_SOURCE_SVCLASS_ID;
enum HDP_SINK_PROFILE_ID = HDP_SINK_SVCLASS_ID;
enum GENERIC_ACCESS_PROFILE_ID = GENERIC_ACCESS_SVCLASS_ID;
enum GENERIC_ATTRIB_PROFILE_ID = GENERIC_ATTRIB_SVCLASS_ID;
enum APPLE_AGENT_PROFILE_ID = APPLE_AGENT_SVCLASS_ID;
enum MPS_PROFILE_ID = MPS_SC_SVCLASS_ID;

/*
 * Compatibility macros for the old MDP acronym
 */
enum MDP_SVCLASS_ID = HDP_SVCLASS_ID;
enum MDP_SOURCE_SVCLASS_ID = HDP_SOURCE_SVCLASS_ID;
enum MDP_SINK_SVCLASS_ID = HDP_SINK_SVCLASS_ID;
enum MDP_PROFILE_ID = HDP_PROFILE_ID;
enum MDP_SOURCE_PROFILE_ID = HDP_SOURCE_PROFILE_ID;
enum MDP_SINK_PROFILE_ID = HDP_SINK_PROFILE_ID;

/*
 * Attribute identifier codes
 */
enum SDP_SERVER_RECORD_HANDLE = 0x0000;

/*
 * Possible values for attribute-id are listed below.
 * See SDP Spec, section "Service Attribute Definitions" for more details.
 */
enum SDP_ATTR_RECORD_HANDLE = 0x0000;
enum SDP_ATTR_SVCLASS_ID_LIST = 0x0001;
enum SDP_ATTR_RECORD_STATE = 0x0002;
enum SDP_ATTR_SERVICE_ID = 0x0003;
enum SDP_ATTR_PROTO_DESC_LIST = 0x0004;
enum SDP_ATTR_BROWSE_GRP_LIST = 0x0005;
enum SDP_ATTR_LANG_BASE_ATTR_ID_LIST = 0x0006;
enum SDP_ATTR_SVCINFO_TTL = 0x0007;
enum SDP_ATTR_SERVICE_AVAILABILITY = 0x0008;
enum SDP_ATTR_PFILE_DESC_LIST = 0x0009;
enum SDP_ATTR_DOC_URL = 0x000a;
enum SDP_ATTR_CLNT_EXEC_URL = 0x000b;
enum SDP_ATTR_ICON_URL = 0x000c;
enum SDP_ATTR_ADD_PROTO_DESC_LIST = 0x000d;

enum SDP_ATTR_GROUP_ID = 0x0200;
enum SDP_ATTR_IP_SUBNET = 0x0200;
enum SDP_ATTR_VERSION_NUM_LIST = 0x0200;
enum SDP_ATTR_SUPPORTED_FEATURES_LIST = 0x0200;
enum SDP_ATTR_GOEP_L2CAP_PSM = 0x0200;
enum SDP_ATTR_SVCDB_STATE = 0x0201;

enum SDP_ATTR_MPSD_SCENARIOS = 0x0200;
enum SDP_ATTR_MPMD_SCENARIOS = 0x0201;
enum SDP_ATTR_MPS_DEPENDENCIES = 0x0202;

enum SDP_ATTR_SERVICE_VERSION = 0x0300;
enum SDP_ATTR_EXTERNAL_NETWORK = 0x0301;
enum SDP_ATTR_SUPPORTED_DATA_STORES_LIST = 0x0301;
enum SDP_ATTR_DATA_EXCHANGE_SPEC = 0x0301;
enum SDP_ATTR_NETWORK = 0x0301;
enum SDP_ATTR_FAX_CLASS1_SUPPORT = 0x0302;
enum SDP_ATTR_REMOTE_AUDIO_VOLUME_CONTROL = 0x0302;
enum SDP_ATTR_MCAP_SUPPORTED_PROCEDURES = 0x0302;
enum SDP_ATTR_FAX_CLASS20_SUPPORT = 0x0303;
enum SDP_ATTR_SUPPORTED_FORMATS_LIST = 0x0303;
enum SDP_ATTR_FAX_CLASS2_SUPPORT = 0x0304;
enum SDP_ATTR_AUDIO_FEEDBACK_SUPPORT = 0x0305;
enum SDP_ATTR_NETWORK_ADDRESS = 0x0306;
enum SDP_ATTR_WAP_GATEWAY = 0x0307;
enum SDP_ATTR_HOMEPAGE_URL = 0x0308;
enum SDP_ATTR_WAP_STACK_TYPE = 0x0309;
enum SDP_ATTR_SECURITY_DESC = 0x030a;
enum SDP_ATTR_NET_ACCESS_TYPE = 0x030b;
enum SDP_ATTR_MAX_NET_ACCESSRATE = 0x030c;
enum SDP_ATTR_IP4_SUBNET = 0x030d;
enum SDP_ATTR_IP6_SUBNET = 0x030e;
enum SDP_ATTR_SUPPORTED_CAPABILITIES = 0x0310;
enum SDP_ATTR_SUPPORTED_FEATURES = 0x0311;
enum SDP_ATTR_SUPPORTED_FUNCTIONS = 0x0312;
enum SDP_ATTR_TOTAL_IMAGING_DATA_CAPACITY = 0x0313;
enum SDP_ATTR_SUPPORTED_REPOSITORIES = 0x0314;
enum SDP_ATTR_MAS_INSTANCE_ID = 0x0315;
enum SDP_ATTR_SUPPORTED_MESSAGE_TYPES = 0x0316;
enum SDP_ATTR_PBAP_SUPPORTED_FEATURES = 0x0317;
enum SDP_ATTR_MAP_SUPPORTED_FEATURES = 0x0317;

enum SDP_ATTR_SPECIFICATION_ID = 0x0200;
enum SDP_ATTR_VENDOR_ID = 0x0201;
enum SDP_ATTR_PRODUCT_ID = 0x0202;
enum SDP_ATTR_VERSION = 0x0203;
enum SDP_ATTR_PRIMARY_RECORD = 0x0204;
enum SDP_ATTR_VENDOR_ID_SOURCE = 0x0205;

enum SDP_ATTR_HID_DEVICE_RELEASE_NUMBER = 0x0200;
enum SDP_ATTR_HID_PARSER_VERSION = 0x0201;
enum SDP_ATTR_HID_DEVICE_SUBCLASS = 0x0202;
enum SDP_ATTR_HID_COUNTRY_CODE = 0x0203;
enum SDP_ATTR_HID_VIRTUAL_CABLE = 0x0204;
enum SDP_ATTR_HID_RECONNECT_INITIATE = 0x0205;
enum SDP_ATTR_HID_DESCRIPTOR_LIST = 0x0206;
enum SDP_ATTR_HID_LANG_ID_BASE_LIST = 0x0207;
enum SDP_ATTR_HID_SDP_DISABLE = 0x0208;
enum SDP_ATTR_HID_BATTERY_POWER = 0x0209;
enum SDP_ATTR_HID_REMOTE_WAKEUP = 0x020a;
enum SDP_ATTR_HID_PROFILE_VERSION = 0x020b;
enum SDP_ATTR_HID_SUPERVISION_TIMEOUT = 0x020c;
enum SDP_ATTR_HID_NORMALLY_CONNECTABLE = 0x020d;
enum SDP_ATTR_HID_BOOT_DEVICE = 0x020e;

/*
 * These identifiers are based on the SDP spec stating that
 * "base attribute id of the primary (universal) language must be 0x0100"
 *
 * Other languages should have their own offset; e.g.:
 * #define XXXLangBase yyyy
 * #define AttrServiceName_XXX	0x0000+XXXLangBase
 */
enum SDP_PRIMARY_LANG_BASE = 0x0100;

enum SDP_ATTR_SVCNAME_PRIMARY = 0x0000 + SDP_PRIMARY_LANG_BASE;
enum SDP_ATTR_SVCDESC_PRIMARY = 0x0001 + SDP_PRIMARY_LANG_BASE;
enum SDP_ATTR_PROVNAME_PRIMARY = 0x0002 + SDP_PRIMARY_LANG_BASE;

/*
 * The Data representation in SDP PDUs (pps 339, 340 of BT SDP Spec)
 * These are the exact data type+size descriptor values
 * that go into the PDU buffer.
 *
 * The datatype (leading 5bits) + size descriptor (last 3 bits)
 * is 8 bits. The size descriptor is critical to extract the
 * right number of bytes for the data value from the PDU.
 *
 * For most basic types, the datatype+size descriptor is
 * straightforward. However for constructed types and strings,
 * the size of the data is in the next "n" bytes following the
 * 8 bits (datatype+size) descriptor. Exactly what the "n" is
 * specified in the 3 bits of the data size descriptor.
 *
 * TextString and URLString can be of size 2^{8, 16, 32} bytes
 * DataSequence and DataSequenceAlternates can be of size 2^{8, 16, 32}
 * The size are computed post-facto in the API and are not known apriori
 */
enum SDP_DATA_NIL = 0x00;
enum SDP_UINT8 = 0x08;
enum SDP_UINT16 = 0x09;
enum SDP_UINT32 = 0x0A;
enum SDP_UINT64 = 0x0B;
enum SDP_UINT128 = 0x0C;
enum SDP_INT8 = 0x10;
enum SDP_INT16 = 0x11;
enum SDP_INT32 = 0x12;
enum SDP_INT64 = 0x13;
enum SDP_INT128 = 0x14;
enum SDP_UUID_UNSPEC = 0x18;
enum SDP_UUID16 = 0x19;
enum SDP_UUID32 = 0x1A;
enum SDP_UUID128 = 0x1C;
enum SDP_TEXT_STR_UNSPEC = 0x20;
enum SDP_TEXT_STR8 = 0x25;
enum SDP_TEXT_STR16 = 0x26;
enum SDP_TEXT_STR32 = 0x27;
enum SDP_BOOL = 0x28;
enum SDP_SEQ_UNSPEC = 0x30;
enum SDP_SEQ8 = 0x35;
enum SDP_SEQ16 = 0x36;
enum SDP_SEQ32 = 0x37;
enum SDP_ALT_UNSPEC = 0x38;
enum SDP_ALT8 = 0x3D;
enum SDP_ALT16 = 0x3E;
enum SDP_ALT32 = 0x3F;
enum SDP_URL_STR_UNSPEC = 0x40;
enum SDP_URL_STR8 = 0x45;
enum SDP_URL_STR16 = 0x46;
enum SDP_URL_STR32 = 0x47;

/*
 * The PDU identifiers of SDP packets between client and server
 */
enum SDP_ERROR_RSP = 0x01;
enum SDP_SVC_SEARCH_REQ = 0x02;
enum SDP_SVC_SEARCH_RSP = 0x03;
enum SDP_SVC_ATTR_REQ = 0x04;
enum SDP_SVC_ATTR_RSP = 0x05;
enum SDP_SVC_SEARCH_ATTR_REQ = 0x06;
enum SDP_SVC_SEARCH_ATTR_RSP = 0x07;

/*
 * Some additions to support service registration.
 * These are outside the scope of the Bluetooth specification
 */
enum SDP_SVC_REGISTER_REQ = 0x75;
enum SDP_SVC_REGISTER_RSP = 0x76;
enum SDP_SVC_UPDATE_REQ = 0x77;
enum SDP_SVC_UPDATE_RSP = 0x78;
enum SDP_SVC_REMOVE_REQ = 0x79;
enum SDP_SVC_REMOVE_RSP = 0x80;

/*
 * SDP Error codes
 */
enum SDP_INVALID_VERSION = 0x0001;
enum SDP_INVALID_RECORD_HANDLE = 0x0002;
enum SDP_INVALID_SYNTAX = 0x0003;
enum SDP_INVALID_PDU_SIZE = 0x0004;
enum SDP_INVALID_CSTATE = 0x0005;

/*
 * SDP PDU
 */
struct sdp_pdu_hdr_t
{
    align (1):

    ubyte pdu_id;
    ushort tid;
    ushort plen;
}

/*
 * Common definitions for attributes in the SDP.
 * Should the type of any of these change, you need only make a change here.
 */

struct uuid_t
{
    ubyte type;

    union _Anonymous_0
    {
        ushort uuid16;
        uint uuid32;
        uint128_t uuid128;
    }

    _Anonymous_0 value;
}

extern (D) auto SDP_IS_UUID(T)(auto ref T x)
{
    return x == SDP_UUID16 || x == SDP_UUID32 || x == SDP_UUID128;
}

extern (D) auto SDP_IS_ALT(T)(auto ref T x)
{
    return x == SDP_ALT8 || x == SDP_ALT16 || x == SDP_ALT32;
}

extern (D) auto SDP_IS_SEQ(T)(auto ref T x)
{
    return x == SDP_SEQ8 || x == SDP_SEQ16 || x == SDP_SEQ32;
}

extern (D) auto SDP_IS_TEXT_STR(T)(auto ref T x)
{
    return x == SDP_TEXT_STR8 || x == SDP_TEXT_STR16 || x == SDP_TEXT_STR32;
}

alias sdp_list_t = _sdp_list;

struct _sdp_list
{
    sdp_list_t* next;
    void* data;
}

/*
 * User-visible strings can be in many languages
 * in addition to the universal language.
 *
 * Language meta-data includes language code in ISO639
 * followed by the encoding format. The third field in this
 * structure is the attribute offset for the language.
 * User-visible strings in the specified language can be
 * obtained at this offset.
 */
struct sdp_lang_attr_t
{
    ushort code_ISO639;
    ushort encoding;
    ushort base_offset;
}

/*
 * Profile descriptor is the Bluetooth profile metadata. If a
 * service conforms to a well-known profile, then its profile
 * identifier (UUID) is an attribute of the service. In addition,
 * if the profile has a version number it is specified here.
 */
struct sdp_profile_desc_t
{
    uuid_t uuid;
    ushort version_;
}

struct sdp_version_t
{
    ubyte major;
    ubyte minor;
}

struct sdp_buf_t
{
    ubyte* data;
    uint data_size;
    uint buf_size;
}

struct sdp_record_t
{
    uint handle;

    /* Search pattern: a sequence of all UUIDs seen in this record */
    sdp_list_t* pattern;
    sdp_list_t* attrlist;

    /* Main service class for Extended Inquiry Response */
    uuid_t svclass;
}

alias sdp_data_t = sdp_data_struct;

struct sdp_data_struct
{
    ubyte dtd;
    ushort attrId;

    union _Anonymous_1
    {
        byte int8;
        short int16;
        int int32;
        long int64;
        uint128_t int128;
        ubyte uint8;
        ushort uint16;
        uint uint32;
        ulong uint64;
        uint128_t uint128;
        uuid_t uuid;
        char* str;
        sdp_data_t* dataseq;
    }

    _Anonymous_1 val;
    sdp_data_t* next;
    int unitSize;
}

/* __SDP_H */
