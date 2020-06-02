Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE1EF1EC59D
	for <lists+kernel-janitors@lfdr.de>; Wed,  3 Jun 2020 01:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbgFBXWt (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 2 Jun 2020 19:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728321AbgFBXWp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 2 Jun 2020 19:22:45 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C738C08C5C2
        for <kernel-janitors@vger.kernel.org>; Tue,  2 Jun 2020 16:22:45 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id m23so21198vko.2
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Jun 2020 16:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rui6nfEXkR9RNeNeTRrsaME99AQHMk8K/AUIJ5I/AMI=;
        b=mgvbJhQRav73RcCysfGBhLfjII+KzTEIxOz5wXi5BzuaVgVxxYssljthV0APDBLs6m
         CwORb6IW9136cyU59Jxtnyhi3QGu0gv5oIuQ/Uyi0UQvVyMn065B93SdLGu8BzalAOhv
         rXRLgD6nB8CDNniy7aeJauFOEhHjz8j8gim2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rui6nfEXkR9RNeNeTRrsaME99AQHMk8K/AUIJ5I/AMI=;
        b=jy9Mo2XCGF77pZp9+BCU8ECG0gvlku5GUqtNIOj47qRoM9s30n5BSw4r0U1ztyO96Q
         7IJxIFQhJIGKB/rV5mSI8o1tbR8o81GZiw5q1hgeVzPzycGXr6cq6TvByIHMoBM4KWvc
         8eTtHaxMNE13o5OHGfaNkdyPKFIx2ZCZmqrKTQQEaJbGeyPrgUwgnCoBHyCBl7VmuHbj
         5+/8+4d2zNK+lfIiScnvmKPXbTEzSlvbrNF8kfF7vGWOYwyNTbvWz44Cro0IECln5N21
         ct7FFVwA3RDgr4ct7+yUl/utHiNwLN/k7ORnKHhZLCCKgEVls2yT3ZtdczYwWyMvdrmd
         zRuA==
X-Gm-Message-State: AOAM532b/8Go6VtGtNce3OrxAZObOWlwy7ze3xQVi/LDQxCOgA7BdHB1
        r/cZwKHGDgWhgB3fVVdFhCxaV/MxWT8=
X-Google-Smtp-Source: ABdhPJzHExtqtKeL85jGs7d3duTaCwzx2eA8Ror1HWG7a6fEwMcP+E/0LqCR4Qe0VEuEkXnjY4lZQw==
X-Received: by 2002:a1f:a906:: with SMTP id s6mr17919515vke.26.1591140163723;
        Tue, 02 Jun 2020 16:22:43 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 67sm68011vkt.14.2020.06.02.16.22.42
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2020 16:22:42 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id u15so17182vkk.6
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Jun 2020 16:22:42 -0700 (PDT)
X-Received: by 2002:ac5:c54e:: with SMTP id d14mr204225vkl.30.1591140161937;
 Tue, 02 Jun 2020 16:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200602052104.7795-1-lukas.bulwahn@gmail.com>
 <828311d2-61ea-42cb-1449-a53f3772543d@roeck-us.net> <CAODwPW_oxDxF_5-icRs0eaRVLgtP+bDc_OSKa=EcfeSp=c6Fag@mail.gmail.com>
In-Reply-To: <CAODwPW_oxDxF_5-icRs0eaRVLgtP+bDc_OSKa=EcfeSp=c6Fag@mail.gmail.com>
From:   Evan Benn <evanbenn@chromium.org>
Date:   Wed, 3 Jun 2020 09:22:16 +1000
X-Gmail-Original-Message-ID: <CAKz_xw0Tqr-idoZbNzg_didSCr5L+L1=76xjF=Sqj4DgpL9g7Q@mail.gmail.com>
Message-ID: <CAKz_xw0Tqr-idoZbNzg_didSCr5L+L1=76xjF=Sqj4DgpL9g7Q@mail.gmail.com>
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

Apologies for that slip up.

Reviewed-by: Evan Benn <evanbenn@chromium.org>

On Wed, Jun 3, 2020 at 6:16 AM Julius Werner <jwerner@chromium.org> wrote:
>
> Reviewed-by: Julius Werner <jwerner@chromium.org>
