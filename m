Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0C534883D2
	for <lists+kernel-janitors@lfdr.de>; Sat,  8 Jan 2022 14:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbiAHNtE (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 8 Jan 2022 08:49:04 -0500
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:55764 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiAHNtE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 8 Jan 2022 08:49:04 -0500
Received: from pop-os.home ([90.11.185.88])
        by smtp.orange.fr with ESMTPA
        id 6C5dnLRFaBazo6C5dn7MaF; Sat, 08 Jan 2022 14:49:02 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 08 Jan 2022 14:49:02 +0100
X-ME-IP: 90.11.185.88
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     shshaikh@marvell.com, manishc@marvell.com,
        GR-Linux-NIC-Dev@marvell.com, davem@davemloft.net, kuba@kernel.org
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] qlcnic: Simplify DMA setting
Date:   Sat,  8 Jan 2022 14:48:59 +0100
Message-Id: <4996ab0337d62ec6a54b2edf234cd5ced4b4d7ad.1641649611.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

As stated in [1], dma_set_mask() with a 64-bit mask will never fail if
dev->dma_mask is non-NULL.
So, if it fails, the 32 bits case will also fail for the same reason.

So qlcnic_set_dma_mask(), (in qlcnic_main.c) can be simplified a lot and
inlined directly in its only caller.


If dma_set_mask_and_coherent() succeeds, 'pci_using_dac' is known to be 1.
So it can be removed from all the calling chain.

qlcnic_setup_netdev() can finally be simplified as-well.


[1]: https://lkml.org/lkml/2021/6/7/398

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/qlogic/qlcnic/qlcnic.h   |  2 +-
 .../ethernet/qlogic/qlcnic/qlcnic_83xx_hw.h   |  2 +-
 .../ethernet/qlogic/qlcnic/qlcnic_83xx_init.c |  4 +-
 .../net/ethernet/qlogic/qlcnic/qlcnic_main.c  | 38 +++++--------------
 .../net/ethernet/qlogic/qlcnic/qlcnic_sriov.h |  2 +-
 .../qlogic/qlcnic/qlcnic_sriov_common.c       |  9 ++---
 6 files changed, 19 insertions(+), 38 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic.h b/drivers/net/ethernet/qlogic/qlcnic/qlcnic.h
index be7abee160e7..b25102fded7b 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic.h
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic.h
@@ -1698,7 +1698,7 @@ int qlcnic_set_vxlan_port(struct qlcnic_adapter *adapter, u16 port);
 int qlcnic_set_vxlan_parsing(struct qlcnic_adapter *adapter, u16 port);
 int qlcnic_83xx_configure_opmode(struct qlcnic_adapter *adapter);
 int qlcnic_read_mac_addr(struct qlcnic_adapter *);
-int qlcnic_setup_netdev(struct qlcnic_adapter *, struct net_device *, int);
+int qlcnic_setup_netdev(struct qlcnic_adapter *, struct net_device *);
 void qlcnic_set_netdev_features(struct qlcnic_adapter *,
 				struct qlcnic_esw_func_cfg *);
 void qlcnic_sriov_vf_set_multi(struct net_device *);
diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.h b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.h
index 6f1d9c1fd1b0..23cd47d588e5 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.h
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.h
@@ -609,7 +609,7 @@ int qlcnic_83xx_read_flash_descriptor_table(struct qlcnic_adapter *);
 int qlcnic_83xx_flash_read32(struct qlcnic_adapter *, u32, u8 *, int);
 int qlcnic_83xx_lockless_flash_read32(struct qlcnic_adapter *,
 				      u32, u8 *, int);
-int qlcnic_83xx_init(struct qlcnic_adapter *, int);
+int qlcnic_83xx_init(struct qlcnic_adapter *);
 int qlcnic_83xx_idc_ready_state_entry(struct qlcnic_adapter *);
 void qlcnic_83xx_idc_poll_dev_state(struct work_struct *);
 void qlcnic_83xx_idc_exit(struct qlcnic_adapter *);
diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c
index 27dffa299ca6..dbb800769cb6 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c
@@ -2432,7 +2432,7 @@ static void qlcnic_83xx_init_rings(struct qlcnic_adapter *adapter)
 	qlcnic_set_sds_ring_count(adapter, rx_cnt);
 }
 
-int qlcnic_83xx_init(struct qlcnic_adapter *adapter, int pci_using_dac)
+int qlcnic_83xx_init(struct qlcnic_adapter *adapter)
 {
 	struct qlcnic_hardware_context *ahw = adapter->ahw;
 	int err = 0;
@@ -2466,7 +2466,7 @@ int qlcnic_83xx_init(struct qlcnic_adapter *adapter, int pci_using_dac)
 		goto exit;
 
 	if (qlcnic_sriov_vf_check(adapter)) {
-		err = qlcnic_sriov_vf_init(adapter, pci_using_dac);
+		err = qlcnic_sriov_vf_init(adapter);
 		if (err)
 			goto detach_mbx;
 		else
diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
index ed84f0f97623..d320567b2cca 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
@@ -2258,8 +2258,7 @@ static int qlcnic_set_real_num_queues(struct qlcnic_adapter *adapter,
 }
 
 int
-qlcnic_setup_netdev(struct qlcnic_adapter *adapter, struct net_device *netdev,
-		    int pci_using_dac)
+qlcnic_setup_netdev(struct qlcnic_adapter *adapter, struct net_device *netdev)
 {
 	int err;
 	struct pci_dev *pdev = adapter->pdev;
@@ -2278,20 +2277,15 @@ qlcnic_setup_netdev(struct qlcnic_adapter *adapter, struct net_device *netdev,
 
 	netdev->features |= (NETIF_F_SG | NETIF_F_IP_CSUM | NETIF_F_RXCSUM |
 			     NETIF_F_IPV6_CSUM | NETIF_F_GRO |
-			     NETIF_F_HW_VLAN_CTAG_RX);
+			     NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HIGHDMA);
 	netdev->vlan_features |= (NETIF_F_SG | NETIF_F_IP_CSUM |
-				  NETIF_F_IPV6_CSUM);
+				  NETIF_F_IPV6_CSUM | NETIF_F_HIGHDMA);
 
 	if (QLCNIC_IS_TSO_CAPABLE(adapter)) {
 		netdev->features |= (NETIF_F_TSO | NETIF_F_TSO6);
 		netdev->vlan_features |= (NETIF_F_TSO | NETIF_F_TSO6);
 	}
 
-	if (pci_using_dac) {
-		netdev->features |= NETIF_F_HIGHDMA;
-		netdev->vlan_features |= NETIF_F_HIGHDMA;
-	}
-
 	if (qlcnic_vlan_tx_check(adapter))
 		netdev->features |= (NETIF_F_HW_VLAN_CTAG_TX);
 
@@ -2341,20 +2335,6 @@ qlcnic_setup_netdev(struct qlcnic_adapter *adapter, struct net_device *netdev,
 	return 0;
 }
 
-static int qlcnic_set_dma_mask(struct pci_dev *pdev, int *pci_using_dac)
-{
-	if (!dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64)))
-		*pci_using_dac = 1;
-	else if (!dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32)))
-		*pci_using_dac = 0;
-	else {
-		dev_err(&pdev->dev, "Unable to set DMA mask, aborting\n");
-		return -EIO;
-	}
-
-	return 0;
-}
-
 void qlcnic_free_tx_rings(struct qlcnic_adapter *adapter)
 {
 	int ring;
@@ -2441,8 +2421,8 @@ qlcnic_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	struct net_device *netdev = NULL;
 	struct qlcnic_adapter *adapter = NULL;
 	struct qlcnic_hardware_context *ahw;
-	int err, pci_using_dac = -1;
 	char board_name[QLCNIC_MAX_BOARD_NAME_LEN + 19]; /* MAC + ": " + name */
+	int err;
 
 	err = pci_enable_device(pdev);
 	if (err)
@@ -2453,9 +2433,11 @@ qlcnic_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto err_out_disable_pdev;
 	}
 
