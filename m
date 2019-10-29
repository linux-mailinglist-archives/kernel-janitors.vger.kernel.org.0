Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9E2E8E3C
	for <lists+kernel-janitors@lfdr.de>; Tue, 29 Oct 2019 18:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728094AbfJ2Rgi (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 29 Oct 2019 13:36:38 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45237 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725905AbfJ2Rgh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 29 Oct 2019 13:36:37 -0400
Received: by mail-lf1-f66.google.com with SMTP id v8so11161741lfa.12
        for <kernel-janitors@vger.kernel.org>; Tue, 29 Oct 2019 10:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rs/JHLPKR0pA14mN3NkYNfrgbbw3uQHi1oKq+AkTVWo=;
        b=ucSZjgzYv82n9jfOO83UHaw/eUY1nB8blL6iqIW7B5ePx2+84PzkX0xj87IsZadIo8
         00Bti4B3Tm9PatiPem2cDxXDyCuAlaXAgosHpqvwbhKEn6H2lG6PmDdqDky5M9nJk9al
         eZ8sOhadZXHfYLFYIKVVp34TVi1zDt/DD1x/A0HN5a0wItvtDJua4iMVq89PVzDAax0g
         oisD//6vb1chsvmVU5RCned53poYlIuK03f7Ie8t6HDjpxHUgIVl/ODNb+7/IeHETz6+
         476PrploT8/TkAwe2ZjVPH4cIHPEKYglD/98LKlzC3zcKHj4RlDGTBmktjJIOyKcY8dE
         cIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rs/JHLPKR0pA14mN3NkYNfrgbbw3uQHi1oKq+AkTVWo=;
        b=WZ+HaqEo4fhB1ZKTYJ6Nvbsv+X9svil3ai8kFwFBJ1Z6lE+rUg5wABmbvp4dNkdK+Z
         aCawyToAjfqLdsm3vopFZGn6aRn/if4504l5CEWNJfW7HTRR6HiYjf0P1QpCCsOywbph
         bGzk6NN6bxwM/qfpClhnFPHWPazFgmLTorippevhT+AEL5SbYHmJSXZtqppi876Gq0vR
         Ornyda9lCUcHGLl1ZDs9nSEPGSoeInjkhnwCWbyDMUKUNuX0NzAfJour4DoNW3XDJwnz
         CCJzMT/it/OI/8CJD2UR21kqfbpgq+KpvIOVmuBe3OBHDBcvlzqZSWlrAWrusQo1FqUR
         A9Gw==
X-Gm-Message-State: APjAAAVuC/Eow7N+dvHN07RNr6dbGG37+t+9Agwlui01kIn6GFB5sUiF
        VMZI+Vo11FRrzcy9qcIulifa6OLnrBB/8Xb5Auo=
X-Google-Smtp-Source: APXvYqzbjQBnpo0XiBTAwnq1ZHsPNwiUtHqbl0NM0hF614UCPzu9ecC82eTenrt25IuLm4g7iWVeHngjgAUM/YJgBro=
X-Received: by 2002:ac2:428b:: with SMTP id m11mr3223194lfh.64.1572370594456;
 Tue, 29 Oct 2019 10:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20191029145247.GA24739@mwanda>
In-Reply-To: <20191029145247.GA24739@mwanda>
From:   Taehee Yoo <ap420073@gmail.com>
Date:   Wed, 30 Oct 2019 02:36:22 +0900
Message-ID: <CAMArcTXwz33W13eL=vULE5EUL9Cwi+vHwJf=pC-dP6JBQ_QuYw@mail.gmail.com>
Subject: Re: [bug report] vxlan: add adjacent link to limit depth level
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 29 Oct 2019 at 23:52, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>

Hi Dan!

> Hello Taehee Yoo,
>
> This is a semi-automatic email about new static checker warnings.
>
> The patch 0ce1822c2a08: "vxlan: add adjacent link to limit depth
> level" from Oct 21, 2019, leads to the following Smatch complaint:
>
>     drivers/net/vxlan.c:4012 vxlan_changelink()
>     error: we previously assumed 'lowerdev' could be null (see line 4009)
>
> drivers/net/vxlan.c
>   4008          netdev_adjacent_change_commit(dst->remote_dev, lowerdev, dev);
>   4009          if (lowerdev && lowerdev != dst->remote_dev)
>                     ^^^^^^^^
> The patch adds a check for NULL,
>
>   4010                  dst->remote_dev = lowerdev;
>   4011
>   4012          netdev_update_lockdep_key(lowerdev);
>                                           ^^^^^^^^
> but it also adds a new unchecked dereference (inside the function).
>
>   4013          vxlan_config_apply(dev, &conf, lowerdev, vxlan->net, true);
>   4014          return 0;
>

Thank you very much for reporting this bug.
While I'm taking look at this bug, I found a more serious bug that is
to break existing configuration.
Anyway, I will fix this bug as soon as possible.

Thank you so much again,
Taehee Yoo

> regards,
> dan carpenter
