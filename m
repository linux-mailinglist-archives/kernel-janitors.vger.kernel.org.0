Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF7D49D733
	for <lists+kernel-janitors@lfdr.de>; Mon, 26 Aug 2019 22:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732031AbfHZUH4 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 26 Aug 2019 16:07:56 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34768 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730217AbfHZUH4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 26 Aug 2019 16:07:56 -0400
Received: by mail-lj1-f194.google.com with SMTP id x18so16310514ljh.1
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Aug 2019 13:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c92BjnNVgfZLXIOhyylGapSRsNCPw3Ef4tEA7baXWu4=;
        b=hwDOYcszyJaq1djxoAsdgpjbWsdRoqL2rImR8JYo1xsvaWTITMH1YxHFoOBwvqOrCl
         j/0Tu9nOLnidmXQ5JMdF5eCalrFwl0Wmma+QSb6T0rB6zcHnw/wys2fLX/R6tPBvjyND
         6OzpjAFOpH+p05WdCN+87pcKOvokk8AXb5B46UwNKSmu3smjEu+Hjm42BhXKsPmlXe/E
         mFuB572S+TVAYHaFvRHQjhwCf/1LikKsk/z2zlT13bZJ3HgaeFp7ORZAlUUBs3qZhu/n
         GJGutHBCfkjfRMKTG1ec4OeOGZ/nfPtICyw7rH1EYnqedHkCizIBj9RlYF+yUEsuRflI
         brDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c92BjnNVgfZLXIOhyylGapSRsNCPw3Ef4tEA7baXWu4=;
        b=syygIGe9TQH5ok5OEkBarihAcMTEtXXKoRFcvtFGtzB5cx9eqo0HITsBUoP4eG7ZC3
         n4dQ/OmOw6x+DV7dpftidry2FKqp16z4J2oxXcBQx7C0hFUnF46LJV+iGCRfb8igMspD
         VXhM61MTM8SUD+xg7Vd046hMHZFVHLyKDSiwZjSYPk3necS+936ver4OPnXZjIXaJ6Ef
         hZ4PQDDe4MslUlB9hzbQblJy+TtnGnu+g+6TWHPz0yphmwg3RJvSA/f+qP9lRdtcEx0b
         U8qbgmQDFUADSixQ6DD3GO832KjVKSYQ6M2lVIIZZobxv5QrHF+HieK50vre1aVkbTIx
         iDBA==
X-Gm-Message-State: APjAAAX2SWvbBRNfkkVouXaoPagXpiO9nwlRlTj+c0WWzjxs9Rz+aja0
        KpWmoPInv2TKM5C83sfDE9Ws49TxzwPjlK3yHztrOw==
X-Google-Smtp-Source: APXvYqwdVacdkkTIiNc4ej4zpP7wnFPalWn8AKBHdtMHls322lhjb0Nzh2G0ic8+a/WiIiu09L5/nD3J/b59IQOVLBA=
X-Received: by 2002:a2e:781a:: with SMTP id t26mr4564513ljc.28.1566850073876;
 Mon, 26 Aug 2019 13:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190822211518.5578-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190822211518.5578-1-christophe.jaillet@wanadoo.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 26 Aug 2019 22:07:42 +0200
Message-ID: <CACRpkdb0CuPVby066zjqLX1rRuc6KDL7jvt3KaCpEWgEFvp+Mg@mail.gmail.com>
Subject: Re: [PATCH] drm/mcde: Fix an error handling path in 'mcde_probe()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Aug 22, 2019 at 11:15 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> If we don't find any matching components, we should go through the error
> handling path, in order to free some resources.
>
> Fixes: ca5be902a87d ("drm/mcde: Fix uninitialized variable")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied!

Yours,
Linus Walleij
