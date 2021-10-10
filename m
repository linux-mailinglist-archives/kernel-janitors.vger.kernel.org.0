Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5E9427F9C
	for <lists+kernel-janitors@lfdr.de>; Sun, 10 Oct 2021 09:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231225AbhJJHLa (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 10 Oct 2021 03:11:30 -0400
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:49868 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbhJJHLR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 10 Oct 2021 03:11:17 -0400
Received: from pop-os.home ([90.126.248.220])
        by mwinf5d27 with ME
        id 479D260074m3Hzu0379DD9; Sun, 10 Oct 2021 09:09:18 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 10 Oct 2021 09:09:18 +0200
X-ME-IP: 90.126.248.220
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org,
        stf_xl@wp.pl, luciano.coelho@intel.com, amitkarwar@gmail.com,
        ganapathi017@gmail.com, sharvari.harisangam@nxp.com,
        huxinming820@gmail.com, ajay.kathat@microchip.com,
        claudiu.beznea@microchip.com, imitsyanko@quantenna.com,
        geomatsi@gmail.com, pkshih@realtek.com, jussi.kivilinna@iki.fi,
        pizza@shaftnet.org
Cc:     netdev@vger.kernel.org, ath10k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] wireless: Remove redundant 'flush_workqueue()' calls
Date:   Sun, 10 Oct 2021 09:09:11 +0200
Message-Id: <0855d51423578ad019c0264dad3fe47a2e8af9c7.1633849511.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'destroy_workqueue()' already drains the queue before destroying it, so
there is no need to flush it explicitly.

Remove the redundant 'flush_workqueue()' calls.

This was generated with coccinelle:

@@
expression E;
@@
- 	flush_workqueue(E);
	destroy_workqueue(E);

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/wireless/ath/ath10k/core.c             | 3 ---
 drivers/net/wireless/ath/ath10k/sdio.c             | 1 -
 drivers/net/wireless/intel/iwlegacy/3945-mac.c     | 1 -
 drivers/net/wireless/intel/iwlegacy/4965-mac.c     | 1 -
 drivers/net/wireless/intel/iwlwifi/dvm/main.c      | 1 -
 drivers/net/wireless/marvell/mwifiex/cfg80211.c    | 2 --
 drivers/net/wireless/marvell/mwifiex/main.c        | 2 --
 drivers/net/wireless/microchip/wilc1000/netdev.c   | 1 -
 drivers/net/wireless/quantenna/qtnfmac/core.c      | 2 --
 drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c | 2 --
 drivers/net/wireless/realtek/rtlwifi/pci.c         | 1 -
 drivers/net/wireless/rndis_wlan.c                  | 2 --
 drivers/net/wireless/st/cw1200/bh.c                | 2 --
 13 files changed, 21 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index c21e05549f61..112e04bb0e57 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -3520,13 +3520,10 @@ EXPORT_SYMBOL(ath10k_core_create);
 
 void ath10k_core_destroy(struct ath10k *ar)
 {
-	flush_workqueue(ar->workqueue);
 	destroy_workqueue(ar->workqueue);
 
-	flush_workqueue(ar->workqueue_aux);
 	destroy_workqueue(ar->workqueue_aux);
 
-	flush_workqueue(ar->workqueue_tx_complete);
 	destroy_workqueue(ar->workqueue_tx_complete);
 
 	ath10k_debug_destroy(ar);
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index eb705214f3f0..63e1c2d783c5 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -2650,7 +2650,6 @@ static void ath10k_sdio_remove(struct sdio_func *func)
 
 	ath10k_core_destroy(ar);
 
-	flush_workqueue(ar_sdio->workqueue);
 	destroy_workqueue(ar_sdio->workqueue);
 }
 
diff --git a/drivers/net/wireless/intel/iwlegacy/3945-mac.c b/drivers/net/wireless/intel/iwlegacy/3945-mac.c
index 45abb25b65a9..bd4e7d752958 100644
--- a/drivers/net/wireless/intel/iwlegacy/3945-mac.c
+++ b/drivers/net/wireless/intel/iwlegacy/3945-mac.c
@@ -3819,7 +3819,6 @@ il3945_pci_remove(struct pci_dev *pdev)
 	il3945_unset_hw_params(il);
 
 	/*netif_stop_queue(dev); */
