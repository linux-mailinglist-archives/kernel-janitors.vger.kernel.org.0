Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE76D26CC36
	for <lists+kernel-janitors@lfdr.de>; Wed, 16 Sep 2020 22:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728325AbgIPUkx (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 16 Sep 2020 16:40:53 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:40160 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgIPREy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 16 Sep 2020 13:04:54 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08GEOpAt139731;
        Wed, 16 Sep 2020 14:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=EC4RBw5SPP1mjGGCSacauTYYKm/As9RFLG/mVQMqJmw=;
 b=t2eKbk0moKah6SlxOnVXSO94VBYEQsh+gSbCp4ycmi/bmHNNZr9HPRcuEQtoLFkblxdy
 nmSERpf4lTYEb+VfIrFyEc0PFG2Mg3XfzOSDIOVxcpkbLWqUGEZWgCKg3nPYtthCsLbX
 xWBVMr3gXd7b5eMDlmuK7xCSaEk5qScdDDnjNAFcwVIQIEccepo58GATqMfDrFK2tNVP
 fcbjzPNniKUP4yuRzdU2A+KmchYMsff9MLZhd0LhcOiJONneS5B5nQ3azY4lhW3eQY9l
 wJ08IL2G29VdP8zlM8LGZnftlNeOJ1Kd6RGW3qW7F1CE90xfCtWiqsu1gXViCFF0eMx2 Lg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 33gp9mbeeu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 16 Sep 2020 14:32:37 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08GEUmrx089991;
        Wed, 16 Sep 2020 14:32:36 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 33h891rd0p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 16 Sep 2020 14:32:36 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08GEWZNf016314;
        Wed, 16 Sep 2020 14:32:35 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 16 Sep 2020 14:32:34 +0000
Date:   Wed, 16 Sep 2020 17:32:28 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Cc:     =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        intel-wired-lan@lists.osuosl.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] i40e, xsk: uninitialized variable in i40e_clean_rx_irq_zc()
Message-ID: <20200916143228.GA764370@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9746 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009160110
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9746 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009160109
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "failure" variable is used without being initialized.  It should be
set to false.

Fixes: 8cbf74149903 ("i40e, xsk: move buffer allocation out of the Rx processing loop")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/intel/i40e/i40e_xsk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/i40e/i40e_xsk.c b/drivers/net/ethernet/intel/i40e/i40e_xsk.c
index 6acede0acdca..567fd67e900e 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_xsk.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_xsk.c
@@ -281,8 +281,8 @@ int i40e_clean_rx_irq_zc(struct i40e_ring *rx_ring, int budget)
 	unsigned int total_rx_bytes = 0, total_rx_packets = 0;
 	u16 cleaned_count = I40E_DESC_UNUSED(rx_ring);
 	unsigned int xdp_res, xdp_xmit = 0;
+	bool failure = false;
 	struct sk_buff *skb;
-	bool failure;
 
 	while (likely(total_rx_packets < (unsigned int)budget)) {
 		union i40e_rx_desc *rx_desc;
-- 
2.28.0

