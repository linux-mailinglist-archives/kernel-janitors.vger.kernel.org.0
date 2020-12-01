Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 513B52CA75C
	for <lists+kernel-janitors@lfdr.de>; Tue,  1 Dec 2020 16:46:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391943AbgLAPoX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 1 Dec 2020 10:44:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388237AbgLAPoX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Dec 2020 10:44:23 -0500
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40283C0613D4
        for <kernel-janitors@vger.kernel.org>; Tue,  1 Dec 2020 07:43:43 -0800 (PST)
Received: by mail-vk1-xa44.google.com with SMTP id w190so526639vkg.13
        for <kernel-janitors@vger.kernel.org>; Tue, 01 Dec 2020 07:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ublsz4UjgUbpORn7U8gi9gf1r205x1Lev92pLKzC+V4=;
        b=Xk6hhXSm+W9hpw1fjMz5TIaHAZ4a3owISlzNaCn3o4SXxNcE7DOPms41QRA+DoWxiZ
         /au3JLy6qsQUT9OYtQGIFDvqSUgzNm6Fmp9C+S4MQRxnc5FjOJXQ7ibMFMBcn8wYknpy
         qlG9VoJpHOjHpthKqCDQcyIx4tR4sd3Ieaapk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ublsz4UjgUbpORn7U8gi9gf1r205x1Lev92pLKzC+V4=;
        b=ZAwswfkmfKRbBEjHpwEpfDevUbKIqMrpV0IsCQ6Q7LN18hIs+MogWUFGGtkXNX2SFV
         GndRjv8gBYBJlpaRVvQdcCQ7fFYm7vDabcy8iRHR0FE/EHGoSZXedQA21VRuV8iqXdOZ
         VQYd5XwQ6xDzfml28ck62w9Wvc1MTzpIsgXmUzobg1APxb9awHRABX2bYlTh7nRw2DZs
         tL4myc6vOup1Nj6qr2jCLNBjHiq4g6Zb/S1Rqi/RteS6KxuAML3UYQ8W1lNq86WUGGRv
         LbXxt1k2pXY7/8xcv/LrZPJpKvb5fgyqJR2kBz/EvZqemvwPGfsZ8lEeX+OJ+svk3LMf
         zVBg==
X-Gm-Message-State: AOAM532tSE4rFau+qQ3GNLdaRqwkjyVnlu/AvLu270yReE7GMXabjX0+
        BGbEkoZ3DzNYejj+791ylsdNlDYIGV9QFw==
X-Google-Smtp-Source: ABdhPJwPNCmQxCY81OCAVmWurJdxQrxhesrdI/FpFuEf9UuF83HVF7O/d3CqCrZEo3slK/FlkexqMw==
X-Received: by 2002:a1f:2717:: with SMTP id n23mr1669288vkn.25.1606837420916;
        Tue, 01 Dec 2020 07:43:40 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id q11sm356vke.35.2020.12.01.07.43.39
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 07:43:40 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id y26so712284uan.5
        for <kernel-janitors@vger.kernel.org>; Tue, 01 Dec 2020 07:43:39 -0800 (PST)
X-Received: by 2002:ab0:6285:: with SMTP id z5mr2961275uao.0.1606837419257;
 Tue, 01 Dec 2020 07:43:39 -0800 (PST)
MIME-Version: 1.0
References: <X8XqwK0z//8sSWJR@mwanda>
In-Reply-To: <X8XqwK0z//8sSWJR@mwanda>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 1 Dec 2020 07:43:27 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WVqTX1Ct4wNMghp2+kmz+J5D18r_g9FHF7dQtHUREaoQ@mail.gmail.com>
Message-ID: <CAD=FV=WVqTX1Ct4wNMghp2+kmz+J5D18r_g9FHF7dQtHUREaoQ@mail.gmail.com>
Subject: Re: [PATCH] iio: sx9310: Off by one in sx9310_read_thresh()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Daniel Campello <campello@chromium.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-iio <linux-iio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On Mon, Nov 30, 2020 at 11:03 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This > should be >= to prevent reading one element beyond the end of
> the sx9310_pthresh_codes[] array.
>
> Fixes: ad2b473e2ba3 ("iio: sx9310: Support setting proximity thresholds")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/iio/proximity/sx9310.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
