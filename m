Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCC02264A04
	for <lists+kernel-janitors@lfdr.de>; Thu, 10 Sep 2020 18:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbgIJQlF (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 10 Sep 2020 12:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727026AbgIJQi4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 10 Sep 2020 12:38:56 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59976C0617A1
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Sep 2020 09:31:50 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id s12so7394880wrw.11
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Sep 2020 09:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sslab.ics.keio.ac.jp; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8XrenaZC7x7EEzLKgWnRWWP3kw9ET6fFDlth4Zp/gtY=;
        b=hS3ujk0SNbO+KKIhwCtkhoaR3D4iaqKNbu5obxXUIkUAIZEavvzLtR/AmkXCcWoApD
         6qpvZyIpj9MYpkAyH9G8uDL9NSGEi/1lDmYfV7LcqkQ60EBegndDFNwM8JmtO545n85S
         MOg1C3tt9lgEWQfDFA9RZTtn4r+yEtCoUD0KQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8XrenaZC7x7EEzLKgWnRWWP3kw9ET6fFDlth4Zp/gtY=;
        b=rRYNjIgPlDiVgZe+s2OXfjDn6qzWuMp1K+Ie0D+anL2nmyNrfSI4p1ZR3bI/0gli0U
         1MR2LKSR3JbhM6aQRZeFh0isKJXgsAs49TC7ZH9YxsFK1WacHJmHsDhngWlmoAGVaH0F
         sjI0WLoiTAXPGhe6G2oxkYR9gN79KoJZPE6jz4IcXqX2JjCFFPR+xZnkJt2ztSJAEcjW
         IvsEMc7qhkk7m3r3JnBbEPeDBIUVc/aqs4RG12WDB9xHxaxgKF98Efa1SHeXCzALX3Qd
         m/F+USnjhfwaEtbXsZhBOd+HHRnoBPzDuF2i0Zw0evQ6vlHmaC8IVmbvnglUGMoYzVG+
         WHBg==
X-Gm-Message-State: AOAM530Eu5/DjM/LsvJkRrCZLjq7EaY1FGR+6jUMf1silLrmOXTMp1dX
        BaXIRifX8B9DEEs7B37z32wovfqvqYryqW4r+7h3mw==
X-Google-Smtp-Source: ABdhPJwcM1WR8tf/ZS8yQwLpBis3MuAq9iXnzyvBX/Zvx2Mb7vIdbYBdQkdSZNftBa2+3D5j79NwEzxaMX89slqGZpY=
X-Received: by 2002:a05:6000:124d:: with SMTP id j13mr10703282wrx.182.1599755508951;
 Thu, 10 Sep 2020 09:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <f79159af-4408-dc2f-6efa-45c5b45cf2d9@web.de>
In-Reply-To: <f79159af-4408-dc2f-6efa-45c5b45cf2d9@web.de>
From:   Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
Date:   Fri, 11 Sep 2020 01:31:38 +0900
Message-ID: <CAEYrHj=pfGB7OuHt90t2aaawr31W9XZCHeHJurt3o0rK44jZ+A@mail.gmail.com>
Subject: Re: [PATCH] qedr: fix resource leak in qedr_create_qp
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-rdma@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Ariel Elior <aelior@marvell.com>,
        Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Michal Kalderon <mkalderon@marvell.com>,
        Takafumi Kubota <takafumi@sslab.ics.keio.ac.jp>,
        Yuval Bason <yuval.bason@cavium.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

Thank you for your comment.
I will re-label the goto statements and post the patch as version 2.

Thanks,
Keita

2020=E5=B9=B49=E6=9C=8810=E6=97=A5(=E6=9C=A8) 22:24 Markus Elfring <Markus.=
Elfring@web.de>:
>
> > Fix this by adding a new goto label that calls qedr_free_qp_resources.
>
> =E2=80=A6
> > +++ b/drivers/infiniband/hw/qedr/verbs.c
> =E2=80=A6
> > @@ -2165,11 +2187,13 @@ struct ib_qp *qedr_create_qp(struct ib_pd *ibpd=
,
> =E2=80=A6
> >       return &qp->ibqp;
> >
> > +err2:
> > +     qedr_free_qp_resources(dev, qp, udata);
> >  err:
> >       kfree(qp);
>
> I propose to choose further alternatives for numbered labels.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/coding-style.rst?id=3D7fe10096c1508c7f033d34d0741809f8=
eecc1ed4#n485
>
> Regards,
> Markus
