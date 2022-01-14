Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4629148E7FF
	for <lists+kernel-janitors@lfdr.de>; Fri, 14 Jan 2022 11:01:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237477AbiANKBc (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 14 Jan 2022 05:01:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234126AbiANKBa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 14 Jan 2022 05:01:30 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8102C061574
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Jan 2022 02:01:29 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id bg19-20020a05600c3c9300b0034565e837b6so3259657wmb.1
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Jan 2022 02:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DcACr8Bd+mNZvnu1O74OohObZ0GddAZiXwcQTYhmUQY=;
        b=p8xafJDL5i8uvPfKnstNQWZ9evJZVA7UxSY4oqdA6G4x/Evelpj/oHt+NLas34INpx
         XNXJJghAC3Vl1rb1MOO1xHFMklmAD76kv8xB3JLIQ01DyzbUSuyOg5x90oagYmdO+RPw
         uGbhqCfr/xmk99FjGbLezVxStHqEvNUKdFz8qLPTaoEIGjtb6s2Wedvb/R/8zH/HwTuS
         c+iwgqBFr6jngXx3CFlT1Ppkn7TV8asB6XXywFA6pGr0O2LgydiTjBvGG8GjHfdlLB7Y
         vXJPbRmVJt3PQxTw9sE0wjBvgIowondxtBER7pqsT0TfpRRneCv4LdRoPJganioaGSZs
         6Fyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DcACr8Bd+mNZvnu1O74OohObZ0GddAZiXwcQTYhmUQY=;
        b=uJLWZ+rkagLLRhUyP0ZY5TyiOagkFt5B3Pnnjz0xThrPgFwVOJCGNduyOME7VLvfh0
         kE0X2Jgy6FiKz8s2tbEuTfk7jG7fbrUnuXDhvOtqKUonS+g83a2nZdMo68RhjHwZx7Os
         vPdbSxxTDUhvZfYUQb1f1D0imn8SaWL5i2kSs68jja+vdOawEzuFBoNF3JqI2FQ9/PGU
         h2FTmIy+3Q5MiQl6KCsaRB4nFsdyCtKPPubPq//IAmDZeMWvtc/DJMZWHtHrYLzthl0E
         L53LTXl04OIKxsyKb0DjpTVVxuURRCINPdDSOV3BssfrcIZ30tXBzyqij/OauW/OmSMh
         kz0w==
X-Gm-Message-State: AOAM533kc9inCtSSk8hkFJPMA8sZRELmNXCH7pMbAw2DK0VTZ+yr5g4N
        UF4AHHGRDUG7cse+jCC26h4KZj2TBP4dpD63QvrBz1TYjcs=
X-Google-Smtp-Source: ABdhPJwe5ihRS+8JPaUHiM2gWpjslK40TLTyJ5Wm2IxkKjXyp5F5glRNDdvkaM6MX+lKXVyxeolziQq6bwiytBCmeLk=
X-Received: by 2002:a05:600c:4f49:: with SMTP id m9mr14636872wmq.8.1642154488280;
 Fri, 14 Jan 2022 02:01:28 -0800 (PST)
MIME-Version: 1.0
References: <0e30e1f1bde74bc95085093fb0289007d510a68c.1640529121.git.christophe.jaillet@wanadoo.fr>
 <CAFA6WYOZtMW7bq98JXm8AqgajaYmythiDQ53k-zgew6zE63YCg@mail.gmail.com>
In-Reply-To: <CAFA6WYOZtMW7bq98JXm8AqgajaYmythiDQ53k-zgew6zE63YCg@mail.gmail.com>
From:   Jens Wiklander <jens.wiklander@linaro.org>
Date:   Fri, 14 Jan 2022 11:01:17 +0100
Message-ID: <CAHUa44Ghzbtj_YUQxAjq7cKmmJW8hRrYvq+9UwZn9CHkHO8_PQ@mail.gmail.com>
Subject: Re: [PATCH] optee: Use bitmap_free() to free bitmap
To:     Sumit Garg <sumit.garg@linaro.org>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Dec 27, 2021 at 6:36 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> On Sun, 26 Dec 2021 at 20:02, Christophe JAILLET
> <christophe.jaillet@wanadoo.fr> wrote:
> >
> > kfree() and bitmap_free() are the same. But using the latter is more
> > consistent when freeing memory allocated with bitmap_zalloc().
> >
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> >  drivers/tee/optee/notif.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
>
> Looks reasonable to me.
>
> Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
>

Looks good, picking up this.

Thanks,
Jens
