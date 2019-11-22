Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23DE6106856
	for <lists+kernel-janitors@lfdr.de>; Fri, 22 Nov 2019 09:52:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbfKVIwi (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 22 Nov 2019 03:52:38 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:39951 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbfKVIwi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 22 Nov 2019 03:52:38 -0500
Received: by mail-io1-f68.google.com with SMTP id b26so5174502ion.7
        for <kernel-janitors@vger.kernel.org>; Fri, 22 Nov 2019 00:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zvUCCfU5/PF8rJjDmNpUUsFf/nE8qmL8h8zdqi5rKzw=;
        b=RyKyzf1GGgxfFUL3ZZXSYG9WscT2jkc0r3bM6NzvxGgPda04fILQZN7+bU6eHmpbNB
         ior/NfwDcA0qqh0BZDTmbNeT1V6VvnWs/OcTHt1nFvo3OTei+5A6p9fvgCO/jL/w5Pvd
         EwVnevpBlYtBH9M5LxLUWVi0iqNpLjMFvZB6noDme9plHz8+/wZUg6GNOGK1xij0PJRo
         C7n5oTunx1TcVNqjrjc6HXQ563ujD5Fi4QpMKz2vgQqRHZ8r9NEKWe5s7R9qP36gfFK5
         29oQXZN0l+pfKB/e4/qOTJug8SnbFTYeQRMM19tlSRQ2f+W948FwjAjOO2c4f/2PGniq
         oSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zvUCCfU5/PF8rJjDmNpUUsFf/nE8qmL8h8zdqi5rKzw=;
        b=LslxjRNCPH+jOvG+0GOyJ+DTLA65moIKIcDwn9lcVXAnKhqJ4KJyHkPIxj4dac6WFz
         HdkI3B4jtiNLF7lkqUamQ2d9g1EAXcM1jnQTVR72AXR/LAz0XpaLVwIY6JNHZ+1L8lrb
         kA2krozgpgwXoDwymDaQTVELBjfnVEINf0dn/yF0pt7FL49j/e51eFj0hU7U4oU/rzTu
         vOW/UXpJlBD4YwtJXFqiPnes0D//xSa5Lv+xBb44AwQRTRFRbOoGEiU1wlTROtQCcYFv
         Zs9+HrcvvOv4nEFKi9tpcwkRTbb9vLCf5DbNF2f6gep2JNRV6U95pXXy+Tgm1rn9cmz2
         EvNA==
X-Gm-Message-State: APjAAAXH1xxZsGW0vJvmdfNIX8pJGDWo/mqwxRFG9jEExUva+aOY45OC
        p9YQsd5BF68Il2zuHBb2wXbe/J9aYWz4e4lg/FWmCw==
X-Google-Smtp-Source: APXvYqyxNnhUYe6OElYe14bv2Wa+yAScAh3nlgbZvX5P1wTvJXYUBvLXimIQjWiFZhRKaEPl45Zjz/la/ULzvhRjYuQ=
X-Received: by 2002:a6b:ca41:: with SMTP id a62mr2664228iog.217.1574412756306;
 Fri, 22 Nov 2019 00:52:36 -0800 (PST)
MIME-Version: 1.0
References: <20191122020911.33269-1-yuehaibing@huawei.com>
In-Reply-To: <20191122020911.33269-1-yuehaibing@huawei.com>
From:   Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date:   Fri, 22 Nov 2019 09:52:25 +0100
Message-ID: <CAMGffEnCUqFVbOr60wUw3TK_K2_8A=06J8bHj=05pkRUkT4pGA@mail.gmail.com>
Subject: Re: [PATCH -next] scsi: pm80xx: Remove unused including <linux/version.h>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Linux SCSI Mailinglist <linux-scsi@vger.kernel.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Nov 22, 2019 at 3:11 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Remove including <linux/version.h> that don't need it.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Acked-by: Jack Wang <jinpu.wang@cloud.ionos.com>
Thanks,
> ---
>  drivers/scsi/pm8001/pm80xx_hwi.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/scsi/pm8001/pm80xx_hwi.c b/drivers/scsi/pm8001/pm80xx_hwi.c
> index 19601138e889..6402629bcd40 100644
> --- a/drivers/scsi/pm8001/pm80xx_hwi.c
> +++ b/drivers/scsi/pm8001/pm80xx_hwi.c
> @@ -37,7 +37,6 @@
>   * POSSIBILITY OF SUCH DAMAGES.
>   *
>   */
> - #include <linux/version.h>
>   #include <linux/slab.h>
>   #include "pm8001_sas.h"
>   #include "pm80xx_hwi.h"
>
>
>
