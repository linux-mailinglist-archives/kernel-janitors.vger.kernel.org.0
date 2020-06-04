Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 234341EDEAC
	for <lists+kernel-janitors@lfdr.de>; Thu,  4 Jun 2020 09:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728029AbgFDHlI (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 4 Jun 2020 03:41:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727105AbgFDHlG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 4 Jun 2020 03:41:06 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ED8EC05BD1E
        for <kernel-janitors@vger.kernel.org>; Thu,  4 Jun 2020 00:41:05 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id c3so4909315wru.12
        for <kernel-janitors@vger.kernel.org>; Thu, 04 Jun 2020 00:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=7ANSCRHoGP+yLgZ4w++LPSO7krhwJHNme8PNHzorV40=;
        b=qIrP0H3N/9Py644cE7DBX0T7bY9J9xZFEY1XClWzqAEbeSOdEPlpTCGO93VjQgNnoS
         h/byYR4vrPUhXvZBEihjeyX3zapMx5ISLMlf0MrfIAtKCJHpjmqcHFdCxb8SD1878bZW
         TTQUoc/l8QcyiLb8z82+0E7oHfAxP0Y7UKQ9dezoJ7bgC0ZKmZiiebDu1Huet1PC0BGe
         +O5Csy4A6ofqiMQ3B9tVp1tk2tVizCkNgMvzIkid9OHLqjxV2mfHB3yhcGAdmeq06p79
         MdFy+kXE2l9iBjpaVGO0OBQHYDa91E0Rrru7FZt30jRXUlD5NwGX4+Ly9sV9JlzWCcWu
         gH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7ANSCRHoGP+yLgZ4w++LPSO7krhwJHNme8PNHzorV40=;
        b=bRgZh1Q6Pk9PkrKkSVi1Tb9GhxG+BxxFsxX8X99gk+vI2SOKoSuBBg9pVqWXAy2fSX
         zpj7Te8Ei58NUljJTWgbmstQWr0mBDGK5byle7dfH7R4qr+czzFrXegSvt+eYtUnIR7B
         RKZvPgpnBLdGw6jNNqfZgKx46iwM5guYHCEpOaUq7PI+ou1lvJA7fBFuOAs6wsr0rwrD
         298Y8oeebNrZrzbB5qYy1hbYduXQdqtd/dlX7XB5UK9GqXM2+sMkb8f9Sl4ebIB68S8c
         11fqGLBu7dE4+MJQRCETbTOH2/nEyj/Z5ZioShAexc5exSqz+z7T5cn8jWTsSP2ETk84
         4YCw==
X-Gm-Message-State: AOAM532MIi1kzPwY+XC5Xfs+oWhDNrkHNbsXKmhBqPoo5b6NdEDQp3++
        6L6eUzfRHvnI7IMCXskMZ0cU29oi9lw=
X-Google-Smtp-Source: ABdhPJyhFqgZpjvkbRqAIjH5z/p0+HwMwTMFfsljLtGeh5V8gmW45GgN5zOXyFqaLpClsh++3uVHRQ==
X-Received: by 2002:adf:82ab:: with SMTP id 40mr2927340wrc.85.1591256463800;
        Thu, 04 Jun 2020 00:41:03 -0700 (PDT)
Received: from dell ([95.147.198.92])
        by smtp.gmail.com with ESMTPSA id z12sm7257136wrg.9.2020.06.04.00.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 00:41:03 -0700 (PDT)
Date:   Thu, 4 Jun 2020 08:41:01 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jassi Brar <jassisinghbrar@gmail.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mailbox: mailbox-test: Fix a potential Oops on
 allocation failure
Message-ID: <20200604074101.GV3714@dell>
References: <20200603103329.GB1845750@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200603103329.GB1845750@mwanda>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 03 Jun 2020, Dan Carpenter wrote:

> The callers are expecting NULL on error so if we return an error pointer
> it eventually results in an Oops.
> 
> Fixes: 8ea4484d0c2b ("mailbox: Add generic mechanism for testing Mailbox Controllers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/mailbox/mailbox-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
