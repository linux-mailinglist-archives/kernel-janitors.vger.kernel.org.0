Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ACB91BC0CF
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 Apr 2020 16:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727934AbgD1OLy (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 28 Apr 2020 10:11:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726949AbgD1OLx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 28 Apr 2020 10:11:53 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 625CBC03C1AB
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Apr 2020 07:11:52 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id w20so21664232ljj.0
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Apr 2020 07:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mtVBUdOCpGd8hnqqLGaI2J2CR4Azzg/zrhcVqiGTGls=;
        b=JqQK1pURcb48Z2JRlimIBHmXunPRn50VSOxetMKgpzbtFFyedvhOGTMtbPYc1q8PM/
         GSJmrYOsNOuDZr1siFf8x63cGAEwtH64AQ8H8pt3pdzx4LLW+fVN0T57YBf1ADvChxgr
         Rb228izP+QrFoGwcKRwAo8AGyS7sVbxRiIE3DAeoQ+tBGkbqnGnrlZdafej0mxqa+sr0
         LDzYpdgHjlAA5Fx3FcjyaK1ociNlNlRzmKPO4zSnF1SUH4UvJxBz6z7J5HUyVeVD3sBq
         n7ezyJAzaJKNBOGoArB5/v7ysk62rbHL1keGMdguH41guWv67UCnmDCuwYP//4rmRybc
         2E6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mtVBUdOCpGd8hnqqLGaI2J2CR4Azzg/zrhcVqiGTGls=;
        b=hbYQLneqkYCXl3oFsL+hwvKjz8x1/jO4CnhqxAQHphdh0KBGyUahbenu+AUozcu7nI
         I+XNLYUVipAS4pfAx66wl3cSAgpcYOn9VpBEqZu2shmw2Z20PUiYP5BPZx04vx6PjKf6
         RUVHATeA2OyFm4vKhqSOpjx5crCxMC1AF8UubzLqAQvvixRB0oeHgw4Kp17S1bzktLJh
         vBOwIbXaWxxu8n5qtG/IVK3bhr72br3xNEv5mjJp913ctxY1scR0LKX/VWS6YGQ758EH
         cy/d8FYZGv7uBZv+qe36mmiaBlAaIOUNLCQ1tR6q3wGiCXXuOVN213fWrSWc5j+IgXTS
         aUWQ==
X-Gm-Message-State: AGi0Pub+oTS8aMWz2WfOxFQbz0iNEy4orBBTnmD926FDB0UU96mtIW5q
        vEuzy/UeyNdqIqtLvz1DP/x41U3txkrplYQvGFiBeA==
X-Google-Smtp-Source: APiQypKAHI7m6Ls+Uc8E2TsRbPo/WARh54Vyg4nS33u8nYakydliVnU0FEVuQDAq9BXo6PEIo0HC/rszrwpDHRXdZxY=
X-Received: by 2002:a05:651c:1058:: with SMTP id x24mr18422861ljm.39.1588083110781;
 Tue, 28 Apr 2020 07:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200427110829.154785-1-weiyongjun1@huawei.com>
In-Reply-To: <20200427110829.154785-1-weiyongjun1@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 16:11:39 +0200
Message-ID: <CACRpkdYpFBUZfSKbA4ENdc7T5kHn4HmB=esUkKg1CpFoTeOU0g@mail.gmail.com>
Subject: Re: [PATCH -next] gpio: mlxbf2: fix return value check in mlxbf2_gpio_get_lock_res()
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Apr 27, 2020 at 1:07 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:

> In case of error, the function devm_ioremap() returns NULL pointer not
> ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied.

Yours,
Linus Walleij
