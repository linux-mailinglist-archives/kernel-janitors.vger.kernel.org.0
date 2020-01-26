Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF568149C55
	for <lists+kernel-janitors@lfdr.de>; Sun, 26 Jan 2020 19:35:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728901AbgAZSfG (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 26 Jan 2020 13:35:06 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44445 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727233AbgAZSfG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 26 Jan 2020 13:35:06 -0500
Received: by mail-pg1-f195.google.com with SMTP id x7so4002416pgl.11
        for <kernel-janitors@vger.kernel.org>; Sun, 26 Jan 2020 10:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=buJqycnRJmE0klBvQ3jUgMDQeTjnHb0PShrMhrfuVB8=;
        b=0ld6Ez34Qsy5L3zKymuv8E6s6kzPBTjfgjQExASj5271nr04uZjgejw/GxVmrYGSq3
         bPaIDolal+2F38wWFPyNSQmA7WddKehD390EXrXeKt23g0Vh1LKITI+f3zlGcRDBgf9d
         z0xAsaSsde/YRQdkq9D6PEzUdwsds0vDwWDZw2gj18W4zOXxpgSw74hC/Iij7np58XAQ
         Sok2aEho84XWfHCmkvMfwsfF/CW7rAJOTq3ZyrrQVIwoWE5Ql0/8yBvmDhZ/sO3ia7ko
         VoDvP1nyMu3y8PgBlt6d4xAuEXXSbWdoFX91Vj6H0/coJAZ0DKZsYL4/GsQdZp+We76Y
         14qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=buJqycnRJmE0klBvQ3jUgMDQeTjnHb0PShrMhrfuVB8=;
        b=TR7x5mJo2KAQsUnHPMjLaqOXQ+l+YBs5ODLR4M49HsiKzTM4i4uC21kJwx2+O/JiJk
         4f/7nFvaigBy9Gr+KoCFOUGtPczbX7KrvqYhbOjj74N7Mwm7mUXuPeq9wIxydwOyDBvP
         T3Famy8COD2i1PuCsbg2QmSFX7fd5yoj0fjJh5vICaCnifyQXeQ8m55Zt83Itp1O3+WH
         kQZ3tphnfjWvvYzefcSXeaQGYRUt3b/KLPAL2UJ2In8UOtgUNSSr2rtL4aBmHEffIjKI
         e0gZIE9fX47XC+f8ECdZDgQ2jJnWnkPRxgzeA4hePx2R/jiB+62G8qpRNho7nuJHSMj/
         wSlw==
X-Gm-Message-State: APjAAAVYWLY1K20uPuXgbddD0k0z/wFJkGyS/LRT8HSQYJFjvgP/MqMb
        WZ2vdLHN7MSqBaZ7llyB73MY6k4ZDOD/5Q==
X-Google-Smtp-Source: APXvYqyhSoh0s6Ekkqi2sNDxODbKwJ831I0jnyBSCMndArKyHIgMKJixjEHLPA+aFoo/LdQTaooSYQ==
X-Received: by 2002:aa7:9796:: with SMTP id o22mr12683626pfp.101.1580063705781;
        Sun, 26 Jan 2020 10:35:05 -0800 (PST)
Received: from Shannons-MacBook-Pro.local (static-50-53-47-17.bvtn.or.frontiernet.net. [50.53.47.17])
        by smtp.gmail.com with ESMTPSA id s25sm12426540pfh.110.2020.01.26.10.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2020 10:35:05 -0800 (PST)
Subject: Re: [PATCH] ionic: Fix rx queue allocation in 'ionic_lif_alloc()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        drivers@pensando.io, jakub.kicinski@netronome.com,
        davem@davemloft.net
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20200126102540.14812-1-christophe.jaillet@wanadoo.fr>
From:   Shannon Nelson <snelson@pensando.io>
Message-ID: <0a90fbcb-430e-d059-cd1c-7960e7ec6806@pensando.io>
Date:   Sun, 26 Jan 2020 10:36:00 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200126102540.14812-1-christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 1/26/20 2:25 AM, Christophe JAILLET wrote:
> The 'struct ionic' has a 'nrxqs_per_lif' field. So use it instead of
> using two times the value of 'ntxqs_per_lif'.
>
> Note that with the current implementation, this patch is a no-op because
> both fields are set to the same value in 'ionic_lifs_size()' which
> is called before reaching 'ionic_lif_alloc()'.
>
> However, it is more future-proof.
>
> Fixes: 1a58e196467f ("ionic: Add basic lif support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Another alternative could be to use 'alloc_etherdev_mq()' if really using
> the same value for both fields is what is expected.
> ---
>   drivers/net/ethernet/pensando/ionic/ionic_lif.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_lif.c b/drivers/net/ethernet/pensando/ionic/ionic_lif.c
> index 60fd14df49d7..96d3b3e993ad 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_lif.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_lif.c
> @@ -1663,7 +1663,7 @@ static struct ionic_lif *ionic_lif_alloc(struct ionic *ionic, unsigned int index
>   	int err;
>   
>   	netdev = alloc_etherdev_mqs(sizeof(*lif),
> -				    ionic->ntxqs_per_lif, ionic->ntxqs_per_lif);
> +				    ionic->ntxqs_per_lif, ionic->nrxqs_per_lif);
>   	if (!netdev) {
>   		dev_err(dev, "Cannot allocate netdev, aborting\n");
>   		return ERR_PTR(-ENOMEM);

NAK

Even though the NIC configuration seems to allow for different values, 
the rest of the driver assumes that the values are equal and things will 
likely break if they aren't.  This is why the ethtool service 
ionic_set_channels() only allows the user to change the Combined value, 
and not the individual rx or tx values.

If you really want to tweak this, a better change might be to use the 
min of ntxqs and nrxqs, and maybe add a warning log message that they 
are configured with different values.

sln

