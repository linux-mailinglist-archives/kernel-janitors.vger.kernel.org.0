Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF52727C118
	for <lists+kernel-janitors@lfdr.de>; Tue, 29 Sep 2020 11:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727982AbgI2J2W (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 29 Sep 2020 05:28:22 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:47580 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727968AbgI2J2W (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 29 Sep 2020 05:28:22 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08T9F5cW153994;
        Tue, 29 Sep 2020 09:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=JSF7eBuDNmalM9i8kEgaRq9QVPBhozedOZPhTA1qRE4=;
 b=VV0FcfN5DvEKR1BjMdVnkXEaySzRVeJ3zzRInUEdhZ7uogARdiOSgyfAdu2S5MEPmQQ9
 vXyOFgc+NnXoScNNHmie2qg485qUIq/KwriVpWt1CCuEkBfZQ3H6Znje2yC6HVz3y0Xg
 NiENHDRgL3hpifdzCal72h/5OjUSrBan1E1Dxu5MKZ47nLIG+WYm0FrV9zCHB3iJM9Sz
 Lq5q2PdaNfzbNiDkSHFJ6utgrKf1bPL8UFhGs+RbmqnfH8kDHBHIpiHZFgzy7lJ/ylZY
 eEbPovN4ILZRfObZxhbWN6DQeO6wuR2H2lR7fm8QqdeSJL09Il8nBxonkoT3VwyQ58W5 KQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 33sx9n1mft-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 29 Sep 2020 09:28:20 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08T9Ojn8145466;
        Tue, 29 Sep 2020 09:28:20 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 33tfdrq5n9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Sep 2020 09:28:20 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08T9SJuo017121;
        Tue, 29 Sep 2020 09:28:19 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 29 Sep 2020 02:28:18 -0700
Date:   Tue, 29 Sep 2020 12:28:08 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     f.fainelli@gmail.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: vlan: Avoid using BUG() in vlan_proto_idx()
Message-ID: <20200929092808.GA485919@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9758 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=674 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxscore=0 bulkscore=0
 suspectscore=3 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009290084
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9758 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=688 suspectscore=3
 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009290083
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Florian Fainelli,

The patch d0186842ec5f: "net: vlan: Avoid using BUG() in
vlan_proto_idx()" from Sep 24, 2020, leads to the following static
checker warning:

	net/8021q/vlan.c:60 vlan_group_prealloc_vid()
	warn: unsigned 'pidx' is never less than zero.

net/8021q/vlan.c
    50  static int vlan_group_prealloc_vid(struct vlan_group *vg,
    51                                     __be16 vlan_proto, u16 vlan_id)
    52  {
    53          struct net_device **array;
    54          unsigned int pidx, vidx;
                ^^^^^^^^^^^^^^^^^^^^^^^^

    55          unsigned int size;
    56  
    57          ASSERT_RTNL();
    58  
    59          pidx  = vlan_proto_idx(vlan_proto);
    60          if (pidx < 0)
                    ^^^^^^^^
This is unsigned.

    61                  return -EINVAL;
    62  
    63          vidx  = vlan_id / VLAN_GROUP_ARRAY_PART_LEN;
    64          array = vg->vlan_devices_arrays[pidx][vidx];
    65          if (array != NULL)
    66                  return 0;

regards,
dan carpenter
