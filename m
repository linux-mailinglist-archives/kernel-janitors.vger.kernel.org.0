Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8B8AC0D27
	for <lists+kernel-janitors@lfdr.de>; Fri, 27 Sep 2019 23:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbfI0VSD (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 27 Sep 2019 17:18:03 -0400
Received: from verein.lst.de ([213.95.11.211]:47724 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725306AbfI0VSD (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 27 Sep 2019 17:18:03 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 706A168B05; Fri, 27 Sep 2019 23:17:59 +0200 (CEST)
Date:   Fri, 27 Sep 2019 23:17:59 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Jens Axboe <axboe@fb.com>, Sagi Grimberg <sagi@grimberg.me>,
        linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] nvme: fix an error code in nvme_init_subsystem()
Message-ID: <20190927211758.GB16819@lst.de>
References: <20190923141836.GA31251@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190923141836.GA31251@mwanda>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
