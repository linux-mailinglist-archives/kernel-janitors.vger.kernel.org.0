Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4975A1CFDE7
	for <lists+kernel-janitors@lfdr.de>; Tue, 12 May 2020 20:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730761AbgELS7Z (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 12 May 2020 14:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbgELS7X (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 12 May 2020 14:59:23 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FDE4C061A0F
        for <kernel-janitors@vger.kernel.org>; Tue, 12 May 2020 11:59:18 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id s20so5778734plp.6
        for <kernel-janitors@vger.kernel.org>; Tue, 12 May 2020 11:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fDIsqd1W5C0dkw2svve5ve4Uf/NEAiUJGuSmZ1myBmg=;
        b=cfSAULIQe4ogt83IWA/fd82JGGfdkBQhEzAcXSkzAJr+Bowvr0xZbLQ69aERTd8Eoy
         W2wQC4aH4xMAIy/Il2e10ZSfc5/ISPajE9v3IdiQshDIYPv2sZ8NdPedUgrf+tJg3stp
         D6P/StPh2UCG55oBT9/MgJ9X+y3ThGCZ0Zcis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fDIsqd1W5C0dkw2svve5ve4Uf/NEAiUJGuSmZ1myBmg=;
        b=SJvUGeKmCStsASnzyxWM1FEwEPRIVgT5SEoB5Wbw36lJkux+HrNd/6DknrpWGRPWV3
         U0Lo4ZuMpNZRaYZfzERbnaKPTtE+nr3/KyvfzwGGtxvtVcrmU0GAL3EAEuPl7DokeFVc
         tuMVdx0m+SX3IiwkGFOXAmgATl7PGHQu4sqjtdJSn0m6dveFENV82zkFlOfSYu9wdmHY
         tr6wfeV+++GIehUht/Jmb5trEaI4rIwq3Grj4Rd57+765p4AW+GaHl32rkLz6JhkWxP3
         YPuxa7rPJEs0rjH3JXepvFYivIkNPv4DKze8nz4aB2XBjWcUCU2MigTPC7AX4iByOBzG
         60VQ==
X-Gm-Message-State: AGi0PuYrZcm7p/MJZnzGVXfvGRU02cgQjweOTJve+uREO1QP0cJdERAr
        kwbaDsx0L3tY2+A27TsAvNyVVw==
X-Google-Smtp-Source: APiQypJuqp9YQ/jW2xEhizt7Cs2btUZ3ImTKqkgDx2XKEmyn3+SwI4Jh3zhQ1EdTfiEQ7gUZM7PEUQ==
X-Received: by 2002:a17:90a:6403:: with SMTP id g3mr27190069pjj.99.1589309957865;
        Tue, 12 May 2020 11:59:17 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 128sm11891176pfd.114.2020.05.12.11.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 11:59:17 -0700 (PDT)
Date:   Tue, 12 May 2020 11:59:16 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        WeiXiong Liao <liaoweixiong@allwinnertech.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] pstore/zone: fix dereference of pointer before it
 has been null checked
Message-ID: <202005121159.711F246@keescook>
References: <20200512171932.222102-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512171932.222102-1-colin.king@canonical.com>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, May 12, 2020 at 06:19:32PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the assignment of cnt dereferences pointer 'record' before
> the pointer has been null checked. Fix this by only making this
> dereference after it has been null checked close to the point cnt
> is to be used.
> 
> Addresses-Coverity: ("Dereference before null check")
> Fixes: 637ce64e7f57 ("pstore/zone,blk: Add support for pmsg frontend")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/pstore/zone.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/pstore/zone.c b/fs/pstore/zone.c
> index c5bf3b9f644f..3cf7d6762c76 100644
> --- a/fs/pstore/zone.c
> +++ b/fs/pstore/zone.c
> @@ -825,7 +825,7 @@ static int notrace psz_record_write(struct pstore_zone *zone,
>  		struct pstore_record *record)
>  {
>  	size_t start, rem;
> -	int cnt = record->size;
> +	int cnt;
>  	bool is_full_data = false;
>  	char *buf = record->buf;

Also here. I'll fix both. Thanks!

-Kees

>  
> @@ -835,6 +835,7 @@ static int notrace psz_record_write(struct pstore_zone *zone,
>  	if (atomic_read(&zone->buffer->datalen) >= zone->buffer_size)
>  		is_full_data = true;
>  
> +	cnt = record->size;
>  	if (unlikely(cnt > zone->buffer_size)) {
>  		buf += cnt - zone->buffer_size;
>  		cnt = zone->buffer_size;
> -- 
> 2.25.1
> 

-- 
Kees Cook
