Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 270452C5402
	for <lists+kernel-janitors@lfdr.de>; Thu, 26 Nov 2020 13:34:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732157AbgKZMdp (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 26 Nov 2020 07:33:45 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:46364 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbgKZMdp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Nov 2020 07:33:45 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AQCSnII117356;
        Thu, 26 Nov 2020 12:33:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=iisJc/UlMMkhfH3VEvBdqDe9vzLbdRcAzuPohWMvODc=;
 b=ND71QmWEXz2yAyK/c5oCLSgjggzrpqIt9rlgur4arECERhm8uzHfvhWW8aJNsolisVm7
 75ZVnB5SUJUTuYWNeWA4Yz8D8cnVFWIhEQprDw2cKakEx4aeb/B02vRdiZtqJ4H8Nt2k
 KalQoBVDs4HNXWvZB8peyqbeezGvmnGDBzgk5Pi7qqCgho8eH0+2q/S9LQXdBboQ564r
 00k6PpYvEv01YYmT4N52Fhku/mxyRacAFtU8eh2ovpdCOH6xVDuzRxCN/auZ6PWLUns7
 6LviYDzAek/9uLsBAZWDNZmvxKrhq2NoN+I9mSKTq0xY+L/Uxm0iPn75nLhR5ErfOuGN CA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 351kwhnw79-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 26 Nov 2020 12:33:42 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AQCP3l9115753;
        Thu, 26 Nov 2020 12:33:42 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 351kwfv8pv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 26 Nov 2020 12:33:42 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AQCXf19013366;
        Thu, 26 Nov 2020 12:33:41 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 26 Nov 2020 04:33:40 -0800
Date:   Thu, 26 Nov 2020 15:33:34 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     sbhatta@marvell.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] octeontx2-pf: Add support for ethtool ntuple filters
Message-ID: <20201126123334.GA205581@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9816 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 suspectscore=3 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011260075
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9816 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=3
 bulkscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 clxscore=1011
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011260075
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Subbaraya Sundeep,

The patch f0a1913f8a6f: "octeontx2-pf: Add support for ethtool ntuple
filters" from Nov 15, 2020, leads to the following static checker
warning:

	drivers/net/ethernet/marvell/octeontx2/nic/otx2_flows.c:51 otx2_alloc_mcam_entries()
	error: 'rsp' dereferencing possible ERR_PTR()

drivers/net/ethernet/marvell/octeontx2/nic/otx2_flows.c
    22  int otx2_alloc_mcam_entries(struct otx2_nic *pfvf)
    23  {
    24          struct otx2_flow_config *flow_cfg = pfvf->flow_cfg;
    25          struct npc_mcam_alloc_entry_req *req;
    26          struct npc_mcam_alloc_entry_rsp *rsp;
    27          int vf_vlan_max_flows;
    28          int i;
    29  
    30          mutex_lock(&pfvf->mbox.lock);
    31  
    32          req = otx2_mbox_alloc_msg_npc_mcam_alloc_entry(&pfvf->mbox);
    33          if (!req) {
    34                  mutex_unlock(&pfvf->mbox.lock);
    35                  return -ENOMEM;
    36          }
    37  
    38          vf_vlan_max_flows = pfvf->total_vfs * OTX2_PER_VF_VLAN_FLOWS;
    39          req->contig = false;
    40          req->count = OTX2_MCAM_COUNT + vf_vlan_max_flows;
    41  
    42          /* Send message to AF */
    43          if (otx2_sync_mbox_msg(&pfvf->mbox)) {
    44                  mutex_unlock(&pfvf->mbox.lock);
    45                  return -EINVAL;
    46          }
    47  
    48          rsp = (struct npc_mcam_alloc_entry_rsp *)otx2_mbox_get_rsp
    49                 (&pfvf->mbox.mbox, 0, &req->hdr);

The otx2_mbox_get_rsp() function can fail, but this code doesn't check
for errors.

    50  
    51          if (rsp->count != req->count) {
    52                  netdev_info(pfvf->netdev,
    53                              "Unable to allocate %d MCAM entries, got %d\n",
    54                              req->count, rsp->count);
    55                  /* support only ntuples here */
    56                  flow_cfg->ntuple_max_flows = rsp->count;
    57                  flow_cfg->ntuple_offset = 0;

regards,
dan carpenter
