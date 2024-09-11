Return-Path: <kernel-janitors+bounces-5348-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F3B974CF4
	for <lists+kernel-janitors@lfdr.de>; Wed, 11 Sep 2024 10:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A940D1F2530E
	for <lists+kernel-janitors@lfdr.de>; Wed, 11 Sep 2024 08:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420D0165F11;
	Wed, 11 Sep 2024 08:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ghH8ImbF"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9287014EC56;
	Wed, 11 Sep 2024 08:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726044226; cv=none; b=VNNXPhN2blMAmJfvY6NaFvz2TOxdY323lCr+I+UXZyAmCPR3WU3pLHV+miziLo99ap9gZdmQLuxobcz8nHhRqSpYUn1Jt1hysrVtu2K+lPJy/eSdRaVcjhGB3TUcd5A/ajxFk+FLJFm75pfGa7G5SZdLNaZLWGVi/V5qaCPqS70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726044226; c=relaxed/simple;
	bh=0K16q2yg7NdxFs96Mj9ki+abCT2VgM2fvWRBf7Du15A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MiL34PQzYq+ZNdylrnLuIYkFl69Ixoz6jAIS86nMnjB/D8i5Whpk+pDQBef+ahWNQ+NVjWh9ljBtnYAvHSWhwlM3XxW5DFlf6RtSlz72KclqcPAc0o+rnvAIn/v3WClPpCN0TwrXn+StY3+O6hO+UFJTyESglZSRu1LjTkRYoDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ghH8ImbF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C3BC4CEC5;
	Wed, 11 Sep 2024 08:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726044226;
	bh=0K16q2yg7NdxFs96Mj9ki+abCT2VgM2fvWRBf7Du15A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ghH8ImbF2tvjT1zY/d5sWyH5O/qm1pqHZhzyfqIQUKV8BCFcTDgJyOQtZr4y7Qr/X
	 fLrImfuo/SFkmnP4ugIuAJoGRyjs/rt+lOP9l4BbuMBygIkuAh7SBoSqpZ+nXgocS8
	 5VJyX2dVpX9c8UAjEZ1yygBSz6i9EDhxBFxl5hky+h8e2QvQaAayfzUEybXtvIOYP4
	 NZbJF3bn/JUR3VfU4hFtsXFAyivuJqhNIXrMkr0J0dBq/X2eUQyP6SAupXrn+pK5UV
	 ojtiZRMVk+6YY2T8bGFyCUA2ehnlL/8KiyoZBo6vrkVC8zm3bj176irtlClkoVEE0u
	 GDpIIt3Nxjh9A==
Date: Wed, 11 Sep 2024 09:43:41 +0100
From: Simon Horman <horms@kernel.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Shahed Shaikh <shshaikh@marvell.com>,
	Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next][V2] qlcnic: make read-only const array key static
Message-ID: <20240911084341.GN572255@kernel.org>
References: <20240910120635.115266-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910120635.115266-1-colin.i.king@gmail.com>

On Tue, Sep 10, 2024 at 01:06:35PM +0100, Colin Ian King wrote:
> Don't populate the const read-only array key on the stack at
> run time, instead make it static.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> 
> ---
> 
> V2: re-order declarations for reverse christmas tree layout

Thanks for the update.

Reviewed-by: Simon Horman <horms@kernel.org>

