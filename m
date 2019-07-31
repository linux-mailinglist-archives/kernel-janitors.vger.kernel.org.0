Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64D827CD6B
	for <lists+kernel-janitors@lfdr.de>; Wed, 31 Jul 2019 21:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730249AbfGaT7d (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 31 Jul 2019 15:59:33 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34072 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730227AbfGaT7c (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 31 Jul 2019 15:59:32 -0400
Received: by mail-pf1-f193.google.com with SMTP id b13so32462586pfo.1
        for <kernel-janitors@vger.kernel.org>; Wed, 31 Jul 2019 12:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wj8UI6KcdGWx7+DqBC4UilgyG1YpNkyj7/yhX7S5938=;
        b=lI/F+evGDUwaa/3jWG9s/L6Rki0XodRNIvovJ41k7O3gJBlhooGZWa8zk7zoZxPi3K
         2TLyWEVqGdpi3hnVGLBr1Oc4gUGjDuX/e0ynTnQkvdvYvby6ThNgqwr5+OlxOfckAHXE
         mdPb+Iuv8GNJU7luiqE0KFaafHR7acsFoLCvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wj8UI6KcdGWx7+DqBC4UilgyG1YpNkyj7/yhX7S5938=;
        b=XvZE+qmjoVVEh8TORStAdK9QV+3gfPqpKr2Gzwss/Z56WTDRf7Z4u6pEFK3n+BbDs4
         VREWwv//l+eRdgGUbJx1bE4ehdcvxzA8OxS8SsRMLzdcMdP84mbzZSikbnzNRBMDy5bV
         RXGyAPX7ODQWsRPdu2W4xH3JfFBvAGW+TkIEQkpeS7KBvm35QT/Bfp7wcyYfoG6n61oh
         8djJecR2QUI9etN2c+ll7TuaCS++vNMRsunFtNT72d6qMKu9Jb2akdNxeDl3pTse7q9v
         K2KV8iu0MPXr0kRZdL8Kjvox71MxA3rOxqhJGuNbnq/WPb45IwCTs03pEoA5aGKRSAfW
         G27Q==
X-Gm-Message-State: APjAAAXPILwenqsBPG5DkZrQnwvjRkxKglujnQ7+0z6RQ8HK11yEXRYl
        oiQWJ5b+yJfij71mh8MxEbwJ+N+iJRk=
X-Google-Smtp-Source: APXvYqyo7YtH0z/PjARx5H0oYP8eGymkvm90XLND0TLR+aFSRTYIsvGT3FPVBy4eGu5XU4G+pWeBtQ==
X-Received: by 2002:a17:90a:fa07:: with SMTP id cm7mr4440377pjb.138.1564603172224;
        Wed, 31 Jul 2019 12:59:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j15sm99294412pfn.150.2019.07.31.12.59.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2019 12:59:31 -0700 (PDT)
Date:   Wed, 31 Jul 2019 12:59:30 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Joonwon Kang <kjw1627@gmail.com>
Cc:     re.emese@gmail.com, kernel-hardening@lists.openwall.com,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        jinb.park7@gmail.com
Subject: Re: [PATCH 2/2] randstruct: remove dead code in is_pure_ops_struct()
Message-ID: <201907311259.D485EED2B7@keescook>
References: <cover.1564595346.git.kjw1627@gmail.com>
 <281a65cc361512e3dc6c5deffa324f800eb907be.1564595346.git.kjw1627@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <281a65cc361512e3dc6c5deffa324f800eb907be.1564595346.git.kjw1627@gmail.com>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Aug 01, 2019 at 03:01:49AM +0900, Joonwon Kang wrote:
> Recursive declaration for struct which has member of the same struct
> type, for example,
> 
> struct foo {
>     struct foo f;
>     ...
> };
> 
> is not allowed. So, it is unnecessary to check if a struct has this
> kind of member.

Is that the only case where this loop could happen? Seems also safe to
just leave it as-is...

-Kees

> 
> Signed-off-by: Joonwon Kang <kjw1627@gmail.com>
> ---
>  scripts/gcc-plugins/randomize_layout_plugin.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/scripts/gcc-plugins/randomize_layout_plugin.c b/scripts/gcc-plugins/randomize_layout_plugin.c
> index bd29e4e7a524..e14efe23e645 100644
> --- a/scripts/gcc-plugins/randomize_layout_plugin.c
> +++ b/scripts/gcc-plugins/randomize_layout_plugin.c
> @@ -440,9 +440,6 @@ static int is_pure_ops_struct(const_tree node)
>  		const_tree fieldtype = get_field_type(field);
>  		enum tree_code code = TREE_CODE(fieldtype);
>  
> -		if (node == fieldtype)
> -			continue;
> -
>  		if (code == RECORD_TYPE || code == UNION_TYPE) {
>  			if (!is_pure_ops_struct(fieldtype))
>  				return 0;
> -- 
> 2.17.1
> 

-- 
Kees Cook
