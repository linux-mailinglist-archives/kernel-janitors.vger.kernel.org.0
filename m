Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5C90BE741
	for <lists+kernel-janitors@lfdr.de>; Wed, 25 Sep 2019 23:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbfIYVcx (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 25 Sep 2019 17:32:53 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:57195 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726875AbfIYVcu (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Sep 2019 17:32:50 -0400
Received: from mail-pg1-f199.google.com ([209.85.215.199])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <connor.kuehl@canonical.com>)
        id 1iDEu0-0001It-RH
        for kernel-janitors@vger.kernel.org; Wed, 25 Sep 2019 21:32:48 +0000
Received: by mail-pg1-f199.google.com with SMTP id o32so584391pgm.18
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Sep 2019 14:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=MkF7goRdpeReW9T+fX+Did5lBMAtqHM/JtXL483fHaU=;
        b=Lk8CW7lEcRL1BuOL1jc+J5ovP+FnpqwmQztzYxoQRjnGCDx/4TgPXFJtkSpmiTVCqV
         0EF/JRo5BaVUKiZconGoQY4VpBLlBAxOh9Y8/S+auqxFuCQqsv2yLwvSSQjrr6/GePTQ
         KjLaFNwCqWfU/9XnizbnDC8PepPEMpDgtzaRsI/BMllq3rqh8jeu+IzL309kkWyRpLBO
         Pa0Ukv21vayW5era17tGdUFwdHgtXglHIUIUArRwYVwMJ00EtfM0RIq/XdsOCFBMTQoL
         WHcnuU4dTRc1DY6CRf44/7PYRmqrip4n5tKoCTCkBKHwe0+yUGYqOVeAM16ttDAnvMeI
         e0yA==
X-Gm-Message-State: APjAAAXTcGkvPAgXN4jp4LgwIukdxuck2MO7UIqNsdRsGAX7Ma5jSqp5
        mDuuPrY/YfaejacZCuY/u1/2PzbhCwC320lZYJm9/dmlvaalzbvWTIcdIxJqddEjAzNpVQCI9fz
        Qx32Av41hQpy5Q9EE00q4LIHkpGQeaVXWhe7VBjeicqLTXA==
X-Received: by 2002:a63:471a:: with SMTP id u26mr1442954pga.266.1569447167541;
        Wed, 25 Sep 2019 14:32:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxZkEa7zMT3dos3IakamBasOKGUMVJ9uw/N3eJjjrq/mIxyHi0gpqxjixnecmDwARyKb7Heaw==
X-Received: by 2002:a63:471a:: with SMTP id u26mr1442937pga.266.1569447167322;
        Wed, 25 Sep 2019 14:32:47 -0700 (PDT)
Received: from localhost.localdomain (c-71-63-171-240.hsd1.or.comcast.net. [71.63.171.240])
        by smtp.gmail.com with ESMTPSA id 195sm5290313pfz.103.2019.09.25.14.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2019 14:32:46 -0700 (PDT)
From:   Connor Kuehl <connor.kuehl@canonical.com>
To:     Larry.Finger@lwfinger.net, gregkh@linuxfoundation.org,
        straube.linux@gmail.com, devel@driverdev.osuosl.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: rtl8188eu: fix possible null dereference
Date:   Wed, 25 Sep 2019 14:32:15 -0700
Message-Id: <20190925213215.25082-1-connor.kuehl@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Inside a nested 'else' block at the beginning of this function is a
call that assigns 'psta' to the return value of 'rtw_get_stainfo()'.
If 'rtw_get_stainfo()' returns NULL and the flow of control reaches
the 'else if' where 'psta' is dereferenced, then we will dereference
a NULL pointer.

Fix this by checking if 'psta' is not NULL before reading its
'psta->qos_option' data member.

Addresses-Coverity: ("Dereference null return value")

Signed-off-by: Connor Kuehl <connor.kuehl@canonical.com>
---
 drivers/staging/rtl8188eu/core/rtw_xmit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_xmit.c b/drivers/staging/rtl8188eu/core/rtw_xmit.c
index 952f2ab51347..bf8877cbe9b6 100644
--- a/drivers/staging/rtl8188eu/core/rtw_xmit.c
+++ b/drivers/staging/rtl8188eu/core/rtw_xmit.c
@@ -784,7 +784,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 			memcpy(pwlanhdr->addr2, pattrib->src, ETH_ALEN);
 			memcpy(pwlanhdr->addr3, get_bssid(pmlmepriv), ETH_ALEN);
 
-			if (psta->qos_option)
+			if (psta && psta->qos_option)
 				qos_option = true;
 		} else {
 			RT_TRACE(_module_rtl871x_xmit_c_, _drv_err_, ("fw_state:%x is not allowed to xmit frame\n", get_fwstate(pmlmepriv)));
-- 
2.17.1

