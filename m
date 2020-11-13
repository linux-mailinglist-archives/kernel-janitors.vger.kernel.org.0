Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91D772B1D99
	for <lists+kernel-janitors@lfdr.de>; Fri, 13 Nov 2020 15:41:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbgKMOlO (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 13 Nov 2020 09:41:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726324AbgKMOlO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 Nov 2020 09:41:14 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 180A9C0613D1
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Nov 2020 06:41:14 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id 7so13758846ejm.0
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Nov 2020 06:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=frmJlXQl80ZNih8CdSMxHAtiSMWZMkExRc5U667Sxrs=;
        b=jolDo4w6/zWeYTuGsgQtwdU6IvD9ytXAjSDt8+yWMuC/ZHvyy3RmskzFOc1LBNECAc
         BjQjXZVUGGo87gdSjYVWb+vieaDd27jtVDKNUXp2SCQF23Ma9cuV0JtwOCUv5G8Thpiv
         8NvSlbzLD+nXcNHuL+DHsK/SA3sIfPnitEq63oOyGclhRlxfBln0eNXw46LTZvBju2mv
         Qg/DAIRf9wLzQHdL6dx/uNJ8QbKEZQGtSu0SGmLfC9wdXGU2NxlaLMPZAHBuLmc3ke7C
         mmMmeH2Bk5UP9quAnSahzGqGVECQqJQ974rhB71tIaBR4eknsGqHcMAZql2zYKWjFp5f
         7/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=frmJlXQl80ZNih8CdSMxHAtiSMWZMkExRc5U667Sxrs=;
        b=RJWH3bQQXEGp6LGvjMMw2qNEcUC3wECjw7/rxxWZC1Wyrr9FbGsJxxZq1scCHg5tda
         JeGqUb/SwLepnCmMS2AI+zy9eYiFN/xpxJZu+VQzAy5bkSkWX6BcpHNQUjuZQCulebVF
         O0sXJxsxZpRkFhQx7+4S5sD+hwc1pR2u35Kvp4G0K7HkumuP1/6aEMbnGroPpXdLRyCA
         EjbXi1uXakNNCQDgTcwwfInzVpTFJz9kozPTqjKX/y4DDA0g7EwCoGvaS6T9X7nuPHic
         6kCj2yUZTOb+JoggowQQEXCIo7g8bsR0Jx659EnALgi1/2DBygd/sPLT5VuNLIqJ6EYR
         ffvw==
X-Gm-Message-State: AOAM5312+krf8Vb27ATIlPjjYZH9TQhV18nW40yg2e5Q8b7vrkNpXuDr
        rMloDStfddrmNIZO24pLuNAXgemtYysKEeFz7aCk
X-Google-Smtp-Source: ABdhPJw2cLvvmTlJRH0IZyt3CEmM3q6au7egB3n0rDXkYLpue9H+0wz/ZavdCgqfErTAG6LXe4RxEVSPrtkYp5FdPmc=
X-Received: by 2002:a17:906:7c9:: with SMTP id m9mr2166336ejc.178.1605278472616;
 Fri, 13 Nov 2020 06:41:12 -0800 (PST)
MIME-Version: 1.0
References: <20201113085255.GA91999@mwanda>
In-Reply-To: <20201113085255.GA91999@mwanda>
From:   Paul Moore <paul@paul-moore.com>
Date:   Fri, 13 Nov 2020 09:41:01 -0500
Message-ID: <CAHC9VhQHas2FGcheAaizAHA65pfxa+oz5B88AP9WO4-hPF4kFg@mail.gmail.com>
Subject: Re: [bug report] netlabel: fix our progress tracking in netlbl_unlabel_staticlist()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Nov 13, 2020 at 3:53 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Hello Paul Moore,
>
> The patch 866358ec331f: "netlabel: fix our progress tracking in
> netlbl_unlabel_staticlist()" from Nov 8, 2020, leads to the following
> static checker warning:
>
>         net/netlabel/netlabel_unlabeled.c:1190 netlbl_unlabel_staticlist()
>         error: uninitialized symbol 'iter_chain'.

Thanks Dan, I'll look at it today.  I'm a little confused as to why
the compiler didn't flag that, but perhaps I just missed it.  Anyway,
patch later today ...

-- 
paul moore
www.paul-moore.com
