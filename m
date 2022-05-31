Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C020B538AFC
	for <lists+kernel-janitors@lfdr.de>; Tue, 31 May 2022 07:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244083AbiEaFmn (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 31 May 2022 01:42:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244069AbiEaFmh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 31 May 2022 01:42:37 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEA8595A08;
        Mon, 30 May 2022 22:42:32 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id BA2D768AFE; Tue, 31 May 2022 07:42:27 +0200 (CEST)
Date:   Tue, 31 May 2022 07:42:27 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     Christoph Hellwig <hch@lst.de>, kernel-janitors@vger.kernel.org,
        Sagi Grimberg <sagi@grimberg.me>,
        Chaitanya Kulkarni <kch@nvidia.com>,
        linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmet: fix typo in comment
Message-ID: <20220531054227.GA20486@lst.de>
References: <20220521111145.81697-26-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220521111145.81697-26-Julia.Lawall@inria.fr>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks,

applied to nvme-5.19.
