Return-Path: <kernel-janitors+bounces-7289-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA36A4BC47
	for <lists+kernel-janitors@lfdr.de>; Mon,  3 Mar 2025 11:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 763E716FF1A
	for <lists+kernel-janitors@lfdr.de>; Mon,  3 Mar 2025 10:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C36D1F3BA7;
	Mon,  3 Mar 2025 10:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="flAqJQ5P"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF90D1F2B82
	for <kernel-janitors@vger.kernel.org>; Mon,  3 Mar 2025 10:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740997834; cv=none; b=I5uLvLqFdptlSz+B1FwMiQEW6tkYDmo3BJWuHq6eCxLsr8edTuqXzZTyeaGVg5D+3BUFV4SrmmKQ5DSI9B0Ze94PHzAIVmW4nn37qjgvr98Fex6jEdHRtTOCL+6+WljM+8jnhhu5NT84FqOhIqldNUY0br69WN22zNM9kKs4dpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740997834; c=relaxed/simple;
	bh=Xd6jeKSTgIZFdafSVXZ/PdjL+vCFnUo1AZ/RbpdFGNw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ka07ZgNjog9B2G12Dk48BC397zemyzti4c3PKIXzGBnF1v/PcM91Zy6fJSymKF6QvPnzgOW5G4cLgnReMLR61t/3Xa9793i5JV0wUdxiNni99tHKNTPQ9X0D8NqQcMXW8URHz6WAEQnyKs077i/hm5x3TVBT03vQCWrxeRR5Amw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=flAqJQ5P; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740997830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gR6zLqRG9S1za/uF+nzi2msUOEjaoJGIhx4NU2xJ4k0=;
	b=flAqJQ5P7bHVRs4k4HIxmVb7ZmmqFL8kFQoUA+kvIrVzsmoDKpolSOwvima/A/sZ8bGO84
	iURXi4TpwXJesUAzOFH+PQrH4/365xPrDTbYTtMNqBSGYBaWQ+Dh76G1mgTSbIlJq+EL2n
	TAERKDp157VjIp73e8BSy8KzhK4r3dg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-cDk3Y6o3NzyIeBu2HtTnYA-1; Mon, 03 Mar 2025 05:30:29 -0500
X-MC-Unique: cDk3Y6o3NzyIeBu2HtTnYA-1
X-Mimecast-MFC-AGG-ID: cDk3Y6o3NzyIeBu2HtTnYA_1740997828
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5e5050d1a2dso2453562a12.3
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Mar 2025 02:30:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740997828; x=1741602628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gR6zLqRG9S1za/uF+nzi2msUOEjaoJGIhx4NU2xJ4k0=;
        b=Usgt5LWpkH9EdWGG3oNZ2j0oWg+xnsgeUEiGF4FPy71g0TrLlQIUlFXsJMCb1wIwQu
         ZssfstYuG7xZJQF6JZikzWs4VJgJGoLwa4N+J3gdQqNkXuFCD3gNH7VyFXf92iPWcYxo
         uo/of7DItUNEmBuj2cRL8bTy1m2A2clwUS14OSg/sRJo0l1CD6qh4az7d5i/o/PmNJNP
         t1EDYRGnnm0Bn6ud395E/A1kJNUoQmTDwysr86vvTTuPq46r/XJLFs3K73VBbGF3FnTV
         ZRgywO9CifsBd0Ug+yOrOCcmTU+RyNDQhhcuODnjCoEWONqLiKRFq7LrQcqz8/poYqPy
         wsPQ==
X-Gm-Message-State: AOJu0Yx0IecqXTa5gLxoldje/ON4GTlpKIam5/hclRkwR9is5mUmyXEA
	UM0vXidVesMw8hE5W4C17v6mezUoL34+NWO3K9xtAcDZiVIjK9SxdzPXUy9xKJoBujuf53ttC5O
	gwrHdJnpAQyCx2vyiQdz3aOef23J2afeorjpt9Vi5c7r6u3xUxTogOz3YnW9RMMp0uA==
X-Gm-Gg: ASbGncs3TJBF0rVo1FH8cYcC6Gn/lw5An63PS0EKjYKC4ne7TBTitoXXR4t+GVXJNG6
	n3u2z640oaR07yVVrrfuqh1O1sWXkvA1uORNlFHbOyvcbsNHNrmxr7JCxXsAQamYrpD7jC6hxy8
	CDpebWN0Aab6GY8YapIcPbIjySWDfIhRbcRN+BHVIWFAC53vKy+ovmkF4+G4PKU+/3LDy58OuU3
	suyUtII7xmDtfd5pYH3+C3DMsxIFyNOQkFZJGsCv4kKo+EvEYoZh3Y01vx4SKZxfEPdlF8GK/Q0
	ljjAFdqBsLFDv9PBmak5Tnz9GzAGEFWJB+ES88Bl6UVUvotBO+g2iy+Hn1Kaskg=
X-Received: by 2002:a05:6402:528a:b0:5e5:437c:1daf with SMTP id 4fb4d7f45d1cf-5e5437c22a7mr5160413a12.16.1740997827217;
        Mon, 03 Mar 2025 02:30:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWOtveprrubC5jzCtCbdOt9xXXQloZV5gJJWnE6GooHlcrYwBVrf5NDmW5ksFomjWCc6RdKg==
X-Received: by 2002:a05:6402:528a:b0:5e5:437c:1daf with SMTP id 4fb4d7f45d1cf-5e5437c22a7mr5160377a12.16.1740997826443;
        Mon, 03 Mar 2025 02:30:26 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3bb4bd9sm6630165a12.33.2025.03.03.02.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 02:30:25 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] media: remove STA2x11 media pci driver
Date: Mon,  3 Mar 2025 11:30:22 +0100
Message-ID: <20250303103022.374705-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

With commit dcbb01fbb7ae ("x86/pci: Remove old STA2x11 support"), the
STA2X11 Video Input Port driver is not needed and cannot be built anymore.

Remove the driver and its reference in media documentation.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 .../admin-guide/media/pci-cardlist.rst        |    1 -
 drivers/media/pci/Kconfig                     |    1 -
 drivers/media/pci/Makefile                    |    2 -
 drivers/media/pci/sta2x11/Kconfig             |   16 -
 drivers/media/pci/sta2x11/Makefile            |    2 -
 drivers/media/pci/sta2x11/sta2x11_vip.c       | 1270 -----------------
 drivers/media/pci/sta2x11/sta2x11_vip.h       |   29 -
 7 files changed, 1321 deletions(-)
 delete mode 100644 drivers/media/pci/sta2x11/Kconfig
 delete mode 100644 drivers/media/pci/sta2x11/Makefile
 delete mode 100644 drivers/media/pci/sta2x11/sta2x11_vip.c
 delete mode 100644 drivers/media/pci/sta2x11/sta2x11_vip.h

