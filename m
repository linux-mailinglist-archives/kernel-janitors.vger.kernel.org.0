Return-Path: <kernel-janitors+bounces-3951-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F26BA9061C9
	for <lists+kernel-janitors@lfdr.de>; Thu, 13 Jun 2024 04:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D4A4282DEC
	for <lists+kernel-janitors@lfdr.de>; Thu, 13 Jun 2024 02:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7413B12BF01;
	Thu, 13 Jun 2024 02:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lXHSbe7L"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5521C7F7D5
	for <kernel-janitors@vger.kernel.org>; Thu, 13 Jun 2024 02:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718245688; cv=none; b=HjdMa4REUtpk2OiW8pFv4BaESsPY4kM1+4yN1P3NizS0zeVuLZd7LoPwqgR5ROK9AWlr2PRd+MwRXTxbGq2QO0O2E/3z0abLeeV+CHAzAbftM7H9cxBVmZjFMYv2WSUTUZfCQ3HLZo8bim14zqeyzlQmvzBmg/7Wr++ZWB2gUb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718245688; c=relaxed/simple;
	bh=wQjkzUNkQvO1QQTmzJdFmOhe3eLsPajk6NuewFDYhho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z4sfghwpnJotqI5i5w8g1MQDb5hyq6/8bwO0oEGwg822uzmvylYQroR6wKJqntI3MyPOcFOP6lA/cnkRoTwg2m5f2ja8LRSDE1VRj1OVOxsVVN6t10MR7HNYuatlwtH4fKMY//E5DB9GuRT0jepk3hNKE12ku61rhj9/+Pn5wjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lXHSbe7L; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dfdd394506dso553213276.1
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Jun 2024 19:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718245686; x=1718850486; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqJHo/nm4dwxUT1vSJWjZGt/TMqLX57toHgV/NshWrQ=;
        b=lXHSbe7LNXHBacSXwHO3BVwXmEhvaDObH/A650gblHD4dlFqbw1LLGtQxWBNoTlZkq
         Px/3HazDGJvD7z44wNSzLtF+ngF89zyxk8F3UEFT0rujB6nqWI9l4Fzt5WeSnW+IUP74
         r1a4rq72vPKGQv1CPmp9lon25H1x7dIut8ZcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718245686; x=1718850486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqJHo/nm4dwxUT1vSJWjZGt/TMqLX57toHgV/NshWrQ=;
        b=UcG8CL8pTT6H6fHO1NhjVHRLQJ+e5PUlWrDKUexWJba1Qddowp09Fqj+cLw9dydQv/
         KUz2xcgnvLE0vYpKGB63ERdRsGnMF3+eWcXTxRo2opZx+s5WxRC//tHSjD7c6Kzq22LN
         RJJrZ1kd5b0QlfedXuFT18Z7l8a1l5HCd/uKSj6eQTa0fGYzl6MLwYbrRG37Dd/X1MLQ
         is+gD6qKQcvQGaViCGCK9lJKhUBAJX0FkWAuyDJNh0d+DAIwjQgsAkT+8h3m6fi+L3Tk
         JxkY3ShZXXQKDTd51WLQrHXiMRowYiJ6lDuqVswUS7limzjXBWRFI/RozRwDH4NpZVVN
         VoNA==
X-Forwarded-Encrypted: i=1; AJvYcCUCx93bb55j/QYzycmFWEWnfggWse6JamZnpLrej8Sf+fB1QG+C+0j7B43MG/sviEdZua2NTexIAKxYD1GJyIAuv2VvuCsuPTGGwUMNfNi3
X-Gm-Message-State: AOJu0YwRfV79TxCise6r+M4F+PLCxymjvyUfBGhQ0BkU0MXu1lXZW7b/
	fLf2ewY/t7ZEGwLoI5ePXNu+kYj2e7tT+vzR060Z1t1knfRNrfBrAdpV7AIlbTd3Y/34yGckVZ6
	vXqXd
X-Google-Smtp-Source: AGHT+IEUPmeXvblZTldoQ0Lc2sgnxoWi4EkAc2X3RkzJSP3kjuw+LCDm/tL5vixt0S6uXbHaHydgrA==
X-Received: by 2002:a25:fe05:0:b0:dfa:5703:abf5 with SMTP id 3f1490d57ef6-dfe66a67763mr3205091276.20.1718245685788;
        Wed, 12 Jun 2024 19:28:05 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dff046686cbsm59735276.13.2024.06.12.19.28.05
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 19:28:05 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dfdd394506dso553204276.1
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Jun 2024 19:28:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVjIxXgUF+lYB5Hrr3Y72bnpum2q+ypPziGjKuyjNQ07irL+qWO0kTrW1taLYdExBhdEdUNfhXxTk4oieF79lnD5f4812r0QPnGbBMwKsLc
X-Received: by 2002:a5b:605:0:b0:dfb:157:e69b with SMTP id 3f1490d57ef6-dfe6606f3cdmr3375488276.12.1718245685102;
 Wed, 12 Jun 2024 19:28:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240612-md-drivers-media-common-videobuf2-v1-1-4625ab172fd9@quicinc.com>
In-Reply-To: <20240612-md-drivers-media-common-videobuf2-v1-1-4625ab172fd9@quicinc.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 13 Jun 2024 11:27:22 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Bdh6Lsje-71_HDK9T141jMNeNh1v400ukUVn1L5WO-kA@mail.gmail.com>
Message-ID: <CAAFQd5Bdh6Lsje-71_HDK9T141jMNeNh1v400ukUVn1L5WO-kA@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2: add missing MODULE_DESCRIPTION() macro
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jeff,

On Wed, Jun 12, 2024 at 11:46=E2=80=AFPM Jeff Johnson <quic_jjohnson@quicin=
c.com> wrote:
>
> With ARCH=3Dx86, make allmodconfig && make W=3D1 C=3D1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/common/vi=
deobuf2/videobuf2-dvb.o
>
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
> While doing these cleanups, in most cases I've taken the descriptions
> directly from code comments, Kconfig descriptions, or git logs, but in
> this case I didn't see a nice concise description so I invented this
> one. Please suggest a replacement if this isn't an appropriate
> description.
> ---
>  drivers/media/common/videobuf2/videobuf2-dvb.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-dvb.c b/drivers/med=
ia/common/videobuf2/videobuf2-dvb.c
> index 8c15bcd07eef..6f6650183184 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dvb.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dvb.c
> @@ -19,6 +19,7 @@
>  /* ------------------------------------------------------------------ */
>
>  MODULE_AUTHOR("Gerd Knorr <kraxel@bytesex.org> [SuSE Labs]");
> +MODULE_DESCRIPTION("Simple DVB helper framework for videobuf2");

Thanks for the patch!

Looking at the header at the top of the file:

 * some helper function for simple DVB cards which simply DMA the
 * complete transport stream and let the computer sort everything else
 * (i.e. we are using the software demux, ...).  Also uses vb2
 * to manage DMA buffers.

I think I'd call it "Videobuf2 helpers library for simple DVB cards".
But maybe we could have some DVB expert comment on this. :)

Regardless of whether the description stays or changes, feel free to add

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

