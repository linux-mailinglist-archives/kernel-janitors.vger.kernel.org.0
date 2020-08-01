Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 323422354A4
	for <lists+kernel-janitors@lfdr.de>; Sun,  2 Aug 2020 01:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbgHAXjc (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 1 Aug 2020 19:39:32 -0400
Received: from connotech.com ([76.10.176.241]:57546 "EHLO mail.connotech.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725883AbgHAXjb (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 1 Aug 2020 19:39:31 -0400
X-Greylist: delayed 519 seconds by postgrey-1.27 at vger.kernel.org; Sat, 01 Aug 2020 19:39:31 EDT
Received: from [192.168.1.27] (unknown [192.168.1.27])
        by mail.connotech.com (Postfix) with ESMTPA id 906A7196E67
        for <kernel-janitors@vger.kernel.org>; Sat,  1 Aug 2020 23:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=connotech.com; s=key3;
        t=1596324651; bh=0ujfx4BMgX0nqGAhmR8pRtvZ5UMDASUzcqo2cVzEqqA=;
        h=To:From:Subject:Date;
        b=oPgw8yPRfpg0CKOSFOooDviWG3hLES9TBPrE/w4WTYWqYf/e7SSe+KTK0GnRPtiDo
         Q/xqgL9glhtt2IoJp4XPDRwbLh6do10dzkuEs9HR9lCYYpPNAV1z/QdYYReFEVobj3
         z5OE7GYVl6jFVeib2eoPLcUYVtPHmFjlDcSFckh8=
To:     kernel-janitors@vger.kernel.org
From:   Thierry Moreau <thierry.moreau@connotech.com>
Subject: gma500: monitor-dependent failure to boot FB console (psbdrmfb)
Message-ID: <361913a2-faed-fee8-45c3-90f8b3cf4a87@connotech.com>
Date:   Sat, 1 Aug 2020 23:31:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

[either a call for help or troubleshooting information useful to fix an
outstanding issue in the GMA500 DRIVER?]

This GMA3650-GPU-based system with a self-supported Linux distribution 
boots OK in all cases (ssh access fine when no console).

With the HAI monitor (actually a 7 inches monitor marketed for the 
cinema industry, the edid information reporting a wrong display size), 
the frame buffer console is fine, i.e. from the boot log:

[    1.506269] fbcon: psbdrmfb (fb0) is primary device

Accordingly, there are two entries in the /sys/class/vtconsole/ 
directory,names "(S) dummy device" and "(M) frame buffer device".

With two ASUS monitors, the above line in the boot log never appears. 
And theconsole turns blank early in the boot process. A single entry 
appears in /sys/class/vtconsole/, i.e. vtcon0/name -> "(S) VGA+".

In either case Xorg starts fine and switching between ctrl-alt-f7 and
ctrl-alt-f1..6 (either console for HAI or blank for ASUS) works fine.

Looking in the kernel source tree, 'psbdrmfb' is a frame buffer name 
appearing once in the GMA500 GPU source code.

This what I found in my patient troubleshooting.

See below:

- two boot log excerpts (grep'ing gcc\|drm\|gma5\|console\|fbcon\|D2550 
-C 2) for
the 'pass' and 'fail' boot sequences; and

- three edid reports for the (pass) HAI monitor and two (fail) ASUS 
monitors.

Maybe this post should be sent to another mailing list.

Thanks in advance, and best regards to kernel enthusiasts!

- Thierry Moreau

============================ boot sequence, 'pass'
pass:[    0.000000] Linux version 4.19.48 (root@dodeca1er) (gcc version 
8.4.0 (CRUX-x86_64-multilib)) #5 SMP Fri Jul 31 03:17:03 UTC 2020
pass-[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-05 
root=/dev/sda1 ro
pass-[    0.000000] Disabled fast string operations
--
pass-[    0.582174] spurious 8259A interrupt: IRQ7.
pass-[    0.584782] Console: colour VGA+ 80x25
pass:[    0.595503] console [tty0] enabled
pass-[    0.595635] ACPI: Core revision 20180810
pass-[    0.596080] clocksource: hpet: mask: 0xffffffff max_cycles: 
0xffffffff, max_idle_ns: 133484882848 ns
--
pass-[    0.858339] sched_clock: Marking stable (843780572, 
14317326)->(964648975, -106551077)
pass-[    0.858737] Loading compiled-in X.509 certificates
pass:[    0.859638] gma500 0000:00:02.0: GPU: power management timed out.
pass-[    0.880497] ACPI: Video Device [GFX0] (multi-head: yes  rom: no 
post: no)
pass-[    0.881183] acpi device:27: registered as cooling_device5
pass-[    0.881423] input: Video Bus as 
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input3
pass:[    0.881699] [drm] Supports vblank timestamp caching Rev 2 
(21.10.2013).
pass:[    0.881817] [drm] No driver support for vblank timestamp query.
pass-[    0.885525] hdaudio hdaudioC0D0: Unable to bind the codec
pass-[    0.889340] snd_hda_codec_hdmi hdaudioC0D1: HDMI: Unknown ELD 
version 1
--
pass-[    1.361611]  sda: sda1 sda2 sda3 sda4 sda5 sda6 sda7 sda8 sda9 
sda10 sda11
pass-[    1.362977] sd 0:0:0:0: [sda] Attached SCSI disk
pass:[    1.506269] fbcon: psbdrmfb (fb0) is primary device
pass-[    1.599775] ata2: SATA link down (SStatus 0 SControl 300)
pass-[    1.640569] snd_hda_codec_hdmi hdaudioC0D1: HDMI: Unknown ELD 
version 1
--
pass-[    2.279237] snd_hda_codec_hdmi hdaudioC0D1: HDMI: Unknown ELD 
version 1
pass-[    2.342558] Console: switching to colour frame buffer device 128x45
pass:[    2.352243] gma500 0000:00:02.0: fb0: psbdrmfb frame buffer device
pass:[    2.352451] [drm] Initialized gma500 1.0.0 20140314 for 
0000:00:02.0 on minor 0
pass:[    2.352666] console [netcon0] enabled
pass:[    2.352730] netconsole: network logging started
pass-[    2.354784] cfg80211: Loading compiled-in X.509 certificates for 
regulatory database
pass-[    2.357110] kworker/u8:3 (98) used greatest stack depth: 14760 
bytes left
============================ boot sequence, 'fail'
fail:[    0.000000] Linux version 4.19.48 (root@dodeca1er) (gcc version 
8.4.0 (CRUX-x86_64-multilib)) #5 SMP Fri Jul 31 03:17:03 UTC 2020
fail-[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-05 
root=/dev/sda1 ro
fail-[    0.000000] Disabled fast string operations
--
fail-[    0.581688] spurious 8259A interrupt: IRQ7.
fail-[    0.584292] Console: colour VGA+ 80x25
fail:[    0.595033] console [tty0] enabled
fail-[    0.595165] ACPI: Core revision 20180810
fail-[    0.595608] clocksource: hpet: mask: 0xffffffff max_cycles: 
0xffffffff, max_idle_ns: 133484882848 ns
--
fail-[    0.857783] sched_clock: Marking stable (843222107, 
14331799)->(964122675, -106568769)
fail-[    0.858180] Loading compiled-in X.509 certificates
fail:[    0.859077] gma500 0000:00:02.0: GPU: power management timed out.
fail-[    0.879977] ACPI: Video Device [GFX0] (multi-head: yes  rom: no 
post: no)
fail-[    0.880671] acpi device:27: registered as cooling_device5
fail-[    0.880917] input: Video Bus as 
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input3
fail:[    0.881204] [drm] Supports vblank timestamp caching Rev 2 
(21.10.2013).
fail:[    0.881322] [drm] No driver support for vblank timestamp query.
fail-[    0.885009] hdaudio hdaudioC0D0: Unable to bind the codec
fail-[    0.888879] snd_hda_codec_hdmi hdaudioC0D1: HDMI: Unknown ELD 
version 1
--
fail-[    1.361075]  sda: sda1 sda2 sda3 sda4 sda5 sda6 sda7 sda8 sda9 
sda10 sda11
fail-[    1.362448] sd 0:0:0:0: [sda] Attached SCSI disk
fail:[    1.504605] [drm] Initialized gma500 1.0.0 20140314 for 
0000:00:02.0 on minor 0
fail:[    1.504958] console [netcon0] enabled
fail:[    1.505074] netconsole: network logging started
fail-[    1.505320] cfg80211: Loading compiled-in X.509 certificates for 
regulatory database
fail-[    1.505626] kworker/u8:4 (97) used greatest stack depth: 14760 
bytes left
============================ edid report, 'pass' monitor (HAI)
edid-decode (hex):

00 ff ff ff ff ff ff 00 20 29 54 4c 01 00 00 00
01 19 01 03 81 46 27 78 8a a5 8e a6 54 4a 9c 26
12 45 46 ad ce 00 81 40 01 01 01 01 01 01 01 01
01 01 01 01 01 01 01 1d 00 72 51 d0 1e 20 6e 28
55 00 b9 88 21 00 00 1e 9a 29 a0 d0 51 84 22 30
50 98 36 00 b9 88 21 00 00 1c 00 00 00 fd 00 32
4b 18 3c 0b 00 0a 20 20 20 20 20 20 00 00 00 fc
00 37 35 39 0a 20 20 20 20 20 20 20 20 20 01 2f

02 03 21 71 4e 06 07 02 03 15 96 11 12 13 04 14
05 1f 90 23 09 07 07 83 01 00 00 65 03 0c 00 10
00 8c 0a d0 90 20 40 31 20 0c 40 55 00 b9 88 21
00 00 18 01 1d 80 18 71 1c 16 20 58 2c 25 00 b9
88 21 00 00 9e 01 1d 80 d0 72 1c 16 20 10 2c 25
80 b9 88 21 00 00 9e 01 1d 00 bc 52 d0 1e 20 b8
28 55 40 b9 88 21 00 00 1e 02 3a 80 d0 72 38 2d
40 10 2c 45 80 b9 88 21 00 00 1e 00 00 00 00 d0

----------------

Block 0, Base EDID:
   EDID Structure Version & Revision: 1.3
   Vendor & Product Identification:
     Manufacturer: HAI
     Model: 19540
     Serial Number: 1
     Made in: week 1 of 2015
   Basic Display Parameters & Features:
     Digital display
     DFP 1.x compatible TMDS
     Maximum image size: 70 cm x 39 cm
     Gamma: 2.20
     DPMS levels: Standby
     RGB color display
     First detailed timing is the preferred timing
   Color Characteristics:
     Red  : 0.6503, 0.3300
     Green: 0.2900, 0.6103
     Blue : 0.1503, 0.0703
     White: 0.2724, 0.2753
   Established Timings I & II:
     IBM     :   720x400    70.082 Hz   9:5    31.467 kHz  28.320 MHz
     DMT 0x04:   640x480    59.940 Hz   4:3    31.469 kHz  25.175 MHz
     DMT 0x05:   640x480    72.809 Hz   4:3    37.861 kHz  31.500 MHz
     DMT 0x06:   640x480    75.000 Hz   4:3    37.500 kHz  31.500 MHz
     DMT 0x09:   800x600    60.317 Hz   4:3    37.879 kHz  40.000 MHz
     DMT 0x0a:   800x600    72.188 Hz   4:3    48.077 kHz  50.000 MHz
     DMT 0x0b:   800x600    75.000 Hz   4:3    46.875 kHz  49.500 MHz
     DMT 0x10:  1024x768    60.004 Hz   4:3    48.363 kHz  65.000 MHz
     DMT 0x11:  1024x768    70.069 Hz   4:3    56.476 kHz  75.000 MHz
     DMT 0x12:  1024x768    75.029 Hz   4:3    60.023 kHz  78.750 MHz
   Standard Timings:
     DMT 0x20:  1280x960    60.000 Hz   4:3    60.000 kHz 108.000 MHz
   Detailed Timing Descriptors:
     DTD 1:  1280x720    60.000 Hz  16:9    45.000 kHz  74.250 MHz (697 
mm x 392 mm)
                  Hfront  110 Hsync  40 Hback 220 Hpol P
                  Vfront    5 Vsync   5 Vback  20 Vpol P
     DTD 2:  1440x900    59.887 Hz   8:5    55.935 kHz 106.500 MHz (697 
mm x 392 mm)
                  Hfront   80 Hsync 152 Hback 232 Hpol N
                  Vfront    3 Vsync   6 Vback  25 Vpol P
   Display Range Limits:
     Monitor ranges (GTF): 50-75 Hz V, 24-60 kHz H, max dotclock 110 MHz
     Display Product Name: '759'
   Extension blocks: 1
Checksum: 0x2f

----------------

Block 1, CTA-861 Extension Block:
   Revision: 3
   Basic audio support
   Supports YCbCr 4:4:4
   Supports YCbCr 4:2:2
   Native detailed modes: 1
   Video Data Block:
     VIC   6:  1440x480i   59.940 Hz   4:3    15.734 kHz  27.000 MHz
     VIC   7:  1440x480i   59.940 Hz  16:9    15.734 kHz  27.000 MHz
     VIC   2:   720x480    59.940 Hz   4:3    31.469 kHz  27.000 MHz
     VIC   3:   720x480    59.940 Hz  16:9    31.469 kHz  27.000 MHz
     VIC  21:  1440x576i   50.000 Hz   4:3    15.625 kHz  27.000 MHz
     VIC  22:  1440x576i   50.000 Hz  16:9    15.625 kHz  27.000 MHz 
(native)
     VIC  17:   720x576    50.000 Hz   4:3    31.250 kHz  27.000 MHz
     VIC  18:   720x576    50.000 Hz  16:9    31.250 kHz  27.000 MHz
     VIC  19:  1280x720    50.000 Hz  16:9    37.500 kHz  74.250 MHz
     VIC   4:  1280x720    60.000 Hz  16:9    45.000 kHz  74.250 MHz
     VIC  20:  1920x1080i  50.000 Hz  16:9    28.125 kHz  74.250 MHz
     VIC   5:  1920x1080i  60.000 Hz  16:9    33.750 kHz  74.250 MHz
     VIC  31:  1920x1080   50.000 Hz  16:9    56.250 kHz 148.500 MHz
     VIC  16:  1920x1080   60.000 Hz  16:9    67.500 kHz 148.500 MHz 
(native)
   Audio Data Block:
     Linear PCM:
       Max channels: 2
       Supported sample rates (kHz): 48 44.1 32
       Supported sample sizes (bits): 24 20 16
   Speaker Allocation Data Block:
     FL/FR - Front Left/Right
   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
     Source physical address: 1.0.0.0
   Detailed Timing Descriptors:
     DTD 3:   720x576    50.000 Hz   5:4    31.250 kHz  27.000 MHz (697 
mm x 392 mm)
                  Hfront   12 Hsync  64 Hback  68 Hpol N
                  Vfront    5 Vsync   5 Vback  39 Vpol N
     DTD 4:  1920x1080i  60.000 Hz  16:9    33.750 kHz  74.250 MHz (697 
mm x 392 mm)
                  Hfront   88 Hsync  44 Hback 148 Hpol P
                  Vfront    2 Vsync   5 Vback  15 Vpol P Vfront +0.5 Odd 
Field
                  Vfront    2 Vsync   5 Vback  15 Vpol P Vback  +0.5 
Even Field
     DTD 5:  1920x1080i  50.000 Hz  16:9    28.125 kHz  74.250 MHz (697 
mm x 392 mm)
                  Hfront  528 Hsync  44 Hback 148 Hpol P
                  Vfront    2 Vsync   5 Vback  15 Vpol P Vfront +0.5 Odd 
Field
                  Vfront    2 Vsync   5 Vback  15 Vpol P Vback  +0.5 
Even Field
     DTD 6:  1280x720    50.000 Hz  16:9    37.500 kHz  74.250 MHz (697 
mm x 392 mm)
                  Hfront  440 Hsync  40 Hback 220 Hpol P
                  Vfront    5 Vsync   5 Vback  20 Vpol P
     DTD 7:  1920x1080   50.000 Hz  16:9    56.250 kHz 148.500 MHz (697 
mm x 392 mm)
                  Hfront  528 Hsync  44 Hback 148 Hpol P
                  Vfront    4 Vsync   5 Vback  36 Vpol P
Checksum: 0xd0

----------------

edid-decode SHA: 56dd103a0c20724ee956950f5bcb8cc1c8667af9

Warnings:

Block 1, CTA-861 Extension Block:
   Missing VCDB, needed for Set Selectable RGB Quantization to avoid 
interop issues.

Failures:

EDID:
   Base EDID: Some timings are out of range of the Monitor Ranges:
     Horizontal Freq: 15.625 - 67.500 kHz (Monitor: 24.000 - 60.000 kHz)
     Maximum Clock: 148.500 MHz (Monitor: 110.000 MHz)
   CTA-861: Native progressive timings are a mix of several resolutions.

EDID conformity: FAIL
============================ edid report, 'fail' monitor 1/2 (ASUS VE248)
edid-decode (hex):

00 ff ff ff ff ff ff 00 04 69 94 24 01 01 01 01
13 1e 01 03 80 35 1e 78 ea 92 65 a6 55 55 9f 28
0d 50 54 bf ef 00 71 4f 81 80 81 40 95 00 a9 40
b3 00 d1 c0 01 01 02 3a 80 18 71 38 2d 40 58 2c
45 00 13 2b 21 00 00 1e 00 00 00 fd 00 32 4c 1e
53 11 00 0a 20 20 20 20 20 20 00 00 00 fc 00 56
45 32 34 38 0a 20 20 20 20 20 20 20 00 00 00 ff
00 4c 35 4c 4d 51 53 30 34 36 38 31 36 0a 01 a9

02 03 1e f1 4b 90 05 04 03 02 01 11 12 13 14 1f
23 09 07 07 83 01 00 00 65 03 0c 00 10 00 1a 36
80 a0 70 38 1e 40 30 20 35 00 13 2b 21 00 00 1a
66 21 56 aa 51 00 1e 30 46 8f 33 00 13 2b 21 00
00 1e 01 1d 00 72 51 d0 1e 20 6e 28 55 00 13 2b
21 00 00 1e 8c 0a d0 8a 20 e0 2d 10 10 3e 96 00
13 2b 21 00 00 18 01 1d 80 18 71 1c 16 20 58 2c
25 00 13 2b 21 00 00 9f 00 00 00 00 00 00 00 39

----------------

Block 0, Base EDID:
   EDID Structure Version & Revision: 1.3
   Vendor & Product Identification:
     Manufacturer: ACI
     Model: 9364
     Serial Number: 16843009
     Made in: week 19 of 2020
   Basic Display Parameters & Features:
     Digital display
     Maximum image size: 53 cm x 30 cm
     Gamma: 2.20
     DPMS levels: Standby Suspend Off
     RGB color display
     First detailed timing is the preferred timing
   Color Characteristics:
     Red  : 0.6503, 0.3330
     Green: 0.3320, 0.6230
     Blue : 0.1572, 0.0527
     White: 0.3134, 0.3291
   Established Timings I & II:
     IBM     :   720x400    70.082 Hz   9:5    31.467 kHz  28.320 MHz
     DMT 0x04:   640x480    59.940 Hz   4:3    31.469 kHz  25.175 MHz
     Apple   :   640x480    66.667 Hz   4:3    35.000 kHz  30.240 MHz
     DMT 0x05:   640x480    72.809 Hz   4:3    37.861 kHz  31.500 MHz
     DMT 0x06:   640x480    75.000 Hz   4:3    37.500 kHz  31.500 MHz
     DMT 0x08:   800x600    56.250 Hz   4:3    35.156 kHz  36.000 MHz
     DMT 0x09:   800x600    60.317 Hz   4:3    37.879 kHz  40.000 MHz
     DMT 0x0a:   800x600    72.188 Hz   4:3    48.077 kHz  50.000 MHz
     DMT 0x0b:   800x600    75.000 Hz   4:3    46.875 kHz  49.500 MHz
     Apple   :   832x624    74.551 Hz   4:3    49.726 kHz  57.284 MHz
     DMT 0x10:  1024x768    60.004 Hz   4:3    48.363 kHz  65.000 MHz
     DMT 0x11:  1024x768    70.069 Hz   4:3    56.476 kHz  75.000 MHz
     DMT 0x12:  1024x768    75.029 Hz   4:3    60.023 kHz  78.750 MHz
     DMT 0x24:  1280x1024   75.025 Hz   5:4    79.976 kHz 135.000 MHz
   Standard Timings:
     DMT 0x15:  1152x864    75.000 Hz   4:3    67.500 kHz 108.000 MHz
     DMT 0x23:  1280x1024   60.020 Hz   5:4    63.981 kHz 108.000 MHz
     DMT 0x20:  1280x960    60.000 Hz   4:3    60.000 kHz 108.000 MHz
     DMT 0x2f:  1440x900    59.887 Hz  16:10   55.935 kHz 106.500 MHz
     DMT 0x33:  1600x1200   60.000 Hz   4:3    75.000 kHz 162.000 MHz
     DMT 0x3a:  1680x1050   59.954 Hz  16:10   65.290 kHz 146.250 MHz
     DMT 0x52:  1920x1080   60.000 Hz  16:9    67.500 kHz 148.500 MHz
   Detailed Timing Descriptors:
     DTD 1:  1920x1080   60.000 Hz  16:9    67.500 kHz 148.500 MHz (531 
mm x 299 mm)
                  Hfront   88 Hsync  44 Hback 148 Hpol P
                  Vfront    4 Vsync   5 Vback  36 Vpol P
   Display Range Limits:
     Monitor ranges (GTF): 50-76 Hz V, 30-83 kHz H, max dotclock 170 MHz
     Display Product Name: 'VE248'
     Display Product Serial Number: 'L5LMQS046816'
   Extension blocks: 1
Checksum: 0xa9

----------------

Block 1, CTA-861 Extension Block:
   Revision: 3
   Underscans PC formats by default
   Basic audio support
   Supports YCbCr 4:4:4
   Supports YCbCr 4:2:2
   Native detailed modes: 1
   Video Data Block:
     VIC  16:  1920x1080   60.000 Hz  16:9    67.500 kHz 148.500 MHz 
(native)
     VIC   5:  1920x1080i  60.000 Hz  16:9    33.750 kHz  74.250 MHz
     VIC   4:  1280x720    60.000 Hz  16:9    45.000 kHz  74.250 MHz
     VIC   3:   720x480    59.940 Hz  16:9    31.469 kHz  27.000 MHz
     VIC   2:   720x480    59.940 Hz   4:3    31.469 kHz  27.000 MHz
     VIC   1:   640x480    59.940 Hz   4:3    31.469 kHz  25.175 MHz
     VIC  17:   720x576    50.000 Hz   4:3    31.250 kHz  27.000 MHz
     VIC  18:   720x576    50.000 Hz  16:9    31.250 kHz  27.000 MHz
     VIC  19:  1280x720    50.000 Hz  16:9    37.500 kHz  74.250 MHz
     VIC  20:  1920x1080i  50.000 Hz  16:9    28.125 kHz  74.250 MHz
     VIC  31:  1920x1080   50.000 Hz  16:9    56.250 kHz 148.500 MHz
   Audio Data Block:
     Linear PCM:
       Max channels: 2
       Supported sample rates (kHz): 48 44.1 32
       Supported sample sizes (bits): 24 20 16
   Speaker Allocation Data Block:
     FL/FR - Front Left/Right
   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
     Source physical address: 1.0.0.0
   Detailed Timing Descriptors:
     DTD 2:  1920x1080   59.988 Hz  16:9    66.587 kHz 138.500 MHz (531 
mm x 299 mm)
                  Hfront   48 Hsync  32 Hback  80 Hpol P
                  Vfront    3 Vsync   5 Vback  22 Vpol N
     DTD 3:  1366x768    59.790 Hz 683:384  47.712 kHz  85.500 MHz (531 
mm x 299 mm)
                  Hfront   70 Hsync 143 Hback 213 Hpol P
                  Vfront    3 Vsync   3 Vback  24 Vpol P
     DTD 4:  1280x720    60.000 Hz  16:9    45.000 kHz  74.250 MHz (531 
mm x 299 mm)
                  Hfront  110 Hsync  40 Hback 220 Hpol P
                  Vfront    5 Vsync   5 Vback  20 Vpol P
     DTD 5:   720x480    59.940 Hz   3:2    31.469 kHz  27.000 MHz (531 
mm x 299 mm)
                  Hfront   16 Hsync  62 Hback  60 Hpol N
                  Vfront    9 Vsync   6 Vback  30 Vpol N
     DTD 6:  1920x1080i  60.000 Hz  16:9    33.750 kHz  74.250 MHz (531 
mm x 299 mm)
                  Hfront   88 Hsync  44 Hback 148 Hpol P
                  Vfront    2 Vsync   5 Vback  15 Vpol P Vfront +0.5 Odd 
Field
                  Vfront    2 Vsync   5 Vback  15 Vpol P Vback  +0.5 
Even Field
Checksum: 0x39

----------------

edid-decode SHA: 56dd103a0c20724ee956950f5bcb8cc1c8667af9

Warnings:

Block 1, CTA-861 Extension Block:
   Display Product Serial Number is set, so the Serial Number in the 
Base EDID should be 0.
   Missing VCDB, needed for Set Selectable RGB Quantization to avoid 
interop issues.
EDID:
   CTA-861: Multiple native progressive timings are defined.

Failures:

EDID:
   Base EDID: Some timings are out of range of the Monitor Ranges:
     Horizontal Freq: 28.125 - 79.976 kHz (Monitor: 30.000 - 83.000 kHz)

EDID conformity: FAIL
============================ edid report, 'fail' monitor 2/2 (ASUS VE228)
edid-decode (hex):

00 ff ff ff ff ff ff 00 04 69 fa 22 01 01 01 01
1a 1c 01 03 80 30 1b 78 ea 3d 25 a3 59 51 a0 25
0f 50 54 bf ef 00 71 4f 81 80 81 40 95 00 a9 40
b3 00 d1 c0 01 01 02 3a 80 18 71 38 2d 40 58 2c
45 00 dd 0c 11 00 00 1e 00 00 00 fd 00 32 4c 1e
53 11 00 0a 20 20 20 20 20 20 00 00 00 fc 00 56
45 32 32 38 0a 20 20 20 20 20 20 20 00 00 00 ff
00 4a 36 4c 4d 51 53 31 30 38 34 30 31 0a 01 53

02 03 1e f1 4b 90 05 04 03 02 01 11 12 13 14 1f
23 09 07 07 83 01 00 00 65 03 0c 00 10 00 1a 36
80 a0 70 38 1e 40 30 20 35 00 dd 0c 11 00 00 1a
66 21 56 aa 51 00 1e 30 46 8f 33 00 dd 0c 11 00
00 1e 01 1d 00 72 51 d0 1e 20 6e 28 55 00 dd 0c
11 00 00 1e 8c 0a d0 8a 20 e0 2d 10 10 3e 96 00
dd 0c 11 00 00 18 01 1d 80 18 71 1c 16 20 58 2c
25 00 dd 0c 11 00 00 9f 00 00 00 00 00 00 00 32

----------------

Block 0, Base EDID:
   EDID Structure Version & Revision: 1.3
   Vendor & Product Identification:
     Manufacturer: ACI
     Model: 8954
     Serial Number: 16843009
     Made in: week 26 of 2018
   Basic Display Parameters & Features:
     Digital display
     Maximum image size: 48 cm x 27 cm
     Gamma: 2.20
     DPMS levels: Standby Suspend Off
     RGB color display
     First detailed timing is the preferred timing
   Color Characteristics:
     Red  : 0.6367, 0.3505
     Green: 0.3193, 0.6259
     Blue : 0.1445, 0.0605
     White: 0.3134, 0.3291
   Established Timings I & II:
     IBM     :   720x400    70.082 Hz   9:5    31.467 kHz  28.320 MHz
     DMT 0x04:   640x480    59.940 Hz   4:3    31.469 kHz  25.175 MHz
     Apple   :   640x480    66.667 Hz   4:3    35.000 kHz  30.240 MHz
     DMT 0x05:   640x480    72.809 Hz   4:3    37.861 kHz  31.500 MHz
     DMT 0x06:   640x480    75.000 Hz   4:3    37.500 kHz  31.500 MHz
     DMT 0x08:   800x600    56.250 Hz   4:3    35.156 kHz  36.000 MHz
     DMT 0x09:   800x600    60.317 Hz   4:3    37.879 kHz  40.000 MHz
     DMT 0x0a:   800x600    72.188 Hz   4:3    48.077 kHz  50.000 MHz
     DMT 0x0b:   800x600    75.000 Hz   4:3    46.875 kHz  49.500 MHz
     Apple   :   832x624    74.551 Hz   4:3    49.726 kHz  57.284 MHz
     DMT 0x10:  1024x768    60.004 Hz   4:3    48.363 kHz  65.000 MHz
     DMT 0x11:  1024x768    70.069 Hz   4:3    56.476 kHz  75.000 MHz
     DMT 0x12:  1024x768    75.029 Hz   4:3    60.023 kHz  78.750 MHz
     DMT 0x24:  1280x1024   75.025 Hz   5:4    79.976 kHz 135.000 MHz
   Standard Timings:
     DMT 0x15:  1152x864    75.000 Hz   4:3    67.500 kHz 108.000 MHz
     DMT 0x23:  1280x1024   60.020 Hz   5:4    63.981 kHz 108.000 MHz
     DMT 0x20:  1280x960    60.000 Hz   4:3    60.000 kHz 108.000 MHz
     DMT 0x2f:  1440x900    59.887 Hz  16:10   55.935 kHz 106.500 MHz
     DMT 0x33:  1600x1200   60.000 Hz   4:3    75.000 kHz 162.000 MHz
     DMT 0x3a:  1680x1050   59.954 Hz  16:10   65.290 kHz 146.250 MHz
     DMT 0x52:  1920x1080   60.000 Hz  16:9    67.500 kHz 148.500 MHz
   Detailed Timing Descriptors:
     DTD 1:  1920x1080   60.000 Hz  16:9    67.500 kHz 148.500 MHz (477 
mm x 268 mm)
                  Hfront   88 Hsync  44 Hback 148 Hpol P
                  Vfront    4 Vsync   5 Vback  36 Vpol P
   Display Range Limits:
     Monitor ranges (GTF): 50-76 Hz V, 30-83 kHz H, max dotclock 170 MHz
     Display Product Name: 'VE228'
     Display Product Serial Number: 'J6LMQS108401'
   Extension blocks: 1
Checksum: 0x53

----------------

Block 1, CTA-861 Extension Block:
   Revision: 3
   Underscans PC formats by default
   Basic audio support
   Supports YCbCr 4:4:4
   Supports YCbCr 4:2:2
   Native detailed modes: 1
   Video Data Block:
     VIC  16:  1920x1080   60.000 Hz  16:9    67.500 kHz 148.500 MHz 
(native)
     VIC   5:  1920x1080i  60.000 Hz  16:9    33.750 kHz  74.250 MHz
     VIC   4:  1280x720    60.000 Hz  16:9    45.000 kHz  74.250 MHz
     VIC   3:   720x480    59.940 Hz  16:9    31.469 kHz  27.000 MHz
     VIC   2:   720x480    59.940 Hz   4:3    31.469 kHz  27.000 MHz
     VIC   1:   640x480    59.940 Hz   4:3    31.469 kHz  25.175 MHz
     VIC  17:   720x576    50.000 Hz   4:3    31.250 kHz  27.000 MHz
     VIC  18:   720x576    50.000 Hz  16:9    31.250 kHz  27.000 MHz
     VIC  19:  1280x720    50.000 Hz  16:9    37.500 kHz  74.250 MHz
     VIC  20:  1920x1080i  50.000 Hz  16:9    28.125 kHz  74.250 MHz
     VIC  31:  1920x1080   50.000 Hz  16:9    56.250 kHz 148.500 MHz
   Audio Data Block:
     Linear PCM:
       Max channels: 2
       Supported sample rates (kHz): 48 44.1 32
       Supported sample sizes (bits): 24 20 16
   Speaker Allocation Data Block:
     FL/FR - Front Left/Right
   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
     Source physical address: 1.0.0.0
   Detailed Timing Descriptors:
     DTD 2:  1920x1080   59.988 Hz  16:9    66.587 kHz 138.500 MHz (477 
mm x 268 mm)
                  Hfront   48 Hsync  32 Hback  80 Hpol P
                  Vfront    3 Vsync   5 Vback  22 Vpol N
     DTD 3:  1366x768    59.790 Hz 683:384  47.712 kHz  85.500 MHz (477 
mm x 268 mm)
                  Hfront   70 Hsync 143 Hback 213 Hpol P
                  Vfront    3 Vsync   3 Vback  24 Vpol P
     DTD 4:  1280x720    60.000 Hz  16:9    45.000 kHz  74.250 MHz (477 
mm x 268 mm)
                  Hfront  110 Hsync  40 Hback 220 Hpol P
                  Vfront    5 Vsync   5 Vback  20 Vpol P
     DTD 5:   720x480    59.940 Hz   3:2    31.469 kHz  27.000 MHz (477 
mm x 268 mm)
                  Hfront   16 Hsync  62 Hback  60 Hpol N
                  Vfront    9 Vsync   6 Vback  30 Vpol N
     DTD 6:  1920x1080i  60.000 Hz  16:9    33.750 kHz  74.250 MHz (477 
mm x 268 mm)
                  Hfront   88 Hsync  44 Hback 148 Hpol P
                  Vfront    2 Vsync   5 Vback  15 Vpol P Vfront +0.5 Odd 
Field
                  Vfront    2 Vsync   5 Vback  15 Vpol P Vback  +0.5 
Even Field
Checksum: 0x32

----------------

edid-decode SHA: 56dd103a0c20724ee956950f5bcb8cc1c8667af9

Warnings:

Block 1, CTA-861 Extension Block:
   Display Product Serial Number is set, so the Serial Number in the 
Base EDID should be 0.
   Missing VCDB, needed for Set Selectable RGB Quantization to avoid 
interop issues.
EDID:
   CTA-861: Multiple native progressive timings are defined.

Failures:

EDID:
   Base EDID: Some timings are out of range of the Monitor Ranges:
     Horizontal Freq: 28.125 - 79.976 kHz (Monitor: 30.000 - 83.000 kHz)

EDID conformity: FAIL
============================ end-of-message
