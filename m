Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23E5E2DAF82
	for <lists+kernel-janitors@lfdr.de>; Tue, 15 Dec 2020 15:57:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730025AbgLOOzd (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 15 Dec 2020 09:55:33 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:38182 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729770AbgLOOzW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Dec 2020 09:55:22 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1kpBiq-00073k-8p; Tue, 15 Dec 2020 14:54:40 +0000
From:   Colin King <colin.king@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: base: Kconfig: fix spelling mistake "heterogenous" -> "heterogeneous"
Date:   Tue, 15 Dec 2020 14:54:40 +0000
Message-Id: <20201215145440.204362-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/base/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index 040be48ce046..324aa03fed3c 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -161,7 +161,7 @@ config HMEM_REPORTING
 	default n
 	depends on NUMA
 	help
-	  Enable reporting for heterogenous memory access attributes under
+	  Enable reporting for heterogeneous memory access attributes under
 	  their non-uniform memory nodes.
 
 source "drivers/base/test/Kconfig"
-- 
2.29.2

