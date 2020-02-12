Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2D7815A206
	for <lists+kernel-janitors@lfdr.de>; Wed, 12 Feb 2020 08:30:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728280AbgBLHaN (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 12 Feb 2020 02:30:13 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:45084 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728192AbgBLHaN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 12 Feb 2020 02:30:13 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01C7Se4i068157;
        Wed, 12 Feb 2020 07:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=naifCetP6ffbXqjQx3Jlfg8KootPixsr7gwA7wWCy/k=;
 b=gJMxZCupBA1ND1EpZQjknPby5UevPppKagfHuw4AsjAQ7XQAOXclGHSvcMiIE8OtmcwQ
 4IZx/hiD0x4y0OCMhriEfXo0qGDst/j5+1R5IjGdHreAMhLkHj+OWU6aSFYE/aYUQngS
 9BPOyqzNZVUCH92yNb9UTMEg/sL5XN/NhvTIpLG0iaV1LycBIpG6M2VhxbOBjPAVOhTz
 vdbekqdLQSKaZTX5qIYtrIRFTNVmsy1sReuYx9wM1Q4X23OcEtA0tpmScdG1ZQkKG/2T
 5KoAOwD9YDtbiCHrPVHNvX1eN8lZnWgG+m1DFJ5uYkHzNni/uuvzEsspr/GGZpjxteE8 Vw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 2y2k888ebw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 12 Feb 2020 07:30:10 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01C7R2eS053134;
        Wed, 12 Feb 2020 07:30:10 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 2y26fjqg2p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 12 Feb 2020 07:30:09 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 01C7U8uA000862;
        Wed, 12 Feb 2020 07:30:08 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 11 Feb 2020 23:30:08 -0800
Date:   Wed, 12 Feb 2020 10:30:00 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     dmitry.bogdanov@aquantia.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: aquantia: add support of rx-vlan-filter offload
Message-ID: <20200212072959.lh76m5rrfa3nbhmd@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9528 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=1
 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0 phishscore=0
 mlxlogscore=736 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002120059
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9528 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 lowpriorityscore=0
 suspectscore=1 bulkscore=0 phishscore=0 mlxlogscore=797 mlxscore=0
 malwarescore=0 impostorscore=0 clxscore=1011 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002120059
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Dmitry Bogdanov,

The patch 7975d2aff5af: "net: aquantia: add support of rx-vlan-filter
offload" from Nov 12, 2018, leads to the following static checker
warning:

	drivers/net/ethernet/aquantia/atlantic/aq_filters.c:166 aq_check_approve_fvlan()
	error: passing untrusted data to 'test_bit()'

drivers/net/ethernet/aquantia/atlantic/aq_filters.c
   151  static int __must_check
   152  aq_check_approve_fvlan(struct aq_nic_s *aq_nic,
   153                         struct aq_hw_rx_fltrs_s *rx_fltrs,
   154                         struct ethtool_rx_flow_spec *fsp)
   155  {
   156          if (fsp->location < AQ_RX_FIRST_LOC_FVLANID ||
   157              fsp->location > AQ_RX_LAST_LOC_FVLANID) {
   158                  netdev_err(aq_nic->ndev,
   159                             "ethtool: location must be in range [%d, %d]",
   160                             AQ_RX_FIRST_LOC_FVLANID,
   161                             AQ_RX_LAST_LOC_FVLANID);
   162                  return -EINVAL;
   163          }
   164  
   165          if ((aq_nic->ndev->features & NETIF_F_HW_VLAN_CTAG_FILTER) &&
   166              (!test_bit(be16_to_cpu(fsp->h_ext.vlan_tci),
                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
If this is more than 4096 then it is a buffer overflow.

   167                         aq_nic->active_vlans))) {
   168                  netdev_err(aq_nic->ndev,
   169                             "ethtool: unknown vlan-id specified");
   170                  return -EINVAL;
   171          }
   172  
   173          if (fsp->ring_cookie > aq_nic->aq_nic_cfg.num_rss_queues) {
   174                  netdev_err(aq_nic->ndev,
   175                             "ethtool: queue number must be in range [0, %d]",
   176                             aq_nic->aq_nic_cfg.num_rss_queues - 1);
   177                  return -EINVAL;
   178          }
   179          return 0;
   180  }

regards,
dan carpenter
