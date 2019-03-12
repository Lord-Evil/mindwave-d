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

import core.stdc.config;
import bluetooth;
import hci;

extern (C):

struct hci_request
{
    ushort ogf;
    ushort ocf;
    int event;
    void* cparam;
    int clen;
    void* rparam;
    int rlen;
}

struct hci_version
{
    ushort manufacturer;
    ubyte hci_ver;
    ushort hci_rev;
    ubyte lmp_ver;
    ushort lmp_subver;
}

int hci_open_dev (int dev_id);
int hci_close_dev (int dd);
int hci_send_cmd (int dd, ushort ogf, ushort ocf, ubyte plen, void* param);
int hci_send_req (int dd, hci_request* req, int timeout);

int hci_create_connection (int dd, const(bdaddr_t)* bdaddr, ushort ptype, ushort clkoffset, ubyte rswitch, ushort* handle, int to);
int hci_disconnect (int dd, ushort handle, ubyte reason, int to);

int hci_inquiry (int dev_id, int len, int num_rsp, const(ubyte)* lap, inquiry_info** ii, c_long flags);
int hci_devinfo (int dev_id, hci_dev_info* di);
int hci_devba (int dev_id, bdaddr_t* bdaddr);
int hci_devid (const(char)* str);

int hci_read_local_name (int dd, int len, char* name, int to);
int hci_write_local_name (int dd, const(char)* name, int to);
int hci_read_remote_name (int dd, const(bdaddr_t)* bdaddr, int len, char* name, int to);
int hci_read_remote_name_with_clock_offset (int dd, const(bdaddr_t)* bdaddr, ubyte pscan_rep_mode, ushort clkoffset, int len, char* name, int to);
int hci_read_remote_name_cancel (int dd, const(bdaddr_t)* bdaddr, int to);
int hci_read_remote_version (int dd, ushort handle, hci_version* ver, int to);
int hci_read_remote_features (int dd, ushort handle, ubyte* features, int to);
int hci_read_remote_ext_features (int dd, ushort handle, ubyte page, ubyte* max_page, ubyte* features, int to);
int hci_read_clock_offset (int dd, ushort handle, ushort* clkoffset, int to);
int hci_read_local_version (int dd, hci_version* ver, int to);
int hci_read_local_commands (int dd, ubyte* commands, int to);
int hci_read_local_features (int dd, ubyte* features, int to);
int hci_read_local_ext_features (int dd, ubyte page, ubyte* max_page, ubyte* features, int to);
int hci_read_bd_addr (int dd, bdaddr_t* bdaddr, int to);
int hci_read_class_of_dev (int dd, ubyte* cls, int to);
int hci_write_class_of_dev (int dd, uint cls, int to);
int hci_read_voice_setting (int dd, ushort* vs, int to);
int hci_write_voice_setting (int dd, ushort vs, int to);
int hci_read_current_iac_lap (int dd, ubyte* num_iac, ubyte* lap, int to);
int hci_write_current_iac_lap (int dd, ubyte num_iac, ubyte* lap, int to);
int hci_read_stored_link_key (int dd, bdaddr_t* bdaddr, ubyte all, int to);
int hci_write_stored_link_key (int dd, bdaddr_t* bdaddr, ubyte* key, int to);
int hci_delete_stored_link_key (int dd, bdaddr_t* bdaddr, ubyte all, int to);
int hci_authenticate_link (int dd, ushort handle, int to);
int hci_encrypt_link (int dd, ushort handle, ubyte encrypt, int to);
int hci_change_link_key (int dd, ushort handle, int to);
int hci_switch_role (int dd, bdaddr_t* bdaddr, ubyte role, int to);
int hci_park_mode (int dd, ushort handle, ushort max_interval, ushort min_interval, int to);
int hci_exit_park_mode (int dd, ushort handle, int to);
int hci_read_inquiry_scan_type (int dd, ubyte* type, int to);
int hci_write_inquiry_scan_type (int dd, ubyte type, int to);
int hci_read_inquiry_mode (int dd, ubyte* mode, int to);
int hci_write_inquiry_mode (int dd, ubyte mode, int to);
int hci_read_afh_mode (int dd, ubyte* mode, int to);
int hci_write_afh_mode (int dd, ubyte mode, int to);
int hci_read_ext_inquiry_response (int dd, ubyte* fec, ubyte* data, int to);
int hci_write_ext_inquiry_response (int dd, ubyte fec, ubyte* data, int to);
int hci_read_simple_pairing_mode (int dd, ubyte* mode, int to);
int hci_write_simple_pairing_mode (int dd, ubyte mode, int to);
int hci_read_local_oob_data (int dd, ubyte* hash, ubyte* randomizer, int to);
int hci_read_inq_response_tx_power_level (int dd, byte* level, int to);
int hci_read_inquiry_transmit_power_level (int dd, byte* level, int to);
int hci_write_inquiry_transmit_power_level (int dd, byte level, int to);
int hci_read_transmit_power_level (int dd, ushort handle, ubyte type, byte* level, int to);
int hci_read_link_policy (int dd, ushort handle, ushort* policy, int to);
int hci_write_link_policy (int dd, ushort handle, ushort policy, int to);
int hci_read_link_supervision_timeout (int dd, ushort handle, ushort* timeout, int to);
int hci_write_link_supervision_timeout (int dd, ushort handle, ushort timeout, int to);
int hci_set_afh_classification (int dd, ubyte* map, int to);
int hci_read_link_quality (int dd, ushort handle, ubyte* link_quality, int to);
int hci_read_rssi (int dd, ushort handle, byte* rssi, int to);
int hci_read_afh_map (int dd, ushort handle, ubyte* mode, ubyte* map, int to);
int hci_read_clock (int dd, ushort handle, ubyte which, uint* clock, ushort* accuracy, int to);

