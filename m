Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF191ABF3C
	for <lists+kernel-janitors@lfdr.de>; Thu, 16 Apr 2020 13:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633329AbgDPLbp (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 16 Apr 2020 07:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2506135AbgDPLJH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 16 Apr 2020 07:09:07 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AA5FC061A0F
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Apr 2020 04:08:41 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id r24so7376867ljd.4
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Apr 2020 04:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S7CeX1goNiTzCPux7yhtQx3G78bwWhEvP9iEt87hwXc=;
        b=qKxcdlQR1dTo+AB/xd6XeJOvWM5JtcmUcG0asrp4xQZZTFGvsNcxlAo4cAiDq2Ihh8
         X0k/1k/NuBHLCe/ZkTNPbWdmeukTv1kibYjJN12a4aQR7nf4rPHevnprS2CYjIysd2yo
         h/Nzh0SpL2/5qH4YhnlN+pAOGyGcFEU3y9eoIF16fKUVyUlj6hUEGv2bfwhNF27GIN1k
         4biIi3ltBB7CxbkwkPneMzkoo8jHswOZUvamC9jQ85kgGM5mEFb9dq5W08golrvXMVE3
         nxdG6yZnLXvmAsKyDstuD1ut4kOem/KVVBF32bAgeUHs+3ZJ+NkQqpulz5RxcOf70vkY
         54SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S7CeX1goNiTzCPux7yhtQx3G78bwWhEvP9iEt87hwXc=;
        b=lAf5LixSbEPEX05vGGUbaawzy81bwVsCtCytZk5/aOd29LgwYUuuWXIXG3XJfwABpv
         m8O9AJ3Oc+HZb/xigGTj1PaiYn0n2tLiOjNPA7uEVGJLFVcTJS3e2fGgQyNzR+6InA9r
         nZ3K1ZDe+qoYgoS/B23QPSaoyCK3DtY7zhRWi0xIwp6p54jAfF3Y0osqbFbWOedcxyRV
         2mRfudsgQSNByMx22r1chKcWozHwNxYxbhcM4KGaBLd/UERbTBnbD9JK8zieEg7VuxEu
         TUK4sitL/1AAeItxDRMdYb2r4r00urLrSlNinBZr2LiKq2F+1Ma9fqVLb+9AkenV24/y
         TVxw==
X-Gm-Message-State: AGi0Pubg/WGRI3yoXuftvemeVuLhudiEb0Vvd3gkik/vlF6A+CNUTMTi
        Teh0Zx3Kaiik/oDW9i+aJCnAJZ+VmUgOWdcb5c5Scg==
X-Google-Smtp-Source: APiQypJCs3GDOnmZgOUbr1CKEadpgsOSo5WsfLaAn86lNQu9ACAgMT5KinznWfgnuk9HrE4sBT+105fBLfjw+mUzLmc=
X-Received: by 2002:a2e:9ad9:: with SMTP id p25mr6268989ljj.39.1587035319801;
 Thu, 16 Apr 2020 04:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200412213937.5287-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200412213937.5287-1-christophe.jaillet@wanadoo.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 13:08:28 +0200
Message-ID: <CACRpkdZMLec8gXSJo-SpNXa3bBne2gDCRT3M_BEz21EtMXUAMw@mail.gmail.com>
Subject: Re: [PATCH] Input: dlink-dir685-touchkeys: Fix a typo in driver name
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Linux Input <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Apr 12, 2020 at 11:39 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> According to the file name and Kconfig, a 'k' is missing in this driver
> name. It should be "dlink-dir685-touchkeys".
>
> Fixes: 131b3de7016b ("Input: add D-Link DIR-685 touchkeys driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
