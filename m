Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42F7C1E64B9
	for <lists+kernel-janitors@lfdr.de>; Thu, 28 May 2020 16:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403825AbgE1Ox3 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 28 May 2020 10:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391362AbgE1Ox0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 28 May 2020 10:53:26 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85458C08C5C6
        for <kernel-janitors@vger.kernel.org>; Thu, 28 May 2020 07:53:25 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id f185so2373741wmf.3
        for <kernel-janitors@vger.kernel.org>; Thu, 28 May 2020 07:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cumulusnetworks.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jYwlFXyoA5W7eOjmY64mk9fyq3/rODJ0HXkx98UI8ms=;
        b=SbC0EQCRmMAuKlDmTMhJKM9/33wrjm/5m2A2+LrYTwDPw/46j9VlKEgIUfKQCdLuAn
         fXX93FqGNDFTYN3zPxj+k59IOEd36bKDQRBOBhfWH9O7pBo+QJaZACUtjmi0qvG6k1WX
         tdRemBAXpwxvD6CCdTEFVESiud6PlgU1nXiLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jYwlFXyoA5W7eOjmY64mk9fyq3/rODJ0HXkx98UI8ms=;
        b=Pv/we1+q0VSS8apwcHvxAm2RnCgMDeqlDOhHQF43JoWrknQEMMbRjseeM0DurSum7g
         sfOZoY07gJ887Uxe1aoybAzLHPaZUzC4YRfECHKiki7Qh0L39JcYLHrkKk3Ag8YFr9fM
         iekjV5VdcpnueXCaVfj0ucYtEUfyDlgUd2ZUlXBfVcLLsS07Jca0ftyNFvCKP80N0VXf
         dL5r7KtWrxuqYmMEJYvUrhdHgO+TLUhGxziF4Jm60Enu1u9vMJcdwujba9DqwSCQcPEu
         I1xXYpNT8XcrK0wdqZDGFQBMfNcLfvNx+eNSDJpqUPXfZ4fnLr1t2fVBs9vX1uU3DW5V
         Fyng==
X-Gm-Message-State: AOAM530DWJg3JfJ6sWkQN61gT0QOcBS1LJCo3d1xbyXEWkcOArVuSirR
        sJDyXvGWkTcIChTD8OK3IQy4Ug==
X-Google-Smtp-Source: ABdhPJw6x83C5m+liS6sK3O+5Mi+sGqGNugMnzt/+6U4WeTLNCfN42hQ7sh+8CL5hqzz96DVlegeBA==
X-Received: by 2002:a1c:a74d:: with SMTP id q74mr3779042wme.177.1590677604252;
        Thu, 28 May 2020 07:53:24 -0700 (PDT)
Received: from [192.168.51.243] ([78.128.78.220])
        by smtp.gmail.com with ESMTPSA id h20sm6747524wma.6.2020.05.28.07.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 07:53:22 -0700 (PDT)
Subject: Re: [PATCH][net-next] nexthop: fix incorrect allocation failure on
 nhg->spare
To:     Colin King <colin.king@canonical.com>,
        David Ahern <dsahern@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200528145114.420100-1-colin.king@canonical.com>
From:   Nikolay Aleksandrov <nikolay@cumulusnetworks.com>
Message-ID: <8b73e872-c05e-e93f-1d2d-3466da4ddbcc@cumulusnetworks.com>
Date:   Thu, 28 May 2020 17:53:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200528145114.420100-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 28/05/2020 17:51, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The allocation failure check for nhg->spare is currently checking
> the pointer nhg rather than nhg->spare which is never false. Fix
> this by checking nhg->spare instead.
> 
> Addresses-Coverity: ("Logically dead code")
> Fixes: 430a049190de ("nexthop: Add support for nexthop groups")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  net/ipv4/nexthop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/ipv4/nexthop.c b/net/ipv4/nexthop.c
> index ebafa5ed91ac..97423d6f2de9 100644
> --- a/net/ipv4/nexthop.c
> +++ b/net/ipv4/nexthop.c
> @@ -1185,7 +1185,7 @@ static struct nexthop *nexthop_create_group(struct net *net,
>  
>  	/* spare group used for removals */
>  	nhg->spare = nexthop_grp_alloc(num_nh);
> -	if (!nhg) {
> +	if (!nhg->spare) {
>  		kfree(nhg);
>  		kfree(nh);
>  		return NULL;
> 

Good catch, embarrassing copy paste error :-/
Acked-by: Nikolay Aleksandrov <nikolay@cumulusnetworks.com>

