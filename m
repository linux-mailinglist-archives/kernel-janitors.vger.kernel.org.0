Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1CB1A96A1
	for <lists+kernel-janitors@lfdr.de>; Wed, 15 Apr 2020 10:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404970AbgDOIed (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 15 Apr 2020 04:34:33 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:53715 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbgDOIe2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 Apr 2020 04:34:28 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jOdUy-00031X-KU; Wed, 15 Apr 2020 08:34:20 +0000
From:   Colin King <colin.king@canonical.com>
To:     Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/rockchip: fix spelling mistake "modifer" -> "modifier"
Date:   Wed, 15 Apr 2020 09:34:20 +0100
Message-Id: <20200415083420.366279-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a DRM_DEBUG_KMS debug message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index b87d22eb6ae1..33463b79a37b 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -769,7 +769,7 @@ static bool rockchip_mod_supported(struct drm_plane *plane,
 		return true;
 
 	if (!rockchip_afbc(modifier)) {
-		DRM_DEBUG_KMS("Unsupported format modifer 0x%llx\n", modifier);
+		DRM_DEBUG_KMS("Unsupported format modifier 0x%llx\n", modifier);
 
 		return false;
 	}
-- 
2.25.1

