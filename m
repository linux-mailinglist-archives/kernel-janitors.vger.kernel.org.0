Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2547D112E
	for <lists+kernel-janitors@lfdr.de>; Fri, 20 Oct 2023 16:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377429AbjJTOHJ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 20 Oct 2023 10:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377512AbjJTOHI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 Oct 2023 10:07:08 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C65251A8
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Oct 2023 07:07:06 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4064876e8b8so7402415e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Oct 2023 07:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697810825; x=1698415625; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AEt/75FaiyiDkjvNY3gfpUDmE+gdWB2DPAqGukeS3XA=;
        b=ky76O4zH+oPOowISCpAcG2zONvz5TJ1ZQtaTcYXF6+/d8B5ckKU6K82rljIdvWcHmV
         q6DG9bUvqbLOtsJi1wMa5rIXkhXO7csVXCXvBz6yYyqRz94smXwbU9BdyGKCiiYpHs/L
         vkYQu3sqkiC6xfdzOSF3d7oftb7op2oOzV5HVMvDdXWhdNCskCXGwXmg3DOSc9bVO4HJ
         tgm3ZdhdiZdPPwGzi58Bt2GZZp0xQcgddmzFsljd0ffrj8jfNbtNJS1cJvOLQwNZaooh
         aY0mjSyyNVGe+OC2A395VTvuXSygo39NIs6qYLEx3t26UKZEoVss/uund5rZd1Vhxp6V
         FEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697810825; x=1698415625;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AEt/75FaiyiDkjvNY3gfpUDmE+gdWB2DPAqGukeS3XA=;
        b=CicFMFMzFu+7zPISEWOoEWsJR9V52OUY+miLRtbqVZhvbwbHnedmMCM2n7Uf0u72pQ
         obzlIi7vBZm+fKT2hQJ+WV5Q1v0bgpaQhPh6mMM+SoAQ8Ykn3HqK6yn0nFm1HbRyiLBu
         9sBOJtMZAIYX/UGy4cdmjAkwZsqyLVFJIKA4VTDJmy0wBnX/w7/OmkOZrGwxMV9veTuL
         tYnVUxW0DYD95PhUj5XlM4SEpe2I6LbT8TJniL6smRFsW5OxiRU1TnyDDI739lUOuQt2
         Rzoeus0TpB2a+rPSYMjzDXSKD5l8dy4yDJYg5/aKYNlKRoooItGcWh8UBmKWWx5WC7gY
         xeXQ==
X-Gm-Message-State: AOJu0YxoOT57DcWx9Tk0k9NJEGYLIMPxeEOzznk4t6UlQwA3kgV/cJAE
        fv8/tPhUBzPdgoj3tUKyyKhTYg==
X-Google-Smtp-Source: AGHT+IEMaJB8Dy7SAmPCPzTypXxxjPGx3Fy+T1gzlJXV+/wAZLTIbm0oiP5Dq/V0Xiqhn3gcuEUwXQ==
X-Received: by 2002:adf:ea0c:0:b0:32d:a49c:dfd1 with SMTP id q12-20020adfea0c000000b0032da49cdfd1mr1416002wrm.48.1697810825077;
        Fri, 20 Oct 2023 07:07:05 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t18-20020a5d6a52000000b0032db8cccd3asm1737492wrw.114.2023.10.20.07.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 07:07:04 -0700 (PDT)
Date:   Fri, 20 Oct 2023 17:07:00 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Namjae Jeon <namjae.jeon@samsung.com>
Cc:     Namjae Jeon <linkinjeon@kernel.org>,
        Steve French <sfrench@samba.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tom Talpey <tom@talpey.com>, Hyunchul Lee <hyc.lee@gmail.com>,
        Ronnie Sahlberg <lsahlber@redhat.com>,
        linux-cifs@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ksmbd: prevent some integer overflows
Message-ID: <205c4ec1-7c41-4f5d-8058-501fc1b5163c@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "payload_sz" comes from the user and it can be to U32_MAX.  On a
32bit system that could lead to integer overflows and crashing.

Fixes: 0626e6641f6b ("cifsd: add server handler for central processing and tranport layers")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/smb/server/transport_ipc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/smb/server/transport_ipc.c b/fs/smb/server/transport_ipc.c
index b49d47bdafc9..086e5ee4ebb3 100644
--- a/fs/smb/server/transport_ipc.c
+++ b/fs/smb/server/transport_ipc.c
@@ -227,9 +227,8 @@ static void ipc_update_last_active(void)
 static struct ksmbd_ipc_msg *ipc_msg_alloc(size_t sz)
 {
 	struct ksmbd_ipc_msg *msg;
-	size_t msg_sz = sz + sizeof(struct ksmbd_ipc_msg);
 
-	msg = kvzalloc(msg_sz, GFP_KERNEL);
+	msg = kvzalloc(size_add(sizeof(struct ksmbd_ipc_msg), sz), GFP_KERNEL);
 	if (msg)
 		msg->sz = sz;
 	return msg;
@@ -709,7 +708,7 @@ struct ksmbd_rpc_command *ksmbd_rpc_write(struct ksmbd_session *sess, int handle
 	struct ksmbd_rpc_command *req;
 	struct ksmbd_rpc_command *resp;
 
-	msg = ipc_msg_alloc(sizeof(struct ksmbd_rpc_command) + payload_sz + 1);
+	msg = ipc_msg_alloc(size_add(sizeof(struct ksmbd_rpc_command) + 1, payload_sz));
 	if (!msg)
 		return NULL;
 
@@ -757,7 +756,7 @@ struct ksmbd_rpc_command *ksmbd_rpc_ioctl(struct ksmbd_session *sess, int handle
 	struct ksmbd_rpc_command *req;
 	struct ksmbd_rpc_command *resp;
 
-	msg = ipc_msg_alloc(sizeof(struct ksmbd_rpc_command) + payload_sz + 1);
+	msg = ipc_msg_alloc(size_add(sizeof(struct ksmbd_rpc_command) + 1, payload_sz));
 	if (!msg)
 		return NULL;
 
@@ -782,7 +781,7 @@ struct ksmbd_rpc_command *ksmbd_rpc_rap(struct ksmbd_session *sess, void *payloa
 	struct ksmbd_rpc_command *req;
 	struct ksmbd_rpc_command *resp;
 
-	msg = ipc_msg_alloc(sizeof(struct ksmbd_rpc_command) + payload_sz + 1);
+	msg = ipc_msg_alloc(size_add(sizeof(struct ksmbd_rpc_command) + 1, payload_sz));
 	if (!msg)
 		return NULL;
 
-- 
2.42.0