-	flush_workqueue(il->workqueue);
 
 	/* ieee80211_unregister_hw calls il3945_mac_stop, which flushes
 	 * il->workqueue... so we can't take down the workqueue
diff --git a/drivers/net/wireless/intel/iwlegacy/4965-mac.c b/drivers/net/wireless/intel/iwlegacy/4965-mac.c
index 0223532fd56a..d93900e62e3d 100644
--- a/drivers/net/wireless/intel/iwlegacy/4965-mac.c
+++ b/drivers/net/wireless/intel/iwlegacy/4965-mac.c
@@ -6731,7 +6731,6 @@ il4965_pci_remove(struct pci_dev *pdev)
 	il_eeprom_free(il);
 
 	/*netif_stop_queue(dev); */
-	flush_workqueue(il->workqueue);
 
 	/* ieee80211_unregister_hw calls il_mac_stop, which flushes
 	 * il->workqueue... so we can't take down the workqueue
diff --git a/drivers/net/wireless/intel/iwlwifi/dvm/main.c b/drivers/net/wireless/intel/iwlwifi/dvm/main.c
index cc7b69fd14d3..69d1aae96bbb 100644
--- a/drivers/net/wireless/intel/iwlwifi/dvm/main.c
+++ b/drivers/net/wireless/intel/iwlwifi/dvm/main.c
@@ -1525,7 +1525,6 @@ static void iwl_op_mode_dvm_stop(struct iwl_op_mode *op_mode)
 	kfree(priv->nvm_data);
 
 	/*netif_stop_queue(dev); */
