Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C85C4AEA13
	for <lists+kernel-janitors@lfdr.de>; Wed,  9 Feb 2022 07:08:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232440AbiBIGHz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 9 Feb 2022 01:07:55 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:55686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237555AbiBIGDa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Feb 2022 01:03:30 -0500
Received: from smtp.smtpout.orange.fr (smtp10.smtpout.orange.fr [80.12.242.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A8FE01CCBA
        for <kernel-janitors@vger.kernel.org>; Tue,  8 Feb 2022 22:03:22 -0800 (PST)
Received: from pop-os.home ([90.126.236.122])
        by smtp.orange.fr with ESMTPA
        id Hg4QnU0tCbnFGHg4QnaWdd; Wed, 09 Feb 2022 07:03:16 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Wed, 09 Feb 2022 07:03:16 +0100
X-ME-IP: 90.126.236.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
        Lyude Paul <lyude@redhat.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Pierre Moreau <pierre.morrow@free.fr>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau: Fix a potential theorical leak in nouveau_get_backlight_name()
Date:   Wed,  9 Feb 2022 07:03:11 +0100
Message-Id: <9ba85bca59df6813dc029e743a836451d5173221.1644386541.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If successful ida_simple_get() calls are not undone when needed, some
additional memory may be allocated and wasted.

Here, an ID between 0 and MAX_INT is required. If this ID is >=100, it is
not taken into account and is wasted. It should be released.

Instead of calling ida_simple_remove(), take advantage of the 'max'
parameter to require the ID not to be too big. Should it be too big, it
is not allocated and don't need to be freed.

While at it, use ida_alloc_xxx()/ida_free() instead to
ida_simple_get()/ida_simple_remove().
The latter is deprecated and more verbose.

Fixes: db1a0ae21461 ("drm/nouveau/bl: Assign different names to interfaces")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is more a clean-up than a fix.
It is unlikely than >= 100 backlight devices will be registered, and the
over allocation would occur even much later when the underlying xarray is
full.

I also think that the 'if (bl->id >= 0)' before the ida_simple_remove()
calls are useless. We don't store the id if a negative (i.e. error) is
returned by ida_simple_get().

Finally, having a '#define BL_MAX_MINORS 99' could be better than a
magic number in the code.
---
 drivers/gpu/drm/nouveau/nouveau_backlight.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index ae2f2abc8f5a..ccd080ba30bf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -46,8 +46,8 @@ static bool
 nouveau_get_backlight_name(char backlight_name[BL_NAME_SIZE],
 			   struct nouveau_backlight *bl)
 {
-	const int nb = ida_simple_get(&bl_ida, 0, 0, GFP_KERNEL);
-	if (nb < 0 || nb >= 100)
+	const int nb = ida_alloc_max(&bl_ida, 99, GFP_KERNEL);
+	if (nb < 0)
 		return false;
 	if (nb > 0)
 		snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
@@ -414,7 +414,7 @@ nouveau_backlight_init(struct drm_connector *connector)
 					    nv_encoder, ops, &props);
 	if (IS_ERR(bl->dev)) {
 		if (bl->id >= 0)
-			ida_simple_remove(&bl_ida, bl->id);
+			ida_free(&bl_ida, bl->id);
 		ret = PTR_ERR(bl->dev);
 		goto fail_alloc;
 	}
@@ -442,7 +442,7 @@ nouveau_backlight_fini(struct drm_connector *connector)
 		return;
 
 	if (bl->id >= 0)
-		ida_simple_remove(&bl_ida, bl->id);
+		ida_free(&bl_ida, bl->id);
 
 	backlight_device_unregister(bl->dev);
 	nv_conn->backlight = NULL;
-- 
2.32.0

