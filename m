Return-Path: <kernel-janitors+bounces-5895-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3ED39951E9
	for <lists+kernel-janitors@lfdr.de>; Tue,  8 Oct 2024 16:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D83E91C20F56
	for <lists+kernel-janitors@lfdr.de>; Tue,  8 Oct 2024 14:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1381DFDA4;
	Tue,  8 Oct 2024 14:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dv4N+39V"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25171DFDA5
	for <kernel-janitors@vger.kernel.org>; Tue,  8 Oct 2024 14:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728398191; cv=none; b=baiZxJeFh+lFWEWu/2VBGOjzWt0bsBtfOLk2t/pXY7v3GfsQ6R1M+Sd+sUc9YNOEN7PNjKEGVFAQiDSb53UC3YEJ50+gathTA2Q7MhlpEAPkxb0Hv5Od9DJ7kyBz4pQps1kFAceEFTFwln+0m+/kyuoKSihSlq1d/pIEruzGDHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728398191; c=relaxed/simple;
	bh=trhP2fQ5tQcbrAcoOmy+SrWN61xKTxkCLLzO4F17ztc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S4eFQIJnFqcQ9AboQ0JqW1J1sHfQauvEIn6XhnWqiPzWdPcK1rU1cSce0JBJBHRD3CgkPvCA3hFHZifkxXWRtS1FDaa6xEbbXeKne2aIJlChDFAVumKrTp1P4BKw9049lmPWwQUbUvLlSfcQDcWwzSt0zsac2gt5Ae/yCJt7Ws0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dv4N+39V; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e288efeb4feso5062433276.3
        for <kernel-janitors@vger.kernel.org>; Tue, 08 Oct 2024 07:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728398189; x=1729002989; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BAg7ZidTPorvVYHmDce4EjXWI2oNXBm6unQqHawkopY=;
        b=Dv4N+39VHrFx5b92LvIVvlnb6REu+ZYGjkinLIFcE8A5Mc/R0RH3GuU97a+qrbCIUy
         FjfEofgi01xLSwLtOWmCt425/h/NkaOyozUWQcafRIMPoNVznjO7CfNpTGbBPyzZe9x2
         AAsVRBH34MLR/BtstDO7/aD+EF4u3OGPOrNi+aPDSmfOrWVAqGCgtgVb8nfFs8b1ZXvq
         9RLBL0dn1HqsgoBC15LXS3CjGSofWLxcW1XYIpAM9RfvRns1l/XshB1XwK4CnTT1GoHc
         HOj1hvYobE1uDD5Na8trdKh+IZxO92ejriGFx6PZlbWUKjzoLcjE+dh84GEsl/FO6BDd
         ayHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728398189; x=1729002989;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BAg7ZidTPorvVYHmDce4EjXWI2oNXBm6unQqHawkopY=;
        b=CfABsJJJRwLVFQNHjw49fBNtLLYlP9w6YHTV6Dahh0T6Vsfy5vzgyF66vGcOd1KMAP
         nyhKKqKL4WxSk5AzWwrx0Vbg9H/lYZecq29CjQBevsaKZnTZkHZEgEv6EJNXa5dST19/
         W6OukjGolUjI5AcezGNslhhVV3DarMIXeo06G6b/11wTHjjti2BSVZq5rUTf1ZGDf7vf
         5iC4mMvFRBpAFDLzRE9Y5GpnSJehWNWV9m6erOQqkI5k3eS/+DGejTmjx1ywfQW7aRyr
         vP8QGUdJ36Gv2gPGVGDVJopqsyEOtofkeLv7ZcgSqpKwsJJSq5s75/OtNZ1YIY//gxvy
         RYTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7KBgvWOnPueYqTEFYO7JfJAv2GvId2RmPnQcA6IxVvuJFlYCpSOvZ5BULmhEVUvR6Pot3UMdn+c9djegFhRA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxct2WM+vArlkqCVmkoQGc7zx0UGUufhcmKCDbiXfZoox06qTMT
	Y+r3rch8aEJHrLVsaTKFzyxduzOC5K4Py6xppXOOex9AcKa3ENKjv14ADM49EjTEd36t8Oo66Wr
	SRH2pJu+1nO+STDG/biyLTPOW1t1PrE4J3EnVtg==
X-Google-Smtp-Source: AGHT+IElQGC355Tl6gUscWB/+cWTaMDp3U8oY/mskRAuU/uZktLuiXA3kZX0imsHGtcNvu2zACQAimf/q0UcsteCplI=
X-Received: by 2002:a05:6902:2289:b0:e20:25bb:7893 with SMTP id
 3f1490d57ef6-e28939282b3mr11151806276.46.1728398188940; Tue, 08 Oct 2024
 07:36:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6509d6f6ed64193f04e747a98ccea7492c976ca8.1727540434.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <6509d6f6ed64193f04e747a98ccea7492c976ca8.1727540434.git.christophe.jaillet@wanadoo.fr>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 8 Oct 2024 16:35:50 +0200
