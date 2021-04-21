Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B875366E15
	for <lists+kernel-janitors@lfdr.de>; Wed, 21 Apr 2021 16:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241532AbhDUOYv (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 21 Apr 2021 10:24:51 -0400
Received: from verein.lst.de ([213.95.11.211]:54838 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243506AbhDUOXt (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 21 Apr 2021 10:23:49 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id E203F67373; Wed, 21 Apr 2021 16:23:14 +0200 (CEST)
Date:   Wed, 21 Apr 2021 16:23:14 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/2] ataflop: fix off by one in ataflop_probe()
Message-ID: <20210421142314.GB29072@lst.de>
References: <YH/7+65JruUO/wsg@mwanda> <YH/8QdfDxhjGjXHG@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YH/8QdfDxhjGjXHG@mwanda>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Apr 21, 2021 at 01:19:45PM +0300, Dan Carpenter wrote:
> Smatch complains that the "type > NUM_DISK_MINORS" should be >=
> instead of >.  We also need to subtract one from "type" at the start.
> 
> Fixes: bf9c0538e485 ("ataflop: use a separate gendisk for each media format")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
