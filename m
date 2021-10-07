Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDB3425287
	for <lists+kernel-janitors@lfdr.de>; Thu,  7 Oct 2021 14:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241188AbhJGMId (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 7 Oct 2021 08:08:33 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:37478
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241185AbhJGMIc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 7 Oct 2021 08:08:32 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 2965F3FFF1;
        Thu,  7 Oct 2021 12:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633608398;
        bh=SYNiC1Bmjm6dMpjE54zivbQWUBIDEpK4EbYx3DBOl5A=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=p/aatMn3SIjGyQjdVCdkZ4nhYhC4IGKSagUfPukEyC6l/0v/Y0IE2Jbl9ZoQQgUvC
         58G8vzG7iCDh/5exqkMslZHdTERoFzKyO3SKf1G9SwFYUWKsApHCVpJ8PtvORUHwvO
         5dglzIyZ89oTsAyD34QQLY5FcAK+IckxirfL8bXlbTwE6gdNNlkDHcKqRw5DVDCdVF
         xj6XJ2c/Sce+YqkevoJup5cRPjkG55trVfljqscJt0GWNt4/yq1fW+WYOHTp3A0Rtr
         RkoG5hvv/sDDeWbhODKRD2qGZzVPvJI+39Zf3EUtnic/FoEnk5u6geCUaRHlByUBNi
         P5M3G6daKGvVg==
From:   Colin King <colin.king@canonical.com>
To:     Harry Wentland <harry.wentland@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amd/display: Remove redundant initialization of variable result
Date:   Thu,  7 Oct 2021 13:06:37 +0100
Message-Id: <20211007120637.14459-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable result is being initialized with a value that is never
read, it is being updated immediately afterwards in both branches
of an if statement. The assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c
index 6936b9d549e5..8387767ec1b3 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c
@@ -774,7 +774,7 @@ static enum link_training_result dpia_training_eq_phase(struct dc_link *link,
 		struct link_training_settings *lt_settings,
 		uint32_t hop)
 {
-	enum link_training_result result = LINK_TRAINING_EQ_FAIL_EQ;
+	enum link_training_result result;
 
 	if (link->lttpr_mode == LTTPR_MODE_NON_TRANSPARENT)
 		result = dpia_training_eq_non_transparent(link, lt_settings, hop);
-- 
2.32.0

