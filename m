Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4A461EA283
	for <lists+kernel-janitors@lfdr.de>; Mon,  1 Jun 2020 13:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbgFALPS (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 1 Jun 2020 07:15:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgFALPR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 1 Jun 2020 07:15:17 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5225C03E96F
        for <kernel-janitors@vger.kernel.org>; Mon,  1 Jun 2020 04:15:15 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id 59so1391691uam.7
        for <kernel-janitors@vger.kernel.org>; Mon, 01 Jun 2020 04:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=omnibond-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OXZ/1DYRo+pu94KlRLN7nt0/Jhb4JRPyNAe/TLutDXA=;
        b=LKZL0Qour/P3znlT11X6MSTa6a99kxJDMSO5oEuzh1urufoBk/cF8qaCaAXe2QzSU7
         o+TAkmNpjAqy8QBkVVDWyY2MQf7jZV3Sh5yfmmn8AxRZqeXovzJiNaHsAVzkJkJbp0c4
         xOcWqsh+4ND9g/cdr4emUuxzL7VBStoQv47qrX7kbAJczbJJH+M9ntwRVDPf9UWnQy0J
         JpeO55wc7hgIA6KQ5zR6fbuP5EPaptgIWLcCl9L8ym6u8sXM5Tj6e1wCaPtGGbKTRxn2
         G3uT95sz/KJ3K0xAc8pFwhdZqDe3jkNHXZUrB5Se/v2+2CNH8Gpz/c3+6EBiz8z1pHYT
         gpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OXZ/1DYRo+pu94KlRLN7nt0/Jhb4JRPyNAe/TLutDXA=;
        b=oFD2MAnj0reGlB5r6VqpnH8BdL3ZbY93RGXcsyeci4HhtFm2s23DPcG/FIO+41GWUi
         3WRYSclKIUXSx7I55LoRiTPX0gqa8qA3Qi8VWVmW8NTzTr3ho+xxC6yJIZaCQ9Oit3fk
         edPDo2/p3HESHp8FYhlkXx+aDM+NFqZ6BeDANsVFI1W+QQOYrg+lpz8+KjclMzVi6O7P
         AXF56Ysbbv7TB9UjViDy8wx5K/Dx/jYsuvN3YFP5INTUjpaBY52SGM+lHZnB2BSjMAFQ
         lKDP0r+936FcWYrkNsihD838Zr+uVjBmz3VAjjQNNPdvl8WiEzReyV+iYG2sUDlx1P8e
         2nGQ==
X-Gm-Message-State: AOAM533WY6Nszhb0OZ0A6BfU17RBXt1dbUGpOY7JvzWqdOd991qQLHPb
        tXxGrjVQvxUHQ+XRxCtZLbbVisbqOfSrtwoUpoJFqg==
X-Google-Smtp-Source: ABdhPJyLmXk9IokgmeXuSJkA51TK2eGFwPQT+GFIvU7RA+yCOCZNRcNTXzdIV1T6tjLuIq55IW6dCOPqa3CLlRE70JQ=
X-Received: by 2002:ab0:548a:: with SMTP id p10mr13945454uaa.35.1591010115132;
 Mon, 01 Jun 2020 04:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200524224802.27850-1-colin.king@canonical.com>
In-Reply-To: <20200524224802.27850-1-colin.king@canonical.com>
From:   Mike Marshall <hubcap@omnibond.com>
Date:   Mon, 1 Jun 2020 07:15:04 -0400
Message-ID: <CAOg9mSQWuE06DJtfSn-d2cBK+RMZ0ndnw6m29pWEdw3jQq3erQ@mail.gmail.com>
Subject: Re: [PATCH] orangefs: remove redundant assignment to variable ret
To:     Colin King <colin.king@canonical.com>
Cc:     Martin Brandenburg <martin@omnibond.com>, devel@lists.orangefs.org,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Colin... thanks for the patch, I have applied it
to the orangefs for-next tree...

-Mike

On Sun, May 24, 2020 at 6:48 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable ret is being initialized with a value that is
> never read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/orangefs/orangefs-mod.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/orangefs/orangefs-mod.c b/fs/orangefs/orangefs-mod.c
> index c010c1fddafc..289b648ae196 100644
> --- a/fs/orangefs/orangefs-mod.c
> +++ b/fs/orangefs/orangefs-mod.c
> @@ -79,7 +79,7 @@ DECLARE_WAIT_QUEUE_HEAD(orangefs_request_list_waitq);
>
>  static int __init orangefs_init(void)
>  {
> -       int ret = -1;
> +       int ret;
>         __u32 i = 0;
>
>         if (op_timeout_secs < 0)
> --
> 2.25.1
>
