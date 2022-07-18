Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55641577A35
	for <lists+kernel-janitors@lfdr.de>; Mon, 18 Jul 2022 06:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233150AbiGRE6i (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 18 Jul 2022 00:58:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbiGRE6i (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 18 Jul 2022 00:58:38 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8535112ACE;
        Sun, 17 Jul 2022 21:58:36 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 8CE9568AFE; Mon, 18 Jul 2022 06:58:31 +0200 (CEST)
Date:   Mon, 18 Jul 2022 06:58:31 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
        Chaitanya Kulkarni <kch@nvidia.com>,
        Hannes Reinecke <hare@suse.de>, linux-nvme@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] nvmet-auth: Fix a couple of spelling mistakes
Message-ID: <20220718045831.GA21700@lst.de>
References: <20220715132413.301017-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220715132413.301017-1-colin.i.king@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks,

applied to nvme-5.20.
