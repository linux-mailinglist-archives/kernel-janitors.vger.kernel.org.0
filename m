Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF2D4001D1
	for <lists+kernel-janitors@lfdr.de>; Fri,  3 Sep 2021 17:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349566AbhICPP2 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 3 Sep 2021 11:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236549AbhICPP1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 3 Sep 2021 11:15:27 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D245C061760
        for <kernel-janitors@vger.kernel.org>; Fri,  3 Sep 2021 08:14:28 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id bg1so3468477plb.13
        for <kernel-janitors@vger.kernel.org>; Fri, 03 Sep 2021 08:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Zg/5XIA6AOIvCKf28eKv1Mz/3KXT2akr96LQrUcvm3E=;
        b=eX1Ye6X9od4Y6LQMOHXLDkXdsCuAfE/9BDFzmczzVIMNZJJW3PSL7C1VWu4DFqmhEf
         EoJacDRG8C1kRM+fK2ZQA9mE5Ccw0CQLFXDgCZOOJwed0m4A+b4XbjOvV0ki4qLuhMrs
         MmSDENQZjHf5yWne5RlOSE5eTQRjaIwPTJsBS/7i0wu1u0t2bXUbX0uupOb81QWIIKA9
         yIQuOl+2MTZhWaqmmldx9/q2Lvk3EjyzO1yktN6acRYBoTeURFyO2r4dwOkKLJy7mRC0
         J/y09SVMk0L/RVJlGszpvPrrZO3+yadKLQeQP+KhUC16lWxa/Fz1AjBeMAh+YAL9+GDr
         C22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Zg/5XIA6AOIvCKf28eKv1Mz/3KXT2akr96LQrUcvm3E=;
        b=bV3pkh2DMoz6vc3RmfTAopu6fMwfFdiDthIAdQENhZ6RK2vn8nliKZ06JgQ62mAhlw
         FNWHjUGCRa0YfIwvW1VywfBLC9JWZMYnJxm+b0sySKbLmeEKw6KuX7UlKDZYqVsg0KbY
         Wnt/ckAEcmgTs6DMpX0FeBPr2fBhK+cvdIDX7Pl6X1ucNiTLLfPw5zO6eMdxVkUE07ZD
         zAsw1BTX3yHhtS6U82+CrcWaGPFfrEa+4sVSPmSNewW65D+OR230Wl1nuGOaEd8ZZFe7
         xy6KQgZJJsJcrOwdc3UGNLqxbbdltKsrrGLn0TJzzVzAbMxmKD6jg3YcrkkSEc0meGfi
         dufA==
X-Gm-Message-State: AOAM533d1Q8OPAZOzV+it7l/OdbqfIZD5YlIsPydit4Y6fByAB84gq21
        qvWqG9a+7BX+4Jl9+ot2Za18yXGnbPGRFg==
X-Google-Smtp-Source: ABdhPJwLMXobar8pQBxWMm+INz/w+EbHQCYCIQ9vclZBAbeXoX4ljXzPmAbE2yIjtOd5uamloOTybA==
X-Received: by 2002:a17:902:7e88:b0:138:f5b2:2df9 with SMTP id z8-20020a1709027e8800b00138f5b22df9mr3339879pla.48.1630682067368;
        Fri, 03 Sep 2021 08:14:27 -0700 (PDT)
Received: from Shannons-MacBook-Pro.local ([50.53.47.17])
        by smtp.gmail.com with ESMTPSA id l12sm5517244pji.36.2021.09.03.08.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 08:14:27 -0700 (PDT)
Subject: Re: [PATCH net-next] ionic: fix a sleeping in atomic bug
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     drivers@pensando.io, "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Allen Hubbe <allenbh@pensando.io>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20210903131856.GA25934@kili>
From:   Shannon Nelson <snelson@pensando.io>
Message-ID: <9ff5b195-decd-a49d-29e7-02c407cf4c0d@pensando.io>
Date:   Fri, 3 Sep 2021 08:14:25 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903131856.GA25934@kili>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 9/3/21 6:18 AM, Dan Carpenter wrote:
> This code is holding spin_lock_bh(&lif->rx_filters.lock); so the
> allocation needs to be atomic.
>
> Fixes: 969f84394604 ("ionic: sync the filters in the work task")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Signed-off-by: Shannon Nelson <snelson@pensando.io>

> ---
>   drivers/net/ethernet/pensando/ionic/ionic_rx_filter.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_rx_filter.c b/drivers/net/ethernet/pensando/ionic/ionic_rx_filter.c
> index 7e3a5634c161..25ecfcfa1281 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_rx_filter.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_rx_filter.c
> @@ -318,7 +318,7 @@ void ionic_rx_filter_sync(struct ionic_lif *lif)
>   			if (f->state == IONIC_FILTER_STATE_NEW ||
>   			    f->state == IONIC_FILTER_STATE_OLD) {
>   				sync_item = devm_kzalloc(dev, sizeof(*sync_item),
> -							 GFP_KERNEL);
> +							 GFP_ATOMIC);
>   				if (!sync_item)
>   					goto loop_out;
>   

