Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 057BB1BB0D8
	for <lists+kernel-janitors@lfdr.de>; Mon, 27 Apr 2020 23:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbgD0V72 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 27 Apr 2020 17:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726194AbgD0V71 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 27 Apr 2020 17:59:27 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71257C03C1A7
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Apr 2020 14:59:27 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id j20so14794327edj.0
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Apr 2020 14:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KXsqXqLa3MNc3GseZAHL6+hrzDA6tgyahvdXcv6nuC0=;
        b=DfNsTuXejFM4GpdLngZ5Hng3iLMEOmw5AwCqh67++iv5lrN4p7mEwxK9X8c6M5PLNj
         iXbi579Rs0UuusLh+/qG92t2w7+cC4scewai7HDftHnRMvZIQKkxr1MkuqgjtEjlfpgw
         7MngMV8YM5JffLfokIPR0hl1VTQfgZ4V5kdLF8HEdB+nmNwASuOTjm53P5xzL+4G6w3p
         3FZdIm3XNqmVC0z+RSB5hCMSTliW4f8Md5StWC2EHPyVRx1NEkaGZwKAS7lgMDJhsnn/
         3MilaCQLcgRrHf9zcijHP9mD2eWnoEfC56SjjjNZn4mNET3vVMAdDTyw8+WwA4RsJktO
         QBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KXsqXqLa3MNc3GseZAHL6+hrzDA6tgyahvdXcv6nuC0=;
        b=XUKYG+UfMj2uFuuWNo3WGw2MrenciUOkAeMgzsxv5f+30MMmooTBwfHDwlOsQigium
         azVQysYDFzF5te/J5eDBatcOYGudQqkX6uwZFTwWqhycThGd1a/Tz/lYHkZM2JzBCiuE
         Ay+cW574WBF+KRYW3V82o8WAFHPeLyhSXum+hjAVaWyWlWvghTavxZhHc2OeqLMrdMx8
         DwIBu24s+AGOSoPSAlMQaRH5ivR2P8rn8rKEast7wJPTHsCsALc7Y9rs/AOkJn93N9kL
         MPDfI4x3YdtsKFqJABlfyj+rO53HWfI4EolS3NvWbKF3Fg0elVhfQV1UYdu1RQEOpAig
         u8zA==
X-Gm-Message-State: AGi0PuZ5yR+zOyGXrgkA9M3iBTdppDYlChSW7asFJGdk55vpbHH6l39h
        mXIe0XbXfChU9Xics//aZMNv/hEKbbeFIBt+k6aO
X-Google-Smtp-Source: APiQypL5eq/i30h0N49yhKX69dSyitlFFWBEuwUbGs/BB8DWlk7mSCwyYWLIumXrF+U8i72s44CbscVcJbUdGkIvmu0=
X-Received: by 2002:a05:6402:1215:: with SMTP id c21mr21043564edw.128.1588024766012;
 Mon, 27 Apr 2020 14:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200427124935.130432-1-weiyongjun1@huawei.com>
In-Reply-To: <20200427124935.130432-1-weiyongjun1@huawei.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Mon, 27 Apr 2020 17:59:14 -0400
Message-ID: <CAHC9VhQdoGgoQGio2_ezjDZe1-AiRAMmQ7Q9Tp8AVEYt2kkjMg@mail.gmail.com>
Subject: Re: [PATCH -next] selinux: fix error return code in cond_read_list()
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>, selinux@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Apr 27, 2020 at 8:48 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> Fix to return negative error code -ENOMEM from the error handling
> case instead of 0, as done elsewhere in this function.
>
> Fixes: 60abd3181db2 ("selinux: convert cond_list to array")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  security/selinux/ss/conditional.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Looks good to me too, thanks for fixing this.  I've merge this into
selinux/stable-5.7 and I'll send it up to Linus later this week
assuming testing goes well.

> diff --git a/security/selinux/ss/conditional.c b/security/selinux/ss/conditional.c
> index 939a74fd8fb4..da94a1b4bfda 100644
> --- a/security/selinux/ss/conditional.c
> +++ b/security/selinux/ss/conditional.c
> @@ -429,7 +429,7 @@ int cond_read_list(struct policydb *p, void *fp)
>
>         p->cond_list = kcalloc(len, sizeof(*p->cond_list), GFP_KERNEL);
>         if (!p->cond_list)
> -               return rc;
> +               return -ENOMEM;
>
>         rc = avtab_alloc(&(p->te_cond_avtab), p->te_avtab.nel);
>         if (rc)
>

-- 
paul moore
www.paul-moore.com
