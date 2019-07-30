Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 240FF7AF4C
	for <lists+kernel-janitors@lfdr.de>; Tue, 30 Jul 2019 19:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729792AbfG3RLW (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 30 Jul 2019 13:11:22 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42398 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728735AbfG3RLW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 30 Jul 2019 13:11:22 -0400
Received: by mail-pg1-f193.google.com with SMTP id t132so30381231pgb.9
        for <kernel-janitors@vger.kernel.org>; Tue, 30 Jul 2019 10:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DURkbxYpSyevpsa6R/8i8qyLSR7ch0xiZqDHE2fEsfE=;
        b=ZTsxU1jwWrAv6PbXiIIik3jf5/ft7LKcFvGYgVLnB4fPoQ3tvi3MKpyNrOPU21KDrh
         H5kP39SwZlpO3Akh/BlFqzi/NdJPb6xW6HfYfGoqkDiClLFgKYZab/gbg4ySHMYlMKkg
         D2KgzDmfBTZVzANTQ9UhE3pVRe6CTUc9yL+7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DURkbxYpSyevpsa6R/8i8qyLSR7ch0xiZqDHE2fEsfE=;
        b=tRkv42emRzKgGt0MX58q4Yt0HvR26VKz75cBEYAmy8KHOIPpWcYDJDd0Im3qQYIKYY
         3IhkYhh3lNORff+h9jM5LdvcEsVJ+6T2QbEXha5WbECtfYlZFN2HpOiv31TJNA1PdttG
         PScUtvx9XUth3U2rZPW/uLdxEkwlzE4bTLU/75WOihkTp8lv6i4y1TMwEISJJXNraJ6h
         MTc625Eh9/nnWiaq5vm1qc/Yz7+c4sXIC4OTq0uZjAC5fK/yJcpoHYINEqsjG0dkd+nE
         AQU2hjGHWXDOVEdHWMcEpPLylBWAGi3BhM+ftDWYQJAV6j7BMBcIH4pwQdeH7RKz70P9
         kgLQ==
X-Gm-Message-State: APjAAAVbkmsM+0D2oZdKzOizhqnutyUIjLTSUDX6MEw101u4Lqn84/Rt
        XlrAoqiegNQpjRSiKIlM8zee/w==
X-Google-Smtp-Source: APXvYqwHgmNOnBJ+nNiMj7wuTK/9aMk3slfx8ycNwvFhZErCqiyZqyD06IveEHQuUMtNtFe1ybumrw==
X-Received: by 2002:a62:7890:: with SMTP id t138mr34060209pfc.238.1564506681840;
        Tue, 30 Jul 2019 10:11:21 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id r61sm80360776pjb.7.2019.07.30.10.11.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2019 10:11:21 -0700 (PDT)
Date:   Tue, 30 Jul 2019 10:11:19 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Joonwon Kang <kjw1627@gmail.com>
Cc:     re.emese@gmail.com, kernel-hardening@lists.openwall.com,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] randstruct: fix a bug in is_pure_ops_struct()
Message-ID: <201907301008.622218EE5@keescook>
References: <20190727155841.GA13586@host>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190727155841.GA13586@host>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Jul 28, 2019 at 12:58:41AM +0900, Joonwon Kang wrote:
> Before this, there were false negatives in the case where a struct
> contains other structs which contain only function pointers because
> of unreachable code in is_pure_ops_struct().

Ah, very true. Something like:

struct internal {
	void (*callback)(void);
};

struct wrapper {
	struct internal foo;
	void (*other_callback)(void);
};

would have not been detected as is_pure_ops_struct()?

How did you notice this? (Are there cases of this in the kernel?)

> Signed-off-by: Joonwon Kang <kjw1627@gmail.com>

Applied; thanks!

-Kees

> ---
>  scripts/gcc-plugins/randomize_layout_plugin.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/gcc-plugins/randomize_layout_plugin.c b/scripts/gcc-plugins/randomize_layout_plugin.c
> index 6d5bbd31db7f..a123282a4fcd 100644
> --- a/scripts/gcc-plugins/randomize_layout_plugin.c
> +++ b/scripts/gcc-plugins/randomize_layout_plugin.c
> @@ -443,13 +443,12 @@ static int is_pure_ops_struct(const_tree node)
>  		if (node == fieldtype)
>  			continue;
>  
> -		if (!is_fptr(fieldtype))
> -			return 0;
> -
> -		if (code != RECORD_TYPE && code != UNION_TYPE)
> -			continue;
> +		if (code == RECORD_TYPE || code == UNION_TYPE) {
> +			if (!is_pure_ops_struct(fieldtype))
> +				return 0;
> +		}
>  
> -		if (!is_pure_ops_struct(fieldtype))
> +		if (!is_fptr(fieldtype))
>  			return 0;
>  	}
>  
> -- 
> 2.17.1
> 

-- 
Kees Cook
