Return-Path: <kernel-janitors+bounces-463-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5458E7FA032
	for <lists+kernel-janitors@lfdr.de>; Mon, 27 Nov 2023 14:01:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0612A281694
	for <lists+kernel-janitors@lfdr.de>; Mon, 27 Nov 2023 13:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116EB2C861;
	Mon, 27 Nov 2023 13:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GOWM5Y87"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D02859B
	for <kernel-janitors@vger.kernel.org>; Mon, 27 Nov 2023 05:00:58 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40b34563987so23550175e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Nov 2023 05:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701090057; x=1701694857; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WgASahz0x5Po2Cv0bwXpcZwkazchSSzp18r4ApB/m2A=;
        b=GOWM5Y87CdZ2/2yc3aU5yHYvHpykL1gtu1iHfceER6GCjZz3+MSe8VMQnmw7gm2if5
         q8pSxvX/bohku0KaCTPMI6/ieojS090FOh/VnwA/VswX0VbwC3hgARtN9j4xnoQIhlUw
         rJkMhh9vgcAolH/xg3jKBBxChJ5oaP8tPeOm0NMwOVK/0Yv/0tQxcb6L4lTb1dlhfRtK
         zl7tPey9Q9Oi16zwUHtWb+NsFGf3JZ/roW5RYqtHNzsDEre9nKRK9A8AGSzpgZ1TqE5R
         aox3ERPMlAOkpAHL9eaLgYADI4JOqSLHwJFrUlTJ6eL2I0KXuXZYAEFqORKnO6Z6jbbT
         bQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701090057; x=1701694857;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WgASahz0x5Po2Cv0bwXpcZwkazchSSzp18r4ApB/m2A=;
        b=xR1EpO5yOML161ecQ4fbzVdW6zTr4cW7MMXV/EuR1l47Lx3Z6JOnJTQg3KM7dPlJI0
         gKLNKVt7Q0/fyPcT04encJ+/QiizzfxfJ0Vvqia1uMViOJKfE+TalUrY4GFY/KvpuduJ
         fITNFE//rr1EW03riYc76scKS3dWtutaYNRU+iN6cq81j9/JpLSVTW+XHXmO9BMBWKxR
         o9fJUnDeeXp2/ZcrORxTTVylOfNIMs+5YCEFpyDhA7VILqTfbpYdJROfuG85XEnSgWNo
         udoMZfOvL1i2v6zVwLsi5LYi+iTOFPzOT1xPgliafjX3AamFP1ufD7KsXuq75H5eecgI
         M9ew==
X-Gm-Message-State: AOJu0Yx7+x+BM3wfGl3FLPMX6qLEVozUc4q/x0+ee+aPmQyFcTFgmUiR
	ugr3BMH2Dg6+q3MlYYcuHaoKnA==
X-Google-Smtp-Source: AGHT+IFhyPwnwrRCuQw2LDntEhS+wmv0YqUCtrD6IQ+NLOxpkYcGUcE3+zqQkK18Pal9cVoEZM9XQg==
X-Received: by 2002:a05:600c:138d:b0:40b:2afd:1a9 with SMTP id u13-20020a05600c138d00b0040b2afd01a9mr12835439wmf.15.1701090057225;
        Mon, 27 Nov 2023 05:00:57 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id je4-20020a05600c1f8400b00407460234f9sm13905925wmb.21.2023.11.27.05.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 05:00:56 -0800 (PST)
Date: Mon, 27 Nov 2023 16:00:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rahul Rameshbabu <rrameshbabu@nvidia.com>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Dragos Tatulea <dtatulea@nvidia.com>, netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net] net/mlx5e: Fix snprintf return check
Message-ID: <d17868ea-cef9-4f8c-a318-9f98b8341f5b@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code prints a string and then if there wasn't enough space for the
whole string, then it prints a slightly shorter string.  However, the
test for overflow should have been >= instead of == because snprintf()
returns the number of bytes which *would* have been printed if there
were enough space.

Fixes: 41e63c2baa11 ("net/mlx5e: Check return value of snprintf writing to fw_version buffer")
Fixes: 1b2bd0c0264f ("net/mlx5e: Check return value of snprintf writing to fw_version buffer for representors")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c | 2 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_rep.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c b/drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c
index 792a0ea544cd..c7c1b667b105 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c
@@ -49,7 +49,7 @@ void mlx5e_ethtool_get_drvinfo(struct mlx5e_priv *priv,
 	count = snprintf(drvinfo->fw_version, sizeof(drvinfo->fw_version),
 			 "%d.%d.%04d (%.16s)", fw_rev_maj(mdev),
 			 fw_rev_min(mdev), fw_rev_sub(mdev), mdev->board_id);
-	if (count == sizeof(drvinfo->fw_version))
+	if (count >= sizeof(drvinfo->fw_version))
 		snprintf(drvinfo->fw_version, sizeof(drvinfo->fw_version),
 			 "%d.%d.%04d", fw_rev_maj(mdev),
 			 fw_rev_min(mdev), fw_rev_sub(mdev));
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_rep.c b/drivers/net/ethernet/mellanox/mlx5/core/en_rep.c
index fe0726c7b847..a7c77a63cc29 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_rep.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_rep.c
@@ -78,7 +78,7 @@ static void mlx5e_rep_get_drvinfo(struct net_device *dev,
 	count = snprintf(drvinfo->fw_version, sizeof(drvinfo->fw_version),
 			 "%d.%d.%04d (%.16s)", fw_rev_maj(mdev),
 			 fw_rev_min(mdev), fw_rev_sub(mdev), mdev->board_id);
-	if (count == sizeof(drvinfo->fw_version))
+	if (count >= sizeof(drvinfo->fw_version))
 		snprintf(drvinfo->fw_version, sizeof(drvinfo->fw_version),
 			 "%d.%d.%04d", fw_rev_maj(mdev),
 			 fw_rev_min(mdev), fw_rev_sub(mdev));
-- 
2.42.0


