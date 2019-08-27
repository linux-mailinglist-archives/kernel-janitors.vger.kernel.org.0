Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 732B89EA0F
	for <lists+kernel-janitors@lfdr.de>; Tue, 27 Aug 2019 15:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730305AbfH0NuU (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 27 Aug 2019 09:50:20 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:38459 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729977AbfH0NuU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 27 Aug 2019 09:50:20 -0400
Received: by mail-vs1-f66.google.com with SMTP id 62so13477875vsl.5
        for <kernel-janitors@vger.kernel.org>; Tue, 27 Aug 2019 06:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Azqn8B8zEoK6qeo0gqFEO5Y6U0l3RHxOtMnA5UrW9xo=;
        b=S1KWANYd3hxj20Oktt/812hJNXbDjSq+iPYkPPc2E0UYVq1fPky1u8+0m7jBg5Qjsu
         9saaDiWsSk4C8ciJjV6vtKC78MxSVKTNzdP982jnw2N/G8BpDzqPlr8nffUPXrF0A1pK
         ptEiM0eRGUZHJCu9UxuZkDRv75hDXvbeqpB7J7f6Bu8mWSP1mf5PW6de3EGQH6LDOdLU
         NuaDp6E1e5rMaQpoxVA6l/lPkC2bnH8xfK6WpgUUcG0Oo3jjCr0WIfP26jhk+RgHKM4C
         r+Eq5tnea8njJrkwp+1DEfxMt7F0Vuf4R0p7KVhTzeoTFopw9bSjA0Rk0eSiGj5Gk+7U
         hhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Azqn8B8zEoK6qeo0gqFEO5Y6U0l3RHxOtMnA5UrW9xo=;
        b=UnDW7h0mrsbqMa9HBpJXEes6yh+G+ZFgnGzoc97jgtV6gWxd1SyiX2sI2WnqI9a22U
         1GG0eZrOQp3SFZ3Yf9W9rzXClzlV2f05bYqm9AfvtwRS7i4JkMr0wG3aG0VC9+5Wn+0f
         mbVMWw6upxk8C7u04D+6WIFjma2SSW26sWrYzINp3SrrM07SKRQLclzd/sZmOxuceYib
         bcfOsstV11IYy1rSy/m+JGIkF57/vjNlELqrzgXBMJve2C33Y9CJoAAgRGSeMlp7N0YN
         Ppmc8n/Mk0NmVNxoizNyXk4xAiJNam5KYNFjz4pqSLHLzW0+yiMLHQmj7IFwmGNno3Cz
         k5CQ==
X-Gm-Message-State: APjAAAWUdQwOP8f3M/KrMu8+/MYBmUFMlJnzsZEK8OGkP6+U1Y6L8ckZ
        c6e0bc78XH0IliiN+HyEN0yHi+R/N8JRR6XlPqqtYg==
X-Google-Smtp-Source: APXvYqx1yncYH92Ikl/BgP+ETxGhkpBu01ffZ2ej/nlflY0sLbDKUCylNmbGeeDyd6Kvh74U3dWYaZ9FdZniZqF64rY=
X-Received: by 2002:a67:e287:: with SMTP id g7mr13476377vsf.200.1566913819149;
 Tue, 27 Aug 2019 06:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190826120013.183435-1-weiyongjun1@huawei.com>
 <20190826130343.GA23584@kadam> <629128e7-cc91-412f-8946-668fac2eb3b9@www.fastmail.com>
 <alpine.DEB.2.21.1908270845410.2537@hadrien>
In-Reply-To: <alpine.DEB.2.21.1908270845410.2537@hadrien>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 27 Aug 2019 15:49:43 +0200
Message-ID: <CAPDyKFqXLG7VCh+9oQQ4HD=6dHQLY1PHEkmC+atnB-zDntKULA@mail.gmail.com>
Subject: Re: [PATCH -next] mmc: aspeed: Fix return value check in aspeed_sdc_probe()
To:     Julia Lawall <julia.lawall@lip6.fr>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Joel Stanley <joel@jms.id.au>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 27 Aug 2019 at 02:47, Julia Lawall <julia.lawall@lip6.fr> wrote:
>
>
>
> On Tue, 27 Aug 2019, Andrew Jeffery wrote:
>
> >
> >
> > On Mon, 26 Aug 2019, at 22:34, Dan Carpenter wrote:
> > > > Fixes: 09eed7fffd33 ("mmc: Add support for the ASPEED SD controller")
> > >                         ^^^^
> > > When we're adding new files, could we use the prefix for the new driver
> > > instead of just the subsystem?  "mmc: aspeed: Add new driver"?
> > > Otherwise it's tricky to know what people want for the driver.
> >
> > I don't have any issue with the request, but I don't understand this last
> > bit. What do you mean by "it's tricky to know what people want for the
> > driver"?
>
> There is no obvious algorithm that tells how to go from a file name to an
> appropriate subject line prefix.

For MMC we normally use the name of the host driver file (excluding
".c") as part of the prefix.

For this case that means I amended the header into: mmc:
sdhci-of-aspeed: Fix return value check in aspeed_sdc_probe() and
applied it for next.

I also took the liberty to change this for the other related patches
for the "aspeed" driver to follow the same pattern.

Kind regards
Uffe
