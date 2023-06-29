Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA8B8742030
	for <lists+kernel-janitors@lfdr.de>; Thu, 29 Jun 2023 08:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbjF2GHw (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 29 Jun 2023 02:07:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231392AbjF2GHt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 29 Jun 2023 02:07:49 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 766F010CF
        for <kernel-janitors@vger.kernel.org>; Wed, 28 Jun 2023 23:07:48 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fa96fd7a04so3145045e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 28 Jun 2023 23:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688018867; x=1690610867;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hG3V7UdPm5Kx6bSNwhJkUGt/frQZQdVDwYSF5CCPhOs=;
        b=oFlsMhLdmAZDFyCYw7GjD0CzcCyDOUI0irAyfJddX18adJpjjovaWyBIfUTGw1BjSb
         D9Zt1gaZtKVA9KPlkukNJ02Bw2yggDIbD0mPncbBgy9BO1TRL6ZtCvvVN9/VBnSQrWHr
         F5kcKkPRmmrR+6fAZ4pfnmfcdTTwNErSblZ7CAzSW6O5QWygJhv4k+m3lACwaNEaiMYC
         6vtQtsmtHF5vG9pXW9BfEiPBC61Z6zG8IZxwrfvVc/RapmyW+uE7XSdYDfRt2g/P0GaA
         IVENPXy6MkAynbgJxkSNmC6uSB53ZUsRIWy6acERQ0M0rzYH1h3pfu8gKK7KC2a++tJS
         9Z+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688018867; x=1690610867;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hG3V7UdPm5Kx6bSNwhJkUGt/frQZQdVDwYSF5CCPhOs=;
        b=XfZA7hTWOaugHfaQhdDA+1y2FyjJunmpASJGJfli1jo1I9Ix+mwsF3d8HpuFI2qGY8
         EosBm1OPnA9SDswYkWCnET+sfC/a04t0cEfKxy4UIycx+3UaK4zPV5dSO4c4uC79AStk
         noBAUyHAx6MT5u0rWSi7DfWF9t6QFMBTvE7wkIfGD7QXQVcmqZIjfFwGHbJdobzvp/WH
         gNOcwZq7ESPO2HjbF/xVJxl/Dn4SGVtWeHiFiKl3+itB4mNhuzUoE7NaZlTejkOYtH6Q
         zP/BxCJcDl1Q/0D+1eezRNigIrjj0EYHfAdzskU38NE5vNRohkhfJQA29pv6zpVzGBKV
         2vUA==
X-Gm-Message-State: AC+VfDz8ki/3kH6wVvkz1/B+RhkfXCcX/vgk5G14EnOZQgSRZqWeKP7I
        JyiMG/oYbFRuqYCnzQbfGr+FwQ==
X-Google-Smtp-Source: ACHHUZ57eBtEr6beoWpiAiXBCbHcdZD0/cDn16RcjQcG19bArgstaa4FKxBKB56H8b9dXR3+8OI6tQ==
X-Received: by 2002:a7b:c406:0:b0:3fb:b6f3:e528 with SMTP id k6-20020a7bc406000000b003fbb6f3e528mr925313wmi.25.1688018866842;
        Wed, 28 Jun 2023 23:07:46 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id hn10-20020a05600ca38a00b003fba586100fsm6597743wmb.6.2023.06.28.23.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 23:07:45 -0700 (PDT)
Date:   Thu, 29 Jun 2023 09:07:37 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Guy Levi <guyle@mellanox.com>
Cc:     Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] RDMA/mlx4: Make check for invalid flags stricter
Message-ID: <233ed975-982d-422a-b498-410f71d8a101@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This code is trying to ensure that only the flags specified in the list
are allowed.  The problem is that ucmd->rx_hash_fields_mask is a u64 and
the flags are an enum which is treated as a u32 in this context.  That
means the test doesn't check whether the highest 32 bits are zero.

Fixes: 4d02ebd9bbbd ("IB/mlx4: Fix RSS hash fields restrictions")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
The MLX4_IB_RX_HASH_INNER value is declared as
"MLX4_IB_RX_HASH_INNER           = 1ULL << 31," which suggests that it
should be type ULL but that doesn't work.  It will still be basically a
u32.  (Enum types are weird).

 drivers/infiniband/hw/mlx4/qp.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/infiniband/hw/mlx4/qp.c b/drivers/infiniband/hw/mlx4/qp.c
index 456656617c33..9d08aa99f3cb 100644
--- a/drivers/infiniband/hw/mlx4/qp.c
+++ b/drivers/infiniband/hw/mlx4/qp.c
@@ -565,15 +565,15 @@ static int set_qp_rss(struct mlx4_ib_dev *dev, struct mlx4_ib_rss *rss_ctx,
 		return (-EOPNOTSUPP);
 	}
 
-	if (ucmd->rx_hash_fields_mask & ~(MLX4_IB_RX_HASH_SRC_IPV4	|
-					  MLX4_IB_RX_HASH_DST_IPV4	|
-					  MLX4_IB_RX_HASH_SRC_IPV6	|
-					  MLX4_IB_RX_HASH_DST_IPV6	|
-					  MLX4_IB_RX_HASH_SRC_PORT_TCP	|
-					  MLX4_IB_RX_HASH_DST_PORT_TCP	|
-					  MLX4_IB_RX_HASH_SRC_PORT_UDP	|
-					  MLX4_IB_RX_HASH_DST_PORT_UDP  |
-					  MLX4_IB_RX_HASH_INNER)) {
+	if (ucmd->rx_hash_fields_mask & ~(u64)(MLX4_IB_RX_HASH_SRC_IPV4	|
+					       MLX4_IB_RX_HASH_DST_IPV4	|
+					       MLX4_IB_RX_HASH_SRC_IPV6	|
+					       MLX4_IB_RX_HASH_DST_IPV6	|
+					       MLX4_IB_RX_HASH_SRC_PORT_TCP |
+					       MLX4_IB_RX_HASH_DST_PORT_TCP |
+					       MLX4_IB_RX_HASH_SRC_PORT_UDP |
+					       MLX4_IB_RX_HASH_DST_PORT_UDP |
+					       MLX4_IB_RX_HASH_INNER)) {
 		pr_debug("RX Hash fields_mask has unsupported mask (0x%llx)\n",
 			 ucmd->rx_hash_fields_mask);
 		return (-EOPNOTSUPP);
-- 
2.39.2

