Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9982266712
	for <lists+kernel-janitors@lfdr.de>; Fri, 11 Sep 2020 19:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgIKRhN (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 11 Sep 2020 13:37:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726020AbgIKMuA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 11 Sep 2020 08:50:00 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6A7DC0613ED
        for <kernel-janitors@vger.kernel.org>; Fri, 11 Sep 2020 05:49:59 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id s12so11338926wrw.11
        for <kernel-janitors@vger.kernel.org>; Fri, 11 Sep 2020 05:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sslab.ics.keio.ac.jp; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nWbc4yMI9H7bl97CVcSxQv/EwnVj0ipCdrn8uq6XpTE=;
        b=ZhF6FLOxM6x7I7r0tgZIcmqTW3FgLmQpAWreu6Oijs+tt1JDiTN4xtO7gS09FKoB6s
         EEYVj7HbEIGTUtbiNnMv+MJFArYQN2vqI69IYqhzMjQCcikIpz3g7KdgI4fJ7czvczEa
         Z23sitHp3PUt/TfvriiI8vSjX1VBgfLlnLZ9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nWbc4yMI9H7bl97CVcSxQv/EwnVj0ipCdrn8uq6XpTE=;
        b=L79v5A0a13co/iu5XDAIBjD9K9r9l0MzS0Sk8mVEbvi4fC7zEILnVDk90GkHH553Un
         p83zRlh9eFYrR2LzDjzipkyPXwT9qKBkWVdIRdFic+k9EXVup1GEXTfU0+b1Vruu8pZU
         SDiWZu1+y6DVAYZiPKepxXJVcoe7T56AjgVNtUEngIlE39UpgsC/7+TNN8H4Ot0kngFi
         GhnD5omTAToUXuU0RzfDnWao8JdMFnCvJghftiQrD6x3ym5TJgv3jA+mXL+TsUL9pNsG
         zF4CGnHYZRrdeJOiZoBT7ZeIq7IGLaEATfdK0QC0pSK6VB7A6Riv3LG9teS9g2fNyWMS
         4UQw==
X-Gm-Message-State: AOAM530faKx/e3m0LDZH4+22Uoc3i1ecg/tSQp0qFeWcqMrTON6Ixmm9
        g873JaAm8k00Y8QSKUnVy6mTj0OCwkZtd15Tkj0a2Q==
X-Google-Smtp-Source: ABdhPJzU5HHpYZ8aksLleECyLkPPJqWQEXktBFbiMMFXDO29AEh31KF19A1HSjNHai2b4blpPhdazL9YED11Fp9K+Y0=
X-Received: by 2002:a5d:4bcf:: with SMTP id l15mr1918848wrt.384.1599828598125;
 Fri, 11 Sep 2020 05:49:58 -0700 (PDT)
MIME-Version: 1.0
References: <f79159af-4408-dc2f-6efa-45c5b45cf2d9@web.de> <CAEYrHj=pfGB7OuHt90t2aaawr31W9XZCHeHJurt3o0rK44jZ+A@mail.gmail.com>
 <59440849-23b1-9c69-ecf6-78f8a0b82c7a@web.de>
In-Reply-To: <59440849-23b1-9c69-ecf6-78f8a0b82c7a@web.de>
From:   Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
Date:   Fri, 11 Sep 2020 21:49:46 +0900
Message-ID: <CAEYrHjmsd4Sp2R54y55pVL3CXr1KXedoBnTEczCBkpE9+SsFNg@mail.gmail.com>
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
thank you for the comment.
I will fix the line break and re-post the patch

Thanks,
Keita

2020=E5=B9=B49=E6=9C=8811=E6=97=A5(=E9=87=91) 4:48 Markus Elfring <Markus.E=
lfring@web.de>:
>
> > I will re-label the goto statements and post the patch as version 2.
>
> Thanks for such a positive feedback.
>
>
> Another suggestion:
>
> > > Fixes: 1212767e23bb ("qedr: Add wrapping generic structure for qpidr =
and
> > > adjust idr routines.")
>
> Please omit a line break for this tag.
>
> Regards,
> Markus
