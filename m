Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BABC140D429
	for <lists+kernel-janitors@lfdr.de>; Thu, 16 Sep 2021 09:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234881AbhIPH7s (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 16 Sep 2021 03:59:48 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:53726
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234767AbhIPH7o (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 16 Sep 2021 03:59:44 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id A9E9740192;
        Thu, 16 Sep 2021 07:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631779096;
        bh=7MOW+7qfNtgLsGqjeoC/U1KrOytXlAne/nGknVdF/2A=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=tHzgWX+5lebIYVHlEJwQ4gFIuzigyIzuTsK8PPir4FTXwhP8+ohjvp2HcbNOzl77+
         TDrnxHrLaZF9HnWzXPKaycJgZBocvrFTEWxoTARJ1qfi4RmMlwIGYJ1oUr77HO5rsr
         lZPMdAVnkXX2QAeWtjryiG5fDLocOGAJV59WDMjZK+cWKY9K622rQq3IhtGLwxkATV
         vFavcmDlxQH3r72c+Ni/kbiAEcdmA/sW1elhS/7CAba8mVXbc8alJLWrnj1BUAv8PQ
         k2Bp68ZRzQ5/1NaPbSK+hB97rtGIZcSOJMFP4SqnBWfmamFXz1PsWXsCwHkFh0IAVD
         /z8QjgoPchreg==
From:   Colin King <colin.king@canonical.com>
To:     VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Zack Rusin <zackr@vmware.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vmwgfx: Fix spelling mistake "vmw_surface_cach" -> "vmw_surface_cache"
Date:   Thu, 16 Sep 2021 08:58:16 +0100
Message-Id: <20210916075816.41295-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the cache argument in the comment block,
fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/vmwgfx/vmw_surface_cache.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmw_surface_cache.h b/drivers/gpu/drm/vmwgfx/vmw_surface_cache.h
index b0d87c5f58d8..e9536c901213 100644
--- a/drivers/gpu/drm/vmwgfx/vmw_surface_cache.h
+++ b/drivers/gpu/drm/vmwgfx/vmw_surface_cache.h
@@ -371,7 +371,7 @@ static inline u32 vmw_surface_subres(const struct vmw_surface_cache *cache,
  * @format: The surface format.
  * @num_mip_levels: Number of mipmap levels.
  * @num_layers: Number of layers.
- * @cache: Pointer to a struct vmw_surface_cach object to be filled in.
+ * @cache: Pointer to a struct vmw_surface_cache object to be filled in.
  *
  * Return: Zero on success, -EINVAL on invalid surface layout.
  */
-- 
2.32.0

