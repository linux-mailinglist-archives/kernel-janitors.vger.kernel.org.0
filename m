Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38F505E6CFB
	for <lists+kernel-janitors@lfdr.de>; Thu, 22 Sep 2022 22:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbiIVUX7 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 22 Sep 2022 16:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbiIVUX6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 22 Sep 2022 16:23:58 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E7D3110EFF;
        Thu, 22 Sep 2022 13:23:57 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id g3so17244756wrq.13;
        Thu, 22 Sep 2022 13:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=+2wEh3WqE1UPPivBT67hsuwj5Z+xEmJEnWlrZNS8rx8=;
        b=ikd5Szt2FhwWcMNJrGCDBjLEqoe8jIj2NTahYdL87VRwuKYQ7xOQO109lgWAwIuZKI
         hu6acIBgwi9Ma0KIK86FeJv0iUWz1DlVGZqlGoN0/U3IFvsBKCMNbPbKMvs7zyemoDHE
         6BfdGMN3FHIyKeqj4n5Jerg0Rxe0hTZ1BR0MVSRz88Xkx82BcaQGGbhxTCOqucPvjeBy
         e2hiPoYDUAGUoPbdNQXrDzI0XXn0yqTrMcplQZMZFH0KmbKscuimYZi7exKTHFpOqJwM
         hTrKfxNAEYX8gG+knfTf/7QfwfZ57ckavFcpaEqnK59gZ0noO3Snqz+f8MIA+Rq954tS
         jOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=+2wEh3WqE1UPPivBT67hsuwj5Z+xEmJEnWlrZNS8rx8=;
        b=j6N8Fab+wqdqrWg6BtUIWMIx9k1Go7UtjrWf/thupUQJRg/RLK0IhvGdk3OKflaB2n
         L3LU6nUwu4P+dPW/z6v4uUvhOfk32w3TajRIFijetsdPmZFT0WhRCXimdmMkc1mprCB6
         eHCxK7H29pwDYcNArm/Lj+uenMrTeZBvREk0M92z8TFsEMOHOfcr+r7aWr58EsqqKLC7
         9b3Kw4ddUnSq0GcA6muU/AYi2JIaUVlWXM2IF/qLCegVcZCB0ppBrJnQP1i8ATAgLeLr
         OfaEHwpkBnIztqrfTPnQcEZSBUOEc9vbuJiwqU1sWpAeatE5uB0AWAvJ4Jr8w3JSVsEA
         Ks6w==
X-Gm-Message-State: ACrzQf3rX3Tdd+97SEsHu0Z0y92IsyaaU6uJuIfV6VnTrPUEI8HzccLb
        b8pNHY/WXS1j8Xa+DRMzgvQ=
X-Google-Smtp-Source: AMsMyM4a0qwhA26q6LRWbALbKOZ/AtCsNhByKmT//UDEz8gzuLR3JMTbyexpEdapXxLDTZJWzV6nqQ==
X-Received: by 2002:adf:9795:0:b0:22a:f421:5d0f with SMTP id s21-20020adf9795000000b0022af4215d0fmr3117691wrb.644.1663878235728;
        Thu, 22 Sep 2022 13:23:55 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id bg34-20020a05600c3ca200b003b4ff30e566sm5092355wmb.3.2022.09.22.13.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 13:23:55 -0700 (PDT)
From:   Colin Ian King <colin.i.king@gmail.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: Remove redundant assignments to variable count
Date:   Thu, 22 Sep 2022 21:23:54 +0100
Message-Id: <20220922202354.2465482-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The variable count is assigned a value but it is never read. The
assignment is redundant and can be removed.

Cleans up two clang scan build warnings:
warning: Value stored to 'count' is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/drm_crtc_helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 457448cc60f7..2467df7a7a95 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -632,7 +632,6 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 	}
 
 	/* a) traverse passed in connector list and get encoders for them */
-	count = 0;
 	drm_connector_list_iter_begin(dev, &conn_iter);
 	drm_for_each_connector_iter(connector, &conn_iter) {
 		const struct drm_connector_helper_funcs *connector_funcs =
@@ -678,7 +677,6 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 		goto fail;
 	}
 
-	count = 0;
 	drm_connector_list_iter_begin(dev, &conn_iter);
 	drm_for_each_connector_iter(connector, &conn_iter) {
 		if (!connector->encoder)
-- 
2.37.1

