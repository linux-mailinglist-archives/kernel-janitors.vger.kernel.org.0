Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 128D7A9DCA
	for <lists+kernel-janitors@lfdr.de>; Thu,  5 Sep 2019 11:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732984AbfIEJI5 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 5 Sep 2019 05:08:57 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:44798 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732160AbfIEJI5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 Sep 2019 05:08:57 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x858xT8D135210;
        Thu, 5 Sep 2019 09:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=jQfEl/8LE0gOlh19fPDoDuzs8v1+Ww9SegV3tteUENU=;
 b=n0yZzW5zCog7wvCpp0jpfPpETVP09D8T9AGoreOxI2X690QIJTYE0BLnmGXm7dsplIIc
 ZK46BijT+03lGv6gjOnsgnCY9ONlO4vXEHTg8g2Nf/cWVTmzIWObq/ZJO+nGbj8jvhoA
 Sibx0P22424K8B0zf+39qcyNn0gKm0y9QwYQ3R8eBdUEMZjG56T+/4kS1s6oUJPFZ8RX
 HHT8Dm4vZEJWJRlx05FA0YlvMvOTE67Jk6nCSCKxcxZEBXmm+BEjKXyZd+SuFRWG4rZL
 HqVtE992qXOjvxLXXKiP2IIDdfUC9B/v+V5SqIW+CXfajJ680binRWyDYZEKsEhLlgxN XA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 2uty3yr67s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 05 Sep 2019 09:08:52 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x858wmTm093098;
        Thu, 5 Sep 2019 09:08:52 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 2usu52v1pg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 05 Sep 2019 09:08:52 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8598oA2021703;
        Thu, 5 Sep 2019 09:08:51 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 05 Sep 2019 02:08:50 -0700
Date:   Thu, 5 Sep 2019 12:08:44 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     maorg@mellanox.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net/mlx5: Add direct rule fs_cmd implementation
Message-ID: <20190905090844.GA16180@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9370 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=930
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909050094
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9370 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=995 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909050094
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Maor Gottlieb,

The patch 6a48faeeca10: "net/mlx5: Add direct rule fs_cmd
implementation" from Aug 20, 2019, leads to the following static
checker warning:

	drivers/net/ethernet/mellanox/mlx5/core/steering/fs_dr.c:52 set_miss_action()
	warn: 'action' was already freed.

drivers/net/ethernet/mellanox/mlx5/core/steering/fs_dr.c
    27  static int set_miss_action(struct mlx5_flow_root_namespace *ns,
    28                             struct mlx5_flow_table *ft,
    29                             struct mlx5_flow_table *next_ft)
    30  {
    31          struct mlx5dr_action *old_miss_action;
    32          struct mlx5dr_action *action = NULL;
    33          struct mlx5dr_table *next_tbl;
    34          int err;
    35  
    36          next_tbl = next_ft ? next_ft->fs_dr_table.dr_table : NULL;
    37          if (next_tbl) {
    38                  action = mlx5dr_action_create_dest_table(next_tbl);
    39                  if (!action)
    40                          return -EINVAL;
    41          }
    42          old_miss_action = ft->fs_dr_table.miss_action;
    43          err = mlx5dr_table_set_miss_action(ft->fs_dr_table.dr_table, action);
    44          if (err && action) {
    45                  err = mlx5dr_action_destroy(action);
                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If err returns -EBUSY then "action" is not freed but if it returns zero
that means it is freed.

    46                  if (err) {
    47                          action = NULL;
    48                          mlx5_core_err(ns->dev, "Failed to destroy action (%d)\n",
    49                                        err);
    50                  }
    51          }
    52          ft->fs_dr_table.miss_action = action;
                                              ^^^^^^
Use after free.

    53          if (old_miss_action) {
    54                  err = mlx5dr_action_destroy(old_miss_action);
    55                  if (err)
    56                          mlx5_core_err(ns->dev, "Failed to destroy action (%d)\n",
    57                                        err);
    58          }
    59  
    60          return err;
    61  }

regards,
dan carpenter
