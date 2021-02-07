Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB56531280D
	for <lists+kernel-janitors@lfdr.de>; Mon,  8 Feb 2021 00:08:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhBGXIg (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 7 Feb 2021 18:08:36 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:36436 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbhBGXIf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 7 Feb 2021 18:08:35 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1l8t9j-0000D0-N5; Sun, 07 Feb 2021 23:07:51 +0000
From:   Colin King <colin.king@canonical.com>
To:     Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Huang Rui <ray.huang@amd.com>,
        Junwei Zhang <Jerry.Zhang@amd.com>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: fix potential integer overflow on shift of a int
Date:   Sun,  7 Feb 2021 23:07:51 +0000
Message-Id: <20210207230751.8576-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The left shift of int 32 bit integer constant 1 is evaluated using 32
bit arithmetic and then assigned to an unsigned 64 bit integer. In the
case where *frag is 32 or more this can lead to an oveflow.  Avoid this
by shifting 1ULL.

Addresses-Coverity: ("Unintentional integer overflow")
Fixes: dfcd99f6273e ("drm/amdgpu: meld together VM fragment and huge page handling")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 9d19078246c8..53a925600510 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1412,7 +1412,7 @@ static void amdgpu_vm_fragment(struct amdgpu_vm_update_params *params,
 		*frag = max_frag;
 		*frag_end = end & ~((1ULL << max_frag) - 1);
 	} else {
-		*frag_end = start + (1 << *frag);
+		*frag_end = start + (1ULL << *frag);
 	}
 }
 
-- 
2.29.2

