Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADE487365B8
	for <lists+kernel-janitors@lfdr.de>; Tue, 20 Jun 2023 10:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231700AbjFTIGw (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 20 Jun 2023 04:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231712AbjFTIGn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 20 Jun 2023 04:06:43 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2543E68
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Jun 2023 01:06:41 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f9b1a117caso15795255e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Jun 2023 01:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687248400; x=1689840400;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dpAf75Epa+861D9oY47tt3qyQ5zTBW5nFqUpj0OqmkY=;
        b=NoKTco0j3qXXxRS4tA6dTQdBwGyaAIqG8priYh8yO7q/N5QHL7J4gihRXmYSgneAv9
         OB8Rzi9P2DzQDHw4wmh3vIqHiteD8ebBbrIb99MAYl0uEKDG4PyYYjm4tMJgPAjEJdX1
         HJgG4gqMXxUFkE1caDD3JpznsxPWCBvPYXXH0LzbM4IdvCmIBNi+2rH7cEKCz1Go8b1I
         V5nt2C0tOeCRH1TknlOGg8pu4SDFB34+d4Shnce48xVYdZsp4OgUBj2rwno43qSZ+h8P
         9K3KkOyQWFXYd1StonSOUuhZZhTE1ofk/TajhZIKP4peVK5H1d7NW5Ah+/sbBNda4a7k
         s1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687248400; x=1689840400;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dpAf75Epa+861D9oY47tt3qyQ5zTBW5nFqUpj0OqmkY=;
        b=AkIhGCKTInDQIo0nXAFPt92NQs5EY2+D81tTOiyEgh6MOMdwqADOKXQLOtbQ5xNfVP
         oVP6rRI2L92vk6e75u0c/wrXY8xlIPtlKi+ZrNUqPCj2XXGMH+vqTVkoFi+m+PBMOdpj
         fLXD8nMQPJTGSFklw8nnQZd8VLcZwMGjefCxMCm9+14uF1/jh4dvETl+u8gK1d1cbpoJ
         gYzDOJ/JuhJ6pz+XXTxwrfd7J0pB53jyj2DlxL4F0IklaGdnVJE3AIwL7atRCKRtNjcE
         /eb1c5NR7dytJcYxRagjAm2m4zqKap1X3PQgAY50glV6ci3kCBYWsZeQDPN+TY7rz9kG
         7KfA==
X-Gm-Message-State: AC+VfDzacGepShmV0/4N77AhlWAxBSxSPrOPLG9UU+CTLniAqmelUyNg
        Igt3YCPTh+QZpMSqh+6AQc0m0F1M4WkzQMkdzHc=
X-Google-Smtp-Source: ACHHUZ7Iq5zLnkiPfQeKWzTl+u5DgpbsE0Nx3NaaeVH1Se7g4hl0Y4B42OMwGaUHOncBRff/bAZe9w==
X-Received: by 2002:a1c:4c14:0:b0:3f9:b0c2:9ff7 with SMTP id z20-20020a1c4c14000000b003f9b0c29ff7mr3182486wmf.30.1687248400328;
        Tue, 20 Jun 2023 01:06:40 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k9-20020a7bc409000000b003f9b24cf881sm4093945wmi.16.2023.06.20.01.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 01:06:38 -0700 (PDT)
Date:   Tue, 20 Jun 2023 11:06:34 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Ivan Orlov <ivan.orlov0322@gmail.com>,
        Immad Mir <mirimmad17@gmail.com>
Cc:     WANG Xuerui <kernel@xen0n.name>,
        Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] LoongArch: Delete debugfs checking
Message-ID: <7627f2b9-2287-46d2-b461-d33aa69931a8@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Debugfs functions are not supposed to be checked for errors.  This
is sort of unusual but it is described in the comments for the
debugfs_create_dir() function.  Also debugfs_create_dir() can never
return NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
I spotted this code because I was looking at patches which were sent
to stable but without a Fixes tag.  The correct way of checking for
error pointers is not IS_ERR_OR_NULL(), it's IS_ERR().  When a function
returns both error pointers and NULL, the NULL should be treated as a
special kind of success.  Please see my blog for more details.

https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

I have not included a Fixes tag here, because it's not really a bug fix,
it's just a clean up.

 arch/loongarch/kernel/unaligned.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/loongarch/kernel/unaligned.c b/arch/loongarch/kernel/unaligned.c
index 85fae3d2d71a..3abf163dda05 100644
--- a/arch/loongarch/kernel/unaligned.c
+++ b/arch/loongarch/kernel/unaligned.c
@@ -485,8 +485,6 @@ static int __init debugfs_unaligned(void)
 	struct dentry *d;
 
 	d = debugfs_create_dir("loongarch", NULL);
-	if (IS_ERR_OR_NULL(d))
-		return -ENOMEM;
 
 	debugfs_create_u32("unaligned_instructions_user",
 				S_IRUGO, d, &unaligned_instructions_user);
-- 
2.39.2

