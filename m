Return-Path: <kernel-janitors+bounces-5948-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7AC998811
	for <lists+kernel-janitors@lfdr.de>; Thu, 10 Oct 2024 15:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E0B3289F47
	for <lists+kernel-janitors@lfdr.de>; Thu, 10 Oct 2024 13:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC2D1C9DF6;
	Thu, 10 Oct 2024 13:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o2In1dVq"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C157E1BC9EE;
	Thu, 10 Oct 2024 13:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728567765; cv=none; b=n8MZGly+zuU8ESVsSGqfprV1hoGHVJZkMwRV1jOotWQbBQxMTOm8/xpOEHJTQ3ihYw4epRVQNJ5qYIU74TEOqr+DNYm+UTOFH6XR29lFi+3COECEzC4LYjMMqXMtp79U3aNXLUGeQKbeF//AT0BiOfmCyPqGmMAqUbtY+/FOT0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728567765; c=relaxed/simple;
	bh=QcT8ic8mTYdXmuI1an47O3S3l/JVKAa+7uNOyp7K+zM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RwKxlACMAmyZ4KBCpYTtnvY0x0Mh3+/d8mE8pRgZCIv9TySmxy9Ades5fNBA7QP3wNHr65v1wRy3IBaYlvqvdwC/dvQFlf5QXnl3R6811eARWDt/K7y0MLTsFvUMzj6Pgk0u0U+3Tov8E0H27iOQZ42GB18k3ih1gEMEGRBDC4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o2In1dVq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F433C4CECC;
	Thu, 10 Oct 2024 13:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728567764;
	bh=QcT8ic8mTYdXmuI1an47O3S3l/JVKAa+7uNOyp7K+zM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=o2In1dVqrRkxVu5KdltbBWjqdUAvSZwqWfv83RmSdFp3j4VMMIqLAocRTB7oT67tG
	 jLd/knq/Bl4tahGDrYSs0/VBHfo9UNsIXXE0rZNGd/kmPsrUTk3qGwLIFvEjs58MKW
	 khqgSeKQ3zQlH/wZ5lflSbwlbMn2C+bqrSE5ZvoVC/0SiQOj7a0KR7ITq352Kx5mQQ
	 V/w7MvLZbs2jPKknGotr313KiMMKv7lFWUGUjN62MrIn4nXaS0xWMj9aHV9dIpmsRn
	 WDRrmC0xmZNhOXcgoHv6CeFaJZRsGrrt17ir4Ph1KYfOrIBEVlZMvkXs+QJXEfzgVA
	 PKkJGdAzW9EWg==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, Lee Jones <lee@kernel.org>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240930112121.95324-8-Julia.Lawall@inria.fr>
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
 <20240930112121.95324-8-Julia.Lawall@inria.fr>
Subject: Re: (subset) [PATCH 07/35] leds: leds-gpio-register: Reorganize
 kerneldoc parameter names
Message-Id: <172856776277.2578206.11758617889948299526.b4-ty@kernel.org>
Date: Thu, 10 Oct 2024 14:42:42 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Mon, 30 Sep 2024 13:20:53 +0200, Julia Lawall wrote:
> Reorganize kerneldoc parameter names to match the parameter
> order in the function header.
> 
> Problems identified using Coccinelle.
> 
> 

Applied, thanks!

[07/35] leds: leds-gpio-register: Reorganize kerneldoc parameter names
        commit: 42507413bb32666dcbb19a876e4b73419b05a0d1

--
Lee Jones [李琼斯]


