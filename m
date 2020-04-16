Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97B301ABE9E
	for <lists+kernel-janitors@lfdr.de>; Thu, 16 Apr 2020 12:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505813AbgDPK6o (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 16 Apr 2020 06:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505552AbgDPKtw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 16 Apr 2020 06:49:52 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5706FC061BD3
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Apr 2020 03:42:47 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id k28so5193922lfe.10
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Apr 2020 03:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5sBt7Y0J5CJLOpgj9W3lTxZluw2lpZwvRsvq3wJNOuc=;
        b=IYkFzbchsaUv1RvEcax38OuhWWfAP14+YekZ3ZiXrKBrNiiDHhWq61k9RUpTO7Add0
         XOD8SWeKL/BFKPnRpIsWwZLrwLiP9aEJzxQb161VEZZtIxZtGhV1FUUIaw9S6/ifI5DB
         koWMjQ8jIlKvnKjjTKUQmy5Gk2nNESpoxNBLfDMf+oLC7yNzjg4OESiRanDIkQ7l7DpA
         nRdwRBiKSciWG9shSzskFmTl/yxlJ5L/gCjnK7xdpDkGmVNQzOWzH5yT94z54Z+IfhaM
         n+PC5dNL/EkM29CLXGGxiV2DQ9X0lUNWdNmQQqorqGhtdvQirkzH5PSC3Y7KO733kULB
         anSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5sBt7Y0J5CJLOpgj9W3lTxZluw2lpZwvRsvq3wJNOuc=;
        b=D6m0Oov1OlIVWPNhMiVsUUJYEYx9/V+XgE7kPt4gUKH/tkRLvH9uVg05GAhYCRp4FE
         wiggO4lq8ye6mGovMFnmwdetAPIHIk9TTz7zTRaReWOFikJOB72MLUHq+R1r50m24Wyc
         fYgN7ihaVLLfDwxlXu/sY1/7QosvtJjh/GQqJAFUAHydzV9C067FIVWp1mazeo1aPLdI
         L8tYoRjQPTQ+vSecTi7p7OV0D7qkS4ypvcLM/3o+Tut7lS3dI7MiSeiXYqzRUS+kQRzi
         s033OibklfhnDoVFt3KmSdhJEJ8zSNxidmGYo2NbWXRDt8q92nfVPMc3Klw/0lCe5zTY
         UDNg==
X-Gm-Message-State: AGi0PuaZPf0hROKCaE2Se1yuwo27sPNqbtPky9y6yza4fZF+Mh0778PG
        XcAsNyofQqaEP/+fGDjlJ53xkgInQbD3QqTsIfmI2Q==
X-Google-Smtp-Source: APiQypLr7z8VgK4rNGT1FQMVrt2BpOa71bVF8AIT2YamcngQbMd+JeeHa8MdEkh8jcjpi/+CBHMRZSb3e/miRYmZ6KU=
X-Received: by 2002:a19:700b:: with SMTP id h11mr5802769lfc.89.1587033765824;
 Thu, 16 Apr 2020 03:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200408070832.137037-1-yuehaibing@huawei.com>
In-Reply-To: <20200408070832.137037-1-yuehaibing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 12:42:34 +0200
Message-ID: <CACRpkdYjpw47q2NDZH1XNibyad8qg1D8bSS-AHf4AJatYEQ8bw@mail.gmail.com>
Subject: Re: [PATCH -next] gpio: remove unused including <linux/version.h>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Asmaa Mnebhi <Asmaa@mellanox.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Apr 8, 2020 at 9:06 AM YueHaibing <yuehaibing@huawei.com> wrote:

> Remove including <linux/version.h> that don't need it.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied with subject change to indicate the driver.

Yours,
Linus Walleij
