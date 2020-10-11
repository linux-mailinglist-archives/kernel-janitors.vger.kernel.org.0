Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2501928AA12
	for <lists+kernel-janitors@lfdr.de>; Sun, 11 Oct 2020 22:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728326AbgJKUFx (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 11 Oct 2020 16:05:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726209AbgJKUFr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 11 Oct 2020 16:05:47 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EB34C0613CE
        for <kernel-janitors@vger.kernel.org>; Sun, 11 Oct 2020 13:05:45 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id a3so20310206ejy.11
        for <kernel-janitors@vger.kernel.org>; Sun, 11 Oct 2020 13:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fn3a2TRSpw4Qw7kTvuDdS1yGeLObpqGFeJkmfCLmfYw=;
        b=rH4sQc4kiIaL95mmyPCWUBV+W8FLVcv9VPmB76fcwdAwToK82RaPakQwVZaGoBad4m
         23OMt4Q0VLoTmPtInWeBUCoJCWIj0skXYBoTLnIvsRiquSB+zOsaQLLfb279t6eipWkg
         D3rf0rhG/LDgpaTZhl/g/w97VfMWnTLecK5f2e4wDNCElehkdW4O44B7LFC95UOswQie
         sYVKXK99Gj4/eYiT2aE7UC6bODUaFkKXJsqYRvApBXuuhEXfDiVrR5BjmLniRbLxZsn3
         GXgMD6FkaKTbO8zo805cNPBXND5Wx69VtiC24pIvvjQ72VQjI9HwnMblLk6l94FmcO77
         ZgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fn3a2TRSpw4Qw7kTvuDdS1yGeLObpqGFeJkmfCLmfYw=;
        b=l4M72Kszff7eClitKBMgJ6XDUCSMtlZd7Ual/0vYht7I9eaEQgqkm3p50ax2veKXJW
         vOKDXKLF2q16h7L2xCigpGWLuihGB5ZdFfp5CPsHRDw6dQpGZyvD451pXits+/n6V7jq
         RUyWjfN0lGWrdk2HvhP9JD1VxMMNbsVI9XH/c2GA04CwKJKIyukma707WxNj4P9Y//FK
         Hulz+o9v86GNfeKTfsuiTCYEQEyLPrYgjUqTT8+CFViHUyWubcDBHBQwioA6EKHyYJXr
         CeP4Ylfa+lrHnGhmqOqP2S8HzA8brqHnS7nsTQA2lTUs17j6+mjPAqSsI9v++JryOWM2
         k0JQ==
X-Gm-Message-State: AOAM5302whXVEa60cdJmSXPL8xGtdp86IwtHYtmH3ZvI48uuMGT0A3Dr
        s9+tTK6hfBebrTyeQ2SVo6xKr/jPgp/c3RbnAt1f
X-Google-Smtp-Source: ABdhPJyFWEkF1uWg3VFTio+74U0ShC3sxoON2X/ALfSwQEFGN/OFeCXzUCfNwuRvCX3yfsan24m6yO/nqdSoXNYAUAY=
X-Received: by 2002:a17:906:c444:: with SMTP id ck4mr23598812ejb.398.1602446743879;
 Sun, 11 Oct 2020 13:05:43 -0700 (PDT)
MIME-Version: 1.0
References: <1602412498-32025-1-git-send-email-Julia.Lawall@inria.fr> <1602412498-32025-5-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1602412498-32025-5-git-send-email-Julia.Lawall@inria.fr>
From:   Paul Moore <paul@paul-moore.com>
Date:   Sun, 11 Oct 2020 16:05:32 -0400
Message-ID: <CAHC9VhQfDueBs_nahF2xxP8bof2yH1p4PPXwfxh4xnmQeEF4XA@mail.gmail.com>
Subject: Re: [PATCH 4/5] net/ipv6: use semicolons rather than commas to
 separate statements
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        Joe Perches <joe@perches.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        kernel-janitors@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Oct 11, 2020 at 7:18 AM Julia Lawall <Julia.Lawall@inria.fr> wrote:
>
> Replace commas with semicolons.  Commas introduce unnecessary
> variability in the code structure and are hard to see.  What is done
> is essentially described by the following Coccinelle semantic patch
> (http://coccinelle.lip6.fr/):
>
> // <smpl>
> @@ expression e1,e2; @@
> e1
> -,
> +;
> e2
> ... when any
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> ---
>  net/ipv6/calipso.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks Julia.

Acked-by: Paul Moore <paul@paul-moore.com>

> diff --git a/net/ipv6/calipso.c b/net/ipv6/calipso.c
> index 8d3f66c310db..78f766019b7e 100644
> --- a/net/ipv6/calipso.c
> +++ b/net/ipv6/calipso.c
> @@ -761,7 +761,7 @@ static int calipso_genopt(unsigned char *buf, u32 start, u32 buf_len,
>         calipso[1] = len - 2;
>         *(__be32 *)(calipso + 2) = htonl(doi_def->doi);
>         calipso[6] = (len - CALIPSO_HDR_LEN) / 4;
> -       calipso[7] = secattr->attr.mls.lvl,
> +       calipso[7] = secattr->attr.mls.lvl;
>         crc = ~crc_ccitt(0xffff, calipso, len);
>         calipso[8] = crc & 0xff;
>         calipso[9] = (crc >> 8) & 0xff;

-- 
paul moore
www.paul-moore.com
