Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8961658839
	for <lists+kernel-janitors@lfdr.de>; Thu, 29 Dec 2022 02:05:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbiL2BF6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 28 Dec 2022 20:05:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbiL2BF5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 28 Dec 2022 20:05:57 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E58146390
        for <kernel-janitors@vger.kernel.org>; Wed, 28 Dec 2022 17:05:55 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id y18-20020a0568301d9200b0067082cd4679so10750170oti.4
        for <kernel-janitors@vger.kernel.org>; Wed, 28 Dec 2022 17:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DI97Fal4l3a4mIM8YI84buSF/5tfBrhRqOQY8iLVk3E=;
        b=WqJKhSzKCXSTIHOKuiqnICGlQ2V768y5ujY7ES9xnaetUxtaPIuRXmxyn5GTOLvmTs
         euOlBGNJOZFuXWJ5g4/zVDcXwYQ8NEHH5Y1H/tzKv3KR4GxDz0fAKssXzWZcgdr9kExT
         shynMeJfaJDToL3VS47mBGrKou5KObWIRy45vdjkHq61RMWw7xu5/GvS8NxbWs9Fy0tB
         nOJ6r/glZYIMdiX+J89429YRQwVwejnkCPqQ6HSK5pAOozgvqy87YktKyf4sJSVR6Lj6
         mVufRsTvOajl8TszrvC5WGdTPPLESJPZt0H+38QzfbD463xQ5BtUTZWLmKDc+ESkVc+u
         oCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DI97Fal4l3a4mIM8YI84buSF/5tfBrhRqOQY8iLVk3E=;
        b=4AKdP/dgGRXe5VewZOvcLbWJA5QhT8fFqok/llV50a9DZBBUFWIBBR/po/pq3Kw2SA
         AQSBt/yVJEXYsMrn88EZjgvryMT49IrdMsMy/KeBseypOpMj3uX9/EK86WRHU+wiURLI
         +ZY8X2PjPnL18dWDKpXh4/WjRoJYEDof8rqHi3N4cAv4puII3wF1sss7i53q1bzsqzWS
         vOguvzIMcj6P993suc7CWhV+qXfTusSEig0C9EdWVD0B+h2dR4gKXULy+auS8JmvQCdK
         UD7oVsiTNelea9QEo7vGe/xIEypbGiY25bkfCtpchmhHl9fxd6hpiENz3Kv72ken2TNF
         ka9Q==
X-Gm-Message-State: AFqh2ko8aGt/34poQMTUYx9XIu/zgJkI3kHms/qvAcG7D2qgGLYP5i5g
        qBge3i9Bd/0kZ82XjqCgsK3/7SGXAubV98yLLwDeOA==
X-Google-Smtp-Source: AMrXdXuGricZfodTWWI6d98OVmw8h2ZdLRjQGI7lbMkCdFb3YcjCj9osLbpVJFSaqd6O0uA58CabL8j33av6dEorlaI=
X-Received: by 2002:a05:6830:3499:b0:66c:61c8:ceeb with SMTP id
 c25-20020a056830349900b0066c61c8ceebmr1795675otu.12.1672275955280; Wed, 28
 Dec 2022 17:05:55 -0800 (PST)
MIME-Version: 1.0
References: <20221215092128.3954-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20221215092128.3954-1-lukas.bulwahn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 29 Dec 2022 02:07:49 +0100
Message-ID: <CACRpkdZyPP-wSuWLiKfhpnoQna-3_P1vjT_i7Rty3xGCq83nsQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mxs: avoid defines prefixed with CONFIG
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, Dec 15, 2022 at 10:30 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Defines prefixed with "CONFIG" should be limited to proper Kconfig options,
> that are introduced in a Kconfig file.
>
> Here, expressions to convert pin configurations to booleans for pull-up,
> voltage and mA are macro definitions that begin with "CONFIG".
>
> To avoid defines prefixed with "CONFIG", rename these defines to begin with
> "PIN_CONFIG" instead.
>
> No functional change.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Patch applied.

Yours,
Linus Walleij