-	err = qlcnic_set_dma_mask(pdev, &pci_using_dac);
-	if (err)
+	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+	if (err) {
+		dev_err(&pdev->dev, "Unable to set DMA mask, aborting\n");
 		goto err_out_disable_pdev;
+	}
 
 	err = pci_request_regions(pdev, qlcnic_driver_name);
 	if (err)
@@ -2569,7 +2551,7 @@ qlcnic_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	} else if (qlcnic_83xx_check(adapter)) {
 		qlcnic_83xx_check_vf(adapter, ent);
 		adapter->portnum = adapter->ahw->pci_func;
-		err = qlcnic_83xx_init(adapter, pci_using_dac);
+		err = qlcnic_83xx_init(adapter);
 		if (err) {
 			switch (err) {
 			case -ENOTRECOVERABLE:
@@ -2633,7 +2615,7 @@ qlcnic_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (adapter->portnum == 0)
 		qlcnic_set_drv_version(adapter);
 
-	err = qlcnic_setup_netdev(adapter, netdev, pci_using_dac);
+	err = qlcnic_setup_netdev(adapter, netdev);
 	if (err)
 		goto err_out_disable_mbx_intr;
 
diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov.h b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov.h
index d0111cb3b40e..c42b99cd58bd 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov.h
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov.h
@@ -188,7 +188,7 @@ int qlcnic_sriov_init(struct qlcnic_adapter *, int);
 void qlcnic_sriov_cleanup(struct qlcnic_adapter *);
 void __qlcnic_sriov_cleanup(struct qlcnic_adapter *);
 void qlcnic_sriov_vf_register_map(struct qlcnic_hardware_context *);
-int qlcnic_sriov_vf_init(struct qlcnic_adapter *, int);
+int qlcnic_sriov_vf_init(struct qlcnic_adapter *);
 void qlcnic_sriov_vf_set_ops(struct qlcnic_adapter *);
 int qlcnic_sriov_func_to_index(struct qlcnic_adapter *, u8);
 void qlcnic_sriov_handle_bc_event(struct qlcnic_adapter *, u32);
diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_common.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_common.c
index 42a44c97572a..9282321c2e7f 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_common.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_common.c
@@ -525,8 +525,7 @@ static int qlcnic_sriov_vf_init_driver(struct qlcnic_adapter *adapter)
 	return 0;
 }
 
-static int qlcnic_sriov_setup_vf(struct qlcnic_adapter *adapter,
-				 int pci_using_dac)
+static int qlcnic_sriov_setup_vf(struct qlcnic_adapter *adapter)
 {
 	int err;
 
@@ -571,7 +570,7 @@ static int qlcnic_sriov_setup_vf(struct qlcnic_adapter *adapter,
 	if (err)
 		goto err_out_send_channel_term;
 
-	err = qlcnic_setup_netdev(adapter, adapter->netdev, pci_using_dac);
+	err = qlcnic_setup_netdev(adapter, adapter->netdev);
 	if (err)
 		goto err_out_send_channel_term;
 
@@ -614,7 +613,7 @@ static int qlcnic_sriov_check_dev_ready(struct qlcnic_adapter *adapter)
 	return 0;
 }
 
-int qlcnic_sriov_vf_init(struct qlcnic_adapter *adapter, int pci_using_dac)
+int qlcnic_sriov_vf_init(struct qlcnic_adapter *adapter)
 {
 	struct qlcnic_hardware_context *ahw = adapter->ahw;
 	int err;
@@ -631,7 +630,7 @@ int qlcnic_sriov_vf_init(struct qlcnic_adapter *adapter, int pci_using_dac)
 	if (err)
 		return err;
 
-	err = qlcnic_sriov_setup_vf(adapter, pci_using_dac);
+	err = qlcnic_sriov_setup_vf(adapter);
 	if (err)
 		return err;
 
-- 
2.32.0

