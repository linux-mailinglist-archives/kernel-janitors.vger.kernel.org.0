Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35A92141FBD
	for <lists+kernel-janitors@lfdr.de>; Sun, 19 Jan 2020 20:16:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727144AbgASTQA (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 19 Jan 2020 14:16:00 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52066 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727123AbgASTQA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 19 Jan 2020 14:16:00 -0500
Received: by mail-wm1-f68.google.com with SMTP id d73so12315162wmd.1
        for <kernel-janitors@vger.kernel.org>; Sun, 19 Jan 2020 11:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wjPqQ+QcgdIt/3k/Xgoi79/wU8alTV3s3eopmW4iuJ4=;
        b=pbnbAH/bUX12Izz9PfnJQGv8De5M+j/8A0539bbmCvM9Kr3lCMwBNBj7/NLFX1hX5N
         xevMpe4hX4hU1+EbDyquumYVC6i5bvZn3yMZGSDVgjdR2xJGhI5viocmxGKI/EXsdTaQ
         DMQqrwPyu3QSvdFAin8XnwwCN9WFbwec8Hbyhb3uvo/f7haaG37X5cw1hx/yGc/wt13W
         bJijlhZi148lZHLc/bpgmkztlWg+l7mbxViuqdq5hUj5xEWW8Us24mqYk451C2XXox0B
         DXDfxFN/rL888aF7/S3LuktLMf556o29pIBrQLUyJ2drc0EpwaolAe1EvsieQ/iF1t8a
         r4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wjPqQ+QcgdIt/3k/Xgoi79/wU8alTV3s3eopmW4iuJ4=;
        b=HkkVWwKkl7vLOuoFV8t+2dTYdq9s4doplF+w335USTVzewcUe6GsdFZdkGFVNywxiv
         KdValYd2Ql+0vxXHlzWG6yZB16ZEPFzPewBA8ybRs2YsS2yxlX0xSlAlm3x4szGA521e
         GQpOUCWcauLCxqhgBsKomfZvvBdNMKfJZeSw6UJnx/wwLu35SnpGqLIhQopleng9ZtFs
         JueP9u+cn3FDr6IFLZ0X/5lyvu483M/CCWiFqRWAxe4HTnaxDXqFcsBhusjW4pdSGSyk
         9JcDSuNfq5H9l3lIi4/ptl7pLs/MrcTglS06HGtavhqcBAQCLOSs8vsyeXc6GMwPfC9a
         ixcw==
X-Gm-Message-State: APjAAAUocUpwRmHd3LaEf1gTB8E+NOw+yG0J6cMy2JLOBgRtJD9X6W41
        ohZg7ydDMJRCsrczjXJoEe08v0ShCayj4dIZfYQ=
X-Google-Smtp-Source: APXvYqzaBOq+usci2PMODRtU54TPMBfi0WijWwTBptOYu4FQw3HqD/2aJDrNY4I40wXQwl5H1OOYdw9zFnhcOFW5Ma0=
X-Received: by 2002:a1c:f719:: with SMTP id v25mr15697450wmh.116.1579461358280;
 Sun, 19 Jan 2020 11:15:58 -0800 (PST)
MIME-Version: 1.0
References: <20200113132346.rmeamdmbxwvo7kgj@kili.mountain>
 <CAFLxGvyBO=_4-f+HQPZSaAL=aJouok3y=MxEKjup3Q=Cj0KKZg@mail.gmail.com> <20200117034035.GB19765@kadam>
In-Reply-To: <20200117034035.GB19765@kadam>
From:   Richard Weinberger <richard.weinberger@gmail.com>
Date:   Sun, 19 Jan 2020 20:15:47 +0100
Message-ID: <CAFLxGvymMF-ijcUFc71Rg6MisC5RUa4dsUGesvE=rU=Z9Pj7-w@mail.gmail.com>
Subject: Re: [PATCH] ubi: Fix an error pointer dereference in error handling code
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jan 17, 2020 at 4:39 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Fri, Jan 17, 2020 at 12:50:14AM +0100, Richard Weinberger wrote:
> > On Mon, Jan 13, 2020 at 2:24 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > If "seen_pebs = init_seen(ubi);" fails then "seen_pebs" is an error pointer
> > > and we try to kfree() it which results in an Oops.
> > >
> > > This patch re-arranges the error handling so now it only frees things
> > > which have been allocated successfully.
> > >
> > > Fixes: daef3dd1f0ae ("UBI: Fastmap: Add self check to detect absent PEBs")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > >  drivers/mtd/ubi/fastmap.c | 19 +++++++++++--------
> > >  1 file changed, 11 insertions(+), 8 deletions(-)
> > > ---
> > >  drivers/mtd/ubi/fastmap.c | 21 ++++++++++++---------
> > >  1 file changed, 12 insertions(+), 9 deletions(-)
> >
> > This patch seems badly formatted.
> > Copy&paste error?
> >
>
> Oh, yeah.  Sorrry.  I shouldn't affect anything though.  I can resend
> if you want.

No need to resend, just wanted to make sure you sent the right patch.
Applied, thanks!

-- 
Thanks,
//richard
