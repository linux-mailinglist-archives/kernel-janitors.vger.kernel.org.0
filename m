Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 162833726FF
	for <lists+kernel-janitors@lfdr.de>; Tue,  4 May 2021 10:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbhEDIO3 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 4 May 2021 04:14:29 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:60607 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbhEDIO2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 4 May 2021 04:14:28 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1ldqBP-0005qO-J5; Tue, 04 May 2021 08:13:31 +0000
From:   Colin King <colin.king@canonical.com>
To:     Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Lyude Paul <lyude@redhat.com>,
        dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/nouveau/nvkm: Fix spelling mistake "endianess" -> "endianness"
Date:   Tue,  4 May 2021 09:13:30 +0100
Message-Id: <20210504081330.66310-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a nvdev_error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index b930f539feec..68d58d52eeef 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2891,7 +2891,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 		/* switch mmio to cpu's native endianness */
 		if (!nvkm_device_endianness(device)) {
 			nvdev_error(device,
-				    "Couldn't switch GPU to CPUs endianess\n");
+				    "Couldn't switch GPU to CPUs endianness\n");
 			ret = -ENOSYS;
 			goto done;
 		}
-- 
2.30.2

