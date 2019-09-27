Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FDDFC02ED
	for <lists+kernel-janitors@lfdr.de>; Fri, 27 Sep 2019 12:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727311AbfI0KEq (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 27 Sep 2019 06:04:46 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:54600 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726080AbfI0KET (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 27 Sep 2019 06:04:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1569578658;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yr1qbbjmCmVWV/qKG3BFNpAVMN2lXkfBYcR3fqycFRA=;
        b=ecLGEY5rm3fOlanQVERFeWi7mimgGJTu1DHNSB0wwhyg6NlA2Hy1wbp5uknaqktmMUG5w7
        +eW2mFKQXiFsH7972Reom5BCcJLyCSZNBSHvoESEu1UNbNyBtFnT5tTSeVzQim4e84QlK2
        nA8OcgwEie6K/0+Wk+BJO86qiGXXYdg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-HTM_8bylPx2KTvKFKnctCA-1; Fri, 27 Sep 2019 06:04:16 -0400
Received: by mail-qk1-f200.google.com with SMTP id z128so2086088qke.8
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Sep 2019 03:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X0RxdG+xzTY6hppirsAZIE83xPEk0t3BjDbFciB2Sa4=;
        b=UswOx+w3l3+4qXM6dlN6D6La8CVGBP4X3YEjP265SsyAcBubCB6Ewi0T+M20SIxA6h
         9d2lJWaUo9YaVYjeTAeJBnpfzoJxi+4P9+QakNN1ns2SQWp+Fya/xIndLoYQHdohmyil
         Q9zaMWyBsfr+Ubps8wVWPMkx6ZWn2P/CLb4blPoxhZx0HBQYKBDTwDc3SJWDS4rRk5hW
         aBuJ8FNKYF1HK1lkCvsZwg5U9Mt5YMlO25NKK8pAj4x7Hpzoi35AaSWBBhTR/94pBL0U
         qfq69Ty7n3q5KDkT7N+z6ZJUR1iuEzBCEoNbnRXjV9r/pVUyGkiEWVYwL3mAXJGBkOKr
         2/9Q==
X-Gm-Message-State: APjAAAUI89S7r+14vbxOIUbBl5GothxbreIikz6QDY2he6/FA4uP3vlA
        Xlc1oD5fi+7ZM2XEGS4PfeQb5IW7YGYs3kSQNaufPKYRx2DafB56pJJDyJbijM9hF7HxjUvjxy7
        Ws41vXf42krxSxmvMdvREP257J/iiYmllKO7w6Ukt4p9V
X-Received: by 2002:a37:a147:: with SMTP id k68mr3643629qke.169.1569578656544;
        Fri, 27 Sep 2019 03:04:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqygBRP9Pf1w27R4vGLTLB2f3Li9BSkOnzV6Y2bFEcYng23lnngm0cVH6hH+IR1910Txe1zUoKpLhO3vOfuBmjE=
X-Received: by 2002:a37:a147:: with SMTP id k68mr3643545qke.169.1569578655419;
 Fri, 27 Sep 2019 03:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190922115054.10880-1-colin.king@canonical.com>
 <nycvar.YFH.7.76.1909231303180.1459@cbobk.fhfr.pm> <20190925114741.GD27389@kadam>
In-Reply-To: <20190925114741.GD27389@kadam>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 27 Sep 2019 12:04:04 +0200
Message-ID: <CAO-hwJKpqGBi+9CRn08sNcn+ggQtnefuMgG98bXtW1UiGqneQA@mail.gmail.com>
Subject: Re: [PATCH] HID: core: clean up indentation issue
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Colin King <colin.king@canonical.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>
X-MC-Unique: HTM_8bylPx2KTvKFKnctCA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Sep 25, 2019 at 1:48 PM Dan Carpenter <dan.carpenter@oracle.com> wr=
ote:
>
> On Mon, Sep 23, 2019 at 01:04:13PM +0200, Jiri Kosina wrote:
> > On Sun, 22 Sep 2019, Colin King wrote:
> >
> > > From: Colin Ian King <colin.king@canonical.com>
> > >
> > > There is an if statement that is indented by one extra space,
> > > fix this by removing the extraneous space.
> > >
> > > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > > ---
> > >  drivers/hid/hid-core.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > > index 3eaee2c37931..9469c382a182 100644
> > > --- a/drivers/hid/hid-core.c
> > > +++ b/drivers/hid/hid-core.c
> > > @@ -2329,10 +2329,10 @@ int hid_add_device(struct hid_device *hdev)
> > >     /*
> > >      * Check for the mandatory transport channel.
> > >      */
> > > -    if (!hdev->ll_driver->raw_request) {
> > > +   if (!hdev->ll_driver->raw_request) {
> > >             hid_err(hdev, "transport driver missing .raw_request()\n"=
);
> > >             return -EINVAL;
> > > -    }
> > > +   }
> >
> > Let's not pollute git blame and wait for an ocasion when we need to tou=
ch
> > the code for some more valid reason.
>
> Just use `git blame -w`.
>
> This probably came from a Smatch warning.  Smatch warns very seldom
> warns about style issues, but in this case the indenting is legitimately
> bad.

Well, I tend to agree with Jiri here. Yes, you can use a particular
flag in a tool to 'solve' the git blame/history issue, but this is
putting the workload on the user, while tthe code is fine, in this
case. Why do we need to pollute the history of a file for no good
reasons?

Cheers,
Benjamin

