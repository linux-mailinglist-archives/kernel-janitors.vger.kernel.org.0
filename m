Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32A22542C32
	for <lists+kernel-janitors@lfdr.de>; Wed,  8 Jun 2022 11:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235865AbiFHJ5q (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 8 Jun 2022 05:57:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235756AbiFHJ5b (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 Jun 2022 05:57:31 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE9A15E619
        for <kernel-janitors@vger.kernel.org>; Wed,  8 Jun 2022 02:30:03 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id v1so29571732ejg.13
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Jun 2022 02:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5OSQTqUpVQqGdtiWsQiVzCNGN/W+6rXCSBNE12Fte78=;
        b=enw+NAUpYeQlR6hfdS6xQpRkqLghi6Z2iYYF2YW+inYhh6MXxx9ps2oboBmw7sVEaJ
         0Mm50RUaA2kKP4rEFFIkDypeMAPgiSRifYJiTO6UfFGqAVDtF510NJmQco/zdGYMrpt8
         P4W9osQMjyrRrhHw8bE/7fUsJ35fRglmf5U6JjyJJYqA/Iix9L53C0zF/KO3yMC7dZH2
         9cS6XaOgTZGDQw+iegdG0lnsyzIdjsMEzbBw6RGqT9IfmFXE9bcg6U7Ay4T1+xU8Sgbg
         uqyDXRmd3nCM1nm2XObVyaU40A9z1m+U2qcV/fdQAqE0d6MF6ISUaupq7c98IUFaFGOb
         eMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5OSQTqUpVQqGdtiWsQiVzCNGN/W+6rXCSBNE12Fte78=;
        b=51L363ULlRPfSUXsYOv0NT0CfdoarLDnNpOzq+wSYWj0ce/Ty9eXSESnm8OJwkLnyo
         4dIhKuzfbyTPtn1x6EuVD1qZ5KL7EXypijIg1ZGieZmmJSS0ze55t0elUwr1q1hHEu+s
         KhipH03lzO7brH6EatO6uELRG5HKjERGeO+XPCMllupQ/3fwRWl6QUwiz2hoyc0XerhA
         zPOVvYN2EZr9NCIDYgEcQb4XXP6GDwKLau1tw3pDMTREXloK6aaJeMNmA0jcKxREfxrY
         kwQMwW0cqroZ8TPk2SoPjzpwzovF9GkE10qS51tOj4ENzAl2O26RCoVKsKXjczg83iCw
         cooA==
X-Gm-Message-State: AOAM533vqHml9idTZrRupnxYwSljdyhGQ9uwvbInFYGEPUVZXeSB8aFl
        6MZf2FNvBVMkibVJaZBcOdXt1Q==
X-Google-Smtp-Source: ABdhPJzdM9jQq7Knm4/sB2ExOoHBLPfrsf5VDhDvQZsiispnrNYZsvuDkJKUdXzIVPgg30O3pT7bMg==
X-Received: by 2002:a17:907:868f:b0:702:f865:55de with SMTP id qa15-20020a170907868f00b00702f86555demr30709192ejc.24.1654680601876;
        Wed, 08 Jun 2022 02:30:01 -0700 (PDT)
Received: from [192.168.0.191] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id n24-20020aa7c698000000b0042bb229e81esm11830571edq.15.2022.06.08.02.30.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 02:30:01 -0700 (PDT)
Message-ID: <3c9abbcf-086b-07ab-2638-cd25fa9f329b@linaro.org>
Date:   Wed, 8 Jun 2022 11:30:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH][next] spi: s3c64xx: Fix spelling mistake "hannel" ->
 "channel"
Content-Language: en-US
To:     Colin Ian King <colin.i.king@gmail.com>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220608081912.2083086-1-colin.i.king@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220608081912.2083086-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 08/06/2022 10:19, Colin Ian King wrote:
> There is a spelling mistake in a dev_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
