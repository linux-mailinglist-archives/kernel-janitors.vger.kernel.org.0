Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92B88457551
	for <lists+kernel-janitors@lfdr.de>; Fri, 19 Nov 2021 18:19:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236543AbhKSRW2 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 19 Nov 2021 12:22:28 -0500
Received: from www.linuxtv.org ([130.149.80.248]:47940 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236502AbhKSRW2 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 19 Nov 2021 12:22:28 -0500
X-Greylist: delayed 1919 seconds by postgrey-1.27 at vger.kernel.org; Fri, 19 Nov 2021 12:22:28 EST
Received: from mchehab by www.linuxtv.org with local (Exim 4.92)
        (envelope-from <mchehab@linuxtv.org>)
        id 1mo72t-002cSm-2r; Fri, 19 Nov 2021 16:47:27 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date:   Fri, 19 Nov 2021 16:12:18 +0000
Subject: [git:media_stage/master] media: drivers: cx24113: remove redundant variable r
To:     linuxtv-commits@linuxtv.org
Cc:     Colin Ian King <colin.king@canonical.com>,
        kernel-janitors@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Mail-followup-to: linux-media@vger.kernel.org
Forward-to: linux-media@vger.kernel.org
Reply-to: linux-media@vger.kernel.org
Message-Id: <E1mo72t-002cSm-2r@www.linuxtv.org>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: drivers: cx24113: remove redundant variable r
Author:  Colin Ian King <colin.king@canonical.com>
Date:    Thu Oct 14 16:12:35 2021 +0100

Variable r is being assigned values but its value was never used,
being overriden on its first usage. So, drop the initialization.

Addresses-Coverity: ("Unused value")

Link: https://lore.kernel.org/linux-media/20211014151235.62671-1-colin.king@canonical.com

Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

 drivers/media/dvb-frontends/cx24113.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

---

diff --git a/drivers/media/dvb-frontends/cx24113.c b/drivers/media/dvb-frontends/cx24113.c
index 60a9f70275f7..dd55d314bf9a 100644
--- a/drivers/media/dvb-frontends/cx24113.c
+++ b/drivers/media/dvb-frontends/cx24113.c
@@ -378,7 +378,7 @@ static void cx24113_set_nfr(struct cx24113_state *state, u16 n, s32 f, u8 r)
 
 static int cx24113_set_frequency(struct cx24113_state *state, u32 frequency)
 {
-	u8 r = 1; /* or 2 */
+	u8 r;
 	u16 n = 6;
 	s32 f = 0;
 
