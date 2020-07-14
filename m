Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8CBD21EF10
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 Jul 2020 13:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgGNLTc (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 14 Jul 2020 07:19:32 -0400
Received: from verein.lst.de ([213.95.11.211]:53942 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728124AbgGNLRa (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Jul 2020 07:17:30 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 8C0D568CFC; Tue, 14 Jul 2020 13:17:27 +0200 (CEST)
Date:   Tue, 14 Jul 2020 13:17:27 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        linux-nvme@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] nvme: remove an unnecessary condition
Message-ID: <20200714111727.GA17866@lst.de>
References: <20200714105732.GD294318@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714105732.GD294318@mwanda>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks,

applied to nvme-5.9.