-	flush_workqueue(priv->workqueue);
 
 	/* ieee80211_unregister_hw calls iwlagn_mac_stop, which flushes
 	 * priv->workqueue... so we can't take down the workqueue
diff --git a/drivers/net/wireless/marvell/mwifiex/cfg80211.c b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
index d62a20de3ada..ef697572a293 100644
--- a/drivers/net/wireless/marvell/mwifiex/cfg80211.c
+++ b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
@@ -3218,13 +3218,11 @@ int mwifiex_del_virtual_intf(struct wiphy *wiphy, struct wireless_dev *wdev)
 		cfg80211_unregister_netdevice(wdev->netdev);
 
 	if (priv->dfs_cac_workqueue) {
-		flush_workqueue(priv->dfs_cac_workqueue);
 		destroy_workqueue(priv->dfs_cac_workqueue);
 		priv->dfs_cac_workqueue = NULL;
 	}
 
 	if (priv->dfs_chan_sw_workqueue) {
-		flush_workqueue(priv->dfs_chan_sw_workqueue);
 		destroy_workqueue(priv->dfs_chan_sw_workqueue);
 		priv->dfs_chan_sw_workqueue = NULL;
 	}
diff --git a/drivers/net/wireless/marvell/mwifiex/main.c b/drivers/net/wireless/marvell/mwifiex/main.c
index 17399d4aa129..7943fd3b3058 100644
--- a/drivers/net/wireless/marvell/mwifiex/main.c
+++ b/drivers/net/wireless/marvell/mwifiex/main.c
@@ -498,13 +498,11 @@ static void mwifiex_free_adapter(struct mwifiex_adapter *adapter)
 static void mwifiex_terminate_workqueue(struct mwifiex_adapter *adapter)
 {
 	if (adapter->workqueue) {
-		flush_workqueue(adapter->workqueue);
 		destroy_workqueue(adapter->workqueue);
 		adapter->workqueue = NULL;
 	}
 
 	if (adapter->rx_workqueue) {
-		flush_workqueue(adapter->rx_workqueue);
 		destroy_workqueue(adapter->rx_workqueue);
 		adapter->rx_workqueue = NULL;
 	}
diff --git a/drivers/net/wireless/microchip/wilc1000/netdev.c b/drivers/net/wireless/microchip/wilc1000/netdev.c
index 7e4d9235251c..d3b33c6ab93a 100644
--- a/drivers/net/wireless/microchip/wilc1000/netdev.c
+++ b/drivers/net/wireless/microchip/wilc1000/netdev.c
@@ -880,7 +880,6 @@ void wilc_netdev_cleanup(struct wilc *wilc)
 	srcu_read_unlock(&wilc->srcu, srcu_idx);
 
 	wilc_wfi_deinit_mon_interface(wilc, false);
-	flush_workqueue(wilc->hif_workqueue);
 	destroy_workqueue(wilc->hif_workqueue);
 
 	while (ifc_cnt < WILC_NUM_CONCURRENT_IFC) {
diff --git a/drivers/net/wireless/quantenna/qtnfmac/core.c b/drivers/net/wireless/quantenna/qtnfmac/core.c
index b4dd60b2ebc9..01725237836e 100644
--- a/drivers/net/wireless/quantenna/qtnfmac/core.c
+++ b/drivers/net/wireless/quantenna/qtnfmac/core.c
@@ -811,13 +811,11 @@ void qtnf_core_detach(struct qtnf_bus *bus)
 	bus->fw_state = QTNF_FW_STATE_DETACHED;
 
 	if (bus->workqueue) {
-		flush_workqueue(bus->workqueue);
 		destroy_workqueue(bus->workqueue);
 		bus->workqueue = NULL;
 	}
 
 	if (bus->hprio_workqueue) {
-		flush_workqueue(bus->hprio_workqueue);
 		destroy_workqueue(bus->hprio_workqueue);
 		bus->hprio_workqueue = NULL;
 	}
diff --git a/drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c b/drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c
index 5d93c874d666..9ad4c120fa28 100644
--- a/drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c
+++ b/drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c
@@ -387,7 +387,6 @@ static int qtnf_pcie_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	return 0;
 
 error:
-	flush_workqueue(pcie_priv->workqueue);
 	destroy_workqueue(pcie_priv->workqueue);
 	pci_set_drvdata(pdev, NULL);
 	return ret;
@@ -416,7 +415,6 @@ static void qtnf_pcie_remove(struct pci_dev *dev)
 		qtnf_core_detach(bus);
 
 	netif_napi_del(&bus->mux_napi);
-	flush_workqueue(priv->workqueue);
 	destroy_workqueue(priv->workqueue);
 	tasklet_kill(&priv->reclaim_tq);
 
diff --git a/drivers/net/wireless/realtek/rtlwifi/pci.c b/drivers/net/wireless/realtek/rtlwifi/pci.c
index 3776495fd9d0..ad327bae754b 100644
--- a/drivers/net/wireless/realtek/rtlwifi/pci.c
+++ b/drivers/net/wireless/realtek/rtlwifi/pci.c
@@ -1743,7 +1743,6 @@ static void rtl_pci_deinit(struct ieee80211_hw *hw)
 	tasklet_kill(&rtlpriv->works.irq_tasklet);
 	cancel_work_sync(&rtlpriv->works.lps_change_work);
 
-	flush_workqueue(rtlpriv->works.rtl_wq);
 	destroy_workqueue(rtlpriv->works.rtl_wq);
 }
 
diff --git a/drivers/net/wireless/rndis_wlan.c b/drivers/net/wireless/rndis_wlan.c
index 63ce2443f136..ff2448394a1e 100644
--- a/drivers/net/wireless/rndis_wlan.c
+++ b/drivers/net/wireless/rndis_wlan.c
@@ -3501,7 +3501,6 @@ static int rndis_wlan_bind(struct usbnet *usbdev, struct usb_interface *intf)
 	cancel_delayed_work_sync(&priv->dev_poller_work);
 	cancel_delayed_work_sync(&priv->scan_work);
 	cancel_work_sync(&priv->work);
-	flush_workqueue(priv->workqueue);
 	destroy_workqueue(priv->workqueue);
 
 	wiphy_free(wiphy);
@@ -3518,7 +3517,6 @@ static void rndis_wlan_unbind(struct usbnet *usbdev, struct usb_interface *intf)
 	cancel_delayed_work_sync(&priv->dev_poller_work);
 	cancel_delayed_work_sync(&priv->scan_work);
 	cancel_work_sync(&priv->work);
-	flush_workqueue(priv->workqueue);
 	destroy_workqueue(priv->workqueue);
 
 	rndis_unbind(usbdev, intf);
diff --git a/drivers/net/wireless/st/cw1200/bh.c b/drivers/net/wireless/st/cw1200/bh.c
index 8bade5d89f12..10e019cddcc6 100644
--- a/drivers/net/wireless/st/cw1200/bh.c
+++ b/drivers/net/wireless/st/cw1200/bh.c
@@ -85,8 +85,6 @@ void cw1200_unregister_bh(struct cw1200_common *priv)
 	atomic_inc(&priv->bh_term);
 	wake_up(&priv->bh_wq);
 
-	flush_workqueue(priv->bh_workqueue);
-
 	destroy_workqueue(priv->bh_workqueue);
 	priv->bh_workqueue = NULL;
 
-- 
2.30.2

