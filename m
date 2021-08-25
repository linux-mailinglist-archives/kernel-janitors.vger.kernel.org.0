Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 637723F7471
	for <lists+kernel-janitors@lfdr.de>; Wed, 25 Aug 2021 13:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239643AbhHYLhF (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 25 Aug 2021 07:37:05 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:38870
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237446AbhHYLhD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Aug 2021 07:37:03 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 47F213F072;
        Wed, 25 Aug 2021 11:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629891375;
        bh=zo+G5iadB49U+2sdl2YTpWA23bkDMXVrOHPwSen0oq8=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=FnQLClw4ahcH9/00HhmoJhcdDd+0cBFgoPxvqa70H6459yZvUVYYLECLM2dvY+5+L
         UAlZicYe/dYaE5jK7OsWTZh7z2AgWFGi4Y8F4jQXhdZRZXetwYaX1KXlQEcNJepDF4
         HHn6GoTh6IJ10cLIgmTZubqCwD0ILAziOet+6eFS9mon/cmtHRFyElpjt4nBonQRVc
         0S4/Mykc3sj76Rm4Yg5ATdxVAQj6JJkWy7I7+3ffXUZtvQ4fqRCiIvNoDqbkMTmFYd
         2G/Qw7/Qxa1XtBomhZ5BQCbSS4LJv31PTpPhhcDN10C0a5gmlqi8IEp793lfn72Q+X
         sBVJ8nnbbWztw==
From:   Colin King <colin.king@canonical.com>
To:     Harry Wentland <harry.wentland@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amd/display: fix spelling mistake "alidation" -> "validation"
Date:   Wed, 25 Aug 2021 12:36:15 +0100
Message-Id: <20210825113615.14555-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a DC_LOG_WARNING message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
index 3223a1ff2292..91cbc0922ad4 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
@@ -1999,7 +1999,7 @@ bool dcn31_validate_bandwidth(struct dc *dc,
 	goto validate_out;
 
 validate_fail:
-	DC_LOG_WARNING("Mode Validation Warning: %s failed alidation.\n",
+	DC_LOG_WARNING("Mode Validation Warning: %s failed validation.\n",
 		dml_get_status_message(context->bw_ctx.dml.vba.ValidationStatus[context->bw_ctx.dml.vba.soc.num_states]));
 
 	BW_VAL_TRACE_SKIP(fail);
-- 
2.32.0

