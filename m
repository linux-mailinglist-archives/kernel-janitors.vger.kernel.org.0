Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E9EA6F3105
	for <lists+kernel-janitors@lfdr.de>; Mon,  1 May 2023 14:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232444AbjEAMla (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 1 May 2023 08:41:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232370AbjEAMl3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 1 May 2023 08:41:29 -0400
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C45671986
        for <kernel-janitors@vger.kernel.org>; Mon,  1 May 2023 05:41:01 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id tSpZpM6hwpwRItSpZpInaY; Mon, 01 May 2023 14:40:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1682944841;
        bh=EUEJrGSU9dbvr4t0fqCm6zFszLF/bFGwTNtIbcqD6dc=;
        h=From:To:Cc:Subject:Date;
        b=nMsOv6yUj20FO78qx7cQuyqhpBbMv1MDjFjIyx23VIP1d/rxsNuHlNzevfdXkRLn3
         IvQPtzTfUBM8ikx6ycI5t6ZAOZKII//KTEfwXglID6qMJIWUJX26whoYTczGcOsiQp
         F+AxN4H0xgpoB4M3s2h1NAmSFaC9cMJlrF1guBP+XIzbAKaoEdzhybYsDW8sAyQaye
         1j1upBoLJWU3kzWzhoNcM0JWTL4FmXdOK/5voGA+52uS5VBTxPG0Nb0iFKdNK7M0gf
         1k4Xp2BnVmI58dVP6QZc18ZVec9T4PBpNBOMDUTkySsJCruKDYrsXfBepf0LLrS20X
         BdAq+togyimJg==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 01 May 2023 14:40:40 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     hch@lst.de, sagi@grimberg.me, kch@nvidia.com
Cc:     linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/5] optimize some data structure in nvme
Date:   Mon,  1 May 2023 14:40:24 +0200
Message-Id: <cover.1682941568.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This serie is a proposal to slighly optimize the memory needed for some
structures used in nvme.

This follows the discussion in [1].

Honnestly, I'm not convinced that this serie really brings semething.
Because of the way memory alocation works, and its over-allocation to try to
avoid memory fragmentation, some limited gains are most of the time useless.

It could still help:
   - many holes in structure can, at some point, have its size reach a threshold
     (this is specially true if such structures are allocated with kcalloc() or
     kmalloc_array())
   - it can save some space in some other structures if embedded in them
   - it can save a few cycles if the structure is memcpy()'ed or zeroed, for
     example
   - can reduce cache usage

With that in mind, patch 3 is a win, patch 4 is likely a win, the other ones are
much more theorical.

The changes are really limited, so even if the gain is marginal, maybe it still
makes sense to merge them.

Each patch gives the layout generated by pahole before and after the patch.

[1]: https://lore.kernel.org/all/67a9e53e-4ac9-7ba8-9713-96c1dfe1e341@nvidia.com/

Christophe JAILLET (5):
  nvmet: Reorder fields in 'struct nvmet_sq'
  nvmet: Reorder fields in 'struct nvme_ctrl'
  nvmet: Reorder fields in 'struct nvmf_ctrl_options'
  nvmet: Reorder fields in 'struct nvme_dhchap_queue_context'
  nvmet: Reorder fields in 'struct nvmefc_fcp_req'

 drivers/nvme/host/auth.c       |  6 +++---
 drivers/nvme/host/fabrics.h    |  8 ++++----
 drivers/nvme/host/nvme.h       |  6 +++---
 drivers/nvme/target/nvmet.h    |  4 ++--
 include/linux/nvme-fc-driver.h | 10 +++++-----
 5 files changed, 17 insertions(+), 17 deletions(-)

-- 
2.34.1

