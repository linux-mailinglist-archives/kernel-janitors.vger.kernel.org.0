Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA472390C6E
	for <lists+kernel-janitors@lfdr.de>; Wed, 26 May 2021 00:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231898AbhEYWuE (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 25 May 2021 18:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231558AbhEYWuD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 25 May 2021 18:50:03 -0400
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78435C061756
        for <kernel-janitors@vger.kernel.org>; Tue, 25 May 2021 15:48:32 -0700 (PDT)
Received: by mail-ua1-x935.google.com with SMTP id 105so11521059uak.8
        for <kernel-janitors@vger.kernel.org>; Tue, 25 May 2021 15:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bACz+uWUWzOp4UEC6O9uu3jXtuOafDPeE6VNUTx5ei0=;
        b=UzDE7fC0O77x6tkWPluXHZp3DSFJALRojTENB9zST/zQFLyTsk9wiQ7/eLkkWPVcEM
         vAZxYS1XH35fxaajf5sIA2/4sLzZ+YdUFxA+78qZbQ1ISnOsj6+L5oDaEvISAVUyRjnU
         6ZQQL0w3x6TtzbRBhhjXNmG5P3sPmbLBqlvmz6gQi5lLlFdaMQgcua9GSCQOjtFf1Q2j
         dVL0zxRbVi4d3I31g7PrNuTCYYCN29ecbdGN+wM4qYTfWXbZyPVMcaYZY7TvgCTU0+Zg
         +nsgNw81NoQDlLDgKDfAGB6NFt9SjdGuEUHRGTs5RGBClOpZq7MtwnioMYl7yXyhqk0C
         Mevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bACz+uWUWzOp4UEC6O9uu3jXtuOafDPeE6VNUTx5ei0=;
        b=PwnnAf1yCrsclXfu0RY/po+XXp7f5iY2lJ5DetMYwSQOhTTq1c0uP3A/pK2DfGb4Yv
         1kc8m6M2IPFpmvni/TBLRyvwwbEIxArTNaDamE7oWty7OC1MNr4NzgBbfpdCKi2Ss56Y
         9iRnDmSRNrtjUZ2zIi43wDZKK9u9j0eBDq4N66Gkn9nRqNwSXJ1vxjs8GFZGNw+RlvFX
         AlSA58wk/IykYlNN6JcwT6uUzWFCyBn+i2krcuisdVk1CXxgb/F8VfpDSkzDJ34K59UB
         u/1U0zS4SFaSYVAIPqc5DknmWKiBqObWFcRp+khgC1hPhjJB3lHg2n0uOZAnNx2b0zfP
         i1oQ==
X-Gm-Message-State: AOAM532N0ljEG2ZgZxACD2mUEZaWfigAEP6jLxzIkiOEMyqkzHFNZu3h
        iTdlsEu7GBAv377QKP9VbvFFwv4oTHF0V50SWNg6xw==
X-Google-Smtp-Source: ABdhPJyme8DOfut1deY3oWH9+ZvPbcbZ8DL6LY3gvwTY3/NOWOaJNwqpxMlWwT9iFXPtMIPXMHDmL+3y1f8kIeHD0R4=
X-Received: by 2002:ab0:d8f:: with SMTP id i15mr11170948uak.104.1621982911286;
 Tue, 25 May 2021 15:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <d05074c11962a046ff9c2f457c240432ca8a7194.1621600443.git.christophe.jaillet@wanadoo.fr>
 <CAPDyKFrS3wdYs3AQtjZEOsLzNvxgy1n3EfxZ+a8w8J8rH8kQ-w@mail.gmail.com> <7c973bfd-8fc3-026d-351c-dc00e92c8b01@wanadoo.fr>
In-Reply-To: <7c973bfd-8fc3-026d-351c-dc00e92c8b01@wanadoo.fr>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 26 May 2021 00:47:54 +0200
Message-ID: <CAPDyKFptO4PRc=kxd9k8CkofGfyfJB6pdxP-wzrNpSHv0+ya0Q@mail.gmail.com>
Subject: Re: [PATCH] mmc: mxs-mmc: Disable the 'reg_vmmc' regulator when needed
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Doug Anderson <dianders@chromium.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Chris Ball <cjb@laptop.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 25 May 2021 at 21:31, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Le 24/05/2021 =C3=A0 15:59, Ulf Hansson a =C3=A9crit :
> > On Fri, 21 May 2021 at 14:36, Christophe JAILLET
> > <christophe.jaillet@wanadoo.fr> wrote:
> >>
> >> The 'reg_vmmc' regulator is never disabled. Neither in the error handl=
ing
> >> of the probe, nor in the remove function.
> >>
> >> Add a managed action to do the required clean-up before a 'regulator_p=
ut()'
> >> call.
> >>
> >> Fixes: 4dc5a79f1350 ("mmc: mxs-mmc: enable regulator for mmc slot")
> >> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> >> ---
> >>   drivers/mmc/host/mxs-mmc.c | 11 +++++++++++
> >>   1 file changed, 11 insertions(+)
> >>
> >> diff --git a/drivers/mmc/host/mxs-mmc.c b/drivers/mmc/host/mxs-mmc.c
> >> index 947581de7860..b043d53dd728 100644
> >> --- a/drivers/mmc/host/mxs-mmc.c
> >> +++ b/drivers/mmc/host/mxs-mmc.c
> >> @@ -552,6 +552,13 @@ static const struct of_device_id mxs_mmc_dt_ids[]=
 =3D {
> >>   };
> >>   MODULE_DEVICE_TABLE(of, mxs_mmc_dt_ids);
> >>
> >> +static void regulator_disable_action(void *_data)
> >> +{
> >> +       struct regulator *regulator =3D _data;
> >> +
> >> +       regulator_disable(regulator);
> >> +}
> >> +
> >>   static int mxs_mmc_probe(struct platform_device *pdev)
> >>   {
> >>          struct device_node *np =3D pdev->dev.of_node;
> >> @@ -591,6 +598,10 @@ static int mxs_mmc_probe(struct platform_device *=
pdev)
> >>                                  "Failed to enable vmmc regulator: %d\=
n", ret);
> >>                          goto out_mmc_free;
> >>                  }
> >> +               ret =3D devm_add_action_or_reset(&pdev->dev,
> >> +                                       regulator_disable_action, reg_=
vmmc);
> >> +               if (ret)
> >> +                       goto out_mmc_free;
> >
> > Even if this improves the behaviour, there is a standardized way for
> > how we deal with regulators for mmc.
> >
> > 1. Call mmc_regulator_get_supply() during probe to fetch the optional
> > regulator. If a regulator is found a corresponding OCR mask, in
> > host->ocr_avail is assigned.
> >
> > 2. In the ->set_ios() callback, invoke mmc_regulator_set_ocr(). This
> > will also set the correct voltage-level and turn on/off the regulator,
> > depending on the requested OCR/voltage-level.
>
> Hi,
> I don't know this API.
> I've tried to look at a few drivers to see how it was used, but it
> didn't help me either.

Okay.

>
> So, I won't be able to provide any other proposal on this. It would only
> be trial/error.
> It is yours if something needs to be fixed here.
>
> Anyway, thanks for your time for answering and trying to show the right
> direction.

If I put together some patch and submit it, would you be able help to
run some tests of it, as I don't have access to HW?

Kind regards
Uffe
