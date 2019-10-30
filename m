Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 078C5EA1C8
	for <lists+kernel-janitors@lfdr.de>; Wed, 30 Oct 2019 17:30:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbfJ3Qaq (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 30 Oct 2019 12:30:46 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40075 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726206AbfJ3Qaq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 30 Oct 2019 12:30:46 -0400
Received: by mail-pf1-f193.google.com with SMTP id r4so1934371pfl.7
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Oct 2019 09:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=frY6rw5HiV1E5VHgu13X5DYK6Y+AvDh4NtUT+hC+PqI=;
        b=xiVSPGDxmxZceTHX1TwbfKwSgrTnCXP1keP3yqLhCb2QykhTGMfAISQG0TV7mFhF+P
         aQEvPOX5/IvbMuwfcTeAfQsMyfpgq0qiKArAolTyu6qrvi05TOxS6g3gO7mhmaPqXp/F
         W1sD2dXJ3M9Y4HA0CJzYRFjL4gaQoo8r7h84OuAUvMHITOH9XX5jZGRMCZiVakWLGaoc
         XF2PDT4UISxQWOkJCTQnMNhbfUx2sjXBfH3zxLnIrgn1U/BpjpLmoumfFIUcRYGp7/Bn
         vQokEpZUa9jq9ARePC+qprFT1pUjfS8Su6HSkYELXXWb0rvseVFb1dPnh3wp6q4Eso/C
         hs+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=frY6rw5HiV1E5VHgu13X5DYK6Y+AvDh4NtUT+hC+PqI=;
        b=e3zmNw+EU7AG+ubjgaCpw7yCAmW+yYwbj+h4UEMgf73RWqkRw/XxMCEC+X3kNUvUed
         ETZtnZ3SE6bylZXDlJSdYalFlBd0rXdJs87uX685SC4cfP91w0B5RZaUqX+WlSTxBuGW
         TiXFdqQFS5jCXgcxsUvUDZRPNcMRQoY3qiMf8F/HlscY/w/paoIK7E9D2KXQPTXcGgMg
         AXLz4mkR1tiuj0jkVpXtKVcAxVjfyQRAykdySS2TBy3oiX4iljdWEtwCXWJWZRAdqlyr
         XA8AdgzS+1QpwDDxYEuWoOqjIrRek3vvym/zPm1Rb4jWTCYJEYPWaw4BQS9HirEkPd8j
         iACg==
X-Gm-Message-State: APjAAAV0Y+7yxgbEDMwCM1Mir/GbPANMQgMNV10E6EbaCBuZSFTQG7Ui
        /Fzjmt714cJtfUdHB1o8uTKw3g==
X-Google-Smtp-Source: APXvYqxGP0mpS9c5+JBz15CTK6yxsgrFNZFBJzidVG93iroVyV1o1u9ByvmoY2tHDbIZRN1EQwda6Q==
X-Received: by 2002:a62:5442:: with SMTP id i63mr151097pfb.220.1572453045057;
        Wed, 30 Oct 2019 09:30:45 -0700 (PDT)
Received: from localhost.localdomain (c-67-170-172-113.hsd1.or.comcast.net. [67.170.172.113])
        by smtp.gmail.com with ESMTPSA id o1sm388483pgm.1.2019.10.30.09.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 09:30:44 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Colin King <colin.king@canonical.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <brian.starkey@arm.com>,
        "Andrew F . Davis" <afd@ti.com>, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] dma-buf: heaps: Fix redundant assignment to variable ret in system_heap.c
Date:   Wed, 30 Oct 2019 16:30:40 +0000
Message-Id: <20191030163040.70055-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Colin King reported a coverity error:
 The variable ret is being assigned with a value that is never
 read, it is being re-assigned the same value on the err0 exit
 path. The assignment is redundant and hence can be removed.

He had a fix, but Andrew Davis suggested a better solution
(actually returning ret), so this patch implements that fix.

Cc: Colin King <colin.king@canonical.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Laura Abbott <labbott@redhat.com>
Cc: Brian Starkey <brian.starkey@arm.com>
Cc: Andrew F. Davis <afd@ti.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: kernel-janitors@vger.kernel.org
Addresses-Coverity: ("Unused value")
Fixes: 47a32f9c1226 ("dma-buf: heaps: Add system heap to dmabuf heaps")
Reported-by: Colin Ian King <colin.king@canonical.com>
Suggested-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/dma-buf/heaps/system_heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 455782efbb32..9a56393e40b4 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -98,7 +98,7 @@ static int system_heap_allocate(struct dma_heap *heap,
 err0:
 	kfree(helper_buffer);
 
-	return -ENOMEM;
+	return ret;
 }
 
 static const struct dma_heap_ops system_heap_ops = {
-- 
2.17.1

