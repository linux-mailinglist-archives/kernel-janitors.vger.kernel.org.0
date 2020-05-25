Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA4D1E0A0A
	for <lists+kernel-janitors@lfdr.de>; Mon, 25 May 2020 11:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389528AbgEYJRh (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 25 May 2020 05:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389524AbgEYJRg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 25 May 2020 05:17:36 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9E3BC061A0E
        for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2020 02:17:35 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id b6so20001483ljj.1
        for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2020 02:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kO5vtDW6efTPWMJdT/IeulhOhr/Shn99sWBgLzctM/I=;
        b=WnOIkPx9Iho6akm/1otb3bzxcZJDFFWZUf0ZjYnagW3G3rEtAz/XI2cTG4Lmrs+lh/
         uBwn9VGTsCsRHjRxCmEv60TCrrlcOA5JJI3AxviDtqbJ3irKCEL0R27GEnM9uT5hV38f
         bPQ3nYPD42R4MAlowsgym120v3L/+zSTn1//Guj0XdlwR8QbIwlCJmsXHhkQh3Uh1OzL
         VFM4s9fjlUaOnjMt6dmVpCM0WDEvzScRcDxUFsq64+kCzT/z0p3pbp+kTWGfnh5Hzh2u
         i5YHaWguB7kt6FD5BQKe5mirOW+yxm8TZl3lHm3vNw3ouA1OOyDp8ZET5jiVHRtjO2oz
         luhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kO5vtDW6efTPWMJdT/IeulhOhr/Shn99sWBgLzctM/I=;
        b=jgjrq+L5R33M2kk24Lf71JSiBUn4T5AGgBhBr/uOmPVjYScfT1cx+fp2P1qOIhK4vq
         YwVO7fevrmUD5BHvwuYt61DP1/cPSszqfaXpJg4BE8eCOXIiTDK0Geg7a+6AlqIhcSKb
         JB4+44IJq3sLeCUCUyCey47B3s7g09h//ORiaqp2MjsOLrBIJd20jhrjdxN/pMxJM9D+
         iPgS2FOkP/G7iQ9yTjY3RV7gBWaF3PrUgrYlT29rz45vAiG1fnEpFr+xalI+VtuVvwlN
         HUElhAX7s36HKZhBInk2ay9qxzlFRnN2upNaErqQBcuwbsdwb+taZPeic6caV6pp9bNG
         CX3g==
X-Gm-Message-State: AOAM532sp2obY/gztWFb9iS+GFlZLCFqjdPdgJ+4rw7NMZddQxklOvLg
        rS7dtKt28rrjUpOtz2F358yGModIAhtzs3mlJpWtmQ==
X-Google-Smtp-Source: ABdhPJwFBs5dI5yirBLSFwiXWY52PiIXgZlGCLWwULeUThanyG8/0gUHFgUFcCvEjDwM9cabi1NMWxCRZgAoHBkp9KM=
X-Received: by 2002:a05:651c:32d:: with SMTP id b13mr2970920ljp.283.1590398254315;
 Mon, 25 May 2020 02:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200520032150.165388-1-weiyongjun1@huawei.com>
In-Reply-To: <20200520032150.165388-1-weiyongjun1@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 May 2020 11:17:23 +0200
Message-ID: <CACRpkdYXmziVfd0ZDTq_3ReCdcw9cWPXXD1H9jfxvLiE=7EDDA@mail.gmail.com>
Subject: Re: [PATCH -next] bus: arm-integrator-lm: Fix return value check in integrator_ap_lm_probe()
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Wei,

On Wed, May 20, 2020 at 5:18 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:

> In case of error, the function of_find_matching_node() returns NULL
> pointer not ERR_PTR(). The IS_ERR() test in the return value check
> should be replaced with NULL test.
>
> Fixes: ccea5e8a5918 ("bus: Add driver for Integrator/AP logic modules")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

I applied this and signed it off and sent it over to the ARM SoC
maintainers.

Yours,
Linus Walleij
