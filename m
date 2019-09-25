Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99FAABE45C
	for <lists+kernel-janitors@lfdr.de>; Wed, 25 Sep 2019 20:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440035AbfIYSK7 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 25 Sep 2019 14:10:59 -0400
Received: from mga06.intel.com ([134.134.136.31]:14985 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2439904AbfIYSK7 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Sep 2019 14:10:59 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Sep 2019 11:10:58 -0700
X-IronPort-AV: E=Sophos;i="5.64,548,1559545200"; 
   d="scan'208";a="390305615"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.157])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Sep 2019 11:10:58 -0700
From:   ira.weiny@intel.com
To:     Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>
Cc:     Dave Jiang <dave.jiang@intel.com>,
        Keith Busch <keith.busch@intel.com>, linux-nvdimm@lists.01.org,
        kernel-janitors@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>
Subject: [PATCH] bnvdimm/namsepace: Don't set claim_class on error
Date:   Wed, 25 Sep 2019 11:10:56 -0700
Message-Id: <20190925181056.11097-1-ira.weiny@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Ira Weiny <ira.weiny@intel.com>

Don't leave claim_class set to an invalid value if an error occurs in
btt_claim_class().

While we are here change the return type of __holder_class_store() to be
clear about the values it is returning.

This was found via code inspection.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/nvdimm/namespace_devs.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/nvdimm/namespace_devs.c b/drivers/nvdimm/namespace_devs.c
index 5b22cecefc99..a020c166e1e7 100644
--- a/drivers/nvdimm/namespace_devs.c
+++ b/drivers/nvdimm/namespace_devs.c
@@ -1510,16 +1510,19 @@ static ssize_t holder_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(holder);
 
-static ssize_t __holder_class_store(struct device *dev, const char *buf)
+static int __holder_class_store(struct device *dev, const char *buf)
 {
 	struct nd_namespace_common *ndns = to_ndns(dev);
 
 	if (dev->driver || ndns->claim)
 		return -EBUSY;
 
-	if (sysfs_streq(buf, "btt"))
-		ndns->claim_class = btt_claim_class(dev);
-	else if (sysfs_streq(buf, "pfn"))
+	if (sysfs_streq(buf, "btt")) {
+		int rc = btt_claim_class(dev);
+		if (rc < NVDIMM_CCLASS_NONE)
+			return rc;
+		ndns->claim_class = rc;
+	} else if (sysfs_streq(buf, "pfn"))
 		ndns->claim_class = NVDIMM_CCLASS_PFN;
 	else if (sysfs_streq(buf, "dax"))
 		ndns->claim_class = NVDIMM_CCLASS_DAX;
@@ -1528,10 +1531,6 @@ static ssize_t __holder_class_store(struct device *dev, const char *buf)
 	else
 		return -EINVAL;
 
-	/* btt_claim_class() could've returned an error */
-	if ((int)ndns->claim_class < 0)
-		return ndns->claim_class;
-
 	return 0;
 }
 
@@ -1539,7 +1538,7 @@ static ssize_t holder_class_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t len)
 {
 	struct nd_region *nd_region = to_nd_region(dev->parent);
-	ssize_t rc;
+	int rc;
 
 	nd_device_lock(dev);
 	nvdimm_bus_lock(dev);
@@ -1547,7 +1546,7 @@ static ssize_t holder_class_store(struct device *dev,
 	rc = __holder_class_store(dev, buf);
 	if (rc >= 0)
 		rc = nd_namespace_label_update(nd_region, dev);
-	dev_dbg(dev, "%s(%zd)\n", rc < 0 ? "fail " : "", rc);
+	dev_dbg(dev, "%s(%d)\n", rc < 0 ? "fail " : "", rc);
 	nvdimm_bus_unlock(dev);
 	nd_device_unlock(dev);
 
-- 
2.20.1

