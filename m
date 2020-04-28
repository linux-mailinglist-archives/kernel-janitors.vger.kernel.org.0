Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35D471BBB61
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 Apr 2020 12:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgD1Kj0 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 28 Apr 2020 06:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726335AbgD1Kj0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 28 Apr 2020 06:39:26 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DADC8C03C1A9
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Apr 2020 03:39:25 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id g13so24038439wrb.8
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Apr 2020 03:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=80sgaI4V0GcoX09oHFdbjGz6NLLhGSyR/ATMNQ5JFUg=;
        b=KS7057pWE5Y3f6NX4Rf0u1UU51Wh7W5BrXh4bhGUOZ3N27k8Mna6+KeaRUL1/cew8A
         Zv65yxTYa5KCTTUXf77KIOfc4+o+qYsA1IaSdrNDJNfQYTM7AgG+byIIzsLahp2diQUp
         yi6kv4AKlOdjnY+i9SIaPtOCf2CWXf0rLQIYHl4yrR0ZVyHVo/G6nS1iFttdoZy79d8+
         7c2ruAgUCtMl+KCB+bCBYWwenNnWF+yOQlTSijHQCstZWYYmu3qq9fYhVJmuvBAn3frs
         unkxkzK4N3wV11/pc05dF5HwH80dG8t6dmllRox6fiF6ZOHt3/IikSRX0/c72nnebqgf
         M7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=80sgaI4V0GcoX09oHFdbjGz6NLLhGSyR/ATMNQ5JFUg=;
        b=Fov2INGyQb4x23MbBTaS13oQcsz1kykTFEDk0TOaAGtHOqE8DVIG4pz0vC+wDa0tRx
         QAI17LLNl25/hrXzvrSOUewK93w0G1ylghkYAQ2aLvAM82Mh10Vy8r9uO02i/MPHxv9C
         /w9ZkmsyDmrqqu2fa3yVHTaS900MhfWIh42t07fNJaJGbh3IrE+fNGxHMppRyqUnHHOw
         iwaWIJm7gGD4JXgg4UwS8aaSdp/CFFjeFLa7zeI230gDIPngdlR4VTXiL6OH4u8Dl8pJ
         KrJie4kw4D6uPCX8u6kHxslX92LXcELG1OgpWXBsTzlss7qN5XMz/YesQuhPx08H1kou
         l5qw==
X-Gm-Message-State: AGi0PuZB+TUT0mvdZDzrOpUNiDZCGjzdCBRFjMmS/4RVoZbauqbDc63l
        ZBz0xJtBigoe+AtWq0JCiKVOFw==
X-Google-Smtp-Source: APiQypJWtjWbQvJyFN4AqxsjlS5T7yW1mWgp+uBZ0F+u4QDyM78njpCwg+bWGhNV3ynTqCfuP0gYwg==
X-Received: by 2002:adf:ce0a:: with SMTP id p10mr31435246wrn.89.1588070364624;
        Tue, 28 Apr 2020 03:39:24 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id y18sm2914896wmc.45.2020.04.28.03.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 03:39:24 -0700 (PDT)
Date:   Tue, 28 Apr 2020 11:39:22 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mfd: wcd934x: Drop kfree for memory allocated with
 devm_kzalloc
Message-ID: <20200428103922.GS3559@dell>
References: <20200427110805.154447-1-weiyongjun1@huawei.com>
 <20200427122922.56643-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200427122922.56643-1-weiyongjun1@huawei.com>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 27 Apr 2020, Wei Yongjun wrote:

> It's not necessary to free memory allocated with devm_kzalloc
> and using kfree leads to a double free.
> 
> Fixes: 6ac7e4d7ad70 ("mfd: wcd934x: Add support to wcd9340/wcd9341 codec")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/mfd/wcd934x.c | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
