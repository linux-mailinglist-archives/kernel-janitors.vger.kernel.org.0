Return-Path: <kernel-janitors+bounces-9964-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53719CFE5E3
	for <lists+kernel-janitors@lfdr.de>; Wed, 07 Jan 2026 15:45:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9488E301723C
	for <lists+kernel-janitors@lfdr.de>; Wed,  7 Jan 2026 14:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D776349B1A;
	Wed,  7 Jan 2026 14:38:37 +0000 (UTC)
X-Original-To: kernel-janitors@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF80349AFA;
	Wed,  7 Jan 2026 14:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767796716; cv=none; b=LnjJjdtvhivwQ863fvk0fnJeMqVkcbFfDREsnCU6nIVpzXYtgzIb5JWE5YxXggUUdX5f+BxiD0Pru1yEiGDaOK3p4L28nmaEXE73D/qtVKgyD0YM8Nywwm1aXlVhY+ZBVL8qcS0bHzu/PhLRMAKrLbRFEyXl85o3kj7lye17do4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767796716; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HEk+4K5JRwKcuMdWvPRwkdfKjnXJRX3rOvx8nfco4ExcHTAR402iqN44SXGsTkhS0iCqT3FjSkUCgsFLuFjivP8gkPKGOS3xrZxOxp1/dcbqZ9+tHr6OimgRJ6Sy/XumgcSGsMnOlaQ6Mbk1cMEd2a1Qt6CYiDAe0VOPkSGB134=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8881A227A87; Wed,  7 Jan 2026 15:38:32 +0100 (CET)
Date: Wed, 7 Jan 2026 15:38:32 +0100
From: Christoph Hellwig <hch@lst.de>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-nvme@lists.infradead.org
Subject: Re: [PATCH] nvmet: Constify struct configfs_item_operations and
 configfs_group_operations
Message-ID: <20260107143832.GA14904@lst.de>
References: <82fd284cf70cffd374f5889a5c2a1f3800bafab3.1766495484.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82fd284cf70cffd374f5889a5c2a1f3800bafab3.1766495484.git.christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

