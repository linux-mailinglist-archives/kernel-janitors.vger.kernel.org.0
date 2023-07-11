Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 870C274E701
	for <lists+kernel-janitors@lfdr.de>; Tue, 11 Jul 2023 08:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbjGKGOx (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 11 Jul 2023 02:14:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231294AbjGKGMz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 11 Jul 2023 02:12:55 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BDE2E4B
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jul 2023 23:12:49 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742bso58826495e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jul 2023 23:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689055968; x=1691647968;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p96yGLmqdrf7EnICZmRF6+JxSLRO9iWhLvWVcOetAfo=;
        b=c8m65s/NZjXnL9E1LlXyBllzpLUAiodYtykzNxEEN5emm9CzusFcfb0sWytztLEfHv
         12Jf3ImHddWgKqtknJgnRGj9VaTeHRWrDfGT+t42r3rarL44yBM2xSc3m55WBOgKljXi
         DcO4rU2fXOzAQxJoJ4Xg4emJYMAX8lVf99GFGtfbwN33b1yE0Ufh0JKu5a2U94ukfEzK
         qKnCG5qo8FGFTqD0RZoXWrukV8XMl/gesto0vQQNIe01pbzFlPlVVxfwwpwRO7Gi3FW6
         sY7arA4v1ZkBrjFFGUnGFV+UwMLcAMX4Be1eDa3zIcCJLEE0c8LT0YsgS9EtyYSCc8Xz
         BDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689055968; x=1691647968;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p96yGLmqdrf7EnICZmRF6+JxSLRO9iWhLvWVcOetAfo=;
        b=e36MDKkDTDbjeZJmEFocUGz1NlXTs0oRmQIg9GjVXl2ccJrK/neRw9b3KprmK8ROyS
         EdxYpGByY50DDePko2F0FO57M/Hgmb8zIO/avifnA2IvTNEJubslbUTJJeuMDUAW09Ob
         dzi2Xu3qkZp998OrRrsK2t+6uQX4N3a9pxQZbTWZinxVT3WoXhDgz9jJCruiKII+o1S+
         W3ddD/j8EjVC5Tyio256h0jEGdf8fOVfCYrJ0n0kHE8eXf1DxQaYzCgEKlj6RVLHPO+L
         EyJUCW242mNeoYrFLuL4r/a9zJyCwcAiFh3LNY5jaYbt/HcaplByzscP0PHWM/kdRHFU
         LSTw==
X-Gm-Message-State: ABy/qLaNRq05z+DZi6bwJmSFuCkhkb2L8s5yM2nTr630Raf88vXE4rFD
        Djx/uvbo1yU2s5y3Qxi1vtY2mA==
X-Google-Smtp-Source: APBJJlEZuQh6Ov2aYt0aLAWHvKyBYfta+NWkUT+mAMgVQDp4GKo6QCnDdRw/d+jEjlafyD3531oGwQ==
X-Received: by 2002:a05:600c:22cf:b0:3fa:96ad:5d2e with SMTP id 15-20020a05600c22cf00b003fa96ad5d2emr16303689wmg.19.1689055968070;
        Mon, 10 Jul 2023 23:12:48 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z19-20020a1c4c13000000b003fb225d414fsm11935313wmf.21.2023.07.10.23.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 23:12:47 -0700 (PDT)
Date:   Tue, 11 Jul 2023 09:12:43 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 3/5 v3] accel/qaic: Add consistent integer overflow checks
Message-ID: <00af1b08-fd62-4e00-8c8c-931b235e77e5@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKzx5nA6Z/0yhBJj@moroto>
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The encode_dma() function has integer overflow checks.  The
encode_passthrough(), encode_activate() and encode_status() functions
did not.  I added integer overflow checking everywhere.  I also
updated the integer overflow checking in encode_dma() to use size_add()
so everything is consistent.

Fixes: 129776ac2e38 ("accel/qaic: Add control path")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: no change

 drivers/accel/qaic/qaic_control.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 752b67aff777..23680f5f1902 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -367,7 +367,7 @@ static int encode_passthrough(struct qaic_device *qdev, void *trans, struct wrap
 	if (in_trans->hdr.len % 8 != 0)
 		return -EINVAL;
 
-	if (msg_hdr_len + in_trans->hdr.len > QAIC_MANAGE_EXT_MSG_LENGTH)
+	if (size_add(msg_hdr_len, in_trans->hdr.len) > QAIC_MANAGE_EXT_MSG_LENGTH)
 		return -ENOSPC;
 
 	trans_wrapper = add_wrapper(wrappers,
@@ -558,12 +558,10 @@ static int encode_dma(struct qaic_device *qdev, void *trans, struct wrapper_list
 	msg = &wrapper->msg;
 	msg_hdr_len = le32_to_cpu(msg->hdr.len);
 
-	if (msg_hdr_len > (UINT_MAX - QAIC_MANAGE_EXT_MSG_LENGTH))
-		return -EINVAL;
-
 	/* There should be enough space to hold at least one ASP entry. */
-	if (msg_hdr_len + sizeof(*out_trans) + sizeof(struct wire_addr_size_pair) >
-	    QAIC_MANAGE_EXT_MSG_LENGTH)
+	if (size_add(msg_hdr_len,
+		     sizeof(*out_trans) + sizeof(struct wire_addr_size_pair)) >
+		     QAIC_MANAGE_EXT_MSG_LENGTH)
 		return -ENOMEM;
 
 	if (in_trans->addr + in_trans->size < in_trans->addr || !in_trans->size)
@@ -635,7 +633,7 @@ static int encode_activate(struct qaic_device *qdev, void *trans, struct wrapper
 	msg = &wrapper->msg;
 	msg_hdr_len = le32_to_cpu(msg->hdr.len);
 
-	if (msg_hdr_len + sizeof(*out_trans) > QAIC_MANAGE_MAX_MSG_LENGTH)
+	if (size_add(msg_hdr_len, sizeof(*out_trans)) > QAIC_MANAGE_MAX_MSG_LENGTH)
 		return -ENOSPC;
 
 	if (!in_trans->queue_size)
@@ -719,7 +717,7 @@ static int encode_status(struct qaic_device *qdev, void *trans, struct wrapper_l
 	msg = &wrapper->msg;
 	msg_hdr_len = le32_to_cpu(msg->hdr.len);
 
-	if (msg_hdr_len + in_trans->hdr.len > QAIC_MANAGE_MAX_MSG_LENGTH)
+	if (size_add(msg_hdr_len, in_trans->hdr.len) > QAIC_MANAGE_MAX_MSG_LENGTH)
 		return -ENOSPC;
 
 	trans_wrapper = add_wrapper(wrappers, sizeof(*trans_wrapper));
-- 
2.39.2

