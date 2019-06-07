Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 863B338435
	for <lists+kernel-janitors@lfdr.de>; Fri,  7 Jun 2019 08:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbfFGGPI (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 7 Jun 2019 02:15:08 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:43496 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726609AbfFGGPI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 7 Jun 2019 02:15:08 -0400
Received: by mail-vs1-f67.google.com with SMTP id d128so495250vsc.10
        for <kernel-janitors@vger.kernel.org>; Thu, 06 Jun 2019 23:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KvN+6NK5XeZcx/uDS+eaq/chxq7rr+3iXQ6JaWco14o=;
        b=e44ssolHhtlDiYJSMUccwgT5Ovw91RUCahGWwApdaPjx3Tob2XLQqRHFyoeQ4e6sxN
         AJ5/4RI8/LZgfZduandrxtd6cq2pG2r1aAgrq1bTRu7R+4Cl0//js75QL3kxtBlZSo6D
         OPoE0tjryuXjc++5pcdy9JmIiu4/wkg5FZ5ro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KvN+6NK5XeZcx/uDS+eaq/chxq7rr+3iXQ6JaWco14o=;
        b=IifBgYJORhaIptmYJa6Yrh0deVUBohMRxyQdgxorDcmpMmDK1qfuZ9lumNDFVuhb8u
         th16HAud1KjgL0iAbM8Xu3dW+QHZ7PAZD4e3RtYaxLNILEo7s25WCLyXq02J+CdWEkaO
         HN82CxlfNnlBlWZbbd2jVxQCr12S3HWWb6E3PZrEvA0QLkYq0//Hfe4o0qxxTAfXoNZI
         3WNtQah+Oelaqtu+31pmyvNSoE92L2wt/ce8dUFMJNuvlEBxZT6lDD6l4D4Yqmay6OEh
         BSmuRXOGnZCFBGUtRPcjkpsYvmnJU+HBDsCfCr44Ocpnlh9OJ5Dm78NNoz9CjPf2PR6j
         m6rA==
X-Gm-Message-State: APjAAAUXznNMgXmCPwyujcsfifqwDeUKZGtguBGFA1k5xR9YH++8qghe
        QYAmZpzP2GudJvpabxaBJPxGRWA9q73ac7Reb/vMaQ==
X-Google-Smtp-Source: APXvYqx+U6MZGnxEkzNkajm3pdzfu0lUV7WmSXEOAyE42958JCYI0TFzW4KTUQg7JpfqsGz0HnxSnJt6atYp9ioLYiw=
X-Received: by 2002:a67:c496:: with SMTP id d22mr11616865vsk.205.1559888107343;
 Thu, 06 Jun 2019 23:15:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190601031806.46753-1-yuehaibing@huawei.com>
In-Reply-To: <20190601031806.46753-1-yuehaibing@huawei.com>
From:   Sumit Saxena <sumit.saxena@broadcom.com>
Date:   Fri, 7 Jun 2019 11:44:55 +0530
Message-ID: <CAL2rwxpPh=QEH5WhvsN_=aNhunzNny6B1CVov8p=cuFaMjOpsQ@mail.gmail.com>
Subject: Re: [PATCH -next] scsi: megaraid_sas: Remove unused including <linux/version.h>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Kashyap Desai <kashyap.desai@broadcom.com>,
        Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "PDL,MEGARAIDLINUX" <megaraidlinux.pdl@broadcom.com>,
        Linux SCSI List <linux-scsi@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Jun 1, 2019 at 8:40 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Remove including <linux/version.h> that don't need it.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Acked-by: Sumit Saxena <sumit.saxena@broadcom.com>

> ---
>  drivers/scsi/megaraid/megaraid_sas_debugfs.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/scsi/megaraid/megaraid_sas_debugfs.c b/drivers/scsi/megaraid/megaraid_sas_debugfs.c
> index e52837bb6807..c69760775efa 100644
> --- a/drivers/scsi/megaraid/megaraid_sas_debugfs.c
> +++ b/drivers/scsi/megaraid/megaraid_sas_debugfs.c
> @@ -25,7 +25,6 @@
>   *
>   *  Send feedback to: megaraidlinux.pdl@broadcom.com
>   */
> -#include <linux/version.h>
>  #include <linux/kernel.h>
>  #include <linux/types.h>
>  #include <linux/pci.h>
>
>
>
>
>
