Return-Path: <kernel-janitors+bounces-619-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1711480AABC
	for <lists+kernel-janitors@lfdr.de>; Fri,  8 Dec 2023 18:28:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5E4A2817C2
	for <lists+kernel-janitors@lfdr.de>; Fri,  8 Dec 2023 17:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62A93984B;
	Fri,  8 Dec 2023 17:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J/8eZJQr"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9369E0
	for <kernel-janitors@vger.kernel.org>; Fri,  8 Dec 2023 09:27:57 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d05199f34dso18231275ad.3
        for <kernel-janitors@vger.kernel.org>; Fri, 08 Dec 2023 09:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702056477; x=1702661277; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hg6fUEZXStGBp771sMyuxFL70vLJ5BeYI/ptmqsolcE=;
        b=J/8eZJQrQDM9h9GBp+AfyI/b1z5mDYebqC3SXKnipDtex0OzNu0uKwiv/Z8BSQVsNd
         a+ZlnbvYo9jqDhuYJQj22iUTpJzsF9UR+iMBNinz8hEtqGOlGREc5YhW5lfGzzc3OWnC
         xrIJofD9kwr5NSIdzsKD/dicz3JqaQ28UehDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702056477; x=1702661277;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hg6fUEZXStGBp771sMyuxFL70vLJ5BeYI/ptmqsolcE=;
        b=kAQZDTmGHGKNrt7OqOhPfk2ih4a7+0aLNKU4XGzdzQT+EZOoKa0kFaM1A2kZeWk3pr
         RH66ysfFCXmzhZziku7t7NqiqzKFWtcp+i2pQGPCGN022merzI9XL5iccc+hfQMizSuE
         2zZ7DG0nN2cXxXEO1BbrdhfUrX1M8yLan3YlSdO/DNvJnt0gR+HpWabO5pQcrIRuKYPF
         pOk0BTgX14aJdVR+ntYW6mvwipVPDG4RcER/6ZU8MehHOuTcfoSkszs7Ozz3dYKYZj4v
         xQ2DbgoQskFzfALjTT9F0ewtYmfTlSkKM5NXaj2Yf6Bilkq4o4WcwGyvTJmtfle3umpx
         +cSQ==
X-Gm-Message-State: AOJu0YzzrBhy66Tldj5UzKpjhFikyARVZlnJ0EiybhbiCwsJ5MsaRGGS
	mrg7qv3ZLQSiniUQkXJxS+0Ktw==
X-Google-Smtp-Source: AGHT+IHVTw89wrkKxW6H+y85uDNqkr3bSCVArfzo6yB6zlvvZsJ6ez9TxBemFCSY+J8FoNDku+7DiA==
X-Received: by 2002:a17:902:6848:b0:1d0:8383:742d with SMTP id f8-20020a170902684800b001d08383742dmr364617pln.37.1702056477358;
        Fri, 08 Dec 2023 09:27:57 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902ee4c00b001d0c134dc2dsm1955222plo.77.2023.12.08.09.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 09:27:56 -0800 (PST)
Date: Fri, 8 Dec 2023 09:27:56 -0800
From: Kees Cook <keescook@chromium.org>
To: Song Liu <song@kernel.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] md/md-multipath: Convert "struct mpconf" to flexible
 array
Message-ID: <202312080926.FBF7A2DDD2@keescook>
References: <03dd7de1cecdb7084814f2fab300c9bc716aff3e.1701632867.git.christophe.jaillet@wanadoo.fr>
 <202312041419.81EF03F7B7@keescook>
 <CAPhsuW43g-M+xvzD0N1JsJ_zGnvZQOw2Bi1TEqoHKanPnvMHLQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW43g-M+xvzD0N1JsJ_zGnvZQOw2Bi1TEqoHKanPnvMHLQ@mail.gmail.com>

On Thu, Dec 07, 2023 at 09:33:17PM -0800, Song Liu wrote:
> On Mon, Dec 4, 2023 at 2:20 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Sun, Dec 03, 2023 at 08:48:06PM +0100, Christophe JAILLET wrote:
> > > The 'multipaths' field of 'struct mpconf' can be declared as a flexible
> > > array.
> > >
> > > The advantages are:
> > >    - 1 less indirection when accessing to the 'multipaths' array
> > >    - save 1 pointer in the structure
> > >    - improve memory usage
> > >    - give the opportunity to use __counted_by() for additional safety
> > >
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> >
> > This looks like a really nice conversion. I haven't run-tested this, but
> > it reads correct to me.
> 
> Agreed this is a good optimization. However, since MD_MULTIPATH is
> already marked as deprecated. I don't think we should ship further
> changes to it.

Hm, that seems like a weird catch-22 to me. I would say we should
continue to improve any code in the kernel that people spend time to
work on, or we should remove that code entirely. Should MD_MULTIPATH be
removed? How long has it been deprecated? (We just had an LTS release,
so doing removal now is a good time...)

-- 
Kees Cook

