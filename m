Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBBC01514F5
	for <lists+kernel-janitors@lfdr.de>; Tue,  4 Feb 2020 05:27:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727127AbgBDE1u (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 3 Feb 2020 23:27:50 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42089 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbgBDE1u (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 3 Feb 2020 23:27:50 -0500
Received: by mail-lf1-f68.google.com with SMTP id y19so11238363lfl.9
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Feb 2020 20:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:subject:from:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=5DXJZafQyQRmmbE8a6x6lpcdfOQ30RalBnjyqkaknYo=;
        b=gFp1/RDF9QejW9svL1V4sqXnHCOFbXbDYekm/kUgXoKr98wRPyu/fqwdfJMCINhIOj
         YL/cOTnxljK23Ewku4Z/YBsTjHc6NCGZbqy1iO4xCzkGku4cIYPnClj4cTgLEWnVi5BZ
         AgGjL8DDZm+Zmq9TrzJ/PTvxDAEtiBD2X7D/hVy5PP77079LrTMddYG7PAJHe1zbAxyx
         F6Q5mmNipT/lPL36VWmPXTy4m7Ks8uAnfjNVw7YIlH7/GigqSV3RlEv7kHQ+F9LxTwdU
         4gMsZahxxDZNMtBqwr2uG4TWs2UMJiCUoPF4jrOaCQ52BNAkPSdM8H/Jv7QJRh8gGbWM
         ckVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:subject:from:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=5DXJZafQyQRmmbE8a6x6lpcdfOQ30RalBnjyqkaknYo=;
        b=OWztqd1HOIzMwL6LY6XFLiVoJCb0WbyPfm3RSPC6MyqaTb8fZ42lCTXpOMjJoxCstJ
         YFZHX8zQR3t3JA6l7HluYs9aniafEYg8C5Lq+cvOmriuTtDqoVi+d+MxyFWso4qHfv5f
         LKNvH/ocd+0AvYJPRJrYje59Mw4MyLrfEpH2VtVSTcr3zQFpTklqG8sEkG4z/XJyV7Rz
         mDnElElvJ6HVXOQSgCXMdSPkypoaB4bbrYN9B+Qmk1kNV4fhlDQaQjfJ06HDi00Y4imc
         t030NCS0DJ43hbD09HN++91bcy0dncEw3jc3FfqQ0XPNxINESIvSutudhmPLpwhCHT6d
         w6wg==
X-Gm-Message-State: APjAAAXGQXzAApvsuZ71+4/GLeB4biXtZAvVJYiVQIfrbFAhJpI4WKYE
        GNvBm24ZH0wTJYyI/b1OB2vdKyP38M4=
X-Google-Smtp-Source: APXvYqxvFBh1eFX0iS078Purkh0zhqxLPv+6G+6aEGZn8xgDkrZVeJwevjeLfUnR/n4O4gbnHJuCdw==
X-Received: by 2002:a19:9d5:: with SMTP id 204mr13519851lfj.120.1580790467447;
        Mon, 03 Feb 2020 20:27:47 -0800 (PST)
Received: from ?IPv6:2001:2003:f41e:c300:224:1dff:fe12:e61a? ([2001:2003:f41e:c300:224:1dff:fe12:e61a])
        by smtp.gmail.com with ESMTPSA id h9sm5646958ljg.3.2020.02.03.20.27.46
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2020 20:27:46 -0800 (PST)
To:     kernel-janitors@vger.kernel.org
Subject: [PATCH] USB HID random timeout failures fixed by trying 20 times
From:   Lauri Jakku <ljakku77@gmail.com>
Message-ID: <d15b7fa7-596c-96f8-dd07-7831a9fa2f0e@gmail.com>
Date:   Tue, 4 Feb 2020 06:27:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

send, 20ms apart, control messages, if error is timeout.

Signed-off-by: Lauri Jakku <lja@iki.fi>
---
drivers/usb/core/message.c | 30 +++++++++++++++++++++++++-----
1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 5adf489428aa..5d615b2f92d8 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -20,6 +20,7 @@
#include <linux/usb/hcd.h> /* for usbcore internals */
#include <linux/usb/of.h>
#include <asm/byteorder.h>
+#include <linux/errno.h>

#include "usb.h"

@@ -137,7 +138,10 @@ int usb_control_msg(struct usb_device *dev, unsigned int pipe, __u8 request,
__u16 size, int timeout)
{
struct usb_ctrlrequest *dr;
- int ret;
+ int ret = -ETIMEDOUT;
+
+ /* retry_cnt * 10ms, max retry time set to 400ms */
+ int retry_cnt = 20;

dr = kmalloc(sizeof(struct usb_ctrlrequest), GFP_NOIO);
if (!dr)
@@ -149,11 +153,27 @@ int usb_control_msg(struct usb_device *dev, unsigned int pipe, __u8 request,
dr->wIndex = cpu_to_le16(index);
dr->wLength = cpu_to_le16(size);

- ret = usb_internal_control_msg(dev, pipe, dr, data, size, timeout);
+ do {
+ ret = usb_internal_control_msg(dev,
+ pipe,
+ dr,
+ data,
+ size,
+ timeout);
+
+ /*
+ * Linger a bit, prior to the next control message
+ * or if return value is timeout, but do try few
+ * times (max 200ms) before quitting.
+ */
+ if (dev->quirks & USB_QUIRK_DELAY_CTRL_MSG)
+ msleep(200);
+ else if (ret == -ETIMEDOUT)
+ msleep(20);
+
+ /* Loop while timeout, max retry_cnt times. */
+ } while ((retry_cnt-- > 0) && (ret == -ETIMEDOUT));

- /* Linger a bit, prior to the next control message. */
- if (dev->quirks & USB_QUIRK_DELAY_CTRL_MSG)
- msleep(200);

kfree(dr);

-- 
2.25.0


