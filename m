Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A80A21DBAD2
	for <lists+kernel-janitors@lfdr.de>; Wed, 20 May 2020 19:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgETRMX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 20 May 2020 13:12:23 -0400
Received: from verein.lst.de ([213.95.11.211]:50851 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726566AbgETRMX (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 20 May 2020 13:12:23 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id A1CF868BEB; Wed, 20 May 2020 19:12:20 +0200 (CEST)
Date:   Wed, 20 May 2020 19:12:20 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        linux-nvme@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] nvme: delete an unnecessary declaration
Message-ID: <20200520171220.GA9677@lst.de>
References: <20200515120659.GA575846@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200515120659.GA575846@mwanda>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks,

applied to nvme-5.8.
