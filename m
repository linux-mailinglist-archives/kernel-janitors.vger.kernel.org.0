Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2EDC536D71
	for <lists+kernel-janitors@lfdr.de>; Sat, 28 May 2022 17:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237201AbiE1POO (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 28 May 2022 11:14:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237198AbiE1POO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 28 May 2022 11:14:14 -0400
Received: from smtp.smtpout.orange.fr (smtp05.smtpout.orange.fr [80.12.242.127])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03B74EE23
        for <kernel-janitors@vger.kernel.org>; Sat, 28 May 2022 08:14:11 -0700 (PDT)
Received: from pop-os.home ([90.11.191.102])
        by smtp.orange.fr with ESMTPA
        id uy8mnuDxQ6rrEuy8mnJluk; Sat, 28 May 2022 17:14:10 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 28 May 2022 17:14:10 +0200
X-ME-IP: 90.11.191.102
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     tglx@linutronix.de,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Johan Hovold <johan@kernel.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH] USB: Follow-up to SPDX GPL-2.0+ identifiers addition - remove now useless comments
Date:   Sat, 28 May 2022 17:13:56 +0200
Message-Id: <5c6c58772ada0fd95434c669b79428bd610c0084.1653750820.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

All these files have been updated in the commit given in the Fixes: tag
below.

When the SPDX-License-Identifier: has been added, the corresponding text at
the beginning of the files has not been deleted.
All these texts are about GPL-2.0+, with different variation in the
wording.

Remove these now useless lines to save some LoC.

Fixes: 5fd54ace4721 ("USB: add SPDX identifiers to all remaining files in drivers/usb/")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 include/linux/usb/c67x00.h        | 15 ---------------
 include/linux/usb/composite.h     | 14 --------------
 include/linux/usb/ehci_def.h      | 14 --------------
 include/linux/usb/ehci_pdriver.h  | 14 --------------
 include/linux/usb/g_hid.h         | 14 --------------
 include/linux/usb/hcd.h           | 14 --------------
 include/linux/usb/musb-ux500.h    | 10 ----------
 include/linux/usb/net2280.h       | 14 --------------
 include/linux/usb/ohci_pdriver.h  | 14 --------------
 include/linux/usb/otg-fsm.h       | 17 ++---------------
 include/linux/usb/phy_companion.h | 10 ----------
 include/linux/usb/rndis_host.h    | 14 --------------
 include/linux/usb/usb338x.h       | 11 -----------
 include/linux/usb/usbnet.h        | 14 --------------
 14 files changed, 2 insertions(+), 187 deletions(-)

diff --git a/include/linux/usb/c67x00.h b/include/linux/usb/c67x00.h
index 2fc39e3b7281..45e0757e58f3 100644
--- a/include/linux/usb/c67x00.h
+++ b/include/linux/usb/c67x00.h
@@ -3,21 +3,6 @@
  * usb_c67x00.h: platform definitions for the Cypress C67X00 USB chip
  *
  * Copyright (C) 2006-2008 Barco N.V.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
- * MA  02110-1301  USA.
  */
 
 #ifndef _LINUX_USB_C67X00_H
diff --git a/include/linux/usb/composite.h b/include/linux/usb/composite.h
index 9d2762279286..43ac3fa760db 100644
--- a/include/linux/usb/composite.h
+++ b/include/linux/usb/composite.h
@@ -3,20 +3,6 @@
  * composite.h -- framework for usb gadgets which are composite devices
  *
  * Copyright (C) 2006-2008 David Brownell
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
  */
 
 #ifndef	__LINUX_USB_COMPOSITE_H
diff --git a/include/linux/usb/ehci_def.h b/include/linux/usb/ehci_def.h
index c892c5bc6638..fbabadd3b372 100644
--- a/include/linux/usb/ehci_def.h
+++ b/include/linux/usb/ehci_def.h
@@ -1,20 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (c) 2001-2002 by David Brownell
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License as published by the
- * Free Software Foundation; either version 2 of the License, or (at your
- * option) any later version.
- *
- * This program is distributed in the hope that it will be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
- * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
- * for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software Foundation,
- * Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  */
 
 #ifndef __LINUX_USB_EHCI_DEF_H
diff --git a/include/linux/usb/ehci_pdriver.h b/include/linux/usb/ehci_pdriver.h
index 89fc901e778f..0f1b166f5aa0 100644
--- a/include/linux/usb/ehci_pdriver.h
+++ b/include/linux/usb/ehci_pdriver.h
@@ -1,20 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (C) 2012 Hauke Mehrtens <hauke@hauke-m.de>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License as published by the
- * Free Software Foundation; either version 2 of the License, or (at your
- * option) any later version.
- *
- * This program is distributed in the hope that it will be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
- * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
- * for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software Foundation,
- * Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  */
 
 #ifndef __USB_CORE_EHCI_PDRIVER_H
