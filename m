Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B3D22EAFF9
	for <lists+kernel-janitors@lfdr.de>; Tue,  5 Jan 2021 17:24:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728023AbhAEQYW (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 5 Jan 2021 11:24:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726711AbhAEQYV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 5 Jan 2021 11:24:21 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05A54C061795
        for <kernel-janitors@vger.kernel.org>; Tue,  5 Jan 2021 08:23:41 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id q75so103385wme.2
        for <kernel-janitors@vger.kernel.org>; Tue, 05 Jan 2021 08:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Tk1Tgbf/mV84/2svjW1MlJGlo1p031I32QR/ghiBw58=;
        b=WqDdWO6eIcHv47qa/VLQ9pOYIIeDIqIXGl5G0xbXe+HB8oKT0SaMlbvKiz4vuQOW1U
         hwR8Xkdx440jH/2aeX2rYDKKE9RXddSzXW1S5lYCxp7HeoGZeiaJxdBlB4OhB+jLNMCY
         BE3pUsoIL11IfJb9K3GIYtn8Y3F10cGMv+QL6jgdcLKM7wT0uB/cCU9rU6CyUjl/thAB
         pMOBx/GRQlG1Ah/ESshYUIwBTEEQFBUWVpZNot52L3F29Zq0deDBhJNBYsK9I/TpPhQx
         S2Poa79QGo7xz2YCifhpBkqXh8shhqQBJylvyG27SDNRE8v/7eyqf+WntVCkabHG1wR9
         TyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Tk1Tgbf/mV84/2svjW1MlJGlo1p031I32QR/ghiBw58=;
        b=IqWBQm846H5rXdQ96AFVGVFhY4hBuEkNMWPKhEB1w+h4j8QWyWUwMdfbn14dsOlHrL
         Ubgq0Ltb3no4lxLaNb7TolgXpH31bBZ6kvh3JDFFYZ45fcKCi3YXmGdoS7D8LCAR8Le4
         quv9XRvweszttcAhJFl+884FJsxkz0AznhLnyQGy8D7yqKL3aqyO3z35iVe2Poe/omw7
         FYp9aSiIcHk8q6xjZ5CGGVOx/ECbbHKnXkp+tdhkstm52z4LXKX/wc0s6tJjrmxKfoHG
         CuoGY5orRn9bt8nHj6VFGR+4aVbm62qMPobByx2/UqtfTbrRhE/ijteuEUT5FrBbM3x9
         y7bg==
X-Gm-Message-State: AOAM531rHE6WDJ7MmmfuhhNsZaKGrRGWRYFc2KzOSriAyUyy6E9aEr+t
        RrOR7bAvXqYx43oF90HfWvUDj/a+Ci/dd9iH
X-Google-Smtp-Source: ABdhPJy4Wcn1g0QPYCHFNxpcE3GkBZkWvVrFkBYHh9Uqc+ELoH00aG7SDclhPi8R5fXLaVz+z/N6bg==
X-Received: by 2002:a1c:5459:: with SMTP id p25mr4006011wmi.19.1609863819467;
        Tue, 05 Jan 2021 08:23:39 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id m18sm350102wrw.43.2021.01.05.08.23.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Jan 2021 08:23:38 -0800 (PST)
Subject: Re: [PATCH] nvmem: core: Fix a resource leak on error in
 nvmem_add_cells_from_of()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <X93cOvjVvzfig1Pu@mwanda>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <83c3536c-424a-46fb-5fdc-993b1bbb1490@linaro.org>
Date:   Tue, 5 Jan 2021 16:23:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <X93cOvjVvzfig1Pu@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 19/12/2020 10:55, Dan Carpenter wrote:
> This doesn't call of_node_put() on the error path so it leads to a
> memory leak.
> 
> Fixes: 0749aa25af82 ("nvmem: core: fix regression in of_nvmem_cell_get()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks

--srini
> ---
> The kfree_const() could just be replaced with kfree().  Someone got over
> excited converting things from kfree() to kfree_const().
> 
>   drivers/nvmem/core.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 177f5bf27c6d..68ae6f24b57f 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -713,6 +713,7 @@ static int nvmem_add_cells_from_of(struct nvmem_device *nvmem)
>   				cell->name, nvmem->stride);
>   			/* Cells already added will be freed later. */
>   			kfree_const(cell->name);
> +			of_node_put(cell->np);
>   			kfree(cell);
>   			return -EINVAL;
>   		}
> 
