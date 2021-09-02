Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4815B3FF5DF
	for <lists+kernel-janitors@lfdr.de>; Thu,  2 Sep 2021 23:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347579AbhIBVwa (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 2 Sep 2021 17:52:30 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:60192
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347582AbhIBVw1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 2 Sep 2021 17:52:27 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 1371E3F22D;
        Thu,  2 Sep 2021 21:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1630619488;
        bh=cItgUpS2AQ9mIN7Iv9RVBAc7PAHB+grKWA9BcWmqIBc=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=IPwMjkBO+TUYphxUis4Ia4y95JMr0Cy4WvMbdb91YA1ZPQV1cXwsST+vFcIfvZfEa
         slniXUFEUD3iKimJ+Xaav53XX24wBFdPxCF1cIX88P+npqUqXuFcXhMls0vWjxoDJG
         z5EJxhtPtYOJIoGNn6FmTe9R9UeDxC4jB5+hVw0s4Jmyim0qXAk6coxQ2LF4i1YeAC
         KlpfqrpCdj5PHeMCMi35kPBXK3ZxalxJGY/HqwamBG46JAcE3jTnmOP5a6jtRSWvVg
         +gjXdxPbA2lDQwVmC0vcn7Slmdi7hqU4WPUIfMocjdlg/PuR5/d3GqmBe3FdGVBIUA
         eid2uTihgfRAw==
From:   Colin King <colin.king@canonical.com>
To:     Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amdgpu: sdma: clean up identation
Date:   Thu,  2 Sep 2021 22:51:27 +0100
Message-Id: <20210902215127.55330-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a statement that is indented incorrectly. Clean it up.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index 779f5c911e11..e4a96e7e386d 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -375,10 +375,10 @@ static void sdma_v5_2_ring_emit_ib(struct amdgpu_ring *ring,
  */
 static void sdma_v5_2_ring_emit_mem_sync(struct amdgpu_ring *ring)
 {
-    uint32_t gcr_cntl =
-		    SDMA_GCR_GL2_INV | SDMA_GCR_GL2_WB | SDMA_GCR_GLM_INV |
-			SDMA_GCR_GL1_INV | SDMA_GCR_GLV_INV | SDMA_GCR_GLK_INV |
-			SDMA_GCR_GLI_INV(1);
+	uint32_t gcr_cntl = SDMA_GCR_GL2_INV | SDMA_GCR_GL2_WB |
+			    SDMA_GCR_GLM_INV | SDMA_GCR_GL1_INV |
+			    SDMA_GCR_GLV_INV | SDMA_GCR_GLK_INV |
+			    SDMA_GCR_GLI_INV(1);
 
 	/* flush entire cache L0/L1/L2, this can be optimized by performance requirement */
 	amdgpu_ring_write(ring, SDMA_PKT_HEADER_OP(SDMA_OP_GCR_REQ));
-- 
2.32.0

