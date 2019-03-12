/*
 *
 *  BlueZ - Bluetooth protocol stack for Linux
 *
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
import bluetooth;


extern (C):

/* CMTP defaults */
enum CMTP_MINIMUM_MTU = 152;
enum CMTP_DEFAULT_MTU = 672;

/* CMTP ioctl defines */
enum CMTPCONNADD = _IOW('C', 200, int);
enum CMTPCONNDEL = _IOW('C', 201, int);
enum CMTPGETCONNLIST = _IOR('C', 210, int);
enum CMTPGETCONNINFO = _IOR('C', 211, int);

enum CMTP_LOOPBACK = 0;

struct cmtp_connadd_req
{
    int sock; /* Connected socket */
    uint flags;
}

struct cmtp_conndel_req
{
    bdaddr_t bdaddr;
    uint flags;
}

struct cmtp_conninfo
{
    bdaddr_t bdaddr;
    uint flags;
    ushort state;
    int num;
}

struct cmtp_connlist_req
{
    uint cnum;
    cmtp_conninfo* ci;
}

/* __CMTP_H */
