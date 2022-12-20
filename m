Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C943E651E7D
	for <lists+kernel-janitors@lfdr.de>; Tue, 20 Dec 2022 11:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233632AbiLTKLj (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 20 Dec 2022 05:11:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbiLTKLg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 20 Dec 2022 05:11:36 -0500
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7560EF1B
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Dec 2022 02:11:35 -0800 (PST)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1322d768ba7so14867085fac.5
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Dec 2022 02:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X6d3Z6dvdsIJ7mSON8osSHcFlqBJfVh3ygvs/0GnLUA=;
        b=XOH19Nuw5AW71x4dMl+COJmb20aWkbQV4JS6o9ilHkOS3MiliNZZ0Ioo2gtmDPjSjC
         j9QEyBPUmidYmnYsuyUIL/2K0FKnsiKZEI6M8LGhOR+FstULcvGlJFEc4UgYdHbCGK03
         1IHK8DMp1qNglENfFSfhq6LvCcCamKLH3HouZRM9/VBhjz6axY02dY5dDu767L67aIOc
         h2vYAYduY9NuPoYpHky3qZuclig8/4jJKMpPAxkIydkY/ese1mraC9/bPhGs8mU/bvMF
         PHUNgc3NdO6inhdmyzu05WF3+k+YGuW3JOlEL3V9lRUb1HH386gqaBdQ8zgPjN83PlUn
         cJ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X6d3Z6dvdsIJ7mSON8osSHcFlqBJfVh3ygvs/0GnLUA=;
        b=8RGQo8oPreVnwkGw+YCBJjcRXLhLffLQy1JKXwl7ttQAV2pCRz8L00Qo0IM/oMNRpS
         oNDkZtvXaoAROFModvgpZMeNemQ2G+36zie4AhZG15PdpqjKYhrK0SSHfvTL4fu6rH62
         VJ3g/KGwN29/7/46lVtdQhg+1oGUcBUsxncZT0jf8kbhrfZN7sDnq+CJVq5jcyjHo+gT
         gozZ4K96Ku4SsIvXBFljWeHtb5lOWp669oj2/Bxcq8X+otQkgVcm5bzrhtVhdcsOTai4
         Vo6qpcxJwQkw+3ne+xozRl/xiJQLHMIln0LhEr7GNvc5YSi9t4JmJx/9grwdMPW4oygp
         kfaw==
X-Gm-Message-State: AFqh2kqsIlxiSgGXiS/Q8JGZlmi2XBiplQl+yIYinUtt7p85Dc06mf82
        fVQv/V7SFVvaoMyJEodmPywjVW4El+5JrAxpTa6wvw==
X-Google-Smtp-Source: AMrXdXu4MHoS5gKZBxPWbLf6IfGETzNFrfJ7rJVFxDXPSQ6OvduE8JP8iY32hcC0PljM8KzcQahIdGHMj25AGSs6J1M=
X-Received: by 2002:a05:6870:a790:b0:13b:96fc:18c1 with SMTP id
 x16-20020a056870a79000b0013b96fc18c1mr1602468oao.291.1671531094833; Tue, 20
 Dec 2022 02:11:34 -0800 (PST)
MIME-Version: 1.0
References: <20221220080536.30794-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20221220080536.30794-1-lukas.bulwahn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 20 Dec 2022 11:11:20 +0100
Message-ID: <CACRpkdahe6-ryRb+qO3+u6-XyhQY12++2eq_CZB-g40dj3Hd-Q@mail.gmail.com>
Subject: Re: [PATCH] crypto: ux500: update debug config after ux500 cryp
 driver removal
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Dec 20, 2022 at 9:05 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit 453de3eb08c4 ("crypto: ux500/cryp - delete driver") removes the
> config CRYPTO_DEV_UX500_CRYP, but leaves an obsolete reference in the
> dependencies of config CRYPTO_DEV_UX500_DEBUG.
>
> Remove that obsolete reference, and adjust the description while at it.
>
> Fixes: 453de3eb08c4 ("crypto: ux500/cryp - delete driver")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
