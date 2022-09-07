Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7BE5AFF91
	for <lists+kernel-janitors@lfdr.de>; Wed,  7 Sep 2022 10:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbiIGIuw (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 7 Sep 2022 04:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbiIGIut (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Sep 2022 04:50:49 -0400
X-Greylist: delayed 395 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 07 Sep 2022 01:50:47 PDT
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6AD1867C9B
        for <kernel-janitors@vger.kernel.org>; Wed,  7 Sep 2022 01:50:46 -0700 (PDT)
Received: from 8bytes.org (p4ff2bb62.dip0.t-ipconnect.de [79.242.187.98])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.8bytes.org (Postfix) with ESMTPSA id 073E92409C6;
        Wed,  7 Sep 2022 10:42:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
        s=default; t=1662540178;
        bh=aeiwbQEgBpapvaY7ytdFXeTg25jW4Hho6BQgko/uSo0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ybrvhuHH/0sg1fsiTj3xXvm7D6/3/FoRWzLfkVes9BH5BckhJWiA9sO2useBgL0F6
         D/km/dQBfJ9a1CcIiFJdkR+x8bGmVRDc67aqVciFVMaQ2pdxY28TB/kkh4u+qT4+qD
         Ymg8xe7mkW5IssYhgYkEGQQ2So35beEjUo8QoGQ1PB36+PFDZcuFL75SjaezUUJMkx
         iRSTPkUaSAVMC0EdY6vL85GweUbx+gKc21We8y300j1CILSqr8eOIKUVM00qDywKvW
         IysM5xiCcgOPnPjIfaBWIZZqxthWKe2lx9XesiYHjSv87Hp7lG6eIvXY9wy83NROUn
         Le27lTQGmj5qg==
Date:   Wed, 7 Sep 2022 10:42:56 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Suman Anna <s-anna@ti.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        iommu@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iommu/omap: fix buffer overflow in debugfs
Message-ID: <YxhZkCUD4UbUKLOp@8bytes.org>
References: <YuvYh1JbE3v+abd5@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YuvYh1JbE3v+abd5@kili>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Aug 04, 2022 at 05:32:39PM +0300, Dan Carpenter wrote:
>  drivers/iommu/omap-iommu-debug.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.
