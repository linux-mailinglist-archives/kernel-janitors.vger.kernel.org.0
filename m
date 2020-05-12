Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B34B1CFE83
	for <lists+kernel-janitors@lfdr.de>; Tue, 12 May 2020 21:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730889AbgELTlB (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 12 May 2020 15:41:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728081AbgELTlA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 12 May 2020 15:41:00 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCA51C061A0E
        for <kernel-janitors@vger.kernel.org>; Tue, 12 May 2020 12:41:00 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id u10so5830844pls.8
        for <kernel-janitors@vger.kernel.org>; Tue, 12 May 2020 12:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7D7Hp2GHNstyMCh5/XTJVjifd1carg86uB7RWlRtVlk=;
        b=eAi54b7sSwZ/ceWB/pyFmHuU9A6POh5j1MeBzE62jl0QdYxK30WtVdS7xnYkks0AZC
         5DiGpqVxN8FSMTdmAOz613qHVonGKpeU99UX5OlJRWpbO/Z95dNEVD6dLyNS2bvfChTt
         s+NKxPBc5j1gvCxYMmBes/J5zxuTGia5axYko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7D7Hp2GHNstyMCh5/XTJVjifd1carg86uB7RWlRtVlk=;
        b=JLojtk7mq4Q41xMtGyzEjFqKGtFaIJwy/luiI4Pp9oXBFx3IAvjgK92WI3aqoYe2GL
         3umDh0fjCBXYLpUfKddspvtjpKJY0Ssd2JntnNeKgZI2SrMhTz9HP0NfFnS5xxEID/f/
         /rvaqOEoM+Pc9sUKYHOsfJirylJ1Ne1E4Zk0DNtWuQW5dOvxXumkw7WZAL6z0JTW10oT
         uCTkwnIWc4Okeu7oCHEXWZpV2h5QGGt105wXQtxOrlAVvo/wNYJH9+ieB8GIhVc1ijsM
         THf72rheNFrlr9laDct+CIqFNCU1ez93mHGiNFeULgcLzf/XH3dLvnCf9rG0LxtwlKny
         Z2dA==
X-Gm-Message-State: AGi0PuarzyCRcdCqHV7tbbiPlpESIKndE4ViSxw8Te4s5NAVbQ0bbJkR
        0hysWZXPxci93lsmOMJUQsB0nw==
X-Google-Smtp-Source: APiQypJFl6pnbq/6iz9o/q8NodQpt4ZAxP/h9BeLDm25JvtCQXuKGkQ1+6UchXzPAdhaBpsn0jK7+A==
X-Received: by 2002:a17:902:6b01:: with SMTP id o1mr22072464plk.64.1589312460110;
        Tue, 12 May 2020 12:41:00 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c2sm8737915pgj.93.2020.05.12.12.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 12:40:59 -0700 (PDT)
Date:   Tue, 12 May 2020 12:40:57 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] pstore/zone: remove redundant initializations to
 variable ret
Message-ID: <202005121240.1C306861D@keescook>
References: <20200512173801.222666-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512173801.222666-1-colin.king@canonical.com>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, May 12, 2020 at 06:38:01PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable rc is being initialized with a value that is never read and it
> is being updated later with a new value.  The initialization is redundant
> and can be removed.  In one of the cases, ret can also be moved inside a
> for-loop to reduce the scope.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks!

> ---
>  fs/pstore/zone.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/pstore/zone.c b/fs/pstore/zone.c
> index 3cf7d6762c76..419de481c69c 100644
> --- a/fs/pstore/zone.c
> +++ b/fs/pstore/zone.c
> @@ -600,7 +600,7 @@ static int psz_recover_zones(struct psz_context *cxt,
>   */
>  static inline int psz_recovery(struct psz_context *cxt)
>  {
> -	int ret = -EBUSY;
> +	int ret;
>  
>  	if (atomic_read(&cxt->recovered))
>  		return 0;

I've refactored this code.

> @@ -746,13 +746,13 @@ static void psz_write_kmsg_hdr(struct pstore_zone *zone,
>  static inline int notrace psz_kmsg_write_record(struct psz_context *cxt,
>  		struct pstore_record *record)
>  {
> -	int ret = -EBUSY;
>  	size_t size, hlen;
>  	struct pstore_zone *zone;
>  	unsigned int i;
>  
>  	for (i = 0; i < cxt->kmsg_max_cnt; i++) {
>  		unsigned int zonenum, len;
> +		int ret;
>  
>  		zonenum = (cxt->kmsg_write_cnt + i) % cxt->kmsg_max_cnt;
>  		zone = cxt->kpszs[zonenum];

And I've applied this hunk. Thanks!

-- 
Kees Cook
