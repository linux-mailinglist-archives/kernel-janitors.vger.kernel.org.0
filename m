Return-Path: <kernel-janitors+bounces-3091-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4DC8C3306
	for <lists+kernel-janitors@lfdr.de>; Sat, 11 May 2024 19:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFCC6281B92
	for <lists+kernel-janitors@lfdr.de>; Sat, 11 May 2024 17:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9DC1CA9F;
	Sat, 11 May 2024 17:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bg3OttkP"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE6E17588;
	Sat, 11 May 2024 17:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715450014; cv=none; b=YlkWYI/ZRhlFB+kWLC5DV9/VAhB5ORKwhmdpIpFRzSf7Bzj2H8PsCmJ+T6LxKYoteeNk1jpoksUcRMQGtEGFxIUqJSX31H5zBw/bcjDF0X2rzGWdpS0Qd2jZ7EfDbO5pT+3dy4XIXOhU31jFCHdJzygsORyD51yzUTjEBZzaXI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715450014; c=relaxed/simple;
	bh=35okiB1iB8bZt1zztcxMY+1mWKZVmAt1sMm6fXCVHRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LbuTypLY98lsWNkT922arSd6Gdzn4MXx5gif3Nu4GP9ZCbOJ02cQrWl1xr7g0DXVAWfxwBKqkzWLFZBlhBf5KB+jbAVPuKooqCwp+Pwl0zQPLfTyXpHR+bxbZrCCexJ2q4R0JFrkIm7PQAytS2yVxbxM+dKb0OyMsEKjIBpeub0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bg3OttkP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A705AC2BBFC;
	Sat, 11 May 2024 17:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715450013;
	bh=35okiB1iB8bZt1zztcxMY+1mWKZVmAt1sMm6fXCVHRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bg3OttkPGY5388kU5cRBN8zJrPnSYv4QnuR6ArCOC6Jb6bvj4UifjggL8mJqDD+mC
	 xUuHqSxQXamYha0GlLqw3n5k1ACfUbwMAdYTeUFN4wco5/TMaUzz2mtTv99riFSCKk
	 IB98jI7lWiGOOaIRJRyEXS1LinqUwneHHdTux7DByvW03ZXCCZMwuiwRHXA0BY9bAE
	 q1Xyk9t7ljOy+JgV5jxzDiK2WXIKboS1ny7SFNCF4iTtj3tEXq4NwpylMtzgncG/6T
	 KpKTVSqsR9ASfYguvWPbJGKK3t1jvDA5ZOMgKsq48MMj2fH1BOn9dhTaHSmg7UeZ81
	 LYKiaU3BoX3wA==
Date: Sat, 11 May 2024 18:53:27 +0100
From: Simon Horman <horms@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] virtio_net: Fix error code in
 __virtnet_get_hw_stats()
Message-ID: <20240511175327.GT2347895@kernel.org>
References: <3762ac53-5911-4792-b277-1f1ead2e90a3@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3762ac53-5911-4792-b277-1f1ead2e90a3@moroto.mountain>

On Fri, May 10, 2024 at 03:50:45PM +0300, Dan Carpenter wrote:
> The virtnet_send_command_reply() function returns true on success or
> false on failure.  The "ok" variable is true/false depending on whether
> it succeeds or not.  It's up to the caller to translate the true/false
> into -EINVAL on failure or zero for success.
> 
> The bug is that __virtnet_get_hw_stats() returns false for both
> errors and success.  It's not a bug, but it is confusing that the caller
> virtnet_get_hw_stats() uses an "ok" variable to store negative error
> codes.
> 
> Fix the bug and clean things up so that it's clear that
> __virtnet_get_hw_stats() returns zero on success or negative error codes
> on failure.
> 
> Fixes: 941168f8b40e ("virtio_net: support device stats")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Hi Dan, all,

Strictly this is doing two things.  But I agree that the "ok" variable in
virtnet_get_hw_stats() was very confusing, and I'm not sure how long it
would have taken me to grasp the fix without that change being here too.

Reviewed-by: Simon Horman <horms@kernel.org>


