Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DABA4F11CA
	for <lists+kernel-janitors@lfdr.de>; Mon,  4 Apr 2022 11:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352360AbiDDJRa (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 4 Apr 2022 05:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350588AbiDDJRa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 4 Apr 2022 05:17:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D4D263B3D4
        for <kernel-janitors@vger.kernel.org>; Mon,  4 Apr 2022 02:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649063734;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zh+UBOLHFqYkLJABHLlIQlGO7HQCcNKtPFV3cCbp8X4=;
        b=hTEKqddRf/BEr24/1zWZnyo16xnxayH3VGs36oFqlgmwOO5bstVzNa7fHL30RvkeDSdBjJ
        WKPLjEy0l7PSJ3+ufRxH8e3DEA605htZyZUs3npCBSAiHU+AbCIgfDpPFZ4y1LEy5YviL/
        UHKxMkclu/culcrM6qtUYerfL80bYFU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-UDhsmHHsMZyzx5P0ULRn3g-1; Mon, 04 Apr 2022 05:15:30 -0400
X-MC-Unique: UDhsmHHsMZyzx5P0ULRn3g-1
Received: by mail-ed1-f70.google.com with SMTP id i13-20020aa7dd0d000000b0041ccfefe3f4so1569929edv.14
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Apr 2022 02:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zh+UBOLHFqYkLJABHLlIQlGO7HQCcNKtPFV3cCbp8X4=;
        b=54FgQgN4zUtn6RgEMM7N+HBKWI7RDuW+c7Ijp/3K0/ocDo3Mjx8pi0YL4V8dibvHOg
         jFVbQu3mvlPj7mcLX/xQHLV8f6rqZGA01c0XWAp6JuULf8cF3hFf9l/8NEZpQ9/6QaAQ
         HEvT15it4L3IELQu+w2TJZ0/F0yxXUDdvLMV7h4Trt8GFnZVx+czLWOnAmPa9jwuPHby
         S3jKzjA/VXWWGuUWIMlGuzS8iLvXVFKsof0R9R4QjscdjE8hGCBLbjnqyK5W/yEnrg5C
         9xTtHP0QZciE0TeIUpwrrPnZZvEEzpWYhSIjk7glkrYJmPLte1DpOuQZEUX42MB9CMkR
         NfGQ==
X-Gm-Message-State: AOAM530o/AsJGQL/GivIAdx8nJtzgzhLf/nTk6nemJHGucIRxb/XoHXx
        UFhWEXxNz/D8QUG9umaebXZ3rqS0HbTalwwuFLy3A3JvWK/+UsUEfAFP6ouU1ENxUI2/GwLFdtj
        8CIrAbNjT35uD+5b59rtDV+jUjfFr
X-Received: by 2002:a17:907:6e2a:b0:6e0:b263:37a6 with SMTP id sd42-20020a1709076e2a00b006e0b26337a6mr9954149ejc.622.1649063729654;
        Mon, 04 Apr 2022 02:15:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmn871wVtdooXLKKs/nDhI5mJUKB2kXphxAfDG/vjQpPO3vHN0FZV1sNNiN9ue236h3k7sMg==
X-Received: by 2002:a17:907:6e2a:b0:6e0:b263:37a6 with SMTP id sd42-20020a1709076e2a00b006e0b26337a6mr9954136ejc.622.1649063729415;
        Mon, 04 Apr 2022 02:15:29 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id og49-20020a1709071df100b006db0dcf673esm4124588ejc.27.2022.04.04.02.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 02:15:28 -0700 (PDT)
Message-ID: <dbd72dd0-5898-dfd7-00a0-475fb798c595@redhat.com>
Date:   Mon, 4 Apr 2022 11:15:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] phy: ti: tusb1210: Fix an error handling path in
 tusb1210_probe()
Content-Language: en-US
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <07c4926c42243cedb3b6067a241bb486fdda01b5.1648991162.git.christophe.jaillet@wanadoo.fr>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <07c4926c42243cedb3b6067a241bb486fdda01b5.1648991162.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 4/3/22 15:06, Christophe JAILLET wrote:
> tusb1210_probe_charger_detect() must be undone by a corresponding
> tusb1210_remove_charger_detect() in the error handling path, as already
> done in the remove function.
> 
> Fixes: 48969a5623ed ("phy: ti: tusb1210: Add charger detection")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/phy/ti/phy-tusb1210.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/ti/phy-tusb1210.c b/drivers/phy/ti/phy-tusb1210.c
> index a0cdbcadf09e..008d80977fc5 100644
> --- a/drivers/phy/ti/phy-tusb1210.c
> +++ b/drivers/phy/ti/phy-tusb1210.c
> @@ -537,12 +537,18 @@ static int tusb1210_probe(struct ulpi *ulpi)
>  	tusb1210_probe_charger_detect(tusb);
>  
>  	tusb->phy = ulpi_phy_create(ulpi, &phy_ops);
> -	if (IS_ERR(tusb->phy))
> -		return PTR_ERR(tusb->phy);
> +	if (IS_ERR(tusb->phy)) {
> +		ret = PTR_ERR(tusb->phy);
> +		goto err_remove_charger;
> +	}
>  
>  	phy_set_drvdata(tusb->phy, tusb);
>  	ulpi_set_drvdata(ulpi, tusb);
>  	return 0;
> +
> +err_remove_charger:
> +	tusb1210_remove_charger_detect(tusb);
> +	return ret;
>  }
>  
>  static void tusb1210_remove(struct ulpi *ulpi)