Message-ID: <CAPDyKFpBK_aGqJh-k=mRYJoupJTULgGW7MueYzQXimLMAaUwTw@mail.gmail.com>
Subject: Re: [PATCH] memstick: Constify struct memstick_device_id
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 28 Sept 2024 at 18:21, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> 'struct memstick_device_id' are not modified in these drivers.
>
> Constifying this structure moves some data to a read-only section, so
> increases overall security.
>
> Update memstick_dev_match(), memstick_bus_match() and struct
> memstick_driver accordingly.
>
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text    data     bss     dec     hex filename
>   74055    3455      88   77598   12f1e drivers/memstick/core/ms_block.o
>
> After:
> =====
>    text    data     bss     dec     hex filename
>   74087    3423      88   77598   12f1e drivers/memstick/core/ms_block.o
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Compile tested only
> ---
>  drivers/memstick/core/memstick.c    | 4 ++--
>  drivers/memstick/core/ms_block.c    | 2 +-
>  drivers/memstick/core/mspro_block.c | 2 +-
>  include/linux/memstick.h            | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/memstick/core/memstick.c b/drivers/memstick/core/memstick.c
> index 9a3a784054cc..ae4e8b8e6eb7 100644
> --- a/drivers/memstick/core/memstick.c
> +++ b/drivers/memstick/core/memstick.c
> @@ -26,7 +26,7 @@ static DEFINE_IDR(memstick_host_idr);
>  static DEFINE_SPINLOCK(memstick_host_lock);
>
>  static int memstick_dev_match(struct memstick_dev *card,
> -                             struct memstick_device_id *id)
> +                             const struct memstick_device_id *id)
>  {
>         if (id->match_flags & MEMSTICK_MATCH_ALL) {
>                 if ((id->type == card->id.type)
> @@ -44,7 +44,7 @@ static int memstick_bus_match(struct device *dev, const struct device_driver *dr
>                                                  dev);
>         const struct memstick_driver *ms_drv = container_of_const(drv, struct memstick_driver,
>                                                                   driver);
> -       struct memstick_device_id *ids = ms_drv->id_table;
> +       const struct memstick_device_id *ids = ms_drv->id_table;
>
>         if (ids) {
>                 while (ids->match_flags) {
> diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
> index 47a314a4eb6f..c572f870fcf1 100644
> --- a/drivers/memstick/core/ms_block.c
> +++ b/drivers/memstick/core/ms_block.c
> @@ -2279,7 +2279,7 @@ static int msb_resume(struct memstick_dev *card)
>
>  #endif /* CONFIG_PM */
>
> -static struct memstick_device_id msb_id_tbl[] = {
> +static const struct memstick_device_id msb_id_tbl[] = {
>         {MEMSTICK_MATCH_ALL, MEMSTICK_TYPE_LEGACY, MEMSTICK_CATEGORY_STORAGE,
>          MEMSTICK_CLASS_FLASH},
>
> diff --git a/drivers/memstick/core/mspro_block.c b/drivers/memstick/core/mspro_block.c
> index 49accfdc89d6..13b317c56069 100644
> --- a/drivers/memstick/core/mspro_block.c
> +++ b/drivers/memstick/core/mspro_block.c
> @@ -1349,7 +1349,7 @@ static int mspro_block_resume(struct memstick_dev *card)
>
>  #endif /* CONFIG_PM */
>
> -static struct memstick_device_id mspro_block_id_tbl[] = {
> +static const struct memstick_device_id mspro_block_id_tbl[] = {
>         {MEMSTICK_MATCH_ALL, MEMSTICK_TYPE_PRO, MEMSTICK_CATEGORY_STORAGE_DUO,
>          MEMSTICK_CLASS_DUO},
>         {}
> diff --git a/include/linux/memstick.h b/include/linux/memstick.h
> index ebf73d4ee969..107bdcbedf79 100644
> --- a/include/linux/memstick.h
> +++ b/include/linux/memstick.h
> @@ -293,7 +293,7 @@ struct memstick_host {
>  };
>
>  struct memstick_driver {
> -       struct memstick_device_id *id_table;
> +       const struct memstick_device_id *id_table;
>         int                       (*probe)(struct memstick_dev *card);
>         void                      (*remove)(struct memstick_dev *card);
>         int                       (*suspend)(struct memstick_dev *card,
> --
> 2.46.2
>

