Return-Path: <kernel-janitors+bounces-9297-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D78BB7F5D
	for <lists+kernel-janitors@lfdr.de>; Fri, 03 Oct 2025 21:14:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A29F84A82A4
	for <lists+kernel-janitors@lfdr.de>; Fri,  3 Oct 2025 19:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF1333E1;
	Fri,  3 Oct 2025 19:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SCmrMXi9"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E982010EE
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Oct 2025 19:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759518865; cv=none; b=rGiIaBnGVTYGkIO1RlzNdE5kAzUlilA4RjDEaE0E/k4SyJNUk6eWqiVng+b704mzXguwOp0VrJcXKl31umC4GTLOOMaT8eIPkZP2tO1HqsOMNgmsMeIETPQbhdcxlyXmIx/R9XrMQT70G8wns03BCm8IrdrU8ZgbHUwk1+jdFyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759518865; c=relaxed/simple;
	bh=wM8E2t2PyPo2w3LUbuBWPUtDU3mWIpKIkByA/b627eU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bMMfFmdfyoSUWRc/M62jToDBs+AL4R/q1vqvsRiXj2Epeet9zRK3qi4ct9uGtcjvR6b5s9N+uGWS9kjG44aolL4J0UB0nYkNKdOoamzD+3Zs5QbDE72lJfkfLXW/hF8gxSoApieURs/fA+EvjzdDBspwAcKFqpZt3VzyPy+s8Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SCmrMXi9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDFAEC4CEFE
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Oct 2025 19:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759518864;
	bh=wM8E2t2PyPo2w3LUbuBWPUtDU3mWIpKIkByA/b627eU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SCmrMXi96/f9fyDmkC6l9eNpD4vhA+J6mTlWy3ILPj9Ns1yuCbDis7J89fMFSrkix
	 Ok5mYHag9/ERJ8J44NCqTEPediQsajH7p2KveBZg60riOHBHtyIAFilBCCOHvfKQ61
	 37eogaJXKe2mwF0wATp/nZX5cF0ElNboQlu51gURqd0VZ9w+QUX6hfBmOa4+2APg1d
	 s9lE9ioyKJup07+vOrZO6siTPuzyswc2jvcZ1ZOMhPU2kS+5uwriQGUg7VBPIYdVeO
	 WMqRNWzfHROB52k6hBmUyKKZgxGcoitR1OAy8b5z8DyTQg2tP0FCD6rPq7YcWc+yYX
	 4rdiPOA1izt/w==
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-74c7d98935eso936871a34.1
        for <kernel-janitors@vger.kernel.org>; Fri, 03 Oct 2025 12:14:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMWtIxPG585HuhhKvpY15VhVGgZkjKVNPwA9lESKsBvHoC8LZlUY5+8vDdiPWIoZlG3V4MVJaFQ2J9H4I/+tg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFOyqyHyItwuxy0+dn7r5GtFYtbh8HTWTOmzuUMMDDtr+/8w+l
	MB1I7bGLnIi0RfwakV5oJgOYe4DElkcT8sqb379ZnZFSARsRfBQ8UfBiLUWZVsLtJnU5RFoSb7b
	6hg6+9TDvRH5p54qmFDP2L/N9AnGFufs=
X-Google-Smtp-Source: AGHT+IHjFueJwmZCPzEEQrYEyToCsx7SZmp0oolIw7/oeWakFUp+HZDJzey1qApWEzPUN5cDu+LOuynZY6GQWdkTl4I=
X-Received: by 2002:a05:6808:250e:b0:43f:7faa:cffc with SMTP id
 5614622812f47-43fc181b7famr1885948b6e.25.1759518864035; Fri, 03 Oct 2025
 12:14:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aN-Xe4lgox1cCAaR@stanley.mountain> <aOABtRxgm7maMsy_@google.com>
In-Reply-To: <aOABtRxgm7maMsy_@google.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 3 Oct 2025 21:14:13 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gtJjtf=YyprzEMUrYi0336nNPNkMFJeE-3+06Trv7M6A@mail.gmail.com>
X-Gm-Features: AS18NWDi6ZqVEv96YC-nThQax-rLJNBzaeAf5COT15CbhAKy4nQWbaIz9HTeous
Message-ID: <CAJZ5v0gtJjtf=YyprzEMUrYi0336nNPNkMFJeE-3+06Trv7M6A@mail.gmail.com>
Subject: Re: [PATCH next] PM: runtime: Fix error checking for kunit_device_register()
To: Brian Norris <briannorris@chromium.org>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 3, 2025 at 7:02=E2=80=AFPM Brian Norris <briannorris@chromium.o=
rg> wrote:
>
> On Fri, Oct 03, 2025 at 12:29:31PM +0300, Dan Carpenter wrote:
> > The kunit_device_register() function never returns NULL, it returns
> > error pointers.  Update the assertions to use
> > KUNIT_ASSERT_NOT_ERR_OR_NULL() instead of checking for NULL.
> >
> > Fixes: 7f7acd193ba8 ("PM: runtime: Add basic kunit tests for API contra=
cts")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>
> Thanks for the catch:
>
> Reviewed-by: Brian Norris <briannorris@chromium.org>

Applied, thanks!

