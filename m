Return-Path: <kernel-janitors+bounces-8385-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21253AE8840
	for <lists+kernel-janitors@lfdr.de>; Wed, 25 Jun 2025 17:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB7B01743D5
	for <lists+kernel-janitors@lfdr.de>; Wed, 25 Jun 2025 15:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F1725E445;
	Wed, 25 Jun 2025 15:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LyFfbnK0"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5401A5B8C
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 15:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865636; cv=none; b=TxlM5BdjRp3cODJDsGqF+iutZZWOVHuzXfBsKYFlnQ9VD4h6m7XD4wT6C82BlVZ/WUKTeEBoyc+9Xo1jJH1ZtVr9gEY+qRxtEYfxigtOq7r7WrpwFF3UzMps3QZIuEEwqG9/4AvG0XVEbGZFXruek/Bs6odVkBOLAKIMn+lnebI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865636; c=relaxed/simple;
	bh=oeDVbXzYCMu1RsPKrLrCYA5wW/CpYO+WF4MAGS9OyyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGxak4xHL22dAvsEd3PIGf4JJlVR3KxMaXnvWciEhUbyoP3y0tGy+RBvv+lEC7bOHkGaZWd49z+teY3mqDolU8XsMwIIyQn6OmvJDT5jWZK1g1iO9FsqT5F4+s6WBkXZVOvIKcCVfrEKpGnqTxFImcElmNpYyLn5HnambM0Ag+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LyFfbnK0; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-72c47631b4cso4299276a34.1
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 08:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750865634; x=1751470434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VZqhEcxBQhbzOh6JVaGxQL694yeYlxvz6oZqmaMRq08=;
        b=LyFfbnK0RWpT7DhguTiH2xr4csnVfiCzm+elCqg805kgp4iOo9WvBXkmgL6erYf5z9
         I/vK6S4/7UsWRbcgEhI0EXtlP1am8vYVUgZs/sIOoYraurQN6ugZnz9tJiSVQRYHKz3a
         LuZT5nwgVSMAdrNBI+GMinrxv9Czwb2qb3sVf1lw14nrr5iDmqHPrldJcm0I/2oFZ6A/
         1BSc4WApbaRSoqIsYgyJ49kzjQt29XSDNMxuuQexO1y03fhqGhDzmW5/fJ2rgRmveceh
         dYRPqaYYcxIeIRQyG7w8RKuXiNnOWaqgw7r8fdpSqQNAzWbZYGYaQ4/GxZ/zKJDsW7ss
         zeOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865634; x=1751470434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZqhEcxBQhbzOh6JVaGxQL694yeYlxvz6oZqmaMRq08=;
        b=d+7X73IBle7i8inDfBSE/VLyO0/nk6INWpn8W/M6pR3uHQ4puXnaGOlXAV1f0NzvZo
         3g03+bQghlsPM/I3M10jgZ08NtHCdtYRXh53Z27ntlmOONXZxT87arf+Y8jW28OZVup1
         EZ6a7OrL+rBTp36oRLfCKBPZ0kE3z8IH+KKkC3d1Z1N3d2SgZXvItPw42KPh+f4VQ16E
         o6XPVZ+VYpv3+zQ7EWSFNXB4jFAU5aJjeiTDAYs+r5P4a7x4Xzz3TH7lobebP/fxuV1n
         KXxKh2mv7DpsnaD8xvEhsfE5nyYpY12g6+nORHTqTxacOguKxYuVwbuSQs2W8XebAnkE
         PPqg==
X-Forwarded-Encrypted: i=1; AJvYcCVlhK9G+Boep7VsczrWK/gmT7jqyONtCCzl4QHPhhyEzX6rb0VPKITXIz2hMJ5GF48bN9yJAUMyjeDWPGSgfyA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEe1yMx9S/zQYoDjwzzm7D9M45fFrjKkl52XcOZf5xaOzS/e2Y
	9BK16Iyzrj3xu+0fteWD+0VwjR7GmQX1PBsIPj09jn6z+I7tA8b1QlfAkE2xUnGjj8Y=
X-Gm-Gg: ASbGncv8Jcmd9A8Ppo/GYmvNx/9TMI8n16xKV+fZYIBVGkC0P4KjWCVMcJCXIDDCthK
	LEdZfbDVx8GQOZAFcjbzXKUBfCHxX0aPwderxl9mUReoIzfBtgmXnLaF9y7hjhq4r8HdcOZK4cF
	vBbpWyMp97pjsmwd4fznJog9f5isa4zN/yljpLAlbhQJrngWwj2gmiMVKseL0UmqlFFeM31GCM0
	PqXJHGRS6As4vrKv94Lbe4pOoBo+cq1ul2TTx1efEYQJoThnvs6Ew0lrYmBj91mT1VpM7KmJ57W
	S6tAGhJY+bYQcS/6m7wm/CblIjhor9KGNEX5rJz13WiGwJTP9t9BPKY9Ojg6MQOkU/E=
X-Google-Smtp-Source: AGHT+IHocp2lWjY0ub02K97anAYnYNyxecSqopXbTvdpz/db5rpNAumtukQSZFEpei331ZTaZVEUDg==
X-Received: by 2002:a05:6830:2112:b0:72c:3235:557d with SMTP id 46e09a7af769-73adc7b4318mr2366572a34.13.1750865634096;
        Wed, 25 Jun 2025 08:33:54 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3ee4:904:206f:ad8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a90aee8ecsm2293133a34.10.2025.06.25.08.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:33:53 -0700 (PDT)
Date: Wed, 25 Jun 2025 18:33:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Hildenbrand <david@redhat.com>
Cc: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Harry Yoo <harry.yoo@oracle.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mm,memory_hotplug: set failure reason in offline_pages()
Message-ID: <c20a5cde-671c-4f71-995e-779fb6778273@suswa.mountain>
References: <685c1428.050a0220.346d5e.eafa@mx.google.com>
 <2db18566-f864-44f4-bd0b-baa7cc4bebea@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2db18566-f864-44f4-bd0b-baa7cc4bebea@redhat.com>

On Wed, Jun 25, 2025 at 05:24:01PM +0200, David Hildenbrand wrote:
> On 25.06.25 17:22, Dan Carpenter wrote:
> > The "reason" variable is uninitialized on this error path.  It's supposed
> > to explain why the function failed.
> > 
> > Fixes: e4e2806b639c ("mm,memory_hotplug: implement numa node notifier")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >   mm/memory_hotplug.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> > index 4d864b4fb891..e954f81b55a0 100644
> > --- a/mm/memory_hotplug.c
> > +++ b/mm/memory_hotplug.c
> > @@ -1977,8 +1977,10 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
> >   		node_arg.nid = node;
> >   		ret = node_notify(NODE_REMOVING_LAST_MEMORY, &node_arg);
> >   		ret = notifier_to_errno(ret);
> > -		if (ret)
> > +		if (ret) {
> > +			reason = "nr_pages more than present_pages";
> 
> "node notifier failure"
> 
> With that
> 
> Acked-by: David Hildenbrand <david@redhat.com>
> 
> (likely should be squashed because the commit it might not be stable yet)

Oh, yeah.  I misread the code.  Thanks.  I resent now.

But, ugh, I forgot to add your Acked-by...  But this is likely going
to be squashed as you say so hopefully that's fine.

regards,
dan carpenter


