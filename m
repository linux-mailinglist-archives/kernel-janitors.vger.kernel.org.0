Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 907051AD9BD
	for <lists+kernel-janitors@lfdr.de>; Fri, 17 Apr 2020 11:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730222AbgDQJXS (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 17 Apr 2020 05:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730218AbgDQJXS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 17 Apr 2020 05:23:18 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 079F2C061A0C
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Apr 2020 02:23:18 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id c3so888314otp.8
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Apr 2020 02:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eJOO3sCXHry7MojuN8dC/zdHSghVm7s+SjPlK2NGqPk=;
        b=dGzqBcT2y0IjKDKTVvVFAsz8Z3c+NzAWRaa6mFH97szt18huctYQ+urwQ/WBIZpYNF
         o5kLlcb2pD9Na8XSfp8sM60n6rfnS3EeXrxed9f8pPJSx58Y6xfx0pNtoDw2BvAlNQ6K
         Bx2cDUVQFg6rOnM4UZNTqAW6BAf5FayM+52vgXPERu45WRs74QoycE3WdHMUchBoNpn8
         OWHCKdiFBio9nlHyx33h9L8lFIjGmw14sgr2NFEBERtGl921TUiI8wT8eyFWXOtG2aG8
         btVikN9XxSF3nlLGI+Vs7dwj//gpFxGghAxdbcYK+EKKWCr+7WkeyK08S6BV/IAsATfe
         f+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eJOO3sCXHry7MojuN8dC/zdHSghVm7s+SjPlK2NGqPk=;
        b=q9XwFrJl+WA1KFSFXuW6DBPuFIWVCM+lQDWCfPU5C5ANgJowL+oTkN6VDHprI1Py2Y
         AGsDy1sXpDuL6Ov2+qSB09cncDYJEhjWsNwP0SiMMuWvK/YNlT7ynYnaL5eu1Qku1gpr
         LbbrEvqoqfCd/lvkEWM154tb80hAaIAMg2FGtPiHBqsYb3kLJSWW0/dpxuT7CmbenPSQ
         SlUzlC6nQc2Wpis/tCEGTXKCLSRN2grMQaLYYk+g2P+Qj7hYAxybPF8EAiIxVXpSdQWU
         3mgeP/Va0S2RzMhUEUPG2f8UZ2lkTLNzb7iohIUc26Bsb5zywh1T2xd3lXAllkGn9lit
         HJew==
X-Gm-Message-State: AGi0PuYdKW+Zx0C7f/iJ9Ikk4uyICdu/H6ZykExrO9Chx32OMyNAFG1k
        gEN0hNCj3DYPg/5LMQ/maywFrAGNTIMd0Nr4a1AyzA==
X-Google-Smtp-Source: APiQypJ6P4R14L+BloZcUqibhX35g0AtcFu1WBId+MZ06WADLOcDKE0n9sK0Y2ibzLELvmCEpRglyRh0BrZloK5jCLA=
X-Received: by 2002:a9d:509:: with SMTP id 9mr1919206otw.17.1587115397215;
 Fri, 17 Apr 2020 02:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200417025837.49780-1-weiyongjun1@huawei.com>
In-Reply-To: <20200417025837.49780-1-weiyongjun1@huawei.com>
From:   Marco Elver <elver@google.com>
Date:   Fri, 17 Apr 2020 11:23:05 +0200
Message-ID: <CANpmjNMzwqFaaA-zQh0Nv4SUdoJUFO_yTmTjfbMFqyxBea1U+Q@mail.gmail.com>
Subject: Re: [PATCH -next] kcsan: Use GFP_ATOMIC under spin lock
To:     Wei Yongjun <weiyongjun1@huawei.com>,
        "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 17 Apr 2020 at 04:56, Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> A spin lock is taken here so we should use GFP_ATOMIC.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Good catch, thank you!

Reviewed-by: Marco Elver <elver@google.com>


> ---
>  kernel/kcsan/debugfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/kcsan/debugfs.c b/kernel/kcsan/debugfs.c
> index 1a08664a7fab..023e49c58d55 100644
> --- a/kernel/kcsan/debugfs.c
> +++ b/kernel/kcsan/debugfs.c
> @@ -230,7 +230,7 @@ static ssize_t insert_report_filterlist(const char *func)
>                 /* initial allocation */
>                 report_filterlist.addrs =
>                         kmalloc_array(report_filterlist.size,
> -                                     sizeof(unsigned long), GFP_KERNEL);
> +                                     sizeof(unsigned long), GFP_ATOMIC);
>                 if (report_filterlist.addrs == NULL) {
>                         ret = -ENOMEM;
>                         goto out;
> @@ -240,7 +240,7 @@ static ssize_t insert_report_filterlist(const char *func)
>                 size_t new_size = report_filterlist.size * 2;
>                 unsigned long *new_addrs =
>                         krealloc(report_filterlist.addrs,
> -                                new_size * sizeof(unsigned long), GFP_KERNEL);
> +                                new_size * sizeof(unsigned long), GFP_ATOMIC);
>
>                 if (new_addrs == NULL) {
>                         /* leave filterlist itself untouched */
>
>
>
>
>
