Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31F78557A8F
	for <lists+kernel-janitors@lfdr.de>; Thu, 23 Jun 2022 14:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231531AbiFWMoa (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 23 Jun 2022 08:44:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231341AbiFWMo3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 23 Jun 2022 08:44:29 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70BD12FE62
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Jun 2022 05:44:28 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id h14-20020a1ccc0e000000b0039eff745c53so1398835wmb.5
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Jun 2022 05:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Z9rGjSfXtb8eRSK/n+BJ7mobKDZ9UgvblW8JzowF+70=;
        b=F4ho8GPifSNEiaJ3OOu/Ys/zAAZDKYj9T9456rvtB+wYjAdoiinN9EDFU+i0OdKIPX
         41dNWZXyl03G2k60TtoryC/DdpLQV/l89buXmtp7wU5TvTsum4IWuvhkL5DdWAsDL6wG
         BGDod2kqxVMp9eYk5LZeGLKhQdhcNuQHFlif43mjQ2QqDpqgtNbZZwiQMwhdA4+OEi7P
         Dxjn8IT5PoG8ENlm8S3HAS9NEa93DiCTHvlEPTUg9ZKJaaN8fFoxXP06esqz8N8+BtyY
         mtNmPnkpRRlwV7dwuSgkJ3Fvu+WlVacwlR07xCU4YRKFmd1lo59oqJCod3iDWjP3F1+1
         roWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Z9rGjSfXtb8eRSK/n+BJ7mobKDZ9UgvblW8JzowF+70=;
        b=sNUo9OMZZ9ArNpN3rbAgSUtt2yI52OedGJS6miEURjrfKudk2flrJ2CFeeHeIUIg1/
         CXWCGd8dMvS7AZk5jLZ8g82+ddouqV02nGYel6V4jUq+twZsNU/P9d7+ugaC4yfHCBjW
         lBbSN4tZ0en7wJK/2v0Tro5xLWLmufE4+9llYn7vLCItRKdsQCdhLVDuJHX82L3GRYl3
         GyvW3LnrXYN51Fko4utQ7FrwVplw7ZC3DcRzItatnJvzMJi1kw71DxQInhXgHj4kWLOg
         o5Whg7sJ9Suu26LJR99r21UVqyphrFBEPbrCp+3VlXaEdgDOrxPb9lOvYCD0cRLsdJYe
         VbkA==
X-Gm-Message-State: AJIora9jHW/Gsf8Bu66nkpIsyBcTXvm1wmur8t/Hsad2rrBnuLDEJK+c
        MQGmMQU49/VscdsIUnQUdzw9KQ==
X-Google-Smtp-Source: AGRyM1vBTrOx7oLPgd2Rgw1IooQ35oPHLBqBKqYncA5oj9YrqLklhJ1b8G+HWdoNem9nhWWwXfZFpA==
X-Received: by 2002:a1c:ed08:0:b0:39c:80b1:b0b3 with SMTP id l8-20020a1ced08000000b0039c80b1b0b3mr4015635wmh.134.1655988266885;
        Thu, 23 Jun 2022 05:44:26 -0700 (PDT)
Received: from [192.168.149.129] ([80.233.63.220])
        by smtp.gmail.com with ESMTPSA id bs27-20020a056000071b00b0021b932de5d6sm4272983wrb.39.2022.06.23.05.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 05:44:26 -0700 (PDT)
Message-ID: <64979f56-ec31-eedb-9ef7-5b21e19be3f6@conchuod.ie>
Date:   Thu, 23 Jun 2022 13:44:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] MAINTAINERS: repair pattern in DIALOG SEMICONDUCTOR
 DRIVERS
Content-Language: en-US
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Support Opensource <support.opensource@diasemi.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220623104456.27144-1-lukas.bulwahn@gmail.com>
From:   Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220623104456.27144-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 23/06/2022 11:44, Lukas Bulwahn wrote:
> Commit 441613662db7 ("dt-bindings: mfd: Convert da9063 to yaml") converts
> da9063.txt to dlg,da9063.yaml and adds a new file pattern in MAINTAINERS.
> Unfortunately, the file pattern matches da90*.yaml, but the yaml file is
> prefixed with dlg,da90.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken file pattern.
> 
> Repair this file pattern in DIALOG SEMICONDUCTOR DRIVERS.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Conor, please ack.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

that's the second fix you've done for that series, I'll be
sure to run the self-test in the future...

Thanks again,
Conor.

> Lee, pleae pick this minor non-urgent clean-up patch.
> 
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f84dba7ee301..4b08464abb1b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5876,7 +5876,7 @@ W:	http://www.dialog-semiconductor.com/products
>   F:	Documentation/devicetree/bindings/input/da90??-onkey.txt
>   F:	Documentation/devicetree/bindings/input/dlg,da72??.txt
>   F:	Documentation/devicetree/bindings/mfd/da90*.txt
> -F:	Documentation/devicetree/bindings/mfd/da90*.yaml
> +F:	Documentation/devicetree/bindings/mfd/dlg,da90*.yaml
>   F:	Documentation/devicetree/bindings/regulator/dlg,da9*.yaml
>   F:	Documentation/devicetree/bindings/regulator/da92*.txt
>   F:	Documentation/devicetree/bindings/regulator/slg51000.txt
