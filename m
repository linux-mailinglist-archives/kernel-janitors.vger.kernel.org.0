Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18FBF17A11F
	for <lists+kernel-janitors@lfdr.de>; Thu,  5 Mar 2020 09:20:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbgCEIUc (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 5 Mar 2020 03:20:32 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:50034 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725880AbgCEIUb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 Mar 2020 03:20:31 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0258Hn7Q028255;
        Thu, 5 Mar 2020 08:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=zSM1m2hfoiBdrwYwI+w883zEuKUgwqHZFNsWloTYYKM=;
 b=GHUQv18ke8uuJ7TiRI7tpx/QrZSGBL/aDVAhbSIT9rzj70gcmqb/+4y0oCmBhTo8OWNr
 CVBh+c6daobZA1qbSIMiEajJuUbmEDltdnuGkcwrPKHAF93CbF0Yf8hn56jQ/30KThNy
 8YkwjWs39+QEr5uj98d1YwXYYRvH81KftDWiFVEmIqSzcWLa6SOXfojRnxI0Whu+tHI/
 TAX6Mk5rFV75dGv4AacJqPoZGXvgFlF+ahH6r2n48iVvtFcZ7SRtwwotKGhQd9LwSPmk
 AshfdtHcPYOW7aVoWoP5OP+Dat5bVQ9aGqNNDn8/t2cCvhT3bVEx3/aYPAp0ggnSiAus dw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2yffcuujgy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 05 Mar 2020 08:20:29 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0258Iatj091009;
        Thu, 5 Mar 2020 08:20:29 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 2yg1p9w6mm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 05 Mar 2020 08:20:28 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0258KR6a005676;
        Thu, 5 Mar 2020 08:20:28 GMT
Received: from kili.mountain (/41.210.146.162)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 05 Mar 2020 00:20:27 -0800
Date:   Thu, 5 Mar 2020 11:20:20 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     gakula@marvell.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] octeontx2-pf: Support to enable/disable pause frames
 via ethtool
Message-ID: <20200305082020.vwfxzxizbfuc5otk@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9550 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=452 mlxscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003050052
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9550 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 bulkscore=0
 adultscore=0 suspectscore=1 spamscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=512 lowpriorityscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003050052
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Geetha sowjanya,

The patch 75f36270990c: "octeontx2-pf: Support to enable/disable
pause frames via ethtool" from Mar 2, 2020, leads to the following
static checker warning:

	drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c:269 otx2_get_pauseparam()
	error: 'rsp' dereferencing possible ERR_PTR()

drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c
   256  static void otx2_get_pauseparam(struct net_device *netdev,
   257                                  struct ethtool_pauseparam *pause)
   258  {
   259          struct otx2_nic *pfvf = netdev_priv(netdev);
   260          struct cgx_pause_frm_cfg *req, *rsp;
   261  
   262          req = otx2_mbox_alloc_msg_cgx_cfg_pause_frm(&pfvf->mbox);
   263          if (!req)
   264                  return;
   265  
   266          if (!otx2_sync_mbox_msg(&pfvf->mbox)) {
   267                  rsp = (struct cgx_pause_frm_cfg *)
   268                         otx2_mbox_get_rsp(&pfvf->mbox.mbox, 0, &req->hdr);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Does this require error handling?  It's not totally clear to me.

   269                  pause->rx_pause = rsp->rx_pause;
   270                  pause->tx_pause = rsp->tx_pause;
   271          }
   272  }

regards,
dan carpenter
