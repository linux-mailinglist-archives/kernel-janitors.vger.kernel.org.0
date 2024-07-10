Return-Path: <kernel-janitors+bounces-4561-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C8892CADC
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Jul 2024 08:17:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D801A28674D
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Jul 2024 06:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A591E664C6;
	Wed, 10 Jul 2024 06:17:05 +0000 (UTC)
X-Original-To: kernel-janitors@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043B04315B;
	Wed, 10 Jul 2024 06:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720592225; cv=none; b=Ty5qx6ezv/vow7/GXjJAAopk0QSMX012TV4L5TiT0+P96ktJepYCSjujJ2aY6zMcmjEwL1NU0QrLoo+Hc3gDzKvB2OMpsOQQdB+C15f8H3P6/KcDCsZYrrlq299lPPb2I2h0toHMXs3eTdMccEeR44MujduBzbSTieY5rLScRQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720592225; c=relaxed/simple;
	bh=91gyZKMnjM/1/jO6oHu3FGL93sSN0iOSF/ttehOUQYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYRjL2HRhsZhIZjgvBRlrIJQDzpzbnWt1j/OmOZhu2bl+yxVZVYZJEkk5VQxesrVU/6v2/e9KGYuG0bSjyghdyi/GIStffrc1Fc1HwqEI9bNS2376TvFDDQ9/UfpYj9iJl5FTE04+NqzEslgxqHIOK0vFo8oOoyzuNKxIsapW/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id A765B227A87; Wed, 10 Jul 2024 08:17:00 +0200 (CEST)
Date: Wed, 10 Jul 2024 08:17:00 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] samples: configfs: add missing MODULE_DESCRIPTION()
 macro
Message-ID: <20240710061700.GA25810@lst.de>
References: <20240601-md-samples-configfs-v1-1-83ef2d3c0088@quicinc.com> <1d5dc2bb-773c-4877-9660-fff5517c2df3@quicinc.com> <04bd39d0-9ed7-4c09-9e21-a0a61a0fc6ea@quicinc.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04bd39d0-9ed7-4c09-9e21-a0a61a0fc6ea@quicinc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Hi don't get what the freaking point is.  It's not like
MODULE_DESCRIPTION is useful in any way, so adding pointless boilerplate
like this is:

Nacked-by: Christoph Hellwig <hch@lst.de>

until we can come up with a really good reason for it.


