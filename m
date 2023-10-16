Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEA127CB152
	for <lists+kernel-janitors@lfdr.de>; Mon, 16 Oct 2023 19:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233006AbjJPR2V (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 16 Oct 2023 13:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232295AbjJPR2U (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 16 Oct 2023 13:28:20 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A15B5AB
        for <kernel-janitors@vger.kernel.org>; Mon, 16 Oct 2023 10:28:18 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40684f53d11so55004985e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 16 Oct 2023 10:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697477297; x=1698082097; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GnUN5cuxAgIn1AVeXZDWW/Efxhy2T4tZCHS7uiiKgls=;
        b=kzMuA8F+SZXWnOoOLwbjFBhyf3A2zoQnxTdAD/0BAgRWxlK/kF8d9Jva1U6HVSQ3D5
         /V5v/XnJfNLJ0zHtfF2IRjr7/gGiP74VeHLhlbW7QwO/+6nvKzJ4uJFGUDd0ilk+qQ2p
         N1jUORFJA4dyi9DCycILMwVHgikF1WSATJIbOXxjW9Ut2Sg8br8nS0z0jzPyYP2Tx9fx
         pVVaJjS/OCXnoqBbnndjreUZv4GqROvmbpzfYf32738x2fzrdPUY4DaNmrehY7X6MB6n
         t1PYx+7R5TbTs1DpYjR8bMv/sSmCBFFfhLw5p2ltpwVfLPV4rHE+YFMGDkvmvzabeXXZ
         h8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697477297; x=1698082097;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GnUN5cuxAgIn1AVeXZDWW/Efxhy2T4tZCHS7uiiKgls=;
        b=WnHcJK3m0eJus0dLe4TlAd0/9GUiP2+OFw60n+jpZjTtMxXWiTTcHL9en8VpHoPuYj
         fOr3EfhDUGVTYPreqfrASnyJ2WgsTxH01plH3EkqGRs+f/cQHGjRE2I2iqRNKVFmHry1
         28+n3192cQFHV1GUa0NMxmNm1O2iAmmeKms+TNKSBjoq8UZd6c39ILUGY5GmWrMq8+Jv
         6I4nyC+jTFn4Quv7ZwASAbrOoabS+4GT8a8hMf2cAE/1m06QMCC160R3zoLrHgHwgwZs
         aAsjZgkFIXusErtHrVevDApo0pozs/rI7H22/1adsD6/YROij721YsnKo8mC3/PaZPFl
         vkkA==
X-Gm-Message-State: AOJu0YxWLd16fVI4uX4rxWr27HzfoIJknW5KPA+13eY5/dWm64U6i4Sf
        CMhusKOLOM4Gjjhafj528POMIA==
X-Google-Smtp-Source: AGHT+IFvIriZAI51ky7DuqcLEVh5b/T3s0wt9PW2D2Orplfm20a2U8/iKGSHNrjNFmituKSYmvwOjw==
X-Received: by 2002:adf:f608:0:b0:32d:b19b:b3d9 with SMTP id t8-20020adff608000000b0032db19bb3d9mr94924wrp.2.1697477297102;
        Mon, 16 Oct 2023 10:28:17 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bq1-20020a5d5a01000000b0031ad5fb5a0fsm1906088wrb.58.2023.10.16.10.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 10:28:16 -0700 (PDT)
Date:   Mon, 16 Oct 2023 20:28:10 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Steve Glendinning <steve.glendinning@smsc.com>
Cc:     Steve Glendinning <steve.glendinning@shawell.net>,
        UNGLinuxDriver@microchip.com,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net] net: usb: smsc95xx: Fix an error code in smsc95xx_reset()
Message-ID: <147927f0-9ada-45cc-81ff-75a19dd30b76@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Return a negative error code instead of success.

Fixes: 2f7ca802bdae ("net: Add SMSC LAN9500 USB2.0 10/100 ethernet adapter driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/usb/smsc95xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/smsc95xx.c b/drivers/net/usb/smsc95xx.c
index 563ecd27b93e..17da42fe605c 100644
--- a/drivers/net/usb/smsc95xx.c
+++ b/drivers/net/usb/smsc95xx.c
@@ -897,7 +897,7 @@ static int smsc95xx_reset(struct usbnet *dev)
 
 	if (timeout >= 100) {
 		netdev_warn(dev->net, "timeout waiting for completion of Lite Reset\n");
-		return ret;
+		return -ETIMEDOUT;
 	}
 
 	ret = smsc95xx_set_mac_address(dev);
-- 
2.39.2

