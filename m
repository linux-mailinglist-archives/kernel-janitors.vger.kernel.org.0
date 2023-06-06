Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C137723B4E
	for <lists+kernel-janitors@lfdr.de>; Tue,  6 Jun 2023 10:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236438AbjFFIWW (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 6 Jun 2023 04:22:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236353AbjFFIWS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Jun 2023 04:22:18 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81CC8E60
        for <kernel-janitors@vger.kernel.org>; Tue,  6 Jun 2023 01:22:13 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-307d20548adso4744157f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Jun 2023 01:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686039732; x=1688631732;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XlNLQJWAWvz38NdXMt5y5qJsDWrZdshzsnsP7Pjnj2g=;
        b=g0ld66AnZ5qEIlxCYJW04xs0rD3hAZwUTqWhnAS+uoZO2fLKWitJDkLv4Fa+W61nC6
         qIYEFcHodixbxqffGvKvjGMmHrqHgUxkeI3Q5f/t43Kol5vgzHh7kMtBvswdMUgcBey2
         7WsX4lVlsa/Ks+eMk2PiKvZNV/Ckr1UYVA4awXdJ+xEF8uTPNPtmFo4dgWH/In6sbNqW
         J2isty42kT8f86/EoE6JGA5CliTElhXmZilIYm4xFZ9eY5rm0YnX4tm0Xgxpz2F3ILHW
         RnYs5bgEhvNRHsVgqQ6t2OGqL3RFzX5qj21R9PRM5ZPkI7M8guUbcZSglCrNPhwa2Jzh
         szMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686039732; x=1688631732;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XlNLQJWAWvz38NdXMt5y5qJsDWrZdshzsnsP7Pjnj2g=;
        b=YdMxvpV6CxdUdrbyMjWqUAASS7RKs9QHGGtHsd+LUmttUrexkaln6uOP8O4CGeB7rW
         2sXqM1F1w4DZUHEGzHqxBQzFYIuHI7EnswyLm/jJ4cbBfuGXR6J4Q4sD5UJoxkpNubJ7
         f5B70FlnRCPa19pZ+gMvfzULXfLsJAk48FvaftG+ahGxvhsiLz8TlEEpvz5aXh0XcVPz
         My6CVdl1m/GbRtwWp+lKQ02N3JUbWMzXW8CFvOPXOq+ft3XIzT3HVyTCDcfBMAOv+y8W
         KOQVVDsOm50XcrDMaPM4pZChe+1sqF730MoafW+/iwPA26h8ET5iF3hukbaAh3uc3TLP
         p8Ow==
X-Gm-Message-State: AC+VfDzuxZYLopuQ6bDVkM7E+AcqvQIQZJpKBsiFdxSh51DOgstdhwPs
        N0q6wRLmxtWGwM8eHU0xO2eYqA==
X-Google-Smtp-Source: ACHHUZ6Q9maKkoIC1bVY1oVednk9d7CgN1Sha6DWf6Te7x8+ZZcW1c3aMfBpgWDDmz5oq+LO62QmkQ==
X-Received: by 2002:a5d:500a:0:b0:30a:d083:d22d with SMTP id e10-20020a5d500a000000b0030ad083d22dmr961922wrt.24.1686039732012;
        Tue, 06 Jun 2023 01:22:12 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e3-20020adfef03000000b0030e52d4c1bcsm72778wro.71.2023.06.06.01.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 01:22:10 -0700 (PDT)
Date:   Tue, 6 Jun 2023 11:22:07 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Alan Previn <alan.previn.teres.alexis@intel.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Uma Shankar <uma.shankar@intel.com>,
        Suraj Kandpal <suraj.kandpal@intel.com>,
        Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
        Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915/gsc: Fix error code in
 intel_gsc_uc_heci_cmd_submit_nonpriv()
Message-ID: <ZH7sr+Vs4zOQoouU@moroto>
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

This should return negative -EAGAIN instead of positive EAGAIN.

Fixes: e5e1e6d28ebc ("drm/i915/pxp: Add MTL helpers to submit Heci-Cmd-Packet to GSC")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
index 579c0f5a1438..42218ae6ef13 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
@@ -202,7 +202,7 @@ intel_gsc_uc_heci_cmd_submit_nonpriv(struct intel_gsc_uc *gsc,
 			if (++trials < 10)
 				goto retry;
 			else
-				err = EAGAIN;
+				err = -EAGAIN;
 		}
 	}
 	i915_gem_ww_ctx_fini(&ww);
-- 
2.30.2

