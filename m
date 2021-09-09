Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECFA40589E
	for <lists+kernel-janitors@lfdr.de>; Thu,  9 Sep 2021 16:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346995AbhIIOIl (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 9 Sep 2021 10:08:41 -0400
Received: from verein.lst.de ([213.95.11.211]:44470 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344795AbhIIOIa (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 9 Sep 2021 10:08:30 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 66F6668AFE; Thu,  9 Sep 2021 16:07:13 +0200 (CEST)
Date:   Thu, 9 Sep 2021 16:07:12 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        Chaitanya Kulkarni <kch@nvidia.com>,
        linux-nvme@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] nvmet: fix a width vs precision bug in
 nvmet_subsys_attr_serial_show()
Message-ID: <20210909140712.GA28735@lst.de>
References: <20210909091440.GB26312@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210909091440.GB26312@kili>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks,

applied to nvme-5.15.
