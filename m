Return-Path: <kernel-janitors+bounces-6003-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D444D99B328
	for <lists+kernel-janitors@lfdr.de>; Sat, 12 Oct 2024 12:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F1D81F23A3C
	for <lists+kernel-janitors@lfdr.de>; Sat, 12 Oct 2024 10:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CEC4155327;
	Sat, 12 Oct 2024 10:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m9qg3qSx"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE562153801;
	Sat, 12 Oct 2024 10:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728730291; cv=none; b=EfNZ69jCBFrgzqhjDw83bbi8tJYNErEXf61rVCvB47U7vXcEFvq3DliCFgVq16g3dY4B49v4B5inJRgBvWo9XR4oWEOUdM1u7L0PF+ASZYMx4A8gCsPF0gFhJNAlx9tHxlIt+Lqtel/p3T6fNWyfdQtdRnQLJrqPVeqYl/1eop0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728730291; c=relaxed/simple;
	bh=cWkgJyHchFqQkQzMAty5VXFu0OvWDcKpssWdpuQVmlk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uH/mz6ghRyA4wsWk1RDAXB8wm5Aw41gSDNz7q6B9zfpDrvoi77YkXWdH8+eQC4QivNB0UzdLybYx4rdvKOWEoSfa9OdoZCpNYASM5CYkFOzWkSGxseGRZwHRjTFRXEesGRaP4jBE2KzjcFhU814VX6Lf+ypSzXCTR9ZB3bmIkl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m9qg3qSx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6AA7C4CEC6;
	Sat, 12 Oct 2024 10:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728730291;
	bh=cWkgJyHchFqQkQzMAty5VXFu0OvWDcKpssWdpuQVmlk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=m9qg3qSxqZu+Ez3HFM+bg1WbTdOuzqgPXL6xSLLH7WXmPp74fQ+Bgo4JDNEDal+DU
	 +v0wh8owWsB0aJsIREvvsF2oCzTEuMP61WoU72qRnh+eWlsX9p41+kx7PMrgEa0Ouq
	 b9stQKrznha8WmoIBdcliua87Bz1Cg/B46Ch2vRkMtyOLBgoxHv4Zmy4S4R7orNTEu
	 y/b+2V81W/4RWczgFqNlTvEU4ihQfDn0EbaFWVi20cVdmvaZ3lcoCXHWNcX9Y9xKdv
	 4C+74mlE8vySg8SkdHv4mTL8DbXIZKFX2vP33IXRdKsw0LdspvvI9aBSIXZWgOT9jL
	 Gic6VY5ZL5XJQ==
Date: Sat, 12 Oct 2024 11:51:21 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Julia Lawall <julia.lawall@inria.fr>, Su Hui <suhui@nfschina.com>,
 jagathjog1996@gmail.com, lars@metafoo.de, nathan@kernel.org,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 benato.denis96@gmail.com, Jonathan.Cameron@huawei.com,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iio: bmi323: mark bmi323_ext_reg_savestate as maybe
 unused
Message-ID: <20241012115121.037be954@jic23-huawei>
In-Reply-To: <e210f9c6-9070-4b6d-b938-9a35b7a16380@gmail.com>
References: <20241012083701.2189663-1-suhui@nfschina.com>
	<alpine.DEB.2.22.394.2410121110540.8471@hadrien>
	<e210f9c6-9070-4b6d-b938-9a35b7a16380@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 12 Oct 2024 12:08:39 +0200
Javier Carrasco <javier.carrasco.cruz@gmail.com> wrote:

> On 12/10/2024 11:11, Julia Lawall wrote:
> > 
> > 
> > On Sat, 12 Oct 2024, Su Hui wrote:
> >   
> >> When running 'make CC=clang drivers/iio/imu/bmi323/bmi323_core.o', there
> >> is a clang warning as follows:
> >>
> >> drivers/iio/imu/bmi323/bmi323_core.c:133:27: error:
> >> variable 'bmi323_ext_reg_savestate' is not needed and will not be emitted
> >> [-Werror,-Wunneeded-internal-declaration]
> >>   133 | static const unsigned int bmi323_ext_reg_savestate[] = {
> >>       |                           ^~~~~~~~~~~~~~~~~~~~~~~~
> >> 1 error generated.
> >>
> >> Mark bmi323_ext_reg_savestate as __maybe_unused to silent this warning.  
> > 
> > Why might it be unused?
> > 
> > julia
> >   
> >>
> >> Fixes: 16531118ba63 ("iio: bmi323: peripheral in lowest power state on suspend")
> >> Signed-off-by: Su Hui <suhui@nfschina.com>
> >> ---
> >>  drivers/iio/imu/bmi323/bmi323_core.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/iio/imu/bmi323/bmi323_core.c b/drivers/iio/imu/bmi323/bmi323_core.c
> >> index beda8d2de53f..1167984809c5 100644
> >> --- a/drivers/iio/imu/bmi323/bmi323_core.c
> >> +++ b/drivers/iio/imu/bmi323/bmi323_core.c
> >> @@ -130,7 +130,7 @@ static const unsigned int bmi323_reg_savestate[] = {
> >>  	BMI323_FIFO_CONF_REG
> >>  };
> >>
> >> -static const unsigned int bmi323_ext_reg_savestate[] = {
> >> +static const unsigned int bmi323_ext_reg_savestate[] __maybe_unused = {
> >>  	BMI323_GEN_SET1_REG,
> >>  	BMI323_TAP1_REG,
> >>  	BMI323_TAP2_REG,
> >> --
> >> 2.30.2
> >>
> >>
> >>  
> >   
> 
> This issue has already been found and discussed here:
> 
> https://lore.kernel.org/linux-iio/AS8PR02MB10217F8B5827B69E6438488679C762@AS8PR02MB10217.eurprd02.prod.outlook.com/
> 
> where I got lectured by Nathan Chancellor about such warnings.
> 
> The fix was not marking the array as unused, because it should have been
> used. The proper fix can be found in iio/fixes-togreg.
> 
> Best regards,
> Javier Carrasco

Busy week so I haven't gotten a pull request out yet. Should send one with this
fix later this weekend.

Jonathan