int hci_le_set_scan_enable (int dev_id, ubyte enable, ubyte filter_dup, int to);
int hci_le_set_scan_parameters (
    int dev_id,
    ubyte type,
    ushort interval,
    ushort window,
    ubyte own_type,
    ubyte filter,
    int to);
int hci_le_set_advertise_enable (int dev_id, ubyte enable, int to);
int hci_le_create_conn (
    int dd,
    ushort interval,
    ushort window,
    ubyte initiator_filter,
    ubyte peer_bdaddr_type,
    bdaddr_t peer_bdaddr,
    ubyte own_bdaddr_type,
    ushort min_interval,
    ushort max_interval,
    ushort latency,
    ushort supervision_timeout,
    ushort min_ce_length,
    ushort max_ce_length,
    ushort* handle,
    int to);
int hci_le_conn_update (
    int dd,
    ushort handle,
    ushort min_interval,
    ushort max_interval,
    ushort latency,
    ushort supervision_timeout,
    int to);
int hci_le_add_white_list (int dd, const(bdaddr_t)* bdaddr, ubyte type, int to);
int hci_le_rm_white_list (int dd, const(bdaddr_t)* bdaddr, ubyte type, int to);
int hci_le_read_white_list_size (int dd, ubyte* size, int to);
int hci_le_clear_white_list (int dd, int to);
int hci_le_add_resolving_list (
    int dd,
    const(bdaddr_t)* bdaddr,
    ubyte type,
    ubyte* peer_irk,
    ubyte* local_irk,
    int to);
int hci_le_rm_resolving_list (int dd, const(bdaddr_t)* bdaddr, ubyte type, int to);
int hci_le_clear_resolving_list (int dd, int to);
int hci_le_read_resolving_list_size (int dd, ubyte* size, int to);
int hci_le_set_address_resolution_enable (int dev_id, ubyte enable, int to);
int hci_le_read_remote_features (int dd, ushort handle, ubyte* features, int to);

int hci_for_each_dev (int flag, int function (int dd, int dev_id, c_long arg) func, c_long arg);
int hci_get_route (bdaddr_t* bdaddr);

char* hci_bustostr (int bus);
char* hci_typetostr (int type);
char* hci_dtypetostr (int type);
char* hci_dflagstostr (uint flags);
char* hci_ptypetostr (uint ptype);
int hci_strtoptype (char* str, uint* val);
char* hci_scoptypetostr (uint ptype);
int hci_strtoscoptype (char* str, uint* val);
char* hci_lptostr (uint ptype);
int hci_strtolp (char* str, uint* val);
char* hci_lmtostr (uint ptype);
int hci_strtolm (char* str, uint* val);

char* hci_cmdtostr (uint cmd);
char* hci_commandstostr (ubyte* commands, char* pref, int width);

char* hci_vertostr (uint ver);
int hci_strtover (char* str, uint* ver);
char* lmp_vertostr (uint ver);
int lmp_strtover (char* str, uint* ver);
char* pal_vertostr (uint ver);
int pal_strtover (char* str, uint* ver);

char* lmp_featurestostr (ubyte* features, char* pref, int width);

void hci_set_bit (int nr, void* addr);

void hci_clear_bit (int nr, void* addr);

int hci_test_bit (int nr, void* addr);

/* HCI filter tools */
void hci_filter_clear (hci_filter* f);
void hci_filter_set_ptype (int t, hci_filter* f);
void hci_filter_clear_ptype (int t, hci_filter* f);
int hci_filter_test_ptype (int t, hci_filter* f);
void hci_filter_all_ptypes (hci_filter* f);
void hci_filter_set_event (int e, hci_filter* f);
void hci_filter_clear_event (int e, hci_filter* f);
int hci_filter_test_event (int e, hci_filter* f);
void hci_filter_all_events (hci_filter* f);
void hci_filter_set_opcode (int opcode, hci_filter* f);
void hci_filter_clear_opcode (hci_filter* f);
int hci_filter_test_opcode (int opcode, hci_filter* f);

/* __HCI_LIB_H */
