Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8468738998F
	for <lists+kernel-janitors@lfdr.de>; Thu, 20 May 2021 01:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhESXC1 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 19 May 2021 19:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229465AbhESXC1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 May 2021 19:02:27 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92BC1C061574
        for <kernel-janitors@vger.kernel.org>; Wed, 19 May 2021 16:01:06 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id m11so21559894lfg.3
        for <kernel-janitors@vger.kernel.org>; Wed, 19 May 2021 16:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BwnfvoL4Ry92OwxuQd6a/oz1LSyOJoqr23NH/Ta20UA=;
        b=QxRZ51VHGBg26SHmr1c1e7SQSOJR5YW34ikTY/quw4coLeiqRhmx/QPawqYdvsFmpW
         nActs2ei6F4NybwGg9rIF7zophAqMrxB+EIIxzxpG4IYybr3AowzLfJ4h+552dXvufdF
         WPIl5+yf4z+QvqrSJmaOOBH7pi0yZWNFA8beByRQWBBPfjLYbpylbHZyTFBeOMqUDM1D
         +eBNTXDnwaKj4u47jCCelYAqj98gHF7q4sjoLV+/Qjk/OJzHCSuHQAmZbpwtlHk3ZvVT
         37J67Toxwk21erCmrEEagVtWJiUEoykeFwh0mAnMl/qWjqQng81rBWP+rwdMBWnjbO5w
         /rsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BwnfvoL4Ry92OwxuQd6a/oz1LSyOJoqr23NH/Ta20UA=;
        b=j8lSD+3KTcoXnUXdR/515bfCf1EkFbzJjVBJn7b2RO7N1Fs54J9wEsfRXPjfZyvMdO
         HPFUP7OUkks+AH3pwojdCJje70ylZZNJjMu4cuIDHs+aODuKSyAYIyOEjcKSOHYqzUeo
         M/D8REz+Gi6hQsCiC6Bf4/wLoiiuLpQ/UtYscfWTpThCZ5zVaroSvz/TkDXd2K5bhWJ2
         vPSp8Vewwk7aG3ValqlA4jiQFoBotledMWYeNa3MJaON4E1hWn4gsDERAmNWghD6A5KE
         nxUtOoHlj4e87qWAWfx8fPedTNEru6pcnXRPoq5xkK9fF7CyCb6foOgYaot5eSUEy0Hy
         FEbQ==
X-Gm-Message-State: AOAM532B5XWfET16w8l+WJuElwoUSGbK3CbEgANYILEFwz9NDnEEfZKT
        +OWkaPoKXHUBi09pSMsMrAOvDOaxfcBPNfaIKwhLxT3HKi4=
X-Google-Smtp-Source: ABdhPJzbb5vE0e3wYVAbtJfmXNKmKj6SEilgkLGDkfEA9u9GY/g8fWw7FKZKvzpukoiUovgXiZwLcWpkLNxOrLKP93E=
X-Received: by 2002:ac2:544f:: with SMTP id d15mr1244857lfn.465.1621465264942;
 Wed, 19 May 2021 16:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210508031502.53637-1-cuibixuan@huawei.com>
In-Reply-To: <20210508031502.53637-1-cuibixuan@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 20 May 2021 01:00:54 +0200
Message-ID: <CACRpkdY_npXMDE6ks6mAeMOpmdUVY3XzhZqvKceZH0Wg+xiJdg@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: equilibrium: Add missing MODULE_DEVICE_TABLE
To:     Bixuan Cui <cuibixuan@huawei.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, May 8, 2021 at 3:51 AM Bixuan Cui <cuibixuan@huawei.com> wrote:

> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>

Patch applied.

Yours,
Linus Walleij
