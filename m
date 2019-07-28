Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6A2177EE8
	for <lists+kernel-janitors@lfdr.de>; Sun, 28 Jul 2019 11:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbfG1J7j (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 28 Jul 2019 05:59:39 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45320 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfG1J7j (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 28 Jul 2019 05:59:39 -0400
Received: by mail-lf1-f67.google.com with SMTP id u10so1204551lfm.12
        for <kernel-janitors@vger.kernel.org>; Sun, 28 Jul 2019 02:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TT2iQ+fh+yLVfA5XCASIgHgqymw+iJWW639N0+0UQAE=;
        b=FRl0zJAKpwfKOlbX9Q5cPuWYSDRbmQE6DNbukn1h3ogrfsflueUFSgzjLc2SzfKJmR
         E+m+RKFJGXHGTQxCbHHEAUyvrMW/i27uOzMblM7E39IlLXNUZipq1sxXEr1Ao0deWM61
         TGd1Y3wy9ZkJPV1km0kHVQPpc60PiIcjgjN1kqdkGKmSX4gtr3WNxQ/oUIpud41n0A0z
         2WMIZKD+ZSBh3LQUlMhvfTu+Wqewi0XFx2CrquUtFg2bV6LD/CUto6RiC6XIFhhKnWrQ
         NXoh3Wji7vjpIauRm10bkwehuX0zeLTsL8XU3nQZMZkod6NRP4C6u/6Okl1ooGbx/yI9
         1Lcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TT2iQ+fh+yLVfA5XCASIgHgqymw+iJWW639N0+0UQAE=;
        b=bLXTBCBSkC3sFdBtdj20lR81L5pMyL/h00iDygpH0CIK9/irwsMJ9MdVwMWtrGAzs/
         fXPPL1aSI+ioRSrTpI5HLgPec/BqnsfVaGk1SmhiEzx1FZ4x2G4oCm0LB1r2YQ3EP8nJ
         vGP6rNkX6g/ipmrEWI6YnYNDvKJDotrUDo9xz6nalxF+KKAg4GckDJCvfnrGQCgdyDy2
         e0Oz0I0F4LJX8qcAPgPULyqf5F5E6F+OipW9PNiWnWR5Mknu4eng6ssbLfyKjB6Hg42W
         XOjB5HG0fDLIHhvDoXPqYGUSt+2qWUquqOy2I0ye1ijcaqmbqnXbM70yAyO893fY3B+v
         pBsA==
X-Gm-Message-State: APjAAAW+GftpJxO17BTuqsR7fRkP2+yxk0spKA/U7kZOmupDM35HcraT
        d/xzyCJaQBPylD/V8um9kY4hujkQbx1U75/k/kUuRw==
X-Google-Smtp-Source: APXvYqxkR2GcWRl3K2H831/69AeuP+bZxZIVeB/0pJPp/XlfvJyMah1IjsUVQhTN/o7bF6FNas2xCMlAk3GX6qDHTY0=
X-Received: by 2002:a19:6a01:: with SMTP id u1mr48506198lfu.141.1564307977519;
 Sun, 28 Jul 2019 02:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190628161419.26439-1-colin.king@canonical.com>
In-Reply-To: <20190628161419.26439-1-colin.king@canonical.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 28 Jul 2019 11:59:26 +0200
Message-ID: <CACRpkdZvmbCkfCn=PqREp=v7bB7OaGG9+B8_PG5+nK_=CRWM8w@mail.gmail.com>
Subject: Re: [PATCH][next] gpio: bd70528: fix spelling misstake "debouce" -> "debounce"
To:     Colin King <colin.king@canonical.com>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Lee Jones <lee.jones@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jun 28, 2019 at 6:14 PM Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a dev_err message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.

Yours,
Linus Walleij
