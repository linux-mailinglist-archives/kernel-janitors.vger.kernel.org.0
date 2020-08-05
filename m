Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01F3A23CE05
	for <lists+kernel-janitors@lfdr.de>; Wed,  5 Aug 2020 20:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728756AbgHESGT (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 5 Aug 2020 14:06:19 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:39392 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728934AbgHESEG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 5 Aug 2020 14:04:06 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1k3KC3-0003ZB-9w; Wed, 05 Aug 2020 14:14:59 +0000
From:   Colin King <colin.king@canonical.com>
To:     Christian Benvenuti <benve@cisco.com>,
        Nelson Escobar <neescoba@cisco.com>,
        Parvi Kaustubhi <pkaustub@cisco.com>,
        Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] RDMA/usnic: fix spelling mistake "transistion" -> "transition"
Date:   Wed,  5 Aug 2020 15:14:59 +0100
Message-Id: <20200805141459.23069-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a usnic_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/hw/usnic/usnic_ib_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/usnic/usnic_ib_main.c b/drivers/infiniband/hw/usnic/usnic_ib_main.c
index c9abe1c01e4e..662e7fc7f628 100644
--- a/drivers/infiniband/hw/usnic/usnic_ib_main.c
+++ b/drivers/infiniband/hw/usnic/usnic_ib_main.c
@@ -120,7 +120,7 @@ static void usnic_ib_qp_grp_modify_active_to_err(struct usnic_ib_dev *us_ibdev)
 								IB_QPS_ERR,
 								NULL);
 				if (status) {
-					usnic_err("Failed to transistion qp grp %u from %s to %s\n",
+					usnic_err("Failed to transition qp grp %u from %s to %s\n",
 						qp_grp->grp_id,
 						usnic_ib_qp_grp_state_to_string
 						(cur_state),
-- 
2.27.0

