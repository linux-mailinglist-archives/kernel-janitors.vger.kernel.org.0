Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D08E01C1D96
	for <lists+kernel-janitors@lfdr.de>; Fri,  1 May 2020 21:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730381AbgEATFA (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 1 May 2020 15:05:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730033AbgEATFA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 1 May 2020 15:05:00 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B80C061A0E
        for <kernel-janitors@vger.kernel.org>; Fri,  1 May 2020 12:04:59 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id d16so7994122edq.7
        for <kernel-janitors@vger.kernel.org>; Fri, 01 May 2020 12:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=utiKFhMFXax2OSf9CMAz2YObyOkSwIwuAyj2ZKdulc4=;
        b=oq5HWHKtpvZhq9Q4KlwOYZdn3kapwhhlYk3Z8d+VY1HjYiKGJfLvL4rMXUOmjCiOi2
         rEzT3m6v7K/GH4BM0xHlQEJa0i/UzAZ9YJbTmvTgOWqKg+7MeF6PR4SXC7EOdV9Lq1zJ
         48FYnYBrAjn+i2iMOJJihvDTfAFIXdX+joUTLsUYvgkpZhhH6m7Trb++ErRMxGAmt9tM
         8ViPwEkD1aHDaR25v3rdHlxgiRINkjXYwztVpkicEyDKDMg78wSoAUY2AxqVJSgAdodt
         vvqbk1sLQkTkDayB/suEffQjLEWfcA7vRQgpUo3uetmMHt4OpbgFXII6BcMCj5Y86mq7
         aqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=utiKFhMFXax2OSf9CMAz2YObyOkSwIwuAyj2ZKdulc4=;
        b=nSY1XGCf/+cD7zTKu7FeePXS0ZZHFk4EBfH45G5KPOI1AcU2kid5pY95qAgWVao2HM
         ar4DaJ1HL2ENjF+6dthwd/qDjXvYg4pomILSTMkNgN3hfWJ1ZLJvxnIPYRKZNJKptVQU
         T216tqFSExnAffbjbuwY15d9ZHZWA01D8ARuTfhsoXj6NQGW0kdqbx9dWpeqKHrVbbNV
         ELJz5ie0A1n91vyKvVsEW0psU8CfMPXi65Bpi+3ZLhjv7yDi2g1hdK5reXvz1+suMGOU
         JKSFf2FGzahNJ3ZXB+PlqPf2d40GHAGEsAEbCfGrNzbOtPwr30syogXdq08KtIoJyDjn
         n4lQ==
X-Gm-Message-State: AGi0PuanXSyheetxjeJ2yAJXyZS5WpVV7HL4Lyck099jCsT/V46gNzrN
        LtD9da20gHJeoVSaNiut+I9vohABi5qJSurqlyQ1
X-Google-Smtp-Source: APiQypISLqBVM6kAdnC7efBpEr9zhjdt95eJNwvxrlblEIgNTRzv6tN3iMIHWIcLkDLNQdSTsdwnZhFXbUB63kTupMk=
X-Received: by 2002:aa7:cd59:: with SMTP id v25mr4497234edw.135.1588359898382;
 Fri, 01 May 2020 12:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200429073053.83660-1-weiyongjun1@huawei.com>
In-Reply-To: <20200429073053.83660-1-weiyongjun1@huawei.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Fri, 1 May 2020 15:04:47 -0400
Message-ID: <CAHC9VhTEHJiRm-9zkic1mUyVJ6WNLL8AhzRsbq+bf7q2GDdCgA@mail.gmail.com>
Subject: Re: [PATCH -next] selinux: fix error return code in policydb_read()
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Jeff Vander Stoep <jeffv@google.com>,
        selinux@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Apr 29, 2020 at 3:29 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> Fix to return negative error code -ENOMEM from the kvcalloc() error
> handling case instead of 0, as done elsewhere in this function.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  security/selinux/ss/policydb.c | 1 +
>  1 file changed, 1 insertion(+)

Regardless of the other error, this patch fixes a legitimate problem
so I've merged it into selinux/next with the appropriate fixes tag.
Thanks.

-- 
paul moore
www.paul-moore.com
