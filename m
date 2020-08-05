Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFA9323C9D9
	for <lists+kernel-janitors@lfdr.de>; Wed,  5 Aug 2020 12:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728087AbgHEKYC (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 5 Aug 2020 06:24:02 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:54720 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727972AbgHEKWI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 5 Aug 2020 06:22:08 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1k3GWt-000380-ML; Wed, 05 Aug 2020 10:20:15 +0000
From:   Colin King <colin.king@canonical.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/omap: fix spelling mistake "propert" -> "property"
Date:   Wed,  5 Aug 2020 11:20:15 +0100
Message-Id: <20200805102015.14891-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a pr_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/omapdrm/dss/venc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index e0817934ee16..0fa8f677b647 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -781,7 +781,7 @@ static int venc_probe_of(struct venc_device *venc)
 		venc->type = OMAP_DSS_VENC_TYPE_SVIDEO;
 		break;
 	default:
-		dev_err(&venc->pdev->dev, "bad channel propert '%d'\n",
+		dev_err(&venc->pdev->dev, "bad channel property '%d'\n",
 			channels);
 		r = -EINVAL;
 		goto err;
-- 
2.27.0

