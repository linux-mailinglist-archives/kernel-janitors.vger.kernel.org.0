Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0B413ACD18
	for <lists+kernel-janitors@lfdr.de>; Fri, 18 Jun 2021 16:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234239AbhFROJk (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 18 Jun 2021 10:09:40 -0400
Received: from verein.lst.de ([213.95.11.211]:35059 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229782AbhFROJj (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Jun 2021 10:09:39 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 96BAB68D0A; Fri, 18 Jun 2021 16:07:28 +0200 (CEST)
Date:   Fri, 18 Jun 2021 16:07:28 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
        linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] blk-mq: fix an IS_ERR() vs NULL bug
Message-ID: <20210618140728.GA17914@lst.de>
References: <YMyjci35WBqrtqG+@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMyjci35WBqrtqG+@mwanda>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jun 18, 2021 at 04:45:22PM +0300, Dan Carpenter wrote:
> The __blk_mq_alloc_disk() function doesn't return NULLs it returns
> error pointers.
> 
> Fixes: b461dfc49eb6 ("blk-mq: add the blk_mq_alloc_disk APIs")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
