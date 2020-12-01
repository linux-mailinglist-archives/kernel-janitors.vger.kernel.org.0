Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4792CAF24
	for <lists+kernel-janitors@lfdr.de>; Tue,  1 Dec 2020 22:50:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387499AbgLAVuA (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 1 Dec 2020 16:50:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730230AbgLAVt7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Dec 2020 16:49:59 -0500
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FC9CC0613CF
        for <kernel-janitors@vger.kernel.org>; Tue,  1 Dec 2020 13:49:19 -0800 (PST)
Received: by mail-io1-xd42.google.com with SMTP id q137so3224744iod.9
        for <kernel-janitors@vger.kernel.org>; Tue, 01 Dec 2020 13:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=PbrwYv29+PF/nyk/ti6SRL/7+9Hqg5a4LKV7FHVd2Vo=;
        b=DmwkLEzMry5LHCqEhGGEqSu2TfR5ycWx9GVQl0Gxe3pDJqY+kvbTJf3lz/kG3IqYrm
         ATEqx1HAyIi+ebwed7LRHxKwCE3I5uMvRzrbpLlRzO1bRXr71ppImhjXpv9XSL3amfSN
         CdK+O95ygbbbSV0lnfpdVaEjJd7D0I0PJTl2X/I4M/g/sFifOwWWmaUx+O3WF/l20FRr
         c2f8Z12P+RUEZkByLwBdIbsISd1sfi/pPoEPt8J8Ua1v4Hp+AGHewCv+FJ5RJMJW8aFU
         cKHfuj5axmvhsZQ54ZfACoeKgtmuYLkAAoNK0UX8Jp4xLhz2Yc7fe3vIJWZnJFqixwtO
         qjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=PbrwYv29+PF/nyk/ti6SRL/7+9Hqg5a4LKV7FHVd2Vo=;
        b=bw/Z61vlMecpRT6GqjXG01/h/CHMd860pRefpJBddaJk15wmBsa3c4rgPXnNybxlF2
         zX1ymZx7UOUfR9go9CnKKJH5qq0iL6pyK3Yf45I/EeC3T29RfBhzdvf6GF7ilLexlVxI
         h0ZGoxcGGdoZC8INZUI+Biv5cebch+nEYG6R/L7KPYqAa525b1Jg3GGfSgsmxpAF7JBS
         qFnjTQkTOwa4WmiiXOJy2gpflMomJzoquIBXZqQXWACKTWW4F8VC865IMEs3/yxK8kfq
         QKo1Aq1o+nOES3PNUhwAnOjr+9M6T9j51FE4AFxEMXO4QiuLps06A4BdKd13uYk4scxn
         ehzQ==
X-Gm-Message-State: AOAM532GBsvGaifovsK4eo51ce6uYk8dtTckYKJhf5Fxapc4PelcK/eP
        c/3V7a/h1gbF19vlIVvEgPx5mFX13Wvyuw==
X-Google-Smtp-Source: ABdhPJxOm5wD3hUIQqmBbfq+qYEOvGSiH56BM0EUwMeQFaglSoUCYWBsIXsL+3fETvO9c6c7X2r0tw==
X-Received: by 2002:a02:830f:: with SMTP id v15mr4575030jag.12.1606859358545;
        Tue, 01 Dec 2020 13:49:18 -0800 (PST)
Received: from a ([24.13.98.51])
        by smtp.gmail.com with ESMTPSA id n77sm397961iod.48.2020.12.01.13.49.17
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 13:49:17 -0800 (PST)
Date:   Tue, 1 Dec 2020 15:49:15 -0600
From:   Brother Matthew De Angelis <matthew.v.deangelis@gmail.com>
To:     kernel-janitors@vger.kernel.org
Subject: [PATCH] Staging: rtl8723bs/core fix brace coding style issue in
 rtw_ioctl_set.c.
Message-ID: <20201201214915.GA397311@a>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Fix a brace warning found by the checkpatch.pl tool at line 178.

WARNING: braces {} are not necessary for any arm of this statement.

Signed-off-by: Brother Matthew De Angelis <matthew.v.deangelis@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 3adeca6f20ec..a7aa689ef4d4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -175,11 +175,10 @@ u8 rtw_set_802_11_bssid(struct adapter *padapter, u8 *bssid)
 
 
 	DBG_871X("Set BSSID under fw_state = 0x%08x\n", get_fwstate(pmlmepriv));
-	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) == true) {
+	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) == true)
 		goto handle_tkip_countermeasure;
-	} else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true) {
+	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true)
 		goto release_mlme_lock;
-	}
 
 	if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE) == true) {
 		RT_TRACE(_module_rtl871x_ioctl_set_c_, _drv_info_, ("set_bssid: _FW_LINKED||WIFI_ADHOC_MASTER_STATE\n"));
-- 
2.25.1

My apologies, I meant to sent this. 
Would a patch like this be worth Greg's time?
