Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 272B8106863
	for <lists+kernel-janitors@lfdr.de>; Fri, 22 Nov 2019 09:53:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727117AbfKVIx4 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 22 Nov 2019 03:53:56 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:35797 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727106AbfKVIx4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 22 Nov 2019 03:53:56 -0500
Received: by mail-io1-f68.google.com with SMTP id x21so7105522ior.2
        for <kernel-janitors@vger.kernel.org>; Fri, 22 Nov 2019 00:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=if8y5NFlyeeHTVh2ye2YOtmqiEB2pxeks7g0W56+3es=;
        b=JwHoJJc9ZdDEo2RfCLoHKhgPn33o0v94BCrI2ZMbALFuFVtOHM1a+qalcjViTJfFQT
         wGcdzwIMTaDsA1t3vMYt//MtNtE3uURk5xRuo2xlStXwYIn3bJMXAwFvyYkjueSS4CD1
         zgF9/i0saIRA64YKR74eTiK0B+nP1OrKdDmxAi1y+jpz1jorKEHmjys8nLyksACQpDai
         8LBpdj5FaasX8V3ouc2ihovhAIJJN4RANMDxnmpnA+3eu9lF9Y3J6q9rpdt0xwzYKDBI
         LFz+oY+uQ9v12b95F5t2v5ukYMy77BpLoqRIcmZkF3V7HZ7hw+WQN1KiyW/+7EMtM9MJ
         U0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=if8y5NFlyeeHTVh2ye2YOtmqiEB2pxeks7g0W56+3es=;
        b=mXRW8uaeVxa5JCq1ZRDYgi5WY1gjfXv2yWAkQW0mVjfmjSSaYQbnzVFOEMKozY8AKn
         Fy2nxbIN69s5/3WBYBj2TzKMJE8YTj+slR/EsubQKqOAVcRZugc9il/TMm2+rHNsHtdX
         Sa+n8TSaiqaXYJYpYbr1GGmtwJ7KnFHGk2k9sq0qZw6HimgRLojR8NJdUsrPS0Mt4uSH
         P+3h1OoWoEzgDgrSYVy7DgXgg6VG9htQBVUmWSsuHlmQssJJ/60IOq7IUWkW7lxlD2nb
         2UI1abEDqCAXuBbLCVHSzTwB64at/DLNqeb1XTegsiXZnCE5X/1YiupqLgX0Qk2Eef1w
         Hg3A==
X-Gm-Message-State: APjAAAUtR4tpZIwPn3xxdGNIhfRdMX7JapqC9cpD0rL/SdGiuY73V3xd
        mDYnd5VycmQ7LZtdS7vbb18XL/CsORQ4DUbfRPM0lw==
X-Google-Smtp-Source: APXvYqxDK3EHEOhKT9JqqXJcN1RlH2l246qXTmKF4IrMpMVi2D/sVuuclWbE+i1Pf3xycShYZT9chaj6eIn92yKanrg=
X-Received: by 2002:a5d:9c15:: with SMTP id 21mr5135825ioe.298.1574412834417;
 Fri, 22 Nov 2019 00:53:54 -0800 (PST)
MIME-Version: 1.0
References: <20191120135031.270708-1-colin.king@canonical.com>
In-Reply-To: <20191120135031.270708-1-colin.king@canonical.com>
From:   Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date:   Fri, 22 Nov 2019 09:53:43 +0100
Message-ID: <CAMGffE=dHSO8jW4+iVe7xe5n6esdEb0D9V61XvFr3=a-MAMJJw@mail.gmail.com>
Subject: Re: [PATCH][next] scsi: pm80xx: fix logic to break out of loop when
 register value is 2 or 3
To:     Colin King <colin.king@canonical.com>
Cc:     "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Deepak Ukey <Deepak.Ukey@microchip.com>,
        Viswas G <Viswas.G@microchip.com>,
        Linux SCSI Mailinglist <linux-scsi@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Nov 20, 2019 at 2:50 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The condition (reg_val != 2) || (reg_val != 3) will always be true because
> reg_val cannot be equal to two different values at the same time. Fix this
> by replacing the || operator with && so that the loop will loop if reg_val
> is not a 2 and not a 3 as was originally intended.
>
> Addresses-Coverity: ("Constant expression result")
> Fixes: 50dc2f221455 ("scsi: pm80xx: Modified the logic to collect fatal dump")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
looks fine. thanks Colin.
Acked-by: Jack Wang <jinpu.wang@cloud.ionos.com>
> ---
>  drivers/scsi/pm8001/pm80xx_hwi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/scsi/pm8001/pm80xx_hwi.c b/drivers/scsi/pm8001/pm80xx_hwi.c
> index 19601138e889..d41908b23760 100644
> --- a/drivers/scsi/pm8001/pm80xx_hwi.c
> +++ b/drivers/scsi/pm8001/pm80xx_hwi.c
> @@ -348,7 +348,7 @@ ssize_t pm80xx_get_fatal_dump(struct device *cdev,
>                         do {
>                                 reg_val = pm8001_mr32(fatal_table_address,
>                                         MPI_FATAL_EDUMP_TABLE_STATUS);
> -                       } while (((reg_val != 2) || (reg_val != 3)) &&
> +                       } while (((reg_val != 2) && (reg_val != 3)) &&
>                                         time_before(jiffies, start));
>
>                         if (reg_val < 2) {
> --
> 2.24.0
>
