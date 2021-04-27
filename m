Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF8E736C68E
	for <lists+kernel-janitors@lfdr.de>; Tue, 27 Apr 2021 14:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236249AbhD0M6d (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 27 Apr 2021 08:58:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236235AbhD0M6b (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 27 Apr 2021 08:58:31 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91583C06175F
        for <kernel-janitors@vger.kernel.org>; Tue, 27 Apr 2021 05:57:48 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id z1so69176577ybf.6
        for <kernel-janitors@vger.kernel.org>; Tue, 27 Apr 2021 05:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gmJuaevkbgn2ndJzF8GH9nwHXPdttRaOjLRr8vOD/2w=;
        b=exegFg1F+b3+j8jslEiXMQIEqPTycFT4WNxWy+f/2vE5IQot8SKoBEYkCEA56xZFrh
         +LAmWQflzVQpz8iY64i2EsPcyvJtnX9TMU0RLRRIny6dFeTHPdm+BIOsmwLcGAuI+esa
         bOxAccV4Inl01Xw6LEKh5702sahVdmu1I6Mr7WcFoLcpmetv3szRmAJhU/66gXs6CuzZ
         fW6KGauUtgtT9+sJk2PGSb1Wi9FcikOo0TMh3TyPbQeI/vpTOQyL/WpOHSFAuz42DQ2z
         RTTuT+Y5ReZzTp6VxLQOaVFtcqZEA8XbOWx/qki73oMfWyQEHb9zYkR+IxijAzWYIEsK
         Q69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gmJuaevkbgn2ndJzF8GH9nwHXPdttRaOjLRr8vOD/2w=;
        b=QcYwjsj59TxN/rD1jKsmeS1NO4+epMqMSqgexgFMf2H/DQSPqt0M+Z71OnWGtpykE4
         h+EUoojHROVoEcUJCI4NifWFj/NBWGc3bZ5qstg1S4ZxdbONMHEHtOx2jbFhXGT+C6RO
         lCTgTJyVyqOahQKVUYMP4S5s+OWcqOazKD3DuDs2/rW4hAZh436PWjCnYSAp4C+yhxS5
         a8ne+NxAtV0Fx1Nm+Ig6Kg7citReDGolLx4T7yFL8BpheON6SeuFPOHdzCALVY0JbLUn
         lxguS9sfmvxagvWzkDtJTmX6HKNyp73T3RJhLfO8OQuOXcxwRUXlZjr65tfzcIXP9nuj
         nbqQ==
X-Gm-Message-State: AOAM532W0Xg7eBgbw1q3XaRgPb4FqXtDQO5WrgrZ3SuAUSpls86QKZ38
        4bJkAZkbZjd143iulFnBKDdxKJQrUdDZZOXT4obI5Q==
X-Google-Smtp-Source: ABdhPJyphbqai5bWLp32HleE70lAKIN8ZLtwS8RgkR5RvwvqNN6lQq/dHt0O7uVTJvYKDaId36wD3UxbeM136K1uWcI=
X-Received: by 2002:a25:c746:: with SMTP id w67mr2779075ybe.312.1619528267893;
 Tue, 27 Apr 2021 05:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210427114950.12739-1-colin.king@canonical.com>
 <CAHp75VeFmgOM_APt=pStkU03mP02VgCw0q31bpY7dFnJhKLn8w@mail.gmail.com> <b80db02b-c940-bc6b-a795-82cd9ff43a6b@canonical.com>
In-Reply-To: <b80db02b-c940-bc6b-a795-82cd9ff43a6b@canonical.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 27 Apr 2021 14:57:37 +0200
Message-ID: <CAMpxmJUkHOWafEcO9F08anewdMCraU3U-g9Q=17n-KGSPKYL4A@mail.gmail.com>
Subject: Re: [PATCH][next][V2] gpio: sim: Fix dereference of free'd pointer config
To:     Colin Ian King <colin.king@canonical.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Apr 27, 2021 at 2:20 PM Colin Ian King <colin.king@canonical.com> wrote:
>
> On 27/04/2021 13:11, Andy Shevchenko wrote:
> > On Tue, Apr 27, 2021 at 2:49 PM Colin King <colin.king@canonical.com> wrote:
> >>
> >> From: Colin Ian King <colin.king@canonical.com>
> >>
> >> The error return of config->id dereferences the kfree'd object config.
> >> Fix this by using a temporary variable for the id to avoid this issue.
> >
> > Thanks!
> > I'm wondering how I missed this... Nevertheless
> >
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >
> >> Addresses-Coverity: ("Read from pointer aftyer free")
> >
> > after
> >
>
> Can that be fixed before applying rather me sending a V3?
>

No need, I'll add it and apply right away.

Bartosz

> >> Fixes: a49d14276ac4 ("gpio: sim: allocate IDA numbers earlier")
> >> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> >> ---
> >> V2: Don't make id local to the if statement to improve coding style.
> >>     Thanks to Bartosz Golaszewski for this improvement suggestion.
> >> ---
> >>  drivers/gpio/gpio-sim.c | 8 +++++---
> >>  1 file changed, 5 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> >> index 2e2e6399e453..b21541c0b700 100644
> >> --- a/drivers/gpio/gpio-sim.c
> >> +++ b/drivers/gpio/gpio-sim.c
> >> @@ -744,20 +744,22 @@ static struct config_item *
> >>  gpio_sim_config_make_item(struct config_group *group, const char *name)
> >>  {
> >>         struct gpio_sim_chip_config *config;
> >> +       int id;
> >>
> >>         config = kzalloc(sizeof(*config), GFP_KERNEL);
> >>         if (!config)
> >>                 return ERR_PTR(-ENOMEM);
> >>
> >> -       config->id = ida_alloc(&gpio_sim_ida, GFP_KERNEL);
> >> -       if (config->id < 0) {
> >> +       id = ida_alloc(&gpio_sim_ida, GFP_KERNEL);
> >> +       if (id < 0) {
> >>                 kfree(config);
> >> -               return ERR_PTR(config->id);
> >> +               return ERR_PTR(id);
> >>         }
> >>
> >>         config_item_init_type_name(&config->item, name,
> >>                                    &gpio_sim_chip_config_type);
> >>         config->num_lines = 1;
> >> +       config->id = id;
> >>         mutex_init(&config->lock);
> >>
> >>         return &config->item;
> >> --
> >> 2.30.2
> >>
> >
> >
>
