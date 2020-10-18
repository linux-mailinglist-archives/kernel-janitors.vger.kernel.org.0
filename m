Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70D0F291630
	for <lists+kernel-janitors@lfdr.de>; Sun, 18 Oct 2020 07:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbgJRFtQ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 18 Oct 2020 01:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgJRFtQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 18 Oct 2020 01:49:16 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4143DC061755
        for <kernel-janitors@vger.kernel.org>; Sat, 17 Oct 2020 22:49:16 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id l16so7095313ilt.13
        for <kernel-janitors@vger.kernel.org>; Sat, 17 Oct 2020 22:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=h6fSw91VK5+UnHRwQT2DsRPhWFdgQvDJdhFHYUiuCJc=;
        b=Nylu+pvxJsfQPtOs8u1TDI7sO5P6MO8Xf3ZkwcNwhbqeLxaZjQHEX2AWA+uaJj+GpJ
         p0/8RnodRMbZXPpD+oqEDkZ5cZC4w8vWfPULpZo+USmtzylPRmmO36+kgBcA6rdrUa+w
         WUjwcoMTOsrAs/RIRaHOZC3GfoOFAJwYI310l4AAN1xJ3y4for6uO8LSsDyXJJUEIpMH
         axy70D+/hw+sFyLviJjr79sQaIB5LAfqFXCK/XBRSDnF4DuzhlaFZjbw+afkDRs5N+U3
         ZRGYUy7LK2Hq30CVUXrlGNPnkUQchuph1pBSDir1vSjKJUSfA8svmLafUirXXO3sbC+8
         cZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=h6fSw91VK5+UnHRwQT2DsRPhWFdgQvDJdhFHYUiuCJc=;
        b=q7vdZKXBirf+WErimYwNpAhUb2NBVo4MknJtXH+SyOaDk29sZjKgM5KBfcEKSku4bK
         AbXgcEIsw88xrlxVLU1sFjEbcVn9u/CKaJtFVtnLKWiQqnZojW/b6izM81h39oqSk43J
         DwCSmLovXr0rkT+adqTFYVKjCKr6FoH+Y9izNjVsH7uHyVjRn6mPKENM2MDXVBOOSNcQ
         GqAuiG0B1E7VvEdfmRr7H1XRb5Rx9A88qOU933yGmc2Gw6PLjM/2iGzaAW9FRH3/044c
         Cor0v+fh4TyfIQDgbcO0kMev0pGitiStnx33aegCspwhOyv248qXeWJz+BerC9Z0u3dU
         7IdQ==
X-Gm-Message-State: AOAM532Ss7B4iTm8ovpLsuhrnaDR1m/b9YwkTu22rfVQiu6qkVJ8L+VE
        Jh2tRvwdggibIhpR5nf2WNr0tm2N/CEw0XeY
X-Google-Smtp-Source: ABdhPJxHEsgKqrWFu8/HBjglKNzk0BJcT9cR5gTrM0XEfhajUG8TfoUwzlx23jSriJpAsWHeJqAqug==
X-Received: by 2002:a92:d248:: with SMTP id v8mr7265515ilg.297.1603000155464;
        Sat, 17 Oct 2020 22:49:15 -0700 (PDT)
Received: from fedora-thirty-three ([62.182.99.133])
        by smtp.gmail.com with ESMTPSA id o13sm6378494iop.46.2020.10.17.22.49.14
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 22:49:14 -0700 (PDT)
Date:   Sun, 18 Oct 2020 01:49:12 -0400
From:   Nigel Christian <nigel.l.christian@gmail.com>
To:     kernel-janitors@vger.kernel.org
Subject: [PATCH] hw_random : platform_get_irq() already prints an error
Message-ID: <20201018054912.GA76941@fedora-thirty-three>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

coccicheck
drivers/char//hw_random/imx-rngc.c:256:2-9: line 256 is redundant because platform_get_irq() already prints an error

Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
---
 drivers/char/hw_random/imx-rngc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/imx-rngc.c
index 61c844baf26e..69f13ff1bbec 100644
--- a/drivers/char/hw_random/imx-rngc.c
+++ b/drivers/char/hw_random/imx-rngc.c
@@ -253,7 +253,6 @@ static int imx_rngc_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq <= 0) {
-		dev_err(&pdev->dev, "Couldn't get irq %d\n", irq);
 		return irq;
 	}
 
-- 
2.28.0

