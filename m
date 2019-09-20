Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FAA6B8E04
	for <lists+kernel-janitors@lfdr.de>; Fri, 20 Sep 2019 11:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408578AbfITJsK (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 20 Sep 2019 05:48:10 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:43172 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405677AbfITJsK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 Sep 2019 05:48:10 -0400
Received: from mail-wm1-f72.google.com ([209.85.128.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <connor.kuehl@canonical.com>)
        id 1iBFWL-0005Ar-1A
        for kernel-janitors@vger.kernel.org; Fri, 20 Sep 2019 09:48:09 +0000
Received: by mail-wm1-f72.google.com with SMTP id m6so846438wmf.2
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Sep 2019 02:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=B0gRBX2sU0Z6OKmHo7Z4yIU03olB4csImxHyIILBwAA=;
        b=eSl42NXxQpqgJBgamPym22M58kxGoClAy8YyG2Zr08hiei16+2NzTeWDdas2IRV85F
         yM6jQ3lWRjKfMfpsc4QaBviCm3UEuW1JftiZN0f5FpC5RMm9CTryl+NWRLZ6/Jvn8dSI
         wgmci/3n/OuManVZHegb4akx9aub2UDt451IjBwEehx+dER9qD648vv1SP5U+YamQ1rt
         IYzhrJ6uCw9Ga/BtatCDDzluFLxTUhPyVZHJlPKTzmT9T/SheiQdNRHSDTmQk4VWx34K
         vtJj/rfiyy8aeXONVkRUCFHYMpoYDr/oCTPUY2At7x4v5xF1PK5LEFHYJ4EaFd480eR8
         PUUQ==
X-Gm-Message-State: APjAAAUtgKqq+Zz50Br5HtcdK5cEnt/4N9+SFEI3iNKfjCoc8KhOk3jc
        jxAuJbxuL/xnJipH7EWrTJfAH+V6IBkbNT3FDae41zRS7rKXHitlAEFtqZAfjbMAbkJyJ49qRaE
        y/Vji2Jh1hS3RyKSMcH6/ocMWOcbvqVeVQP5nDph1O3YZkA==
X-Received: by 2002:a5d:430f:: with SMTP id h15mr11239561wrq.177.1568972888806;
        Fri, 20 Sep 2019 02:48:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxVRY04L0KSUugiU+ntxgo+Wvpl8BGaO0LusgrffrFde1j3tGSNP2BDAc7riJC99gqoaqgZaw==
X-Received: by 2002:a5d:430f:: with SMTP id h15mr11239545wrq.177.1568972888657;
        Fri, 20 Sep 2019 02:48:08 -0700 (PDT)
Received: from canonical.c.hoisthospitality.com (static-dcd-cqq-121001.business.bouyguestelecom.com. [212.194.121.1])
        by smtp.gmail.com with ESMTPSA id z9sm2104375wrp.26.2019.09.20.02.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2019 02:48:07 -0700 (PDT)
From:   Connor Kuehl <connor.kuehl@canonical.com>
To:     Larry.Finger@lwfinger.net, gregkh@linuxfoundation.org,
        straube.linux@gmail.com, devel@driverdev.osuosl.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: rtl8188eu: remove unnecessary self-assignment
Date:   Fri, 20 Sep 2019 11:48:07 +0200
Message-Id: <20190920094807.9217-1-connor.kuehl@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This is a self-assignment which is redundant. Fix this by removing the
self-assignment.

Addresses-Coverity: ("Self assignment")

Signed-off-by: Connor Kuehl <connor.kuehl@canonical.com>
---
 drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
index 086f98d38cba..57ae0e83dd3e 100644
--- a/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
@@ -552,7 +552,6 @@ void Hal_ReadAntennaDiversity88E(struct adapter *pAdapter, u8 *PROMContent, bool
 			pHalData->AntDivCfg = 1; /*  0xC1[3] is ignored. */
 	} else {
 		pHalData->AntDivCfg = 0;
-		pHalData->TRxAntDivType = pHalData->TRxAntDivType; /*  The value in the driver setting of device manager. */
 	}
 	DBG_88E("EEPROM : AntDivCfg = %x, TRxAntDivType = %x\n", pHalData->AntDivCfg, pHalData->TRxAntDivType);
 }
-- 
2.17.1

