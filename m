Return-Path: <kernel-janitors+bounces-692-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D82818122DE
	for <lists+kernel-janitors@lfdr.de>; Thu, 14 Dec 2023 00:31:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD3B71C213EF
	for <lists+kernel-janitors@lfdr.de>; Wed, 13 Dec 2023 23:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0052977B55;
	Wed, 13 Dec 2023 23:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I30m7AyQ"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265F377B3E;
	Wed, 13 Dec 2023 23:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90793C433C7;
	Wed, 13 Dec 2023 23:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702510310;
	bh=CYk4Vn37Odwag4wylcBdb225KIeTYI7q2wSlTu85hdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I30m7AyQlDx9+eOJ4Grr7Cv4oJvb1XEse2Ae6Rg+wgwpdflFFnXbtpzRA+jaQ5VvR
	 2ROuq0RDMTIuiTSa3osxLKzMHhiWM2Wi99JJcG2aWJtNZo0gXns09T7WjGbqoHfnJq
	 OM88ed89CqaBkm9FRod8k8VnDKCKUnyD/7yf5pdFqgMq7biGqQV3ZEYpPuLEcZZq8F
	 qCeRvmsV4ifBZo4kEYT0umqWRunSZ7zcZ5qc2lfHEULA3qF7ozNHEOGyw94ZQ4L0M/
	 9rUnrFoXYRrvZlaUhEof+jK1Ul/4IcY4YAtXhiU259z+Tf8EYW4JptZzAcgo0IkMfI
	 HzapnnNbI4mIg==
Date: Wed, 13 Dec 2023 15:31:49 -0800
From: Saeed Mahameed <saeed@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Paul Blakey <paulb@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Oz Sholmo <ozsh@nvidia.com>, Roi Dayan <roid@nvidia.com>,
	netdev@vger.kernel.org, linux-rdma@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net 1/2] net/mlx5e: Fix error code in
 mlx5e_tc_action_miss_mapping_get()
Message-ID: <ZXo-5VfdXg6fq-oQ@x130>
References: <133f4081-6f34-4e3b-b4b5-bacd76961376@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <133f4081-6f34-4e3b-b4b5-bacd76961376@moroto.mountain>

On 13 Dec 17:08, Dan Carpenter wrote:
>Preserve the error code if esw_add_restore_rule() fails.  Don't return
>success.
>
>Fixes: 6702782845a5 ("net/mlx5e: TC, Set CT miss to the specific ct action instance")
>Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>---

LGTM, both patches applied to net-mlx5.
will send the PR shortly.


