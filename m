Return-Path: <kernel-janitors+bounces-6121-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5226B9A129B
	for <lists+kernel-janitors@lfdr.de>; Wed, 16 Oct 2024 21:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CC402865F5
	for <lists+kernel-janitors@lfdr.de>; Wed, 16 Oct 2024 19:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417B22144CD;
	Wed, 16 Oct 2024 19:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fto4zm8j"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBDA1885BB
	for <kernel-janitors@vger.kernel.org>; Wed, 16 Oct 2024 19:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729107189; cv=none; b=ZB/AyyX3qEXnJxLTp/drcs4/hScAchFKnhYktpYcEkdkdqFCk2uFmzRhbH8OW5f6WnLEsg6iYbjMfIJBBaJtAc1dTPSsjwkgpqb/z5ZF1xaHv8sE31ju2XVDhaAUWjiydfAg67oIxyH8cro6SZhhgcVLwvrg/utHuotOOPhe6Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729107189; c=relaxed/simple;
	bh=A0/ojgL2fvBi172Wbp3BrgprcWdWI/pifihLOrfrqFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DyfS+s47/59THDC8oQp8hcnpl/wLrmhsSPwYJOnuZ/6hh1egxYHE/OZFdiLaNnR6+buL39ELLMAuX73A54fvEefwDpQZ+Qgt5azCvbUM2yxCcxEGbFnYHVqknQOTMUy5hLJWY+cl8DiB7Ycvml2xIotMkb+xHALHahzwHbY75cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fto4zm8j; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e1f48e7c18so2299367b3.3
        for <kernel-janitors@vger.kernel.org>; Wed, 16 Oct 2024 12:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729107187; x=1729711987; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0/ojgL2fvBi172Wbp3BrgprcWdWI/pifihLOrfrqFU=;
        b=fto4zm8jEXnrZwyrpLSk5wFdsLKwuNQ/MKYiEiwgJu3nGAyxURoDzpcc6WuvQ5EPlG
         TreAAUM8XekH1LN01v64Yz2d7TQO+rZtNRKQTKCPT07zskLzxDeoViqpLEfgaRSdv2S9
         lugKzScVhNtzA3qj4wIDd82kJYoWmapBCb2k7mVTe6Py9AcN6Ncem8iDFH33q5bQMj/9
         DNshxbxJJ4pTbjPG0mg0AKDBXA3O79cstPamh4zVOpO0SLMbmVvyUCc1rqbGS3p/vgh0
         YX4sXDk3T7Ul1BYZ9wIsDq6UumjJMPGw+N3/rOraIYe7t9vhK/3wAtCSWmUwm4oNMZ8g
         bKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729107187; x=1729711987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0/ojgL2fvBi172Wbp3BrgprcWdWI/pifihLOrfrqFU=;
        b=Zjz7vOpOIly2PE4eiMLM+hAaDNaKUtiiZ9ooUZf2u4MXdJQvtbld2lNIAD+BYKPsgH
         BfejMlxMreNiQ198DGcKHW0hKR3XFplSppjJ/8Surqqfa0oKYG/7FlYb5+M6eNvVOB6m
         4EvdAlp68KgmEiwT6IvrC2aPCr2MuMH19GL9Qr56zBbGD7AAtKOGzGbSp//sjEebNmh2
         aEu1M2yDpHjgOYlH0fBMfnmF2yA5Z1VkQAFY8aMqk4LyCQZGHa4XtVP9sjzSLB2L6pYo
         HVz+tcVPkvzSNrALy9xqp6OIAdlOXevCOKeQ7gQaQ+JWv2ApUEjsPUUPmq9Eo1yhbWqp
         Hxpg==
X-Forwarded-Encrypted: i=1; AJvYcCWyBV7b47J7XzlxYdbb4BzyhjZuWX69c4DRKDwR2wuidx62AgD6Oa4yyAslkNA/fAMWzCQ2hfRTI/+AQHYe1fc=@vger.kernel.org
X-Gm-Message-State: AOJu0YznRiAlHMWLPdOJzCX16xBPMgHo59aqibtAuxlk6RsOaFiItCZK
	2yMar3l6+Vr/vLo5ei7GM+oCeo9ZUZtauQFPYPspj7s7dpdjVusrH6qrJSXqyUKm/i08ZmHTF7I
	+5mEMQ1BQy9hgoankrVH98vTH2Vvs9Ny4NfD+Hg==
X-Google-Smtp-Source: AGHT+IGX07jif9j6w8MTv7ARHJ9/+lXGQIE504CDxiXkTKXqPtoikEAqB670DW1Rp7uFgjkSTFhaEJvJ5+tdTlNVD8w=
X-Received: by 2002:a05:690c:388:b0:6e2:e22:12d9 with SMTP id
 00721157ae682-6e3d41d08c3mr58083187b3.35.1729107187330; Wed, 16 Oct 2024
 12:33:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016155655.334518-1-colin.i.king@gmail.com> <CACRpkdYhsnRSOgdrDKp7BNqE4TpY3r--cPByFMsq0VRRjW-sAA@mail.gmail.com>
In-Reply-To: <CACRpkdYhsnRSOgdrDKp7BNqE4TpY3r--cPByFMsq0VRRjW-sAA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2024 21:32:55 +0200
Message-ID: <CACRpkdYxsGC5Yay0dOaQEegrLKKkLrcivX7_GVpfQsEa=psdDA@mail.gmail.com>
Subject: Re: [PATCH][next] pinctrl: th1520: Fix potential null pointer
 dereference on func
To: Colin Ian King <colin.i.king@gmail.com>, Kees Cook <kees@kernel.org>, 
	Kees Bakker <kees@ijzerbout.nl>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 9:31=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Wed, Oct 16, 2024 at 5:56=E2=80=AFPM Colin Ian King <colin.i.king@gmai=
l.com> wrote:
>
> > The initialization of muxtype deferences pointer func before func
> > is sanity checked with a null pointer check, hence we have a null
> > pointer deference issue. Fix this by only deferencing func with
> > the assignment to muxtype after func has been null pointer checked.
> >
> > Fixes: 1fc30cd92770 ("pinctrl: th1520: Factor out casts")
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>
> Patch applied, added Reported-by Kees since he mailed about this too.

...which was actually the "other Kees" (Bakker), not the one the mailer
suggested.

Yours,
Linus Walleij

