Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D53465BBC
	for <lists+kernel-janitors@lfdr.de>; Thu,  2 Dec 2021 02:34:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243975AbhLBBhi (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 1 Dec 2021 20:37:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235755AbhLBBhe (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 1 Dec 2021 20:37:34 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AAE4C061748
        for <kernel-janitors@vger.kernel.org>; Wed,  1 Dec 2021 17:34:11 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so37855812otj.7
        for <kernel-janitors@vger.kernel.org>; Wed, 01 Dec 2021 17:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d+XuG6Rhxamfp5KgQN3NSNvn71J8gd9Dkbo91ezHvzM=;
        b=Dnf2tQiC3StpM3HKjMeU3Iu5fadGK74GnNJqSKkXG2OJDZOWMDwhhl8VQcYrJhP8AI
         Pz1NbTh+QTHdHVi8CCNNQgbu6A/S1t6S3I/KxGYp4W4A8il4ubUGszY7oecBACAd/3tA
         c6PignUqCFaSBa2TyhTEfChrrMX+TmuaOGkjMUdBqsqoZCOMx2wpWR/tQx6FUJ8ch+Ki
         G+FcT0zUCNqpK10exFaV0ltXmRwtRdrNAHvWrpWJr87kFeAPNhNtbMXPr+G4U8h3Qf2k
         Y/o4KXkXrJ037G4hxnjCcPLWsP8eUrR/h2gi7o7wxwg2mA+UX46Ljtu/WqD5Oigo5Hmx
         bxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d+XuG6Rhxamfp5KgQN3NSNvn71J8gd9Dkbo91ezHvzM=;
        b=FqHVVPoHPYZvdZLAx+qp4oxbz+MVlGJ1YtmZqPRlLMlbWCG2qq+AfRWqCJgIBJsNnG
         O+qzOGPkeKAYw0x//HRo6jWebbzF2+URGkkIRL8+/HIZd5hySp8KIZ/cvJ6LUbo6GVS7
         bW5RTVl0RneoQtWOJuov6pkp4waXb4JhebJXNGEeVcD74mqdj3L+IJTwiNW7QLRrx1rR
         Uu93j3mM91Klojd878taRvbxfnh4gCp43TSmL/yop3isqswtCbEIb/5J1Ndd9NQ4t3qz
         exx6DX8LRtUU37zGM9dg6L8yVn0G8UHkvn3qsPmOI5ceyENCYQBARpYPdTIcoi+XjR4H
         te8A==
X-Gm-Message-State: AOAM531MMqo/eLu7R1ybZcgoC9DI93GmE07aRD/6+02kv3I9konE4TVA
        t4N7UbGPyq/xUg+zBtDgolR4VnvlSVbvRpTmrnwjOw==
X-Google-Smtp-Source: ABdhPJxGovl9b0ONJrEu2UZ3i/fVl7WOkeEyHyn2CDkXY7adn4ma4KQPYPb6fSVGJGVoRKHYeiLM7Lf0H1qxR67cqZU=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr9055479otj.35.1638408850811;
 Wed, 01 Dec 2021 17:34:10 -0800 (PST)
MIME-Version: 1.0
References: <20211127140836.GB24002@kili>
In-Reply-To: <20211127140836.GB24002@kili>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 2 Dec 2021 02:33:59 +0100
Message-ID: <CACRpkdbaAgzdvOmjT1y+0uKTKhJgWFJc-Qx2qQ7wkq=2GBq+Kg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: add a check for error in mtk_pinconf_bias_get_rsel()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Nov 27, 2021 at 3:09 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> All the other mtk_hw_get_value() calls have a check for "if (err)" so
> we can add one here as well.  This silences a Smatch warning:
>
>     drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:819 mtk_pinconf_bias_get_rsel()
>     error: uninitialized symbol 'pd'.
>
> Fixes: fb34a9ae383a ("pinctrl: mediatek: support rsel feature")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.

Yours,
Linus Walleij
