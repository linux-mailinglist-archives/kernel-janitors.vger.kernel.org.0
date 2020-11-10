Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8FD2AD085
	for <lists+kernel-janitors@lfdr.de>; Tue, 10 Nov 2020 08:33:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730541AbgKJHdM (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 10 Nov 2020 02:33:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727389AbgKJHdG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 10 Nov 2020 02:33:06 -0500
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9195FC0613CF
        for <kernel-janitors@vger.kernel.org>; Mon,  9 Nov 2020 23:33:04 -0800 (PST)
Received: by mail-io1-xd42.google.com with SMTP id m9so12769362iox.10
        for <kernel-janitors@vger.kernel.org>; Mon, 09 Nov 2020 23:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o42yGNfUzOTdDPMZ3l6k7Cu/Tlmyay1zu48jmpASnXo=;
        b=Bab2g9wnlFOdi/TfY6YIOWflmuIFwIHWvW+UQ8g9wuKqnu2gokJkIVhoGPs/zuFUWR
         jIDj+cDiTAaPP46Y+p15eLHbDUHvcZvnAEQu0v41Xn4IOg/pP94cY6JHYbhopGRLuv9Q
         90c6vd+0UbBZ+YWv38kcIcwIM/6/LYUazCgbDgD+VYBNpxw57TC6yhhkI+jhcN2Oi4ax
         JAZjyMajGAMJIOwfeP0FaFBjw+HcggDQNt05ajNW1wcryUsp1dVQ1n1ROGiZ48SthM1W
         jge5/bI+y2K+BwPs6YfVs+MTULHNdBnZ5lLI8HTnm81Q6mdSWqd1mi2DHVMgwaDEj59z
         5shg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o42yGNfUzOTdDPMZ3l6k7Cu/Tlmyay1zu48jmpASnXo=;
        b=CEID99jVG64fJWzXOikvLcymOOmIjdPq3Xf0Dj+fGLbf9t6vTGYODIe9nDHuIBmtIH
         /NaJ5dtllpgcgxruE6RtVrehYNLnf/aHpsgbDSNOUsMeQ7eSZtSbOMX5ymwUjSaY4BqD
         DtqZ4AepbduoPOm+S3ah74B2IhIlIKdkPX0Uhu9VPOrj8O3lg/jeN2HNeAqhyr9SnpLG
         ZaL7v9inKvDF/FOdIPQMYcIpGwPz/23nXh1yLcFMUeT47GqiflkPhHFiLmvDcODSTwtH
         srnsHbBRsAMqehHeGQLY860EOJwH2pyFE6MjtASVwo1N1DNih+PZwGrYYA6TD6crkG6P
         kOzQ==
X-Gm-Message-State: AOAM532T+OaV7nU7aPHwASbaHfVnThsD4QnMHtupugdgTtxA4JejXSds
        4cvy+tBmDTw9Dw4HIcfCDp1inPW/1UoG/+mugFsfog==
X-Google-Smtp-Source: ABdhPJyCBy+StTa8YbefPs//qaLrA521z8TjMcBYMBBGBGWOOM43GVtYy+eGtrbbiJr3uDykhgeeYY66LGg9YDDIxiY=
X-Received: by 2002:a5e:980e:: with SMTP id s14mr13190769ioj.195.1604993583691;
 Mon, 09 Nov 2020 23:33:03 -0800 (PST)
MIME-Version: 1.0
References: <CANn89i+ABLMJTEKat=9=qujNwe0BFavphzqYc1CQGtrdkwUnXg@mail.gmail.com>
 <1604967391-123737-1-git-send-email-wenan.mao@linux.alibaba.com>
In-Reply-To: <1604967391-123737-1-git-send-email-wenan.mao@linux.alibaba.com>
From:   Eric Dumazet <edumazet@google.com>
Date:   Tue, 10 Nov 2020 08:32:52 +0100
Message-ID: <CANn89iL6UW9mG6hW7f3Yv+32Pe_i9F-5cQhfo2uV68wdcgSuZA@mail.gmail.com>
Subject: Re: [PATCH net v5] net: Update window_clamp if SOCK_RCVBUF is set
To:     Mao Wenan <wenan.mao@linux.alibaba.com>
Cc:     David Miller <davem@davemloft.net>,
        Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        Jakub Kicinski <kuba@kernel.org>,
        netdev <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Nov 10, 2020 at 1:16 AM Mao Wenan <wenan.mao@linux.alibaba.com> wrote:
>
> When net.ipv4.tcp_syncookies=1 and syn flood is happened,
> cookie_v4_check or cookie_v6_check tries to redo what
> tcp_v4_send_synack or tcp_v6_send_synack did,
> rsk_window_clamp will be changed if SOCK_RCVBUF is set,
> which will make rcv_wscale is different, the client
> still operates with initial window scale and can overshot
> granted window, the client use the initial scale but local
> server use new scale to advertise window value, and session
> work abnormally.
>
> Fixes: e88c64f0a425 ("tcp: allow effective reduction of TCP's rcv-buffer via setsockopt")
> Signed-off-by: Mao Wenan <wenan.mao@linux.alibaba.com>

Signed-off-by: Eric Dumazet <edumazet@google.com>

Thanks !
