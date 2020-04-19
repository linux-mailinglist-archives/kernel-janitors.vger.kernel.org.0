Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 726D21AF919
	for <lists+kernel-janitors@lfdr.de>; Sun, 19 Apr 2020 11:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725923AbgDSJvf (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 19 Apr 2020 05:51:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725905AbgDSJvf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 19 Apr 2020 05:51:35 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C21FC061A10
        for <kernel-janitors@vger.kernel.org>; Sun, 19 Apr 2020 02:51:34 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id g10so4967056lfj.13
        for <kernel-janitors@vger.kernel.org>; Sun, 19 Apr 2020 02:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N9JI33hna/+DxESkUc7SCOMzfYQhchoF06eN0/wfACI=;
        b=p3g9j1xnjdCtzhbgZS6lVhDB+mXR+o9+FTp1/dXRbri/Wmu8K7EsTY54Buw14cqV/t
         VKxBLkOHqGwNawDndp5tVo/S7shTTp5VMCP5HXlx8k/HYr2tWG8IWRdGbpqCALRIZzQM
         Uz+TJKMudQF8GP6epv9M+qUY0yPfFOA3Rtftp5MoijLCN0kLYX66lDmQHN005k+sIOr/
         4WL3/aPNX72Hze9blP2PGXgcyc7ChGVoR33ORT9uk0i6aKO5Tp5fvInqHRq/KFyuRFxh
         70sd1Nm6cx1GNlcjDDS6kH2o/l0cYZ87Zsa8nqUlRZhyHhUD5FqIDNJ3V6gaweMl1PwH
         Ge+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N9JI33hna/+DxESkUc7SCOMzfYQhchoF06eN0/wfACI=;
        b=Yc80Q41GSB1oWi0ATpQSvgGOQDlsdX3GXdB3HzSMKnSB/XW1/XhfooMjLrRO4WHsMv
         O0r0BbT1SzfB+LBl63eurycOc1BTxwCqEPpj+9voZui9xxyPJKRQSoH50KbSoXmyLtoR
         CB9nZvPH3poIoAwjdMvakA6MvLjyk0XQguXsBlbXdBCXqJ99LhIVG4GEAX7yIYLgDg0h
         ZrSpLmDgMi1cBqFH5WCmNVd6osLQFe23MVWJSJ++8ouqoK6ApTImsDXWZOIWLOUJO+r4
         W7rSbvwSEx5I9B+VM9SejKaNOew9OlgyfNma6zFAGm5aYr+p9SVDHJQIxFpBsVo8Slxy
         ySfQ==
X-Gm-Message-State: AGi0PuYty1HUadrMVqzrh1uP0u9+gWrj0KlNaXfuoZHvVvh1twNayByc
        YFpzxuj94uB97zunXJsB8nUWuLtGmopvAWwqm15+7w==
X-Google-Smtp-Source: APiQypIlD7DYc2IomXQqpRtLDysv7ESAnj92UknD/T+xCMSjLv6O3t2ovN2pL1+lrcMzWtZaNVqxUacU/pQItDMN1+I=
X-Received: by 2002:a05:6512:685:: with SMTP id t5mr7019601lfe.47.1587289892894;
 Sun, 19 Apr 2020 02:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200418081637.1585-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200418081637.1585-1-christophe.jaillet@wanadoo.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 19 Apr 2020 11:51:21 +0200
Message-ID: <CACRpkdZ347msE7ohENGw1nBLJX1zQybywKoMA8HgZ6Cc6d9Z-A@mail.gmail.com>
Subject: Re: [PATCH] PCI: v3-semi: Fix a memory leak in some error handling
 paths in 'v3_pci_probe()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Andrew Murray <amurray@thegoodpenguin.co.uk>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-pci <linux-pci@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Apr 18, 2020 at 10:16 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> IF we fails somewhere in 'v3_pci_probe()', we need to free 'host'.
> Use the managed version of 'pci_alloc_host_bridge()' to do that easily.
> The use of managed resources is already widely used in this driver.
>
> Fixes: 68a15eb7bd0c ("PCI: v3-semi: Add V3 Semiconductor PCI host driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
