Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBEC6E14A9
	for <lists+kernel-janitors@lfdr.de>; Wed, 23 Oct 2019 10:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390557AbfJWIt3 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 23 Oct 2019 04:49:29 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44587 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390551AbfJWIt3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 23 Oct 2019 04:49:29 -0400
Received: by mail-oi1-f196.google.com with SMTP id s71so3830122oih.11
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Oct 2019 01:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ADV4dloY4QrpGFTvy/OoeHNXpjGf72Q0UAxYSc8ChkI=;
        b=huwfFp12qyI2jHm5EkRIvVBfBZqxMGd9x3nLq47NHMuoNKyPqUUlPqebVk2hNWcmoB
         khsxVS+6M6Mwbin2NE2ARQLmtl2uUthxZN6Q0ty4ygeOYJOmRfBZsicWfsp0FZeh0PR0
         0YM25+A7HZueY+CL67+tKQ4O0O+iPzCz3YCSV7s5SXkpIa1N/74v/bSlQ8OVkxDLFOtZ
         t1WUqnauORxl1IlJycJtJDRyJNJFWU0w6tlcmL3a7O2EPySayNDeSJq2uSSuC3gJq3vQ
         lmjitHFVXJtM3d77FbqsRR5hW3PKY6hdPWimAJgEkDU4svHHe24YtTnR4XqvCMWsWMxz
         tapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ADV4dloY4QrpGFTvy/OoeHNXpjGf72Q0UAxYSc8ChkI=;
        b=ny4df5EzuXoA6FZHU/bunQayxEZ5xvMf5uAE+bnOl2ORYUUurZoq3TtCMzkjA58b+y
         FmbSjQY1XKSjLT6rgdc/WnrFgeMhwBrSLebByZeJ0y5HprHCTQhNbacVgPfjhj3ICitR
         a15IhDONUNrVBXZvdFZr2AtgIFujytHrRIgbcUcKJkzrBnV5Cynef5eduwvhR4Fp6UVQ
         Y7E2xMgDMUClgQIG0ojj+Jzop7/IqsXLOGSyzZwg5k+jb5+OLPNLEbDoxkFrunGCdddI
         UrbBe7MLeRJh+M/CMazje/M9eTOfaJplwC+v2p1zVpBSmKXZ9S8PjOuLdPWU38ahjSaV
         FrNA==
X-Gm-Message-State: APjAAAXOM5ky02/Qd9m09l9Fj6osbrbYQKNwmUrAWky/w5/4d17keJLf
        Jz/BY7HcpGAFiGbRJM3IZWgtPt24BgNnhOGtlG/prg==
X-Google-Smtp-Source: APXvYqzqfl89y1pbwQVoS8A11ClrnUFaZyaqUTogCmeTUjY5/jx96G9aTd3cpQSBIBLrLvTVV6/LLgDn+8AwgABdV6M=
X-Received: by 2002:aca:1a18:: with SMTP id a24mr6615198oia.145.1571820568027;
 Wed, 23 Oct 2019 01:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <20191023063103.44941-1-maowenan@huawei.com> <CA+Px+wX7-tn-rXeKqnPtp74tU5cLxhJwF6XZ_jeQX-tnAfvO5g@mail.gmail.com>
 <1d948ec1-69e4-735f-c369-80d2b28e0eaa@huawei.com>
In-Reply-To: <1d948ec1-69e4-735f-c369-80d2b28e0eaa@huawei.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Wed, 23 Oct 2019 16:49:16 +0800
Message-ID: <CA+Px+wXgXkmVYboPcrhOWkAwRB2ygLDLi+TN9xw2awUZKMhCJA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: Check SND_SOC_CROS_EC_CODEC dependency
To:     maowenan <maowenan@huawei.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        =?UTF-8?B?U2h1bmxpIFdhbmcgKOeOi+mhuuWIqSk=?= 
        <shunli.wang@mediatek.com>, yuehaibing@huawei.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        tglx@linutronix.de, KaiChieh Chuang <kaichieh.chuang@mediatek.com>,
        ALSA development <alsa-devel@alsa-project.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Oct 23, 2019 at 4:38 PM maowenan <maowenan@huawei.com> wrote:
> I receive below message after I post, do you know why?
> '''
> Your mail to 'Alsa-devel' with the subject
>
>     [PATCH] ASoC: mediatek: Check SND_SOC_CROS_EC_CODEC dependency
>
> Is being held until the list moderator can review it for approval.
>
> The reason it is being held:
>
>     Post by non-member to a members-only list

I don't exactly know.  But I got similar messages when I first time
sent mail to the alsa-devel.

Have you subscribed to alsa-devel mailing list?  I guess it is fine to
wait maintainers to proceed your patch.
