Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE91E39B667
	for <lists+kernel-janitors@lfdr.de>; Fri,  4 Jun 2021 12:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbhFDKDr (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 4 Jun 2021 06:03:47 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:4307 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbhFDKDq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 4 Jun 2021 06:03:46 -0400
Received: from dggeml759-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FxJ8T6Nyrz1BH78;
        Fri,  4 Jun 2021 17:57:13 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 dggeml759-chm.china.huawei.com (10.1.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 4 Jun 2021 18:01:58 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, "J. Bruce Fields" <bfields@fieldses.org>,
        Chuck Lever <chuck.lever@oracle.com>,
        Dai Ngo <dai.ngo@oracle.com>
CC:     <linux-nfs@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next v2] NFSD: Fix error return code in nfsd4_interssc_connect()
Date:   Fri, 4 Jun 2021 10:12:37 +0000
Message-ID: <20210604101237.1661615-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggeml759-chm.china.huawei.com (10.1.199.138)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'status' has been overwritten to 0 after nfsd4_ssc_setup_dul(), this
cause 0 will be return in vfs_kern_mount() error case. Fix to return
nfserr_nodev in this error.

Fixes: f4e44b393389 ("NFSD: delay unmount source's export after inter-server copy completed.")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
v1 -> v2: change to return nfserr_nodev
---
 fs/nfsd/nfs4proc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/nfsd/nfs4proc.c b/fs/nfsd/nfs4proc.c
index 0bd71c6da81d..b082cbde3e07 100644
--- a/fs/nfsd/nfs4proc.c
+++ b/fs/nfsd/nfs4proc.c
@@ -1323,6 +1323,7 @@ nfsd4_interssc_connect(struct nl4_server *nss, struct svc_rqst *rqstp,
 	ss_mnt = vfs_kern_mount(type, SB_KERNMOUNT, dev_name, raw_data);
 	module_put(type->owner);
 	if (IS_ERR(ss_mnt)) {
+		status = nfserr_nodev;
 		if (work)
 			nfsd4_ssc_cancel_dul_work(nn, work);
 		goto out_free_devname;

