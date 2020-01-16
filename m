Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC8F6140039
	for <lists+kernel-janitors@lfdr.de>; Fri, 17 Jan 2020 00:51:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390647AbgAPXu2 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 16 Jan 2020 18:50:28 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38084 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392118AbgAPXu1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 16 Jan 2020 18:50:27 -0500
Received: by mail-wr1-f65.google.com with SMTP id y17so20969959wrh.5
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Jan 2020 15:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2lbAeEf1Yfxb0DJw9/N9gwdCq7G191eIts14KOq3L+Q=;
        b=hpy0k+VDHzuaeRxDYJuMBs4ThERabafVqSuX9SaVtXcArs5U0b8Ooa+/xRuwNyWgzG
         x2iilgSnBwMaZf9m7w7myErwx7iyxZNWB1TWTG4Kc2U7FqPjUr3gDHcRXkA+J5N3cYm0
         E+vRW8io7CIHnao/TWcmSEADad9mO6H1xUb1O6O5HfdMfZD+ZlX5QLJm3ERmA4pRO2yp
         YM9RrS5V7fL32NeLU067Ac2VjDOsTxHrlt4YLhkLtGhlqaBlsk4WBpDWCN5EVpeP+K0K
         4c9pmVjLF97LmD+CH/WJ4BaQkrXco1rJhEJ+3TmEsDKw6XzMBN1TcJXB0Ku4Qn4kMLsa
         orTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2lbAeEf1Yfxb0DJw9/N9gwdCq7G191eIts14KOq3L+Q=;
        b=TBk9SPM7N9CEV7z1yPh6zZm5wT/Fum/75RLpx5/FN6g7V4K7o8gPKc4s520ohD3KSd
         rWOjkjfLraWxirMFj4C1DTojwWb0XoWwV5Wnb6LI79Ot4ht7s6rCEY54dxuv7SN3qHhj
         +2guQ5V09RK4K2YYckl9h0JbJC8rwobHuMgtczyhdKWsx6PKRGGF5UaTvzRX27hePS2J
         MTsQc2G0R4W1FGyZFU7GKVMV7bsSN8PR4nbvQd6+qZvRaRbw6gB68a4idXX4wYiZomm4
         uQzk1NUwYOPC8WDOOksutgzHUpMNujvC2FhFJU44XMAzreSzjObB5frX6OaVx+oaq+YG
         zW+Q==
X-Gm-Message-State: APjAAAVbK/Ur+FJaiLgZzVtvlsI4JcaZCDeh/pnB2tZg3kGEp/5rGIdZ
        +9G23LpjG4dJ0bi9s18r41glbUlNhOab/zoQkEg=
X-Google-Smtp-Source: APXvYqz3NjHnKZS/uIG7B6I5ItCxyAj0uAxLYgWl/p41bwSYkpABFCg9erzLI0PjhmCIPeRUO3U2/15sl+ZY4Lh55rk=
X-Received: by 2002:a5d:6441:: with SMTP id d1mr5811589wrw.93.1579218625760;
 Thu, 16 Jan 2020 15:50:25 -0800 (PST)
MIME-Version: 1.0
References: <20200113132346.rmeamdmbxwvo7kgj@kili.mountain>
In-Reply-To: <20200113132346.rmeamdmbxwvo7kgj@kili.mountain>
From:   Richard Weinberger <richard.weinberger@gmail.com>
Date:   Fri, 17 Jan 2020 00:50:14 +0100
Message-ID: <CAFLxGvyBO=_4-f+HQPZSaAL=aJouok3y=MxEKjup3Q=Cj0KKZg@mail.gmail.com>
Subject: Re: [PATCH] ubi: Fix an error pointer dereference in error handling code
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jan 13, 2020 at 2:24 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> If "seen_pebs = init_seen(ubi);" fails then "seen_pebs" is an error pointer
> and we try to kfree() it which results in an Oops.
>
> This patch re-arranges the error handling so now it only frees things
> which have been allocated successfully.
>
> Fixes: daef3dd1f0ae ("UBI: Fastmap: Add self check to detect absent PEBs")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/mtd/ubi/fastmap.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> ---
>  drivers/mtd/ubi/fastmap.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)

This patch seems badly formatted.
Copy&paste error?

> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
> index 1c7be4eb3ba6..6b544665318a 100644
> --- a/drivers/mtd/ubi/fastmap.c
> +++ b/drivers/mtd/ubi/fastmap.c
> @@ -1137,7 +1137,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
>         struct rb_node *tmp_rb;
>         int ret, i, j, free_peb_count, used_peb_count, vol_count;
>         int scrub_peb_count, erase_peb_count;
> -       unsigned long *seen_pebs = NULL;
> +       unsigned long *seen_pebs;
>
>         fm_raw = ubi->fm_buf;
>         memset(ubi->fm_buf, 0, ubi->fm_size);
> @@ -1151,7 +1151,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
>         dvbuf = new_fm_vbuf(ubi, UBI_FM_DATA_VOLUME_ID);
>         if (!dvbuf) {
>                 ret = -ENOMEM;
> -               goto out_kfree;
> +               goto out_free_avbuf;
>         }
>
>         avhdr = ubi_get_vid_hdr(avbuf);
> @@ -1160,7 +1160,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
>         seen_pebs = init_seen(ubi);
>         if (IS_ERR(seen_pebs)) {
>                 ret = PTR_ERR(seen_pebs);
> -               goto out_kfree;
> +               goto out_free_dvbuf;
>         }
>
>         spin_lock(&ubi->volumes_lock);
> @@ -1328,7 +1328,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
>         ret = ubi_io_write_vid_hdr(ubi, new_fm->e[0]->pnum, avbuf);
>         if (ret) {
>                 ubi_err(ubi, "unable to write vid_hdr to fastmap SB!");
> -               goto out_kfree;
> +               goto out_free_seen;
>         }
>
>         for (i = 0; i < new_fm->used_blocks; i++) {
> @@ -1350,7 +1350,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
>                 if (ret) {
>                         ubi_err(ubi, "unable to write vid_hdr to PEB %i!",
>                                 new_fm->e[i]->pnum);
> -                       goto out_kfree;
> +                       goto out_free_seen;
>                 }
>         }
>
> @@ -1360,7 +1360,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
>                 if (ret) {
>                         ubi_err(ubi, "unable to write fastmap to PEB %i!",
>                                 new_fm->e[i]->pnum);
> -                       goto out_kfree;
> +                       goto out_free_seen;
>                 }
>         }
>
> @@ -1370,10 +1370,13 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
>         ret = self_check_seen(ubi, seen_pebs);
>         dbg_bld("fastmap written!");
>
> -out_kfree:
> -       ubi_free_vid_buf(avbuf);
> -       ubi_free_vid_buf(dvbuf);
> +out_free_seen:
>         free_seen(seen_pebs);
> +out_free_dvbuf:
> +       ubi_free_vid_buf(dvbuf);
> +out_free_avbuf:
> +       ubi_free_vid_buf(avbuf);
> +
>  out:
>         return ret;
>  }
> --
> 2.11.0
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Thanks,
//richard
