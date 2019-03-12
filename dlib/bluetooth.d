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

import core.stdc.stdio;

extern (C):

enum AF_BLUETOOTH = 31;

enum BTPROTO_L2CAP = 0;
enum BTPROTO_HCI = 1;
enum BTPROTO_SCO = 2;
enum BTPROTO_RFCOMM = 3;
enum BTPROTO_BNEP = 4;
enum BTPROTO_CMTP = 5;
enum BTPROTO_HIDP = 6;
enum BTPROTO_AVDTP = 7;

enum SOL_HCI = 0;
enum SOL_L2CAP = 6;
enum SOL_SCO = 17;
enum SOL_RFCOMM = 18;

enum BT_SECURITY = 4;

struct bt_security
{
    ubyte level;
    ubyte key_size;
}

enum BT_SECURITY_SDP = 0;
enum BT_SECURITY_LOW = 1;
enum BT_SECURITY_MEDIUM = 2;
enum BT_SECURITY_HIGH = 3;
enum BT_SECURITY_FIPS = 4;

enum BT_DEFER_SETUP = 7;

enum BT_FLUSHABLE = 8;

enum BT_FLUSHABLE_OFF = 0;
enum BT_FLUSHABLE_ON = 1;

enum BT_POWER = 9;

struct bt_power
{
    ubyte force_active;
}

enum BT_POWER_FORCE_ACTIVE_OFF = 0;
enum BT_POWER_FORCE_ACTIVE_ON = 1;

enum BT_CHANNEL_POLICY = 10;

/* BR/EDR only (default policy)
 *   AMP controllers cannot be used.
 *   Channel move requests from the remote device are denied.
 *   If the L2CAP channel is currently using AMP, move the channel to BR/EDR.
 */
enum BT_CHANNEL_POLICY_BREDR_ONLY = 0;

/* BR/EDR Preferred
 *   Allow use of AMP controllers.
 *   If the L2CAP channel is currently on AMP, move it to BR/EDR.
 *   Channel move requests from the remote device are allowed.
 */
enum BT_CHANNEL_POLICY_BREDR_PREFERRED = 1;

/* AMP Preferred
 *   Allow use of AMP controllers
 *   If the L2CAP channel is currently on BR/EDR and AMP controller
 *     resources are available, initiate a channel move to AMP.
 *   Channel move requests from the remote device are allowed.
 *   If the L2CAP socket has not been connected yet, try to create
 *     and configure the channel directly on an AMP controller rather
 *     than BR/EDR.
 */
enum BT_CHANNEL_POLICY_AMP_PREFERRED = 2;

enum BT_VOICE = 11;

struct bt_voice
{
    ushort setting;
}

enum BT_SNDMTU = 12;
enum BT_RCVMTU = 13;

enum BT_VOICE_TRANSPARENT = 0x0003;
enum BT_VOICE_CVSD_16BIT = 0x0060;

/* Connection and socket states */
enum
{
    BT_CONNECTED = 1, /* Equal to TCP_ESTABLISHED to make net code happy */
    BT_OPEN = 2,
    BT_BOUND = 3,
    BT_LISTEN = 4,
    BT_CONNECT = 5,
    BT_CONNECT2 = 6,
    BT_CONFIG = 7,
    BT_DISCONN = 8,
    BT_CLOSED = 9
}

/* Byte order conversions */
extern (D) auto htobs(T)(auto ref T d)
{
    return d;
}

extern (D) auto htobl(T)(auto ref T d)
{
    return d;
}

extern (D) auto htobll(T)(auto ref T d)
{
    return d;
}

extern (D) auto btohs(T)(auto ref T d)
{
    return d;
}

extern (D) auto btohl(T)(auto ref T d)
{
    return d;
}

extern (D) auto btohll(T)(auto ref T d)
{
    return d;
}

/* Bluetooth unaligned access */

ulong bt_get_le64 (const(void)* ptr);

ulong bt_get_be64 (const(void)* ptr);

uint bt_get_le32 (const(void)* ptr);

uint bt_get_be32 (const(void)* ptr);

ushort bt_get_le16 (const(void)* ptr);

ushort bt_get_be16 (const(void)* ptr);

void bt_put_le64 (ulong val, const(void)* ptr);

void bt_put_be64 (ulong val, const(void)* ptr);

void bt_put_le32 (uint val, const(void)* ptr);

void bt_put_be32 (uint val, const(void)* ptr);

void bt_put_le16 (ushort val, const(void)* ptr);

void bt_put_be16 (ushort val, const(void)* ptr);

/* BD Address */
struct bdaddr_t
{
    align (1):

    ubyte[6] b;
}

/* BD Address type */
enum BDADDR_BREDR = 0x00;
enum BDADDR_LE_PUBLIC = 0x01;
enum BDADDR_LE_RANDOM = 0x02;

/* Copy, swap, convert BD Address */
int bacmp (const(bdaddr_t)* ba1, const(bdaddr_t)* ba2);
void bacpy (bdaddr_t* dst, const(bdaddr_t)* src);

void baswap (bdaddr_t* dst, const(bdaddr_t)* src);
bdaddr_t* strtoba (const(char)* str);
char* batostr (const(bdaddr_t)* ba);
int ba2str (const(bdaddr_t)* ba, char* str);
int str2ba (const(char)* str, bdaddr_t* ba);
int ba2oui (const(bdaddr_t)* ba, char* oui);
int bachk (const(char)* str);

int baprintf (const(char)* format, ...);
int bafprintf (FILE* stream, const(char)* format, ...);
int basprintf (char* str, const(char)* format, ...);
int basnprintf (char* str, size_t size, const(char)* format, ...);

void* bt_malloc (size_t size);
void bt_free (void* ptr);

int bt_error (ushort code);
const(char)* bt_compidtostr (int id);

struct uint128_t
{
    ubyte[16] data;
}

void bswap_128 (const(void)* src, void* dst);

ulong ntoh64 (ulong n);

void ntoh128 (const(uint128_t)* src, uint128_t* dst);

void btoh128 (const(uint128_t)* src, uint128_t* dst);

alias hton64 = ntoh64;
alias hton128 = ntoh128;
alias htob128 = btoh128;

/* __BLUETOOTH_H */
