Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5B2B277138
	for <lists+kernel-janitors@lfdr.de>; Thu, 24 Sep 2020 14:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbgIXMke (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 24 Sep 2020 08:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727759AbgIXMke (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 24 Sep 2020 08:40:34 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A7E4C0613D3
        for <kernel-janitors@vger.kernel.org>; Thu, 24 Sep 2020 05:40:34 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id j2so3635352wrx.7
        for <kernel-janitors@vger.kernel.org>; Thu, 24 Sep 2020 05:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=b2lDPvNgcW90ATPJ0W6Cm5nzCR7vWtrpBfUZKLwoBYE=;
        b=Whtw4ysULiBOjxfFnqdE6kgGRcEheRG7g1Ju/zSoLoYcs/WE74gfKpw4OHU7h3seU7
         nz6swSb5eDQ7L9bgCwxZJ2eWUmNIGgLBn/SU9k56Zx8rv2iQDJOQI4M0iLY+mDF0Wa2+
         PYweCxZtwn18ZAcsAqO+iZzxo69cAX2Wr/orsbNrXYxufMlOQqlcRt4UYe1bcbGPsrEQ
         hQ2hU5xQaxp4SCezw91qP5usR+IE532hKc2MSm6VVq3ulWtV3lJsoGaqHAJfGXPiB+AJ
         buIuBw3pmtbY8odVSk3sqZ6tMj+c+ENivH3ebV8HWFPuH4GEiDBoAB563DtMSCkjCILU
         oIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=b2lDPvNgcW90ATPJ0W6Cm5nzCR7vWtrpBfUZKLwoBYE=;
        b=fL5x+8HyjGsnzn2K0Jl2EGO3Ec76u3vXYZ/EUEz1ZV5VwW90tMQlx98SkZ/oszKfrc
         oH+FCHeSN3+Qmxk/RVG+MuXmaAMF7lt1+o5C2FTwtoPRURiLdMI9NNYhsRoWXOzlsO0Z
         gAaOuuSjK/z+XgGFqQ+vKsudF2VXcDo1RVo3YAsJI36Is9/Ihh5ean5n1dNZcavFTbz4
         ruTTF4Zc0lhEyQ2EYhaNaJt9hFRtMldsRME9PY5TR6tzmU0NJ0QV7ddNMwdw9oJIvQtJ
         tYuTH5Ml/LHAfBt0JMW/deBwaNvL/TwbGw5rTpNilpBGoYUa2Uuj3E+PPAwK2WfJAXnZ
         eFTw==
X-Gm-Message-State: AOAM5333tVg2u6GsK+WF+hPLEpwpcPonZUqLehgkqfV29Tom1slocFhf
        zOCJ4rjbNcHwGn4jTUoYzsIuafRZc9sy0Q==
X-Google-Smtp-Source: ABdhPJy5etVAKJBI8BzMQLjxLKwC8dcLGsYrTzKTEFk+k5Pr3/2wNCCUe6bHw+q1Fuv9x8rNwEvhig==
X-Received: by 2002:a5d:4744:: with SMTP id o4mr4883028wrs.130.1600951233003;
        Thu, 24 Sep 2020 05:40:33 -0700 (PDT)
Received: from dell ([91.110.221.204])
        by smtp.gmail.com with ESMTPSA id f16sm3466734wrp.47.2020.09.24.05.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 05:40:32 -0700 (PDT)
Date:   Thu, 24 Sep 2020 13:40:30 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Ben Dooks <ben@fluff.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vincent Sanders <vince@arm.linux.org.uk>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mfd: sm501: Fix leaks in probe()
Message-ID: <20200924124030.GK4678@dell>
References: <20200911113326.GB367487@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200911113326.GB367487@mwanda>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 11 Sep 2020, Dan Carpenter wrote:

> This code should clean up if sm501_init_dev() fails.
> 
> Fixes: b6d6454fdb66 ("[PATCH] mfd: SM501 core driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/mfd/sm501.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
