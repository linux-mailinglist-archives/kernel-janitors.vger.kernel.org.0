Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23CDCCC48E
	for <lists+kernel-janitors@lfdr.de>; Fri,  4 Oct 2019 23:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730720AbfJDVIS (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 4 Oct 2019 17:08:18 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41069 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730598AbfJDVIS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 4 Oct 2019 17:08:18 -0400
Received: by mail-lf1-f66.google.com with SMTP id r2so5395137lfn.8
        for <kernel-janitors@vger.kernel.org>; Fri, 04 Oct 2019 14:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HhK03oaSMo/8bfjDBpniHapGQAbMA85rfpZvXfLdmYE=;
        b=R/zTVZ9cr4Dv8veyibem6M6FqmnA1nRbPvXXGJhzC3vvRGdG4nQviiDVwQKAqeNO/Q
         j4G8zEWfji9Q79jp5eAF7Vrq0wcotCPVwy1nvuwPt3mBdfAFiuz9RhbZieNyMqfjMrlN
         lQ591WIa5foe+e1z6YOquDkGDQOeSW5umDpND2DY7gOIsHkbDT6s3YjCQS3U//XcfoQq
         e/s/oEgmdH6EbtFD/PzvfTviSN0w6EUlBlACaac32wmHxBoig/rsdE4EIeygRCEI0hJJ
         htXNEaLS7gnR7K8DOeTLvre3Lz28CRvH1hg6CpnbzVaMwi0tC+B/JUAU+02JAjGkCVsv
         pkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HhK03oaSMo/8bfjDBpniHapGQAbMA85rfpZvXfLdmYE=;
        b=n6CBcGw/DiKARRWSzL25eS2akeNputGD8ceVyqb4Q28TtfO4xDyfSbED/6vrrH1igS
         Z6XzvFoJGWzkmD61KebQ7L8THpu4YygH2VtJ3S5Gw/X4T5Wh2SYKE/ZLksjUY6eKpMRD
         +xlvRF64FEWHl7nGgGJ9s5j1j2Bfv5htn7LApgcjPDXJusEb7H3pZpDbSRj7b+DaSXqc
         gKxRy0tEQCuW5c7NpxrjIO51zJSGUuYCsTagh3kRcoDL6Asf+m/rxpjbeGaf2c4C7Ols
         zhWC4YfLkvtsDK4d+GxS+ariclD8SOhCnG1iC1nmkp2OZyZ62MWy2YFERQjvWi0TKDg6
         7bXA==
X-Gm-Message-State: APjAAAWRP1GVoLbxcIxGK/4E/NCDSQFQLP7SBclWWil/1XuYLT94bfHI
        M+dQ4ISftRxDDyHWwcG1iDXLqD2ebC6PccvCfrRgvg==
X-Google-Smtp-Source: APXvYqwcJ2IUcDRtVTDYiQp+7VS7VKfkfuUC7BqSpv7lLTzAiR1ku6ptlziiaElGrVcXfadjuMfj784U4pQ1Sg51j4k=
X-Received: by 2002:ac2:5c11:: with SMTP id r17mr10121755lfp.61.1570223294668;
 Fri, 04 Oct 2019 14:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <af65355e-c2f8-9142-4d0b-6903f23a98b2@web.de> <CH2PR02MB700047AFFFE08FE5FD563541C78E0@CH2PR02MB7000.namprd02.prod.outlook.com>
 <bd860b05-f493-20e6-083d-66ef3cb61f60@web.de>
In-Reply-To: <bd860b05-f493-20e6-083d-66ef3cb61f60@web.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Oct 2019 23:08:02 +0200
Message-ID: <CACRpkdZPnRJWojgRsZvSTDWuxbOtQws5uQXDSPBBem6HE8iJgA@mail.gmail.com>
Subject: Re: [PATCH v2] ethernet: gemini: Use devm_platform_ioremap_resource()
 in gemini_ethernet_probe()
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     netdev <netdev@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "David S. Miller" <davem@davemloft.net>,
        Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        Radhey Shyam Pandey <radheys@xilinx.com>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Sep 20, 2019 at 11:23 AM Markus Elfring <Markus.Elfring@web.de> wro=
te:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 20 Sep 2019 10:52:56 +0200
>
> Simplify this function implementation by using the wrapper function
> =E2=80=9Cdevm_platform_ioremap_resource=E2=80=9D instead of calling the f=
unctions
> =E2=80=9Cplatform_get_resource=E2=80=9D and =E2=80=9Cdevm_ioremap_resourc=
e=E2=80=9D directly.
>
> * Thus reduce also a bit of exception handling code here.
> * Delete the local variable =E2=80=9Cres=E2=80=9D.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Seems correct.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

BR
Linus Walleij
