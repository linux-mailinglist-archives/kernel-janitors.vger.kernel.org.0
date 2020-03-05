Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FDAF179EAC
	for <lists+kernel-janitors@lfdr.de>; Thu,  5 Mar 2020 05:43:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725880AbgCEEn3 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 4 Mar 2020 23:43:29 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42503 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbgCEEn3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 4 Mar 2020 23:43:29 -0500
Received: by mail-lj1-f194.google.com with SMTP id q19so4523055ljp.9
        for <kernel-janitors@vger.kernel.org>; Wed, 04 Mar 2020 20:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0ig10XyduVsZjw4w3HMmJwxDdosoLr+guVyiHfv8gK0=;
        b=Jlh/X/YEDONR3IOXn6nxoGLEnIeUJ3iyKiyAQ8f2QzEuxov1wR2zT1eYqvUS/AYq5F
         9xHKaOXV0yEACS/FXpwgnh2EKdpPwjrEPNNO38PqKTEuWZ+CgHMEwxD+HkI/LrROg0hB
         YR3i/KCqEdPBTwRaDSSs6L8tGCWX06xKdweZavMUm33yUpnoFnrH4RYiYlcaChAFOVvZ
         KMPno2mNmtNw9VAltjQmUnFMUWGuvmu27lO9GnhA3PQ9MW/a3wqk5feEPtyUZOVBJWrn
         cSfYJGa9xuYJA+pyDxU4wQ67Y1qe43jCIoAmUSBHTThkEO5AzWYbhrpNVcYGxEe+uP/M
         Dk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0ig10XyduVsZjw4w3HMmJwxDdosoLr+guVyiHfv8gK0=;
        b=IkMtCGOCY+dP0vuvlWRuFmuKAIaZyqSuuiTJ64QXzee/Ssl8kRDc9wH/GCO8CTl8Xr
         FZ3JLuvkN6iwkfo2DDEjveg+L33csAoacppTy9FX8+RRMxbSaPvXMvCH+AlKtJ4PO54E
         yxP72bavv1fzlbKEvsqMTBDUV905FFyzgziUpQIMn/A+yIGBcQ0jShra0ESp84ZcHpya
         ID6fz7rKKK7rg8vraMojA2pVvkyolcaCNO5nJ4LOCUwhBXXgQPlzvGNH2B4EoGRw7XI1
         y2EO6wVZIFtVhPYLlbyFJKKZgdN/auK5+38ZtpyjcwBWk28iA0Flieyo38FSbds9Azxi
         9dEQ==
X-Gm-Message-State: ANhLgQ17tIeJdCEbJVKhqztRcSTK6SaDgvZf+TrZQ2PzZ+FXEJuUQHQo
        fHEt8dB5CQcfExc2+Fv0opppO7rjrBoOFeCMpO4ftw==
X-Google-Smtp-Source: ADFU+vsdtsIPN/hjdmMTRmXabwL436fmEFM1KY5oGBIXd3XKcqkjLBih3S1oNvDRDLlp88m5djXZztpTsxX2PHnpxUg=
X-Received: by 2002:a05:651c:147:: with SMTP id c7mr3817550ljd.206.1583383407161;
 Wed, 04 Mar 2020 20:43:27 -0800 (PST)
MIME-Version: 1.0
References: <20200304211254.5127-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200304211254.5127-1-lukas.bulwahn@gmail.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Thu, 5 Mar 2020 10:13:15 +0530
Message-ID: <CAFA6WYOfLONAM8qAhpiikrGkmDkLq0qcw_eGUTzG1AdgP0TB+w@mail.gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: adjust to trusted keys subsystem creation
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     James Bottomley <jejb@linux.ibm.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Mimi Zohar <zohar@linux.ibm.com>,
        linux-integrity@vger.kernel.org,
        "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
        Sebastian Duda <sebastian.duda@fau.de>,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 5 Mar 2020 at 02:43, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit 47f9c2796891 ("KEYS: trusted: Create trusted keys subsystem")
> renamed trusted.h to trusted_tpm.h in include/keys/, and moved trusted.c
> to trusted-keys/trusted_tpm1.c in security/keys/.
>
> Since then, ./scripts/get_maintainer.pl --self-test complains:
>
>   warning: no file matches F: security/keys/trusted.c
>   warning: no file matches F: include/keys/trusted.h
>
> Rectify the KEYS-TRUSTED entry in MAINTAINERS now and ensure that all
> files in security/keys/ are identified as part of KEYS-TRUSTED.
>

I guess you meant here security/keys/trusted-keys/ instead of security/keys/.

-Sumit

> Co-developed-by: Sebastian Duda <sebastian.duda@fau.de>
> Signed-off-by: Sebastian Duda <sebastian.duda@fau.de>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Changes to v1:
> - use a global pattern for matching the whole security/keys/ directory.
> Sumit, please ack.
> James or Jarkko, please pick this patch v2.
>
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5c755e03ddee..7f11ac752b91 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9276,8 +9276,8 @@ L:        keyrings@vger.kernel.org
>  S:     Supported
>  F:     Documentation/security/keys/trusted-encrypted.rst
>  F:     include/keys/trusted-type.h
> -F:     security/keys/trusted.c
> -F:     include/keys/trusted.h
> +F:     include/keys/trusted_tpm.h
> +F:     security/keys/trusted-keys/
>
>  KEYS/KEYRINGS
>  M:     David Howells <dhowells@redhat.com>
> --
> 2.17.1
>
