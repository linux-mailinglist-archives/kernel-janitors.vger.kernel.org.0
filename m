Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9EB3EF937
	for <lists+kernel-janitors@lfdr.de>; Tue,  5 Nov 2019 10:31:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388504AbfKEJ2s (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 5 Nov 2019 04:28:48 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:37432 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388098AbfKEJ2s (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 5 Nov 2019 04:28:48 -0500
Received: by mail-vs1-f65.google.com with SMTP id w25so12995676vso.4
        for <kernel-janitors@vger.kernel.org>; Tue, 05 Nov 2019 01:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q5/7s98PhC6jxZLJVmCHmR13iFo5P8VlHAp+JLns2BA=;
        b=GX5X3lUmaa27neYrHSlFgvaDCVsuKz/zKucQz8VNcC098H9XmWKI7OFY/WbmbEh1CC
         fEQIldAz+Q7MpE1bwuhsGjiuiXHchytXBPJc1l65BFH4Djj36gXxuelWVFBkFdc6oCeH
         d2Il/QdnLcun0JKe4t0Y8XUZIyAAisSSZDQyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q5/7s98PhC6jxZLJVmCHmR13iFo5P8VlHAp+JLns2BA=;
        b=ibYhZq8YfE66eeCOqxtKaOTIkzCsPFR9l4/XZnxsxG6LFDcO7GYFh9GcJaqpyWp/Vi
         2hrA6hIfWw0U69T0zM+Nbk5Wcg4vbl3t1HDg7GBaDCJzwQHWDG5voAmzWRWNG4H50Wdd
         BkJL6ryxREFah0+QaX2wWBSgY+2uFRA2g5ikd0ueonCicwSdsgJ0Ho2+0CGvuMcnXibH
         gv0PlWbHVZPSJwEpm4y1xbGgqcLsAUNjPcsc77qEwh6P01ukb/wdLqXOD3BqWIN7E7dL
         qF4al08ZXjbqP0HusDzjNLF1Z+UeLyNZm2MmwC16zJa02XM0dkJ7U/Gg+58/IB/53quO
         GvkA==
X-Gm-Message-State: APjAAAU4Mmqzoqh/NYmlv7D+/PuwhDc3GKO5sKwhfrYhQBjmm7HRdX3r
        TvP5iZEuH10HtQQM7GK5KSVDp+KvbnLf1ju8wtIH0A==
X-Google-Smtp-Source: APXvYqzcC4WZuFL9Q+uUY8ZxtbmZjlncd9HmkUg6UwU2E06KR+lY3eX/ogNGlaNjf9cIke6TqFQSGDhqa/Z34PxYQiQ=
X-Received: by 2002:a67:b917:: with SMTP id q23mr7153086vsn.205.1572946127039;
 Tue, 05 Nov 2019 01:28:47 -0800 (PST)
MIME-Version: 1.0
References: <d5c12f05-5a07-b698-ae60-2728330dd378@web.de>
In-Reply-To: <d5c12f05-5a07-b698-ae60-2728330dd378@web.de>
From:   Sumit Saxena <sumit.saxena@broadcom.com>
Date:   Tue, 5 Nov 2019 14:58:35 +0530
Message-ID: <CAL2rwxrdOVeO3RT_Y3mk3p-076eMMWm6VVF0C4yiYEWJ0TO5DQ@mail.gmail.com>
Subject: Re: [PATCH] scsi: megaraid_sas: Use common error handling code in megasas_mgmt_ioctl_fw()
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Linux SCSI List <linux-scsi@vger.kernel.org>,
        "PDL,MEGARAIDLINUX" <megaraidlinux.pdl@broadcom.com>,
        "James E. J. Bottomley" <jejb@linux.ibm.com>,
        Kashyap Desai <kashyap.desai@broadcom.com>,
        Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Chandrakanth Patil <chandrakanth.patil@broadcom.com>,
        YueHaibing <yuehaibing@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Nov 1, 2019 at 3:06 AM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 31 Oct 2019 22:23:02 +0100
>
> Move the same error code assignments so that such exception handling
> can be better reused at the end of this function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Sumit Saxena <sumit.saxena@broadcom.com>

> ---
>  drivers/scsi/megaraid/megaraid_sas_base.c | 25 ++++++++++-------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/scsi/megaraid/megaraid_sas_base.c b/drivers/scsi/megaraid/megaraid_sas_base.c
> index c40fbea06cc5..f2f2a240e5af 100644
> --- a/drivers/scsi/megaraid/megaraid_sas_base.c
> +++ b/drivers/scsi/megaraid/megaraid_sas_base.c
> @@ -8272,27 +8272,20 @@ static int megasas_mgmt_ioctl_fw(struct file *file, unsigned long arg)
>                 return PTR_ERR(ioc);
>
>         instance = megasas_lookup_instance(ioc->host_no);
> -       if (!instance) {
> -               error = -ENODEV;
> -               goto out_kfree_ioc;
> -       }
> +       if (!instance)
> +               goto e_nodev;
>
>         /* Block ioctls in VF mode */
> -       if (instance->requestorId && !allow_vf_ioctls) {
> -               error = -ENODEV;
> -               goto out_kfree_ioc;
> -       }
> +       if (instance->requestorId && !allow_vf_ioctls)
> +               goto e_nodev;
>
>         if (atomic_read(&instance->adprecovery) == MEGASAS_HW_CRITICAL_ERROR) {
>                 dev_err(&instance->pdev->dev, "Controller in crit error\n");
> -               error = -ENODEV;
> -               goto out_kfree_ioc;
> +               goto e_nodev;
>         }
>
> -       if (instance->unload == 1) {
> -               error = -ENODEV;
> -               goto out_kfree_ioc;
> -       }
> +       if (instance->unload == 1)
> +               goto e_nodev;
>
>         if (down_interruptible(&instance->ioctl_sem)) {
>                 error = -ERESTARTSYS;
> @@ -8311,6 +8304,10 @@ static int megasas_mgmt_ioctl_fw(struct file *file, unsigned long arg)
>  out_kfree_ioc:
>         kfree(ioc);
>         return error;
> +
> +e_nodev:
> +       error = -ENODEV;
> +       goto out_kfree_ioc;
>  }
>
>  static int megasas_mgmt_ioctl_aen(struct file *file, unsigned long arg)
> --
> 2.23.0
>
