Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24D20BBC5F
	for <lists+kernel-janitors@lfdr.de>; Mon, 23 Sep 2019 21:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728761AbfIWTsp (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 23 Sep 2019 15:48:45 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:52366 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728561AbfIWTsm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Sep 2019 15:48:42 -0400
Received: from mail-pl1-f197.google.com ([209.85.214.197])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <connor.kuehl@canonical.com>)
        id 1iCUK8-0000jD-Hh
        for kernel-janitors@vger.kernel.org; Mon, 23 Sep 2019 19:48:40 +0000
Received: by mail-pl1-f197.google.com with SMTP id z7so9243218plo.3
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Sep 2019 12:48:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1S3tbuayATJvDzZnpsz9pe1S0VUYhd/3QByEuRe2Xx4=;
        b=YzA2myvbgJPqw0AqQkkfo4BctGDQaY36BUeRxSmc2AbenKHxthIfe2wJKVu/R9Q4Qu
         1wyZ3JhXY6MYM12C5X+XbFFtfkh1aE+VJlKzFLzwMqB3/RFLtB1hikyjSvnHs67IuYXy
         H9Xj1BB1LRq+KWTlN5k5JtTRYEoAEXxTDFc0qMqccKGdRjGTd6/MEX4FmWFusLTsgRuA
         46jSn0Ti0SUF4aYlHZ08daojlcfJpemXJoUtFTLsHQ1Sut4guJg479SJ3L0Y+uKcolt8
         TuhDHicSfvgi9zkiZLaOnl41NHq/TPM6e7Ow8TQsHz5xOVHxdYGB1STiDA6K8l/ImF9z
         SnSw==
X-Gm-Message-State: APjAAAUo1N0Xl9n2i3uDFSyzdEeMhP9k/qINErtzGBCCj30c6vCfJg+x
        w0Agcz4tu0M7tWi40Yk6e4FRYone6ocYH4e6UK+hzPbGRTYFwbMwuKQgGMqxRS6iLUQyVXzbHDZ
        Kg8F29rf0leSOnE69ZgUq9Ed+gpYryzpyOdXH0TZc6aajFA==
X-Received: by 2002:a62:3586:: with SMTP id c128mr1393911pfa.105.1569268119373;
        Mon, 23 Sep 2019 12:48:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxIyO7oQ4DlmMEmBB+e51zn7In6laZj0i5/rIJzv56lsoRzXrY1pqufNNLtuyies+wIQgTOKw==
X-Received: by 2002:a62:3586:: with SMTP id c128mr1393900pfa.105.1569268119227;
        Mon, 23 Sep 2019 12:48:39 -0700 (PDT)
Received: from localhost.localdomain (c-71-63-131-226.hsd1.or.comcast.net. [71.63.131.226])
        by smtp.gmail.com with ESMTPSA id g12sm16477924pfb.97.2019.09.23.12.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 12:48:38 -0700 (PDT)
From:   Connor Kuehl <connor.kuehl@canonical.com>
To:     Larry.Finger@lwfinger.net, gregkh@linuxfoundation.org,
        straube.linux@gmail.com, devel@driverdev.osuosl.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: rtl8188eu: remove dead code in do-while conditional step
Date:   Mon, 23 Sep 2019 12:48:06 -0700
Message-Id: <20190923194806.25347-1-connor.kuehl@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The local variable 'bcmd_down' is always set to true almost immediately
before the do-while's condition is checked. As a result, !bcmd_down
evaluates to false which short circuits the logical AND operator meaning
that the second operand is never reached and is therefore dead code.

Addresses-Coverity: ("Logically dead code")

Signed-off-by: Connor Kuehl <connor.kuehl@canonical.com>
---
 drivers/staging/rtl8188eu/hal/rtl8188e_cmd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/rtl8188e_cmd.c b/drivers/staging/rtl8188eu/hal/rtl8188e_cmd.c
index 47352f210c0b..a4b317937b23 100644
--- a/drivers/staging/rtl8188eu/hal/rtl8188e_cmd.c
+++ b/drivers/staging/rtl8188eu/hal/rtl8188e_cmd.c
@@ -48,7 +48,6 @@ static u8 _is_fw_read_cmd_down(struct adapter *adapt, u8 msgbox_num)
 static s32 FillH2CCmd_88E(struct adapter *adapt, u8 ElementID, u32 CmdLen, u8 *pCmdBuffer)
 {
 	u8 bcmd_down = false;
-	s32 retry_cnts = 100;
 	u8 h2c_box_num;
 	u32 msgbox_addr;
 	u32 msgbox_ex_addr;
@@ -103,7 +102,7 @@ static s32 FillH2CCmd_88E(struct adapter *adapt, u8 ElementID, u32 CmdLen, u8 *p
 		adapt->HalData->LastHMEBoxNum =
 			(h2c_box_num+1) % RTL88E_MAX_H2C_BOX_NUMS;
 
-	} while ((!bcmd_down) && (retry_cnts--));
+	} while (!bcmd_down);
 
 	ret = _SUCCESS;
 
-- 
2.17.1

