Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 957F1E8B3A
	for <lists+kernel-janitors@lfdr.de>; Tue, 29 Oct 2019 15:52:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389517AbfJ2Ow5 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 29 Oct 2019 10:52:57 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:49268 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389398AbfJ2Ow5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 29 Oct 2019 10:52:57 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9TEnUOG189879;
        Tue, 29 Oct 2019 14:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=dq3CGlQcTpGFGc4AuswtQOGm/7+EEbOrsWvjmPMGFuU=;
 b=XWLQCpPvEumlMmOIQdGz5Re8PxAZDgLzPIreonCdMhgU1S5uBs3lK7FyCh8bs8+PkIO8
 GbjqU+925ALNvtdGF83rocR4Ur4ntFxvNImKENWlCy5IklSwRqi8pzQJ6rh5KlSPt6UU
 GBy4WSvD14N2BNCnuR8jO+EytTLskWt47hQwNcrekCGI3R4WneceU53jEdfgGdibaZpj
 dcgZ4GAaM+I+42XXByShdrgDds2iKe3VxuDLFesFsvj8BU9WZn5r+rDx8jcDOiwIIzWU
 Ld/lGdeakpZ7cd+Xu6pwH7EEK0MBeD/NXmFMXBnKr43jkFk7rzQU+rGxg1LJ21xPm4zY JA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 2vvdju9x3b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Oct 2019 14:52:55 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9TEmUw4165053;
        Tue, 29 Oct 2019 14:52:54 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 2vxpfd4ekq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Oct 2019 14:52:54 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x9TEqriM008799;
        Tue, 29 Oct 2019 14:52:53 GMT
Received: from mwanda (/10.175.172.230)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 29 Oct 2019 07:52:52 -0700
Date:   Tue, 29 Oct 2019 17:52:47 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     ap420073@gmail.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] vxlan: add adjacent link to limit depth level
Message-ID: <20191029145247.GA24739@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9424 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=906
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910290141
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9424 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=992 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910290141
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Taehee Yoo,

This is a semi-automatic email about new static checker warnings.

The patch 0ce1822c2a08: "vxlan: add adjacent link to limit depth
level" from Oct 21, 2019, leads to the following Smatch complaint:

    drivers/net/vxlan.c:4012 vxlan_changelink()
    error: we previously assumed 'lowerdev' could be null (see line 4009)

drivers/net/vxlan.c
  4008		netdev_adjacent_change_commit(dst->remote_dev, lowerdev, dev);
  4009		if (lowerdev && lowerdev != dst->remote_dev)
                    ^^^^^^^^
The patch adds a check for NULL,

  4010			dst->remote_dev = lowerdev;
  4011	
  4012		netdev_update_lockdep_key(lowerdev);
                                          ^^^^^^^^
but it also adds a new unchecked dereference (inside the function).

  4013		vxlan_config_apply(dev, &conf, lowerdev, vxlan->net, true);
  4014		return 0;

regards,
dan carpenter