diff --git a/Documentation/admin-guide/media/pci-cardlist.rst b/Documentation/admin-guide/media/pci-cardlist.rst
index 7d8e3c8987db..239879634ea5 100644
--- a/Documentation/admin-guide/media/pci-cardlist.rst
+++ b/Documentation/admin-guide/media/pci-cardlist.rst
@@ -86,7 +86,6 @@ saa7134           Philips SAA7134
 saa7164           NXP SAA7164
 smipcie           SMI PCIe DVBSky cards
 solo6x10          Bluecherry / Softlogic 6x10 capture cards (MPEG-4/H.264)
-sta2x11_vip       STA2X11 VIP Video For Linux
 tw5864            Techwell TW5864 video/audio grabber and encoder
 tw686x            Intersil/Techwell TW686x
 tw68              Techwell tw68x Video For Linux
diff --git a/drivers/media/pci/Kconfig b/drivers/media/pci/Kconfig
index 7f65aa609388..eebb16c58f3d 100644
--- a/drivers/media/pci/Kconfig
+++ b/drivers/media/pci/Kconfig
@@ -15,7 +15,6 @@ if MEDIA_CAMERA_SUPPORT
 
 source "drivers/media/pci/mgb4/Kconfig"
 source "drivers/media/pci/solo6x10/Kconfig"
-source "drivers/media/pci/sta2x11/Kconfig"
 source "drivers/media/pci/tw5864/Kconfig"
 source "drivers/media/pci/tw68/Kconfig"
 source "drivers/media/pci/tw686x/Kconfig"
diff --git a/drivers/media/pci/Makefile b/drivers/media/pci/Makefile
index f18c7e15abe3..02763ad88511 100644
--- a/drivers/media/pci/Makefile
+++ b/drivers/media/pci/Makefile
@@ -22,8 +22,6 @@ obj-y        +=	ttpci/		\
 # Please keep it alphabetically sorted by Kconfig name
 # (e. g. LC_ALL=C sort Makefile)
 
-obj-$(CONFIG_STA2X11_VIP) += sta2x11/
-
 obj-$(CONFIG_VIDEO_BT848) += bt8xx/
 obj-$(CONFIG_VIDEO_COBALT) += cobalt/
 obj-$(CONFIG_VIDEO_CX18) += cx18/
