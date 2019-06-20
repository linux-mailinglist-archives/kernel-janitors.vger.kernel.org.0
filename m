Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 030824D79F
	for <lists+kernel-janitors@lfdr.de>; Thu, 20 Jun 2019 20:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727577AbfFTSNf (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 20 Jun 2019 14:13:35 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37778 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729283AbfFTSNe (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 Jun 2019 14:13:34 -0400
Received: by mail-pl1-f195.google.com with SMTP id bh12so1713993plb.4
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Jun 2019 11:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RmdL4r6TvJ+oKourpQb+LBst9Fomwh98eeYZGetnRvY=;
        b=oV9KeU7fuBkBdNRgFANyfh0fcXSl4wDv8kbA4/2xYSLmTm8D40QNMvO/CQH/+cDxK7
         GbW9f/ukXyTOqWTO2qrk4Tff8D13y9JHIJMsHsnmCAXLnEngZl922vBjaJ4Phu50pSyF
         pE8CYKHUOKZwcRKjRd0O9tRtzDNgGbDGVRcmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RmdL4r6TvJ+oKourpQb+LBst9Fomwh98eeYZGetnRvY=;
        b=H0p4Ryiiyxi3w8Bi+TimmNlFE5zayQTVsOppxLtJx2MQL19OC+eapWSwI+CSZAJecc
         +JEXVKQN9gzHm/k0nl2rMuAbNaDGMjTpCKNsFqXSX+GfMyQQHK1Dex/ABrpj3lVImP/I
         b3D8vp+bFtSLbGWOtgZTbAHbp4XmRzUovzfrotuDFuHYUd3wVR+kNYlIaJCOvVTbc9js
         XQKuI5Ydgbzx25NAHINo/Qn2cp/TqpanbzwYNmWhj9Z+7apKhFTQl2PiuJRqZRA3eNLw
         ntpFJg4qz5k6z6/wALvIF6u7s23HaDt/JFleF/OvMLwonIhrOK9gne49hyZG/MHvRdiX
         TZPw==
X-Gm-Message-State: APjAAAWkA/x2szTOozHTAk+W49e2oOnQW6PDL9obD57a1ErUCxVWpwjj
        MLtwj9pf3zdGB2/UQPDEbzYRhQ==
X-Google-Smtp-Source: APXvYqwRqHmHiOefZUkjtzQ5hzlVB17R/dzjZKqG93Hc2P9UkalWcaAo2ZuXfBOPjxAeefIn2Ir5zA==
X-Received: by 2002:a17:902:d707:: with SMTP id w7mr8966934ply.128.1561054413761;
        Thu, 20 Jun 2019 11:13:33 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b6sm311008pgd.5.2019.06.20.11.13.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2019 11:13:32 -0700 (PDT)
Date:   Thu, 20 Jun 2019 11:13:32 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Colin King <colin.king@canonical.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] lkdtm: remove redundant initialization of ret
Message-ID: <201906201112.AE06471@keescook>
References: <20190614094311.24024-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614094311.24024-1-colin.king@canonical.com>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jun 14, 2019 at 10:43:11AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being initialized with the value -EINVAL however
> this value is never read and ret is being re-assigned later on. Hence
> the initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks!

Acked-by: Kees Cook <keescook@chromium.org>

Greg, can you take this please?

-Kees

> ---
>  drivers/misc/lkdtm/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/lkdtm/core.c b/drivers/misc/lkdtm/core.c
> index bba093224813..92df35fdeab0 100644
> --- a/drivers/misc/lkdtm/core.c
> +++ b/drivers/misc/lkdtm/core.c
> @@ -390,7 +390,7 @@ static int __init lkdtm_module_init(void)
>  {
>  	struct crashpoint *crashpoint = NULL;
>  	const struct crashtype *crashtype = NULL;
> -	int ret = -EINVAL;
> +	int ret;
>  	int i;
>  
>  	/* Neither or both of these need to be set */
> -- 
> 2.20.1
> 

-- 
Kees Cook
