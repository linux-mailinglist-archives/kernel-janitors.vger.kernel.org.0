Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCFDFE9BDD
	for <lists+kernel-janitors@lfdr.de>; Wed, 30 Oct 2019 13:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbfJ3Mw6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 30 Oct 2019 08:52:58 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:34440 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbfJ3Mw5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 30 Oct 2019 08:52:57 -0400
Received: by mail-vs1-f67.google.com with SMTP id f8so1568917vsg.1
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Oct 2019 05:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BchOSg6wnAs4oKRFihXNzsMJLvwqYQWlHqnAgNcHqY8=;
        b=TY3HOcZXz3quEBuy7fHsMjhrFE0WkkI7EiCmK49VpTfpnIsZOpSHpopNmfwVkz8Loh
         j7WR7bpjzfPHFNOhi4AvUlT5fkpWGB5a2+blG9sqLaQ0qLlAmRE/YKYUe80eFDTMfmdS
         eQ1kQYm3whnddeyBwN1hufnAu6Ylyygm8FNZ9mvx5DKuZ1NRJwaWg4ODXSSb6WSfrFTT
         tg3X8+ZU6lo7iuYKitQ6sS68cPTcOCCoCEVcrBARr8RcYMJhBJ5VZgPWinNSZizGujWE
         i0cNwm0CPsjCf6cWj8NulOk/tWGveONmIaK6fo91j/mFiKcbIa4noDvXNifRGP/EPDfz
         O83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BchOSg6wnAs4oKRFihXNzsMJLvwqYQWlHqnAgNcHqY8=;
        b=FuQagNgSUBZMwHddhvJKzdok1JBkhzRslBwACamLagjuHGWYnQkPBe5or76vNZwOh+
         7SQ++ugcRMHuIQoZ8oY9hGz2FaoevJAKISKiMpz1911zzaHyEkJTMmhHBL9dWqUHvMc8
         5uuKMyJJnNJIYvJrGWyatPkMbYPuvcLqS2nAdgr9u5LkvWXzclKKNX/5s75UUkJ4yAZ+
         y/AZCwZ9Kp7XnktMbcbEK2lFQ1eBBGMpJbR3uPAgrUEr0gKiTeSk478miwk61f/204of
         PdEQ9tX3QpL0ZxQqy82UP/Oot2bQwgqQViPEe81SQ2N6Cv8tfRoJYtvwgVGRWBYNLi5L
         5sBg==
X-Gm-Message-State: APjAAAUibTmDftZg1uAjxNNmEGVjwfjuMdIsS1huoqMfWCpDdJK7wdOJ
        9N3G1brRRNfcdaSDS/q9yi9GcZGw+hXclaOSs00FUFw4gQ4=
X-Google-Smtp-Source: APXvYqxVw//+Wgw8nFkhN3PD2FIEz9ZpIotZHS4tQoRA6wZN9M1ZQ5BvDlHzy+Peb34DIK5RTHEG3BZHeIhnPS3zorU=
X-Received: by 2002:a67:f5c1:: with SMTP id t1mr4971361vso.9.1572439974693;
 Wed, 30 Oct 2019 05:52:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191022114910.652-1-colin.king@canonical.com> <cc9ea171-dfdc-f28e-59a4-26ab55155b8b@linaro.org>
In-Reply-To: <cc9ea171-dfdc-f28e-59a4-26ab55155b8b@linaro.org>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Wed, 30 Oct 2019 18:22:43 +0530
Message-ID: <CAHLCerNvsZDT-FF4a+wsCqi4Fwf04e-rzaVq0qwsUtEWQL6kSQ@mail.gmail.com>
Subject: Re: [PATCH][next] drivers: thermal: tsens: fix potential integer
 overflow on multiply
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Colin King <colin.king@canonical.com>,
        Andy Gross <agross@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Oct 30, 2019 at 1:10 AM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 22/10/2019 13:49, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > Currently a multiply operation is being performed on two int values
> > and the result is being assigned to a u64, presumably because the
> > end result is expected to be probably larger than an int. However,
> > because the multiply is an int multiply one can get overflow. Avoid
> > the overflow by casting degc to a u64 to force a u64 multiply.
> >
> > Addresses-Coverity: ("Unintentional integer overflow")
> > Fixes: fbfe1a042cfd ("drivers: thermal: tsens: Add interrupt support")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/thermal/qcom/tsens-common.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/tsens-common.c
> > index 03bf1b8133ea..3d7855106ecd 100644
> > --- a/drivers/thermal/qcom/tsens-common.c
> > +++ b/drivers/thermal/qcom/tsens-common.c
> > @@ -92,7 +92,7 @@ void compute_intercept_slope(struct tsens_priv *priv, u32 *p1,
> >
> >  static inline u32 degc_to_code(int degc, const struct tsens_sensor *s)
> >  {
> > -     u64 code = (degc * s->slope + s->offset) / SLOPE_FACTOR;
> > +     u64 code = ((u64)degc * s->slope + s->offset) / SLOPE_FACTOR;
>
>
> -       u64 code = ((u64)degc * s->slope + s->offset) / SLOPE_FACTOR;
> +       u64 code = div_u64(((u64)degc * s->slope + s->offset),
> SLOPE_FACTOR);

This implementation should handle 32-bit architectures too. Colin,
could you respin?

Regards,
Amit
