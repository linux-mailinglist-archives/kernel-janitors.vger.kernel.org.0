Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2642C5690
	for <lists+kernel-janitors@lfdr.de>; Thu, 26 Nov 2020 15:02:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390024AbgKZOCD (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 26 Nov 2020 09:02:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390008AbgKZOCD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Nov 2020 09:02:03 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 635E9C0617A7
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Nov 2020 06:02:01 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id f23so3115393ejk.2
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Nov 2020 06:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C//B80UKsPK42OnJkphrjgs/wi9PrOEUKSvu4T2pPCo=;
        b=Va5VHao16C8ylNksfKF3uVxr4ASphzaBEyKfiBAMrb8Ph1Gkj9FOJwyvAgYhnTeixp
         WMj8PhmtD/eu7d8rBAxk2ijMYb25zeWj/L5MKrMWwU3nKUEDEG57WaHHj+QozeKiA7CK
         3lZF82bhvFbi+abXHhsyNh/x0HWoB9Fcu32UCl4a6xci/2jJHMmmoVhCjNezmhTPxwPY
         8u9m7EcE0T3BHVcjlH2t+gViqwuNjCs9E+cmO9s2Ami3nXzsHjEKu3M/vprHSrjKGxa7
         khr2UPD2IHKBZ5m9Q1uRMNQYREfOeutaD7oDPg53ldESp6mXV6i3SqVHK73gF7ih5vZK
         reeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C//B80UKsPK42OnJkphrjgs/wi9PrOEUKSvu4T2pPCo=;
        b=p+TA3kk0hL6EAe6MKvaMvWgUKu/ZHPwlqAKlSCJl6BrMg5fMLDd1oBR/XkrsINwkNM
         +LIKWL7ELoQP+GhdmKGrDykcm3hFTwdB+CHGZwNYLi/vdBtjtR4DTDnxVITRD+p54T+i
         aVtxhDVVnMLFtPRuLYq4Ae2gyrh3PFS6+vMVDZiEDJjo/Fo2lwJCzu2jwUUbW87seNZl
         zWFhzyV8vaNILVWuPT5LnOAztXSQi6PLmi4ZefrudRezNdDGeeuW9VEgd2iT9gGenrfJ
         0lWfdO7hAy4bp8xVmSOvWvP3V8+mCVifcLijEgU3pPpGF86URxcBocYg+6iU9tE2eCo5
         dhdQ==
X-Gm-Message-State: AOAM531bk8GjD3aYanxPqNBEPIK8tEFB1qjFfGd5Is/fVx6T9Do7buGA
        YnU+7/f+2KcDsDbj2mau77k8Ea/52iBBWnf5FzlISw==
X-Google-Smtp-Source: ABdhPJw137LyNOPuU8evpHIqYGUXPc4VybKBndRUo+PEoVMXB3gSi+WS6uuhYdkyaB2U2vIOPc0TKnzAu2kmaKXGO4Q=
X-Received: by 2002:a17:906:1e0c:: with SMTP id g12mr2872384ejj.115.1606399319938;
 Thu, 26 Nov 2020 06:01:59 -0800 (PST)
MIME-Version: 1.0
References: <20201124093828.307709-1-colin.king@canonical.com>
In-Reply-To: <20201124093828.307709-1-colin.king@canonical.com>
From:   Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date:   Thu, 26 Nov 2020 15:01:49 +0100
Message-ID: <CAMGffEnNkj4GkM-Er-MDuUQiFdZCBD-Bzb1_pGGXazfH=NkCtQ@mail.gmail.com>
Subject: Re: [PATCH][next] scsi: pm8001: remove space in a debug message
To:     Colin King <colin.king@canonical.com>
Cc:     "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Linux SCSI Mailinglist <linux-scsi@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Nov 24, 2020 at 10:38 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There are two words that need separating with a space in a
> pm8001_dbg message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Acked-by: Jack Wang <jinpu.wang@cloud.ionos.com>
Thanks
> ---
>  drivers/scsi/pm8001/pm8001_hwi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/scsi/pm8001/pm8001_hwi.c b/drivers/scsi/pm8001/pm8001_hwi.c
> index 08d6cc9b50db..c8d4d87c5473 100644
> --- a/drivers/scsi/pm8001/pm8001_hwi.c
> +++ b/drivers/scsi/pm8001/pm8001_hwi.c
> @@ -1031,7 +1031,7 @@ pm8001_chip_soft_rst(struct pm8001_hba_info *pm8001_ha)
>         regVal = pm8001_cr32(pm8001_ha, 2, GSM_WRITE_DATA_PARITY_CHECK);
>         pm8001_cw32(pm8001_ha, 2, GSM_WRITE_DATA_PARITY_CHECK, regVal3);
>         pm8001_dbg(pm8001_ha, INIT,
> -                  "GSM 0x700048 - Write Data Parity Check Enableis set to = 0x%x\n",
> +                  "GSM 0x700048 - Write Data Parity Check Enable is set to = 0x%x\n",
>                    pm8001_cr32(pm8001_ha, 2, GSM_WRITE_DATA_PARITY_CHECK));
>
>         /* step 13: bring the IOP and AAP1 out of reset */
> --
> 2.29.2
>
