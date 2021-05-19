Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D170C3887ED
	for <lists+kernel-janitors@lfdr.de>; Wed, 19 May 2021 09:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238532AbhESHCJ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 19 May 2021 03:02:09 -0400
Received: from verein.lst.de ([213.95.11.211]:36997 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232520AbhESHCJ (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 May 2021 03:02:09 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 6E12067373; Wed, 19 May 2021 09:00:48 +0200 (CEST)
Date:   Wed, 19 May 2021 09:00:48 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Colin King <colin.king@canonical.com>
Cc:     Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        linux-nvme@lists.infradead.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme: remove redundant initialization of variable ret
Message-ID: <20210519070048.GB32339@lst.de>
References: <20210513115952.58482-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210513115952.58482-1-colin.king@canonical.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks,

applied to nvme-5.14.
