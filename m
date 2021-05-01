Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F49237044C
	for <lists+kernel-janitors@lfdr.de>; Sat,  1 May 2021 02:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233108AbhEAAD2 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 30 Apr 2021 20:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233019AbhEAADZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 30 Apr 2021 20:03:25 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D49CC06138D
        for <kernel-janitors@vger.kernel.org>; Fri, 30 Apr 2021 17:02:36 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id j4so73175765lfp.0
        for <kernel-janitors@vger.kernel.org>; Fri, 30 Apr 2021 17:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KBoeQcMdIXHbrr5qlPjaHe4/MPMag2oC2aXYy4bOLac=;
        b=fk2hsfuYfGs/AoLeyHdX2NoIlNk1zaTNJSnZt4pQHFSjPY8+WK1Ez5pMSN7OadFDIK
         PQWtOfGaP0cSwvYOBouQBV07RiMzKNvCstfdLwcPGUP9NlCAGsoxZcfkbkj0YM1QHsT4
         l/SLhvHV+mO9i7xpOl0NZJ2mHSkzDYhP9qiK2LIwM+mAC/ZUUDTGbralv7SUh0lgEb4E
         WAEPMUk4VLx1EgNA5K8LgO+MqjjiBGrM8ssKRV0BzLgPAyvJgJqAgqHHzcFY1c/hzG/B
         yo3KM2oDiGv0jAJYXGmIsm9fgrrruGghiwRacICmGk5Gu3SSd1POZcKwuO+NFW0fAQqX
         TiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KBoeQcMdIXHbrr5qlPjaHe4/MPMag2oC2aXYy4bOLac=;
        b=snYnAmm54UN4FMIlgn9H+nTkzO4As6fNYGnzMpnRSX4wBcXKOlwPZfpoQ4UjKikAE7
         V8XjZjRcjS6xVjA5+Gl8lCHjLMnTFAxDFW6qmAeZz+u1e9f8hSDSVYYcW8Hs8HMyQPlV
         uFuBWWdG1hcVc/NnlSCidhC166GQ1dMkMTdx4PZVtcgKdyUEhV0J8eEHuUIvtaoFnXRN
         H8kvyMB+83kYRoLlFIwb7pImeAJqDBwKMNdaA7Wy4Tb9/I7kmZHZqO2pKUdFyFSroKif
         Tile72eeWbHtuRlNDN+Mp/KlXmcimoFubovmPwdFt4Me4fB7hYmOr+PghyBLd1yV1UuK
         DX0w==
X-Gm-Message-State: AOAM533iP7fV3WdJwq4StfrGXUq3TS7mwUyxBrBE9UqZw7Xt6Bvzq2A0
        bfphSKN76i1xsyjyVbGJM2KVyEvDvnGm8Fll6SVDdg==
X-Google-Smtp-Source: ABdhPJyeDYxpSSUN00ffOc9Ev/oEZsLPNT6O5Ku56l9FwpBGbOHdogzMKnpaHlpw9hwA/PJ9RkDVNEjOFLQTUl8qHbE=
X-Received: by 2002:a05:6512:2190:: with SMTP id b16mr4995671lft.122.1619827354571;
 Fri, 30 Apr 2021 17:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210430113724.110746-1-colin.king@canonical.com>
In-Reply-To: <20210430113724.110746-1-colin.king@canonical.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 30 Apr 2021 17:02:23 -0700
Message-ID: <CAKwvOdkN3cDof=aEwRRuSEghTZt57TuZucP=pGvpmUXiPSYTWQ@mail.gmail.com>
Subject: Re: [PATCH] KEYS: trusted: Fix memory leak on object td
To:     Colin King <colin.king@canonical.com>
Cc:     James Bottomley <jejb@linux.ibm.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        David Howells <dhowells@redhat.com>,
        James Morris <jmorris@namei.org>,
        "Serge E . Hallyn" <serge@hallyn.com>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Apr 30, 2021 at 4:37 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Two error return paths are neglecting to free allocated object td,
> causing a memory leak. Fix this by returning via the error return
> path that securely kfree's td.
>
> Fixes clang scan-build warning:
> security/keys/trusted-keys/trusted_tpm1.c:496:10: warning: Potential
> memory leak [unix.Malloc]
>
> Fixes: 5df16caada3f ("KEYS: trusted: Fix incorrect handling of tpm_get_random()")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  security/keys/trusted-keys/trusted_tpm1.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/security/keys/trusted-keys/trusted_tpm1.c b/security/keys/trusted-keys/trusted_tpm1.c
> index 469394550801..aa108bea6739 100644
> --- a/security/keys/trusted-keys/trusted_tpm1.c
> +++ b/security/keys/trusted-keys/trusted_tpm1.c
> @@ -493,10 +493,12 @@ static int tpm_seal(struct tpm_buf *tb, uint16_t keytype,
>
>         ret = tpm_get_random(chip, td->nonceodd, TPM_NONCE_SIZE);
>         if (ret < 0)
> -               return ret;
> +               goto out;
>
> -       if (ret != TPM_NONCE_SIZE)
> -               return -EIO;
> +       if (ret != TPM_NONCE_SIZE) {
> +               ret = -EIO;
> +               goto out;
> +       }
>
>         ordinal = htonl(TPM_ORD_SEAL);
>         datsize = htonl(datalen);
> --
> 2.30.2
>


-- 
Thanks,
~Nick Desaulniers
