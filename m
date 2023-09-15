Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 622AF7A1F53
	for <lists+kernel-janitors@lfdr.de>; Fri, 15 Sep 2023 14:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235179AbjIOM4s (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 15 Sep 2023 08:56:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235155AbjIOM4r (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 15 Sep 2023 08:56:47 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84AEB173B
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Sep 2023 05:56:42 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-404c023ef5eso918965e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Sep 2023 05:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694782601; x=1695387401; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SM5PBOdoCP4oEQX3wtp/7YqQiGRCB1sn4B8ue+8A7q8=;
        b=QC+Fakpcdi7YXxNTiP38ucDSIyUP9TifCIxqcJkIRaK4KuUc2a9K5aH+smVTYsEm3r
         rwno2tgXjvRYa8sbyu3rgoO95H+xJUpQkEXmE0FjpF9R3Itdohfxuvs3dg+aES3W83VW
         P8K2HO9tVJhcfJnHjmmbe6Nv4O95wAoQ62pxnpUBGCeEaJpFdI5EWjYEbh5He0bQ0Vx4
         yUL3qYSdZ9qcimKp3Lk73V+3L9ZY45EXkZLjli7nmmb99tZyK8+aJrcpKr3isjlUZJnc
         RVKZGWxiLYBVhnzxWiJGh0/doLKF1dLylMCPirrQ9rUOIwMBJ/Xtqkq7bwDR/qDng+u8
         F/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694782601; x=1695387401;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SM5PBOdoCP4oEQX3wtp/7YqQiGRCB1sn4B8ue+8A7q8=;
        b=vsIlHKTfWe1ejfdpFztt6rERE/5BED2S1GosWKOrqUFVgqzYkMaoygLvmtcmyNQAL4
         xDbdBQ1Z1z2MUno4R52U55TByw7vq+jPZAhU2lw/rpm9idlTgM0IFpRT25jPkyS2cJ2G
         VH5+Xixv7VrzBJNXMaJrKTz+2LifYE+dFUnErk/bVPc1SRAFncxN+i3An6+H9zcCrjm1
         ATPVP+QwVjXZjkJQmUbNX4DzLs6xjsQDEnci/84/0TyrrvKLiHeOt4dhLaFZ9XCpyeXt
         e9jTf+ypEl+OMRPQW+hkVoXYPj6Ccb5MVfA6o56xHK3JUCcKN/ygvOMEfZ1iRoZ2vs7C
         49zg==
X-Gm-Message-State: AOJu0Yw+IAS08z5juNi7AzumWCXtxw4lPztP2iCEmAM0MES4wUm165Jd
        nRUyBFmzjKcjx8xe5tq8x7zmdA==
X-Google-Smtp-Source: AGHT+IGJ10DI+hGPZJx36VzO1bsRRyIeipe3JNqvIQ0oI2Z7fB1HFsAlFofT6MlDwOGkO3BSMNCJFQ==
X-Received: by 2002:adf:f981:0:b0:317:6ea5:ab71 with SMTP id f1-20020adff981000000b003176ea5ab71mr1220749wrr.30.1694782600985;
        Fri, 15 Sep 2023 05:56:40 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u8-20020a5d6ac8000000b003179b3fd837sm4364781wrw.33.2023.09.15.05.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 05:56:40 -0700 (PDT)
Date:   Fri, 15 Sep 2023 15:56:37 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Kent Overstreet <kent.overstreet@gmail.com>
Cc:     Kent Overstreet <kent.overstreet@linux.dev>,
        Brian Foster <bfoster@redhat.com>,
        linux-bcachefs@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] bcachefs: snapshot: Add missing assignment in
 bch2_delete_dead_snapshots()
Message-ID: <2e12e803-5268-4ed7-885d-c813e9b876ac@moroto.mountain>
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

This code accidentally left out the "ret = " assignment so the errors
from for_each_btree_key2() are not checked.

Fixes: 53534482a250 ("bcachefs: for_each_btree_key2()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/bcachefs/snapshot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/bcachefs/snapshot.c b/fs/bcachefs/snapshot.c
index ff7f71576d5c..0acfca00a6af 100644
--- a/fs/bcachefs/snapshot.c
+++ b/fs/bcachefs/snapshot.c
@@ -1405,8 +1405,8 @@ int bch2_delete_dead_snapshots(struct bch_fs *c)
 		goto err;
 	}
 
-	for_each_btree_key2(trans, iter, BTREE_ID_snapshots,
-			   POS_MIN, 0, k,
+	ret = for_each_btree_key2(trans, iter, BTREE_ID_snapshots,
+				  POS_MIN, 0, k,
 		bch2_snapshot_set_equiv(trans, k));
 	if (ret) {
 		bch_err_msg(c, ret, "in bch2_snapshots_set_equiv");
-- 
2.39.2

