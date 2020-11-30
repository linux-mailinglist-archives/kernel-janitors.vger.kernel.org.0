Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D24B2C9041
	for <lists+kernel-janitors@lfdr.de>; Mon, 30 Nov 2020 22:51:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbgK3Vsf (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 30 Nov 2020 16:48:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgK3Vsf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 30 Nov 2020 16:48:35 -0500
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFF40C0613CF
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Nov 2020 13:47:54 -0800 (PST)
Received: by mail-qt1-x841.google.com with SMTP id l7so9414299qtp.8
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Nov 2020 13:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=JzEWnONicVu3I6rhGAZUBQUx29o5VixFEJEYKmMe9og=;
        b=by5qpXYjMcySFi2FeVQ2x2E3REtNHCFDnfhaPE2MifPIt5x9z1f6kup4ENP/cAYfCQ
         xp+qlmN7cfYy5pXdnI6YPyAmenniCGzJx5HKIvHg91tjKm++avaJRWbvKqt85/1PNOD9
         mQT5YWk9TEJ9s8KG++R8+IJ0N0yzZX8VLBNT8VkfKINMiAFf5uCZcr46SMGGIAIWW6QV
         7inPweARGI2N3GacE1nPbNCL7MfBCxXKHYfAZy1tUcC+BVpySdsoJb2/oXIwBso9HuzF
         OOZ3RwyJntBLZG1P+KkyNnx6vgid94tCollS7ZwYpWlvEvfw6HSxx8ScbPWagJ4qGure
         IJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=JzEWnONicVu3I6rhGAZUBQUx29o5VixFEJEYKmMe9og=;
        b=FJRRAboo5w0LWebQU+NDW2WyjCxk0Yt/1quCKCkVuEe5I9MldMXGUyImpicQAin9/V
         R8LkQtSDvM33aat25Dg93J2jC0s36CV4/HDt+x7GWMiOx3YjIRqhh9/vMT9QzlEm5CXX
         CozkjhmcW2HufTkBaQS2xT8LBvy8CB1Qk6zoEaKjO5VCDSSesnnNFpDDgkEo6GWTqWdT
         o4+E0DMvw+2sJTrztB1jacTzOUiX+mIfAm/yBHLOl3W984vgBqemSodYL8IMEoZUdi9F
         fWfmDPJ2zTOu+kOBNoLTp6A/EdcxATAYv9ndW0t1ZJcCBHCprKodwTW2OYVK58WmMAUR
         FRVA==
X-Gm-Message-State: AOAM530k4rQnATlqSufqcBNv0eX2qqRHqQlj8ZumDe9WiKlcGDfwg6wD
        GsJ5BPwL7J+7hRlQfDr2McDF+/qT4uiYvg==
X-Google-Smtp-Source: ABdhPJybOI2fyKIHE71z9bZVUxz6iIedOSVwMtg8HEEdfNXDxhhIWmjUFlCYPqowy+Shr7c8DnVaHw==
X-Received: by 2002:ac8:7a7b:: with SMTP id w27mr23828968qtt.76.1606772873332;
        Mon, 30 Nov 2020 13:47:53 -0800 (PST)
Received: from a ([24.13.98.51])
        by smtp.gmail.com with ESMTPSA id o22sm18571065qto.96.2020.11.30.13.47.51
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 13:47:52 -0800 (PST)
Date:   Mon, 30 Nov 2020 15:47:49 -0600
From:   Brother Matthew De Angelis <matthew.v.deangelis@gmail.com>
To:     kernel-janitors@vger.kernel.org
Subject: [PATCH] Staging: rtl8723bs/core: Add blank line after variable
 declaration.
Message-ID: <20201130214749.GA381950@a>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Fix the checkpatch.pl warning:

rtw_security.c:2374: WARNING: Missing a blank line after declarations

Signed-off-by: Brother Matthew De Angelis <matthew.v.deangelis@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 159d32ace2bc..a3a6558c9e03 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -2371,6 +2371,7 @@ u8 rtw_handle_tkip_countermeasure(struct adapter *adapter, const char *caller)
 
 	if (securitypriv->btkip_countermeasure) {
 		unsigned long passing_ms = jiffies_to_msecs(jiffies - securitypriv->btkip_countermeasure_time);
+
 		if (passing_ms > 60*1000) {
 			DBG_871X_LEVEL(_drv_always_, "%s("ADPT_FMT") countermeasure time:%lus > 60s\n",
 				caller, ADPT_ARG(adapter), passing_ms/1000);
-- 
2.25.1

