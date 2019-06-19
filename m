Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD04C4BD2B
	for <lists+kernel-janitors@lfdr.de>; Wed, 19 Jun 2019 17:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727244AbfFSPpG (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 19 Jun 2019 11:45:06 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42750 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726839AbfFSPpG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Jun 2019 11:45:06 -0400
Received: by mail-ot1-f68.google.com with SMTP id l15so10121086otn.9
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Jun 2019 08:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NVhZkIpuqF80loACQlfA3nngRhiXTO/ETsZc8Vi9mck=;
        b=Uph08Elt4sY5M1gdp6uPHTfoYyfoI40fGabdUiaU5qKgq7fkz3GvMzVEQ3ctKK62tE
         wpt/Vaid9Vq9zvD/MUMuqWDTbTSTmAQSHqOgHQ9ybVTur9oq+IgnR7jfsM7ed76QrGwr
         OM3s8cZhE9SQEGAivymCmShm+Q1HrkYXA4XvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NVhZkIpuqF80loACQlfA3nngRhiXTO/ETsZc8Vi9mck=;
        b=h+vA5uNxH9xNsfmNrIn2SidsjPu/KxMbMnoqxoE8dK8FNAOuJSUpVuOnWWdIIdqQIb
         im49Hlaz33Cn3YfuH2vG8IuTVUhdzqyay4bP9agio6YLy05M9DrH+cZZBhTMRSDgqjMi
         Vy1ffNFebjbRsTLP2WhvLh+PYJQtrlJFTbij4l3aA/g6m0g6/acgtZ1vPuxiATtymZ2h
         7MkTKF5vEp6bX5abWCGaWF5ZIHTJDrSrDGymqmmeAxF/l6FoPtXLHGWAbketIZB1q30g
         Z8G7VVM4Kf9bFZ9OvF3Y07KFcyEIvdXo2tp2NxQEIO2uUizs7ZBEd2xk8sEznk8WO+94
         uwmQ==
X-Gm-Message-State: APjAAAWkmdfDL+7sAcB1TwlGtDTBvQZlNEC8dGMeb/km9s1nvZKlV3oc
        5I2SdcON643FtemUPX107HXLSaFYEQs=
X-Google-Smtp-Source: APXvYqyySTiDX6VpaFZRzy2N3p/cTHBliHq5RPV/i6L/FLfYt8KAfCJ+JdDVjmE0J0iJ1/bMAsp9Rw==
X-Received: by 2002:a9d:bb8:: with SMTP id 53mr8784312oth.372.1560959104684;
        Wed, 19 Jun 2019 08:45:04 -0700 (PDT)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com. [209.85.167.177])
        by smtp.gmail.com with ESMTPSA id d200sm1488204oih.26.2019.06.19.08.45.02
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2019 08:45:03 -0700 (PDT)
Received: by mail-oi1-f177.google.com with SMTP id v186so10948936oie.5
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Jun 2019 08:45:02 -0700 (PDT)
X-Received: by 2002:aca:e10a:: with SMTP id y10mr2978774oig.111.1560959102372;
 Wed, 19 Jun 2019 08:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190618153924.19491-1-colin.king@canonical.com> <20190619053012.GM28859@kadam>
In-Reply-To: <20190619053012.GM28859@kadam>
From:   Nick Crews <ncrews@chromium.org>
Date:   Wed, 19 Jun 2019 09:44:50 -0600
X-Gmail-Original-Message-ID: <CAHX4x85id5dwXrBSVHTZaRV43JGAxZwMkvnDN6yH5_Mg4UxRPg@mail.gmail.com>
Message-ID: <CAHX4x85id5dwXrBSVHTZaRV43JGAxZwMkvnDN6yH5_Mg4UxRPg@mail.gmail.com>
Subject: Re: [PATCH][next] platform/chrome: wilco_ec: fix null pointer
 dereference on failed kzalloc
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Colin King <colin.king@canonical.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        kernel-janitors@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dtor@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 18, 2019 at 11:30 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Tue, Jun 18, 2019 at 04:39:24PM +0100, Colin King wrote:
> > diff --git a/drivers/platform/chrome/wilco_ec/event.c b/drivers/platform/chrome/wilco_ec/event.c
> > index c975b76e6255..e251a989b152 100644
> > --- a/drivers/platform/chrome/wilco_ec/event.c
> > +++ b/drivers/platform/chrome/wilco_ec/event.c
> > @@ -112,8 +112,11 @@ module_param(queue_size, int, 0644);
> >  static struct ec_event_queue *event_queue_new(int capacity)
> >  {
> >       size_t entries_size = sizeof(struct ec_event *) * capacity;
> > -     struct ec_event_queue *q = kzalloc(sizeof(*q) + entries_size,
> > -                                        GFP_KERNEL);
> > +     struct ec_event_queue *q;
> > +
> > +     q = kzalloc(sizeof(*q) + entries_size, GFP_KERNEL);
> > +     if (!q)
> > +             return NULL;
>
> We have a new struct_size() macro designed for these allocations.
>
>         q = kzalloc(struct_size(q, entries, capacity), GFP_KERNEL);
>
> The advantage is that it checks for integer overflows.
>
> regards,
> dan carpenter
>

Thanks Dan, I like that.

Dmitry Torokhov also had some thoughts on this patch at
https://crrev.com/c/1661053, I'll send a patch that adds this and
fixes his concerns in a bit.

Cheers,
Nick
