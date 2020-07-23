Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2436822B4BF
	for <lists+kernel-janitors@lfdr.de>; Thu, 23 Jul 2020 19:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730036AbgGWRVq (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 23 Jul 2020 13:21:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728600AbgGWRVp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 23 Jul 2020 13:21:45 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63DBBC0619DC
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Jul 2020 10:21:45 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id f18so5920764wml.3
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Jul 2020 10:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=6NzrDM0ds5Yq5Je7cF0j6pK/Nn47qBuFSLY+rgHwqcM=;
        b=O87D55zOerszxleRneUW3MsL3Zcd/jynvRl4ZJp2B9KRGsqryhhzayQiv8NTtDZpP4
         qZdrNrHTVRay+czuHzrs2CZcwVK/M87/PfEqZ/7/R3ITkIjH1NDgIIOgjPkz5CEAvh8p
         Hc9RP/pNzBGnSpgurklYAWeixQYDOi3HFUJ+OGaW4azU8OVv08rUxYFNbJbl6Tm+iBdt
         2Ln/c+ZUxnroc64F6RakcttGTMeFnzRfatLcHEsrKvwtnfFn/yRdAPLT8a+WBhSF1f6+
         3fLvJl2HIkK2TJNPssEUsyFM5RuNLqccpqlfkJcVH+GrquDvwzJGhUrUq0M4SQPRMAtH
         h7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6NzrDM0ds5Yq5Je7cF0j6pK/Nn47qBuFSLY+rgHwqcM=;
        b=UdFOT6AUR4ZR18Jnp41CaUpJhVoIev7mCCz2g1mLehewPz5L48sa+68lA+x+jDU+hl
         /ih/b1QcE+duvy65VAkPgBTua9RxJJDMWkauZ2VQOhLPHzNIiqMxtTOw6lDNT4Cre37o
         OLCW+CAd7SHVPgDNYSlAqOFgVye9WNf7sFDDALwJpLXQi5hhbdn2GWG0w8GYShfRKFYc
         OYpeyZiS3MQICxokSX2OvfhDIs8ZbZSEhqiMVo/EBhuga4qIrmvEMVHSFSDxsesOkq2d
         BrJLVkv93KeaULcC2pAvm9CskZRMhTnH0JrMCkr1aRpcsHSvSzVySEkac5CPYz+zyfEH
         cKOQ==
X-Gm-Message-State: AOAM53281yCpX5Mm4HT8/b0XfeN/PPU+TO+Bbxt2KXMgWwIeSOUYT2UN
        kRasXfnpvzxpNxzBj9EGa7K9/A==
X-Google-Smtp-Source: ABdhPJwQCI0nkTlQ5dq9lK678xybKH15GLIY+72H7Gu/eRtHbRJyKIU6hxiqf2dlcWvEAZztEcQ6oQ==
X-Received: by 2002:a1c:2045:: with SMTP id g66mr4785936wmg.184.1595524904039;
        Thu, 23 Jul 2020 10:21:44 -0700 (PDT)
Received: from dell ([2.27.167.73])
        by smtp.gmail.com with ESMTPSA id s19sm4982242wrb.54.2020.07.23.10.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 10:21:43 -0700 (PDT)
Date:   Thu, 23 Jul 2020 18:21:41 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: max14577: remove redundant initialization of
 variable current_bits
Message-ID: <20200723172141.GB1126023@dell>
References: <20200723161541.994669-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200723161541.994669-1-colin.king@canonical.com>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 23 Jul 2020, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable current_bits is being initialized with a value that is
> never read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/mfd/max14577.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
