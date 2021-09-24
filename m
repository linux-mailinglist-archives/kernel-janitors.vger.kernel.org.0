Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3903F417DF4
	for <lists+kernel-janitors@lfdr.de>; Sat, 25 Sep 2021 00:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244892AbhIXW6A (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 24 Sep 2021 18:58:00 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:35600
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232123AbhIXW56 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 24 Sep 2021 18:57:58 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id C75A53F357;
        Fri, 24 Sep 2021 22:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632524183;
        bh=OarWx6xOy/KHU1UmciEyVQmDM6Ujt+aKXAOoZfMNx6Y=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=ScxhRnmwaIAiTeeaPGZK5QhVHpE6R2iy9iSxeNlafTd80IpC9RIZbxxaHtyb9WXgL
         cM0Xl/9G/SSZuTJfc6+dlujXZXGd5wK28uqbwOYvACd/JfpbWig0sjZNJr7D6ltQgn
         4rSqU71ZlgAO4Np8RQd5/uj4wa0BciaPgZB9OQfpEpPJ45jRjS6UbqmEIKQTde4291
         7ipnMlIiGSo6qDJxzhdSRwnyLcTC8NcXo+vI01LqzazJZC1E4F77BEzJjq258wz2tE
         j1QVi7t/gVtQHM0W28nMNkNdg+lzcPQ0hzGYZItHszdhzbrBkr6AIe3qnLknbfVtXU
         0VYor9CeXJ1YQ==
From:   Colin King <colin.king@canonical.com>
To:     Zhenyu Wang <zhenyuw@linux.intel.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        intel-gvt-dev@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/gvt: Fix spelling mistake "Unsupport" -> "Unsupported"
Date:   Fri, 24 Sep 2021 23:56:23 +0100
Message-Id: <20210924225623.143409-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a gvt_vgpu_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index cde0a477fb49..7ed7dba42c83 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -909,7 +909,7 @@ static int update_fdi_rx_iir_status(struct intel_vgpu *vgpu,
 	else if (FDI_RX_IMR_TO_PIPE(offset) != INVALID_INDEX)
 		index = FDI_RX_IMR_TO_PIPE(offset);
 	else {
-		gvt_vgpu_err("Unsupport registers %x\n", offset);
+		gvt_vgpu_err("Unsupported registers %x\n", offset);
 		return -EINVAL;
 	}
 
-- 
2.32.0

