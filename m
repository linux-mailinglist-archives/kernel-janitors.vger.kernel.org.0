Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 310B071EEB
	for <lists+kernel-janitors@lfdr.de>; Tue, 23 Jul 2019 20:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388565AbfGWSRY (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 23 Jul 2019 14:17:24 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:39642 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727916AbfGWSRY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 23 Jul 2019 14:17:24 -0400
Received: by mail-ua1-f67.google.com with SMTP id j8so17322996uan.6
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Jul 2019 11:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=82d9c75d2N5edHNgI510WWQsvw//3O8L7Akked9Pdus=;
        b=hXReIxZrRnD1TqXU0vlEWk6jzlmDLpgM0IMU0/QsxPFfyftBuYsmhFuHJxqiuTFAUi
         prSYvMNSOyATO9LAspoPhPCRFVKo79B9UfqDzaVh3FsOYxirUViCGTJE9C7FnzyyNnAp
         kqXyFHIHz04iGyjQBM79sfXLnwPTIghYjsud4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=82d9c75d2N5edHNgI510WWQsvw//3O8L7Akked9Pdus=;
        b=LDURVyS0ZbOBuk//vxrZV6MObEzDorxfJFUEd6uxokpa7XE/aIOTEQJI/4fDZu5p0D
         s8Fyw8u0viar26kbc/OzOJBJWdbAvw9Vc2TT9t3wuwo0ZUnz3cx1LxMXKvFKB6dZFhEG
         VuWfgAKfZURh/nWcQnHP+qHtns2SxYAq3H1hqYqymO5nSNdXt5qdUQKWBD5b6lfvGhV5
         u1R5p451U6N3v++bnUF9bPQp4mO1ZXv0oRM3lfwakjXAvskZep0iTsDvILDJ42r2BZPK
         htAGIXUuOm0FKVyfiYQFRgLVhSOTTjNrPbUjzu2O8jt7sBI1ciPcIiqYyMPKjS2HqZLV
         g/gQ==
X-Gm-Message-State: APjAAAXpvuo8TZNf79q1VfHEWSWs4yiLSmQGVBEXPGVwE1SVa0d1U8L2
        /eNvBYb4mVWiaToTX6whoc7RWSZzXhdFEBcLIKQi6Q==
X-Google-Smtp-Source: APXvYqyYqdC0VtXJ1fmDprfj3PHJhgNn1E+lUKXbEwOkrnpKi3XLMDgYKQw8xVEM+dv1QiaoM9bLy9iF/y4lCSZphUY=
X-Received: by 2002:ab0:4993:: with SMTP id e19mr49852000uad.2.1563905843320;
 Tue, 23 Jul 2019 11:17:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190720215840.23831-1-colin.king@canonical.com>
In-Reply-To: <20190720215840.23831-1-colin.king@canonical.com>
From:   Sumit Saxena <sumit.saxena@broadcom.com>
Date:   Tue, 23 Jul 2019 23:47:11 +0530
Message-ID: <CAL2rwxp_MNBiouBmAEXidEVxoLmb74dZWbGTPyTazH+MRe_sFg@mail.gmail.com>
Subject: Re: [PATCH][next] scsi: megaraid_sas: fix spelling mistake
 "megarid_sas" -> "megaraid_sas"
To:     Colin King <colin.king@canonical.com>
Cc:     Kashyap Desai <kashyap.desai@broadcom.com>,
        Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        "PDL,MEGARAIDLINUX" <megaraidlinux.pdl@broadcom.com>,
        Linux SCSI List <linux-scsi@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Jul 21, 2019 at 3:28 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Fix spelling mistake in kernel warning message and replace
> printk with with pr_warn.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Acked-by: Sumit Saxena <sumit.saxena@broadcom.com>
> ---
>  drivers/scsi/megaraid/megaraid_sas_base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/scsi/megaraid/megaraid_sas_base.c b/drivers/scsi/megaraid/megaraid_sas_base.c
> index b2339d04a700..2590746c81e3 100644
> --- a/drivers/scsi/megaraid/megaraid_sas_base.c
> +++ b/drivers/scsi/megaraid/megaraid_sas_base.c
> @@ -8763,7 +8763,7 @@ static int __init megasas_init(void)
>
>         if ((event_log_level < MFI_EVT_CLASS_DEBUG) ||
>             (event_log_level > MFI_EVT_CLASS_DEAD)) {
> -               printk(KERN_WARNING "megarid_sas: provided event log level is out of range, setting it to default 2(CLASS_CRITICAL), permissible range is: -2 to 4\n");
> +               pr_warn("megaraid_sas: provided event log level is out of range, setting it to default 2(CLASS_CRITICAL), permissible range is: -2 to 4\n");
>                 event_log_level = MFI_EVT_CLASS_CRITICAL;
>         }
>
> --
> 2.20.1
>
