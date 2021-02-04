Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8908E30FC51
	for <lists+kernel-janitors@lfdr.de>; Thu,  4 Feb 2021 20:14:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239667AbhBDTMx (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 4 Feb 2021 14:12:53 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:60938 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239644AbhBDTMl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 4 Feb 2021 14:12:41 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1l7k2m-0001Sc-Dz; Thu, 04 Feb 2021 19:11:56 +0000
From:   Colin King <colin.king@canonical.com>
To:     Dave Airlie <airlied@redhat.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][V2] drm/mgag200: make a const array static, makes object smaller
Date:   Thu,  4 Feb 2021 19:11:56 +0000
Message-Id: <20210204191156.110778-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the const array m_div_val on the stack but instead make
it static. Makes the object code smaller by 29 bytes:

Before:
   text	   data	  bss   dec    hex filename
  34736	   4552	    0 39288   9978 drivers/gpu/drm/mgag200/mgag200_mode.o

After:
   text	   data	  bss   dec    hex filename
  34625	   4616	    0 39241   9949 drivers/gpu/drm/mgag200/mgag200_mode.o

(gcc version 10.2.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---

V2: move static declaration to the top of the declarations

---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 1dfc42170059..c3dfde8cad25 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -706,13 +706,13 @@ static int mga_g200eh_set_plls(struct mga_device *mdev, long clock)
 
 static int mga_g200er_set_plls(struct mga_device *mdev, long clock)
 {
+	static const unsigned int m_div_val[] = { 1, 2, 4, 8 };
 	unsigned int vcomax, vcomin, pllreffreq;
 	unsigned int delta, tmpdelta;
 	int testr, testn, testm, testo;
 	unsigned int p, m, n;
 	unsigned int computed, vco;
 	int tmp;
-	const unsigned int m_div_val[] = { 1, 2, 4, 8 };
 
 	m = n = p = 0;
 	vcomax = 1488000;
-- 
2.29.2

