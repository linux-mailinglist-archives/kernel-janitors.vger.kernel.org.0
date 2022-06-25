Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3FCB55AA24
	for <lists+kernel-janitors@lfdr.de>; Sat, 25 Jun 2022 14:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232126AbiFYMzU (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 25 Jun 2022 08:55:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232029AbiFYMzU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 25 Jun 2022 08:55:20 -0400
Received: from smtp.smtpout.orange.fr (smtp07.smtpout.orange.fr [80.12.242.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B8EC11A0F
        for <kernel-janitors@vger.kernel.org>; Sat, 25 Jun 2022 05:55:18 -0700 (PDT)
Received: from pop-os.home ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id 55Jkobhq9L5fD55JkoLyce; Sat, 25 Jun 2022 14:55:16 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 25 Jun 2022 14:55:16 +0200
X-ME-IP: 90.11.190.129
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/3] memstick/ms_block:
Date:   Sat, 25 Jun 2022 14:55:14 +0200
Message-Id: <cover.1656155715.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This serie is related to bitmap usage in memstick/ms_block.

Patch 1 use the dedicated bitmap API to make sure that a number of long is
allocated, instead of a number of bytes. 

Patch 2 fix a memory leak. This is speculative.

Pacth 3 is just a clean up to make more use of the bitmap API mostly for
consistancy reason.

Christophe JAILLET (3):
  memstick/ms_block: Fix some incorrect memory allocation
  memstick/ms_block: Fix a memory leak
  memstick/ms_block: Use the bitmap API when applicable

 drivers/memstick/core/ms_block.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

-- 
2.34.1

