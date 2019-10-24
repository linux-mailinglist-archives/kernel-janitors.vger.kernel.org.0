Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD5A0E399E
	for <lists+kernel-janitors@lfdr.de>; Thu, 24 Oct 2019 19:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410237AbfJXRQB (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 24 Oct 2019 13:16:01 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:34925 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405901AbfJXRQB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 24 Oct 2019 13:16:01 -0400
Received: by mail-qk1-f193.google.com with SMTP id w2so24135887qkf.2
        for <kernel-janitors@vger.kernel.org>; Thu, 24 Oct 2019 10:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=crG+DRT5ntTO6UrnZjz7Zk+aIch4CLzmhTF61MiVCPc=;
        b=bNp+7fURF9Ol8vUPwHGKGm6mK9ijx7pSmONTo8SbOqpmSf0D+KM+IwQY2l8cYRl0tc
         4Jlf4tFma80yY3usPo8m8fNAx2W3NJVos7I5+Fy3FYeouo5F7elc73VyeznclDfRUKJ6
         1GQuz3/rw88FlDhwFBVqYsiDxvtt5Si747jAG4IuuZuyBtTUXxSgpxctMMsWrQHI2KXC
         L4kMhUMuXKs1qttPbAlVMMH9KKVo9HAGMIHvPYm9S97Q9Oer5iiXEy3Yi0arikGoB0rO
         +td1l/vUo1NwJh2Ncplo9FWjk5/JcFWW548edS3pxJbv/LR2OyPs0zvvU0VdgI5PWi4G
         W/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=crG+DRT5ntTO6UrnZjz7Zk+aIch4CLzmhTF61MiVCPc=;
        b=QIOmbdVfXpG9u+ATU3FJMZjR6pF8/fTMDTr7oJKb/juB2SUvlfjBZeiBmAD/oALde9
         6d7pq/Lt5C+trh21Suxso+WgIasq+PG3sVkBg2yZCc9jGICX/d+KJn56vIvhjL7tcnO6
         AYgdq062DDWCXfWTPOTBiaGvylfq7U00HtP3TwBy0B9hT6NRK1hzKfw/R9d7OpubaP/P
         8gz+RCG4iUi0r+UTqelYRDH6uPNLtCmx5+qgUbivpDpnTaFeSGDSa//Rn0phGouTnBnn
         zjIVepeH848gylftKaZdGVpoHfQuLpoMH9Wj6Dp0DtuJ2C392V6PenJy8HvbXTxTQHae
         Ky5Q==
X-Gm-Message-State: APjAAAVrioYoTOVFJliNO3ngiOhgxAfSWTSW9useuu5F8k+WRQpgIRTt
        4yit+QIhnvO1joZO97wpxmiGTSWdE46ofkI/dNjXqw==
X-Google-Smtp-Source: APXvYqwO+pjq/T6cA1+tZZRLnofnfCEwAKnPL1uQAxpaH1IWS8TnV2isw/FukpIexYC5euabMYGxtp47q9ysO8wbEl8=
X-Received: by 2002:a37:9a8a:: with SMTP id c132mr14717102qke.92.1571937359669;
 Thu, 24 Oct 2019 10:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <20191024124610.18182-1-colin.king@canonical.com>
In-Reply-To: <20191024124610.18182-1-colin.king@canonical.com>
From:   Curtis Malainey <cujomalainey@google.com>
Date:   Thu, 24 Oct 2019 10:15:48 -0700
Message-ID: <CAOReqxhzYnN4vkoiJ1vDN3UwmkJs--u7cUgpoSDtMr1dSThR3Q@mail.gmail.com>
Subject: Re: [PATCH][next] ASoC: rt5677: Add missing null check for failed
 allocation of rt5677_dsp
To:     Colin King <colin.king@canonical.com>
Cc:     Bard Liao <bardliao@realtek.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Curtis Malainey <cujomalainey@chromium.org>,
        Ben Zhang <benzh@chromium.org>,
        ALSA development <alsa-devel@alsa-project.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Oct 24, 2019 at 5:46 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The allocation of rt5677_dsp can potentially fail and return null, so add
> a null check and return -ENOMEM on a memory allocation failure.
>
> Addresses-Coverity: ("Dereference null return")
> Fixes: a0e0d135427c ("ASoC: rt5677: Add a PCM device for streaming hotword via SPI")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Thanks

Acked-by Curtis Malainey <cujomalainey@chromium.org>
> ---
>  sound/soc/codecs/rt5677-spi.c | 2 ++
>  1 file changed, 2 insertions(+)
