Return-Path: <kernel-janitors+bounces-1924-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BB4869F03
	for <lists+kernel-janitors@lfdr.de>; Tue, 27 Feb 2024 19:23:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F2DF28F6C3
	for <lists+kernel-janitors@lfdr.de>; Tue, 27 Feb 2024 18:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D261148300;
	Tue, 27 Feb 2024 18:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OWCE4U4d"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAAC250F8;
	Tue, 27 Feb 2024 18:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709058229; cv=none; b=MVdfaNMgnLD1NPOwgNMyM00s1N4jJE4mX3JBs4WwGZxnZ3f+8str2U3A79FaAUoXiYUIa7F5ui1sSrL8vE6Ug8d/9qJ10yqHLsBY1g6XqNS/D3oZJv4/w1IjY1sOoFM1LBBdnw4ULlPQXFeUAIKu17Ftv1F2L0xEnwHi6a2Ke80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709058229; c=relaxed/simple;
	bh=wXeL6xRn84YW+yVox2D0U7SPKqNkdMbmGVqHUOm4hqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NjXNIub1ojYGycLzAbJQbbmnKjMINAW6x1pGY2Al/ZZajGBZAqLYbywFHKAKYLyXVNtyMx6giexUZCQ1FFetxX4hElFMH2mLAT63Q3sahS96CYOzsh7nQhPqvEirHDmO/chwbk4Mz/ZzhqK3WhV07R+ARm65iEnNUi8A+UresL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OWCE4U4d; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-563cb3ba9daso4979883a12.3;
        Tue, 27 Feb 2024 10:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709058226; x=1709663026; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXeL6xRn84YW+yVox2D0U7SPKqNkdMbmGVqHUOm4hqY=;
        b=OWCE4U4d1+dc55OhhBca0DGlsd9N4L1r86dJfdV6J+GjO/dD2bJ6tKdT5bZ7AeppYt
         obazORb7F7kf+Qkej8dVFLWUuSFmJ2ME7B8JMn2sON2qhGvxLDfG9vhhVWQA4tH1JAE2
         0A+vq+8i74e9rLVITvvmhCyykAMhLUgRoQ3vAMUu5uIKkWx2Fo0zRs5KaTT2BsvqI3Cy
         Xyjy6Pt1daMRDjtIy8Luhl2RevndHHO79RGSmR4cRt2VKHD7OUpQn5BtgbI65A3y2Maz
         Bnv9EhMw3oF51Syo+N7OF08IWJc6trZuID3JJfsTezol0JfG5HqUX0/VUOz2vV782oeH
         48MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709058226; x=1709663026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXeL6xRn84YW+yVox2D0U7SPKqNkdMbmGVqHUOm4hqY=;
        b=G/8txCYFarU9g3403+1B08TqCdzjQzchYD0u0SU7tqPTMG95wKKCTawkuhxMhmj8UW
         Xvli7dnxFGQ2SRqgr8/zZZxV0MXRdvpWMdkbd0pgxJdo4K2DqSQlCvQVEdqk8ydhsSYE
         w1c13aFGIl8pIY6wZ3Vbow+WHeSOdOQse63G4YOgz+h/lZJKSKaeNr9PzUkUzoKNbpzJ
         wTOi/Ldaax8tcm5UfTv43Pd9SUjLFu1EzlmykO+Lrz9m2jUCJdC+SLe2kZk3ulAwWR59
         AhuqE8lswmujz8xMXsv4B2WIhZBAFKQ/Rwn7k6eyGUGdCLAPlhzCoUe+NyEAVPLNIAVm
         24Wg==
X-Forwarded-Encrypted: i=1; AJvYcCXht517tNM7lewtb+BrHIrUUldz1AumaW0EobyhYpxnVLjalP8JIJlByLYhqunLxhoFmnausLPfkxvMx73qbpvYfKKgMnIWw+64ZAmPhP9smZz6ocMD7iGbr1ijcEz/sOTT7j1XSIgf+0a21uNK
X-Gm-Message-State: AOJu0Yy7FiQ7VmH6qdEj6vP5u9G8nhfhXvBDVA9SEOs20VOCPwz1AnWf
	9vNQSthiNxZgD7g1mvR44ICxoG70gpEFFm8YqSFLNfsKO6GSIroAt32xxpIvaZ8BnNlflQqsKOQ
	4nNWu59P4/fyTBc3YdPsBAwI/YMyN2xbC1j0ZEg==
X-Google-Smtp-Source: AGHT+IGrAmqMg8fWhmS7yIJja0CR7J8G/1TxTj98sEPqZYocLYGLvz+cuN3UIYHjYR7ZvhzVbIV4LoTflOXek003zkA=
X-Received: by 2002:a17:906:1e93:b0:a3f:6942:a213 with SMTP id
 e19-20020a1709061e9300b00a3f6942a213mr7010301ejj.32.1709058226431; Tue, 27
 Feb 2024 10:23:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240207143825.986-1-lukas.bulwahn@gmail.com> <20240227154424.GB15319@lst.de>
In-Reply-To: <20240227154424.GB15319@lst.de>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 27 Feb 2024 19:23:36 +0100
Message-ID: <CAKXUXMxctfDVt=+UHNrFfQFMhRitiQVQ1DBu-X0gtuM-WZYJgA@mail.gmail.com>
Subject: Re: [PATCH] dma-contiguous: remove debug code to removed CONFIG_CMA_DEBUG
To: Christoph Hellwig <hch@lst.de>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 4:44=E2=80=AFPM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> Thanks,
>
> added to the dma-mapping for-next branch.
>

Christoph, please drop this patch in your for-next branch if possible.

Andrew has picked this patch already and squashed it together with the
commit "mm/cma: drop CONFIG_CMA_DEBUG" in the mm tree. So, you do not
need to add it anymore.

Lukas

