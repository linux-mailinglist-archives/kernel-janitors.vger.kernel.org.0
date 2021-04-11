Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED1835B219
	for <lists+kernel-janitors@lfdr.de>; Sun, 11 Apr 2021 09:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbhDKHIj (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 11 Apr 2021 03:08:39 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:17747 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbhDKHIj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 11 Apr 2021 03:08:39 -0400
Received: from localhost.localdomain ([90.126.11.170])
        by mwinf5d26 with ME
        id rK8H2400G3g7mfN03K8Jxc; Sun, 11 Apr 2021 09:08:22 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 11 Apr 2021 09:08:22 +0200
X-ME-IP: 90.126.11.170
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     dwmw2@infradead.org, baolu.lu@linux.intel.com, joro@8bytes.org,
        will@kernel.org, kyung.min.park@intel.com
Cc:     iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] iommu/vt-d: Fix an error handling path in 'intel_prepare_irq_remapping()'
Date:   Sun, 11 Apr 2021 09:08:17 +0200
Message-Id: <98d531caabe66012b4fffc7813fd4b9470afd517.1618124777.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If 'intel_cap_audit()' fails, we should return directly, as already done in
the surrounding error handling path.

Fixes: ad3d19029979 ("iommu/vt-d: Audit IOMMU Capabilities and add helper functions")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is completely speculative.
It is based on a spurious mix-up of direct return and goto.
---
 drivers/iommu/intel/irq_remapping.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/intel/irq_remapping.c b/drivers/iommu/intel/irq_remapping.c
index 75429a5373ec..f912fe45bea2 100644
--- a/drivers/iommu/intel/irq_remapping.c
+++ b/drivers/iommu/intel/irq_remapping.c
@@ -736,7 +736,7 @@ static int __init intel_prepare_irq_remapping(void)
 		return -ENODEV;
 
 	if (intel_cap_audit(CAP_AUDIT_STATIC_IRQR, NULL))
-		goto error;
+		return -ENODEV;
 
 	if (!dmar_ir_support())
 		return -ENODEV;
-- 
2.27.0

