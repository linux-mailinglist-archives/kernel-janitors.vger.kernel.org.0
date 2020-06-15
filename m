Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A00ED1F9961
	for <lists+kernel-janitors@lfdr.de>; Mon, 15 Jun 2020 15:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730071AbgFON41 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 15 Jun 2020 09:56:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729955AbgFON4Q (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 Jun 2020 09:56:16 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E82E0C061A0E
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Jun 2020 06:56:15 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id r15so14927469wmh.5
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Jun 2020 06:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wdvx1su6bKunDecIvKuI9PV2uM0XohlRpfvjW4aRkXI=;
        b=VpxRIyQ5zOQ6ge+KlfLGKWh9LUJOc6XbiE6mycAiARI3X3UTEXWCaNXW/Vx51WagZK
         h2lRW2Fg50cKEyLqHT1T/EtusvfwREkyHihrrzqGE4SLKxYGSPExk7yz6rHe0M7wOJw1
         Yg30/oZaubsm1JYX0xsy0JHaLoJyZNgivAhxappEq0AdvNnSUxEkv2MyGPjzNgXruVay
         ykCgxs1j/2urnzDhQQMSXUDBIhidBugH6qXCh8pFewWElhGIyusHYEFmd+5twI0Jsp/q
         d7zYzsfraxqzZytfctI9IEdQWW+7qO0uJiu37fXogEo276WjT9ghWEyYIOtVmAQLfHQw
         dNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wdvx1su6bKunDecIvKuI9PV2uM0XohlRpfvjW4aRkXI=;
        b=VUs+mcVtS2sAHnkNn4kbbzkHLwHIrE3VED48I5Z9H/tlezWeFdsCTb4urYo3eVPSE/
         KDTvFhZaKQJEQDzmRZ6/Ox+jwDEkbeuDlxtVfBTGqUT5L33Xc6VbJ4cC65BgwpdC2U4C
         vRQdDy2KVOsRJzEzHRx9FHqSjExz36nwi5dQ1XFrCmlD7EUJMNBV6h+U2Y1x0h38oLMZ
         igg+Mo4w9hNQXgJ/q7+jYsdrwTM5X4X17BSySew3oeHZaQWm3f1IZy8zvQ5+6gqeOJZ6
         dO8emt+WiFLXm6glWybyIsQUZJp77Iur45wF5aORcB7fTn/wBKTNm2iukP4wA17xFYEl
         DZBQ==
X-Gm-Message-State: AOAM533Qvny0YFxsqGgggCuJzMt8bMvUjyKvvOu0zEdJDRzPflimtn5J
        KQdVxeal0vcykUOCQ+ht1Sof0Lr+PFg=
X-Google-Smtp-Source: ABdhPJzfqGe2fLGJP0HzvJyLtHRmK5FLbebKnAlCAmEOjYdQtNujGCAjVqAf6ZRD9DSCc7JoeqSkuA==
X-Received: by 2002:a7b:c007:: with SMTP id c7mr13649403wmb.165.1592229374541;
        Mon, 15 Jun 2020 06:56:14 -0700 (PDT)
Received: from garrit-VirtualBox.fritz.box ([94.31.102.44])
        by smtp.gmail.com with ESMTPSA id a14sm25479261wrv.20.2020.06.15.06.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 06:56:13 -0700 (PDT)
From:   Garrit Franke <garritfranke@gmail.com>
To:     abbotti@mev.co.uk, hsweeten@visionengravers.com,
        gregkh@linuxfoundation.org, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org
Cc:     Garrit Franke <garritfranke+kernel@gmail.com>,
        Garrit Franke <garritfranke@gmail.com>
Subject: [PATCH] staging: comedi: fix up missing whitespace in comment
Date:   Mon, 15 Jun 2020 15:55:41 +0200
Message-Id: <20200615135541.46986-1-garritfranke@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Garrit Franke <garritfranke+kernel@gmail.com>

I noticed this missing whitespace in a comment inside ni_mio_common.c

Signed-off-by: Garrit Franke <garritfranke@gmail.com>
---
 drivers/staging/comedi/drivers/ni_mio_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/comedi/drivers/ni_mio_common.c b/drivers/staging/comedi/drivers/ni_mio_common.c
index d99f4065b96d..9266e13f6271 100644
--- a/drivers/staging/comedi/drivers/ni_mio_common.c
+++ b/drivers/staging/comedi/drivers/ni_mio_common.c
@@ -2390,7 +2390,7 @@ static int ni_ai_cmd(struct comedi_device *dev, struct comedi_subdevice *s)
 #endif
 			break;
 		case AIMODE_SAMPLE:
-			/*generate FIFO interrupts on non-empty */
+			/* generate FIFO interrupts on non-empty */
 			ni_stc_writew(dev, NISTC_AI_MODE3_FIFO_MODE_NE,
 				      NISTC_AI_MODE3_REG);
 			break;
-- 
2.25.1

