Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 077D54B1B22
	for <lists+kernel-janitors@lfdr.de>; Fri, 11 Feb 2022 02:22:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346762AbiBKBV3 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 10 Feb 2022 20:21:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346757AbiBKBV2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 10 Feb 2022 20:21:28 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0DD9270E
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Feb 2022 17:21:28 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id o19so20453411ybc.12
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Feb 2022 17:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=apbl1IBbPTd7mPNpWX7lJo6c6WmezPKP8rRQADu0iqI=;
        b=Al9EYQ6UivIBEzJt+EXRPWQS4tQ+SZS7j9RAp0oHXZxyun1wJHq+IzElQLvKCTvlx+
         QBg7KKMmxyv59N9pScYHlAEq8x3bjRI3h7T8UnGSTlkPgvUKGYFIJ/97N7e+4t6IG4hr
         NUr+mc/t4DlsQamjGODM4GOesMED3y6G8pGjm9M8vi03iswVLNqmI1LCQCT8NHOSDF1m
         D2Efq5FYVMAUWCONNrXorHlk3VOhxOr+M+nqRtaUpiiIzJUSqBCG31ONIb7a0D3HCXqg
         wUQTiNi1kGcORkQGYyocKAElbLnegbHE0Os6F9IA/nq17CGhARVSu2cCgvmQuGsI+Cb9
         W/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=apbl1IBbPTd7mPNpWX7lJo6c6WmezPKP8rRQADu0iqI=;
        b=bTVBwPD2Xavdww40Su+aWgqv97Oj0SrikPdTlL2USiOUL+tDQ+eYSWXN4PYXGVY+xv
         JCiwTZki6vS//V+pkQcU5PsQirqbYbUQ6G/nyvNJiW8w2XFSymSMn1mXiz6ncn1Bmcdk
         0vgs+4dpwJv/Rxpqd8yHg7yIFiDp0jEKxPttqX7cmvUz70Tk0MYciDsVrf+rMaBBER0t
         RL8B6896jNKW3Iy/vkxFx8+a3rpTQ0OI/44dfx9tFbhM5qoA8leG75InhpZUrW5PqHxu
         qZekONAdTbhclhMU53au6kOBCRF+/ZZi4VVkmdNinRs0q6OcWKh+97qFsd406IaqIyr+
         zd9Q==
X-Gm-Message-State: AOAM5307ZzB/GiRD8f5p8be7fIICKx9cGC2ta7PeZU/8uXTYvg+fEBQV
        pJbj68KzuzcrWwwsGI28tiHfeT+0MNWNHdkpOPXHug==
X-Google-Smtp-Source: ABdhPJzXkCGm7OG5XsU6NkyfdBiqjONEKooP872F/l4oHbI98KkoThhR0NUJt7FrNPPtYs39W5QwDbpuLA78r846f48=
X-Received: by 2002:a81:4402:: with SMTP id r2mr10308216ywa.126.1644542488134;
 Thu, 10 Feb 2022 17:21:28 -0800 (PST)
MIME-Version: 1.0
References: <20220202091551.580372-1-colin.i.king@gmail.com>
In-Reply-To: <20220202091551.580372-1-colin.i.king@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Feb 2022 02:21:16 +0100
Message-ID: <CACRpkdZUe65yuEBOctguBW4jUFt8U26Rsb_TwdFTdxKbKt58Og@mail.gmail.com>
Subject: Re: [PATCH] pinctl: doc: Fix spelling mistake "resisitors" -> "resistors"
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Feb 2, 2022 at 10:15 AM Colin Ian King <colin.i.king@gmail.com> wrote:

> There is a spelling mistake in the documentation. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Patch applied.

Yours,
Linus Walleij
