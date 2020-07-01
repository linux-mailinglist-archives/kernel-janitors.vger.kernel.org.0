Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE96210E32
	for <lists+kernel-janitors@lfdr.de>; Wed,  1 Jul 2020 16:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731529AbgGAO7K (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 1 Jul 2020 10:59:10 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:34831 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726854AbgGAO7K (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 1 Jul 2020 10:59:10 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jqeCX-000869-7b; Wed, 01 Jul 2020 14:59:05 +0000
From:   Colin King <colin.king@canonical.com>
To:     Harry Wentland <harry.wentland@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: remove redundant initialization of variable result
Date:   Wed,  1 Jul 2020 15:59:05 +0100
Message-Id: <20200701145905.551367-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable result is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
index 1b3474aa380d..d0a23b72e604 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
@@ -151,7 +151,8 @@ bool edp_receiver_ready_T9(struct dc_link *link)
 	unsigned int tries = 0;
 	unsigned char sinkstatus = 0;
 	unsigned char edpRev = 0;
-	enum dc_status result = DC_OK;
+	enum dc_status result;
+
 	result = core_link_read_dpcd(link, DP_EDP_DPCD_REV, &edpRev, sizeof(edpRev));
 
      /* start from eDP version 1.2, SINK_STAUS indicate the sink is ready.*/
@@ -177,7 +178,7 @@ bool edp_receiver_ready_T7(struct dc_link *link)
 {
 	unsigned char sinkstatus = 0;
 	unsigned char edpRev = 0;
-	enum dc_status result = DC_OK;
+	enum dc_status result;
 
 	/* use absolute time stamp to constrain max T7*/
 	unsigned long long enter_timestamp = 0;
-- 
2.27.0

