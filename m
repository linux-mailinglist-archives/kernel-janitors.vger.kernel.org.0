Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 862D148CE6F
	for <lists+kernel-janitors@lfdr.de>; Wed, 12 Jan 2022 23:34:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234469AbiALWej (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 12 Jan 2022 17:34:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234421AbiALWei (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 12 Jan 2022 17:34:38 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C6C1C06173F;
        Wed, 12 Jan 2022 14:34:38 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id d19so6924602wrb.0;
        Wed, 12 Jan 2022 14:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=knIFhEPhfZRBuZTOWy2YoocQvDBEb01Xkzu/MBiHudY=;
        b=IrTw6c8TuH4d7FJMVb7Sqkdgr/UwcfRciuehALfn0X6nuBK0a215y3aD0OhL6nzOhJ
         X8WNL9e1EOtkp2RTv9+i53s8+HVdAxmeGRytTInW5UPaB82P0zMbKdY5expW8+3oVNPf
         JzUfm4iAkd7RDI14MdcT9wByb1VhVUYhmMWSfc8NAK11OjEx/7b1gyHwfOJTl/sf6pXN
         NxMuMUG7GWKdT9d251RK1dEdCy0Gwuz+0vVZxi4X6rwK6S7wykzmnB83l68RJ3c6ZI3a
         Fl0eKh9qKx4sL5h9qVcAB9kOSxmJMXGkLZxVGV9VYkIrtucjDlmPTMD+3Pv2ESnuIpWr
         KvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=knIFhEPhfZRBuZTOWy2YoocQvDBEb01Xkzu/MBiHudY=;
        b=LerS8t9hIp7myr0hq2pJXOml0MmXGlPBfNwHlJgCR/E1WJMlmpCmL/iWKFn2AITLoD
         GiTmv+U41rW+epvta5ox9mwWYZQS/t7pPk2VE+IOk2UREGKrm5htI1En1dHmdinW8NF0
         WC1r4Be5xT2krLwmroUGOJSZPhsgzwdIy5USyNxlCA1kGGg8NmTYGCl5Ae5s5L104Qvx
         1pkNfUbbLPBnU3xhCKYms7oZ8gxRVwsK5EpaCKMcsqTASrjXRGv14xD1ihDcgslxcHQY
         VPZz3wjHTDcfRTu4vZxbhIF/13pFojJ/2s2eQzHtTPgL1ejtS4F/Bujly05ZI0oxmFbl
         NzOQ==
X-Gm-Message-State: AOAM532FLSpwNUUDr3kIfvnuaZ9gXIVKkGBS474m2pKZ/wRm860Sqfw1
        QbRwEYyD8VHXxTO+YxmjHkpT4K8CLYpJ2nSv
X-Google-Smtp-Source: ABdhPJxr/dAp9kzCv+bTukUeT+ztHH20geBsaDAWgypGoftD/nCcRzpS44AXqFTAojplHX9JaTCfNA==
X-Received: by 2002:a5d:5848:: with SMTP id i8mr1516628wrf.398.1642026876895;
        Wed, 12 Jan 2022 14:34:36 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id t15sm895597wrz.82.2022.01.12.14.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 14:34:36 -0800 (PST)
From:   Colin Ian King <colin.i.king@gmail.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][RESEND] i915: make array flex_regs static const
Date:   Wed, 12 Jan 2022 22:34:35 +0000
Message-Id: <20220112223435.949071-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Don't populate the read-only array flex_regs on the stack but
instead it static const. Also makes the object code a little smaller.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

---

RESEND: Use correct e-mail address for sign-off and From: in e-mail.

---
 drivers/gpu/drm/i915/i915_perf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index e27f3b7cf094..df698960fdc0 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -2114,7 +2114,7 @@ gen8_update_reg_state_unlocked(const struct intel_context *ce,
 	u32 ctx_oactxctrl = stream->perf->ctx_oactxctrl_offset;
 	u32 ctx_flexeu0 = stream->perf->ctx_flexeu0_offset;
 	/* The MMIO offsets for Flex EU registers aren't contiguous */
-	i915_reg_t flex_regs[] = {
+	static const i915_reg_t flex_regs[] = {
 		EU_PERF_CNTL0,
 		EU_PERF_CNTL1,
 		EU_PERF_CNTL2,
-- 
2.33.1

