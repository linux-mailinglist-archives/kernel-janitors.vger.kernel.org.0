Return-Path: <kernel-janitors+bounces-2863-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 855008B762A
	for <lists+kernel-janitors@lfdr.de>; Tue, 30 Apr 2024 14:50:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82DF1B222C5
	for <lists+kernel-janitors@lfdr.de>; Tue, 30 Apr 2024 12:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC95117109F;
	Tue, 30 Apr 2024 12:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IcoXrQ5X"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD6A17592
	for <kernel-janitors@vger.kernel.org>; Tue, 30 Apr 2024 12:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714481449; cv=none; b=SCMPBV5N2h6A87Vwkre0OD2YBy+9B7BX6AcxYDqKSMtfFjAXVmulE7RnNhbHTtuoeM7z21TWy5qliYVmEIJUpCy7o2GygrFkGf0rsWUd3sR/29tDOOOdowfVxoe9RHrBsfyWSBUgNP47u3SI4Er0J3a6rYtdd4J1Knp8tKamNwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714481449; c=relaxed/simple;
	bh=S4K/2cmpUrfA9WmOXZYhE508OZ2TD020p6sfzKaml8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHw6vtI3fXmLmK3Se568pute5/gka5jfYYNTelfSbAGjfoZFsN3pYArM3x9ZwuOz1Wi0H/G6F6Y9X8PA6pMkSEZ19bPg1dl27FExOaqp87apVgbgOJIlEGE/B3iR0wucMTZn4PmlnOCIuAaDJQlJlTr6/VRbhAevgCgJQ/ZhplE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IcoXrQ5X; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a58c89bda70so514882966b.3
        for <kernel-janitors@vger.kernel.org>; Tue, 30 Apr 2024 05:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714481446; x=1715086246; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PiyLrbcdCVqy4NleK3Wr91InaBV+aCWg5BCtmdVPUws=;
        b=IcoXrQ5XkE/0dMA+Xm19Lp7tE/ZfIrreqgjOd1xTRod+DEc++KOvsqWV4cTP017GiD
         wxWA5JMhhPrjHZXZk3CnTgp6UgeaV9behus7MXbA8Micwa6lh5XbdNFa34uZ/vYnqoYI
         MoluA/vYKcyr9j3n/A0AnUJZiQgJAgZM6UMy1CRakBbefkCeZcYWZ72UX4T0LY4eXlbv
         zX3bouj2sjxWt4Dj7jXqa1PyL4ZaLxsVR4ydanK2O3bVeAi11vJBWfrU+3Cbf5ZflsKc
         ONkjhf8CioeH/LJUa0rfm9k+Dbfh5Kz5MNrsCtUGvaUxFVwCfx8HSmHY/1Uj1cQfxMYv
         hvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714481446; x=1715086246;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PiyLrbcdCVqy4NleK3Wr91InaBV+aCWg5BCtmdVPUws=;
        b=LK0SdAhRWF4Jwilkbg6AO46t6PlCcYD1aiKySQfl18e66ct5UP11/qjOp89aQLvBGJ
         gFybTGgyxryZTXuiCZabyc3o+HeW18K4x/8/ch46bgiRM1zEl0CBJTf3cRKJhRz7dEKS
         HPvDU9p+6+aeLzicN3H3wOxsjsYcZFcZTzBLDzvpw3yT9xE+d39YOalFxj3S205c+Ka5
         +yOm52TeCOh9EyQwstgjZaV7vFkziGpBKr4fRtNNhoSNBBfdIFFpRYUhA2DtfmLTZm4V
         bG04/biE5HKhn1In3g3+6gF0D2UfkqF2rlv/A25sVNmziBrvR/KqoYEQhdqN42dIKOq4
         kIYA==
X-Forwarded-Encrypted: i=1; AJvYcCXljFXXFhVoPLHL9gCtjNRh7G5uN3PGS7KZIO2D3veYKbwuzxL7E5/ul7lwggqFvjp/DSHYrvQNPo6dJOSkaDWI8S7h9VQBeYkj1sv5EE52
X-Gm-Message-State: AOJu0YwTePuL8c36gITjAuAUK77gOU0KuMvyr/NHWuiuxRq6MvCtp0Yo
	7mZGbxmWlZvacqFe5S6Lh6KVu3of3RicWlh6lrnhHjyIFo2F6BrLmtDukL8pVqg=
