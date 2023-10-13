Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC9857C7E73
	for <lists+kernel-janitors@lfdr.de>; Fri, 13 Oct 2023 09:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbjJMHRR (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 13 Oct 2023 03:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbjJMHRQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 Oct 2023 03:17:16 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C20FBB8
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Oct 2023 00:17:14 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-406609df1a6so18941505e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Oct 2023 00:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697181433; x=1697786233; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kWaFz4n8BLo1UJoI34jBeJHgdxXO/CE+i3BR2uQsDEA=;
        b=AQjFVp0SQ8uqfvjqEqLuY3mfJ3Dgv9219p/qdwBeBcyBrfLgT0ZYnRJTxuufyElCMm
         MNReCjF+QiM/whxbFUEVJ+C+cTzogpWOR2yn7on1+8/yTQMLcEcyJ5rWz+Azn+gM8zqf
         wE1HHF+eqZzVa2ll2JqmN3aeIPoHUuMbzvupEWAkyU7LDi/sAPDw4gSEkk1jhjBEWjk3
         VPeettWomLhknGQzf86jNmzoSZDb0xIA40sQREDB3SEKGYAPQecuTx+wI2rYqFll1DnG
         FgPnYrsmhE8+ghPD0qnvpmhbx0mmxWhV2gfdo+SsadpsH+Kd5dZOIorpCISt2Yt5BNnv
         j9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697181433; x=1697786233;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kWaFz4n8BLo1UJoI34jBeJHgdxXO/CE+i3BR2uQsDEA=;
        b=ZxVN7oprkKyi31CC9JgUbphMCW803YJD1TwfVxIEyTohEHXifDiCdDubyrMLfmzVs+
         cBeEbYVjwQ3LdggjBUXaYDRJI8itdTg9QMbQ98Y/mITxS36uVKDEC+1J9Q3zZOBARZw9
         9Lls5H2Cz/mI84mtQDpUIlEvAa33AejQ8/rYQ95toh+bhT20J41VPVF6kJebphE/vScV
         cyhjvdORdNhMdRm1UAXRHv45Go20P67+P10d728znxqxeCpxUz/g9L2iX638rmgYTEPF
         MpVC7sRgO3A/sfZde0l6Ge98v21H53AssxuzbBPt85Lk+6rtA32FpDt41X77ADtD7LVr
         z8lA==
X-Gm-Message-State: AOJu0YzCDV02zXNLzZDWdkdPoluFEI3UYdMRIi1sxsIIZ4vZ+GcZYrQq
        EGPayPMezlT4zZ20S/CgLyBLIg==
X-Google-Smtp-Source: AGHT+IEMChUF1nF5n5VUZpjuNffyhQxqCtCzn921jYAb9ji1wXEYdUyTy8LrYKKnYNgqSRFV3TqNLg==
X-Received: by 2002:a1c:7c0a:0:b0:405:39c1:a98b with SMTP id x10-20020a1c7c0a000000b0040539c1a98bmr22624232wmc.20.1697181433171;
        Fri, 13 Oct 2023 00:17:13 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y11-20020a05600c20cb00b0040531f5c51asm1751016wmm.5.2023.10.13.00.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 00:17:12 -0700 (PDT)
Date:   Fri, 13 Oct 2023 10:17:08 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Su Hui <suhui@nfschina.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/msm: remove unnecessary NULL check
Message-ID: <5de18b71-c3db-4820-b35e-262b4cac35fc@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This NULL check was required when it was added, but we shuffled the code
around in commit 1f50db2f3e1e ("drm/msm/mdp5: move resource allocation
to the _probe function") and now it's not.  The inconsistent NULL
checking triggers a Smatch warning:

    drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:847 mdp5_init() warn:
    variable dereferenced before check 'mdp5_kms' (see line 782)

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 11d9fc2c6bf5..ec933d597e20 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -844,8 +844,7 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 
 	return 0;
 fail:
-	if (mdp5_kms)
-		mdp5_destroy(mdp5_kms);
+	mdp5_destroy(mdp5_kms);
 	return ret;
 }
 
-- 
2.39.2

