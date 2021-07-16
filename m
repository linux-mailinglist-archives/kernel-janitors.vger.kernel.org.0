Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF653CB39A
	for <lists+kernel-janitors@lfdr.de>; Fri, 16 Jul 2021 09:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236314AbhGPH4u (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 16 Jul 2021 03:56:50 -0400
Received: from verein.lst.de ([213.95.11.211]:42189 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231758AbhGPH4t (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 16 Jul 2021 03:56:49 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 94EB767373; Fri, 16 Jul 2021 09:53:53 +0200 (CEST)
Date:   Fri, 16 Jul 2021 09:53:53 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Colin King <colin.king@canonical.com>
Cc:     Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
        Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
        linux-nvme@lists.infradead.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] nvmet: remove redundant assignments of variable
 status
Message-ID: <20210716075353.GB15223@lst.de>
References: <20210706145650.32555-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210706145650.32555-1-colin.king@canonical.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks,

applied to nvme-5.15.
