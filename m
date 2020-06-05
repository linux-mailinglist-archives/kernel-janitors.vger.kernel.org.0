Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA6A21EEF34
	for <lists+kernel-janitors@lfdr.de>; Fri,  5 Jun 2020 03:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726016AbgFEBml (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 4 Jun 2020 21:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgFEBmj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 4 Jun 2020 21:42:39 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7051C08C5C1
        for <kernel-janitors@vger.kernel.org>; Thu,  4 Jun 2020 18:42:37 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id g129so4712061vsc.4
        for <kernel-janitors@vger.kernel.org>; Thu, 04 Jun 2020 18:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C5ypsurKn6EPPW0g1fbnIZOkTknD4rOPJcEpT9vTQck=;
        b=HffCxMdymASad9VyvMn/2LNf5v56Dj+53oolcX6jkBuJFGkFou2hGGiXSQfqGBOmNm
         HVEWDNLljg2ISFqqel2e/W5bnjMEvy3YskA1uOcGblTVNrCvGqzmgYhvPPo9mdMM7heK
         SLkKGObs2MrKOK4IxHgkDx7gnhF7q1R+N2MBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C5ypsurKn6EPPW0g1fbnIZOkTknD4rOPJcEpT9vTQck=;
        b=szHDWGAPBCU7qH5f30jEHBqo8dP8M7EbNE2nyn8Hqg89BTqF+lsdWb0c6YAf62HCWB
         KOijObkYYpTE7J9MUZHjPDFYm5m22Z23EML2heV+/K5AJx6azuczy4NyBUXPsKY79s9M
         YWbtDT69/nC7kJX+6JqceUyliI/pRAANlxWIKLCf7pKzkMV0IDz9gTVT6+/0mJtJxMio
         sf3ZCBjAFbo5iGqNugjekU7coTqscx/T21v+Jwe7ub/gi8PhoYr6C0hgFisTZU/S9NxW
         QYZscMxts0UQtxolReOiZ8QqM4HAY88i3gE4+BdVPCH6Fym7RSDdVOlOQp5RDlpYvXTo
         VPdA==
X-Gm-Message-State: AOAM5326jGDQiy2vCOnnlGb+bhrmq135T/NQwdZ/f33FQVZyKC0rRBx4
        A6IEbO9lfju/UT4ml7hV7pk6smsf8L0=
X-Google-Smtp-Source: ABdhPJw6Sdt2zVFtvaJk7mcl1JySDgF2RIPj1n+++NDMPUsQWn9chu/v5NL/OqE4BJn0GUvQ7CQoew==
X-Received: by 2002:a67:db0b:: with SMTP id z11mr5256907vsj.25.1591321356739;
        Thu, 04 Jun 2020 18:42:36 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id b21sm485619uap.15.2020.06.04.18.42.35
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2020 18:42:35 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id f126so1834263vkb.13
        for <kernel-janitors@vger.kernel.org>; Thu, 04 Jun 2020 18:42:35 -0700 (PDT)
X-Received: by 2002:a1f:5e51:: with SMTP id s78mr5587128vkb.59.1591321355196;
 Thu, 04 Jun 2020 18:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200602052104.7795-1-lukas.bulwahn@gmail.com>
 <828311d2-61ea-42cb-1449-a53f3772543d@roeck-us.net> <CAODwPW_oxDxF_5-icRs0eaRVLgtP+bDc_OSKa=EcfeSp=c6Fag@mail.gmail.com>
 <CAKz_xw0Tqr-idoZbNzg_didSCr5L+L1=76xjF=Sqj4DgpL9g7Q@mail.gmail.com>
In-Reply-To: <CAKz_xw0Tqr-idoZbNzg_didSCr5L+L1=76xjF=Sqj4DgpL9g7Q@mail.gmail.com>
From:   Evan Benn <evanbenn@chromium.org>
Date:   Fri, 5 Jun 2020 11:42:09 +1000
X-Gmail-Original-Message-ID: <CAKz_xw3KuWFSkcz-9hLHGZ2=S7nJ=K=AN6j2FJ6afZBFowJO7g@mail.gmail.com>
Message-ID: <CAKz_xw3KuWFSkcz-9hLHGZ2=S7nJ=K=AN6j2FJ6afZBFowJO7g@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: rectify entry in ARM SMC WATCHDOG DRIVER
To:     Julius Werner <jwerner@chromium.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

AFAICT this has now been merged upstream, I'm not sure what action to take:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5c24a28b4eb842ad1256496be6ae01bab15f1dcb
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=72a9e7fea5866fc471fda78f05f166595c8c6ba6

On Wed, Jun 3, 2020 at 9:22 AM Evan Benn <evanbenn@chromium.org> wrote:
>
> Apologies for that slip up.
>
> Reviewed-by: Evan Benn <evanbenn@chromium.org>
>
> On Wed, Jun 3, 2020 at 6:16 AM Julius Werner <jwerner@chromium.org> wrote:
> >
> > Reviewed-by: Julius Werner <jwerner@chromium.org>
