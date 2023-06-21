Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2B7A737C2A
	for <lists+kernel-janitors@lfdr.de>; Wed, 21 Jun 2023 09:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbjFUHV6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 21 Jun 2023 03:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231279AbjFUHV4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 21 Jun 2023 03:21:56 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE1A1A8
        for <kernel-janitors@vger.kernel.org>; Wed, 21 Jun 2023 00:21:54 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f122ff663eso7493232e87.2
        for <kernel-janitors@vger.kernel.org>; Wed, 21 Jun 2023 00:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687332112; x=1689924112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CZmvVILTRUYuuna4kyNwmHz+05y6e9HA767/dDY6Eos=;
        b=j4sioODyzUl2U16EBi+muzNb7LYcgJA6zqvzuGHn+vI7biXRHaBxjp/KvIY5JGYSg1
         V93xDmp5YKIUTvcxnsVUhGgG0O8B3tYnuy4qH3/FXPcYRdlT1lSZgsmssFhLpTwE84Ok
         WBAibyM4ulyOyRGMKglLCtJvNULodeek/M1GGq/CWvA1s0O1qezOrquDPGL5ifyeiqoD
         oLP+RFptBUgGSCZWhn6n/s9zBPo1as5FzLKJjepV0GpHUwx7IX9RYvV8QU2zY/IraA5X
         +RB3O+kMVFcbpy9ptWU4cpYRPtBNhzlg/U2+sKbhDxNhwYmFSaXzh0VkNQIBp92AulL8
         tDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687332112; x=1689924112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CZmvVILTRUYuuna4kyNwmHz+05y6e9HA767/dDY6Eos=;
        b=HrEieMUiONhOiPxeeXdGsKNPWKCEbSYX+Es5/y6r4EOp254Gzmqq6ihZUwzfD4aFm6
         p5Rsw0dYrR/gn+XPr/y/PV6P4oMk0lGHrRO420lidnAU/UIdhN83wwFkEl6LANOllOIV
         j+0D2BxRpOQXFRfZkZppcrO1w58HBsYpOp6MWmZeh5AXN7JcfBVdNyqbSRvqJic+PKDG
         k7SzLsrtHBhNEF52h9yOOm91XqkwNW3HFJmMBojMPpItgSKgmcGZOLJZVYomy3Obf0jO
         KpwgY3Iw3acGBodSUptSRlZDStlc0VzOLgFRVQDcJyWQ2xTxrzhToijLo2DDfsHjfPRt
         g0zA==
X-Gm-Message-State: AC+VfDzzYfAxnzPtB6sEtRzSKT99wbtzsSIU++/B0aHuaMfCQbzIbZLo
        aQbsl266BmTk4gdMJXwyxibE4A==
X-Google-Smtp-Source: ACHHUZ5i3hbZ+EY2u3cWMm7/VxqrPuRBkipz14YmZjC2dPxHjO1DIo3PL18tiL8tunWtmNyDMhgh3g==
X-Received: by 2002:a19:5f4f:0:b0:4f9:5718:70b0 with SMTP id a15-20020a195f4f000000b004f9571870b0mr1039020lfj.41.1687332112158;
        Wed, 21 Jun 2023 00:21:52 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j10-20020a5d604a000000b0031272fced4dsm3671556wrt.52.2023.06.21.00.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 00:21:50 -0700 (PDT)
Date:   Wed, 21 Jun 2023 10:21:47 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 2/5] accel/qaic: tighten bounds checking in decode_message()
Message-ID: <e94567c5-0478-4bdf-84fc-5709df0b3392@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af83549b-ccb4-4a8d-b036-9359eba9d39f@moroto.mountain>
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Copy the bounds checking from encode_message() to decode_message().

This patch addresses the following concerns.  Ensure that there is
enough space for at least one header so that we don't have a negative
size later.

	if (msg_hdr_len < sizeof(*trans_hdr))

Ensure that we have enough space to read the next header from the
msg->data.

	if (msg_len >= msg_hdr_len - sizeof(*trans_hdr))
		return -EINVAL;

Check that the trans_hdr->len is not below the minimum size:

	if (hdr_len < sizeof(*trans_hdr))

This minimum check ensures that we don't corrupt memory in
decode_passthrough() when we do.

	memcpy(out_trans->data, in_trans->data, len - sizeof(in_trans->hdr));

And finally, use size_add() to prevent an integer overflow:

	if (size_add(msg_len, hdr_len) > msg_hdr_len)

Fixes: 129776ac2e38 ("accel/qaic: Add control path")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/accel/qaic/qaic_control.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index a51b1594dcfa..78f6c3d6380d 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -955,15 +955,23 @@ static int decode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
 	int ret;
 	int i;
 
-	if (msg_hdr_len > QAIC_MANAGE_MAX_MSG_LENGTH)
+	if (msg_hdr_len < sizeof(*trans_hdr) ||
+	    msg_hdr_len > QAIC_MANAGE_MAX_MSG_LENGTH)
 		return -EINVAL;
 
 	user_msg->len = 0;
 	user_msg->count = le32_to_cpu(msg->hdr.count);
 
 	for (i = 0; i < user_msg->count; ++i) {
+		u32 hdr_len;
+
+		if (msg_len >= msg_hdr_len - sizeof(*trans_hdr))
+			return -EINVAL;
+
 		trans_hdr = (struct wire_trans_hdr *)(msg->data + msg_len);
-		if (msg_len + le32_to_cpu(trans_hdr->len) > msg_hdr_len)
+		hdr_len = le32_to_cpu(trans_hdr->len);
+		if (hdr_len < sizeof(*trans_hdr) ||
+		    size_add(msg_len, hdr_len) > msg_hdr_len)
 			return -EINVAL;
 
 		switch (le32_to_cpu(trans_hdr->type)) {
-- 
2.39.2