diff --git a/include/linux/usb/g_hid.h b/include/linux/usb/g_hid.h
index 7581e488c237..d56bfedeb079 100644
--- a/include/linux/usb/g_hid.h
+++ b/include/linux/usb/g_hid.h
@@ -3,20 +3,6 @@
  * g_hid.h -- Header file for USB HID gadget driver
  *
  * Copyright (C) 2010 Fabien Chouteau <fabien.chouteau@barco.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
 #ifndef __LINUX_USB_G_HID_H
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index 2c1fc9212cf2..37ccb31b1d40 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -1,20 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (c) 2001-2002 by David Brownell
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License as published by the
- * Free Software Foundation; either version 2 of the License, or (at your
- * option) any later version.
- *
- * This program is distributed in the hope that it will be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
- * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
- * for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software Foundation,
- * Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  */
 
 #ifndef __USB_CORE_HCD_H
diff --git a/include/linux/usb/musb-ux500.h b/include/linux/usb/musb-ux500.h
index c4b7ad9850ca..d60dcfc56b5a 100644
--- a/include/linux/usb/musb-ux500.h
+++ b/include/linux/usb/musb-ux500.h
@@ -1,16 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (C) 2013 ST-Ericsson AB
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #ifndef __MUSB_UX500_H__
diff --git a/include/linux/usb/net2280.h b/include/linux/usb/net2280.h
index 08b85caecfaf..f29fe6a1f415 100644
--- a/include/linux/usb/net2280.h
+++ b/include/linux/usb/net2280.h
@@ -5,20 +5,6 @@
  *
  * Copyright (C) 2002 NetChip Technology, Inc. (http://www.netchip.com)
  * Copyright (C) 2003 David Brownell
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
 #ifndef __LINUX_USB_NET2280_H
diff --git a/include/linux/usb/ohci_pdriver.h b/include/linux/usb/ohci_pdriver.h
index 7eb16cf587ee..2447c78b1766 100644
--- a/include/linux/usb/ohci_pdriver.h
+++ b/include/linux/usb/ohci_pdriver.h
@@ -1,20 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (C) 2012 Hauke Mehrtens <hauke@hauke-m.de>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License as published by the
- * Free Software Foundation; either version 2 of the License, or (at your
- * option) any later version.
- *
- * This program is distributed in the hope that it will be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
- * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
- * for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software Foundation,
- * Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  */
 
 #ifndef __USB_CORE_OHCI_PDRIVER_H
diff --git a/include/linux/usb/otg-fsm.h b/include/linux/usb/otg-fsm.h
index 784659d4dc99..6135d076c53d 100644
--- a/include/linux/usb/otg-fsm.h
+++ b/include/linux/usb/otg-fsm.h
@@ -1,19 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
-/* Copyright (C) 2007,2008 Freescale Semiconductor, Inc.
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
- *
- * This program is distributed in the hope that it will be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
- *
- * You should have received a copy of the  GNU General Public License along
- * with this program; if not, write  to the Free Software Foundation, Inc.,
- * 675 Mass Ave, Cambridge, MA 02139, USA.
+/*
+ * Copyright (C) 2007,2008 Freescale Semiconductor, Inc.
  */
 
 #ifndef __LINUX_USB_OTG_FSM_H
diff --git a/include/linux/usb/phy_companion.h b/include/linux/usb/phy_companion.h
index 263196f05015..862aaeca2319 100644
--- a/include/linux/usb/phy_companion.h
+++ b/include/linux/usb/phy_companion.h
@@ -3,18 +3,8 @@
  * phy-companion.h -- phy companion to indicate the comparator part of PHY
  *
  * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
  *
  * Author: Kishon Vijay Abraham I <kishon@ti.com>
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
  */
 
 #ifndef __DRIVERS_PHY_COMPANION_H
diff --git a/include/linux/usb/rndis_host.h b/include/linux/usb/rndis_host.h
index cc42db51bbba..489cfb1d00f6 100644
--- a/include/linux/usb/rndis_host.h
+++ b/include/linux/usb/rndis_host.h
@@ -2,20 +2,6 @@
 /*
  * Host Side support for RNDIS Networking Links
  * Copyright (C) 2005 by David Brownell
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
 #ifndef	__LINUX_USB_RNDIS_HOST_H
diff --git a/include/linux/usb/usb338x.h b/include/linux/usb/usb338x.h
index 20020c1336d5..70a7e3cdb3c9 100644
--- a/include/linux/usb/usb338x.h
+++ b/include/linux/usb/usb338x.h
@@ -6,17 +6,6 @@
  * Copyright (C) 2002 NetChip Technology, Inc. (http://www.netchip.com)
  * Copyright (C) 2003 David Brownell
  * Copyright (C) 2014 Ricardo Ribalda - Qtechnology/AS
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
  */
 
 #ifndef __LINUX_USB_USB338X_H
diff --git a/include/linux/usb/usbnet.h b/include/linux/usb/usbnet.h
index 1b4d72d5e891..4f5608cbd9ab 100644
--- a/include/linux/usb/usbnet.h
+++ b/include/linux/usb/usbnet.h
@@ -4,20 +4,6 @@
  *
  * Copyright (C) 2000-2005 by David Brownell <dbrownell@users.sourceforge.net>
  * Copyright (C) 2003-2005 David Hollis <dhollis@davehollis.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
 #ifndef	__LINUX_USB_USBNET_H
-- 
2.34.1

