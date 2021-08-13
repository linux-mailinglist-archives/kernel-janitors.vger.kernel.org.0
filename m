Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3B13EBB22
	for <lists+kernel-janitors@lfdr.de>; Fri, 13 Aug 2021 19:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbhHMROR (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 13 Aug 2021 13:14:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:35360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230131AbhHMROB (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 Aug 2021 13:14:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8BA1C60F91;
        Fri, 13 Aug 2021 17:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628874734;
        bh=E0Rd8uuRj9V4s/5yGBq/lhcjLlVd74GgQ8rhT3/6j30=;
        h=From:To:Cc:Subject:Date:From;
        b=I7vDjYOooR5E8ZiW45+6N1xtm/mJrPRPb5euk0MUhVfuKc70li+mGDWSl7rEqCNal
         VOtH/VfAENMm4DX3NV4NI8HNHpB46LuykNqvljA4xEcq7/Z7tMVdIeB5wFE5U/0Zzo
         l61AEPIU5XtzQWTdyhg8ApGEA6dRaNgVKR664feL0ft0K7tZOqDRQdG/FVG2Ecq3Tj
         64Tr224tTPLOsuEDF/gAW+MU7ag0UPygynlPfj+okX6sLHym8ICUpFCs+x3g45WTvb
         Iys7/GqrN7KogTtmrhw+RCePqdi27xK/Fm50R3tzBkITRLVa16ByxeVWOhExaWgG8B
         W7Z7wDEHg+9BA==
From:   Nathan Chancellor <nathan@kernel.org>
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc:     John Harrison <John.C.Harrison@Intel.com>,
        Matthew Brost <matthew.brost@intel.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        kernel-janitors@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] drm/i915/selftest: Fix use of err in igt_reset_{fail,nop}_engine()
Date:   Fri, 13 Aug 2021 10:11:58 -0700
Message-Id: <20210813171158.2665823-1-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0.rc2
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Clang warns:

In file included from drivers/gpu/drm/i915/gt/intel_reset.c:1514:
drivers/gpu/drm/i915/gt/selftest_hangcheck.c:465:62: warning: variable
'err' is uninitialized when used here [-Wuninitialized]
        pr_err("[%s] Create context failed: %d!\n", engine->name, err);
                                                                  ^~~
...
drivers/gpu/drm/i915/gt/selftest_hangcheck.c:580:62: warning: variable
'err' is uninitialized when used here [-Wuninitialized]
        pr_err("[%s] Create context failed: %d!\n", engine->name, err);
                                                                  ^~~
...
2 warnings generated.

This appears to be a copy and paste issue. Use ce directly using the %pe
specifier to pretty print the error code so that err is not used
uninitialized in these functions.

Fixes: 3a7b72665ea5 ("drm/i915/selftest: Bump selftest timeouts for hangcheck")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
index 08f011f893b2..2c1ed32ca5ac 100644
--- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
@@ -462,7 +462,7 @@ static int igt_reset_nop_engine(void *arg)
 
 		ce = intel_context_create(engine);
 		if (IS_ERR(ce)) {
-			pr_err("[%s] Create context failed: %d!\n", engine->name, err);
+			pr_err("[%s] Create context failed: %pe!\n", engine->name, ce);
 			return PTR_ERR(ce);
 		}
 
@@ -577,7 +577,7 @@ static int igt_reset_fail_engine(void *arg)
 
 		ce = intel_context_create(engine);
 		if (IS_ERR(ce)) {
-			pr_err("[%s] Create context failed: %d!\n", engine->name, err);
+			pr_err("[%s] Create context failed: %pe!\n", engine->name, ce);
 			return PTR_ERR(ce);
 		}
 

base-commit: 927dfdd09d8c03ba100ed0c8c3915f8e1d1f5556
-- 
2.33.0.rc2

