Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79AAB1399D
	for <lists+kernel-janitors@lfdr.de>; Sat,  4 May 2019 14:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727681AbfEDMAV (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 4 May 2019 08:00:21 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44120 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727633AbfEDMAV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 4 May 2019 08:00:21 -0400
Received: by mail-lf1-f68.google.com with SMTP id n134so4329904lfn.11
        for <kernel-janitors@vger.kernel.org>; Sat, 04 May 2019 05:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bVUZ/YdfIbEAyeXyxlZd8C1Dn3iXlSts8Rn7bzFJXgo=;
        b=kGhXJihKafot6irmobTIl6Oc/jaJTM7ilojeVby1fdeUoYY1bwyJyEkb/fkyPxsS4/
         kTevTY+CK++MYB+OpW/NTSerAKU2rgWWFs2K6XhP9dXhN1d/HGmybKLJb54DfeM3SNCx
         u5SOLWs3HwSZDiKzbJ55SvmB17Zv8nlf3Op6P6yDQrCi+QBLwRGAmG0iDB0AiJ3fAuNQ
         vJnkoCwP1yNvLBBUEDHEH8EnYehG045loHp7wED4F9xcYUCsy3gfmKlQyIluiAH3a/fq
         LbwWJC+sGQXQxYFKLltphezTZ18/M4FaSvSbsqUY2bIoFcpYuhOJ48I+nAR7W55F4pi2
         WSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bVUZ/YdfIbEAyeXyxlZd8C1Dn3iXlSts8Rn7bzFJXgo=;
        b=jRfR00WPo+hvEby/ZJuTFNONHZJrZh3pbLaFSeEp/RoeOodlZZsaC+A3N0K0Ntsdze
         EvCw4+Pd4o+FYw0E6LPL5kRAZtct1rRVLsOD8fAHKIAY+iPzpDQyRbnEerS4DqLChELX
         xJXoh6AFM67eg8jXWMpVrmVAZ6ru0PitJKajiwjgJ5/KAcHmUPiZluM4Taynn3ejrkkA
         e+M1wxQ+qDos9/xqQynduy4S1fXfAW8t1hhlU/G5Z0q46sKPAMY9Fbiqe8Symw5tGVoQ
         4h6+CHkZij9XUlYVztD3lQRLnugyF3E0P+lXax/OXjGd1y6CRTh1Gl+DU6oJ1kBcMurl
         Xxnw==
X-Gm-Message-State: APjAAAU/p3AZ746K3xqRYeHgAzABp67PYLJpGaRREKyZ7lDeBFSzo7dp
        KEwXW8cZf9TV+al6RuhECz3KaBnxi3UXjHWZSRYZYg==
X-Google-Smtp-Source: APXvYqzHb3J2SQJgpBCRN+rySa3T5qo6CkgHRVTBI6q3LGfhjNT7Dye0M39QqMKy0La/eziTVGqnfSlDJ08oWBgpIEA=
X-Received: by 2002:ac2:51a1:: with SMTP id f1mr7143976lfk.129.1556971219802;
 Sat, 04 May 2019 05:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190504070318.56760-1-yuehaibing@huawei.com>
In-Reply-To: <20190504070318.56760-1-yuehaibing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 4 May 2019 14:00:07 +0200
Message-ID: <CACRpkdaN+BeaKA91rvMJwJsSW2epEb1YJPzpvXoJ=+M=Ly-7tQ@mail.gmail.com>
Subject: Re: [PATCH -next] ARM: ixp4xx: Remove duplicated include from common.c
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Russell King <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, May 4, 2019 at 8:53 AM YueHaibing <yuehaibing@huawei.com> wrote:

> Remove duplicated include.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied, thanks!

Yours,
Linus Walleij
