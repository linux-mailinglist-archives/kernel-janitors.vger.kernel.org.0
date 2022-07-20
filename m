Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C4B257B3C4
	for <lists+kernel-janitors@lfdr.de>; Wed, 20 Jul 2022 11:25:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238424AbiGTJZL (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 20 Jul 2022 05:25:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236659AbiGTJZK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 20 Jul 2022 05:25:10 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E22B17
        for <kernel-janitors@vger.kernel.org>; Wed, 20 Jul 2022 02:25:05 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 64so31100012ybt.12
        for <kernel-janitors@vger.kernel.org>; Wed, 20 Jul 2022 02:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=benyossef-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=L6NIdv2HceXBtjcxllW1bMRK6zq69gQPIabPA+yvSsw=;
        b=itkV4KzKHH3HVpNC2PQWKiPPpcEA5GTaCI71Hm0Mp7SVGTaXhhGVc625jVVlUO8jKv
         mEpc/fd6b/frr0hBGxQ00ypcFwJBwM2IJnv7OZWA6uS2svuX0nOlHu4gOmKzNc/dB6Rn
         HlXW+ifS2uloU2Kln19RHngeCpPWvlphiiDuLBTVYzL5qeIap67LCGU9MKTA8qF/07Do
         WJC4LuDDjR6VLLBRBgi6+W7kaTbyGk6IYmE7O91dkVzl9kFTDn7q7X5xGM7MXwtMuYpW
         c2a9fmUqVH1nSY0pzrINuYeTsetBa8YSBS+rKviW6R6pkJ/y51IfGy78zbz5oJdj/uQS
         mrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=L6NIdv2HceXBtjcxllW1bMRK6zq69gQPIabPA+yvSsw=;
        b=klqmSPmph07x2mDWiqbMiJYbXIRY2fpKDgFrS+Z6DA8BfxRaE6VhTDNOaeje/fECPM
         J0+2Wq/j//idksBiBgQnVMTzeVp4zxRMR/0oqySQ9a79gQ/7Yqqemg3lNh1vUet6GPAh
         8bFtC3C4WM1zG7+kX8hTbk7Hr/tyfxZfaz0wbNkOsBWuxgDHTXycI07UjQ/W1wqvlnFC
         fhsm8NbXvl+sUN9+/cgdS4aSrkUL215l91v+qlijl7bkLTHld32F48osMBKAmUW2a9+/
         QWXNkpATcVjTytE4sGz0Ow4Zc0NoqWaM9o0IMfetmniV8g6Dvg3xPQaf3be/6SKbyGk2
         Lg5A==
X-Gm-Message-State: AJIora8z6VQaBXXegZHUd1bI6UDSMFNzsaRXRjLuqnkySCXNRjM7Q8Td
        AT9JixCdMYy93jctcuH4PZt4u2mGw/kk6BEUD27Ksw==
X-Google-Smtp-Source: AGRyM1vun9i/1Oa06zOGuM6sSBIxfWLPgCHLSjP03aI0lPHapHmU0VlgFBoF+k6SToSCReMkwFRKx23BCIgTxVBphao=
X-Received: by 2002:a25:3841:0:b0:670:a1b9:f18e with SMTP id
 f62-20020a253841000000b00670a1b9f18emr698828yba.480.1658309104900; Wed, 20
 Jul 2022 02:25:04 -0700 (PDT)
MIME-Version: 1.0
References: <ef6f884ef144390f152c34d2f549b1f50303b7b1.1658262447.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <ef6f884ef144390f152c34d2f549b1f50303b7b1.1658262447.git.christophe.jaillet@wanadoo.fr>
From:   Gilad Ben-Yossef <gilad@benyossef.com>
Date:   Wed, 20 Jul 2022 12:24:54 +0300
Message-ID: <CAOtvUMdvXZ8s43ZetZZ8VwCtpDoJy5Ajk4yA=7xZS4OafmsjAw@mail.gmail.com>
Subject: Re: [PATCH] crypto: ccree - Remove a useless dma_supported() call
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Linux kernel mailing list <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Christophe,

Thank you for the patch!


On Tue, Jul 19, 2022 at 11:27 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> There is no point in calling dma_supported() before calling
> dma_set_coherent_mask(). This function already calls dma_supported() and
> returns an error (-EIO) if it fails.
>
> So remove the superfluous dma_supported() call.
>
> While at it, fix the name of the function reported in a dev_err().
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Gilad Ben-Yossef <gilad@benyossef.com>

> ---
> I guess that the whole while loop could be removed, but I don't remind th=
e
> thread with the corresponding explanation, so leave it as-is :(

I would be happy to ack a patch that does this if you care to write it...

Gilad

> ---
>  drivers/crypto/ccree/cc_driver.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/crypto/ccree/cc_driver.c b/drivers/crypto/ccree/cc_d=
river.c
> index 7d1bee86d581..99f8bda718fe 100644
> --- a/drivers/crypto/ccree/cc_driver.c
> +++ b/drivers/crypto/ccree/cc_driver.c
> @@ -373,16 +373,16 @@ static int init_cc_resources(struct platform_device=
 *plat_dev)
>
>         dma_mask =3D DMA_BIT_MASK(DMA_BIT_MASK_LEN);
>         while (dma_mask > 0x7fffffffUL) {
> -               if (dma_supported(dev, dma_mask)) {
> -                       rc =3D dma_set_coherent_mask(dev, dma_mask);
> -                       if (!rc)
> -                               break;
> -               }
> +               rc =3D dma_set_coherent_mask(dev, dma_mask);
> +               if (!rc)
> +                       break;
> +
>                 dma_mask >>=3D 1;
>         }
>
>         if (rc) {
> -               dev_err(dev, "Failed in dma_set_mask, mask=3D%llx\n", dma=
_mask);
> +               dev_err(dev, "Failed in dma_set_coherent_mask, mask=3D%ll=
x\n",
> +                       dma_mask);
>                 return rc;
>         }
>
> --
> 2.34.1
>


--=20
Gilad Ben-Yossef
Chief Coffee Drinker

values of =CE=B2 will give rise to dom!
