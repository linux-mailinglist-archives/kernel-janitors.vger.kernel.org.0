Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9338A1CF3A9
	for <lists+kernel-janitors@lfdr.de>; Tue, 12 May 2020 13:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729644AbgELLtT (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 12 May 2020 07:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729632AbgELLtS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 12 May 2020 07:49:18 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD60C061A0E
        for <kernel-janitors@vger.kernel.org>; Tue, 12 May 2020 04:49:18 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id o14so12198177ljp.4
        for <kernel-janitors@vger.kernel.org>; Tue, 12 May 2020 04:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LaN40dqXaRdgr+itxZUWzR4xWLlgoAEeZw85S/t/at0=;
        b=rwCA7Rt2qANtiQ1cyJisGlj52sRYBq7zbk5/4TT1kGGAX5i7eijZbUHqjB7XeMtVK6
         0NCBd2NrzB8IHtgcaRVzKuFDU7c7SqP6t3hEj11m3Mn9ITaO6oTnc69X706rR8l7Q+ro
         n3TFb8q0OwfkqdJHauWFFZBXJczkJa/njkERdmIR+kVjmA4mvIwhXZRF1b88vCQ96wlr
         bn1JysDUZ9XSRKakRudo0R018IEw5XpdGscj9Fco0gWcygt/iuDEUNnspGFEsgNlxw5+
         MUwRO+9YK5h5tDbK/ekLGMO5rAO06IQlTANQWCdUYsDxktfNfn8/hLboScSCkyo0DLTb
         tBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LaN40dqXaRdgr+itxZUWzR4xWLlgoAEeZw85S/t/at0=;
        b=eEfihEQ3WxMuGqVn64zZRceovHzBICFoNlsyr1L55Fo4s/NbqpEXHTEXPnFoB7ko1J
         xHYpGqOTibEpnZHNhv203KsR2mqF1Og5z0quzmD8hWNYJ1xFNmU/mAH27ZCdfb6VxoF5
         1b1lS3TR+f8FcKpXkzsKZ202GPpcqQzKSHcuz8jG9hA600Beq7PO42O3ZcIoharxXyqL
         MZVKm1yi5NaBbLSftNuoepAlQ+t1IKQTXI9Q+Flb4AOnEUpJHQyT0coorNqGYc4I8Hav
         2sY8YXU4zb9Ua/q0sLYaMRVb8xeV4HS8Ob9Tqup8hXiI13FfIDu7TUZwfWoXZ8ZEBmvZ
         XyaQ==
X-Gm-Message-State: AOAM531fv7B6Yk4wFh4YAUK8nNA3gzWvOJ7ZIwTIZLYngbOSSytCuSRp
        Vx0iA2DG/6KR+IA0MquvwVnpT6WRjHhtE3ZroHKRRQ==
X-Google-Smtp-Source: ABdhPJzH0WBo+S41IQb7cfAxprmCk+6/byQtNll0cLlMLCB+prcvinTQdNVQlk9tigEy64l94Ilx3732NrcK0VCb74Q=
X-Received: by 2002:a2e:8805:: with SMTP id x5mr13984293ljh.223.1589284156747;
 Tue, 12 May 2020 04:49:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200428141459.87624-1-weiyongjun1@huawei.com>
In-Reply-To: <20200428141459.87624-1-weiyongjun1@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 May 2020 13:49:05 +0200
Message-ID: <CACRpkdZ++vYw8LAiNUv6AXQ0QTh+W9vSL0_w2AR-GNNd=GH7FA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/mcde: dsi: Fix return value check in dev_err()
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Apr 28, 2020 at 4:13 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:

> In case of error, the function of_drm_find_bridge() returns NULL pointer
> not ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied! Thanks Wei, sorry for the long delay.

Yours,
Linus Walleij
