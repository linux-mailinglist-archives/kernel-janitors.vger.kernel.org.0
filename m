Return-Path: <kernel-janitors+bounces-92-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F1A7DDE25
	for <lists+kernel-janitors@lfdr.de>; Wed,  1 Nov 2023 10:08:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 500C328170E
	for <lists+kernel-janitors@lfdr.de>; Wed,  1 Nov 2023 09:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 090627475;
	Wed,  1 Nov 2023 09:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lvJrhrll"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A876FDF
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 09:08:08 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A57ADE
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 02:08:05 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-98377c5d53eso973012266b.0
        for <kernel-janitors@vger.kernel.org>; Wed, 01 Nov 2023 02:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698829684; x=1699434484; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l/U0/4Zp074LQCHLOPGw0y7Rk5ZQHkrZnxdbMLDRkzg=;
        b=lvJrhrll+gvD+M6wGbJBSmHy1aSyYOGVuMJTJ2gdXBcSLGPTWGVJutLDvpaA6enOB/
         BF5sDYPJkB0QfL92zR6KSrd3xYn7z2EVIK17ix5CuzJRc8LuLbXoktQ3IUll3AgdiW3n
         XBGGpA3dO9LwzanJsPpxPzwinuWlXy6tQ29lsb5LOl9WJarizmKHcqvuUDcGbTbHpfNP
         oF4xEND1sTLlnMxOh/oFUiqfvI5HK7FYVHQA+h3eWmA8iSd8ADJHyttIAqrLS3HC+T38
         Swv2m2ON4ufsUUra7Xm0dJBmZByTtqTcDf/p9m6pivlDbiJYj+Fb8DhOV1oUyNbc5Hjj
         3UNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698829684; x=1699434484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/U0/4Zp074LQCHLOPGw0y7Rk5ZQHkrZnxdbMLDRkzg=;
        b=CFOgJDd8vOfjPRORT7ShtDDgplte75TXuZXD5teCwl4gNcayyzZpe1/kndXjFq6Whv
         PIRsryi8x8v0HBvtcnkYWP3m2HKFoMOPFtqxyQoxwp0D22HpzOJJj5vxVH6n1rNyRv1p
         Z1KRDvbn5uGgjxsAGOLLFtn4IRgkQK5MwFvkcGxj4OcZqXaJvpg+yes3fbz27aH5Mgcq
         R5Yrr1g40o+GlvV8LXEi8g3bHH1hI/D0O+3RisoFZKUg2MnO4iDcAQyWZXPVdPwIDpz2
         shDeuF8ACSvHSgZKxH24k+kyDFqg5TK41SDNnijifGGEJ8RxiIn6luQr6g4YAGGmmHkg
         MzYw==
X-Gm-Message-State: AOJu0YyqFCDiJIW7E1RfYoyGegQn5+W9SC6T/1pqPcUp2FZQm3KyKddW
	xYLUe56mS+Bcg9xw4loQ2XAgdA==
X-Google-Smtp-Source: AGHT+IEkFDGkW54r0Ia2H+xR2vSsVr8SXlt4hH1CjQgcbJiO9brVXLFjPPYe9xJEUR1RVJrrvuPydg==
X-Received: by 2002:a17:906:c107:b0:9bf:b022:dc7 with SMTP id do7-20020a170906c10700b009bfb0220dc7mr1204358ejc.48.1698829683706;
        Wed, 01 Nov 2023 02:08:03 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a12-20020a1709065f8c00b0099bd5d28dc4sm2161031eju.195.2023.11.01.02.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 02:08:02 -0700 (PDT)
Date: Wed, 1 Nov 2023 12:08:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Kees Cook <keescook@chromium.org>,
	Daniel =?iso-8859-1?Q?D=EDaz?= <daniel.diaz@linaro.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	kernel-janitors@vger.kernel.org,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	kv-team <kv-team@linaro.org>
Subject: Re: [RFC] drm/tests: annotate intentional stack trace in
 drm_test_rect_calc_hscale()
Message-ID: <7b58926a-a7c3-4ad0-b8a3-56baf36939ca@kadam.mountain>
References: <02546e59-1afe-4b08-ba81-d94f3b691c9a@moroto.mountain>
 <CA+G9fYuA643RHHpPnz9Ww7rr3zV5a0y=7_uFcybBSL=QP_sQvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYuA643RHHpPnz9Ww7rr3zV5a0y=7_uFcybBSL=QP_sQvQ@mail.gmail.com>

