Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C77F91399B
	for <lists+kernel-janitors@lfdr.de>; Sat,  4 May 2019 13:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727658AbfEDL7b (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 4 May 2019 07:59:31 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33691 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727633AbfEDL70 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 4 May 2019 07:59:26 -0400
Received: by mail-lj1-f193.google.com with SMTP id f23so7385985ljc.0
        for <kernel-janitors@vger.kernel.org>; Sat, 04 May 2019 04:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3BX39v3pu7ldHFdjAOxh6Msu2ZnLD9jNF7ehK/cIJkM=;
        b=EagF2etDmy1Qb4QiyLGp5kmZcDoAiDccs87hKdobjUQFqxAEHSWsrdE9zjQ/1j2byu
         4JMhWitx1FQZMkGaU4947wmJouyju9O05m4yWtknxQWQXpxFzy8+V9ffhGLY1Hg70RTt
         QuMpT0qPWThcFKNEx5GXw/749wn3/5+WAqWnIQpPHTmKzL6kq/ZuG+nSQK1Z8mJIP4oW
         uNVu22mxIVOpwIIWlhRvW8mQk+C0lsyr5uTuniknleB8sMrUcjxKiP1KgTOdzPhrCbU7
         V8TR/nglDjaq/WwlR5d8UvRIkQ/i4R9obleYo3vc/Nwh7fbestsbsXu6IuIWohAyAiIY
         cXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3BX39v3pu7ldHFdjAOxh6Msu2ZnLD9jNF7ehK/cIJkM=;
        b=EWaqUl9p2dE7uhJDh86Lc/i1jYW/RQggL5HcCl6yQqmGkoz+rX3D0tr5QBLMBTlSxc
         +rQs6/XOYxegrZnGK/QaieLqTetJnclb3RNARy6xbE8AUVNW/dGJTD4rRoQBtIHd6lxN
         6sdROjZLFL4qBVhaYb1/XNQUkE3Qx9tWh2ZJObxdLwJgc6X3rxCSv+84NuG7awuXLF26
         GmqYp274auBmlx2uHm8sjDlKXQ1w6NFHKjwehYtPKzmDcgB4mgPtAC0Vwo9VYWQReE1S
         sPrHaUk9UNZ0Khhc8bqaJduDHen4Af3e8E+52viEh5yfaqZOlDwA5zmDA96obzS74lHl
         QROQ==
X-Gm-Message-State: APjAAAVbJ2LlMRtyDVYbtLpAbNlWHisRGrWm7VOaYrmPC/UvqE5xQLCS
        NgIvEUvswIyBYYIBAn9nES81KUrkysTKg2attjOwsA==
X-Google-Smtp-Source: APXvYqwBbsY6IMHgupX97VlIU9A0jH3IvIDBH7G1IoxqWmOmQyFNPYt9uxWoihm/pbMWCpEUH68oVO/6dIZZgWpK6jo=
X-Received: by 2002:a2e:834d:: with SMTP id l13mr8308279ljh.97.1556971164572;
 Sat, 04 May 2019 04:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190503131651.GC1236@mwanda>
In-Reply-To: <20190503131651.GC1236@mwanda>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 4 May 2019 13:59:13 +0200
Message-ID: <CACRpkdajJgP6zAYOw3zRVjtPj-dEoA0ZtrMerPMkxW046aEQ7w@mail.gmail.com>
Subject: Re: [PATCH] soc: ixp4xx: qmgr: Fix an NULL vs IS_ERR() check in probe
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Krzysztof Halasa <khalasa@piap.pl>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, May 3, 2019 at 3:17 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The devm_ioremap_resource() function doesn't retunr NULL, it returns
> error pointers.
>
> Fixes: ecc133c6da60 ("soc: ixp4xx: qmgr: Pass resources")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good catch! Patch applied.

I will make sure this fix lands in ARM SoC for v5.2.

Yours,
Linus Walleij
