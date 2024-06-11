Return-Path: <kernel-janitors+bounces-3857-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 200C9902FA1
	for <lists+kernel-janitors@lfdr.de>; Tue, 11 Jun 2024 06:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA9051F228C9
	for <lists+kernel-janitors@lfdr.de>; Tue, 11 Jun 2024 04:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC66170826;
	Tue, 11 Jun 2024 04:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EVDnOIBP"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF37273FD;
	Tue, 11 Jun 2024 04:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718081406; cv=none; b=K8D5nqle0sq9sU1+up7r1hpGCfQlYrYw3xF/PnFP92Gc/l6r+yDjqSz7oHrPGlzDYiF9SniEmC0/2QkOLyP+rkeKlhOBbqVVJM9Uj2ek39KFaM6GEAoR2E+lQAwsS5W87gCk+i8A+bgp5vWlpHNuB937KDH0LyOm6WguPgVzCy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718081406; c=relaxed/simple;
	bh=fhiqhwMweK+/4ZbARswR9y0qIPwLtuAc6LuQokfQbd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TgFnVhwEk2FX9HBhLQ31PbMZI6ctVbfead2tm1IZW7EhGPBxGm9Gcb/f+azeakZH2rGZ0x3fBYanZ34uS7QfWn1C3X5KAuGEDfL3QfdwG8i8cPAQjLf+INgbLw/Bt64GSFychnHp1i7VCfzrUL8vWoUnYvHlxQ3VSEEf/1Ilc8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EVDnOIBP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC387C2BD10;
	Tue, 11 Jun 2024 04:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718081405;
	bh=fhiqhwMweK+/4ZbARswR9y0qIPwLtuAc6LuQokfQbd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EVDnOIBPvdzyROc47k68wnBIflyy4I5rxC1SZq5uXTypCAf1LL+V91T+6qzZnviAB
	 pAr+zOgw5FEo73bLbAYD92lx+rrYnTmKfnCDE1sHGg9eZLGmFOTBSEP3JjA+Zjdzf1
	 H6oqON40Fz8ZAlQNT2EMjCOgOq18jKUeJYP6L1xi5DWC3EaOHemMtlqpaPk3zfI7Ij
	 VhL93ssqa6WrNMElgNXcl+aB81QX26UOColiALVrmWW9v4yqElIwfE7MGb+/xcog79
	 y9MBQ92ZzYnnbeRglzVuxehP0oFUF4KXGHeIMRO6gFd2xi8AiTq+aYZpd4OAfN8Gnv
	 uU+5JhgSywt0Q==
Date: Tue, 11 Jun 2024 04:50:02 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] firmware: google: add missing MODULE_DESCRIPTION() macros
Message-ID: <ZmfXeqCIt91OY1i0@google.com>
References: <20240605-md-drivers-firmware-google-v1-1-18878de97fa5@quicinc.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605-md-drivers-firmware-google-v1-1-18878de97fa5@quicinc.com>

On Wed, Jun 05, 2024 at 03:07:21PM -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/gsmi.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/coreboot_table.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/framebuffer-coreboot.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/memconsole.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/memconsole-coreboot.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/memconsole-x86-legacy.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/cbmem.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/vpd-sysfs.o
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-firmware-next

Thanks!

