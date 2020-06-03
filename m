Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 709511ECFE0
	for <lists+kernel-janitors@lfdr.de>; Wed,  3 Jun 2020 14:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbgFCMe6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 3 Jun 2020 08:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbgFCMe5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 Jun 2020 08:34:57 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35FF7C08C5C1
        for <kernel-janitors@vger.kernel.org>; Wed,  3 Jun 2020 05:34:57 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id s1so2530241ljo.0
        for <kernel-janitors@vger.kernel.org>; Wed, 03 Jun 2020 05:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PI7pydsdlkyMsOD6xUcLp/qzxqU4rnGyfjXgCb9CfWA=;
        b=xfnWQd9oEyAsFzOPGt1mBJdArDRnh2rm2HZKJiiufZ4G3XU4PfqVW12McDu5EdvBVb
         qyfCex95T6C8Tcy86/IPyXEU3S80ASk+HARGYDiI6ViBZrc8pU4AWMn1Jqp8fW1s8W1g
         rRcyu95uIpQjRNQ0t7A8VWRPB0Gjrr7ZjNixzNhSgX334YRru7RYUn5hqcPerbW9I/vk
         IUaQ8XN78CUAtwSMO7xGQaeSOXYyu8EoTuCMR15KHfh8nAVjRMCqTcvKmwNbafE99vnv
         TaEjAvcLgbbAIs3kQ8rZcHoQPOI3s29vSI6VHexaAO6k29daJjUDM2GVsCcOKfV0FEES
         j8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PI7pydsdlkyMsOD6xUcLp/qzxqU4rnGyfjXgCb9CfWA=;
        b=ta0lQ6GGM4hzXsB5uPnu7N/sZpuZlrsO2gn1wAMYmxakRGaqRJ039qnpoFV/UbZk+m
         vb1DV1tAUloGtw3grK+Jc5oGpkS0S0qOrr8Yqo/U1AvbPjBkEEZEhympxeGXq/KNn3qm
         iq+5SVT4oDWYy8NEhed00EawFGgrDivDA8ot3M85H64QbzFxGhzat86E7cwDkdvpBrRV
         kpXgeP+Z8z2/YN4S/pyC2w4uM9klfnJDT5NMIglgbkLFPKK8PYoY+0uqCVDaO/2/O0WV
         Xhq8rAnH/BaFEh3fLMDUp/+JK0IToTnvIGP6PpfzJ0Ht7wFsqXU3IW+JihMGTnoQSw2n
         os8w==
X-Gm-Message-State: AOAM531T+V1MNpxAlK6eSUFGrFD0o9ZoBfs0d6VqZmTTGW6GCaRH9Gd4
        Qh/7fDEvnITrVCNAcqsBaR7LOONceeXa0fI68FoU/w==
X-Google-Smtp-Source: ABdhPJwzUPzaqApWBasR0U8pnoYQewI2Zvey0OigUC/P5cfEYrETfElS5dHa5BQgryE1VDaIwAKQXp5y9hxab/Kb4RY=
X-Received: by 2002:a2e:350a:: with SMTP id z10mr1926898ljz.104.1591187695709;
 Wed, 03 Jun 2020 05:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200530204955.588962-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200530204955.588962-1-christophe.jaillet@wanadoo.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Jun 2020 14:34:44 +0200
Message-ID: <CACRpkdYR11Gy99N0TPCkNFoBKKQLP2x3JsnH9=_S7mxPXgYKig@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: freescale: imx: Fix an error handling path in 'imx_pinctrl_probe()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Gary Bisson <gary.bisson@boundarydevices.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, May 30, 2020 at 10:49 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> 'pinctrl_unregister()' should not be called to undo
> 'devm_pinctrl_register_and_init()', it is already handled by the framework.
>
> This simplifies the error handling paths of the probe function.
> The 'imx_free_resources()' can be removed as well.
>
> Fixes: a51c158bf0f7 ("pinctrl: imx: use radix trees for groups and functions")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied!

Yours,
Linus Walleij
