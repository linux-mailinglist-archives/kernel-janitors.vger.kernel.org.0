Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 615643A90F4
	for <lists+kernel-janitors@lfdr.de>; Wed, 16 Jun 2021 07:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbhFPFIC (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 16 Jun 2021 01:08:02 -0400
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]:36567 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbhFPFIC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 16 Jun 2021 01:08:02 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d01 with ME
        id Hh5v2500321Fzsu03h5vLM; Wed, 16 Jun 2021 07:05:56 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 16 Jun 2021 07:05:56 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
        davem@davemloft.net, kuba@kernel.org, jeffrey.t.kirsher@intel.com
Cc:     intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] e1000e: Fix an error handling path in 'e1000_probe()'
Date:   Wed, 16 Jun 2021 07:05:53 +0200
Message-Id: <2651bb1778490c45d963122619fe3403fdf6b9de.1623819901.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If an error occurs after a 'pci_enable_pcie_error_reporting()' call, it
must be undone by a corresponding 'pci_disable_pcie_error_reporting()'
call, as already done in the remove function.

Fixes: 111b9dc5c981 ("e1000e: add aer support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/intel/e1000e/netdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
index 5435606149b0..c8aa69fd0405 100644
--- a/drivers/net/ethernet/intel/e1000e/netdev.c
+++ b/drivers/net/ethernet/intel/e1000e/netdev.c
@@ -7662,6 +7662,7 @@ static int e1000_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 err_ioremap:
 	free_netdev(netdev);
 err_alloc_etherdev:
+	pci_disable_pcie_error_reporting(pdev);
 	pci_release_mem_regions(pdev);
 err_pci_reg:
 err_dma:
-- 
2.30.2

