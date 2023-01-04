Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3BF065E0B3
	for <lists+kernel-janitors@lfdr.de>; Thu,  5 Jan 2023 00:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234565AbjADXAk (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 4 Jan 2023 18:00:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbjADXAi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 4 Jan 2023 18:00:38 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E429A395
        for <kernel-janitors@vger.kernel.org>; Wed,  4 Jan 2023 15:00:37 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id r26so45494031edc.5
        for <kernel-janitors@vger.kernel.org>; Wed, 04 Jan 2023 15:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:references:in-reply-to:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XppnWxwUDd4VKlDQMnttNa0YhBi85GdHW05upV3mZfc=;
        b=fJM+bXf1CCW0+0edI2hk1VwRp1Om2TirjIk0wHeI+o2Fip0lBU0Jjm1kxWHjazNp4o
         U7EA36Jujv5wauB3KRLyhGE8X4dAqB+USfoatgowcTJX9nD3cULCxd8wyNaXl0CzG4KB
         q1HcvnOvh5jlGaNrj21gzpE7HMEp4pjmsP7U0gdGn3U2nrzuXjbw3rvKt+or7s2te/za
         cTZsWqT7aLlUTptqj0nR+jGau8aTt5qffhq0az4zHRkJrZ/+KF+czgYl+KjqDUkMbpwm
         8Z2dOoumlMeioBUESsiAN7mNa9ZlBhrKhuH62S0BQ34rCGnox6tZmLwDQqkVGFpc5ukr
         1eyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:references:in-reply-to:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XppnWxwUDd4VKlDQMnttNa0YhBi85GdHW05upV3mZfc=;
        b=DUopO2HfVaCVj5kBkwb4xWu/ZUcS0G6YIkiXiJIbfFttrfGP0rXes35R+JbctDUFip
         0Rn6mekeV7naHa43Faa4Mz+42cnnZhJ9TEMXUVXyPHSDo/oW6FPa7xO9J50QPyYMv0Od
         xZu+f3M14m+PBp841M7Y4kgeUzOE59GG6dh4BlHxc3rw5mSAvfi2HVEzx6nd399Y8gug
         I0ICe0Uw/RUYRe+nndqbWh8NxPAhzkh6I7izKgO3PHxPTJir9QOaNxR0EF/yRvZl7NL0
         zjaSuVu/x9J9spdT7QYclyOKb7DrpgQ/vXOOpvhle9Z87zFwZ1qbnskWEBs28qakTASU
         b2xA==
X-Gm-Message-State: AFqh2ko5RZC5Eq58WVQBFoEuvm960wpU28y+8kyMmbJrzhVxU1RdVLeY
        S83dXkBYPhepFfmdnoecIVNtyYiXRnyVflgUDzLMNpOLoi0hyQ==
X-Google-Smtp-Source: AMrXdXs+eVvyiCxCKe24ziuU8uM070gry+IFf5pBWvFzFx3rMu2JixMyHB0JlUgCGg9QAI/vgJPYEC8PADaLxGNXkoc=
X-Received: by 2002:a17:906:7ac8:b0:840:758a:9157 with SMTP id
 k8-20020a1709067ac800b00840758a9157mr2678444ejo.434.1672872652893; Wed, 04
 Jan 2023 14:50:52 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6f02:81b:b0:27:37f1:bc15 with HTTP; Wed, 4 Jan 2023
 14:50:51 -0800 (PST)
Reply-To: lisaarobet@gmail.com
In-Reply-To: <CAJ8KLPZKUxDZq39GHC=jv+B5FtcA3dQoRwAozXyT7mpDqtT2MA@mail.gmail.com>
References: <CAJ8KLPauCfukWsXYV4A=eUrGM8=Aa0FFD3dUDvGJt=CZTLaKVw@mail.gmail.com>
 <62eb867e.050a0220.0cc7.16e7.GMR@mx.google.com> <CAJ8KLPa5uwGGTPzicNhFHwz-0rZdKfrDTSwNBWxdF--Mfc8t2g@mail.gmail.com>
 <CAJ8KLPZKUxDZq39GHC=jv+B5FtcA3dQoRwAozXyT7mpDqtT2MA@mail.gmail.com>
From:   Lisa <smithgrace507@gmail.com>
Date:   Wed, 4 Jan 2023 22:50:51 +0000
Message-ID: <CAJ8KLPa5V8mMkqJ5HrpQXy=DunsCNFEus7aiLDDOTEgH4NQXmA@mail.gmail.com>
Subject: Re: Delivery Status Notification (Failure)
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

Just wanted to check in and see if you receive my request?

Thanks
