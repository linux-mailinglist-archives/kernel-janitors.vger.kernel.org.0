Return-Path: <kernel-janitors+bounces-44-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4111E7DBABE
	for <lists+kernel-janitors@lfdr.de>; Mon, 30 Oct 2023 14:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B56CB20E39
	for <lists+kernel-janitors@lfdr.de>; Mon, 30 Oct 2023 13:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B41168CD;
	Mon, 30 Oct 2023 13:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EBDD273
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 13:29:58 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 728DAC6;
	Mon, 30 Oct 2023 06:29:57 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
	id AF9C26732A; Mon, 30 Oct 2023 14:29:54 +0100 (CET)
Date: Mon, 30 Oct 2023 14:29:54 +0100
From: Christoph Hellwig <hch@lst.de>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Hannes Reinecke <hare@suse.de>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-nvme@lists.infradead.org
Subject: Re: [PATCH] nvme-tcp: Fix a memory leak
Message-ID: <20231030132954.GD21741@lst.de>
References: <f9420cde9afdc5af40bf8a8d5aa9184a9b5da729.1698614556.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9420cde9afdc5af40bf8a8d5aa9184a9b5da729.1698614556.git.christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sun, Oct 29, 2023 at 10:22:57PM +0100, Christophe JAILLET wrote:
>  		if (ctype != TLS_RECORD_TYPE_DATA) {
>  			pr_err("queue %d: unhandled TLS record %d\n",
>  			       nvme_tcp_queue_id(queue), ctype);
> -			return -ENOTCONN;
> +			ret = -ENOTCONN;
> +			goto free_icresp;
>  		}
>  	}
>  	ret = -EINVAL;

I'd slightly prefer the code to be consistent how it assigns to err,
and use the style where it is assigned in the main path as with the
-EINVAL for the next checks.

Except for that this looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

