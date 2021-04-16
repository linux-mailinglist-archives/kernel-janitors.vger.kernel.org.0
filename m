Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B9D6361DD0
	for <lists+kernel-janitors@lfdr.de>; Fri, 16 Apr 2021 12:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240783AbhDPKMP (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 16 Apr 2021 06:12:15 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33005 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239216AbhDPKMO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 16 Apr 2021 06:12:14 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lXLRy-0004xn-Id; Fri, 16 Apr 2021 10:11:46 +0000
From:   Colin King <colin.king@canonical.com>
To:     Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu/pm: use linux/processor.h instead of asm/processor.h
Date:   Fri, 16 Apr 2021 11:11:46 +0100
Message-Id: <20210416101146.2034010-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Checkpatch reported that linux/processor.h should be included instead
of the asm variant. Fix this to clean up the warning.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index 204e34549013..6842dd483c2a 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -33,7 +33,7 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/nospec.h>
 #include <linux/pm_runtime.h>
-#include <asm/processor.h>
+#include <linux/processor.h>
 #include "hwmgr.h"
 
 static const struct cg_flag_name clocks[] = {
-- 
2.30.2

