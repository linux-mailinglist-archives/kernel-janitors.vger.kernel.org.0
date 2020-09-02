Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC30D25A9F7
	for <lists+kernel-janitors@lfdr.de>; Wed,  2 Sep 2020 13:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727855AbgIBLEs (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 2 Sep 2020 07:04:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbgIBLEl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 2 Sep 2020 07:04:41 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6106AC061246
        for <kernel-janitors@vger.kernel.org>; Wed,  2 Sep 2020 04:04:40 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id v24so1429593uaj.7
        for <kernel-janitors@vger.kernel.org>; Wed, 02 Sep 2020 04:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Hf0PIlZBH2f6tZjqIqPKdTSDxg4ey5IHqqV7o7zs3fA=;
        b=jvktss2wubUFAj/XGva63/p+i21EmUocT+VKMGriS4nO/cV/LZCl8IS0SS4RAI5I1B
         PGSRGdX07J/2Y9ObU8kQKYXMoS2CyQ51/SiA8HmfDEN9bG6zj5ZUQSltN4eQYx5vC305
         jUIYB6t85WIce/eXD6+90KH03m60MDMZHE6SI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Hf0PIlZBH2f6tZjqIqPKdTSDxg4ey5IHqqV7o7zs3fA=;
        b=XYuYhV4zVhg0r9wOzYndpE1CoDNZwn+PPzBcOgjRHv4njYti/bXK0ByJgVrtDSSIyE
         jHWkmj8ppR/Zdsf4rBanMv/R5Xlt+kdH/00QbLMAsE6dbZe5/9+F1UsIX/I7UfO2D3xm
         JaP6OE8gas/a5a2TUu7JVbdvddYGjQrn79X6Xc/bG0Ry9bizVd3MVaA+KH65YWq9/K6U
         Tiuh3kjJ5Kx1dStriu4BDUn7Nb3Mm9CsxZBDx5pXwY6Fh48b+3r+1WJsTGGlVLUUhcXF
         wLXtYhfeoPHcEkspu36YVDMjGv3AVQ8YZj9fST4XfvbMoobuv+RNJu8MoIChk/Lyrm25
         01nQ==
X-Gm-Message-State: AOAM5303MQ+iTeONVvvihs8ZwwATYifi/vMeQtLbE/A/cAE5Lc03tMoG
        EZ0bdEly80pnLJueDAsLaT1M5wunrzlyq+EODaSBlw==
X-Google-Smtp-Source: ABdhPJwTAJmdVSE4G5yw+xOM510eJCrk4CeFZ0EVNnIfqJUjO0bPMVj4+uBwlLwieWiC9A5BtacoHnsFLK6H+cR9mhI=
X-Received: by 2002:ab0:1e84:: with SMTP id o4mr4725479uak.74.1599044678604;
 Wed, 02 Sep 2020 04:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <9f4fb922-4aa3-0b63-6d81-c83daefd13b9@web.de>
In-Reply-To: <9f4fb922-4aa3-0b63-6d81-c83daefd13b9@web.de>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Wed, 2 Sep 2020 19:04:27 +0800
Message-ID: <CANMq1KBJTpnYG59B1V=y_emqD3dtMZQAPY9bWJOC8FW2fNRgsA@mail.gmail.com>
Subject: Re: [PATCH] rpmsg: Avoid double-free in mtk_rpmsg_register_device()
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Pi-Hsun Shih <pihsun@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Sep 2, 2020 at 5:33 PM Markus Elfring <Markus.Elfring@web.de> wrote=
:
>
> > If rpmsg_register_device fails, it will call
> > mtk_rpmsg_release_device which already frees mdev.
>
> Can another imperative wording become helpful for the change description?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?id=3D9c7d619be5a002ea29c172df5e=
3c1227c22cbb41#n151

Looking at your posting history, I'll leave it up to the maintainer.

> =E2=80=A6
> > +++ b/drivers/rpmsg/mtk_rpmsg.c
> > @@ -220,10 +220,8 @@  static int mtk_rpmsg_register_device(struct mtk_r=
pmsg_rproc_subdev *mtk_subdev,
> >       rpdev->dev.release =3D mtk_rpmsg_release_device;
> >
> >       ret =3D rpmsg_register_device(rpdev);
> > -     if (ret) {
> > -             kfree(mdev);
> > +     if (ret)
> >               return ret;
> > -     }
> >
> >       return 0;
> >  }
>
>
> * How do you think about to use the following code variant instead?
>
>         return rpmsg_register_device(rpdev);
>
> * Would you like to omit the variable =E2=80=9Cret=E2=80=9D for this func=
tion implementation?

That's a good suggestion, I'll update and send a v2.

>
> Regards,
> Markus
