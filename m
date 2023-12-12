Return-Path: <kernel-janitors+bounces-662-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B35780E509
	for <lists+kernel-janitors@lfdr.de>; Tue, 12 Dec 2023 08:47:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1CE6281A6B
	for <lists+kernel-janitors@lfdr.de>; Tue, 12 Dec 2023 07:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A34417984;
	Tue, 12 Dec 2023 07:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gIAZ0t27"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63DA17736;
	Tue, 12 Dec 2023 07:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E68EC433C9;
	Tue, 12 Dec 2023 07:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702367212;
	bh=Ry+0HOKGnrROeRDuXfVg3iVo2Hj0Ooc8riVJECBIRVY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gIAZ0t27m2A4ZTpCVBQuIu2wQkSlygEsFdxVu017zBIB2lD7vOST7aIXouds16+6U
	 IO0DE8aJMEI4zcReGH69LFua0fj3qWHjIybDh/rkPHsbnIQs5cIzTYjcBMzpfKPI6u
	 cvpQIRaskJKmpzrw2UgMSy6RuH51FaSRpBlEF88KU9mtn5tXL+oWfjNSbUalkmg8Jf
	 GV/JhpV0g9uRjxevSRkz+xX6wcKJvcwRvPhpaCtfgSO3mj+XWXbIrOSRkZdp1of8Ar
	 6b3H4bZUVnvma+al9VRkq8Bz9VWFkmT50soPfpEQBFqyptuyNs3AyaXFX1gxMC4tXh
	 W3MUD2YvP+8/A==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50c0f13ea11so6083660e87.3;
        Mon, 11 Dec 2023 23:46:52 -0800 (PST)
X-Gm-Message-State: AOJu0Yyp6P5Ii5s+STtgq6Akwvi6dM3Wzrj7MpAoCL3TF9z+y/Pg6gb2
	N+TXHAWgbsWLM+THAaCIzcsrfBbBM2lj28PQ3t0=
X-Google-Smtp-Source: AGHT+IG3bR3Lcd82FvG3az8HYJgPLAE9nxxNkTnuKqti/naUDTGHp1e/eeep5o1bVubLakxCtKpQyd2g6CehqN6XxKI=
X-Received: by 2002:ac2:5e9b:0:b0:50b:e625:3009 with SMTP id
 b27-20020ac25e9b000000b0050be6253009mr2296886lfq.97.1702367210579; Mon, 11
 Dec 2023 23:46:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <03dd7de1cecdb7084814f2fab300c9bc716aff3e.1701632867.git.christophe.jaillet@wanadoo.fr>
 <202312041419.81EF03F7B7@keescook> <CAPhsuW43g-M+xvzD0N1JsJ_zGnvZQOw2Bi1TEqoHKanPnvMHLQ@mail.gmail.com>
 <202312080926.FBF7A2DDD2@keescook> <CAPhsuW5F1aRrCRW-ad5Sq=cgxHX+QgXgYZyMX17Zj4Mj=Jnhjw@mail.gmail.com>
 <ZXfzqsstA6tTPpF8@infradead.org>
In-Reply-To: <ZXfzqsstA6tTPpF8@infradead.org>
From: Song Liu <song@kernel.org>
Date: Mon, 11 Dec 2023 23:46:39 -0800
X-Gmail-Original-Message-ID: <CAPhsuW6k_Kh+iFq5jpbkn+-zFScg1_EpfEPRtMNDtyxhMsj0vQ@mail.gmail.com>
Message-ID: <CAPhsuW6k_Kh+iFq5jpbkn+-zFScg1_EpfEPRtMNDtyxhMsj0vQ@mail.gmail.com>
Subject: Re: [PATCH] md/md-multipath: Convert "struct mpconf" to flexible array
To: Christoph Hellwig <hch@infradead.org>
Cc: Kees Cook <keescook@chromium.org>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Mon, Dec 11, 2023 at 9:46=E2=80=AFPM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> On Fri, Dec 08, 2023 at 10:11:10AM -0800, Song Liu wrote:
> > We marked it as deprecated about 2.5 years ago. But to be honest,
> > I currently don't have a plan to remove it. I guess I should start thin=
king
> > about it.
>
> Let's just kill it off ASAP.  It never had a large user base and based
> by dm-multipath not long after it has been added.  It also doesn't
> support any uniqueue hardware and has no on-disk format.

Thanks for the suggestion.

> If you want any blame deflected from you I'd be happy to send the patch
> to remove it.

Let me give it a try. I am kinda curious what gonna happen. :)

Thanks,
Song