diff --git a/drivers/media/pci/sta2x11/Kconfig b/drivers/media/pci/sta2x11/Kconfig
deleted file mode 100644
index 118b922c08c3..000000000000
--- a/drivers/media/pci/sta2x11/Kconfig
+++ /dev/null
@@ -1,16 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-config STA2X11_VIP
-	tristate "STA2X11 VIP Video For Linux"
-	depends on PCI && VIDEO_DEV && I2C
-	depends on STA2X11 || COMPILE_TEST
-	select GPIOLIB if MEDIA_SUBDRV_AUTOSELECT
-	select VIDEO_ADV7180 if MEDIA_SUBDRV_AUTOSELECT
-	select VIDEOBUF2_DMA_CONTIG
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	help
-	  Say Y for support for STA2X11 VIP (Video Input Port) capture
-	  device.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called sta2x11_vip.
diff --git a/drivers/media/pci/sta2x11/Makefile b/drivers/media/pci/sta2x11/Makefile
deleted file mode 100644
index bb684a7b6270..000000000000
--- a/drivers/media/pci/sta2x11/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_STA2X11_VIP) += sta2x11_vip.o
diff --git a/drivers/media/pci/sta2x11/sta2x11_vip.c b/drivers/media/pci/sta2x11/sta2x11_vip.c
deleted file mode 100644
index 3049bad20f14..000000000000
--- a/drivers/media/pci/sta2x11/sta2x11_vip.c
+++ /dev/null
@@ -1,1270 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * This is the driver for the STA2x11 Video Input Port.
- *
- * Copyright (C) 2012       ST Microelectronics
- *     author: Federico Vaga <federico.vaga@gmail.com>
- * Copyright (C) 2010       WindRiver Systems, Inc.
- *     authors: Andreas Kies <andreas.kies@windriver.com>
- *              Vlad Lungu   <vlad.lungu@windriver.com>
- */
-
-#include <linux/types.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/videodev2.h>
-#include <linux/kmod.h>
-#include <linux/pci.h>
-#include <linux/interrupt.h>
-#include <linux/io.h>
-#include <linux/gpio/consumer.h>
-#include <linux/gpio.h>
-#include <linux/i2c.h>
-#include <linux/delay.h>
-#include <media/v4l2-common.h>
-#include <media/v4l2-device.h>
-#include <media/v4l2-ctrls.h>
-#include <media/v4l2-ioctl.h>
-#include <media/v4l2-fh.h>
-#include <media/v4l2-event.h>
-#include <media/videobuf2-dma-contig.h>
-
-#include "sta2x11_vip.h"
-
-#define DRV_VERSION "1.3"
-
-#ifndef PCI_DEVICE_ID_STMICRO_VIP
-#define PCI_DEVICE_ID_STMICRO_VIP 0xCC0D
-#endif
-
-#define MAX_FRAMES 4
-
-/*Register offsets*/
-#define DVP_CTL		0x00
-#define DVP_TFO		0x04
-#define DVP_TFS		0x08
-#define DVP_BFO		0x0C
-#define DVP_BFS		0x10
-#define DVP_VTP		0x14
-#define DVP_VBP		0x18
-#define DVP_VMP		0x1C
-#define DVP_ITM		0x98
-#define DVP_ITS		0x9C
-#define DVP_STA		0xA0
-#define DVP_HLFLN	0xA8
-#define DVP_RGB		0xC0
-#define DVP_PKZ		0xF0
-
-/*Register fields*/
-#define DVP_CTL_ENA	0x00000001
-#define DVP_CTL_RST	0x80000000
-#define DVP_CTL_DIS	(~0x00040001)
-
-#define DVP_IT_VSB	0x00000008
-#define DVP_IT_VST	0x00000010
-#define DVP_IT_FIFO	0x00000020
-
-#define DVP_HLFLN_SD	0x00000001
-
-#define SAVE_COUNT 8
-#define AUX_COUNT 3
-#define IRQ_COUNT 1
-
-
-struct vip_buffer {
-	struct vb2_v4l2_buffer vb;
-	struct list_head	list;
-	dma_addr_t		dma;
-};
-static inline struct vip_buffer *to_vip_buffer(struct vb2_v4l2_buffer *vb2)
-{
-	return container_of(vb2, struct vip_buffer, vb);
-}
-
-/**
- * struct sta2x11_vip - All internal data for one instance of device
- * @v4l2_dev: device registered in v4l layer
- * @video_dev: properties of our device
- * @pdev: PCI device
- * @adapter: contains I2C adapter information
- * @register_save_area: All relevant register are saved here during suspend
- * @decoder: contains information about video DAC
- * @ctrl_hdl: handler for control framework
- * @format: pixel format, fixed UYVY
- * @std: video standard (e.g. PAL/NTSC)
- * @input: input line for video signal ( 0 or 1 )
- * @disabled: Device is in power down state
- * @slock: for excluse access of registers
- * @vb_vidq: queue maintained by videobuf2 layer
- * @buffer_list: list of buffer in use
- * @sequence: sequence number of acquired buffer
- * @active: current active buffer
- * @lock: used in videobuf2 callback
- * @v4l_lock: serialize its video4linux ioctls
- * @tcount: Number of top frames
- * @bcount: Number of bottom frames
- * @overflow: Number of FIFO overflows
- * @iomem: hardware base address
- * @config: I2C and gpio config from platform
- *
- * All non-local data is accessed via this structure.
- */
-struct sta2x11_vip {
-	struct v4l2_device v4l2_dev;
-	struct video_device video_dev;
-	struct pci_dev *pdev;
-	struct i2c_adapter *adapter;
-	unsigned int register_save_area[IRQ_COUNT + SAVE_COUNT + AUX_COUNT];
-	struct v4l2_subdev *decoder;
-	struct v4l2_ctrl_handler ctrl_hdl;
-
-
-	struct v4l2_pix_format format;
-	v4l2_std_id std;
-	unsigned int input;
-	int disabled;
-	spinlock_t slock;
-
-	struct vb2_queue vb_vidq;
-	struct list_head buffer_list;
-	unsigned int sequence;
-	struct vip_buffer *active; /* current active buffer */
-	spinlock_t lock; /* Used in videobuf2 callback */
-	struct mutex v4l_lock;
-
-	/* Interrupt counters */
-	int tcount, bcount;
-	int overflow;
-
-	void __iomem *iomem;	/* I/O Memory */
-	struct vip_config *config;
-};
-
-static const unsigned int registers_to_save[AUX_COUNT] = {
-	DVP_HLFLN, DVP_RGB, DVP_PKZ
-};
-
-static struct v4l2_pix_format formats_50[] = {
-	{			/*PAL interlaced */
-	 .width = 720,
-	 .height = 576,
-	 .pixelformat = V4L2_PIX_FMT_UYVY,
-	 .field = V4L2_FIELD_INTERLACED,
-	 .bytesperline = 720 * 2,
-	 .sizeimage = 720 * 2 * 576,
-	 .colorspace = V4L2_COLORSPACE_SMPTE170M},
-	{			/*PAL top */
-	 .width = 720,
-	 .height = 288,
-	 .pixelformat = V4L2_PIX_FMT_UYVY,
-	 .field = V4L2_FIELD_TOP,
-	 .bytesperline = 720 * 2,
-	 .sizeimage = 720 * 2 * 288,
-	 .colorspace = V4L2_COLORSPACE_SMPTE170M},
-	{			/*PAL bottom */
-	 .width = 720,
-	 .height = 288,
-	 .pixelformat = V4L2_PIX_FMT_UYVY,
-	 .field = V4L2_FIELD_BOTTOM,
-	 .bytesperline = 720 * 2,
-	 .sizeimage = 720 * 2 * 288,
-	 .colorspace = V4L2_COLORSPACE_SMPTE170M},
-
-};
-
-static struct v4l2_pix_format formats_60[] = {
-	{			/*NTSC interlaced */
-	 .width = 720,
-	 .height = 480,
-	 .pixelformat = V4L2_PIX_FMT_UYVY,
-	 .field = V4L2_FIELD_INTERLACED,
-	 .bytesperline = 720 * 2,
-	 .sizeimage = 720 * 2 * 480,
-	 .colorspace = V4L2_COLORSPACE_SMPTE170M},
-	{			/*NTSC top */
-	 .width = 720,
-	 .height = 240,
-	 .pixelformat = V4L2_PIX_FMT_UYVY,
-	 .field = V4L2_FIELD_TOP,
-	 .bytesperline = 720 * 2,
-	 .sizeimage = 720 * 2 * 240,
-	 .colorspace = V4L2_COLORSPACE_SMPTE170M},
-	{			/*NTSC bottom */
-	 .width = 720,
-	 .height = 240,
-	 .pixelformat = V4L2_PIX_FMT_UYVY,
-	 .field = V4L2_FIELD_BOTTOM,
-	 .bytesperline = 720 * 2,
-	 .sizeimage = 720 * 2 * 240,
-	 .colorspace = V4L2_COLORSPACE_SMPTE170M},
-};
-
-/* Write VIP register */
-static inline void reg_write(struct sta2x11_vip *vip, unsigned int reg, u32 val)
-{
-	iowrite32((val), (vip->iomem)+(reg));
-}
-/* Read VIP register */
-static inline u32 reg_read(struct sta2x11_vip *vip, unsigned int reg)
-{
-	return  ioread32((vip->iomem)+(reg));
-}
-/* Start DMA acquisition */
-static void start_dma(struct sta2x11_vip *vip, struct vip_buffer *vip_buf)
-{
-	unsigned long offset = 0;
-
-	if (vip->format.field == V4L2_FIELD_INTERLACED)
-		offset = vip->format.width * 2;
-
-	spin_lock_irq(&vip->slock);
-	/* Enable acquisition */
-	reg_write(vip, DVP_CTL, reg_read(vip, DVP_CTL) | DVP_CTL_ENA);
-	/* Set Top and Bottom Field memory address */
-	reg_write(vip, DVP_VTP, (u32)vip_buf->dma);
-	reg_write(vip, DVP_VBP, (u32)vip_buf->dma + offset);
-	spin_unlock_irq(&vip->slock);
-}
-
-/* Fetch the next buffer to activate */
-static void vip_active_buf_next(struct sta2x11_vip *vip)
-{
-	/* Get the next buffer */
-	spin_lock(&vip->lock);
-	if (list_empty(&vip->buffer_list)) {/* No available buffer */
-		spin_unlock(&vip->lock);
-		return;
-	}
-	vip->active = list_first_entry(&vip->buffer_list,
-				       struct vip_buffer,
-				       list);
-	/* Reset Top and Bottom counter */
-	vip->tcount = 0;
-	vip->bcount = 0;
-	spin_unlock(&vip->lock);
-	if (vb2_is_streaming(&vip->vb_vidq)) {	/* streaming is on */
-		start_dma(vip, vip->active);	/* start dma capture */
-	}
-}
-
-
-/* Videobuf2 Operations */
-static int queue_setup(struct vb2_queue *vq,
-		       unsigned int *nbuffers, unsigned int *nplanes,
-		       unsigned int sizes[], struct device *alloc_devs[])
-{
-	struct sta2x11_vip *vip = vb2_get_drv_priv(vq);
-
-	if (!(*nbuffers) || *nbuffers < MAX_FRAMES)
-		*nbuffers = MAX_FRAMES;
-
-	*nplanes = 1;
-	sizes[0] = vip->format.sizeimage;
-
-	vip->sequence = 0;
-	vip->active = NULL;
-	vip->tcount = 0;
-	vip->bcount = 0;
-
-	return 0;
-};
-static int buffer_init(struct vb2_buffer *vb)
-{
-	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
-	struct vip_buffer *vip_buf = to_vip_buffer(vbuf);
-
-	vip_buf->dma = vb2_dma_contig_plane_dma_addr(vb, 0);
-	INIT_LIST_HEAD(&vip_buf->list);
-	return 0;
-}
-
-static int buffer_prepare(struct vb2_buffer *vb)
-{
-	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
-	struct sta2x11_vip *vip = vb2_get_drv_priv(vb->vb2_queue);
-	struct vip_buffer *vip_buf = to_vip_buffer(vbuf);
-	unsigned long size;
-
-	size = vip->format.sizeimage;
-	if (vb2_plane_size(vb, 0) < size) {
-		v4l2_err(&vip->v4l2_dev, "buffer too small (%lu < %lu)\n",
-			 vb2_plane_size(vb, 0), size);
-		return -EINVAL;
-	}
-
-	vb2_set_plane_payload(&vip_buf->vb.vb2_buf, 0, size);
-
-	return 0;
-}
-static void buffer_queue(struct vb2_buffer *vb)
-{
-	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
-	struct sta2x11_vip *vip = vb2_get_drv_priv(vb->vb2_queue);
-	struct vip_buffer *vip_buf = to_vip_buffer(vbuf);
-
-	spin_lock(&vip->lock);
-	list_add_tail(&vip_buf->list, &vip->buffer_list);
-	if (!vip->active) {	/* No active buffer, active the first one */
-		vip->active = list_first_entry(&vip->buffer_list,
-					       struct vip_buffer,
-					       list);
-		if (vb2_is_streaming(&vip->vb_vidq))	/* streaming is on */
-			start_dma(vip, vip_buf);	/* start dma capture */
-	}
-	spin_unlock(&vip->lock);
-}
-static void buffer_finish(struct vb2_buffer *vb)
-{
-	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
-	struct sta2x11_vip *vip = vb2_get_drv_priv(vb->vb2_queue);
-	struct vip_buffer *vip_buf = to_vip_buffer(vbuf);
-
-	/* Buffer handled, remove it from the list */
-	spin_lock(&vip->lock);
-	list_del_init(&vip_buf->list);
-	spin_unlock(&vip->lock);
-
-	if (vb2_is_streaming(vb->vb2_queue))
-		vip_active_buf_next(vip);
-}
-
-static int start_streaming(struct vb2_queue *vq, unsigned int count)
-{
-	struct sta2x11_vip *vip = vb2_get_drv_priv(vq);
-
-	spin_lock_irq(&vip->slock);
-	/* Enable interrupt VSYNC Top and Bottom*/
-	reg_write(vip, DVP_ITM, DVP_IT_VSB | DVP_IT_VST);
-	spin_unlock_irq(&vip->slock);
-
-	if (count)
-		start_dma(vip, vip->active);
-
-	return 0;
-}
-
-/* abort streaming and wait for last buffer */
-static void stop_streaming(struct vb2_queue *vq)
-{
-	struct sta2x11_vip *vip = vb2_get_drv_priv(vq);
-	struct vip_buffer *vip_buf, *node;
-
-	/* Disable acquisition */
-	reg_write(vip, DVP_CTL, reg_read(vip, DVP_CTL) & ~DVP_CTL_ENA);
-	/* Disable all interrupts */
-	reg_write(vip, DVP_ITM, 0);
-
-	/* Release all active buffers */
-	spin_lock(&vip->lock);
-	list_for_each_entry_safe(vip_buf, node, &vip->buffer_list, list) {
-		vb2_buffer_done(&vip_buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
-		list_del(&vip_buf->list);
-	}
-	spin_unlock(&vip->lock);
-}
-
-static const struct vb2_ops vip_video_qops = {
-	.queue_setup		= queue_setup,
-	.buf_init		= buffer_init,
-	.buf_prepare		= buffer_prepare,
-	.buf_finish		= buffer_finish,
-	.buf_queue		= buffer_queue,
-	.start_streaming	= start_streaming,
-	.stop_streaming		= stop_streaming,
-};
-
-
-/* File Operations */
-static const struct v4l2_file_operations vip_fops = {
-	.owner = THIS_MODULE,
-	.open = v4l2_fh_open,
-	.release = vb2_fop_release,
-	.unlocked_ioctl = video_ioctl2,
-	.read = vb2_fop_read,
-	.mmap = vb2_fop_mmap,
-	.poll = vb2_fop_poll
-};
-
-
-/**
- * vidioc_querycap - return capabilities of device
- * @file: descriptor of device
- * @cap: contains return values
- * @priv: unused
- *
- * the capabilities of the device are returned
- *
- * return value: 0, no error.
- */
-static int vidioc_querycap(struct file *file, void *priv,
-			   struct v4l2_capability *cap)
-{
-	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
-	strscpy(cap->card, KBUILD_MODNAME, sizeof(cap->card));
-	return 0;
-}
-
-/**
- * vidioc_s_std - set video standard
- * @file: descriptor of device
- * @std: contains standard to be set
- * @priv: unused
- *
- * the video standard is set
- *
- * return value: 0, no error.
- *
- * -EIO, no input signal detected
- *
- * other, returned from video DAC.
- */
-static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id std)
-{
-	struct sta2x11_vip *vip = video_drvdata(file);
-
-	/*
-	 * This is here for backwards compatibility only.
-	 * The use of V4L2_STD_ALL to trigger a querystd is non-standard.
-	 */
-	if (std == V4L2_STD_ALL) {
-		v4l2_subdev_call(vip->decoder, video, querystd, &std);
-		if (std == V4L2_STD_UNKNOWN)
-			return -EIO;
-	}
-
-	if (vip->std != std) {
-		vip->std = std;
-		if (V4L2_STD_525_60 & std)
-			vip->format = formats_60[0];
-		else
-			vip->format = formats_50[0];
-	}
-
-	return v4l2_subdev_call(vip->decoder, video, s_std, std);
-}
-
-/**
- * vidioc_g_std - get video standard
- * @file: descriptor of device
- * @priv: unused
- * @std: contains return values
- *
- * the current video standard is returned
- *
- * return value: 0, no error.
- */
-static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *std)
-{
-	struct sta2x11_vip *vip = video_drvdata(file);
-
-	*std = vip->std;
-	return 0;
-}
-
-/**
- * vidioc_querystd - get possible video standards
- * @file: descriptor of device
- * @priv: unused
- * @std: contains return values
- *
- * all possible video standards are returned
- *
- * return value: delivered by video DAC routine.
- */
-static int vidioc_querystd(struct file *file, void *priv, v4l2_std_id *std)
-{
-	struct sta2x11_vip *vip = video_drvdata(file);
-
-	return v4l2_subdev_call(vip->decoder, video, querystd, std);
-}
-
-static int vidioc_enum_input(struct file *file, void *priv,
-			     struct v4l2_input *inp)
-{
-	if (inp->index > 1)
-		return -EINVAL;
-
-	inp->type = V4L2_INPUT_TYPE_CAMERA;
-	inp->std = V4L2_STD_ALL;
-	sprintf(inp->name, "Camera %u", inp->index);
-
-	return 0;
-}
-
-/**
- * vidioc_s_input - set input line
- * @file: descriptor of device
- * @priv: unused
- * @i: new input line number
- *
- * the current active input line is set
- *
- * return value: 0, no error.
- *
- * -EINVAL, line number out of range
- */
-static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
-{
-	struct sta2x11_vip *vip = video_drvdata(file);
-	int ret;
-
-	if (i > 1)
-		return -EINVAL;
-	ret = v4l2_subdev_call(vip->decoder, video, s_routing, i, 0, 0);
-
-	if (!ret)
-		vip->input = i;
-
-	return 0;
-}
-
-/**
- * vidioc_g_input - return input line
- * @file: descriptor of device
- * @priv: unused
- * @i: returned input line number
- *
- * the current active input line is returned
- *
- * return value: always 0.
- */
-static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
-{
-	struct sta2x11_vip *vip = video_drvdata(file);
-
-	*i = vip->input;
-	return 0;
-}
-
-/**
- * vidioc_enum_fmt_vid_cap - return video capture format
- * @file: descriptor of device
- * @priv: unused
- * @f: returned format information
- *
- * returns name and format of video capture
- * Only UYVY is supported by hardware.
- *
- * return value: always 0.
- */
-static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
-				   struct v4l2_fmtdesc *f)
-{
-
-	if (f->index != 0)
-		return -EINVAL;
-
-	f->pixelformat = V4L2_PIX_FMT_UYVY;
-	return 0;
-}
-
-/**
- * vidioc_try_fmt_vid_cap - set video capture format
- * @file: descriptor of device
- * @priv: unused
- * @f: new format
- *
- * new video format is set which includes width and
- * field type. width is fixed to 720, no scaling.
- * Only UYVY is supported by this hardware.
- * the minimum height is 200, the maximum is 576 (PAL)
- *
- * return value: 0, no error
- *
- * -EINVAL, pixel or field format not supported
- *
- */
-static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
-				  struct v4l2_format *f)
-{
-	struct sta2x11_vip *vip = video_drvdata(file);
-	int interlace_lim;
-
-	if (V4L2_PIX_FMT_UYVY != f->fmt.pix.pixelformat) {
-		v4l2_warn(&vip->v4l2_dev, "Invalid format, only UYVY supported\n");
-		return -EINVAL;
-	}
-
-	if (V4L2_STD_525_60 & vip->std)
-		interlace_lim = 240;
-	else
-		interlace_lim = 288;
-
-	switch (f->fmt.pix.field) {
-	default:
-	case V4L2_FIELD_ANY:
-		if (interlace_lim < f->fmt.pix.height)
-			f->fmt.pix.field = V4L2_FIELD_INTERLACED;
-		else
-			f->fmt.pix.field = V4L2_FIELD_BOTTOM;
-		break;
-	case V4L2_FIELD_TOP:
-	case V4L2_FIELD_BOTTOM:
-		if (interlace_lim < f->fmt.pix.height)
-			f->fmt.pix.height = interlace_lim;
-		break;
-	case V4L2_FIELD_INTERLACED:
-		break;
-	}
-
-	/* It is the only supported format */
-	f->fmt.pix.pixelformat = V4L2_PIX_FMT_UYVY;
-	f->fmt.pix.height &= ~1;
-	if (2 * interlace_lim < f->fmt.pix.height)
-		f->fmt.pix.height = 2 * interlace_lim;
-	if (200 > f->fmt.pix.height)
-		f->fmt.pix.height = 200;
-	f->fmt.pix.width = 720;
-	f->fmt.pix.bytesperline = f->fmt.pix.width * 2;
-	f->fmt.pix.sizeimage = f->fmt.pix.width * 2 * f->fmt.pix.height;
-	f->fmt.pix.colorspace = V4L2_COLORSPACE_SMPTE170M;
-	return 0;
-}
-
-/**
- * vidioc_s_fmt_vid_cap - set current video format parameters
- * @file: descriptor of device
- * @priv: unused
- * @f: returned format information
- *
- * set new capture format
- * return value: 0, no error
- *
- * other, delivered by video DAC routine.
- */
-static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
-				struct v4l2_format *f)
-{
-	struct sta2x11_vip *vip = video_drvdata(file);
-	unsigned int t_stop, b_stop, pitch;
-	int ret;
-
-	ret = vidioc_try_fmt_vid_cap(file, priv, f);
-	if (ret)
-		return ret;
-
-	if (vb2_is_busy(&vip->vb_vidq)) {
-		/* Can't change format during acquisition */
-		v4l2_err(&vip->v4l2_dev, "device busy\n");
-		return -EBUSY;
-	}
-	vip->format = f->fmt.pix;
-	switch (vip->format.field) {
-	case V4L2_FIELD_INTERLACED:
-		t_stop = ((vip->format.height / 2 - 1) << 16) |
-			 (2 * vip->format.width - 1);
-		b_stop = t_stop;
-		pitch = 4 * vip->format.width;
-		break;
-	case V4L2_FIELD_TOP:
-		t_stop = ((vip->format.height - 1) << 16) |
-			 (2 * vip->format.width - 1);
-		b_stop = (0 << 16) | (2 * vip->format.width - 1);
-		pitch = 2 * vip->format.width;
-		break;
-	case V4L2_FIELD_BOTTOM:
-		t_stop = (0 << 16) | (2 * vip->format.width - 1);
-		b_stop = (vip->format.height << 16) |
-			 (2 * vip->format.width - 1);
-		pitch = 2 * vip->format.width;
-		break;
-	default:
-		v4l2_err(&vip->v4l2_dev, "unknown field format\n");
-		return -EINVAL;
-	}
-
-	spin_lock_irq(&vip->slock);
-	/* Y-X Top Field Offset */
-	reg_write(vip, DVP_TFO, 0);
-	/* Y-X Bottom Field Offset */
-	reg_write(vip, DVP_BFO, 0);
-	/* Y-X Top Field Stop*/
-	reg_write(vip, DVP_TFS, t_stop);
-	/* Y-X Bottom Field Stop */
-	reg_write(vip, DVP_BFS, b_stop);
-	/* Video Memory Pitch */
-	reg_write(vip, DVP_VMP, pitch);
-	spin_unlock_irq(&vip->slock);
-
-	return 0;
-}
-
-/**
- * vidioc_g_fmt_vid_cap - get current video format parameters
- * @file: descriptor of device
- * @priv: unused
- * @f: contains format information
- *
- * returns current video format parameters
- *
- * return value: 0, always successful
- */
-static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
-				struct v4l2_format *f)
-{
-	struct sta2x11_vip *vip = video_drvdata(file);
-
-	f->fmt.pix = vip->format;
-
-	return 0;
-}
-
-static const struct v4l2_ioctl_ops vip_ioctl_ops = {
-	.vidioc_querycap = vidioc_querycap,
-	/* FMT handling */
-	.vidioc_enum_fmt_vid_cap = vidioc_enum_fmt_vid_cap,
-	.vidioc_g_fmt_vid_cap = vidioc_g_fmt_vid_cap,
-	.vidioc_s_fmt_vid_cap = vidioc_s_fmt_vid_cap,
-	.vidioc_try_fmt_vid_cap = vidioc_try_fmt_vid_cap,
-	/* Buffer handlers */
-	.vidioc_create_bufs = vb2_ioctl_create_bufs,
-	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
-	.vidioc_reqbufs = vb2_ioctl_reqbufs,
-	.vidioc_querybuf = vb2_ioctl_querybuf,
-	.vidioc_qbuf = vb2_ioctl_qbuf,
-	.vidioc_dqbuf = vb2_ioctl_dqbuf,
-	/* Stream on/off */
-	.vidioc_streamon = vb2_ioctl_streamon,
-	.vidioc_streamoff = vb2_ioctl_streamoff,
-	/* Standard handling */
-	.vidioc_g_std = vidioc_g_std,
-	.vidioc_s_std = vidioc_s_std,
-	.vidioc_querystd = vidioc_querystd,
-	/* Input handling */
-	.vidioc_enum_input = vidioc_enum_input,
-	.vidioc_g_input = vidioc_g_input,
-	.vidioc_s_input = vidioc_s_input,
-	/* Log status ioctl */
-	.vidioc_log_status = v4l2_ctrl_log_status,
-	/* Event handling */
-	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
-	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
-};
-
-static const struct video_device video_dev_template = {
-	.name = KBUILD_MODNAME,
-	.release = video_device_release_empty,
-	.fops = &vip_fops,
-	.ioctl_ops = &vip_ioctl_ops,
-	.tvnorms = V4L2_STD_ALL,
-	.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
-		       V4L2_CAP_STREAMING,
-};
-
-/**
- * vip_irq - interrupt routine
- * @irq: Number of interrupt ( not used, correct number is assumed )
- * @data: local data structure containing all information
- *
- * check for both frame interrupts set ( top and bottom ).
- * check FIFO overflow, but limit number of log messages after open.
- * signal a complete buffer if done
- *
- * return value: IRQ_NONE, interrupt was not generated by VIP
- *
- * IRQ_HANDLED, interrupt done.
- */
-static irqreturn_t vip_irq(int irq, void *data)
-{
-	struct sta2x11_vip *vip = data;
-	unsigned int status;
-
-	status = reg_read(vip, DVP_ITS);
-
-	if (!status)		/* No interrupt to handle */
-		return IRQ_NONE;
-
-	if (status & DVP_IT_FIFO)
-		if (vip->overflow++ > 5)
-			pr_info("VIP: fifo overflow\n");
-
-	if ((status & DVP_IT_VST) && (status & DVP_IT_VSB)) {
-		/* this is bad, we are too slow, hope the condition is gone
-		 * on the next frame */
-		return IRQ_HANDLED;
-	}
-
-	if (status & DVP_IT_VST)
-		if ((++vip->tcount) < 2)
-			return IRQ_HANDLED;
-	if (status & DVP_IT_VSB) {
-		vip->bcount++;
-		return IRQ_HANDLED;
-	}
-
-	if (vip->active) { /* Acquisition is over on this buffer */
-		/* Disable acquisition */
-		reg_write(vip, DVP_CTL, reg_read(vip, DVP_CTL) & ~DVP_CTL_ENA);
-		/* Remove the active buffer from the list */
-		vip->active->vb.vb2_buf.timestamp = ktime_get_ns();
-		vip->active->vb.sequence = vip->sequence++;
-		vb2_buffer_done(&vip->active->vb.vb2_buf, VB2_BUF_STATE_DONE);
-	}
-
-	return IRQ_HANDLED;
-}
-
-static void sta2x11_vip_init_register(struct sta2x11_vip *vip)
-{
-	/* Register initialization */
-	spin_lock_irq(&vip->slock);
-	/* Clean interrupt */
-	reg_read(vip, DVP_ITS);
-	/* Enable Half Line per vertical */
-	reg_write(vip, DVP_HLFLN, DVP_HLFLN_SD);
-	/* Reset VIP control */
-	reg_write(vip, DVP_CTL, DVP_CTL_RST);
-	/* Clear VIP control */
-	reg_write(vip, DVP_CTL, 0);
-	spin_unlock_irq(&vip->slock);
-}
-static void sta2x11_vip_clear_register(struct sta2x11_vip *vip)
-{
-	spin_lock_irq(&vip->slock);
-	/* Disable interrupt */
-	reg_write(vip, DVP_ITM, 0);
-	/* Reset VIP Control */
-	reg_write(vip, DVP_CTL, DVP_CTL_RST);
-	/* Clear VIP Control */
-	reg_write(vip, DVP_CTL, 0);
-	/* Clean VIP Interrupt */
-	reg_read(vip, DVP_ITS);
-	spin_unlock_irq(&vip->slock);
-}
-static int sta2x11_vip_init_buffer(struct sta2x11_vip *vip)
-{
-	int err;
-
-	err = dma_set_coherent_mask(&vip->pdev->dev, DMA_BIT_MASK(29));
-	if (err) {
-		v4l2_err(&vip->v4l2_dev, "Cannot configure coherent mask");
-		return err;
-	}
-	memset(&vip->vb_vidq, 0, sizeof(struct vb2_queue));
-	vip->vb_vidq.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	vip->vb_vidq.io_modes = VB2_MMAP | VB2_READ;
-	vip->vb_vidq.drv_priv = vip;
-	vip->vb_vidq.buf_struct_size = sizeof(struct vip_buffer);
-	vip->vb_vidq.ops = &vip_video_qops;
-	vip->vb_vidq.mem_ops = &vb2_dma_contig_memops;
-	vip->vb_vidq.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	vip->vb_vidq.dev = &vip->pdev->dev;
-	vip->vb_vidq.lock = &vip->v4l_lock;
-	err = vb2_queue_init(&vip->vb_vidq);
-	if (err)
-		return err;
-	INIT_LIST_HEAD(&vip->buffer_list);
-	spin_lock_init(&vip->lock);
-	return 0;
-}
-
-static int sta2x11_vip_init_controls(struct sta2x11_vip *vip)
-{
-	/*
-	 * Inititialize an empty control so VIP can inerithing controls
-	 * from ADV7180
-	 */
-	v4l2_ctrl_handler_init(&vip->ctrl_hdl, 0);
-
-	vip->v4l2_dev.ctrl_handler = &vip->ctrl_hdl;
-	if (vip->ctrl_hdl.error) {
-		int err = vip->ctrl_hdl.error;
-
-		v4l2_ctrl_handler_free(&vip->ctrl_hdl);
-		return err;
-	}
-
-	return 0;
-}
-
-/**
- * vip_gpio_reserve - reserve gpio pin
- * @dev: device
- * @pin: GPIO pin number
- * @dir: direction, input or output
- * @name: GPIO pin name
- *
- */
-static int vip_gpio_reserve(struct device *dev, int pin, int dir,
-			    const char *name)
-{
-	struct gpio_desc *desc = gpio_to_desc(pin);
-	int ret = -ENODEV;
-
-	if (!gpio_is_valid(pin))
-		return ret;
-
-	ret = gpio_request(pin, name);
-	if (ret) {
-		dev_err(dev, "Failed to allocate pin %d (%s)\n", pin, name);
-		return ret;
-	}
-
-	ret = gpiod_direction_output(desc, dir);
-	if (ret) {
-		dev_err(dev, "Failed to set direction for pin %d (%s)\n",
-			pin, name);
-		gpio_free(pin);
-		return ret;
-	}
-
-	ret = gpiod_export(desc, false);
-	if (ret) {
-		dev_err(dev, "Failed to export pin %d (%s)\n", pin, name);
-		gpio_free(pin);
-		return ret;
-	}
-
-	return 0;
-}
-
-/**
- * vip_gpio_release - release gpio pin
- * @dev: device
- * @pin: GPIO pin number
- * @name: GPIO pin name
- *
- */
-static void vip_gpio_release(struct device *dev, int pin, const char *name)
-{
-	if (gpio_is_valid(pin)) {
-		struct gpio_desc *desc = gpio_to_desc(pin);
-
-		dev_dbg(dev, "releasing pin %d (%s)\n",	pin, name);
-		gpiod_unexport(desc);
-		gpio_free(pin);
-	}
-}
-
-/**
- * sta2x11_vip_init_one - init one instance of video device
- * @pdev: PCI device
- * @ent: (not used)
- *
- * allocate reset pins for DAC.
- * Reset video DAC, this is done via reset line.
- * allocate memory for managing device
- * request interrupt
- * map IO region
- * register device
- * find and initialize video DAC
- *
- * return value: 0, no error
- *
- * -ENOMEM, no memory
- *
- * -ENODEV, device could not be detected or registered
- */
-static int sta2x11_vip_init_one(struct pci_dev *pdev,
-				const struct pci_device_id *ent)
-{
-	int ret;
-	struct sta2x11_vip *vip;
-	struct vip_config *config;
-
-	/* Check if hardware support 26-bit DMA */
-	if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(26))) {
-		dev_err(&pdev->dev, "26-bit DMA addressing not available\n");
-		return -EINVAL;
-	}
-	/* Enable PCI */
-	ret = pci_enable_device(pdev);
-	if (ret)
-		return ret;
-
-	/* Get VIP platform data */
-	config = dev_get_platdata(&pdev->dev);
-	if (!config) {
-		dev_info(&pdev->dev, "VIP slot disabled\n");
-		ret = -EINVAL;
-		goto disable;
-	}
-
-	/* Power configuration */
-	ret = vip_gpio_reserve(&pdev->dev, config->pwr_pin, 0,
-			       config->pwr_name);
-	if (ret)
-		goto disable;
-
-	ret = vip_gpio_reserve(&pdev->dev, config->reset_pin, 0,
-			       config->reset_name);
-	if (ret) {
-		vip_gpio_release(&pdev->dev, config->pwr_pin,
-				 config->pwr_name);
-		goto disable;
-	}
-
-	if (gpio_is_valid(config->pwr_pin)) {
-		/* Datasheet says 5ms between PWR and RST */
-		usleep_range(5000, 25000);
-		gpio_direction_output(config->pwr_pin, 1);
-	}
-
-	if (gpio_is_valid(config->reset_pin)) {
-		/* Datasheet says 5ms between PWR and RST */
-		usleep_range(5000, 25000);
-		gpio_direction_output(config->reset_pin, 1);
-	}
-	usleep_range(5000, 25000);
-
-	/* Allocate a new VIP instance */
-	vip = kzalloc(sizeof(struct sta2x11_vip), GFP_KERNEL);
-	if (!vip) {
-		ret = -ENOMEM;
-		goto release_gpios;
-	}
-	vip->pdev = pdev;
-	vip->std = V4L2_STD_PAL;
-	vip->format = formats_50[0];
-	vip->config = config;
-	mutex_init(&vip->v4l_lock);
-
-	ret = sta2x11_vip_init_controls(vip);
-	if (ret)
-		goto free_mem;
-	ret = v4l2_device_register(&pdev->dev, &vip->v4l2_dev);
-	if (ret)
-		goto free_mem;
-
-	dev_dbg(&pdev->dev, "BAR #0 at 0x%lx 0x%lx irq %d\n",
-		(unsigned long)pci_resource_start(pdev, 0),
-		(unsigned long)pci_resource_len(pdev, 0), pdev->irq);
-
-	pci_set_master(pdev);
-
-	ret = pci_request_regions(pdev, KBUILD_MODNAME);
-	if (ret)
-		goto unreg;
-
-	vip->iomem = pci_iomap(pdev, 0, 0x100);
-	if (!vip->iomem) {
-		ret = -ENOMEM;
-		goto release;
-	}
-
-	pci_enable_msi(pdev);
-
-	/* Initialize buffer */
-	ret = sta2x11_vip_init_buffer(vip);
-	if (ret)
-		goto unmap;
-
-	spin_lock_init(&vip->slock);
-
-	ret = request_irq(pdev->irq, vip_irq, IRQF_SHARED, KBUILD_MODNAME, vip);
-	if (ret) {
-		dev_err(&pdev->dev, "request_irq failed\n");
-		ret = -ENODEV;
-		goto release_buf;
-	}
-
-	/* Initialize and register video device */
-	vip->video_dev = video_dev_template;
-	vip->video_dev.v4l2_dev = &vip->v4l2_dev;
-	vip->video_dev.queue = &vip->vb_vidq;
-	vip->video_dev.lock = &vip->v4l_lock;
-	video_set_drvdata(&vip->video_dev, vip);
-
-	ret = video_register_device(&vip->video_dev, VFL_TYPE_VIDEO, -1);
-	if (ret)
-		goto vrelease;
-
-	/* Get ADV7180 subdevice */
-	vip->adapter = i2c_get_adapter(vip->config->i2c_id);
-	if (!vip->adapter) {
-		ret = -ENODEV;
-		dev_err(&pdev->dev, "no I2C adapter found\n");
-		goto vunreg;
-	}
-
-	vip->decoder = v4l2_i2c_new_subdev(&vip->v4l2_dev, vip->adapter,
-					   "adv7180", vip->config->i2c_addr,
-					   NULL);
-	if (!vip->decoder) {
-		ret = -ENODEV;
-		dev_err(&pdev->dev, "no decoder found\n");
-		goto vunreg;
-	}
-
-	i2c_put_adapter(vip->adapter);
-	v4l2_subdev_call(vip->decoder, core, init, 0);
-
-	sta2x11_vip_init_register(vip);
-
-	dev_info(&pdev->dev, "STA2X11 Video Input Port (VIP) loaded\n");
-	return 0;
-
-vunreg:
-	video_set_drvdata(&vip->video_dev, NULL);
-vrelease:
-	vb2_video_unregister_device(&vip->video_dev);
-	free_irq(pdev->irq, vip);
-release_buf:
-	pci_disable_msi(pdev);
-unmap:
-	pci_iounmap(pdev, vip->iomem);
-release:
-	pci_release_regions(pdev);
-unreg:
-	v4l2_device_unregister(&vip->v4l2_dev);
-free_mem:
-	kfree(vip);
-release_gpios:
-	vip_gpio_release(&pdev->dev, config->reset_pin, config->reset_name);
-	vip_gpio_release(&pdev->dev, config->pwr_pin, config->pwr_name);
-disable:
-	/*
-	 * do not call pci_disable_device on sta2x11 because it break all
-	 * other Bus masters on this EP
-	 */
-	return ret;
-}
-
-/**
- * sta2x11_vip_remove_one - release device
- * @pdev: PCI device
- *
- * Undo everything done in .._init_one
- *
- * unregister video device
- * free interrupt
- * unmap ioadresses
- * free memory
- * free GPIO pins
- */
-static void sta2x11_vip_remove_one(struct pci_dev *pdev)
-{
-	struct v4l2_device *v4l2_dev = pci_get_drvdata(pdev);
-	struct sta2x11_vip *vip =
-	    container_of(v4l2_dev, struct sta2x11_vip, v4l2_dev);
-
-	sta2x11_vip_clear_register(vip);
-
-	video_set_drvdata(&vip->video_dev, NULL);
-	vb2_video_unregister_device(&vip->video_dev);
-	free_irq(pdev->irq, vip);
-	pci_disable_msi(pdev);
-	pci_iounmap(pdev, vip->iomem);
-	pci_release_regions(pdev);
-
-	v4l2_device_unregister(&vip->v4l2_dev);
-
-	vip_gpio_release(&pdev->dev, vip->config->pwr_pin,
-			 vip->config->pwr_name);
-	vip_gpio_release(&pdev->dev, vip->config->reset_pin,
-			 vip->config->reset_name);
-
-	kfree(vip);
-	/*
-	 * do not call pci_disable_device on sta2x11 because it break all
-	 * other Bus masters on this EP
-	 */
-}
-
-/**
- * sta2x11_vip_suspend - set device into power save mode
- * @dev_d: PCI device
- *
- * all relevant registers are saved and an attempt to set a new state is made.
- *
- * return value: 0 always indicate success,
- * even if device could not be disabled. (workaround for hardware problem)
- */
-static int __maybe_unused sta2x11_vip_suspend(struct device *dev_d)
-{
-	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev_d);
-	struct sta2x11_vip *vip =
-	    container_of(v4l2_dev, struct sta2x11_vip, v4l2_dev);
-	unsigned long flags;
-	int i;
-
-	spin_lock_irqsave(&vip->slock, flags);
-	vip->register_save_area[0] = reg_read(vip, DVP_CTL);
-	reg_write(vip, DVP_CTL, vip->register_save_area[0] & DVP_CTL_DIS);
-	vip->register_save_area[SAVE_COUNT] = reg_read(vip, DVP_ITM);
-	reg_write(vip, DVP_ITM, 0);
-	for (i = 1; i < SAVE_COUNT; i++)
-		vip->register_save_area[i] = reg_read(vip, 4 * i);
-	for (i = 0; i < AUX_COUNT; i++)
-		vip->register_save_area[SAVE_COUNT + IRQ_COUNT + i] =
-		    reg_read(vip, registers_to_save[i]);
-	spin_unlock_irqrestore(&vip->slock, flags);
-
-	vip->disabled = 1;
-
-	pr_info("VIP: suspend\n");
-	return 0;
-}
-
-/**
- * sta2x11_vip_resume - resume device operation
- * @dev_d : PCI device
- *
- * return value: 0, no error.
- *
- * other, could not set device to power on state.
- */
-static int __maybe_unused sta2x11_vip_resume(struct device *dev_d)
-{
-	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev_d);
-	struct sta2x11_vip *vip =
-	    container_of(v4l2_dev, struct sta2x11_vip, v4l2_dev);
-	unsigned long flags;
-	int i;
-
-	pr_info("VIP: resume\n");
-
-	vip->disabled = 0;
-
-	spin_lock_irqsave(&vip->slock, flags);
-	for (i = 1; i < SAVE_COUNT; i++)
-		reg_write(vip, 4 * i, vip->register_save_area[i]);
-	for (i = 0; i < AUX_COUNT; i++)
-		reg_write(vip, registers_to_save[i],
-			  vip->register_save_area[SAVE_COUNT + IRQ_COUNT + i]);
-	reg_write(vip, DVP_CTL, vip->register_save_area[0]);
-	reg_write(vip, DVP_ITM, vip->register_save_area[SAVE_COUNT]);
-	spin_unlock_irqrestore(&vip->slock, flags);
-	return 0;
-}
-
-static const struct pci_device_id sta2x11_vip_pci_tbl[] = {
-	{PCI_DEVICE(PCI_VENDOR_ID_STMICRO, PCI_DEVICE_ID_STMICRO_VIP)},
-	{0,}
-};
-
-static SIMPLE_DEV_PM_OPS(sta2x11_vip_pm_ops,
-			 sta2x11_vip_suspend,
-			 sta2x11_vip_resume);
-
-static struct pci_driver sta2x11_vip_driver = {
-	.name = KBUILD_MODNAME,
-	.probe = sta2x11_vip_init_one,
-	.remove = sta2x11_vip_remove_one,
-	.id_table = sta2x11_vip_pci_tbl,
-	.driver.pm = &sta2x11_vip_pm_ops,
-};
-
-static int __init sta2x11_vip_init_module(void)
-{
-	return pci_register_driver(&sta2x11_vip_driver);
-}
-
-static void __exit sta2x11_vip_exit_module(void)
-{
-	pci_unregister_driver(&sta2x11_vip_driver);
-}
-
-#ifdef MODULE
-module_init(sta2x11_vip_init_module);
-module_exit(sta2x11_vip_exit_module);
-#else
-late_initcall_sync(sta2x11_vip_init_module);
-#endif
-
-MODULE_DESCRIPTION("STA2X11 Video Input Port driver");
-MODULE_AUTHOR("Wind River");
-MODULE_LICENSE("GPL v2");
-MODULE_VERSION(DRV_VERSION);
-MODULE_DEVICE_TABLE(pci, sta2x11_vip_pci_tbl);
diff --git a/drivers/media/pci/sta2x11/sta2x11_vip.h b/drivers/media/pci/sta2x11/sta2x11_vip.h
deleted file mode 100644
index de6000e7943e..000000000000
--- a/drivers/media/pci/sta2x11/sta2x11_vip.h
+++ /dev/null
@@ -1,29 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2011 Wind River Systems, Inc.
- *
- * Author:  Anders Wallin <anders.wallin@windriver.com>
- */
-
-#ifndef __STA2X11_VIP_H
-#define __STA2X11_VIP_H
-
-/**
- * struct vip_config - video input configuration data
- * @pwr_name: ADV powerdown name
- * @pwr_pin: ADV powerdown pin
- * @reset_name: ADV reset name
- * @reset_pin: ADV reset pin
- * @i2c_id: ADV i2c adapter ID
- * @i2c_addr: ADV i2c address
- */
-struct vip_config {
-	const char *pwr_name;
-	int pwr_pin;
-	const char *reset_name;
-	int reset_pin;
-	int i2c_id;
-	int i2c_addr;
-};
-
-#endif /* __STA2X11_VIP_H */
-- 
2.48.1


