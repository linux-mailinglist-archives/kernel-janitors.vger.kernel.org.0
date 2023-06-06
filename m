Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAC21723B41
	for <lists+kernel-janitors@lfdr.de>; Tue,  6 Jun 2023 10:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236108AbjFFIVC (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 6 Jun 2023 04:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230220AbjFFIVC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Jun 2023 04:21:02 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86A92E8
        for <kernel-janitors@vger.kernel.org>; Tue,  6 Jun 2023 01:21:00 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f732d37d7bso23702715e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Jun 2023 01:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686039659; x=1688631659;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Kl2SGPQADOhKcanYsaBKh7yuEnf252iZC93BIhwML4=;
        b=m+vmg4KGLsBWBcNTTNJVnYGL61y7eFB5pPTKI5dP3KbeRaYZYtEEeLcAT0tkmq5SK7
         xZA44k91DJ+9dco0589HYPNpyh1l1SebNYKvc4N889P+5RVdTu5Sh8WbtkS2hhPbqIOs
         1MzcXFZDpiyXAOfFdXlYjWq8oWRwK6ZPXFeffPFGeqbaF6PVVdDUD512HN9Qo+b5DLDX
         Lv3EYznxNS76D0CWrPnyipKuRbioxe4PZwnJEo+Wszsm57aLq3pE2mvb4qM6YEnbsOVG
         dPL4XTkMBnkTKUsWZz/zkGExbDCa+RTpcWZB08U26jIZnpG1Li5TZHsCXQK2u2342OLD
         nfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686039659; x=1688631659;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Kl2SGPQADOhKcanYsaBKh7yuEnf252iZC93BIhwML4=;
        b=WLSZPp6idNtsiDVuLgIkh00MvKTpYK1jfndR1P4WKV21eSt3DlGEL2MGEnVN1KUs8W
         jMe8d5PoKrXI5yKbMy0m9pqBYltUy13YizulppaOO71uDg+ZVlZ5ANmhVF7iSQwdfOki
         2vaUkg4rGWm4AyCi0hqRRINmKYL6zkh99W9w3eou9hr5FdsY1Wu+tesGxG9JLFBfaOL1
         jWi6mVUcBRcrGVwRfvB+s+sllg/7AgU0vpICM4yoUEel4s47DsF+xX+7Cdi76l7GuCA/
         IL28BdoaGOZh8AzPKWujems7wIrI7MWc24o+IT+oK6IgG2ZEBBF4ATHefxYeikHWAB/N
         mCkw==
X-Gm-Message-State: AC+VfDyV57tpMKmYw81VyLxJ6hpP+1AqXtzS+58Uinn5HaRvKK0IFCFU
        gK56TTm2eJJNqAKiKHG6HZ2pHg==
X-Google-Smtp-Source: ACHHUZ7koJgjVH2uEuQjMoE3vdZFfk4iMH3IMEVh/G6HBjDkcveO3TyDcipp5TEc3omMimlgdQwoKQ==
X-Received: by 2002:a05:600c:378d:b0:3f4:23d4:e48 with SMTP id o13-20020a05600c378d00b003f423d40e48mr1291844wmr.23.1686039659038;
        Tue, 06 Jun 2023 01:20:59 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t14-20020a7bc3ce000000b003f60e143d38sm13136207wmj.11.2023.06.06.01.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 01:20:57 -0700 (PDT)
Date:   Tue, 6 Jun 2023 11:20:54 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] HID: fix an error code in hid_check_device_match()
Message-ID: <ZH7sZv4PEovkMxNP@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The hid_check_device_match() returns true if we find a match and false
if we don't.  But here it returns -ENODEV which becomes true instead
of false.

Fixes: 207733f92661 ("HID: split apart hid_device_probe to make logic more apparent")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hid/hid-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 4b7062dcefec..8992e3c1e769 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2593,7 +2593,7 @@ static bool hid_check_device_match(struct hid_device *hdev,
 {
 	*id = hid_match_device(hdev, hdrv);
 	if (!*id)
-		return -ENODEV;
+		return false;
 
 	if (hdrv->match)
 		return hdrv->match(hdev, hid_ignore_special_drivers);
-- 
2.30.2