X-Google-Smtp-Source: AGHT+IGXHVEzHP4YowE90reqc5tdTfM/OhXF9If/ZUuwRokjnwdtEkX7kyOqr5GK1QsclcwOixY0YA==
X-Received: by 2002:a17:906:dfc5:b0:a58:bd1b:a05f with SMTP id jt5-20020a170906dfc500b00a58bd1ba05fmr9322033ejc.68.1714481445375;
        Tue, 30 Apr 2024 05:50:45 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id d18-20020a1709064c5200b00a58aff25d77sm6340151ejw.193.2024.04.30.05.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 05:50:44 -0700 (PDT)
Date: Tue, 30 Apr 2024 15:50:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Matthew Wilcox <willy@infradead.org>, Christoph Lameter <cl@linux.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	"Lameter, Christopher" <cl@os.amperecomputing.com>
Subject: Re: [PATCH] mm/slab: make __free(kfree) accept error pointers
Message-ID: <49e072da-3d2c-4246-8b7e-7f25513afde3@moroto.mountain>
References: <285fee25-b447-47a1-9e00-3deb8f9af53e@moroto.mountain>
 <Zi8N66yehahl6D59@casper.infradead.org>
 <6a10be7d-b556-42a9-852c-b6ed821ec41e@suse.cz>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a10be7d-b556-42a9-852c-b6ed821ec41e@suse.cz>

On Tue, Apr 30, 2024 at 02:09:10PM +0200, Vlastimil Babka wrote:
> On 4/29/24 5:03 AM, Matthew Wilcox wrote:
> > On Sun, Apr 28, 2024 at 05:26:44PM +0300, Dan Carpenter wrote:
> >> Currently, if an automatically freed allocation is an error pointer that
> >> will lead to a crash.  An example of this is in wm831x_gpio_dbg_show().
> >> 
> >>    171	char *label __free(kfree) = gpiochip_dup_line_label(chip, i);
> >>    172	if (IS_ERR(label)) {
> >>    173		dev_err(wm831x->dev, "Failed to duplicate label\n");
> >>    174		continue;
> >>    175  }
> >> 
> >> The auto clean up function should check for error pointers as well,
> >> otherwise we're going to keep hitting issues like this.
> >> 
> >> Fixes: 54da6a092431 ("locking: Introduce __cleanup() based infrastructure")
> >> Cc: <stable@vger.kernel.org>
> >> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> >> ---
> >> Obviously, the fixes tag isn't very fair but it will tell the -stable
> >> tools how far to backport this.
> >> 
> >>  include/linux/slab.h  | 4 ++--
> >>  1 files changed, 2 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/include/linux/slab.h b/include/linux/slab.h
> >> index 4cc37ef22aae..5f5766219375 100644
> >> --- a/include/linux/slab.h
> >> +++ b/include/linux/slab.h
> >> @@ -279,7 +279,7 @@ void kfree(const void *objp);
> >>  void kfree_sensitive(const void *objp);
> >>  size_t __ksize(const void *objp);
> >>  
> >> -DEFINE_FREE(kfree, void *, if (_T) kfree(_T))
> >> +DEFINE_FREE(kfree, void *, if (!IS_ERR_OR_NULL(_T)) kfree(_T))
> > 
> > Wait, why do we check 'if (_T)' at all?  kfree() already handles NULL
> > pointers just fine.  I wouldn't be averse to making it handle error
> > pointers either.
> 
> Making kfree() handle IS_ERR() is perhaps a discussion for something else
> than a stable fix. But Christoph has a point that kfree() checks
> ZERO_OR_NULL_PTR. Here we check IS_ERR_OR_NULL. How about we checked only
> IS_ERR here so it makes some sense?
> 

I wondered why Peter Z wrote it like this as well...  I think he did
it so the compiler can figure out which calls to kfree() are unnecessary
and remove them.  These functions are inline and kfree() is not.  I
haven't measured to see if it actually results in a space savings but
the theory is sound.

regards,
dan carpenter