Let me add Richard to the CC list.  See lore for more details.
https://lore.kernel.org/all/CA+G9fYuA643RHHpPnz9Ww7rr3zV5a0y=7_uFcybBSL=QP_sQvQ@mail.gmail.com/

On Tue, Oct 31, 2023 at 09:57:48PM +0530, Naresh Kamboju wrote:
> On Mon, 30 Oct 2023 at 14:33, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > We have started printing more and more intentional stack traces.  Whether
> > it's testing KASAN is able to detect use after frees or it's part of a
> > kunit test.
> >
> > These stack traces can be problematic.  They suddenly show up as a new
> > failure.  Now the test team has to contact the developers.  A bunch of
> > people have to investigate the bug.  We finally decide that it's
> > intentional so now the test team has to update their filter scripts to
> > mark it as intentional.  These filters are ad-hoc because there is no
> > standard format for warnings.
> >
> > A better way would be to mark it as intentional from the start.
> >
> > Here, I have marked the beginning and the end of the trace.  It's more
> > tricky for things like lkdtm_FORTIFY_MEM_MEMBER() where the flow doesn't
> > reach the end of the function.  I guess I would print a different
> > warning for stack traces that can't have a
> > "Intentional warning finished\n" message at the end.
> >
> > I haven't actually tested this patch...  Daniel, do you have a
> > list of intentional stack traces we could annotate?
> 
> [My two cents]
> 
> I have been noticing following kernel warnings / BUGs

Some are intentional and some are not.  I had a similar thing happen to
me last week where I had too many Smatch false positives in my devel
code so I accidentally sent a patch with a stupid bug.  I've since
updated my QC process to run both the devel and released versions of
Smatch.

But a similar thing is happening here where we have so many bogus
warnings that we missed a real bug.

> These are starting happening from next-20231009.
> I am not sure which are "Intentional warnings" or real regressions.
> 
> [   37.378220] BUG: KASAN: slab-out-of-bounds in kmalloc_oob_right+0xc4/0x300
> [   37.645506] BUG: KASAN: slab-out-of-bounds in kmalloc_oob_right+0xec/0x300
> ..
> [  632.407425] BUG: KASAN: null-ptr-deref in kobject_namespace+0x3c/0xb0
> 
> 
> Logs: [Sorry for sharing long logs ]

Not your fault.  These long warnings are the issue at hand.

> ==========
> 
> ------------[ cut here ]------------
> [  629.699281] WARNING: CPU: 0 PID: 2834 at
> drivers/gpu/drm/drm_rect.c:138 drm_rect_calc_hscale+0xbc/0xe8

Deliberate.

> [  629.914458] WARNING: CPU: 5 PID: 2836 at
> drivers/gpu/drm/drm_rect.c:138 drm_rect_calc_hscale+0xbc/0xe8
> [drm_kms_helper]

Deliberate.

> [  630.172564] WARNING: CPU: 5 PID: 2846 at
> drivers/gpu/drm/drm_rect.c:138 drm_rect_calc_vscale+0xbc/0xe8
> [drm_kms_helper]

Deliberate.
> ------------[ cut here ]------------
> [  630.388003] WARNING: CPU: 3 PID: 2848 at
> drivers/gpu/drm/drm_rect.c:138 drm_rect_calc_vscale+0xbc/0xe8
> [drm_kms_helper]

Deliberate.

> ------------[ cut here ]------------
> [  631.679963] kobject: '(null)' (00000000f512f33b): is not
> initialized, yet kobject_get() is being called.

Not deliberate.  This seems like a straight forward bug to fix.

Failing a kobject_get() seems like it would obviously lead to a
refcounting underflow and a use after free so I suspect some of the
other warnings that follow are caused by this issue.  We should fix it
first and see which warnings disappear.

So testing the Linux Kernel Dump Test Module is always going to create
warnings.  So intentional warnings are a part of life.  We should
annotate them.

But having too many warnings is bad and has caused this kobject_get()
bug.  We should delete the warning in drm_calc_scale() or make it a
WARN_ONCE() and mark it as intentional in the kunit test.

regards,
dan carpenter


