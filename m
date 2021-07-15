Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 518EF3CA0CE
	for <lists+kernel-janitors@lfdr.de>; Thu, 15 Jul 2021 16:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236342AbhGOOkg (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 15 Jul 2021 10:40:36 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:47224
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232420AbhGOOkg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 15 Jul 2021 10:40:36 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 0713340667;
        Thu, 15 Jul 2021 14:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1626359861;
        bh=JGcQEchEiku0wkt2P19S6Q7dycfr5k0NIGTesruM8js=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=bLTnesM6OtRMkaqTN7QhzDq/u9TnRysWShkqaruogOp6YEL4xeJa6wTFcC/VzlyAh
         grEu6tc6wvczn9CP7VkcChjAXckNAAIL0Ai7Lf1aMmUu9qBckAKeggxrM0L3i57hmu
         0YF/N1qAEWFpK6AoqP9IPtPgJjANQ5fAhQyrZyvVEn3fKhdBJWYmEnzRDsJQFT7Sr9
         MP4pL9UwUHNkBA1HUvelcTQ4GYDoAsp96G3OCRHE56sAfo1WQBddBudISG4Kr9YQ9G
         hkG3xnM0OYDAS8+B6iRgH62Kcn84hpY0pQnuCdaa1RYFpySJxFOBY4eNcNZdnKJWQc
         mfBYjUTM/y+EQ==
From:   Colin King <colin.king@canonical.com>
To:     Harry Wentland <harry.wentland@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu/display: make a const array common_rates static, makes object smaller
Date:   Thu, 15 Jul 2021 15:37:40 +0100
Message-Id: <20210715143740.28403-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the const array common_rates on the stack but instead it
static. Makes the object code smaller by 80 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
 268019	  98322	    256	 366597	  59805	../display/amdgpu_dm/amdgpu_dm.o

After:
   text	   data	    bss	    dec	    hex	filename
 267843	  98418	    256	 366517	  597b5	../display/amdgpu_dm/amdgpu_dm.o

Reduction of 80 bytes

(gcc version 10.3.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 2d48bb09645f..b196bb6eafc0 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7580,8 +7580,10 @@ static uint add_fs_modes(struct amdgpu_dm_connector *aconnector)
 	 * 60 	    - Commonly used
 	 * 48,72,96 - Multiples of 24
 	 */
-	const uint32_t common_rates[] = { 23976, 24000, 25000, 29970, 30000,
-					 48000, 50000, 60000, 72000, 96000 };
+	static const uint32_t common_rates[] = {
+		23976, 24000, 25000, 29970, 30000,
+		48000, 50000, 60000, 72000, 96000
+	};
 
 	/*
 	 * Find mode with highest refresh rate with the same resolution
-- 
2.31.1

