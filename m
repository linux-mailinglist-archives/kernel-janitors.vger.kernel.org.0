Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 947D62ACA72
	for <lists+kernel-janitors@lfdr.de>; Tue, 10 Nov 2020 02:26:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730702AbgKJB0s (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 9 Nov 2020 20:26:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33737 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727311AbgKJB0p (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 9 Nov 2020 20:26:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604971603;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=t05JtdUe9+ueKiWP7Cd0WcO5v2xombvbloOzDhjvSkg=;
        b=O3uuatjq4FY6sXEmBSfUEBEOCvGlYGYFDlL1VRt/+uIdZyL1H0ZwehGPpdZVaBW5WRNfvZ
        qfORS9kJ75IaacRtK9C9MNSHL9SCfCS2JDQ1m2a3qIoSceerOMNN7DguCtu7GQ/FXjc1hc
        b7X4nlwwihZxyY2F3838LEeyyUuE7pw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-vZDqMDg2MSOm02mKP5pGMg-1; Mon, 09 Nov 2020 20:26:40 -0500
X-MC-Unique: vZDqMDg2MSOm02mKP5pGMg-1
Received: by mail-qv1-f69.google.com with SMTP id d41so6951137qvc.23
        for <kernel-janitors@vger.kernel.org>; Mon, 09 Nov 2020 17:26:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=t05JtdUe9+ueKiWP7Cd0WcO5v2xombvbloOzDhjvSkg=;
        b=mPHKlfk+VSVpOwa/+dQQA5bkn3mHKKyFykIShcD3DqG/ljTssqLUerc7b35pU8Gqnu
         KNvwqKo7MhHQfRG5BDGBEk4TRDRM7LuHotaFRIdEK9KSL+SqNmuvM1lGjCN6vxZFHP4e
         FOn3PAQKXh+tWcxlCm+8AwSh5fsz6VY6nl0jbOj/cv3ncIpwSEgsbc0/weXQ98gzCeTU
         XhvueZahvXh3szKimS7r+/0Pf1qsFZ8ufG1ud/cecLniKGS4917C4KYogXs03oIgZ0mt
         y2qR3LvoRU4rjGKdF0c8jy/YHSRGiWjJOoiRzZ2hfnR5FPT+Rjwy5zR4ciayAJPzOrYS
         TVZw==
X-Gm-Message-State: AOAM530J+t992oS5daGnMpQNXPe/BeI9llOHqgJIEY21igwN6XCTCcEg
        iQZcvzv26O6yHdSr2z9T4C5b49F+UMTnpxavNyQYzQvsj5R5go/szOSy/TLSocOph2Gt/ULdLZI
        rJPRtkhP2/p1XymxRCd+brSwCg+gV
X-Received: by 2002:a05:6214:12e8:: with SMTP id w8mr12148216qvv.16.1604971600056;
        Mon, 09 Nov 2020 17:26:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyId0TiOzOqiFGE0H+bF95RmGtjd6vw5jTrtLt0Hd3sykGjZMSOHupvlqQGlMR7Zd+CbsLsbQ==
X-Received: by 2002:a05:6214:12e8:: with SMTP id w8mr12148196qvv.16.1604971599811;
        Mon, 09 Nov 2020 17:26:39 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id f56sm5363152qta.49.2020.11.09.17.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 17:26:39 -0800 (PST)
Subject: Re: [PATCH] sysctl: move local variable in proc_do_large_bitmap() to
 proper scope
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        linux-fsdevel@vger.kernel.org
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech,
        linux-kernel@vger.kernel.org
References: <20201109071107.22560-1-lukas.bulwahn@gmail.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <e0cf83dc-2978-70ce-aeb2-37873cc81c03@redhat.com>
Date:   Mon, 9 Nov 2020 17:26:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201109071107.22560-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On 11/8/20 11:11 PM, Lukas Bulwahn wrote:
> make clang-analyzer caught my attention with:
>
>   kernel/sysctl.c:1511:4: warning: Value stored to 'first' is never read \
>   [clang-analyzer-deadcode.DeadStores]
>                           first = 0;
>                           ^
>
> Commit 9f977fb7ae9d ("sysctl: add proc_do_large_bitmap") introduced
> proc_do_large_bitmap(), where the variable first is only effectively used
> when write is false; when write is true, the variable first is only used in
> a dead assignment.
>
> So, simply remove this dead assignment and put the variable in local scope.
>
> As compilers will detect this unneeded assignment and optimize this anyway,
> the resulting object code is identical before and after this change.
>
> No functional change. No change to object code.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on v5.10-rc3 and next-20201106
>
> Luis, Kees, Iurii, please pick this minor non-urgent clean-up patch.
>
>  kernel/sysctl.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/kernel/sysctl.c b/kernel/sysctl.c
> index ce75c67572b9..cc274a431d91 100644
> --- a/kernel/sysctl.c
> +++ b/kernel/sysctl.c
> @@ -1423,7 +1423,6 @@ int proc_do_large_bitmap(struct ctl_table *table, int write,
>  			 void *buffer, size_t *lenp, loff_t *ppos)
>  {
>  	int err = 0;
> -	bool first = 1;
>  	size_t left = *lenp;
>  	unsigned long bitmap_len = table->maxlen;
>  	unsigned long *bitmap = *(unsigned long **) table->data;
> @@ -1508,12 +1507,12 @@ int proc_do_large_bitmap(struct ctl_table *table, int write,
>  			}
>  
>  			bitmap_set(tmp_bitmap, val_a, val_b - val_a + 1);
> -			first = 0;
>  			proc_skip_char(&p, &left, '\n');
>  		}
>  		left += skipped;
>  	} else {
>  		unsigned long bit_a, bit_b = 0;
> +		bool first = 1;

This looks fine, but while you are here how about setting, to match the type

first = true

And then only clearing first once

if (!first)                                                                            
  proc_put_char(&buffer, &left, ',');

else

  first = false

Instead of at every loop iteraction

Tom

>  
>  		while (left) {
>  			bit_a = find_next_bit(bitmap, bitmap_len, bit_b);

