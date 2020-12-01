Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F7342CAF20
	for <lists+kernel-janitors@lfdr.de>; Tue,  1 Dec 2020 22:48:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728578AbgLAVr6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 1 Dec 2020 16:47:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728461AbgLAVr5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Dec 2020 16:47:57 -0500
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86C1AC0613CF
        for <kernel-janitors@vger.kernel.org>; Tue,  1 Dec 2020 13:47:17 -0800 (PST)
Received: by mail-il1-x143.google.com with SMTP id p5so3199915iln.8
        for <kernel-janitors@vger.kernel.org>; Tue, 01 Dec 2020 13:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=8CGPCu4EICDKzG2asRV3/c69GubKWlOTSK6e7mBpm8M=;
        b=mMzchzw17FYIEf35WpmI0mI0HTP7J6k+fcgbOItxnEA8yoqK2vchkCRi8OQShj/jRQ
         wnEKuZQW2NmviV939dF7F7z+q/NfhkSynDtDgtvYJqKOr9CN61MPdMGa0yUzvLAN+ckR
         189DLIG7vgFd80AaEhCyaOCaSXPc2VfNXXURG2etMm9xD66zPY2UYOVZU0NNayapGK9P
         FSsVBDXg9FDK1YzGJURKZ+I2Hoe3LWl8odBI/H04WgO8I1wPbHuLDHu+T3tAkTsbRO65
         xwzuGFvyiJiegNOF7XjetiZvnRX+CXQB8JWvJqledouqfAhykokfzOvWjaeuE2u79931
         c4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=8CGPCu4EICDKzG2asRV3/c69GubKWlOTSK6e7mBpm8M=;
        b=ue/t6pBNICF+AkLQ1pqiD06nCbReBr/P9lnEUsz30E6Sio89LF1RIB/zLPiWf1AFDp
         IjSx275z2jGXOWVBoiDi4yLuMjblf5Gv4Ii1LwsbT1AjopD8CJ5lry6vshnu1zn8OJVR
         RW4I1GRs8mfmLL3jcGXSDCwNLeta/45nvzbXpn8hKnsYiPCdMtJMBQUr6BQkcVCqXYrl
         GYWOymsQyNNHuBjNGd4WCWya38SU/Vm906Q3o8n0HS8m9s+ckSQM9v8kMX+xII8lPxEl
         HPcCCxO7fdT59Pah9g+PPDtzByFDRGo2EoHUsvUbashxsNviHDMN8COEH9rS15DHpxj9
         IzVg==
X-Gm-Message-State: AOAM5335xM3mYI0Isw/47MYMsD3G2b6vnumiw14+11kKOT4gDKUpaPFv
        wBhMgIIQXMlNDhfYRCr2QoZ0yBoW2rkjOQ==
X-Google-Smtp-Source: ABdhPJwi8TmObkhyXv/yjsH2TdshnHjnrNIcNH/iDxhseaeNOoAGXfKhPe5zeiQRQP4uHC6RnzBU2A==
X-Received: by 2002:a92:50e:: with SMTP id q14mr4485808ile.306.1606859236504;
        Tue, 01 Dec 2020 13:47:16 -0800 (PST)
Received: from a ([24.13.98.51])
        by smtp.gmail.com with ESMTPSA id g2sm388353ilh.41.2020.12.01.13.47.15
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 13:47:15 -0800 (PST)
Date:   Tue, 1 Dec 2020 15:47:14 -0600
From:   Brother Matthew De Angelis <matthew.v.deangelis@gmail.com>
To:     kernel-janitors@vger.kernel.org
Subject: [PATCH] Staging: rtl8723bs/core: Add blank line after variable
 declarations.
Message-ID: <20201201214714.GA397282@a>
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

Hello kernel janitors,

this is my third patch and I don't feel very confident yet. Would this patch be worth Greg's time?

Thanks!
Br. Matt
