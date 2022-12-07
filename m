Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A572645656
	for <lists+kernel-janitors@lfdr.de>; Wed,  7 Dec 2022 10:19:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbiLGJT2 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 7 Dec 2022 04:19:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbiLGJTW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Dec 2022 04:19:22 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EECB8248;
        Wed,  7 Dec 2022 01:19:21 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id d1so27127095wrs.12;
        Wed, 07 Dec 2022 01:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yk+01Q5hHrzjtzXY624bUUvdeMShY716sfcUJDXSwKg=;
        b=O8dAy4F4NMkE1i/p/ypI70kJIQgWtxRJ/NNVonelkZ3zTrSvsZ3oYoiyXrrDlff9En
         H4yH5zVTgR28Ad37YhCcVYUs0M2xMmNVMAU4t6PImcToM4VWsTt0Uh/21poLG17MNgT1
         /wlnTI4kseap6HDWgA3HH4f5RS4zKsb1wgCzx7HlBz29Fr94+Lrq4M0d6lx0QlCeiepg
         RwJnqlxk/dbHOEx4NCf259WQBIubYYZQa5Fbwn5Ymqa7VK8rGP2UH0wAixlDZMZ20CfF
         bUuP3k7jk5D7hmFHLQexGng6cL/fQ8SnTeRhoZXr+5GRe+T8BzQ2tFYyawtsVyQ2AEuF
         zvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yk+01Q5hHrzjtzXY624bUUvdeMShY716sfcUJDXSwKg=;
        b=KFfNw3SoiKSw1+99wbfLQcEMsSzUPyqw3E0nVep/eWyiVvBE4yrD/HLa3tWk+0raOH
         3/sc3I1s15NwEC7dYRMtFXbbVfXPxUzexdQ2Z9ut4beRLPXJnZh5d6ZQx7THT+tum5wH
         e3ZSVZ6GB9tyLfH7cRWDFoOB2JtaJP7XmGJ8yfR7yjXFdCnFvNcNeSU9hXfXQu+HJrRW
         memo1Qrq5cxjA6JJRPXpWnX9k6nMCNNXWXRhJ6+CqcgrSg6s12uOUtnrT3FWciKpMDmq
         C+5uMIFxHMXlMKIm9OrcYo5V3OSB5s05GtetRntLP/JATtnyIHeBi5im12A4hjBR0BQ5
         TdhA==
X-Gm-Message-State: ANoB5plD2pJHPQwNdfwE6KzSODcuRajKWmJaMOZtubR0+r9wBj3Xut1o
        hMLvEekYCKRAhBE3TpzdY2Q=
X-Google-Smtp-Source: AA0mqf7p3ejbcewgNSyVTrvdicC8SFx2IBdkYmatYw/nRnWSivQak6ErtxEUTf2R0z4jWRVPqE/B5A==
X-Received: by 2002:adf:db87:0:b0:242:2719:5784 with SMTP id u7-20020adfdb87000000b0024227195784mr21046332wri.130.1670404760305;
        Wed, 07 Dec 2022 01:19:20 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id u19-20020a05600c19d300b003d07de1698asm1054951wmq.46.2022.12.07.01.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 01:19:19 -0800 (PST)
From:   Colin Ian King <colin.i.king@gmail.com>
To:     Simon Horman <simon.horman@corigine.com>,
        Jakub Kicinski <kuba@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Huanhuan Wang <huanhuan.wang@corigine.com>,
        Steffen Klassert <steffen.klassert@secunet.com>,
        Louis Peens <louis.peens@corigine.com>,
        oss-drivers@corigine.com, netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] xfrm: Fix spelling mistake "tyoe" -> "type"
Date:   Wed,  7 Dec 2022 09:19:19 +0000
Message-Id: <20221207091919.2278416-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There is a spelling mistake in a nn_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/ethernet/netronome/nfp/crypto/ipsec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/netronome/nfp/crypto/ipsec.c b/drivers/net/ethernet/netronome/nfp/crypto/ipsec.c
index 4632268695cb..266368386836 100644
--- a/drivers/net/ethernet/netronome/nfp/crypto/ipsec.c
[next]+++ b/drivers/net/ethernet/netronome/nfp/crypto/ipsec.c
@@ -303,7 +303,7 @@ static int nfp_net_xfrm_add_state(struct xfrm_state *x)
 	}
 
 	if (x->xso.type != XFRM_DEV_OFFLOAD_CRYPTO) {
-		nn_err(nn, "Unsupported xfrm offload tyoe\n");
+		nn_err(nn, "Unsupported xfrm offload type\n");
 		return -EINVAL;
 	}
 
-- 
2.38.1

