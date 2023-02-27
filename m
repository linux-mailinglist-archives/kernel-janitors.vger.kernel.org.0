Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71DFD6A43AE
	for <lists+kernel-janitors@lfdr.de>; Mon, 27 Feb 2023 15:05:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbjB0OF6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 27 Feb 2023 09:05:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbjB0OF5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 27 Feb 2023 09:05:57 -0500
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD2F0EC72
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Feb 2023 06:05:56 -0800 (PST)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 05CA567373; Mon, 27 Feb 2023 15:05:53 +0100 (CET)
Date:   Mon, 27 Feb 2023 15:05:52 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>,
        Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        linux-nvme@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] nvme-auth: fix an error code in
 nvme_auth_process_dhchap_challenge()
Message-ID: <20230227140552.GA18487@lst.de>
References: <Y+4eOa57zTdCZ56P@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+4eOa57zTdCZ56P@kili>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks,

applied to nvme-6.3.
