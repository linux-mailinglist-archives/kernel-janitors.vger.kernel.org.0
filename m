Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6061A27CEE0
	for <lists+kernel-janitors@lfdr.de>; Tue, 29 Sep 2020 15:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbgI2NSf (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 29 Sep 2020 09:18:35 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:34151 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728323AbgI2NSf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 29 Sep 2020 09:18:35 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1kNFWW-0005KC-SK; Tue, 29 Sep 2020 13:18:28 +0000
From:   Colin King <colin.king@canonical.com>
To:     Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Waiman Long <longman@redhat.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] lib/mpi: fix off-by-one check on index "no"
Date:   Tue, 29 Sep 2020 14:18:28 +0100
Message-Id: <20200929131828.155691-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is an off-by-one range check on the upper limit of
index "no".  Fix this by changing the > comparison to >=

Addresses-Coverity: ("Out-of-bounds read")
Fixes: a8ea8bdd9df9 ("lib/mpi: Extend the MPI library")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 lib/mpi/mpiutil.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/mpi/mpiutil.c b/lib/mpi/mpiutil.c
index 3c63710c20c6..632d0a4bf93f 100644
--- a/lib/mpi/mpiutil.c
+++ b/lib/mpi/mpiutil.c
@@ -69,7 +69,7 @@ postcore_initcall(mpi_init);
  */
 MPI mpi_const(enum gcry_mpi_constants no)
 {
-	if ((int)no < 0 || no > MPI_NUMBER_OF_CONSTANTS)
+	if ((int)no < 0 || no >= MPI_NUMBER_OF_CONSTANTS)
 		pr_err("MPI: invalid mpi_const selector %d\n", no);
 	if (!constants[no])
 		pr_err("MPI: MPI subsystem not initialized\n");
-- 
2.27.0

