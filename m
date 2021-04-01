Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71546352054
	for <lists+kernel-janitors@lfdr.de>; Thu,  1 Apr 2021 22:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235695AbhDAUDl (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 1 Apr 2021 16:03:41 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:45358 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235655AbhDAUDc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 1 Apr 2021 16:03:32 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lRwqn-0004lS-9t; Thu, 01 Apr 2021 12:55:05 +0000
From:   Colin King <colin.king@canonical.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= 
        <thomas.hellstrom@linux.intel.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/i915: Fix an uninitialized variable issue
Date:   Thu,  1 Apr 2021 13:55:05 +0100
Message-Id: <20210401125505.2012496-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently there is a while loop that contains a handful of continue
statements that can skip over the assignment of the variable err. At
the end of the loop there is a potiential for err to be unassigned
and possibly causing issues when err is checked for a non-zero value.
Fix this by setting err to zero before the while loop starts.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: cf41a8f1dc1e ("drm/i915: Finally remove obj->mm.lock.")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index 3e248d3bd869..1e24ba872029 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -180,6 +180,7 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
 		 * the unbound/bound list until actually freed.
 		 */
 		spin_lock_irqsave(&i915->mm.obj_lock, flags);
+		err = 0;
 		while (count < target &&
 		       (obj = list_first_entry_or_null(phase->list,
 						       typeof(*obj),
@@ -202,7 +203,6 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
 
 			spin_unlock_irqrestore(&i915->mm.obj_lock, flags);
 
-			err = 0;
 			if (unsafe_drop_pages(obj, shrink)) {
 				/* May arrive from get_pages on another bo */
 				if (!ww) {
-- 
2.30.2

