Return-Path: <kernel-janitors+bounces-6925-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A8AA193D1
	for <lists+kernel-janitors@lfdr.de>; Wed, 22 Jan 2025 15:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7DC83A3D51
	for <lists+kernel-janitors@lfdr.de>; Wed, 22 Jan 2025 14:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D996213E8E;
	Wed, 22 Jan 2025 14:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KM4U9PMd"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F331C4604;
	Wed, 22 Jan 2025 14:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737555869; cv=none; b=uROYatR9Lm+E7JNevVz2DUs5IykT78ayEuBJY//XEYhNHbSs/eUiLiibM/1QP2bZmV63vZxbDRvoxfVuCOyVcKyVfL1onGzsMvla73C1VvG7c0VTYaKwnYXQnAyqSF2a1XFuei3rbpFNsAhcsjcl/VvCua5aKuzZp0bFNsCYN0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737555869; c=relaxed/simple;
	bh=k3EtP2MZDpS09SDsW5P67dHVHXE3A1k2aezP5m1ZLkk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pGf/GxTe+SiGkl9kQTourL/CwIAMdCLLWw16kc2cgQAr8ucSE1+uaXsr9PI/cJKb/bns+rD7y1Fhrgrhb+xIeVMcJrDmVn2ypvoKKLkymE4Y9L354GNzOuuruF2ud7j6Oa8d8bMiaRRcHljfv8vPVMSVrLSpWegHOvG+2YnY2MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KM4U9PMd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84983C4CED2;
	Wed, 22 Jan 2025 14:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737555868;
	bh=k3EtP2MZDpS09SDsW5P67dHVHXE3A1k2aezP5m1ZLkk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KM4U9PMdmMAaxXtd9sW5aLZd6DSfU0s44SC0QVQ4CNu1xYZTJHolCXl0tUrPks0lY
	 cFiK5sce9cMX1jhV630rjDe0tRkYuszWItjux7WzkDn75Np9o/t9lTaR1vR3eVoYRT
	 SnBCu00To3ZqyV0DwvFIEYgjd6EUNzURvWVA6935nX71x/1nKcoNBJRWLyIhI3j5Sl
	 VyLGABCiHcBzrRHQmxNmx4OJ6I3oR556YDmpJeY+kZoYcE/cT6zhoeHzxfTxcedhWL
	 wsvfp3h1V/1g2PGfnyYJzPvcdw4hlXcsv7mIzB3swWp/0yKGQuDDfdmvPbZ8WwgObx
	 m16TVxq3RuJEA==
Date: Wed, 22 Jan 2025 06:24:27 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Thomas Graf <tgraf@suug.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] net: netlink: prevent potential integer overflow in
 nlmsg_new()
Message-ID: <20250122062427.2776d926@kernel.org>
In-Reply-To: <58023f9e-555e-48db-9822-283c2c1f6d0e@stanley.mountain>
References: <58023f9e-555e-48db-9822-283c2c1f6d0e@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 22 Jan 2025 16:49:17 +0300 Dan Carpenter wrote:
> The "payload" variable is type size_t, however the nlmsg_total_size()
> function will a few bytes to it and then truncate the result to type
> int.  That means that if "payload" is more than UINT_MAX the alloc_skb()
> function might allocate a buffer which is smaller than intended.

Is there a bug, or is this theoretical?

